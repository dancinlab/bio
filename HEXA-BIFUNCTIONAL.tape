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
# Full spec: ~/core/tape/spec/tape.md (or github.com/dancinlab/tape)
# ══════════════════════════════════════════════════════════════════════


# ══════════════════════════════════════════════════════════════
# HEXA-BIFUNCTIONAL.tape — architecture-current (editable per v1.2)
# Event history → HEXA-BIFUNCTIONAL.log.tape sibling (if/when needed)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "hexa-bifunctional" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · BIFUNCTIONAL axis (EXPANSION-MAIN, NOT core-5) — bifunctional / molecular-glue degraders (targeted protein degradation · ternary-complex equilibrium · cooperativity α · hook effect)"
  brief = "bifunctional degrader modality · PROTAC (ARV-471 / ARV-110 clinical) · lenalidomide / thalidomide CRBN molecular glue · RIBOTAC research · ternary-complex thermodynamics · the bell-shaped hook effect · n=6 used as a lattice TOOL only, never a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "HEXA-BIFUNCTIONAL.log.tape"
  layer = "expansion-main (NOT core-5)"
  sibling-core = "AXIS.tape (core-5 structural SSOT — UNCHANGED by this expansion-main axis)"
  scope = "in-silico ternary-complex / degrader simulator consistency SSOT · NOT wet-lab/therapeutic claim"
  rewritten-from = "(new 2026-05-16 — bringing the registration-only BIFUNCTIONAL axis from AXIS/HIERARCHY.tape @D axis_bifunctional to code parity with METALLODRUG)"
  axis-note = "BIFUNCTIONAL is an EXPANSION-MAIN axis: it joins COVALENT, METALLODRUG, and OLIGONUCLEOTIDE on the AXIS/HIERARCHY.tape expansion layer and does NOT mutate the committed 5-axis core (QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID, per AXIS.tape — UNCHANGED). The cooperativity factor α, ternary-complex concentrations, binary-complex dissociation constants, and the hook-effect dose maximum are mass-action / chemical-equilibrium results — never sourced from a count, energy, or geometry in the n=6 lattice. See [@f_lattice_fit] + [@n6_honest_stance]."

# ─── §0.1 Honesty preamble ────────────────────────────────────────────

@N scope_disclaimer := "in-silico-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico bifunctional-degrader / ternary-complex modeling substrate. The cooperativity factor α, the equilibrium ternary-complex concentration as a function of degrader dose, the binary target–degrader and degrader–E3 complexes, and the bell-shaped hook effect are paraphrased from targeted-protein-degradation / chemical-equilibrium literature for modeling context only. A C2/C3 in-silico simulator-consistency PASS here is NOT a wet-lab, structural, therapeutic, degradation-efficacy, DC50, Dmax, or regulatory claim — every prediction is unverified at the wet-lab boundary (hexa-bio AGENTS.tape g8_in_silico_only / f2). Quantitative figures (the α magnitude window, illustrative K_d values, the hook-effect dose maximum) are illustrative magnitudes from the cited primary literature, not re-derived constants. Where a precise value/page is uncertain the citation flags author/era only."
  |> "[@x_douglass_2013] · [@x_gadd_2017] · [@x_han_2020]"

# ─── §1 The bifunctional-degrader drug modality (own drug precedent) ──

