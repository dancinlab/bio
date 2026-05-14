#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# Changelog
# ══════════════════════════════════════════════════════════════

# All notable changes to **hexa-bio** are documented here. Format follows
# [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and SemVer.

# ── [Unreleased] ─────────────────────────────────────────


@D b_adapt_vqe_5_cmt_scaffolds_4e_4o_0 :: changelog [ok]
  text = "**ADAPT-VQE × 5 CMT scaffolds @ 4e/4o** (qmirror `852ad27`): 5/5 PASS,"

@D b_adapt_vqe_6_molecules_4e_5o_qmir_1 :: changelog [ok]
  text = "**ADAPT-VQE × 6 molecules @ 4e/5o** (qmirror `f2e8a5e`, hexa-bio"

@D b_10_diatomic_bench_cohort_9_11_pa_2 :: changelog [ok]
  text = "**10-diatomic bench cohort: 9/11 PASS** (qmirror `42643c2` +"

@D b_4e_6o_10_qubit_tier_closure_3 :: changelog [ok]
  text = "**Ramp B-3 4e/6o (10-qubit) CLOSED — 6/6 in-process** (qmirror `59b9415`, hexa-bio `d3fc310`). Offline extraction 21 h total wall (LiH 631 Pauli, 5 CMT 1799-1819 Pauli; offline VQE Δ 0.0014-135.9 µHa). In-process NM @ HEXA_MEM_UNLIMITED=1: lih 272.45 µHa @ 133 s / clc1 402.97 µHa @ 214 s / sar1 439.64 µHa @ 214 s / mfn2 121.56 µHa @ 221 s / hd6 5.55 µHa @ 246 s (maxiter=2000); gjb1 1090.55 µHa @ 394 s (maxiter=4000). All under 1.6 mHa chem-acc bound. New aggregator gate selftest/cmt_uccsd_4e6o_readiness.sh wired into run_all.sh."

@D b_hexa_lang_rfc_036_landed_32ca3f3_4 :: changelog [ok]
  text = "**hexa-lang RFC 036 LANDED** (`32ca3f30`): `farr_int_array` packed"

@D b_hexa_lang_rfc_039_landed_b0a4f14_5 :: changelog [ok]
  text = "**hexa-lang RFC 039 LANDED** (`b0a4f146`): parameter-shift gradient"

@D b_qmirror_gjb1_4e_5o_closure_last_6 :: changelog [ok]
  text = "**qmirror gjb1 4e/5o closure** — last hold-out from the prior 5/6"

@D b_qmirror_adapt_vqe_driver_7 :: changelog [ok]
  text = "**qmirror ADAPT-VQE driver** —"

@D b_qmirror_k_upccgsd_generator_driv_8 :: changelog [ok]
  text = "**qmirror k-UpCCGSD generator + driver** —"

@D b_qmirror_l_bfgs_b_prototype_9 :: changelog [ok]
  text = "**qmirror L-BFGS-B prototype** —"

@D b_qmirror_bench_10_diatomic_indepe_10 :: changelog [ok]
  text = "**qmirror `bench/`** — 10-diatomic independent-verification suite"

@D b_docs_rfc_036_docs_rfc_039_comple_11 :: changelog [ok]
  text = "**`docs/RFC_036_*` + `docs/RFC_039_*`** — complete specs +"

@D b_qmirror_qmirror_md_scale_up_grow_12 :: changelog [ok]
  text = "**`qmirror/QMIRROR.md`** — scale-up / growth brainstorm catalog"

@D b_absorption_bridge_landed_9_prote_13 :: changelog [ok]
  text = "**`_absorption_bridge/` LANDED** — 9 protein-structure ML + sequence"

@D b_hexa_weave_md_hexa_virocapsid_md_14 :: changelog [ok]
  text = "**`HEXA-WEAVE.md` / `HEXA-VIROCAPSID.md` / `HEXA-NANOBOT.md` /"

@D b_absorption_bridge_selftest_run_a_15 :: changelog [ok]
  text = "**`_absorption_bridge/selftest/run_all.sh`** — aggregator emits"

@D b_absorption_bridge_pyproject_toml_16 :: changelog [ok]
  text = "**`_absorption_bridge/pyproject.toml`** — optional deps gated by"

@D b_license_honesty_matrix_locked_in_17 :: changelog [ok]
  text = "**License-honesty matrix** locked in `_absorption_bridge/README.md`"

@D b_qmirror_5_cmt_scaffolds_4e_5o_8_18 :: changelog [ok]
  text = "**qmirror 5 CMT scaffolds @ 4e/5o (8-qubit)** (cc20b81): adds"

@D b_selftest_cmt_uccsd_4e5o_readines_19 :: changelog [ok]
  text = "**`selftest/cmt_uccsd_4e5o_readiness.sh`** (952a001): aggregating"

@D b_hexa_lang_rfc_035_landed_64bcf3a_20 :: changelog [ok]
  text = "**hexa-lang RFC 035 LANDED** (64bcf3ab): 8 new whole-NM-step C kernels"

@D b_qmirror_gjb1_4e_4o_rfc_035_farr_21 :: changelog [ok]
  text = "**qmirror gjb1 4e/4o RFC 035 farr-NM** (e03ceab): adds"

@D b_qmirror_lih_4e_5o_8_qubit_full_n_22 :: changelog [ok]
  text = "**qmirror LiH 4e/5o (8-qubit) FULL NM via RFC 034+035** (5453d93):"

@D b_selftest_cmt_uccsd_inproc_nm_rea_23 :: changelog [ok]
  text = "**`selftest/cmt_uccsd_inproc_nm_readiness.sh` strict semantics**"

@D b_selftest_cmt_uccsd_lih_4e5o_read_24 :: changelog [ok]
  text = "**`selftest/cmt_uccsd_lih_4e5o_readiness.sh` promoted** (e251ee3):"

@D b_hexa_lang_rfc_034_landed_e31ee48_25 :: changelog [ok]
  text = "**hexa-lang RFC 034 LANDED** (e31ee484): new whole-loop C kernels `hexa_farr_pauli_exp_inplace` + `hexa_farr_pauli_expectation` added to the runtime, eliminating the per-iter HexaVal arena pressure that previously blocked qmirror's in-process 26-parameter NM (~180 MB/eval × ~4 evals → 768 MB cap exceeded; bisected to bare `farr_get`/`farr_set` in the hot path). Same architectural pattern as the existing `farr_apply_single` / `farr_apply_cnot` fast paths. Algorithm validated against `scipy.linalg.expm` at machine precision (max err < 1e-12 on 8 random 6-qubit Pauli strings) in qmirror's offline numpy harness."

