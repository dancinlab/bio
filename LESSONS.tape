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
# GRADE TAGS (in [...] on entry header):
#   Delivery:   ok · err · denied · cancelled · partial · superseded
#   Governance: required · recommended · optional · draft · active · deprecated
#   Scoped:     allow:<x> · deny:<x>
#   Time/index: T<n> (turn)  N<n> (wall-sec)  d=<YYYY-MM-DD>
#
# PAYLOAD SYNTAX (body lines):
#   key = "value"           single-line string
#   key = [a, b, c]         array literal
#   key <<~EOF              heredoc (multi-line; ends with EOF on own line)
#     multi-line text
#   EOF
#   "see [@x1] §3"          inline citation by entry id
#   `cmd or path`           backtick code-span (inline only)
#
# Full spec: ~/core/tape/spec/tape.md (or github.com/dancinlab/tape)
# ══════════════════════════════════════════════════════════════════════


# ══════════════════════════════════════════════════════════════
# LESSONS.tape — architecture-current (editable per v1.2)
# Event history → LESSONS.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "lessons" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · lessons substrate"
  brief = "per-domain retrospective lessons — optimizer selection, infrastructure, compute boundary, workflow, paradigm closure"
  parent = "dancinlab/hexa-bio"
  sibling-log = "LESSONS.log.tape"
  tape-class = "meta/lessons"
  rewritten-from = "LESSONS.tape pre-2026-05-16 (no honesty contract; added @F/@N/@X meta-mode opt-in 2026-05-16)"

# ── §0 Honesty preamble (LATTICE_POLICY g1/g2/f1 — META tape, meta-mode opt-in) ─

@N scope_disclaimer := "lessons scope — in-silico retrospective only" :: note [required]
  text = "These lessons record engineering and process observations from in-silico VQE / molecular simulation work only. They do NOT constitute therapeutic, clinical, regulatory, or wet-lab claims. Scope: computational optimizer behavior, infrastructure constraints, compute boundary, and workflow process. All 5 axes remain scientifically unproven at the wet-lab boundary (AGENTS.tape g8_in_silico_only)."

@F f_lattice_fit := "lattice-fit-in-lessons-entries" :: governance [required deny:write]
  pattern = "Deriving any claim (convergence quality / optimizer ranking / compute boundary) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) inside a lessons entry — e.g. 'this optimizer works because σ·φ' or 'the n=6 substrate determines cluster count'."
  why = "Lattice tokens that appear in the historical lesson entries below are DESCRIPTIVE PROVENANCE of artifact names and engineering context, NOT a derivation. The cluster count (rows 0–9 = 10 clusters) is derived from the actual VQE iteration log, not from the lattice. The optimizer rankings emerge from observed convergence behavior in PySCF/Qiskit runs. No lattice derivation is used or intended."
  remedy = "Any future lessons entry must cite the real underlying engineering/science (iteration index, optimizer name, convergence delta, wall time), never the lattice as a derivation. Lattice mentions remain coincidental observation / artifact-name provenance only."
  authority = "[@x_lattice_policy] g1/g2 · hexa-bio AGENTS.tape f1 · [@x_agents_tape] g_meta_mode_optin"

@N n6_honest_stance := "lessons lattice mentions are provenance, not derivation" :: note [required]
  text = "Stated plainly and honestly: this is the hexa-bio LESSONS retrospective. The n=6 tokens do not appear as derivation anchors in these lessons. Cluster labels (RNA WC, light-atom H-bond, ionic/saturated, Mg+adenine, transition metal, K+π-stack, conjugated heterocycle, thioether, phosphate ester, dihydropyridine) are chemistry descriptors from actual PySCF active-space selection — not lattice categories. The sole determinant of optimizer ranking and sub-µHa feasibility recorded here is frontier 4-orbital near-degeneracy (an ab initio quantum chemistry criterion). Per LATTICE_POLICY g1/g2 + lattice-as-tool, the lattice is declined here as a derivation tool; observation-not-derivation. This honesty preamble opts this file into meta-mode per AGENTS.tape g_meta_mode_optin."
  methodology-cite = "AGENTS.tape g_meta_mode_optin (2026-05-16) · AGENTS.tape g8_in_silico_only · LATTICE_POLICY g1/g2"

