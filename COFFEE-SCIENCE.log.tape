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
# COFFEE-SCIENCE.log.tape — append-only event history (v1.2 split)
# Sibling: COFFEE-SCIENCE.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_real_science := "COFFEE-SCIENCE.tape full real-science rewrite" :: rewrite [ok d=2026-05-16]
  origin = "COFFEE-SCIENCE.tape was a 695-line lattice-tautology stub (hexa-bio mass-split 153b5a2) containing @D row_* entries with n_6 = σ / τ / J₂ derivation claims, 'EXACT' assertions, and BT-434–438 'Breakthrough Theorems' mapping coffee-science quantities to lattice constants. Every quantity (10 SCA cupping attributes, 9 bar espresso pressure, 18–22% extraction yield, 25–30 s contact time, Q-grade ≥80 threshold) was falsely derived FROM the lattice rather than cited from food science."
  authored = "Full rewrite 2026-05-16 with real specialty-coffee science grounded in landmark literature: SCA cupping protocol + Lingle 1996; Lockhart/NCA 1957 era brewing control chart; Illy & Viani 2005 espresso science; Lawless & Heymann 2010 sensory evaluation; SCA Flavor Wheel 2016 / WCR; Flament 2002 coffee flavor chemistry; Belitz 2009 food chemistry; Farah & Donangelo 2006; Ramirez-Coronel 2019 era decaffeination; Daviron & Ponte 2005 coffee paradox / economics; Murthy & Naidu 2012 waste valorisation; Bunn et al 2015 climate; Davis et al 2011."
  scope-added = "§1 SCA cupping + defect grading; §2 brewing control chart + espresso physics (Lockhart/SCAA era origin; 18–22% yield as sensory calibration, not physical law); §3 roast deep-dive (Strecker degradation, >800 volatile profile, CGA degradation, trigonelline→pyridines); §4 sensory science (Lawless & Heymann framework; SCA Flavor Wheel 2016; orthonasal vs retronasal; aftertaste); §5 decaffeination (Swiss Water Process, scCO₂ supercritical, methylene chloride/EA solvent); §6 climate-economics deep-dive (arabica elevation-quality link; C-market volatility; Fairtrade vs direct trade; coffee waste valorisation); §7 real-limits (4 anchors: brew window empirical, cupping subjectivity HARD, climate envelope HARD cross-link, smallholder economics SOFT); §8 governance (@F lattice-fit guard + @N n6_honest_stance); §9 3 falsifiable predictions; §10 cross-links; §11 15 real @X :: literature entries."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: specialty coffee science has no natural n=6 invariant. 10 SCA attributes = institutional protocol; 9 bar espresso = engineering specification; 18–22% yield = sensory calibration; 80-point threshold = institutional calibration. None derived from σ/τ/φ/J₂. Companion COFFEE.tape's identical stance honoured."
  companion = "COFFEE.tape (committed f714f7a) handles general coffee biology+chemistry. COFFEE-SCIENCE.tape is the specialty-science+sensory+economics deep-dive; zero duplication of COFFEE.tape content."
  lint = "python3 selftest/tape_lattice_honesty_lint.py /Users/ghost/core/hexa-bio/COFFEE-SCIENCE.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; 1 deriv_warning tolerated — 'hard ceiling' in a real-limit description is provenance/domain text, not a live lattice-derivation claim)."
