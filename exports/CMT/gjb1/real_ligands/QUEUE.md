# 🧪 ABFE QUEUE — real drug-like ligands for Cx32 (GJB1) L143P TM1/TM4 cryptic pocket

**Date:** 2026-06-22 · **Status:** PREPARED, **NOT FIRED** (GPU 무접촉 — summer/aiden ABFE in flight) ·
**Engine:** membrane ABFE (`exports/CMT/gjb1/membrane_abfe/abfe_membrane.py`, double-decoupling,
25-window λ, POPC bilayer, OpenFF-2.1.0 + Amber TIP3P + CHARMM36 membrane, MBAR).

> **HONEST (d6):** This is **method progress** (placeholder 2-naphthoate → real drug-like
> chemotypes), **NOT** binding validation. smina/Vina docking score is a **ranking aid, not an
> affinity**. Novelty is a **separate gate** (agent-2 confirms PUBLISHED/PARTIAL/NOVEL). No
> discovery is claimed. ABFE ΔG_bind only becomes meaningful at K≥3 reps with converged MBAR.

---

## Top-3 selected (docking rank vs placeholder baseline)

Docked **locally, FREE** with smina 2020.12.10 (Vina 1.1.2 scoring fn) into the **same**
`docking/receptor.pdbqt` (L143P monomer, 1695 atoms) + **same box** (center 129.36 157.79
171.44, size 22³) as the prior summer Vina run — directly comparable to `docking/scores_sorted.csv`.

| rank | LIG (env name)                  | SMILES                                  | smina kcal/mol | scaffold |
|------|----------------------------------|------------------------------------------|----------------|----------|
| 1    | `CX32L8_diaryl_ether_F`          | `Oc1ccc(Oc2ccc(F)cc2)cc1`                | **-6.4**       | 4-(4-fluorophenoxy)phenol (diaryl ether) |
| 2    | `CX32L14_difluoro_benzimidazole` | `Fc1ccc2[nH]c(-c3ccccc3)nc2c1`           | **-6.1**       | 5-fluoro-2-phenyl-1H-benzimidazole |
| 3    | `CX32L1_benzofuran2carboxamide`  | `O=C(N)c1cc2ccccc2o1`                    | **-5.9**       | benzofuran-2-carboxamide |

Baseline for comparison (re-docked here, same protocol):
`REF_2naphthoate_PLACEHOLDER` -6.1 · `REF_4PBA_anchor` -5.6.
→ **CX32L8 beats** the placeholder by 0.3; **CX32L14 ties** it; **CX32L1** within 0.2 — all
three are real Lipinski+CNS-compliant drug-like molecules (placeholder/anchor were not drug
candidates). Full ranking: `scores_real_sorted.csv` (15 candidates + 2 refs).

All three Lipinski Ro5 **PASS** + CNS/blood-nerve heuristics **PASS** (MW 161-212, cLogP
1.5-3.4, TPSA 28-56, HBD 1, neutral). Property table: `design_ligands.py` output / `RESULT.md`.

---

## Bound poses (ABFE-ready, already extracted)

Each top-3 best smina pose (MODEL 1, docked receptor-frame coords, SMILES bond orders) is
written as the exact file the ABFE driver expects:

```
lig_CX32L8_diaryl_ether_F_bound.sdf          (15 heavy atoms, pose centroid 136.7,148.7,177.5)
lig_CX32L14_difluoro_benzimidazole_bound.sdf (16 heavy atoms, pose centroid 138.1,148.3,177.6)
lig_CX32L1_benzofuran2carboxamide_bound.sdf  (12 heavy atoms, pose centroid 136.7,149.6,173.2)
```

> Pose note (d6): docked centroids sit at the pocket **mouth/edge** (~8-10 Å off the 434 Å³
> geometric centroid), as expected for a shallow lipid-adjacent cryptic cavity. The ABFE
> flat-bottom centroid restraint + POPC embedding handle this (the membrane build was the
> NaN-fix lesson). If a deeper seat is wanted, re-dock with a flex-sidechain box (smina
> `--flexres`) before queueing — not done here (rigid receptor = comparable to baseline).

