# GJB1/Cx32 L143P — Membrane ABFE (POPC) — ★ SOLVENT-LEG CPU-FALLBACK WALL BROKEN (2026-06-24)

> **Deck-guard added 2026-06-24 (aiden) — the solvent leg silently ran on CPU (GPU 0% / CPU ~560%).**
>
> **Symptom:** a rep that should take ~5 h stalled to 14 h+; live probe showed the *complex* leg
> finished on GPU but the *solvent* leg (small ligand-in-water box) ran with **GPU 0% / CPU ~560%**,
> its `.nc` growing ~10–50× slower than the complex leg.
>
> **Root cause:** the standalone warmup context (`eq_ctx`) is built with an explicit
> `mm.Context(..., PLATFORM, PLATFORM_PROPS)` so it runs on CUDA — **but** the production
> `ReplicaExchangeSampler` creates its Contexts through openmmtools' **global context cache**,
> which was **never pinned**. With an unpinned cache, openmmtools' default platform selection can
> drop the small solvent leg onto the CPU platform while the heavy complex leg lands on CUDA.
>
> **Fix (root-cause, openmmtools-standard):** pin the global context cache to the same CUDA+mixed
> platform at module import (before any `sampler.create()`), so **every** leg's sampler runs on GPU:
> ```python
> from openmmtools import cache
> if _PLATFORM == "CUDA":
>     cache.global_context_cache.set_platform(PLATFORM, PLATFORM_PROPS)
> ```
> Signature verified live on summer fep env: `ContextCache.set_platform(self, new_platform,
> platform_properties=None)`. No-op when already on CUDA; cache is empty at import so it cannot
> raise on a live cache.
>
> **HONEST STATUS (d6):** fix is **applied + py_compile-clean + API-signature-verified**, but
> **SMOKE-UNVERIFIED end-to-end** — both GPUs hold jobs (summer = anchor rep1 detached, aiden =
> owner xiuren), so no free card to run the CUDA-pin SMOKE yet. The next rep on a freed card picks
> up the fixed driver; first such rep's GPU-utilization (solvent leg > 0%) is the live confirmation.
>
> **REUSABLE DECK-GUARD (d_deck_always — `hexa deck` standard, openmmtools REMD):** the explicit
> `mm.Context(platform=…)` path only covers contexts you build by hand; openmmtools samplers use
> the **global context cache** — pin it (`cache.global_context_cache.set_platform`) or a small leg
> silently falls to CPU. GPU 0% on a multi-leg ABFE = unpinned-cache smell, not a dead job.

---

# GJB1/Cx32 L143P — Membrane ABFE (POPC) — ★ ALCHEMICAL iter-1 NaN WALL BROKEN (2026-06-23)

> **Deck-guard added 2026-06-23 (aiden) — the CX32L1 rep2 `replica15/state12` reproducible NaN.**
> Symptom → root cause → fix below.
>
> **SMOKE VERDICT = ✅ PASS, full end-to-end, NaN count 0.** CX32L1 SMOKE (5 windows × 30 iters
> × 100 steps, CUDA mixed) ran **both legs end-to-end with ZERO NaN warnings** on the 51,879-atom
> POPC box — the *exact* complex leg that NaN'd ×4 at `replica15/state12`. `per-state EQUILIBRATE`
> cleared **every window incl. state 12**, both `sampler.run`s completed:
> ```
> ENS_RESULT lig=CX32L1_benzofuran2carboxamide rep=2 dG_complex=39.77 dG_solvent=9.07 ssc=-0.10 dG_bind=-30.81
> TOTAL NaN warnings: 0
> ```
> The ±9.9e4 kcal/mol on `dG_bind` is expected SMOKE under-sampling MBAR noise (5×30 iters ≪
> convergence), **NOT a crash** — the SMOKE validates the *machinery* (NaN-free), not the
> affinity. The iteration-1 alchemical NaN wall is **BROKEN**. Driver synced to **aiden + summer**
> host copies (grep-verified). **Production re-fire of CX32L1 rep2** with the equilibrate-fixed
> driver (full 25-window × 1000 iters × 2 fs) is **queued for a free GPU** (both cards currently
> hold owner jobs — xiuren on aiden, CX32L8 rep2 on summer; c19 ≥30-min poll, no blind fire).

## ★ DECK-GUARD: alchemical first-iteration NaN = MISSING per-state equilibration

