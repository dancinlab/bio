# Pre-IND meeting preparation

**STATUS**: draft-ready, deferred for user action (cycle 32+ timeframe)  
**Template version**: 0.1.0 (2026-05-12)

> Per [AGENTS.md](../../AGENTS.md) "External-contact deferral policy":
> regulatory pre-IND meeting requests are user-authorized + counsel-prepared.
> Software (claude / agents) prepares the briefing material, but the
> MEETING REQUEST is submitted by the user / regulatory consultant.

---

## What is pre-IND?

A pre-IND meeting (also "pre-application meeting") is a free / low-cost
consultation with regulatory authorities **before** an Investigational New
Drug (IND) application is filed. Two paths:

- **US FDA**: Type B pre-IND meeting; 60-90 day lead time; free
- **Korea 식약처**: 사전상담 (pre-consultation); ~6 months lead time; free
- **WHO**: pre-qualification consultation for global health products
  (TB / HIV diagnostics → SHERLOCK-class precedent)

## When to request

Recommended timing: **wet-lab pilot complete (Phase 1 ✅) + initial CRO
read-out data in hand**. Don't request too early (no data to discuss) or
too late (already invested in protocol that may need redesign).

Per cycle plan: cycle 32-33 if Phase 1 wet-lab data lands on schedule.

## Per-axis regulatory class

| Axis | US FDA class | Korea 식약처 class | Rationale |
|---|---|---|---|
| **ribozyme** | Drug (CDER) | 의약품 | Therapeutic catalytic RNA |
| **nanobot** (drug delivery) | Drug or Combination Product (CDER + CDRH) | 의약품 / 융복합 의료기기 | Depends on payload + indication |
| **virocapsid** (gene/drug delivery) | Biologic (CBER) | 생물의약품 | AAV / viral vector class |
| **medical-device** | Class I/IIa/IIb/III (CDRH) | 1/2/3/4 등급 | Per §C clinical-use class |
| **crispr-cas13 POC diagnostic** | IVD (CDRH) or EUA precedent | IVD class III (체외진단의료기기) | SHERLOCK-class diagnostic |

## Briefing document structure (FDA Type B pre-IND)

Standard pre-IND briefing book sections:

### Section 1 — Cover letter + meeting request
- Sponsor name
- Product name / code
- Indication sought
- Proposed phase of development
- Meeting topics (5-10 specific questions for FDA)

### Section 2 — Product description
- Active ingredient(s)
- Mechanism of action (link to in-silico verification: σ(6)=12
  invariant-lattice mathematical framework + axis-specific simulation)
- Manufacturing CMC (Chemistry, Manufacturing, Controls) — TBD per axis

### Section 3 — Nonclinical pharmacology / toxicology
- In-silico predictions (4-state kinetics, Zlotnick ODE, etc.)
- Wet-lab data (from Phase 1 CRO pilot)
- Animal study plan (Phase 2 → IND-enabling)

### Section 4 — Clinical proposal
- Proposed Phase 1 trial design (FIH — First-in-Human)
- Subject population
- Dose escalation strategy
- Safety monitoring plan

### Section 5 — Specific questions for FDA

Examples (per-axis):

**Ribozyme**:
> Q1. Is the hammerhead 12-nt minimal motif acceptable as a defined
> single-active-molecule under CDER guidelines, or does FDA classify it
> as a biologic (RNA therapeutic) requiring CBER review?
>
> Q2. What additional nonclinical toxicology is required for catalytic-RNA
> therapeutics beyond standard small-molecule SUS-tox + repeat-dose?
>
> Q3. Are the in-silico 4-state kinetics + GENCODE v47 off-target screen
> acceptable as supporting evidence for IND filing, or is wet-lab
> off-target empirical data required?

**Nanobot**:
> Q1. Is a DNA-origami nanobot a Combination Product (drug + device) or
> a single-product device per 21 CFR 3.2(e)?
>
> Q2. What CMC standards apply to DNA-origami manufacturing
> (single-batch homogeneity, fold yield specification, M13 scaffold
> sourcing)?
>
> Q3. Does the n=6 invariant-lattice mathematical framework affect
> IND-enabling timeline (Mathlib formal proof recognition)?

**CRISPR-Cas13 POC diagnostic**:
> Q1. Does the SHERLOCK EUA precedent apply for our Cas13 lateral-flow
> diagnostic, or do we need full 510(k) De Novo classification?
>
> Q2. What CLIA category fits (waived / moderate-complexity / high-
> complexity) for POC sputum (TB) and plasma (HIV-1) detection?

### Section 6 — Attachments
- In-silico simulation data (links to GitHub repo)
- Pre-existing published prior art (PubMed IDs)
- Patent landscape summary
- CRO Phase 1 protocol + initial data

---

## Pre-meeting checklist (user action)

- [ ] Phase 1 wet-lab data acquired (per cycle 32+ timeline)
- [ ] Patent disclosure draft prepared (`wetlab/ip/`)
- [ ] Regulatory consultant engaged (cycle 31+; see USER_ACTION_REQUIRED.md §2.3)
- [ ] Briefing book drafted (~30-50 pages; counsel + consultant collaborate)
- [ ] Specific questions list (5-10 per meeting; SMART criteria)
- [ ] Meeting request submitted (Type B form to FDA / 사전상담 신청서 to 식약처)
- [ ] Internal review: legal counsel + scientific lead sign-off

## After-meeting follow-up

- [ ] Capture FDA / 식약처 written response within 30 days (Type B
  meetings result in formal minutes)
- [ ] Update CMC / nonclinical / clinical plan per regulator feedback
- [ ] Begin IND-enabling studies (typical 18-24 months pre-IND filing)

---

## raw_91 honest C3

- Pre-IND meeting requests are **subject to regulator queue** — FDA Type
  B target is 60 days but can stretch; 식약처 사전상담 can take 6+ months
- Pre-IND **outcomes are non-binding** — written response is guidance,
  not approval; FDA can change position at IND-filing review
- For diagnostic (Cas13 POC), the **EUA path is opportunistic** —
  triggered only by declared public health emergency; standard path
  is De Novo / 510(k)
- Korea / US dual-track is common — start with Korea for cost + speed,
  then US for global market
- **GLP / GMP / GCP compliance** is required from IND-enabling onward;
  current in-silico + CRO pilot is preclinical research-grade, NOT
  GLP-grade. Plan transition timing carefully.
