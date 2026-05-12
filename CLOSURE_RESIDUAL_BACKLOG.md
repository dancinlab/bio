# CLOSURE_RESIDUAL_BACKLOG.md

**Created**: 2026-05-12 (cycle-30) · **Last sync**: 2026-05-12

> The closure-grade table in [`README.md`](README.md) and §1 of
> [`AXIS_CLOSURE_PLAN.md`](AXIS_CLOSURE_PLAN.md) reports a v1.x percentage per axis.
> That percentage measures **category (a) only** — in-repo software work this repo
> can close by itself. To answer "is 100% closure possible?" you need to split the
> residuals by category, because a 2% category (a) gap and a 2% category (c) gap
> look identical in percent but mean very different things.
>
> This file is the **single-source enumeration** of the residual work by category,
> with concrete next actions and the external handoff destination where one exists.
>
> Cross-links: [`.roadmap.lean4_formal`](.roadmap.lean4_formal) (single-source for
> (b) formal-axis items), [`.roadmap.clinical_translation_pathway`](.roadmap.clinical_translation_pathway)
> (Stage 0-12 wet-lab plan), [`.roadmap.quantum_hw_adoption_ladder`](.roadmap.quantum_hw_adoption_ladder)
> (Tier 0/1 quantum HW adoption).

---

## §0 Residual category legend (verbatim from AXIS_CLOSURE_PLAN.md §0)

- **(a) in-repo software** — closeable by code/test work in this repo; **counts against v1.x closure-grade**. **100% reachable in days.**
- **(b) v2 formal semantics / cycle-30++ stretch** — Lean / Mathlib full-WEAVE-algebra work; v1.x cert surrogate = `raw_91_c3_disclose:MVP_caveat`; **deferred to v2.0.0 by design** — does NOT subtract from v1.x. **100% requires significant design work (cycle 30++).**
- **(c) out-of-software-scope** — wet-lab / IP / hardware adoption; handed off via sister-repo / canonical / external-vendor channels. **100% IMPOSSIBLE in software — only closeable via external execution** (wet-lab CRO, patent filing, quantum-vendor procurement, etc.).

---

## §A — Category (a) in-repo software residuals (~days to close)

These are the only items that count against v1.x closure-grade. List below is the
exhaustive set as of cycle-30; closing all of them lifts v1.x to **~100% (a)**.

### A1. ribozyme — "minor robustness only"

The closure-table tag (per `.roadmap.ribozyme` line 123 and AXIS_CLOSURE_PLAN.md
line 125) reads literally "잔여 = 소소 robustness only (no v1.x closure blocker)".
Concrete items behind that catch-all:

- **A1.1** F-RB robustness sweep — ✅ **CLOSED 2026-05-12 cycle-30**. Landed
  `selftest/ribozyme_a1_1_kinetics_perturbation_sweep.py` (stdlib-only;
  sentinel `__RIBOZYME_A1_1_KINETICS_PERTURBATION__ PASS`). 11 perturbations
  (baseline + 4 constants × ±10% + all+10%/all-10%) over `k_minus1`,
  `k_minus2`, `k3`, `K1_2nd_order`; log10 Eigen-Hammes margin range
  [4.04, 4.12] ≫ 2.0 decisive floor; F-RB-4 6/6 PASS per perturbation;
  determinism re-evaluation byte-identical. Wired into `selftest/run_all.sh`.
  raw_91 honest C3: ribozyme curated corpus is n=30 (the "n=60" in the
  original line is the *nanobot* corpus); the kinetics simulator implements
  one canonical hammerhead-minimal model, so the perturbation is over the
  simulator's rate-constants (analytic re-evaluation of the algebraic
  rate-law), not over corpus rows. "log_bf" is interpreted as the log10
  Eigen-Hammes margin — the kinetics-side decisive metric.
