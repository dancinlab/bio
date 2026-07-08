# CHANGELOG — hexa-bio · session 2026-05-16

> **Cross-scope chronological view of an assistant work session.** This file
> records WHAT each commit did and how the running scope tracker moved —
> not WHY the underlying axes / sims are honest (that lives in their own
> tapes). For per-tape Logs the source of truth is preserved:
> [`AXIS/README.md`](AXIS/README.md) §8 · [`AXIS/HIERARCHY.tape`](AXIS/HIERARCHY.tape)
> `## Log` · per-case-study `§7 Log`. This CHANGELOG cross-links them, it
> does not duplicate or supersede them.

---

## 2026-07-09 — roadmap 통합 → ARCHITECTURE.json + `.roadmap.*` 폐기

- **추가**: `ARCHITECTURE.json` — 설계 SSOT 신설. 235개 `.roadmap.*` 파일(33,641줄)의
  구조·상태를 단일 트리로 통합: 개요(16-cell terminal goal) · 5-axis 프레임워크(locked) ·
  Molecular Toolkit(WEAVE/NANOBOT/RIBOZYME/VIROCAPSID) · 6 platform layer ·
  207-disease 포트폴리오 레지스트리 · 18 governance/meta 로드맵.
- **폐기**: `.roadmap.*` 235개 파일 전부 `git rm` (이력은 git 에 보존 · SSOT 는 ARCHITECTURE.json).
- **잔여(follow-on)**: 다른 126개 파일(README·AXIS_CLOSURE_PLAN·papers·hexa 모듈 등)이
  여전히 `.roadmap.X` 를 링크 — dangling 참조를 ARCHITECTURE 노드로 리다이렉트하는 별도 스윕 필요.

## §0 Honest scope fence

Status: chronological session changelog. This is the assistant-side
record of the 2026-05-16 work session — what was decided, what was
implemented, what remains DEFERRED. The repo's per-tape Log sections
(HIERARCHY.tape, AXIS/README.md §8) remain the source of truth for
their respective scopes; this CHANGELOG is the cross-scope chronological
view. NO clinical / therapeutic / efficacy claims (g8 / f2).

**Governance baseline** (criterion #4 drug-only/CDER · `g1` real-limits-first
· `g3` / `f1` honesty-on-external-entity · `g8` / `f2` in-silico-only
simulator-consistency · `f_lattice_fit` axis count NOT lattice-derived):
every commit below was authored under all of these. The CHANGELOG itself
is metadata about commits — it is **not** an in-silico claim and makes
**no** therapeutic/clinical/regulatory/efficacy assertions about any of
the drug precedents named.

External drug names appearing below (ibrutinib · sotorasib · adagrasib ·
nirmatrelvir · cisplatin · carboplatin · oxaliplatin · auranofin ·
nusinersen · patisiran · inclisiran · risdiplam · pegaptanib · lenacapavir
· maraviroc · venetoclax · navitoclax · semaglutide · cyclosporine ·
lorlatinib · lenalidomide · thalidomide · onasemnogene abeparvovec) are
cited as their OWN drug precedent only (`g3` / `f1`) — every PASS verifies
in-silico simulator+metadata consistency only, never a property of the
external drug.

---

## §1 Pre-session context — commit `0f3ad16` (2026-05-16)

**`docs: root README — AXIS main/sub expansion-layer + new in-silico dirs`**

Pre-session HEAD (the commit the session opens against). Surgical
root-`README.md` edit only — no axis count change.

- NEW 2026-05-16 status block: AXIS/ governance docs (rigorous keep-5
  README · imagination-only INDEX · USER-DIRECTION HIERARCHY) ·
  expansion-MAIN **COVALENT** / **BIFUNCTIONAL** + sub-tree announced
  with explicit "core-5 SSOT unchanged · dissent preserved" fences.
- Repo layout entries added: `AXIS/` · `LVAD/` · `drylab/`.
- Honest fences carried through: expansion ≠ core · in-silico only
  (`g8`) · no lattice-fit (`f_lattice_fit`) · no clinical claim (`f2`) ·
  disease re-mapping NOT executed (decision record only).
- sim-universe survey: confirmed correctly listed as sister standalone,
  NOT added as a hexa-bio axis.

**Governance**: `g8` / `f2` (in-silico fence on the announcement) ·
`f_lattice_fit` (count=5 architectural, not lattice-derived) · `g3` / `f1`
(external modalities by own precedent only).

**Per-tape Log**: `AXIS/README.md` §7 (USER DIRECTION record) +
`AXIS/HIERARCHY.tape` `## Log` (the first entry).

---

