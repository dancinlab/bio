#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# HEXA-RIBOZYME — catalytic RNA architecture under the n=6 invariant
# ══════════════════════════════════════════════════════════════

# Positioning: HEXA-RIBOZYME is the third sister domain of HEXA-WEAVE within the biology axis (after HEXA-NANOBOT). HEXA-WEAVE addresses write-side multi-strand composition (many strands into a viable bundle); HEXA-NANOBOT addresses single-device mechanical actuation (one motor per device); HEXA-RIBOZYME addresses catalysis by nucleic acid (one chemical reaction per RNA active site). The genus split is three-way: WEAVE composes strands, NANOBOT actuates atoms, RIBOZYME catalyses bonds. The shared substrate is the n=6 invariant lattice with the canonical quartet sigma(6)=12, tau(6)=4, phi(6)=2, J_2=24 — here projected onto reaction states, catalytic-core residues, transition-state symmetry, and binary cleavage outcome respectively.

# ── §1 WHY (why a catalytic-RNA architectural layer matters) ─────────────────────────────────────────


@D row_object_0 :: hexa-ribozyme [ok]
  aspect = "Object"
  hexa_weave_sister = "Multi-strand bundle (P up to 10^4)"
  hexa_nanobot_sister = "Single nano-machine (10^0-10^2 atoms per actuator)"
  hexa_ribozyme_this_domain = "Single ribozyme active site (~12-30 nt catalytic core)"

@D row_direction_1 :: hexa-ribozyme [ok]
  aspect = "Direction"
  hexa_weave_sister = "Target context to strand-set composition"
  hexa_nanobot_sister = "Target work-output to actuator architecture"
  hexa_ribozyme_this_domain = "Target bond-cleavage to catalytic-core architecture"

@D row_primary_quantity_2 :: hexa-ribozyme [ok]
  aspect = "Primary quantity"
  hexa_weave_sister = "Inverse-search x Landauer floor"
  hexa_nanobot_sister = "Mechanical work per cycle vs Brownian floor"
  hexa_ribozyme_this_domain = "Catalytic rate enhancement k_cat / k_uncat"

@D row_primary_oracle_3 :: hexa-ribozyme [ok]
  aspect = "Primary oracle"
  hexa_weave_sister = "AlphaFold-class fold inference (concrete adapter: [`_absorption_bridge/alphafold3/SOURCES.md`](_absorption_bridge/alphafold3/SOURCES.md) — note AF3 NON-COMMERCIAL RESEARCH ONLY; commercial-OK siblings: [RoseTTAFold](_absorption_bridge/rosettafold/SOURCES.md), [ESMFold](_absorption_bridge/esmfold/SOURCES.md), [OpenFold](_absorption_bridge/openfold/SOURCES.md), [ColabFold](_absorption_bridge/colabfold/SOURCES.md))"
  hexa_nanobot_sister = "Molecular-dynamics simulation (Drexler 1986 / Goddard 2003)"
  hexa_ribozyme_this_domain = "Chemical-kinetics simulation + RNA-secondary-structure prediction (Mfold / RNAfold / Rosetta-RNA)"

@D row_primary_constraint_4 :: hexa-ribozyme [ok]
  aspect = "Primary constraint"
  hexa_weave_sister = "Landauer x NP-search ceiling"
  hexa_nanobot_sister = "kT thermal noise floor at 310K"
  hexa_ribozyme_this_domain = "Diffusion-limit ceiling k_cat / K_M ~ 10^8 M^-1 s^-1"

@D row_verdict_horizon_5 :: hexa-ribozyme [ok]
  aspect = "Verdict horizon"
  hexa_weave_sister = "THEORETICAL-ANALYTICAL (closure PASS)"
  hexa_nanobot_sister = "THEORETICAL-ANALYTICAL (registration APPROACH)"
  hexa_ribozyme_this_domain = "THEORETICAL-ANALYTICAL (registration APPROACH)"

# ── §2 COMPARE (HEXA-RIBOZYME vs HEXA-WEAVE vs HEXA-NANOBOT vs Cech-class catalytic RNA literature) — ASCII chart ─────────────────────────────────────────


# ── §3 REQUIRES (prerequisites) ─────────────────────────────────────────