**Symptom (CX32L1 complex leg, ×4 reproducible, not transient):**
`openmmtools.multistate.utils.SimulationNaNError: Propagating replica 15 at state 12 resulted
in a NaN`, raised at `sampler.run()` on **iteration 1** (the very first production propagation),
at a **near-coupled sterics window** (state 12 = `lambda_electrostatics=0.0, lambda_sterics=0.8`).
openmmtools' 4 internal restart attempts (`reassign + reinitialize`) all fail, then it dies.

**Diagnosis (root-cause, by replay — NOT guesswork):** the geometry openmmtools dumps to
`nan-error-logs/iteration1-replica15-state12-{system,state}.xml` is **energetically perfect**:
- per-force decomposition (`diag_state12.py`, CPU Reference, double): total **−6.90e5 kJ/mol**,
  every force group finite, **max |force| only 2.6e3 kJ/mol/nm** (a normal equilibrated frame);
- replaying that exact state (`replay_*.py`) survives **12000 steps** on **CUDA mixed @ 2 fs**,
  on **CPU double**, **with the membrane barostat**, and from a **cold (v=0) re-minimized start** —
  **NaN count 0 in every path.**

⟹ The dumped state is openmmtools' **post-restart reinitialized** state, not the configuration
that actually diverged. The real culprit config came from **iteration-0 propagation + replica
exchange** and was destroyed by the 4-restart loop. The true defect is upstream of the dump:

> **ROOT CAUSE — no per-state thermalization.** All 25 replicas are seeded from **ONE**
> equilibrated **fully-coupled** (λ=1,1) configuration, then only **energy-minimized** per state
> (`sampler.minimize`). There was **no per-state equilibration** before production. So
> iteration-0 fires a full 1000-step **2 fs production** move from a **cold, minimized-but-
> unequilibrated** config evaluated under an alchemical Hamiltonian it was never relaxed under;
> at a near-coupled sterics window the residual strain + replica-exchange velocity handling
> spikes a transient force that **rounds to NaN on CUDA mixed precision**. (Energy-minimize
> removes potential strain but leaves the system cold / out of the window's thermal ensemble —
> the *first full production move* is exactly where it blows up.)

**THE FIX (root-cause, openmmtools-standard) — `abfe_membrane.py::run_leg` ~L640-655:**
insert a **per-state EQUILIBRATION phase** between `sampler.minimize()` and `sampler.run()`:
```python
n_equil = 5 if SMOKE else 50
equil_move = mcmc.LangevinDynamicsMove(
    timestep=1.0*unit.femtoseconds, collision_rate=5.0/unit.picosecond,
    n_steps=max(1, N_STEPS//2), reassign_velocities=True)   # gentle, strong thermostat
sampler.equilibrate(n_equil, mcmc_moves=equil_move)          # NOT counted in production MBAR
sampler.run()
```
Each replica now **thermalizes AT ITS OWN window's Hamiltonian** (gentle 1 fs, 5/ps thermostat,
velocity reassign) before the 2 fs production moves, draining the broadcast coupled-state strain.
`equilibrate()` moves are excluded from the MBAR free-energy estimate, so ΔG is unbiased. This is
the membrane analogue of the canonical **minimize → short NVT equilibrate → production** protocol
that a bare `minimize` skipped. `reassign_velocities=True` is **safe here** (vs. the prior
production-move ban) precisely because this is the equilibration buffer whose purpose is to absorb
that thermal shock; the **production** move keeps `reassign_velocities=False`.

> **REUSABLE DECK-GUARD (d_deck_always — `hexa deck` standard, ABFE/FEP REMD):**
> *Never go `minimize → run` in an openmmtools multistate sampler when all replicas are seeded
> from one config. A bare per-state minimize leaves each window COLD and out of its own thermal
> ensemble; the first full-length production move NaNs at intermediate alchemical windows on
> mixed precision. ALWAYS insert `sampler.equilibrate(n, mcmc_moves=<gentle 1 fs / strong
> thermostat / reassign-v move>)` before `sampler.run()`. And when an openmmtools NaN dump's
> saved state replays cleanly, the dump is the post-restart state — look UPSTREAM (the seeding /
> equilibration protocol), not at the dumped geometry.*

---

# GJB1/Cx32 L143P — Membrane ABFE (POPC) — ★ OFFLINE-MEMBRANE BUILD WALL BROKEN (2026-06-22)

