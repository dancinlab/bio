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
# CHEESE-DAIRY.log.tape — append-only event history (v1.2 split)
# Sibling: CHEESE-DAIRY.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_real_science := "CHEESE-DAIRY.tape rewritten — lattice-tautology stub → real dairy-science SSOT" :: rewrite [ok d=2026-05-16]
  origin = "CHEESE-DAIRY.tape was generated as a lattice-tautology stub in the hexa-bio mass-split (commit 153b5a2). The entire content was @D row_* entries with `n_6 = 'σ=12'`, `n_6 = 'n=6'`, `n_6 = 'τ=4'` fields, Korean table cells, and no real dairy science — precisely the anti-pattern forbidden by AGENTS.tape @F f1 + LATTICE_POLICY g1/g2."
  authored = "Hand-written with real dairy chemistry + landmark citations: Fox et al Cheese 3rd ed 2004; Walstra et al Dairy Science and Technology 2006; McSweeney Cheese Problems Solved 2007; Holt casein micelle nanocluster model (~1990s–2000s); Horne dual-binding model (~1998–2000s); Tishkoff et al Nat Genet 2007 (LP alleles / convergent evolution); Ingram & Swallow Hum Genet 2009 (LP genetics review); Hill et al Nat Rev Gastroenterol Hepatol 2014 (probiotic consensus); Steinfeld et al FAO 2006 (Livestock's Long Shadow)."
  content = "12 real dairy-science @D domain/mechanism/real-limit entries (milk composition · casein fractions αs1/αs2/β/κ · whey proteins β-lg/α-la · casein micelle models sub-micelle/nanocluster/Horne dual-binding · cheesemaking unit operations acidification/coagulation/syneresis/salting/ripening · cheese variety axes · pasteurisation/homogenisation · lactase persistence convergent evolution · probiotics). 5 @D :: real-limit entries (bacteriophage HARD WALL · raw-milk pathogen regulatory HARD WALL · allergen/LNP population limit · cold-chain logistical HARD WALL · environmental footprint real systemic limit). 3 @D :: prediction entries with falsifiers. @F f_lattice_fit + @N n6_honest_stance governance entries."
  n6-stance = "Declined as a derivation tool. @N n6_honest_stance + @F f_lattice_fit state plainly: dairy chemistry has no natural n=6 invariant. Four casein fractions are a biochemical taxonomy, not τ=4. Chymosin cleaves Phe105–Met106 — a protease specificity constraint, not a lattice bond index. Ripening durations are biochemistry and economics. This honesty IS the corrective for the audited stub."
  governance = "Complies with hexa-bio AGENTS.tape @D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). Scope disclaimer (@N scope_disclaimer) added — in-silico knowledge SSOT, not food-safety or dietary advice."
  citations-honesty = "Author/era flagged where exact volume/page not asserted with confidence: Holt casein micelle papers; Horne dual-binding; Steinfeld FAO 2006 directional-only note. Tishkoff 2007 / Hill 2014 / Ingram-Swallow 2009 / Walstra 2006 / Fox 2004 asserted with journal/year confidence."