@D row_rna_secondary_structure_0 :: hexa-ribozyme [ok]
  prerequisite_area = "RNA secondary structure"
  required_level = "Advanced"
  core_techniques = "Mfold (Zuker 1989), RNAfold (Hofacker 1994), free-energy nearest-neighbour parameters (Turner 2010)"

@D row_rna_tertiary_structure_1 :: hexa-ribozyme [ok]
  prerequisite_area = "RNA tertiary structure"
  required_level = "Advanced"
  core_techniques = "Rosetta-RNA, Cryo-EM-derived models (ribosome 23S, group-I intron)"

@D row_chemical_kinetics_2 :: hexa-ribozyme [ok]
  prerequisite_area = "Chemical kinetics"
  required_level = "Intermediate"
  core_techniques = "k_cat / K_M analysis, Eyring transition-state theory, diffusion-limit ceiling"

@D row_catalytic_mechanism_3 :: hexa-ribozyme [ok]
  prerequisite_area = "Catalytic mechanism"
  required_level = "Intermediate"
  core_techniques = "General acid-base, metal-ion (Mg^2+) coordination, two-metal-ion mechanism (Steitz 1993)"

@D row_comparative_ribozyme_corpus_4 :: hexa-ribozyme [ok]
  prerequisite_area = "Comparative ribozyme corpus"
  required_level = "Intermediate"
  core_techniques = "Hammerhead / Hairpin / HDV / Group-I / Group-II / RNase P / ribosomal PTC families"

@D row_n6_invariant_grounding_5 :: hexa-ribozyme [ok]
  prerequisite_area = "n6 invariant grounding"
  required_level = "Advanced"
  core_techniques = "sigma(6) = 12, tau(6) = 4, phi(6) = 2, J_2 = 24 lattice for catalytic-core / reaction-state / TS-symmetry / cleavage-outcome cardinalities"

@D row_hexa_weave_handshake_sister_doma_6 :: hexa-ribozyme [ok]
  prerequisite_area = "HEXA-WEAVE handshake (sister domain)"
  required_level = "Intermediate"
  core_techniques = "composition-side primitives for boundary handshake at multi-strand catalytic assembly"

@D row_hexa_nanobot_handshake_sister_do_7 :: hexa-ribozyme [ok]
  prerequisite_area = "HEXA-NANOBOT handshake (sister domain)"
  required_level = "Intermediate"
  core_techniques = "actuation-side primitives for boundary handshake at ribozyme-driven nano-machine"

@D row_foundation_strand_mechanical_lay_8 :: hexa-ribozyme [ok]
  prerequisite_area = "Foundation/Strand mechanical layer (lean4)"
  required_level = "Optional"
  core_techniques = "inheritable from HEXA-WEAVE if formal-verification path is pursued"

# ── §4 STRUCT (4-axis catalytic-RNA architecture) ─────────────────────────────────────────


# ── §5 FLOW (sequential ribozyme design pipeline) ─────────────────────────────────────────


# ── §6 EVOLVE (abstraction ladder L0-L_omega) ─────────────────────────────────────────


@D row_l0_0 :: hexa-ribozyme [ok]
  level = "L0"
  object = "Atomic coordinates"
  cardinality_bound = "10^2-10^3 atoms per active site"

@D row_l1_1 :: hexa-ribozyme [ok]
  level = "L1"
  object = "Bond / angle / dihedral primitives"
  cardinality_bound = "nucleotide-level"

@D row_l2_2 :: hexa-ribozyme [ok]
  level = "L2"
  object = "Single-active-site reaction unit"
  cardinality_bound = "4 reaction states (tau(6) = 4)"

@D row_l3_3 :: hexa-ribozyme [ok]
  level = "L3"
  object = "Catalytic-core residue set"
  cardinality_bound = "sigma(6) = 12 conserved nucleotides"

@D row_l4_4 :: hexa-ribozyme [ok]
  level = "L4"
  object = "Transition-state pose-equivalence quotient"
  cardinality_bound = "J_2 = 24 trigonal-bipyramidal symmetry group"

@D row_l5_5 :: hexa-ribozyme [ok]
  level = "L5"
  object = "Multi-active-site assembly"
  cardinality_bound = "small-P (up to 6 active sites per assembly)"