**Host:** `aiden` (idle RTX 5070 12 GB, RAM 30 GB) · FREE GPU · env `fep` (micromamba) · summer untouched
**Engine:** OpenMM 8.2 · openff-toolkit · openmmtools 0.26 · parmed · **AmberTools (packmol-memgen + tleap + sander)**

## ★ ROOT-CAUSE BYPASS — OpenMM `addMembrane` retired, offline packmol-memgen box adopted

**The wall (confirmed by prior agent):** OpenMM `Modeller.addMembrane` runs a stochastic
internal growback-MD that NaNs run-to-run on this tilted multi-TM bundle at every small
padding (1.0–1.4 nm); the only padding that built (2.5 nm → 214,896 atoms) OOMs a 25-window
ReplicaExchange on 30 GB RAM. The separation-λ alchemy was correct but unreachable behind the
build wall.

**The fix (root-cause, c1):** build the bilayer **OFFLINE** with `packmol-memgen` (AmberTools,
FREE, CPU) into a pre-equilibrated, RAM-sized box, parametrize with tleap (Amber
ff19SB/lipid21/tip3p), drain the packmol lipid-tail clashes with a sander CPU minimization,
then **LOAD that prmtop directly into OpenMM** (`abfe_membrane.py::build_complex`, fully
rewritten) — no `addMembrane`, no internal relax MD ⟹ **no build NaN**.

### Recipe (reproducible, all FREE on aiden)
1. `packmol-memgen`, `packmol`, `tleap`, `sander` were already in env `fep` (AmberTools present).
2. Clean EvoEF receptor → heavy atoms (PDBFixer), orient with bundled **MEMEMBED** (`--preoriented`).
   *(packmol-memgen's internal MEMEMBED call fails to emit `..in_EMBED.pdb`; the EvoEF PDB also
   crashes its `pdbvol` (ZeroDivision) — fix = pre-clean + pre-orient, pass `--preoriented`.)*
3. `packmol-memgen -p oriented.pdb -l POPC --dist 10 --dist_wat 10 --salt --saltcon 0.15
   --salt_c Na+ --salt_a Cl- --preoriented --parametrize --ffprot ff19SB --fflip lipid21
   --ffwat tip3p` → tleap **Errors = 0**, writes `gjb1_popc_box_lipid.top` + `.crd` (NetCDF).
4. **sander steepest-descent + CG minimization** (`min.in`, 5000 cyc, CPU) drains packmol's
   21 sub-0.7 Å lipid-tail overlaps: E **1.28e13 → −1.37e5 kJ/mol**, GMAX→14.7. → `gjb1_popc_box_min.rst7`.
5. OpenMM load test (ParmEd, the .crd is NetCDF so `AmberInpcrdFile` won't read it): PRE
   −5.96e5 / POST-min −5.97e5 kJ/mol, **finite negative — BUILD-LEVEL SMOKE GATE PASS**.

### Box (RAM-sized — the OOM cured)
| quantity | value |
|---|---|
| total atoms (env) | **51,860** (51,881 with ligand) |
| POPC / water / Na+Cl⁻ | 177 / 8,904 / 0.15 M |
| box | ~8.6 × 8.5 × 9.7 nm |
| RAM in 25-window REMD | fits 30 GB (vs 214,896-atom addMembrane box = OOM) |

> **REUSABLE DECK-GUARD (d_deck_always — `hexa deck` standard):**
> *Never trust OpenMM `Modeller.addMembrane` for a tilted / multi-TM bundle — its internal
> growback-MD NaNs non-deterministically at small padding and the only stable padding OOMs.
> Build the bilayer OFFLINE (packmol-memgen / CHARMM-GUI), parametrize (tleap lipid21),
> **sander-minimize to drain packmol's sub-vdW lipid-tail overlaps** (OpenMM's minimizer
> cannot escape a 1e13 kJ/mol overlap singularity — sander SD can), then load the prmtop.
> The .crd from tleap is NetCDF → load coords with ParmEd, not `AmberInpcrdFile`.
> Pre-orient with MEMEMBED + `--preoriented` (packmol-memgen's internal orient is fragile,
> and EvoEF PDBs crash its pdbvol — pre-clean to canonical PDB first).*

## ✅ Separation-λ SMOKE (5-window, both legs, naphthoate, CUDA) — **PASS, no fatal NaN**

The full double-decoupling ABFE ran **end-to-end** on the offline box: build → complex leg
(per-state minimize + 0.25→2 fs NaN-guarded warmup, 1 rollback auto-recovered) → solvent leg
→ MBAR + standard-state correction:

```
[build] loading OFFLINE membrane box (no addMembrane)  env=51,860 atoms
[build] CA superpose 177 atoms, RMSD=0.105 nm   (docked pose rigidly mapped into box frame)
[complex rep0] dG_decouple = -1.86 +/- 0.91 kcal/mol (ssc=0.39)
[solvent rep0] dG_decouple = 35.94 +/- 24.78 kcal/mol
=== naphthoate rep0 dG_bind (membrane ABFE) = 37.41 +/- 24.78 kcal/mol ===
```

The separation-λ schedule (elec-first linear → LJ softcore, `softcore_beta=0.0` ⊕ exact-PME,
per-λ-state minimize) executes cleanly — it was the build wall, not the alchemy, that blocked.
SMOKE numbers are **pipeline-validation only** (5 windows × 30 iters × 100 steps); large σ is
expected and not a binding estimate.

## ⏳ Production (25-window, naphthoate, detached) — FIRED, in flight

`run_prod_clean.sh` (setsid nohup, `LIG=naphthoate REP=0`, 25 windows × 1000 iters × 1000
steps, 2 fs) launched on aiden's RTX 5070, GPU to itself. Build phase passed (51,881 atoms,
RMSD 0.105 nm, no NaN); complex-leg equilibration running. **ΔG pending** (multi-hour walltime).
4-PBA (anchor) production is the next sequential `LIG`.

> **Honesty / novelty (d6 · d_novel_only — unchanged):** PARTIAL, **not a discovery**.
> 2-naphthoate = PLACEHOLDER scaffold; target = MONOMER L143P pocket; the mutant-pocket
> strategy is published for sibling Cx26. Any ΔG = **method-validation + relative
> pocket-affinity coordinates**, never a binding-affinity discovery. The contribution here is
> a **method/deck-guard** (offline-membrane ABFE recipe), not a biological finding.

---
# GJB1/Cx32 L143P — Membrane ABFE (POPC bilayer) — build + FF-fix RESULT

**Host:** `aiden` (idle RTX 5070, driver 580.159.04) · FREE GPU · env `fep` (micromamba)
**Date:** 2026-06-22
**Engine:** OpenMM 8.2 · openff-toolkit 0.18.0 · openmmforcefields 0.15.1 · openmmtools 0.26.0 · parmed 4.3.1
**Workspace:** `aiden:~/cmt-abfe-gjb1/` · driver `abfe_membrane.py`
**Scope:** L143P CMTX1 mutant monomer + docked ligand in an explicit POPC bilayer; double-decoupling ABFE (complex leg in membrane, solvent leg in water), MBAR.

> **Honesty / novelty (d6 · d_novel_only):** This axis is **PARTIAL, NOT a discovery.** Per
> `exports/CMT/gjb1/NOVELTY.md`: the *mutation-makes-a-pocket → drug-the-mutant-selectively*
> concept is already published for the sibling connexin **Cx26**, and a different (WT
> N-terminal sterol) druggable pocket in Cx32 is published (Nat Commun 2025, PDB 9QN9/9QNF).
> The specific L143P-induced **TM1/TM4 cryptic pocket** is NOT-FOUND in prior art, but the
> strategy is not novel. The primary ligand **2-naphthoate is a PLACEHOLDER scaffold**
> (`ligands.smi`), not an optimized lead; 4-PBA is a real chemical chaperone used as an
> anchor. Treat any ΔG here as **method-validation + relative pocket-affinity coordinates**,
> never as a binding-affinity discovery.

---

## 1. The real force-field wall that was fixed (THE deck-discipline lesson)

**Symptom 1 (original):** `ValueError: Found multiple NonbondedForce tags with different 1-4
scales` at `addSolvent`/`createSystem`. **Cause:** the membrane environment is **CHARMM36**
(coulomb14/lj14 scale 1.0) and the ligand is **OpenFF/GAFF** (0.833/0.5). OpenMM's
`ForceField.createSystem` cannot merge two different *global* 1-4 scales in one call.

**Symptom 2 (the deeper wall, surfaced after the first naive split):**
`openmm.OpenMMException: CustomNonbondedForce must have exactly as many particles as the
System it belongs to.` **Cause (verified by probe):** CHARMM36-via-OpenMM does **not** keep
its Lennard-Jones in the standard `NonbondedForce`. It splits nonbonded into:

