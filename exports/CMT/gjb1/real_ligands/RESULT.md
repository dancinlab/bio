# 🧬 Real drug-like ligand design + docking — Cx32 (GJB1) L143P cryptic pocket

## ⭐ K=2 잠정 ΔΔG (membrane ABFE · 2026-06-24 · 외부 GPU 블록서 종착)

| ligand | reps | mean dG_bind (kcal/mol) | ΔΔG = mean − anchor | 비고 |
|---|---|---|---|---|
| CX32L8 (diaryl-ether) | rep0 −79.00, rep1 −70.80 | **−74.90 ± 4.10** | **−26.0** (강결합) | rep2 = equilfix에도 replica3/state0 NaN → K=2 고정 |
| anchor (2-naphthoate) | rep0 −48.82, rep1 −48.92 | **−48.87 ± 0.05** (K=2) | 0 (기준) | placeholder method anchor · 산포 0.07 = baseline 재현성 높음 |
| CX32L1 (benzofuran) | rep0 −24.31, rep1 −31.25 | **−27.78 ± 3.47** | **+21.1** (약결합) | rep2 equilfix 준비됨·카드 대기 |
| CX32L14 (benzimidazole) | — | HELD | — | pose 구조적 실패 |

**잠정순위: CX32L8 > anchor > CX32L1** (2rep 일관). **정직(d6)**: anchor 이제 **K=2**(±0.05 — ΔΔG 분모에 오차막대 확보, baseline 재현성 입증) · 전부 **method-grade**(발견·약효 아님) · 선택성(mutant-vs-WT)·신규성 **별도 게이트 미실시** → "잠정 결합 순위"까지. anchor rep2·CX32L1 rep2(GPU-pin 새 드라이버) summer 직렬 진행 중 → K=3 자동승격(update-in-place·watcher a64f19921).

**Date:** 2026-06-22 · **Host:** mini (FREE local CPU, miniforge3 env `fea`) · **GPU 무접촉**
(summer/aiden running ABFE — untouched) · **Goal:** escape the scaffold-placeholder
(2-naphthoate) to **actual drug-like molecules** for the L143P-induced TM1/TM4 cryptic pocket.

> **HONEST (d6):** docking score = ranking aid, **NOT** affinity · novelty = **separate gate**
> (agent-2) · placeholder→real = **method progress, not binding validation** · **no discovery
> claimed**. All candidates are coordinates pending K≥3 ABFE + novelty confirmation.

---

## 1 · Tool availability (FREE local)

| tool | status | note |
|------|--------|------|
| RDKit | ✅ 2026.3.3 | installed FREE into miniforge3 `fea` (`pip install rdkit`) |
| smina | ✅ 2020.12.10 | Vina 1.1.2 scoring fn; installed FREE via bioconda (`conda install -c bioconda smina`) |
| OpenBabel | ✅ 3.1.0 | dependency of smina; SDF/pdbqt interconvert |
| meeko | ✅ 0.7.1 | installed; not needed (smina takes SDF directly) |
| AutoDock Vina (python) | ❌ | wheel build fails on macOS-ARM ("Boost library not found"); **smina is the FREE substitute** (same Vina scoring fn → scores comparable to the prior summer Vina run) |
| GPU (summer/aiden) | ⛔ untouched | ABFE in flight; docking is CPU-only anyway |

Default mini `python3` is 3.14 (no rdkit wheel yet) → used the `fea` env python 3.11.

---

## 2 · Pocket pharmacophore read (structural, not energetic)

L143P pocket #2 (`pockets_L143P.json`): **434 Å³**, center [129.36, 157.79, 171.44], burial
54.5%, **hydrophobic_frac 0.87**, 23 lining residues.

- **Lipophilic body required** — 14/23 lining are aliphatic (Ile/Val/Leu/Ala/Met). Bulk binding
  must come from a flat/branched nonpolar aromatic+aliphatic core.
- **Aromatic cage** — TRP24, PHE31, PHE193, TYR211 → π-stacking core favored (why naphthoate led).
- **Single polar anchor** — **GLU208** is the lone acidic handle (SER26, TYR211-OH minor). One
  directional H-bond donor / weak base toward GLU208 anchors; polar-heavy ligands are
  desolvation-penalized in this dry cavity.
- **Small volume** — ~6-7-heavy-atom ring + small substituent; keep MW modest (<~350).

---

## 3 · Designed candidate set (15 novel + 2 refs)