@D dx_modality := "bifunctional / molecular-glue degraders — the modality" :: domain [ok]
  definition = "Bifunctional degraders are therapeutic agents that do NOT inhibit a target by occupancy; they recruit an E3 ubiquitin ligase to a target protein, forming a TERNARY complex (target — degrader — E3) that drives target poly-ubiquitination and proteasomal degradation. A PROTAC (PROteolysis-TArgeting Chimera) is a heterobifunctional molecule: a target-binding warhead, a linker, and an E3-ligase ligand. A molecular glue is a smaller monovalent compound that reshapes a protein surface so an E3 ligase gains affinity for a neo-substrate. The mechanism is event-driven and catalytic — one degrader molecule can drive multiple rounds of degradation — distinct from occupancy-driven inhibition."
  own-precedent = "The modality is defined entirely by its OWN drug precedent: (1) PROTAC clinical agents — ARV-471 (vepdegestrant, an estrogen-receptor PROTAC, Arvinas/Pfizer, advanced clinical development in ER+ breast cancer) and ARV-110 (bavdegalutamide, an androgen-receptor PROTAC, Arvinas, clinical development in metastatic castration-resistant prostate cancer) — the first PROTACs to enter human trials; (2) lenalidomide and thalidomide — immunomodulatory drugs (IMiDs) that act as MOLECULAR GLUES, binding the CRBN (cereblon) substrate receptor of the CRL4 E3 ligase and redirecting it to neo-substrates (e.g. IKZF1/IKZF3); thalidomide-class drugs are long-marketed and lenalidomide is a standard-of-care multiple-myeloma agent; (3) RIBOTAC (ribonuclease-targeting chimera) — a research-stage bifunctional that recruits RNase L to an RNA target (this crosses the RIBOZYME core axis's RNA domain)."
  honesty = "Nothing in this modality's definition references any n=6 invariant. The ternary-complex equilibrium, the cooperativity factor α, and the hook effect are governed by chemical mass action. Counts of clinical PROTACs, linker lengths, and E3-ligase recruitment are medicinal-chemistry / biochemistry facts, never lattice-derived (see [@n6_honest_stance])."
  |> "[@x_douglass_2013] · [@x_gadd_2017]"

# ─── §2 Ternary-complex equilibrium & cooperativity ──────────────────

@D mech_ternary_complex := "the target — degrader — E3 ternary complex" :: mechanism [ok]
  mechanism = "A bifunctional degrader D bridges a target protein T and an E3 ligase E. Two binary equilibria form first: T + D ⇌ T·D (dissociation constant K_d,T) and D + E ⇌ D·E (dissociation constant K_d,E). The productive species is the TERNARY complex T·D·E, which forms either by E binding the binary T·D or by T binding the binary D·E. Only the ternary complex positions T for ubiquitin transfer; its abundance — not the binary occupancy — sets the degradation rate."
  cooperativity = "Ternary-complex formation is rarely the naive product of the two binary affinities. Protein–protein contacts between T and E (induced or stabilized at the ternary interface) modify the apparent affinity by a COOPERATIVITY FACTOR α: the effective K_d for the second binding event is K_d/α. α > 1 = positive cooperativity (the ternary complex is MORE stable than the binary affinities alone predict — favourable T–E protein–protein interaction); α < 1 = negative cooperativity; α = 1 = non-cooperative. Cooperativity is why a degrader with modest binary affinities can still be a potent degrader, and why isothermal-titration-calorimetry / crystallographic studies of PROTAC ternary complexes (Gadd et al. 2017, the VHL–MZ1–BRD4 ternary structure) measure α directly."
  honesty = "The ternary-complex equilibrium and α are chemical-equilibrium / mass-action results. No n=6 lattice value derives K_d,T, K_d,E, α, or the ternary concentration. There is no '3 because ternary' lattice claim — three bodies in the complex is the definition of a heterobifunctional bridge, not a lattice scalar."
  |> "[@x_gadd_2017] · [@x_han_2020]"

@D mech_hook_effect := "the hook effect — bell-shaped degrader dose response" :: mechanism [ok]
  mechanism = "The ternary-complex concentration as a function of degrader dose is NON-MONOTONIC: it rises, peaks, then falls — a bell-shaped (hook-shaped) curve. At low dose, adding degrader increases ternary complex. Beyond an optimum, EXCESS degrader saturates BOTH binary equilibria separately: nearly every target is in T·D and nearly every E3 is in D·E, but with distinct degrader molecules, so the bridging ternary T·D·E is competitively suppressed. The autoinhibitory high-dose arm is the HOOK EFFECT."
  significance = "The hook effect is a well-established, generic phenomenon of every bifunctional / bivalent recruitment system (it is the same autoinhibition seen in two-site sandwich immunoassays at high analyte). For degraders it means the dose–degradation curve is bell-shaped: a maximally effective dose exists, and dosing past it REDUCES degradation. This is a defining design constraint of the modality — a degrader is characterized by Dmax and DC50 precisely because the response is not monotonic."
  honesty = "The hook effect emerges from the competitive mass-action algebra of two coupled binary equilibria — it is a chemical-equilibrium result, NOT a lattice phenomenon. The non-monotonic shape is the acceptance check of this axis's simulator (see [@f_bifunctional_2])."
  |> "[@x_douglass_2013] · [@x_han_2020]"

