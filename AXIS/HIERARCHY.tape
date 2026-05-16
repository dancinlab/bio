#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# AXIS/HIERARCHY.tape — axis EXPANSION layer (separate from core-5)
# Recorded per explicit USER DIRECTION 2026-05-16 (1st: register COVALENT +
# BIFUNCTIONAL; 2nd: register + IMPLEMENT 6 further expansion-layer axes).
# Event history → AXIS/HIERARCHY.log.tape sibling (if/when needed).
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "axis.hierarchy" :: identity-claim [d=2026-05-16 active]
  kind = "axis EXPANSION-layer record — NOT a core-5 SSOT mutation"
  brief = "expansion-main {COVALENT · BIFUNCTIONAL · METALLODRUG · OLIGONUCLEOTIDE} + sub-axis tree (19 entries) — ALL expansion-main + 15 sub-axes IMPLEMENTED (code + hexa-verify) + 8 cross-axis bridges + falsifier execution gate (2026-05-16); recorded per USER DIRECTION; AXIS.tape core-5 UNCHANGED"
  parent = "dancinlab/hexa-bio"
  sibling-core = "../AXIS.tape (core-5 structural SSOT — UNCHANGED by this file)"
  tape-class = "meta/decision-record"
  rewritten-from = "(new 2026-05-16)"
  honesty-notes = "this file is a USER-DIRECTED expansion-layer decision record. It does NOT modify the committed 5-axis core (AXIS.tape). It OVERRIDES the AXIS/README.md §4 'keep-5' RECOMMENDATION at the user's explicit instruction — and the §4 rigorous dissent is preserved verbatim (NOT erased). No axis here is derived from the n=6 lattice (g2/f_lattice_fit). All in-silico-only scope (g8); external drug-modalities described by their OWN precedent, never lattice-fit (g3/f1)."

# ─── §0.1 Honesty preamble ────────────────────────────────────────────

@N scope_disclaimer := "expansion-layer-not-core" :: note [required]
  text = "AXIS/HIERARCHY.tape is a SEPARATE governed expansion layer. The hexa-bio CORE remains the committed 5 axes (QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID) per ../AXIS.tape — that SSOT is UNCHANGED. This file records a USER DIRECTION (2026-05-16) to register COVALENT and BIFUNCTIONAL as expansion-MAIN axes and to operate the borderline candidates as SUB-axes. This DECISION overrides the AXIS/README.md §4 rigorous recommendation ('keep 5-axis · add 0 · defer post-1.0'); per honest-record discipline that contrary recommendation is preserved (see @N rigorous_dissent), not deleted. Expansion-main C2/C3 is in-silico simulator-consistency ONLY — never a wet-lab/clinical/regulatory claim (g8/f2)."
  authority = "[@x_axis_core] · [@x_readme] §4 · [@x_agents_tape] g8/g2/g3"

@N rigorous_dissent := "preserved-keep5-recommendation" :: note [required d=2026-05-16 active]
  text = "DISSENT PRESERVED (honest record): the rigorous axis-expansion analysis (AXIS/README.md §4, synthesised from docs/hexa_bio_axis_expansion_brainstorm_2026_05_08.md, 165 options) concluded — '\"Add no axis\" (#156) is a valid, possibly the best option; KEEP 5-axis; 6th-axis review DEFERRED to post-1.0 (v2.0)'. The source brainstorm rated 7-axis (#103) ⚠️ borderline ('3년 시간 필요') and hierarchical super+sub (#95) ⚠️ borderline ('복잡도 폭증') — NEITHER promoted. This expansion-layer record does NOT refute that analysis; it is a USER DIRECTION that proceeds DESPITE it. Both stand on record."
  authority = "[@x_readme] §4 · [@x_brainstorm]"

@F f_lattice_fit := "lattice-fit-in-hierarchy" :: governance [required deny:write]
  pattern = "Deriving the expansion-main count (4), any axis position, or any sub-axis assignment FROM the n=6 lattice (σ=12·τ=4·φ=2·J₂=24)."
  why = "Per AGENTS.tape g2/f1 the lattice is a TOOL, never a derivation. COVALENT/BIFUNCTIONAL and the sub-tree are chosen from the README promotion criteria (modality/non-overlap/rigor/scope/falsifier) + a USER DIRECTION — NOT from any lattice scalar."
  authority = "[@x_lattice_policy] g1/g2 · [@x_agents_tape] f1/g2"

@F f_core_mutation := "expansion-treated-as-core" :: governance [required deny:write]
  pattern = "Citing this file as if it modified AXIS.tape's committed 5-axis core, or as if COVALENT/BIFUNCTIONAL were core axes."
  remedy = "expansion-main ≠ core axis. Core stays 5 (../AXIS.tape). This is a user-directed expansion LAYER with §4 dissent preserved."

# ─── §1 Expansion-main axes (USER DIRECTION 2026-05-16) ───────────────

@D axis_covalent := "COVALENT — expansion-main" :: axis-declaration [active d=2026-05-16]
  axis-id = "COVALENT"
  layer = "expansion-main (NOT core-5)"
  source-score = "4.9 · M:1 N:0.9 R:1 S:1 F:1 · 5/5 (docs/hexa_bio_axis_expansion_brainstorm_2026_05_08.md #20)"
  modality = "covalent bond-forming inhibitors — own precedent: ibrutinib (covalent BTK Cys481, FDA 2013) · sotorasib (2021) / adagrasib (2022) covalent KRAS-G12C"
  rationale = "5/5 · non-overlapping with core-5 · QUANTUM-VQE cross tightest (covalent-docking → TS energetics) = lowest integration cost"
  implementation = "IMPLEMENTED 2026-05-16 — HEXA-COVALENT.tape · covalent/module/covalent.hexa (__HEXA_BIO_COVALENT__ PASS) · _python_bridge/module/covalent_inhibition_sim.py (__COVALENT_INHIBITION__ PASS 7/7) · covalent/spec/inhibition_v1.schema.json"
  verify = "hexa verify 🟢-class SUPPORTED-NUMERICAL — Strelow 2017 kinact/Ki two-step covalent-inhibitor kinetics + Eyring 1935 TST ceiling"
  scope = "in-silico simulator-consistency only (g8/f2). Described by its own drug precedent, NOT lattice-fit (g3/f1)."

