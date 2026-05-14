#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# HEXA-WEAVE — write-side multi-strand molecular design composition under the n=6 invariant
# ══════════════════════════════════════════════════════════════

# Positioning: HEXA-WEAVE is the canon write-side counterpart to AlphaFold 3 (DeepMind 2024-05, open read-side single-protein prediction) and IsoDDE (Isomorphic Labs 2026-02, proprietary closed drug-design). Where FOLD answers "given a sequence, what is its structure?", WEAVE answers "given a target multi-molecule context, design the strand-set that produces it." The shift is from prediction over a single chain to composition over a strand bundle, threaded by the n6 invariant lattice (σ(6)=12 / τ(6)=4 / φ(6)=2 / J₂=24).
# >
# **Read-side oracle absorption** (cycle-30++++++++ backport from hexa-matter Phase G): the FOLD-class systems we cite as "Primary oracle" have concrete adapters under [`_absorption_bridge/`](_absorption_bridge/README.md) — [AlphaFold-3](_absorption_bridge/alphafold3/SOURCES.md) (NON-COMMERCIAL RESEARCH ONLY), [RoseTTAFold](_absorption_bridge/rosettafold/SOURCES.md), [ESMFold](_absorption_bridge/esmfold/SOURCES.md), [OpenFold](_absorption_bridge/openfold/SOURCES.md), [ColabFold](_absorption_bridge/colabfold/SOURCES.md) (commercial-OK siblings), plus [Foldseek](_absorption_bridge/foldseek/SOURCES.md) / [MMseqs2](_absorption_bridge/mmseqs/SOURCES.md) (search), and [UniProt](_absorption_bridge/uniprot/SOURCES.md) / [PDB](_absorption_bridge/pdb/SOURCES.md) (references). No n=6 lattice-fit is applied to their outputs (raw#10 C3); each adapter passes through the system's OWN published metrics (pLDDT, pTM, lDDT, E-value, ...) untouched.

# ── §1 WHY (why a write-side weave layer matters) ─────────────────────────────────────────


@D row_direction_0 :: hexa-weave [ok]
  aspect = "Direction"
  read_side_alphafold_3_isodde = "Sequence to structure"
  write_side_hexa_weave = "Target context to strand-set"

@D row_object_1 :: hexa-weave [ok]
  aspect = "Object"
  read_side_alphafold_3_isodde = "Single chain or small complex"
  write_side_hexa_weave = "Multi-strand bundle (P up to 10^4)"

@D row_cost_driver_2 :: hexa-weave [ok]
  aspect = "Cost driver"
  read_side_alphafold_3_isodde = "Inference compute"
  write_side_hexa_weave = "Inverse-search × Landauer floor"

@D row_constraint_set_3 :: hexa-weave [ok]
  aspect = "Constraint set"
  read_side_alphafold_3_isodde = "Geometric likelihood"
  write_side_hexa_weave = "Geometry + thermodynamics + proteome non-interference"

@D row_open_vs_closed_4 :: hexa-weave [ok]
  aspect = "Open vs closed"
  read_side_alphafold_3_isodde = "AF3 open, IsoDDE proprietary"
  write_side_hexa_weave = "HEXA-WEAVE open under canon"

@D row_verdict_horizon_5 :: hexa-weave [ok]
  aspect = "Verdict horizon"
  read_side_alphafold_3_isodde = "Empirical (CASP)"
  write_side_hexa_weave = "Theoretical-analytical (this revision)"

# ── §2 COMPARE (HEXA-WEAVE vs FOLD-class systems) — ASCII chart ─────────────────────────────────────────


# ── §3 REQUIRES (prerequisites) ─────────────────────────────────────────


@D row_single_chain_folding_inference_0 :: hexa-weave [ok]
  prerequisite_area = "Single-chain folding inference"
  required_level = "Advanced"
  core_techniques = "AF3-class structure prediction, MSA pipelines, distogram heads"

@D row_inverse_folding_search_1 :: hexa-weave [ok]
  prerequisite_area = "Inverse-folding search"
  required_level = "Advanced"
  core_techniques = "NP-hardness aware heuristics, Monte Carlo with reverse-mathematics calibration"

@D row_thermodynamic_accounting_2 :: hexa-weave [ok]
  prerequisite_area = "Thermodynamic accounting"
  required_level = "Intermediate"
  core_techniques = "Landauer kT ln 2 per irreversible bit, cellular heat budget bounds"

@D row_proteome_compatibility_3 :: hexa-weave [ok]
  prerequisite_area = "Proteome compatibility"
  required_level = "Advanced"
  core_techniques = "Off-target avoidance certification, polynomial-hierarchy verifier"

