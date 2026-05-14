#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# XENO.md — xeno 🛸 dependency (canonical single source)
# ══════════════════════════════════════════════════════════════

# Canonical doc for hexa-bio's xeno integration. All other docs
# (`AGENTS.md`, `README.md`, etc.) should POINT here, not duplicate.
# **Status (2026-05-12 cycle-30++++++)**: gate landed (PASS on this host);
# no workload wiring yet (Phase 1.5 xeno-side `falsifier` subcommand
# pending).
# ---

# ── §1 What xeno is ─────────────────────────────────────────


@D row_akida_akd1000_0 :: xeno [ok]
  substrate = "**AKIDA AKD1000**"
  vendor_source = "BrainChip"
  type = "silicon neuromorphic (1W spike inference)"

@D row_loihi3_1 :: xeno [ok]
  substrate = "**Loihi3**"
  vendor_source = "Intel"
  type = "silicon neuromorphic"

@D row_northpole_2 :: xeno [ok]
  substrate = "**Northpole**"
  vendor_source = "IBM"
  type = "silicon neuromorphic"

@D row_finalspark_3 :: xeno [ok]
  substrate = "**FinalSpark**"
  vendor_source = "FinalSpark"
  type = "biological organoid compute"

@D row_cortical_labs_dishbrain_4 :: xeno [ok]
  substrate = "**Cortical Labs DishBrain**"
  vendor_source = "Cortical Labs"
  type = "biological substrate"

@D row_ionq_5 :: xeno [ok]
  substrate = "**IonQ**"
  vendor_source = "IonQ"
  type = "quantum-gate (distinct from qmirror state-vector sim)"

@D row_qrng_6 :: xeno [ok]
  substrate = "**QRNG**"
  vendor_source = "(various)"
  type = "quantum random number (distinct from ANU QRNG in qmirror)"

# ── §2 Architectural pattern (parallels qmirror) ─────────────────────────────────────────


@D b_hexa_bio_defines_which_biology_p_0 :: xeno [ok]
  text = "hexa-bio defines **WHICH biology problem** needs neuromorphic /"

@D b_xeno_picks_which_substrate_is_ap_1 :: xeno [ok]
  text = "xeno picks **WHICH substrate** is appropriate + manages access"

@D b_exotic_hardware_does_the_actual_2 :: xeno [ok]
  text = "exotic hardware does the actual computation"

# ── §3 Gate integration ─────────────────────────────────────────


@D row_0_0 :: xeno [ok]
  exit_code = "0"
  sentinel = "PASS"
  meaning = "`xeno status` returned 0 (reachable + sister bridges healthy)"

@D row_91_0_1 :: xeno [ok]
  exit_code = "91 → 0"
  sentinel = "SKIP"
  meaning = "xeno's raw_91 honest C3 fail-loud (a sister bridge failed); not a hexa-bio regression"

@D row_124_0_2 :: xeno [ok]
  exit_code = "124 → 0"
  sentinel = "SKIP"
  meaning = "`xeno status` timeout (30s) — hung process"

@D row_binary_missing_0_3 :: xeno [ok]
  exit_code = "(binary missing) → 0"
  sentinel = "SKIP"
  meaning = "xeno CLI not installed on this host"

@D row_other_4 :: xeno [ok]
  exit_code = "other"
  sentinel = "FAIL"
  meaning = "xeno reachable but `status` non-zero (real regression)"

@D b_xeno_root_override_repo_root_def_5 :: xeno [ok]
  text = "`XENO_ROOT` — override repo root (default `$HOME/core/xeno`)"

@D b_xeno_bin_override_binary_default_6 :: xeno [ok]
  text = "`XENO_BIN` — override binary (default `$XENO_ROOT/bin/xeno`)"

@D b_does_not_run_substrate_selftests_7 :: xeno [ok]
  text = "Does NOT run substrate selftests (AKIDA spike fidelity, Loihi3 spike"

@D b_does_not_verify_physical_hardwar_8 :: xeno [ok]
  text = "Does NOT verify physical hardware presence — AKIDA Cloud access is"

# ── §4 Potential hexa-bio workloads (not currently wired) ─────────────────────────────────────────


@D row_crispr_cas13_poc_diagnostic_0 :: xeno [ok]
  axis = "**crispr-cas13-poc-diagnostic**"
  workload = "lateral-flow Au-NP capture-line signal classification on-device"
  why_akida_fits = "1W edge AI on POC device (designed niche)"

