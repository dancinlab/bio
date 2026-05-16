#!/usr/bin/env bash
# selftest/run_all.sh — wraps the four hexa-bio selftests into one pre-merge gate.
#
# Per `.roadmap.hexa_bio` §A.10 (R1 symlink audit) + §A.9 (F-*-REGRESSION
# preregister) + cycle-26-closure session iter 26-29 (registry consistency).
#
# Exit 0 = all selftests PASS, exit 1 = any FAIL.

set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$HERE/.." && pwd)"

passes=0
fails=0
results=()

run() {
  local label="$1"; shift
  echo "▶ $label"
  if "$@"; then
    echo "  ✓ PASS"
    passes=$((passes + 1))
    results+=("PASS  $label")
  else
    echo "  ✗ FAIL"
    fails=$((fails + 1))
    results+=("FAIL  $label")
  fi
  echo
}

run "r1_symlink_audit"          "$HERE/r1_symlink_audit.sh"
run "tape_lattice_honesty_cohort" bash "$HERE/tape_lattice_honesty_cohort.sh"
run "f_tp5_e_uptake_enumerator" python3 "$HERE/f_tp5_e_uptake_enumerator.py" --root "$REPO_ROOT"
run "regression_audit"          python3 "$HERE/regression_audit.py"
run "registry_consistency_audit" python3 "$HERE/registry_consistency_audit.py"
run "n6_axis_computational_verification" python3 "$HERE/n6_axis_computational_verification.py"
run "ribozyme_mfe_nussinov"     python3 "$REPO_ROOT/_python_bridge/module/ribozyme_mfe_nussinov.py"
run "virocapsid_c5_conformance" python3 "$HERE/virocapsid_c5_conformance.py"
run "nanobot_actuator_v2_reference_emit" python3 "$REPO_ROOT/_python_bridge/module/nanobot_actuator_v2_reference_emit.py"
run "ribozyme_off_target_screen" python3 "$REPO_ROOT/_python_bridge/module/ribozyme_off_target_screen.py"
run "ribozyme_reaction_coordinate_quotient" python3 "$REPO_ROOT/_python_bridge/module/ribozyme_reaction_coordinate_quotient.py"
run "ribozyme_kinetics_simulation" python3 "$REPO_ROOT/_python_bridge/module/ribozyme_kinetics_simulation.py"
run "ribozyme_a1_1_kinetics_perturbation_sweep" python3 "$HERE/ribozyme_a1_1_kinetics_perturbation_sweep.py"
run "ribozyme_a1_2_offtarget_threshold_replay" python3 "$HERE/ribozyme_a1_2_offtarget_threshold_replay.py"
run "ribozyme_a1_3_nussinov_determinism_stress" python3 "$HERE/ribozyme_a1_3_nussinov_determinism_stress.py"
run "nanobot_actuation_simulation" python3 "$REPO_ROOT/_python_bridge/module/nanobot_actuation_simulation.py"
run "virocapsid_pdb_corpus" python3 "$REPO_ROOT/_python_bridge/module/virocapsid_pdb_corpus.py"
run "virocapsid_f_virocapsid_1c_1d_audit" python3 "$HERE/virocapsid_f_virocapsid_1c_1d_audit.py"
run "virocapsid_zlotnick_ode" python3 "$REPO_ROOT/virocapsid/module/zlotnick_ode.py" --selftest
run "lean4_proof_witness_emit" python3 "$REPO_ROOT/_python_bridge/module/lean4_proof_witness_emit.py"
run "nanobot_l6_l7_contract_test" python3 "$REPO_ROOT/_python_bridge/module/nanobot_l6_l7_contract_test.py"
# expansion-layer axes (AXIS/HIERARCHY.tape — NOT core-5; in-silico scope only)
run "metallodrug_coordination_sim"       python3 "$REPO_ROOT/_python_bridge/module/metallodrug_coordination_sim.py"
run "oligonucleotide_hybridization_sim"  python3 "$REPO_ROOT/_python_bridge/module/oligonucleotide_hybridization_sim.py"
run "capsid_assembly_modulator_sim"      python3 "$REPO_ROOT/_python_bridge/module/capsid_assembly_modulator_sim.py"
run "rna_targeting_small_molecule_sim"   python3 "$REPO_ROOT/_python_bridge/module/rna_targeting_small_molecule_sim.py"
run "aptamer_affinity_sim"               python3 "$REPO_ROOT/_python_bridge/module/aptamer_affinity_sim.py"
run "reversible_covalent_sim"            python3 "$REPO_ROOT/_python_bridge/module/reversible_covalent_sim.py"
run "qmirror_chemistry_vqe_gate" bash "$HERE/qmirror_chemistry_vqe_gate.sh"
run "xeno_substrate_gate" bash "$HERE/xeno_substrate_gate.sh"
run "cmt_side_effect_avoidance_audit" python3 "$HERE/cmt_side_effect_avoidance_audit.py"
run "cmt_library_ranking" python3 "$HERE/cmt_library_ranking.py"
run "cmt_vqe_ladder_readiness" bash "$HERE/cmt_vqe_ladder_readiness.sh"
run "cmt_vqe_ladder_4e4o_readiness" bash "$HERE/cmt_vqe_ladder_4e4o_readiness.sh"
run "cmt_uccsd_lih_4e4o_ansatz_readiness" bash "$HERE/cmt_uccsd_lih_4e4o_ansatz_readiness.sh"
run "cmt_uccsd_lih_4e4o_external_nm_readiness" bash "$HERE/cmt_uccsd_lih_4e4o_external_nm_readiness.sh"
run "cmt_uccsd_inproc_nm_readiness" bash "$HERE/cmt_uccsd_inproc_nm_readiness.sh"
run "cmt_uccsd_lih_4e5o_readiness" bash "$HERE/cmt_uccsd_lih_4e5o_readiness.sh"
run "cmt_uccsd_4e5o_readiness" bash "$HERE/cmt_uccsd_4e5o_readiness.sh"
run "adapt_vqe_4e5o_readiness" bash "$HERE/adapt_vqe_4e5o_readiness.sh"
run "cmt_uccsd_4e6o_readiness" bash "$HERE/cmt_uccsd_4e6o_readiness.sh"
run "adapt_vqe_4e6o_readiness" bash "$HERE/adapt_vqe_4e6o_readiness.sh"
run "compute_substrate_routing" python3 "$HERE/compute_substrate_routing.py"
run "akida_workload_readiness" bash "$HERE/akida_workload_readiness.sh"
run "cmt_axis_and_cross_design_audit" python3 "$HERE/cmt_axis_and_cross_design_audit.py"
run "cmt_smiles_validation" python3 "$HERE/cmt_smiles_validation.py"
run "absorption_bridge_smoke" bash "$REPO_ROOT/_absorption_bridge/selftest/run_all.sh"