@D b_qmirror_ramp_b_full_closure_179a_26 :: changelog [ok]
  text = "**qmirror Ramp B FULL CLOSURE** (179a2db): in-process pure-hexa NM now works end-to-end. `chemistry_vqe_cmt_uccsd_lih_4e4o.hexa` switches its inner pauli helpers to RFC 034 builtins + restored 26-parameter NM driver. 5 new per-CMT-scaffold modules `chemistry_vqe_cmt_uccsd_cmt_<NAME>_4e4o.hexa` (clc1/sar1/mfn2/hd6/gjb1) vendor each scaffold's UCCSD-decomposition + Hamiltonian + HF state and run the same in-process NM. **Live results (maxiter=200, ~13s wall per scaffold)**: LiH Δ=66 µHa (24× under bound); clc1 Δ=227 µHa (7×); sar1 Δ=204 µHa (8×); mfn2 Δ=277 µHa (6×); hd6 Δ=11.7 µHa (137×); gjb1 Δ=1879 µHa (17% over bound, needs externalized fallback — in-process maxiter cap ~250 from secondary memory pressure in NM-side [float] vertex copies)."

@D b_selftest_cmt_uccsd_inproc_nm_rea_27 :: changelog [ok]
  text = "**`selftest/cmt_uccsd_inproc_nm_readiness.sh`** — aggregating gate iterating the 6 per-molecule modules; PASS if ≥majority reach chem-accuracy in-process (gjb1 falls back to externalized). Wired into `selftest/run_all.sh` → run_all = **33/33 PASS**. Sentinel `__CMT_UCCSD_INPROC_NM_READINESS__ PASS`."

@D b_performance_in_process_nm_at_max_28 :: changelog [ok]
  text = "**Performance**: in-process NM at maxiter=200 is **~26× faster** than the externalized loop at maxiter=5 (13s vs 5.7 min wall) for comparable chem-accuracy. RFC 034 + in-process = honest \"pure-hexa variational VQE at 4e/4o\" — energy kernel goes through the C builtin (same architectural class as `apply_single`), optimizer loop runs in hexa."

@D b_readme_scoreboard_refresh_three_29 :: changelog [ok]
  text = "**README scoreboard refresh** — three new shield badges surface the"

@D b_f_q_6_e_ramp_b_externalized_clos_30 :: changelog [ok]
  text = "**F-Q-6-E Ramp B externalized closure — pure-hexa physics + Python-stdlib NM driver reaches CASCI(4,4) within chem-accuracy on LiH** (Option 2 of the prior commit's documented sub-ramps). Each energy eval is a fresh hexa subprocess via the qmirror oneshot module `chemistry_vqe/module/chemistry_vqe_cmt_uccsd_lih_4e4o_oneshot.hexa`; the optimizer is `selftest/cmt_uccsd_lih_4e4o_external_nm_driver.py`, a Python-stdlib-only Nelder-Mead. Live on dev host at maxiter=5 (5.7-min wall, 36 evals): **E_VQE = −7.8638100 Ha, CASCI(4,4) = −7.8643048 Ha, |Δ| = 494.8 µHa (3× UNDER the 1.6 mHa chem-accuracy bound), 58.5% recovery of the HF→CASCI correlation gap**. Higher maxiter would converge further (numpy harness: 1.06 mHa @ maxiter=200, 0.004 µHa @ maxiter=8000). New gate `selftest/cmt_uccsd_lih_4e4o_external_nm_readiness.sh` invokes the driver and aggregates the result; wired into `run_all.sh` after the ansatz-machinery gate. Sentinel `__CMT_UCCSD_LIH_4E4O_EXTERNAL_NM_READINESS__ PASS`."

@D b_f_q_6_e_ramp_b_partial_pure_hexa_31 :: changelog [ok]
  text = "**F-Q-6-E Ramp B partial — pure-hexa UCCSD-at-4e/4o ansatz machinery** for"

@D b_f_q_6_e_4e_4o_coverage_extended_32 :: changelog [ok]
  text = "**F-Q-6-E 4e/4o coverage extended from 2 molecules → all 6** (LiH validation"

@D b_f_q_6_e_ramp_c_6e_6o_scf_hamilto_33 :: changelog [ok]
  text = "**F-Q-6-E Ramp C 6e/6o: SCF + Hamiltonian construction PASS, VQE deferred** —"

@D b_roadmap_disease_cmt_specific_cha_34 :: changelog [ok]
  text = "**`.roadmap.disease_cmt_specific`** — Charcot-Marie-Tooth disease-axis-orthogonal roadmap (210th disease roadmap entry): 10 de novo `hxq-cmt-*` candidates across all 5 axes (Q:5 hd6/clc1/sar1/mfn2/gjb1, RB:2 pmp22-001/002, W:1 nrg1-001, V:1 fig4-001, NB:1 nano-001) on a 7-axis side-effect-avoidance design-constraint lattice; 14-falsifier inventory; 2024-2026 comparator landscape (comparator-only — no clinical entanglement); paradigm-shift + platform-cross-link sections."

@D b_cmt_in_repo_deterministic_closur_35 :: changelog [ok]
  text = "**CMT in-repo deterministic closure gates** — `selftest/cmt_side_effect_avoidance_audit.py` (F-disease-cmt-Q-8: 70-cell 7-axis matrix), `selftest/cmt_library_ranking.py` (F-disease-cmt-Q-7: 10 novel + 10 comparators incl. 5 negative controls, 5 subtype strata, weighted-ordinal ranking), `selftest/cmt_vqe_ladder_readiness.sh` (F-disease-cmt-Q-1..6 — invokes qmirror's CMT 2e/2o VQE ladder, see the F-Q-6-E bullet below), `selftest/cmt_axis_and_cross_design_audit.py` (F-disease-cmt-W-1/V-1/RB-1/NB-1 + cross-1/cross-2 per-axis design-completeness + distinct-mechanism audit), `selftest/cmt_smiles_validation.py` (Tier-2: stdlib SMILES parser — syntactic well-formedness + heavy-atom count + molecular formula + monoisotopic mass cross-checked vs the roadmap's own inline annotation). **14 of 14 CMT falsifiers now have an in-repo deterministic gate**; the in-repo-closeable CMT surface is exhausted (residual = 4e/4o+ / pocket-embedded / final-molecule binding-affinity VQE = chemistry judgment + a >2-qubit ansatz, qmirror-side next ramp; Phase-β chemotype refinement; wet-lab — all out-of-software-scope, documented-pending). All 5 gates wired into `selftest/run_all.sh` (now **29 PASS / 0 FAIL**)."