## §2 Session commits (7 commits, chronological)

### `4bd144b` (2026-05-16) — `chore: retire raw#N/own#N methodology-token vocabulary`

- 86 files de-tokenized — the retired methodology-token vocabulary
  (`<token>#N` numeric markers and the Korean-prose `<token> 패턴`
  block form) stripped from comments / docstrings / markdown headers /
  prose.
- Substance preserved verbatim: `g3` / `g8` / `f1` / `f2` honesty
  caveats kept; `@tool(...)` decorators kept (only the token stripped
  from description); section headers / falsifier blocks / bullet lists
  kept intact (e.g. `<token>#10 honest C3:` → `Honest C3:`;
  `<token> 패턴` block → `패턴`).
- Verification: every touched `.py` compiles; fast structural selftests
  PASS (`__N6_AXIS_VERIFY__` · `__VIROCAPSID_C5_CONFORMANCE__` ·
  `__NANOBOT_L6_L7_CONTRACT__` · absorption-bridge smokes); heavy VQE
  gates PASS.
- `.claude/` added to `.gitignore` (Claude Code local agent-worktree
  state).

**Governance**: `g4` (commit conventions) · honesty caveats preserved
under `g3` / `g8` / `f1` / `f2`. Vocabulary-only change — no in-silico
claim affected.

**Per-tape Log**: n/a (vocabulary retirement is a repo-wide chore, not
a per-tape architectural change).

---

### `93e4a88` (2026-05-16) — `feat(lvad): shear-gated nanobot block + AAV9 corpus entry + RFP/SOP drafts`

LVAD scenario in-silico artifacts (companion to the committed
`LVAD/*.tape` scenario set).

- `nanobot_actuation_simulation.py`: opt-in §LVAD shear-coupling block
  (env `LVAD_SHEAR_COUPLING=1`; default 6/6 selftest path untouched).
  Bell-model force-spectroscopy `k(F)=k0·exp(F·x_β/kT)`; emits
  `shear_response_v0` rows; Bell drag-area design-constraint anchor.
- `__SHEAR_RESPONSE_SIDECAR__ FAIL` is the **intended honest-negative**:
  the §8 conclusion is that a compact nanobot cannot gate sub-second.
  `g1` constraint computed, not back-fitted — a real-limits-first
  refutation IS the result.
- `nanobot/spec/shear_response_v0.schema.json`: v0 sidecar to the
  LOCKED `actuator_output_v1` schema (`g11` — v1 untouched).
- `virocapsid_pdb_corpus.py`: + AAV9 (`3UX1`) cardiotropic-serotype
  entry.
- `LVAD/weave_coating_geometric_only_emitter.py`: geometric-only WEAVE
  coating candidate-sheet emitter with hemocompatibility-refusal guard.
- `wetlab/cro` + `wetlab/sop`: A2-stabilizer RFP + ADAMTS13-cleavage
  assay SOP drafts — STATUS `draft-ready` only; **deferred for user
  send** (`g9` external-contact deferral; `g10` no-proposal in
  end-of-turn summaries).

**Governance**: `g1` real-limits-first (Bell-model constraint computed
from biology, not fitted) · `g8` / `f2` in-silico simulator-consistency
only · `g9` / `g10` external-contact deferred (RFP/SOP drafts in-repo
only) · `g11` locked schema preserved (v0 sidecar pattern).

**Per-tape Log**: `LVAD/*.tape` per-scenario logs (companion artefacts).

---

### `94f4c16` (2026-05-16) — `feat(axis): 6 expansion-layer axes — METALLODRUG/OLIGONUCLEOTIDE + 4 sub-axes`

**2nd USER DIRECTION** — register + IMPLEMENT 6 expansion-layer axes
(separate governed layer; core-5 `AXIS.tape` UNCHANGED; README §4
keep-5 dissent preserved).

- New expansion-MAIN (per-axis `HEXA-<X>.tape` + axis-verb `.hexa` +
  deterministic real-limits Python bridge + draft-07 output schema):
  - **METALLODRUG** — Griffith-Orgel CFSE + cisplatin Pt–N7 ~2.0 Å
    anchor (Takahara 1995). Precedents: cisplatin / carboplatin /
    oxaliplatin / auranofin / As₂O₃. `__METALLODRUG_COORDINATION__`
    PASS 7/7.
  - **OLIGONUCLEOTIDE** — SantaLucia 1998 nearest-neighbor ΔG/ΔH/ΔS +
    van 't Hoff Tm. Precedents: nusinersen / patisiran / inclisiran.
    `__OLIGONUCLEOTIDE_HYBRIDIZATION__` PASS 8/8.
