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
# HEXA-RIBOZYME.log.tape — append-only event history (v1.2 split)
# Sibling: HEXA-RIBOZYME.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_from_lattice_tautology_stub := "HEXA-RIBOZYME.tape full real-science rewrite" :: rewrite [ok d=2026-05-16]
  origin = "HEXA-RIBOZYME.tape was a lattice-tautology stub (mass-split commit 153b5a2): ~40 `@D row_* :: hexa-ribozyme` rows asserting σ(6)=12 conserved nucleotides, τ(6)=4 reaction states, φ(6)=2, and J₂=24 as the 'n6 invariant grounding' of catalytic-core / reaction-state / TS-symmetry / cleavage-outcome cardinalities — plus a 4-axis-STRUCT / EVOLVE / VERIFY / RISKS scaffold treating the n=6 lattice as the source of ribozyme architecture. No real RNA-enzymology body; the lattice was used as a DERIVATION of counts and a falsifier was framed around σ(6)=12 — exactly the f1/g2 violation."
  replaced-with = "Hand-written real catalytic-RNA science: §1 Discovery (Cech 1982 group I intron self-splicing, Altman 1983 RNase P, 1989 Nobel Prize); §2 Natural ribozyme families (group I, group II, RNase P, small self-cleaving zoo — hammerhead/hairpin/HDV/VS/glmS/twister/twister-sister/pistol/hatchet, the ribosome IS a ribozyme); §3 Mechanism (Steitz–Steitz 1993 two-metal-ion framework, general acid-base via nucleobase pKa-shifting in small ribozymes, substrate positioning, Mg²⁺ dependence); §4 Kinetics (k_cat regime ~10⁻²–10⁰ s⁻¹ for small natural self-cleaving ribozymes, ribosome PTC as kinetic exception, Eyring transition-state theory, Eigen–Hammes diffusion ceiling); §5 In-vitro selection (SELEX — Tuerk & Gold 1990 + Ellington & Szostak 1990; DNAzymes Breaker & Joyce 1994; riboswitches Breaker era; RNA-world hypothesis Joyce 2002 review); §6 Therapeutic context (historical antiviral/gene-silencing programme largely superseded clinically by siRNA + CRISPR, mechanistic basis foundational); §7 Seven real-limit anchors (k_cat Eyring ceiling — named explicitly in hexa-bio AGENTS.tape g1 — · Mg²⁺ in-vivo cation environment · off-target/specificity floor · folding-trap landscape · delivery+nuclease stability · ribosome-is-exception-not-rule honesty limit · in-silico→wet-lab boundary); §8 lattice-fit guard + honest n6 stance; §9 three falsifiable predictions; §11 nine real landmark @X :: literature citations."
  n6-stance = "n=6 DECLINED as a derivation tool even though RIBOZYME is a CORE axis where the lattice may legitimately appear in native-lattice-spec context (g2). @F f_lattice_fit + @N n6_honest_stance state plainly: catalytic-core sizes span orders of magnitude (small self-cleaving cores in the tens-of-nucleotides regime; ribosomal PTC inside ~2900 nt 23S rRNA); the two-metal-ion mechanism uses TWO Mg²⁺ because in-line phosphoryl-transfer chemistry needs one metal to activate the nucleophile and one to stabilize the leaving group — a chemistry count, not φ(6)=2 (any coincidence is OBSERVATION ONLY); reaction-step counts are mechanism (group I and II splicing each have two transesterifications; small self-cleaving ribozymes have one cleavage step), not τ(6)=4; k_cat / K_M / ΔG‡ are governed by Eyring transition-state theory and the diffusion-encounter ceiling, NOT by any lattice scalar. The prior stub's σ(6)=12-conserved-nucleotides claim was explicitly rejected — natural catalytic-core nucleotide counts vary widely and are biochemistry. Zero genuine lattice-derivation lines written."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first: 7 real-limit anchors, including the Eyring k_cat ceiling that g1 names explicitly for this axis), g2 (lattice-is-tool: appears in native axis only as declined-tool, never derivation), g8_in_silico_only (@N scope_disclaimer + @D lim_in_silico_boundary — C2/C3 PASS is simulator-consistency only, NOT wet-lab/therapeutic/antiviral/gene-silencing claim; therapeutic-history paragraph is historical context, not endorsement), f1 (lattice-fit forbidden — @F guard added with explicit examples of forbidden derivations: 'catalytic core has 12 nt because σ(6)=12', 'two metal ions because φ(6)=2', 'four reaction states because τ(6)=4'), f2 (no clinical claim from in-silico — therapeutic-history §6 explicitly disavows any therapeutic claim), f3 (no shadow-impl: qmirror / hexa-meta / xeno referenced via @X x_hexa_bio_agents, never reimplemented). Mirrors HEXA-WEAVE.tape discipline precedent (commit 6d9eb32)."
  citations = "Real: Cech et al 1982 (Cell 31:147–157), Guerrier-Takada/Altman et al 1983 (Cell 35:849–857), Steitz & Steitz 1993 (PNAS 90:6498–6502), Ban et al 2000 (Science 289:905–920 — 50S large-subunit structure, ribosome-as-ribozyme), Tuerk & Gold 1990 (Science 249:505–510), Ellington & Szostak 1990 (Nature 346:818–822). Author/era-qualified (exact volume/page not asserted): Breaker & Joyce 1994 (DNAzyme — Chem Biol vol/page author/era only), Eigen & Hammes 1963 (Adv Enzymol 25:1–38 — page range from secondary sources, treat as approximate), Joyce 2002 (Nature 418:214–221 — RNA-world review, cited author/era), Breaker riboswitches era (body of work from early-2000s onward, author/era only)."
  top-block = "v1.2 grammar primer + banner + @V :: spec version=1.2 retained verbatim; rewrite from @I id001 onward only."
  lint = "python3 selftest/tape_lattice_honesty_lint.py HEXA-RIBOZYME.tape --json → __TAPE_LATTICE_HONESTY__ PASS (verdict=PASS, has_guard=true, has_stance=true, grounded=true, deriv_warnings=[] — zero flagged lines on first run; no remedial reword needed)."
