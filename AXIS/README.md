# AXIS/ — hexa-bio axis architecture + expansion brainstorm (synthesis)

> **Synthesis** of the committed 5-axis structural SSOT (`../AXIS.tape`) +
> the exhaustive axis-expansion brainstorm
> (`../docs/hexa_bio_axis_expansion_brainstorm_2026_05_08.md`, 165 options)
> + the paradigm-shift integration brainstorm
> (`../docs/hexa_bio_paradigm_shift_integration_brainstorm_2026_05_08.md`).
>
> **This is NOT a decision to add a 6th axis.** The brainstorm's honest
> conclusion is to KEEP 5 axes + a cross-cutting platform layer; any 6th
> axis is deferred to post-1.0. This README records the analysis, not a
> change.
>
> **Governance**: `g1` real-limits-first · `g2` lattice-is-tool ·
> `g3` honesty-obligation-external · `g8` in-silico-only-claim-scope ·
> `f_lattice_fit` (axis COUNT is an architectural decision grounded in
> biology/compute scope — NEVER derived from the n=6 lattice).

---

## §0 Committed architecture — the 5 axes (from `../AXIS.tape`)

hexa-bio declares **5 molecular computation axes** as project
architecture (in-silico simulation substrates only — a C2/C3
simulator-consistency PASS is NOT a wet-lab/clinical/therapeutic claim;
all 5 are scientifically unverified at the wet-lab boundary, g8):

| Axis | Substrate scope | Canonical SSOT |
|---|---|---|
| **QUANTUM** | quantum-chemistry VQE (pocket active-space, ligand→H, UCCSD/HE) | `../AXIS.tape` + `quantum/` |
| **WEAVE** | Caspar–Klug quasi-equivalence · Zlotnick nucleation–elongation | `../HEXA-WEAVE.tape` |
| **NANOBOT** | DNA nanotech · molecular motors · C0b skeleton · Brownian limits | `../HEXA-NANOBOT.tape` |
| **RIBOZYME** | ribozyme catalysis · Eyring k_cat · MFE/Nussinov · off-target | `../HEXA-RIBOZYME.tape` |
| **VIROCAPSID** | viral capsid assembly · PDB corpus · structural virology | `../HEXA-VIROCAPSID.tape` |

**Count honesty (`g2` / `f_lattice_fit`)**: the count *5* is the
project's architectural decision grounded in the computational scope
chosen per biological substrate — NOT derived from any lattice invariant
(σ=12, τ=4, φ=2, J₂=24). The "hexa" token is a dancinlab-family branding
artifact. Lattice tokens may APPEAR in per-axis native-spec context
(e.g. hexamer packing in icosahedral capsid geometry — a geometric
observation from capsid science) but are NEVER a derivation source for
any axis count, position, or result.

---

## §1 The expansion question + 5 promotion criteria

Should there be a 6th axis? A candidate is promotable only if it passes
all five (each scored 0–1, M/N/R/S/F; 4.5+ AND 5/5 to truly promote):

1. **Modality (not scope)** — a molecular/drug-action modality, not a
   disease range
2. **Non-overlap < 30%** — ≥30% overlap with an existing axis ⇒ demote
   to sub-axis
3. **Rigor** — mechanism + verifiable endpoint + mechanistic publication
4. **Scope discipline (CDER)** — drug-only; device(CDRH)/biologic-only
   (CBER) avoided or explicitly flagged
5. **Falsifier accessibility** — an `F-Q-6-*` falsifier is definable

Previously rejected (re-confirmed): BIO-EVOLUTION (borderline) ·
QUANTUM-BIOLOGY (pseudoscience risk) · PLANETARY-HEALTH (scope mismatch)
· CONSCIOUSNESS (too vague, no falsifier).

---

## §2 165-option taxonomy — the brutal classification

165 options enumerated across categories A–J (modality / delivery / AI /
structural-alternatives / scope / temporal / K-platform / QUANTUM-split
/ paradigm-driven / meta). The honest 4-way split:

| Class | Share | Meaning |
|---|---|---|
| **Sub-axis** (specialization of an existing axis) | ~60% | not a 6th axis |
| **Methodology / data / AI** (not a modality) | ~15% | → absorbed by QUANTUM/platform |
| **Scope violation** (CDRH/CBER/food/cosmetic/geo) | ~15% | drug-only discipline breach |
| **Real 6th-axis candidate** | ~5% | the only true promotables |
| **Geographic / policy tag** (K-platform) | ~5% | cross-cutting tag, not an axis |