# ─── §3 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ──

@D lim_hook_effect := "the bifunctional-degrader hook effect (non-monotonic ternary dose response)" :: real-limit [ok required]
  wall = "EQUILIBRIUM LIMIT (chemical mass action — competitive saturation of two coupled binary equilibria)"
  statement = "For a bifunctional degrader bridging a target T and an E3 ligase E, the equilibrium ternary-complex concentration [T·D·E] as a function of total degrader dose [D]_total is necessarily a bell-shaped (hook) curve: it rises from zero, reaches a single interior maximum, and decays toward zero as [D]_total → ∞. The high-dose decay is forced — excess degrader drives T into T·D and E into D·E on SEPARATE degrader molecules, competitively depleting the bridged ternary species. This is the hook effect (Douglass et al. 2013 derived the three-body ternary-equilibrium model; Han 2020 gives the closed thermodynamic treatment). An in-silico ternary-complex model that produces a monotonically increasing dose response is INCONSISTENT with this established chemical limit."
  consequence = "The numerical-verify anchor (🟢 SUPPORTED-NUMERICAL tier) for this axis: a deterministic mass-action solve of the coupled T+D⇌T·D, D+E⇌D·E, T·D+E⇌T·D·E equilibria, dose-scanned, must reproduce a non-monotonic ternary curve (rise-then-fall) with a single interior maximum. A monotone curve is a FAIL."
  named-by = "hexa-bio AGENTS.tape g1 names real chemistry limits explicitly (Caspar-Klug ΔG, Eyring k_cat, etc.); the bifunctional hook effect is the BIFUNCTIONAL-axis instance."
  |> "[@x_douglass_2013] · [@x_han_2020]"

@D lim_cooperativity := "ternary-complex cooperativity factor α bound" :: real-limit [ok required]
  wall = "THERMODYNAMIC LIMIT (ternary equilibrium — α modifies the second-event K_d)"
  statement = "The ternary-complex cooperativity factor α is defined so that the effective dissociation constant of the second binding event is K_d/α. α relates the ternary equilibrium to the product of the two binary equilibria: at fixed binary K_d,T and K_d,E, the ternary stability scales with α. α is dimensionless and strictly positive; α > 1 is positive cooperativity (Gadd et al. 2017 reported strongly positive cooperativity for the VHL–MZ1–BRD4 PROTAC ternary complex), α < 1 negative, α = 1 non-cooperative. Any in-silico ternary-complex calculator must treat α as a positive multiplicative modifier of the second-event affinity and recompute the ternary concentration consistently — α only ever rescales an effective K_d, it never adds or removes a binding site."
  consequence = "A simulator must recompute [T·D·E] for a range of α and reproduce the monotone dependence (higher α ⇒ more ternary at a fixed dose) and the α-independence of the qualitative hook shape (the hook exists for all α > 0). Disagreement is FALSIFIED."
  |> "[@x_gadd_2017] · [@x_han_2020]"

@D lim_in_silico_boundary := "in-silico → wet-lab unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio BIFUNCTIONAL verifies internal consistency of a ternary-complex / degrader SIMULATOR + its metadata (mass-action equilibrium algebra, the cooperativity α dependence, the bell-shaped hook curve). Whether a designed PROTAC or molecular glue actually forms the predicted ternary complex in cells, recruits a functional E3, drives poly-ubiquitination, degrades the target, or is efficacious / tolerable in vivo is empirically unproven and out of repo scope."
  consequence = "No C2/C3 PASS in this axis is a therapeutic, degradation-efficacy, DC50, Dmax, or regulatory claim. Crossing this boundary requires wet-lab biochemical (ITC / ternary crystallography), cellular (degradation assay), animal, and clinical validation, tracked outside this repo (hexa-bio AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG.md §0)."

