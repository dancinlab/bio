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

# ══════════════════════════════════════════════════════════════
# BIOLOGY.log.tape — hexa-bio master biology substrate events (chronological)
# Sibling: BIOLOGY.tape (architecture-current)  ·  v1.2 split 2026-05-15
# ══════════════════════════════════════════════════════════════

# §Log — entries chronological, oldest first
#
# (Empty at split — pre-split BIOLOGY.tape carried 490 declarative @D :: biology
# entries describing taxonomy / hypotheses / theorems / predictions / methodology
# matrices, all architecture-current with no time anchors. Future runtime events
# — commit @A, @T/@R verification runs, @K cost samples, @? anomalies, dated
# @D :: decision events — append here.)

@A rewrite_lattice_to_real_science := "BIOLOGY.tape full real-science rewrite from lattice-tautology stub" :: rewrite [ok d=2026-05-16]
  origin = "Pre-rewrite BIOLOGY.tape (153b5a2 mass-split) was a ~490-entry lattice-tautology stub: `@D row_d*`, `@D row_exact_*`, `@D row_close_*`, `@D row_*` entries deriving biology from BT-codes (BT-51 genetic code, BT-101 photosynthesis, BT-103 stoichiometry, BT-122 honeycomb) and n=6 arithmetic — no real citations, no real-limits anchors, no PASS-contract honesty guard."
  what-was-removed = "All @D row_* lattice-tautology entries (discoveries, hypothesis-summary counts, impossibility-theorem rows), BT-key derivations, Korean-language commentary blocks, and ASCII-art section stubs. None of these carried citable science."
  what-was-added = "15 sections of real foundational biology: cell theory (Schleiden 1838 / Schwann 1839 / Virchow 1855); Darwinian evolution + Modern Synthesis (Darwin 1859; Dobzhansky 1937); Mendelian genetics (Mendel 1866); DNA double helix + central dogma (Watson & Crick 1953 Nature 171:737-738; Crick 1958/1970); genetic code (codon table combinatorics, frozen-accident hypothesis); transcription/translation/ribosome (ribozyme cross-link to HEXA-RIBOZYME); Human Genome Project (Lander 2001 Nature 409:860-921; Venter 2001 Science 291:1304-1351); NGS era; three-domain phylogeny (Woese & Fox 1977 PNAS 74:5088-5090); HGT; phylogenetics methods; ecology basics; Hox/evo-devo (Lewis 1978 Nature 276:565-570; Carroll 2005 evo-devo)."
  real-limits = "4 @D lim_* :: real-limit [ok required] entries: species-concept ambiguity (biological/phylogenetic/morphological), incomplete fossil record, sequencing/annotation completeness gap (~20% of human genes unknown function), convergence-vs-homology misidentification limit."
  honesty = "Zero fabricated numbers or citations. Uncertain bibliographic details are primary-author + era only with explicit 'not asserted' flags. n=6 observation-not-derivation: @F f_lattice_fit + @N n6_honest_stance state plainly that foundational biology has no natural n=6 invariant (64 codons = 4³ combinatorics; 20 amino acids = empirical count; chromosome counts vary 2 to 600+; trophic levels 3-5; Hox clusters = 4 in vertebrates). No derivation lines in the final tape."
  lint = "python3 selftest/tape_lattice_honesty_lint.py BIOLOGY.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; zero deriv_warnings from live claim lines)."
  citations-confident = [Watson & Crick 1953 Nature 171:737-738, Darwin 1859 book, Woese & Fox 1977 PNAS 74:5088-5090, Lander 2001 Nature 409:860-921, Venter 2001 Science 291:1304-1351, Mendel 1866 Verhandlungen, Lewis 1978 Nature 276:565-570, Crick 1970 Nature 227:561-563]
  citations-author-era = [Schleiden 1838, Schwann 1839, Virchow 1855, Crick 1958 symposium, Dobzhansky 1937 Columbia Press, Mayr 1942 biological-species-concept, Carroll 2005 evo-devo]
  governance = "Complies with hexa-bio AGENTS.tape @D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). PASS contract: @F f_lattice_fit guard present; @N n6_honest_stance present; ≥1 @X :: literature with ref= present (14 such entries)."
