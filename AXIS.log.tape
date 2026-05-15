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
# AXIS.log.tape — append-only event history (v1.2 split)
# Sibling: AXIS.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_2026_05_16 := "AXIS.tape honesty-lint rewrite" :: rewrite [ok d=2026-05-16]
  action = "Full structural rewrite of AXIS.tape from philosophical/VQE-reflection stub (9-cluster hypothetical axes: lightcone-isolation · retrocausal · Boltzmann-brain · etc.) to 5-axis structural SSOT for hexa-bio molecular toolkit"
  prior-content = "Pre-rewrite: @I id001 brief='9-axis verification framework · hypotheses cluster' — mis-stated axis count and axis kind; no @F guard, no @N honest-stance, no grounding; linter would FAIL"
  new-content = "Post-rewrite: tape-class='meta/axis-verification' · @F f_lattice_fit · @N n6_honest_stance · @N scope_disclaimer · @X governance citations · 5 @D axis-declaration entries (QUANTUM/WEAVE/NANOBOT/RIBOZYME/VIROCAPSID) · @L axis_layout · @N axis_count_note"
  linter-result = "PASS is_meta=true has_guard=true has_stance=true grounded=true deriv_warnings=1 (tolerated)"
  authority = "[@x_lattice_policy] g1/g2 · [@x_agents_tape] g_meta_mode_optin · selftest/tape_lattice_honesty_lint.py"
  <- "AGENTS.tape id001 (5-axis substrate declaration: QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID)"
