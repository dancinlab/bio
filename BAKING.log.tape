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
# BAKING.log.tape — append-only event history (v1.2 split)
# Sibling: BAKING.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_from_lattice_tautology := "BAKING.tape rewritten from lattice-tautology stub into real cereal-chemistry SSOT" :: rewrite [ok d=2026-05-16]
  origin = "BAKING.tape was a fabricated lattice-tautology stub from the hexa-bio mass-split (commit 153b5a2): ~379 lines, almost entirely `@D row_*` / `@D b_*` entries of the form `n_6 = \"σ=12\"`, `n_6 = \"τ=4\"`, `x=\"EXACT\"`, `x=\"n=6\"` — zero real science, every 'value' asserted as lattice-derived (e.g. 'protein % = 12 because σ=12', 'oven-spring % = 60 because σ·sopfr=60', 'volume increase = 4× because τ=4'). Korean-language glosses on lattice tautologies, fabricated 'TP-1..TP-10' predictions all citing lattice constants as falsifiers. No citations, no falsifiers grounded in real baking science, no real limits. Deleted in full (all stub lines removed)."
  authored = "Hand-written with real cereal chemistry + baking science + landmark literature. Replaced the stub with: wheat flour composition (starch amylose/amylopectin, protein 8–14% gliadin+glutenin, lipids, pentosans — Pomeranz 1988 · Hoseney 1994); gluten network formation (S-S bond formation, viscoelasticity, HMW/LMW glutenin subunits — Shewry · Belton 1999); leavening (Saccharomyces cerevisiae fermentation CO₂+ethanol — Reed & Nagodawithana 1991; sourdough LAB+wild-yeast mixed culture, lactic+acetic acid, lactic:acetic ratio — Gänzle 2014 · De Vuyst; chemical leavening NaHCO₃/baking powder — Hoseney 1994); Maillard reaction (Maillard 1912 primary-author/era; Hodge 1953 J Agric Food Chem 1:928–943 — glycosylamine→Amadori→α-dicarbonyl→melanoidins+Strecker degradation; temperature/pH/water-activity dependence); caramelization (sugar pyrolysis above ~160°C, no nitrogen required, distinct from Maillard); starch gelatinization (~58–75°C wheat starch) and retrogradation/staling (amylopectin recrystallization; refrigerator temperature accelerates — Goesaert 2005); acrylamide formation (asparagine+reducing sugar Maillard side-reaction above ~120°C — Stadler 2002 · Mottram 2002); bread quality factors (hydration, fermentation time, gluten strength, baking temperature, oven-spring — Cauvain & Young 2006). Five @D :: real-limit anchors (celiac disease immunological HARD WALL — Catassi · Lebwohl 2015; starch retrogradation/staling kinetic SOFT WALL — Goesaert 2005; acrylamide IARC 2A + EU regulatory HARD limit — Stadler/Mottram 2002; allergen cross-contact Codex 20 ppm floor; sourdough starter ecological instability SOFT WALL — Gänzle 2014) + 3 falsifiable @D :: prediction entries with explicit real-science falsifiers."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: baking chemistry exposes NO natural n=6 invariant — flour composition, Maillard onset temperature, starch gelatinization range, fermentation stages, and leavening-gas volumes are empirical food-science quantities determined by polymer physics, organic chemistry, microbiology, and thermodynamics, NOT lattice-derived. Any numeric coincidences are OBSERVATION ONLY. This honesty is the corrective for the audited lattice-tautology stub."
  governance = "Complies with hexa-bio AGENTS.tape @D g1 (real-limits-first — every @D |>-grounded to a real @X), @D g2 (lattice-is-tool — declined here), @D g8 (in-silico-only-claim-scope — @N scope_disclaimer: knowledge SSOT, NOT bakery formulation / food-safety protocol / clinical claim), @F f1 (no lattice-fit on external-entity). No fabricated numbers or citations: composition/temperature/threshold figures are paraphrased from cited literature; citations flagged as author/era-only where exact bibliographic detail is not asserted (Maillard 1912 primary-author/era; De Vuyst era; Shewry era-representative; Pomeranz textbook era; Hoseney textbook era; Cauvain & Young textbook era; Catassi era; Reed & Nagodawithana era) — all flagged as such in each @X ref field."
  lint = "python3 selftest/tape_lattice_honesty_lint.py BAKING.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; deriv_warnings = guard/stance provenance lines only, no genuine lattice-derivation lines)."