@D axis_bifunctional := "BIFUNCTIONAL — expansion-main" :: axis-declaration [active d=2026-05-16]
  axis-id = "BIFUNCTIONAL"
  layer = "expansion-main (NOT core-5)"
  source-score = "4.9 · M:1 N:0.9 R:1 S:1 F:1 · 5/5 (#28 MOLECULAR-GLUE / #29 BIFUNCTIONAL)"
  modality = "bifunctional / molecular-glue degraders — own precedent: PROTAC (ARV-471/110 clinical) · lenalidomide/thalidomide (CRBN molecular glue) · RIBOTAC (RNA-degrader, research)"
  rationale = "5/5 · non-overlapping · mega-axis with its own sub-tree; RIBOTAC crosses RIBOZYME (core)"
  implementation = "IMPLEMENTED 2026-05-16 — HEXA-BIFUNCTIONAL.tape · bifunctional/module/bifunctional.hexa (__HEXA_BIO_BIFUNCTIONAL__ PASS) · _python_bridge/module/bifunctional_ternary_complex_sim.py (__BIFUNCTIONAL_TERNARY_COMPLEX__ PASS 7/7) · bifunctional/spec/ternary_complex_v1.schema.json. Hook-effect non-monotonic bell curve verified."
  verify = "hexa verify 🟢-class SUPPORTED-NUMERICAL — Douglass 2013 / Han 2020 ternary-complex cooperativity + Gadd 2017 α; the hook effect"
  scope = "in-silico simulator-consistency only (g8/f2). Own precedent, NOT lattice-fit."

@D axis_metallodrug := "METALLODRUG — expansion-main" :: axis-declaration [active d=2026-05-16]
  axis-id = "METALLODRUG"
  layer = "expansion-main (NOT core-5)"
  source = "assistant-proposed candidate (2026-05-16 session) — NOT from the docs/hexa_bio_axis_expansion_brainstorm_2026_05_08.md 165-option set. M:1 N:1 R:1 S:1 F:1 ≈ 5.0 is an ASSISTANT ESTIMATE per the README §6 subjective-rubric caveat, not an independently re-derived or source-transcribed score."
  modality = "metal-coordination therapeutics — own precedent: cisplatin (FDA 1978) · carboplatin (1989) · oxaliplatin (2002) · auranofin (gold, 1985) · arsenic trioxide (APL)"
  rationale = "non-overlapping with core-5 + COVALENT/BIFUNCTIONAL; strongest QUANTUM-VQE cross (transition-metal complexes = the multireference quantum-chemistry problem)"
  implementation = "IMPLEMENTED 2026-05-16 — HEXA-METALLODRUG.tape · metallodrug/module/metallodrug.hexa (__HEXA_BIO_METALLODRUG__ PASS) · _python_bridge/module/metallodrug_coordination_sim.py (__METALLODRUG_COORDINATION__ PASS, 7/7) · metallodrug/spec/coordination_v1.schema.json"
  verify = "hexa verify 🟢 SUPPORTED-NUMERICAL — Griffith-Orgel CFSE closed form (deviation 5.55e-16) + cisplatin Pt–N7(guanine) ~2.0 Å anchor (Takahara 1995, Nature 377:649)"
  scope = "in-silico simulator-consistency only (g8/f2). Described by its own drug precedent, NOT lattice-fit (g3/f1)."

@D axis_oligonucleotide := "OLIGONUCLEOTIDE — expansion-main" :: axis-declaration [active d=2026-05-16]
  axis-id = "OLIGONUCLEOTIDE"
  layer = "expansion-main (NOT core-5)"
  source = "assistant-proposed candidate (2026-05-16 session) — NOT from the 165-option brainstorm. M:1 N:0.85 R:1 S:0.95 F:1 ≈ 4.8 is an ASSISTANT ESTIMATE (README §6 subjective-rubric caveat)."
  modality = "antisense oligonucleotide + siRNA therapeutics — own precedent: nusinersen/Spinraza (ASO, FDA 2016) · patisiran/Onpattro (siRNA, 2018) · inclisiran (2021)"
  rationale = "RNA-domain-adjacent to the RIBOZYME core axis but mechanism-distinct (ASO/siRNA = synthetic oligo drugs recruiting RNase-H / RISC; RIBOZYME = catalytic RNA) — non-overlap <30%, documented in HEXA-OLIGONUCLEOTIDE.tape"
  implementation = "IMPLEMENTED 2026-05-16 — HEXA-OLIGONUCLEOTIDE.tape · oligonucleotide/module/oligonucleotide.hexa (__HEXA_BIO_OLIGONUCLEOTIDE__ PASS) · _python_bridge/module/oligonucleotide_hybridization_sim.py (__OLIGONUCLEOTIDE_HYBRIDIZATION__ PASS, 8/8) · oligonucleotide/spec/hybridization_v1.schema.json"
  verify = "hexa verify 🟢-class SUPPORTED-NUMERICAL — SantaLucia 1998 nearest-neighbor ΔG/ΔH/ΔS + van 't Hoff Tm; Dickerson-dodecamer literature-anchor recompute"
  scope = "in-silico simulator-consistency only (g8/f2). Own drug precedent, NOT lattice-fit (g3/f1)."

# ─── §2 Sub-axis tree (borderline / specialization candidates) ────────

@D sub_under_bifunctional := "sub-axes :> BIFUNCTIONAL" :: decision [active d=2026-05-16]
  parent-axis = "BIFUNCTIONAL (expansion-main)"
  members = ["PROTAC (#30, 4.7) — IMPLEMENTED", "LYTAC (#31, 4.5) — IMPLEMENTED", "AUTAC (#32, 4.3) — IMPLEMENTED", "RIBOTAC (#33, 4.4 — also ?> RIBOZYME core) — IMPLEMENTED", "COVALENT-DEGRADER (#34, 4.4 — also ?> COVALENT) — IMPLEMENTED", "MOLECULAR-GLUE (#28, specialization) — IMPLEMENTED"]
  basis = "source-tagged 'BIFUNCTIONAL sub' (≥30% overlap / specialization, README criterion #2)"
  implementation = "ALL 6 SUB-AXES IMPLEMENTED 2026-05-16 (parity completion). protac_sim.py (__PROTAC__ PASS 6/6, Douglass 2013 + Gadd 2017, ARV-471) · lytac_sim.py (__LYTAC__ PASS 6/6, receptor-mediated endocytosis Wiley 1981/Ghosh 2003, Bertozzi LYTAC research-stage) · autac_sim.py (__AUTAC__ PASS 6/6, autophagic flux Mizushima 2007/Klionsky, Arimoto research-stage) · ribotac_sim.py (__RIBOTAC__ PASS, catalytic RNA-cleavage advantage, Disney research-stage) · covalent_degrader_sim.py (__COVALENT_DEGRADER__ PASS, irreversible engagement coupling) · molecular_glue_sim.py (__MOLECULAR_GLUE__ PASS 7/7, cooperative ternary closed-form with positive+negative-control gate — lenalidomide/thalidomide/indisulam FDA precedent). Each + draft-07 schema + sub-axis note. All 🟢-class SUPPORTED-NUMERICAL."