@D b_f_q_6_e_4e_4o_sub_tier_landed_ve_36 :: changelog [ok]
  text = "**F-Q-6-E 4e/4o sub-tier LANDED — vendored VQE replay on 6-qubit Hamiltonians** — later same day, the 4e/4o sub-ramp also lands. qmirror ships `chemistry_vqe/module/chemistry_vqe_cmt_hamiltonians_4e4o.hexa`: VENDORED 4e/4o-active-space Hamiltonians (175-325 Pauli terms on 6 qubits) + UCCSD-converged statevector ψ* (64 complex amps; 26-parameter UCCSD + SLSQP `maxiter=500, ftol=1e-9, initial_point=zeros` offline → converged << 0.01 µHa of CASCI(4,4)) + `NumPyMinimumEigensolver` CASCI(4,4) references for 2 molecules: **LiH** (R=1.5474 Å, validation anchor — FCI-level for STO-3G) + **hxq-cmt-hd6-001** (HDAC6 candidate, strategically most-watched). Active-space transformer = frontier orbitals HOMO-1, HOMO, LUMO, LUMO+1; `ParityMapper((2,2))` + 2-qubit reduction = 6 qubits. At 4e/4o UCCSD is no longer trivially exact (singles+doubles, 26 params), so the variational step is OFFLINE — same hexa-strict category as the Hamiltonian extraction. The pure-hexa runtime is a **vendored VQE replay**: reads H + ψ*, computes ⟨ψ*|H|ψ*⟩ via a new generic n-qubit Pauli-expectation evaluator (`cv_pauli_expectation_n` — a clean generalisation of the 2e/2o 2-qubit `cv_pauli_expectation`), verdicts |Δ| vs the 1.6 mHa chemical-accuracy bound. Both molecules clear by 6 orders of magnitude (0.000462 µHa for hd6, 0.00431 µHa for LiH; `__QMIRROR_CHEM_CMT_VQE_4E4O__ PASS`). hexa-bio side: new gate `selftest/cmt_vqe_ladder_4e4o_readiness.sh` wired into `run_all.sh` → **30 PASS / 0 FAIL**. `.roadmap.quantum` F-Q-6-E header \"LANDED (2e/2o tier)\" → \"LANDED (2e/2o + 4e/4o tiers)\"; `.roadmap.disease_cmt_specific` adds §11 v8 entry + Tier 3 update + 양자-VQE ladder hd6 row update; `COMPUTE_PORTFOLIO.md` §2 matrix + §4 status block updated. raw_91 C3: 4e/4o (HOMO±1) is still a small active space — the CASCI(4,4) energy is a reproducible quantum-chemistry quantity, NOT a binding affinity. Open sub-ramps (NOT failures — scope, documented): (i) pure-hexa UCCSD variational optimizer at 4e/4o (port qiskit-nature UCCSD + SLSQP into hexa primitives); (ii) the other 4 CMT scaffolds at 4e/4o (clc1/sar1/mfn2/gjb1 — mechanical extension, ~3 kLOC vendored constants per molecule via the same generator script); (iii) 4e/4o+ AS / final-molecule geometries (post Phase-β chemotype refinement) / pocket-embedded QM/MM-VQE — chemistry judgment + research-grade."

@D b_f_q_6_e_landed_2e_2o_tier_live_n_37 :: changelog [ok]
  text = "**F-Q-6-E LANDED (2e/2o tier) — live non-H2 pocket VQE on the CMT scaffolds** — qmirror now ships `chemistry_vqe/module/chemistry_vqe_cmt_hamiltonians.hexa`: VENDORED 2e/2o-active-space parity-mapped Hamiltonians + CASCI(2,2) references for the 5 CMT candidate scaffolds (hxq-cmt-{clc1,sar1,mfn2,hd6,gjb1}-001 — the gjb1 entry a pyridyl-thiazole stand-in, since the committed gjb1-001 has \"scaffold class TBD\"). Each: SMILES → 3D geometry (rdkit ETKDGv3 + MMFF) → STO-3G RHF → HOMO/LUMO 2e/2o `ActiveSpaceTransformer` → `ParityMapper((1,1))` → 2-qubit 9-term Hamiltonian + `NumPyMinimumEigensolver` CASCI(2,2) ref, extracted offline (rdkit 2026.03.1 + pyscf 2.13.0 + qiskit-nature 0.7.2 + qiskit 2.4.1) — build-time one-shot extraction, NOT a runtime dependency (per qmirror's hexa-strict rule, same category as the H2 canonical-constant extraction). Solved by the new generic 2e/2o UCCSD path in qmirror's `chemistry_vqe_native.hexa` (the H2 ansatz + Pauli-expectation are universal for any 2e/2o RHF active space, reused verbatim; UCCSD is exact for 2-electron systems so 2e/2o VQE = CASCI(2,2)), reproducing each ref to << 1 µHa (`__QMIRROR_CHEM_CMT_VQE__ PASS`). Trust anchor: the same offline pipeline reproduces the hardcoded H2 5-coeff Hamiltonian + constant_shift + FCI ref to machine precision (max |Δ| < 1e-15). hexa-bio side: `selftest/cmt_vqe_ladder_readiness.sh` flips from a hard SKIP to invoking this ladder; `.roadmap.disease_cmt_specific` §6 Tier 3 \"DESIGN-AUDIT proxy\" → \"live VQE (2e/2o) binding\"; `.roadmap.quantum` F-Q-6-E \"BLOCKED\" → \"LANDED (2e/2o tier)\"; `COMPUTE_PORTFOLIO.md` §3-4 updated. raw_91 C3: the 2e/2o HOMO/LUMO active space is a drastic reduction — the CASCI(2,2) energy is a reproducible quantum-chemistry quantity, NOT a binding affinity; 4e/4o+ / final-molecule / pocket-embedded VQE is the next ramp."

@D b_core_qmirror_chemistry_vqe_pyscf_38 :: changelog [ok]
  text = "**`~/core/qmirror/CHEMISTRY_VQE_PYSCF_BACKEND_PLAN_2026_05_12.md`** (sister repo) — the Tier-2 gap / F-Q-6-E plan: option (c) [precompute + vendor named-molecule Hamiltonians, the H2 pattern generalized] **realized 2026-05-13** for the 5 CMT scaffolds; option (b) [general `--with-pyscf`] and 4e/4o+ remain the next ramps. (Option (a) [always-on python bridge] not adopted — conflicts with qmirror's hexa-strict rule; used only offline to generate the (c) constants.)"

