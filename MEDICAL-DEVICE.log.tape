#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# .tape v1.2 — grammar primer (cold-read by any LLM / agent / human)
# ══════════════════════════════════════════════════════════════════════
# Form: each entry is `@<type> <id> := "<subject>" :: <kind> [<grades>]`
#       optionally followed by body lines (2-space indent) — key=value,
#       edges (<- -> => …), or quoted prose.
#
# ENTRY TYPES (17):
#   Runtime (10): @S session  @U user  @A assistant  @T tool-call  @R result
#                 @H hook  @D decision  @K cost  @P provider  @? anomaly
#   Foundation:   @I identity-claim
#   Declarative:  @X external-citation  @F forbidden-pattern  @N note
#                 @C config  @L layout  @V spec-version
#
# EDGES (12, on body lines, 2-space indent):
#   Causal:     <- caused-by   -> triggers   == continues
#               ~> supersedes  !! aborts     |> verified-by
#   Effect:     => produces (followed by quoted natural-language)
#   Structural: <: specializes  :> generalizes  ?> soft-depends
#               !> conflicts-with  @> projects-to (e.g. @> AGENTS.md)
#
# GRADE TAGS (in [...] on entry header):
#   Delivery:   ok · err · denied · cancelled · partial · superseded
#   Governance: required · recommended · optional · draft · active · deprecated
#   Scoped:     allow:<x> · deny:<x>
#   Time/index: T<n> (turn)  N<n> (wall-sec)  d=<YYYY-MM-DD>
#
# PAYLOAD SYNTAX (body lines):
#   key = "value"           single-line string
#   key = [a, b, c]         array literal
#   key <<~EOF              heredoc (multi-line; ends with EOF on own line)
#     multi-line text
#   EOF
#   "see [@x1] §3"          inline citation by entry id
#   `cmd or path`           backtick code-span (inline only)
#
# Full spec: ~/core/tape/spec/tape.md (or github.com/dancinlab/tape)
# ══════════════════════════════════════════════════════════════════════