@X x_lattice_policy := "echoes/LATTICE_POLICY.md" :: governance [active]
  url = "https://github.com/dancinlab/echoes/blob/main/LATTICE_POLICY.md"
  scope = "real-limits-first · lattice-is-tool · observation-not-derivation — the governance authority this preamble enforces"

@X x_agents_tape := "hexa-bio AGENTS.tape" :: governance [active]
  path = "./AGENTS.tape"
  scope = "g_meta_mode_optin (tape-lint meta-mode opt-in) · g1 real-limits-first · g2 lattice-is-tool · f1 lattice-fit-on-external-entity · g8_in_silico_only"

# ── 1. optimizer selection — cluster-type × optimizer matrix ──────────────────────────────

@D row_rna_wc_thiophosphate_0 :: lessons [ok]
  cluster_type = "RNA WC + thiophosphate"
  best_optimizer = "L_BFGS_B"
  worst_optimizer = "(untested)"
  x = "gradient 강력"


@D row_light_atom_h_bond_1 :: lessons [ok]
  cluster_type = "light-atom 다중 H-bond"
  best_optimizer = "L_BFGS_B"
  worst_optimizer = "SLSQP (local trap)"
  x = "KIF5A 7280→0.023 µHa"


@D row_ionic_saturated_protein_2 :: lessons [ok]
  cluster_type = "ionic/saturated/protein"
  best_optimizer = "SLSQP"
  worst_optimizer = "(L_BFGS_B 동등)"
  x = "단순 PES, 어떤 optimizer 도 OK"


@D row_mg_adenine_s_indole_3 :: lessons [ok]
  cluster_type = "Mg+adenine+S+indole"
  best_optimizer = "SLSQP"
  worst_optimizer = "(untested)"
  x = "TBK1 sub-µHa"


@D row_transition_metal_d_orbital_4 :: lessons [ok]
  cluster_type = "transition metal d-orbital"
  best_optimizer = "L_BFGS_B≈SLSQP"
  worst_optimizer = "(basis 한계)"
  x = "optimizer 무관"


@D row_k_stack_5 :: lessons [ok]
  cluster_type = "K⁺ + π-stack"
  best_optimizer = "SLSQP"
  worst_optimizer = "L_BFGS_B (악화 700x)"
  x = "c9orf72 1.4→964 µHa"


@D row_conjugated_heterocycle_6 :: lessons [ok]
  cluster_type = "conjugated heterocycle"
  best_optimizer = "L_BFGS_B (절반 개선)"
  worst_optimizer = "SLSQP"
  x = "SARM1"


@D row_thioether_s_imidazole_imine_21_a_7 :: lessons [ok]
  cluster_type = "thioether-S + imidazole + imine (21-atom, n_pauli 325)"
  best_optimizer = "SLSQP (~403s 수렴)"
  worst_optimizer = "L_BFGS_B (600s 미수렴)"
  x = "Mpro/nirmatrelvir adduct iter 18"


@D row_phosphate_ester_alcohol_amine_23_8 :: lessons [ok]
  cluster_type = "phosphate ester + alcohol + amine (23-atom, n_pauli 325)"
  best_optimizer = "SLSQP (124s, 0.12 µHa)"
  worst_optimizer = "(untested)"
  x = "hammerhead ribozyme core iter 21 — 가장 빠른 n_pauli-325"


@D row_dihydropyridine_carboxamide_23_a_9 :: lessons [ok]
  cluster_type = "dihydropyridine + 공액 carboxamide (23-atom, n_pauli 325)"
  best_optimizer = "SLSQP (161s, 0.90 µHa)"
  worst_optimizer = "(untested)"
  x = "M.tb InhA/isoniazid iter 22 — NADH hydride-donor core"


@D b_sub_ha_light_atom_dominant_h_c_n_10 :: lessons [ok]
  text = "sub-µHa 가능: light-atom dominant (H/C/N/O/S), 다중 chemical species, frontier 가 well-separated bonding/antibonding"