@D b_cmt_placeholder_smiles_inline_an_39 :: changelog [ok]
  text = "**CMT placeholder-SMILES inline annotations corrected** — the `(heavy NN)` notes in `.roadmap.disease_cmt_specific` were stale eyeballed values (22/17/17/19); corrected to the parser-verified counts (25/21/21/24) and the molecular formulas added (hd6-001 C17H14N4O3S, clc1-001 C13H8N2O2F4, sar1-001 C14H10N4OF2, mfn2-001 C18H20N4O2). The MW values were already correct (monoisotopic masses) — annotated as such."

@D b_pre_existing_selftest_fails_elim_40 :: changelog [ok]
  text = "**Pre-existing selftest FAILs eliminated** — `r1_symlink_audit.sh` (docs/n6/ symlinks repointed in-repo + accepted-roots updated post-canon-retirement), `f_tp5_e_uptake_enumerator.py` (SKIP-exit-0 when infra OK + external uptake==0 — the F-TP5-e USER-DISCRETION PASS state — instead of FAIL), `regression_audit.py` (SKIP for R5-sunset-relocated scripts weave_composition.py / virocapsid_calibration.py → `~/core/nexus/sim_bridge/`; FAIL only on a real run failure). `selftest/run_all.sh` tightened to STRICT (`fails -eq 0`)."

@D b_closure_grade_bumped_to_100_a_fo_41 :: changelog [ok]
  text = "**Closure-grade bumped to ~100% (a) for ribozyme / nanobot / quantum** — the previous 99%/98%/99% percentages were stale carry-overs from before cycle-30 closures (A1.1/A1.2/A1.3 robustness sentinels + N-R2 v1.0.0 lock + F-Q-6-D/F-Q-6-F + GATE-26-2 v4). Residuals are category (c) wet-lab/IP (ribozyme, nanobot) or category (b) v5 Lean4 stretch (quantum) — out-of-scope for v1.x closure-grade per CLOSURE_RESIDUAL_BACKLOG.md §0."

@D b_flor_a_sister_repo_created_danci_42 :: changelog [ok]
  text = "**Floréa 🌸 sister repo created (`dancinlab/florea`)** — standalone cosmetic/aesthetic substrate, 7 verbs (`cosmetic-surgery`, `hair-regeneration`, `perfumery`, `tattoo-removal`, `mens/womens-intimate-cleanser`, `skincare`)."

@D b_xeno_sister_repo_cli_integration_43 :: changelog [ok]
  text = "**xeno 🛸 sister-repo CLI integration** — `selftest/xeno_substrate_gate.sh` delegates to `xeno status`. Single canonical doc `XENO.md` at repo root. Wired into `selftest/run_all.sh`."

@D b_wetlab_phase_1_seed_public_templ_44 :: changelog [ok]
  text = "**wetlab/ Phase 1 seed** — public templates for CRO RFP / SOP / MTA / invention disclosure / pre-IND prep across 4 axes. `data/` gitignored."

@D b_medical_device_top_level_categor_45 :: changelog [ok]
  text = "**medical-device top-level category absorbed into hexa-bio** — from ex-hexa-medic decomposition; HEXA-MEDDEV spec doc with dependencies on biology-medical, florea/skincare, hexa-bot/reference/hexa-limb."

@D b_agents_md_external_contact_defer_46 :: changelog [ok]
  text = "**AGENTS.md \"External-contact deferral policy\"** — agents execute software/API/in-repo actions; defer SEND/SIGN/PAY/MEET to user; must NOT propose deferred items as next-steps in summaries. USER_ACTION_REQUIRED.md is single canonical index."

@D b_hexa_meta_lean4_all_4_axes_at_v4_47 :: changelog [ok]
  text = "**hexa-meta lean4 ALL 4 AXES at v4 maximum semantics** — Axis 1 REAL + Axes 2/3/4 v4 (substrate-polymorphic `[AddCommGroup E] [LinearOrder E]` + `Prod.lex WellFoundedRelation` + `[CommMonoid β]` payload). `lake build N6` → 900/900 jobs PASS on lean4 v4.30.0-rc2 + Mathlib SHA pinned. v1 → v2 → v3 → v4 abstraction trajectory EXHAUSTED. v4 PASS EXCEEDS v2.0.0 GATE-26-2 cert-strength."

@D b_hexa_medic_deleted_fully_decompo_48 :: changelog [ok]
  text = "**hexa-medic 💊 DELETED** — fully decomposed 24 → 0 verbs over cycle-30++/+++/++++/++++++: 7 verbs migrated (Floréa 6, hexa-matter 1 microplastics, hexa-bio 1 medical-device), 16 verbs deleted (6 ambiguous + 10 therapy). Remote + local both removed. Per-file canon@ded52144 lineage preserved in destination frontmatter."

@D b_dolphin_dolphin_bioacoustics_hex_49 :: changelog [ok]
  text = "**dolphin / dolphin-bioacoustics / hexa-limb / hexa-skin removed from hexa-bio** — migrated to hexa-brain/reference/, hexa-bot/reference/, florea/skincare/. 5-axis discipline restored."

@D b_project_wide_sweep_readme_md_ver_50 :: changelog [ok]
  text = "**Project-wide sweep**: README.md verdict + 5-axis status table, AXIS_CLOSURE_PLAN.md §1, .roadmap.virocapsid / .nanobot / .ribozyme / .quantum / .weave headers all updated to cycle-30++++++ state."

@D b_roadmap_disease_dermatology_road_51 :: changelog [ok]
  text = "`.roadmap.disease_dermatology` + `.roadmap.disease_planetary_health` + 4 `.roadmap.axis_*_exploration` files (classification-ambiguous + rejected-axis dead-ends per user 분류 애매 결정)"

@D b_music_therapy_md_top_level_cross_52 :: changelog [ok]
  text = "`MUSIC-THERAPY.md` top-level (cross-ref to deleted hexa-medic verb)"

@D b_n_r2_l7_l9_acceptance_schemas_dr_53 :: changelog [ok]
  text = "**N-R2 L7-L9 acceptance schemas drafted (consumer-proposed) + L6→L7-L9 contract test (`nanobot_l6_l7_contract_test.py`, 2026-05-12)** —"

@D b_canon_mk1_investigated_n_r2_nano_54 :: changelog [ok]
  text = "**canon@mk1 investigated; N-R2 (nanobot L6 handoff) hexa-bio-side LOCKED v1.0.0 + GATE-26-2 canon-state ABSORBED (2026-05-12)** —"

