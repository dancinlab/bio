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
# BIOLOGY-MEDICAL.log.tape — append-only event history (v1.2 split)
# Sibling: BIOLOGY-MEDICAL.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_from_lattice_tautology := "BIOLOGY-MEDICAL.tape rewritten from lattice-tautology stub into real biology↔medicine SSOT" :: rewrite [ok d=2026-05-16]
  origin = "BIOLOGY-MEDICAL.tape was a fabricated lattice-tautology stub from the hexa-bio mass-split (commit 153b5a2): ~379 lines, almost entirely `@D row_* / @D b_*` entries of the form `x=\"n=6\" · x=\"<korean gloss>\" · x=\"EXACT\"` with fabricated metrics such as '진단 정확도 99% because σ·sopfr/10', 'τ=4 주기 동기', 'J₂=2σ Output 모니터', 'σ·φ=n·τ 핵심' — zero real science, zero citations, every value asserted as lattice-derived. Deleted in full (all stub lines removed)."
  authored = "Hand-written with real biomedical history and landmark literature. Replaced the stub with: germ theory (Pasteur swan-neck flasks ~1859–1861; Koch's postulates 1884 era); Snow 1854 cholera Broad Street pump map and the birth of modern epidemiology (Snow 1855 2nd ed.); surgical antisepsis (Semmelweis 1847 puerperal fever; Lister 1867 Lancet carbolic acid); anesthesia (Morton 1846 ether); antibiotic era (Fleming 1929 Br J Exp Pathol 10:226–236; Chain & Florey Lancet 1940; 1945 Nobel); vaccinology (Jenner 1798 cowpox); diagnostic imaging (Röntgen 1895 X-ray; Einthoven ~1903 ECG); genomics-to-clinic pharmacogenomics (CYP2C9/VKORC1 warfarin — Johnson/CPIC 2017; HLA-B*5701 abacavir — Mallal 2008 PREDICT-1 RCT); Watson & Crick 1953 Nature 171:737–738 (cross-link); One Health zoonosis (SARS/MERS/COVID-19 spillover — Drosten 2003; WHO 2020). Five @D :: real-limit anchors (AMR WHO global priority pathogens; hospital-acquired infections structural floor; translational gap / Eroom's Law — Scannell 2012; diagnostic error cognitive/systemic floor — Graber 2005; health equity social determinants — Marmot 2010) + 3 falsifiable @D :: prediction entries with explicit falsifiers."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: biology↔medicine bridge has no natural n=6 invariant — Koch's postulates are 4 (guidelines with exceptions), Norwood staging is VII (cross-link CANCER-THERAPY), antibiotic classes and pandemic-virus counts are not lattice-constrained. Numeric coincidences are OBSERVATION ONLY. This honesty is the corrective for the audited lattice-tautology stub."
  governance = "Complies with hexa-bio AGENTS.tape @D g1 (real-limits-first — every @D |>-grounded to a real @X), @D g2 (lattice-is-tool — declined here), @D g8 (in-silico-only-claim-scope — @N scope_disclaimer: knowledge SSOT, NOT clinical advice), @F f1 (no lattice-fit), @F f2 (no in-silico→clinical claims). No fabricated numbers or citations: 5 citations are deliberately author/era-only where exact bibliographic detail is not asserted with confidence (Pasteur ~1859–1861; Koch ~1884; Semmelweis 1861; Morton 1846; Röntgen 1895; Einthoven ~1902–1906) — each flagged explicitly in the corresponding @X ref."
  lint = "python3 selftest/tape_lattice_honesty_lint.py BIOLOGY-MEDICAL.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; deriv_warnings = guard/stance provenance lines only, no genuine lattice-derivation lines)."
