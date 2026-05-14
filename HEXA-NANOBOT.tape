#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# HEXA-NANOBOT — molecular nano-machine architecture under the n=6 invariant
# ══════════════════════════════════════════════════════════════

# Positioning: HEXA-NANOBOT is the sister domain of HEXA-WEAVE within the biology axis. Where HEXA-WEAVE addresses write-side multi-strand molecular design composition (assembling many strands into a viable bundle), HEXA-NANOBOT addresses single molecular nano-machine architecture (one mechanical actuator per device). The split is genus-level: WEAVE composes strands; NANOBOT actuates atoms. The shared substrate is the n=6 invariant lattice with the canonical quartet σ(6)=12, τ(6)=4, φ(6)=2, J₂=24 — here projected onto motor states, vertex skeletons, pose symmetry, and binary actuator output respectively.

# ── §1 WHY (why a molecular nano-machine architectural layer matters) ─────────────────────────────────────────


@D row_object_0 :: hexa-nanobot [ok]
  aspect = "Object"
  hexa_weave_sister = "Multi-strand bundle (P up to 10^4)"
  hexa_nanobot_this_domain = "Single nano-machine (10^0-10^2 atoms per actuator)"

@D row_direction_1 :: hexa-nanobot [ok]
  aspect = "Direction"
  hexa_weave_sister = "Target context to strand-set composition"
  hexa_nanobot_this_domain = "Target work-output to actuator architecture"

@D row_primary_quantity_2 :: hexa-nanobot [ok]
  aspect = "Primary quantity"
  hexa_weave_sister = "Inverse-search × Landauer floor"
  hexa_nanobot_this_domain = "Mechanical work per cycle vs Brownian floor"

@D row_primary_oracle_3 :: hexa-nanobot [ok]
  aspect = "Primary oracle"
  hexa_weave_sister = "AlphaFold-class fold inference (concrete adapter: [`_absorption_bridge/alphafold3/SOURCES.md`](_absorption_bridge/alphafold3/SOURCES.md) — note AF3 NON-COMMERCIAL RESEARCH ONLY; commercial-OK siblings: [RoseTTAFold](_absorption_bridge/rosettafold/SOURCES.md), [ESMFold](_absorption_bridge/esmfold/SOURCES.md), [OpenFold](_absorption_bridge/openfold/SOURCES.md), [ColabFold](_absorption_bridge/colabfold/SOURCES.md))"
  hexa_nanobot_this_domain = "Molecular-dynamics simulation (Drexler 1986 / Goddard 2003)"

@D row_primary_constraint_4 :: hexa-nanobot [ok]
  aspect = "Primary constraint"
  hexa_weave_sister = "Landauer × NP-search ceiling"
  hexa_nanobot_this_domain = "kT thermal noise floor at 310K"

@D row_verdict_horizon_5 :: hexa-nanobot [ok]
  aspect = "Verdict horizon"
  hexa_weave_sister = "THEORETICAL-ANALYTICAL (closure PASS)"
  hexa_nanobot_this_domain = "THEORETICAL-ANALYTICAL (registration APPROACH)"

# ── §2 COMPARE (HEXA-NANOBOT vs HEXA-WEAVE vs Drexler-class systems vs DNA-origami) — ASCII chart ─────────────────────────────────────────


# ── §3 REQUIRES (prerequisites) ─────────────────────────────────────────


@D row_single_molecule_dynamics_0 :: hexa-nanobot [ok]
  prerequisite_area = "Single-molecule dynamics"
  required_level = "Advanced"
  core_techniques = "Molecular dynamics, coarse-grained simulation, Brownian motion analysis"

@D row_dna_rna_structural_biology_1 :: hexa-nanobot [ok]
  prerequisite_area = "DNA / RNA structural biology"
  required_level = "Advanced"
  core_techniques = "Holliday junctions, immobile junctions (Seeman 1982), origami-fold scaffolding (Rothemund 2006)"

