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
# HEXA-COVALENT.tape — architecture-current (editable per v1.2)
# Event history → HEXA-COVALENT.log.tape sibling (if/when needed)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "hexa-covalent" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · COVALENT axis (EXPANSION-MAIN, NOT core-5) — covalent (targeted-covalent) enzyme inhibitors (two-step E+I⇌E·I→E–I kinetics · reversible recognition Ki · covalent step kinact · efficiency metric kinact/Ki · Eyring TST for the covalent step)"
  brief = "covalent-inhibition drug modality · ibrutinib (covalent BTK Cys481, first FDA targeted covalent kinase inhibitor 2013) · afatinib (covalent EGFR Cys797) · sotorasib/adagrasib (covalent KRAS-G12C Cys12) · kinact/Ki second-order efficiency constant · n=6 used as a lattice TOOL only, never a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "HEXA-COVALENT.log.tape"
  layer = "expansion-main (NOT core-5)"
  sibling-core = "AXIS.tape (core-5 structural SSOT — UNCHANGED by this expansion-main axis)"
  scope = "in-silico covalent-inhibition simulator-consistency SSOT · NOT wet-lab/therapeutic claim"
  rewritten-from = "(new 2026-05-16 — expansion-main axis registered in AXIS/HIERARCHY.tape @D axis_covalent, brought to code parity with METALLODRUG)"
  axis-note = "COVALENT is an EXPANSION-MAIN axis: it joins BIFUNCTIONAL, METALLODRUG and OLIGONUCLEOTIDE on the AXIS/HIERARCHY.tape expansion layer and does NOT mutate the committed 5-axis core (QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID, per AXIS.tape — UNCHANGED). COVALENT is the GENERAL covalent-inhibition modality; its reversible-warhead specialization is the separate REVERSIBLE-COVALENT SUB-AXIS (:> COVALENT, reversible_covalent_sim.py) — this main axis does NOT duplicate it. Ki, kinact, kinact/Ki, covalent-step activation barriers ΔG‡, the choice of cysteine as the targeted nucleophile, and the two-step mechanism are enzyme-kinetics / physical-chemistry results — never sourced from a count, energy, or rate in the n=6 lattice. See [@f_lattice_fit] + [@n6_honest_stance]."

# ─── §0.1 Honesty preamble ────────────────────────────────────────────

@N scope_disclaimer := "in-silico-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico covalent-inhibition modeling substrate. The two-step mechanism (reversible recognition followed by the covalent step), the kinact/Ki efficiency framework, inhibition constants Ki, inactivation rates kinact, and covalent-step activation barriers ΔG‡ are paraphrased from enzyme-kinetics / medicinal-chemistry literature for modeling context only. A C2/C3 in-silico simulator-consistency PASS here is NOT a wet-lab, structural, binding-affinity, potency, selectivity, therapeutic, or regulatory claim — every kinetic prediction is unverified at the wet-lab boundary (hexa-bio AGENTS.tape g8_in_silico_only / f2). Quantitative figures (Ki / kinact / kinact/Ki / ΔG‡ values) are illustrative literature-informed surrogates for warhead CLASSES, not re-derived constants or fits to a specific compound. Where a precise value/page is uncertain the citation flags author/era only."
  |> "[@x_strelow_2017] · [@x_eyring_1935] · [@x_honigberg_2010]"

# ─── §1 The covalent-inhibition drug modality (own drug precedent) ────

