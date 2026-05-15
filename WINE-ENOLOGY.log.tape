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
# WINE-ENOLOGY.log.tape — append-only event history (v1.2 split)
# Sibling: WINE-ENOLOGY.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_from_lattice_tautology := "WINE-ENOLOGY.tape rewritten from lattice-tautology stub into real enology SSOT" :: rewrite [ok d=2026-05-16]
  origin = "WINE-ENOLOGY.tape was a fabricated lattice-tautology stub from the hexa-bio mass-split (commit 153b5a2): ~100+ lines, almost entirely @D row_* / @D b_* entries of the form n_6='σ=12', 'τ=4', 'φ=2', 'J₂=24', 'EXACT' — asserting lattice tokens as derivations for alcohol %, aging months, quality scores (e.g. '숙성 24월 달성 = σ·sopfr=60', 'σ=12 전수 기록', '13/13 PASS n=6 정직성 검증'). Zero real science, zero citations, zero real limits. Deleted in full."
  authored = "Hand-written with real wine chemistry and microbiology + landmark enology literature. Replaced the stub with: must composition — sugars (glucose+fructose ~200–260 g/L pre-fermentation range), organic acids (tartaric dominant, malic subject to MLF, citric minor), phenolic compounds (tannins/anthocyanins — Singleton 1985 era characterization); alcoholic fermentation — Pasteur 1866 era discovery, Saccharomyces cerevisiae primary yeast, native vs cultured strains, fermentation phases (general microbiology, not lattice), ethanol 10–15% v/v typical, volatile acidity as quality marker; yeast nitrogen (Henschke & Jiranek 1993 era); malolactic fermentation (Oenococcus oeni, malic → lactic + CO₂, diacetyl — Bartowsky & Henschke era); phenolic chemistry and color evolution (Somers structural model era, tannin-anthocyanin polymerization); SO₂ — free/total/molecular form distinction, antimicrobial + antioxidant roles, EU regulatory limits (~150–200 mg/L dry wines, regulatory not lattice); wine faults — Brettanomyces volatile phenols 4-EP/4-EG (Chatonnet 1992 era), cork taint TCA at ng/L detection (Sefton & Simpson 2005 review era), reductive faults H₂S/mercaptans, oxidation/VA; oak aging (ellagitannins, oak lactones, vanillin, oxygen micro-ingress, bottle reductive aging); sparkling wine (traditional Champagne method autolysis, Charmat tank method). Four @D :: real-limit anchors (ethanol toxicity ceiling ~14–16% v/v HARD WALL; Brettanomyces near-impossible to eliminate from cellar HARD WALL; cork taint TCA no post-bottling cure at scale HARD WALL; climate-driven alcohol creep SOFT WALL). Three @D :: prediction entries with explicit falsifiers. @F f_lattice_fit + @N n6_honest_stance (enology has no natural n=6 invariant — hexose '6' is organic chemistry / Pasteur stoichiometry, not lattice; 4 fermentation phases is microbiology not τ=4; aging months and SO₂ limits are convention/regulation not lattice constants)."
  citations = "Confident/well-documented: Pasteur 1866 'Études sur le vin' (author/title/year/publisher); Boulton/Singleton/Bisson/Kunkee 1996 (author/title/year/publisher); Ribéreau-Gayon Handbook of Enology Vols 1–2 (Wiley 2nd English ed. era, primary authors/title/publisher cited); Singleton 1985 era phenolics (Folin-Ciocalteu 1965 paper with full citation + later oxidation reviews author/era); Bartowsky & Henschke MLF reviews (late 1990s–2000s era, author/era flagged); Henschke & Jiranek 1993 book chapter (author/book/year); Chatonnet et al. Brettanomyces volatile phenol characterization (J Sci Food Agric 1992;60:165–178 cited with reasonable confidence as landmark paper); Sefton & Simpson 2005 cork taint review (Aust J Grape Wine Res 2005;11:226–240)."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: wine enology exposes NO natural n=6 invariant. Glucose C₆H₁₂O₆ has 6 carbons — hexose chemistry, not lattice. 4 yeast growth phases — microbiology, not τ=4. Aging duration and SO₂ limits — convention/regulation, not σ=12 or J₂=24. This honesty is the corrective for the audited lattice-tautology stub."
  governance = "Complies with hexa-bio AGENTS.tape @D g1 (real-limits-first — every @D |>-grounded to a real @X or real-limit where applicable), @D g2 (lattice-is-tool — declined here), @D g8 (in-silico-only-claim-scope — @N scope_disclaimer: knowledge SSOT, NOT winemaking protocol / regulatory / commercial advice), @F f1 (no lattice-fit). No fabricated numbers or citations: chemical figures paraphrased from cited literature; author/era-only citations flagged as such in each @X ref."
  lint = "python3 selftest/tape_lattice_honesty_lint.py WINE-ENOLOGY.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; deriv_warnings = guard/stance provenance lines only, no genuine lattice-derivation lines)."
