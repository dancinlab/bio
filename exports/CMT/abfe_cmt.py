#!/usr/bin/env python3
# SENOLYX R12-GOLD breakthrough ① — multi-replica ensemble-average ABFE.
#
# Identical engine + box-fix to abfe_hsp90_pair.py (the R12-GOLD definitive deck),
# with ONE addition: a REP env var (replica index 0..K-1) that
#   (a) derives a DISTINCT integer seed per (LIG, leg, REP) for both
#       setVelocitiesToTemperature AND every stochastic move
#       (eq LangevinMiddleIntegrator + the LangevinDynamicsMove of the sampler), and
#   (b) writes an independent, resumable per-rep checkpoint abfe_{leg}_rep{REP}.nc.
#
# WHY: the gold pair run gave ΔΔG = +2.74 (WRONG sign; exp ≈ −1.9). The cause is
# NOT a systematic bias but run-to-run BISTABILITY of the per-leg dG (the 17AG
# complex leg landed 58.12 in R12 vs 53.55 in gold — a ~4.6 kcal/mol swing). A
# single ABFE-difference therefore does NOT cancel that noise. Breakthrough ①:
# run K independent replicas per (ligand, leg) with distinct seeds, ensemble-average
# each leg's dG (mean ± stderr), THEN form ΔΔG. If the bistability is seed/sampling
# driven, the stderr shrinks ~÷√K and the sign stabilizes. (If it's a deterministic
# deck artifact, averaging won't fix it → branch ② RBFE is the real fix.)
#
# Select ligand with LIG (17AG | 17AAG); select replica with REP (default 0).
# Each invocation runs BOTH legs (complex, solvent) for ONE (LIG, REP); the driver
# run_ens.sh loops LIG × REP. The final ensemble-average is computed by run_ens.sh
# (inline python) after all leg-runs land — this deck just emits per-leg dG/ssc.
import os, sys, time, faulthandler, hashlib
faulthandler.enable()
# pin pymbar's JAX to CPU BEFORE openmmtools import — otherwise JAX and OpenMM both
# grab the single GPU and segfault. MBAR is cheap on CPU; OpenMM keeps the GPU.
os.environ.setdefault("JAX_PLATFORMS", "cpu")
os.environ.setdefault("JAX_PLATFORM_NAME", "cpu")
os.environ.setdefault("CUDA_VISIBLE_DEVICES", "0")
import numpy as np
from openmm import unit, app, MonteCarloBarostat
import openmm as mm
from openff.toolkit import Molecule
from openff.toolkit.utils.nagl_wrapper import NAGLToolkitWrapper
from openmmforcefields.generators import SystemGenerator
from pdbfixer import PDBFixer
from openmmtools import alchemy, states, mcmc, multistate, forces
from openmmtools.states import (ThermodynamicState, SamplerState,
                                CompoundThermodynamicState)

SMOKE = os.environ.get("SMOKE", "0") == "1"
# TARGET selects the whole candidate binding event: receptor PDB + co-crystal ligand
# SDF (RCSB ideal, correct bond orders) + the EXPERIMENTAL pocket centroid (computed
# from the co-crystal HETATM coords, NOT the receptor geometric centre — these are
# surface-groove pockets, so the HSP90 recenter-to-receptor-centroid shortcut is WRONG).
TARGET = os.environ.get("TARGET", "MCL1")      # BCLXL | CRBN | MCL1
REP = int(os.environ.get("REP", "0"))          # replica index 0..K-1 (distinct seed)
T = 298.15 * unit.kelvin
P = 1.0 * unit.atmosphere
# PLATFORM env override: a CPU SMOKE can validate the build/minimize/MBAR path of a
# re-pocket WITHOUT contending with an in-flight CUDA production on the single shared GPU.
# Defaults to CUDA (production). CPU SMOKE = pocket-correctness check, not a perf run.
_PLATFORM = os.environ.get("PLATFORM", "CUDA")
PLATFORM = mm.Platform.getPlatformByName(_PLATFORM)
PLATFORM_PROPS = {"Precision": "mixed"} if _PLATFORM == "CUDA" else {}
HERE = os.path.dirname(os.path.abspath(__file__))
import json
# POCKETS env override lets a re-pocket pass (corrected SARM1/MFN2 entries) run from an
# alternate pockets file WITHOUT clobbering the committed pockets.json that an in-flight
# production run is reading. Defaults to the canonical file.
_POCKETS_FILE = os.environ.get("POCKETS", "pockets.json")
_T = json.load(open(os.path.join(HERE, _POCKETS_FILE)))[TARGET]
REC_PDB = os.path.join(HERE, f"{_T['pdb']}.pdb")
# prefer a CLASH-FREE bound pose (extract_pose.py) over the ideal conformer — the
# ideal conformer overlaid by centroid clashes in tight/buried pockets (NaN at eq).
_BOUND_SDF = os.path.join(HERE, f"lig_{_T['lig']}_bound.sdf")
BOUND_POSE = os.path.exists(_BOUND_SDF)
LIG_SDF = _BOUND_SDF if BOUND_POSE else os.path.join(HERE, f"lig_{_T['lig']}.sdf")
POCKET = np.array(_T["center"]) * 0.1           # Angstrom (PDB) -> nm  (recenter target)
LIG = TARGET                                     # reuse downstream labels/seeds/ENS_RESULT