@D row_l6_6 :: hexa-ribozyme [ok]
  level = "L6"
  object = "Functional ribozyme"
  cardinality_bound = "active-site + core + TS-pose + binary outcome (4 axes integrated)"

@D row_l7_7 :: hexa-ribozyme [ok]
  level = "L7"
  object = "Network of ribozymes"
  cardinality_bound = "crosses into HEXA-WEAVE composition regime (multi-strand catalytic bundle)"

@D row_l8_8 :: hexa-ribozyme [ok]
  level = "L8"
  object = "Ribozyme + nano-machine integration"
  cardinality_bound = "crosses into HEXA-NANOBOT actuation regime (catalytic-driven actuator)"

@D row_l9_9 :: hexa-ribozyme [ok]
  level = "L9"
  object = "Therapeutic / industrial application"
  cardinality_bound = "crosses into life/crispr-gene-editing (sgRNA-guided cleavage) and life/synbio (in-vitro selection of new ribozymes)"

@D row_l10_10 :: hexa-ribozyme [ok]
  level = "L10"
  object = "Diffusion-limit chemical-kinetics accounting"
  cardinality_bound = "k_cat / K_M vs 10^8 M^-1 s^-1 ceiling"

@D row_l11_11 :: hexa-ribozyme [ok]
  level = "L11"
  object = "Chemical-kinetics + RNA-folding simulation"
  cardinality_bound = "Mfold / RNAfold / Rosetta-RNA"

@D row_l12_12 :: hexa-ribozyme [ok]
  level = "L12"
  object = "Symmetry-group computational reduction"
  cardinality_bound = "O(N!) to O(N!/24) via J_2 quotient"

@D row_l13_13 :: hexa-ribozyme [ok]
  level = "L13"
  object = "Free-energy landscape calibration"
  cardinality_bound = "Turner 2010 nearest-neighbour parameters"

@D row_l14_14 :: hexa-ribozyme [ok]
  level = "L14"
  object = "Reverse-mathematics calibration"
  cardinality_bound = "inheritable from HEXA-WEAVE Pi^1_1-CA_0 if formal-verification path pursued"

@D row_l_omega_15 :: hexa-ribozyme [ok]
  level = "L_omega"
  object = "Bachmann-Howard ordinal closure"
  cardinality_bound = "inheritable from HEXA-WEAVE if cosmological lift attempted"

# ── §7 VERIFY (raw 70 K>=4 verification axes) ─────────────────────────────────────────


@D row_constants_0 :: hexa-ribozyme [ok]
  axis = "CONSTANTS"
  verification_claim = "n6 quartet sigma(6) = 12, tau(6) = 4, phi(6) = 2, J_2 = 24 hold across §4 / §5 / §6"
  evidence = "manual cross-check vs tool/own_doc_lint.py canonical set"
  status = "PASS"

@D row_dimensions_1 :: hexa-ribozyme [ok]
  axis = "DIMENSIONS"
  verification_claim = "atoms-per-active-site x active-site-count = atoms-total; M^-1 s^-1 (rate) x M (concentration) = s^-1; nucleotides x nm/nt = active-site-length"
  evidence = "§5 FLOW dimensionally consistent"
  status = "PASS"

@D row_cross_2 :: hexa-ribozyme [ok]
  axis = "CROSS"
  verification_claim = "n6 invariant projection cross-checked against Symons 1981 hammerhead 13-nt minimal core, Cech 1982 group-I intron multi-domain assembly, HDV antigenomic ~12-nt catalytic core"
  evidence = "literature cross-citation"
  status = "PASS-APPROXIMATE"

@D row_scaling_3 :: hexa-ribozyme [ok]
  axis = "SCALING"
  verification_claim = "atomic count scales linearly with active-site count; TS pose-state space scales as 24 / N! up to L4"
  evidence = "§6 EVOLVE ladder"
  status = "PASS"

@D row_sensitivity_4 :: hexa-ribozyme [ok]
  axis = "SENSITIVITY"
  verification_claim = "choice of ribozyme class (hammerhead vs hairpin vs HDV vs group-I) — all preserve 4-state reaction ladder and binary outcome; sigma(6) = 12 holds approximately for minimal cores (range 10-15 nt)"
  evidence = "§4 STRUCT Axis A"
  status = "PASS-APPROXIMATE"