@D sub_under_quantum := "sub-axes :> QUANTUM (core)" :: decision [active d=2026-05-16]
  parent-axis = "QUANTUM (core-5 — unchanged; subs hang off it as tags, not core mutation)"
  members = ["ALLOSTERIC (#24, 4.4 — QUANTUM ~50% overlap, cryptic-pocket VQE) — IMPLEMENTED", "CRYPTIC-POCKET (#25 — QUANTUM sub) — IMPLEMENTED", "PPI (#27, 4.8 — main-eligible by score BUT QUANTUM-applicability sub tension; recorded as borderline sub) — IMPLEMENTED"]
  basis = "QUANTUM-VQE applicability overlap (README criterion #2 borderline)"
  implementation = "ALL 3 SUB-AXES IMPLEMENTED 2026-05-16. allosteric_sim.py (__ALLOSTERIC__ PASS, MWC two-state allosteric model, maraviroc/asciminib precedent) · cryptic_pocket_sim.py (__CRYPTIC_POCKET__ PASS, conformational-equilibrium open/closed population, KRAS-G12C switch-II) · ppi_sim.py (__PPI__ PASS, Bogan-Thorn 1998 hotspot energetics, venetoclax/navitoclax). Each + draft-07 schema + sub-axis note. All 🟢-class SUPPORTED-NUMERICAL."
  note = "PPI is score-main-eligible (4.8/5/5) — recorded as borderline; user direction places ambiguous ones as sub. Honest tension flagged, not hidden."

@D sub_under_weave := "sub-axes :> WEAVE (core)" :: decision [active d=2026-05-16]
  parent-axis = "WEAVE (core-5 — unchanged)"
  members = ["PEPTIDE (#40, 4.8 — ~30% WEAVE overlap, sub-demotion boundary) — IMPLEMENTED", "MACROCYCLE (#39, 4.5 — strong precedent, WEAVE-adjacent) — IMPLEMENTED"]
  basis = "~30% WEAVE overlap = README criterion #2 demotion boundary"
  implementation = "BOTH SUB-AXES IMPLEMENTED 2026-05-16. peptide_sim.py (__PEPTIDE__ PASS, Zimm-Bragg/Lifson-Roig helix-coil theory, semaglutide GLP-1 precedent) · macrocycle_sim.py (__MACROCYCLE__ PASS, macrocyclization pre-organization entropy, cyclosporine/lorlatinib). Each + draft-07 schema + sub-axis note. All 🟢-class SUPPORTED-NUMERICAL."

@D sub_under_covalent := "sub-axes :> COVALENT (expansion-main)" :: decision [active d=2026-05-16]
  parent-axis = "COVALENT (expansion-main)"
  members = ["REVERSIBLE-COVALENT — IMPLEMENTED 2026-05-16"]
  basis = "specialization of COVALENT: distinguishes reversible (equilibrium) covalent warheads from irreversible ones"
  implementation = "_python_bridge/module/reversible_covalent_sim.py (__REVERSIBLE_COVALENT__ PASS, 6/6) · _python_bridge/spec/reversible_covalent_v1.schema.json · _python_bridge/module/reversible_covalent_subaxis.md. Real-limit anchor: Eyring transition-state theory (Eyring 1935). Own precedent: nirmatrelvir/Paxlovid (reversible-covalent nitrile, SARS-CoV-2 Mpro) vs irreversible ibrutinib/sotorasib. hexa verify 🟢-class SUPPORTED-NUMERICAL."

@D sub_under_ribozyme := "sub-axes :> RIBOZYME (core)" :: decision [active d=2026-05-16]
  parent-axis = "RIBOZYME (core-5 — unchanged; subs hang off it, not a core mutation)"
  members = ["RNA-TARGETING-SMALL-MOLECULE — IMPLEMENTED 2026-05-16", "APTAMER — IMPLEMENTED 2026-05-16"]
  basis = "both specialize the parent's RNA secondary-structure modeling: RNA-TARGETING-SMALL-MOLECULE = small molecules that shift the RNA structural ensemble; APTAMER = non-catalytic structured-oligo binders (k_cat=0)"
  implementation = "RNA-TARGETING-SMALL-MOLECULE — _python_bridge/module/rna_targeting_small_molecule_sim.py (__RNA_TARGETING_SMALL_MOLECULE__ PASS, 4/4; imports parent ribozyme_mfe_nussinov, no fork — f3) · ribozyme/spec/rna_targeting_small_molecule_v1.schema.json + _subaxis.md. Own precedent: risdiplam/Evrysdi (SMN2 splicing, FDA 2020). APTAMER — _python_bridge/module/aptamer_affinity_sim.py (__APTAMER_AFFINITY__ PASS, 4/4) · ribozyme/spec/aptamer_affinity_v1.schema.json + aptamer_subaxis.md. Own precedent: pegaptanib/Macugen (RNA aptamer, FDA 2004). Both hexa verify 🟢-class SUPPORTED-NUMERICAL."

@D sub_under_virocapsid := "sub-axes :> VIROCAPSID (core)" :: decision [active d=2026-05-16]
  parent-axis = "VIROCAPSID (core-5 — unchanged)"
  members = ["CAPSID-ASSEMBLY-MODULATOR — IMPLEMENTED 2026-05-16"]
  basis = "specializes the parent's Caspar-Klug geometry + Zlotnick assembly thermodynamics toward INHIBITION (a modulator perturbs the per-contact free energy → kinetic-trap / mis-assembly regime)"
  implementation = "_python_bridge/module/capsid_assembly_modulator_sim.py (__CAPSID_ASSEMBLY_MODULATOR__ PASS, 7/7) · virocapsid/spec/capsid_assembly_modulator_v1.schema.json + _subaxis.md. Real-limit anchors: Caspar-Klug T-number geometry (Caspar & Klug 1962, exact) + Zlotnick weak-contact / kinetic-trap thermodynamics (Zlotnick 1994/2003). Own precedent: lenacapavir/Sunlenca (HIV-1 capsid inhibitor, FDA 2022). hexa verify 🟢-class SUPPORTED-NUMERICAL."

@N theranostic_status := "THERANOSTIC — not placed" :: note [d=2026-05-16 active]
  text = "THERANOSTIC (#51, 4.7) is NOT a sub of any core axis (radioligand is a distinct modality) AND not registered expansion-main here: its CDER+CDRH scope mix (S=0.8) is the README's flagged drug-only-discipline disqualifier. Status: main-eligible-by-modality but scope-deferred — left UNPLACED pending the scope question (honest, not forced into the tree)."