def rep_seed(leg):
    """Distinct, deterministic 31-bit int seed per (LIG, leg, REP).

    Derived by hashing the tuple so the seeds for different (lig, leg, rep) are
    decorrelated (not a simple REP*offset that could alias the integrator's own
    stream). Reproducible: same (LIG, leg, REP) always yields the same seed, so a
    resumed run continues the SAME stochastic trajectory it started.
    """
    h = hashlib.sha256(f"senolyx-ens|{LIG}|{leg}|{REP}".encode()).hexdigest()
    # OpenMM/openmmtools want a positive 32-bit-ish int; keep it in [1, 2**31-1].
    return (int(h[:8], 16) % (2**31 - 2)) + 1

# ---- protocol resolution -----------------------------------------------------
if SMOKE:
    # pipeline-validation: 5 windows / leg, 100-step iters, 30 iterations (enough
    # samples for the numpy MBAR solver to converge without crashing)
    ELEC = [1.0, 0.5, 0.0, 0.0, 0.0]
    STER = [1.0, 1.0, 1.0, 0.5, 0.0]
    N_ITER, N_STEPS = 30, 100
else:
    # production gold (R10b dense 20-window λ-schedule): elec off in 0.125 steps
    # (9 win) then sterics softcore in finer steps (11 win) → tight MBAR overlap.
    ELEC = [1.000, 0.875, 0.750, 0.625, 0.500, 0.375, 0.250, 0.125, 0.000,
            0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000]
    STER = [1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000, 1.000,
            0.900, 0.800, 0.700, 0.600, 0.500, 0.400, 0.300, 0.200, 0.120, 0.050, 0.000]
    N_ITER, N_STEPS = 1000, 1000  # 1000 iters * 1000 steps * 4fs(HMR) = 4 ns / window
N_STATES = len(ELEC)
assert len(STER) == N_STATES


def prep_ligand():
    lig = Molecule.from_file(LIG_SDF)
    NAGLToolkitWrapper().assign_partial_charges(
        lig, partial_charge_method="openff-gnn-am1bcc-1.0.0.pt")
    return lig


def make_system_generator(lig):
    # ff14SB protein + TIP3P water + OpenFF-2.1.0 small molecule, HMR for 4 fs.
    return SystemGenerator(
        forcefields=["amber/protein.ff14SB.xml", "amber/tip3p_standard.xml"],
        small_molecule_forcefield="openff-2.1.0",
        molecules=[lig],
        forcefield_kwargs={"constraints": app.HBonds, "rigidWater": True,
                           "hydrogenMass": 3.0 * unit.amu},
        periodic_forcefield_kwargs={"nonbondedMethod": app.PME,
                                    "nonbondedCutoff": 1.0 * unit.nanometer})