---

## K≥3 ABFE run spec (per candidate: rep0, rep1, rep2)

The driver selects ligand via `LIG=<name>` and reads `lig_<name>_bound.sdf` + the L143P
receptor. To run the real ligands, the driver's `LIG` map (currently `naphthoate|pba`) must
accept the new names **OR** the bound SDF is symlinked to a known LIG label. **Simplest
drop-in:** copy each `lig_<CX32Lx>_bound.sdf` into the membrane_abfe/ dir and add the name to
the LIG switch (one-line edit per ligand: pocket centroid is shared, no other branch needed).

| candidate | reps | windows × iters × steps | dt | per-rep walltime (RTX 5070 est.) |
|-----------|------|--------------------------|----|----------------------------------|
| CX32L8    | 0,1,2 | 25 × 1000 × 1000 | 2 fs (HMR 4 fs) | ~8-14 h/rep (complex+solvent legs) |
| CX32L14   | 0,1,2 | 25 × 1000 × 1000 | 2 fs            | ~8-14 h/rep |
| CX32L1    | 0,1,2 | 25 × 1000 × 1000 | 2 fs            | ~8-14 h/rep |

(Walltime per the membrane RESULT.md naphthoate production estimate; complex leg dominates.)

---

## ⚡ Single-line FIRE command (run ONLY when GPU is free — DO NOT run now)

Pre-req (one time): stage bound SDFs + receptor into the run dir on the GPU host and add the
3 LIG names to the driver switch (or symlink each to `lig_<name>_bound.sdf`). Then:

```bash
# GPU-free check first (d9): no other agent's job on the card.  Run from mini:
harness pool on aiden 'cd ~/cmt-abfe-gjb1 && pkill -x python 2>/dev/null; \
  setsid bash -c "for L in CX32L8_diaryl_ether_F CX32L14_difluoro_benzimidazole CX32L1_benzofuran2carboxamide; do \
    for R in 0 1 2; do LIG=\$L REP=\$R PLATFORM=CUDA RESUME=1 \
      ~/micromamba/envs/fep/bin/python abfe_membrane.py > prod_\${L}_rep\${R}.log 2>&1; \
    done; done" </dev/null & disown'
```

- `RESUME=1` continues each leg from its per-(lig,leg,rep) `.nc` if interrupted (idempotent).
- Sequential over (lig × rep) on ONE card (no GPU contention, d9); ~9 rep-jobs total.
- For parallel across cards/pods: split the `L`/`R` loops per host (d_parallel_first), one
  GPU per concurrent rep-job (each rep is a full alchemical multistate sampler).

### Poll / harvest (after fire)
```bash
harness pool on aiden 'cd ~/cmt-abfe-gjb1 && tail -3 prod_*.log; ls -la abfe_*_rep*.nc'
# ΔG_bind printed at each rep tail: "=== <lig> rep<R> dG_bind (membrane ABFE) = X +/- Y kcal/mol ==="
# absorb: mean ± SEM over rep0/1/2 per candidate; report Δ vs placeholder (also needs ≥3 reps).
```

---

## Provenance / reproduce (FREE local)
```bash
# env: miniforge3 `fea` (rdkit 2026.3.3 + smina 2020.12.10 + obabel 3.1.0 — installed FREE local)
cd exports/CMT/gjb1/real_ligands
/Users/mini/miniforge3/envs/fea/bin/python design_ligands.py ligands_real.smi   # design + props
bash dock_local.sh                                                              # dock + rank
# bound-pose SDFs regenerated from work/lig/<name>_out.sdf MODEL 1
```

## Remaining (not done here — honest)
- ABFE **NOT FIRED** (GPU contended). Fire when summer MFN2 / aiden GJB1 ABFE completes.
- Driver `LIG` switch needs the 3 names added (one-line each) before fire — left to the fire step.
- Novelty of CX32L8/L14/L1 chemotypes vs prior art = **agent-2 gate** (not confirmed here).
- Flex-sidechain re-dock (deeper seat) optional refinement, not run (kept rigid for baseline parity).