@D dx_modality := "covalent enzyme inhibition — the modality" :: domain [ok]
  definition = "Covalent (targeted-covalent) inhibitors are therapeutic agents whose pharmacophore forms a covalent bond to a targeted active-site nucleophile — most often a cysteine thiolate. Action proceeds in TWO steps: (1) a fast reversible recognition equilibrium E + I ⇌(Ki) E·I in which the inhibitor binds non-covalently, then (2) a covalent step E·I ─kinact→ E–I in which the warhead reacts with the targeted nucleophile to form the covalent adduct. The modality is distinct from purely reversible small molecules: the covalent linkage gives prolonged target engagement and recovery governed (for an irreversible warhead) by protein resynthesis."
  own-precedent = "The modality is defined entirely by its OWN drug precedent: (1) ibrutinib, the first FDA-approved targeted covalent kinase inhibitor (FDA 2013) — an acrylamide Michael-acceptor warhead forms a covalent bond to Cys481 of Bruton's tyrosine kinase (BTK); Honigberg et al., PNAS 2010;107:13075. (2) afatinib, a covalent EGFR inhibitor (FDA 2013) — an acrylamide warhead targeting Cys797 of EGFR. (3) sotorasib (FDA 2021) and adagrasib (FDA 2022), covalent KRAS-G12C inhibitors — an acrylamide warhead reacts with the mutant-specific Cys12 thiol; Canon et al., Nature 2019;575:217. The medicinal-chemistry kinetics of this class — the two-step E+I⇌E·I→E–I model and the kinact/Ki efficiency constant — are the framework of Strelow JM, J Biomol Screen / SLAS Discovery 2017;22(1):3-20."
  honesty = "Nothing in this modality's definition references any n=6 invariant. The two-step mechanism, the kinact/Ki ranking constant, and the choice of cysteine as the targeted nucleophile are enzyme-kinetics / medicinal-chemistry facts. Counts of approved covalent drugs and any kinetic parameter are physical chemistry, never lattice-derived (see [@n6_honest_stance])."
  |> "[@x_strelow_2017] · [@x_honigberg_2010] · [@x_canon_2019]"

@N subaxis_relation := "COVALENT main vs the REVERSIBLE-COVALENT sub-axis" :: note [required]
  text = "COVALENT (this tape) is the GENERAL covalent-inhibition modality. REVERSIBLE-COVALENT is a SUB-AXIS (:> COVALENT) that SPECIALIZES the reversibility question — distinguishing reversible-equilibrium covalent warheads (e.g. nirmatrelvir's nitrile→thioimidate adduct) from irreversible ones via the covalent EQUILIBRIUM kon/koff and residence time. The sub-axis is implemented separately (_python_bridge/module/reversible_covalent_sim.py, AXIS/HIERARCHY.tape @D sub_under_covalent). This COVALENT main axis models the GENERAL two-step inactivation kinetics (Ki, kinact, kinact/Ki) and does NOT duplicate the sub-axis's reversibility-equilibrium model — the two are complementary, not overlapping."

# ─── §2 Two-step kinetics & the efficiency metric ─────────────────────

@D mech_two_step := "the two-step covalent-inhibition mechanism" :: mechanism [ok]
  framework = "Covalent inactivation is a two-step process: E + I ⇌(Ki) E·I ─kinact→ E–I. Step 1 is the reversible recognition equilibrium — the inhibitor first binds non-covalently in the active site, governed by the inhibition constant Ki (a dissociation constant; a lower Ki means tighter reversible binding). Step 2 is the covalent step — from the saturated E·I encounter complex the warhead reacts with the targeted active-site nucleophile at first-order maximal rate kinact, forming the covalent adduct E–I."
  observed-rate = "At an unsaturating inhibitor concentration [I], the observed pseudo-first-order inactivation rate is kobs = kinact·([I]/Ki) / (1 + [I]/Ki); in the low-[I] limit kobs → (kinact/Ki)·[I]. The free-enzyme inactivation half-life is t_1/2 = ln2 / kobs."
  honesty = "The two-step mechanism is an enzyme-kinetics result (Strelow 2017). It is NOT derived from any lattice value; the count 'two steps' is the structure of the mechanism, not τ or φ."
  |> "[@x_strelow_2017]"

@D metric_kinact_ki := "kinact/Ki — the covalent-inhibitor efficiency metric" :: chemistry [ok]
  framework = "Because covalent inactivation depends on BOTH how well the inhibitor is recognised (Ki) AND how fast the warhead reacts once bound (kinact), the second-order rate constant kinact/Ki (units M⁻¹ s⁻¹) is the field-standard potency/efficiency metric for a covalent inhibitor — it ranks covalent inhibitors the way kcat/Km ranks enzyme substrates. A higher kinact/Ki indicates a more efficient covalent inactivator. This is the kinetic framework of Strelow (2017)."
  honesty = "kinact/Ki is an enzyme-kinetics ratio of two measured kinetic parameters. It is NOT a lattice scalar; no n=6 invariant derives it."
  |> "[@x_strelow_2017]"