All 15 designed candidates pass **Lipinski Ro5** AND **CNS/blood-nerve heuristics**
(MW 145-233, cLogP 0.66-3.37, TPSA<72, RotB≤2, neutral/weak-base). Five scaffold families,
deliberately divergent from the placeholder (2-naphthoate), the anchor (4-PBA), and the Cx26
prior-art compound (VRT-534) per `d_novel_only`:

| family | members | design logic |
|--------|---------|--------------|
| A · rigid fused-bicyclic acids/amides | benzofuran-2-carboxamide, indole-3-acetamide, indazole-5-carboxamide, quinoline-2-carboxylic | flat aza/oxa cage + single amide/acid anchor |
| B · heteroaromatic biaryls | 4'-F-biphenyl-4-carboxamide, 4-(pyridin-4-yl)benzamide, benzothiophene-2-carboxamide | span long cavity axis, S/N for lipophilicity & charge complementarity |
| C · fluorinated diaryl ether/sulfone | 4-(4-F-phenoxy)phenol, 4-(phenylsulfonyl)aniline | bent biaryl matching kinked cavity, very low TPSA |
| D · sat/aromatic hybrid bicyclics | 2-aminotetralin, chromane-2-carboxamide, 2-Me-indole-5-carbonitrile | sp3 character fits 434 Å³ better than flat naphthalene |
| E · VRT-534-concept, scaffold-divergent | N-(thiazol-2-yl)benzamide, 5-F-2-phenyl-benzimidazole, 1,7-naphthyridin-2-amine | one directional anchor + lipophilic body in unrelated cores |

Full SMILES + property table: `design_ligands.py` (run it) · `ligands_real.smi`.

---

## 4 · Docking ranking (smina, vs placeholder baseline)

Same receptor.pdbqt (L143P, 1695 atoms) + same box as summer run → directly comparable.
Re-docked placeholder = -6.1 here vs -5.98 on summer (Vina 1.2.7) → cross-engine agreement ±0.1.

| rank | candidate | smina kcal/mol | Δ vs placeholder (-6.1) |
|------|-----------|----------------|--------------------------|
| 1 | **CX32L8_diaryl_ether_F** (`Oc1ccc(Oc2ccc(F)cc2)cc1`) | **-6.4** | **−0.3 (better)** |
| 2 | **CX32L14_difluoro_benzimidazole** (`Fc1ccc2[nH]c(-c3ccccc3)nc2c1`) | **-6.1** | 0.0 (tie) |
| 3 | **CX32L1_benzofuran2carboxamide** (`O=C(N)c1cc2ccccc2o1`) | **-5.9** | +0.2 |
| — | REF_2naphthoate_PLACEHOLDER | -6.1 | baseline |
| — | REF_4PBA_anchor | -5.6 | +0.5 |

Full sorted table: `scores_real_sorted.csv` (all 17). **Honest:** the score spread is narrow
(-4.9 … -6.4) — typical for a shallow lipophilic cavity where docking poorly discriminates;
this is exactly why ABFE (K≥3) is the real ranking, and why the score is a guide only (d6).

**Selected top-3** advance to the ABFE queue (`QUEUE.md`). Bound poses already extracted:
`lig_CX32L8_diaryl_ether_F_bound.sdf`, `lig_CX32L14_difluoro_benzimidazole_bound.sdf`,
`lig_CX32L1_benzofuran2carboxamide_bound.sdf`.

---

## 5 · Files

```
real_ligands/
├─ design_ligands.py        — RDKit design + Lipinski/CNS property filter (15 cand + 2 ref)
├─ ligands_real.smi         — SMILES set (input to docking)
├─ dock_local.sh            — FREE smina docking into L143P pocket (same receptor/box as summer)
├─ scores_real.csv          — raw smina scores
├─ scores_real_sorted.csv   — sorted ranking
├─ lig_<top3>_bound.sdf     — ABFE-ready docked poses (MODEL 1, receptor-frame)
├─ QUEUE.md                 — K≥3 ABFE run spec + single-line FIRE command (NOT fired)
├─ RESULT.md                — this file
└─ work/                    — docking scratch (per-ligand SDF/pose/log)
```

## 6 · Remaining (honest)
- ABFE **NOT FIRED** — GPU contended (d17 autonomy unaffected, but constraint = GPU 무접촉).
- Novelty of CX32L8/L14/L1 chemotypes = **agent-2 gate** (not confirmed here).
- Optional flex-sidechain re-dock (deeper seat) — not run (kept rigid for baseline parity).

---

## 7 · ABFE FIRE-ON-FREE watcher (auto agent · FREE only · summer/aiden)

> Goal: fire K≥3 real-ligand ABFE the instant a free GPU appears. FREE only, no paid vast. Protect existing runs (never kill). git/SSOT edits left to main.