@N genetic_medicine_status := "GENETIC-MEDICINE — not placed (CBER scope)" :: note [d=2026-05-16 active]
  text = "GENETIC-MEDICINE (gene therapy / cell therapy / mRNA — own precedent: Zolgensma · Casgevy · Comirnaty) is NOT registered as an expansion axis and NOT code-implemented: gene/cell therapy and mRNA products are CBER-regulated biologics, failing the README drug-only (CDER) discipline criterion #4. Status: scope-disqualified — left UNPLACED (honest; implementing a CBER-scope code axis would breach g8 + criterion #4). The repo's crispr-gene-editing/ and crispr-cas13-poc-diagnostic/ directories exist as project domains but do NOT make GENETIC-MEDICINE a drug-axis."

@N adc_status := "ADC — not placed (CBER antibody scope)" :: note [d=2026-05-16 active]
  text = "ADC (antibody-drug conjugate — own precedent: trastuzumab deruxtecan/Enhertu · trastuzumab emtansine/Kadcyla) is NOT registered and NOT code-implemented: the antibody component is a CBER biologic, a drug-only/CDER-discipline breach (criterion #4). Honest tension: the small-molecule payload + linker chemistry is CDER-class, but the conjugate as a whole is CBER-regulated. Status: scope-flagged — left UNPLACED."

# ─── §2.5 Cross-axis integrations (USER DIRECTION 2026-05-16) ──────────

@D cross_axis_integrations := "expansion-layer × core/expansion cross-axis bridges" :: decision [active d=2026-05-16]
  basis = "an axis's value is in cross-axis use; these 5 deterministic bridges connect a new axis to an existing one. Each imports both sides' sims (no fork — f3), is wired into selftest/run_all.sh, and reaches hexa verify 🟢-class SUPPORTED-NUMERICAL (or honest 🟠 DEFERRED for an external-substrate hand-off)."
  A1 = "METALLODRUG → QUANTUM VQE — _python_bridge/module/metallodrug_quantum_vqe_cross.py (__METALLODRUG_QUANTUM_VQE_CROSS__ PASS 8/8) + metallodrug/spec/quantum_vqe_cross_v1.schema.json. Exact (2e,2o) CI shows E_corr<0 for a near-degenerate metal d-manifold ⇒ multireference ⇒ the QUANTUM VQE pipeline's object. Live VQE dispatch = honest DEFER (🟠, external substrate, g7)."
  A2 = "OLIGONUCLEOTIDE off-target × RIBOZYME GENCODE pool — _python_bridge/module/oligonucleotide_offtarget_gencode_cross.py (__OLIGONUCLEOTIDE_OFFTARGET_GENCODE_CROSS__ PASS 8/8) + oligonucleotide/spec/offtarget_gencode_cross_v1.schema.json. SantaLucia NN ΔG screen vs the vendored GENCODE v47 ~200-transcript SUBSET (read-only, g11); honest — subset, not genome-wide."
  A3 = "RNA-TARGETING-SMALL-MOLECULE vs OLIGONUCLEOTIDE — SMN2 modality comparison — _python_bridge/module/rna_modality_comparison_smn2_cross.py (__RNA_MODALITY_COMPARISON_SMN2_CROSS__ PASS 6/6) + _python_bridge/spec/rna_modality_comparison_smn2_cross_v1.schema.json. risdiplam-like vs nusinersen-like on SMN2 exon-7; schema consts comparison_is_ranking=false / signals_commensurable=false — a comparison, NOT an efficacy ranking (both FDA-approved)."
  A4 = "CAPSID-ASSEMBLY-MODULATOR × VIROCAPSID PDB corpus — _python_bridge/module/capsid_modulator_pdb_anchor_cross.py (__CAPSID_MODULATOR_PDB_ANCHOR_CROSS__ PASS 8/8) + virocapsid/spec/capsid_modulator_pdb_anchor_cross_v1.schema.json. 527 VIPERdb capsids: 515 get a Caspar-Klug T-number; 12 Retroviridae (HIV-1 etc.) get honest 'T-number N/A — non-icosahedral fullerene cone', NOT a fabricated T."
  A5 = "REVERSIBLE-COVALENT × mpro warhead VQE — _python_bridge/module/reversible_covalent_mpro_vqe_cross.py (__REVERSIBLE_COVALENT_MPRO_VQE_CROSS__ PASS 6/6) + _python_bridge/spec/reversible_covalent_mpro_vqe_cross_v1.schema.json. 5 warhead ΔE_rxn → Eyring koff → residence time → reversibility class; every row illustrative_only=true (qualitative input, barrier-proxy is a modeling choice, no live VQE)."
  scope = "in-silico simulator-consistency only (g8/f2). A cross-axis bridge is NOT a new axis and NOT a core mutation — core-5 (../AXIS.tape) UNCHANGED. No n=6-lattice derivation (f_lattice_fit)."

# ─── §2.6 Second-round cross-axis (F1-F3, USER DIRECTION 2026-05-16) ──

@D cross_axis_round2 := "F1-F3 cross-axis bridges to NANOBOT and WEAVE" :: decision [active d=2026-05-16]
  basis = "round-2 cross-axis: connect expansion-layer axes to the previously-uncrossed core axes (NANOBOT, WEAVE). Each imports both sides' sims (no fork — f3); each carries a passing sentinel + draft-07 schema."
  F1 = "OLIGONUCLEOTIDE × NANOBOT — _python_bridge/module/oligonucleotide_nanobot_cross.py (__OLIGONUCLEOTIDE_NANOBOT_CROSS__ PASS) + _python_bridge/spec/oligonucleotide_nanobot_cross_v1.schema.json. DNA-origami staple strands ARE oligos; SantaLucia NN duplex thermodynamics bound NANOBOT (DNA-nanotech) assembly. Rothemund 2006 origami precedent."
  F2 = "APTAMER × NANOBOT — _python_bridge/module/aptamer_nanobot_cross.py (__APTAMER_NANOBOT_CROSS__ PASS) + _python_bridge/spec/aptamer_nanobot_cross_v1.schema.json. Aptamer folding-ΔG + Langmuir-Kd computes the ligand-triggered gating state of an aptamer-gated DNA nanodevice — APTAMER as the NANOBOT actuation trigger."
  F3 = "CAPSID-ASSEMBLY-MODULATOR × WEAVE — _python_bridge/module/capsid_modulator_weave_cross.py (__CAPSID_MODULATOR_WEAVE_CROSS__ PASS) + _python_bridge/spec/capsid_modulator_weave_cross_v1.schema.json. Both sides use Caspar-Klug + Zlotnick; honest side-by-side of natural protein-capsid vs designed-cage assembly under the same ΔG_contact perturbation. Comparison reports magnitudes only — NOT a superiority verdict."
  scope = "in-silico simulator-consistency only (g8/f2). A cross-axis bridge is NOT a new axis; core-5 UNCHANGED. No n=6-lattice derivation (f_lattice_fit)."

