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

- **A1.1** F-RB robustness sweep — re-run the 4-state kinetics sim across the n=60
  curated corpus and check `log_bf` distribution stays decisive under ±10% rate-
  constant perturbation. Owner: hexa-bio session. Effort: ~half-day.
- **A1.2** off-target screen edge-case audit — `gencode_v47_offtarget_risearch2_summary.json`
  is summary-vendored; an in-repo selftest replaying the threshold logic on the
  vendored summary (not re-running RIsearch2 itself) would add a robustness gate.
  Effort: ~1 hour.
- **A1.3** Nussinov MFE determinism stress test — current self-check is 7/7 PASS;
  extending to 10 input perturbations (length / GC-content / hairpin position)
  would close the "robustness" catch-all. Effort: ~half-day.

**Outcome if all three land**: ribozyme `잔여 = 소소 robustness only` → cleared.
ribozyme v1.x (a) → 100%.

### A2. virocapsid — sandbox independence (single non-(a) item now closed)

After cycle-30 (F-VIROCAPSID-1-c + 1-d CLOSED, `__VIROCAPSID_F1C_F1D__ PASS`),
the only remaining table tag is:

- **A2.1** "sandbox 평준화" (AXIS_CLOSURE_PLAN.md line 166) — virocapsid sandbox
  currently shares `~/core/nexus/sim_bridge/weave/` ODE with the weave axis;
  carving an independent Zlotnick ODE wiring at `virocapsid/module/zlotnick_ode.py`
  + CLI selftest is the "🟡 shared bridge" → ✅ flip. Cycle-28+ tag in the plan.
  Effort: ~1 day.

**Outcome if A2.1 lands**: virocapsid ~100% (a) (already; the tag is a 🟡 not a %
deduction).

### A3. weave — clean

Currently 100% (a). No items.

### A4. nanobot — clean

The 2% gap is entirely category (c) (wet-lab / IP) — see §C. No (a) items.

### A5. quantum — clean (after cycle-30)

The 5% gap is entirely category (b) (v2 lean4 / MechVerif frozen) — see §B.
No (a) items remaining post cycle-30.

### A — Summary

| Item | Owner | Effort | Closeable in v1.x |
|------|-------|--------|-------------------|
| A1.1 ribozyme kinetics ±10% sweep | hexa-bio | 0.5 d | ✅ |
| A1.2 off-target threshold replay | hexa-bio | 1 h | ✅ |
| A1.3 Nussinov determinism stress | hexa-bio | 0.5 d | ✅ |
| A2.1 virocapsid Zlotnick CLI independence | hexa-bio | 1 d | ✅ |
| **Total to (a)-100%** | — | **~2.5 days** | — |

---

## §B — Category (b) v2 formal semantics / cycle-30++ stretch

These items are tracked in [`.roadmap.lean4_formal`](.roadmap.lean4_formal) §3
(single source of truth) and `.roadmap.virocapsid` for V-R2. v1.x cert surrogate
is the `raw_91_c3_disclose:MVP_caveat` block. **Not v1.x blockers** — but
listing here for cycle-30++ planning visibility.

### B1. WEAVE-semantics v2 (full algebra) — 4 axes, hexa-meta

Quoted from `.roadmap.lean4_formal` §3. Active: `~/core/hexa-meta/formal/lean4/`.

- **B1.1** F-CL-FORMAL-2 Landauer monotonicity — Strategy = ordered list of strand
  ops with parallel/sequential composition tags; `compose` = sub-additive under
  reversible re-merge; `heatConsumed` = ℝ-valued integration. Mathlib lemmas:
  `Real.log` monotonicity, `Order.Monotone`. Effort: 200-500 LOC + tactic refinement.
- **B1.2** F-CL-FORMAL-3 Π^p_2 verifier termination — explicit ∀∃ formula structure
  + recursive `verifierSteps` with branching factor (exponential-in-`q.depth`)
  + well-founded induction proof on `(catalogue_size, query_depth)` lex-order.
  Mathlib: `WellFoundedRelation`, `Nat.lt_wfRel`, `Finset.recOn`. Effort: 200-500 LOC.
- **B1.3** F-CL-FORMAL-4 ClosureCert idempotence — full disclosure record
  (timestamp, cycle, raw_91 tags, cumulative metadata, caveat-bag, signer-set)
  + `discloseOnce` = idempotent metadata-merging with caveat-bag invariance +
  signer-set monotonicity. Effort: 200-500 LOC.
- **B1.4** Mathlib build infra — pin Mathlib by SHA (not `master`) at the moment B1.1
  needs a `Real.log` lemma; first `lake build` is ~30+ min cold. Effort: 1 day infra.

**Proposed work order** (`.roadmap.lean4_formal` §3): Mathlib → B1.3 → B1.1 → B1.2.

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

