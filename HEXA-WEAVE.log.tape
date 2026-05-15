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
# HEXA-WEAVE.log.tape — append-only event history (v1.2 split)
# Sibling: HEXA-WEAVE.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_from_lattice_tautology_stub := "HEXA-WEAVE.tape full real-science rewrite" :: rewrite [ok d=2026-05-15]
  origin = "HEXA-WEAVE.tape was a lattice-tautology stub (mass-split commit 153b5a2): ~250 `@D row_* :: hexa-weave` rows asserting σ(6)=12 / τ(6)=4 / φ(6)=2 / J₂=24 as the 'n6 invariant grounding' of axis cardinalities, plus a Landauer/reverse-math/Lean-axiom closure narrative unrelated to the WEAVE axis's actual subject (capsid/cage self-assembly). No real structural-virology science; the lattice was used as a DERIVATION of counts — exactly the f1/g2 violation."
  replaced-with = "Hand-written real self-assembly science: §1 Caspar–Klug quasi-equivalence (genetic economy → identical subunits; T=h²+hk+k²; 12 pentamers + 10(T−1) hexamers; Euler χ=2 twelve-pentamer constraint); §2 real exceptions (pseudo-T picornaviruses, polyoma-/papillomavirus all-pentamer T=7, Twarock tiling theory, scaffolding-protein chaperoned assembly e.g. P22); §3 Zlotnick equilibrium model + nucleation–elongation kinetics + kinetic traps + assembly–disassembly hysteresis + reversible-binding error correction; §4 four real-limit anchors (kinetic-trap, thermodynamic assembly window, geometric T-quantization HARD WALL, in-silico→wet-lab boundary); §6 three falsifiable predictions; §8 six real landmark @X :: literature citations."
  n6-stance = "n=6 DECLINED as a derivation tool even though WEAVE is a CORE axis where the lattice may legitimately appear in native-lattice-spec context (g2). @F f_lattice_fit + @N n6_honest_stance state plainly: subunit count = 60·T (geometry/number theory); exactly 12 pentamers is Euler's polyhedron formula (χ=2), which numerically COINCIDES with σ(6)=12 but is OBSERVATION ONLY, never the cause; T-numbers / ΔG / nucleus size / lag time are Caspar–Klug + Zlotnick thermodynamics, not lattice-derived. Tiling theory's '6D projection' explicitly flagged as a Penrose-style math device unrelated to the hexa n=6 lattice. Zero genuine lattice-derivation lines written."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first: 4 real-limit anchors incl. number-theoretic T-quantization HARD WALL), g2 (lattice-is-tool: appears in native axis only as declined-tool, never derivation), g8_in_silico_only (@N scope_disclaimer + @D lim_in_silico_boundary — C2/C3 PASS is simulator-consistency only, NOT wet-lab/structural/vaccine), f1 (lattice-fit forbidden — @F guard added), f3 (no shadow-impl: qmirror/hexa-meta/xeno referenced via @X x_hexa_bio_agents, never reimplemented)."
  citations = "Real: Crick & Watson 1956 (Nature 177:473–475), Caspar & Klug 1962 (Cold Spring Harbor Symp Quant Biol 27:1–24 — foundational), Zlotnick 1994 (J Mol Biol 241:59–67), Endres & Zlotnick 2002 (Biophys J 83:1217–1230). Author/era-qualified (exact volume/page not asserted): Endres & Zlotnick 2002 page range (from secondary sources, approximate), Twarock 2004 tiling theory, Fane & Prevelige 2003 scaffolding-protein review."
  top-block = "v1.2 grammar primer + banner + @V :: spec version=1.2 retained verbatim; rewrite from @I id001 onward only."
  lint = "python3 selftest/tape_lattice_honesty_lint.py HEXA-WEAVE.tape --json → __TAPE_LATTICE_HONESTY__ PASS (verdict=PASS, has_guard=true, has_stance=true, grounded=true, deriv_warnings=[] — zero flagged lines; one initial WARN on an anti-derivation disclaimer line was reworded to remove co-located lattice/magnitude tokens while preserving meaning)."