@D b_sub_ha_transition_metal_d_orbita_11 :: lessons [ok]
  text = "sub-µHa 불가: transition metal d-orbital localized, near-degenerate frontier (π-stack), 큰 conjugated system"


@D b_iter_16_hxq_mi_hmg_001_sp3_heavy_12 :: lessons [ok]
  text = "iter 16 (`hxq-mi-hmg-001`): sp3-heavy backbone (3-OH-3-Me-butanoate + NH3, 21 atom) 으로 짰는데도 n_pauli 325 — carboxylate 의 delocalized O–C–O π/π* 가 4e/4o frontier 에 들어가서. carbonyl/carboxylate/aromatic 이 분자 안에 있으면 active space 가 자주 거기 걸린다 → delta 27.4 µHa, chem-acc only."


@D b_kras_tiny_adduct_hxq_ca_kras_001_13 :: lessons [ok]
  text = "반대로 KRAS-tiny adduct (`hxq-ca-kras-001`) 는 thioether S lone-pair 가 frontier → n_pauli ~175 → sub-µHa + 빠른 VQE."


@D b_n_pauli_sub_ha_tbk1_n_pauli_325_14 :: lessons [ok]
  text = "단, n_pauli 큰 게 곧 sub-µHa 불가 아님: TBK1 (n_pauli 325), ALK5 iter 17 (imidazole+formamide, n_pauli 317, 0.30 µHa·443s), HIV-1 PR iter 20 (carboxyl-dyad + alcohol, n_pauli 325, 0.15 µHa·246s), hammerhead ribozyme iter 21 (phosphate ester, n_pauli 325, nbas 67, CASCI -879 Ha, 0.12 µHa·124s), M.tb InhA iter 22 (dihydropyridine + 공액 carboxamide, n_pauli 325, 0.90 µHa·161s) — aromatic/conjugated/phosphate/dihydropyridine 5 클러스터가 전부 sub-µHa + 빠름. 유일한 sub-µHa·속도 결정 인자 = frontier 4-orbital 의 near-degeneracy 유무. n_pauli·atom 수·nbas·총 에너지·conjugation 전부 무관."


@D b_loop_cheap_175_2min_aromatic_rin_15 :: lessons [ok]
  text = "loop-cheap (~175 Pauli, ~2min) 원하면: aromatic ring·conjugated carbonyl chain·carboxylate 배제, frontier 를 S/N lone-pair·σ-bond 영역으로. 그게 안 되는 chemistry (mevalonate carboxylate, kinase ATP-hinge imidazole 등) 는 n_pauli ~317-325 를 받아들이고 dedicated 600s run (SLSQP/150, 1 optimizer) — chem-acc 는 항상, sub-µHa 는 frontier near-degeneracy 없으면."

# ── 2. infrastructure — sshfs + Python + qiskit ──────────────────────────────────


@D row_nested_so_dlopen_0 :: lessons [ok]
  issue = "nested `.so` dlopen 불안정"
  symptom = "`libRDKitForceFieldHelpers.so.1` not-found 간헐"
  x = "venv를 local SSD 복사 (`/home/<user>/.venv-*`)"


@D row_py_permissionerror_1 :: lessons [ok]
  issue = "새 `.py` 파일 PermissionError"
  symptom = "Write tool 직후 python 실행 시 'Operation not permitted'"
  x = "local SSD 복사 후 실행 (`cp` 후 python)"


@D row_write_tool_md_eperm_2 :: lessons [ok]
  issue = "Write tool 의 .md 파일 EPERM"
  symptom = "sshfs uid 매핑 (501→aiden/summer) 충돌"
  x = "local SSD `cat << EOF` heredoc 후 `cp`"


@D row_mmap_block_read_3 :: lessons [ok]
  issue = "`mmap()` block (read() 와 분기)"
  symptom = "numpy/qiskit large array 처리 시 hang"
  x = "local SSD 작업 후 결과만 sshfs 에 commit"

# ── 3. compute boundary — loop-feasible vs 외부 ramp ─────────────────────────────