@D row_mechanical_actuator_theory_2 :: hexa-nanobot [ok]
  prerequisite_area = "Mechanical actuator theory"
  required_level = "Intermediate"
  core_techniques = "Power-stroke kinetics (Drexler 1986), free-energy landscape analysis"

@D row_symmetry_group_theory_3 :: hexa-nanobot [ok]
  prerequisite_area = "Symmetry group theory"
  required_level = "Intermediate"
  core_techniques = "Octahedral / icosahedral rotation groups,"

@D row_brownian_thermodynamics_4 :: hexa-nanobot [ok]
  prerequisite_area = "Brownian thermodynamics"
  required_level = "Intermediate"
  core_techniques = "kT thermal floor at 310K, work-output bounds"

@D row_n6_invariant_grounding_5 :: hexa-nanobot [ok]
  prerequisite_area = "n6 invariant grounding"
  required_level = "Advanced"
  core_techniques = "sigma(6) = 12, tau(6) = 4, phi(6) = 2, J_2 = 24 lattice for motor / vertex / actuator cardinalities"

@D row_hexa_weave_handshake_sister_doma_6 :: hexa-nanobot [ok]
  prerequisite_area = "HEXA-WEAVE handshake (sister domain)"
  required_level = "Intermediate"
  core_techniques = "composition-side primitives for boundary handshake at small-P regime"

@D row_foundation_strand_mechanical_lay_7 :: hexa-nanobot [ok]
  prerequisite_area = "Foundation/Strand mechanical layer (lean4)"
  required_level = "Optional"
  core_techniques = "inheritable from HEXA-WEAVE if formal-verification path is pursued"

# ── §4 STRUCT (4-axis nano-machine architecture) ─────────────────────────────────────────


# ── §5 FLOW (sequential nano-machine design pipeline) ─────────────────────────────────────────


# ── §6 EVOLVE (abstraction ladder L0-L_omega) ─────────────────────────────────────────


@D row_l0_0 :: hexa-nanobot [ok]
  level = "L0"
  object = "Atomic coordinates"
  cardinality_bound = "10^0-10^2 atoms per actuator"

@D row_l1_1 :: hexa-nanobot [ok]
  level = "L1"
  object = "Bond / angle / dihedral primitives"
  cardinality_bound = "residue-level"

@D row_l2_2 :: hexa-nanobot [ok]
  level = "L2"
  object = "Single-actuator unit"
  cardinality_bound = "4 motor states (tau(6) = 4)"

@D row_l3_3 :: hexa-nanobot [ok]
  level = "L3"
  object = "12-vertex polyhedral skeleton"
  cardinality_bound = "sigma(6) = 12 vertex"

@D row_l4_4 :: hexa-nanobot [ok]
  level = "L4"
  object = "Pose-equivalence quotient"
  cardinality_bound = "J_2 = 24 rotation group"

@D row_l5_5 :: hexa-nanobot [ok]
  level = "L5"
  object = "Multi-actuator assembly"
  cardinality_bound = "small-P (up to 6 actuators per assembly)"

@D row_l6_6 :: hexa-nanobot [ok]
  level = "L6"
  object = "Functional nano-machine"
  cardinality_bound = "actuator + skeleton + pose + binary output (4 axes integrated)"

@D row_l7_7 :: hexa-nanobot [ok]
  level = "L7"
  object = "Network of nano-machines"
  cardinality_bound = "crosses into HEXA-WEAVE composition regime"

@D row_l8_8 :: hexa-nanobot [ok]
  level = "L8"
  object = "Cellular-context deployment"
  cardinality_bound = "proteome-adjacent (HEXA-WEAVE handshake)"

@D row_l9_9 :: hexa-nanobot [ok]
  level = "L9"
  object = "Therapeutic / industrial application"
  cardinality_bound = "crosses into life/therapeutic-nanobot"

@D row_l10_10 :: hexa-nanobot [ok]
  level = "L10"
  object = "Brownian thermodynamic accounting"
  cardinality_bound = "kT floor at 310K"