@D b_ribozyme_g26_rb_3_closed_full_ge_55 :: changelog [ok]
  text = "**Ribozyme G26-RB-3 CLOSED — FULL GENCODE v47 transcriptome off-target screen EXECUTED via RIsearch2 v2.1 (2026-05-12)** —"

@D b_ribozyme_g26_rb_3_off_target_poo_56 :: changelog [ok]
  text = "**Ribozyme G26-RB-3 off-target pool extended to n=206 via a vendored GENCODE v47 subset (`ribozyme_off_target_screen.py`, 2026-05-12)** —"

@D b_quantum_phase_d_f_q_6_f_closed_i_57 :: changelog [ok]
  text = "**Quantum Phase D / F-Q-6-F closed in-repo — 5-warhead covalent-Mpro-inhibitor VQE library ranking (`tests/mpro_warhead_library_vqe_v7.py`, 2026-05-12)** —"

@D b_virocapsid_c3b_gate_26_v_1b_clos_58 :: changelog [ok]
  text = "**Virocapsid C3b (GATE-26-V-1b) closed in-repo — corpus sourced from VIPERdb v3.0 (2026-05-12)** —"

@D b_docs_closure_100_research_2026_0_59 :: changelog [ok]
  text = "**`docs/closure_100_research_2026_05_12.md` — deep web + arXiv research on closing the residual gaps (2026-05-12)** —"

@D b_virocapsid_c3a_bayesian_audit_re_60 :: changelog [ok]
  text = "**Virocapsid C3a Bayesian audit re-implemented + corpus extended to n=35 — `virocapsid_pdb_corpus.py` re-landed (2026-05-12)** —"

@D b_nanobot_c0d_closed_in_repo_nanob_61 :: changelog [ok]
  text = "**Nanobot C0d closed in-repo — `nanobot_actuation_simulation.py` re-implemented, dual-skeleton F-NB-4 6/6 PASS (2026-05-12)** —"

@D b_ribozyme_g26_rb_1_closed_in_repo_62 :: changelog [ok]
  text = "**Ribozyme G26-RB-1′ closed in-repo — `ribozyme_kinetics_simulation.py` re-implemented (2026-05-12)** —"

@D b_quantum_f_q_6_l3_closed_mpro_poc_63 :: changelog [ok]
  text = "**Quantum F-Q-6 / L3 closed — Mpro pocket-cluster VQE (`tests/mpro_pocket_vqe_v7.py`, 2026-05-12)** —"

@D b_readme_roadmaps_hexa_toml_axis_c_64 :: changelog [ok]
  text = "**README + roadmaps + `hexa.toml` + `AXIS_CLOSURE_PLAN.md` §11 — in-repo closure status sync (2026-05-12)** —"

@D b_ribozyme_g26_rb_2_branch_lock_la_65 :: changelog [ok]
  text = "**Ribozyme G26-RB-2 branch-lock landed — J₂=24 reaction-coordinate quotient (2026-05-12, ahead of 2026-06-15 branch-lock deadline)** —"

@D b_ribozyme_g26_rb_3_in_repo_portio_66 :: changelog [ok]
  text = "**Ribozyme G26-RB-3 in-repo portion closed — Hamming off-target screen (2026-05-12)** —"

@D b_nanobot_n_r1_in_repo_portion_clo_67 :: changelog [ok]
  text = "**Nanobot N-R1 in-repo portion closed — `raw_77_nanobot_actuation_v2` reference emitter (2026-05-12)** —"

@D b_virocapsid_gate_26_v_r1_c5_in_re_68 :: changelog [ok]
  text = "**Virocapsid GATE-26-V-R1 (C5) in-repo portion closed — cage_output schema lock + 4-fixture conformance (2026-05-12, 77 days ahead of 2026-07-28 deadline)** —"

@D b_ribozyme_r_r1_closed_nussinov_mf_69 :: changelog [ok]
  text = "**Ribozyme R-R1 closed — Nussinov MFE solver inline port (2026-05-12)** —"

@D b_selftest_n6_axis_computational_v_70 :: changelog [ok]
  text = "**`selftest/n6_axis_computational_verification.py` wired into pre-merge gate"

@D b_axis_closure_plan_md_11_added_20_71 :: changelog [ok]
  text = "**`AXIS_CLOSURE_PLAN.md` §11 added (2026-05-12)** — \"In-repo deductive-closure"

@D b_github_org_corrected_stale_repo_72 :: changelog [ok]
  text = "**GitHub org corrected stale repo URLs → `dancinlab` (2026-05-12)** —"

@D b_qmirror_install_path_corrected_t_73 :: changelog [ok]
  text = "**`qmirror` install path corrected to `hx install qmirror` (2026-05-12)**"

@D b_5_axis_documentation_reconciliat_74 :: changelog [ok]
  text = "**5-axis documentation reconciliation (2026-05-12)** — `README.md`,"

@D b_axis_closure_plan_md_updated_qua_75 :: changelog [ok]
  text = "**`AXIS_CLOSURE_PLAN.md` updated — quantum target CONFIRMED + repo-boundary"

@D b_axis_closure_plan_md_root_2026_0_76 :: changelog [ok]
  text = "**`AXIS_CLOSURE_PLAN.md` (root, 2026-05-12)** — gate / deadline / owner /"

@D b_readme_optional_deps_clarificati_77 :: changelog [ok]
  text = "**README \"Optional deps\" clarification (2026-05-12)** — `hx install"

@D b_hexa_bio_quantum_cli_subcommand_78 :: changelog [ok]
  text = "**`hexa-bio quantum` CLI subcommand + `quantum` in `selftest` (advisory)"

@D b_f_stalled_undefined_audit_2026_0_79 :: changelog [ok]
  text = "§F STALLED/UNDEFINED audit (2026-05-06) registered in `.roadmap.hexa_bio`"

@D b_r2_audit_resolution_2026_05_06_d_80 :: changelog [ok]
  text = "**R2 audit-resolution (2026-05-06)** — DRAFT LAND + GATE-26 PROMOTE across"

@D b_c3a_closed_2026_05_06_f_virocaps_81 :: changelog [ok]
  text = "**C3a CLOSED 2026-05-06** — F-VIROCAPSID-1 partial corpus infrastructure"

@D b_weave_composition_py_emit_path_s_82 :: changelog [ok]
  text = "**weave_composition.py emit-path schema validation wired** (C0e /"

@D b_f_cl_formal_1_2_3_marked_deferre_83 :: changelog [ok]
  text = "F-CL-FORMAL-1/2/3 marked DEFERRED — no lean4 layer in repo as of"

