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
# ECOLOGY-AGRICULTURE-FOOD.log.tape — append-only event history (v1.2 split)
# Sibling: ECOLOGY-AGRICULTURE-FOOD.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_2026_05_16 := "ECOLOGY-AGRICULTURE-FOOD.tape full real-science rewrite — compound food-system substrate" :: rewrite [ok d=2026-05-16]
  origin = "Pre-rewrite ECOLOGY-AGRICULTURE-FOOD.tape was a pure lattice-tautology stub (~380 lines): @D row_* entries with Korean-language σ/τ/φ/J₂ mappings (σ(6)=12, τ(6)=4, φ(6)=2, J₂=24), 'EXACT' markers, and zero real food-system science. No @F guard, no @N honest stance, no @X :: literature entries, no real citations — linter would FAIL all three contract conditions."
  user-decision = "2026-05-16: rewrite from lattice-tautology stub to a real, citation-grounded SSOT covering the compound food-system + planetary-boundaries + nutrition-environment-health nexus. Cross-link without duplicating ECOLOGY (54ea261) + AGRICULTURE (ac8f441) + FOOD-SCIENCE (6dfcd66) siblings."
  authored = "Hand-written with real food-system science + landmark citations: Rockström 2009 Nature 461:472-475 (planetary boundaries) · Steffen 2015 Science 347:1259855 (four boundaries transgressed) · Willett et al 2019 Lancet 393:447-492 (EAT-Lancet Commission) · Poore & Nemecek 2018 Science 360:987-992 (food-system LCA meta-analysis 38,700 farms) · Klein et al 2007 Proc R Soc B 274:303-313 (pollinator-dependent crops ~35%) · Monteiro et al 2019 Public Health Nutr 22:936-941 (NOVA / ultra-processed foods) · Gustavsson et al 2011 FAO (one-third food production lost/wasted) · Popkin 1993 nutrition-transition framework · FAO SOFI institutional annual report · Evenson & Gollin 2003 Science 300:758-762 (Green Revolution cross-link) · Ceballos et al 2015 Sci Adv (sixth mass extinction cross-link) · MEA 2005 (ecosystem services / biodiversity cross-link) · Cordell 2009 Global Env Change (phosphorus finitude cross-link) · Galloway 2004 Biogeochemistry (nitrogen cycles cross-link) · van Ittersum 2013 Field Crops Research (yield-gap cross-link)."
  structure = "14 §§: (1) planetary boundaries food-system drivers; (2) biodiversity-food link; (3) EAT-Lancet/planetary-health-diet; (4) food-system GHG (Poore & Nemecek); (5) livestock/land/methane; (6) Green Revolution trade-offs; (7) food security/SDG2/FAO SOFI; (8) nutrition transition + UPF/NOVA; (9) food waste (Gustavsson FAO); (10) pollinators/Klein 2007; (11) alt proteins + precision agriculture; (12) 5 @D lim_* real-limits; (13) @F f_lattice_fit + @N n6_honest_stance; (14) 3 @D tp_* predictions + §§ cross-links + 16 @X :: literature entries."
  real-limits = "5 real-limits anchors: lim_liebig_food_system (Liebig minimum at planetary scale) · lim_planetary_boundaries_exceeded (N/P/biodiversity boundaries already transgressed — Steffen 2015) · lim_dietary_transition_irreversibility (cultural/behavioural barriers) · lim_food_waste_reduction (economic/behavioural barriers to 50% by 2030) · lim_agricultural_emissions_yield_tradeoff (GHG-reduction vs yield hard tradeoff)."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: food-system science has no natural n=6 invariant. Nine planetary boundaries (Rockström/Steffen), 35% pollinator dependence (Klein 2007), one-third waste (Gustavsson 2011), NOVA four groups (Monteiro 2019), four food-security pillars (FAO) — all empirical/institutional, none lattice-derived."
  linter = "python3 selftest/tape_lattice_honesty_lint.py ECOLOGY-AGRICULTURE-FOOD.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true)"
  author-era-flags = "Popkin 1993 era (primary author/era cited; subsequent reviews updated the framework) · FAO SOFI (institutional annual series; edition year explicitly noted) · Gustavsson 2011 FAO (institutional report, methodological uncertainty acknowledged in tape body). All other citations carry journal/volume/page."
