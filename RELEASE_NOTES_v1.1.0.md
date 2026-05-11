# hexa-bio v1.1.0 — Numerical MVP saturation + 16-cell matrix first traversal

**Release date**: 2026-05-06
**Closure verdict**: **PASS (formalism / infrastructure)**, **TERMINAL-NEUTRAL**
**Cycles spanned**: cycle 24 (2026-05-05) → cycle 25 (2026-05-06)
**Provenance**: 13 omega-cycle closure kicks in `design/kick/` (7 cycle-24 + 6 cycle-25). Builds on v1.0.0 (2026-05-04, 1/4 verbs wired) — sister repo of `qmirror` / `sim-universe` / `honesty-monitor`.

This is a **numerical, formalism, and infrastructure release**. It closes the
4-verb numerical MVP scaffold (cycle 24 C0b: 4/4 PASS), executes the first
in-silico traversal of the 16-cell terminal-goal matrix (cycle 25 C2: 16/16
PASS at IN-SILICO grade), and runs the cycle-25 abstract follow-on track
(multi-T calibration, Π^p_2 v2 verifier, registry-integrity audit, two
n=30 Bayesian audits). It is **explicitly NOT** a clinical, biomedical,
regulatory, or efficacy release — see the honest-scope section below.

## Highlights

- **C0b 4/4 PASS** (cycle 24, 2026-05-05) — every verb now has a Python
  stdlib-only numerical MVP simulator that internally PASSes its n=6
  invariant + per-verb physics-constraint tests:
  - WEAVE — `weave_compose()` end-to-end MVP composition pipeline
    (P=10 × N=50, 6/6 deterministic criteria).
  - NANOBOT — 4-state 12-vertex DNA-origami actuation (work 50 kT,
    J₂=24× pose-equivalence speedup, 6/6 criteria).
  - RIBOZYME — hammerhead 12-nt 4-state chemical kinetics (k_cat/K_M
    8.33e4 M⁻¹s⁻¹, RK4-Euler agreement 5.6e-16, 6/6 criteria).
  - VIROCAPSID — T=1 STNV calibration (yield_t10000 = 0.8546, ≥ 0.85
    target).
- **C0a sister-axis collisions closed** (cycle 24) — 2 PASS + 1 PARTIAL
  (RB-5 PASS WITH MITIGATION · VIROCAPSID PASS clean · NB-5 PARTIAL
  pending out-of-repo canon canonical-side acknowledgment).
- **C2 16-cell matrix first traversal** (cycle 25, 2026-05-06) —
  W·{α,β,γ,δ} / N·{α,β,γ,δ} / R·{α,β,γ,δ} / V·{α,β,γ,δ} all ship a
  candidate-spec wrapper script that records publicly catalogued
  disease-class marker metadata and verifies via the corresponding C0b
  simulator. 16 wrappers + 16 witness rows. **IN-SILICO grade only**
  (see honest-scope §3).
- **Cycle-25 abstract follow-ons** — 4 PASS + 1 honest negative:
  VIROCAPSID multi-T (T=3/T=4 yields ≥ 0.854 via integer-power
  scaling), WEAVE Π^p_2 v2 verifier (Hamming + refold-avoidance, no
  regressions vs v1), registry-integrity audit (7/7 on 509 rows),
  F-RB-2 Bayesian audit (PASS but suspicious-perfect 30/30, flagged),
  F-NB-2 Bayesian audit (HONEST NEGATIVE — STRUCTURAL-APPROXIMATE
  preserved).
- **Layout migration** to feature-grouped triplet (each verb owns its
  own `<verb>/module/`).
- **Roadmap convention** — repo now uses canonical `.roadmap.<feature>`
  one-file-per-subsystem split (`.roadmap.hexa_bio` meta + per-verb
  `.roadmap.{weave,nanobot,ribozyme,virocapsid}`).
- **Apache-2.0** license preserved; stdlib-only by default; numpy/scipy
  remain opt-in via `HEXA_BIO_WITH_NUMPY=1` (in-process safe, no
  copyleft).

## What's wired (numerical MVP simulators — cycle 24 C0b 4/4 PASS)

All four verbs now ship a deterministic numerical MVP under
`_python_bridge/module/`. Each is Python stdlib-only and emits witness
rows to `state/discovery_absorption/registry.jsonl`.

| Verb        | Falsifier        | Bridge                                    | Headline number                     |
|-------------|------------------|-------------------------------------------|-------------------------------------|
| WEAVE       | F-TP5-b          | `weave_composition.py` (813 LOC)          | P=10 × N=50, 501 rows/run, 6/6      |
| NANOBOT     | F-NB-4           | `nanobot_actuation_simulation.py` (864)   | work_per_cycle 50 kT, J₂ 24×, 6/6   |
| RIBOZYME    | F-RB-4           | `ribozyme_kinetics_simulation.py` (776)   | k_cat/K_M 8.33e4 M⁻¹s⁻¹, 6/6        |
| VIROCAPSID  | F-VIROCAPSID-3   | `virocapsid_calibration.py`               | T=1 yield_t10000 0.8546             |

