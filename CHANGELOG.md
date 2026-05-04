# Changelog

All notable changes to **hexa-bio** are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and SemVer.

## [1.0.0] - 2026-05-04

### Added
- Initial standalone extraction from nexus monorepo (sister of qmirror /
  sim-universe migration pattern, 2026-05-03 cycle).
- 4-verb Molecular Toolkit (HEXA family):
  - `weave` — protein cage / polyhedral self-assembly (Caspar-Klug 1962 +
    Zlotnick 2003 ODE; σ(6)=12 STRUCTURAL-EXACT Bayesian audit). **Imported**
    from `nexus/sim_bridge/weave/` (canonical-from cycle 24, 2026-04-29).
  - `nanobot` — molecular actuation primitive (HEXA-family axis). **Stub**
    placeholder + falsifier preregister (F-NANOBOT-1: actuation cycle ≥ 10⁴
    without thermal collapse).
  - `ribozyme` — RNA-catalyst primitive (HEXA-family axis). **Stub**
    placeholder + falsifier preregister (F-RIBOZYME-1: kcat/Km ≥ 10² M⁻¹s⁻¹
    on ≥ 3 substrate classes).
  - `virocapsid` — viral capsid assembly primitive (HEXA-family axis,
    co-axial with weave). **Stub** placeholder + falsifier preregister
    (F-VIROCAPSID-1: live-PDB n ≥ 100 cages posterior(STRUCTURAL-EXACT) ≥ 0.95).
- 4-verb CLI router (`cli/hexa-bio.hexa`) with subcmds: `weave`, `nanobot`,
  `ribozyme`, `virocapsid`, `status`, `selftest`, `help`, `--version`.
- 4 test smoke harnesses (`tests/test_{weave,nanobot,ribozyme,virocapsid}.hexa`)
  + selftest harness.
- 4 example files (`examples/01..04_*.hexa`) — one per verb quick-start.
- `install.hexa` hx hook (raw#9 STRICT — hexa-only orchestration; weave's
  python_bridge_aux installed only on opt-in via `HEXA_BIO_WITH_NUMPY=1`).
- Apache-2.0 license, README, CHANGELOG, hexa.toml manifest.
- GitHub-only distribution (canonical at
  <https://github.com/need-singularity/hexa-bio>; install via
  `hx install hexa-bio` from hexa-lang registry, or `git clone`).

### Removed
- HF Hub mirror (CLI tool — GitHub canonical, 2026-05-04). HF Hub is designed
  for ML model weights / datasets, not CLI tooling; maintenance burden
  outweighed value.

### Honest scope (raw#10 C3)
- 1 of 4 verbs (`weave`) is empirically wired with full simulator + audit.
- 3 of 4 verbs (`nanobot`, `ribozyme`, `virocapsid`) ship as **stub
  placeholders** with falsifier preregister only; numerical implementations
  deferred to post-v1.0 cycles.
- n=6 invariant lattice (`σ(6)=12, τ(6)=4, φ(6)=2, J₂=24`) is a *speculative*
  organizing principle — only `weave` has Bayesian-audit evidence
  (posterior 0.97); other 3 verbs inherit the lattice claim without
  independent verification.
- Falsifiers for stub verbs are *initial-guess* deadlines (open-ended).
- Migration of `nexus/sim_bridge/weave/` may break edge-case consumers
  (n6-architecture cross-link, runs/ ledger path).

### Provenance
- Extracted from `nexus/sim_bridge/weave/` (commit f81239d6+) on 2026-05-04.
- Sister extractions: `qmirror` v2.0.0 (registry L22), `sim-universe` v1.0.0
  (registry L23). hexa-bio is the **24th** entry.
- Closure verdict: **1/4 verbs PASS** (weave); 3/4 axes pre-implementation.

[1.0.0]: https://github.com/need-singularity/hexa-bio/releases/tag/v1.0.0