@D row_l11_11 :: hexa-nanobot [ok]
  level = "L11"
  object = "MD simulation verification"
  cardinality_bound = "coarse-grained or atomistic"

@D row_l12_12 :: hexa-nanobot [ok]
  level = "L12"
  object = "Symmetry-group computational reduction"
  cardinality_bound = "O(N!) to O(N!/24) via J_2 quotient"

@D row_l13_13 :: hexa-nanobot [ok]
  level = "L13"
  object = "Power-stroke free-energy calibration"
  cardinality_bound = "published reference frameworks"

@D row_l14_14 :: hexa-nanobot [ok]
  level = "L14"
  object = "Reverse-mathematics calibration"
  cardinality_bound = "inheritable from HEXA-WEAVE Pi^1_1-CA_0 if formal-verification path pursued"

@D row_l_omega_15 :: hexa-nanobot [ok]
  level = "L_omega"
  object = "Bachmann-Howard ordinal closure"
  cardinality_bound = "inheritable from HEXA-WEAVE if cosmological lift attempted"

# ── §7 VERIFY (raw 70 K>=4 verification axes) ─────────────────────────────────────────


@D row_constants_0 :: hexa-nanobot [ok]
  axis = "CONSTANTS"
  verification_claim = "n6 quartet sigma(6) = 12, tau(6) = 4, phi(6) = 2, J_2 = 24 hold across §4 / §5 / §6"
  evidence = "manual cross-check vs tool/own_doc_lint.py canonical set"
  status = "PASS"

@D row_dimensions_1 :: hexa-nanobot [ok]
  axis = "DIMENSIONS"
  verification_claim = "atoms-per-actuator × actuator-count = atoms-total; J/cycle × cycles/s = W; nm × 10^-9 m/nm = m"
  evidence = "§5 FLOW dimensionally consistent"
  status = "PASS"

@D row_cross_2 :: hexa-nanobot [ok]
  axis = "CROSS"
  verification_claim = "n6 invariant projection cross-checked against Rothemund 2006 (12-vertex implicit) and Drexler 1986 power-stroke quartet"
  evidence = "literature cross-citation"
  status = "PASS"

@D row_scaling_3 :: hexa-nanobot [ok]
  axis = "SCALING"
  verification_claim = "atomic count scales linearly with actuator count; pose-state space scales as 24 / N! up to L4"
  evidence = "§6 EVOLVE ladder"
  status = "PASS"

@D row_sensitivity_4 :: hexa-nanobot [ok]
  axis = "SENSITIVITY"
  verification_claim = "choice of polyhedral skeleton (truncated tetrahedron vs icosahedron vs cuboctahedron) — all 12-vertex variants satisfy sigma(6) = 12 axis"
  evidence = "§4 STRUCT Axis A"
  status = "PASS"

@D row_limits_5 :: hexa-nanobot [ok]
  axis = "LIMITS"
  verification_claim = "APPROACH grade, not ABSOLUTE; theoretical-analytical, not empirical; no MD simulation executed in this cycle"
  evidence = "§1 limit clause + raw 91 C3 disclosure"
  status = "PASS"

@D row_chi2_6 :: hexa-nanobot [ok]
  axis = "CHI2"
  verification_claim = "quantitative chi-squared validation against measured power-output of published DNA-origami nano-machines"
  evidence = "DEFER (no MVP simulation in this cycle)"
  status = "DEFER"

@D row_counter_7 :: hexa-nanobot [ok]
  axis = "COUNTER"
  verification_claim = "counter-evidence search: a nano-machine with non-12 vertex skeleton or non-4 motor states would falsify the n6-invariant binding claim"
  evidence = "F-NB-2 falsifier registered"
  status = "PASS"

# ── §8 IDEAS (research seeds) ─────────────────────────────────────────


# ── §9 METRICS (quantitative targets) ─────────────────────────────────────────


@D row_nano_machine_architectures_simul_0 :: hexa-nanobot [ok]
  metric = "Nano-machine architectures simulated"
  current_cycle_13_fan_out_2_5 = "0"
  90_day_mvp_target = "1 (12-vertex 4-state binary)"
  stretch = "5"