→ Of 165 options, **only ~3–5 are genuine 6th-axis candidates.**

---

## §3 Top candidates vs explicit rejects

**Top 5 real candidates** (criteria 4.5+ AND 5/5, or strong borderline):

| Rank | Axis | Score | Why |
|---|---|---|---|
| 1 | **COVALENT** (#20) | 4.9 | ibrutinib/sotorasib/adagrasib validated; clear modality; strong QUANTUM-VQE cross (covalent docking); 5/5 |
| 2 | **MOLECULAR-GLUE / BIFUNCTIONAL** (#28–29) | 4.9 | PROTAC paradigm; RIBOTAC crosses RIBOZYME; non-overlapping; 5/5 |
| 3 | **THERANOSTIC** (#51) | 4.7 | Pluvicto-2022 radioligand modality (Dx+Rx); 4.5/5 — Scope 0.8 (CDER+CDRH boundary) |
| 4 | **PEPTIDE / MACROCYCLE** (#39–40) | 4.5–4.8 | semaglutide blockbuster; clear modality; ~30% WEAVE overlap (at the safe line) |
| 5 | **PPI** (#27) | 4.8 | venetoclax/navitoclax precedent; undruggable-target space; high QUANTUM-VQE applicability; 5/5 |

**Top 5 explicit rejects** (pseudoscience / scope violation):
CONSCIOUSNESS (no falsifier) · K-TRADITIONAL #129 (no rigor standard) ·
DTx #108 (software, CDRH) · AI-AXIS #76 (methodology, → QUANTUM absorbs)
· FERROPTOSIS/CUPROPTOSIS #46–47 (research-stage, modality unestablished).

---

## §4 Honest conclusion + staged recommendation

**"Add no axis" (#156) is a valid — possibly the best — option.** The
current 5-axis substrate is sufficient for the 200-disease × 200-hxq
program; a 6th axis costs 50+ disease re-mapping + falsifier
re-definition and threatens the timeline; 5 axes already span modality
density. 6th-axis review is deferred to post-1.0 (v2.0 milestone).

| Horizon | Recommendation |
|---|---|
| **Short (now–9mo)** | KEEP 5-axis. Add only a cross-cutting platform layer (AI/ML, classical-hybrid). Options #91, #98, #145. |
| **Mid (post-1.0, 2027)** | Deep-evaluate ONE of COVALENT / BIFUNCTIONAL as a 6th-axis candidate (separate cycle). |
| **Long (2028+)** | Re-examine THERANOSTIC (CDER boundary) for a possible 7th axis. |
| **Governance** | Adopt an **axis sunset policy** (#104) + an explicit **N-axis target** (#159/#162: 5-year moratorium). K-platform = cross-cutting tag in `hexa.toml`, NOT an axis (#126–135). |

---

## §5 Cross-refs

- Structural SSOT: `../AXIS.tape` (+ event log `../AXIS.log.tape`)
- Per-axis canonical tapes: `../HEXA-WEAVE.tape` · `../HEXA-NANOBOT.tape`
  · `../HEXA-RIBOZYME.tape` · `../HEXA-VIROCAPSID.tape` · `quantum/`
- Source brainstorms: `../docs/hexa_bio_axis_expansion_brainstorm_2026_05_08.md`
  · `../docs/hexa_bio_paradigm_shift_integration_brainstorm_2026_05_08.md`
  · `../docs/sister_repos_brainstorm_2026_05_07.md`
- Closure roadmap: `../AXIS_CLOSURE_PLAN.md` / `.tape`
- Governance: `../AGENTS.tape` g1/g2/g3/g8 · `../CLAUDE.md`

## §6 Log

- 2026-05-16 — AXIS/README.md created: synthesis of the committed 5-axis
  SSOT (AXIS.tape) + the 165-option axis-expansion brainstorm
  (2026-05-08) + paradigm-shift integration brainstorm. Honest bottom
  line preserved: KEEP 5 axes + cross-cutting platform layer; only ~5
  genuine 6th-axis candidates (COVALENT / BIFUNCTIONAL / THERANOSTIC /
  PEPTIDE / PPI); 6th axis deferred post-1.0. Count=5 is an
  architectural decision, NOT lattice-derived (g2/f_lattice_fit). No
  decision changed — analysis recorded only.
