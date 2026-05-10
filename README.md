# hexa-bio — Molecular Toolkit (HEXA family)

> 4-verb molecular substrate organized around the **n=6 invariant lattice**:
> WEAVE / NANOBOT / RIBOZYME / VIROCAPSID. One sister axis (`weave`) is
> empirically wired with full Caspar-Klug + Zlotnick cage-assembly sandbox
> + Bayesian σ(6)=12 STRUCTURAL-EXACT audit; three sister axes ship as
> stub placeholders with falsifier preregister at v1.0.0.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20077542.svg)](https://doi.org/10.5281/zenodo.20077542)
[![License: Apache-2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-informational.svg)](CHANGELOG.md)
[![GitHub release](https://img.shields.io/github/v/release/need-singularity/hexa-bio?display_name=tag&sort=semver)](https://github.com/need-singularity/hexa-bio/releases)
[![Verbs: 1/4 wired](https://img.shields.io/badge/verbs-1%2F4_wired_(weave)-blue.svg)](#4-verb-status-table)
[![n=6 lattice](https://img.shields.io/badge/n%3D6-σ%3D12_τ%3D4_φ%3D2_J₂%3D24-purple.svg)](#n6-invariant-lattice)
[![Roadmap](https://img.shields.io/badge/roadmap-MVP_gates_2026--07--28-orange.svg)](.roadmap.hexa_bio)
[![Cycle 25](https://img.shields.io/badge/cycle_25-closed_2026--05--06-brightgreen.svg)](RELEASE_NOTES_v1.1.0.md)

> **Status (2026-05-06)**: cycle 25 closed; v1.1.0 candidate drafted (see
> [`RELEASE_NOTES_v1.1.0.md`](RELEASE_NOTES_v1.1.0.md)). Cycle 25 traversed
> the 16-cell C2 matrix (4 verb × 4 disease class) at IN-SILICO grade —
> 16/16 cells PASS the simulator+metadata internal-consistency check.
> **Honest caveat**: C2 PASS verifies in-silico simulator+metadata internal
> consistency only — it is **NOT** therapeutic, clinical, regulatory,
> immunogenic, or efficacy progress. C3+ (wet-lab → IND → phase I) is
> explicitly out-of-repo. No medical claim is made or implied.

> **Distribution**: GitHub canonical at <https://github.com/need-singularity/hexa-bio>.
> CLI tooling — installed via `hx install hexa-bio` from the hexa-lang
> registry, or `git clone` directly. (HF Hub mirror retired 2026-05-04: HF
> Hub is designed for ML model weights / datasets; CLI tooling distribution
> is GitHub-canonical.)

---

## What is hexa-bio?

`hexa-bio` is a **standalone Molecular Toolkit** that exposes 4 sister verbs
for write-side molecular sandboxing. It is the empirical companion to
`canon/domains/biology/` and the canonical extraction-of-record
for the WEAVE axis (cycle 24, 2026-04-29 → standalone 2026-05-04).

The 4 verbs form a **tetrahedron** organized around the n=6 invariant lattice:

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
       [STUB]              [STUB]            [STUB]
```

WEAVE is the only axis with full numerical empirical sandbox at v1.0.0 (T=1
60-subunit icosahedral cage; posterior 0.97). The other 3 axes ship as
stub modules that print their falsifier preregister tables; their numerical
implementations are deferred to post-v1.0 cycles.

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
> pulls from <https://github.com/need-singularity/hexa-bio> and installs
> the standalone CLI under `$HX_HOME/bin/hexa-bio`.

### Via git clone (works today)

```bash
git clone https://github.com/need-singularity/hexa-bio.git ~/.hexa-bio
export HEXA_BIO_ROOT=~/.hexa-bio
export PATH="$HEXA_BIO_ROOT/cli:$PATH"

# Run any subcommand:
hexa run $HEXA_BIO_ROOT/cli/hexa-bio.hexa selftest
```

### Optional Python aux for weave's empirical-sandbox path

The default path needs **zero** Python deps (cached corpus result + pure-hexa
skeleton). For weave's full cage-assembly ODE + live Bayesian audit:

```bash
pip install --user numpy scipy
export HEXA_BIO_WITH_NUMPY=1
hexa-bio weave --all
```

---

## Quick Start

### 1. Run the full self-test (4-verb sentinel sweep)

```bash
hexa-bio selftest
```

Output: `__HEXA_BIO_SELFTEST__ PASS` + per-verb sentinel lines (4/4 modules
load + print falsifier tables). **Sentinel-only PASS does not imply
empirical claims validated** (see Caveats §1).

### 2. WEAVE — protein cage / polyhedral self-assembly (WIRED)

```bash
hexa-bio weave                       # default skeleton (n=6 + falsifier table)
hexa-bio weave --bayesian-audit      # cached posterior 0.97 (no Python needed)

# Full empirical paths (requires HEXA_BIO_WITH_NUMPY=1):
HEXA_BIO_WITH_NUMPY=1 hexa-bio weave --cage-assembly --t-end 1000
HEXA_BIO_WITH_NUMPY=1 hexa-bio weave --bayesian-audit
HEXA_BIO_WITH_NUMPY=1 hexa-bio weave --all
```

### 3. NANOBOT — molecular actuation (STUB)

```bash
hexa-bio nanobot
# → prints n=6 lattice (hypothesized) + 3 falsifier preregister entries
```

### 4. RIBOZYME — RNA-catalyst (STUB)

```bash
hexa-bio ribozyme
# → prints n=6 lattice (hypothesized) + 3 falsifier preregister entries
```

### 5. VIROCAPSID — viral capsid assembly (STUB)

```bash
hexa-bio virocapsid
# → prints n=6 lattice (T=1 grounded via weave; T>1 hypothesized) + 3 falsifiers
```

---

## 4-verb status table

| Verb         | Status              | n=6 lattice verification          | Empirical sandbox            |
|--------------|---------------------|-----------------------------------|------------------------------|
| `weave`      | **WIRED v1.0.0**    | STRUCTURAL-EXACT (T=1, post 0.97) | cage-assembly ODE + audit    |
| `nanobot`    | STUB v1.0.0-stub    | hypothesized only                 | deferred (cycle 25+)         |
| `ribozyme`   | STUB v1.0.0-stub    | hypothesized only                 | deferred (cycle 25+)         |
| `virocapsid` | STUB v1.0.0-stub    | partial (T=1 via weave)           | deferred (T>1: cycle 25+)    |

Verdict: **PARTIAL_PASS** (1/4 verbs wired; 3/4 stubs with falsifier preregister).

For the full roadmap, see [`.roadmap.hexa_bio`](.roadmap.hexa_bio)
(repo-overall: lattice / gates / cycle 22 closure / deadlines) and the
4 per-verb sister files: [`.roadmap.weave`](.roadmap.weave) ·
[`.roadmap.nanobot`](.roadmap.nanobot) · [`.roadmap.ribozyme`](.roadmap.ribozyme) ·
[`.roadmap.virocapsid`](.roadmap.virocapsid).

---

## 16-cell C2 matrix (cycle 25, 2026-05-06)

Cycle 25 closed the C2 traversal of the 4 verb × 4 disease-class scaffold
at IN-SILICO grade. Each cell ships a wrapper script in
`_python_bridge/module/*_candidate.py` that records candidate-spec metadata
annotated against publicly catalogued disease-class markers and verifies
via the corresponding C0b simulator. Each cell emits one
`raw_77_c2_<verb>_<class>_v1` witness row to
`state/discovery_absorption/registry.jsonl`.

| Verb \ Class    | α (AML) | β (SCD) | γ (pan-cov) | δ (senolytic) |
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
τ(6) = 4         4-state ladder (free / pentamer / hexamer / cage) — weave
φ(6) = 2         binary dichotomy (free vs assembled)
J₂   = 24        octahedral O ⊂ icosahedral I subgroup

master identity:   σ · φ = n · τ = 12 · 2 = 6 · 4 = 24
```

Per-verb interpretation (where empirically grounded vs hypothesized — see
`Caveats §3`):

| Symbol  | weave (verified)              | nanobot (hyp)            | ribozyme (hyp)           | virocapsid (partial)              |
|---------|-------------------------------|--------------------------|--------------------------|-----------------------------------|
| σ(6)=12 | cage vertex count             | actuation cycle states   | catalytic cycle states   | T=1 cage (verified via weave)     |
| τ(6)=4  | 4 ladder states               | 4 mechanical regimes     | 4 catalytic regimes      | 4 assembly stages                 |
| φ(6)=2  | free vs assembled             | bound vs unbound         | bound vs free            | assembled vs disassembled         |
| J₂=24   | I ⊃ O subgroup (geometric)    | power-stroke trajectory  | reaction-coordinate grp  | I ⊃ O (T=1 exact; T>1 conjecture) |

---

## Architecture

```
/Users/ghost/core/hexa-bio/
├── cli/
│   └── hexa-bio.hexa           # 4-verb router + status + selftest
├── weave/module/weave.hexa              # WIRED — Caspar-Klug + Zlotnick (cage 60)
├── nanobot/module/nanobot.hexa          # STUB — actuation primitive
├── ribozyme/module/ribozyme.hexa        # STUB — RNA catalyst primitive
├── virocapsid/module/virocapsid.hexa    # STUB — viral capsid assembly primitive
├── selftest/module/selftest.hexa        # 4-verb sentinel sweep
├── _python_bridge/module/
│   ├── cage_assembly_simulation.py        # weave ODE (numpy/scipy opt-in)
│   └── polyhedral_cage_bayesian_audit.py  # weave Bayesian audit
├── tests/
│   ├── test_weave.hexa
│   ├── test_nanobot.hexa
│   ├── test_ribozyme.hexa
│   ├── test_virocapsid.hexa
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
- NANOBOT/RIBOZYME/VIROCAPSID modules created **fresh** as stub
  placeholders during this extraction (2026-05-04) — no prior nexus
  implementation existed beyond .roadmap / atlas.append marker entries
  (e.g. `nexus/n6/atlas.append.hexa-nanobot-domain-registration.n6`).
- Sister extractions:
  - `qmirror` v2.0.0 (registry L22, GitHub need-singularity/qmirror)
  - `sim-universe` v1.0.0 (registry L23, GitHub need-singularity/sim-universe)
  - **hexa-bio v1.0.0 (registry L24)** ← this repo

---

## Caveats (raw#10 honest C3)

1. **3/4 verbs are stub-only at v1.0.0.** `nanobot`, `ribozyme`, and
   `virocapsid` ship as placeholders that print falsifier preregister
   tables and a sentinel — they do **not** run any numerical sandbox.
   The `__HEXA_BIO_*__ PASS` sentinels confirm only that the module
   loaded; they do **not** validate any empirical claim.
2. **Falsifiers for stub verbs are initial-guess deadlines.** Concrete
   experimental refutation criteria + dates were drafted during this
   extraction without literature corpus review for nanobot/ribozyme
   axes. Revision planned in cycle 25+.
3. **n=6 invariant lattice claim is speculative for 3/4 axes.** Only
   weave's σ(6)=12 (T=1 cage vertex count, posterior 0.97) is empirically
   grounded. The lattice mapping for nanobot's actuation cycles, ribozyme's
   catalytic cycles, and T>1 virocapsids is conjecture inherited from the
   lattice's algebraic structure, not from independent experimental fit.
4. **Migration of `nexus/sim_bridge/weave/` may break edge-case consumers.**
   Cross-link consumers (canon papers,
   `nexus/state/audit/cage_assembly_events.jsonl` readers) reference the
   old path; the path-migration shim is left to the nexus consumer
   refactor cycle. The `runs/` ledger (~10MB jsonl) is not vendored into
   this standalone repo by default.
5. **GitHub-only distribution (HF Hub mirror retired 2026-05-04).** HF Hub is
   designed for ML model weights / datasets, not CLI tooling. Maintenance
   burden (recurring token rotation failures) outweighed value. GitHub
   remains canonical at <https://github.com/need-singularity/hexa-bio>;
   HF Hub stays canonical for model weights / datasets in the wider stack.

---

## License

Apache-2.0. See [LICENSE](LICENSE).

Optional Python aux deps (`numpy`, `scipy`) ship under their own BSD-3
licenses; in-process safe (no copyleft). hexa-bio core stays
Apache-2.0 under FSF MereAggregation.

---

## Cross-links

- Sister standalone: [`qmirror v2.0.0`](https://github.com/need-singularity/qmirror/releases/tag/v2.0.0) (quantum substrate — closure 13/13 conds, 8 v1 + 5 v2)
- Sister standalone: [`sim-universe v1.0.0`](https://github.com/need-singularity/sim-universe) (simulation substrate)
- Sister standalone: [`honesty-monitor v1.0.0`](https://github.com/need-singularity/honesty-monitor) (AI honesty-bit falsifier)
- Upstream concept SSOT: `canon/domains/biology/hexa-weave/hexa-weave.md` (declarative)
- Upstream formal SSOT: `canon/lean4-n6/N6/MechVerif/`
- Upstream paper SSOT: `canon/papers/hexa-weave-formal-mechanical-w2-2026-04-28.md`
- HEXA package registry: [`hexa-lang/tool/pkg/registry.tsv`](https://github.com/need-singularity/hexa-lang/blob/main/tool/pkg/registry.tsv) L24