@D row_n6_invariant_grounding_4 :: hexa-weave [ok]
  prerequisite_area = "n6 invariant grounding"
  required_level = "Advanced"
  core_techniques = "σ(6)=12, τ(6)=4, φ(6)=2, J₂=24 lattice for axis cardinalities"

@D row_reverse_mathematics_literacy_5 :: hexa-weave [ok]
  prerequisite_area = "Reverse-mathematics literacy"
  required_level = "Intermediate"
  core_techniques = "Π¹_1-CA₀ totality, Bachmann-Howard ψ(Ω_ω) calibration"

# ── §4 STRUCT (4-axis composition architecture) ─────────────────────────────────────────


# ── §5 FLOW (sequential composition pipeline) ─────────────────────────────────────────


# ── §6 EVOLVE (16-level abstraction ladder + cycle 1-8 milestone trace) ─────────────────────────────────────────


@D row_1_0 :: hexa-weave [ok]
  cycle = "1"
  phase = "Domain registration"
  deliverable = "Closure witness PASS + this body (254 lines)"
  witness = "`design/kick/2026-04-28_hexa-weave-closure_omega_cycle.json`"

@D row_2_1 :: hexa-weave [ok]
  cycle = "2"
  phase = "W1 architecture"
  deliverable = "MVP architecture decision + lean4 audit baseline"
  witness = "`design/kick/2026-04-28_hexa-weave-mvp-w1-architecture_omega_cycle.json` + W1-lean4-audit"

@D row_3_2 :: hexa-weave [ok]
  cycle = "3"
  phase = "W2 spec"
  deliverable = "AX-1 lean4 reverse PROVED + bounded forward PASS, mathlib pin advanced (rc1 → rev `19c4978`)"
  witness = "`design/kick/2026-04-28_hexa-weave-mvp-w2-base-model_omega_cycle.json`"

@D row_4_3 :: hexa-weave [ok]
  cycle = "4"
  phase = "W3 lean4 AX-1 / AX-2"
  deliverable = "Robin/Hardy-Wright tail named axiom + AX-2 ZFC+V_κ fallback path"
  witness = "`design/kick/2026-04-28_lean4-w3-ax1-robin_omega_cycle.json` + `design/kick/2026-04-28_lean4-w3-ax2_omega_cycle.json`"

@D row_5_4 :: hexa-weave [ok]
  cycle = "5"
  phase = "W4 MK decision"
  deliverable = "MK-bridge option-(ii) ZFC+V_κ vs option-(iii) hybrid; option-(ii) selected"
  witness = "`design/kick/2026-04-28_lean4-w4-mk-decision_omega_cycle.json`"

@D row_6_7_5 :: hexa-weave [ok]
  cycle = "6-7"
  phase = "W5 sorry-free"
  deliverable = "All AX-2 opaque-bridge `sorry`s discharged via named axioms (sorry count 2 → 0); papers/ Option-E disclosure first paper drafted"
  witness = "`design/kick/2026-04-28_lean4-w5-ax2-integration_omega_cycle.json` + `papers/hexa-weave-formal-mechanical-w2-2026-04-28.md`"

@D row_8_6 :: hexa-weave [ok]
  cycle = "8"
  phase = "W6 axiom-shared refactor"
  deliverable = "`Foundation/Strand.lean` + `Foundation/Axioms.lean` extracted; 6-axiom (4 MKBridge + 2 AX2 mirror) duplication collapsed to 5 unique + 2 derived theorems; F-W5-AX2-1 RESOLVED; Felgner conservativity decomposed into 3 named sub-axioms (step1 V_κ-bounding / step2 V_κ ⊨ ZFC / step3 L_ZFC-relativization)"
  witness = "`design/kick/2026-04-28_lean4-w6-axioms-refactor_omega_cycle.json` + `design/kick/2026-04-28_lean4-w6-felgner-full-proof_omega_cycle.json`"

@D row_9_7 :: hexa-weave [ok]
  cycle = "9"
  phase = "Domain-doc sync (this update)"
  deliverable = "§6/§7/§9/§10/§11/§12/§15 refreshed to reflect cycle 7-8 milestones"
  witness = "`design/kick/2026-04-28_domain-doc-update-cycle9_omega_cycle.json`"

@D row_l0_8 :: hexa-weave [ok]
  level = "L0"
  object = "Atomic coordinates"
  cardinality_bound = "~10^2 atoms per residue"

@D row_l1_9 :: hexa-weave [ok]
  level = "L1"
  object = "Residue-level dihedrals"
  cardinality_bound = "20 alphabet × τ(6)=4 confs"

@D row_l2_10 :: hexa-weave [ok]
  level = "L2"
  object = "Single-chain fold"
  cardinality_bound = "10^N conformations (N up to 350)"