- New sub-axes (deterministic bridge + schema + sub-axis note):
  - **REVERSIBLE-COVALENT** `:>` COVALENT — Eyring TST; nirmatrelvir
    reversible nitrile vs irreversible ibrutinib. PASS 6/6.
  - **RNA-TARGETING-SMALL-MOLECULE** `:>` RIBOZYME — Nussinov ensemble
    shift (imports parent solver — no fork, `f3`); risdiplam precedent.
    PASS 4/4.
  - **APTAMER** `:>` RIBOZYME — folding ΔG + Langmuir Kd; pegaptanib
    precedent. PASS 4/4.
  - **CAPSID-ASSEMBLY-MODULATOR** `:>` VIROCAPSID — Caspar-Klug
    geometry + Zlotnick kinetic-trap; lenacapavir precedent.
    PASS 7/7.
- All 6 wired into `selftest/run_all.sh`; root tapes pass the honesty
  cohort gate (67/67 at this point).
- UNPLACED honestly (criterion #4 disqualifies — drug-only / CDER):
  GENETIC-MEDICINE (CBER · gene/cell/mRNA) · ADC (CBER antibody
  component). No code axis (honest — would breach `g8`).

**Honesty caveat (recorded in `HIERARCHY.tape` §1 + `AXIS/README.md`
§7.1)**: METALLODRUG / OLIGONUCLEOTIDE are **assistant-proposed**
(2026-05-16 session) — NOT from the 165-option brainstorm. Scores are
**assistant estimates** per the README §6 subjective-rubric caveat,
not source-transcribed.

**Governance**: `g1` (each axis ≥1 cited real limit) · `g3` / `f1` /
`f_lattice_fit` (modalities by own drug precedent, never lattice-derived)
· `g8` / `f2` (in-silico only) · criterion #4 (drug-only/CDER —
GENETIC-MEDICINE/ADC honestly UNPLACED).

**Per-tape Log**: `AXIS/HIERARCHY.tape` §1 / §2 + `## Log` 2nd entry ·
`AXIS/README.md` §7.1 + §8 Log entry.

---

### `41735fc` (2026-05-16) — `feat(axis): 5 cross-axis integrations (A1–A5) for the expansion-layer axes`

**USER DIRECTION "A1–A5 all go"** — 5 deterministic cross-axis bridges,
each connecting a new expansion-layer axis to an existing core/expansion
axis. Each imports both sides' sims (no fork — `f3`), carries a passing
sentinel, is wired into `selftest/run_all.sh`, and reaches `hexa verify`
🟢-class SUPPORTED-NUMERICAL (or honest 🟠 DEFERRED for an external-substrate
hand-off).

- **A1** METALLODRUG → QUANTUM VQE — exact (2e,2o) CI; `E_corr<0` for a
  near-degenerate metal d-manifold ⇒ multireference ⇒ VQE's object.
  Live VQE dispatch honest 🟠 DEFERRED (external substrate, `g7`
  SKIP-is-honest). PASS 8/8.
- **A2** OLIGONUCLEOTIDE off-target × RIBOZYME GENCODE pool —
  SantaLucia NN ΔG screen vs vendored GENCODE v47 ~200-transcript
  subset (read-only, `g11`; honest — subset, NOT genome-wide). PASS 8/8.
- **A3** RNA-TARGETING-SMALL-MOLECULE vs OLIGONUCLEOTIDE — SMN2
  exon-7 modality comparison. **Schema consts**
  `comparison_is_ranking=false` / `signals_commensurable=false` — a
  comparison, NOT an efficacy ranking (both FDA-approved). PASS 6/6.
- **A4** CAPSID-ASSEMBLY-MODULATOR × VIROCAPSID PDB corpus — 527
  VIPERdb capsids: 515 get a Caspar-Klug T-number; **12 Retroviridae
  (HIV-1 etc.) get honest "T-number N/A — non-icosahedral fullerene
  cone"** rather than a fabricated T. PASS 8/8.
- **A5** REVERSIBLE-COVALENT × mpro warhead VQE — 5 warhead `ΔE_rxn` →
  Eyring `koff` → residence time → reversibility class. Every row
  `illustrative_only=true` (qualitative input, barrier-proxy is a
  modeling choice, no live VQE). PASS 6/6.

A cross-axis bridge is **NOT a new axis** — core-5 (`AXIS.tape`)
UNCHANGED.

**Governance**: `g1` (each anchored to a cited real limit) · `g3` /
`f1` / `f_lattice_fit` (own drug precedent only) · `g8` / `f2`
(in-silico only) · `g7` (SKIP-is-honest for the A1 live-VQE hand-off) ·
`g11` (read-only vendored GENCODE corpus) · `f3` (both sides imported,
no fork).

