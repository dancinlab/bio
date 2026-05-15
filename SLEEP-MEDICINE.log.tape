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
# SLEEP-MEDICINE.log.tape — append-only event history (v1.2 split)
# Sibling: SLEEP-MEDICINE.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite := "SLEEP-MEDICINE.tape rewritten from lattice-tautology stub to real-science SSOT" :: rewrite [ok d=2026-05-16]
  origin = "SLEEP-MEDICINE.tape was a fabricated lattice-tautology stub (created in the hexa-bio mass-split, commit 153b5a2). It 'derived' sleep-medicine facts from n=6 lattice tokens — 'AASM 6-stage staging', '~6 sleep cycles per full night (~90 min per cycle)', 'PSG 12-channel EEG = σ(6) = 12' — none of which match real sleep medicine (AASM actually scores 5 stages: Wake, N1, N2, N3, REM; cycles per night are a range on the order of 4–6 depending on duration and architecture, not exactly six; PSG channel counts are clinical-montage choices, not σ(6)). Every b_* stub entry deleted."
  authored = "Hand-written with real sleep science + landmark clinical citations. Replaces ZERO biology with: sleep architecture (Aserinsky & Kleitman 1953 REM discovery; AASM scoring), polysomnography montage and limits, molecular circadian clock (Konopka & Benzer 1971 per gene; 2017 Nobel for Hall/Rosbash/Young; SCN pacemaker; melatonin/Lerner-era; CLOCK/BMAL1 feedback loops), Borbély 1982 two-process model (S × C), candidate sleep functions (Stickgold/Walker memory consolidation; Tononi & Cirelli synaptic homeostasis; Xie 2013 glymphatic — landmark but actively debated), short-sleeper variants (DEC2/He 2009; ADRB1/Shi 2019 era — Fu/Ptáček group), and the real clinical disorder landscape — OSA (Sullivan 1981 CPAP origin), chronic insomnia disorder (DSM-5 / ICSD-3; CBT-I first-line; Z-drugs / DORA / ramelteon classes), narcolepsy (Lin/Mignot Cell 1999 + Chemelli Cell 1999 dual hypocretin-loss landmarks), REM behaviour disorder as α-synucleinopathy prodrome, NREM parasomnias, RLS/PLMS, circadian rhythm sleep-wake disorders (jet lag · shift work · DSWPD/ASWPD). 6 real-limit anchors: individual sleep-need variation (HARD), OSA CV residual / CPAP adherence ceiling (SOFT), insomnia chronification against single-modality therapy (HARD), jet-lag adaptation kinetics ~1 d per time-zone (SOFT), shift-work cumulative circadian misalignment (HARD), diagnostic burden of PSG vs home testing (PRACTICAL). 3 falsifiable predictions with falsifiers + sourced. 15 real @X :: literature citations (confident: Aserinsky & Kleitman 1953 Science 118:273-274 · Konopka & Benzer 1971 PNAS 68:2112-2116 · Borbély 1982 Hum Neurobiol 1:195-204 · Sullivan 1981 Lancet 1:862-865 · Xie 2013 Science 342:373-377; primary-author/era for Lin/Mignot 1999 Cell 98 · Chemelli 1999 Cell 98 · He 2009 Science 325:866-870 · Shi 2019 Neuron-era · Tononi & Cirelli 2014 Neuron · Lerner 1958-era melatonin isolation · Nobel 2017 chronobiology · AASM scoring manual · ICSD-3 · AASM CBT-I clinical practice guideline · AASM/SRS adult sleep-duration consensus)."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: sleep medicine exposes NO natural n=6 invariant (AASM scores 5 stages, not 6; cycles per night are a 4–6 range; PSG channel counts are clinical-montage choices; adult sleep duration is a 7–9 h population range). Coincidence is observation-only, never derivation. This honesty IS the corrective for the audited lattice-tautology stub."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first — 6 real-limit anchors), g2 (lattice-is-tool — declined as derivation), g8 (in-silico-only-claim-scope — @N scope_disclaimer added), f1 (no lattice-fit), f2 (no in-silico→clinical/efficacy claim — diagnostic thresholds, drug names and device parameters paraphrased from published sleep-medicine literature for modeling context only, real evaluation requires a licensed clinician and PSG where indicated), f3 (no shadowing — sister-substrate facts not re-derived inside hexa-bio). Provenance recorded in @I id001 rewritten-from key."
  honesty-caveats = "No fabricated numbers/citations. Confident landmark citations are stated with explicit volume/page (Aserinsky & Kleitman Science 118:273-274 · Konopka & Benzer PNAS 68:2112-2116 · Borbély Hum Neurobiol 1:195-204 · Sullivan Lancet 1:862-865 · Xie Science 342:373-377). Author/era-flagged citations explicitly paraphrase volume/page (Lin/Mignot Cell 1999 · Chemelli Cell 1999 · He 2009 DEC2 short sleeper · Shi 2019 ADRB1 short sleeper · Tononi & Cirelli 2014 SHY · Lerner 1958-era melatonin isolation · Nobel 2017 chronobiology institutional · AASM scoring manual / ICSD-3 / AASM CBT-I guideline / AASM-SRS duration consensus — institutional, periodically revised). Sleep duration recommendations (7–9 h) are stated as institutional population ranges, NOT a clinically diagnostic threshold for any individual. Glymphatic clearance (Xie 2013) is flagged as landmark + actively debated rather than as settled mechanism. CPAP cardiovascular effect is flagged as more modest in less-sleepy populations than early observational data suggested. Mirrors CANCER-THERAPY.log.tape audit discipline (qualitative magnitudes + landmark trial + primary-author/era for less-confident volumes)."
  lint = "python3 selftest/tape_lattice_honesty_lint.py SLEEP-MEDICINE.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true, deriv_warnings=[] — zero lattice-derivation lines remain; all b_* stub entries deleted)."