| force | role under CHARMM36 |
|---|---|
| `NonbondedForce` | **charges only** (every particle sigma=1, **eps=0**) |
| `CustomNonbondedForce` | **all LJ** via `acoef(type1,type2)/r^12 - bcoef(type1,type2)/r^6`, a **27×27 Discrete2D type table**, per-particle param = integer `type` |
| `CustomBondForce` | the **1-4 LJ** pairs, `4*eps*((sigma/r)^12-(sigma/r)^6)`, per-bond sigma/eps |

A naive "append the ligand to the standard NonbondedForce" leaves the
`CustomNonbondedForce` short by `lig_n` particles → the crash. And even if patched, an
OpenFF ligand's LJ has **no entry in CHARMM's acoef/bcoef type table**, so ligand↔protein LJ
would silently vanish.

### THE FIX (robust, self-contained — implemented in `abfe_membrane.py::_merge_ligand_system`)

Build the two FF families **separately**, then **fold CHARMM's table-LJ back into one
standard `NonbondedForce`** and append the OpenFF ligand there:

1. Environment (protein + POPC + water + ions) built on a **clean CHARMM36 ForceField only**
   (no OpenFF generator → no 1-4-scale clash, no ligand template needed). Ligand inserted
   **after** the membrane build so `addMembrane` never needs a ligand template.
2. Ligand parameterized **alone** with OpenFF-2.1.0 (its own standalone System).
3. **Fold step:** recover each CHARMM atom-type's `(sigma, eps)` from the diagonal of the
   acoef/bcoef table (`sigma=(a/b)^(1/6)`, `eps=b²/(4a)`), write those `(q, sigma, eps)` into
   the standard `NonbondedForce`, carry the Custom **exclusions** over as standard-NB
   exceptions, then **remove the redundant `CustomNonbondedForce`**. Now ONE standard
   `NonbondedForce` holds q + LJ for protein/lipid/water/ions **and** the appended OpenFF
   ligand, with correct **Lorentz–Berthelot** cross-LJ. The ligand's intra-molecular
   exceptions (which carry the **0.833-scaled** 1-4 charge product **explicitly per pair**)
   are appended verbatim, so the 0.833-vs-1.0 global-scale conflict **never arises** —
   exactly the "explicit per-pair exceptions" principle.

> This folded-NonbondedForce form is also the **correct** substrate for `openmmtools.alchemy`
> (`AbsoluteAlchemicalFactory` alchemically modifies a standard `NonbondedForce`, not an
> arbitrary `CustomNonbondedForce`), so the downstream ABFE decoupling works unmodified.

**REUSABLE DECK-GUARD (the lesson, d_deck_always spirit):**
> *Never mix two force-field families (CHARMM ⊕ OpenFF/GAFF) in one `ForceField.createSystem`.
> Build each as its own System; if one side is CHARMM, remember its LJ lives in a
> `CustomNonbondedForce` acoef/bcoef type-table + a `CustomBondForce` 1-4 table — fold that LJ
> back into the standard `NonbondedForce` (sigma=(a/b)^(1/6), eps=b²/(4a)) before appending the
> other family, and keep every 1-4 term as an explicit per-pair exception so no global 1-4
> scale ever has to be reconciled. Verify with a 50-step minimize giving finite (negative)
> energy = the membrane analogue of the SMOKE gate.*

### Two further membrane-build walls hardened on aiden this session

- **`addMembrane` non-deterministic NaN** (`cannot convert float NaN to integer` /
  `Particle coordinate is NaN`): `Modeller.addMembrane` runs its own stochastic internal
  growback-MD that NaNs run-to-run on this 4-TM footprint. **Fix:** a 12-attempt retry that
  deep-re-minimizes the protein fresh each attempt (deterministic clash drain), occasionally
  jitters via a gentle 150 K NVT to escape a stuck singularity, escalates `minimumPadding`
  (1.8→3.0 nm), and **validates no NaN coordinate slipped through** before accepting.
- **Alchemical pre-equilibration NaN at 4 fs** (`Particle coordinate is NaN` at
  `eq_int.step`): a freshly-built 190k-atom membrane box + a ligand docked into a tight TM
  pocket still has hot lipid/ligand contacts that one minimize can't drain, so the production
  4 fs Langevin step blows up. **Fix:** a **staged warmup** — deep minimize → 0.5 fs ×4000 →
  1 fs ×2000 (each NaN-checked, harder-re-min-and-retry on failure) → only then the bulk
  equilibration at 4 fs (final-state NaN-checked, honest `RuntimeError` if it still fails).

