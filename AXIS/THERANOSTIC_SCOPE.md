# THERANOSTIC — scope-resolution record

> **Status: scope-resolution record (DECISION DEFERRED — see §4). Reading
> this document does NOT register THERANOSTIC as an axis.**
>
> This file is a **governance metadata** artifact: it presents the case
> FOR and AGAINST registering THERANOSTIC as a hexa-bio expansion-MAIN
> axis, names the decision the user would make, and explicitly defers
> that decision. The existing
> [`HIERARCHY.tape`](HIERARCHY.tape) `@N theranostic_status` UNPLACED
> note remains in force until the user decides; this document does NOT
> modify `HIERARCHY.tape`, `AXIS.tape`, `README.md`, or any other file —
> it only cross-links.
>
> **Governance**: `g1` real-limits-first · `g3` honesty-obligation-external
> · `g8` in-silico-only-claim-scope · `f1` lattice-fit-on-external-entity
> · `f_lattice_fit`. This document is governance metadata, NOT an
> in-silico simulator claim (the in-silico C2/C3 scope of `g8` would
> apply to any axis IF it were registered — but no axis is registered
> here).

---

## §1 The question

> **Should THERANOSTIC be registered as a hexa-bio expansion-MAIN axis,
> given its CDER+CDRH scope mix?**