@D mech_eyring_covalent := "Eyring TST for the covalent step" :: chemistry [ok]
  framework = "The covalent step (warhead → adduct) is an elementary chemical reaction, so its rate is bounded by Eyring transition-state theory: kinact_TST = (kB·T/h)·exp(−ΔG‡/R·T). Given a warhead's covalent-step activation barrier ΔG‡ this yields a TST-predicted kinact; inverting an empirical kinact gives the implied ΔG‡. The universal frequency prefactor kB·T/h (≈6.46e12 /s at T=310 K) is a hard physical ceiling — no covalent-step elementary rate may exceed it."
  honesty = "Eyring TST (Eyring 1935) is a physical-chemistry result. The prefactor kB·T/h is the real-limit anchor for this axis (see [@lim_eyring_prefactor]); it is NOT derived from any lattice value."
  |> "[@x_eyring_1935]"

# ─── §3 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ──

@D lim_kinact_ki_framework := "kinact/Ki covalent-inhibitor kinetic framework" :: real-limit [ok required]
  wall = "KINETIC-FRAMEWORK ANCHOR (enzyme kinetics — the second-order efficiency constant)"
  statement = "For a two-step covalent inhibitor E + I ⇌(Ki) E·I ─kinact→ E–I, the second-order efficiency constant kinact/Ki is the correct potency descriptor: the low-[I] limiting observed inactivation rate is kobs = (kinact/Ki)·[I]. An in-silico covalent-inhibition model that recomputes kinact/Ki must reproduce this identity exactly — kinact/Ki computed directly (kinact ÷ Ki) and back-computed from the limiting kobs slope must agree to floating-point tolerance, and the half-life t_1/2 = ln2/kobs must follow from kobs."
  consequence = "A covalent-inhibition simulator whose kinact/Ki is internally inconsistent (the two recomputation paths disagree, or kobs/t_1/2 do not follow) is inconsistent with the kinetic framework and is a FAIL. This is the kinetic-framework verify anchor (🟢-class SUPPORTED-NUMERICAL: a deterministic recompute matching the cited framework)."
  named-by = "hexa-bio AGENTS.tape g1 names real chemistry/biology limits explicitly (Eyring k_cat, Caspar-Klug ΔG, etc.); the kinact/Ki framework is the COVALENT-axis kinetic-framework instance."
  |> "[@x_strelow_2017]"

@D lim_eyring_prefactor := "Eyring TST universal frequency prefactor ceiling" :: real-limit [ok required]
  wall = "HARD WALL (physical chemistry — Eyring transition-state-theory rate ceiling)"
  statement = "Eyring transition-state theory gives a unimolecular elementary-reaction rate k = (kB·T/h)·exp(−ΔG‡/R·T). The frequency prefactor kB·T/h is the universal upper bound on the rate: at T = 310 K it equals ≈6.46e12 /s. No modelled covalent-step rate (kinact, or its Eyring-TST prediction from ΔG‡) can exceed this physical ceiling — it is a hard real limit. The same TST ceiling anchors the repo's RIBOZYME-axis kinetics simulator and the REVERSIBLE-COVALENT sub-axis."
  consequence = "A covalent-inhibition simulator that produces a covalent-step rate above kB·T/h has violated transition-state theory and is FALSIFIED. Every row's kinact and Eyring-predicted kinact are checked against this ceiling on every run."
  |> "[@x_eyring_1935]"

@D lim_in_silico_boundary := "in-silico → wet-lab unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio COVALENT verifies internal consistency of a covalent-inhibition SIMULATOR + its metadata (two-step kinetics arithmetic — kinact/Ki recomputed two ways agree; Eyring rate respects the kB·T/h ceiling; kobs and t_1/2 follow from kinact/Ki). Whether a designed covalent inhibitor actually achieves the predicted Ki / kinact, is selective for the intended target cysteine over off-target nucleophiles, or is efficacious/tolerable in vivo is empirically unproven and out of repo scope."
  consequence = "No C2/C3 PASS in this axis is a binding-affinity, potency, selectivity, therapeutic, or regulatory claim. Crossing this boundary requires wet-lab kinetic + cell + animal + clinical validation, tracked outside this repo (hexa-bio AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG.md §0)."

