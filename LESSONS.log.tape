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
# LESSONS.log.tape — append-only event history (v1.2 split)
# Sibling: LESSONS.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A a_rewrite_2026_05_16 := "honesty-lint compliance rewrite" :: rewrite [ok d=2026-05-16]
  what = "Rewrote LESSONS.tape to satisfy tape_lattice_honesty_lint.py meta-mode PASS contract."
  changes = [
    "Added tape-class = 'meta/lessons' + rewritten-from to @I id001 (meta-mode opt-in)",
    "Added @N scope_disclaimer (in-silico scope, wet-lab boundary, AGENTS.tape g8_in_silico_only)",
    "Added @F f_lattice_fit (lattice-fit-in-lessons-entries, anti-pattern guard)",
    "Added @N n6_honest_stance (observation-not-derivation, methodology-cite for meta-mode grounding)",
    "Added @X x_lattice_policy :: governance (LATTICE_POLICY.md)",
    "Added @X x_agents_tape :: governance (AGENTS.tape g_meta_mode_optin)",
    "Removed emoji prefixes from cluster_type / label / text fields (cosmetic cleanup)",
    "Preserved all genuine engineering lessons verbatim in substance"
  ]
  linter = "tape_lattice_honesty_lint.py --json → PASS is_meta=true has_guard=true has_stance=true grounded=true"
  deriv_warnings = "1 (L174 loop-cheap Pauli count — observed compute boundary, provenance not derivation)"
