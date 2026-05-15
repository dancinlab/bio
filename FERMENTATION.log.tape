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
# FERMENTATION.log.tape — append-only event history (v1.2 split)
# Sibling: FERMENTATION.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_real_science := "FERMENTATION.tape rewritten — lattice-tautology stub → real-science SSOT" :: rewrite [ok d=2026-05-16]
  origin = "Pre-rewrite FERMENTATION.tape was a mass-split lattice-tautology stub (hexa-bio 153b5a2): ~484 lines of @D row_h_fer_* and @D row_x_* entries with n_6 fields assigning lattice tokens (σ, τ, φ, J₂, sopfr, n=6) as alleged derivations of chemical stoichiometries (C₆H₁₂O₆ atom count = J₂=24), yeast chromosome count (16 = φ^τ), fermentation stage counts, cultural standards (막걸리 ABV = n=6%), and pH optima (pH 4–5 = τ~sopfr). Every such derivation was fabricated — none grounded in fermentation science. The file also had no @X :: literature entries, no @F lattice-fit guard, no @N honest-stance. It would have failed the tape_lattice_honesty_lint.py governance contract on all three gates."
  authored = "Full rewrite to real fermentation microbiology + biotechnology knowledge SSOT. Replaces all lattice-tautology stubs with evidence-based science covering: alcoholic fermentation (Pasteur 1857 / Saccharomyces / EMP glycolysis → ethanol); lactic acid fermentation (homofermentative vs heterofermentative LAB; cheese/yogurt/sauerkraut/kimchi/sourdough); acetic acid fermentation (Acetobacter; vinegar); propionic acid fermentation (Propionibacterium freudenreichii; Swiss cheese eyes); industrial fermentations (citric acid — A. niger / Currie 1917 era; antibiotics — penicillin Fleming 1929 + Chain & Florey 1940s industrialisation + Streptomyces secondary metabolism; bioplastics / bioethanol / enzymes / amino acids); process modes (SSF vs SmF; batch/fed-batch/continuous); starter cultures + bacteriophage management; synthetic-biology cross-link (defer to crispr siblings, do not shadow)."
  real-limits = "5 @D lim_* real-limit entries added: lim_phage (bacteriophage contamination — HARD WALL, persistent, dairy-endemic); lim_product_toxicity (ethanol toxicity to yeast ~12-15% v/v; Crabtree; acid inhibition of LAB — SOFT WALL); lim_oxygen_transfer (kLa scale-up limit for aerobic fermentations — HARD engineering wall); lim_substrate_economics (sugar/molasses commodity pricing as % of production cost); lim_gmo_regulatory (GMM regulatory approval timelines — HARD jurisdictional wall)."
  n6-stance = "Declined as a derivation tool. @N n6_honest_stance + @F f_lattice_fit state plainly: fermentation microbiology has no natural n=6 invariant. Stoichiometric '6' in glucose formula is hexose organic chemistry; 2×CO₂ from alcoholic fermentation is atom conservation; 16 S. cerevisiae chromosomes is established genomics (1996 yeast genome project); 4 bacterial growth phases is microbiology convention. All numeric coincidences are OBSERVATION ONLY. This honesty is the corrective for the audited lattice-tautology stub."
  citations = "6 @X :: literature entries added: Pasteur 1857 (Mémoire sur la fermentation alcoolique — volume/page cited); Fleming 1929 (Br J Exp Pathol 10:226–236 — volume/page cited); Hutkins 2006 (Microbiology and Technology of Fermented Foods — publisher/year cited); Stanier/Doudoroff/Adelberg 1963 (The Microbial World — publisher/year cited); Currie 1917 (J Biol Chem 31:15–37 — journal/volume/page cited); Gänzle 2014 (Food Microbiol 37:2–10 — journal/year cited). Author/era-flagging used wherever specific volume numbers are not independently verified. Chain & Florey 1940s penicillin industrialisation cited by era within dom_antibiotics (no fabricated volume/page)."
  predictions = "3 @D tp_* :: prediction entries with falsifiers: TP-1 homo/heterofermentative product-profile divergence (Hutkins 2006); TP-2 bacteriophage lysis in open dairy (Hutkins 2006); TP-3 ethanol toxicity ceiling in unengineered S. cerevisiae batch (Hutkins 2006)."
  lint = "python3 selftest/tape_lattice_honesty_lint.py FERMENTATION.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; deriv_warnings=[] — zero derivation-from-lattice lines)."
  governance = "Complies with hexa-bio AGENTS.tape @D g1 (real-limits-first), @D g2 (lattice-is-tool), @D g8 (in-silico-only-claim-scope), @F f1 (lattice-fit-on-external-entity). In-silico knowledge SSOT only; no wet-lab, clinical, or regulatory claims made."