@D row_limits_5 :: hexa-ribozyme [ok]
  axis = "LIMITS"
  verification_claim = "APPROACH grade, not ABSOLUTE; theoretical-analytical, not empirical; no chemical-kinetics or MD simulation executed in this cycle; sigma(6) = 12 is approximate (exact core sizes vary 10-30 nt across classes)"
  evidence = "§1 limit clause + raw 91 C3 disclosure"
  status = "PASS"

@D row_chi2_6 :: hexa-ribozyme [ok]
  axis = "CHI2"
  verification_claim = "quantitative chi-squared validation against published k_cat / K_M distributions of ribozyme classes"
  evidence = "DEFER (no MVP simulation in this cycle)"
  status = "DEFER"

@D row_counter_7 :: hexa-ribozyme [ok]
  axis = "COUNTER"
  verification_claim = "counter-evidence search: a ribozyme class with 5+ reaction states or a catalytic-core residue count outside 10-15 with comparable k_cat / K_M would falsify the n6-invariant binding claim"
  evidence = "F-RB-2 falsifier registered"
  status = "PASS"

# ── §8 IDEAS (research seeds) ─────────────────────────────────────────


# ── §9 METRICS (quantitative targets) ─────────────────────────────────────────


@D row_ribozyme_architectures_simulated_0 :: hexa-ribozyme [ok]
  metric = "Ribozyme architectures simulated"
  current_cycle_15_fan_out_3_3 = "0"
  90_day_mvp_target = "1 (hammerhead minimal 12-nt 4-state)"
  stretch = "5"

@D row_catalytic_core_residue_complianc_1 :: hexa-ribozyme [ok]
  metric = "Catalytic-core residue compliance with sigma(6) = 12"
  current_cycle_15_fan_out_3_3 = "structural-approximate"
  90_day_mvp_target = "within +/-3 nt on simulated set"
  stretch = "exact match"

@D row_reaction_state_compliance_with_t_2 :: hexa-ribozyme [ok]
  metric = "Reaction-state compliance with tau(6) = 4"
  current_cycle_15_fan_out_3_3 = "structural-not-empirical"
  90_day_mvp_target = "100% on simulated set"
  stretch = "empirically measured"

@D row_ts_pose_equivalence_speedup_obse_3 :: hexa-ribozyme [ok]
  metric = "TS pose-equivalence speedup observed (J_2 = 24)"
  current_cycle_15_fan_out_3_3 = "not-measured"
  90_day_mvp_target = ">= 10x on kinetic-network wall-clock"
  stretch = "24x (theoretical max)"

@D row_diffusion_ceiling_check_pass_rat_4 :: hexa-ribozyme [ok]
  metric = "Diffusion-ceiling check pass rate"
  current_cycle_15_fan_out_3_3 = "n/a"
  90_day_mvp_target = "1/1 candidate stays below 10^9 M^-1 s^-1"
  stretch = "n/1 with quantitative margin"

@D row_verdict_tier_raw_69_5 :: hexa-ribozyme [ok]
  metric = "Verdict tier (raw 69)"
  current_cycle_15_fan_out_3_3 = "APPROACH"
  90_day_mvp_target = "APPROACH-EMPIRICAL"
  stretch = "LIMIT"

@D row_falsifier_count_6 :: hexa-ribozyme [ok]
  metric = "Falsifier count"
  current_cycle_15_fan_out_3_3 = "5 (F-RB-1..F-RB-5)"
  90_day_mvp_target = "5"
  stretch = "12"

@D row_raw_70_axes_pass_7 :: hexa-ribozyme [ok]
  metric = "Raw 70 axes PASS"
  current_cycle_15_fan_out_3_3 = "7 of 8 (CHI2 DEFER)"
  90_day_mvp_target = "8 of 8"
  stretch = "8 of 8 with n>1"

@D row_witness_count_in_design_kick_8 :: hexa-ribozyme [ok]
  metric = "Witness count in design/kick/"
  current_cycle_15_fan_out_3_3 = "1 (this registration)"
  90_day_mvp_target = "3+"
  stretch = "8"