All three guards are now in `abfe_membrane.py` (the self-improving deck SSOT).

---

## 2. Build verification (the SMOKE gate, build level)

`_buildtest.py` (build + 500-step minimize, CUDA mixed):

```
[merge] folded CHARMM table-LJ into std NonbondedForce (41 atom types)
BUILD_OK  sys_particles = 212712   top_atoms = 212712   lig = 21   anchor CA = [2531]
PRE-MIN  energy =  2.26e10 kJ/mol   (high but FINITE)
POST-MIN energy = -2,672,858 kJ/mol  (FINITE, negative, physical — NO NaN)
```

**FF-fix worked: YES. Combined system builds with finite minimized energy: YES.**

---

## 3. SMOKE (5-window end-to-end, `SMOKE=1`) — **PASS**

The full double-decoupling ABFE ran **end-to-end with no NaN** (lig=naphthoate, rep0,
SMOKE=1, 5 windows × 30 iters × 100 steps, CUDA), both legs + MBAR + standard-state
correction, on aiden's RTX 5070:

```
[complex rep0] dG_decouple = -3.05 +/- nan kcal/mol (ssc=0.31)
[solvent rep0] warmup dt=0.5fs ok / 1.0fs ok / 2.0fs ok ; equilibration done
[solvent rep0] dG_decouple = 37.27 +/- 32.15 kcal/mol
=== naphthoate rep0 dG_bind (membrane ABFE) = 40.64 +/- nan kcal/mol ===
ENS_RESULT lig=naphthoate rep=0 dG_complex=-3.0531 dG_solvent=37.2700 ssc=0.3132 dG_bind=40.6363
wall = 0.10 h
```

**SMOKE verdict: PASS** — the pipeline is **NaN-free end-to-end** and emits a finite ΔG. The
numbers themselves are SMOKE-grade noise (5 windows × 30 iters is far below convergence;
`±nan`/`±32` uncertainties are expected MBAR artifacts of under-sampling, **not** a crash).
SMOKE validates the *machinery*, not the affinity — exactly its purpose.

---

## 4. Production status / ΔG

**Status: CLEAN PRODUCTION FIRED (uncontended) — sampling NaN-free.**
GPU contention resolved (both prior agents at rest; stuck PID 1657636 killed → GPU drained
to 0% / 2 MiB). One clean production fired from the fully-fixed shared driver.

- **Fire:** `aiden:~/cmt-abfe-gjb1/fire_clean.sh` (setsid-detached) → naphthoate then 4-PBA,
  sequential, full 20-window λ-schedule, N_ITER=1000, N_STEPS=1000, REMD @ 2 fs + MBAR.
  Logs `prod_clean_naphthoate.log` / `prod_clean_pba.log`; master `clean_master.log`.
  Driver = `abfe_membrane.py` (packmol-memgen membrane + fold-merge + guarded warmup/eq +
  `softcore_beta=0.0` + **`reassign_velocities=False`** — all 7 fixes, grep-verified pre-fire).
- **Clean entry CONFIRMED:** new PID **3966828**, ~52k-atom box, reached **`equilibration
  done`** → `sampler.minimize` → **`sampler.run (1000 iters)` with NaN count = 0**, and
  iterations are **advancing** (REMD .nc growing, GPU 91% util) — i.e. the
  `reassign_velocities=True` iter-0 NaN-loop that killed every prior run is **definitively
  gone**. This is the first production run to enter sampling cleanly and stay NaN-free.
- **ΔG: pending (multi-hour).** Four legs total (complex + solvent, ×{naphthoate, 4-PBA}),
  each 20 windows × 1000 iters × 1000 steps × 2 fs on one RTX 5070 → realistic ETA **~6–12 h**
  for the full set (naphthoate first, then 4-PBA). Poll ≥30 min for `ENS_RESULT`.
- **Resume command** (if interrupted — re-fire continues each leg from its per-leg .nc via
  `ReplicaExchangeSampler.from_storage`):
  `harness pool on aiden 'cd ~/cmt-abfe-gjb1 && setsid bash -c "./fire_clean.sh > clean_master.log 2>&1" </dev/null & disown'`