# ─── §2.7 Falsifier execution gate (B2, USER DIRECTION 2026-05-16) ────

@D falsifier_gate := "execute declared falsifiers, not just declare them" :: decision [active d=2026-05-16]
  basis = "Per-axis tapes (HEXA-METALLODRUG, HEXA-OLIGONUCLEOTIDE) declare F-METALLODRUG-1/2/3 and F-OLIGO-1/2/3 falsifiers in their @D blocks. Until 2026-05-16 these were declared but never ACTUALLY EXECUTED. The gate scans the root tapes, parses the @D falsifier entries, runs the corresponding axis sim, and verifies each preregistered condition HOLDS."
  implementation = "selftest/falsifier_execution_gate.py (__FALSIFIER_EXECUTION_GATE__ PASS). 6 declared falsifiers executed: F-METALLODRUG-1 (CFSE recompute fidelity ≤1e-9 vs Griffith-Orgel) HOLD · F-METALLODRUG-2 (Pt–N7 bond length in 1.85–2.15 Å) HOLD · F-METALLODRUG-3 (d8 / no-lattice-derivation) HOLD · F-OLIGO-1 (Dickerson dodecamer ΔH°/ΔS°/Tm in SantaLucia regime) HOLD · F-OLIGO-2 (GC>AT Tm + ΔG° length monotonicity) HOLD · F-OLIGO-3 (off-target hybridization ΔG-detectable) HOLD."
  contract = "absent tape/sim ⇒ per-falsifier SKIP (g7 — honest), non-blocking; only a genuine FALSIFIED blocks the sentinel. All HOLDs reported with their real-limit anchor citation. PASS scope = in-silico simulator-consistency, not a therapeutic claim (g8)."

# ─── §2.8 Round-3 cross-axis (G1-G5, USER DIRECTION 2026-05-16) ───────

@D cross_axis_round3 := "G1-G5 expansion-layer × expansion-layer unifications" :: decision [active d=2026-05-16]
  basis = "round-3 cross-axis: pair NEW sub-axes against each other where shared mathematical structure makes an honest cross meaningful. Each imports both sims (no fork — f3); each carries a passing sentinel + draft-07 schema; each is honesty-fenced (comparison ≠ ranking; mathematical-equivalence ≠ mechanistic-equivalence)."
  G1 = "PROTAC × CAPSID-ASSEMBLY-MODULATOR — _python_bridge/module/protac_capsid_modulator_cross.py (__PROTAC_CAPSID_MODULATOR_CROSS__ PASS 8/8) + _python_bridge/spec/protac_capsid_modulator_cross_v1.schema.json. PROTAC hook-effect vs CAM Zlotnick kinetic-trap — same mass-action+cooperativity math, very different biology. Units kept disjoint (|log10(α)| decades vs |Δg_contact| kcal/mol — never summed). K_d,ternary = K_d(E3)/α identity preserved."
  G2 = "ALLOSTERIC × CRYPTIC-POCKET — _python_bridge/module/allosteric_cryptic_pocket_cross.py (__ALLOSTERIC_CRYPTIC_POCKET_CROSS__ PASS 7/7) + _python_bridge/spec/allosteric_cryptic_pocket_cross_v1.schema.json. Map R↔open, T↔closed: MWC two-state and cryptic-pocket open/closed populations coincide (P_R = P_open, rel-err <1e-12). A cryptic-pocket binder IS an MWC R-state stabilizer — model-level unification (asciminib allosteric; sotorasib/KRAS-G12C cryptic)."
  G3 = "PPI × MOLECULAR-GLUE — _python_bridge/module/ppi_molecular_glue_cross.py (__PPI_MOLECULAR_GLUE_CROSS__ PASS 6/6) + _python_bridge/spec/ppi_molecular_glue_cross_v1.schema.json. PPI disruption and glue creation share the energetic ledger: Bogan-Thorn hotspot ΔG → K_PPI_effective → α-ladder threshold for glue-signature. Hotspot-rich BH3 grooves clear at α≈10; hotspot-poor KIX shallow groove fails at α>5000. α-floor monotonic with hotspot energy (the discriminating signature)."
  G4 = "PEPTIDE × MACROCYCLE — _python_bridge/module/peptide_macrocycle_cross.py (__PEPTIDE_MACROCYCLE_CROSS__ PASS 16/16) + _python_bridge/spec/peptide_macrocycle_cross_v1.schema.json. Linear (Zimm-Bragg 1959) vs cyclic (Jacobson-Stockmayer 1950) pre-organization on a peptide-length panel N∈{6,8,10,12,14}: cyclization advantage 1.21→2.83 kcal/mol monotonic. semaglutide vs cyclosporine/lorlatinib — schema consts comparison_is_ranking=false, signals_commensurable=false (both blockbuster modalities; not a winner)."
  G5 = "APTAMER × OLIGONUCLEOTIDE — _python_bridge/module/aptamer_oligonucleotide_cross.py (__APTAMER_OLIGONUCLEOTIDE_CROSS__ PASS 9/9) + _python_bridge/spec/aptamer_oligonucleotide_cross_v1.schema.json. Shared SantaLucia 1998 NN backbone, mechanism-distinct outputs: hybridization Tm (sequence-driven, °C) vs target-binding Kd (shape-driven, nM, k_cat=0). Schema consts enforce non-rankability."
  scope = "in-silico simulator-consistency only (g8/f2). A cross-axis bridge is NOT a new axis — core-5 (../AXIS.tape) UNCHANGED. No n=6-lattice derivation (f_lattice_fit). Mathematical equivalence ≠ mechanistic equivalence is the honest fence."

# ─── §2.9 Sub-axis hexa axis-verb parity (H2a+H2b, 2026-05-16) ────────