**Context.** THERANOSTIC (radioligand "see and treat" — diagnostic
imaging probe + therapeutic radioligand sharing a targeting vector)
scored **4.7** in the 2026-05-08 axis-expansion brainstorm
([`../docs/hexa_bio_axis_expansion_brainstorm_2026_05_08.md`](../docs/hexa_bio_axis_expansion_brainstorm_2026_05_08.md)
#51) with the sub-criteria **M:1 N:0.9 R:1 S:0.8 F:1** — the dragging
component is the **scope** axis (S=0.8) under [`README.md`](README.md)
**criterion #4 "drug-only (CDER) discipline"**: radiopharmaceuticals
straddle the CDER (drug) / CDRH (radiation-emitting device + medical
imaging) regulatory boundary.

The current placement is **UNPLACED** in
[`HIERARCHY.tape`](HIERARCHY.tape) `@N theranostic_status`:
*"main-eligible-by-modality but scope-deferred — left UNPLACED pending
the scope question (honest, not forced into the tree)."* This document
records the scope question precisely so that the deferred decision is
auditable.

---

## §2 Case FOR registration as expansion-MAIN

1. **Radiopharmaceuticals are FDA-approved as drugs, not devices.**
   The two precedent products — **Pluvicto** (¹⁷⁷Lu-PSMA-617, FDA
   approved March 2022, mCRPC) and **Lutathera** (¹⁷⁷Lu-DOTATATE, FDA
   approved January 2018, GEP-NETs) — were reviewed and approved
   through the **NDA pathway under CDER's Office of Specialty Medicine
   / Division of Imaging and Radiation Medicine** (DIRM, formerly
   DMIP). The approval letters and labels classify them as **drugs**
   (NDA designations, not 510(k)/PMA device clearances).
2. **The chemical entity is a drug-style molecule.** The active
   substance is a **targeting vector (peptide / small molecule) + a
   chelator (DOTA) + a radionuclide (¹⁷⁷Lu, ²²⁵Ac, ⁶⁸Ga)** — a
   discrete, characterizable, GMP-manufactured chemical entity in the
   same family as a covalent inhibitor (`COVALENT`) or a bifunctional
   degrader (`BIFUNCTIONAL`). It is not a biologic (no antibody, no
   gene, no cell) — the CBER hard-disqualifier that struck `ADC` and
   `GENETIC-MEDICINE` does not apply.
3. **The radiation aspect is a technical feature, not a regulatory
   re-categorization.** The radionuclide's emission profile and dose
   physics enter the chemistry, manufacturing, and controls (CMC)
   package and the radiation-safety addenda, but the **regulatory
   center of gravity is CDER** — CDRH is consulted on diagnostic
   imaging device aspects (e.g. the PET/SPECT/CT imaging hardware used
   to read the diagnostic dose), not on the drug substance itself.
4. **Brainstorm precedent.** Score 4.7 (M:1 N:0.9 R:1 S:0.8 F:1) is
   **above the 4.5 promotion threshold**; criterion #4's S=0.8 is the
   only sub-1 component, and the brainstorm's own §3
   ([`README.md`](README.md) §3 Top-5 candidates row 3) lists
   THERANOSTIC as a real 6th/7th-axis candidate (the §4 "long horizon
   2028+" entry already names it for re-examination).
5. **Modality non-overlap.** Radioligand therapy is mechanistically
   distinct from all 5 core axes (no covalent bond, no induced
   proximity, no metal-coordination active site, no ribozyme catalysis,
   no capsid assembly) and from the expansion-main set (COVALENT /
   BIFUNCTIONAL / METALLODRUG / OLIGONUCLEOTIDE). Non-overlap is
   well under the 30% criterion #2 boundary.

---

## §3 Case AGAINST registration

1. **The radiation-emitting nature triggers CDRH / RPDSO review
   pathways that pure CDER drugs do not.** Although the drug substance
   is CDER-regulated, the **emission** of ionising radiation engages
   FDA's **Radiological Products and Devices Safety Office** (RPDSO,
   formerly part of CDRH's OIR) and the broader **CDRH
   radiation-emitting product framework** (21 CFR Parts 1000–1050).
   The therapeutic / diagnostic distinction may also invoke
   **Nuclear Regulatory Commission (NRC) Agreement State** licensing
   for the radionuclide itself — a regulatory layer absent from any
   pure CDER drug. This is the "+CDRH" half of the S=0.8 flag.
2. **The Dx + Rx pairing brings imaging-device scope into the modality
   definition.** "Theranostic" by definition is **diagnostic +
   therapeutic** (see-and-treat). The diagnostic half is **read by an
   imaging device** (PET for ⁶⁸Ga-PSMA-11, SPECT for ¹¹¹In-pentetreotide,
   PET/CT for the diagnostic counterpart of a therapeutic pair). A
   theranostic pair is **not just a drug** — it is a drug + an imaging
   procedure that is itself a regulated diagnostic. Defining the
   modality solely as "radioligand drug" understates the imaging-device
   coupling that gives theranostics their clinical value.
3. **Criterion #4 is explicit: "drug-only (CDER); device(CDRH) /
   biologic-only (CBER) avoided OR explicitly flagged."** The
   brainstorm did flag it (S=0.8 ≠ 1.0). A score of 0.8 is **partial
   compliance**, not full compliance. The hexa-bio expansion-MAIN
   slate (COVALENT, BIFUNCTIONAL, METALLODRUG, OLIGONUCLEOTIDE) all
   sit at S=1.0 (pure CDER) — admitting THERANOSTIC would be the first
   sub-1 scope-discipline admission, weakening the discipline rule for
   future candidates.
4. **Hexa-bio's in-silico simulator scope (`g8`) does not naturally
   model radiation transport.** The 5 core axes + 4 expansion-main
   axes anchor to deterministic real-limits well within
   chemistry/biophysics (Eyring TST, Caspar-Klug geometry,
   SantaLucia NN thermodynamics, ligand-field CFSE, Zlotnick
   nucleation). Modeling radioligand efficacy honestly requires
   **dose-rate radiobiology** (linear-quadratic survival, α/β ratios,
   Monte Carlo radiation transport — e.g. GATE, MCNP, PHITS) — a
   substrate hexa-bio has no current simulator for. An axis whose
   honest real-limit anchor would require importing a Monte Carlo
   radiation-transport stack is a heavier integration than the existing
   stdlib-only deterministic sims.
5. **Honest stance from `f4` / `g3`.** Describing a CDER+CDRH boundary
   modality as a clean CDER-axis would understate the regulatory
   reality. Honesty (`g3`) prefers the UNPLACED note to a forced
   placement — exactly what `HIERARCHY.tape`'s current
   `@N theronostic_status` does.

---

## §4 Honest deferred resolution

**This is a governance question, not a science question.** The
brainstorm score (4.7) and the precedent drugs (Pluvicto 2022, Lutathera
2018) are not in dispute — they are real, FDA-approved, and accurately
described above. The unresolved question is **which side of the
criterion #4 boundary the user wants hexa-bio's expansion-MAIN slate
to sit on**:

| Option | Description | Consequence |
|---|---|---|
| **A — Register as expansion-MAIN** | Add THERANOSTIC to the expansion-main slate (COVALENT, BIFUNCTIONAL, METALLODRUG, OLIGONUCLEOTIDE → +THERANOSTIC) **with an explicit CDER+CDRH scope-mix disclosure** in `HEXA-THERANOSTIC.tape` (and a parallel note in [`HIERARCHY.tape`](HIERARCHY.tape) `@D axis_theranostic` replacing the current `@N theronostic_status`). The disclosure must name the radiation-emitting + imaging-device aspect openly, not bury it. Implementing the axis would also require an honest in-silico simulator-substrate decision (deterministic radioligand kinetics only, or honest 🟠 DEFERRED for full radiation transport). | Score-promotable candidate honored. Criterion #4 discipline relaxed once — every future S<1 candidate gets the same admission claim. |
| **B — Keep UNPLACED** | Leave the existing [`HIERARCHY.tape`](HIERARCHY.tape) `@N theronostic_status` note in force. THERANOSTIC remains a recognized 4.7 candidate (`README.md` §3) but is not added to the code-implemented expansion slate. | Criterion #4 discipline preserved at S=1.0 for all registered axes. Brainstorm `README.md` §4's "Long horizon 2028+ — re-examine THERANOSTIC" stance is honored as-is. |

**This document does NOT pick a side.** Both options are honestly
governance-coherent under the existing rules. Option A trades scope
discipline for score-coverage; option B trades score-coverage for scope
discipline. **Either choice is a USER DIRECTION**, parallel to the
2026-05-16 user direction that registered COVALENT + BIFUNCTIONAL as
expansion-main over the rigorous `README.md` §4 "keep-5" dissent.

**Until the user picks, the existing `HIERARCHY.tape`
`@N theronostic_status` UNPLACED note remains in force. No axis is
being registered by this document.** This file is a scope-question
audit record, not a decision; it records what the question is and what
choosing would commit to, so that the chosen path is on the record with
its honest tradeoff.

---

## §5 Precedent — other UNPLACED notes (same pattern, different basis)

[`HIERARCHY.tape`](HIERARCHY.tape) currently carries three UNPLACED
notes; they share the **honest-not-forced** pattern but rest on
different regulatory bases:

| UNPLACED entry | Basis | Severity | Code-implemented? |
|---|---|---|---|
| `@N theronostic_status` (this doc) | **CDER+CDRH** scope-mix (criterion #4 S=0.8) | **Softer** — drug-substance is CDER; the +CDRH is technical/imaging-coupling, not a categorical disqualifier | No, pending this scope question |
| [`@N genetic_medicine_status`](HIERARCHY.tape) | **CBER** scope — gene therapy / cell therapy / mRNA are biologics (Zolgensma, Casgevy, Comirnaty) | **Hard disqualifier** under criterion #4 drug-only discipline | No (would breach `g8` + criterion #4 if forced) |
| [`@N adc_status`](HIERARCHY.tape) | **CBER** scope — the antibody component is a CBER biologic, even though the small-molecule payload + linker is CDER-class | **Hard disqualifier** at the conjugate level | No |

**Key difference.** GENETIC-MEDICINE and ADC are **categorically
out** because the regulatory center of gravity is CBER (biologics) — a
hard disqualifier. THERANOSTIC's regulatory center of gravity **is
CDER** (the precedent NDAs prove it); the +CDRH/RPDSO/NRC layer is a
technical-regulatory coupling, not a re-categorization. This is why
THERANOSTIC's UNPLACED is a **deferred decision**, while GENETIC-MEDICINE
and ADC are **deferred-permanently-under-current-rules**. Option A
above is coherent for THERANOSTIC in a way it is **not** coherent for
the other two.

---

## §6 Cross-refs

- Current UNPLACED note: [`HIERARCHY.tape`](HIERARCHY.tape)
  `@N theronostic_status` (this document does not modify it)
- Sister UNPLACED notes (same pattern, harder basis):
  [`HIERARCHY.tape`](HIERARCHY.tape) `@N genetic_medicine_status` +
  `@N adc_status`
- Promotion criterion #4 source: [`README.md`](README.md) §1
- Brainstorm row: [`README.md`](README.md) §3 row 3 (THERANOSTIC #51,
  4.7, S=0.8) — fact-checked in §6 row 3 of the same file
- §4 long-horizon entry: [`README.md`](README.md) §4 row "Long
  (2028+) — Re-examine THERANOSTIC (CDER boundary) for a possible 7th
  axis"
- Source brainstorm:
  [`../docs/hexa_bio_axis_expansion_brainstorm_2026_05_08.md`](../docs/hexa_bio_axis_expansion_brainstorm_2026_05_08.md)
  #51
- Core-5 SSOT (UNCHANGED regardless of this scope question):
  [`../AXIS.tape`](../AXIS.tape)
- Governance: [`../AGENTS.tape`](../AGENTS.tape) `g1` `g3` `g8`
  `f1` `f_lattice_fit` `f4`
- FDA regulatory references (by reference only — not embedded):
  - Pluvicto (¹⁷⁷Lu-PSMA-617) FDA NDA approval, 23 March 2022,
    Novartis / Advanced Accelerator Applications. CDER, NDA pathway.
  - Lutathera (¹⁷⁷Lu-DOTATATE) FDA NDA approval, 26 January 2018,
    Advanced Accelerator Applications. CDER, NDA pathway.
  - 21 CFR Parts 1000–1050 (radiation-emitting products framework,
    CDRH).
  - NRC Agreement State licensing framework (radionuclide handling).

---

**Honesty caveats** (apply to this whole document):

1. The scores M:1 N:0.9 R:1 S:0.8 F:1 are the source brainstorm's
   **subjective rubric values**, transcribed not independently
   re-derived ([`README.md`](README.md) §6 caveat 1).
2. Pluvicto and Lutathera are real FDA approvals as cited; the CDER /
   CDRH / NRC regulatory descriptions are factual at the level of
   FDA-center-of-jurisdiction. No clinical / efficacy / regulatory
   trajectory claim is made for hexa-bio (`g8` / `f2`).
3. The n=6 lattice (σ=12 · τ=4 · φ=2 · J₂=24) plays **no role** in
   this scope question. The CDER / CDRH determination is an external
   regulatory categorization and is described on its own terms (`g3` /
   `f1` / `f_lattice_fit`).
4. No axis is registered, modified, or implemented by this document.
   [`HIERARCHY.tape`](HIERARCHY.tape)'s state is **unchanged**.

---

## §7 Log

- 2026-05-16 — `AXIS/THERANOSTIC_SCOPE.md` created. Records the
  scope-resolution question precisely (§1), the case FOR
  expansion-MAIN registration (§2, 5 points, NDA precedent), the case
  AGAINST (§3, 5 points, CDER+CDRH boundary + criterion #4 discipline),
  the honest deferred resolution (§4 — Option A register-with-disclosure
  vs Option B keep-UNPLACED, document does NOT decide), and the
  precedent for UNPLACED handling alongside GENETIC-MEDICINE and ADC
  (§5 — same honest-not-forced pattern; THERANOSTIC's CDER+CDRH is
  **softer** than the two CBER hard-disqualifiers). No edits to
  [`HIERARCHY.tape`](HIERARCHY.tape), [`README.md`](README.md),
  [`../AXIS.tape`](../AXIS.tape), or any other file. Existing
  [`HIERARCHY.tape`](HIERARCHY.tape) `@N theronostic_status` UNPLACED
  status remains in force until the user decides. Governance: `g1`
  real-limits citations (FDA NDA pathway, 21 CFR 1000–1050, NRC
  Agreement States — by reference, not embedded); `g3` honest external
  description (no CDER+CDRH lattice-fit); `g8` in-silico scope clause
  noted as **applying to any axis IF registered**, not to this
  governance-metadata document itself; `f_lattice_fit` honored —
  CDER/CDRH determination is FDA's own categorization, not lattice-derived.