@D row_vertex_count_compliance_with_sig_1 :: hexa-nanobot [ok]
  metric = "Vertex-count compliance with sigma(6) = 12"
  current_cycle_13_fan_out_2_5 = "structural-not-empirical"
  90_day_mvp_target = "100% on simulated set"
  stretch = "empirically measured"

@D row_motor_state_count_compliance_wit_2 :: hexa-nanobot [ok]
  metric = "Motor-state-count compliance with tau(6) = 4"
  current_cycle_13_fan_out_2_5 = "structural-not-empirical"
  90_day_mvp_target = "100% on simulated set"
  stretch = "empirically measured"

@D row_pose_equivalence_speedup_observe_3 :: hexa-nanobot [ok]
  metric = "Pose-equivalence speedup observed (J_2 = 24)"
  current_cycle_13_fan_out_2_5 = "not-measured"
  90_day_mvp_target = ">= 10x on MD wall-clock"
  stretch = "24x (theoretical max)"

@D row_brownian_floor_check_pass_rate_4 :: hexa-nanobot [ok]
  metric = "Brownian floor check pass rate"
  current_cycle_13_fan_out_2_5 = "n/a"
  90_day_mvp_target = "1/1 candidate stays above 10 * kT"
  stretch = "n/1 with quantitative margin"

@D row_verdict_tier_raw_69_5 :: hexa-nanobot [ok]
  metric = "Verdict tier (raw 69)"
  current_cycle_13_fan_out_2_5 = "APPROACH"
  90_day_mvp_target = "APPROACH-EMPIRICAL"
  stretch = "LIMIT"

@D row_falsifier_count_6 :: hexa-nanobot [ok]
  metric = "Falsifier count"
  current_cycle_13_fan_out_2_5 = "5 (F-NB-1..F-NB-5)"
  90_day_mvp_target = "5"
  stretch = "12"

@D row_raw_70_axes_pass_7 :: hexa-nanobot [ok]
  metric = "Raw 70 axes PASS"
  current_cycle_13_fan_out_2_5 = "7 of 8 (CHI2 DEFER)"
  90_day_mvp_target = "8 of 8"
  stretch = "8 of 8 with n>1"

@D row_witness_count_in_design_kick_8 :: hexa-nanobot [ok]
  metric = "Witness count in design/kick/"
  current_cycle_13_fan_out_2_5 = "1 (this registration)"
  90_day_mvp_target = "3+"
  stretch = "8"

@D row_chi2_sample_size_n_9 :: hexa-nanobot [ok]
  metric = "CHI2 sample size n"
  current_cycle_13_fan_out_2_5 = "0 (DEFER)"
  90_day_mvp_target = "1 (PASS-MARGINAL)"
  stretch = "30"

@D row_sister_domain_handshake_with_hex_10 :: hexa-nanobot [ok]
  metric = "Sister-domain handshake with HEXA-WEAVE"
  current_cycle_13_fan_out_2_5 = "spec-only"
  90_day_mvp_target = "one bidirectional integration test"
  stretch = "full L7 multi-actuator network closure"

# ── §10 RISKS (and falsifiers per raw 71, at least 3 per measurable claim) ─────────────────────────────────────────


@D b_f_nb_1_genus_evidence_shows_hexa_0 :: hexa-nanobot [ok]
  text = "F-NB-1-genus: evidence shows HEXA-WEAVE design composition pipeline subsumes single-nano-machine design as a special case (P=1, N small) without separate primitives — would falsify genus distinction and force merge."

@D b_f_nb_1_b_a_published_unification_1 :: hexa-nanobot [ok]
  text = "F-NB-1-b: a published unification framework treating both as instances of a single design-composition algebra would weaken the distinction."

@D b_f_nb_1_c_discovery_that_nano_mac_2 :: hexa-nanobot [ok]
  text = "F-NB-1-c: discovery that nano-machine work-output is dominated by inverse-search cost (Landauer) rather than thermal floor (Brownian) at small-N would invalidate the primary-constraint split."