@D sub_axis_hexa_verbs := "15 sub-axis hexa axis-verbs added — parity completion" :: decision [active d=2026-05-16]
  basis = "the expansion-MAIN axes (METALLODRUG, OLIGONUCLEOTIDE, COVALENT, BIFUNCTIONAL) each have a hexa axis-verb module; the 15 declared sub-axes had only Python sims. This parity round adds a `.hexa` announce/status verb for each — the Python sim remains the source of truth (no logic duplication). Each verb prints sub-axis name + parent + own drug precedent + real-limit anchor citation + lattice-stance + g8/f2 in-silico-only caveat + sentinel."
  bifunctional_subs = "protac/module/protac.hexa · lytac/module/lytac.hexa · autac/module/autac.hexa · ribotac/module/ribotac.hexa · covalent_degrader/module/covalent_degrader.hexa · molecular_glue/module/molecular_glue.hexa (each __HEXA_BIO_<NAME>__ PASS)"
  quantum_subs = "allosteric/module/allosteric.hexa · cryptic_pocket/module/cryptic_pocket.hexa · ppi/module/ppi.hexa (placement-honesty tension flagged openly per g3 — main-eligible by score but sub by user direction). Each __HEXA_BIO_<NAME>__ PASS."
  weave_subs = "peptide/module/peptide.hexa · macrocycle/module/macrocycle.hexa (each __HEXA_BIO_<NAME>__ PASS)"
  ribozyme_subs = "rna_targeting_small_molecule/module/rna_targeting_small_molecule.hexa · aptamer/module/aptamer.hexa (each __HEXA_BIO_<NAME>__ PASS)"
  virocapsid_subs = "capsid_assembly_modulator/module/capsid_assembly_modulator.hexa (__HEXA_BIO_CAPSID_ASSEMBLY_MODULATOR__ PASS)"
  covalent_subs = "reversible_covalent/module/reversible_covalent.hexa (__HEXA_BIO_REVERSIBLE_COVALENT__ PASS)"
  scope = "axis-verb is announce/status only — the Python sim is the source of truth (g1 anchor + computational verify). No raw#N/own#N tokens."

# ─── §2.10 Falsifier-gate coverage expansion (H3, 2026-05-16) ─────────

@D falsifier_gate_expanded := "falsifier execution gate covers COVALENT + BIFUNCTIONAL" :: decision [active d=2026-05-16]
  basis = "B2 (2026-05-16 earlier) built the falsifier execution gate scanning HEXA-METALLODRUG.tape + HEXA-OLIGONUCLEOTIDE.tape (6 falsifiers). This expansion (H3) extends coverage to HEXA-COVALENT.tape + HEXA-BIFUNCTIONAL.tape — 6 additional falsifiers, all HOLD. Total falsifier coverage: 6 → 12."
  added_covalent = "F-COVALENT-1 (kinact/Ki two-way recompute, max rel-err 1.1e-16) HOLD · F-COVALENT-2 (every kinact strictly below Eyring kB·T/h ceiling — INDEPENDENTLY recomputed from CODATA 2019 = 6.459e12/s at 310 K, NOT trusted from the sim) HOLD · F-COVALENT-3 (no-lattice-derivation honesty) HOLD."
  added_bifunctional = "F-BIFUNCTIONAL-1 (α-monotonicity: 5-point α scan shows peak-ternary monotone non-decreasing; mass-action [0,total]) HOLD · F-BIFUNCTIONAL-2 (hook-effect interior-max: 50-dose scan low 0.001 → peak 0.748 µM at dose 1.0 µM → high 0.005 µM, rising+falling arms + high-dose binary saturation all confirmed) HOLD · F-BIFUNCTIONAL-3 (no-lattice-derivation honesty) HOLD."
  scope = "in-silico simulator-consistency only (g8/f2). Independent re-derivation of the Eyring prefactor from CODATA 2019 is the key honesty feature — the gate does NOT trust the sim's own value blindly; it cross-checks. g7 SKIP path honored — absent tape/sim ⇒ per-falsifier SKIP, not FAIL."

# ─── §2.11 Round-4 cross-axis (J1-J3, USER DIRECTION 2026-05-16) ──────

@D cross_axis_round4 := "J1-J3 — matrix-fill cross-axis bridges" :: decision [active d=2026-05-16]
  basis = "round-4 cross: fill remaining meaningful cross-axis bridges with sub-axes from very different domains. Each imports both sims (f3); each carries passing sentinel + draft-07 schema; each honesty-fenced."
  J1 = "METALLODRUG × RIBOTAC — _python_bridge/module/metallodrug_ribotac_cross.py (__METALLODRUG_RIBOTAC_CROSS__ PASS 8/8). Same outcome (RNA degradation), opposite mechanism class: Pt(II) coordination adduct (stoichiometric, Pt-N7 ~2.0 Å) vs RNase-L recruitment (catalytic multi-turnover, N=29-180). Mechanism-disjoint — sum refused."
  J2 = "AUTAC × CRYPTIC-POCKET — _python_bridge/module/autac_cryptic_pocket_cross.py (__AUTAC_CRYPTIC_POCKET_CROSS__ PASS 7/7). degradation_rate_ceiling = P_open · autophagic_flux. KRAS-G12C switch-II (P_open≈0.0055) gates AUTAC at ~180× reduction; bound is model upper bound, NOT a quantitative degradation prediction (AUTAC research-stage)."
  J3 = "MOLECULAR-GLUE × ALLOSTERIC — _python_bridge/module/molecular_glue_allosteric_cross.py (__MOLECULAR_GLUE_ALLOSTERIC_CROSS__ PASS 9/9). Staged ledger: ΔG_stage1 (allosteric R-state stabilization on E3) + ΔG_stage2 (cooperative ternary closure). lenalidomide-IKZF1: ΔG_total=−2.15 kcal/mol; Petzold 2016 lenalidomide-CRBN remodeling."
  scope = "in-silico simulator-consistency only (g8/f2). Cross ≠ new axis. Core-5 UNCHANGED."

# ─── §2.12 Infrastructure/quality gates (I2 + I3 + K2 + B2-expanded) ──

@D infra_gates := "selftest infrastructure / quality assurance gates" :: decision [active d=2026-05-16]
  determinism_regression = "selftest/determinism_regression_gate.py — runs each of 32 enumerated sims twice with PYTHONHASHSEED=0/DONTWRITEBYTECODE=1, asserts byte-identical stdout. 32 DETERMINISTIC · 0 NON_DETERMINISTIC · 0 SKIP. wall 52.58s. __DETERMINISM_REGRESSION_GATE__ PASS."
  hexa_verify_tier = "selftest/hexa_verify_tier_batch.py — TIER REPORTER (not enforcer) for 44-sim roster: 🟢 SUPPORTED-NUMERICAL 42 · 🔵 SUPPORTED-FORMAL 1 (lean4_proof_witness_emit) · 🟠 DEFERRED 1 (metallodrug_quantum_vqe_cross live-VQE handoff) · 0 FALSIFIED. 3-precedence classification: SKIP → self-declared glyph → real-limit-anchor heuristic; silent fall-through honestly 🟠 (no tier inflation). __HEXA_VERIFY_TIER_BATCH__ PASS."
  external_governance = "selftest/external_governance_cross_check.py — scans 115 @X external-citation entries across 11 tapes. 18 PRESENT · 0 MISSING-PATH · 3 URL-SKIP (offline-no-network honest) · 94 NO-TARGET (bibliographic refs). COEXIST AGENTS.tape+AGENTS.md contract verified. __EXTERNAL_GOVERNANCE_CROSS_CHECK__ PASS."
  scope = "g1 honest documentation/determinism/tier integrity checks; g7 SKIP-not-FAIL for offline-only/absent-dep; g8 in-silico scope."