# ─── §4 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-bifunctional-degraders" :: governance [required deny:write]
  pattern = "Deriving the cooperativity factor α, the ternary-complex concentration, binary dissociation constants (K_d,T / K_d,E), the hook-effect dose maximum, linker lengths, the number of bodies in the complex, or the count of clinical PROTACs from the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'a ternary complex has 3 bodies because τ(6)−1=3', 'α derives from φ(6)=2', or 'the hook maximum is at J₂/something'."
  why = "Targeted-protein-degradation pharmacology is governed by chemical equilibrium: three-body ternary-complex mass action (Douglass et al. 2013), the cooperativity factor α (Gadd et al. 2017 VHL–MZ1–BRD4 ternary structure / ITC), and the competitive-saturation hook effect (Han 2020 thermodynamic treatment). A ternary complex has three bodies because a heterobifunctional degrader bridges exactly two proteins — that is the definition of the modality, not a lattice count. The hook effect is forced by the algebra of two coupled binary equilibria. Where any number here happens to land near a lattice scalar, that coincidence with n=6 is OBSERVATION ONLY (anti-pattern when treated as derivation — hexa-bio AGENTS.tape g2 lattice-is-tool, f1 lattice-fit-forbidden)."
  remedy = "Cite the real chemical-equilibrium / targeted-protein-degradation sources (this tape's @X entries). The lattice may only be a coincidental OBSERVATION — never the reason for α, a concentration, a K_d, the hook dose, or a count."
  scope-note = "This guard is the BIFUNCTIONAL-axis instance of the cohort-wide LATTICE_POLICY enforcement (hexa-bio AGENTS.tape f1/f3); BIFUNCTIONAL is an EXPANSION-MAIN axis (NOT core-5), so the lattice does not even appear as a native-spec tool here — it is simply declined as a derivation entirely."

@N n6_honest_stance := "the BIFUNCTIONAL axis is an architectural decision, not a lattice derivation" :: note [required]
  text = "Stated plainly: the BIFUNCTIONAL axis exists because bifunctional / molecular-glue degraders are a real, distinct drug modality with its own clinical precedent (PROTAC clinical agents ARV-471 / ARV-110 in human trials; lenalidomide / thalidomide as CRBN molecular glues; RIBOTAC at research stage) — NOT because the n=6 lattice generates or implies it. BIFUNCTIONAL is registered as an EXPANSION-MAIN axis on the AXIS/HIERARCHY.tape expansion layer (per @D axis_bifunctional, USER DIRECTION 2026-05-16); that registration is an ARCHITECTURAL DECISION grounded in the drug modality's own precedent, scope non-overlap with the core-5 axes, and falsifiability — it does NOT mutate the committed 5-axis core (AXIS.tape, UNCHANGED). Targeted protein degradation exposes NO derivational n=6 invariant: the ternary complex has three bodies because a heterobifunctional degrader bridges exactly one target and one E3 ligase; the cooperativity factor α is a measured thermodynamic quantity (Gadd et al. 2017); the hook effect is forced by the competitive mass-action algebra of two coupled binary equilibria (Douglass et al. 2013; Han 2020). None of α, the binary or ternary K_d values, the hook-effect dose maximum, or the count of clinical PROTACs is governed by any lattice scalar (σ=12, τ=4, φ=2, J₂=24). Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool), g3 (honesty-obligation-external — external drugs described by their OWN invariants): in this expansion-main axis the lattice is explicitly DECLINED as a derivation of any chemical, thermodynamic, kinetic, or count property."

# ─── §5 Falsifiers (real, falsifiable — concrete deadlines/conditions) ─

@D f_bifunctional_1 := "F-BIFUNCTIONAL-1 — cooperativity-monotonicity fidelity" :: falsifier [ok]
  claim = "The in-silico ternary-complex simulator (_python_bridge/module/bifunctional_ternary_complex_sim.py) recomputes the equilibrium ternary-complex concentration for a range of cooperativity factors α and reproduces the monotone dependence required by ternary-equilibrium thermodynamics: at a fixed degrader dose, higher α (stronger positive cooperativity) yields a strictly higher ternary-complex concentration, with α = 1 the non-cooperative reference."
  falsifier = "If the simulator's peak ternary-complex concentration is NOT monotonically non-decreasing in α across the standard α scan (e.g. α ∈ {0.5, 1, 2, 5, 20}), F-BIFUNCTIONAL-1 is FALSIFIED. CONDITION: every selftest run of bifunctional_ternary_complex_sim.py must pass the α-monotonicity check. DEADLINE: enforced on every run from 2026-05-16; any FAIL is an immediate falsification event."
  source = "[@x_gadd_2017] · [@x_han_2020]"