@D row_l3_11 :: hexa-weave [ok]
  level = "L3"
  object = "Two-chain interface"
  cardinality_bound = "pairwise products"

@D row_l4_12 :: hexa-weave [ok]
  level = "L4"
  object = "Small complex (n ≤ 6)"
  cardinality_bound = "combinatorial small"

@D row_l5_13 :: hexa-weave [ok]
  level = "L5"
  object = "Sub-bundle (n ≤ 12)"
  cardinality_bound = "σ(6)=12 strategy axis"

@D row_l6_14 :: hexa-weave [ok]
  level = "L6"
  object = "Domain bundle"
  cardinality_bound = "10^2-10^3 strands"

@D row_l7_15 :: hexa-weave [ok]
  level = "L7"
  object = "Pathway bundle"
  cardinality_bound = "10^3 strands"

@D row_l8_16 :: hexa-weave [ok]
  level = "L8"
  object = "Cellular sub-proteome"
  cardinality_bound = "10^3-10^4 strands"

@D row_l9_17 :: hexa-weave [ok]
  level = "L9"
  object = "Whole proteome design space"
  cardinality_bound = "10^4 strands × N=350 aa"

@D row_l10_18 :: hexa-weave [ok]
  level = "L10"
  object = "Kinetic envelope"
  cardinality_bound = "time × space joint"

@D row_l11_19 :: hexa-weave [ok]
  level = "L11"
  object = "Thermodynamic accounting"
  cardinality_bound = "Landauer kT ln 2 floor"

@D row_l12_20 :: hexa-weave [ok]
  level = "L12"
  object = "Computational verification"
  cardinality_bound = "Π^p_2 / Σ^p_2 ladder"

@D row_l13_21 :: hexa-weave [ok]
  level = "L13"
  object = "Polynomial-hierarchy escape audit"
  cardinality_bound = "no PH collapse loophole"

@D row_l14_22 :: hexa-weave [ok]
  level = "L14"
  object = "Reverse-mathematics calibration"
  cardinality_bound = "Π¹_1-CA₀ totality"

@D row_l_23 :: hexa-weave [ok]
  level = "L_ω"
  object = "Bachmann-Howard ordinal closure"
  cardinality_bound = "ψ(Ω_ω) binding"

# ── §7 VERIFY (raw 70 K≥4 verification axes + cycle 7-8 mechanical evidence) ─────────────────────────────────────────


@D row_constants_0 :: hexa-weave [ok]
  axis = "CONSTANTS"
  verification_claim = "n6 quartet σ(6)=12, τ(6)=4, φ(6)=2, J₂=24 hold across §4 / §5 / §6"
  evidence = "manual cross-check vs `tool/own_doc_lint.py --rule 2` canonical set"
  status = "PASS"

@D row_dimensions_1 :: hexa-weave [ok]
  axis = "DIMENSIONS"
  verification_claim = "P=10^4 proteins, N=350 aa, alphabet=20 dimensionally consistent in Landauer arithmetic"
  evidence = "closure witness §closure_construction.scale_numbers"
  status = "PASS"

@D row_cross_2 :: hexa-weave [ok]
  axis = "CROSS"
  verification_claim = "tri-axis Ω-saturation cross-checked via `design/kick/2026-04-28_hexa-weave-closure_omega_cycle.json` saturation_witness block"
  evidence = "witness JSON"
  status = "PASS"

@D row_scaling_3 :: hexa-weave [ok]
  axis = "SCALING"
  verification_claim = "search cost scales as exp(P*N) per Berger-Leighton"
  evidence = "witness physical_axis.binding_witness"
  status = "PASS"

@D row_sensitivity_4 :: hexa-weave [ok]
  axis = "SENSITIVITY"
  verification_claim = "choice of binding workload (a/b/c/d) — (d) selected because (a)(b)(c) leave at least one axis non-binding"
  evidence = "witness closure_construction.rationale"
  status = "PASS"

@D row_limits_5 :: hexa-weave [ok]
  axis = "LIMITS"
  verification_claim = "APPROACH grade, not ABSOLUTE; theoretical-analytical, not empirical"
  evidence = "raw 69 ceiling-classification per §1 limit clause"
  status = "PASS"

@D row_chi2_6 :: hexa-weave [ok]
  axis = "CHI2"
  verification_claim = "quantitative chi-squared validation against measured cellular heat budget (Brown 2009)"
  evidence = "closure witness flags this axis as DEFER n=1"
  status = "DEFER"