def build_complex(lig, sysgen):
    fixer = PDBFixer(filename=REC_PDB)
    fixer.findMissingResidues(); fixer.missingResidues = {}
    fixer.findNonstandardResidues(); fixer.replaceNonstandardResidues()
    fixer.removeHeterogens(keepWater=False)
    fixer.findMissingAtoms(); fixer.addMissingAtoms(); fixer.addMissingHydrogens(7.0)
    modeller = app.Modeller(fixer.topology, fixer.positions)

    # ---- BOX-FIX (R12 smallbox) ---------------------------------------------
    # The ligand SDF is origin-centred while the receptor is ~9.8 nm away. Translate
    # the ligand centroid onto the receptor centroid (≈ N-domain ATP pocket for this
    # single-domain construct) so the solvated box wraps the receptor, not the
    # 9.8 nm origin→receptor span. padding=1.0 then gives ~31k atoms (vs 289k naive).
    lig_pos = lig.conformers[0].to_openmm().value_in_unit(unit.nanometer)
    lig_pos = np.array(lig_pos)
    if not BOUND_POSE:
        # ideal conformer: place centroid at the EXPERIMENTAL pocket centroid.
        lig_pos = lig_pos - lig_pos.mean(axis=0) + POCKET        # centroid → pocket
    # BOUND_POSE: coords are already the co-crystal bound pose in the receptor
    # frame (clash-free) — keep as-is, no recenter.
    lig_top = lig.to_topology().to_openmm()
    modeller.add(lig_top, lig_pos * unit.nanometer)
    n_before_solv = modeller.topology.getNumAtoms()
    # solvate + neutralize (padding now measured around the receptor, ligand inside)
    modeller.addSolvent(sysgen.forcefield, model="tip3p",
                        padding=1.0 * unit.nanometer, neutralize=True,
                        ionicStrength=0.15 * unit.molar)
    system = sysgen.create_system(modeller.topology)
    system.addForce(MonteCarloBarostat(P, T, 25))
    # ligand atom indices = the contiguous block we just added (before solvent)
    lig_n = lig_top.getNumAtoms()
    lig_atoms = list(range(n_before_solv - lig_n, n_before_solv))
    # protein anchor = CA closest to ligand centroid (for the centroid restraint)
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
    region = alchemy.AlchemicalRegion(alchemical_atoms=lig_atoms,
                                      annihilate_electrostatics=True,
                                      annihilate_sterics=False)
    factory = alchemy.AbsoluteAlchemicalFactory(alchemical_pme_treatment="exact")
    return factory.create_alchemical_system(system, region)


