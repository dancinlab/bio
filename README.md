# hexa-bio — Molecular Toolkit (HEXA family)

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

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20077542.svg)](https://doi.org/10.5281/zenodo.20077542)
[![License: Apache-2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-informational.svg)](CHANGELOG.md)
[![GitHub release](https://img.shields.io/github/v/release/dancinlab/hexa-bio?display_name=tag&sort=semver)](https://github.com/dancinlab/hexa-bio/releases)
[![Axes: 5](https://img.shields.io/badge/axes-5_(Q%2FW%2FN%2FR%2FV)-blue.svg)](#5-axis-status-table)
[![n=6 lattice](https://img.shields.io/badge/n%3D6-σ%3D12_τ%3D4_φ%3D2_J₂%3D24-purple.svg)](#n6-invariant-lattice)
[![Roadmap](https://img.shields.io/badge/roadmap-MVP_gates_2026--07--28-orange.svg)](.roadmap.hexa_bio)
[![Cycle 25](https://img.shields.io/badge/cycle_25-closed_2026--05--06-brightgreen.svg)](RELEASE_NOTES_v1.1.0.md)

> **Status (2026-05-06)**: cycle 25 closed; v1.1.0 candidate drafted (see
> [`RELEASE_NOTES_v1.1.0.md`](RELEASE_NOTES_v1.1.0.md)). Cycle 25 traversed
> the 16-cell C2 matrix (4 bio axis × 4 disease class) at IN-SILICO grade —
> 16/16 cells PASS the simulator+metadata internal-consistency check. The
> QUANTUM compute axis is tracked separately in [`.roadmap.quantum`](.roadmap.quantum)
> (Phase 1+ LANDED, qpu_bridge L1).
> **Honest caveat**: C2 PASS verifies in-silico simulator+metadata internal
> consistency only — it is **NOT** therapeutic, clinical, regulatory,
> immunogenic, or efficacy progress. C3+ (wet-lab → IND → phase I) is
> explicitly out-of-repo. No medical claim is made or implied.

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

## Installation

### Via `hx` (recommended)

```bash
# Install hexa-lang (ships `hexa` + `hx` package manager)
curl -fsSL https://raw.githubusercontent.com/dancinlab/hexa-lang/main/install.sh | bash

# Install hexa-bio
hx install hexa-bio          # global, pulls latest from registry
hx install hexa-bio@1.0.0    # pin specific version
hexa-bio --version
```

`hx install hexa-bio` pulls from <https://github.com/dancinlab/hexa-bio> and
installs the standalone CLI under `$HX_HOME/bin/hexa-bio`. The hexa-lang
package registry resolves any cross-substrate dependencies declared in
`hexa.toml`.

### Optional deps

`hx install hexa-bio` and every default subcommand (4 bio-axis skeletons,
16-cell C2 sweep, `hexa-bio quantum` status snapshot) run with **zero**
Python deps and **no** `qmirror` / QRNG. Two opt-in extras:

**1. `weave` full empirical sandbox** — cage-assembly ODE + live Bayesian audit:

```bash
hx install hexa-bio            # if not already
pip install --user numpy scipy
export HEXA_BIO_WITH_NUMPY=1
hexa-bio weave --all
```

**2. `quantum` axis full VQE path** — H₂/LiH ground-state energy via VQE on the
Aer state-vector simulator, seeded by ANU QRNG through the `qmirror` CLI:

```bash
hx install qmirror             # ANU QRNG + Aer state-vector bridge (sister CLI)
pip install --user qiskit-aer  # Aer simulator backend (Apache-2.0)
hexa-bio quantum falsifiers    # F-Q-* inventory (works without the above)
```

> Without `qiskit-aer` / `qmirror`, `hexa-bio quantum` still prints its
> Phase + falsifier status snapshot (pure hexa, `$0`); only the live VQE
> runs need the extras. ANU QRNG is a free public API — no key, no account.

---
## Quick Start

### 1. Run the full self-test (5-axis sentinel sweep)

```bash
hexa-bio selftest
```

Output: `__HEXA_BIO_SELFTEST__ PASS` + per-axis sentinel lines (5/5 modules
load + print their tables) + the 16-cell C2 matrix sweep. **Sentinel-only
PASS does not imply empirical claims validated** (see Caveats §1).

### 2. WEAVE — protein cage / polyhedral self-assembly (WIRED)

```bash
hexa-bio weave                       # default skeleton (n=6 + falsifier table)
hexa-bio weave --bayesian-audit      # cached posterior 0.97 (no Python needed)

# Full empirical paths (requires HEXA_BIO_WITH_NUMPY=1):
HEXA_BIO_WITH_NUMPY=1 hexa-bio weave --cage-assembly --t-end 1000
HEXA_BIO_WITH_NUMPY=1 hexa-bio weave --bayesian-audit
HEXA_BIO_WITH_NUMPY=1 hexa-bio weave --all
```

### 3. NANOBOT — molecular actuation (C0b skeleton)

```bash
hexa-bio nanobot
# → prints n=6 lattice (σ(6)=12 STRUCTURAL-EXACT, 12-vertex polyhedron) + falsifier table
```

### 4. RIBOZYME — RNA-catalyst (C0b skeleton)

```bash
hexa-bio ribozyme
# → prints n=6 lattice (σ(6)=12 STRUCTURAL-EXACT, 12-nt hammerhead core) + falsifier table
```

### 5. VIROCAPSID — viral capsid assembly (C0b skeleton)

```bash
hexa-bio virocapsid
# → prints n=6 lattice (T=1 grounded via weave; T>1 V-R2 stretch) + falsifier table
```

### 6. QUANTUM — qpu_bridge VQE / ML compute axis

```bash
hexa-bio quantum                     # Phase + falsifier status snapshot (default)
hexa-bio quantum falsifiers          # F-Q-* + F-Q-EXT-* inventory with verdicts
hexa-bio quantum n6                   # n=6 invariant binding for the H₂/LiH path
```

---

## 5-axis status table

| Axis | Role | n=6 lattice verification | v1.x closure-grade (2026-05-12, cycle-30) | Residual cat. | Empirical sandbox |
|------|------|--------------------------|---------------------------------|---------------|-------------------|
| `weave` | composition | STRUCTURAL-EXACT (T=1, post 0.97) | ✅ **~100%** | — | cage-assembly ODE + Bayesian audit |
| `virocapsid` | assembly | STRUCTURAL-EXACT (T=1 corpus + multi-T) | ✅ **~100%** — C5 schema lock + 4-fixture conformance ✅ · C3a + C3b (GATE-26-V-1b) CLOSED in-repo ✅ 2026-05-12 (VIPERdb v3.0 snapshot, **n=527** / 87 families / 15 T-strata; log10_BF 876.27) · **F-VIROCAPSID-1-c + F-VIROCAPSID-1-d CLOSED in-repo ✅ 2026-05-12 cycle-30** (`selftest/virocapsid_f_virocapsid_1c_1d_audit.py`: 1-c 3 proxy stratifications all PASS, 1-d annotation completeness mean 0.9930 / min 0.9526 across 7 fields; sentinel `__VIROCAPSID_F1C_F1D__ PASS`); residual: T=7/13/21 stretch **(b)** | — | VIPERdb-corpus T-number discrimination (n=527, σ(6)=12 = 12 pentamers ∀T incl. pseudo-T) + Caspar-Klug + Zlotnick cage-assembly ODE |
| `ribozyme` | catalysis | STRUCTURAL-EXACT-CANDIDATE (12-nt; deductive PASS) | 🟢 **~99%** — R-R1 (Nussinov MFE) / G26-RB-3 (Hamming off-target screen — pool n=206 via GENCODE v47 subset **+ FULL GENCODE v47 pc-transcriptome screen EXECUTED via RIsearch2 v2.1**, summary vendored) / G26-RB-2 (J₂=\|S₄\|=24 quotient) / G26-RB-1′ (4-state kinetics sim re-impl, F-RB-4 6/6) all in-repo ✅ 2026-05-12; remaining: minor robustness **(a)** + wet-lab confirmation **(c)** | (a)+(c) | hammerhead 4-state kinetics (Eyring TST, k_cat≈0.6/min) + Nussinov MFE + Hamming off-target screen + RIsearch2 v2.1 vs GENCODE v47 pc-transcriptome |
| `nanobot` | actuation | STRUCTURAL-EXACT-CANDIDATE (12-vertex; deductive PASS) | 🟢 **~98%** — N-R1 v2 reference emitter ✅ · C0d cuboctahedron dual-skeleton actuation sim re-impl ✅ · **N-R2 hexa-bio-side LOCKED v1.0.0 ✅ 2026-05-12** (`handoff_l6_emission_v0.schema.json` `lock_metadata`, emission unblocked, verified consistent w/ canon@mk1 `raw_77_therapeutic_nanobot_l7_acceptance_v1` DECLARED; vendored ref `nanobot/spec/canon_l7_acceptance_handoff_ref.json`; F-NB-1-c ratio 0.0 PASS); remaining: wet-lab/IP **(c)** — not a v1.x software blocker | (c) | 4-state DNA-origami actuation sim (work 50 kT, J₂=24 pose-canon) — both truncated-icosahedron & cuboctahedron skeletons |
| `quantum` | computation | VERIFIED (H₂ 6-Pauli / LiH path) + pocket-scale (F-Q-6-D) + library-ranking (F-Q-6-F) + **GATE-26-2 v1 ✅ cycle-30** | 🟢 **~95%** — F-Q-1…5 + F-Q-EXT-1…6+ + **F-Q-6-D PASS** (Mpro pocket VQE sub-µHa, `tests/mpro_pocket_vqe_v7.py`) + **F-Q-6-F PASS** (5-warhead library ranking, `tests/mpro_warhead_library_vqe_v7.py`) + **GATE-26-2 hexa-bio-side ✅ CLOSED 2026-05-12 cycle-30**: hexa-meta `formal/lean4/` 4 axes **PROVEN against WEAVE-semantics v1** (sorry-count=0, kernel-checked on lean4 v4.30.0-rc1; commits `ac97a63` / `a9b5722`); state ref v2 + `lean4_proof_witness_emit.py` `--refresh` from hexa-meta main; Π¹₁-CA₀ → `decide`/RCA₀-level re-scope for the finitary slice (per `docs/closure_100_research_2026_05_12.md` §C); remaining: full-WEAVE-algebra v2 promotion (cycle 30++, **(b)**) + MechVerif legacy sorries (FROZEN in nexus/canon-infra, **(b)**) — neither a v1.x software blocker | (b) | VQE (H₂ 0.4 µHa, LiH 1.41 mHa) + Mpro pocket VQE + 5-warhead library ranking + 11-drug pocket library + ML pilots |

**Residual categories** (for the "remaining" parenthetical in each row):
- **(a) in-repo software** — closeable by code/test work in this repo; counts against v1.x closure-grade.
- **(b) v2 formal semantics** — cycle-30++ Lean / Mathlib work; tracked in [`.roadmap.lean4_formal`](.roadmap.lean4_formal); deferred to v2.0.0 by design (v1.x cert surrogate = `raw_91_c3_disclose:MVP_caveat`).
- **(c) out-of-software-scope** — wet-lab / IP / hardware adoption; does NOT count as a software closure gap; handed off via sister-repo / canonical channels.

The v1.x closure-grade percentages above measure category **(a)** only. Categories **(b)** and **(c)** are tracked separately and explicitly out-of-scope for the v1.x track terminal.

Verdict: **PASS** (v1.x track terminal essentially REACHED for 5/5 axes when judged on category (a), the only category v1.x measures). `weave` fully wired (v1.x ✅). The **in-repo / deductive portion of closure is complete for all 5 axes** (σ/τ/φ/J₂ + master identity verified deductively, 42/42; the five per-axis in-repo closure components landed & gated — see next section). Full v1.x axis-closure: `nanobot` N-R2 hexa-bio-side ✅ LOCKED v1.0.0 (wet-lab/IP = category (c), out-of-software-scope); `GATE-26-2` ✅ **hexa-bio-side CLOSED 2026-05-12 cycle-30** — hexa-meta `formal/lean4/` 4 axes **PROVEN against WEAVE-semantics v1** (sorry-count=0; commit `a9b5722` on hexa-meta); legacy-canon `lean4-n6/N6/` Theorem B (σ·φ=n·τ⟺n=6) ESSENTIALLY FULLY PROVEN (frozen at canon retirement); Π¹₁-CA₀ → `decide`/RCA₀-level re-scope for the finitary slice. `virocapsid` C3b ✅ CLOSED in-repo (VIPERdb v3.0 corpus, n=527). `quantum` F-Q-6 / L3 / Phase D ✅ CLOSED (2026-05-12). The v1.x cert surrogate for formal axes is the `raw_91_c3_disclose:MVP_caveat` disclosure (per [`.roadmap.weave`](.roadmap.weave) line 21); the full-WEAVE-algebra v2 promotion is category (b), cycle-30++, deferred to v2.0.0 by design. Per the 2026-05-12 deep-research pass [`docs/closure_100_research_2026_05_12.md`](docs/closure_100_research_2026_05_12.md) the appropriate finitary-slice target is a Lean `decide`/RCA₀-level certificate (the mathlib pieces `Fintype.card_perm` ⇒ |S₄|=24 etc. are already there). Per-axis gates / deadlines / owners: [`AXIS_CLOSURE_PLAN.md`](AXIS_CLOSURE_PLAN.md).

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

For the full roadmap, see [`.roadmap.hexa_bio`](.roadmap.hexa_bio)
(repo-overall: lattice / gates / cycle history / deadlines) and the
5 per-axis sister files: [`.roadmap.quantum`](.roadmap.quantum) ·
[`.roadmap.weave`](.roadmap.weave) · [`.roadmap.virocapsid`](.roadmap.virocapsid) ·
[`.roadmap.nanobot`](.roadmap.nanobot) · [`.roadmap.ribozyme`](.roadmap.ribozyme).
The integrated platform manifest (5 axes + 5 cross-cutting platform layers +
disease-orthogonal entries) is [`.roadmap.platform_index`](.roadmap.platform_index).

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

**Honest caveat (raw#91 C3 discipline)**: a C2 cell PASS confirms only that
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
  QRNG + Aer state-vector simulator). See [`.roadmap.quantum`](.roadmap.quantum).
- Sister extractions:
  - `qmirror` v2.0.0 (registry L22, GitHub dancinlab/qmirror)
  - `sim-universe` v1.0.0 (registry L23, GitHub dancinlab/sim-universe)
  - **hexa-bio v1.0.0 (registry L24)** ← this repo

---

## Caveats (raw#10 honest C3)

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

## License

Apache-2.0. See [LICENSE](LICENSE).

Optional Python aux deps (`numpy`, `scipy`, `qiskit-aer`) ship under their
own BSD-3 / Apache-2.0 licenses; in-process safe (no copyleft). hexa-bio
core stays Apache-2.0 under FSF MereAggregation.

---

## Cross-links

- Sister standalone: [`qmirror v2.0.0`](https://github.com/dancinlab/qmirror/releases/tag/v2.0.0) (quantum substrate — closure 13/13 conds, 8 v1 + 5 v2; the `quantum` axis's upstream)
- Sister standalone: [`sim-universe v1.0.0`](https://github.com/dancinlab/sim-universe) (simulation substrate)
- Sister standalone: [`honesty-monitor v1.0.0`](https://github.com/dancinlab/honesty-monitor) (AI honesty-bit falsifier)
- Upstream concept SSOT: `canon/domains/biology/hexa-weave/hexa-weave.md` (declarative)
- Upstream formal SSOT: `canon/lean4-n6/N6/MechVerif/`
- Upstream paper SSOT: `canon/papers/hexa-weave-formal-mechanical-w2-2026-04-28.md`
- 5-axis lock record: [`.roadmap.axis_expansion_decision_2026_05_08`](.roadmap.axis_expansion_decision_2026_05_08)
- 5-axis 100% closure plan (gates / deadlines / owners): [`AXIS_CLOSURE_PLAN.md`](AXIS_CLOSURE_PLAN.md)
- 5-axis 100% closure — deep web + arXiv research (how to close the residual out-of-repo gaps): [`docs/closure_100_research_2026_05_12.md`](docs/closure_100_research_2026_05_12.md)
- Integrated platform manifest: [`.roadmap.platform_index`](.roadmap.platform_index)
- HEXA package registry: [`hexa-lang/tool/pkg/registry.tsv`](https://github.com/dancinlab/hexa-lang/blob/main/tool/pkg/registry.tsv) L24