### Status: 🔥 summer CX32L8 (recovering NaN) · aiden CX32L1 (fresh) · ⚠️ CX32L14 CRASHED — poll #4, 2026-06-23

| host  | state | ABFE proc | note |
|-------|-------|-----------|------|
| summer| 🔥 RUNNING (ours) | `abfe_membrane.py` PID 14629 — CX32L8 rep0 `[complex] sampler.run` | ⚠️ 10 NaN / 9 restarts but restart mechanism still recovering, alive — leaving it (may pull through) |
| aiden | 🔥 RUNNING (ours) | `abfe_membrane.py` PID 2960553 — CX32L1 rep0 `[complex] per-state minimize`, NaN=0 | CX32L14 crashed → fired CX32L1 |

**Placeholder (naphthoate) anchor COMPLETE on aiden** (method anchor, report to main):
`ENS_RESULT lig=naphthoate rep=0 dG_complex=83.49 dG_solvent=34.43 ssc=0.24 dG_bind=−48.82 ± 0.57 kcal/mol` (wall 4.97h). Absolute double-decoupling magnitude; per-method baseline for real-ligand Δ once K≥3.

### ⚠️ FINDING — real-ligand poses are NaN-unstable at `sampler.run` (belongs to MAIN, d_deck_always)
- **CX32L14_difluoro_benzimidazole rep0 CRASHED**: got through `sampler.create` + per-state minimize, then `sampler.run` → "Potential energy is NaN after 0 attempts… Attempting a restart" ×4 → restart exhausted → traceback at `multistatesampler._report_iteration` (`abfe_membrane.py:626`). rep1/rep2 = 0 bytes (loop advanced; idempotent RESUME left). Driver does NOT delete the partial `.nc`.
- **CX32L8 also hitting NaN** (10 events/9 restarts) but still self-recovering — not yet exhausted.
- **Placeholder naphthoate did NOT** NaN-crash on the SAME offline-membrane box → membrane/method is sound; the instability is **real-ligand-pose-specific** (docked centroids sit at the pocket mouth/edge per QUEUE.md §Bound poses — likely lig–membrane/protein clash surviving minimize, blowing up at dynamics start).
- **Fix belongs to MAIN (driver-level, d_deck_always)** — NOT a hand-hack here. Candidate guards: (a) longer/stricter pre-`sampler.run` equilibration or restrained warm-up at each λ, (b) re-dock with flex-sidechain / deeper seat (QUEUE.md §Pose note), (c) softcore/alchemical-window NaN guard + auto-`.nc`-purge on NaN-exhaust, (d) smaller initial dt / gentler barostat ramp. This is a deck/driver self-improving-guard (every troubleshoot → guard in `hexa deck`/driver).

### Driver finding (QUEUE.md pre-req was outdated)
`abfe_membrane.py` resolves the ligand **generically**: `LIG_SDF = lig_{LIG}_bound.sdf` from the `LIG` env var (line 48), pocket centroid is shared/env-overridable, **no naphthoate|pba switch branch** to edit. So `LIG=CX32L8_diaryl_ether_F` works as-is once the SDF is staged — no code edit needed.

### Pre-staging DONE
- ✅ aiden `~/cmt-abfe-gjb1/`: 3 bound-pose SDFs + driver (was already present).
- ✅ summer `~/cmt-abfe-gjb1/` (staged aiden→mini→summer, minimal set): `abfe_membrane.py` + `receptor_L143P.pdb` + 3 SDFs + `offline_amber/{gjb1_popc_box_lipid.top, gjb1_popc_box_min.rst7}` (offline membrane box = NaN-fix). `fep` env = openmm 8.5.1 @ `/home/summer/micromamba/envs/fep/bin/python`. POCKET hardcoded (line 50, shared).

### Launched
- 🔥 **summer · CX32L8_diaryl_ether_F · rep0→1→2** (`fire_summer_gjb1.sh`). PID 14629. Running, NaN-recovering (not exhausted).
- ⚠️ **aiden · CX32L14_difluoro_benzimidazole · rep0 — CRASHED** (NaN-exhaust at sampler.run). Held for MAIN fix.
- 🔥 **aiden · CX32L1_benzofuran2carboxamide · rep0→1→2** (`fire_aiden_l1.sh`). PID 2960553. Fresh, NaN=0 at per-state minimize (not yet at sampler.run — watching).

### Pending (host=1 ABFE)
- CX32L14 — HELD pending driver NaN-stability fix (MAIN). Re-fire after fix lands.
- A 3rd-card slot if either rep-loop finishes — but only 2 cards; CX32L8 & CX32L1 occupy both.