def run_leg(name, system, topology, positions, lig_atoms, anchor=None):
    # per-rep checkpoint: abfe_{leg}_rep{REP}.nc (independent + resumable)
    out_nc = os.path.join(
        HERE, f"abfe_{name}_rep{REP}{'_smoke' if SMOKE else ''}.nc")
    seed = rep_seed(name)   # distinct per (LIG, leg, REP)
    alch_system = alchemify(system, lig_atoms)
    box = system.getDefaultPeriodicBoxVectors()

    # complex leg: hand-rolled FLAT-BOTTOM centroid restraint (anchor protein CA <->
    # ligand centroid). A plain CustomCentroidBondForce (NOT an openmmtools
    # RadiallySymmetricRestraintForce) so the MBAR analyzer treats it as an ordinary
    # always-on force (cancels between windows) instead of the YANK-style
    # lambda_restraints unbiasing path (openmmtools 0.26 no longer supports it).
    ssc = 0.0  # kcal/mol
    composable = [alchemy.AlchemicalState.from_system(alch_system)]
    if anchor is not None:
        posn = np.array(positions.value_in_unit(unit.nanometer))
        r0 = float(np.linalg.norm(posn[lig_atoms].mean(axis=0) - posn[anchor[0]]))
        rwell = max(0.45, r0 + 0.15)                      # nm
        k_kcal_nm2 = 80.0                                  # kcal/mol/nm^2 (soft wall)
        k_kj_nm2 = k_kcal_nm2 * 4.184
        cf = mm.CustomCentroidBondForce(
            2, "step(d-rwell)*0.5*restr_k*(d-rwell)^2; d=distance(g1,g2)")
        cf.addGlobalParameter("restr_k", k_kj_nm2)         # kJ/mol/nm^2
        cf.addGlobalParameter("rwell", rwell)              # nm
        cf.addGroup(anchor)
        cf.addGroup(lig_atoms)
        cf.addBond([0, 1], [])
        alch_system.addForce(cf)
        # analytical standard-state correction: V_eff = int 4 pi r^2 exp(-beta U(r)) dr
        kT = (unit.MOLAR_GAS_CONSTANT_R * T).value_in_unit(unit.kilocalorie_per_mole)
        beta = 1.0 / kT
        rg = np.linspace(0.0, rwell + 2.0, 20000)          # nm
        U = np.where(rg <= rwell, 0.0, 0.5 * k_kcal_nm2 * (rg - rwell) ** 2)  # kcal/mol
        _trapz = getattr(np, "trapezoid", None) or np.trapz
        Veff = _trapz(4 * np.pi * rg ** 2 * np.exp(-beta * U), rg)            # nm^3
        V0 = 1.66053906                                                       # nm^3 (1 M)
        ssc = -kT * np.log(V0 / Veff)                                         # kcal/mol
        print(f"[{name} rep{REP}] restraint r0={r0:.2f} rwell={rwell:.2f} nm  "
              f"Veff={Veff:.3f} nm^3  SSC={ssc:.2f} kcal/mol", flush=True)

    import copy
    base = ThermodynamicState(alch_system, temperature=T, pressure=P)
    compound = CompoundThermodynamicState(base, composable_states=composable)

    # build per-window thermodynamic states (deep-copy the compound, set lambdas)
    thermo_states = []
    for k in range(N_STATES):
        cs = copy.deepcopy(compound)
        cs.lambda_electrostatics = ELEC[k]
        cs.lambda_sterics = STER[k]
        thermo_states.append(cs)

    # pre-equilibrate the fully-coupled state on the GPU so the replica-exchange start
    # is clash-free (bad contacts from the translated pose + rebuilt receptor + solvent
    # would otherwise blow up the alchemical minimize -> NaN -> segfault).
    # SEED PLUMBING ①: the eq integrator + its velocity assignment carry the rep seed,
    # so each replica starts on a DISTINCT thermal microstate (the branch-landing knob).
    eq_nsteps = 200 if SMOKE else 25000  # 0.1 ns equilibration at 4 fs
    print(f"[{name} rep{REP}] pre-equilibrating coupled state ({eq_nsteps} steps, "
          f"seed={seed})...", flush=True)
    eq_int = mm.LangevinMiddleIntegrator(T, 1.0 / unit.picosecond, 4.0 * unit.femtoseconds)
    eq_int.setRandomNumberSeed(seed)
    eq_ctx = mm.Context(alch_system, eq_int, PLATFORM, PLATFORM_PROPS)
    eq_ctx.setPositions(positions)
    eq_ctx.setParameter("lambda_electrostatics", 1.0)
    eq_ctx.setParameter("lambda_sterics", 1.0)
    mm.LocalEnergyMinimizer.minimize(eq_ctx, maxIterations=2000)
    eq_ctx.setVelocitiesToTemperature(T, seed)          # distinct initial velocities
    eq_int.step(eq_nsteps)
    eq_state = eq_ctx.getState(getPositions=True, enforcePeriodicBox=True)
    positions = eq_state.getPositions(asNumpy=True)
    box = eq_state.getPeriodicBoxVectors()
    del eq_ctx, eq_int
    print(f"[{name} rep{REP}] equilibration done", flush=True)

    sampler_state = SamplerState(positions, box_vectors=box)
    # SEED PLUMBING ②: the replica-exchange production move carries the rep seed
    # (openmmtools LangevinDynamicsMove forwards it to the underlying OpenMM
    # integrator's setRandomNumberSeed), so the production trajectory of every
    # replica is an independent stochastic realization.
    move = mcmc.LangevinDynamicsMove(
        timestep=4.0 * unit.femtoseconds, collision_rate=1.0 / unit.picosecond,
        n_steps=N_STEPS, reassign_velocities=True)
    try:
        move.integrator_options = {"random_number_seed": seed}
    except Exception:
        pass  # older openmmtools — eq seed already decorrelates the branch landing
    sampler = multistate.ReplicaExchangeSampler(
        mcmc_moves=move, number_of_iterations=N_ITER,
        online_analysis_interval=None)
    reporter = multistate.MultiStateReporter(
        out_nc, checkpoint_interval=max(1, N_ITER // 10))

    if os.path.exists(out_nc):
        # resume — reboot-safe: a killed run picks up from the last checkpoint
        print(f"[{name} rep{REP}] resuming from {out_nc}", flush=True)
        sampler = multistate.ReplicaExchangeSampler.from_storage(reporter)
        sampler.extend(n_iterations=max(0, N_ITER - sampler.iteration))
    else:
        print(f"[{name} rep{REP}] sampler.create...", flush=True)
        sampler.create(thermodynamic_states=thermo_states,
                       sampler_states=sampler_state, storage=reporter)
        print(f"[{name} rep{REP}] sampler.minimize...", flush=True)
        sampler.minimize()
        print(f"[{name} rep{REP}] sampler.run ({N_ITER} iters)...", flush=True)
        sampler.run()
    print(f"[{name} rep{REP}] sampling complete, analyzing...", flush=True)

    analyzer = multistate.MultiStateSamplerAnalyzer(reporter)
    dG_kt, ddG_kt = analyzer.get_free_energy()
    kT = (unit.MOLAR_GAS_CONSTANT_R * T).value_in_unit(unit.kilocalorie_per_mole)
    dG = dG_kt[0, -1] * kT
    ddG = ddG_kt[0, -1] * kT
    print(f"[{name} rep{REP}] dG_decouple = {dG:.2f} +/- {ddG:.2f} kcal/mol  "
          f"(ssc={ssc:.2f})", flush=True)
    return dG, ddG, ssc


def main():
    t0 = time.time()
    print(f"=== SENOLYX R13 candidate ABFE {TARGET} ({_T['lig']}) rep{REP} "
          f"(SMOKE={SMOKE}, N_ITER={N_ITER}) ===", flush=True)
    lig = prep_ligand()
    sysgen = make_system_generator(lig)

    csys, ctop, cpos, clig, anchor = build_complex(lig, sysgen)
    print(f"complex: {csys.getNumParticles()} atoms, ligand {len(clig)}, anchor CA {anchor}", flush=True)
    dG_c, ddG_c, ssc = run_leg("complex", csys, ctop, cpos, clig, anchor=anchor)

    ssys, stop, spos, slig = build_solvent(lig, sysgen)
    print(f"solvent: {ssys.getNumParticles()} atoms, ligand {len(slig)}", flush=True)
    dG_s, ddG_s, _ = run_leg("solvent", ssys, stop, spos, slig, anchor=None)

    # ABFE assembly (double decoupling) for THIS replica:
    #   dG_bind = dG_solvent_off - dG_complex_off + dG_SSC
    dG_bind = dG_s - dG_c + ssc
    err = (ddG_c**2 + ddG_s**2) ** 0.5
    print("\n" + "=" * 64, flush=True)
    print(f"=== rep{REP} dG_bind (ABFE, double-decoupling + MBAR) = "
          f"{dG_bind:.2f} +/- {err:.2f} kcal/mol ===", flush=True)
    print(f"  ligand = {LIG}  rep = {REP}", flush=True)
    print(f"  complex decouple = {dG_c:.2f} +/- {ddG_c:.2f}", flush=True)
    print(f"  solvent decouple = {dG_s:.2f} +/- {ddG_s:.2f}", flush=True)
    print(f"  restraint std-state correction = {ssc:.2f}", flush=True)
    print(f"  wall = {(time.time()-t0)/3600:.2f} h", flush=True)
    # machine-readable line for run_ens.sh's ensemble-average parser:
    print(f"ENS_RESULT lig={LIG} rep={REP} dG_complex={dG_c:.4f} "
          f"dG_solvent={dG_s:.4f} ssc={ssc:.4f} dG_bind={dG_bind:.4f}", flush=True)


if __name__ == "__main__":
    main()