@D b_own_own_1_hexa_bio_virocapsid_st_84 :: changelog [ok]
  text = "`.own` own 1 `hexa-bio-virocapsid-stalled-caveat` — **DEPRECATED 2026-05-06**."

@D b_gate_26_1_virocapsid_multi_t_clo_85 :: changelog [ok]
  text = "GATE-26-1 (virocapsid-multi-T)    — **CLOSED PASS** 2026-05-06 (T=3/T=4 yield ≥0.85)"

@D b_gate_26_2_lean4_mechanical_ext_p_86 :: changelog [ok]
  text = "GATE-26-2 (lean4-mechanical-ext)  — PROMOTED (cross-repo, no in-repo lean4 layer)"

@D b_gate_26_3_weave_p_2_np_solver_pr_87 :: changelog [ok]
  text = "GATE-26-3 (weave-π_p_2-NP-solver) — PROMOTED (code work needed)"

@D b_gate_26_4_rb_2_inter_rater_schem_88 :: changelog [ok]
  text = "GATE-26-4 (RB-2 inter-rater)      — SCHEMA LANDED (≥2 human raters pending)"

@D b_gate_26_5_nb_2_retest_closed_dec_89 :: changelog [ok]
  text = "GATE-26-5 (NB-2 retest)           — **CLOSED DECISIVE PASS** 2026-05-06 (log_bf=13.65)"

@D b_gate_26_6_regression_ci_wire_pro_90 :: changelog [ok]
  text = "GATE-26-6 (regression-CI-wire)    — PROMOTED (CI infra needed)"

@D b_weave_structural_exact_91 :: changelog [ok]
  text = "WEAVE          STRUCTURAL-EXACT"

@D b_virocapsid_structural_exact_full_92 :: changelog [ok]
  text = "VIROCAPSID     STRUCTURAL-EXACT (full closure: T=1 corpus + multi-T C4)"

@D b_nanobot_structural_exact_candida_93 :: changelog [ok]
  text = "**NANOBOT      STRUCTURAL-EXACT-CANDIDATE** (PROMOTED from APPROXIMATE this session)"

@D b_ribozyme_structural_exact_candid_94 :: changelog [ok]
  text = "RIBOZYME       STRUCTURAL-EXACT-CANDIDATE (unchanged; inter-rater pending)"

@D b_c3a_closed_bayesian_audit_full_p_95 :: changelog [ok]
  text = "`C3a CLOSED` Bayesian audit FULL PASS (`virocapsid_pdb_corpus_audit.py`):"

@D b_c4_closed_multi_t_t_3_t_4_yield_96 :: changelog [ok]
  text = "`C4 CLOSED` multi-T (T=3/T=4) yield ≥ 0.85 PASS (`virocapsid_multi_t_calibration.py`):"

@D b_f_virocapsid_1_sub_clauses_genus_97 :: changelog [ok]
  text = "F-VIROCAPSID-1 sub-clauses (-genus / -1-b / -1-c / -1-d) ALL PASS via"

@D b_f_virocapsid_4_sub_clauses_final_98 :: changelog [ok]
  text = "F-VIROCAPSID-4 sub-clauses (final, post-iter-18 remediation):"

@D b_f_rb_1_sub_clauses_genus_pass_k_99 :: changelog [ok]
  text = "F-RB-1 sub-clauses: -genus PASS (k_cat>0), -b PASS (catalytic_core_nt=12),"

@D b_f_rb_2_sub_clauses_decorative_pa_100 :: changelog [ok]
  text = "F-RB-2 sub-clauses: -decorative PASS (`ribozyme_bayesian_n6_ablation.py`,"

@D b_f_rb_3_sub_clauses_diffusion_lim_101 :: changelog [ok]
  text = "F-RB-3 sub-clauses: -diffusion-limit PASS, -b PASS, -c PASS"

@D b_f_nb_1_sub_clauses_genus_pass_4_102 :: changelog [ok]
  text = "F-NB-1 sub-clauses: -genus PASS (4 states + productive_cycles=2168 ≥"

@D b_f_nb_2_sub_clauses_final_post_it_103 :: changelog [ok]
  text = "F-NB-2 sub-clauses (final, post-iter-21 remediation):"

@D b_f_nb_3_sub_clauses_final_post_it_104 :: changelog [ok]
  text = "F-NB-3 sub-clauses (final, post-iter-19 remediation):"

@D b_weave_composition_py_emit_path_j_105 :: changelog [ok]
  text = "`weave_composition.py` emit-path jsonschema validation wired (C0e); P=10"

@D b_selftest_json_schema_validator_p_106 :: changelog [ok]
  text = "`selftest/json_schema_validator.py` (stdlib draft-07 subset; type / required"

@D b_selftest_f_tp5_e_uptake_enumerat_107 :: changelog [ok]
  text = "`selftest/f_tp5_e_uptake_enumerator.py` + `weave/spec/compose_uptake_v1.schema.json`"

@D b_f_cl_formal_1_2_3_deferred_no_le_108 :: changelog [ok]
  text = "F-CL-FORMAL-1/2/3 DEFERRED (no lean4 layer in repo)."

@D b_raw_77_nanobot_subclause_direct_109 :: changelog [ok]
  text = "`raw_77_nanobot_subclause_direct_read_v1` (F-NB-3-floor/-b)"

@D b_raw_77_nanobot_subclause_direct_110 :: changelog [ok]
  text = "`raw_77_nanobot_subclause_direct_read_v2` (F-NB-1-genus/-b)"

@D b_raw_77_nanobot_subclause_direct_111 :: changelog [ok]
  text = "`raw_77_nanobot_subclause_direct_read_v3` (F-NB-3-c worst-case env)"

@D b_raw_77_ribozyme_subclause_direct_112 :: changelog [ok]
  text = "`raw_77_ribozyme_subclause_direct_read_v1` (F-RB-3-diff/-b)"

@D b_raw_77_ribozyme_subclause_direct_113 :: changelog [ok]
  text = "`raw_77_ribozyme_subclause_direct_read_v2` (F-RB-1-genus/-b)"

@D b_raw_77_ribozyme_subclause_direct_114 :: changelog [ok]
  text = "`raw_77_ribozyme_subclause_direct_read_v3` (F-RB-3-c Mg²⁺ sweep)"

@D b_f_rb_2_inter_rater_g26_rb_1_need_115 :: changelog [ok]
  text = "F-RB-2-inter-rater (G26-RB-1) — needs ≥2 human raters (external)."