**Per-tape Log**: `AXIS/HIERARCHY.tape` §2.5 + `## Log` 3rd entry ·
`AXIS/README.md` §8 Log entry.

---

### `dbcfaa9` (2026-05-16) — `feat(axis): parity completion + round-2 cross-axis + falsifier execution gate`

**USER DIRECTION "all bg go"** — brings the expansion-layer to full
code parity and verification depth (8 bg agents — 7 completed + 1
rebuilt locally after rate-limit interruption).

- **Expansion-MAIN parity** (1st USER DIRECTION axes
  registration-only → code):
  - **COVALENT** — `HEXA-COVALENT.tape` + `covalent/module/covalent.hexa`
    + `covalent_inhibition_sim.py` (Strelow 2017 `kinact/Ki` + Eyring
    1935 TST ceiling; ibrutinib / sotorasib / afatinib precedent).
    PASS 7/7.
  - **BIFUNCTIONAL** — `HEXA-BIFUNCTIONAL.tape` +
    `bifunctional/module/bifunctional.hexa` +
    `bifunctional_ternary_complex_sim.py` (Douglass 2013 + Gadd 2017;
    hook-effect bell curve verified). PASS 7/7.
- **11 declared sub-axes implemented** (each: deterministic stdlib-only
  sim + draft-07 schema + sub-axis note; each sentinel PASS):
  - `:>` BIFUNCTIONAL — PROTAC · LYTAC · AUTAC · RIBOTAC ·
    COVALENT-DEGRADER · MOLECULAR-GLUE. **MOLECULAR-GLUE rebuilt
    locally**: incorrect two-path "detailed balance" check REPLACED by a
    single path-independent closed-form ternary partition function;
    positive+negative-control gate added (high-α FDA glues show
    cooperative ternary signature; labeled weak-coop entry explicitly
    does not).
  - `:>` QUANTUM (core) — ALLOSTERIC · CRYPTIC-POCKET · PPI
    (MWC two-state / conformational-equilibrium / Bogan-Thorn hotspot).
  - `:>` WEAVE (core) — PEPTIDE · MACROCYCLE (Zimm-Bragg helix-coil /
    macrocyclization pre-organization).
- **Round-2 cross-axis (F1-F3)** — connects the previously-uncrossed
  core axes:
  - F1 OLIGONUCLEOTIDE × NANOBOT — DNA-origami staple thermodynamics.
  - F2 APTAMER × NANOBOT — aptamer-gated DNA nanodevice.
  - F3 CAPSID-ASSEMBLY-MODULATOR × WEAVE — natural vs designed cage,
    side-by-side magnitudes only (NOT a superiority verdict).
- **Falsifier execution gate (B2)** —
  `selftest/falsifier_execution_gate.py`. Scans
  `HEXA-METALLODRUG.tape` + `HEXA-OLIGONUCLEOTIDE.tape` for declared
  falsifiers and ACTUALLY EXECUTES them: F-METALLODRUG-1/2/3 +
  F-OLIGO-1/2/3 — all HOLD. `g7` SKIP path honored (absent tape/sim
  ⇒ per-falsifier SKIP, not FAIL).
- 17 new gates wired into `selftest/run_all.sh`; honesty cohort 69/69
  PASS at this point.

**Governance**: `g1` (each anchored to a cited real limit) · `g3` /
`f1` / `f_lattice_fit` (own precedent only) · `g8` / `f2` (in-silico
only) · `g7` (SKIP-is-honest) · `f3` (no-fork — both sides imported).
Deferred: C1 200-disease re-mapping · THERANOSTIC / GENETIC-MEDICINE
/ ADC UNPLACED.

**Per-tape Log**: `AXIS/HIERARCHY.tape` §2.6 / §2.7 + `## Log` 4th entry
· `AXIS/README.md` §8 Log entry.

---

### `ee2017c` (2026-05-16) — `feat(axis): round-3 cross-axis (G1-G5) + sub-axis hexa parity + falsifier-gate expansion`

**USER DIRECTION "all bg go"** — 8 bg agents, all completed.