@D row_sto_3g_4e_4o_n_pauli_175_sat_ion_0 :: lessons [ok]
  approach = "sto-3g 4e/4o, n_pauli ~175 (sat/ionic)"
  basis = "sto-3g"
  active_space = "4e/4o"
  nbas_n_qubits = "~140 / 6"
  loop_feasible = "yes ~1-3 min"
  note = "ClC-1·KRAS-tiny; 5분 loop 안에 2-3개 가능"


@D row_sto_3g_4e_4o_n_pauli_325_conj_ar_1 :: lessons [ok]
  approach = "sto-3g 4e/4o, n_pauli ~325 (conj/aromat)"
  basis = "sto-3g"
  active_space = "4e/4o"
  nbas_n_qubits = "~140-320 / 6"
  loop_feasible = "marginal ~5-9 min VQE"
  note = "AR·HMG·TBK1; 480s timeout 부족 → `timeout 600` (cron-shell max) + maxiter 150 = chem-acc PASS (iter 16: HMG 27.4 µHa @ wall 516s). 1 iter = 1 cluster 전용."


@D row_sto_3g_6e_6o_larger_as_2 :: lessons [ok]
  approach = "sto-3g 6e/6o (larger AS)"
  basis = "sto-3g"
  active_space = "6e/6o"
  nbas_n_qubits = "~140 / 10"
  loop_feasible = "no 8+ min"
  note = "n_params 117, n_pauli 1819, VQE timeout"


@D row_lanl2dz_ecp_4e_4o_3 :: lessons [ok]
  approach = "lanl2dz ECP 4e/4o"
  basis = "lanl2dz"
  active_space = "4e/4o"
  nbas_n_qubits = "168 / 6"
  loop_feasible = "no OOM"
  note = "integral tensor 5+ GB"


@D row_6_31g_4e_4o_4 :: lessons [ok]
  approach = "6-31g 4e/4o"
  basis = "6-31g"
  active_space = "4e/4o"
  nbas_n_qubits = "~200 / 6"
  loop_feasible = "no 8+ min RHF"
  note = "SCF DIIS 미수렴"


@D row_def2_svp_4e_4o_27_atom_zn_cluste_5 :: lessons [ok]
  approach = "def2-svp 4e/4o (27-atom Zn cluster)"
  basis = "def2-svp"
  active_space = "4e/4o"
  nbas_n_qubits = "~320 / 6"
  loop_feasible = "no 60+ min RHF"
  note = "killed"

# ── 4. workflow — background task 운영 ───────────────────────────────────────────


@D b_until_pgrep_f_lanl2dz_do_sleep_p_0 :: lessons [ok]
  text = "pgrep -f matching own shell string → infinite loop; avoid pgrep -f matching the search term directly"


@D b_python_foo_py_tail_n_stdout_bloc_1 :: lessons [ok]
  text = "`python foo.py | tail -N` — stdout block-buffered, progress 못 봄. full log 직접 redirect 필수"


@D b_print_without_flush_true_long_ru_2 :: lessons [ok]
  text = "`print(...)` without `flush=True` — long-running script 의 progress 안 보임"


@D b_timeout_480_n_pauli_325_vqe_30_6_3 :: lessons [ok]
  text = "`timeout 480` 으로 n_pauli-325 VQE 돌리기 — ~30-60s 부족해서 미수렴으로 보임 (실제론 알고리즘 OK). iter 15→16 의 교훈: timeout 부족 ≠ 알고리즘 실패. 무거운 conjugated cluster 는 `timeout 600` (cron-shell 최대) + maxiter=150 (300 불필요) + optimizer 1개만 (L_BFGS_B 추가 X) = chem-acc 안에 닫힘."

# ── 5. paradigm — closure 의 두 층위 ─────────────────────────────────────────────


@D row_paradigm_level_closure_0 :: lessons [ok]
  label = "paradigm-level closure"
  v7_1_status = "CMT 100%, ALS Q+RB-axis 100%"
  note = "양자 pipeline + drug-likeness + IP heuristic + modality spec + falsifier 분기"