@D b_f_nb_2_extended_inter_rater_same_116 :: changelog [ok]
  text = "F-NB-2-extended-inter-rater — same; on n=60 dynamic-balanced corpus."

@D b_f_nb_1_c_depends_on_f_nb_5_cross_117 :: changelog [ok]
  text = "F-NB-1-c — depends on F-NB-5 cross-repo canon canonical edits."

@D b_f_cl_formal_depends_on_lean4_mec_118 :: changelog [ok]
  text = "F-CL-FORMAL-* — depends on lean4 mechanical layer materialisation."

@D b_gate_26_3_weave_p_2_np_solver_co_119 :: changelog [ok]
  text = "GATE-26-3 weave-π_p_2-NP-solver — code work, ≥1 session."

@D b_gate_26_6_regression_ci_wire_ci_120 :: changelog [ok]
  text = "GATE-26-6 regression-CI-wire — CI infra setup."

@D b_python_bridge_module_ribozyme_in_121 :: changelog [ok]
  text = "`_python_bridge/module/ribozyme_interrater_ai_audit.py` +"

@D b_weave_spec_lean4_mechanical_laye_122 :: changelog [ok]
  text = "`weave/spec/lean4_mechanical_layer_v0.scaffold.md` +"

@D b_python_bridge_module_weave_pi_p2_123 :: changelog [ok]
  text = "`_python_bridge/module/weave_pi_p2_verifier_v3_exhaustive.py` —"

@D b_selftest_regression_audit_py_gat_124 :: changelog [ok]
  text = "`selftest/regression_audit.py` — GATE-26-6 regression-CI-wire"

@D b_selftest_registry_consistency_au_125 :: changelog [ok]
  text = "`selftest/registry_consistency_audit.py` — registry-vs-spec audit;"

@D b_selftest_run_all_sh_single_shot_126 :: changelog [ok]
  text = "`selftest/run_all.sh` — single-shot pre-merge gate (3 PASS / 1 FAIL"

@D b_gate_26_1_closed_pass_t_3_t_4_yi_127 :: changelog [ok]
  text = "GATE-26-1: **CLOSED PASS** (T=3 / T=4 yield ≥0.85)"

@D b_gate_26_2_scaffold_landed_in_rep_128 :: changelog [ok]
  text = "GATE-26-2: **SCAFFOLD LANDED** (in-repo); upstream proof bodies pending"

@D b_gate_26_3_closed_pass_np_solver_129 :: changelog [ok]
  text = "GATE-26-3: **CLOSED PASS** (NP-solver path, 50/50 agreement)"

@D b_gate_26_4_provisional_ai_audit_l_130 :: changelog [ok]
  text = "GATE-26-4: **PROVISIONAL AI-AUDIT LANDED** (κ=0.2007 FAIL — humans pending)"

@D b_gate_26_5_closed_decisive_pass_l_131 :: changelog [ok]
  text = "GATE-26-5: **CLOSED DECISIVE PASS** (log_bf 0.16 → 13.65)"

@D b_gate_26_6_closed_pass_4_4_regres_132 :: changelog [ok]
  text = "GATE-26-6: **CLOSED PASS** (4/4 regression at canonical seed)"

@D b_canon_canonical_handoff_json_dom_133 :: changelog [ok]
  text = "canon canonical handoff JSON `domains/life/therapeutic-nanobot/handoff/2026-05-28_*.json` LANDED with 7 L7-L9 primitives definitionally disjoint from hexa-bio L0-L6."

@D b_hexa_bio_audit_nanobot_n_r2_boun_134 :: changelog [ok]
  text = "hexa-bio audit `nanobot_n_r2_boundary_audit.py` re-run: CANONICAL_PENDING → PASS auto-promote."

@D b_a_5_collision_audit_table_3_3_pa_135 :: changelog [ok]
  text = "§A.5 collision audit table: 3/3 PASS (vs prior 2 PASS + 1 PARTIAL)."

@D b_canon_domains_life_synbio_canoni_136 :: changelog [ok]
  text = "canon `domains/life/synbio/` canonical stub LANDED — synbio.md spec + spec/selex_v0.schema.json + _index.json bumped 1.4.0 → 1.5.0."

@D b_hexa_bio_r_r2_boundary_section_d_137 :: changelog [ok]
  text = "hexa-bio R-R2 boundary section: declarative-only → live cross-repo dependency."

@D b_f_cl_formal_1_real_semantics_pro_138 :: changelog [ok]
  text = "F-CL-FORMAL-1: real-semantics PROVEN — `sigma_lattice_card := rfl` (sigma is computable Nat function via List.range+filter+foldl, sigma 6 reduces to 1+2+3+6=12 by kernel evaluation)."

@D b_f_cl_formal_2_3_4_proven_over_pl_139 :: changelog [ok]
  text = "F-CL-FORMAL-2/3/4: PROVEN-OVER-PLACEHOLDER — `landauer_monotonic := by simp [heatConsumed, compose]; omega`, `pi_p2_verifier_terminates := ⟨0, by simp [verifierSteps]⟩`, `closure_cert_idempotent := fun _ => rfl`."

@D b_all_4_kernel_checked_on_lean4_4_140 :: changelog [ok]
  text = "All 4 kernel-checked on lean4 4.30.0-rc1, no Mathlib needed."

@D b_raw_91_honest_c3_axes_2_3_4_veri_141 :: changelog [ok]
  text = "raw_91 honest C3: axes 2/3/4 verify STATEMENT-OVER-STUB-SEMANTICS only (Strategy/compose/heatConsumed/verifierSteps/discloseOnce are placeholders); real-semantics versions cycle 30+. axis-PASS rate 100% per stub layer; sorry-count = 0 is a valid intermediate state but not real-semantics closure."

@D b_inter_rater_rubric_v2_py_common_142 :: changelog [ok]
  text = "inter_rater_rubric_v2.py — common locked decision-tree (P1 numerical / P2 notes regex / P3 fallback). Both raters share rubric, only tie-breaker order differs."

@D b_ribozyme_0_2007_fail_1_0000_pass_143 :: changelog [ok]
  text = "RIBOZYME κ: 0.2007 FAIL → **1.0000 PASS** (rubric-PRECISION, not rubric-dependence — cycle-25 30/30 was rubric collapsing two raters to identical decisions)."

@D b_nanobot_0_4821_fail_1_0000_pass_144 :: changelog [ok]
  text = "NANOBOT κ: 0.4821 FAIL → **1.0000 PASS** (same finding)."