- **A1.2** off-target threshold replay — ✅ **CLOSED 2026-05-12 cycle-30**.
  Landed `selftest/ribozyme_a1_2_offtarget_threshold_replay.py` (stdlib-only;
  sentinel `__RIBOZYME_A1_2_OFFTARGET_THRESHOLD_REPLAY__ PASS`). Reads the
  vendored `ribozyme/spec/gencode_v47_offtarget_risearch2_summary.json`,
  recomputes PASS/FAIL per query via 3 thresholds
  (n_strong ≤ 100 ∧ n_critical ≤ 10 ∧ n_total ≤ 1000), asserts agreement
  with the stored `screen_verdict`. 6/6 queries agree; 3 PASS + 3 FAIL
  records ⇒ non-tautology guard satisfied. RIsearch2 is NOT re-run.
  raw_91 honest C3: this is a *summary-consistency gate* (catches edit
  drift between numbers and verdict), not an independent threshold
  derivation; thresholds are post-hoc calibrated to reproduce the
  recorded labels.
- **A1.3** Nussinov MFE determinism stress test — ✅ **CLOSED 2026-05-12 cycle-30**.
  Landed `selftest/ribozyme_a1_3_nussinov_determinism_stress.py`
  (stdlib-only; sentinel `__RIBOZYME_A1_3_NUSSINOV_DETERMINISM_STRESS__ PASS`).
  10 perturbations covering length (12/16/20/24 nt), GC content
  (low ~0% / mid ~50% / high ~82%), and hairpin position (5′ / centre /
  3′). Per-input checks: byte-identical determinism (2 consecutive calls),
  length match, balanced parens, pair-set ⊆ {AU,UA,GC,CG,GU,UG}, min
  hairpin loop ≥ 3 nt. Plus cross-invocation determinism (10-input sweep
  re-run identical). 11/11 PASS. Wired into `selftest/run_all.sh`.

**Outcome**: ribozyme `잔여 = 소소 robustness only` → ✅ **CLEARED in-repo
2026-05-12 cycle-30**. ribozyme v1.x (a) → **100%**.

### A2. virocapsid — sandbox independence (single non-(a) item now closed)

After cycle-30 (F-VIROCAPSID-1-c + 1-d CLOSED, `__VIROCAPSID_F1C_F1D__ PASS`),
the only remaining table tag is:

- **A2.1** "sandbox 평준화" — ✅ **CLOSED in-repo 2026-05-12 cycle-30**.
  `virocapsid/module/zlotnick_ode.py` — pure-stdlib mean-field Zlotnick 1999
  cascade ODE with explicit-Euler integration; N=12 σ(6)-pentamer model;
  `--selftest` / `--t-number` / `--emit-json` CLI; **15/15 PASS** (T=1/3/4
  yield ≈ 0.76 smoke, mass conservation 2.7e-15 = machine epsilon, determinism
  byte-identical). raw_91 honest C3: this is the substrate + smoke gate
  (yield∈[0,1] + mass conserves + non-trivial dynamics + determinism), NOT a
  calibration to specific experimental yields (≥0.85 calibration remains
  `calibration.hexa` + `multi_t_calibration.hexa` responsibility). Wired into
  `selftest/run_all.sh` (`virocapsid_zlotnick_ode`). Sentinel
  `__VIROCAPSID_ZLOTNICK_ODE_CLI__ PASS`. AXIS_CLOSURE_PLAN.md L168 row flipped
  from "🟡 shared bridge" to ✅ CLOSED.

**Outcome**: virocapsid ✅ **100% (a) — all in-repo software residuals closed.**

### A3. weave — clean

Currently 100% (a). No items.

### A4. nanobot — clean

The 2% gap is entirely category (c) (wet-lab / IP) — see §C. No (a) items.

### A5. quantum — clean (after cycle-30)

The 5% gap is entirely category (b) (v2 lean4 / MechVerif frozen) — see §B.
No (a) items remaining post cycle-30.

### A — Summary

| Item | Owner | Effort | Closeable in v1.x | Status |
|------|-------|--------|-------------------|--------|
| A1.1 ribozyme kinetics ±10% sweep | hexa-bio | 0.5 d | ✅ | ✅ CLOSED 2026-05-12 cycle-30 |
| A1.2 off-target threshold replay | hexa-bio | 1 h | ✅ | ✅ CLOSED 2026-05-12 cycle-30 |
| A1.3 Nussinov determinism stress | hexa-bio | 0.5 d | ✅ | ✅ CLOSED 2026-05-12 cycle-30 |
| A2.1 virocapsid Zlotnick CLI independence | hexa-bio | 1 d | ✅ | ✅ CLOSED 2026-05-12 |
| **Total to (a)-100%** | — | **0 days remaining — ✅ (a) 100% REACHED 2026-05-12 cycle-30** | — | A1.1/A1.2/A1.3 + A2.1 ✅ |

