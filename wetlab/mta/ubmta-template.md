# UBMTA-derived MTA template (Material Transfer Agreement)

**STATUS**: draft-ready, deferred for user send  
**Source**: derived from NIH UBMTA (Uniform Biological Material Transfer Agreement, https://www.nih.gov/health-information/nih-clinical-research-trials-you/uniform-biological-material-transfer-agreement-ubmta)  
**Customize before send**: party names, material descriptions, governing law

> Per [AGENTS.md](../../AGENTS.md) "External-contact deferral policy": this
> template is DRAFT-ONLY. Actual MTA signing is user-authorized per-item
> after legal review.

---

## 1. Parties

This Material Transfer Agreement ("Agreement") is between:

- **Provider**: [Provider institution name + address]
  (the "Provider"; legal owner of the Material)
- **Recipient**: [Recipient CRO name + address]
  (the "Recipient"; receiver of the Material for defined Research Project)

## 2. Definitions

- **Material**: the biological material described in Schedule A
  (e.g., plasmid, RNA, protein, capsid, DNA-origami construct,
  oligonucleotide library, expressed protein).
- **Modifications**: derivatives of the Material made by Recipient that
  contain the Material or its information.
- **Research Project**: the specific in-vitro / in-vivo experimental
  scope described in Schedule B (matches the executed SOW).

## 3. Permitted use

- (a) Recipient may use the Material **only for the Research Project**
  defined in Schedule B.
- (b) Recipient shall NOT use the Material for commercial purposes,
  human-subject research (without separate IRB approval), or transfer
  to any third party without Provider's written consent.

## 4. Title

- (a) Provider retains all right, title, and interest in the Material
  and any Modifications that contain the Material.
- (b) Inventions made solely by Recipient that do NOT incorporate the
  Material remain Recipient's IP.

## 5. Confidentiality

- (a) Each party shall hold the other's Confidential Information in
  confidence for **[5 / 7 / 10] years** from disclosure.
- (b) Confidential Information includes: sequences, structures,
  protocols, and unpublished read-out data.

## 6. Publication

- (a) Recipient may publish results from the Research Project after
  giving Provider **60 days** advance notice for review.
- (b) Provider may request delay of up to **90 days** for patent
  filing purposes; longer delays require mutual agreement.

## 7. Disclaimer

- (a) Provider provides the Material "AS IS" without warranty.
- (b) Recipient acknowledges biosafety risks and follows applicable
  BSL-level guidelines (BSL-2 default; BSL-3 for TB).

## 8. Term / termination

- (a) This Agreement is effective for the duration of the Research
  Project plus the confidentiality period.
- (b) Either party may terminate with **30 days written notice** for
  material breach.

## 9. Governing law

- Korea: Korean law applies; Seoul Central District Court has jurisdiction.
- US: [State] law applies; [federal court venue].
- International: ICC arbitration in [city] under English law.

---

## Schedule A — Material description

(per-axis specific — fill from RFP scope)

- **Ribozyme**: 12-nt hammerhead minimal motif RNA + plasmid clone
- **Nanobot**: M13 scaffold + ~200 staple oligo library + cadnano file
- **Virocapsid**: capsid protein expression plasmid + assembly protocol
- **Cas13 diagnostic**: LbuCas13a / LwaCas13a expression plasmid + crRNA + reporter RNA

## Schedule B — Research Project scope

(matches RFP scope of work; one-to-one with executed SOW)

## Schedule C — Reach-through restrictions

- Recipient shall not assert any patent claims that read on Provider's
  Material or its **direct expression products**.

---

## Signature block

```
Provider:                              Recipient:

By: ___________________________        By: ___________________________
Name:                                  Name:
Title:                                 Title:
Date:                                  Date:
```

---

## Pre-signing checklist (user action required)

- [ ] Legal counsel reviewed (patent counsel + general counsel)
- [ ] Party names + addresses filled (Schedule A/B)
- [ ] Confidentiality period selected (5 / 7 / 10 years)
- [ ] Governing law jurisdiction confirmed
- [ ] Both parties have signed mutual NDA on file (pre-MTA)
- [ ] Material Schedule A delivered to Recipient
- [ ] Research Project Schedule B matches executed SOW
- [ ] No conflict-of-interest disclosure required

**Action**: USER sends to legal review before signing. Software (claude
/ agents) does NOT execute MTAs.
