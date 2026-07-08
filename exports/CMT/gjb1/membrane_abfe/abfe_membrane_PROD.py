#!/usr/bin/env python3
# GJB1/Cx32 L143P  MEMBRANE  ABFE  (POPC bilayer) — adapted from exports/CMT/abfe_cmt.py
#
# WHY a membrane: Cx32 is a 4-TM membrane protein; the L143P TM1/TM4 cryptic pocket is
# lipid-adjacent. The soluble (TIP3P-only) ClC-1 lane hit eq-NaN because the TM helices,
# stripped of lipid, collapse / clash around the buried ligand. Embedding the TM domain in
# an explicit POPC bilayer (OpenMM Modeller.addMembrane) gives a clash-free, physically
# correct TM pose so the alchemical minimize starts stable.
#
# Engine identity to abfe_cmt.py: double-decoupling ABFE, dense 20-window λ-schedule,
# HMR 4 fs, flat-bottom centroid restraint + analytical standard-state correction, MBAR,
# resumable per-rep .nc, distinct deterministic per-(lig,leg,rep) seeds. Only the COMPLEX
# builder differs (membrane instead of bulk water); the SOLVENT (ligand-in-water) leg is
# identical (ligand transfer FE is bath-independent for the decoupling cycle).
#
# ENV:
#   LIG       = naphthoate | pba   (selects pose SDF + pocket + labels)
#   REP       = replica index (default 0)        SMOKE = "1" for the pipeline-validation run
#   PLATFORM  = CUDA (default) | CPU             POCKET_CENTER overridable via pockets file
import os, sys, time, faulthandler, hashlib, json, copy
faulthandler.enable()
os.environ.setdefault("JAX_PLATFORMS", "cpu")
os.environ.setdefault("JAX_PLATFORM_NAME", "cpu")
os.environ.setdefault("CUDA_VISIBLE_DEVICES", "0")
import numpy as np
from openmm import unit, app, MonteCarloBarostat, MonteCarloMembraneBarostat
import openmm as mm
from openff.toolkit import Molecule
from openff.toolkit.utils.nagl_wrapper import NAGLToolkitWrapper
from openmmforcefields.generators import SystemGenerator
from pdbfixer import PDBFixer
from openmmtools import alchemy, states, mcmc, multistate
from openmmtools.states import (ThermodynamicState, SamplerState,
                                CompoundThermodynamicState)

HERE = os.path.dirname(os.path.abspath(__file__))
SMOKE = os.environ.get("SMOKE", "0") == "1"
LIG = os.environ.get("LIG", "naphthoate")            # naphthoate | pba
REP = int(os.environ.get("REP", "0"))
T = 298.15 * unit.kelvin
P = 1.0 * unit.atmosphere
_PLATFORM = os.environ.get("PLATFORM", "CUDA")
PLATFORM = mm.Platform.getPlatformByName(_PLATFORM)
PLATFORM_PROPS = {"Precision": "mixed"} if _PLATFORM == "CUDA" else {}

# ---- target definition (L143P mutant monomer + TM1/TM4 cryptic pocket) -------
REC_PDB = os.path.join(HERE, "receptor_L143P.pdb")   # transferred from ddg/mut_L143P.pdb (cleaned)
LIG_SDF = os.path.join(HERE, f"lig_{LIG}_bound.sdf")  # clash-free docked pose (extract_bound_pose.py)
# L143P P2 cryptic-pocket centroid (RESULT.md §3) — Angstrom
POCKET = np.array([129.36, 157.79, 171.44])


def rep_seed(leg):
    h = hashlib.sha256(f"gjb1-mem|{LIG}|{leg}|{REP}".encode()).hexdigest()
    return (int(h[:8], 16) % (2**31 - 2)) + 1


# ---- protocol resolution -----------------------------------------------------
if SMOKE:
    ELEC = [1.0, 0.5, 0.0, 0.0, 0.0]
    STER = [1.0, 1.0, 1.0, 0.5, 0.0]
    N_ITER, N_STEPS = 30, 100
else:
    # electrostatics OFF FIRST (windows 0-8, sterics fully ON), THEN sterics decoupled
    # (windows 8-25). STAB-FIX (2026-06-22): the near-coupled sterics window (1.0->0.7) is
    # where dU/dlambda is steepest (full LJ + softcore just turning on) and where the iter8
    # NaN occurred -> DENSIFY the 1.00..0.60 sterics region (steps of ~0.05) so dU/dlambda
    # per window stays small; coarser past 0.6 where softcore has smoothed the singularity.
    ELEC = [1.000, 0.875, 0.750, 0.625, 0.500, 0.375, 0.250, 0.125, 0.000,
            0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000,
            0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000]
    STER = [1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000,
            0.950, 0.900, 0.850, 0.800, 0.750, 0.700, 0.650, 0.600,
            0.500, 0.400, 0.300, 0.225, 0.150, 0.090, 0.040, 0.000]
    N_ITER, N_STEPS = 1000, 1000
N_STATES = len(ELEC)
assert len(STER) == N_STATES


def prep_ligand():
    lig = Molecule.from_file(LIG_SDF)
    NAGLToolkitWrapper().assign_partial_charges(
        lig, partial_charge_method="openff-gnn-am1bcc-1.0.0.pt")
    return lig