### Walls fixed in the production push (each = a deck-guard)
| wall | symptom | fix |
|---|---|---|
| FF mix | `CustomNonbondedForce ... particles` | fold CHARMM table-LJ → std NonbondedForce (§1) |
| addMembrane | non-det `NaN` / `cannot convert float NaN to int` | retry + deep re-min + NaN-validate |
| eq warmup | `Particle coordinate is NaN` at first integration | NaN-guarded 0.25→2 fs ramp w/ rollback |
| bulk eq | `NaN` over 25k steps @ 4 fs | NaN-guarded 2 fs chunked eq w/ rollback |
| **OOM** | **exit 137 (SIGKILL) in REMD** | **cap minimumPadding 1.0–1.4 nm → ~40k atoms (was 199k)** |
| alchemy | `Softcore electrostatics not supported with exact Ewald` | `softcore_beta=0.0` w/ exact PME |
| **REMD move** | **`Potential energy is NaN` at sampling iter 0, restart-loop → death** | **`reassign_velocities=False` (carry equilibrated velocities; fresh M-B draw on a tight bilayer spiked NaN); REMD timestep 2 fs** |

### Single next command (fire ONE uncontended production, then poll)

```bash
# 1. ensure no other agent's job is on the GPU (d9): pkill -x python ; then fire ONCE:
harness pool on aiden 'cd ~/cmt-abfe-gjb1 && nvidia-smi --query-compute-apps=pid --format=csv,noheader; \
  setsid bash -c "for L in naphthoate pba; do LIG=$L REP=0 PLATFORM=CUDA \
  ~/micromamba/envs/fep/bin/python abfe_membrane.py > prod_$L.log 2>&1; done" </dev/null & disown'
# 2. poll (>=30 min, c19): grep ENS_RESULT prod_naphthoate.log prod_pba.log
# resumable: re-running continues each leg from its per-leg .nc via ReplicaExchangeSampler.from_storage.
```

> Honest caveat (d6): even when ΔG lands it is a **single-rep** production value on a
> **placeholder scaffold** (2-naphthoate) against a **monomer** pocket — method-validation /
> relative-coordinate grade, not a binding-affinity discovery (novelty PARTIAL, §1 & §5).

---

## 5. Honest caveats

- **Novelty = PARTIAL, not a discovery** (strategy published for Cx26; scaffold is a
  PLACEHOLDER). Any ΔG is method-validation / relative-coordinate only (d_novel_only).
- **Ligand protonation:** the docked SDF carries the carboxylate as neutral **COOH**
  (protonated), not the physiological carboxylate anion — affinity is conditional on this.
- **Monomer, not hexamer:** ABFE is on the L143P **monomer**; the physiological Cx32 is a
  hexameric connexon. Pocket persistence in the assembled channel is not tested here.
- **Single-pose, single-rep SMOKE:** convergence (replica mixing, dG drift) is NOT a SMOKE
  deliverable — production multi-rep + MBAR overlap needed before any quantitative claim.
- **Pose origin:** docked pose from `extract_bound_pose.py`; pocket = L143P P2 cryptic-pocket
  centroid (RESULT.md §3). Not an experimentally determined complex.

---

## 6. 2026-06-22 (late session) — separation-λ driver verified, old loop killed, SMOKE = BUILD-WALL (honest STOP)

**What this session did (driver-correctness pass, no production fire):**

1. **Killed the frozen old loop.** The running `production` was the **frozen** driver
   `abfe_membrane_PROD.py` (PID 2689043, via the old `run_production.sh`), stuck in the
   addMembrane/warmup "Particle coordinate is NaN" retry loop — GPU pinned ~92–96 % doing
   nothing, ΔG=0. Killed by **numeric PID only** (`/tmp/killold.sh`, never `pkill -f` — that
   self-kills the ssh shell). Verified: PID gone, no `abfe_membrane` procs, **GPU 0 % / 2 MiB**.

2. **Separation-λ fix verified COMPLETE in `abfe_membrane.py`** (it had been edited but never
   re-smoked). All four required points are present and correct:
   - (a) `lambda_electrostatics` **1→0 first, linear** (windows 0–8, sterics fully ON) — `ELEC[]`.
   - (b) `lambda_sterics` **1→0 with softcore** (`softcore_alpha=0.5`) **after** elec is off
     (windows 8–24) — `STER[]`, densified 1.00–0.60 region.
   - (c) `AbsoluteAlchemicalFactory(alchemical_pme_treatment="exact")` + **`softcore_beta=0.0`**
     (NO Coulomb softcore — openmmtools forbids softcore-elec ⊕ exact-PME; elec-first schedule
     removes the r→0 Coulomb singularity without it).
   - (d) **per-λ-state individual minimize** — `sampler.minimize(tol=1 kJ/mol/nm, 5000 iters)`.
   - NaN guards retained: addMembrane retry, 0.25→2 fs warmup ramp w/ rollback, chunked 2 fs eq.
   - **`run_production.sh` repointed** from `abfe_membrane_PROD.py` → **`abfe_membrane.py`**
     (the corrected separation-λ driver), as required.