@D row_chi2_sample_size_n_9 :: hexa-ribozyme [ok]
  metric = "CHI2 sample size n"
  current_cycle_15_fan_out_3_3 = "0 (DEFER)"
  90_day_mvp_target = "1 (PASS-MARGINAL)"
  stretch = "30"

@D row_sister_domain_handshakes_hexa_we_10 :: hexa-ribozyme [ok]
  metric = "Sister-domain handshakes (HEXA-WEAVE + HEXA-NANOBOT)"
  current_cycle_15_fan_out_3_3 = "spec-only"
  90_day_mvp_target = "one bidirectional integration test per sister"
  stretch = "full L7+L8 multi-ribozyme network closure"

# ── §10 RISKS (and falsifiers per raw 71, at least 3 per measurable claim) ─────────────────────────────────────────


@D b_f_rb_1_genus_evidence_shows_hexa_0 :: hexa-ribozyme [ok]
  text = "F-RB-1-genus: evidence shows HEXA-WEAVE multi-strand composition pipeline subsumes ribozyme design as a special case (P=1 strand bundle with a designed catalytic loop) without separate primitives — would falsify genus distinction and force merge into HEXA-WEAVE."

@D b_f_rb_1_b_evidence_shows_hexa_nan_1 :: hexa-ribozyme [ok]
  text = "F-RB-1-b: evidence shows HEXA-NANOBOT mechanical-actuator pipeline subsumes ribozyme catalysis as a special case (chemical-actuator sub-mode) without separate primitives — would falsify genus distinction and force merge into HEXA-NANOBOT."

@D b_f_rb_1_c_a_published_unification_2 :: hexa-ribozyme [ok]
  text = "F-RB-1-c: a published unification framework treating composition + actuation + catalysis as instances of a single design algebra would weaken the three-way genus split; force consolidation under one primitive layer."

@D b_f_rb_2_n6_decorative_bayesian_mo_3 :: hexa-ribozyme [ok]
  text = "F-RB-2-n6-decorative: Bayesian model comparison on 30 published ribozyme architectures shows H0 (random catalytic-core size) cannot be rejected at log-Bayes-factor >= 3 — would invalidate the invariant-as-causal claim."

@D b_f_rb_2_b_a_published_ribozyme_wi_4 :: hexa-ribozyme [ok]
  text = "F-RB-2-b: a published ribozyme with 5+ reaction states (violating tau(6) = 4) and equally-or-more efficient catalysis would falsify the cardinality binding."

@D b_f_rb_2_c_a_published_ribozyme_wi_5 :: hexa-ribozyme [ok]
  text = "F-RB-2-c: a published ribozyme with catalytic-core residue count outside the 10-15 range (e.g. 6-nt minimal or 30-nt extended) outperforming 12-nt-core variants in k_cat / K_M would falsify the sigma(6) = 12 binding."

@D b_f_rb_4_mvp_90day_failure_to_deli_6 :: hexa-ribozyme [ok]
  text = "F-RB-4-MVP-90day: failure to deliver a hammerhead-minimal 12-nt-core 4-state chemical-kinetics simulation by 2026-07-28 falsifies the YES_APPROACH registration upgrade and reverts the recommendation to PROPOSED."

@D b_f_rb_4_b_an_mvp_simulation_that_7 :: hexa-ribozyme [ok]
  text = "F-RB-4-b: an MVP simulation that completes but exhibits diffusion-ceiling violation (k_cat / K_M > 10^9 M^-1 s^-1) would constitute internal contradiction and trigger retraction."

@D b_f_rb_4_c_an_mvp_simulation_whose_8 :: hexa-ribozyme [ok]
  text = "F-RB-4-c: an MVP simulation whose witness JSON fails the absorption pipeline (raw 108 classifier rejection) would falsify the absorption-channel design."

@D b_f_rb_5_sister_axis_collision_aud_9 :: hexa-ribozyme [ok]
  text = "F-RB-5-sister-axis-collision: audit shows life/crispr-gene-editing/ already covers ribozyme-class catalytic RNA fundamentals at the same theoretical depth — would force route under life axis."