def make_system_generator(lig):
    # OpenFF small molecule + Amber TIP3P water — this SystemGenerator parametrizes ONLY the
    # ligand (in the merge path) and the ligand-in-water solvent leg. It is deliberately
    # CHARMM-FREE.
    #
    # DECK-GUARD (2026-06-22, aiden membrane build wall): the membrane build needs CHARMM36
    # (addMembrane's POPC is a single CHARMM-named residue; Amber lipid21 uses split PC/PA/OL
    # residues and CANNOT match it -> "No template found for residue POP"). But CHARMM36
    # (1-4 scale 1.0) and OpenFF (0.833) CANNOT coexist in ONE ForceField.createSystem
    # -> "multiple NonbondedForce tags with different 1-4 scales" — even for a ligand-only
    # createSystem if the SystemGenerator was built with charmm36 in its forcefields list.
    # FIX: the environment (protein+POPC+water+ions) is built separately on a CLEAN charmm36
    # ForceField (build_complex), and THIS SystemGenerator carries NO charmm36 — only OpenFF
    # + Amber TIP3P (both 1-4=0.833, mutually compatible) for the ligand and the solvent leg.
    print(f"[ff] OpenFF(ligand) + Amber TIP3P(solvent); membrane=charmm36 (separate)",
          flush=True)
    return SystemGenerator(
        forcefields=["amber/tip3p_standard.xml"],
        small_molecule_forcefield="openff-2.1.0",
        molecules=[lig],
        forcefield_kwargs={"constraints": app.HBonds, "rigidWater": True,
                           "hydrogenMass": 3.0 * unit.amu},
        periodic_forcefield_kwargs={"nonbondedMethod": app.PME,
                                    "nonbondedCutoff": 1.0 * unit.nanometer}), "charmm36.xml"


def _charmm_resnames(modeller):
    # DECK-GUARD: PDBFixer emits PDB/Amber residue names (HIS, terminal NH3+/COO- implied),
    # but CHARMM36 templates key on protonation-specific HISTIDINE names (HSD default neutral
    # Nd-H). Rename HIS -> HSD so the CHARMM36 protein template matches. (HSE/HSP are the
    # Ne-H / doubly-protonated variants; HSD is the standard physiological default.)
    for res in modeller.topology.residues():
        if res.name in ("HIS", "HID"):
            res.name = "HSD"
        elif res.name == "HIE":
            res.name = "HSE"
        elif res.name == "HIP":
            res.name = "HSP"
    return modeller


def _prep_receptor():
    fixer = PDBFixer(filename=REC_PDB)
    fixer.findMissingResidues(); fixer.missingResidues = {}
    fixer.findNonstandardResidues(); fixer.replaceNonstandardResidues()
    fixer.removeHeterogens(keepWater=False)
    fixer.findMissingAtoms(); fixer.addMissingAtoms(); fixer.addMissingHydrogens(7.0)
    return _charmm_resnames(app.Modeller(fixer.topology, fixer.positions))


def _split_topology(modeller, lig_atoms):
    """Return (env_topology, env_positions, lig_topology, lig_positions). The ligand atoms
    (last residue) are split out so the environment can be built on CHARMM36 and the ligand
    on OpenFF (incompatible 1-4 scales -> cannot share one ForceField)."""
    full_top = modeller.topology
    full_pos = np.array(modeller.positions.value_in_unit(unit.nanometer))
    lig_set = set(lig_atoms)
    env_top = app.Topology()
    env_top.setPeriodicBoxVectors(full_top.getPeriodicBoxVectors())
    lig_top = app.Topology()
    env_map, lig_map = {}, {}
    env_pos, lig_pos = [], []
    for chain in full_top.chains():
        e_chain = l_chain = None
        for res in chain.residues():
            res_is_lig = any(a.index in lig_set for a in res.atoms())
            tgt_top, tgt_map, tgt_pos = ((lig_top, lig_map, lig_pos) if res_is_lig
                                         else (env_top, env_map, env_pos))
            if res_is_lig:
                if l_chain is None:
                    l_chain = tgt_top.addChain()
                tchain = l_chain
            else:
                if e_chain is None:
                    e_chain = tgt_top.addChain()
                tchain = e_chain
            n_res = tgt_top.addResidue(res.name, tchain)
            for a in res.atoms():
                na = tgt_top.addAtom(a.name, a.element, n_res)
                tgt_map[a.index] = na.index
                tgt_pos.append(full_pos[a.index])
    for bond in full_top.bonds():
        i, j = bond[0].index, bond[1].index
        if i in env_map and j in env_map:
            pass  # env bonds rebuilt by ForceField templates; topology bonds optional
    # rebuild bonds explicitly (needed for template matching of env, and ligand graph)
    _rebuild_bonds(full_top, env_top, env_map)
    _rebuild_bonds(full_top, lig_top, lig_map)
    return (env_top, np.array(env_pos) * unit.nanometer,
            lig_top, np.array(lig_pos) * unit.nanometer)


def _rebuild_bonds(src_top, dst_top, idx_map):
    dst_atoms = list(dst_top.atoms())
    for bond in src_top.bonds():
        i, j = bond[0].index, bond[1].index
        if i in idx_map and j in idx_map:
            dst_top.addBond(dst_atoms[idx_map[i]], dst_atoms[idx_map[j]])