@D row_counter_7 :: hexa-weave [ok]
  axis = "COUNTER"
  verification_claim = "counter-evidence search: a viable empirical inverse-design at proteome scale would falsify the Landauer-binding claim"
  evidence = "F-CL2-a falsifier registered"
  status = "PASS"

@D row_mechanical_cycle_7_8_8 :: hexa-weave [ok]
  axis = "MECHANICAL (cycle 7-8)"
  verification_claim = "lean4 project-wide `lake build` PASS; sorry count 0; 7 named axioms surfaced via `#print axioms` (5 unique after W6 mirror collapse + 2 derived theorems)"
  evidence = "`lean4-n6/N6/MechVerif/Foundation/Axioms.lean` (single source) + `papers/hexa-weave-formal-mechanical-w2-2026-04-28.md` Option-E disclosure"
  status = "PASS"

@D row_lint_cycle_9_9 :: hexa-weave [ok]
  axis = "LINT (cycle 9)"
  verification_claim = "`tool/own_doc_lint.py` 13/13 PASS on this body and the 6 cycle 1-8 hexa-weave proposals"
  evidence = "`reports/n6_own_doc_lint.json`"
  status = "PASS"

# ── §8 IDEAS (research seeds) ─────────────────────────────────────────


# ── §9 METRICS (quantitative targets + cycle 7-8 progress) ─────────────────────────────────────────


@D row_p_proteome_size_in_mvp_0 :: hexa-weave [ok]
  metric = "P (proteome size in MVP)"
  current_cycle_8_actual = "0 (no empirical run)"
  90_day_mvp_target = "10"
  stretch = "100"

@D row_n_mean_residues_per_strand_1 :: hexa-weave [ok]
  metric = "N (mean residues per strand)"
  current_cycle_8_actual = "0"
  90_day_mvp_target = "50"
  stretch = "150"

@D row_closure_verdict_tier_raw_69_2 :: hexa-weave [ok]
  metric = "Closure-verdict tier (raw 69)"
  current_cycle_8_actual = "APPROACH"
  90_day_mvp_target = "APPROACH-EMPIRICAL"
  stretch = "LIMIT"

@D row_tri_axis_binding_3 :: hexa-weave [ok]
  metric = "Tri-axis binding"
  current_cycle_8_actual = "PASS theoretical"
  90_day_mvp_target = "PASS theoretical + 1 axis empirical"
  stretch = "PASS all 3 empirical"

@D row_falsifier_count_4 :: hexa-weave [ok]
  metric = "Falsifier count"
  current_cycle_8_actual = "12 (9 closure + 3 cycle 7-9 additions: F-W5-AX2-1 RESOLVED, F-MANUAL-LOGIN active, F-CL-FORMAL-4 PARTIAL)"
  90_day_mvp_target = "12"
  stretch = "20"

@D row_raw_70_axes_pass_5 :: hexa-weave [ok]
  metric = "Raw 70 axes PASS"
  current_cycle_8_actual = "8 of 9 (added MECHANICAL + LINT cycle 7-8)"
  90_day_mvp_target = "9 of 9 with empirical anchor"
  stretch = "9 of 9 with n>1 on every axis"

@D row_witness_count_in_design_kick_6 :: hexa-weave [ok]
  metric = "Witness count in `design/kick/`"
  current_cycle_8_actual = "14 (cycle 1 closure + W1-W6 trace + Mk.X TRANSCEND chain)"
  90_day_mvp_target = "5+"
  stretch = "12"

@D row_chi2_sample_size_n_7 :: hexa-weave [ok]
  metric = "CHI2 sample size n"
  current_cycle_8_actual = "1 (DEFER)"
  90_day_mvp_target = "5 (PASS)"
  stretch = "30"

@D row_lean4_sorry_count_8 :: hexa-weave [ok]
  metric = "**lean4 sorry count**"
  current_cycle_8_actual = "**0** (cycle 7 W5 milestone)"
  90_day_mvp_target = "0"
  stretch = "0"

@D row_lean4_named_axioms_9 :: hexa-weave [ok]
  metric = "**lean4 named axioms**"
  current_cycle_8_actual = "**7** (5 unique + 2 derived theorems after W6 mirror collapse; Felgner decomposed into 3 sub-axioms)"
  90_day_mvp_target = "7 unchanged or strictly fewer"
  stretch = "≤3 (full Felgner mechanisation)"

@D row_f_d_3_deadline_miss_probability_10 :: hexa-weave [ok]
  metric = "F-D-3 deadline-miss probability"
  current_cycle_8_actual = "50-58% (post-W6, -2pp vs W5; -8pp vs W4 58-66%; cumulative -15-17pp from earliest W3 estimate ~65-75%)"
  90_day_mvp_target = "< 40% (W7-W9 burndown)"
  stretch = "< 25%"