# ─── §4 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-covalent-inhibition" :: governance [required deny:write]
  pattern = "Deriving inhibition constants Ki, inactivation rates kinact, the efficiency metric kinact/Ki, covalent-step activation barriers ΔG‡, the count of approved covalent drugs, the number of steps in the mechanism, or the choice of cysteine as the targeted nucleophile from the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'the mechanism has two steps because φ(6)=2', 'kinact/Ki = J₂/something', or 'the warhead targets cysteine because of a lattice scalar'."
  why = "Covalent-inhibition pharmacology is governed by enzyme kinetics and physical chemistry: the two-step E+I⇌E·I→E–I model and the kinact/Ki efficiency constant (Strelow 2017), Eyring transition-state theory (Eyring 1935), and the nucleophilicity of the targeted residue. None of these is sourced from a lattice scalar. Where a count (e.g. 'two steps') happens to coincide with a lattice value, that coincidence is OBSERVATION ONLY (anti-pattern when treated as derivation — hexa-bio AGENTS.tape g2 lattice-is-tool, f1 lattice-fit-forbidden)."
  remedy = "Cite the real enzyme-kinetics / physical-chemistry sources (this tape's @X entries). The lattice may only be a coincidental OBSERVATION — never the reason for a kinetic parameter, an energy, a count, or a mechanistic feature."
  scope-note = "This guard is the COVALENT-axis instance of the cohort-wide LATTICE_POLICY enforcement (hexa-bio AGENTS.tape f1/f3); COVALENT is an EXPANSION-MAIN axis (NOT core-5), so the lattice does not even appear as a native-spec tool here — it is simply declined as a derivation entirely."

@N n6_honest_stance := "the COVALENT axis is an architectural decision, not a lattice derivation" :: note [required]
  text = "Stated plainly: the COVALENT axis exists because covalent (targeted-covalent) enzyme inhibition is a real, distinct, FDA-precedented drug modality (ibrutinib — first FDA-approved targeted covalent kinase inhibitor 2013; afatinib 2013; sotorasib 2021; adagrasib 2022) — NOT because the n=6 lattice generates or implies it. COVALENT is registered as an EXPANSION-MAIN axis (joining BIFUNCTIONAL, METALLODRUG and OLIGONUCLEOTIDE on the AXIS/HIERARCHY.tape expansion layer per @D axis_covalent); that registration is an ARCHITECTURAL DECISION grounded in the drug modality's own precedent, scope non-overlap with the core-5 axes, and falsifiability — it does NOT mutate the committed 5-axis core (AXIS.tape, UNCHANGED). Covalent-inhibition kinetics expose NO derivational n=6 invariant: the two-step E+I⇌E·I→E–I mechanism is the structure of covalent inactivation; the kinact/Ki efficiency constant is a ratio of two measured kinetic parameters; the covalent-step rate is bounded by the Eyring kB·T/h prefactor. The numerical coincidence 'two steps' with φ(6)=2 is OBSERVATION ONLY; reading it as a derivation would be the f_lattice_fit anti-pattern. Ki, kinact, kinact/Ki, ΔG‡, and the nucleophilicity of the targeted cysteine are governed by enzyme kinetics (Strelow 1995/2017) and physical chemistry (Eyring 1935), NOT by any lattice scalar. Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool), g3 (honesty-obligation-external — external drugs described by their OWN invariants): in this expansion-main axis the lattice is explicitly DECLINED as a derivation of any kinetic, energetic, count, or mechanistic property."

# ─── §5 Falsifiers (real, falsifiable — concrete deadlines/conditions) ─