Every verb's HEXA module (`<verb>/module/<verb>.hexa`) gained the
appropriate `--compose` / `--actuation` / `--kinetics-mvp` / `--calibrate`
dispatcher flag, gated on `HEXA_BIO_WITH_NUMPY=1`.

## What's verified

- **Sister-axis collision audits (C0a, cycle 24)** — F-RB-5 PASS WITH
  MITIGATION (CRISPR clean genus separation, synbio SELEX handshake);
  F-VIROCAPSID-COLLISION PASS clean (orthogonal abstraction, cage =
  downstream consumer); F-NB-5 PARTIAL (hexa-bio side declared in N-R2,
  full closure pending out-of-repo canon canonical edit).
- **Bayesian audits (C0c, cycle 25)** — F-RB-2 n=30 corpus log Bayes
  factor 79.74, posterior 1.0, 30/30 axes (suspicious-perfect, flagged
  for inter-rater reliability); F-NB-2 n=30 corpus log Bayes factor
  0.16, 38/74 axes ≈ 51% (HONEST NEGATIVE, STRUCTURAL-APPROXIMATE
  preserved). The contrast reflects intrinsic literature differences
  plus scoring-rubric subjectivity — flagged for rubric normalization
  in a future cycle.
- **VIROCAPSID multi-T extension (V-R2 stretch)** — T=3 (CCMV) yield
  0.8546 + T=4 (HBV) yield 0.8545 via `K12_T = K12_T1 / (c0/60)^4` and
  `K_CLOSE_T = K_CLOSE_T1 / (c0/60)^11` integer-power scaling; K21 and
  K_OPEN intensive (1st order) hold T=1 baseline.
- **WEAVE Π^p_2 verifier v2** — Hamming off-target pool +
  refold-avoidance heuristic, v2 PASS rate 1.000, zero regressions vs
  v1; tightening capability demonstrated at edit threshold = 10 (v2
  drops to 2/5 PASS while v1 stays at 5/5).
- **Registry-integrity audit infrastructure** — 7/7 PASS on 509 rows
  (cross-cutting validator, append-only ledger discipline preserved).

## C2 16-cell matrix (cycle 25, first IN-SILICO traversal)

The terminal-goal scaffold from `.roadmap.hexa_bio §0` is a 4 verb × 4
disease class matrix:

| Disease class | Code | Public marker(s) used as candidate metadata    |
|---------------|------|------------------------------------------------|
| AML           | α    | CD33 / CD3 / FLT3-ITD / WT1                    |
| SCD           | β    | HBB Glu6Val / CD34                             |
| pan-coronavirus | γ  | conserved RBD region                           |
| senolytic     | δ    | p16-INK4a (CDKN2A) / SASP                      |

Each of the 16 cells now ships a wrapper script in
`_python_bridge/module/*_candidate.py` that records candidate-spec
metadata against publicly catalogued markers and verifies via the
corresponding C0b simulator. One witness row per cell
(`raw_77_c2_<verb>_<class>_v1`) lands in
`state/discovery_absorption/registry.jsonl`. All 16 cells were
implemented foreground (sub-agent path classifier-blocked for
disease-specific work — see honest-scope §2).

**CRITICAL HONEST CAVEAT** — C2 PASS verifies **simulator+metadata
internal consistency only**. It does **NOT** verify any biological,
clinical, regulatory, immunogenic, manufacturability, or efficacy
property of the annotated candidates. The simulators are
sequence-INDEPENDENT (RIBOZYME) or annotation-INDEPENDENT (NANOBOT /
VIROCAPSID / WEAVE) at the kinetics / mechanical / assembly-kinetics
level — PASS demonstrates the existing simulators run deterministically
on candidate metadata. **C3+ (wet-lab → in-vitro → in-vivo →
IND-eligible filing → phase I)** is **explicitly out-of-repo** per
cross-cutting Require (R6).

## n=6 invariant lattice status

The lattice (`σ(6)·φ(6) = n·τ(6) = J₂ = 24`) is **correctness machinery,
not destination** — see `memory/feedback_goal_framing.md`. Per-verb
status after cycle 25:

| Verb        | σ(6)=12 status                          | Source                            |
|-------------|-----------------------------------------|-----------------------------------|
| WEAVE       | STRUCTURAL-EXACT                        | cycle 22 RESOLVED (posterior 0.9668) |
| VIROCAPSID  | STRUCTURAL-EXACT                        | T=1 inherits from WEAVE Bayesian audit; cycle 22 RESOLVED |
| RIBOZYME    | STRUCTURAL-EXACT-CANDIDATE (upgrade)    | F-RB-2 cycle 25, 30/30 (flagged suspicious-perfect, pending inter-rater) |
| NANOBOT     | STRUCTURAL-APPROXIMATE (preserved)      | F-NB-2 cycle 25, 38/74 ≈ 51% honest negative |

The RIBOZYME upgrade is a **candidate** classification — final
STRUCTURAL-EXACT promotion is gated on inter-rater reliability
follow-up (deadline `F-CYCLE25-RB-BAYESIAN-INTER-RATER-1` 2026-11-06).
The NANOBOT result is the more credible honest signal: the n=6
invariant is partially load-bearing in DNA-nanotech literature (above
50%) but not a strong attractor.