def _merge_ligand_system(env_system, lig_system, lig_n):
    """Append the ligand (lig_n particles) from lig_system onto env_system, shifting all
    ligand atom indices by the env particle count. Copies HarmonicBond/Angle/Periodic-
    Torsion + the ligand's NonbondedForce params (intra-ligand exceptions preserved; ligand
    nonbonded params added to the env NonbondedForce so PME sees them). No ligand<->env
    nonbonded exceptions are added (default combining rules apply — correct for ABFE)."""
    off = env_system.getNumParticles()
    for k in range(lig_n):
        env_system.addParticle(lig_system.getParticleMass(k))

    def env_force(cls):
        for f in (env_system.getForce(i) for i in range(env_system.getNumForces())):
            if isinstance(f, cls):
                return f
        return None

    env_nb = env_force(mm.NonbondedForce)

    # DECK-GUARD (2026-06-22): CHARMM36-via-OpenMM splits nonbonded into a standard
    # NonbondedForce that carries ONLY charges (sigma=1,eps=0) and a CustomNonbondedForce that
    # carries ALL Lennard-Jones via tabulated acoef/bcoef(type1,type2) (per-particle param =
    # integer "type"). An OpenFF ligand uses real sigma/eps in the STANDARD NonbondedForce, so
    # the two LJ schemes are incompatible: ligand<->protein LJ would vanish (protein eps=0 in
    # std NB; ligand absent from the acoef table). FIX: fold CHARMM's diagonal table LJ back
    # into the standard NonbondedForce as sigma/eps (acoef=4*eps*sig^12, bcoef=4*eps*sig^6 ->
    # sig=(a/b)^(1/6), eps=b^2/(4a)), copy the Custom exclusions as std-NB (q,0,0) exceptions,
    # then REMOVE the CustomNonbondedForce. Now one std NonbondedForce holds q + LJ for protein,
    # lipids, water, ions AND the OpenFF ligand, with correct Lorentz-Berthelot cross-LJ.
    cnb = env_force(mm.CustomNonbondedForce)
    if cnb is not None and "acoef" in cnb.getEnergyFunction():
        # recover per-type (sigma,eps) from the tabulated diagonal a(t,t), b(t,t)
        acoef = cnb.getTabulatedFunction(0)
        bcoef = cnb.getTabulatedFunction(1)
        ax, ay, avals = acoef.getFunctionParameters()
        bx, by, bvals = bcoef.getFunctionParameters()
        ntypes = ax
        def diag(vals, n, t):
            return vals[t * n + t]
        type_lj = {}
        for t in range(ntypes):
            a = diag(avals, ntypes, t); b = diag(bvals, ntypes, t)
            if a > 0 and b > 0:
                sig = (a / b) ** (1.0 / 6.0)
                eps = b * b / (4.0 * a)
            else:
                sig, eps = 1.0, 0.0
            type_lj[t] = (sig, eps)
        # write LJ into the standard NB for each env particle (keep its existing charge)
        for p in range(cnb.getNumParticles()):
            (t,) = cnb.getParticleParameters(p)
            sig, eps = type_lj[int(t)]
            q, _s, _e = env_nb.getParticleParameters(p)
            env_nb.setParticleParameters(p, q, sig * unit.nanometer,
                                         eps * unit.kilojoule_per_mole)
        # carry the Custom exclusions over as std-NB exceptions (LJ+coulomb fully excluded;
        # 1-4 scaled terms already live in env_nb's own exceptions, so only add MISSING pairs)
        existing = set()
        for e in range(env_nb.getNumExceptions()):
            a1, a2, _q, _s, _e = env_nb.getExceptionParameters(e)
            existing.add((min(a1, a2), max(a1, a2)))
        for e in range(cnb.getNumExclusions()):
            a1, a2 = cnb.getExclusionParticles(e)
            key = (min(a1, a2), max(a1, a2))
            if key not in existing:
                env_nb.addException(a1, a2, 0.0, 1.0, 0.0)
                existing.add(key)
        # remove the now-redundant CustomNonbondedForce. NOTE: SWIG returns a fresh Python
        # wrapper each getForce() call, so `is`-identity is unreliable -> match by TYPE +
        # energy-function string instead, and removeForce by index.
        for i in range(env_system.getNumForces()):
            fi = env_system.getForce(i)
            if isinstance(fi, mm.CustomNonbondedForce) and "acoef" in fi.getEnergyFunction():
                env_system.removeForce(i)
                break
        print(f"[merge] folded CHARMM table-LJ into std NonbondedForce "
              f"({ntypes} atom types)", flush=True)

    for f in (lig_system.getForce(i) for i in range(lig_system.getNumForces())):
        if isinstance(f, mm.HarmonicBondForce):
            ef = env_force(mm.HarmonicBondForce)
            for b in range(f.getNumBonds()):
                a1, a2, r, k = f.getBondParameters(b)
                ef.addBond(a1 + off, a2 + off, r, k)
        elif isinstance(f, mm.HarmonicAngleForce):
            ef = env_force(mm.HarmonicAngleForce)
            for b in range(f.getNumAngles()):
                a1, a2, a3, ang, k = f.getAngleParameters(b)
                ef.addAngle(a1 + off, a2 + off, a3 + off, ang, k)
        elif isinstance(f, mm.PeriodicTorsionForce):
            ef = env_force(mm.PeriodicTorsionForce)
            for b in range(f.getNumTorsions()):
                a1, a2, a3, a4, per, ph, k = f.getTorsionParameters(b)
                ef.addTorsion(a1 + off, a2 + off, a3 + off, a4 + off, per, ph, k)
        elif isinstance(f, mm.NonbondedForce):
            for p in range(f.getNumParticles()):
                q, sig, eps = f.getParticleParameters(p)
                env_nb.addParticle(q, sig, eps)
            for e in range(f.getNumExceptions()):
                a1, a2, q, sig, eps = f.getExceptionParameters(e)
                env_nb.addException(a1 + off, a2 + off, q, sig, eps)
    return env_system