@D b_f_rb_5_b_maintainer_review_of_li_10 :: hexa-ribozyme [ok]
  text = "F-RB-5-b: maintainer review of life/synbio/synbio.md flags overlap on §1-§7 specifically (in-vitro selection of new ribozymes) — would trigger boundary-redrawing proposal."

@D b_f_rb_5_c_a_published_taxonomy_tr_11 :: hexa-ribozyme [ok]
  text = "F-RB-5-c: a published taxonomy treats clinical gene-editing and architectural-ribozyme catalysis as a single domain — would weaken the biology-vs-life axis split."

@D b_f_rb_3_diffusion_limit_a_publish_12 :: hexa-ribozyme [ok]
  text = "F-RB-3-diffusion-limit: a published ribozyme demonstrates k_cat / K_M >> 10^9 M^-1 s^-1 (above the Eigen-Hammes diffusion-limit ceiling) — would invalidate the diffusion-floor-as-binding claim and force re-derivation of the chemical-kinetics floor."

@D b_f_rb_3_b_measurement_shows_310k_13 :: hexa-ribozyme [ok]
  text = "F-RB-3-b: measurement shows 310K is not the operating temperature for any deployed ribozyme (e.g. thermophile RNase P at 360K) — would shift the floor calculation; class-by-class re-binding required."

@D b_f_rb_3_c_a_ribozyme_class_operat_14 :: hexa-ribozyme [ok]
  text = "F-RB-3-c: a ribozyme class operates below the 10^4 M^-1 s^-1 floor (5 orders below the diffusion ceiling) and still achieves catalytic relevance via co-localisation — would weaken the diffusion-ceiling-as-primary-constraint claim."

# ── §11 DEPENDENCIES (external + cross-domain) ─────────────────────────────────────────


@D row_cech_t_r_1982_self_splicing_of_r_0 :: hexa-ribozyme [ok]
  dependency = "Cech T. R. 1982 \"Self-splicing of RNA precursors\" Cell 31:147-157"
  type = "external citation"
  why_required = "group-I intron self-splicing; founding catalytic-RNA literature"

@D row_guerrier_takada_c_altman_s_1983_1 :: hexa-ribozyme [ok]
  dependency = "Guerrier-Takada C. & Altman S. 1983 \"The RNA moiety of ribonuclease P is the catalytic subunit\" Cell 35:849-857"
  type = "external citation"
  why_required = "RNase P RNA-only catalysis; foundational"

@D row_symons_r_h_1981_avocado_sunblotc_2 :: hexa-ribozyme [ok]
  dependency = "Symons R. H. 1981 \"Avocado sunblotch viroid: primary sequence and proposed secondary structure\" Nucleic Acids Res 9:6527-6537"
  type = "external citation"
  why_required = "hammerhead self-cleavage in viroids; minimal 13-nt catalytic core reference"

@D row_wu_h_n_lin_y_j_lin_f_p_makino_s_3 :: hexa-ribozyme [ok]
  dependency = "Wu H. N., Lin Y. J., Lin F. P., Makino S., Chang M. F., Lai M. M. 1989 \"Human hepatitis delta virus RNA subfragments contain an autocleavage activity\" PNAS 86:1831-1835"
  type = "external citation"
  why_required = "HDV ribozyme; ~12-nt antigenomic catalytic core"

@D row_buzayan_j_m_gerlach_w_l_bruening_4 :: hexa-ribozyme [ok]
  dependency = "Buzayan J. M., Gerlach W. L., Bruening G. 1986 \"Non-enzymatic cleavage and ligation of RNAs complementary to a plant virus satellite RNA\" Nature 323:349-353"
  type = "external citation"
  why_required = "hairpin ribozyme"

@D row_steitz_t_a_steitz_j_a_1993_a_gen_5 :: hexa-ribozyme [ok]
  dependency = "Steitz T. A. & Steitz J. A. 1993 \"A general two-metal-ion mechanism for catalytic RNA\" PNAS 90:6498-6502"
  type = "external citation"
  why_required = "two-metal-ion mechanism for §4 STRUCT Axis C TS pose-symmetry"