@D f_covalent_1 := "F-COVALENT-1 — kinact/Ki numerical-recompute fidelity" :: falsifier [ok]
  claim = "The in-silico covalent-inhibition simulator (_python_bridge/module/covalent_inhibition_sim.py) recomputes the kinact/Ki efficiency metric for every panel entry two independent ways — directly (kinact ÷ Ki) and back-computed from the low-[I] limiting kobs slope — and the two agree to floating-point tolerance; the Eyring rate→barrier→rate roundtrip is self-consistent; and the free-enzyme half-life t_1/2 = ln2/kobs follows from kobs."
  falsifier = "If the simulator's two kinact/Ki recomputation paths disagree by more than 1e-9 (relative), OR the Eyring roundtrip diverges by more than 1e-6 (relative), OR t_1/2 does not follow from kobs, F-COVALENT-1 is FALSIFIED. CONDITION: every selftest run of covalent_inhibition_sim.py must pass the kinact/Ki-consistency check. DEADLINE: enforced on every run from 2026-05-16; any FAIL is an immediate falsification event."
  source = "[@x_strelow_2017]"

@D f_covalent_2 := "F-COVALENT-2 — Eyring kB·T/h ceiling respected" :: falsifier [ok]
  claim = "Every modelled covalent-step rate — each panel entry's kinact and its Eyring-TST prediction from the covalent-step activation barrier ΔG‡ — is strictly below the Eyring universal frequency prefactor kB·T/h (≈6.46e12 /s at T=310 K), the hard transition-state-theory ceiling on a unimolecular elementary rate."
  falsifier = "If the simulator produces any covalent-step rate at or above kB·T/h, transition-state theory has been violated and F-COVALENT-2 is FALSIFIED — the panel's ΔG‡/kinact surrogates must be re-derived. CONDITION: checked on every run. DEADLINE: enforced on every run from 2026-05-16; any FAIL is an immediate falsification event."
  source = "[@x_eyring_1935]"

@D f_covalent_3 := "F-COVALENT-3 — two-step kinetics is mechanism, not lattice-derived" :: falsifier [ok]
  claim = "Across the covalent-inhibition class, the two-step E+I⇌E·I→E–I mechanism (reversible recognition then the covalent step) and the kinact/Ki efficiency constant are determined by enzyme kinetics and physical chemistry — NEVER by an n=6-lattice scalar."
  falsifier = "If a rigorous enzyme-kinetics result shows that the covalent-inhibition mechanism, the number of kinetic steps, or the kinact/Ki ranking is predicted by a 6-fold lattice scalar (σ=12/τ=4/φ=2/J₂=24) BETTER than by enzyme-kinetics theory, then the n6_honest_stance of this tape is wrong and F-COVALENT-3 is FALSIFIED. CONDITION: this is a standing honesty falsifier — it can only be triggered by a published enzyme-kinetics result, never by an in-silico run. DEADLINE: standing; reviewed at each axis review (next 2026-11-16). Absent such a result, the lattice remains DECLINED as a derivation (f_lattice_fit)."
  source = "[@x_strelow_2017]"

# ─── §6 Cross-links (sister tapes / governance — reference, not shadow) ─

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  path = "./AGENTS.tape"
  scope = "g1 real-limits-first · g2 lattice-is-tool · g3 honesty-obligation-external · g8_in_silico_only · f1 lattice-fit-forbidden · f2 wet-lab-clinical-claim-forbidden · f3 no-shadow-impl-of-sister-repo. This tape complies; this axis adds no sister-repo logic — it is a self-contained covalent-inhibition kinetics model."

@X x_axis_hierarchy := "AXIS/HIERARCHY.tape" :: sibling-tape [active]
  path = "./AXIS/HIERARCHY.tape"
  scope = "the expansion-layer record — @D axis_covalent registers COVALENT as an expansion-MAIN axis; @D sub_under_covalent registers the REVERSIBLE-COVALENT sub-axis. AXIS.tape core-5 SSOT UNCHANGED."

@X x_axis_core := "AXIS.tape (core-5 SSOT)" :: sibling-tape [active]
  path = "./AXIS.tape"
  scope = "the committed 5-axis structural SSOT (QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID) — UNCHANGED by this expansion-main axis; cross-linked, never mutated."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  path = "./CLOSURE_RESIDUAL_BACKLOG.md"
  scope = "§0 in-silico-only scope boundary — wet-lab kinetic + cell + clinical validation of any designed covalent inhibitor is out-of-repo and unverified."

# ─── §7 External citations (real, landmark covalent-inhibition kinetics) ─