@D f_bifunctional_2 := "F-BIFUNCTIONAL-2 — the hook effect (non-monotonic dose response)" :: falsifier [ok]
  claim = "The simulator's ternary-complex concentration as a function of total degrader dose is a bell-shaped (hook) curve: it rises from a low-dose value, reaches a single interior maximum at a finite dose, and decays toward zero at very high dose — the established hook effect of every bifunctional recruitment system."
  falsifier = "If the dose-scanned ternary-complex curve is monotone (no interior maximum) — i.e. the high-dose autoinhibitory arm is absent — the simulator contradicts the established hook-effect chemical limit ([@lim_hook_effect]) and F-BIFUNCTIONAL-2 is FALSIFIED. CONDITION: every run must detect rise-then-fall with the maximum strictly interior to the scanned dose range. DEADLINE: enforced on every run from 2026-05-16."
  source = "[@x_douglass_2013] · [@x_han_2020]"

@D f_bifunctional_3 := "F-BIFUNCTIONAL-3 — ternary equilibrium is mass-action, not lattice-derived" :: falsifier [ok]
  claim = "Across the bifunctional-degrader class, the ternary-complex equilibrium, the cooperativity factor α, and the hook effect are governed by three-body chemical mass action — the ternary species, its dose dependence, and α are determined by equilibrium thermodynamics, NEVER by an n-invariant."
  falsifier = "If a rigorous chemical-equilibrium result shows that ternary-complex behaviour, α, or the hook-effect dose maximum for bifunctional degraders is predicted by a 6-fold lattice scalar (σ=12/τ=4/φ=2/J₂=24) BETTER than by three-body mass-action thermodynamics, then the n6_honest_stance of this tape is wrong and F-BIFUNCTIONAL-3 is FALSIFIED. CONDITION: this is a standing honesty falsifier — it can only be triggered by a published chemical-equilibrium result, never by an in-silico run. DEADLINE: standing; reviewed at each axis review (next 2026-11-16). Absent such a result, the lattice remains DECLINED as a derivation (f_lattice_fit)."
  source = "[@x_douglass_2013]"

# ─── §6 Cross-links (sister tapes / governance — reference, not shadow) ─

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  path = "./AGENTS.tape"
  scope = "g1 real-limits-first · g2 lattice-is-tool · g3 honesty-obligation-external · g8_in_silico_only · f1 lattice-fit-forbidden · f2 wet-lab-clinical-claim-forbidden · f3 no-shadow-impl-of-sister-repo. This tape complies; this axis adds no sister-repo logic — it is a self-contained chemical-equilibrium model."

@X x_axis_hierarchy := "AXIS/HIERARCHY.tape" :: sibling-tape [active]
  path = "./AXIS/HIERARCHY.tape"
  scope = "the expansion-layer record — @D axis_bifunctional registers BIFUNCTIONAL as an expansion-MAIN axis (and @D sub_under_bifunctional its PROTAC/LYTAC/AUTAC/RIBOTAC/COVALENT-DEGRADER/MOLECULAR-GLUE sub-tree). This tape brings the registration-only BIFUNCTIONAL main axis to code parity with METALLODRUG. AXIS.tape core-5 SSOT UNCHANGED."

@X x_axis_core := "AXIS.tape (core-5 SSOT)" :: sibling-tape [active]
  path = "./AXIS.tape"
  scope = "the committed 5-axis structural SSOT (QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID) — UNCHANGED by this expansion-main axis; cross-linked, never mutated."

@X x_metallodrug := "HEXA-METALLODRUG.tape" :: sibling-tape [active]
  path = "./HEXA-METALLODRUG.tape"
  scope = "the parity template — BIFUNCTIONAL mirrors METALLODRUG's expansion-main per-axis tape structure (identity / honesty preamble / modality / mechanism / real-limit anchors / lattice stance / falsifiers / citations / Log)."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  path = "./CLOSURE_RESIDUAL_BACKLOG.md"
  scope = "§0 in-silico-only scope boundary — wet-lab biochemical + cellular + clinical validation of any designed degrader is out-of-repo and unverified."