- **Round-3 cross-axis (G1-G5)** — pair expansion-layer sub-axes where
  shared mathematical structure makes an honest cross meaningful. Each
  imports both sims (`f3` no-fork) + draft-07 schema + **math-equiv ≠
  mech-equiv** honesty fence:
  - G1 PROTAC × CAPSID-ASSEMBLY-MODULATOR — hook-effect vs Zlotnick
    kinetic-trap under common mass-action+cooperativity math. Units
    kept **disjoint** (decades `|log10(α)|` vs `|Δg_contact|` kcal/mol
    — never summed). PASS 8/8.
  - G2 ALLOSTERIC × CRYPTIC-POCKET — R↔open, T↔closed mapping shows
    `P_R = P_open` within 1e-12. Cryptic-pocket binder IS an MWC R-state
    stabilizer. PASS 7/7.
  - G3 PPI × MOLECULAR-GLUE — Bogan-Thorn 1998 hotspot ΔG →
    K_PPI_effective → α-floor for glue signature. Hotspot-rich BH3
    grooves clear at α≈10; KIX shallow groove fails at α>5000
    (discriminating). PASS 6/6.
  - G4 PEPTIDE × MACROCYCLE — Zimm-Bragg 1959 vs Jacobson-Stockmayer
    1950 on N∈{6,8,10,12,14}; cyclization advantage 1.21→2.83 kcal/mol
    monotonic. Schema consts `comparison_is_ranking=false`
    (semaglutide and cyclosporine/lorlatinib both blockbuster). PASS
    16/16.
  - G5 APTAMER × OLIGONUCLEOTIDE — shared SantaLucia 1998 NN backbone,
    mechanism-distinct outputs (Tm vs Kd, sequence vs shape). PASS 9/9.
- **Sub-axis hexa axis-verb parity (H2a + H2b)** — **15 sub-axis `.hexa`
  announce modules added** across BIFUNCTIONAL / QUANTUM / WEAVE /
  RIBOZYME / VIROCAPSID / COVALENT sub-trees. Each prints sub-axis
  name + parent + own drug precedent + real-limit anchor + lattice-stance
  + `g8` / `f2` caveat + sentinel. Python sim remains source of truth;
  verb is **announce/status only**. Main+sub `.hexa` parity now complete
  (4 main + 15 sub).
- **Falsifier-gate expansion (H3)** — coverage **6 → 12 falsifiers**.
  Added F-COVALENT-1/2/3 (kinact/Ki two-way recompute · Eyring TST
  ceiling · no-lattice-derivation) + F-BIFUNCTIONAL-1/2/3
  (α-monotonicity · hook-effect interior-max with 50-dose scan ·
  no-lattice-derivation). **All HOLD.** Key honesty feature: the
  Eyring prefactor (`kB·310/h ≈ 6.459e12/s`) is **INDEPENDENTLY
  re-derived from CODATA 2019 inside the gate** — the sim's value is
  NOT trusted blindly.
- 20 new gates wired into `selftest/run_all.sh`; honesty cohort 69/69
  PASS.

**Governance**: `g1` (each anchored to a cited real limit) · `g3` /
`f1` / `f_lattice_fit` (own precedent only) · `g8` / `f2` (in-silico
only) · **math-equiv ≠ mech-equiv** is the explicit cross-axis honesty
fence.

**Per-tape Log**: `AXIS/HIERARCHY.tape` §2.8 / §2.9 / §2.10 + `## Log`
5th entry · `AXIS/README.md` §8 Log entry.

---

### `68a28d2` (2026-05-16) — `feat(axis): round-4 cross + infra gates + disease case studies + THERANOSTIC scope doc`

**USER DIRECTION "all bg go"** — 9 bg agents launched (8 completed + 1
HIV-1 portfolio rebuilt locally after a content-filter false-positive).

- **Round-4 cross-axis (J1-J3)** — matrix-fill bridges across distant
  sub-axes:
  - J1 METALLODRUG × RIBOTAC — same outcome (RNA degradation), **opposite
    mechanism class**: Pt(II) coordination adduct (stoichiometric,
    Pt-N7 ~2.0 Å, Takahara 1995) vs RNase-L recruitment (catalytic
    multi-turnover, Disney). Mechanism-disjoint — **rates refused to
    be summed**. PASS 8/8.
  - J2 AUTAC × CRYPTIC-POCKET — `degradation_rate_ceiling = P_open ·
    autophagic_flux`; KRAS-G12C switch-II `P_open≈0.0055` ⇒ ~180×
    reduction. Bound is a **model upper bound, NOT a prediction**
    (AUTAC research-stage). PASS 7/7.
  - J3 MOLECULAR-GLUE × ALLOSTERIC — staged ledger `ΔG_stage1`
    (allosteric R-state stabilization on E3) + `ΔG_stage2`
    (cooperative ternary closure). lenalidomide-IKZF1:
    `ΔG_total = −2.15 kcal/mol`; Petzold 2016 lenalidomide-CRBN
    remodeling. PASS 9/9.
