# TAPE-AUDIT — hexa-bio

## A. Audit-class ledgers

- `state/markers/*.marker` — **992 markers** (actuation_simulation, aml_flt3_candidate, closure_*). Each is a one-shot run sentinel (no append-only event grain). Strong **Class-T** migration candidate — collapse 992 `.marker` files into one `state/runs.tape` with `@T <verb>` + `@R ok|err` per run.
- `state/discovery_absorption/registry.jsonl` — already JSONL, schema-tagged (`raw_77_virocapsid_calibration_v1`), cycle/phase/falsifier provenance. **Class-A + Class-D** in `.tape` terms (raw absorption events + datasets).
- `state/{hexa_bio_cli.log, qmirror_cli.log}` — CLI-loop trace.

## B. Identity surface

`AGENTS.md` defines repo agent role + `AXIS.md` declares the n=6 lattice axis position. No persistent agent-identity record. **Strong fit** for `hexa-bio/identity.tape` — `@I` declaration + axis pin + falsifier roster (F-VIROCAPSID-3, F-RB-4).

## C. Domain.md files

78 UPPERCASE.md domain files (AGRICULTURE, APICULTURE, AQUACULTURE, BAKING, BIO-PHARMA, BIOCHAR-DRYLAND-RESTORATION, BIOLOGY-MEDICAL, CANCER-THERAPY, CHEESE-DAIRY, COFFEE-SCIENCE, COSMETIC-SURGERY, ...). No `+`-meta-domains yet — gap. Each domain is a candidate for sibling `<DOMAIN>.tape` carrying `@P` promotions + `@T` per-run trace tied to the markdown narrative.

## D. Per-run/per-event history

`registry.jsonl` already streams ribozyme kinetics + virocapsid calibration. Markers stream actuation simulation. Both → **Class-T tape**:
- `@T phase=f-rb-4-mvp-kinetics <- @S model=hammerhead_minimal_12nt => @R ok`
- Append-only fits the ribozyme/virocapsid n=6 closure loop natively.

## E. Promotion candidates

- **n6 atoms** — Hückel aromaticity (`bt-1387`), photosynthesis equation (`bt-1391`) — verified n=6 laws ready to lift from `breakthroughs/*.md` to atom IDs.
- **hxc binaries** — ribozyme kinetic curves + virocapsid spectra are dataset-shaped; promote raw bytes via `tape_to_hxc`.
- **n12 cube cells** — verb-dir × scale-tier matrix (hexa-weave/nanobot/ribozyme/virocapsid × 6 scales) maps onto an n12 cube face cleanly.

## F. Cohort honesty remediation (2026-05-15 → 2026-05-16)

The §C concern — 78 UPPERCASE.md domain files lifted to `<DOMAIN>.tape` siblings (hexa-bio mass-split `153b5a2`) — was a `.md → .tape` promotion that initially produced **lattice-tautology stubs**: fabricated `@D row_* x="EXACT"` rows deriving claims from σ=12, τ=4, φ=2, J₂=24 with no real citations. A cohort-wide honesty gate (`selftest/tape_lattice_honesty_lint.py` + `hexa-bio tape-lint` CLI) was added, and the 65 root tapes were rewritten over 5 sequential batches:

| Batch | Tapes | Model | Theme |
|---|---|---|---|
| Pilot | CANCER-THERAPY · AGRICULTURE · CRISPR-GENE-EDITING · HEXA-WEAVE · CHANGELOG | Opus | high-stakes therapeutic + generic substrate + core axis + meta-pilot |
| 1 | HIV-TREATMENT · VACCINE · NEURO · THERAPEUTIC-NANOBOT · MEDICAL-DEVICE · HEXA-{NANOBOT,RIBOZYME,VIROCAPSID,SKIN,LIMB} | Opus | high-stakes + axis tapes |
| 2 | APICULTURE · AQUACULTURE · BAKING · BIO-PHARMA · CHEESE-DAIRY · COFFEE · ECOLOGY · ENTOMOLOGY · FERMENTATION · FOOD-SCIENCE | Sonnet 4.6 | generic substrate |
| 3 | BIOLOGY · BIOLOGY-MEDICAL · HERBALISM · HORTICULTURE · MYCOLOGY · DOLPHIN · VETERINARY · VITICULTURE · WINE-ENOLOGY · URBAN-FARMING | Sonnet 4.6 | generic substrate (continued) |
| 4 | PHARMACOLOGY · IMMUNOLOGY · NEUROPHARMACOLOGY · VIROLOGY · NUCLEAR-MEDICINE · RADIATION-BIOLOGY · SLEEP-MEDICINE · GASTROINTESTINAL-MEDICINE · CRISPR-CAS13-POC-DIAGNOSTIC · GENETICS | Opus | medical-adjacent |
| 5 | HIV (virology) · NEUROSCIENCE · SYNBIO · TIBETAN-MEDICINE · XENO · BIOCHAR-DRYLAND · COFFEE-SCIENCE · DOLPHIN-BIOACOUSTICS · ECOLOGY-AGRI-FOOD · MICROPLASTICS | Opus×2 + Sonnet×8 | substrate residual (HIV + SYNBIO Opus for subject sensitivity / dual-use) |

