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
# MYCOLOGY.log.tape — append-only event history (v1.2 split)
# Sibling: MYCOLOGY.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_lattice_to_real_science := "MYCOLOGY.tape fully rewritten — lattice-tautology stub → real-science citation-grounded SSOT" :: rewrite [ok d=2026-05-16]
  origin = "MYCOLOGY.tape was a lattice-tautology stub (hexa-bio mass-split 153b5a2): ~340 lines of @D row_* entries with x='n=6' / x='σ=12' / x='EXACT' assignments mapping fabricated mycology metrics (spore yield, hyphal growth mm/day, fermentation efficiency %) to lattice values (σ, τ, φ, J₂, sopfr). Zero real biology. Zero real citations. Governance violations: @F f1 (lattice-fit-on-external-entity), @D g1/g2 (real-limits-first / lattice-is-tool)."
  authored = "Full real-science rewrite 2026-05-16. Replaces ZERO biology with: §1 fungal cell biology (chitin cell wall, hyphal growth, septate vs coenocytic, dimorphism); §2 five-phylum classification (Ascomycota, Basidiomycota, Mucoromycota/Zygomycota, Chytridiomycota, Glomeromycota) each with real representative species; §3 decomposer ecology (white-rot lignin / brown-rot cellulose; carbon cycling significance); §4 mycorrhizal symbioses (ECM + AM, plant phosphorus acquisition); §5 species diversity (Hawksworth & Lücking 2017: 2.2–3.8M estimated total, ~120k–150k described); §6 antifungal pharmacology (echinocandins / azoles / polyenes — cell-biology-grounded mechanisms); §7 plant pathogens (Puccinia graminis/Ug99, Cryphonectria chestnut blight, Phytophthora infestans with HONEST oomycete caveat, rusts/smuts); §8 animal/human pathogens (Candida auris, Aspergillus, Cryptococcus, Histoplasma, Pneumocystis, Batrachochytrium); §9 industrial/food mycology (Saccharomyces, Penicillium penicillin, Aspergillus citric acid, cheese fungi, mycotoxins); §10 ≥4 @D lim_* :: real-limit entries (species discovery gap, cultivability bottleneck, antifungal resistance, chytrid amphibian irreversibility, mycotoxin food safety); §11 3 @D tp_* :: prediction entries with real falsifiers."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: mycology has no natural n=6 invariant. Five phyla (not six). Three antifungal classes (mechanistic, not lattice-counted). Species/growth figures are empirical measurements. All coincidences with lattice numbers are observation-only, never derivation."
  citations = "11 real @X :: literature entries grounded to real published works: Hawksworth & Lücking 2017 (Microbiol Spectr 5(4)); James et al 2006 (Nature 443:818); Gow et al 2017 (Microbiol Spectr 5(3)); Smith & Read 2008 (Mycorrhizal Symbiosis 3rd ed — textbook, era flagged); Berger et al 1998 (PNAS 95:9031); Skerratt et al 2007 (EcoHealth 4:125–134); Floudas et al 2012 (Science 336:1715); Pfaller & Diekema 2012 (J Clin Microbiol 50:2846 — cited as class-pharmacology anchor, era flagged); Bennett & Klich 2003 (Clin Microbiol Rev 16:497); Singh et al 2011 (Annu Rev Phytopathol 49:465); Anagnostakis 1987 (Mycologia 79:23); Papagianni 2007 (Biotechnol Adv 25:244). Author/era-flagged entries: Smith & Read (textbook SSOT, edition-era not volume-number); Hawksworth 2017 (volume identifier in ref); Borlaug wheat-rust context acknowledged in dom_wheat_rust without a separate @X (Singh 2011 carries the Ug99/wheat-rust literature anchor). Phytophthora infestans Irish Famine described with explicit honest oomycete caveat (de Bary ~1861 era flagged inline)."
  honesty = "No fabricated numbers/citations. The oomycete/fungus distinction for Phytophthora is explicitly flagged as a mandatory scientific honesty caveat (IMPORTANT HONESTY CAVEAT label). Candida auris ~2009 description era flagged as author/era-only (Satoshi Sugita et al. first isolation; volume not asserted). Cryptococcal burden ~180k–220k/year estimated from ~2017 global burden data — era flagged inline. Hawksworth species estimates retain their stated ranges and the 1991→2017 revision trajectory. All drug-mechanism claims tied to cell biology (chitin/β-glucan/ergosterol absent from mammals) rather than lattice abstraction."
  lint = "python3 selftest/tape_lattice_honesty_lint.py MYCOLOGY.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; zero derivation lines outside guard/stance provenance body)"