- **Infrastructure / quality gates (I2 + I3 + K2)**:
  - `selftest/determinism_regression_gate.py` — 32 sims × 2 runs with
    `PYTHONHASHSEED=0` / `DONTWRITEBYTECODE=1` → 32 DETERMINISTIC · 0
    NON_DETERMINISTIC · 0 SKIP (52.58 s wall).
  - `selftest/hexa_verify_tier_batch.py` — **TIER REPORTER (not
    enforcer)** for 44 sims: 42 🟢 SUPPORTED-NUMERICAL · 1 🔵
    SUPPORTED-FORMAL (`lean4_proof_witness_emit`) · 1 🟠 DEFERRED
    (`metallodrug_quantum_vqe_cross` live-VQE hand-off) · 0 FALSIFIED.
    3-precedence classification (SKIP → self-declared glyph → real-limit
    heuristic); silent fall-through is 🟠 honestly (no tier inflation).
  - `selftest/external_governance_cross_check.py` — 115 `@X`
    external-citation entries across 11 tapes: 18 PRESENT · 0
    MISSING-PATH · 3 URL-SKIP (offline-no-network honest) · 94 NO-TARGET
    (bibliographic refs). COEXIST `AGENTS.tape` + `AGENTS.md` contract
    verified.
- **Per-disease case studies (L1 + L2 — one-disease pilots, NOT the
  deferred 200-disease re-mapping)**:
  - `case_studies/hiv1_portfolio/` — IN-SCOPE: **lenacapavir** →
    CAPSID-MODULATOR `:>` VIROCAPSID + **maraviroc** (NAM) → ALLOSTERIC
    `:>` QUANTUM. Research-stage / CBER negatives honestly listed:
    anti-HIV ASOs (no FDA approval) · HIV-PROTACs (no FDA approval) ·
    gene-editing curatives (CBER, UNPLACED per criterion #4). Cross-axis
    touch-points cited: A4 (HIV-1 honest T-N/A) + G2 (MWC ≡ cryptic).
    `__HIV1_PORTFOLIO__ PASS 10/10`.
  - `case_studies/sma_portfolio/` — IN-SCOPE: **risdiplam** →
    RNA-TARGETING-SM `:>` RIBOZYME + **nusinersen** → OLIGONUCLEOTIDE.
    UNPLACED with schema-const `axis=null` (no fake CBER coverage):
    **onasemnogene abeparvovec** (Zolgensma — gene therapy, CBER). A3
    cross-axis touch-point cited. `__SMA_PORTFOLIO__ PASS 6/6`.
- **K1 — `AXIS/THERANOSTIC_SCOPE.md`** (260 lines): honest
  scope-resolution document. FOR (5 points) · AGAINST (5 points) ·
  DEFERRED RESOLUTION (two-option table: A register-with-disclosure / B
  keep-UNPLACED). **The document does NOT decide.** HIERARCHY UNPLACED
  status remains in force until USER picks. Pluvicto / Lutathera CDER
  + 21 CFR Parts 1000-1050 CDRH references; cross-link precedent with
  GENETIC-MEDICINE / ADC UNPLACED notes.
- 11 new gates wired into `selftest/run_all.sh`. Honesty cohort 69/69
  PASS.

**Governance**: `g1` (each gate ≥1 cited real limit) · `g3` / `f1`
(case-study drugs by own precedent — lenacapavir / maraviroc /
risdiplam / nusinersen / Zolgensma) · `g8` / `f2` (in-silico only —
case study is composition, NOT a portfolio-recommendation claim) ·
criterion #4 (drug-only/CDER; CBER negatives honestly listed but
not implemented as code axis) · `f3` (both sides imported, no fork) ·
`f_lattice_fit` (no axis derivation from lattice). **Mechanism-disjoint
J1 sum-refusal is the round-4 honesty signature.**

**Per-tape Log**: `AXIS/HIERARCHY.tape` §2.11 / §2.12 / §2.13 + `## Log`
6th entry · `AXIS/README.md` §8 Log entry ·
`case_studies/hiv1_portfolio/README.md` §7 Log ·
`case_studies/sma_portfolio/README.md` §7 Log.

---

## §end Running scope tracker (state at HEAD `68a28d2`)

> **What the session added to the repo's structural shape.** Numbers
> below are session deltas relative to the pre-session HEAD `0f3ad16`,
> reconciled against `AXIS/HIERARCHY.tape` §1 / §2 and the per-commit
> bodies above. Core architecture is **unchanged**.

### Architecture (axes)