**Cohort state**: ~~55/65 PASS · 10/65 FAIL~~ → **65/65 PASS (100% green, 2026-05-16)** after Batch-6 (10 meta tapes via meta-mode opt-in: AXIS_CLOSURE_PLAN, CLOSURE_RESIDUAL_BACKLOG, COMPUTE_PORTFOLIO, DECOMPOSITION_PLAN, IMPORTED_FROM_CANON, LESSONS, USER_ACTION_REQUIRED, V1_1_0_HANDOFF, AXIS, DOG-ROBOT-TEST). 11 meta-tagged total (incl. CHANGELOG from pilot).

**Linter meta-mode opt-in (2026-05-16, `selftest/tape_lattice_honesty_lint.py`)**: a CHANGELOG-tape pilot found that meta tapes (changelogs / plans / handoffs / backlog / governance indices) have no literature anchor by nature; forcing the standard literature-only grounding would force fabrication or honest FAIL. The linter now widens clause 3 for meta tapes that opt in via `@I id001` body `tape-class = "meta..."` — `@X :: governance` entries and `methodology-cite =` body lines also count as grounding. Guard (clause 1) and stance (clause 2) remain identical. See [`AGENTS.tape` @D g_meta_mode_optin](./AGENTS.tape).

**Discipline highlights**:
- **No fabricated numbers or citations.** Uncertain refs use primary-author/era only (mirroring florea `x_goren_2014`); confident refs carry full journal/volume/page.
- **Evidence-grade tiering** explicit (HERBALISM A/B/C; TIBETAN-MEDICINE + heavy-metal safety; MICROPLASTICS well-documented-vs-emerging; NEUROPHARMACOLOGY anti-amyloid mAb modest-not-cure).
- **Stub honesty corrections**: Baltimore = 7 groups NOT 6 (VIROLOGY); AASM 5 sleep stages NOT 6 (SLEEP-MEDICINE); 6-leg Hexapoda = morphology NOT lattice-derivation (ENTOMOLOGY); honeycomb hexagonal = Euclidean Hales 1999 NOT lattice (APICULTURE); Phytophthora = oomycete NOT true fungus (MYCOLOGY).
- **Dual-use discipline**: SYNBIO (Tumpey 2005 DURC case study + deny:write tags + no operational protocols).
- **Scope distinctions**: HIV (virology) vs HIV-TREATMENT (therapy); NEUROSCIENCE vs NEURO (BCI) vs NEUROPHARMACOLOGY; COFFEE vs COFFEE-SCIENCE; DOLPHIN vs DOLPHIN-BIOACOUSTICS; HEXA-WEAVE (general capsid assembly) vs HEXA-VIROCAPSID (virology specialization).

## Verdict

**LIGHT (final, 2026-05-16)** — **65/65 cohort tapes honest-pass** after Pilot → Batch-6 sequential rewrites (2026-05-15→16). **Scope boundary (user decision 2026-05-16)**: the honesty cohort + `run_all.sh` gate target ROOT `*.tape` only; subdirectory tapes (`LVAD/*.tape` etc.) are separate subprojects, intentionally out of cohort scope — not an oversight. All root `.tape` carry the lattice-fit guard + honest n=6 stance + grounded citation (literature for science tapes; governance for meta tapes via meta-mode opt-in). The §C `<DOMAIN>.tape` cohort gap from the original mass-split (`153b5a2`) is fully closed. The §A markers + JSONL absorption registry + §B identity-surface gaps remain open as the next ROI tier. Best next-step: promote `tape-lint` into `selftest/run_all.sh` as a hard gate now that all 65 are green.