@D row_foundation_refactor_loc_11 :: hexa-weave [ok]
  metric = "Foundation refactor LoC"
  current_cycle_8_actual = "+201 lines (`Foundation/Axioms.lean`) + leaf `Foundation/Strand.lean`; -2 mirror axiom blocks in AX2.lean; net +N for shared SSOT"
  90_day_mvp_target = "stable"
  stretch = "further consolidation"

@D row_external_paper_option_e_12 :: hexa-weave [ok]
  metric = "External paper (Option-E)"
  current_cycle_8_actual = "1 (`papers/hexa-weave-formal-mechanical-w2-2026-04-28.md`, ~80+ pages, verify-embedded sympy snippet PASS)"
  90_day_mvp_target = "+1 Zenodo deposit (gated on user approval)"
  stretch = "full peer-review submission"

# ── §10 RISKS (and falsifiers per raw 71, ≥3 per measurable claim) ─────────────────────────────────────────


@D b_f_cl2_a_a_published_replication_0 :: hexa-weave [ok]
  text = "F-CL2-a: a published replication of cellular thermodynamic accounting at proteome-scale inverse-design that shows budget is met within 10^3 orders (not 10^6) would falsify \"binding by 10^6 orders\"."

@D b_f_cl2_b_discovery_of_a_cellular_1 :: hexa-weave [ok]
  text = "F-CL2-b: discovery of a cellular reversible-computation pathway that bypasses Landauer for inverse-folding would falsify the irreversibility premise."

@D b_f_cl2_c_measurement_showing_brow_2 :: hexa-weave [ok]
  text = "F-CL2-c: measurement showing Brown 2009 cellular heat budget is off by >5 orders of magnitude would invalidate the binding arithmetic."

@D b_f_cl3_a_a_constructive_proof_of_3 :: hexa-weave [ok]
  text = "F-CL3-a: a constructive proof of P=NP would not yet falsify (verifier is Π^p_2, not Σ^p_1) — but a PH collapse to P would falsify the binding claim."

@D b_f_cl3_b_a_heuristic_that_solves_4 :: hexa-weave [ok]
  text = "F-CL3-b: a heuristic that solves a representative ∀∃ off-target avoidance instance in polynomial time on a proteome-scale benchmark would falsify \"no escape\"."

@D b_f_cl3_c_discovery_that_proteome_5 :: hexa-weave [ok]
  text = "F-CL3-c: discovery that proteome compatibility is in fact in coNP (not Π^p_2 hard) would weaken the binding."

@D b_f_tp5_b_failure_to_deliver_an_en_6 :: hexa-weave [ok]
  text = "F-TP5-b: failure to deliver an end-to-end MVP run with P≥10, N≥50 by 2026-07-28 falsifies the YES domain-registration upgrade and reverts the recommendation to YES_CONDITIONAL."

@D b_f_tp5_c_an_mvp_run_that_complete_7 :: hexa-weave [ok]
  text = "F-TP5-c: an MVP run that completes but exceeds the Landauer floor in a measurable way would constitute internal contradiction and trigger retraction."

@D b_f_tp5_d_an_mvp_run_whose_witness_8 :: hexa-weave [ok]
  text = "F-TP5-d: an MVP run whose witness JSON fails the absorption pipeline (raw 108 classifier rejection) would falsify the absorption-channel design."

@D b_f_cl_formal_4_cycle_9_partial_re_9 :: hexa-weave [ok]
  text = "F-CL-FORMAL-4 (cycle 9 PARTIAL-RESOLVED, separate fan-out): `#print axioms` of any cycle 8+ AX-1 / AX-2 theorem reveals an axiom OUTSIDE the declared 7-set (Felgner step1/step2/step3, felgner_bridge_to_MK, strand_zfc_witness, hexa_comp_closure_via_ZFC, robin_hardy_wright_ax1_tail) → axiom-residual escape detected, retract sorry-free milestone."

@D b_f_cl_formal_4_b_a_lake_build_fai_10 :: hexa-weave [ok]
  text = "F-CL-FORMAL-4-b: a `lake build` failure on cycle 8 HEAD against `mathlib4 rev 19c4978` would falsify the cycle 7 sorry-free claim."

@D b_f_cl_formal_4_c_discovery_that_a_11 :: hexa-weave [ok]
  text = "F-CL-FORMAL-4-c: discovery that any of the 7 named axioms is logically inconsistent (e.g., Felgner conservativity refuted, or Robin tail counter-example at n > 50) would invalidate the entire mechanical layer and force retraction of `papers/hexa-weave-formal-mechanical-w2-2026-04-28.md`."