@X x_strelow_2017 := "Strelow JM 2017" :: literature [active]
  ref = "Strelow JM. A perspective on the kinetics of covalent and irreversible inhibition. Journal of Biomolecular Screening / SLAS Discovery 2017;22(1):3-20. (the kinact/Ki framework: the two-step E+I⇌E·I→E–I model, kinact/Ki as the second-order efficiency constant ranking covalent inhibitors, kobs-vs-[I] saturation — the kinetic-framework anchor for [@lim_kinact_ki_framework])"

@X x_eyring_1935 := "Eyring H 1935" :: literature [active]
  ref = "Eyring H. The activated complex in chemical reactions. Journal of Chemical Physics 1935;3:107-115. (transition-state theory — a unimolecular elementary rate k = (kB·T/h)·exp(−ΔG‡/R·T) is bounded by the universal frequency prefactor kB·T/h; the physical-chemistry ceiling anchoring [@lim_eyring_prefactor])"

@X x_honigberg_2010 := "Honigberg LA et al 2010" :: literature [active]
  ref = "Honigberg LA, Smith AM, Sirisawad M, et al. The Bruton tyrosine kinase inhibitor PCI-32765 blocks B-cell activation and is efficacious in models of autoimmune disease and B-cell malignancy. PNAS 2010;107(29):13075-13080. (ibrutinib / PCI-32765 — acrylamide Michael-acceptor warhead forming a covalent bond to BTK Cys481; ibrutinib became the first FDA-approved targeted covalent kinase inhibitor, 2013)"

@X x_canon_2019 := "Canon J et al 2019" :: literature [active]
  ref = "Canon J, Rex K, Saiki AY, et al. The clinical KRAS(G12C) inhibitor AMG 510 drives anti-tumour immunity. Nature 2019;575:217-223. (sotorasib / AMG 510 — acrylamide warhead forming a covalent bond to the mutant-specific Cys12 of KRAS-G12C; sotorasib FDA-approved 2021, adagrasib 2022)"

# ─── §8 Log ───────────────────────────────────────────────────────────

## Log

- 2026-05-16 — HEXA-COVALENT.tape created. COVALENT brought to CODE PARITY
  with METALLODRUG (was registration-only in AXIS/HIERARCHY.tape @D
  axis_covalent). COVALENT is an EXPANSION-MAIN axis (NOT core-5), joining
  BIFUNCTIONAL, METALLODRUG and OLIGONUCLEOTIDE on the AXIS/HIERARCHY.tape
  expansion layer. The committed 5-axis core (AXIS.tape: QUANTUM · WEAVE ·
  NANOBOT · RIBOZYME · VIROCAPSID) is UNCHANGED. Axis grounded in the
  covalent-inhibition drug modality's OWN precedent (ibrutinib — first FDA
  targeted covalent kinase inhibitor 2013 · afatinib 2013 · sotorasib 2021 ·
  adagrasib 2022), NOT in the n=6 lattice (@F f_lattice_fit · @N
  n6_honest_stance). COVALENT is the GENERAL covalent-inhibition modality;
  the reversible-warhead specialization is the separate REVERSIBLE-COVALENT
  sub-axis (@N subaxis_relation) — this main axis does NOT duplicate it.
  Real-limit anchors: the kinact/Ki two-step covalent-inhibitor kinetic
  framework (Strelow 2017, J Biomol Screen 22(1):3-20) and the Eyring
  transition-state-theory universal prefactor kB·T/h (Eyring 1935, J Chem
  Phys 3:107-115). Implementation — covalent/module/covalent.hexa
  (__HEXA_BIO_COVALENT__ PASS) · _python_bridge/module/covalent_inhibition_sim.py
  (__COVALENT_INHIBITION__ PASS, 7/7) · covalent/spec/inhibition_v1.schema.json.
  3 falsifiers preregistered (F-COVALENT-1 kinact/Ki-recompute fidelity ·
  F-COVALENT-2 Eyring kB·T/h ceiling · F-COVALENT-3 standing lattice-fit
  honesty falsifier; next axis review 2026-11-16). In-silico
  simulator-consistency scope ONLY (g8/f2) — no binding-affinity / potency /
  selectivity / therapeutic / regulatory claim.