---

## §B — Category (b) v2 formal semantics / cycle-30++ stretch

These items are tracked in [`.roadmap.lean4_formal`](.roadmap.lean4_formal) §3
(single source of truth) and `.roadmap.virocapsid` for V-R2. v1.x cert surrogate
is the `raw_91_c3_disclose:MVP_caveat` block. **Not v1.x blockers** — but
listing here for cycle-30++ planning visibility.

### B1. WEAVE-semantics v2 (full algebra) — 4 axes, hexa-meta

Quoted from `.roadmap.lean4_formal` §3. Active: `~/core/hexa-meta/formal/lean4/`.

- **B1.1** F-CL-FORMAL-2 Landauer monotonicity — ✅ **CLOSED v2 cycle-30+++**
  (hexa-meta `2c68bea`) and ✅ **PROMOTED v2 → v3 2026-05-12 cycle-30++++**
  (hexa-meta `9e44e75`). v2: `Strategy.heat : ℝ`, `LandauerPass` against
  `kT · Real.log 2` Landauer floor, `ComposeMode {seq | merge}`. v3:
  kT now opaque positive ℝ via section variable + `[Fact (0 < kT)]`
  instance (was hard-coded `kT := 1` in v2); all 3 bonus theorems
  (`landauer_pass_compose`, `landauer_pass_merge`,
  `landauer_pass_heat_nonneg`) thread kT through with byte-identical
  proof bodies; compose/merge get `omit hkT in` to silence
  unused-section-variable linter. Added `Mathlib.Logic.Basic` for `Fact`.
  v4 stretch: parametrise the energy substrate (`[OrderedAddCommGroup E]`
  instead of `ℝ`) + algebra-derived cancellation.
- **B1.2** F-CL-FORMAL-3 Π^p_2 verifier termination — ✅ **CLOSED v2 cycle-30+++**
  (hexa-meta `2c68bea`) and ✅ **PROMOTED v2 → v3 2026-05-12 cycle-30+++++**
  (hexa-meta `2680f88`). v2: closed-form upper bound `c.size * 2^q.depth
  + q.payload`. v3: RECURSIVE — `verifierStepsRec sz d p := match d with |
  0 => sz + p | d+1 => 2 * verifierStepsRec sz d p` (structural recursion
  on depth Nat). Termination by Lean's automatic `Nat.rec`
  well-foundedness (no explicit `WellFoundedRelation` instance needed).
  Closed-form characterisation `verifierStepsRec sz d p = 2^d * (sz + p)`
  kernel-checked by induction + `Nat.pow_succ` + `ring`. Bonus theorems
  re-proved through closed-form: `verifierStepsRec_closed_form`,
  `verifierSteps_mono_depth`, `two_pow_pos`, **NEW `verifierSteps_ge_v2_bound`**
  (kernel-checks v3 cost ≥ v2 closed-form bound — v3 is strictly more
  pessimistic, multiplies payload work at every alternation level).
  Theorem witness updated to `2 ^ q.depth * (12 + q.payload)` (exact v3
  recursive cost on cat.size=12). Mathlib imports added: `Tactic.Linarith`,
  `Tactic.Ring`. v4 stretch: arbitrary measure function via
  `WellFoundedRelation`/`Prod.lex` for verifiers whose decreasing measure
  is not depth alone.
- **B1.3** F-CL-FORMAL-4 ClosureCert idempotence — ✅ **CLOSED v2 cycle-30++**
  (hexa-meta `350798c`/`79bb661`) and ✅ **PROMOTED v2 → v3 2026-05-12
  cycle-30++++** (hexa-meta `9e44e75`). v2: `ClosureCert` with `Finset Nat`
  caveat-bag/signer-set + seal-on-first-disclosure snapshots; idempotence
  by case-split on `disclosed`. v3: `structure ClosureCert (α : Type)
  [DecidableEq α]` — all 4 Finset fields polymorphic (`Finset α`);
  `payload`/`disclosed` unchanged. All 5 theorems re-proved with
  byte-identical proof bodies — `[DecidableEq α]` typeclass propagates
  through `simp`/`Finset.insert` without tactic adjustments. v4 stretch:
  parametrise caveat payload semantics (`[CommutativeMonoid β]`).