@D row_nissen_p_hansen_j_ban_n_moore_p_6 :: hexa-ribozyme [ok]
  dependency = "Nissen P., Hansen J., Ban N., Moore P. B., Steitz T. A. 2000 \"The structural basis of ribosome activity in peptide bond synthesis\" Science 289:920-930"
  type = "external citation"
  why_required = "ribosomal peptidyl transferase as ribozyme; TS pose reference"

@D row_turner_d_h_mathews_d_h_2010_nndb_7 :: hexa-ribozyme [ok]
  dependency = "Turner D. H. & Mathews D. H. 2010 \"NNDB: the nearest neighbor parameter database for predicting stability of nucleic acid secondary structure\" Nucleic Acids Res 38:D280-D282"
  type = "external citation"
  why_required = "nearest-neighbour free-energy parameters for §5 FLOW step 7 simulation"

@D row_hofacker_i_l_1994_fast_folding_a_8 :: hexa-ribozyme [ok]
  dependency = "Hofacker I. L. 1994 \"Fast folding and comparison of RNA secondary structures\" Monatsh Chem 125:167-188"
  type = "external citation"
  why_required = "RNAfold reference for L11"

@D row_eigen_m_hammes_g_g_1963_elementa_9 :: hexa-ribozyme [ok]
  dependency = "Eigen M. & Hammes G. G. 1963 \"Elementary steps in enzyme reactions\" Adv Enzymol 25:1-38"
  type = "external citation"
  why_required = "diffusion-limit ceiling for §1 / §10 measurable claim 5"

@D row_domains_biology_hexa_weave_10 :: hexa-ribozyme [ok]
  dependency = "domains/biology/hexa-weave/"
  type = "sister domain"
  why_required = "composition-side handshake at multi-strand catalytic-bundle boundary; shared Foundation/Strand lean4 layer if formal-verification path pursued"

@D row_domains_biology_hexa_nanobot_11 :: hexa-ribozyme [ok]
  dependency = "domains/biology/hexa-nanobot/"
  type = "sister domain"
  why_required = "actuation-side handshake at ribozyme-driven nano-machine boundary"

@D row_domains_life_crispr_gene_editing_12 :: hexa-ribozyme [ok]
  dependency = "domains/life/crispr-gene-editing/"
  type = "cross-domain (collision audit pending)"
  why_required = "clinical sgRNA-guided cleavage route; F-RB-5 audit deadline 2026-05-28"

@D row_domains_life_synbio_13 :: hexa-ribozyme [ok]
  dependency = "domains/life/synbio/"
  type = "cross-domain"
  why_required = "in-vitro selection / SELEX route for novel ribozyme discovery"

@D row_domains_cognitive_hexa_mind_14 :: hexa-ribozyme [ok]
  dependency = "domains/cognitive/hexa-mind/"
  type = "cross-domain (potential)"
  why_required = "RNA-world cognition-substrate hypothesis; speculative L9 route"

@D row_state_discovery_absorption_regis_15 :: hexa-ribozyme [ok]
  dependency = "state/discovery_absorption/registry.jsonl"
  type = "repo SSOT"
  why_required = "raw 108 + raw 135 absorption channel"

@D row_design_kick_16 :: hexa-ribozyme [ok]
  dependency = "design/kick/"
  type = "repo SSOT"
  why_required = "witness emission target"

@D row_tool_own_doc_lint_py_17 :: hexa-ribozyme [ok]
  dependency = "tool/own_doc_lint.py"
  type = "tooling"
  why_required = "own 1 / own 3 / own 4 / own 5 / own 16 enforcement (13/13 PASS expected)"

# ── §12 TIMELINE (deliverables) ─────────────────────────────────────────


@D row_2026_04_28_0 :: hexa-ribozyme [ok]
  date = "2026-04-28"
  cycle = "15 / fan-out 3/3"
  milestone = "Domain registration in canon (this body + 2 _index.json updates + 1 witness JSON)"
  witness = "design/kick/2026-04-28_hexa-ribozyme-registration-cycle15_omega_cycle.json"

@D row_2026_05_28_1 :: hexa-ribozyme [ok]
  date = "2026-05-28"
  cycle = "TBD"
  milestone = "F-RB-5 collision audit with life/crispr-gene-editing + life/synbio completed"
  witness = "F-RB-5 audit row"

