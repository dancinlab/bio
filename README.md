<p align="center">
  <img src="docs/logo.svg" width="140" alt="hexa-bio">
</p>

<h1 align="center">🧫 hexa-bio</h1>

<p align="center"><strong>HEXA-Bio Family</strong> — biology · molecular · biochemistry · sister-substrate cross-links</p>

<p align="center">
  <a href="LICENSE"><img alt="License" src="https://img.shields.io/badge/license-Apache--2.0-blue"></a>
  <a href="https://github.com/dancinlab/hexa-bio/actions"><img alt="CI" src="https://img.shields.io/badge/selftest-35%2F35-brightgreen"></a>
  <img alt="Spec" src="https://img.shields.io/badge/version-v1.0.0-success">
  <img alt="Axes" src="https://img.shields.io/badge/axes-5%20(Q%20·%20W%20·%20N%20·%20R%20·%20V)-informational">
  <img alt="Closure" src="https://img.shields.io/badge/v1.x_closure-100%25_all_5_axes-informational">
  <img alt="Sibling" src="https://img.shields.io/badge/sibling-hexa--matter%20·%20hexa--space%20·%20hexa--physics-blueviolet">
  <a href="https://doi.org/10.5281/zenodo.20077542"><img alt="DOI" src="https://zenodo.org/badge/DOI/10.5281/zenodo.20077542.svg"></a>
</p>

<p align="center">biology · molecular · biochemistry · HEXA-family · n=6 · σ=12 · τ=4 · φ=2 · J₂=24 · VQE · CRISPR · capsid · ribozyme · nanobot · weave</p>

---

> **5-axis** molecular substrate organized around the **n=6 invariant lattice**:
> QUANTUM / WEAVE / NANOBOT / RIBOZYME / VIROCAPSID. Four axes are write-side
> bio sandboxes (the n=6 τ-quartet tetrahedron — `weave` / `nanobot` /
> `ribozyme` / `virocapsid`); the fifth axis (`quantum`) is the external
> compute bridge — VQE / qpu_bridge over `qmirror`. `weave` ships a full
> numerical empirical sandbox (Caspar-Klug + Zlotnick cage-assembly ODE +
> Bayesian σ(6)=12 STRUCTURAL-EXACT audit, posterior 0.97); the other three
> bio axes ship a C0b skeleton simulator + σ(6)=12 verification + falsifier
> preregister; `quantum` is at Phase 1+ (H₂/LiH VQE chemical/spectroscopic
> accuracy, F-Q-1…5 PASS, pocket-VQE F-Q-6 open).