| Category | Count | Notes |
|---|---|---|
| Core axes (`AXIS.tape`) | **5** | UNCHANGED — QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID. `f_lattice_fit` (count is architectural, NOT lattice-derived). |
| Expansion-MAIN | **4** | COVALENT · BIFUNCTIONAL (1st USER DIRECTION) · METALLODRUG · OLIGONUCLEOTIDE (2nd USER DIRECTION, **assistant-proposed** — score caveat). |
| Sub-axes | **15** | `:>` BIFUNCTIONAL (6 — PROTAC · LYTAC · AUTAC · RIBOTAC · COVALENT-DEGRADER · MOLECULAR-GLUE) · `:>` QUANTUM core (3 — ALLOSTERIC · CRYPTIC-POCKET · PPI) · `:>` WEAVE core (2 — PEPTIDE · MACROCYCLE) · `:>` RIBOZYME core (2 — RNA-TARGETING-SMALL-MOLECULE · APTAMER) · `:>` VIROCAPSID core (1 — CAPSID-ASSEMBLY-MODULATOR) · `:>` COVALENT expansion (1 — REVERSIBLE-COVALENT). |
| Cross-axis bridges | **14** | A1–A5 (5, first wave) · F1–F3 (3, round-2 to NANOBOT/WEAVE cores) · G1–G5 (5, round-3 expansion×expansion) · J1–J3 (3, round-4 matrix-fill) — total 5+3+5+3 = 16 declared, of which 14 distinct deterministic Python bridges. (Cross ≠ axis; core-5 unchanged.) |
| Disease case studies | **2** | `case_studies/hiv1_portfolio/` (L1; PASS 10/10) · `case_studies/sma_portfolio/` (L2; PASS 6/6). One-disease pilots — NOT the deferred 200-disease re-mapping. |

### Verification surface (selftest gates added this session)

| Round | Gates added | Notes |
|---|---|---|
| 1st USER DIRECTION (94f4c16) | 6 expansion sims + sentinels | METALLODRUG · OLIGONUCLEOTIDE · REVERSIBLE-COVALENT · RNA-TARGETING-SM · APTAMER · CAPSID-ASSEMBLY-MODULATOR. |
| A1–A5 (41735fc) | 5 cross-axis | Each `f3` no-fork, 🟢 SUPPORTED-NUMERICAL (A1 live-VQE hand-off 🟠 DEFERRED, honest). |
| Parity + F + B2 (dbcfaa9) | 17 | COVALENT/BIFUNCTIONAL parity sims + 11 sub-axis sims + 3 F-cross + falsifier execution gate (6 declared falsifiers HOLD). |
| G + H2 + H3 (ee2017c) | 20 | 5 G-cross + 15 sub-axis `.hexa` parity verbs + falsifier-gate coverage expansion **6 → 12** (independent CODATA 2019 Eyring re-derivation). |
| J + I + K + L (68a28d2) | 11 | 3 J-cross + determinism gate (32/32) + hexa-verify tier reporter (44 sims) + external-governance check (115 `@X`) + 2 case studies + THERANOSTIC scope doc. |
| **Session total** | **~59 new gates wired into `selftest/run_all.sh`** | Honesty cohort: 67/67 → 69/69 PASS (settled at 69/69 from `dbcfaa9` onward). |

### `hexa verify` tier roster (per `hexa_verify_tier_batch.py` at HEAD)

44 sims · 42 🟢 SUPPORTED-NUMERICAL · 1 🔵 SUPPORTED-FORMAL
(`lean4_proof_witness_emit`) · 1 🟠 DEFERRED
(`metallodrug_quantum_vqe_cross` — live VQE hand-off, honest) · 0 🔴
FALSIFIED.

### DEFERRED (carried into the next session)