@D row_medical_device_1 :: xeno [ok]
  axis = "**medical-device**"
  workload = "EEG seizure / EMG / ECG arrhythmia / glucose pattern recognition"
  why_akida_fits = "1W continuous wear; spike-based biosignal processing"

@D row_ribozyme_g26_rb_3_2 :: xeno [ok]
  axis = "**ribozyme** (G26-RB-3)"
  workload = "off-target Hamming pattern matching across GENCODE v47 (~106k transcripts × 28nt)"
  why_akida_fits = "spike pattern-matching accelerates current CPU brute-force RIsearch2"

@D row_nanobot_3 :: xeno [ok]
  axis = "**nanobot**"
  workload = "sub-mW in-vivo actuation pose controller"
  why_akida_fits = "4-state actuation real-time inference, sub-mW class"

@D b_quantum_n_a_qmirror_handles_this_4 :: xeno [ok]
  text = "**quantum** — N/A (qmirror handles this niche)"

@D b_weave_n_a_formal_mathematical_no_5 :: xeno [ok]
  text = "**weave** — N/A (formal/mathematical; no compute substrate)"

@D b_virocapsid_borderline_cryo_em_mi_6 :: xeno [ok]
  text = "**virocapsid** — borderline (cryo-EM micrograph T-number classification"

# ── §5 Why CLI-direct, not Python wrapper ─────────────────────────────────────────


@D b_freeze_the_xeno_surface_at_the_m_0 :: xeno [ok]
  text = "Freeze the xeno surface at the moment of writing"

@D b_drift_as_xeno_evolves_1 :: xeno [ok]
  text = "Drift as xeno evolves"

@D b_require_hexa_bio_re_edits_for_ev_2 :: xeno [ok]
  text = "Require hexa-bio re-edits for every xeno API change"

# ── §6 Cross-refs ─────────────────────────────────────────


@D b_gate_selftest_xeno_substrate_gat_0 :: xeno [ok]
  text = "Gate: [`selftest/xeno_substrate_gate.sh`](selftest/xeno_substrate_gate.sh)"

@D b_wiring_selftest_run_all_sh_selft_1 :: xeno [ok]
  text = "Wiring: [`selftest/run_all.sh`](selftest/run_all.sh) line ~53"

@D b_sister_repo_policy_agents_md_age_2 :: xeno [ok]
  text = "Sister-repo policy: [`AGENTS.md`](AGENTS.md) §\"Sister repositories\""

@D b_xeno_repo_https_github_com_danci_3 :: xeno [ok]
  text = "xeno repo: https://github.com/dancinlab/xeno"

@D b_xeno_local_core_xeno_4 :: xeno [ok]
  text = "xeno local: `~/core/xeno`"

@D b_xeno_entry_core_xeno_bin_xeno_ba_5 :: xeno [ok]
  text = "xeno entry: `~/core/xeno/bin/xeno` (bash) + `~/core/xeno/cli/run.hexa`"

@D b_xeno_roadmaps_core_xeno_roadmaps_6 :: xeno [ok]
  text = "xeno roadmaps: `~/core/xeno/roadmaps/.roadmap.{akida,loihi3,northpole,finalspark,cortical_labs,ionq,qrng}`"

@D b_akida_cloud_signup_guide_core_xe_7 :: xeno [ok]
  text = "AKIDA Cloud signup guide: `~/core/xeno/docs/anima_physics_origin/akida_cloud_signup_guide.md`"

@D b_sister_of_xeno_related_dancinlab_8 :: xeno [ok]
  text = "Sister of xeno (related): `dancinlab/qmirror` — quantum-computer"

# ── §7 raw_91 honest C3 ─────────────────────────────────────────


@D b_xeno_is_xeno_s_responsibility_no_0 :: xeno [ok]
  text = "xeno is xeno's responsibility, not hexa-bio's. hexa-bio's role is the"

@D b_substrate_level_verification_aki_1 :: xeno [ok]
  text = "Substrate-level verification (AKIDA spike fidelity, Loihi3 spike-rate"

@D b_workload_wiring_point_a_specific_2 :: xeno [ok]
  text = "Workload wiring (point a specific hexa-bio axis at AKIDA via xeno) is"
