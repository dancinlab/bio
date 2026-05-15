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
# BIO-PHARMA.log.tape — append-only event history (v1.2 split)
# Sibling: BIO-PHARMA.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite := "BIO-PHARMA.tape rewritten from lattice-tautology stub to real-science SSOT" :: rewrite [ok d=2026-05-16]
  origin = "BIO-PHARMA.tape was a fabricated lattice-tautology stub (created in the hexa-bio mass-split, commit 153b5a2). It 'derived' bio-pharma metrics from n=6 lattice numbers: 생산량 12g/L from σ=12; 배치 성공률 96% from 2σ·τ; QC 시간 4hr from τ=4; 6대 핵심 지표 = n=6; σ·φ=n·τ core identity; sopfr=5 fallback channels — all presented with x='EXACT'. Zero real biology, zero real citations, zero real regulatory content. Every row_* / b_* / tp_* stub entry deleted."
  authored = "Hand-written with real drug development pipeline biology + landmark clinical and pharmacoeconomic citations. Replaces ZERO science with: canonical pipeline stages (target ID → NDA/BLA → Phase IV); modalities (small molecule, mAb, ADC, peptide, gene therapy/AAV cross-linked to HEXA-VIROCAPSID, CAR-T, siRNA/ASO, mRNA); R&D economics (Munos 2009 Eroom's Law predecessor; Scannell et al. 2012 Eroom's Law; Paul et al. 2010 ~$1.8B/drug; DiMasi series era-flagged); reproducibility crisis (Begley & Ellis 2012 — 6/53; Prinz 2011 era-flagged; Ioannidis 2005); regulatory landscape (FDA 21 CFR Parts 312/314/600 IND/NDA/BLA; EMA centralised procedure; ICH E6/E9/M3/S series); landmarks (imatinib/Druker 2001; patisiran/Adams 2018 NEJM — first siRNA; Maude 2014 CD19 CAR-T; mRNA COVID era); 7 real-limit anchors (clinical attrition ~90% Hay 2014; Phase II dominant attrition; animal-model translational gap; manufacturing/CMC complexity; regulatory time/cost; Eroom's Law structural; pricing/access tension); 3 falsifiable predictions with falsifiers + sources; 14 real @X :: literature citations."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: pharmaceutical drug development has NO natural n=6 invariant. Pipeline stage count is not 6; clinical phase count is FOUR by common convention; FDA drug-review timelines are PDUFA targets set by statute (10/6 months), not lattice; attrition rates are empirical fractions; R&D costs are industry econometric measurements. Coincidence is OBSERVATION ONLY, never derivation. This honesty IS the corrective for the audited lattice-tautology stub."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first — 7 real-limit anchors with EMPIRICAL/HARD/SOFT/SOCIOECONOMIC wall labels); g2 (lattice-is-tool — declined as derivation); g3 (honesty-obligation-external — FDA/EMA/ICH/pharma companies are external entities; no lattice assertion applied); g8 (in-silico-only-claim-scope — @N scope_disclaimer added; domain is the pipeline meta-domain, NOT specific therapeutic claims); f1 (no lattice-fit); f2 (no in-silico→clinical/efficacy/investing claim — figures paraphrased from published literature for modeling context only). Provenance recorded in @I id001 rewritten-from key."
  honesty-caveats = "Three citations flagged primary-author/era only or with explicit era/methodology context: x_dimasi_series (cost-of-development series, methodology contested, directional claim accepted); x_prinz_2011 (Bayer internal study, era; ~25% reproducibility figure acknowledged as specific-sample context); x_ich_guidelines (guideline-family level — specific revision dates evolve, verify for real submissions). The ~90% attrition / ~10% success rate from Hay 2014 is paraphrased from the published analysis and flagged as dataset-period/definition-dependent. No cost figures are derived — stated as era-specific econometric measurements with appropriate flags. No lattice-derived numbers exist in the rewritten file."
  lint = "python3 selftest/tape_lattice_honesty_lint.py BIO-PHARMA.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true, deriv_warnings=[] — zero lattice-derivation lines remain; all row_*/b_*/tp_* garbage deleted)."