- **B1.4** Mathlib build infra — ✅ **DONE 2026-05-12 cycle-30++**. Mathlib
  pinned at SHA `f8e537424d154a7eaa025c4abab16c96c626f2e0` via
  `~/core/hexa-meta/formal/lean4/lake-manifest.json` (now committed, not
  gitignored). Cache prefetch via `lake exe cache get` succeeded — 8047/8403
  oleans downloaded from Azure (99% hit rate), saved the cold ~hour build.
  Total mathlib disk: 6.6 GB at `.lake/packages/mathlib` (gitignored).

**Updated work order**: ~~Mathlib → B1.3 → B1.1 → B1.2~~ ✅ **v2 ALL DONE
cycle-30+++**, ~~B1.3 v3 → B1.1 v3 → B1.2 v3~~ ✅ **v3 ALL DONE 2026-05-12
cycle-30++++ + cycle-30+++++**: Axes 2 + 4 (`9e44e75`, cycle-30++++) +
Axis 3 (`2680f88`, cycle-30+++++ — the last v3 axis, completing the
promotion ladder). 1919/1919 jobs PASS via `lake build N6` in hexa-meta.
v4 stretches per axis tracked in `.roadmap.lean4_formal` §3 for
cycle-30++++++ — **not v1.x or v2.0.0 blockers**.

### B2. MechVerif legacy — FROZEN at canon retirement

Location: `~/core/nexus/canon-infra/legacy-canon/lean4-n6/N6/MechVerif/`. Read-only
snapshot of canon@mk1 at retirement 2026-05-11.

- **B2.1** ~15 `sorry` placeholders across AX2 / MKBridge / Foundation/Axioms.
- **B2.2** ~28 named axioms (documented Robin / Hardy-Wright-style assumed facts).

**Status**: Both B2.1 and B2.2 are **FROZEN — no resumption planned** in legacy-canon.
Re-opening would require porting MechVerif into hexa-meta and re-deciding which named
axioms to retain vs prove. Effort: weeks-to-months if resumed.

### B3. n=6 Theorem B legacy — ~2 sorries remaining

Location: `~/core/nexus/canon-infra/legacy-canon/lean4-n6/N6/TheoremB_*.lean`. ~4473
lines, ~99.99% coverage. FROZEN.

- **B3.1** ~2 remaining `sorry` lines (precise location: capstone or one of the
  ω(n)≥3 sub-cases; reading the legacy file would identify). Effort: small if
  re-opened in a successor repo, but **FROZEN** — not currently planned.

### B4. virocapsid V-R2 multi-T stretch

- **B4.1** Multi-T generalization T=7 / T=13 / T=21 — ✅ **CLOSED 2026-05-12
  cycle-30+++**. `virocapsid/module/zlotnick_ode.py` `T_DEFAULTS` extended
  with T=7 (k_a=25, k_d=1.0, t_end=120), T=13 (k_a=12, k_d=1.5, t_end=180),
  T=21 (k_a=8, k_d=2.0, t_end=240) entries. Pentamer-level N=12 cascade
  preserved (σ(6)=12 invariant pentameric vertices across all T). Rate
  constants chosen from literature trend: T=7 ~ HK97-class (slower
  nucleation than T=4 per Endres & Zlotnick 2002; Hagan & Elrad 2010
  PMC2849049); T=13 ~ bluetongue/reovirus scaffold-templated assembly
  (Patel & Roy 2014 PMC4147694); T=21 extrapolated from T=13 trend.
  Selftest **30/30 PASS** (4 smoke × 6 T-numbers + 3 determinism × 2
  re-runs covering T=1 baseline + T=21 longest-integration stretch):
  yields T=1/3/4 = 0.7587, T=7 = 0.8725, T=13 = 0.7794, T=21 = 0.6693
  (all ∈ [0,1]); mass conservation 2.7e-15 ... 1.9e-14 (machine
  epsilon); determinism byte-identical across re-runs. raw_91 honest
  C3: T=21 rate-constants are extrapolation from T=13 (no wet-lab T=21
  reference exists for icosahedral series; T=21 with (h,k)=(4,1) per
  Caspar-Klug h²+hk+k² is mathematically valid but rare in vivo). The
  pentamer-level mean-field model is invariant in σ(6)=12 across T but
  does NOT capture T-specific hexamer dynamics or scaffold templating —
  those would need an explicit two-species (pent + hex) ODE, which is
  out of scope for this independent substrate. This is a *substrate-
  level extension* (yield∈[0,1] + mass conserves + non-trivial dynamics
  + determinism for 6 T-numbers), NOT a calibration to T=7/13/21
  experimental yields. **Category (b)** because this was a
  formal-coverage stretch, not an in-repo bug — closed in-repo by
  extending the substrate's T-number parameter space.

