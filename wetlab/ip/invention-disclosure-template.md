# Invention disclosure template

**STATUS**: draft-ready, deferred for user → patent counsel meeting  
**Template version**: 0.1.0 (2026-05-12)

> Per [AGENTS.md](../../AGENTS.md) "External-contact deferral policy":
> this template is DRAFT-ONLY. Provisional patent application drafting
> requires patent counsel; software (claude) prepares the disclosure
> material, but the FILING is user-authorized + counsel-prepared.

---

## Section 1 — Title

`[Concise invention title; ≤ 15 words; technology + use indication]`

Examples:
- "Hammerhead ribozyme 12-nt minimal motif with σ(6)=12 invariant-lattice geometry for sequence-specific RNA cleavage"
- "DNA-origami nanobot with 12-vertex cuboctahedron skeleton and J₂=24 distinguishable pose states for controlled actuation"
- "Synthetic icosahedral capsid library with universal σ(6)=12 pentamer invariant for multi-T-number drug delivery"
- "CRISPR-Cas13-based POC lateral-flow diagnostic with crRNA-spacer design under n=6 invariant-lattice framework"

## Section 2 — Inventors

| Name | Affiliation | Contribution % |
|---|---|---|
| 박민우 | (need-singularity / dancinlab) | 100% (sole inventor; pending) |

## Section 3 — Background of the invention

[1-2 paragraphs covering:]
- Prior art / state of the art in the technical field
- Limitations of existing solutions (DOF / cycle-coherence / reliability ceiling per HEXA framework §2 COMPARE)
- Problem the invention addresses

## Section 4 — Brief summary

[1 paragraph; ~150 words; the "novel + non-obvious" claim in plain language]

Example template:
> The invention provides a [specific construct / device / method] based on
> the n=6 invariant-lattice mathematical framework (σ(6)=12 divisor sum,
> τ(6)=4 divisor count, φ(6)=2 Euler totient). The construct exploits the
> [specific geometric / kinetic / structural property] to achieve [specific
> measurable improvement] over prior-art solutions. Key novelty is the
> mapping from the abstract invariant-lattice mathematical structure to a
> physically realizable [construct], proven by [in-silico verification /
> formal proof / experimental data].

## Section 5 — Detailed description

[5-15 pages typical; per-claim breakdown]

- §5.1 Construct / device architecture
- §5.2 Synthesis / preparation method
- §5.3 Use / operation method
- §5.4 Performance characterization (in-silico data)
- §5.5 Variations / embodiments
- §5.6 Drawings / figures (refer to attached)

## Section 6 — Claims (draft)

```
Claim 1 (independent): A [construct/device/method] comprising:
  (a) ... [structural feature]
  (b) ... [functional feature mapping to σ(6)/τ(6)/φ(6)]
  (c) ... [novel limit-removal mechanism]
  characterized by [specific quantitative improvement].

Claim 2 (dependent): The [construct/device/method] of Claim 1, wherein
  ... [narrower embodiment]
```

[Counsel finalizes claim wording; this is starter draft only.]

## Section 7 — Prior-art search

- [ ] PubMed / Google Scholar last 5 years (relevant keywords)
- [ ] USPTO / KIPO / EPO / WIPO patent database search
- [ ] Freedom-to-operate (FTO) preliminary assessment

## Section 8 — Commercialization potential

- Target market: [therapeutic / diagnostic / device / cosmetic]
- Regulatory pathway: [FDA Drug / Device / IVD; 식약처 class]
- Estimated market size: [TBD per counsel]
- Competing patents / licensees: [list known related IP]

## Section 9 — Inventor signatures + dates

```
Inventor signature:    ___________________________
Date of conception:    ___________________________
Date of first reduction to practice: ___________________________
Date of this disclosure: ___________________________
```

---

## Per-axis disclosure status (cycle-30++++++ baseline)

| Axis | Disclosure draft ready? | Pre-counsel review? | Filed (provisional)? |
|---|---|---|---|
| ribozyme | ⬜ (use this template) | ⬜ | ⬜ |
| nanobot | ⬜ | ⬜ | ⬜ |
| virocapsid | ⬜ | ⬜ | ⬜ |
| crispr-cas13-poc-diagnostic | ⬜ | ⬜ | ⬜ |
| medical-device | ⬜ (lower priority; device-class) | ⬜ | ⬜ |

## Pre-counsel checklist (user action)

- [ ] Decide axes to file (recommended start: ribozyme + nanobot)
- [ ] Engage patent counsel (1-2hr free consultation; §USER_ACTION_REQUIRED.md §1.3)
- [ ] Provide counsel with this disclosure draft + in-silico data
- [ ] NDA with counsel signed before detailed disclosure
- [ ] Counsel drafts provisional application (claude / agents do NOT
  draft provisional applications — patent counsel only)
- [ ] File within 12 months of public disclosure (US 1-year grace; EU
  absolute novelty — no grace; file before any publication / GitHub
  public push of full embodiment)

## raw_91 honest C3

- This template is **starter material** — full provisional application
  must be drafted by registered patent counsel
- The σ(6)=12 / τ(6)=4 / φ(6)=2 invariant-lattice mathematical framework
  itself is NOT patentable (abstract mathematics; *Diamond v. Diehr*-style
  industrial application is required)
- Specific physical embodiments (12-nt ribozyme, 12-vertex DNA-origami,
  synthetic capsid with σ(6)=12 pentamer arrangement, Cas13 lateral-flow
  with n=6 crRNA spacer) ARE patentable subject matter
- Public GitHub commits (e.g., this repo) **may constitute disclosure**
  that triggers the 12-month US grace period and the absolute-novelty bar
  in EU. File provisional BEFORE making the full embodiment publicly
  reproducible.