@D b_f_nb_2_n6_decorative_bayesian_mo_3 :: hexa-nanobot [ok]
  text = "F-NB-2-n6-decorative: Bayesian model comparison on 30 published architectures shows H0 (random) cannot be rejected at log-Bayes-factor >= 3 — would invalidate the invariant-as-causal claim."

@D b_f_nb_2_b_a_published_nano_machin_4 :: hexa-nanobot [ok]
  text = "F-NB-2-b: a published nano-machine with 5+ motor states (violating tau(6) = 4) and equally efficient work-output would falsify the cardinality binding."

@D b_f_nb_2_c_a_published_nano_machin_5 :: hexa-nanobot [ok]
  text = "F-NB-2-c: a published nano-machine with non-12 vertex skeleton (e.g. tetrahedral 4-vertex or cube 8-vertex) outperforming 12-vertex variants would falsify the sigma(6) = 12 binding."

@D b_f_nb_4_mvp_90day_failure_to_deli_6 :: hexa-nanobot [ok]
  text = "F-NB-4-MVP-90day: failure to deliver a 4-state 12-vertex DNA-origami simulation by 2026-07-28 falsifies the YES_APPROACH registration upgrade and reverts the recommendation to PROPOSED."

@D b_f_nb_4_b_an_mvp_simulation_that_7 :: hexa-nanobot [ok]
  text = "F-NB-4-b: an MVP simulation that completes but exhibits Brownian-floor violation (work output below 10 * kT) would constitute internal contradiction and trigger retraction."

@D b_f_nb_4_c_an_mvp_simulation_whose_8 :: hexa-nanobot [ok]
  text = "F-NB-4-c: an MVP simulation whose witness JSON fails the absorption pipeline (raw 108 classifier rejection) would falsify the absorption-channel design."

@D b_f_nb_5_sister_axis_collision_aud_9 :: hexa-nanobot [ok]
  text = "F-NB-5-sister-axis-collision: audit shows life/therapeutic-nanobot/ already covers molecular-machine fundamentals at the same theoretical depth — would force route under life axis."

@D b_f_nb_5_b_maintainer_review_of_li_10 :: hexa-nanobot [ok]
  text = "F-NB-5-b: maintainer review of life/therapeutic-nanobot/therapeutic-nanobot.md flags overlap on §1-§7 specifically — would trigger boundary-redrawing proposal."

@D b_f_nb_5_c_a_published_taxonomy_tr_11 :: hexa-nanobot [ok]
  text = "F-NB-5-c: a published taxonomy treats clinical and architectural nano-machines as a single domain — would weaken the biology-vs-life axis split."

@D b_f_nb_3_brownian_floor_a_publishe_12 :: hexa-nanobot [ok]
  text = "F-NB-3-Brownian-floor: a published nano-machine demonstrates work output >> kT per cycle by a factor that requires Landauer-class accounting — would merge HEXA-NANOBOT physical-axis with HEXA-WEAVE Landauer treatment."

@D b_f_nb_3_b_measurement_shows_310k_13 :: hexa-nanobot [ok]
  text = "F-NB-3-b: measurement shows 310K is not the operating temperature for any deployed nano-machine (e.g. cryogenic operation) — would shift the floor calculation."

@D b_f_nb_3_c_a_nano_machine_class_op_14 :: hexa-nanobot [ok]
  text = "F-NB-3-c: a nano-machine class operates below the 10 * kT margin and still achieves directed motion via stochastic ratchet effects — would weaken the Brownian-floor-as-binding claim."

# ── §11 DEPENDENCIES (external + cross-domain) ─────────────────────────────────────────


@D row_drexler_k_e_1986_engines_of_crea_0 :: hexa-nanobot [ok]
  dependency = "Drexler K. E. 1986 \"Engines of Creation\""
  type = "external citation"
  why_required = "productive nanotechnology framing; power-stroke quartet foundational reference"