### B — Summary

| Item | Source | Effort | Note |
|------|--------|--------|------|
| B1.1 F-CL-FORMAL-2 v2 + v3 (Landauer ℝ + kT parametric) | hexa-meta `2c68bea` (v2) + `9e44e75` (v3) | ~200 LOC | ✅ **v2 CLOSED cycle-30+++**, ✅ **v3 CLOSED cycle-30++++** |
| B1.2 F-CL-FORMAL-3 v2 + v3 (exp-in-depth → recursive `verifierStepsRec`) | hexa-meta `2c68bea` (v2) + `2680f88` (v3) | ~130 LOC | ✅ **v2 CLOSED cycle-30+++**, ✅ **v3 CLOSED cycle-30+++++** |
| B1.3 F-CL-FORMAL-4 v2 + v3 (payload disclosure + polymorphic α) | hexa-meta `350798c`/`79bb661` (v2) + `9e44e75` (v3) | ~150 LOC | ✅ **v2 CLOSED cycle-30++**, ✅ **v3 CLOSED cycle-30++++** |
| B1.4 Mathlib SHA-pin + first cold build | hexa-meta lake-manifest.json | done 1 d | ✅ **DONE 2026-05-12 cycle-30++** (SHA pinned, 8047 oleans cached) |
| B2.1 MechVerif ~15 sorries | legacy-canon | weeks | FROZEN |
| B2.2 MechVerif ~28 named axioms | legacy-canon | weeks | FROZEN |
| B3.1 Theorem B ~2 sorries | legacy-canon | small | FROZEN |
| B4.1 virocapsid V-R2 T=7/13/21 | `virocapsid/module/zlotnick_ode.py` T_DEFAULTS | done 0.5 d | ✅ **CLOSED 2026-05-12 cycle-30+++** (30/30 PASS; T=21 raw_91 extrapolation caveat documented) |
| **(b) v2.0.0 promotion total** | — | 0 days remaining on cycle-30+++++ items — ✅ **B1.1 v3 + B1.2 v3 + B1.3 v3 + B1.4 + B4.1 ALL CLOSED; ALL 4 axes at max semantics; only v4 stretches deferred to cycle-30++++++** | excludes FROZEN B2/B3 + cycle-30++++++ v4 stretch |

---

## §C — Category (c) out-of-software-scope (handoff destinations)

**These cannot be closed in software.** What we can do here is enumerate the
items and the destination (sister repo / external API / vendor) where each
hands off. If a destination doesn't yet exist, that's flagged as "DEST: none yet".

### C1. nanobot wet-lab / IP (the 2% in the closure table)

From AXIS_CLOSURE_PLAN.md line 149 / 151 and the N-R2 row:

- **C1.1** Wet-lab integration — DNA-origami fabrication + cycle work (50 kT actuation)
  + AFM/cryo-EM verification. **DEST: none yet.** canon@mk1 hosted the
  `raw_77_therapeutic_nanobot_l7_acceptance_v1` placeholder but canon RETIRED
  2026-05-11. **Action needed**: select a wet-lab partner / CRO; provisional
  handoff target = a future `hexa-medic` or new `hexa-pharma-handoff` repo.
