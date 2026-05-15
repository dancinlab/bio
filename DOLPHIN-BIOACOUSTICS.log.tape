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
# DOLPHIN-BIOACOUSTICS.log.tape — append-only event history (v1.2 split)
# Sibling: DOLPHIN-BIOACOUSTICS.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_real_science := "DOLPHIN-BIOACOUSTICS.tape rewritten — lattice-tautology stub → real cetacean bioacoustics SSOT" :: rewrite [ok d=2026-05-16]
  origin = "DOLPHIN-BIOACOUSTICS.tape was a lattice-tautology stub (hexa-bio mass-split 153b5a2): ~380 lines of `@D row_*` entries mapping Korean-labeled columns (감지 거리, 판별 해상도, 대역폭, etc.) to σ/τ/φ/J₂/n=6 values with no bioacoustic content and no real citations. Every 'detection range', 'bandwidth', 'signal accuracy' entry was derived from lattice arithmetic — a governance violation of @F f1 (AGENTS.tape) and @D g1/g2 (real-limits-first / lattice-is-tool)."
  rewrite-scope = "Full replacement from @I id001 onward. Preserved: top grammar primer, @V spec entry, banner comment, sibling-log reference. Deleted: all lattice-tautology @D row_* / @D b_* content. Added: real cetacean bioacoustics across 13 sections (~340 lines)."
  content-added = "§0 Identity (companion-to-DOLPHIN.tape; rewritten-from provenance); §1 Sound production anatomy (phonic lips / monkey lips / dorsal bursae; melon acoustic lens; mandibular fat pad reception; asymmetric skull — Au textbook); §2 Click characteristics (40–150 kHz Tursiops; ~50–100 μs duration; ~10° beamwidth; ~220 dB source level — Au); §3 Click rate / ICI (resting ICI; buzz-phase ICI 0.4–2 ms; two-way travel-time floor — Au); §4 Target detection (100–200 m range; mm-scale size discrimination; material discrimination — Au); §5 Mysticete song (Payne & McVay 1971 Science 173:585-597 humpback song landmark; unit/phrase/theme/song hierarchy; cultural transmission; Noad et al 2000 Nature 408:537 revolutionary song change; bowhead complexity era); §5b Low-frequency propagation (SOFAR channel; fin whale 20 Hz; blue whale); §6 Signature whistles (Caldwell & Caldwell 1965 Nature 207:434; King & Janik 2013 PNAS 110:13216; Janik 2000 Science 289:1355; trimodal repertoire); §7 Orca dialects (Ford 1991 Can J Zool 69:1454; pod stability; ecotype repertoires; matrilineal transmission); §8 PAM (PAMGuard institutional; long-term observatories; detection-vs-presence limit); §9 Anthropogenic noise (shipping masking; seismic airguns; MFA sonar strandings — Tyack era + DeRuiter et al 2013 Biol Lett 9:20130223); §10 Real-limits (5 @D lim_* entries: deep-diving undersampling; PAM detection-vs-abundance inference; noise habituation-vs-displacement causality; odontocete diversity generalisation limits; DL detector class imbalance); §11 Lattice stance (@F f_lattice_fit + @N n6_honest_stance); §12 Predictions (3 falsifiable @D tp_*); §13 Cross-links + citations (11 @X :: literature entries)."
  n6-stance = "Declined as a derivation tool. @N n6_honest_stance + @F f_lattice_fit state plainly: cetacean bioacoustics has no natural n=6 invariant. Click frequency range (40–150 kHz), ICI (0.4–2 ms buzz), detection range (100–200 m), beamwidth (~10°), humpback song hierarchy (4 levels), trimodal vocal repertoire — all empirically measured facts, not lattice-derived. This honesty IS the corrective for the audited lattice-tautology violation."
  citations = "Confident (full bibliographic): Payne & McVay 1971 Science 173:585-597 · Noad et al 2000 Nature 408:537 · Caldwell & Caldwell 1965 Nature 207:434 · King & Janik 2013 PNAS 110:13216-13221 · Janik 2000 Science 289:1355-1357 · Ford 1991 Can J Zool 69:1454-1483 · DeRuiter et al 2013 Biol Lett 9:20130223 · Tyack 2008 J Mammal 89:549 (volume confirmed). Author/era-flagged (intentionally uncertain): Au 'The Sonar of Dolphins' textbook (~1993, Springer) · Caldwell & Caldwell 1965 era (volume confirmed) · Janik & Slater 1997 Adv Study Behav chapter · Tyack noise series (~2000–2015 era) · bowhead song Stafford et al era. Institutional: PAMGuard (Gillespie et al, Univ St Andrews)."
  lint = "python3 selftest/tape_lattice_honesty_lint.py /Users/ghost/core/hexa-bio/DOLPHIN-BIOACOUSTICS.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; deriv_warnings = tolerated provenance lines in honest-stance body quoting forbidden phrasing, not live derivation claims)."
  governance = "Complies with hexa-bio AGENTS.tape @D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). Knowledge-scope disclaimer (@N scope_disclaimer) added — in-silico SSOT, not veterinary or conservation-management prescription."