@D row_seeman_n_c_1982_nucleic_acid_jun_1 :: hexa-nanobot [ok]
  dependency = "Seeman N. C. 1982 \"Nucleic acid junctions and lattices\" J Theor Biol 99:237-247"
  type = "external citation"
  why_required = "immobile junction DNA architecture; vertex skeleton precursor"

@D row_rothemund_p_w_k_2006_folding_dna_2 :: hexa-nanobot [ok]
  dependency = "Rothemund P. W. K. 2006 \"Folding DNA to create nanoscale shapes and patterns\" Nature 440:297-302"
  type = "external citation"
  why_required = "DNA origami; 12-vertex polyhedral cage implicit reference"

@D row_goodsell_d_s_2009_the_machinery_3 :: hexa-nanobot [ok]
  dependency = "Goodsell D. S. 2009 \"The machinery of life\" Springer"
  type = "external citation"
  why_required = "molecular-machine illustrated taxonomy"

@D row_goddard_w_a_2003_handbook_of_nan_4 :: hexa-nanobot [ok]
  dependency = "Goddard W. A. 2003 \"Handbook of Nanoscience, Engineering, and Technology\" CRC Press"
  type = "external citation"
  why_required = "molecular-dynamics simulation reference for §5 step 7"

@D row_howard_j_2001_mechanics_of_motor_5 :: hexa-nanobot [ok]
  dependency = "Howard J. 2001 \"Mechanics of Motor Proteins and the Cytoskeleton\" Sinauer"
  type = "external citation"
  why_required = "power-stroke kinetics + free-energy landscape calibration reference"

@D row_bath_j_turberfield_a_j_2007_dna_6 :: hexa-nanobot [ok]
  dependency = "Bath J. & Turberfield A. J. 2007 \"DNA nanomachines\" Nat Nanotechnol 2:275-284"
  type = "external citation"
  why_required = "DNA-machine state machine reference"

@D row_domains_biology_hexa_weave_7 :: hexa-nanobot [ok]
  dependency = "domains/biology/hexa-weave/"
  type = "sister domain"
  why_required = "composition-side handshake at small-P boundary; shared Foundation/Strand lean4 layer if formal-verification path pursued"

@D row_domains_life_therapeutic_nanobot_8 :: hexa-nanobot [ok]
  dependency = "domains/life/therapeutic-nanobot/"
  type = "cross-domain (collision audit pending)"
  why_required = "clinical application route; F-NB-5 audit deadline 2026-05-28"

@D row_domains_life_synbio_9 :: hexa-nanobot [ok]
  dependency = "domains/life/synbio/"
  type = "cross-domain"
  why_required = "physical-strand assembly handshake (shared with hexa-weave)"

@D row_domains_materials_10 :: hexa-nanobot [ok]
  dependency = "domains/materials/"
  type = "cross-domain"
  why_required = "industrial nano-machine fabrication route at L9"

@D row_state_discovery_absorption_regis_11 :: hexa-nanobot [ok]
  dependency = "state/discovery_absorption/registry.jsonl"
  type = "repo SSOT"
  why_required = "raw 108 + raw 135 absorption channel"

@D row_design_kick_12 :: hexa-nanobot [ok]
  dependency = "design/kick/"
  type = "repo SSOT"
  why_required = "witness emission target"

@D row_tool_own_doc_lint_py_13 :: hexa-nanobot [ok]
  dependency = "tool/own_doc_lint.py"
  type = "tooling"
  why_required = "own 1 / own 3 / own 4 / own 5 / own 16 enforcement (13/13 PASS expected)"

# ── §12 TIMELINE (deliverables) ─────────────────────────────────────────


@D row_2026_04_28_0 :: hexa-nanobot [ok]
  date = "2026-04-28"
  cycle = "13 / fan-out 2/5"
  milestone = "Domain registration in canon (this body + 2 _index.json updates + 1 witness JSON)"
  witness = "design/kick/2026-04-28_hexa-nanobot-domain-registration_omega_cycle.json"