def build_complex(lig, sysgen):
    """L143P monomer + docked ligand, embedded in an explicit POPC bilayer + water + ions."""
    modeller = _prep_receptor()

    # DECK-GUARD (2026-06-22): addMembrane internally calls forcefield.createSystem on the
    # WHOLE modeller topology. Two failures must be avoided here:
    #   (1) if the ligand is already in the modeller, createSystem needs a ligand template
    #       -> pass the OpenFF SystemGenerator FF; but that FF also carries an OpenFF ffxml
    #       whose NonbondedForce 1-4 scale (0.833) conflicts with CHARMM36's (1.0)
    #       -> "multiple NonbondedForce tags with different 1-4 scales".
    # FIX: build the membrane around the PROTEIN ONLY using a CLEAN charmm36 ForceField (no
    # OpenFF generator, no 1-4 clash, no ligand template needed). THEN re-insert the docked
    # ligand and build the real System with the OpenFF-aware SystemGenerator.
    clean_ff = app.ForceField("charmm36.xml", "charmm36/water.xml")

    # DECK-GUARD (2026-06-22): addMembrane places the bilayer at membraneCenterZ=0 and packs
    # lipids around the protein's TM span ASSUMING the protein is centered on the origin with
    # its membrane normal along z. The cryo-EM/EvoEF monomer here sits at center ~[13.8,14.8,
    # 16.1] nm (z-span 7.6 nm = the 4-TM bundle long axis). Left un-centered, addMembrane lays
    # the bilayer ~16 nm away from the protein -> lipids pack into empty space / overlap ->
    # internal-MD "Particle coordinate is NaN". FIX: translate the protein centroid to the
    # origin (and keep the ligand pose in the same frame) so the TM span straddles z=0.
    # DECK-GUARD (2026-06-22): addMembrane lays the bilayer in xy and assumes the TM bundle's
    # long axis IS the z (membrane-normal) axis. A tilted 4-TM bundle makes lipids clash the
    # protein during addMembrane's internal MD -> NaN that later poisons addSolvent's cell
    # list ("cannot convert float NaN to integer"). FIX: PCA-align the protein so its principal
    # (longest) axis -> z, THEN center on the origin. The docked ligand pose is carried through
    # the SAME rigid transform (rotation R about centroid, then translate) so it stays in pocket.
    _ppos = np.array(modeller.positions.value_in_unit(unit.nanometer))
    _shift0 = _ppos.mean(axis=0)
    _centered = _ppos - _shift0
    _cov = np.cov(_centered.T)
    _evals, _evecs = np.linalg.eigh(_cov)            # ascending eigenvalues
    R = _evecs[:, ::-1]                               # cols = principal axes, largest first
    if np.linalg.det(R) < 0:                          # keep a proper rotation
        R[:, 0] = -R[:, 0]
    # map principal axis (col 0, largest variance) -> z: rotate so axis order = (x,y,z) with
    # the LONGEST variance on z. Reorder columns to (mid, small, large) -> (x,y,z).
    R = R[:, [1, 2, 0]]
    _rot = _centered @ R                              # rows rotated into principal frame
    modeller.positions = _rot * unit.nanometer
    _lig_frame_shift = _shift0                        # subtract centroid from ligand first ...
    _lig_frame_rot = R                                # ... then rotate by R (applied in insert)
    print(f"[build] PCA-aligned long axis->z + centered (shift {_shift0} nm); "
          f"z-span now {(_rot[:,2].max()-_rot[:,2].min()):.2f} nm", flush=True)

    # DECK-GUARD (2026-06-22): addMembrane runs an internal minimize + 20-step MD that throws
    # "Particle coordinate is NaN" when the input protein has steric strain (the EvoEF L143P
    # mutant build + PDBFixer H placement leave clashes). Pre-minimize the bare protein with
    # the CHARMM36 FF (no cutoff, vacuum) so addMembrane starts from a relaxed, clash-free
    # geometry. This is the membrane analogue of the soluble-deck pre-min that fixed eq-NaN.
    # DECK-GUARD (2026-06-22): addMembrane's INTERNAL relax is weak (LocalEnergyMinimizer
    # tol=10 kJ, only 30 iters, then 20-step MD at T=10K dt=1fs while it grows the scaled-down
    # protein back into the lipid cavity). Any residual hot contact in the EvoEF-mutant +
    # PDBFixer-H protein makes that internal MD blow up -> "Particle coordinate is NaN". FIX:
    # hand addMembrane a THOROUGHLY relaxed protein — deep minimize THEN a short low-T NVT
    # equilibration (GPU) to drain hot contacts, so addMembrane's weak internal relax suffices.
    print("[build] pre-minimizing + short NVT equilibrating bare protein ...", flush=True)
    pre_sys = clean_ff.createSystem(modeller.topology,
                                    nonbondedMethod=app.NoCutoff,
                                    constraints=app.HBonds, hydrogenMass=3.0 * unit.amu)
    pre_int = mm.LangevinMiddleIntegrator(T, 1.0 / unit.picosecond,
                                          2.0 * unit.femtoseconds)
    try:
        pre_plat = mm.Platform.getPlatformByName("CUDA"); pre_props = {"Precision": "mixed"}
    except Exception:
        pre_plat = mm.Platform.getPlatformByName("CPU"); pre_props = {}
    pre_ctx = mm.Context(pre_sys, pre_int, pre_plat, pre_props)
    pre_ctx.setPositions(modeller.positions)
    mm.LocalEnergyMinimizer.minimize(pre_ctx, maxIterations=10000)
    pre_ctx.setVelocitiesToTemperature(T, 12345)
    pre_int.step(10000)                              # 20 ps NVT to drain hot contacts
    mm.LocalEnergyMinimizer.minimize(pre_ctx, maxIterations=2000)
    modeller.positions = pre_ctx.getState(getPositions=True).getPositions()
    del pre_ctx, pre_int, pre_sys
    print("[build] pre-min + NVT done", flush=True)

    # DECK-GUARD (2026-06-22): addMembrane's internal relax (weak 30-iter minimize + 20-step
    # growback MD + extra-water cell list) is BORDERLINE-stable for this protein footprint and
    # NaNs non-deterministically (the bare-protein relax seed shifts geometry just enough to
    # tip it over; padding 1.0=always-NaN, 1.5=usually-OK). Robust fix = RETRY on a freshly
    # relaxed protein copy with escalating padding until it succeeds (verified addMembrane CAN
    # build this system, 45434 atoms). Each attempt re-relaxes from the same minimized start
    # with a different velocity seed so a bad lipid singularity is reshuffled.
    relaxed_min = modeller.positions
    membrane_ok = False
    # DECK-GUARD (2026-06-22, aiden): cap minimumPadding LOW. A large pad on the PCA-aligned
    # 4-TM bundle balloons the water box to ~199k atoms, and a 20-window ReplicaExchange on
    # that many atoms OOM-kills the run (exit 137) on aiden's 30 GB RAM. 1.0-1.4 nm pad gives
    # ~40-45k atoms (verified) — ample solvent for PME + the flat-bottom restraint, and the
    # 20-state REMD then fits comfortably in RAM. Keep pads tight even on retries.
    for attempt, pad in enumerate([1.0, 1.2, 1.0, 1.4, 1.2]):
        seed = 9000 + attempt
        m_try = app.Modeller(modeller.topology, relaxed_min)
        if attempt > 0:                              # jitter via a fresh short NVT each retry
            js = clean_ff.createSystem(m_try.topology, nonbondedMethod=app.NoCutoff,
                                       constraints=app.HBonds, hydrogenMass=3.0 * unit.amu)
            ji = mm.LangevinMiddleIntegrator(T, 1.0 / unit.picosecond, 2.0 * unit.femtoseconds)
            try:
                jp = mm.Platform.getPlatformByName("CUDA"); jpr = {"Precision": "mixed"}
            except Exception:
                jp = mm.Platform.getPlatformByName("CPU"); jpr = {}
            jc = mm.Context(js, ji, jp, jpr); jc.setPositions(relaxed_min)
            jc.setVelocitiesToTemperature(T, seed); ji.step(5000)
            mm.LocalEnergyMinimizer.minimize(jc, maxIterations=2000)
            m_try.positions = jc.getState(getPositions=True).getPositions()
            del jc, ji, js
        try:
            print(f"[build] addMembrane(POPC) attempt {attempt} pad={pad} ...", flush=True)
            m_try.addMembrane(clean_ff, lipidType="POPC",
                              membraneCenterZ=0 * unit.nanometer,
                              minimumPadding=pad * unit.nanometer,
                              neutralize=True, ionicStrength=0.15 * unit.molar)
            modeller = m_try
            membrane_ok = True
            break
        except (ValueError, Exception) as e:
            print(f"[build] attempt {attempt} failed ({type(e).__name__}: "
                  f"{str(e)[:60]}); retrying", flush=True)
    if not membrane_ok:
        raise RuntimeError("addMembrane failed after all retries")
    print(f"[build] membrane (protein+POPC+water+ions): "
          f"{modeller.topology.getNumAtoms()} atoms", flush=True)

    # docked (bound) pose: ligand coords already in the receptor frame, inside the TM1/TM4
    # pocket — keep as-is (clash-free). No centroid re-overlay (that is the clash route).
    # Insert AFTER the membrane build so addMembrane never needs a ligand template.
    lig_pos = np.array(lig.conformers[0].to_openmm().value_in_unit(unit.nanometer))
    # same rigid transform as the protein: subtract centroid, then PCA rotation R
    lig_pos = (lig_pos - _lig_frame_shift) @ _lig_frame_rot
    lig_top = lig.to_topology().to_openmm()
    modeller.add(lig_top, lig_pos * unit.nanometer)
    n_after_lig = modeller.topology.getNumAtoms()
    lig_n = lig_top.getNumAtoms()
    lig_atoms = list(range(n_after_lig - lig_n, n_after_lig))
    print(f"[build] + docked ligand -> {modeller.topology.getNumAtoms()} atoms, "
          f"lig {lig_n} atoms", flush=True)

    # DECK-GUARD (2026-06-22): CHARMM36 (1-4 scale 1.0) and OpenFF (0.833) CANNOT coexist in
    # one ForceField.createSystem -> "multiple NonbondedForce tags with different 1-4 scales".
    # So we build TWO systems and MERGE: the environment (protein+POPC+water+ions) on CHARMM36,
    # the ligand alone on OpenFF, then splice the ligand's particles + bonded/nonbonded params
    # into the environment system. The ligand is the LAST residue (highest indices), which
    # makes the splice a clean append. Periodic box + barostat come from the environment system.
    env_top, env_pos, lig_only_top, lig_only_pos = _split_topology(
        modeller, lig_atoms)
    print("[build] env system (charmm36) ...", flush=True)
    env_system = clean_ff.createSystem(
        env_top, nonbondedMethod=app.PME, nonbondedCutoff=1.0 * unit.nanometer,
        constraints=app.HBonds, rigidWater=True, hydrogenMass=3.0 * unit.amu)
    print("[build] ligand system (openff) ...", flush=True)
    lig_system = sysgen.create_system(lig_only_top)
    print("[build] merging ligand into environment system ...", flush=True)
    system = _merge_ligand_system(env_system, lig_system, lig_n)
    # membrane barostat: anisotropic, constant surface tension 0 (free area) along z.
    system.addForce(MonteCarloMembraneBarostat(
        P, 0.0 * unit.bar * unit.nanometer, T,
        MonteCarloMembraneBarostat.XYIsotropic,
        MonteCarloMembraneBarostat.ZFree, 25))

    pos = np.array(modeller.positions.value_in_unit(unit.nanometer))
    lig_centroid = pos[lig_atoms].mean(axis=0)
    ca_idx = [a.index for a in modeller.topology.atoms()
              if a.name == "CA" and a.residue.chain.index == 0]
    anchor = min(ca_idx, key=lambda i: np.linalg.norm(pos[i] - lig_centroid))
    return system, modeller.topology, modeller.positions, lig_atoms, [anchor]