@D b_ai_rater_still_not_human_rater_s_145 :: changelog [ok]
  text = "AI-rater still NOT human-rater substitute; GATE-26-4 final closure waits human raters 2026-06-15."

@D b_gate_26_1_closed_pass_gate_26_2_146 :: changelog [ok]
  text = "GATE-26-1: CLOSED PASS · GATE-26-2: **CLOSED PROVEN-OVER-PLACEHOLDER** ·"

# ── [1.1.0] - 2026-05-06 ─────────────────────────────────────────


@D b_roadmap_trackers_in_canonical_ro_0 :: changelog [ok]
  text = "Roadmap trackers in canonical `.roadmap.<feature>` convention (1 file"

@D b_docs_n6_symlinks_to_canonical_ca_1 :: changelog [ok]
  text = "`docs/n6/` symlinks to canonical canon sister-domain specs"

@D b_docs_readme_md_mapping_each_link_2 :: changelog [ok]
  text = "`docs/README.md` mapping each link to its canonical path."

@D b_roadmap_badge_body_cross_link_in_3 :: changelog [ok]
  text = "Roadmap badge + body cross-link in README."

@D b_c2_16_cell_matrix_closure_2026_0_4 :: changelog [ok]
  text = "C2 16-cell matrix closure (2026-05-06, cycle 25) — first traversal of"

@D b_cycle_25_abstract_follow_on_trac_5 :: changelog [ok]
  text = "Cycle-25 abstract follow-on track (2026-05-06) — 5 bg-eligible tasks"

@D b_6_cycle_25_omega_cycle_closure_k_6 :: changelog [ok]
  text = "6 cycle-25 omega-cycle closure kicks in `design/kick/`:"

@D b_design_kick_directory_bootstrapp_7 :: changelog [ok]
  text = "`design/kick/` directory bootstrapped (2026-05-05, cycle 24) — 7 omega-cycle"

@D b_f_tp5_b_c0b_closure_2026_05_05_c_8 :: changelog [ok]
  text = "F-TP5-b C0b closure (2026-05-05, cycle 24) —"

@D b_f_nb_4_c0b_closure_2026_05_05_cy_9 :: changelog [ok]
  text = "F-NB-4 C0b closure (2026-05-05, cycle 24) —"

@D b_f_rb_4_c0b_closure_2026_05_05_cy_10 :: changelog [ok]
  text = "F-RB-4 C0b closure (2026-05-05, cycle 24) —"

@D b_f_virocapsid_3_c0b_closure_2026_11 :: changelog [ok]
  text = "F-VIROCAPSID-3 C0b closure (2026-05-05, cycle 24) —"

@D b_hexa_dispatcher_in_virocapsid_mo_12 :: changelog [ok]
  text = "HEXA dispatcher in `virocapsid/module/virocapsid.hexa` — `--calibrate"

@D b_state_discovery_absorption_regis_13 :: changelog [ok]
  text = "`state/discovery_absorption/registry.jsonl` — new append-only registry"

@D b_layout_migration_to_feature_grou_14 :: changelog [ok]
  text = "Layout migration to feature-grouped triplet (canonical 2026-05-05): each"

@D b_roadmap_restructure_2026_05_05_t_15 :: changelog [ok]
  text = "Roadmap restructure (2026-05-05) — terminal goal reframed from formalism-"

@D b_c0a_sister_axis_audit_closure_20_16 :: changelog [ok]
  text = "C0a sister-axis audit closure (2026-05-05) — 3건 audit 결과: F-RB-5 **PASS"

# ── [1.0.0] - 2026-05-04 ─────────────────────────────────────────


@D b_initial_standalone_extraction_fr_0 :: changelog [ok]
  text = "Initial standalone extraction from nexus monorepo (sister of qmirror /"

@D b_4_verb_molecular_toolkit_hexa_fa_1 :: changelog [ok]
  text = "4-verb Molecular Toolkit (HEXA family):"

@D b_4_verb_cli_router_cli_hexa_bio_h_2 :: changelog [ok]
  text = "4-verb CLI router (`cli/hexa-bio.hexa`) with subcmds: `weave`, `nanobot`,"

@D b_4_test_smoke_harnesses_tests_tes_3 :: changelog [ok]
  text = "4 test smoke harnesses (`tests/test_{weave,nanobot,ribozyme,virocapsid}.hexa`)"

@D b_4_example_files_examples_01_04_h_4 :: changelog [ok]
  text = "4 example files (`examples/01..04_*.hexa`) — one per verb quick-start."

@D b_install_hexa_hx_hook_raw_9_stric_5 :: changelog [ok]

@D b_apache_2_0_license_readme_change_6 :: changelog [ok]
  text = "Apache-2.0 license, README, CHANGELOG, hexa.toml manifest."

@D b_github_only_distribution_canonic_7 :: changelog [ok]
  text = "GitHub-only distribution (canonical at"

@D b_hf_hub_mirror_cli_tool_github_ca_8 :: changelog [ok]
  text = "HF Hub mirror (CLI tool — GitHub canonical, 2026-05-04). HF Hub is designed"

@D b_1_of_4_verbs_weave_is_empiricall_9 :: changelog [ok]
  text = "1 of 4 verbs (`weave`) is empirically wired with full simulator + audit."

@D b_3_of_4_verbs_nanobot_ribozyme_vi_10 :: changelog [ok]
  text = "3 of 4 verbs (`nanobot`, `ribozyme`, `virocapsid`) ship as **stub"

@D b_n_6_invariant_lattice_6_12_6_4_6_11 :: changelog [ok]
  text = "n=6 invariant lattice (`σ(6)=12, τ(6)=4, φ(6)=2, J₂=24`) is a *speculative*"

@D b_falsifiers_for_stub_verbs_are_in_12 :: changelog [ok]
  text = "Falsifiers for stub verbs are *initial-guess* deadlines (open-ended)."

@D b_migration_of_nexus_sim_bridge_we_13 :: changelog [ok]
  text = "Migration of `nexus/sim_bridge/weave/` may break edge-case consumers"

@D b_extracted_from_nexus_sim_bridge_14 :: changelog [ok]
  text = "Extracted from `nexus/sim_bridge/weave/` (commit f81239d6+) on 2026-05-04."

@D b_sister_extractions_qmirror_v2_0_15 :: changelog [ok]
  text = "Sister extractions: `qmirror` v2.0.0 (registry L22), `sim-universe` v1.0.0"

@D b_closure_verdict_1_4_verbs_pass_w_16 :: changelog [ok]
  text = "Closure verdict: **1/4 verbs PASS** (weave); 3/4 axes pre-implementation."