# ─── §2.13 Per-disease case studies (L1 HIV-1 + L2 SMA) ────────────────

@D case_studies := "one-disease in-silico pilots (NOT the 200-disease deferred work)" :: decision [active d=2026-05-16]
  basis = "compose existing sims for real FDA-approved drugs against one disease at a time. The deferred 200-disease re-mapping per HIERARCHY.tape Log remains DEFERRED — these pilots are honest one-disease compositions, not its replacement."
  L1_hiv1 = "case_studies/hiv1_portfolio/ — 2 IN-SCOPE CDER drugs: lenacapavir (Sunlenca 2022) → CAPSID-ASSEMBLY-MODULATOR :> VIROCAPSID; maraviroc (Selzentry 2007, NAM) → ALLOSTERIC :> QUANTUM. RESEARCH-STAGE NEGATIVES honestly listed: anti-HIV ASOs (no FDA approval) · HIV-PROTACs (no FDA approval) · gene-editing curatives (CBER, UNPLACED per criterion #4). Cross-axis touch-points cited: A4 (HIV-1 honest T-N/A) + G2 (MWC ≡ cryptic). __HIV1_PORTFOLIO__ PASS 10/10."
  L2_sma = "case_studies/sma_portfolio/ — 3 FDA-approved drugs for one disease (rare): risdiplam (Evrysdi 2020) → RNA-TARGETING-SM :> RIBOZYME (IN-SCOPE); nusinersen (Spinraza 2016) → OLIGONUCLEOTIDE (IN-SCOPE); onasemnogene abeparvovec (Zolgensma 2019) → GENETIC-MEDICINE (CBER, UNPLACED — schema-const enforced axis=null, no fake CBER coverage). Cross-axis touch-point: A3 (SMN2 modality comparison). __SMA_PORTFOLIO__ PASS 6/6."
  scope = "in-silico simulator+metadata consistency only (g8/f2). NEVER a clinical, therapeutic, efficacy, regulatory, or portfolio-recommendation claim. UNPLACED handling is structurally honest (axis=null as schema const) — same pattern in both case studies."

# ─── §3 External citations ────────────────────────────────────────────

@X x_axis_core := "AXIS.tape (core-5 SSOT)" :: sibling-tape [active]
  path = "../AXIS.tape"
  scope = "the committed 5-axis structural SSOT — UNCHANGED by this expansion layer; this file cross-links, never mutates it"

@X x_readme := "AXIS/README.md (governed/rigorous)" :: doc [active]
  path = "./README.md"
  scope = "§4 keep-5 recommendation (the rigorous dissent this user-direction overrides; preserved verbatim there)"

@X x_brainstorm := "axis-expansion brainstorm (165 options)" :: doc [d=2026-05-08 active]
  path = "../docs/hexa_bio_axis_expansion_brainstorm_2026_05_08.md"
  scope = "source of the scores / promotion criteria / the #95·#103 borderline-complexity caveats"

@X x_agents_tape := "AGENTS.tape governance" :: governance [active]
  path = "../AGENTS.tape"
  scope = "g1 real-limits · g2 lattice-is-tool · g3 honesty-external · g8 in-silico-only · f1/f_lattice_fit"

@X x_lattice_policy := "echoes/LATTICE_POLICY.md" :: policy [active]
  url = "https://github.com/dancinlab/echoes/blob/main/LATTICE_POLICY.md"

# ─── §4 Log ───────────────────────────────────────────────────────────

## Log