@D b_f_manual_login_11_profile_manual_12 :: hexa-weave [ok]
  text = "F-MANUAL-LOGIN: 11 profile manual `/login` not completed by 2026-04-29 24:00 UTC → infrastructure-side completion claim falsified (carries the user-side residual after F-CL-JOINT-9 SCOPE-NARROW disposition)."

@D b_f_user_gate_w5_w5_sandbox_attemp_13 :: hexa-weave [ok]
  text = "F-USER-GATE-W5: W5 sandbox attempt proceeds without user approval → own 17-style governance violation; retract."

@D b_f_user_gate_zenodo_zenodo_doi_de_14 :: hexa-weave [ok]
  text = "F-USER-GATE-ZENODO: Zenodo DOI deposit proceeds without explicit user approval → external-disclosure governance violation; retract."

# ── §11 DEPENDENCIES (external + cross-domain + cycle 7-8 mechanical) ─────────────────────────────────────────


@D row_alphafold_3_deepmind_2024_05_0 :: hexa-weave [ok]
  dependency = "AlphaFold 3 (DeepMind 2024-05)"
  type = "external open"
  why_required = "strand catalogue read-side oracle"

@D row_isodde_isomorphic_labs_2026_02_1 :: hexa-weave [ok]
  dependency = "IsoDDE (Isomorphic Labs 2026-02)"
  type = "external proprietary"
  why_required = "benchmark comparison only, not a runtime dependency"

@D row_openfold_v2_2_0_2 :: hexa-weave [ok]
  dependency = "OpenFold v2.2.0"
  type = "external open"
  why_required = "W3+W4 base-model integration spec target (`proposals/hexa_weave_mvp_w4_openfold_dryrun_2026_04_28.md`)"

@D row_lean_4_toolchain_leanprover_lean_3 :: hexa-weave [ok]
  dependency = "Lean 4 toolchain `leanprover/lean4:v4.30.0-rc1`"
  type = "external open"
  why_required = "mechanical verification base (cycle 7-8)"

@D row_mathlib4_rev_19c497800a418208f97_4 :: hexa-weave [ok]
  dependency = "mathlib4 rev `19c497800a418208f973be74c9f5c5901aac2f54`"
  type = "external open"
  why_required = "mathlib pin (advanced from initial v4.30.0-rc2 path during cycle 3 spec corrigendum); used by `Foundation/Axioms.lean` Class / Cardinal / ArithmeticFunction / Totient imports"

@D row_felgner_u_1971_comparison_of_axi_5 :: hexa-weave [ok]
  dependency = "Felgner U. 1971 \"Comparison of axioms of local and universal choice\" Studia Logica 28:25-37"
  type = "external citation"
  why_required = "cited as named axiom for ZFC↔MK conservativity (Felgner Hauptsatz §3 step1/step2/step3); Drake 1974 §3.4, Jech 2003 §12.1, Williams 1976 corroborate"

@D row_hardy_wright_heath_brown_ed_an_i_6 :: hexa-weave [ok]
  dependency = "Hardy & Wright (Heath-Brown ed.) \"An Introduction to the Theory of Numbers\" Thm 322, 328"
  type = "external citation"
  why_required = "cited for AX-1 unbounded tail asymptotic (n > 50 ¬AX1Eq n)"

@D row_robin_g_1984_grandes_valeurs_de_7 :: hexa-weave [ok]
  dependency = "Robin G. 1984 \"Grandes valeurs de la fonction somme des diviseurs et hypothèse de Riemann\" J Math Pures Appl 63:187-213"
  type = "external citation"
  why_required = "cited at the asymptotic bound; **NOT used to claim Riemann Hypothesis solved** (own 11 BT-solution-claim-ban respected)"

@D row_wigert_s_1907_sur_l_ordre_de_gra_8 :: hexa-weave [ok]
  dependency = "Wigert S. 1907 \"Sur l'ordre de grandeur du nombre des diviseurs d'un entier\" Arkiv för Matematik 3"
  type = "external citation"
  why_required = "cited for τ(n) growth bound used in tail axiom"

@D row_lean4_n6_9 :: hexa-weave [ok]
  dependency = "`lean4-n6/`"
  type = "sister directory"
  why_required = "mechanical verification body (`N6/MechVerif/{AX1,AX2,MKBridge}.lean` + `Foundation/{Strand,Axioms}.lean`)"

@D row_domains_life_synbio_10 :: hexa-weave [ok]
  dependency = "`domains/life/synbio/`"
  type = "cross-domain"
  why_required = "physical-strand assembly handshake"

@D row_domains_life_crispr_gene_editing_11 :: hexa-weave [ok]
  dependency = "`domains/life/crispr-gene-editing/`"
  type = "cross-domain"
  why_required = "edit-vector generation downstream"