def build_solvent(lig, sysgen):
    lig_top = lig.to_topology().to_openmm()
    lig_pos = lig.conformers[0].to_openmm()
    modeller = app.Modeller(lig_top, lig_pos)
    modeller.addSolvent(sysgen.forcefield, model="tip3p",
                        padding=1.2 * unit.nanometer, neutralize=True)
    system = sysgen.create_system(modeller.topology)
    system.addForce(MonteCarloBarostat(P, T, 25))
    lig_atoms = list(range(lig_top.getNumAtoms()))
    return system, modeller.topology, modeller.positions, lig_atoms


def alchemify(system, lig_atoms):
    # STAB-FIX (2026-06-22): the iter8/replica8/state1 NaN crash diagnostic showed
    # softcore_beta=0 (electrostatics NOT softcored). With annihilate_electrostatics=True the
    # ligand charges are linearly scaled, so at a near-coupled elec window a close ligand<->host
    # contact gives an unbounded 1/r Coulomb spike -> velocity blowup -> NaN. Turn ON the
    # electrostatics softcore (softcore_beta=0.5, matching softcore_alpha) so the Coulomb term
    # is reaction-field/softcore-smoothed as lambda_electrostatics is annihilated. LJ softcore
    # (softcore_alpha=0.5, the openmmtools standard) is kept explicit for clarity.
    # DECK-GUARD (2026-06-22, aiden): openmmtools FORBIDS softcore electrostatics
    # (softcore_beta>0) together with alchemical_pme_treatment="exact" -> ValueError
    # "Softcore electrostatics is not supported with exact treatment of Ewald electrostatics".
    # Exact-PME alchemy requires the Coulomb term to be LINEARLY scaled (softcore_beta=0); the
    # electrostatics are annihilated by lambda_electrostatics turning OFF charges BEFORE the LJ
    # is decoupled (the schedule does elec-first, then sterics), which avoids the r->0 Coulomb
    # singularity without needing softcore on Coulomb. LJ softcore (softcore_alpha=0.5) is kept.
    # This is the exact alchemy config that the SMOKE run passed with.
    region = alchemy.AlchemicalRegion(alchemical_atoms=lig_atoms,
                                      annihilate_electrostatics=True,
                                      annihilate_sterics=False,
                                      softcore_alpha=0.5, softcore_beta=0.0)
    factory = alchemy.AbsoluteAlchemicalFactory(alchemical_pme_treatment="exact")
    return factory.create_alchemical_system(system, region)