- 2026-05-16 — AXIS/HIERARCHY.tape created per explicit USER DIRECTION:
  register COVALENT + BIFUNCTIONAL as expansion-MAIN axes; operate
  borderline candidates as SUB-axes (PROTAC/LYTAC/AUTAC/RIBOTAC/glue/
  covalent-degrader :> BIFUNCTIONAL · ALLOSTERIC/CRYPTIC/PPI :> QUANTUM ·
  PEPTIDE/MACROCYCLE :> WEAVE). THERANOSTIC left UNPLACED (scope-mix
  deferred, honest). This is a SEPARATE governed expansion layer —
  ../AXIS.tape core-5 SSOT UNCHANGED, cross-linked. It OVERRIDES
  AXIS/README.md §4 'keep-5' recommendation at user instruction; the
  rigorous dissent (§4 + brainstorm #95/#103 borderline) is PRESERVED
  verbatim (@N rigorous_dissent), not erased. No lattice derivation
  (f_lattice_fit); in-silico-only scope (g8); external modalities by own
  precedent (g3/f1). Decision recorded — NOT a feasibility/clinical
  claim; no disease re-mapping / falsifier redefinition executed by this
  record (those remain deferred work if/when the core ever expands).
- 2026-05-16 — **2nd USER DIRECTION: register + IMPLEMENT 6 further
  expansion-layer axes.** New expansion-main: METALLODRUG · OLIGONUCLEOTIDE
  (both with HEXA-<AXIS>.tape + axis-verb .hexa module + deterministic
  real-limits Python bridge + output schema). New sub-axes: REVERSIBLE-
  COVALENT (:> COVALENT) · RNA-TARGETING-SMALL-MOLECULE + APTAMER
  (:> RIBOZYME) · CAPSID-ASSEMBLY-MODULATOR (:> VIROCAPSID) — each a
  deterministic real-limits Python bridge + schema + sub-axis note. All 6
  carry a passing sentinel and are wired into selftest/run_all.sh; each
  reaches the hexa verify 🟢-class SUPPORTED-NUMERICAL tier (deterministic
  numerical recompute matching a cited real limit). Honesty: METALLODRUG/
  OLIGONUCLEOTIDE were assistant-proposed (2026-05-16 session), NOT from
  the 165-option brainstorm — their M/N/R/S/F scores are assistant
  estimates (README §6 subjective-rubric caveat), not source-transcribed.
  GENETIC-MEDICINE + ADC were also proposed but are CBER-scope-disqualified
  (criterion #4 drug-only/CDER) — left UNPLACED, no code axis (honest;
  THERANOSTIC precedent). Core-5 (../AXIS.tape) UNCHANGED; README §4
  keep-5 dissent still PRESERVED. No n=6-lattice derivation (f_lattice_fit);
  in-silico-only scope (g8/f2); external modalities by own drug precedent
  (g3/f1). Implemented — NOT a feasibility/clinical claim; no disease
  re-mapping / falsifier redefinition executed.
- 2026-05-16 — **5 cross-axis integrations added** (§2.5; USER DIRECTION
  "A1–A5 all go"). Deterministic bridges connecting a new expansion-layer
  axis to an existing core/expansion axis: A1 METALLODRUG→QUANTUM VQE ·
  A2 OLIGONUCLEOTIDE off-target×RIBOZYME GENCODE pool · A3 RNA-TARGETING-
  SMALL-MOLECULE vs OLIGONUCLEOTIDE SMN2 modality comparison · A4 CAPSID-
  ASSEMBLY-MODULATOR×VIROCAPSID PDB corpus · A5 REVERSIBLE-COVALENT×mpro
  warhead VQE.
- 2026-05-16 — **expansion-layer code-parity completion + round-2 cross
  + falsifier gate** (USER DIRECTION "all bg go"). The 1st USER DIRECTION
  axes (COVALENT, BIFUNCTIONAL) were registration-only — brought to code
  parity with METALLODRUG: HEXA-COVALENT.tape + covalent/module/.hexa +
  covalent_inhibition_sim.py (Strelow 2017 kinact/Ki + Eyring 1935);
  HEXA-BIFUNCTIONAL.tape + bifunctional/module/.hexa +
  bifunctional_ternary_complex_sim.py (Douglass 2013 + Gadd 2017 + the
  hook-effect bell curve). ALL 11 declared sub-axes implemented: PROTAC ·
  LYTAC · AUTAC · RIBOTAC · COVALENT-DEGRADER · MOLECULAR-GLUE (:>
  BIFUNCTIONAL) · ALLOSTERIC · CRYPTIC-POCKET · PPI (:> QUANTUM core) ·
  PEPTIDE · MACROCYCLE (:> WEAVE core) — each a deterministic
  stdlib-only sim + draft-07 schema + sub-axis note, sentinel PASS, 🟢
  SUPPORTED-NUMERICAL. Round-2 cross-axis bridges (§2.6): F1
  OLIGONUCLEOTIDE×NANOBOT · F2 APTAMER×NANOBOT · F3 CAPSID-MODULATOR×
  WEAVE — connecting the previously-uncrossed NANOBOT and WEAVE cores
  to the expansion layer. Falsifier execution gate (§2.7): the 6
  declared falsifiers (F-METALLODRUG-1/2/3 + F-OLIGO-1/2/3) are now
  ACTUALLY EXECUTED and HOLD. All 17 new gates wired into
  selftest/run_all.sh. Honesty cohort 69/69 PASS. Core-5
  (../AXIS.tape) UNCHANGED; README §4 keep-5 dissent preserved.
  in-silico-only (g8/f2); modalities by own precedent (g3/f1); no
  n=6-lattice derivation (f_lattice_fit). 200-disease re-mapping +
  THERANOSTIC/GENETIC-MEDICINE/ADC scope-disqualified entries remain
  honestly UNPLACED — not implemented as code axes.
- 2026-05-16 — **Round-3 cross-axis + sub-axis hexa parity + falsifier
  gate expansion** (USER DIRECTION "all bg go", 8 bg agents).
  §2.8 round-3 cross (G1-G5): PROTAC×CAPSID-MODULATOR (mass-action ∩
  Zlotnick) · ALLOSTERIC×CRYPTIC-POCKET (MWC ≡ open/closed mapping) ·
  PPI×MOLECULAR-GLUE (Bogan-Thorn hotspot ⇒ glue α-floor) ·
  PEPTIDE×MACROCYCLE (Zimm-Bragg vs Jacobson-Stockmayer) ·
  APTAMER×OLIGO (shared SantaLucia, mechanism-distinct). All sentinel
  PASS; honesty fences enforced (math-equiv ≠ mech-equiv; comparison
  ≠ ranking; schema consts where applicable).
  §2.9 sub-axis hexa-verb parity (H2a+H2b): 15 sub-axis .hexa announce/
  status verbs added — full main+sub parity. Sim remains source of
  truth; verb prints precedent + real-limit + lattice stance +
  honesty caveat + sentinel.
  §2.10 falsifier-gate expansion (H3): coverage 6 → 12 falsifiers
  (added F-COVALENT-1/2/3 + F-BIFUNCTIONAL-1/2/3, all HOLD). The
  Eyring prefactor is INDEPENDENTLY re-derived from CODATA 2019 inside
  the gate — sim values not trusted blindly. All 20 new gates wired
  into selftest/run_all.sh. Honesty cohort still 69/69. core-5 unchanged.
- 2026-05-16 — **Round-4 cross + infra/quality gates + 2 disease case
  studies + THERANOSTIC scope-resolution doc** (USER DIRECTION "all bg
  go", 9 bg agents launched — 8 completed, 1 (HIV-1 portfolio)
  rebuilt locally after content-filter false-positive). §2.11 round-4
  cross J1-J3 (METALLODRUG×RIBOTAC · AUTAC×CRYPTIC-POCKET · GLUE×
  ALLOSTERIC) — mechanism-disjoint J1 + research-stage-honest J2 +
  staged-ledger J3. §2.12 infra gates: determinism-regression (32
  sims byte-identical) · hexa-verify-tier reporter (44 sims: 42 🟢 +
  1 🔵 + 1 🟠 + 0 🔴) · external-governance cross-check (115 @X
  entries, 18 PRESENT + 0 MISSING + 3 URL-SKIP + 94 bibliographic).
  §2.13 case studies: HIV-1 portfolio (lenacapavir + maraviroc IN-
  SCOPE + 3 research-stage / CBER negatives honestly listed) + SMA
  portfolio (risdiplam + nusinersen IN-SCOPE + Zolgensma UNPLACED
  with schema-const axis=null). AXIS/THERANOSTIC_SCOPE.md added —
  260-line honest scope-resolution document presenting FOR (5 points)
  + AGAINST (5 points) + DEFERRED resolution; document does NOT
  decide, HIERARCHY UNPLACED status remains in force until USER
  picks. Total falsifier coverage now 12; total gates wired in
  run_all.sh +11. Cohort still 69/69 PASS. Core-5 UNCHANGED;
  README §4 keep-5 dissent preserved. 200-disease re-mapping
  remains DEFERRED. Each imports both sides' sims (no fork — f3), carries a
  passing sentinel, is wired into selftest/run_all.sh, and reaches hexa
  verify 🟢-class SUPPORTED-NUMERICAL (A1's live-VQE hand-off honestly
  🟠 DEFERRED). Honesty preserved throughout: A3 is a comparison NOT a
  ranking (both drugs FDA-approved); A4 refuses to force HIV-1's
  fullerene-cone capsid into a Caspar-Klug T-number (12 honest N/A);
  A5 propagates the qualitative-input caveat (illustrative_only). A
  cross-axis bridge is NOT a new axis — core-5 (../AXIS.tape) UNCHANGED;
  in-silico-only (g8/f2); no n=6-lattice derivation (f_lattice_fit)."