- **C1.2** IP / contract review — patent landscape for the 12-vertex actuator
  geometry + L7-L9 acceptance contract (drug_load_v1 / immune_evasion_v1 /
  biodistribution_v1, currently drafted in `nanobot/spec/proposed_l7_l9_witness_schemas/`).
  **DEST: none yet.** Legal / IP advisor selection needed.
- **C1.3** L7-L9 schema canon adoption — the 3 consumer-proposed schemas were
  drafted by hexa-bio 2026-05-12 with the expectation that "canon adopts → canonical
  copy moves to `canon/domains/life/therapeutic-nanobot/spec/`". canon is RETIRED.
  **DEST: TBD** — likely hexa-meta or a successor repo for the canonical contract.

### C2. ribozyme in-vitro confirmation

The catch-all "소소 robustness" line in §A1 is software; the in-vitro side is (c):

- **C2.1** Hammerhead 4-state kinetics — in-vitro `k_cat ≈ 0.6/min` confirmation
  with the actual 12-nt ribozyme synthesized (current evidence: literature TST
  model). **DEST: none yet.** Wet-lab partner needed.
- **C2.2** Off-target empirical validation — RIsearch2 v2.1 GENCODE v47 screen
  is the in-silico prediction; empirical RNA-seq off-target measurement is (c).
  **DEST: none yet.**

### C3. virocapsid cryo-EM / cell biology

After F-VIROCAPSID-1-c/-d closed in cycle-30, the only remaining (c) items are:

- **C3.1** Independent cryo-EM verification of a designed-VLP candidate (39 of
  the n=527 VIPERdb entries are designed; an in-house cryo-EM run on a hexa-bio
  novel candidate would close the loop). **DEST: none yet.**
- **C3.2** Cell-based assembly assay — in-vitro Zlotnick rate constants vs
  measured kinetics. **DEST: none yet.**

### C4. quantum substrate — DEST: qmirror (sister repo, live)

**Re-classification 2026-05-12 cycle-30**: the quantum substrate handoff target
is **NOT IBM Quantum / IonQ / Quantinuum cloud APIs** — it is the sister repo
**`dancinlab/qmirror`** (locally `~/core/qmirror`). qmirror is a
statistically-real-QPU-equivalent ≤30-qubit substrate combining ANU QRNG (real
quantum entropy, 4-tier fallback) + Aer-compatible pure-hexa state-vector kernel
+ chemistry / molecular VQE. v2.1.0 — **14/14 closure conditions PASS**
including cond.14 (H2 STO-3G / 0.74Å sub-µHa via UCCSD + active-space CASCI).
qmirror is **continuously updated** on its own Phase 1..N cadence; hexa-bio
depends on it as a CLI dependency, not by wrapping or shadow-copying. See
[`AGENTS.md`](AGENTS.md) "Sister repositories — live dependencies" for the rule
("CLI integration over Python wrappers").

- **C4.1** NISQ substrate — **DEST: qmirror v2.1.0 (LIVE)**. Already available
  on this host at `~/core/qmirror/`; closure 14/14 PASS upstream. Hexa-bio
  integration gate: `selftest/qmirror_chemistry_vqe_gate.sh` (CLI-direct
  invocation of `hexa run ~/core/qmirror/chemistry_vqe/module/chemistry_vqe.hexa
  --selftest`; PASS / SKIP / FAIL semantics; wired into `selftest/run_all.sh`).
  No vendor API procurement / budget allocation needed. Status (2026-05-12):
  qmirror reachable, `hexa` runtime dispatch server currently offline on dev
  host → gate SKIPs gracefully; PASS will flip automatically when the runtime
  is reachable (or in CI).
- **C4.2** Mpro pocket VQE + 5-warhead library migration — current state:
  `tests/mpro_pocket_vqe_v7.py` + `tests/mpro_warhead_library_vqe_v7.py` use
  `~/.hexabio_venv` qiskit/aer/nature/pyscf directly (the IBM stack). Path
  forward: **DEST: qmirror chemistry_vqe extension** — qmirror's chemistry_vqe
  module currently covers H2 STO-3G; extending it to Mpro pocket clusters
  (2-qubit, sub-µHa already) and the 5-warhead library (small) is a qmirror-side
  task. Hexa-bio's role = call qmirror via CLI when the upstream extension
  lands; **no in-hexa-bio re-implementation**. This item moves from "(c)
  out-of-software-scope" to **"(c) DEST-known, awaiting upstream qmirror
  extension"**.