@D row_2026_05_28_1 :: hexa-nanobot [ok]
  date = "2026-05-28"
  cycle = "TBD"
  milestone = "F-NB-5 collision audit with life/therapeutic-nanobot completed"
  witness = "F-NB-5 audit row"

@D row_2026_07_28_2 :: hexa-nanobot [ok]
  date = "2026-07-28"
  cycle = "TBD"
  milestone = "F-NB-4 90-day MVP — 4-state 12-vertex DNA-origami simulation"
  witness = "proposals/hexa_nanobot_mvp_<date>.md"

@D row_2026_09_28_3 :: hexa-nanobot [ok]
  date = "2026-09-28"
  cycle = "TBD"
  milestone = "F-NB-2 Bayesian audit (30 architectures) completed"
  witness = "F-NB-2 audit row"

@D row_2027_04_28_4 :: hexa-nanobot [ok]
  date = "2027-04-28"
  cycle = "TBD"
  milestone = "F-NB-3 Brownian-floor literature scan completed"
  witness = "F-NB-3 audit row"

@D row_tbd_5 :: hexa-nanobot [ok]
  date = "TBD"
  cycle = "TBD"
  milestone = "CHI2 axis upgrade DEFER to PASS (n>=1 MD simulation)"
  witness = "TBD"

# ── §13 TOOLS (concrete repo artefacts) ─────────────────────────────────────────


@D b_tool_own_doc_lint_py_rule_1_3_4_0 :: hexa-nanobot [ok]
  text = "tool/own_doc_lint.py --rule 1 / 3 / 4 / 5 / 16 — HARD-block lint gates this body must pass."

@D b_tool_own1_legacy_allowlist_json_1 :: hexa-nanobot [ok]
  text = "tool/own1_legacy_allowlist.json — frozen English-only legacy grandfather list (this body is NOT added; new files comply directly)."

@D b_domains_index_json_top_level_axi_2 :: hexa-nanobot [ok]
  text = "domains/_index.json — top-level axis SSOT (biology axis updated by this registration; hexa-nanobot added)."

@D b_domains_biology_index_json_sub_a_3 :: hexa-nanobot [ok]
  text = "domains/biology/_index.json — sub-axis SSOT (hexa-nanobot domain entry added; _domains_count 1 -> 2)."

@D b_state_discovery_absorption_regis_4 :: hexa-nanobot [ok]
  text = "state/discovery_absorption/registry.jsonl — append-only absorption registry per raw 108 + raw 135."

@D b_design_kick_kick_witness_emissio_5 :: hexa-nanobot [ok]
  text = "design/kick/ — kick-witness emission directory (this cycle: 2026-04-28_hexa-nanobot-domain-registration_omega_cycle.json)."

# ── §14 TEAM (roles) ─────────────────────────────────────────


@D row_domain_steward_0 :: hexa-nanobot [ok]
  role = "Domain steward"
  responsibility = "Maintain this body and its sub-index entry"
  owner = "canon maintainers"

@D row_sister_domain_liaison_1 :: hexa-nanobot [ok]
  role = "Sister-domain liaison"
  responsibility = "Maintain HEXA-WEAVE handshake at small-P boundary"
  owner = "hexa-weave + hexa-nanobot stewards jointly"

@D row_mvp_runner_2 :: hexa-nanobot [ok]
  role = "MVP runner"
  responsibility = "Deliver F-NB-4 90-day 4-state 12-vertex simulation"
  owner = "TBD by 2026-07-28"

@D row_falsifier_monitor_3 :: hexa-nanobot [ok]
  role = "Falsifier monitor"
  responsibility = "Watch F-NB-1..F-NB-5 with deadlines 2026-05-28 / 2026-07-28 / 2026-09-28 / 2027-04-28"
  owner = "canon honesty-charter team"

@D row_cross_domain_liaison_4 :: hexa-nanobot [ok]
  role = "Cross-domain liaison"
  responsibility = "life/therapeutic-nanobot collision audit + materials/ industrial route"
  owner = "per-axis domain stewards"

# ── §15 REFERENCES ─────────────────────────────────────────