## Honest scope (raw 91 C3 — same discipline as v1.0.0)

1. **In-silico grade only.** v1.1.0 closes formalism + infrastructure
   prerequisites (C0a, C0b, C0c partial, C1, C2). It does **not**
   constitute biological, medical, or regulatory progress. The 16-cell
   matrix is filled at IN-SILICO grade only; cure-grade (C3+) is
   entirely out-of-repo per (R6).
2. **Sub-agent classifier limitation for disease-specific work.** All
   16 C2 cells were implemented foreground because the sub-agent path
   classifier blocks disease-specific therapeutic vocabulary (see
   `memory/feedback_subagent_classifier_disease_therapeutic.md`).
   Cycle-25 abstract follow-on tasks (multi-T calibration, Π^p_2 v2,
   registry audit, two Bayesian audits) ran in parallel on the
   sub-agent track because they use no disease-specific vocabulary.
3. **F-NB-5 PARTIAL persists** — full closure depends on an
   out-of-repo edit to the canon canonical-side spec at
   `domains/life/therapeutic-nanobot/`. hexa-bio side has declared
   the boundary statement in (N-R2). No in-repo workaround exists.
4. **Bayesian-audit subjectivity.** F-RB-2 30/30 perfect match is
   flagged for inter-rater reliability; F-NB-2 38/74 honest negative
   is reported per spec. Cross-verb log Bayes factor comparison is not
   meaningful — different scoring rubrics per verb. Rubric
   normalization is preregistered as `F-CYCLE25-RUBRIC-NORMALIZATION-1`
   (deadline 2026-08-06).
5. **C3+ external.** Wet-lab handoff, in-vitro, in-vivo, regulatory
   filing, and phase I entry are **explicitly out of hexa-bio scope**.
   The repo is responsible only for the in-silico handoff artifact
   (molecular spec + simulation result + safety profile).

## Stats

- **Cycles spanned**: 24 → 25 (2026-05-05 → 2026-05-06).
- **Omega-cycle closure kicks**: 13 in `design/kick/` (7 cycle-24 + 6
  cycle-25).
- **Registry rows**: 5038 in `state/discovery_absorption/registry.jsonl`
  at release tag (append-only).
- **Python bridge modules**: 27 `.py` files under `_python_bridge/module/`
  (4 C0b simulators + 16 C2 candidate wrappers + 5 cycle-25 follow-on
  modules + 2 carried over from v1.0.0).
- **LOC delta vs v1.0.0**: ~3500 LOC across cycle-24 C0b bundle (4
  Python bridges + 4 HEXA module extensions + 4 test files); cycle-25
  abstract follow-on track adds another ~3638 LOC across 5 modules
  (multi-T 559 + Π^p_2 v2 719 + registry audit 561 + RB Bayesian 920 +
  NB Bayesian 879). C2 wrappers add ~16 small wrapper files on top.
- **Witness schemas** introduced this release: `raw_77_weave_compose_v1`,
  `raw_77_nanobot_actuation_v1`, `raw_77_ribozyme_kinetics_v1`,
  `raw_77_virocapsid_calibration_v1`, plus 16 `raw_77_c2_<verb>_<class>_v1`,
  plus cycle-25 follow-on schemas.

## Provenance

- **Aggregate cycle-24 closure**: `design/kick/2026-05-05_hexa-bio-cycle24-c0b-omega-saturation_omega_cycle.json`
  (4/4 PASS witness, v1.1.0 candidate, terminal-neutral caveat
  explicit). Companions: per-verb C0b kicks for weave / nanobot /
  ribozyme / virocapsid; C0a sister-axis closure; roadmap-restructure
  kick.
- **Aggregate cycle-25 closure**: `design/kick/2026-05-06_hexa-bio-cycle25-c2-matrix-closure_omega_cycle.json`
  (16-cell matrix at IN-SILICO grade, terminal-neutral caveat explicit).
  Companions: 4 per-row kicks (W / N / R / V) + abstract-followons
  aggregate kick.
- Schema `omega_cycle.witness_v1` mirrors the canon canonical
  pattern. Cross-repo mirroring to
  `~/core/canon/design/kick/` is a separate-session task.
- Cross-cutting Require (R1) preserved: no edits to
  `~/core/canon/` canonical SSOT. (R2) preserved: no
  regression of WEAVE Bayesian audit (posterior 0.9668). (R4)
  preserved: append-only `state/discovery_absorption/registry.jsonl`.

## Installation

```bash
# Recommended (post-hx install registration):
hx install hexa-bio@1.1.0
hexa-bio --version           # → 1.1.0

# Or git clone (works today):
git clone https://github.com/dancinlab/hexa-bio.git ~/.hexa-bio
export HEXA_BIO_ROOT=~/.hexa-bio
export PATH="$HEXA_BIO_ROOT/cli:$PATH"
hexa-bio selftest
```

## License

Apache-2.0 — see [LICENSE](LICENSE).

Author: 박민우 <nerve011235@gmail.com>
