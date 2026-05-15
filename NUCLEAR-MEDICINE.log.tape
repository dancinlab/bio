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
# NUCLEAR-MEDICINE.log.tape — append-only event history (v1.2 split)
# Sibling: NUCLEAR-MEDICINE.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite := "NUCLEAR-MEDICINE.tape rewritten from lattice-tautology stub to real-science SSOT" :: rewrite [ok d=2026-05-16]
  origin = "NUCLEAR-MEDICINE.tape was a fabricated lattice-tautology stub (created in the hexa-bio mass-split, commit 153b5a2). It 'derived' nuclear-medicine facts from n=6 lattice numbers (σ=12 / τ=4 / φ=2 / J₂=24) — e.g. 'σ(6)=12 · phi(6)=2 · tau(6)=4 — identity uniquely at n=6' as a derivation source, '⁹⁹ᵐTc t½ = 6.01 h balances imaging statistics' presented as if the half-life followed from n=6, and a stub roadmap asserting `tc99m_half_life_hours == 6` as a lattice-tautology assertion — direct LATTICE_POLICY g1/g2 + f1 violations. Every b_*/row_* stub entry deleted."
  authored = "Hand-written with real nuclear-medicine science and authoritative references. Replaces ZERO biology with: decay-mode physics (γ/β⁺/β⁻/α/Auger); SPECT (Anger gamma camera, primary-author/era) and PET (Phelps & Hoffman 1975-era instrumentation) with SPECT/CT, PET/CT, PET/MR hybridisation; ⁹⁹ᵐTc workhorse role and ⁹⁹Mo/⁹⁹ᵐTc generator chain; PET tracers (¹⁸F-FDG, ¹¹C/¹³N/¹⁵O cyclotron, ⁶⁸Ga generator); diagnostic radionuclides ¹²³I/¹³¹I/⁶⁷Ga/¹¹¹In/²⁰¹Tl; radiopharmaceutical design (targeting moiety + DOTA/NOTA chelator + radionuclide); theranostics paradigm (⁶⁸Ga/¹⁷⁷Lu-DOTATATE for NETs — NETTER-1; ⁶⁸Ga-PSMA/¹⁷⁷Lu-PSMA-617 for prostate — VISION; ²²⁵Ac-PSMA emerging); therapy isotopes ¹³¹I thyroid, ²²³Ra-dichloride bone metastases (ALSYMPCA), ⁹⁰Y SIRT hepatic, ¹⁵³Sm bone pain; dosimetry (MIRD schema Loevinger-era; ICRP framework Publications 60/103 + 53/80/106/128 series); isotope supply (⁹⁹Mo 2009-2010 crisis IAEA + OECD-NEA institutional reporting; ²²⁵Ac scarcity; cyclotron- vs reactor-produced); radiation safety (ALARA, pregnancy contraindications, 10 CFR Part 35 / NRC + Agreement-State licensing). Six real-limit anchors: isotope supply on demand growth (HARD), ALARA / image-quality tension (PHYSICAL/STATISTICAL), pregnancy contraindication (BIOLOGICAL/ETHICAL), specific-activity ceiling (RADIOCHEMICAL), off-target organ uptake (HARD — biology-set), regulatory & radiation-license burden (REGULATORY/OPERATIONAL), and a seventh PET spatial-resolution physical floor (PHYSICAL — positron range + non-collinearity). Three falsifiable predictions with falsifiers + sourced: theranostic selection gradient, ⁹⁹Mo supply fragility recurrence, α-therapy supply-bounded near-term scale. Twelve real @X :: literature citations spanning landmark RCTs, instrumentation founders (author/era), framework families (MIRD, ICRP), institutional reporting (IAEA, OECD-NEA), evaluated-data libraries (NNDC), and the canonical textbook (Cherry, Sorenson & Phelps)."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: nuclear medicine exposes NO natural n=6 invariant — ⁹⁹ᵐTc t½ ≈ 6 h is measured NNDC decay data (numerically coincides with 6 by accident; clinical workflow empirically fits, not derived); PET geometries are engineered to optical/scintillator/cost constraints; FDA device classes = THREE; EU MDR classes = FOUR; ICRP recommendations span Publications 26 → 60 → 103; decay modes used in nuclear medicine count FIVE (γ/β⁺/β⁻/α/Auger), not 6. Coincidence is observation-only, never derivation. This honesty IS the corrective for the audited lattice-tautology stub."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first — 7 real-limit anchors), g2 (lattice-is-tool — declined as derivation), g3 (honesty-obligation-external — NNDC/ICRP/IAEA/OECD-NEA/FDA/EMA cited per their OWN invariants, no lattice-fit applied), g8 (in-silico-only-claim-scope — @N scope_disclaimer added covering clinical/dosimetric/radiation-safety boundaries), f1 (no lattice-fit), f2 (no in-silico→clinical/dosimetric claim — half-lives, regimens and dose frameworks paraphrased for modeling context; real clinical use requires qualified nuclear-medicine physician + medical physicist + RSO under jurisdictional licence). Provenance recorded in @I id001 rewritten-from key."
  honesty-caveats = "No fabricated numbers/citations — half-life and decay-energy specifics cited at approximate / evaluated-data-family level (NNDC/ICRP authoritative), exact half-lives explicitly deferred to NNDC/ENSDF rather than re-derived. Landmark RCTs cited at full author/year/journal/volume/page (Strosberg NEJM 2017;376:125-135 NETTER-1; Sartor NEJM 2021;385:1091-1103 VISION; Parker NEJM 2013;369:213-223 ALSYMPCA). Five primary-author/era citations explicitly flagged: x_anger_1958 (Hal Anger late-1950s gamma camera — exact founding-paper Rev Sci Instrum attribution stated at era level), x_phelps_hoffman_1975_era (1975-era foundational PET instrumentation — author/era only), x_mird_loevinger_era (MIRD pamphlet series Loevinger-era — pamphlet numbers span decades, not asserted), x_icrp_framework (Publications 60/103 + 53/80/106/128 series — publication-family level, revisions across editions flagged), x_iaea_99mo_2011 / x_oecd_nea_99mo_2019 (institutional-reporting on 2009-2010 ⁹⁹Mo crisis — institutional/framework level, not single-author paper). This mirrors the CANCER-THERAPY.tape author/era discipline (x_ebctcg_2005 / x_vogelstein_2013) and the gold florea ANDROGENETIC-ALOPECIA.tape x_goren_2014 discipline."
  lint = "python3 selftest/tape_lattice_honesty_lint.py NUCLEAR-MEDICINE.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true, deriv_warnings=[] — zero lattice-derivation lines remain; all b_*/stub entries deleted)."
