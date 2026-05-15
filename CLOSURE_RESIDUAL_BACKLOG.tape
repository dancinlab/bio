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
# CLOSURE_RESIDUAL_BACKLOG.tape — architecture-current (editable per v1.2)
# Event history → CLOSURE_RESIDUAL_BACKLOG.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "closure-residual-backlog" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · category (b)/(c) residual backlog meta-index"
  brief = "meta backlog index for category (b)/(c) items · n=6 mentions = backlog provenance NOT derivation"
  parent = "dancinlab/hexa-bio"
  sibling-md = "CLOSURE_RESIDUAL_BACKLOG.md"
  sibling-log = "CLOSURE_RESIDUAL_BACKLOG.log.tape"
  tape-class = "meta/backlog"
  scope = "in-silico backlog index meta-tape · NOT science derivation"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); meta-mode honesty rewrite 2026-05-16 — see CLOSURE_RESIDUAL_BACKLOG.log.tape audit"

# ── §0 Scope disclaimer (meta tape — no science derivation) ──────────

@N scope_disclaimer := "backlog index scope" :: note [required]
  text = "This tape is a meta-index of category (b) and (c) backlog items whose closure requires actions outside the hexa-bio software repo (formal-semantics work in hexa-meta, wet-lab CRO execution, IP counsel, regulatory channels, quantum-vendor procurement). The long-form enumeration with concrete next-actions and handoff destinations lives in CLOSURE_RESIDUAL_BACKLOG.md (long-form sibling). This .tape is the machine-readable governance + identity layer for that sibling — it records category structure, scope, and honesty contract, NOT a derivation of any science claim from the n=6 lattice."

# ── §1 Honesty guard + stance (required by PASS contract) ────────────

@F f_lattice_fit := "lattice-fit-in-backlog" :: governance [required deny:write]
  pattern = "Deriving any backlog item count, ratio, or closure-grade FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. claiming '#(c) items = σ/2 because lattice' or that the 5-axis structure is lattice-derived."
  why = "Lattice tokens that appear in the long-form sibling (e.g. σ(6)=12 pentameric vertices in the virocapsid Zlotnick ODE, or n=6 substrates in the 5-axis enumeration) are DESCRIPTIVE PROVENANCE of the artifact names and engineering decisions, NOT a derivation of the backlog count or handoff urgency from the lattice. The 5-axis structure reflects the project's molecular biology scope (quantum, weave, nanobot, ribozyme, virocapsid); that 5 ≠ 6 is an observation, not a lattice-fit correction."
  remedy = "Any reference to n=6 lattice tokens in a backlog entry must be labeled as artifact-name provenance or coincidental observation. Counts and closure-grades must cite the actual engineering/biology status (CLOSED/DEST:none/DEST:qmirror), never the lattice as a derivation."
  authority = "[@x_lattice_policy] g1/g2 · hexa-bio AGENTS.tape f1 · [@x_agents_tape] g_meta_mode_optin"

@N n6_honest_stance := "backlog lattice mentions are descriptive provenance, not derivation" :: note [required]
  text = "Stated plainly: this is the hexa-bio CLOSURE_RESIDUAL_BACKLOG meta-index. The n=6 tokens (σ, τ, φ, J₂) that may appear in the long-form sibling CLOSURE_RESIDUAL_BACKLOG.md are artifact names and provenance markers — e.g. 'N=12 σ(6)-pentamer model' is the NAME of the Zlotnick ODE substrate, not a claim derived from the lattice. The 5-axis scope (quantum · weave · nanobot · ribozyme · virocapsid) is the project's actual molecular biology domain; the number 5 is descriptive, not lattice-fitted. Per LATTICE_POLICY g1/g2 and the lattice-as-tool principle, the lattice is declined here as a derivation tool. Observation-not-derivation. This preamble satisfies the meta-mode pilot honesty contract (AGENTS.tape g_meta_mode_optin, applies-to: CLOSURE_RESIDUAL_BACKLOG)."

# ── §2 Backlog structure (skeleton — long-form in sibling .md) ───────

@N backlog_structure := "category (a)/(b)/(c) split" :: note [active]
  text = "Category legend (from CLOSURE_RESIDUAL_BACKLOG.md §0): (a) in-repo software — closeable by code/test work; counts against v1.x closure-grade — STATUS: 100% REACHED 2026-05-12 cycle-30 (A1.1 + A1.2 + A1.3 + A2.1 all CLOSED). (b) v2 formal semantics / cycle-30++ stretch — Lean/Mathlib full-algebra work; deferred to v2.0.0 by design — STATUS: B1.1/B1.2/B1.3 v4 + B1.4 + B4.1 ALL CLOSED; MechVerif (B2) + Theorem B (B3) CLEAN at canon retirement. (c) out-of-software-scope — wet-lab CRO, IP counsel, regulatory channels, quantum-vendor — 2 of 11 items have a LIVE DEST (C4.1 + C4.2 → qmirror); 7 of 11 remain DEST:none yet."
  "see CLOSURE_RESIDUAL_BACKLOG.md §A / §B / §C for exhaustive per-item enumeration with commit hashes, handoff destinations, and honest raw_91 caveats"

# ── §3 Grounding (meta-mode: governance citations) ───────────────────

@X x_lattice_policy := "echoes/LATTICE_POLICY.md" :: governance [active]
  url = "https://github.com/dancinlab/echoes/blob/main/LATTICE_POLICY.md"
  scope = "real-limits-first · lattice-is-tool · observation-not-derivation — the governance authority this preamble enforces"

@X x_agents_tape := "hexa-bio AGENTS.tape" :: governance [active]
  path = "./AGENTS.tape"
  scope = "g_meta_mode_optin (meta tape opt-in) · g1 real-limits-first · g2 lattice-is-tool · f1 lattice-fit-on-external-entity · g8 in-silico-only-claim-scope · g9/g10 external-contact-deferral"

@X x_backlog_md := "CLOSURE_RESIDUAL_BACKLOG.md (long-form sibling)" :: doc [active]
  path = "./CLOSURE_RESIDUAL_BACKLOG.md"
  scope = "exhaustive per-item enumeration of (a)/(b)/(c) backlog items with commit hashes, handoff destinations, raw_91 caveats, and concrete next-actions (wet-lab CRO, IP, regulatory, qmirror)"