@D row_domains_life_bio_pharma_12 :: hexa-weave [ok]
  dependency = "`domains/life/bio-pharma/`"
  type = "cross-domain"
  why_required = "drug-design comparison"

@D row_state_discovery_absorption_regis_13 :: hexa-weave [ok]
  dependency = "`state/discovery_absorption/registry.jsonl`"
  type = "repo SSOT"
  why_required = "raw 108 + raw 135 absorption channel"

@D row_design_kick_14 :: hexa-weave [ok]
  dependency = "`design/kick/`"
  type = "repo SSOT"
  why_required = "witness emission target"

@D row_tool_own_doc_lint_py_15 :: hexa-weave [ok]
  dependency = "`tool/own_doc_lint.py`"
  type = "tooling"
  why_required = "own 1 / own 3 / own 4 / own 5 / own 16 enforcement (13/13 PASS)"

# ── §12 TIMELINE (deliverables; cycle 1-8 actual + cycle 9+ planned) ─────────────────────────────────────────


@D row_2026_04_28_0 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "1"
  milestone = "Predecessor witness PARTIAL"
  witness = "`design/kick/2026-04-28_hexa-weave-abstraction-to-limits_omega_cycle.json`"

@D row_2026_04_28_1 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "1"
  milestone = "Closure witness PASS"
  witness = "`design/kick/2026-04-28_hexa-weave-closure_omega_cycle.json`"

@D row_2026_04_28_2 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "1"
  milestone = "Domain registration in canon"
  witness = "this body + `_index.json` updates"

@D row_2026_04_28_3 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "2"
  milestone = "W1 architecture decision + lean4 audit baseline"
  witness = "`design/kick/2026-04-28_hexa-weave-mvp-w1-architecture_omega_cycle.json` + W1-lean4-audit"

@D row_2026_04_28_4 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "3"
  milestone = "W2 base-model integration spec + AX-1 lean4 reverse-direction PROVED + bounded forward [2,30] PASS"
  witness = "`design/kick/2026-04-28_hexa-weave-mvp-w2-base-model_omega_cycle.json`"

@D row_2026_04_28_5 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "4"
  milestone = "W3 AX-1 Robin/Hardy-Wright/Wigert tail named axiom + AX-2 ZFC+V_κ bridge"
  witness = "`design/kick/2026-04-28_lean4-w3-ax1-robin_omega_cycle.json` + `design/kick/2026-04-28_lean4-w3-ax2_omega_cycle.json`"

@D row_2026_04_28_6 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "5"
  milestone = "W4 MK-bridge decision (option-(ii) ZFC+V_κ vs option-(iii) hybrid axiomatic MK; option-(ii) selected)"
  witness = "`design/kick/2026-04-28_lean4-w4-mk-decision_omega_cycle.json`"

@D row_2026_04_28_7 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "6-7"
  milestone = "**W5 SORRY-FREE milestone** — AX-2 opaque-bridge sorrys 2 → 0 via named axioms; project-wide `lake build` PASS"
  witness = "`design/kick/2026-04-28_lean4-w5-ax2-integration_omega_cycle.json`"

@D row_2026_04_28_8 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "7"
  milestone = "First papers/ Option-E external paper drafted (verify-embedded sympy snippet PASS)"
  witness = "`papers/hexa-weave-formal-mechanical-w2-2026-04-28.md`"

@D row_2026_04_28_9 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "8"
  milestone = "**W6 axiom-shared refactor** — `Foundation/{Strand,Axioms}.lean` SSOT; F-W5-AX2-1 RESOLVED; Felgner conservativity decomposed into 3 named sub-axioms; F-D-3 -2pp post-W6 (50-58%)"
  witness = "`design/kick/2026-04-28_lean4-w6-axioms-refactor_omega_cycle.json` + `design/kick/2026-04-28_lean4-w6-felgner-full-proof_omega_cycle.json`"

@D row_2026_04_28_10 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "8"
  milestone = "F-CL-JOINT-9 SCOPE-NARROW disposition — infrastructure-side 4/4 PASS; user-side residual handed off to F-MANUAL-LOGIN"
  witness = "`design/kick/2026-04-28_f-cl-joint-9-disposition_omega_cycle.json`"

@D row_2026_04_28_11 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "9"
  milestone = "This domain-doc sync (§6 / §7 / §9 / §10 / §11 / §12 / §15)"
  witness = "`design/kick/2026-04-28_domain-doc-update-cycle9_omega_cycle.json`"

@D row_2026_04_28_12 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "9"
  milestone = "F-CL-FORMAL-4 axiom-residual falsifier registered (PARTIAL-RESOLVED, separate fan-out)"
  witness = "(separate cycle 9 fan-out witness)"

