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

@V := "tape" :: spec [active]
  version = "1.2"

# §Log
#
# Append-only history of events for the `therapeutic-nanobot` domain.
# Sibling architecture: `THERAPEUTIC-NANOBOT.tape`. See ~/core/tape/spec/tape.md
# §"Authoring guide — `<DOMAIN>.log.tape`".

@A rewrite_from_stub := "THERAPEUTIC-NANOBOT.tape rewritten from lattice-tautology stub to evidence-grounded nanomedicine SSOT" :: rewrite [ok d=2026-05-16]
  origin = "THERAPEUTIC-NANOBOT.tape was a hexa-bio mass-split (153b5a2) lattice-tautology stub: 2211 lines of `@D row_x_N` entries deriving therapeutic claims FROM n=6 lattice arithmetic (e.g. '약물 효율 σ²/φ=72배 증가', '회복 24시간=J₂', '비용 1/(σ-φ)=10분의 1', 'BT-404~413 10 연속 돌파', alien_index/closure_grade self-claims). Every numeric claim was lattice-fit, not source-grounded; the entire body violated hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3."
  scope-rewritten = "Replaced with an evidence-summary knowledge SSOT for therapeutic nanomedicine. The replacement is hand-authored against landmark literature (Rothemund 2006 · Douglas 2009 · Andersen 2009 · Douglas/Bachelet/Church 2012 · Wilhelm 2016 · Pardi 2018 · Barenholz 2012 · Verma 2012 · Matsumura/Maeda 1986 · Adams 2018; author/era for Feringa Nobel 2016 / Seeman DNA-nanotechnology / motor proteins). Replaces zero biology with: §1 definitional scope + size regimes · §2 deployed clinical nanomedicine (liposome / LNP / ADC / polymeric / inorganic) · §3 active vs passive targeting + EPR honest critique · §4 research-stage 'nanobots' (DNA origami · molecular motors · swimmers · motor proteins) · §5 seven real-limits anchors · §6 lattice guard + honest n=6 stance · §7 three falsifiable predictions · §8 cross-links · §9 external citations."
  hype-handling = "Tape is structured around the EXPLICIT deployed-vs-inspirational split (§2 vs §4) — the single most common factual error in the popular 'nanobot' discourse. @N scope_disclaimer states this plainly. Clinically deployed nanomedicine in 2026 = passive formulation chemistry (LNP / liposome / ADC / polymeric NP / iron-oxide), NOT autonomous robots. DNA-origami 'nanorobots' (Douglas/Bachelet/Church 2012) and Feringa-style molecular motors (2016 Nobel) are real science but explicitly NOT clinical. The conflation is the principal hype mechanism this tape pushes back on."
  real-limits = "Seven @D :: real-limit anchors: lim_epr_floor (Wilhelm 2016 ~0.7% median tumor delivery — HARD WALL on EPR-only strategies); lim_mps_clearance (opsonization / Kupffer / spleen first-pass — HARD WALL); lim_brownian (kT thermal floor at 310 K — HARD WALL thermodynamic); lim_fueling (in-vivo ATP-analog energy problem — HARD WALL); lim_anti_peg (anti-PEG ABC immunogenicity — SOFT WALL immunological); lim_regulatory_manufacturing (CMC / nanomedicine combination-product complexity — engineering / regulatory); lim_autonomy_gap (no integrated autonomous in-vivo nanobot in humans — HARD WALL current science)."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit guards explicitly against deriving delivery fraction / efficacy / dosing from σ/τ/φ/J₂. @N n6_honest_stance states plainly: nanomedicine has no natural n=6 invariant — deployed class count is accidents-of-translation, EPR ~0.7% is empirical distribution (Wilhelm 2016), DNA-origami geometry is arbitrary, molecular-machine motor counts are chemistry choices. Coincidence is OBSERVATION, never derivation. This honesty IS the corrective for the audited lattice-tautology stub the file replaced."
  honesty-downgrades = "From the stub's scope ambition that had to be honestly downgraded: (1) '나노봇 표적 종양 약물 전달 부작용 90% 감소' — downgraded to 'Doxil reduces cardiotoxicity vs free anthracycline; OS-superiority over free anthracycline is not a clean class claim' (Barenholz 2012). (2) 'EPR+자기유도 종양 도달 50%+' — directly contradicted by Wilhelm 2016 (~0.7% median) and reframed as the EPR-floor real-limit. (3) '나노봇 CRISPR 전달 면역 부작용 0, 정확도 99%+' — no such product exists; LNP-RNA delivery is the closest deployed analogue (Pardi 2018, Adams 2018) and is liver-dominant, immune-aware, not '0 side-effect 99%+ accurate'. (4) '나노봇 자동 혈당 감지 + 인슐린 방출 주사 0회' — no closed-loop nanobot product exists; closed-loop insulin is macro-scale device territory, not nanobot. (5) '나노봇 군집 무절개 회복 24시간' — pure aspiration; no autonomous in-vivo swarm has clinical approval (lim_autonomy_gap). (6) 'alien_index 7/10 · closure_grade 7 · BT-404~413 10 연속 돌파' — internal self-grading lattice-tautology with no external validity; removed entirely."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first) · g2 (lattice-is-tool) · g3 (honesty-obligation-external) · g8 (in-silico-only-claim-scope) · f1 (lattice-fit forbidden) · f2 (wet-lab/clinical claim from in-silico forbidden) · f3 (shadow-implementation forbidden, especially relevant in this hype-prone domain). Clinical-scope disclaimer (@N scope_disclaimer) added — knowledge SSOT, not medical advice, not a device claim."
  citations-promoted = "Confident full-citation @X :: literature: Rothemund 2006 Nature 440:297–302; Douglas 2009 Nature 459:414–418; Andersen 2009 Nature 459:73–76; Douglas/Bachelet/Church 2012 Science 335:831–834; Wilhelm 2016 Nat Rev Mater 1:16014; Pardi 2018 Nat Rev Drug Discov 17:261–279; Barenholz 2012 J Control Release 160:117–134; Verma 2012 NEJM 367:1783–1791. Author/era-only (volume not asserted): Matsumura & Maeda 1986 (EPR original); Adams 2018 (patisiran/Onpattro); Feringa 1999 Nature unidirectional motor + Sauvage/Stoddart/Feringa 2016 Nobel; Seeman ~1982 DNA junctions."
  lint = "python3 hexa-bio/selftest/tape_lattice_honesty_lint.py THERAPEUTIC-NANOBOT.tape --json → {verdict: PASS, has_guard: true, has_stance: true, grounded: true, deriv_warnings: []} · __TAPE_LATTICE_HONESTY__ PASS."
