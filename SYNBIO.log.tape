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
# SYNBIO.log.tape — append-only event history (v1.2 split)
# Sibling: SYNBIO.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite := "SYNBIO.tape rewritten from lattice-tautology stub to real-science SSOT with dual-use discipline" :: rewrite [ok d=2026-05-16]
  origin = "SYNBIO.tape was a fabricated lattice-tautology stub (created in the hexa-bio mass-split, commit 153b5a2). It 'derived' synthetic-biology metrics from n=6 lattice numbers: 코돈 64 = 2^n; 아미노산 20 = J₂-τ; BioBrick RFC = σ-φ; CRISPR gRNA 20 nt = J₂-τ; PAM = n/φ; Gibson 4 stages = τ; glucose atoms = J₂; Cas {9,12,13,14} = sopfr-ladder; DBTL 4 stages = τ — all flagged as 'EXACT' with no real biology, no real citations, no real biosecurity awareness. Every row_* / b_* stub entry deleted."
  authored = "Hand-written with real synthetic-biology science + landmark peer-reviewed citations + explicit dual-use biosecurity discipline. Replaces ZERO science with: foundations (Endy 2005 Nature 'Foundations for engineering biology'; BioBricks/Knight 2003 era; iGEM institutional; Carlson curve era for DNA synthesis economics); minimal cell + genome rewriting (Gibson 2010 Science 329:52–56 JCVI-syn1.0; Hutchison 2016 Science 351:aad6253 JCVI-syn3.0 — 473 genes, ~⅓ essential of unknown function honestly noted; Boeke Sc2.0 era; Lajoie 2013 Science 342:357–360 recoded E. coli); metabolic engineering (Ro 2006 Nature 440:940–943 Keasling artemisinic acid in yeast; Paddon 2013 era artemisinin scale-up — cited at era level with titre/scale-up gap honesty); gene drives at peer-reviewed level (Esvelt 2014 eLife 3:e03401 conceptual; Gantz & Bier 2015 Science 348:442–444 Drosophila MCR; Kyrou 2018 Nat Biotechnol 36:1062–1066 caged Anopheles gambiae suppression; Esvelt daisy-drive 2017 era proposal; NASEM 2016 gene-drive consensus report); cell-free + paper diagnostics (Pardee 2014 Cell 159:940–954; Pardee 2016 Cell 165:1255–1266 — cross-linked to CRISPR-CAS13-POC-DIAGNOSTIC); engineered probiotics research-stage framing; dual-use governance (NSABB DURC framework institutional; BWC 1972/1975 treaty; Australia Group export-control regime; Tumpey 2005 Science 310:77–80 1918 H1N1 reconstruction as the canonical DURC landmark, cited at literature level only with deny:write scope). 6 real-limit anchors (de-novo organism release biosafety HARD; gene-drive ecological reversibility HARD/unproven; essential-gene unknown function in syn3.0; titre/scale-up gap; biological composability gap vs Endy ideal; dual-use governance/normative wall with deny:write scope). 3 falsifiable predictions with falsifiers + sources. 17 real @X :: literature citations."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: synthetic biology has NO natural n=6 invariant. The genetic code (64 codons, 20 amino acids, 3 stops) is a property of natural biochemistry fixed by molecular evolution — NOT derivable from σ/τ/φ/J₂. BioBrick part counts, iGEM standards, Cas type counts (I–VI, an evolving microbial classification), DBTL stage count (workflow convention), JCVI-syn3.0's 473 essential genes (empirical), and gene-drive transmission ratios are measured/observed/chosen, never lattice-derived. Coincidence is OBSERVATION ONLY. This honesty IS the corrective for the audited lattice-tautology stub."
  dual-use-discipline = "EXPLICIT dual-use biosecurity discipline applied throughout: (1) @N scope_disclaimer flags DURC framing up front and disclaims operational protocol / pathogen-enhancement / biosecurity-circumvention content; (2) gene-drive entries cite published peer-reviewed laboratory landmarks (Gantz-Bier 2015, Kyrou 2018) with explicit 'contained laboratory conditions' framing — no field-deployment recipes; (3) Tumpey 2005 1918-influenza-reconstruction is named at literature level as the canonical DURC case study with explicit deny:write scope and zero methods reproduced; (4) governance bodies (NSABB DURC, BWC, Australia Group) named at institutional/treaty level with zero compliance/evasion advice; (5) lim_dual_use_governance real-limit added as an equal-weight governance/normative wall alongside the biological and engineering walls; (6) tp_2 falsifier explicitly restricted to contained laboratory settings (field-deployment predictions out of scope, deferred to lim_drive_reversibility); (7) deny:write tag applied to dual-use-sensitive entries (durc_framework, bwc, australia_group, de_novo_virus_durc, lim_dual_use_governance, f_lattice_fit) per AGENTS.tape g3/g8/f2 + dual-use discipline."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first — 6 real-limit anchors with HARD/SOFT/ENGINEERING/SOCIOECONOMIC/GOVERNANCE wall labels); g2 (lattice-is-tool — declined as derivation); g3 (honesty-obligation-external — NSABB, BWC, Australia Group, NASEM, JCVI, Keasling/Esvelt/Crisanti labs are external entities; no lattice assertion applied); g8 (in-silico-only-claim-scope — @N scope_disclaimer added with explicit dual-use discipline); f1 (no lattice-fit on external entity); f2 (no in-silico→clinical/operational claim — landmarks paraphrased from peer-reviewed literature for modelling context only). Provenance recorded in @I id001 rewritten-from key."
  honesty-caveats = "Five citations explicitly flagged primary-author/era only: x_knight_era (BioBricks RFC10 framework — Knight 2003 MIT era, no single canonical journal citation asserted); x_carlson_era (Carlson curve — long-run trajectory at primary-author level); x_sc2_era (Sc2.0 multi-paper consortium programme); x_paddon_era (artemisinin scale-up — Nature 2013 volume not asserted); x_esvelt_daisy_era (daisy-drive proposal — specific journal not asserted). Institutional references (x_nsabb_durc_institutional, x_bwc_institutional, x_australia_group_institutional, x_nasem_genedrive_2016) cited at framework/treaty/consensus-report level. The ~⅓ unknown-function fraction in JCVI-syn3.0 is paraphrased from Hutchison 2016's own candid result, not extrapolated. No operational specifics. No protocol steps. No pathogen-enhancement parameters."
  lint = "python3 selftest/tape_lattice_honesty_lint.py SYNBIO.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true, deriv_warnings=[] — zero lattice-derivation lines remain; all row_*/b_* stubs deleted)."