# ══════════════════════════════════════════════════════════════
# MEDICAL-DEVICE.log.tape — append-only event history (v1.2 split)
# Sibling: MEDICAL-DEVICE.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite := "MEDICAL-DEVICE.tape rewritten from lattice-tautology stub to real-science SSOT" :: rewrite [ok d=2026-05-16]
  origin = "MEDICAL-DEVICE.tape was a fabricated lattice-tautology stub (created in the hexa-bio mass-split, commit 153b5a2). It 'derived' medical-device facts from n=6 lattice numbers (σ=12/τ=4/φ=2/J₂=24) — e.g. ECG '12 leads = sigma = n+n EXACT', MRI '12 coil channels = sigma EXACT', '6 MHz ultrasound = n EXACT', '4 ultrasound modes = tau EXACT', plus a banner advertising '6-DOF surgical robot · 12 impossibility theorems · 4-regulator industrial validation' as n=6 derivations and an 'Alien Level 10/10' product-maturity grade — direct LATTICE_POLICY g1/g2 + g3 (honesty-obligation-external) + f1 violation. FDA / EU MDR / ISO / IEC are external regulatory and standards bodies — applying the lattice to their classification counts, lead counts and conformity-assessment numerology is precisely the f1 forbidden pattern. Every row_* / banner ASCII-art comment / 'EXACT' grade stub deleted."
  authored = "Hand-written with real medical-device regulation, standards and engineering practice. Replaces ZERO substance with: classification frameworks (FDA Class I/II/III under 21 CFR Part 860; EU MDR Class I/IIa/IIb/III under Regulation (EU) 2017/745 Annex VIII; IVDR Class A/B/C/D for completeness); premarket pathways (510(k) substantial equivalence, De Novo, PMA, Breakthrough Devices Program, CE marking + notified body + EUDAMED); QMS + design controls (ISO 13485:2016, 21 CFR 820.30 design controls + DHF, risk management ISO 14971:2019); biocompatibility (ISO 10993-1:2018 and the wider 10993 series); sterilization (ISO 11135 EO / ISO 11137 radiation / ISO 17665 moist heat — cited at standard-family/era level); SaMD (IMDRF framework, IEC 62304:2006/A1:2015, FDA AI/ML SaMD action plan 2021 + PCCP, FDA cybersecurity guidance 2023); human factors / usability (IEC 62366-1:2015, FDA HF guidance 2016); clinical evaluation (MDR Annex XIV, CER, PMCF) + post-market surveillance & vigilance (MEDDEV 2.12-1, FDA 21 CFR Part 803 MDR + MAUDE + recall classes); UDI (21 CFR Part 830 + GUDID + EUDAMED UDI module). Six real-limit anchors: regulatory time/cost HARD WALL (PMA vs 510(k)); biocompatibility & sterilization HARD WALL (materials science); cybersecurity EVOLVING WALL (adversarial); PMS/recall EMPIRICAL WALL (Kramer 2012 lineage); legacy/interoperability SOFT WALL (installed-base); use-error HARD WALL (cognitive). Three falsifiable predictions (pathway-rigor gradient, post-market recall non-zero, use-error residual non-zero) with sources. 21 real @X :: literature citations (FDA CFR parts 820/860/807/814/803/830; FDA De Novo / Breakthrough / human-factors-2016 / cybersecurity-2023 / AI-ML-2021 guidance documents; EU MDR 2017/745 and IVDR 2017/746; MEDDEV 2.12-1; ISO 13485:2016, 14971:2019, 10993-1:2018, 11135-family, 11137-family, 17665-family; IEC 62304:2006/A1:2015, 62366-1:2015; IMDRF SaMD framework; Kramer NEJM 2012)."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: medical-device regulation exposes NO natural n=6 invariant. FDA risk classes count THREE (I/II/III); EU MDR risk classes count FOUR (I/IIa/IIb/III); EU IVDR risk classes count FOUR (A/B/C/D). The standard 12-lead ECG is a clinical-historical convention dating to the early-20th-century evolution of Einthoven and the precordial-lead literature — a HISTORICAL convention, not a derivation from σ=12. SE(3) is six-dimensional because rigid-body motion in 3-space has 3 translations + 3 rotations (a classical-mechanics fact), not because n=6. Coincidence is observation-only, never derivation. This honesty IS the corrective for the audited lattice-tautology stub (g3 honesty-obligation-external also applies — FDA/EU MDR/ISO/IEC are external bodies)."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first — 6 real-limit anchors), g2 (lattice-is-tool — declined as derivation), g3 (honesty-obligation-external — no lattice-fit on FDA/EU MDR/ISO/IEC), g8 (in-silico-only-claim-scope — @N scope_disclaimer added; NOT regulatory/legal/clinical advice), f1 (no lattice-fit on external regulators/standards bodies), f2 (no in-silico→clinical/regulatory claim — real device development requires qualified Regulatory Affairs, Quality Assurance, clinical-evaluation and notified-body involvement). Provenance recorded in @I id001 rewritten-from key."
  honesty-caveats = "No fabricated numbers/citations. Document IDs/years stated with confidence where solid (ISO 13485:2016, ISO 14971:2019, ISO 10993-1:2018, IEC 62304:2006 + A1:2015, IEC 62366-1:2015, EU MDR Regulation (EU) 2017/745, EU IVDR Regulation (EU) 2017/746, Kramer NEJM 2012;366:848–855, FDA AI/ML action plan January 2021, FDA HF guidance 2016, FDA cybersecurity 2023). Sterilization standard FAMILIES flagged at family/era level (ISO 11135 / ISO 11137 / ISO 17665) where the exact applicable revision varies by jurisdiction and notified-body recognition — verified statement says 'verify exact applicable revision'. FDA De Novo and Breakthrough Devices Program cited at document-family/statutory level (FD&C Act §513(f)(2) and 21st Century Cures §3051 amending §515B) because specific final-guidance revisions continue to evolve. FDA QSR↔QMSR alignment with ISO 13485:2016 stated as the current rule-direction without asserting an effective-date claim. MEDDEV 2.12-1 cited as legacy MDD-era guidance that continues to inform MDR vigilance terminology. Kramer 2012 is cited as the anchoring NEJM regulatory-comparative reference; the companion PLoS Medicine analyses on PMA-device post-market safety are referenced at primary-author/journal level without asserting a specific page range, mirroring the gold tape's x_goren_2014 discipline."
  lint = "python3 selftest/tape_lattice_honesty_lint.py MEDICAL-DEVICE.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true, deriv_warnings=[] — zero lattice-derivation lines remain; every row_* / banner ASCII-art / EXACT-grade stub deleted)."
