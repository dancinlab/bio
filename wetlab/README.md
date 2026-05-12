# wetlab/ — wet-lab handoff substrate (Phase 1, public templates only)

**Status**: Phase 1 seed landed 2026-05-12 cycle-30++++++.
**Scope**: PUBLIC templates only. Sensitive contracts / signed MTAs / IRB
submissions / IND drafts do NOT live here (see `data/.gitignore` + Phase 2
plan below).

> Per [AGENTS.md](../AGENTS.md) "External-contact deferral policy": agents
> DRAFT these templates; the user sends/signs/pays externally. All deferred
> items are flagged with `STATUS: draft-ready, deferred for user send`.

---

## 디렉토리

| Dir | Purpose | Content type |
|---|---|---|
| [`cro/`](cro/) | CRO RFP templates per axis | drop-in send-ready RFPs |
| [`sop/`](sop/) | Standard Operating Procedures | wet-lab protocols (open-research) |
| [`mta/`](mta/) | Material Transfer Agreement templates | NIH UBMTA + custom MTAs |
| [`ip/`](ip/) | Invention disclosure templates | pre-patent disclosure drafts |
| [`regulatory/`](regulatory/) | Pre-IND / IRB prep docs | FDA / 식약처 submission templates |
| [`data/`](data/) | (gitignored) Anonymized read-out results | post-CRO data archives |

---

## Per-axis CRO matrix (RFP destinations)

| Axis | CRO type | Korea candidates | US/EU candidates |
|---|---|---|---|
| **ribozyme** | RNA synthesis + cleavage kinetics | KIST 분자세포생물학 / 마크로젠 / 바이오니아 | Charles River, Eurofins, Genscript |
| **nanobot** | DNA-origami fold + AFM/cryo-EM | KAIST cryo-EM 센터 / 서울대 nanoscience | Tilibit Nanosystems (DE), Tecton (US) |
| **virocapsid** | Cage assembly + cryo-EM structure | KAIST cryo-EM | NIH cryo-EM, Diamond Light Source (UK) |
| **medical-device** | Diagnostic / monitoring device build | 의료기기 testing labs | FDA-cleared CRO (IQVIA, Charles River) |
| **crispr-cas13-poc-diagnostic** | POC lateral-flow build + clinical sample testing | 식약처 IVD 임상 시험 기관 | CLIA-certified labs (LabCorp) |
| **quantum** | (n/a — qmirror) | n/a | n/a |
| **weave** | (n/a — formal) | n/a | n/a |

---

## Phase 1 → Phase 2 → Phase 3 trajectory

**Phase 1 (지금, 2026-05-12)**: public templates only — RFP drafts, SOP
docs, UBMTA template, invention disclosure templates. All in this repo
under MIT license. No sensitive data.

**Phase 2 (CRO selection + first contract, cycle 31-33)**: when a CRO is
selected, the executed SOW + MTA may need confidentiality. Options:
- (a) Add private branch in this repo for executed contracts (private
  fork; `hexa-bio` itself stays public)
- (b) Spawn private `dancinlab/hexa-clinical` repo for sensitive contracts;
  this `wetlab/` keeps public templates
- Decision deferred until first executed contract (per AGENTS.md
  external-contact deferral policy)

**Phase 3 (IND filing prep, cycle 36+ if applicable)**: regulatory
submissions are confidential. Definitely a private repo (Phase 2 (b)
recommended).

---

## Cross-refs

- [`AGENTS.md`](../AGENTS.md) "External-contact deferral policy"
- [`USER_ACTION_REQUIRED.md`](../USER_ACTION_REQUIRED.md) §2 outreach checklist
- [`CLOSURE_RESIDUAL_BACKLOG.md`](../CLOSURE_RESIDUAL_BACKLOG.md) §C handoff destinations

---

## raw_91 honest C3

- Templates here are STARTER drafts — each must be reviewed + customized
  by the user before sending to actual CROs
- Korea / US / EU vendor candidates are research-stage suggestions, NOT
  validated relationships
- Budget ranges in RFP templates are industry-standard estimates, NOT
  firm quotes; each CRO quotes differently
- Patent counsel consultation should precede external disclosure
  (per `ip/` templates)
