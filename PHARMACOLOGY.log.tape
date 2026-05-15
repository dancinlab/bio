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
# PHARMACOLOGY.log.tape — append-only event history (v1.2 split)
# Sibling: PHARMACOLOGY.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite := "PHARMACOLOGY.tape rewritten from lattice-tautology stub to real-science SSOT" :: rewrite [ok d=2026-05-16]
  origin = "PHARMACOLOGY.tape was a fabricated lattice-tautology stub (created in the hexa-bio mass-split, commit 153b5a2). It 'derived' pharmacology metrics from n=6 lattice numbers: 생체이용율=95% from σ·sopfr/10; 부작용=4% from τ=4; 선택성=95% from σ=12; 임상 지표=12 from σ=12; 6대 핵심 지표 = n=6; σ·φ=n·τ=24 core identity; sopfr=5 fallback channels — all presented with x='EXACT'. Zero real pharmacology, zero real citations, zero real receptor/ADME/pharmacogenomics content. Every row_* / b_* / tp_* stub entry deleted."
  authored = "Hand-written with real pharmacology + landmark literature + standard textbook references. Replaces ZERO science with: receptor theory (Clark 1933 mass-action; Stephenson 1956 efficacy/intrinsic-activity; Black & Stephenson 1962 propranolol — 1988 Nobel; Hill 1910 cooperative binding equation; ED50/TD50 and therapeutic index); ADME (bioavailability F = AUC_PO/AUC_IV with dose correction; first-pass effect; V_d; albumin/AAG protein binding; BBB; CYP450 superfamily with CYP3A4/2D6/2C9/2C19 etc.; renal CrCl with Cockcroft-Gault 1976 Nephron equation; biliary excretion); DDIs (CYP3A4 induction by rifampicin/St-John's-Wort with HERBALISM cross-link; CYP3A4 inhibition by ketoconazole/grapefruit furanocoumarins); receptor and target classes (GPCRs ~one-third of approved drug targets per survey-era data; nuclear receptors; ion channels; enzymes/kinases; transporters); pharmacogenomics (CYP2D6 PM/IM/EM/UM phenotypes with codeine→morphine variability; HLA-B*5701 abacavir hypersensitivity — Mallal 2008 NEJM PREDICT-1, cross-link BIOLOGY-MEDICAL/HIV-TREATMENT; CYP2C9/2C19 polymorphisms; CPIC guideline family); R&D productivity (Scannell 2012 Eroom's Law — cross-link BIO-PHARMA). 4 real-limit anchors (narrow-TI HARD on cytotoxics/warfarin/lithium/digoxin; idiosyncratic-AE STATISTICAL HARD floor from rule-of-three sample-size limits; individual PK variability HARD from CYP polymorphisms + renal function + age; animal-model translational gap HARD cross-link BIO-PHARMA). 3 falsifiable predictions with falsifiers + sources. 9 real @X :: literature citations (Clark 1933 book; Stephenson 1956 era; Black & Stephenson 1962 Lancet; Hill 1910 J Physiol; Cockcroft & Gault 1976 Nephron; Mallal 2008 NEJM 358:568–579; Scannell 2012 Nat Rev Drug Discov 11:191–200; Goodman & Gilman textbook family era; CPIC guideline family era)."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: pharmacology exposes NO natural n=6 invariant. CYP superfamily has dozens of human isoforms; receptor/target classes are survey-dependent groupings (GPCRs / nuclear receptors / ion channels / enzymes / transporters), not lattice quanta; dose-response curve parameters are empirical fits; ED50/TD50/TI are population ratios; CYP2D6 phenotype bins (PM/IM/EM/UM) are clinical categorisations; CPIC guidelines are evidence-graded human-curated documents. Coincidence is OBSERVATION ONLY, never derivation. This honesty IS the corrective for the audited lattice-tautology stub."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first — 4 real-limit anchors with HARD/STATISTICAL-HARD wall labels); g2 (lattice-is-tool — declined as derivation); g3 (honesty-obligation-external — pharma companies, FDA, EMA, CPIC and academic pharmacology authors are external entities; no lattice assertion applied); g8 (in-silico-only-claim-scope — @N scope_disclaimer added; domain is pharmacology knowledge SSOT paraphrasing public peer-reviewed literature, NOT prescribing/clinical advice); f1 (no lattice-fit); f2 (no in-silico→prescribing/clinical claim — drug examples and effect figures paraphrased from published literature for modeling context only). Provenance recorded in @I id001 rewritten-from key."
  honesty-caveats = "Citations flagged at primary-author/era level where exact volume/page was not certain: x_stephenson_1956 (Br J Pharmacol Chemother era, distinction is textbook-standard); x_cockcroft_gault_1976 (Nephron era, equation is textbook-standard); x_goodman_gilman (textbook family, edition not asserted — directional pharmacology stable across editions); x_cpic_guidelines (consortium guideline-family, individual guidelines published in Clin Pharmacol Ther, revisions evolve continuously — verify current version for any clinical use). Confident citations with full volume/page: x_clark_1933 (book, Edward Arnold & Co.); x_black_stephenson_1962 (Lancet 1962;2:311–314); x_hill_1910 (J Physiol 1910;40:iv–vii); x_mallal_2008 (N Engl J Med 2008;358:568–579); x_scannell_2012 (Nat Rev Drug Discov 2012;11:191–200). The '~50% of drugs metabolised by CYP3A4' and 'GPCRs ~one-third of approved drug targets' figures are flagged as standard-textbook approximations and survey-era percentages respectively — directional dominance is robust, exact figures vary by dataset. No fabricated numbers. No lattice-derived numbers exist in the rewritten file."
  lint = "python3 selftest/tape_lattice_honesty_lint.py PHARMACOLOGY.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; 4 deriv_warnings are benign false positives from regex pattern: BBB acronym body containing 'phi'-like substring; CYP isoform listing 'CYP3A4/3A5' next to numbers; CYP2D6 phenotype acronyms PM/IM/EM/UM appearing near numeric phrasing — none are lattice-derivations. All row_*/b_*/tp_* lattice stub garbage deleted)."
