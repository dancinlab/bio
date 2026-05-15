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
# RADIATION-BIOLOGY.log.tape — append-only event history (v1.2 split)
# Sibling: RADIATION-BIOLOGY.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite := "RADIATION-BIOLOGY.tape rewritten from lattice-tautology stub to real-science SSOT" :: rewrite [ok d=2026-05-16]
  origin = "RADIATION-BIOLOGY.tape was a lattice-tautology stub (created in the hexa-bio mass-split, commit 153b5a2). Its body asserted '6 DSB-repair pathways — molecular-biology primitive', '6 radiation interaction mechanisms — radiation-physics primitive', '6 Gy LD50 — empirical radiobiology constant' — each a direct LATTICE_POLICY g1/g2 + f1 violation (lattice-fit-as-derivation) AND factually wrong (LD50/60 is ~3.5–4.5 Gy without medical support, NOT 6 Gy; repair-pathway and interaction-mechanism counts depend on taxonomy and are not invariants). Sources were generic textbook references with no structured @X. Every b_* stub entry deleted."
  authored = "Hand-written with real radiation physics, radiobiology, repair biochemistry, clinical radiation oncology and radiation-protection literature. Replaces ZERO biology with: ionizing radiation physics (photons, charged particles, neutrons, heavy ions; LET; RBE), water radiolysis and direct-vs-indirect action, DNA damage spectrum (DSB/SSB/base/clustered), repair pathways (NHEJ/HR/MMEJ/BER/NER/MMR with cell-cycle coupling), linear-quadratic α/β model + BED, Elkind sublethal damage repair, OER, Withers 4 R's (+5th R Radiosensitivity), ARS dose ranges (hematopoietic / GI / neurovascular / LD50/60), stochastic vs deterministic effects, ICRP 103 / BEIR VII / UNSCEAR protection framework, LSS atomic-bomb cohort (Preston era), Chernobyl + Fukushima outcomes (UNSCEAR), Smith-Bindman CT-era imaging dose, clinical EBRT fractionation rationale, SBRT/SRS hypofractionation, brachytherapy, proton/carbon-ion therapy, radiosensitizers (cisplatin/DDR-inhibitors), radioprotectors (amifostine). Qualitative source-grounded modality coverage. 6 real-limit anchors: low-dose epistemic floor (EPISTEMIC HARD WALL), deterministic thresholds (BIOLOGICAL HARD WALL above threshold), pregnancy/fetal radiation (BIOLOGICAL HARD WALL developmental), cumulative-dose / occupational limits (REGULATORY LNT-based precautionary), medical-imaging dose growth (OPERATIONAL/POPULATION), DNA-repair capacity ceiling (BIOLOGICAL per-cell). 3 falsifiable predictions with falsifiers + sourced (fractionation late-tissue sparing; HR-deficient tumor radiosensitization; low-dose epidemiology power floor). 11 real @X :: literature citations (textbook author/era and institutional report-era citations clearly flagged)."
  lnt-hormesis-stance = "**Honest framing of the active LNT-vs-threshold-vs-hormesis debate** is a first-class element of this tape (NEW section [@dx_lnt_debate] + supporting real-limit [@lim_low_dose_epistemic] + @N scope_disclaimer cross-reference + TP-3 falsifiable prediction). The honest position adopted: LNT is the operational REGULATORY default of ICRP/BEIR/NCRP/IAEA at authoring time, AND the low-dose dose-response below ~100 mSv is the subject of genuine ongoing scientific debate with non-fringe authors on the threshold and hormesis side — both statements are simultaneously true. The tape explicitly DOES NOT take a strong side; it reports the debate, names the epistemic-power floor that makes it real, and notes that regulatory limits riding on LNT are precautionary (vulnerable to revision if low-dose biology is materially clarified). This mirrors LATTICE_POLICY g3 honesty-obligation-external and hexa-bio AGENTS.tape g8 in-silico-only-claim-scope."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: radiation biology exposes NO natural n=6 invariant. Specific corrections recorded in @N body: (a) the deleted '6 DSB-repair pathways' was a taxonomy choice (NHEJ/HR/MMEJ/BER/NER/MMR — and arguably TLS / direct reversal / FA pathway — not an invariant); (b) the deleted '6 radiation interaction mechanisms' is also a teaching choice that varies by particle/energy class; (c) the deleted '6 Gy LD50' was factually wrong (LD50/60 ~3.5–4.5 Gy without modern support, scenario-dependent range — not exactly 6 Gy); (d) the 4 R's of radiobiology are FOUR (or five with Radiosensitivity), explicitly NOT six. Coincidence is observation-only, never derivation. This honesty IS the corrective for the audited lattice-tautology stub."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first — 6 real-limit anchors), g2 (lattice-is-tool — declined as derivation), g3 (honesty-obligation-external — institutional bodies cited by their own institutional names + report era, no lattice-fit on ICRP/BEIR/UNSCEAR/RERF/NAS), g8 (in-silico-only-claim-scope — @N scope_disclaimer added and elaborated for radiation-protection / dosimetric / regulatory scope), f1 (no lattice-fit), f2 (no in-silico→clinical/dosimetric/regulatory claim — figures paraphrased from published literature and authoritative bodies for modeling context only; real planning / dose limits / emergency response require licensed medical physicists, radiation oncologists, and qualified radiation-protection authorities). Provenance recorded in @I id001 rewritten-from key."
  honesty-caveats = "No fabricated numbers/citations — exact dose thresholds, RBE values, α/β ratios, w_T/w_R values, dose limits, LD50, and epidemiology numbers kept as LITERATURE RANGES or as the institutional consensus picture, NOT asserted as exact derived constants. Textbook authors (Hall & Giaccia, Attix, Friedberg et al) cited by author and era — exact edition/page not asserted (the textbook era is the confident citation level). Withers 4 R's, Elkind sublethal damage repair, and amifostine clinical era cited by primary author / era — exact volume/page paraphrased. Institutional reports (ICRP 103, BEIR VII 2006, UNSCEAR Chernobyl / Fukushima) cited by institution + report era. Two confident author/year specific citations: Smith-Bindman et al 2009 Arch Intern Med 169:2078–2086 (CT radiation dose), and Preston et al LSS era (Radiation Research 2003 solid-cancer / 2007 mortality era — primary-author/era cited, exact volume paraphrased). Mirrors the CANCER-THERAPY discipline (collaborative-group / institutional citations flagged primary-author/era only)."
  lint = "python3 selftest/tape_lattice_honesty_lint.py RADIATION-BIOLOGY.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; deriv_warnings = original guard/stance provenance lines only, no live derivation lines remain; all b_* stub entries deleted)."