- **C4.3** Fault-tolerant horizon — qmirror's substrate caps at ≤30 qubit. For
  >30-qubit fault-tolerant workloads (PsiQuantum 10-year photonic / Google
  Willow post-threshold error correction), qmirror is NOT a substitute. **DEST:
  vendor partnership, not procurement** — but this is a 10-year horizon item
  and not on the v1.x or v2.0.0 roadmap. Most of hexa-bio's current quantum
  work (Mpro pocket, 5-warhead library) is ≤30 qubit, so qmirror covers it.

### C5. Clinical translation pathway (Stage 0-12)

This is the umbrella for ALL (c) items above when looked at from the drug-pipeline
side. Already tracked in `.roadmap.clinical_translation_pathway`:

- **C5.1** Stage 2 (wet-lab synthesis): **DEST: CRO selection** — currently 0
  compounds synthesized for the 200-disease × 200-hxq-* catalog.
- **C5.2** Stage 3-5 (biochem / cell / animal): **DEST: research-org partnership.**
- **C5.3** Stage 6-8 (IND / Phase 1-3): **DEST: regulatory channel** (FDA / 식약처).

### C — Handoff destination matrix

| Item | Type | Sister repo | External API / vendor | Status |
|------|------|-------------|----------------------|--------|
| C1.1 nanobot wet-lab | CRO/wet-lab | hexa-medic? | none selected | DEST: none yet |
| C1.2 nanobot IP | legal | none | patent counsel | DEST: none yet |
| C1.3 L7-L9 canonical contract | spec adoption | hexa-meta? | n/a | DEST: TBD |
| C2.1 ribozyme in-vitro | wet-lab | hexa-medic? | none selected | DEST: none yet |
| C2.2 off-target empirical | wet-lab | none | RNA-seq CRO | DEST: none yet |
| C3.1 virocapsid cryo-EM | wet-lab | none | cryo-EM facility | DEST: none yet |
| C3.2 cell-based assembly | wet-lab | none | cell-bio CRO | DEST: none yet |
| C4.1 quantum NISQ substrate | quantum runtime | **`dancinlab/qmirror`** | n/a (CLI-direct via `hexa run`) | ✅ **DEST: qmirror v2.1.0 LIVE** — gate `selftest/qmirror_chemistry_vqe_gate.sh` SKIPs on this host (runtime dispatch offline); PASS on CI |
| C4.2 Mpro VQE migration | qmirror extension | **`dancinlab/qmirror`** | n/a | ✅ DEST: qmirror upstream task (extend chemistry_vqe to Mpro pocket + warhead library); hexa-bio calls via CLI |
| C4.3 fault-tolerant horizon (>30 qubit) | HW partnership | none (out of qmirror scope) | PsiQuantum / Google | DEST: 10-year horizon, not v1.x / v2.0.0 |
| C5.1-5.3 clinical pipeline | clinical | hexa-medic? | CRO / FDA / 식약처 | DEST: roadmap only |

**Observation (updated 2026-05-12 cycle-30)**: **2 of 11 (c) items now have a
LIVE destination** (C4.1 + C4.2 → sister repo `dancinlab/qmirror`, CLI-direct
integration; gate landed in `selftest/qmirror_chemistry_vqe_gate.sh`); **7 of 11
remain DEST: none yet** (wet-lab CRO, IP counsel, regulatory channels — software
side is ready, external counterparty selection pending); **2 of 11 are
permanently external** (C4.3 fault-tolerant HW partnership, 10-year horizon).
Closing the remaining 7 is a procurement / partnership / regulatory task — not a
software task. Software's job is to keep handoff surfaces clean and to invoke
sister-repo CLIs (qmirror-style) when one exists.

---

## §D — Roll-up