> **Status (2026-05-13, cycle-30++++++++)**: v1.x **category-(a) closure
> = 100% across all 5 axes** (weave / virocapsid / ribozyme / nanobot /
> quantum). `selftest/run_all.sh` → **35/35 PASS** on dev host
> (deterministic in-repo gates; SKIP-clean substrate gates included).
> v1.1.0 candidate drafted (see [`RELEASE_NOTES_v1.1.0.md`](RELEASE_NOTES_v1.1.0.md)).
> Cycle 25 traversed the 16-cell C2 matrix (4 bio axis × 4 disease class)
> at IN-SILICO grade — 16/16 cells PASS the simulator+metadata
> internal-consistency check. The QUANTUM compute axis is tracked
> separately in [`.roadmap.quantum`](ARCHITECTURE.json) (Phase 1+ LANDED,
> qpu_bridge L1; F-Q-6-E Ramp B 4e/4o IN-PROCESS 6/6 closure 2026-05-13
> (LiH + 5 CMT scaffolds via RFC 034+035 farr-NM, Δ 11.7-274 µHa);
> Ramp B-2 4e/5o (8-qubit) in-process **6/6** closure same day — LiH 790 µHa
> + clc1/sar1/mfn2/hd6 in chem-acc + **gjb1 40.27 µHa @ maxiter=4000 stretch**;
> +ADAPT-VQE LiH 4e/4o **0.043 µHa** (62% param-reduction vs UCCSD-26) +
> k-UpCCGSD strict-subspace plateau at 344 µHa; **Ramp B-3 4e/6o (10-qubit)
> in-process 6/6 closed 2026-05-14** — lih 272 / clc1 403 / sar1 440 / mfn2
> 122 / hd6 5.55 / gjb1 1090 µHa (92-param NM × 631-1819 Pauli; ~24 min
> wall); via hexa-lang RFC 036
> (`farr_int_array` packed int64_t* handle) + RFC 037 (Hamiltonian
> expectation batch kernel) + RFC 039 (parameter-shift
> gradient kernel + raw-helper refactor; enables hexa-native L-BFGS-B).
> only** — category (a) measures in-repo software / formalism /
> infrastructure. Category (b) v5 Lean stretches and category (c)
> wet-lab / IP / hardware adoption are **explicitly out-of-software-scope**
> (per [`CLOSURE_RESIDUAL_BACKLOG.md`](CLOSURE_RESIDUAL_BACKLOG.md) §0).
> C2 PASS verifies in-silico simulator+metadata internal consistency
> only — it is **NOT** therapeutic, clinical, regulatory, immunogenic,
> or efficacy progress. C3+ (wet-lab → IND → phase I) is explicitly
> out-of-repo. **All 5 axes (synthetic biology / CRISPR / virocapsid /
> ribozyme catalysis / pocket VQE) are scientifically UNPROVEN at the
> wet-lab boundary** — closure here is software-bookkeeping, never a
> medical or empirical claim. Real-limits anchors (DNA fidelity,
> Eyring k_cat, Caspar-Klug ΔG, ATP cost, CRISPR off-target floor):
> see [`LIMIT_BREAKTHROUGH.md`](LIMIT_BREAKTHROUGH.md).

> **Distribution**: GitHub canonical at <https://github.com/dancinlab/hexa-bio>.
> CLI tooling — installed via `hx install hexa-bio` from the hexa-lang
> package registry. (HF Hub mirror retired 2026-05-04: HF Hub is designed
> for ML model weights / datasets; CLI tooling distribution is
> GitHub-canonical.)

---

## What is hexa-bio?

`hexa-bio` is a **standalone Molecular Toolkit** that exposes a **5-axis**
write-side molecular sandbox. It is the empirical companion to
`canon/domains/biology/` and the canonical extraction-of-record for the
WEAVE axis (cycle 24, 2026-04-29 → standalone 2026-05-04).

Four of the axes are bio "verbs" that form the **tetrahedron** of the n=6
invariant lattice (the τ(6)=4 quartet); the fifth axis (`quantum`) is the
external compute bridge layered across all four — VQE for molecular
electronic structure, plus ML pilots (ProteinMPNN / Boltz-2 / RhoFold+):

```
                          ┌──────────────┐
                          │   composition│
                          │    (WEAVE)   │
                          └───────┬──────┘
                                  │
                  ┌───────────────┼───────────────┐
                  │               │               │
       ┌──────────▼──────┐  ┌─────▼──────┐  ┌────▼────────┐
       │   actuation     │  │  catalysis │  │  assembly   │
       │   (NANOBOT)     │  │  (RIBOZYME)│  │ (VIROCAPSID)│
       └─────────────────┘  └────────────┘  └─────────────┘
                  │               │               │
                  └───────────────┼───────────────┘
                                  │  (compute substrate spanning all 4)
                          ┌───────▼──────────┐
                          │   computation    │
                          │  (QUANTUM —      │
                          │   qpu_bridge VQE)│
                          └──────────────────┘
```

The **5-axis framework is locked** (`.roadmap.axis_expansion_decision_2026_05_08`):
four 6th/7th-axis candidates (BIO-EVOLUTION, QUANTUM-BIOLOGY,
PLANETARY-HEALTH, CONSCIOUSNESS) were all reject/defer — selectivity = rigor.
Cross-cutting platform layers and disease-orthogonal entries absorb the
salvageable content without inflating the axis count.

`weave` is the only axis with a full numerical empirical sandbox at v1.0.0
(T=1 60-subunit icosahedral cage; posterior 0.97). `nanobot` / `ribozyme` /
`virocapsid` ship a C0b skeleton simulator + σ(6)=12 STRUCTURAL-EXACT(-CANDIDATE)
verification + falsifier preregister. `quantum` is at Phase 1+ (H₂/LiH VQE
+ ML pilot smokes; pocket-VQE F-Q-6 is the open Phase C gate).

---

## Status

- **v1.0.0** released; **v1.1.0 candidate** drafted (see [`RELEASE_NOTES_v1.1.0.md`](RELEASE_NOTES_v1.1.0.md))
- **5-axis lock**: QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID (per `.roadmap.axis_expansion_decision_2026_05_08`)
- **v1.x category-(a) closure = 100% across all 5 axes** (cycle-30++++++++, 2026-05-13)
- `selftest/run_all.sh` → **35/35 PASS** on dev host (deterministic in-repo gates; SKIP-clean substrate gates included)
- **n=6 invariant lattice**: σ(6)=12 · τ(6)=4 · φ(6)=2 · J₂=24 · master identity σ·φ = n·τ = 24
- **16-cell C2 matrix** (4 bio axis × 4 disease class) — **16/16 PASS** at IN-SILICO grade (cycle 25)
- **Category (b) v4 Lean semantics**: ALL 4 axes at v4 maximum (sorry-count=0; `lake build N6` → 900/900 jobs PASS)
- **Category (c) wet-lab / IP / hardware**: explicitly out-of-software-scope (handed off to CRO / patent counsel / quantum vendors)
- Parent: [`dancinlab/echoes`](https://github.com/dancinlab/echoes); GitHub canonical at <https://github.com/dancinlab/hexa-bio>
- **Health**: all 5 axes scientifically UNPROVEN at the wet-lab boundary — closure here is software-bookkeeping, never a medical or empirical claim

### 2026-05-16 — AXIS governance + axis expansion LAYER + new in-silico dirs

- **Core stays 5** (`AXIS.tape` SSOT UNCHANGED; the axes-5 lock + count-honesty `g2`/`f_lattice_fit` unchanged — count is an architectural decision, NOT lattice-derived).
- **`AXIS/` governance docs**: [`AXIS/README.md`](AXIS/README.md) (rigorous synthesis — recommendation: **KEEP 5-axis**, 6th deferred post-1.0) · [`AXIS/INDEX.md`](AXIS/INDEX.md) (imagination-only 60-axis brainstorm + 1차/2차 triage — **ZERO governed standing**, fenced) · [`AXIS/HIERARCHY.tape`](AXIS/HIERARCHY.tape).
- **Axis expansion LAYER** (`AXIS/HIERARCHY.tape`, **USER DIRECTION 2026-05-16, NON-core**): COVALENT + BIFUNCTIONAL registered **expansion-MAIN** + sub-tree (PROTAC/LYTAC/AUTAC/RIBOTAC/glue :> BIFUNCTIONAL · ALLOSTERIC/CRYPTIC/PPI :> QUANTUM · PEPTIDE/MACROCYCLE :> WEAVE; THERANOSTIC UNPLACED — scope-mix). This **overrides** the `AXIS/README.md` §4 keep-5 *recommendation* per explicit user direction; that rigorous dissent is **preserved verbatim**, not erased. Expansion ≠ core; in-silico-only scope; no lattice-fit; no clinical claim; disease re-mapping NOT executed (decision record only).
- **`drylab/`** (in-silico simulator bench): 11 stdlib deterministic simulators (a2_cg_unfolding · shear_langevin_bd · aav_vector_optimizer · shear_phase_diagram · vwf_multimer_kinetics · dhs_force_spectroscopy · aav_capsid_assembly · a2_adamts13_pose · lvad_shear_reduced_order · ribozyme_eyring_kcat · ml_capsid_fitness + cryptic_pocket_exposure), all `__DRYLAB_*__` sentinel PASS — **in-silico simulator-consistency ONLY** (g8/f2), no clinical claim. Mirror-ledger of `CLOSURE_RESIDUAL_BACKLOG` ("buildable in software, mislabeled external").
- **`LVAD/`** (scenario portfolio): ①②③⑥ LVAD in-silico scenarios + Zhang-2009 `g1`/`g3` corrections (k_cat 2.5→0.14/s, ΔG 7-10→3.9 kcal/mol, LION-CS101 LMNA→LGMD2I fact-fix) — in-silico premise-consistency only, no therapeutic claim.

---

## Axis surface (as of HEAD)

> **Honesty fence (`g8` / `f2`)**: every count below reports an IN-SILICO
> architectural / gate state. A PASS / HOLD / DETERMINISTIC verdict
> verifies simulator-consistency of a preregistered condition ONLY —
> NEVER a therapeutic, clinical, regulatory, immunogenic, efficacy,
> potency, selectivity, or wet-lab claim. Axis counts are an architectural
> decision (`f_lattice_fit`), NOT derived from any n=6 lattice scalar.
> The **core 5 axes are UNCHANGED** (`AXIS.tape` SSOT lock) — the
> expansion layer below is a SEPARATE governed decision record per
> [`AXIS/HIERARCHY.tape`](AXIS/HIERARCHY.tape) (USER DIRECTION 2026-05-16),
> and the rigorous keep-5 dissent in [`AXIS/README.md`](AXIS/README.md)
> §4 is preserved verbatim, not erased.

| Layer | Count | Members | SSOT |
|---|---|---|---|
| **Core axes** (UNCHANGED) | 5 | QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID | [`AXIS.tape`](AXIS.tape) |
| **Expansion-MAIN** (NON-core) | 4 | COVALENT · BIFUNCTIONAL · METALLODRUG · OLIGONUCLEOTIDE | [`AXIS/HIERARCHY.tape`](AXIS/HIERARCHY.tape) §1 |
| **Sub-axes** (:>parent) | 15 | 6 :> BIFUNCTIONAL (PROTAC · LYTAC · AUTAC · RIBOTAC · COVALENT-DEGRADER · MOLECULAR-GLUE) · 3 :> QUANTUM (ALLOSTERIC · CRYPTIC-POCKET · PPI) · 2 :> WEAVE (PEPTIDE · MACROCYCLE) · 2 :> RIBOZYME (RNA-TARGETING-SMALL-MOLECULE · APTAMER) · 1 :> VIROCAPSID (CAPSID-ASSEMBLY-MODULATOR) · 1 :> COVALENT (REVERSIBLE-COVALENT) | [`AXIS/HIERARCHY.tape`](AXIS/HIERARCHY.tape) §2 |
| **TOTAL** | **24** | 5 core + 4 expansion-main + 15 sub | architectural — see [`AXIS/README.md`](AXIS/README.md) §4 (keep-5 dissent preserved) |

**Gate-aggregated surface** (auto-generated dashboard
[`AXIS/STATUS.md`](AXIS/STATUS.md), 2026-05-16; SSOT for these numbers):

| Surface | Count | Detail | Source |
|---|---|---|---|
| **Cross-axis bridges** | 17 | A1–A5 + F1–F3 + G1–G5 + J1–J3 + 1 three-axis bridge (`_python_bridge/module/*_cross.py`). Each imports both sides' sims (no fork — `f3`), draft-07 schema, honesty-fenced (math-equiv ≠ mech-equiv; comparison ≠ ranking). A bridge is NOT a new axis — core-5 unchanged. | [`AXIS/STATUS.md`](AXIS/STATUS.md) §5 |
| **Case studies** | 4 | One-disease in-silico pilots (`case_studies/`): hiv1 · kras_g12c · mpro_covid · sma. NOT the 200-disease deferred work. UNPLACED handling (CBER scope) is structurally honest via `axis=null` schema const. | [`AXIS/STATUS.md`](AXIS/STATUS.md) §6 |
| **Falsifiers HOLD** | 12 | F-METALLODRUG-1/2/3 + F-OLIGO-1/2/3 + F-COVALENT-1/2/3 + F-BIFUNCTIONAL-1/2/3. 0 FALSIFIED · 0 SKIP. Eyring prefactor independently re-derived from CODATA 2019 inside the gate. `__FALSIFIER_EXECUTION_GATE__ PASS`. | [`AXIS/STATUS.md`](AXIS/STATUS.md) §3 |
| **Tier roster (44 sims)** | 42 🟢 + 1 🔵 + 1 🟠 + 0 🔴 | 🟢 SUPPORTED-NUMERICAL 42 · 🔵 SUPPORTED-FORMAL 1 (`lean4_proof_witness_emit`) · 🟠 DEFERRED 1 (`metallodrug_quantum_vqe_cross` live-VQE hand-off — `g7` honest) · 🔴 FALSIFIED 0. Reporter, not enforcer. `__HEXA_VERIFY_TIER_BATCH__ PASS`. | [`AXIS/STATUS.md`](AXIS/STATUS.md) §2 |
| **Determinism gate** | 32 DETERMINISTIC | Each sim run twice under `PYTHONHASHSEED=0`, byte-identical stdout. 0 NON_DETERMINISTIC · 0 SKIP. `__DETERMINISM_REGRESSION_GATE__ PASS`. | [`AXIS/STATUS.md`](AXIS/STATUS.md) §4 |

**UNPLACED (honest, NOT code axes)**: THERANOSTIC (radioligand,
CDER+CDRH scope mix S=0.8 — see
[`AXIS/THERANOSTIC_SCOPE.md`](AXIS/THERANOSTIC_SCOPE.md) for the
deferred FOR/AGAINST scope-resolution record) · GENETIC-MEDICINE
(CBER) · ADC (CBER antibody scope). All three fail criterion #4
(drug-only / CDER); implementing them as code axes would breach `g8`.

**Pointers**:
- [`AXIS/README.md`](AXIS/README.md) — rigorous / governed axis doc (§4 keep-5 dissent preserved verbatim; §6 Top-5 candidate fact-check; §7 USER DIRECTION override record)
- [`AXIS/HIERARCHY.tape`](AXIS/HIERARCHY.tape) — registration SSOT for the expansion layer (§1 main · §2 sub-tree · §2.5–§2.13 cross-axis rounds A/F/G/J + infra gates + case studies)
- [`AXIS/STATUS.md`](AXIS/STATUS.md) — live auto-generated dashboard (counts above; refreshes via `selftest/status_md_generator.py`)
- [`AXIS/THERANOSTIC_SCOPE.md`](AXIS/THERANOSTIC_SCOPE.md) — deferred scope-resolution document (FOR 5 / AGAINST 5; document does NOT decide, UNPLACED status remains in force)
- [`CHANGELOG.md`](CHANGELOG.md) — session chronology cross-linking all per-tape Logs

> **Reminder**: this section reports architecture + gate-aggregated
> sentinels. None of the numbers above is a wet-lab, clinical, regulatory,
> immunogenic, efficacy, potency, selectivity, DC50, Dmax, or therapeutic
> claim (`g8` / `f2`). Per-axis details + cross-link tables live in the
> SSOT files linked above; the 5-axis status table below remains the
> deepest per-core-axis closure-grade record.

---

## Install

```bash
# 1. Install hexa-lang (gives you `hexa` + `hx` package manager)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dancinlab/hexa-lang/main/install.sh)"

# 2. Install hexa-bio
hx install hexa-bio
```

## Run

```bash
hexa-bio weave            # protein cage / polyhedral self-assembly        [WIRED]
hexa-bio nanobot          # molecular actuation primitive                  [C0b skeleton]
hexa-bio ribozyme         # RNA-catalyst primitive                         [C0b skeleton]
hexa-bio virocapsid       # viral capsid assembly primitive                [C0b skeleton + PDB corpus]
hexa-bio quantum          # qpu_bridge VQE / ML pilot compute axis (5th)   [Phase 1+; F-Q-1…5 PASS]
hexa-bio status           # 5-axis status table + verdict + caveats
hexa-bio selftest         # full 5-axis sentinel sweep + 16-cell C2 sweep
```

---

## 5-axis status table

| Axis | Role | n=6 lattice verification | v1.x closure-grade (2026-05-12, cycle-30) | Residual cat. | Empirical sandbox |
|------|------|--------------------------|---------------------------------|---------------|-------------------|
| `weave` | composition | STRUCTURAL-EXACT (T=1, post 0.97) | ✅ **~100%** | — | cage-assembly ODE + Bayesian audit |
| `virocapsid` | assembly | STRUCTURAL-EXACT (T=1 corpus + multi-T) | ✅ **~100%** — C5 schema lock + 4-fixture conformance ✅ · C3a + C3b (GATE-26-V-1b) CLOSED in-repo ✅ 2026-05-12 (VIPERdb v3.0 snapshot, **n=527** / 87 families / 15 T-strata; log10_BF 876.27) · **F-VIROCAPSID-1-c + F-VIROCAPSID-1-d CLOSED in-repo ✅ 2026-05-12 cycle-30** (`selftest/virocapsid_f_virocapsid_1c_1d_audit.py`: 1-c 3 proxy stratifications all PASS, 1-d annotation completeness mean 0.9930 / min 0.9526 across 7 fields; sentinel `__VIROCAPSID_F1C_F1D__ PASS`); residual: T=7/13/21 stretch **(b)** | — | VIPERdb-corpus T-number discrimination (n=527, σ(6)=12 = 12 pentamers ∀T incl. pseudo-T) + Caspar-Klug + Zlotnick cage-assembly ODE |
| `ribozyme` | catalysis | STRUCTURAL-EXACT-CANDIDATE (12-nt; deductive PASS) | ✅ **~100% (a)** — R-R1 (Nussinov MFE) / G26-RB-3 (Hamming off-target screen — pool n=206 via GENCODE v47 subset **+ FULL GENCODE v47 pc-transcriptome screen EXECUTED via RIsearch2 v2.1**, summary vendored) / G26-RB-2 (J₂=\|S₄\|=24 quotient) / G26-RB-1′ (4-state kinetics sim re-impl, F-RB-4 6/6) + **A1.1/A1.2/A1.3 robustness sentinels CLOSED cycle-30** (kinetics ±10% sweep / off-target threshold replay / Nussinov determinism stress) all in-repo ✅ 2026-05-12; residual: wet-lab confirmation **(c)** out-of-software-scope | (c) only | hammerhead 4-state kinetics (Eyring TST, k_cat≈0.6/min) + Nussinov MFE + Hamming off-target screen + RIsearch2 v2.1 vs GENCODE v47 pc-transcriptome |
| `nanobot` | actuation | STRUCTURAL-EXACT-CANDIDATE (12-vertex; deductive PASS) | ✅ **~100% (a)** — N-R1 v2 reference emitter ✅ · C0d cuboctahedron dual-skeleton actuation sim re-impl ✅ · **N-R2 hexa-bio-side LOCKED v1.0.0 ✅ 2026-05-12** (`handoff_l6_emission_v0.schema.json` `lock_metadata`, emission unblocked, verified consistent w/ canon@mk1 `raw_77_therapeutic_nanobot_l7_acceptance_v1` DECLARED; vendored ref `nanobot/spec/canon_l7_acceptance_handoff_ref.json`; F-NB-1-c ratio 0.0 PASS); residual: wet-lab/IP **(c)** out-of-software-scope — not a v1.x software blocker | (c) only | 4-state DNA-origami actuation sim (work 50 kT, J₂=24 pose-canon) — both truncated-icosahedron & cuboctahedron skeletons |
| `quantum` | computation | VERIFIED (H₂ 6-Pauli / LiH path) + pocket-scale (F-Q-6-D) + library-ranking (F-Q-6-F) + **F-Q-6-E LANDED at 6 sub-tiers cycle-30++++++++** + **GATE-26-2 v4 ALL AXES ✅ cycle-30++++++** | ✅ **~100% (a)** — F-Q-1…5 + F-Q-EXT-1…6+ + **F-Q-6-D PASS** (Mpro pocket VQE sub-µHa, `tests/mpro_pocket_vqe_v7.py`) + **F-Q-6-F PASS** (5-warhead library ranking, `tests/mpro_warhead_library_vqe_v7.py`) + **F-Q-6-E LANDED 2026-05-13 cycle-30++++++++** at five sub-tiers: (a) 2e/2o pure-hexa UCCSD over all 5 CMT scaffolds (qmirror `chemistry_vqe_cmt_hamiltonians.hexa`, << 1 µHa vs CASCI(2,2)); (b) 4e/4o vendored ψ* replay over all 6 molecules (LiH + 5 CMT, qmirror `chemistry_vqe_cmt_4e4o_<name>.hexa` per-molecule, Δ 0.0005-17.78 µHa vs CASCI(4,4)); (c) **Ramp B EXTERNALIZED variational closure on LiH 4e/4o** (pure-hexa physics via `chemistry_vqe_cmt_uccsd_lih_4e4o_oneshot.hexa` + Python-stdlib NM driver — Δ=494.8 µHa, **3× under 1.6 mHa chem-acc bound**, 58.5% HF→CASCI gap recovery, 5.7-min wall @ maxiter=5); (d) **Ramp B IN-PROCESS variational closure 6/6** on LiH + 5 CMT scaffolds at 4e/4o (qmirror `chemistry_vqe_cmt_uccsd_<name>_4e4o.hexa`) via hexa-lang **RFC 034** (whole-loop Pauli C kernels) + **RFC 035** (whole-NM-step C kernels — gjb1 only, lifts maxiter cap from ~200 to ≥500), Δ range 11.7-274 µHa, ~10-18s wall/scaffold; (e) **Ramp B-2 4e/5o (8-qubit) full NM closure 6/6** — LiH 790 µHa @ 9s + clc1 457 / sar1 630 / mfn2 311 / hd6 15 µHa @ maxiter=500 + **gjb1 40.27 µHa @ maxiter=4000 stretch (305s wall)** via per-scaffold modules `chemistry_vqe_cmt_uccsd_<name>_4e5o.hexa`, `HEXA_MEM_CAP_MB=2048`; +**ADAPT-VQE 17/17 across 4e/4o + 4e/5o + 4e/6o** (LiH 4e/4o **0.043 µHa @ K=10** + 5 CMT 4e/4o 5/5 PASS (K range 2-18, |Δ| 1.95-50.6 µHa, hd6 collapses to K=2/3.67 µHa/3s); LiH 4e/5o **0.05 µHa @ K=14** + 5 CMT 4e/5o 5/5 PASS (K range 2-35, |Δ| 4.28-371 µHa, hd6 again K=2/4.28 µHa/8s); **LiH 4e/6o K=25 10.88 µHa @ 1050s** + 5 CMT 4e/6o 5/5 PASS (K range 2-40, |Δ| 4.28-1392 µHa, hd6 K=2/4.28 collapse continues at 10-qubit); ADAPT is a param-count win (2-43% of 92-op UCCSD pool at 4e/6o) — LiH only scaffold where ADAPT also beats NM on |Δ|, NM tends tighter on the rest. RFC 039 PS-grad swap is the pending lever for wall-win) +**k-UpCCGSD** (LiH 4e/4o 344 µHa plateau, strict-subspace ceiling) +**10-diatomic bench 9/11 PASS** (h2 / lih / lih_4e5o / beh2 / h2o / nh3 / n2 / co / ch4 all reproduce CASCI within 0.29-84.8 µHa; hf / f2 marked NOT_AVAILABLE_STO3G — basis-set limit, NOT a qmirror gap — first independent verification beyond CMT scaffolds); enabled by hexa-lang **RFC 036** (`farr_int_array` packed int64_t* handle — unblocks 4e/6o+ without env hatch) + **RFC 039** (parameter-shift gradient kernel + raw-helper refactor; enables hexa-native L-BFGS-B with O(1) grad evals); **Ramp B-3 4e/6o (10-qubit) IN-PROCESS 6/6 CLOSED 2026-05-14** — lih 272 / clc1 403 / sar1 440 / mfn2 122 / hd6 5.55 / gjb1 1090 µHa (maxiter=2000 for 5, maxiter=4000 for gjb1; HEXA_MEM_UNLIMITED=1; 92-param NM × 631-1819 Pauli; ~24 min total wall + 21 h offline extraction; `selftest/cmt_uccsd_4e6o_readiness.sh` PASS); + **GATE-26-2 hexa-bio-side ✅ CLOSED 2026-05-12 cycle-30++++++**: hexa-meta `formal/lean4/` **ALL 4 AXES AT v4 MAXIMUM SEMANTICS — Axis 1 REAL + Axes 2/3/4 all v4** (sorry-count=0, kernel-checked on lean4 v4.30.0-rc2 + Mathlib SHA pinned; `lake build N6` → 900/900 jobs PASS; hexa-meta commits `a9b5722` → `350798c` → `79bb661` → `2c68bea` → `9e44e75` → `2680f88` → `7c0ec92`); Axis 2 substrate-polymorphic over `[AddCommGroup E] [LinearOrder E] [IsOrderedAddMonoid E]` + opaque positive `floor : E`; Axis 3 `Prod.lex` `WellFoundedRelation` recursion on `(depth, sz)`; Axis 4 `[CommMonoid β]` payload over `Finset (α × β)` + `totalCaveatPayload`. **The v1 → v2 → v3 → v4 abstraction trajectory is now EXHAUSTED** for the WEAVE-mechanical consumer contract; concrete-substrate factorisations are RECOVERABLE at consumer sites by instantiating v4 parameters. v4 PASS for all 3 v4 axes EXCEEDS v2.0.0 GATE-26-2 cert-strength. State ref v2 + `lean4_proof_witness_emit.py` `--refresh` from hexa-meta main; Π¹₁-CA₀ → `decide`/RCA₀-level re-scope for the finitary slice (per `docs/closure_100_research_2026_05_12.md` §C). Remaining: v5 stretches per axis (cycle-30+++++++, NOT a v1.x or v2.0.0 blocker) + MechVerif legacy sorries (FROZEN in nexus/canon-infra) | (b) v5 stretch only | VQE (H₂ 0.4 µHa, LiH 1.41 mHa) + Mpro pocket VQE + 5-warhead library ranking + 11-drug pocket library + ML pilots |

**Residual categories** (for the "remaining" parenthetical in each row) — full enumeration in [`CLOSURE_RESIDUAL_BACKLOG.md`](CLOSURE_RESIDUAL_BACKLOG.md):
- **(a) in-repo software** — closeable by code/test work in this repo; counts against v1.x closure-grade. ✅ **100% REACHED 2026-05-12 cycle-30** — all 4 items CLOSED (ribozyme A1.1/A1.2/A1.3 + virocapsid A2.1 Zlotnick ODE CLI; see [`CLOSURE_RESIDUAL_BACKLOG.md`](CLOSURE_RESIDUAL_BACKLOG.md) §A).
- **(b) v4 formal semantics** — cycle-30++/+++/++++/+++++/++++++ Lean / Mathlib work; tracked in [`.roadmap.lean4_formal`](ARCHITECTURE.json). ✅ **ALL 4 axes at v4 maximum semantics 2026-05-12 cycle-30++++++** — Axis 1 REAL, Axes 2 + 3 + 4 all v4 PROVEN (substrate-polymorphic energy `[AddCommGroup E] [LinearOrder E] [IsOrderedAddMonoid E]` + opaque positive `floor : E`; `Prod.lex` `WellFoundedRelation` recursion; `[CommMonoid β]` payload over `Finset (α × β)` + `totalCaveatPayload`); `lake build N6` → 900/900 jobs PASS. The v1 → v2 → v3 → v4 abstraction trajectory is now EXHAUSTED. Remaining: v5 stretches per axis (ring/module on E, verifier-strategy typeclass, Finsupp key-collapsing payload) deferred to cycle-30+++++++, **NOT a v1.x or v2.0.0 blocker** (§B). MechVerif legacy + Theorem B residual sorries remain FROZEN in legacy-canon.
- **(c) out-of-software-scope** — wet-lab / IP / hardware adoption; does NOT count as a software closure gap; handed off via sister-repo / canonical / external-vendor channels. **100% IMPOSSIBLE in software** — closeable only via external counterparties (CRO, patent counsel, quantum vendors). 9 of 11 items currently have no destination repo / vendor selected (§C).

The v1.x closure-grade percentages above measure category **(a)** only. Categories **(b)** and **(c)** are tracked separately and explicitly out-of-scope for the v1.x track terminal.

Verdict: ✅ **PASS — v1.x track terminal REACHED for all 5 axes** when judged on category (a), the only category v1.x measures. All 5 axes at ~100% (a): weave / virocapsid / ribozyme / nanobot / quantum. Category (b) v3.0.0 cert-strength has also been EXCEEDED (hexa-meta `formal/lean4/` all 4 axes at v4 maximum semantics; `lake build N6` → 900/900 jobs PASS; commit `7c0ec92`). Category (c) wet-lab/IP/hardware is out-of-software-scope per [`AGENTS.md`](AGENTS.md) external-contact deferral policy. The v1 → v2 → v3 → v4 abstraction trajectory is exhausted for the WEAVE-mechanical consumer contract. Per-axis gates / deadlines / owners: [`AXIS_CLOSURE_PLAN.md`](AXIS_CLOSURE_PLAN.md).

### In-repo / deductive closure status (2026-05-12)

The **in-repo, deductively-checkable portion of closure is now complete for
all 5 axes**:

- `selftest/n6_axis_computational_verification.py` — deterministic σ(6)=12 /
  τ(6)=4 / φ(6)=2 / J₂=24 + master-identity verification across Q/W/N/R/V
  (**42/42 checks PASS**, no human raters, no live simulation).
- `_python_bridge/module/ribozyme_mfe_nussinov.py` — Nussinov MFE solver
  inline port (closes ribozyme **R-R1**; `dot_bracket='stub'` deprecated).
- `_python_bridge/module/ribozyme_off_target_screen.py` — ribozyme **G26-RB-3** off-target screen:
  Hamming sliding-window scan (arm + reverse-complement, per-arm per-kb gate; 4/4 self-check) over a
  reference pool = 6-mRNA toy + (CUG)ₙ low-complexity decoy + **GENCODE v47 pc-transcript subset n=200**
  (`ribozyme/spec/human_transcript_pool_snapshot.json`, `--refresh-gencode` rebuilds, `--full-pool` runs
  vs all 206); **+ a FULL GENCODE v47 pc-transcriptome screen EXECUTED via RIsearch2 v2.1** (`-s 6 -e -22 -z t04`;
  per-query summary vendored `ribozyme/spec/gencode_v47_offtarget_risearch2_summary.json`, `--full-screen-results`;
  designed 14-nt arms → PASS, GC-rich / (CUG)ₙ arms → flood 24.8k–1.37M off-targets → FAIL; the RIsearch2
  binary + the 48 MB FASTA aren't vendored — `--gencode-pipeline-doc` reproduces).
- `_python_bridge/module/ribozyme_reaction_coordinate_quotient.py` — ribozyme
  **G26-RB-2** branch-lock: J₂ = |S₄| = 4! = 24, S₄ ≅ O (octahedral), regular
  action on the 24 catalytic-ladder orderings (14/14 deductive checks PASS).
- `_python_bridge/module/ribozyme_kinetics_simulation.py` — ribozyme **G26-RB-1′**
  sim re-run: stdlib re-implementation of the R5-sunset hammerhead 12-nt 4-state
  kinetics simulator (Eyring TST → k_cat≈0.6/min, K_M≈0.12 µM, Eigen-Hammes margin
  4.08 orders; 4-state RK4/Euler/analytic ODE; F-RB-4 6/6 PASS).
- `tests/mpro_pocket_vqe_v7.py` — quantum **F-Q-6 / L3** Mpro [Cys145 thiolate +
  His41 imidazolium + nirmatrelvir nitrile] pocket-cluster VQE (2e/2o → 2 qubit →
  sub-µHa 0.0001 µHa vs CASCI(2,2)) — needs the `~/.hexabio_venv` qiskit/pyscf stack.
- `tests/mpro_warhead_library_vqe_v7.py` — quantum **F-Q-6-F (Phase D)** 5-warhead
  covalent-Mpro-inhibitor library ranking: gas-phase model ΔE_rxn per warhead
  (nitrile/aldehyde/α-ketoamide/Michael/CF3-ketone), each fragment at sto-3g / 2e-2o → 2 qubit →
  VQE vs CASCI(2,2) — all 11 fragments VQE=CASCI sub-µHa; ranking α-ketoamide < CF3-ketone < aldehyde
  < Michael < nitrile (qualitative reactivity ordering — not a ΔG/affinity claim).
- `_python_bridge/module/lean4_proof_witness_emit.py` + `weave/spec/canon_lean4_state_ref.json` —
  GATE-26-2 consumer witness-emit: absorbs the `dancinlab/canon@mk1` lean4 state (the `formal/lean4/`
  4-axis STUB LANDED [4-sorry, cycle-30+] + the `lean4-n6/N6/` Theorem B σ·φ=n·τ⟺n=6 **essentially fully
  proven** [~4473 ln, ~2 sorry, ~99.99%]) and emits the 4 `raw_77_lean4_proof_witness_v0` rows.
  Hexa-bio holds no `.lean` files by design — only the scaffold spec + the witness emitter + the state ref.
- `nanobot/spec/canon_l7_acceptance_handoff_ref.json` + `nanobot/spec/handoff_l6_emission_v0.schema.json`
  (`lock_metadata`) + `nanobot/spec/proposed_l7_l9_witness_schemas/` (3 schemas + README) +
  `_python_bridge/module/nanobot_l6_l7_contract_test.py` — N-R2 hexa-bio-side lock + the L7-L9 acceptance
  schemas DRAFTED (consumer-proposed; canon adopts): a READ-ONLY ref copy of `canon@mk1`'s
  `raw_77_therapeutic_nanobot_l7_acceptance_v1` (DECLARED v1.0.0-stub) + the L6 emission schema locked v1.0.0
  (emission unblocked, `consumed_by_l7_l9` mapping) + 3 consumer-proposed L7-L9 per-layer witness schemas
  (`raw_77_therapeutic_nanobot_l7_drug_load_v1`/`_l8_immune_evasion_v1`/`_l9_biodistribution_v1`, derived from the
  canon@mk1 handoff JSON's per-layer primitives) + a consumer-driven contract test (8/8 PASS — the L6 emitter
  provides every field each L7-L9 schema consumes, declarations == canon handoff's `consumes_from_l6`, F-NB-1-c ratio 0.0).
- `_python_bridge/module/virocapsid_pdb_corpus.py` — virocapsid **C3a + C3b (GATE-26-V-1b)**:
  re-implementation of the R5-sunset icosahedral-capsid corpus + Bayes σ(6)=12-vs-uniform{5..50}
  audit; the corpus is now sourced from **VIPERdb v3.0**'s JSON web service -> vendored snapshot
  `virocapsid/spec/viperdb_corpus_snapshot.json` (**n=527** / 87 families / 15 distinct T-strata;
  log10_BF 876.27, posterior 1.0 -> 7/7 C3a + 3/3 C3b PASS, `--refresh-viperdb` rebuilds) — i.e.
  **C3b is closed in-repo, not the cycle-28+ stretch any more**. Note: the three R5-sunset bio-axis
  simulators (`ribozyme_kinetics_simulation.py`, `nanobot_actuation_simulation.py`,
  `virocapsid_pdb_corpus.py`) are now all re-implemented in-repo from their documented
  MVP behaviour — reproducing the headline numbers; stochastic counts and the original
  4th-digit values aren't byte-reproduced (the originals are gone), which the docstrings
  state honestly.
- `virocapsid/spec/cage_output_v1.schema.json` `lock_metadata` + 4 conformance
  fixtures + `selftest/virocapsid_c5_conformance.py` — closes the in-repo part
  of virocapsid **GATE-26-V-R1 (C5)**.
- `_python_bridge/module/nanobot_actuator_v2_reference_emit.py` — `raw_77_nanobot_actuation_v2`
  reference emitter (closes the in-repo part of nanobot **N-R1**).
- `_python_bridge/module/nanobot_actuation_simulation.py` — nanobot **C0d** dual-skeleton
  re-run: stdlib re-implementation of the R5-sunset 4-state 12-vertex DNA-origami
  actuation simulator; runs both `truncated_icosahedron` & `cuboctahedron` skeletons,
  each F-NB-4 6/6 PASS (work 50 kT, J₂=24 pose-canon speedup 24×, no Brownian collapse).

All of the above are wired into `selftest/run_all.sh` as gate steps.

**Full v1.x axis-closure is *not* yet 100%** — the remaining work is
out-of-repo by construction (R5 sunset relocated the heavy simulators to
`~/core/nexus/sim_bridge/`, and `quantum`'s pocket-VQE is a separate compute
job): `quantum` **F-Q-6** (SARS-CoV-2 Mpro / nirmatrelvir pocket VQE — target
confirmed, ladder execution in a dedicated loop), `virocapsid` **C3b** (n≥100
RCSB PDB corpus + Bayesian re-audit ≥ 0.95), `nanobot` **C0d** (cuboctahedron
dual-skeleton sim re-run) + **N-R2** (canon-side L6 acceptance lock),
`ribozyme` **G26-RB-1′** (rubric sim re-run — values already in the MVP),
and **GATE-26-2** (all-axis lean4 cert → v2.0.0 — see [`docs/closure_100_research_2026_05_12.md`](docs/closure_100_research_2026_05_12.md) §C: the appropriate target is a `decide`/RCA₀-level Lean certificate, not Π¹₁-CA₀).
Per-axis grades, gates, deadlines and owners: [`AXIS_CLOSURE_PLAN.md`](AXIS_CLOSURE_PLAN.md).

For the full roadmap, see [`.roadmap.hexa_bio`](ARCHITECTURE.json)
(repo-overall: lattice / gates / cycle history / deadlines) and the
5 per-axis sister files: [`.roadmap.quantum`](ARCHITECTURE.json) ·
[`.roadmap.weave`](ARCHITECTURE.json) · [`.roadmap.virocapsid`](ARCHITECTURE.json) ·
[`.roadmap.nanobot`](ARCHITECTURE.json) · [`.roadmap.ribozyme`](ARCHITECTURE.json).
The integrated platform manifest (5 axes + 5 cross-cutting platform layers +
disease-orthogonal entries) is [`.roadmap.platform_index`](ARCHITECTURE.json).

---

## 16-cell C2 matrix (cycle 25, 2026-05-06)

Cycle 25 closed the C2 traversal of the **4 bio axis × 4 disease-class**
scaffold at IN-SILICO grade (the QUANTUM compute axis is tracked separately
via the F-Q-* ladder). Each cell ships a wrapper script in
`_python_bridge/module/*_candidate.py` that records candidate-spec metadata
annotated against publicly catalogued disease-class markers and verifies
via the corresponding C0b simulator. Each cell emits one
`raw_77_c2_<verb>_<class>_v1` witness row to
`state/discovery_absorption/registry.jsonl`.

| Axis \ Class    | α (AML) | β (SCD) | γ (pan-cov) | δ (senolytic) |
|-----------------|:-------:|:-------:|:-----------:|:-------------:|
| W (weave)       |   PASS  |   PASS  |     PASS    |      PASS     |
| N (nanobot)     |   PASS  |   PASS  |     PASS    |      PASS     |
| R (ribozyme)    |   PASS  |   PASS  |     PASS    |      PASS     |
| V (virocapsid)  |   PASS  |   PASS  |     PASS    |      PASS     |

Aggregate: **16/16 PASS** (in-silico verification of simulator+metadata
internal consistency only).

(a) the C0b simulator runs deterministically, (b) the candidate-spec
metadata schema validates, and (c) the verifier's internal consistency
check holds. It does **NOT** imply any therapeutic, clinical, regulatory,
immunogenic, pharmacokinetic, or efficacy property. The disease-class
markers are publicly catalogued reference annotations — not medical
claims. C3+ (wet-lab → in-vitro → in-vivo → IND → phase I) is explicitly
out-of-repo per cross-cutting Require (R6).

Per-row witnesses are archived under
[`design/kick/`](design/kick/) (`2026-05-06_hexa-{weave,nanobot,ribozyme,virocapsid}-c2-row-cycle25_omega_cycle.json`)
plus the aggregate
`2026-05-06_hexa-bio-cycle25-c2-matrix-closure_omega_cycle.json`.

---

## n=6 invariant lattice

The lattice anchors the toolkit to a single algebraic identity:

```
σ(6) = 12        STRUCTURAL-EXACT for T=1 cage (vertex count, posterior 0.97)
τ(6) = 4         4 bio axes / 4-state ladder (free / pentamer / hexamer / cage)
φ(6) = 2         binary dichotomy (free vs assembled)
J₂   = 24        octahedral O ⊂ icosahedral I subgroup

master identity:   σ · φ = n · τ = 12 · 2 = 6 · 4 = 24
```

`τ(6)=4` is the quartet of **bio** axes (weave / nanobot / ribozyme /
virocapsid) — the tetrahedron. `quantum` is the fifth axis (compute
substrate spanning all four); its n=6 binding is verified on the H₂
6-Pauli expansion (σ(6)=12 = 6 Pauli terms × 2 qubits) and the d=1
hardware-efficient ansatz (τ(6)=4 = 4 parametric rotations).

Per-axis interpretation (where empirically grounded vs hypothesized — see
`Caveats §3`):

| Symbol  | weave (verified)              | virocapsid (T=1 exact)            | nanobot (candidate)      | ribozyme (candidate)     | quantum (H₂/LiH verified)         |
|---------|-------------------------------|-----------------------------------|--------------------------|--------------------------|-----------------------------------|
| σ(6)=12 | cage vertex count             | T=1 cage (verified via weave)     | 12-vertex polyhedron     | 12-nt catalytic core     | 6 Pauli × 2 qubits = 12 ops       |
| τ(6)=4  | 4 ladder states               | 4 assembly stages                 | 4 mechanical regimes     | 4 reaction states        | 4 ansatz rotations (Ry·Ry·CX·Ry·Ry) |
| φ(6)=2  | free vs assembled             | assembled vs disassembled         | bound vs unbound         | bound vs free            | best_idx 0 vs other (symmetry break) |
| J₂=24   | I ⊃ O subgroup (geometric)    | I ⊃ O (T=1 exact; T>1 conjecture) | power-stroke trajectory  | reaction-coordinate grp  | σ·τ = 6 × 4 = 24 (eval surface)   |

---

## Architecture

```
~/.hexa-bio/                          (or set HEXA_BIO_ROOT)
├── cli/
│   └── hexa-bio.hexa           # 5-axis router + status + selftest
├── weave/module/weave.hexa              # WIRED — Caspar-Klug + Zlotnick (cage 60)
├── nanobot/module/nanobot.hexa          # C0b skeleton — DNA-origami actuation
├── ribozyme/module/ribozyme.hexa        # C0b skeleton — hammerhead RNA kinetics
├── virocapsid/module/virocapsid.hexa    # C0b skeleton — viral capsid assembly + PDB corpus
├── quantum/module/                       # QUANTUM axis — qpu_bridge VQE / ML pilots
│   ├── quantum.hexa                      #   axis dispatcher (status / falsifiers / n6 / pilot-runner)
│   ├── external_pilot_runner.hexa        #   ProteinMPNN / Boltz-2 / RhoFold+ pilot smokes
│   ├── n6_lattice_check.hexa             #   n=6 binding self-check
│   └── …                                 #   (closure_summary, registry_witness_emitter, …)
├── selftest/module/selftest.hexa        # 5-axis sentinel sweep + 16-cell C2 sweep
├── _python_bridge/module/
│   ├── cage_assembly_simulation.py        # weave ODE (numpy/scipy opt-in)
│   ├── polyhedral_cage_bayesian_audit.py  # weave Bayesian audit
│   ├── virocapsid_pdb_corpus.py           # virocapsid RCSB PDB corpus fetch (stdlib)
│   └── …                                  # (nanobot/ribozyme C0b sims, quantum_*.py adapters)
├── _absorption_bridge/                    # cycle-30++++++++ backport from hexa-matter Phase G —
│   ├── README.md                          # 9 protein-structure ML + sequence adapters
│   ├── pyproject.toml                     # optional deps (requests/biopython/mdanalysis/torch)
│   ├── alphafold3/  af3_smoke.py          # DeepMind AF3 (NON-COMMERCIAL RESEARCH ONLY)
│   ├── rosettafold/ rosettafold_smoke.py  # Baker Lab RoseTTAFold + RFAA (BSD/Apache)
│   ├── esmfold/     esmfold_smoke.py      # Meta ESMFold (MIT, single-sequence)
│   ├── openfold/    openfold_smoke.py     # OpenFold (Apache-2.0, trainable AF2 reimpl)
│   ├── colabfold/   colabfold_smoke.py    # ColabFold (MIT, AF2+MMseqs2)
│   ├── foldseek/    foldseek_smoke.py     # Foldseek structural search (GPLv3)
│   ├── mmseqs/      mmseqs_smoke.py       # MMseqs2 sequence search (GPLv3)
│   ├── uniprot/     uniprot_api_smoke.py  # UniProt REST (CC-BY 4.0)
│   ├── pdb/         pdb_api_smoke.py      # RCSB PDB REST (CC0)
│   └── selftest/    run_all.sh            # aggregator → __HEXA_BIO_ABSORPTION_BRIDGE__ PASS
├── tests/
│   ├── test_weave.hexa
│   ├── test_nanobot.hexa
│   ├── test_ribozyme.hexa
│   ├── test_virocapsid.hexa
│   ├── test_quantum.hexa
│   ├── test_quantum_pilot_runner.hexa
│   └── test_selftest.hexa
├── examples/
│   ├── 01_quick_weave.hexa
│   ├── 02_quick_nanobot.hexa
│   ├── 03_quick_ribozyme.hexa
│   └── 04_quick_virocapsid.hexa
├── design/kick/                # omega-cycle witness archive (cycle 24/25 closures,
│                               # schema `omega_cycle.witness_v1`)
├── install.hexa                # hx hook (pre/post)
├── hexa.toml                   # package manifest
├── LICENSE                     # Apache-2.0
├── CHANGELOG.md
└── README.md                   # (this file)
```

---

## Provenance

- WEAVE module **imported** from `nexus/sim_bridge/weave/` (cycle 24
  canonical, 2026-04-29). Original concept: `canon/domains/
  biology/hexa-weave/hexa-weave.md` empirical companion.
- NANOBOT / RIBOZYME / VIROCAPSID modules created **fresh** during this
  extraction (2026-05-04) — no prior nexus implementation existed beyond
  .roadmap / atlas.append marker entries (e.g.
  `nexus/n6/atlas.append.hexa-nanobot-domain-registration.n6`). Their
  C0b skeleton simulators landed in cycle 24–26.
- QUANTUM axis (`quantum/module/`) created **fresh** in the hexa-bio
  session (per user directive 2026-05-07) as the qpu_bridge dispatcher;
  the Python VQE adapters (`_python_bridge/module/quantum_*.py`) bridge
  the [`qmirror`](https://github.com/dancinlab/qmirror) CLI (ANU
  QRNG + Aer state-vector simulator). See [`.roadmap.quantum`](ARCHITECTURE.json).
- Sister extractions:
  - `qmirror` v2.0.0 (registry L22, GitHub dancinlab/qmirror)
  - `sim-universe` v1.0.0 (registry L23, GitHub dancinlab/sim-universe)
  - **hexa-bio v1.0.0 (registry L24)** ← this repo

---


1. **`weave` is the only fully-wired axis at v1.0.0.** `nanobot`,
   `ribozyme`, and `virocapsid` run a C0b skeleton simulator + print
   falsifier preregister tables; `quantum` is at Phase 1+ (H₂/LiH VQE +
   ML pilots, F-Q-6 pocket VQE open). The `__HEXA_BIO_*__ PASS` sentinels
   confirm only that the module loaded and dispatched cleanly; they do
   **not** validate any empirical claim.
2. **Falsifier deadlines for the non-`weave` axes are working dates.**
   Concrete experimental refutation criteria are tracked per-axis in the
   `.roadmap.*` sister files; revisions land per cycle as the empirical
   sandboxes mature.
3. **n=6 invariant lattice claim is empirically grounded only in parts.**
   `weave`'s σ(6)=12 (T=1 cage vertex count, posterior 0.97) and
   `quantum`'s σ(6)=12 (H₂ 6-Pauli × 2-qubit) are the empirically /
   structurally grounded bindings. `nanobot`'s 12-vertex polyhedron,
   `ribozyme`'s 12-nt core, and T>1 `virocapsid` carry the lattice claim
   as STRUCTURAL-EXACT-CANDIDATE pending independent verification.
4. **5-axis count is locked (`.roadmap.axis_expansion_decision_2026_05_08`).**
   Four 6th/7th-axis candidates (BIO-EVOLUTION, QUANTUM-BIOLOGY,
   PLANETARY-HEALTH, CONSCIOUSNESS) were reject/defer. Salvageable content
   lives in cross-cutting platform layers + disease-orthogonal entries
   (see `.roadmap.platform_index`). Annual axis-expansion review only.
5. **Migration of `nexus/sim_bridge/weave/` may break edge-case consumers.**
   Cross-link consumers (canon papers,
   `nexus/state/audit/cage_assembly_events.jsonl` readers) reference the
   old path; the path-migration shim is left to the nexus consumer
   refactor cycle. The `runs/` ledger (~10MB jsonl) is not vendored into
   this standalone repo by default.
6. **GitHub-only distribution (HF Hub mirror retired 2026-05-04).** HF Hub is
   designed for ML model weights / datasets, not CLI tooling. Maintenance
   burden (recurring token rotation failures) outweighed value. GitHub
   remains canonical at <https://github.com/dancinlab/hexa-bio>;
   HF Hub stays canonical for model weights / datasets in the wider stack.

---

## Repo layout

```
hexa-bio/
├── README.md                 # this file
├── AGENTS.md                 # long-form agent ops guide · sister-repo CLI rules · deferral policy
├── AGENTS.tape               # governance + identity (.tape v1.2)
├── CLAUDE.md                 # → AGENTS.tape (Claude Code auto-discovery)
├── LATTICE_POLICY.md         # real-limits-first verification policy (dancinlab-wide)
├── LIMIT_BREAKTHROUGH.md     # project-specific real-limits + breakthrough audit
├── COMPUTE_PORTFOLIO.md      # compute-substrate SSOT (qmirror · xeno · classical fallback)
├── CLOSURE_RESIDUAL_BACKLOG.md  # category (b)/(c) backlog · out-of-software-scope items
├── docs/                     # human docs · logo · per-cycle handoffs · research notes
├── hexa-weave/               # WEAVE axis · Caspar-Klug + Zlotnick cage assembly
├── hexa-nanobot/             # NANOBOT axis · C0b skeleton simulator
├── hexa-ribozyme/            # RIBOZYME axis · ribozyme catalysis sandbox
├── hexa-virocapsid/          # VIROCAPSID axis · viral capsid assembly
├── quantum/                  # QUANTUM axis · VQE pipeline via qmirror
├── bio-pharma/               # pharmaceutical workflow primitives
├── crispr-gene-editing/      # CRISPR primitives
├── crispr-cas13-poc-diagnostic/  # Cas13 POC diagnostic prototype
├── medical-device/           # medical-device category
├── genetics/                 # genetics primitives
├── biology/                  # general biology utilities
├── biology-medical/          # biology↔medical bridge
├── AXIS/                     # axis governance: README.md (rigorous, keep-5) · INDEX.md (imagination-only, ZERO standing) · HIERARCHY.tape (USER-DIRECTION expansion-layer, NON-core)
├── LVAD/                     # LVAD in-silico scenario portfolio (①②③⑥) + Zhang-2009 g1/g3 corrections
├── drylab/                   # in-silico simulator bench — 11 stdlib sims (simulator-consistency only, g8) · mirror-ledger of CLOSURE_RESIDUAL_BACKLOG
├── selftest/                 # 35-gate selftest suite (run_all.sh)
├── wetlab/                   # wet-lab templates · CRO RFP drafts · STATUS markers (DRAFT only — g9 deferral)
├── _absorption_bridge/       # 9 adapters · external library absorption
├── _python_bridge/           # Python→hexa witness emitters
└── _qiskit_bridge/           # legacy qiskit/aer bridge (retiring in favor of qmirror)
```

## License

Apache-2.0. See [LICENSE](LICENSE).

Optional Python aux deps (`numpy`, `scipy`, `qiskit-aer`) ship under their
own BSD-3 / Apache-2.0 licenses; in-process safe (no copyleft). hexa-bio
core stays Apache-2.0 under FSF MereAggregation.

---

## Sister repositories (live dependencies — CLI-direct, NO wrappers)

hexa-bio depends on multiple HEXA-family sister repos via **CLI / file-system reads**, not via
Python wrappers or shadow-copied code. Each is a separate canonical SSOT that
updates on its own cadence; hexa-bio picks up updates automatically through
CLI invocations. The full operating rules are in [`AGENTS.md`](AGENTS.md)
"Sister repositories — live dependencies". The **compute substrate × workload ×
readiness × fallback** matrix (and the universal fallback principle: every
substrate is optional; absence → SKIP, never FAIL) is in
[`COMPUTE_PORTFOLIO.md`](COMPUTE_PORTFOLIO.md).

**Live software dependencies**:

- **[`dancinlab/qmirror`](https://github.com/dancinlab/qmirror)** — ⚡
  **quantum-computer substitute** (IBM Cloud / IonQ / Quantinuum cloud-API
  replacement). NOT a QRNG-only bridge: it's a full pure-hexa quantum
  computation substrate combining:
  - ≤30-qubit **Aer-compatible state-vector kernel** (replaces qiskit-aer
    Python dependency; native hexa-lang implementation)
  - **ANU QRNG real quantum entropy** (free public API, 4-tier fallback)
  - **chemistry / molecular VQE pipeline** (cond.14: H₂ STO-3G/0.74Å
    sub-µHa via UCCSD + active-space CASCI; closure PASS)
  - **v2.1.0 = 14/14 closure conditions PASS** (8 v1.0 + 5 v2.0 + 1 v2.1)

  The `quantum` axis's upstream — replaces the IBM Cloud / IonQ /
  Quantinuum cloud APIs for any workload ≤30 qubits. No vendor cloud account
  / API key / budget needed. Future >30-qubit fault-tolerant workloads (10-yr
  horizon) would need a separate vendor partnership; current hexa-bio Mpro
  pocket / 5-warhead library / 11-drug pocket VQE workloads all fit in ≤30
  qubits and run on qmirror end-to-end.

  **Hexa-bio integration**: `selftest/qmirror_chemistry_vqe_gate.sh`
  invokes `hexa run ~/core/qmirror/chemistry_vqe/module/chemistry_vqe.hexa
  --selftest` directly (no Python wrapper); SKIP/PASS/FAIL semantics; wired
  into `selftest/run_all.sh`. qmirror updates pick up automatically via
  the CLI-direct call.
- **[`dancinlab/hexa-meta`](https://github.com/dancinlab/hexa-meta)** —
  formal-axis Lean4 layer (`formal/lean4/`, active after canon RETIRED
  2026-05-11). ✅ **ALL 4 axes at v4 maximum semantics** (cycle-30++++++,
  commit `7c0ec92`; `lake build N6` → 900/900 jobs PASS). hexa-bio reads via
  `_python_bridge/module/lean4_proof_witness_emit.py` `--refresh` from
  hexa-meta main; emits raw_77_lean4_proof_witness_v0 rows.
  **NO `.lean` files in hexa-bio by design.**

- **[`dancinlab/xeno`](https://github.com/dancinlab/xeno)** 🛸 — exotic
  compute substrate orchestrator (Tier C: neuromorphic + organoid +
  quantum-gate + random). Parallel to qmirror's quantum-computer-
  substitute role. **Single canonical doc**: [`XENO.md`](XENO.md).
  Gate: `selftest/xeno_substrate_gate.sh` (wired in `selftest/run_all.sh`).

**Family-related repos** (downstream consumers / cross-link):

- **[`dancinlab/florea`](https://github.com/dancinlab/florea)** 🌸 — cosmetic/
  aesthetic substrate (7-verb library: cosmetic-surgery, hair-regeneration,
  perfumery, tattoo-removal, mens/womens-intimate-cleanser, skincare).
  Standalone HEXA-family brand (no `hexa-` prefix, Lumière style). Spawned
  2026-05-12 cycle-30++++++ via hexa-medic decomposition. **hexa-bio
  relationship (2026-05-15 onward)**: downstream consumer via CLI shell-out —
  `florea analyze <verb>` delegates n=6 anchor verification / selftest gates /
  Python witnesses to `hexa-bio` (florea has no analysis infrastructure;
  see florea AGENTS.tape `@D g_use_hexa_bio_cli`). 6 verb `.tape` SSOT pairs
  migrated florea ← hexa-bio (florea commits `04d4d4e` `4c72695` `ef2c7de` ·
  hexa-bio commits `676f940` `7a460b3` `c18c119`). The `skincare` verb
  absorbed the ex-`hexa-skin/` content that previously squatted here.
- **[`dancinlab/hexa-brain`](https://github.com/dancinlab/hexa-brain)** 🧠 —
  neural substrate / cognitive architecture. Imported `reference/dolphin*.md`
  from hexa-bio 2026-05-12 (cetacean intelligence / bioacoustics; no longer
  in hexa-bio).
- **[`dancinlab/hexa-bot`](https://github.com/dancinlab/hexa-bot)** 🤖 — robot
  substrate. Imported `reference/hexa-limb.md` from hexa-bio 2026-05-12
  (AI prosthetic limb; medical-device adjacent).
- **[`dancinlab/hexa-matter`](https://github.com/dancinlab/hexa-matter)** ⚛️ —
  materials substrate. Imported `microplastics/` verb from hexa-medic
  2026-05-12.
- ~~**`dancinlab/hexa-medic`**~~ — **DELETED 2026-05-12 cycle-30++++++**
  (remote + local both removed). All 24 verbs decomposed: 8 migrated
  (Floréa + hexa-matter + hexa-bio medical-device) + 16 deleted
  (6 ambiguous + 10 therapy). See [DECOMPOSITION_PLAN.md](DECOMPOSITION_PLAN.md).

**Frozen legacy**:

- **`~/core/nexus/canon-infra/legacy-canon/`** — frozen canon@mk1 retirement
  snapshot 2026-05-11. Theorem B (σ·φ=n·τ⟺n=6) FULLY PROVEN (0 actual sorry,
  per cycle-30++++++ audit) + MechVerif legacy (0 actual sorry; 1 intentional
  Robin axiom). Read-only.

## Cross-links

- Sister standalone: [`sim-universe v1.0.0`](https://github.com/dancinlab/sim-universe) (simulation substrate)
- Sister standalone: [`honesty-monitor v1.0.0`](https://github.com/dancinlab/honesty-monitor) (AI honesty-bit falsifier)
- Upstream concept SSOT: `~/core/nexus/canon-infra/legacy-canon/domains/biology/hexa-weave/hexa-weave.md` (declarative; FROZEN at canon retirement 2026-05-11)
- Upstream formal SSOT (active): `~/core/hexa-meta/formal/lean4/` — see [`.roadmap.lean4_formal`](ARCHITECTURE.json) §1 status
- Upstream formal SSOT (frozen): `~/core/nexus/canon-infra/legacy-canon/lean4-n6/N6/MechVerif/`
- Upstream paper SSOT: `~/core/nexus/canon-infra/legacy-canon/papers/hexa-weave-formal-mechanical-w2-2026-04-28.md` (FROZEN)
- Axis governance (rigorous): [`AXIS/README.md`](AXIS/README.md) — keep-5 recommendation + Top-5 candidate verification
- Axis expansion LAYER (USER DIRECTION 2026-05-16, NON-core): [`AXIS/HIERARCHY.tape`](AXIS/HIERARCHY.tape) — COVALENT/BIFUNCTIONAL expansion-main + sub-tree; core-5 SSOT unchanged; §4 keep-5 dissent preserved
- Axis imagination artifact (ZERO governed standing, fenced): [`AXIS/INDEX.md`](AXIS/INDEX.md)
- In-silico simulator bench: [`drylab/README.md`](drylab/README.md) — 11 stdlib sims, simulator-consistency only
- LVAD scenario portfolio: [`LVAD/README.md`](LVAD/README.md) — ①②③⑥ + Zhang-2009 g1/g3 corrections
- 5-axis lock record: [`.roadmap.axis_expansion_decision_2026_05_08`](ARCHITECTURE.json)
- 5-axis 100% closure plan (gates / deadlines / owners): [`AXIS_CLOSURE_PLAN.md`](AXIS_CLOSURE_PLAN.md)
- 5-axis 100% closure — deep web + arXiv research (how to close the residual out-of-repo gaps): [`docs/closure_100_research_2026_05_12.md`](docs/closure_100_research_2026_05_12.md)
- Integrated platform manifest: [`.roadmap.platform_index`](ARCHITECTURE.json)
- HEXA package registry: [`hexa-lang/tool/pkg/registry.tsv`](https://github.com/dancinlab/hexa-lang/blob/main/tool/pkg/registry.tsv) L24