def run_leg(name, system, topology, positions, lig_atoms, anchor=None):
    out_nc = os.path.join(HERE, f"abfe_{LIG}_{name}_rep{REP}{'_smoke' if SMOKE else ''}.nc")
    seed = rep_seed(name)
    alch_system = alchemify(system, lig_atoms)
    box = system.getDefaultPeriodicBoxVectors()

    ssc = 0.0
    composable = [alchemy.AlchemicalState.from_system(alch_system)]
    if anchor is not None:
        posn = np.array(positions.value_in_unit(unit.nanometer))
        r0 = float(np.linalg.norm(posn[lig_atoms].mean(axis=0) - posn[anchor[0]]))
        rwell = max(0.45, r0 + 0.15)
        k_kcal_nm2 = 80.0
        k_kj_nm2 = k_kcal_nm2 * 4.184
        cf = mm.CustomCentroidBondForce(
            2, "step(d-rwell)*0.5*restr_k*(d-rwell)^2; d=distance(g1,g2)")
        cf.addGlobalParameter("restr_k", k_kj_nm2)
        cf.addGlobalParameter("rwell", rwell)
        cf.addGroup(anchor); cf.addGroup(lig_atoms); cf.addBond([0, 1], [])
        alch_system.addForce(cf)
        kT = (unit.MOLAR_GAS_CONSTANT_R * T).value_in_unit(unit.kilocalorie_per_mole)
        beta = 1.0 / kT
        rg = np.linspace(0.0, rwell + 2.0, 20000)
        U = np.where(rg <= rwell, 0.0, 0.5 * k_kcal_nm2 * (rg - rwell) ** 2)
        _trapz = getattr(np, "trapezoid", None) or np.trapz
        Veff = _trapz(4 * np.pi * rg ** 2 * np.exp(-beta * U), rg)
        V0 = 1.66053906
        ssc = -kT * np.log(V0 / Veff)
        print(f"[{name} rep{REP}] restraint r0={r0:.2f} rwell={rwell:.2f} nm  "
              f"Veff={Veff:.3f} nm^3  SSC={ssc:.2f} kcal/mol", flush=True)

    base = ThermodynamicState(alch_system, temperature=T, pressure=P)
    compound = CompoundThermodynamicState(base, composable_states=composable)
    thermo_states = []
    for k in range(N_STATES):
        cs = copy.deepcopy(compound)
        cs.lambda_electrostatics = ELEC[k]
        cs.lambda_sterics = STER[k]
        thermo_states.append(cs)

    eq_nsteps = 200 if SMOKE else 25000
    print(f"[{name} rep{REP}] pre-equilibrating coupled state ({eq_nsteps} steps, "
          f"seed={seed})...", flush=True)
    # DECK-GUARD (2026-06-22): a freshly addMembrane-built bilayer + freshly inserted docked
    # ligand has residual hot contacts (lipid tails packed against the protein, ligand snug in
    # the cryptic pocket). Starting alchemical equilibration straight at the 4 fs HMR timestep
    # makes the integrator blow up -> "Particle coordinate is NaN". FIX: a STAGED warmup —
    # deep minimize, then a gentle 0.5 fs -> 1 fs -> 2 fs ramp (few-ps each) to drain the heat
    # before the 4 fs production-eq step. This is the membrane analogue of the eq-NaN fix.
    # DECK-GUARD (2026-06-22, aiden): the warmup ramp ITSELF NaNs non-deterministically on this
    # freshly-built membrane+docked-ligand box (a sub-Angstrom ligand<->lipid/protein overlap
    # that LocalEnergyMinimizer cannot fully escape -> the very first integration steps blow up
    # even at 0.5 fs). The bulk-eq guard below did not cover the warmup, so production NaN'd in
    # warmup. FIX: NaN-GUARD the warmup too — start the ramp at 0.25 fs, run each stage in
    # CHUNKS from a checkpointed good state, and on NaN roll back + re-minimize (escalating
    # iters) + reseed velocities; up to 4 rollbacks per stage before an honest RuntimeError.
    def _new_ctx(dt_fs, rng):
        ig = mm.LangevinMiddleIntegrator(T, 2.0 / unit.picosecond, dt_fs * unit.femtoseconds)
        ig.setRandomNumberSeed(rng)
        c = mm.Context(alch_system, ig, PLATFORM, PLATFORM_PROPS)
        c.setParameter("lambda_electrostatics", 1.0)
        c.setParameter("lambda_sterics", 1.0)
        return c, ig

    eq_ctx, _ig0 = _new_ctx(0.25, seed)
    eq_ctx.setPositions(positions)
    mm.LocalEnergyMinimizer.minimize(eq_ctx, maxIterations=8000)
    eq_ctx.setVelocitiesToTemperature(T, seed)
    warm_steps = 200 if SMOKE else 2500
    for si, dt_fs in enumerate((0.25, 0.5, 1.0, 2.0)):
        good = eq_ctx.getState(getPositions=True, getVelocities=True, enforcePeriodicBox=True)
        del eq_ctx
        eq_ctx, warm_int = _new_ctx(dt_fs, seed + si * 31)
        eq_ctx.setState(good)
        wchunk = max(1, warm_steps // 5)
        wdone = 0; rollbacks = 0
        while wdone < warm_steps:
            warm_int.step(min(wchunk, warm_steps - wdone))
            arr = eq_ctx.getState(getPositions=True).getPositions(asNumpy=True).value_in_unit(unit.nanometer)
            if np.isfinite(arr).all():
                wdone += min(wchunk, warm_steps - wdone)
                good = eq_ctx.getState(getPositions=True, getVelocities=True, enforcePeriodicBox=True)
            else:
                rollbacks += 1
                if rollbacks > 4:
                    raise RuntimeError(f"[{name}] warmup dt={dt_fs}fs NaN'd after 4 rollbacks "
                                       f"(irrecoverable ligand-pocket overlap?)")
                del eq_ctx, warm_int
                eq_ctx, warm_int = _new_ctx(dt_fs, seed + si * 31 + rollbacks * 7)
                eq_ctx.setState(good)
                mm.LocalEnergyMinimizer.minimize(eq_ctx, maxIterations=4000 * rollbacks)
                eq_ctx.setVelocitiesToTemperature(T, seed + si * 31 + rollbacks * 7)
                print(f"[{name} rep{REP}] warmup dt={dt_fs}fs NaN -> rollback {rollbacks}, re-min",
                      flush=True)
        print(f"[{name} rep{REP}] warmup dt={dt_fs}fs ok", flush=True)
    # DECK-GUARD (2026-06-22): the long (100 ps) coupled-state pre-eq at 4 fs HMR is unstable
    # for this membrane system and NaNs even after a clean 0.5->2 fs warmup (SMOKE's 200-step
    # eq survived; the 25000-step production eq did not). FIX: run the main pre-eq at 2 fs in
    # NaN-GUARDED CHUNKS — checkpoint a good state, step a chunk, and on NaN roll back to the
    # last good state + reseed velocities instead of aborting the whole campaign. The 2 fs eq
    # (50 ps) is ample relaxation; the 4 fs HMR is kept only for the REMD sampling moves, which
    # openmmtools already auto-restarts on transient NaN (verified in SMOKE).
    eq_int = mm.LangevinMiddleIntegrator(T, 1.0 / unit.picosecond, 2.0 * unit.femtoseconds)
    eq_int.setRandomNumberSeed(seed)
    st = eq_ctx.getState(getPositions=True, getVelocities=True, enforcePeriodicBox=True)
    eq_ctx = mm.Context(alch_system, eq_int, PLATFORM, PLATFORM_PROPS)
    eq_ctx.setState(st)
    eq_ctx.setParameter("lambda_electrostatics", 1.0)
    eq_ctx.setParameter("lambda_sterics", 1.0)
    chunk = max(1, eq_nsteps // 25)
    good = eq_ctx.getState(getPositions=True, getVelocities=True, enforcePeriodicBox=True)
    done_steps = 0
    while done_steps < eq_nsteps:
        try:
            eq_int.step(min(chunk, eq_nsteps - done_steps))
            test = eq_ctx.getState(getPositions=True, getVelocities=True,
                                   enforcePeriodicBox=True)
            arr = test.getPositions(asNumpy=True).value_in_unit(unit.nanometer)
            if not np.isfinite(arr).all():
                raise mm.OpenMMException("non-finite positions in eq chunk")
            good = test
            done_steps += min(chunk, eq_nsteps - done_steps)
        except Exception as e:
            print(f"[{name} rep{REP}] eq chunk NaN @ {done_steps} steps "
                  f"({str(e)[:40]}); rolling back + reminimize", flush=True)
            eq_ctx.setState(good)
            mm.LocalEnergyMinimizer.minimize(eq_ctx, maxIterations=2000)
            eq_ctx.setVelocitiesToTemperature(T, seed + done_steps + 1)
            good = eq_ctx.getState(getPositions=True, getVelocities=True,
                                   enforcePeriodicBox=True)
    eq_state = eq_ctx.getState(getPositions=True, enforcePeriodicBox=True)
    positions = eq_state.getPositions(asNumpy=True)
    box = eq_state.getPeriodicBoxVectors()
    del eq_ctx, eq_int
    print(f"[{name} rep{REP}] equilibration done", flush=True)

    sampler_state = SamplerState(positions, box_vectors=box)
    # DECK-GUARD (2026-06-22): the 4 fs HMR REMD sampling move is marginally unstable for this
    # POPC-membrane alchemical system and NaNs at replica 0 / state 0 even after openmmtools'
    # 4 internal restart attempts (it survived by luck on a smaller build, failed on a larger
    # one — not reliable). Drop the production sampling timestep to 2 fs: ~2x slower but stable.
    # (HMR @ 3 amu nominally permits 4 fs, but the lipid bilayer's fast tail modes need 2 fs.)
    # DECK-GUARD (2026-06-22, aiden): the REMD move NaN'd at the VERY FIRST iteration (iter 0,
    # multiple replicas) even at 2 fs after a clean equilibration. Cause: reassign_velocities=True
    # draws a FRESH Maxwell-Boltzmann velocity set at the start of every move; on a tight POPC
    # bilayer + constrained HMR system those hot random velocities + the first constrained step
    # can spike a NaN before the thermostat settles. FIX: reassign_velocities=False — carry the
    # equilibrated velocities into sampling (the LangevinMiddle thermostat re-thermalizes anyway),
    # and shorten n_steps per iteration so a transient is caught + exchanged-away sooner. Also
    # drop the barostat update frequency (handled at addForce) so the box can't collapse on the
    # first under-relaxed moves.
    move = mcmc.LangevinDynamicsMove(
        timestep=2.0 * unit.femtoseconds, collision_rate=1.0 / unit.picosecond,
        n_steps=N_STEPS, reassign_velocities=False)
    try:
        move.integrator_options = {"random_number_seed": seed}
    except Exception:
        pass
    sampler = multistate.ReplicaExchangeSampler(
        mcmc_moves=move, number_of_iterations=N_ITER, online_analysis_interval=None)
    reporter = multistate.MultiStateReporter(out_nc, checkpoint_interval=max(1, N_ITER // 10))

    # STAB-FIX (2026-06-22): RESUME-TRAP. A previously-written .nc serializes the OLD mcmc move
    # (the crash .nc carried a 4 fs move; from_storage rebuilds THAT, so the 2 fs fix never took
    # effect on resume -> it NaN'd again at iter8/state1). Only auto-resume when RESUME=1 AND the
    # stored move timestep matches the current 2 fs; otherwise ARCHIVE the stale .nc and start
    # fresh with the corrected (2 fs + softcore_beta + dense schedule) protocol.
    resume_ok = False
    if os.path.exists(out_nc) and os.environ.get("RESUME", "0") == "1":
        try:
            probe = multistate.MultiStateReporter(out_nc, open_mode="r")
            stored = probe.read_mcmc_moves()[0]
            ts = stored.timestep.value_in_unit(unit.femtoseconds)
            probe.close()
            resume_ok = abs(ts - 2.0) < 1e-6
            print(f"[{name} rep{REP}] stored move timestep={ts} fs; resume_ok={resume_ok}",
                  flush=True)
        except Exception as e:
            print(f"[{name} rep{REP}] resume probe failed ({str(e)[:50]}); fresh start",
                  flush=True)
    if os.path.exists(out_nc) and not resume_ok:
        import shutil
        for f in (out_nc, out_nc.replace(".nc", "_checkpoint.nc")):
            if os.path.exists(f):
                shutil.move(f, f + ".stale_" + time.strftime("%H%M%S"))
        print(f"[{name} rep{REP}] archived stale/incompatible .nc -> fresh start", flush=True)
    if os.path.exists(out_nc) and resume_ok:
        print(f"[{name} rep{REP}] resuming from {out_nc}", flush=True)
        sampler = multistate.ReplicaExchangeSampler.from_storage(reporter)
        sampler.extend(n_iterations=max(0, N_ITER - sampler.iteration))
    else:
        print(f"[{name} rep{REP}] sampler.create...", flush=True)
        sampler.create(thermodynamic_states=thermo_states,
                       sampler_states=sampler_state, storage=reporter)
        # STAB-FIX (2026-06-22): the coupled-state-eq geometry is broadcast to EVERY lambda
        # window, so a near-decoupled window inherits a config with full-strength contacts that
        # its softened potential never relaxed -> the iter0 hot contact that seeded the iter8
        # blowup. Minimize EACH state hard (tight tolerance, generous iters) so every replica
        # starts at its own local minimum, not the coupled-state minimum.
        print(f"[{name} rep{REP}] per-state minimize (tol=1 kJ/mol/nm, 5000 iters)...",
              flush=True)
        sampler.minimize(tolerance=1.0 * unit.kilojoule_per_mole / unit.nanometer,
                         max_iterations=5000)
        print(f"[{name} rep{REP}] sampler.run ({N_ITER} iters)...", flush=True)
        sampler.run()
    print(f"[{name} rep{REP}] sampling complete, analyzing...", flush=True)

    analyzer = multistate.MultiStateSamplerAnalyzer(reporter)
    dG_kt, ddG_kt = analyzer.get_free_energy()
    kT = (unit.MOLAR_GAS_CONSTANT_R * T).value_in_unit(unit.kilocalorie_per_mole)
    dG = dG_kt[0, -1] * kT
    ddG = ddG_kt[0, -1] * kT
    print(f"[{name} rep{REP}] dG_decouple = {dG:.2f} +/- {ddG:.2f} kcal/mol (ssc={ssc:.2f})",
          flush=True)
    return dG, ddG, ssc


def main():
    t0 = time.time()
    print(f"=== GJB1 L143P MEMBRANE ABFE  lig={LIG} rep{REP} "
          f"(SMOKE={SMOKE}, N_ITER={N_ITER}, PLATFORM={_PLATFORM}) ===", flush=True)
    lig = prep_ligand()
    sysgen, lipid_ff = make_system_generator(lig)

    csys, ctop, cpos, clig, anchor = build_complex(lig, sysgen)
    print(f"complex: {csys.getNumParticles()} atoms, ligand {len(clig)}, anchor CA {anchor}",
          flush=True)
    dG_c, ddG_c, ssc = run_leg("complex", csys, ctop, cpos, clig, anchor=anchor)

    ssys, stop, spos, slig = build_solvent(lig, sysgen)
    print(f"solvent: {ssys.getNumParticles()} atoms, ligand {len(slig)}", flush=True)
    dG_s, ddG_s, _ = run_leg("solvent", ssys, stop, spos, slig, anchor=None)

    dG_bind = dG_s - dG_c + ssc
    err = (ddG_c**2 + ddG_s**2) ** 0.5
    print("\n" + "=" * 64, flush=True)
    print(f"=== {LIG} rep{REP} dG_bind (membrane ABFE) = {dG_bind:.2f} +/- {err:.2f} kcal/mol ===",
          flush=True)
    print(f"  complex decouple = {dG_c:.2f} +/- {ddG_c:.2f}", flush=True)
    print(f"  solvent decouple = {dG_s:.2f} +/- {ddG_s:.2f}", flush=True)
    print(f"  restraint std-state correction = {ssc:.2f}", flush=True)
    print(f"  wall = {(time.time()-t0)/3600:.2f} h", flush=True)
    print(f"ENS_RESULT lig={LIG} rep={REP} dG_complex={dG_c:.4f} "
          f"dG_solvent={dG_s:.4f} ssc={ssc:.4f} dG_bind={dG_bind:.4f}", flush=True)


if __name__ == "__main__":
    main()