echo "─────────────────────────────────────────────"
echo "selftest summary: $passes PASS / $fails FAIL"
for r in "${results[@]}"; do echo "  $r"; done

# All gates now self-report SKIP (exit 0) for expected non-applicable states:
#   - f_tp5_e_uptake_enumerator: SKIP when infra OK + external uptake == 0
#     (F-TP5-e USER-DISCRETION PASS per .roadmap.weave); FAIL only if the
#     weave_compose API is removed from hexa-bio's own modules.
#   - regression_audit: SKIP for R5-sunset-relocated scripts (weave_composition.py,
#     virocapsid_calibration.py → ~/core/nexus/sim_bridge/); FAIL only on a real
#     run failure of a present script.
#   - r1_symlink_audit: docs/n6/ symlinks repointed to in-repo self-contained
#     content post-canon-retirement; PASS.
#   - tape_lattice_honesty_cohort: STRICT cohort gate added 2026-05-16 after
#     all 65 root .tape reached PASS (Pilot+6 batches; see TAPE-AUDIT.md §F +
#     AGENTS.tape @D g_meta_mode_optin). FAIL if any root .tape regresses on
#     the LATTICE_POLICY honesty contract (guard + stance + grounded). A new
#     root tape that opts into meta-mode (`tape-class = "meta..."`) gets the
#     widened grounding clause automatically.
#   - qmirror / xeno / cmt_vqe_ladder / akida gates: SKIP cleanly when the
#     substrate isn't reachable on this host (sister-repo CLI absent / runtime
#     dispatch down) — SKIP ≠ regression.
# So the gate is now STRICT: any FAIL fails the sweep.
if [ "$fails" -eq 0 ]; then
  exit 0
else
  exit 1
fi
