#!/usr/bin/env python3
# Clash-free starting-pose generator for the corrected CMT pockets (no Vina/smina on
# summer's fep env, so this is the OpenMM-based stand-in for docking — breakthrough path
# (c) "softer start" from RESULT.md, turned into a reusable pose tool).
#
# Method: embed the scaffold ligand (RDKit conformer) -> translate its centroid onto the
# experimental pocket center -> build {receptor(rigid, position-restrained) + ligand(free)}
# in vacuum with the SAME OpenFF/ff14SB forcefield the ABFE deck uses -> minimize so the
# ligand slides off any hard clashes into a local pocket pose -> write lig_<RESN>_bound.sdf
# IN THE RECEPTOR FRAME (the ABFE deck auto-prefers *_bound.sdf, no recenter).
#
#   usage: relax_pose.py <TARGET> <pockets_file>
import os, sys, json
import numpy as np
from rdkit import Chem
from openmm import unit, app
import openmm as mm
from openff.toolkit import Molecule
from openff.toolkit.utils.nagl_wrapper import NAGLToolkitWrapper
from openmmforcefields.generators import SystemGenerator
from pdbfixer import PDBFixer

HERE = os.path.dirname(os.path.abspath(__file__))
DECKDIR = os.path.dirname(HERE)  # exports/CMT (repo layout); on summer the dir is flat

def _find(name):
    """Resolve a data file whether the layout is flat (summer ~/cmt-abfe) or the repo
    repocket/ subdir (lig SDFs + deck live one level up)."""
    for d in (HERE, DECKDIR, os.getcwd()):
        p = os.path.join(d, name)
        if os.path.exists(p):
            return p
    return os.path.join(HERE, name)

TARGET = sys.argv[1]
POCKETS = sys.argv[2] if len(sys.argv) > 2 else "pockets_repocket.json"
T = json.load(open(_find(POCKETS)))[TARGET]
REC = _find(f"{T['pdb']}.pdb")
LIG_SDF = _find(f"lig_{T['lig']}.sdf")
OUT = os.path.join(os.path.dirname(REC), f"lig_{T['lig']}_bound.sdf")
POCKET = np.array(T["center"])  # Angstrom

print(f"=== relax_pose {TARGET}: rec={T['pdb']} lig={T['lig']} pocket={POCKET} ===",
      flush=True)

# 1) ligand prep (charges via NAGL, like the deck)
lig = Molecule.from_file(LIG_SDF)
NAGLToolkitWrapper().assign_partial_charges(
    lig, partial_charge_method="openff-gnn-am1bcc-1.0.0.pt")
lig_pos = np.array(lig.conformers[0].to_openmm().value_in_unit(unit.angstrom))
# place ligand centroid at pocket center (receptor frame)
lig_pos = lig_pos - lig_pos.mean(axis=0) + POCKET

# 2) receptor prep (PDBFixer, same as deck build_complex; no solvent — vacuum relax)
fixer = PDBFixer(filename=REC)
fixer.findMissingResidues(); fixer.missingResidues = {}
fixer.findNonstandardResidues(); fixer.replaceNonstandardResidues()
fixer.removeHeterogens(keepWater=False)
fixer.findMissingAtoms(); fixer.addMissingAtoms(); fixer.addMissingHydrogens(7.0)
modeller = app.Modeller(fixer.topology, fixer.positions)
n_rec = modeller.topology.getNumAtoms()

lig_top = lig.to_topology().to_openmm()
modeller.add(lig_top, lig_pos * unit.angstrom)
lig_n = lig_top.getNumAtoms()
lig_atoms = list(range(n_rec, n_rec + lig_n))

sysgen = SystemGenerator(
    forcefields=["amber/protein.ff14SB.xml"],
    small_molecule_forcefield="openff-2.1.0",
    molecules=[lig],
    forcefield_kwargs={"constraints": None, "rigidWater": False})
system = sysgen.create_system(modeller.topology)

# 3) position-restrain ALL receptor heavy atoms (rigid pocket), ligand free
restr = mm.CustomExternalForce("0.5*k*((x-x0)^2+(y-y0)^2+(z-z0)^2)")
restr.addGlobalParameter("k", 1000.0 * unit.kilojoule_per_mole / unit.nanometer**2)
for p in ("x0", "y0", "z0"):
    restr.addPerParticleParameter(p)
pos_nm = np.array(modeller.positions.value_in_unit(unit.nanometer))
ratoms = [a for a in modeller.topology.atoms() if a.index < n_rec and a.element is not None
          and a.element.symbol != "H"]
for a in ratoms:
    restr.addParticle(a.index, pos_nm[a.index].tolist())
system.addForce(restr)

integ = mm.LangevinMiddleIntegrator(300 * unit.kelvin, 1.0 / unit.picosecond,
                                    1.0 * unit.femtoseconds)
ctx = mm.Context(system, integ, mm.Platform.getPlatformByName("CPU"))
ctx.setPositions(modeller.positions)
e0 = ctx.getState(getEnergy=True).getPotentialEnergy().value_in_unit(
    unit.kilojoule_per_mole)
print(f"  E(initial) = {e0:.1f} kJ/mol", flush=True)
mm.LocalEnergyMinimizer.minimize(ctx, maxIterations=5000)
st = ctx.getState(getPositions=True, getEnergy=True)
e1 = st.getPotentialEnergy().value_in_unit(unit.kilojoule_per_mole)
print(f"  E(minimized) = {e1:.1f} kJ/mol", flush=True)

# 4) extract relaxed ligand coords -> write bound SDF (receptor frame, Angstrom)
allpos = np.array(st.getPositions().value_in_unit(unit.angstrom))
lig_relaxed = allpos[lig_atoms]

# build an RDKit mol from the ligand SDF and overwrite conformer with relaxed coords
rdlig = Chem.MolFromMolFile(LIG_SDF, removeHs=False)
if rdlig.GetNumAtoms() != lig_n:
    # openff may have reordered; re-derive via the openff->rdkit roundtrip
    rdlig = lig.to_rdkit()
conf = rdlig.GetConformer()
for i in range(rdlig.GetNumAtoms()):
    conf.SetAtomPosition(i, Chem.rdGeometry.Point3D(*[float(x) for x in lig_relaxed[i]]))
rdlig.SetProp("_Name", f"CMT_{T['lig']}_bound")
w = Chem.SDWriter(OUT); w.write(rdlig); w.close()

# 5) min lig-receptor heavy-atom contact sanity
rec_heavy = allpos[[a.index for a in ratoms]]
dmin = min(np.linalg.norm(lp - rp) for lp in lig_relaxed for rp in rec_heavy)
print(f"  min lig<->receptor heavy-atom dist = {dmin:.2f} A "
      f"({'CLASH-FREE' if dmin > 1.8 else 'STILL CLASHED'})", flush=True)
print(f"BOUND_OK {OUT} natoms={lig_n} Emin={e1:.0f}kJ/mol mindist={dmin:.2f}A", flush=True)