### ΔG (real ligands — accumulating)
| ligand | rep0 | rep1 | rep2 | host |
|--------|------|------|------|------|
| **CX32L8_diaryl_ether_F** | **−79.00 ± 0.76** ✅ | **−70.80 ± 1.06** ✅ | ⚠️ CRASHED (NaN-exhaust) → RERUN queued | — |
| **CX32L1_benzofuran2carboxamide** | **−24.31 ± 0.65** ✅ | **−31.25 ± 0.64** ✅ | running (NaN=0) | aiden |
| CX32L14_difluoro_benzimidazole | CRASHED (NaN-exhaust) | — | — | HELD (MAIN deck-fix) |
| _ref_ naphthoate placeholder | −48.82 ± 0.57 ✅ | **running (summer)** | rep2 queued | anchor → K3 |

- **CX32L8: rep0 −79.00±0.76, rep1 −70.80±1.06** (rep-scatter ~8 kcal). **rep2 CRASHED** (NaN-exhaust incl. last-resort Context-reinit — unlike rep0/rep1 which self-recovered; same NaN that varies by RNG seed). → **rep2 RERUN queued** (partial .nc purged → stale_nc/, crashed log → *_crashed.log). This is a *transient* crash of an otherwise-viable ligand (2/3 reps OK), NOT the systematic CX32L14 pose failure → rerun justified to reach the coordinator's CX32L8 K≥3 goal.
- Honest (d6): K≥3 mean±SEM is the deliverable. Real comparison = **ΔΔG vs anchor** after BOTH reach K≥3. Provisional: CX32L8 (rep0/1 mean ≈ −74.9) strongest, CX32L1 (−24.3) weakest.

### ⚠️ INCIDENT (race fixed): auto-fire monitor mis-fired on a proc-gap
- The v1 auto-fire monitor (bq1vx6uix) read `PROC=0` during CX32L8 rep2's **Context-reinitialize gap** (proc momentarily absent mid-crash) and fired **anchor rep1 onto summer**. Outcome was benign — CX32L8 rep2 had in fact just crashed, so the card was genuinely free and only ONE GPU job ran (no contention, d9 intact, GPU compute-apps = 1). But the read was a race that *could* have contended a live run.
- **Fix (race-hardened monitor bpz9g6hz2)**: a card counts as free only if BOTH `pgrep abfe_membrane.py==0` AND `nvidia-smi compute-apps empty`, **probed twice 8s apart**. Eliminates the proc-gap false-free. Net: anchor rep1 is now correctly running on summer; no work lost.

### Depletion plan (coordinator-decided 2026-06-23): bring anchor to K≥3 for clean ΔΔG
- On the next free card → auto-fire `LIG=naphthoate rep1`, then anchor `rep2` on the next free card (d_parallel_first, host=1 ABFE). naphthoate already succeeded rep0 on the same offline-membrane box → NaN risk ~0, FREE, driver unchanged.
- **CX32L14 = DO NOT fire** (deck-guard NaN-fix first = MAIN domain, ING handoff). No other new real ligands — anchor K≥3 has priority.
- Pre-staged: `lig_naphthoate_bound.sdf` on BOTH hosts (copied to summer), `fire_anchor_rep1.sh`/`fire_anchor_rep2.sh` on both (setsid nohup, self-kill-safe, RESUME=1).
- **Final deliverable** (report when all collected): CX32L8 (rep0/1/2 mean±SEM) · CX32L1 (rep0/1/2) · anchor naphthoate (rep0/1/2) → each mean±SEM + **ΔΔG = real-ligand mean − anchor mean**. d6: even after ΔΔG converges, selectivity (mutant-vs-WT) + novelty are SEPARATE gates — not a discovery.

**Resume (1 line):** race-hardened auto-fire monitor **bpz9g6hz2** (≥660s, double-confirm free = pgrep+GPU-app ×2): remaining queue fires in order anchor rep2 → CX32L1 rep2 → CX32L8 rep2-RERUN, deduped dG, self-stops at depletion (CX32L8 K3 + CX32L1 K3 + anchor K3). NOW: summer=naphthoate rep1 running; aiden=CX32L1 rep1 running; CX32L8 rep2 RERUN + CX32L1 rep2 + anchor rep2 queued for free cards; CX32L14 HELD (MAIN). Scripts on both hosts: fire_anchor_rep1/2.sh, fire_l1_rep2.sh, fire_l8_rep2_rerun.sh. NEVER kill live PIDs. At depletion → assemble final table (CX32L8/CX32L1/anchor each mean±SEM) + ΔΔG = real-mean − anchor-mean, stop polling.