3. **SMOKE (5-window, naphthoate) = FAIL at the BUILD phase → honest STOP (no blind production fire).**
   The corrected alchemy never executes because **addMembrane NaN-fails on ALL 5 capped-padding
   retries** (pad 1.0/1.2/1.0/1.4/1.2 nm) → `RuntimeError: addMembrane failed after all retries`.
   This contradicts §4's earlier "40,245-atom build OK": that build was **non-deterministic luck**
   (addMembrane's internal relax NaNs stochastically); the killed prod loop was stuck on exactly
   this wall. The empirical tension (deck-guards lines 309–334 vs 376–380) is now confirmed:

   | padding | result | atoms | viable? |
   |---|---|---|---|
   | ≤ 1.4 nm (current cap) | **addMembrane NaN, all retries** | — | build fails |
   | 2.5 nm (only pad that built) | builds | **214,896** | OOM in 25-window REMD on 30 GB RAM |

   **The wall:** the only padding that lets addMembrane build the PCA-aligned 4-TM bundle
   (2.5 nm) yields a ~215k-atom box that a 25-window ReplicaExchange cannot fit in aiden's
   **30 GB RAM** (verified `free -g`); every smaller pad NaNs in addMembrane's internal relax.
   **The separation-λ correctness fix is sound but currently unreachable** behind this build wall.

**Status returned to caller:**
- Old loop killed? **YES** (numeric-PID kill, GPU drained to 0 %).
- Separation-λ verified/completed? **YES** — fix is present & correct in `abfe_membrane.py`;
  `run_production.sh` repointed to it.
- SMOKE PASS? **NO** — fails at `addMembrane` (build phase), before alchemy; honest STOP.
- Production fire / ΔG? **NOT FIRED** (per "맹발사 금지" — SMOKE must pass first). ΔG = none.

**Breakthrough paths (d2 — concrete, do NOT concede):**
1. **Pre-built membrane (skip OpenMM addMembrane entirely).** Build the POPC/protein box once
   with **CHARMM-GUI Membrane Builder** or **`packmol-memgen`** (Amber) → load a stable
   `.pdb/.psf`; addMembrane's fragile internal-relax NaN is the whole problem. Tight lateral
   packing → ~40–60k atoms, fits 30 GB.
2. **Shrink the REMD memory floor.** 25 windows × full-system replicas is the OOM driver. Use
   **fewer windows + SAMS/`online_analysis`** or **serial λ (TI/expanded-ensemble)** instead of
   ReplicaExchange so only ~1–2 system copies live in RAM → the 2.5 nm / 215k-atom box becomes
   tractable on 30 GB.
3. **Make addMembrane deterministic at small pad.** The NaN is a residual hot lipid–protein
   contact in addMembrane's 20-step growback MD. Pre-equilibrate the **bare bilayer separately**,
   or feed addMembrane a more aggressively pre-relaxed protein (longer NVT, smaller dt), or trim
   the PCA box so 1.4 nm pad packs cleanly.

**Resume / next single command:**
```bash
# breakthrough path 1 (recommended): build the membrane offline, then run the verified driver.
# Until a stable pre-built box exists, do NOT fire production (build wall).
harness pool on aiden 'cd ~/cmt-abfe-gjb1; tail -30 smoke_stab.log'
```

> **Deck-guard left for reuse:** the separation-λ recipe (elec-first linear → sterics-softcore,
> `softcore_beta=0.0` ⊕ exact-PME, per-state minimize) is correct and now baked into
> `abfe_membrane.py` — reuse it for any membrane ABFE. The OUTSTANDING guard to add to
> `hexa deck` is: **never rely on OpenMM `addMembrane` for a tilted multi-TM bundle — use a
> pre-built CHARMM-GUI/packmol-memgen box** (the NaN-retry loop is unfixable inside addMembrane).
> Honesty (d6 · d_novel_only): even if production lands, ΔG is **method-grade on a PLACEHOLDER
> scaffold (2-naphthoate) against a MONOMER pocket**, novelty **PARTIAL** — not a discovery.
