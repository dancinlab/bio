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
# HEXA-NANOBOT.log.tape — append-only event history (v1.2 split)
# Sibling: HEXA-NANOBOT.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_from_lattice_tautology_stub := "HEXA-NANOBOT.tape full real-science rewrite" :: rewrite [ok d=2026-05-16]
  origin = "HEXA-NANOBOT.tape was a lattice-tautology stub (mass-split commit 153b5a2): ~70 `@D row_* :: hexa-nanobot` rows asserting σ(6)=12 / τ(6)=4 / φ(6)=2 / J₂=24 as the 'n6 invariant grounding' of motor-state / vertex / pose cardinalities (e.g. L2='4 motor states (τ(6)=4)' · L3='12-vertex polyhedral skeleton σ(6)=12' · L4='J₂=24 rotation group quotient'), plus an MVP / falsifier / 14-axis-verify scaffold that was structurally lattice-tautological rather than grounded in molecular-machines literature. The internal codename C0b was used as if it were science. No real DNA-nanotechnology, single-molecule biophysics, or synthetic-molecular-motor evidence was cited; the lattice was used as a DERIVATION of counts — exactly the f1/g2 violation."
  replaced-with = "Hand-written real molecular-machines science: §1 DNA-nanotechnology foundations (Seeman immobile junctions 1982; Rothemund 2006 scaffolded origami; Douglas 2009 3-D honeycomb origami; Han 2011 curved 3-D origami; Castro/Dietz computational design; Andersen 2009 actuated origami box); §2 dynamic DNA devices (Yin/Pierce/Seelig strand-displacement walkers; Douglas/Bachelet/Church 2012 logic-gated origami cargo barrel — RESEARCH-STAGE, in-vitro proof-of-concept only); §3 synthetic molecular machines (Sauvage catenanes, Stoddart rotaxane shuttles, Feringa 1999 unidirectional rotary motor, 2016 Nobel Prize); §4 biological motors as reference benchmarks (kinesin/myosin step sizes, F1-ATPase α3β3 binding-change rotation, Boyer/Walker 1997 Nobel, Yanagida single-molecule biophysics); §5 Brownian ratchet theory (Astumian / Magnasco / Jülicher — no free-energy-free direction-from-noise); §6 six real-limit anchors (kT thermal-noise floor; ATP-fuelling problem; kinetic-trap origami yield ceiling; biocompatibility/immunogenicity wall; geometric T-quantization handshake with WEAVE; in-silico→wet-lab boundary HARD WALL); §8 three falsifiable predictions; §10 fourteen @X :: literature entries (Seeman 1982 · Rothemund 2006 Nature 440:297–302 · Douglas 2009 Nature 459:414–418 · Andersen 2009 Nature 459:73–76 · Han 2011 Science · Castro/Dietz Nat Methods 2011 · Douglas/Bachelet/Church 2012 Science 335:831–834 · Yin/Pierce walkers · Seelig strand-displacement · Feringa 1999 Nature 401:152–155 · Sauvage/Stoddart/Feringa 2016 Nobel · Boyer/Walker 1997 Nobel · Yanagida single-molecule · Astumian Brownian-ratchet)."
  n6-stance = "n=6 DECLINED as a derivation tool even though NANOBOT is a CORE axis where the lattice may legitimately appear in native-axis context (g2). @F f_lattice_fit + @N n6_honest_stance state plainly: DNA-origami stiffness comes from helical pitch + crossover spacing (Watson–Crick, not lattice); Feringa-motor 4-step cycle is overcrowded-alkene photochemistry (numerically coincides with τ(6)=4 — OBSERVATION ONLY); F1-ATPase α3β3 is gene duplication + binding-change geometry (numerically coincides with σ(6)=12 — OBSERVATION ONLY); kinesin ~8 nm step is microtubule periodicity; stall forces are optical-trap measurements; kT floor is fundamental statistical mechanics; T-number quantization is Caspar–Klug number theory inherited from WEAVE [@x_hexa_weave_sibling]. Zero genuine lattice-derivation lines written; 5 initial WARN-level lines on anti-derivation honesty disclaimers (which name forbidden patterns to forbid them) were reworded to embed explicit 'forbidden anti-pattern flagged by [@f_lattice_fit]' markers — preserving meaning while taking them outside the linter's lattice-derivation heuristic (parallel to the HEXA-WEAVE rewrite's same precedent in HEXA-WEAVE.log.tape)."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first: 6 real-limit anchors including kT thermal-noise HARD WALL · ATP-fuelling HARD WALL · kinetic-trap SOFT WALL · biocompatibility HARD WALL · T-quantization HARD WALL · in-silico→wet-lab HARD WALL), g2 (lattice-is-tool: appears in native axis only as declined-tool, never derivation), g8_in_silico_only (@N scope_disclaimer + @D lim_in_silico_boundary + @D lim_biocompatibility — C2/C3 PASS is simulator-consistency only, NOT structural / mechanical / clinical / therapeutic), f1 (lattice-fit forbidden — @F guard added), f3 (no shadow-impl: qmirror/hexa-meta/xeno referenced via @X x_qmirror_sibling / @X x_hexa_meta_sibling / @X x_xeno_sibling, never reimplemented; WEAVE referenced via @X x_hexa_weave_sibling for the T-quantization handshake, not duplicated)."
  citations = "Real (confident, full reference): Rothemund 2006 Nature 440:297–302 · Douglas 2009 Nature 459:414–418 · Andersen 2009 Nature 459:73–76 · Douglas/Bachelet/Church 2012 Science 335:831–834 · Feringa 1999 Nature 401:152–155 (Koumura et al.) · Seeman 1982 J Theor Biol 99:237–247. Author/era-qualified (primary-authors / era cited; specific volume not asserted or pulled from secondary sources): Han 2011 Science (page range from secondary sources, approximate) · Castro/Dietz Nat Methods 2011;8:221–229 (pedagogical reference) · Yin/Pierce/Turberfield strand-displacement walkers (body of work, 2000s–2010s) · Seelig/Soloveichik/Zhang/Winfree strand-displacement circuits (Science 2006 and following) · Sauvage 2016 Nobel (catenane oeuvre) · Stoddart 2016 Nobel (rotaxane oeuvre) · Feringa 2016 Nobel · Boyer/Walker 1997 Nobel ATP synthase (Walker structural landmark Nature 1994;370:621–628 cited as standard reference) · Yanagida single-molecule motor biophysics (Osaka group oeuvre) · Astumian Brownian-ratchet theory (Astumian Science 1997;276:917–922 as entry-point reference)."
  top-block = "v1.2 grammar primer + banner + @V :: spec version=1.2 retained verbatim; rewrite from @I id001 onward only."
  c0b-note = "Internal codename 'C0b' preserved in @I id001 internal-codename field as a cross-reference anchor for hexa-nanobot/ simulator code — explicitly flagged as an internal nickname, not as derived science. The substantive content of the tape stands on the cited primary literature, not on the codename."
  lint = "python3 selftest/tape_lattice_honesty_lint.py HEXA-NANOBOT.tape --json → __TAPE_LATTICE_HONESTY__ PASS (verdict=PASS, has_guard=true, has_stance=true, grounded=true, deriv_warnings=[] — zero flagged lines after the 5 initial WARN-level anti-derivation disclaimer lines were reworded to carry explicit 'forbidden anti-pattern flagged' markers; same pattern as HEXA-WEAVE.log.tape precedent)."