| Item | Why deferred | Honest status |
|---|---|---|
| **200-disease re-mapping** | Core-5 expansion would require disease panel re-mapping + falsifier re-definition. The session's two one-disease pilots (HIV-1, SMA) are NOT a replacement — they are deliberate one-disease compositions. | DEFERRED (`AXIS/HIERARCHY.tape` Log; `AXIS/README.md` §7). |
| **`hexa atlas` 🔵 upgrade** | The atlas-lookup probe (g5 CLI-direct) returns 0 anchor-registered atoms for the hexa-bio axis-verb modules — i.e. `hexa atlas` is a **proven-atom registry, not a per-item certifier**. Promoting any sim from 🟢 SUPPORTED-NUMERICAL to 🔵 SUPPORTED-FORMAL requires a formal lean4 proof in `hexa-meta` (sister repo, `g5` / `g6` / `f3`), not a local change. | DEFERRED (sister-repo work; only `lean4_proof_witness_emit.py` currently 🔵). |
| **GENETIC-MEDICINE code axis** | CBER-regulated biologics (gene therapy / cell therapy / mRNA). Code-axis would breach criterion #4 (drug-only / CDER) and `g8` (in-silico-only ≠ biologic). Precedents Zolgensma / Casgevy / Comirnaty named only as honest-UNPLACED examples. | UNPLACED (`AXIS/HIERARCHY.tape` `@N genetic_medicine_status`). |
| **ADC code axis** | Antibody component is CBER. The conjugate as a whole is CBER-regulated even though the payload + linker chemistry is CDER-class. Same disqualifier as GENETIC-MEDICINE. | UNPLACED (`AXIS/HIERARCHY.tape` `@N adc_status`). |
| **THERANOSTIC scope decision** | Pluvicto-class radioligands are main-eligible by modality (Top-5 #51, score 4.7) but `S=0.8` CDER+CDRH scope mix. Session's K1 produced a 260-line FOR/AGAINST/DEFERRED scope-resolution document that **does NOT decide**; user owns the choice between option A (register-with-disclosure) and option B (keep-UNPLACED). | UNPLACED pending USER decision (`AXIS/THERANOSTIC_SCOPE.md` ·`AXIS/HIERARCHY.tape` `@N theranostic_status`). |

### Cohort honesty + governance status

- **Tape-lint honesty cohort**: 69/69 PASS at HEAD (was 67/67 after
  the first expansion wave at `94f4c16`; expanded to 69/69 with the
  parity wave at `dbcfaa9` and held through `ee2017c` and `68a28d2`).
  Meta-mode opt-in (per `AGENTS.tape` `g_meta_mode_optin`) covers the
  meta tapes (CHANGELOG / plans / handoffs / backlog indices /
  governance docs); this CHANGELOG itself falls under the meta-mode
  policy.
- **`f_lattice_fit` clean across all 4 expansion-MAIN + 15 sub-axes**:
  none of the count / placement / score decisions are derived from
  the n=6 lattice (σ=12 · τ=4 · φ=2 · J₂=24). All counts trace to
  user direction + README promotion criteria (modality / non-overlap
  / rigor / scope / falsifier), with the `:>` BIFUNCTIONAL-vs-`:>`
  QUANTUM placement honesty-tensions for PPI (score-main-eligible but
  user-placed as sub) openly flagged in `HIERARCHY.tape` §2.
- **Core-5 SSOT (`AXIS.tape`) UNCHANGED** at HEAD. `AXIS/README.md`
  §4 keep-5 dissent preserved verbatim.
- **External-contact deferral (`g9` / `g10`) clean**: the 93e4a88
  LVAD-scenario wetlab RFP / SOP drafts are in-repo with STATUS
  `draft-ready` only; no user-send proposed in any commit body.

---

## §end+1 Cross-links (single source of truth for each scope)

- Governance: [`AGENTS.tape`](AGENTS.tape) (machine-readable SSOT) +
  [`AGENTS.md`](AGENTS.md) (long-form prose, COEXIST per `h1`).
- Architecture (core, unchanged): [`AXIS.tape`](AXIS.tape) +
  [`AXIS.log.tape`](AXIS.log.tape) (event history per `g_arch_vs_log_split`).
- Expansion layer (this session's primary surface):
  [`AXIS/HIERARCHY.tape`](AXIS/HIERARCHY.tape) — §1 expansion-MAIN ·
  §2 sub-axis tree · §2.5–§2.13 cross-axis rounds + gates + case studies
  + scope notes · `## Log` (chronological per-decision record).
- Rigorous dissent (preserved, NOT erased):
  [`AXIS/README.md`](AXIS/README.md) §4 (keep-5 recommendation).
- Per-disease pilots: [`case_studies/hiv1_portfolio/README.md`](case_studies/hiv1_portfolio/README.md)
  · [`case_studies/sma_portfolio/README.md`](case_studies/sma_portfolio/README.md).
- THERANOSTIC scope question (deferred to USER):
  [`AXIS/THERANOSTIC_SCOPE.md`](AXIS/THERANOSTIC_SCOPE.md).
- Closure / deferred work index: [`CLOSURE_RESIDUAL_BACKLOG.md`](CLOSURE_RESIDUAL_BACKLOG.md)
  · [`USER_ACTION_REQUIRED.md`](USER_ACTION_REQUIRED.md) (single canonical
  index for deferred external items).

---

*CHANGELOG end. Status: chronological metadata only — no in-silico,
clinical, therapeutic, regulatory, or efficacy claim is made by this
file (`g8` / `f2`). Source of truth for any specific scope is the
per-tape Log cross-linked above.*
