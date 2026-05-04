# hexa-bio v1.0.0 — Molecular Toolkit (HEXA family)

**Release date**: 2026-05-04
**Closure verdict**: **PARTIAL_PASS** (1/4 verbs wired; 3/4 stubs with
falsifier preregister)
**Provenance**: extracted 2026-05-04 from `nexus/sim_bridge/weave/`
(canonical-from cycle 24, 2026-04-29). Sister-extraction of `qmirror` v2.0.0
(registry L22) and `sim-universe` v1.0.0 (registry L23). hexa-bio is the
**24th** entry.

This is the **initial standalone release** of `hexa-bio`, a 4-verb molecular
substrate organized around the **n=6 invariant lattice**: WEAVE / NANOBOT /
RIBOZYME / VIROCAPSID. One sister axis (`weave`) is empirically wired with
full Caspar-Klug + Zlotnick cage-assembly sandbox + Bayesian σ(6)=12
STRUCTURAL-EXACT audit; three sister axes ship as stub placeholders with
falsifier preregister at v1.0.0.

## Highlights

- **4-verb tetrahedron** — WEAVE (composition, WIRED), NANOBOT (actuation,
  STUB), RIBOZYME (catalysis, STUB), VIROCAPSID (assembly, STUB).
- **WEAVE empirical sandbox** — Caspar-Klug 1962 + Zlotnick 2003 ODE
  (cache-only by default; numpy/scipy opt-in via `HEXA_BIO_WITH_NUMPY=1`);
  Bayesian audit posterior 0.97 for T=1 60-subunit icosahedral cage.
- **n=6 invariant lattice** — `σ(6)=12, τ(6)=4, φ(6)=2, J₂=24`; master
  identity `σ·φ = n·τ = 24`. Algebraic backbone is shared across all
  4 verbs (only `weave` empirically grounded; others inherit by hypothesis —
  see Caveats §3).
- **CLI** — 7 subcommands (`weave`, `nanobot`, `ribozyme`, `virocapsid`,
  `status`, `selftest`, `help`); every subcommand accepts `--version`.
- **Selftest** — 4-verb sentinel sweep; `__HEXA_BIO_SELFTEST__ PASS` confirms
  all 4 modules load + print falsifier preregister tables (sentinel-only
  PASS does NOT validate empirical claims — see Caveats §1).
- **Apache-2.0** license; optional Python aux deps (`numpy`, `scipy`)
  ship under their own BSD-3 licenses; in-process safe (no copyleft).
  hexa-bio core stays Apache-2.0 under FSF MereAggregation.
- **Dual-mirror auto-sync** committed
  ([`.github/workflows/sync-to-hf.yml`](.github/workflows/sync-to-hf.yml)) —
  GitHub `main` push → HF Hub mirror within ~2-3 min, $0 on the public-repo
  Actions free tier. **HF mirror already initialized at commit `df9a668`.**

## Installation

```bash
# Recommended (post-hx install registration):
hx install hexa-bio@1.0.0
hexa-bio --version           # → 1.0.0

# Or git clone (works today):
git clone https://github.com/need-singularity/hexa-bio.git ~/.hexa-bio
export HEXA_BIO_ROOT=~/.hexa-bio
export PATH="$HEXA_BIO_ROOT/cli:$PATH"
hexa-bio selftest
```

## Quickstart

```bash
hexa-bio selftest                                # 4-verb sentinel sweep
hexa-bio weave                                   # default skeleton + n=6 + falsifier
hexa-bio weave --bayesian-audit                  # cached posterior 0.97 (no Python)
HEXA_BIO_WITH_NUMPY=1 hexa-bio weave --all       # full empirical paths
hexa-bio nanobot                                 # STUB — falsifier preregister only
hexa-bio ribozyme                                # STUB — falsifier preregister only
hexa-bio virocapsid                              # STUB — falsifier preregister only
```

## Mirrors

- canonical: <https://github.com/need-singularity/hexa-bio>
- HF Hub:    <https://huggingface.co/need-singularity/hexa-bio>

## USER ACTION required (HF auto-sync)

The dual-mirror workflow is committed and the HF mirror is already
initialized (commit `df9a668`). Auto-sync on push remains **inactive**
until the `HF_TOKEN` GitHub repository secret is set with a write-scope
token at:

> <https://github.com/need-singularity/hexa-bio/settings/secrets/actions>

Until the secret is set, the workflow's gate (`if: secrets.HF_TOKEN != ''`)
short-circuits and no sync occurs. By design — silent half-success is
worse than visible no-op.

## Honest C3 caveats (raw#10)

The 5 base caveats (3/4 verbs are stub-only; falsifiers are initial-guess
deadlines; n=6 lattice claim speculative for 3/4 axes; weave-migration
edge-case consumers; dual-mirror USER_ACTION pending) are documented in
[README §Caveats](README.md#caveats-raw10-honest-c3). The polish cycle
adds 4 further disclosures specific to the v1.0.0 publication:

1. **HF auto-sync USER ACTION pending** — workflow inert until `HF_TOKEN`
   GitHub secret is set (see above). HF mirror was initialized 2026-05-04
   manually at `df9a668`; no automated incremental sync until secret lands.
2. **GitHub release deletion is friction-laden** — once `v1.0.0` is
   published it is technically deletable but the tag OID lives on in any
   clone that fetched it; treat each release as effectively immutable.
3. **Public-repo maintenance burden** — issue/PR triage cost is now on the
   author; downstream consumers should not assume future SLA.
4. **Sister-cycle race risk** — qmirror, sim-universe, honesty-monitor polish
   cycles run in parallel; if any sister repo diverges in workflow/badge
   conventions, manual reconciliation is required (no cross-repo CI).

## Provenance

- WEAVE module imported from `nexus/sim_bridge/weave/` (commit `f81239d6+`,
  cycle 24 canonical, 2026-04-29). Original concept: `n6-architecture/
  domains/biology/hexa-weave/hexa-weave.md` empirical companion.
- NANOBOT/RIBOZYME/VIROCAPSID modules created **fresh** as stub
  placeholders during this extraction (2026-05-04) — no prior nexus
  implementation existed beyond .roadmap / atlas.append marker entries.
- Standalone-extraction cycle: `hexa_bio_standalone_extraction_2026_05_04`
  (commit `3877f5e` — initial extraction).
- HF mirror init cycle: 2026-05-04 (HF commit `df9a668`).
- Polish cycle: `hexa_bio_polish_2026_05_04` (this release).
- Sister extractions: `qmirror` v2.0.0, `sim-universe` v1.0.0,
  `honesty-monitor` v1.0.0.

## License

Apache-2.0 — see [LICENSE](LICENSE).

Author: 박민우 <nerve011235@gmail.com>
