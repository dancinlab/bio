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
  brief = "expansion-main {COVALENT · BIFUNCTIONAL · METALLODRUG · OLIGONUCLEOTIDE} + sub-axis tree; METALLODRUG/OLIGONUCLEOTIDE + 4 sub-axes IMPLEMENTED (code + hexa-verify, 2026-05-16); recorded per USER DIRECTION; AXIS.tape core-5 UNCHANGED"
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
  scope = "in-silico simulator-consistency only (g8/f2). Described by its own drug precedent, NOT lattice-fit (g3/f1)."

@D axis_bifunctional := "BIFUNCTIONAL — expansion-main" :: axis-declaration [active d=2026-05-16]
  axis-id = "BIFUNCTIONAL"
  layer = "expansion-main (NOT core-5)"
  source-score = "4.9 · M:1 N:0.9 R:1 S:1 F:1 · 5/5 (#28 MOLECULAR-GLUE / #29 BIFUNCTIONAL)"
  modality = "bifunctional / molecular-glue degraders — own precedent: PROTAC (ARV-471/110 clinical) · lenalidomide/thalidomide (CRBN molecular glue) · RIBOTAC (RNA-degrader, research)"
  rationale = "5/5 · non-overlapping · mega-axis with its own sub-tree; RIBOTAC crosses RIBOZYME (core)"
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
  members = ["PROTAC (#30, 4.7)", "LYTAC (#31, 4.5)", "AUTAC (#32, 4.3)", "RIBOTAC (#33, 4.4 — also ?> RIBOZYME core)", "COVALENT-DEGRADER (#34, 4.4 — also ?> COVALENT)", "MOLECULAR-GLUE (#28, specialization)"]
  basis = "source-tagged 'BIFUNCTIONAL sub' (≥30% overlap / specialization, README criterion #2)"

@D sub_under_quantum := "sub-axes :> QUANTUM (core)" :: decision [active d=2026-05-16]
  parent-axis = "QUANTUM (core-5 — unchanged; subs hang off it as tags, not core mutation)"
  members = ["ALLOSTERIC (#24, 4.4 — QUANTUM ~50% overlap, cryptic-pocket VQE)", "CRYPTIC-POCKET (#25 — QUANTUM sub)", "PPI (#27, 4.8 — main-eligible by score BUT QUANTUM-applicability sub tension; recorded as borderline sub)"]
  basis = "QUANTUM-VQE applicability overlap (README criterion #2 borderline)"
  note = "PPI is score-main-eligible (4.8/5/5) — recorded as borderline; user direction places ambiguous ones as sub. Honest tension flagged, not hidden."

@D sub_under_weave := "sub-axes :> WEAVE (core)" :: decision [active d=2026-05-16]
  parent-axis = "WEAVE (core-5 — unchanged)"
  members = ["PEPTIDE (#40, 4.8 — ~30% WEAVE overlap, sub-demotion boundary)", "MACROCYCLE (#39, 4.5 — strong precedent, WEAVE-adjacent)"]
  basis = "~30% WEAVE overlap = README criterion #2 demotion boundary"

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
  warhead VQE. Each imports both sides' sims (no fork — f3), carries a
  passing sentinel, is wired into selftest/run_all.sh, and reaches hexa
  verify 🟢-class SUPPORTED-NUMERICAL (A1's live-VQE hand-off honestly
  🟠 DEFERRED). Honesty preserved throughout: A3 is a comparison NOT a
  ranking (both drugs FDA-approved); A4 refuses to force HIV-1's
  fullerene-cone capsid into a Caspar-Klug T-number (12 honest N/A);
  A5 propagates the qualitative-input caveat (illustrative_only). A
  cross-axis bridge is NOT a new axis — core-5 (../AXIS.tape) UNCHANGED;
  in-silico-only (g8/f2); no n=6-lattice derivation (f_lattice_fit)."