@D row_2026_04_29_24_00_utc_13 :: hexa-weave [ok]
  date = "2026-04-29 24:00 UTC"
  cycle = "—"
  milestone = "**F-MANUAL-LOGIN deadline** — 11 profile manual `/login` (user-action gate, not auto-checkable)"
  witness = "F-MANUAL-LOGIN audit row"

@D row_2026_04_28_14 :: hexa-weave [ok]
  date = "2026-04-28"
  cycle = "—"
  milestone = "Mk.X TRANSCEND universe-ceiling cycle COMPLETED via L4-L5-L6-L7 chain (joint TRANSCEND-PASS-WITH-C3-CAVEATS — STRONG-CONJECTURE chain, not theorem chain)"
  witness = "`design/kick/2026-04-28_hexa-weave-mk-x-transcend-closure-all_omega_cycle.json`"

@D row_2026_07_28_15 :: hexa-weave [ok]
  date = "2026-07-28"
  cycle = "—"
  milestone = "**F-TP5-b 90-day MVP gate** (P≥10, N≥50 end-to-end run; 12-week W1-W12 plan, 35% spec progress as of cycle 8 with W3+W4 spec complete)"
  witness = "spec: `proposals/hexa_weave_mvp_2026_04_28.md` (7 falsifiers, 6 MISS criteria, verifier=numeric_threshold+COUNTER, cost-center=hexa-weave-mvp $270 estimate); MVP W3+W4 specs: `proposals/hexa_weave_mvp_w3_clone_vram_spec_2026_04_28.md` + `proposals/hexa_weave_mvp_w4_openfold_dryrun_2026_04_28.md`"

@D row_tbd_16 :: hexa-weave [ok]
  date = "TBD"
  cycle = "—"
  milestone = "User-approval gates (≥5): W5 sandbox / Zenodo DOI deposit / docker registry / manual /login / external preprint submission"
  witness = "per-gate proposal under `proposals/`"

@D row_tbd_17 :: hexa-weave [ok]
  date = "TBD"
  cycle = "—"
  milestone = "CHI2 axis upgrade DEFER to PASS (n≥5)"
  witness = "TBD"

# ── §13 TOOLS (concrete repo artefacts) ─────────────────────────────────────────


@D b_tool_own_doc_lint_py_rule_1_3_4_0 :: hexa-weave [ok]
  text = "`tool/own_doc_lint.py --rule 1 / 3 / 4 / 5 / 16` — HARD-block lint gates this body must pass."

@D b_tool_own1_legacy_allowlist_json_1 :: hexa-weave [ok]
  text = "`tool/own1_legacy_allowlist.json` — frozen English-only legacy grandfather list (this body is NOT added; new files must comply directly)."

@D b_domains_index_json_top_level_axi_2 :: hexa-weave [ok]
  text = "`domains/_index.json` — top-level axis SSOT (biology axis added by this registration)."

@D b_domains_biology_index_json_sub_a_3 :: hexa-weave [ok]
  text = "`domains/biology/_index.json` — sub-axis SSOT (created by this registration)."

@D b_state_discovery_absorption_regis_4 :: hexa-weave [ok]
  text = "`state/discovery_absorption/registry.jsonl` — append-only absorption registry per raw 108 + raw 135."

@D b_design_kick_kick_witness_emissio_5 :: hexa-weave [ok]
  text = "`design/kick/` — kick-witness emission directory."

# ── §14 TEAM (roles) ─────────────────────────────────────────


@D row_domain_steward_0 :: hexa-weave [ok]
  role = "Domain steward"
  responsibility = "Maintain this body and its sub-index entry"
  owner = "canon maintainers"

@D row_closure_auditor_1 :: hexa-weave [ok]
  role = "Closure auditor"
  responsibility = "Verify tri-axis Ω-saturation witnesses"
  owner = "reverse-math + Landauer reviewers"

@D row_mvp_runner_2 :: hexa-weave [ok]
  role = "MVP runner"
  responsibility = "Deliver F-TP5-b 90-day end-to-end MVP"
  owner = "TBD by 2026-07-28"

@D row_falsifier_monitor_3 :: hexa-weave [ok]
  role = "Falsifier monitor"
  responsibility = "Watch F-CL2-a..c, F-CL3-a..c, F-TP5-b..d"
  owner = "canon honesty-charter team"

@D row_cross_domain_liaison_4 :: hexa-weave [ok]
  role = "Cross-domain liaison"
  responsibility = "Synbio / crispr / bio-pharma handshake"
  owner = "per-axis domain stewards"

# ── §15 REFERENCES ─────────────────────────────────────────