@D row_f_q_6_d_pocket_vqe_entry_1 :: lessons [ok]
  label = "F-Q-6-D pocket VQE entry"
  v7_1_status = "14 target chem-acc, 8 sub-µHa"
  note = "pocket-restricted active-space pipeline 입증 (CMT 5 + ALS 5 + KRAS-G12C + AR + HMG-CoA + ALK5; 6 cohort 전부 1 이상 chem-acc)"


@D row_transition_metal_sub_ha_2 :: lessons [ok]
  label = "transition-metal sub-µHa"
  v7_1_status = "미완료 — 외부 ramp 확정"
  note = "HPC/GPU multi-hour 필요"


@D row_wet_lab_selectivity_3 :: lessons [ok]
  label = "wet-lab selectivity"
  v7_1_status = "미완료 — 0건"
  note = "$50-200K × 화합물 × 3-6 month — 외부 단계"


@D row_1_3_4 :: lessons [ok]
  label = "임상 1-3상"
  v7_1_status = "미완료 — ~7-12년 전"
  note = "$100-300M, 성공률 9%"


@D row_nda_5 :: lessons [ok]
  label = "환자 도달 (NDA)"
  v7_1_status = "미완료 — ~12-15년 후"
  note = "본 software repo 의 범위 밖"


@D b_software_closable_6 :: lessons [ok]
  text = "'software-closable 끝점' 명시 → 무한 폴링 회피"


@D b_ramp_7 :: lessons [ok]
  text = "'외부 ramp 경로' 명시 → 다음 세션 진입점 명확"


@D b_honest_scope_8 :: lessons [ok]
  text = "honest scope → 과대선전 회피"

# ── 6. own preference (own 등록 사항) ─────────────────────────────────────────────


@D b_memory_feedback_report_table_for_0 :: lessons [ok]
  text = "`memory/feedback_report_table_format.md` — multi-iter 진행 / paradigm 보고 시 ASCII box 또는 markdown 표 포함"


@D b_docs_report_table_sample_md_samp_1 :: lessons [ok]
  text = "`docs/report_table_sample.md` — sample 1 (iteration matrix) + sample 2 (chem environment × delta paradigm)"

# ── 7. 다음 세션 진입점 (handoff) ────────────────────────────────────────────────


@D b_v7_commit_graph_6a876b9_e12f469_0 :: lessons [ok]
  text = "v7 commit graph: 6a876b9 → e12f469 → b605414 → d5a0cb2 → 0b5bf22 → d6f258f (CMT closure) → afb5561 → ... → b24613a (iter 13) → 91a8550 (iter 14 KRAS) → 3eb20d4 (iter 15 AR/HMG cadence) → 592b2e3 (iter 16) → 97030ad (iter 17 ALK5) → aa04780 (iter 18 Mpro) → edc0e0d (iter 19 §15.8 closure) → 7aea20c (cross-host quantum F-Q-6/L3) → a84e6a8 (iter 20 HIV-1 PR) → f6ebdda (iter 21 hammerhead ribozyme) → iter 22 (M.tb InhA)"


@D b_tags_v7_0_cmt_closure_v7_1_cmt_p_1 :: lessons [ok]
  text = "tags: `v7.0-cmt-closure` · `v7.1-cmt-phase-gamma-push` · `v7.2-cmt-pocket-vqe-complete` · `v7.3-cmt-als-pocket-vqe-complete`"

# ── 8. 한 줄 요약 ─────────────────────────────────────────────────────────────────

# 5분 cron loop + sto-3g 4e/4o + 3-optimizer screen + sshfs-아닌-local-SSD venv =
# 18-target pocket VQE chem-acc PASS · 11 sub-µHa · 10 systems/mechanisms
# (6 disease cohort + 3 antimicrobial + ribozyme 촉매) · F-Q-6 leaf in-repo PASS ·
# quantum×ribozyme axis bridge · CMT 100% + ALS Q+RB-axis 100% + §15.8
# software-closable closure 선언. n_pauli 317-325 conjugated cluster 도 frontier
# near-degeneracy 없으면 sub-µHa + 빠름 (~120-440s); 있으면 chem-acc only (HMG·Mpro).
# transition-metal 정밀 sub-µHa·larger-AS·실 PDB QM/MM·wet-lab·임상 = 외부 ramp.