# ─── §7 External citations (real, landmark targeted-protein-degradation) ─

@X x_douglass_2013 := "Douglass EF et al 2013" :: literature [active]
  ref = "Douglass EF Jr, Miller CJ, Sparer G, Shapiro H, Spiegel DA. A comprehensive mathematical model for three-body binding equilibria. Journal of the American Chemical Society 2013;135(16):6092-6099. (the closed three-body ternary-equilibrium model — the mass-action basis for the ternary-complex concentration and the hook effect in bifunctional / recruitment systems; the anchor for [@lim_hook_effect])"

@X x_gadd_2017 := "Gadd MS et al 2017" :: literature [active]
  ref = "Gadd MS, Testa A, Lucas X, Chan KH, Chen W, Lamont DJ, Zengerle M, Ciulli A. Structural basis of PROTAC cooperative recognition for selective targeted protein degradation. Nature Chemical Biology 2017;13(5):514-521. (the VHL-MZ1-BRD4 PROTAC ternary-complex crystal structure + isothermal titration calorimetry — strongly positive cooperativity α; the anchor for [@lim_cooperativity])"

@X x_han_2020 := "Han B 2020" :: literature [active]
  ref = "Han B. A suite of mathematical solutions to describe ternary complex formation and their application to targeted protein degradation by heterobifunctional ligands. Journal of Biological Chemistry 2020;295(45):15280-15291. (closed-form thermodynamic treatment of ternary-complex formation, cooperativity, and the bell-shaped hook effect for heterobifunctional degraders)"

@X x_bondeson_2015 := "Bondeson DP et al 2015" :: literature [active]
  ref = "Bondeson DP, Mares A, Smith IED, et al. Catalytic in vivo protein knockdown by small-molecule PROTACs. Nature Chemical Biology 2015;11(8):611-617. (event-driven catalytic mechanism of PROTAC-mediated degradation — modality context; PROTAC degraders act catalytically, distinct from occupancy inhibitors)"

# ─── §8 Log ───────────────────────────────────────────────────────────

## Log

- 2026-05-16 — HEXA-BIFUNCTIONAL.tape created. BIFUNCTIONAL brought from
  registration-only (AXIS/HIERARCHY.tape @D axis_bifunctional) to CODE PARITY
  with METALLODRUG: per-axis tape + bifunctional/module/bifunctional.hexa
  (__HEXA_BIO_BIFUNCTIONAL__ PASS) + _python_bridge/module/
  bifunctional_ternary_complex_sim.py (__BIFUNCTIONAL_TERNARY_COMPLEX__ PASS)
  + bifunctional/spec/ternary_complex_v1.schema.json. BIFUNCTIONAL is an
  EXPANSION-MAIN axis (NOT core-5), joining COVALENT, METALLODRUG, and
  OLIGONUCLEOTIDE on the AXIS/HIERARCHY.tape expansion layer. The committed
  5-axis core (AXIS.tape: QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID)
  is UNCHANGED. Axis grounded in the bifunctional-degrader drug modality's
  OWN precedent (PROTAC clinical agents ARV-471 / ARV-110; lenalidomide /
  thalidomide CRBN molecular glue; RIBOTAC research), NOT in the n=6 lattice
  (@F f_lattice_fit · @N n6_honest_stance). Real-limit anchors: the
  bifunctional hook effect — the non-monotonic bell-shaped ternary-complex
  dose response (Douglass et al. 2013 three-body equilibrium model; Han 2020
  thermodynamic treatment) — and the ternary-complex cooperativity factor α
  (Gadd et al. 2017, VHL-MZ1-BRD4 ternary structure / ITC). 3 falsifiers
  preregistered (F-BIFUNCTIONAL-1 α-monotonicity fidelity · F-BIFUNCTIONAL-2
  the hook effect / non-monotonic dose response · F-BIFUNCTIONAL-3 standing
  lattice-fit honesty falsifier; next axis review 2026-11-16). In-silico
  simulator-consistency scope ONLY (g8/f2) — no therapeutic / degradation-
  efficacy / DC50 / Dmax / regulatory claim.