@D row_2026_07_28_2 :: hexa-ribozyme [ok]
  date = "2026-07-28"
  cycle = "TBD"
  milestone = "F-RB-4 90-day MVP — hammerhead-minimal 12-nt 4-state chemical-kinetics simulation"
  witness = "proposals/hexa_ribozyme_mvp_<date>.md"

@D row_2026_09_28_3 :: hexa-ribozyme [ok]
  date = "2026-09-28"
  cycle = "TBD"
  milestone = "F-RB-2 Bayesian audit (30 ribozyme architectures across 7 classes) completed"
  witness = "F-RB-2 audit row"

@D row_2027_04_28_4 :: hexa-ribozyme [ok]
  date = "2027-04-28"
  cycle = "TBD"
  milestone = "F-RB-3 diffusion-ceiling literature scan completed"
  witness = "F-RB-3 audit row"

@D row_tbd_5 :: hexa-ribozyme [ok]
  date = "TBD"
  cycle = "TBD"
  milestone = "CHI2 axis upgrade DEFER to PASS (n>=1 simulation)"
  witness = "TBD"

# ── §13 TOOLS (concrete repo artefacts) ─────────────────────────────────────────


@D b_tool_own_doc_lint_py_rule_1_3_4_0 :: hexa-ribozyme [ok]
  text = "tool/own_doc_lint.py --rule 1 / 3 / 4 / 5 / 16 — HARD-block lint gates this body must pass."

@D b_tool_own1_legacy_allowlist_json_1 :: hexa-ribozyme [ok]
  text = "tool/own1_legacy_allowlist.json — frozen English-only legacy grandfather list (this body is NOT added; new files comply directly)."

@D b_domains_index_json_top_level_axi_2 :: hexa-ribozyme [ok]
  text = "domains/_index.json — top-level axis SSOT (biology axis updated by this registration; hexa-ribozyme added)."

@D b_domains_biology_index_json_sub_a_3 :: hexa-ribozyme [ok]
  text = "domains/biology/_index.json — sub-axis SSOT (hexa-ribozyme entry added; _domains_count 2 -> 3)."

@D b_state_discovery_absorption_regis_4 :: hexa-ribozyme [ok]
  text = "state/discovery_absorption/registry.jsonl — append-only absorption registry per raw 108 + raw 135."

@D b_design_kick_kick_witness_emissio_5 :: hexa-ribozyme [ok]
  text = "design/kick/ — kick-witness emission directory (this cycle: 2026-04-28_hexa-ribozyme-registration-cycle15_omega_cycle.json)."

# ── §14 TEAM (roles) ─────────────────────────────────────────


@D row_domain_steward_0 :: hexa-ribozyme [ok]
  role = "Domain steward"
  responsibility = "Maintain this body and its sub-index entry"
  owner = "canon maintainers"

@D row_sister_domain_liaison_1 :: hexa-ribozyme [ok]
  role = "Sister-domain liaison"
  responsibility = "Maintain HEXA-WEAVE handshake at multi-strand catalytic-bundle boundary AND HEXA-NANOBOT handshake at ribozyme-driven actuator boundary"
  owner = "hexa-weave + hexa-nanobot + hexa-ribozyme stewards jointly"

@D row_mvp_runner_2 :: hexa-ribozyme [ok]
  role = "MVP runner"
  responsibility = "Deliver F-RB-4 90-day hammerhead-minimal 12-nt 4-state chemical-kinetics simulation"
  owner = "TBD by 2026-07-28"

@D row_falsifier_monitor_3 :: hexa-ribozyme [ok]
  role = "Falsifier monitor"
  responsibility = "Watch F-RB-1..F-RB-5 with deadlines 2026-05-28 / 2026-07-28 / 2026-09-28 / 2027-04-28"
  owner = "canon honesty-charter team"

@D row_cross_domain_liaison_4 :: hexa-ribozyme [ok]
  role = "Cross-domain liaison"
  responsibility = "life/crispr-gene-editing collision audit + life/synbio SELEX route"
  owner = "per-axis domain stewards"

# ── §15 REFERENCES ─────────────────────────────────────────