| Category | Items | Effort to 100% | v1.x closure-grade impact |
|----------|-------|----------------|---------------------------|
| (a) in-repo software | 4 ✅ **ALL CLOSED 2026-05-12 cycle-30** — A1.1/A1.2/A1.3 + A2.1 | 0 days remaining — ✅ (a) **100% REACHED** | YES — all (a) gaps now closed |
| (b) v3 formal semantics | 8 (5 active: ✅ ALL DONE cycle-30++/+++/++++/+++++ — B1.1 v3 + B1.2 v3 + B1.3 v3 + B1.4 + B4.1 V-R2 multi-T; + 3 FROZEN MechVerif/Theorem-B) | 0 days remaining on cycle-30+++++ items — ✅ **ALL 4 axes at max semantics + V-R2 stretch COMPLETE; only v4 stretches per axis deferred to cycle-30++++++** | NO direct — but v2.0.0 GATE-26-2 cert-strength now SIGNIFICANTLY EXCEEDED across all 4 axes |
| (c) out-of-software-scope | 11 (2 ✅ DEST: qmirror LIVE — C4.1/C4.2; 7 DEST: none yet — wet-lab/IP; 2 permanently external — C4.3 fault-tolerant + C5.x clinical) | ∞ (external execution, software ready) | NO — handed off |
| **Total** | **23** | — | — |

**Honest reading** of "100% closure 가능?":

- **(a)** ✅ **DONE 2026-05-12 cycle-30** — all 4 items CLOSED in-repo
  (A1.1/A1.2/A1.3 ribozyme robustness + A2.1 virocapsid Zlotnick ODE CLI).
  All 4 sentinels wired into `selftest/run_all.sh`. **v1.x (a) = 100%.**
- **(b)** ✅ **5 active items DONE 2026-05-12 cycle-30++/+++/++++/+++++** —
  ✅ **ALL 4 WEAVE-mechanical axes now at maximum semantics**: Axis 1 REAL
  (`σ(6)=12` by `rfl`), Axis 2 v3 (kT parametric via `[Fact (0 < kT)]`,
  hexa-meta `9e44e75`), Axis 3 v3 (recursive `verifierStepsRec` via Nat
  structural recursion + closed-form `2^d · (sz + p)`, hexa-meta `2680f88`),
  Axis 4 v3 (polymorphic `ClosureCert (α) [DecidableEq α]`, `9e44e75`).
  PLUS B4.1 virocapsid V-R2 multi-T stretch (T=7/13/21 added to
  `zlotnick_ode.py`; 30/30 PASS). hexa-meta `lake build N6` → 1919/1919
  jobs PASS, sorry_count=0 across all 5 modules. Only v4 stretches per
  axis remain (energy substrate, recursive measure, payload monoid),
  tracked in `.roadmap.lean4_formal` §3 for cycle-30++++++ — **not v1.x
  or v2.0.0 blockers**. The 3 FROZEN items (MechVerif sorries + Theorem
  B sorries) remain documented but separate: re-opening legacy-canon is
  a deliberate decision, not a closure dependency.
- **(c)** NO in software (per category definition) — but the picture improved
  on 2026-05-12 cycle-30: **2 of 11 items now have a LIVE destination** at
  sister repo `dancinlab/qmirror` (C4.1 NISQ substrate + C4.2 Mpro VQE
  migration; CLI-direct gate landed in `selftest/qmirror_chemistry_vqe_gate.sh`).
  **7 of 11 remain DEST: none yet** (wet-lab CRO, IP counsel, regulatory
  channels). **2 of 11 are permanently external** (C4.3 fault-tolerant >30
  qubit, C5.x clinical translation). Software's job: keep handoff surfaces
  clean and invoke sister-repo CLIs (qmirror-style) when one exists. Do NOT
  reimplement sister repos in-tree.

---

## §E — Self-update protocol

When an item lands or is re-scoped, update both this file AND the source-of-truth
file for that category:

- **(a)** → update `AXIS_CLOSURE_PLAN.md` row + (if a test landed) `selftest/run_all.sh`.
- **(b)** → update `.roadmap.lean4_formal` §1 status table FIRST, then this file.
- **(c)** → update `.roadmap.clinical_translation_pathway` or
  `.roadmap.quantum_hw_adoption_ladder` (whichever owns the item), then this
  file (especially the DEST column).

raw_91 honest C3: this file is a *plan*, not a verification artefact. It does
not change any closure-grade percentage; it makes the residual structure honest
so the percentage is interpretable.
