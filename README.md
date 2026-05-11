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
> registry, or `git clone` directly. (HF Hub mirror retired 2026-05-04: HF
> Hub is designed for ML model weights / datasets; CLI tooling distribution
> is GitHub-canonical.)

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
hx install hexa-bio          # global, pulls latest from registry
hx install hexa-bio@1.0.0    # pin specific version
hexa-bio --version           # → 1.0.0
```

> hexa-bio is registered as the **24th entry** in the hexa-lang package
> registry (`hexa-lang/tool/pkg/registry.tsv` L24). `hx install hexa-bio`
> pulls from <https://github.com/dancinlab/hexa-bio> and installs
> the standalone CLI under `$HX_HOME/bin/hexa-bio`.
>
> **Dependencies**: `hx install hexa-bio` itself needs only the hexa-lang
> stdlib — **zero** Python, no `qmirror`, no QRNG. Optional, opt-in only:
> `numpy`/`scipy` for `weave`'s full cage-assembly ODE + Bayesian audit
> (`HEXA_BIO_WITH_NUMPY=1`), and `qiskit-aer` + [`qmirror`](https://github.com/dancinlab/qmirror) (`hx install
> qmirror` — ANU QRNG seed + Aer state-vector simulator) for the `quantum`
> axis's full VQE path. The default paths — all 4 bio-axis skeletons, the
> 16-cell C2 sweep, and `hexa-bio quantum`'s status snapshot — run with no
> extra deps. See "Optional deps" below and `.roadmap.quantum`.

### Via git clone (works today)

```bash
git clone https://github.com/dancinlab/hexa-bio.git ~/.hexa-bio
export HEXA_BIO_ROOT=~/.hexa-bio
export PATH="$HEXA_BIO_ROOT/cli:$PATH"

# Run any subcommand:
hexa run $HEXA_BIO_ROOT/cli/hexa-bio.hexa selftest
```

### Optional deps — none required for the default paths

`hx install hexa-bio` and every default subcommand (4 bio-axis skeletons,
16-cell C2 sweep, `hexa-bio quantum` status snapshot) run with **zero**
Python deps and **no** `qmirror` / QRNG. Two opt-in extras:

**1. `weave` full empirical sandbox** — cage-assembly ODE + live Bayesian audit:

```bash
pip install --user numpy scipy
export HEXA_BIO_WITH_NUMPY=1
hexa-bio weave --all
```

**2. `quantum` axis full VQE path** — H₂/LiH ground-state energy via VQE on the
Aer state-vector simulator, seeded by ANU QRNG through the `qmirror` CLI:

```bash
hx install qmirror                       # ANU QRNG + Aer state-vector bridge (sister CLI)
pip install --user qiskit-aer            # Aer simulator backend (Apache-2.0)
# then the quantum_*.py adapters under _python_bridge/module/ can run the full pipeline.
hexa-bio quantum falsifiers              # F-Q-* inventory (works without the above)
```

> Without `qiskit-aer` / `qmirror`, `hexa-bio quantum` still prints its
> Phase + falsifier status snapshot (pure hexa, `$0`); only the live VQE
> runs need the extras. ANU QRNG is a free public API — no key, no account.
> See [`.roadmap.quantum`](.roadmap.quantum) for the full qpu_bridge ladder.

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

| Axis         | Role            | Status                          | n=6 lattice verification              | Empirical sandbox                          |
|--------------|-----------------|---------------------------------|---------------------------------------|--------------------------------------------|
| `weave`      | composition     | **WIRED v1.0.0**                | STRUCTURAL-EXACT (T=1, post 0.97)     | cage-assembly ODE + Bayesian audit         |
| `virocapsid` | assembly        | C0b + multi-T (cycle 26)        | STRUCTURAL-EXACT (T=1 corpus + multi-T) | PDB-corpus T-number discrimination       |
| `nanobot`    | actuation       | C0b skeleton (F-NB-4 MVP)       | STRUCTURAL-EXACT-CANDIDATE (12-vertex)| 4-state DNA-origami actuation sim          |
| `ribozyme`   | catalysis       | C0b skeleton (F-RB-4 MVP)       | STRUCTURAL-EXACT-CANDIDATE (12-nt)    | hammerhead-minimal kinetics sim            |
| `quantum`    | computation     | **Phase 1+ LANDED** (qpu_bridge L1) | VERIFIED for H₂ 6-Pauli / LiH path  | VQE (H₂ 0.4 µHa, LiH 1.41 mHa) + ML pilots |

Verdict: **PARTIAL_PASS** — `weave` fully wired; `virocapsid`/`nanobot`/`ribozyme`
at C0b-skeleton grade with σ(6)=12 verification; `quantum` at Phase 1+ with
F-Q-1…5 PASS (pocket-VQE F-Q-6 open). Only `weave` has reached v1.x **100%
closure-grade** so far; the gate/deadline/owner plan to close the other four
axes is in [`AXIS_CLOSURE_PLAN.md`](AXIS_CLOSURE_PLAN.md).

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
- Integrated platform manifest: [`.roadmap.platform_index`](.roadmap.platform_index)
- HEXA package registry: [`hexa-lang/tool/pkg/registry.tsv`](https://github.com/dancinlab/hexa-lang/blob/main/tool/pkg/registry.tsv) L24