- **B4.1** Multi-T generalization T=7 / T=13 / T=21 (current T=1 / T=3 / T=4 PASS) —
  per-system rate-constant re-derivation. AXIS_CLOSURE_PLAN.md line 165 (`⬜ deferred`).
  Cycle 30+. Effort: 1-2 weeks (lit review of T=7/13/21 cage assembly rate-constants
  + ODE re-fit). **Category (b)** because this is a formal-coverage stretch, not an
  in-repo bug.

### B — Summary

| Item | Source | Effort | Note |
|------|--------|--------|------|
| B1.1 F-CL-FORMAL-2 v2 (Landauer ℝ + reversible-merge) | `.roadmap.lean4_formal` §3 | 200-500 LOC | needs Mathlib |
| B1.2 F-CL-FORMAL-3 v2 (exp-in-depth Π^p_2) | same | 200-500 LOC | needs Mathlib |
| B1.3 F-CL-FORMAL-4 v2 (payload disclosure) | same | 200-500 LOC | needs Mathlib |
| B1.4 Mathlib SHA-pin + first cold build | hexa-meta `lakefile.lean` | 1 d | gate B1.1-3 |
| B2.1 MechVerif ~15 sorries | legacy-canon | weeks | FROZEN |
| B2.2 MechVerif ~28 named axioms | legacy-canon | weeks | FROZEN |
| B3.1 Theorem B ~2 sorries | legacy-canon | small | FROZEN |
| B4.1 virocapsid V-R2 T=7/13/21 | `.roadmap.virocapsid` | 1-2 wk | rate-const re-derivation |
| **(b) v2.0.0 promotion total** | — | ~1-2 months active work | excludes FROZEN B2/B3 |

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

### C4. quantum HW adoption (NISQ → fault-tolerant)

This category is the most structured — `.roadmap.quantum_hw_adoption_ladder`
already enumerates the tier ladder and vendor list.

- **C4.1** Tier 1 NISQ adoption — current state is Aer + ANU QRNG only. Path to
  real HW: IBM Quantum (Heron 156-qubit / Kookaburra 1386 / Flamingo 7000) via
  Qiskit Runtime, or IonQ Forte 36-qubit / Quantinuum H2 56-qubit via vendor
  cloud APIs. **DEST: vendor API selection pending.** Tracked in
  `.roadmap.quantum_hw_adoption_ladder` §1-2.
- **C4.2** Phase D / F-Q-6-F NISQ-HW re-run — currently classical-mock VQE on
  the 5-warhead Mpro library; running on real HW would be the Tier 1 first real
  use case. **DEST: IBM Quantum or IonQ cloud.** Requires API credential +
  budget allocation.
- **C4.3** Fault-tolerant horizon — PsiQuantum (10-year photonic) / Google Willow
  (post-threshold error correction). Tier 2-3. **DEST: vendor partnership, not
  procurement.**

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
| C4.1 quantum NISQ Tier 1 | HW procurement | none | IBM/IonQ/Quantinuum cloud | DEST: vendor API pending |
| C4.2 F-Q-6-F real-HW re-run | HW execution | none | same vendor APIs | DEST: blocks on C4.1 |
| C4.3 fault-tolerant horizon | HW partnership | none | PsiQuantum / Google | DEST: 10-year horizon |
| C5.1-5.3 clinical pipeline | clinical | hexa-medic? | CRO / FDA / 식약처 | DEST: roadmap only |

**Observation**: 9 of 11 (c) items currently have **DEST: none yet** — the
software side is ready (acceptance contracts drafted; schemas locked; HW adoption
ladder enumerated) but the external partner / vendor / regulatory channel has not
been selected. Closing (c) is a procurement / partnership / regulatory task, not a
software task; software's role is to keep the handoff surfaces clean so they're
ready when the external counterparty is engaged.

---

## §D — Roll-up

| Category | Items | Effort to 100% | v1.x closure-grade impact |
|----------|-------|----------------|---------------------------|
| (a) in-repo software | 4 | ~2.5 days | YES — closes any (a) gaps |
| (b) v2 formal semantics | 8 (4 active + 4 FROZEN) | ~1-2 months active (FROZEN excluded) | NO — v2.0.0 stretch |
| (c) out-of-software-scope | 11 | ∞ (external) | NO — handed off |
| **Total** | **23** | — | — |

**Honest reading** of "100% closure 가능?":

- **(a)** YES — ~2.5 days; mostly ribozyme robustness sweeps + one virocapsid
  ODE wiring; user can authorize the items in §A and v1.x (a) reaches 100%.
- **(b)** YES with significant effort — ~1-2 months of cycle-30++ Mathlib / Lean
  design work for the 4 active items; the 4 FROZEN items (MechVerif sorries +
  Theorem B sorries) require re-opening legacy-canon and a deliberate decision
  to port forward. v1.x track is not blocked by (b); v2.0.0 is the home.
- **(c)** NO in software — the gaps are real-world execution gaps (wet-lab,
  IP, HW procurement). Software can prepare the handoff surfaces; **only
  external counterparties can close the items**. 9 of 11 (c) items currently
  have no destination repo / vendor / partner selected.

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
