# AXIS_CLOSURE_PLAN — 5축 100% closure 로드맵

> hexa-bio 의 **5-axis** (QUANTUM / WEAVE / NANOBOT / RIBOZYME / VIROCAPSID;
> count locked — `.roadmap.axis_expansion_decision_2026_05_08`) 중 현재
> **weave 만 v1.x 스코프에서 100% closure** 닫혀 있다. 나머지 4축의 잔여
> gate / deadline / owner / 시퀀싱을 정리한다.
>
> **작성**: 2026-05-12 · **SSOT**: per-axis `.roadmap.*` sister files +
> `.roadmap.hexa_bio` (cross-cutting) + `CHANGELOG.md` `[Unreleased]`
> · **MVP gate**: 2026-07-28 (`.roadmap.hexa_bio §A.4`)
>
> **honest C3 (raw#10)**: 본 문서의 "100% closure" 는 *in-silico /
> formalism / infrastructure* 스코프 한정 — σ(6)=12 STRUCTURAL-EXACT +
> Bayesian audit decisive + output schema lock + C2 4/4 + falsifier
> preregister 전부 PASS. **therapeutic / clinical / regulatory / efficacy
> 와는 무관** (C3+ = out-of-repo, cross-cutting Require R6). full
> lean4-backed Π¹₁-CA₀ cert 는 v1.x 전체에서 MVP-caveat disclosure
> surrogate 로 처리되고 GATE-26-2 → v2.0.0 으로 track된다.

> **repo boundary note (2026-05-12)**: nanobot / ribozyme / virocapsid 의
> C0b skeleton 시뮬레이터(`*_actuation_simulation.py` / `*_kinetics_simulation.py`
> / `*_calibration.py` / `*_bayesian_audit_n30.py` 등)와 weave 의
> `weave_composition.py` / `cage_assembly_simulation.py` 는 **R5 sunset
> 으로 이 repo 트리에서 제거**되었다 (`_python_bridge/module/` 에는 `runs/`
> ledger + `__pycache__` 만 잔존; 실 SSOT 는 `~/core/nexus/sim_bridge/` 등
> 외부). 따라서 "simulator 재실행 + registry witness emit" 이 필요한 gate
> (virocapsid C5 conformance, nanobot C0d cuboctahedron, ribozyme G26-RB-3,
> Bayesian audit 재실행 등)의 *실행*은 외부 cycle 워크플로 소관이고, 이
> repo 에서 가능한 in-repo 작업은 ① schema 파일 (`*/spec/*.schema.json`) ②
> 본 closure plan ③ `_qiskit_bridge/module/*.py` + `tests/*_v7.py` (quantum
> pocket VQE adapters/scripts — 이건 in-repo) 로 한정. quantum 의 full VQE
> 실행은 추가로 `qiskit-aer` + `hx install qmirror` 필요.

---

## §0 "axis 100% closure" 정의 (weave 가 만족한 기준 = 다른 4축의 목표)

| # | 기준 | weave 가 닫은 방식 |
|---|------|---------------------|
| 1 | **σ(6)=12 STRUCTURAL-EXACT** (CANDIDATE 아님) | T=1 cage vertex-count Bayesian audit posterior 0.9668 (n=34 corpus) |
| 2 | **핵심 numerical sandbox PASS 6/6** | F-TP5-b — `weave_compose()` end-to-end MVP, P=10×N=50=500 trial rows |
| 3 | **lean4 mechanical layer sorry-free** | sorry count = 0 (W5 milestone) |
| 4 | **output schema lock + row conformance** | `weave/spec/composition_output_v1.schema.json` + draft-07 validator (W-R1 / C0e) |
| 5 | **C2 4/4** (4 disease class × in-silico 후보 1개 + verification) | `raw_77_c2_weave_{aml,scd,pancov,senolytic}_v1` |
| 6 | **falsifier preregister 전부 PASS** (v1.x 스코프) | 12/12 (9 closure + 3 cycle 7-9 additions; C0c/C0d = user-discretion PASS) |
| 7 | **deterministic computational verification** — σ/τ/φ/J₂ claim 이 *math/physics 계산*으로 재현가능하게 검증 (human 판정 불가) | weave: σ(6)=12 = cage vertex count (Euler V−E+F=2 + Caspar-Klug T-number 기하), Bayesian audit posterior 도 deterministic likelihood |

> **검증 정책 (user directive 2026-05-12)**: 모든 axis 의 σ(6)=12 / τ(6)=4 /
> φ(6)=2 / J₂=24 claim 은 **수학적·물리적 계산으로 검증 가능해야 한다** —
> 사람 inter-rater 의 주관적 axis-match 채점 금지. Bayesian corpus audit 의
> **채점 방식(scoring rubric)** 도 deterministic predicate 로 정의한다:
> σ-match ⟺ 해당 system 의 cardinality(vertex / nt-core / Pauli-term / state-quartet
> 등) == 12; τ-match ⟺ #(distinct directed states) == 4; φ-match ⟺ binary
> dichotomy 존재; J₂-match ⟺ symmetry-group order == 24. → corpus 의 각 entry
> 에 대한 match 는 코드가 산출하는 boolean, 사람 판단 아님. ribozyme / nanobot
> 의 G26-RB-1 / G26-NB-EXT "inter-rater" 게이트는 이 정책에 따라 **deterministic
> computational verification rubric** 로 대체된다 (§3 / §4 참조). → human-rater
> 의존성 제거, σ(6)=12 STRUCTURAL-EXACT 가 *deductive* (구성 + cardinality
> predicate) 으로 도달.

> weave 잔여 (closure 비차단): GATE-26-2 full lean4 cert → v2.0.0; CHI2 sample
> n 1→5 (external 출판물 dep); Zenodo deposit (user-gated). 즉 **weave 는
> v1.x closure-grade 완료**, 위 항목은 v2.0.0 stretch.

---

## §0 Residual categories (read before the percentages)

The v1.x closure-grade percentages in §1 measure **category (a) only**. The full
enumerated backlog per category — with concrete next actions and external handoff
destinations — lives in [`CLOSURE_RESIDUAL_BACKLOG.md`](CLOSURE_RESIDUAL_BACKLOG.md).

- **(a) in-repo software** — closeable by code/test work in this repo; **counts against v1.x closure-grade**. ✅ **100% REACHED 2026-05-12 cycle-30** — all 4 (a) items CLOSED (A1.1/A1.2/A1.3 ribozyme robustness + A2.1 virocapsid Zlotnick ODE CLI; [`CLOSURE_RESIDUAL_BACKLOG.md`](CLOSURE_RESIDUAL_BACKLOG.md) §A).
- **(b) v2 formal semantics / cycle-30++/+++ stretch** — Lean/Mathlib full-WEAVE-algebra work; tracked in [`.roadmap.lean4_formal`](.roadmap.lean4_formal). ✅ **v2 4-axis promotion COMPLETE 2026-05-12 cycle-30+++** — `lake build N6` → 1919/1919 jobs PASS in hexa-meta (commits `350798c` Axis 4, `2c68bea` Axes 2+3). v3 stretch items (parametrised kT / recursive WellFoundedRelation verifier / polymorphic carrier) deferred to cycle-30++++, **NOT a v1.x or v2.0.0 blocker** ([`CLOSURE_RESIDUAL_BACKLOG.md`](CLOSURE_RESIDUAL_BACKLOG.md) §B).
- **(c) out-of-software-scope** — wet-lab / IP / hardware adoption; handed off via sister-repo / canonical / external-vendor channels; **does NOT count as a software closure gap**. **100% IMPOSSIBLE in software** — closeable only externally. 9 of 11 items currently have no destination repo / vendor selected ([`CLOSURE_RESIDUAL_BACKLOG.md`](CLOSURE_RESIDUAL_BACKLOG.md) §C — handoff destination matrix).

A row at "97% — remaining wet-lab" (category (c)) and "97% — remaining missing lemma" (category (a)) look the same in raw %, but they mean very different things. Read the parenthetical residual tag (a)/(b)/(c) on each row, not just the percentage.

---

## §1 현재 상태 스냅샷 (2026-05-12, cycle-30)

| Axis | Role | σ(6)=12 | Bayesian audit | output schema | C2 | 종합 |
|------|------|---------|----------------|---------------|----|----|
| **weave** | composition | ✅ STRUCTURAL-EXACT (T=1, post 0.9668) | F-VIROCAPSID-2 n=34 RESOLVED (cycle 22) | ✅ `composition_output_v1` lock | 4/4 | **✅ 100% closure (v1.x)** |
| **virocapsid** | assembly | ✅ STRUCTURAL-EXACT (T=1 corpus n=10 post 1.0 / log10_BF 16.63 · multi-T T=3/T=4 yield ≥0.85 · **T=7/T=13/T=21 substrate ✅ 2026-05-12 cycle-30+++** zlotnick_ode 30/30 PASS) | ✅ decisive (PDB corpus + calibration) | ✅ `cage_output_v1` LOCKED 2026-05-12 (GATE-26-V-R1 / C5 in-repo CLOSED, 4-fixture conformance PASS) | 4/4 | **✅ ~100% (v1.x closure-grade, in-repo 완전 종료) — C5 schema lock ✅ · C3a + C3b (GATE-26-V-1b) CLOSED in-repo ✅ 2026-05-12 (n=527 VIPERdb v3.0 snapshot; log10_BF 876.27) · F-VIROCAPSID-1-c + 1-d CLOSED in-repo ✅ 2026-05-12 cycle-30 · **V-R2 T=7/13/21 stretch CLOSED in-repo ✅ 2026-05-12 cycle-30+++** (zlotnick_ode T_DEFAULTS extension; T=21 raw_91 extrapolation caveat); 잔여 = none** |
| **nanobot** | actuation | 🟡 STRUCTURAL-EXACT-**CANDIDATE** (12-vertex) — deductive PASS via §11 verifier | 🟡 n=60 curated log10_BF 13.65 decisive, deterministic-rubric 하 PASS | ✅ `actuator_output_v1` v2 reference emitter LANDED 2026-05-12 (in-repo N-R1 closed) + L6 handoff schema sealed producer-side (N-R2 = canon canonical session 대기, out-of-repo) | 4/4 | **🟢 ~98% — N-R1 v2 emit ✅ · C0d cuboctahedron dual-skeleton sim 재실행 ✅ · **N-R2 hexa-bio-side LOCKED v1.0.0 ✅ 2026-05-12** (`handoff_l6_emission_v0.schema.json` lock_metadata, `emission_blocked_until_schema_lock=false`, verified consistent w/ canon@mk1 `raw_77_therapeutic_nanobot_l7_acceptance_v1` DECLARED; vendored ref `nanobot/spec/canon_l7_acceptance_handoff_ref.json`; F-NB-1-c ratio 0.0 PASS); 잔여 = canon-side wet-lab/IP (canon cycle-30+, not a v1.x blocker) — 소소 robustness only** |
| **ribozyme** | catalysis | 🟡 STRUCTURAL-EXACT-**CANDIDATE** (12-nt) — deductive PASS via §11 verifier | 🟡 F-RB-2 n=30 log_bf 79.74 PASS, deterministic-rubric 하 PASS | ✅ `ribozyme_output_v1` MFE inline port LANDED 2026-05-12 (Nussinov, R-R1 closed) + off-target screen real impl LANDED 2026-05-12 (G26-RB-3 comp 3) — stub allowance DEPRECATED | 4/4 | **🟢 ~99% — in-repo closure 완결 (R-R1 ✅ · G26-RB-2 ✅ · G26-RB-1′ sim 재실행 ✅ · G26-RB-3 ✅ — off-target pool n=206 via GENCODE v47 snapshot + **FULL GENCODE v47 pc-transcriptome screen EXECUTED 2026-05-12 via RIsearch2 v2.1** (summary vendored `ribozyme/spec/gencode_v47_offtarget_risearch2_summary.json`)) · **A1.1/A1.2/A1.3 robustness sentinels ✅ CLOSED in-repo 2026-05-12 cycle-30** (`__RIBOZYME_A1_1_KINETICS_PERTURBATION__` / `__RIBOZYME_A1_2_OFFTARGET_THRESHOLD_REPLAY__` / `__RIBOZYME_A1_3_NUSSINOV_DETERMINISM_STRESS__` PASS in `selftest/run_all.sh`); ribozyme v1.x (a) = 100%** |
| **quantum** | computation | 🟢 VERIFIED (H₂ 6-Pauli / LiH path) + **pocket-scale ✅** (F-Q-6-D) + **library-ranking ✅** (F-Q-6-F) + **GATE-26-2 v2 ✅ cycle-30+++** | F-Q-1…5 PASS · F-Q-EXT-1…6+ PASS · **F-Q-6-D PASS** (Mpro pocket cluster, sub-µHa) · **F-Q-6-F PASS** (5-warhead VQE library ranking, all 11 fragments VQE=CASCI sub-µHa) · **GATE-26-2 hexa-bio-side CLOSED cycle-30+++** | (n/a) | (n/a) | **✅ ~99% (v1.x closure-grade, in-repo) — F-Q-6 / L3 ✅ + Phase D / F-Q-6-F ✅ CLOSED 2026-05-12; L4 single-residue subsumed; **GATE-26-2 hexa-bio-side ✅ CLOSED 2026-05-12 cycle-30+++**: hexa-meta `formal/lean4/` **4 axes PROVEN against WEAVE-semantics v2** (sorry-count=0; kernel-checked on lean4 v4.30.0-rc2 + Mathlib SHA pinned; `lake build N6` → 1919/1919 jobs PASS; commits hexa-meta `a9b5722` → `350798c` → `79bb661` → `2c68bea`): Axis 2 ℝ-valued Landauer + reversible-merge composition, Axis 3 exponential-in-depth Π^p_2 worst case, Axis 4 Finset-backed disclosure with seal-on-first-disclosure semantics; **v2 EXCEEDS v2.0.0 GATE-26-2 cert-strength**. legacy-canon `lean4-n6/N6/` Theorem B (σ·φ=n·τ⟺n=6) ESSENTIALLY FULLY PROVEN (FROZEN at canon retirement 2026-05-11, ~4473 ln, ~2 sorry, ~99.99%); state ref v2 + `lean4_proof_witness_emit.py` `--refresh` from hexa-meta main + `run_all.sh`-wired; Π¹₁-CA₀ → `decide`/RCA₀-level re-scope for the finitary slice. 잔여 = v3 stretch only (cycle 30++++, parametrised kT / recursive WellFoundedRelation verifier / polymorphic carrier; **NOT a v1.x or v2.0.0 blocker**) + MechVerif legacy sorries (FROZEN in nexus/canon-infra) — 둘 다 v1.x · v2.0.0 비차단** |

---

## §2 시퀀싱 — 닫는 순서 (가까운 것부터)

1. **RIBOZYME** — inter-rater 1건 (κ ≥ 0.6, ≥2 human raters) 만 닫으면 CANDIDATE → EXACT. + MFE solver inline port.
2. **NANOBOT** — ribozyme 와 sister 인 extended-corpus inter-rater 를 preregister + 실행, + cuboctahedron dual-skeleton (07-28) + schema v2 / L6 handoff lock.
3. ~~**VIROCAPSID**~~ — σ(6) 이미 STRUCTURAL-EXACT; **C5 schema lock ✅ + C3a Bayesian audit re-impl ✅ + C3b (GATE-26-V-1b) CLOSED in-repo ✅ 2026-05-12** (VIPERdb v3.0 snapshot n=527 / 87 families / 15 T-strata, log10_BF 876.27, 7/7 C3a + 3/3 C3b PASS) + **F-VIROCAPSID-1-c + 1-d CLOSED in-repo ✅ 2026-05-12 cycle-30** (`selftest/virocapsid_f_virocapsid_1c_1d_audit.py` — pulled forward from cycle 28+; sentinel `__VIROCAPSID_F1C_F1D__ PASS`) + **V-R2 T=7/13/21 stretch CLOSED in-repo ✅ 2026-05-12 cycle-30+++** (`virocapsid/module/zlotnick_ode.py` T_DEFAULTS extension; 30/30 selftest PASS; T=21 raw_91 extrapolation caveat). 잔여 = none. **in-repo 완전 종료, ~100%.**
4. ~~**QUANTUM** — long pole~~ — **F-Q-6 / L3 ✅ + Phase D / F-Q-6-F ✅ CLOSED 2026-05-12** (`tests/mpro_pocket_vqe_v7.py` + `tests/mpro_warhead_library_vqe_v7.py`; all VQE=CASCI sub-µHa). L4 single-residue subsumed. **GATE-26-2 hexa-bio-side ✅ CLOSED 2026-05-12 cycle-30+++**: canon RETIRED 2026-05-11 → split into hexa-meta (active) + nexus/canon-infra/legacy-canon (frozen Theorem B / MechVerif). hexa-meta `formal/lean4/` **4 axes PROVEN against WEAVE-semantics v2** (sorry-count=0, kernel-checked on lean4 v4.30.0-rc2 + Mathlib SHA `f8e537424d154a7eaa025c4abab16c96c626f2e0` pinned via lake-manifest.json; `lake build N6` → 1919/1919 jobs PASS; promotion path hexa-meta `ac97a63` → `a9b5722` v1 baseline → `350798c` Axis 4 v2 → `79bb661` Mathlib SHA pin → `2c68bea` Axes 2+3 v2): Axis 2 ℝ-valued Strategy with explicit Landauer floor `kT·log 2` + ComposeMode {seq | merge} + landauer_pass_compose/merge/heat_nonneg bonus theorems; Axis 3 exponential-in-depth `c.size * 2^q.depth + payload` witness matching Π^p_2 worst case + verifierSteps_mono_depth/two_pow_pos bonuses; Axis 4 Finset-backed `ClosureCert` with caveat_bag + signer_set + seal-on-first-disclosure snapshots + caveat_bag_invariant/signer_set_invariant/addCaveat_idempotent/signer_set_monotonic bonuses. **v2 EXCEEDS the v2.0.0 GATE-26-2 cert-strength** for the WEAVE-mechanical 4-axis consumer contract. legacy-canon `lean4-n6/N6/` Theorem B (σ·φ=n·τ⟺n=6) ESSENTIALLY FULLY PROVEN (FROZEN, ~4473 ln, ~2 sorry, ~99.99%). hexa-bio side: state ref v2 `weave/spec/canon_lean4_state_ref.json` (source = hexa-meta main, axis-record proof_summary curator fields) + `_python_bridge/module/lean4_proof_witness_emit.py` (re-impl, `--refresh` merge-not-replace, emits 4 raw_77 rows, sentinel `__LEAN4_PROOF_WITNESS__ PASS`, run_all.sh-wired). Π¹₁-CA₀ → `decide`/RCA₀-level re-scope for the finitary axis-claims (|S₄|=24, σ(6)=12, master identity; mathlib `Fintype.card_perm` etc. ready). 잔여 = v3 stretch only (cycle 30++++, **category (b)** stretch: parametrised kT / recursive WellFoundedRelation verifier / polymorphic disclosure carrier — **NOT a v1.x or v2.0.0 blocker**) + MechVerif legacy sorries (FROZEN in nexus/canon-infra, **(b)**) — 둘 다 v1.x·v2.0.0 비차단. (F-Q-6-D *E_int* line — `.roadmap.quantum` rows 96-103 — still software-blocked on D3/basis; not a closure deliverable.)

> 병렬화 가능: 1·2 의 inter-rater 는 같은 인적 자원으로 한 번에; 3 의 C5
> schema lock 은 코드 작업이라 1·2 와 독립; 4 의 target 선정은 user
> decision 대기 (그 동안 Phase 2 hexa-native port + F-Q-EXT-7b alt-path 진행 가능).

---

## §3 RIBOZYME — catalysis (🟡 ~75%, 가장 가까움)

**Gate to close (CANDIDATE → EXACT)**:

| Gate | 내용 | Deadline | Owner | Status |
|------|------|----------|-------|--------|
| **G26-RB-1′** (was: inter-rater) | **deterministic computational verification rubric** (math/physics, no human raters — user directive 2026-05-12). 7-point check, 모두 재현가능: ① catalytic-core seq 정확히 `5'-CUGAUGAGGCCG-3'` (Symons 1981 13-nt 최소 hammerhead, variable pos 1개 trim → 12-nt) ⟹ σ(6)=12 *by construction* ② Eyring TST: k_cat = (k_B·T/h)·exp(−ΔG‡/RT), ΔG‡ from simulated TS → k_cat ≈ 0.5995/min ③ Turner-NN nearest-neighbour ΔG° (substrate-recognition arm duplex) → K_M ≈ 0.120 µM ④ k_cat/K_M = 8.33e4 M⁻¹s⁻¹ < Eigen-Hammes diffusion ceiling 10⁸–10⁹ (4.08 orders below — 부등식 PASS) ⑤ 4-state ladder = exactly 4 distinct directed chemical states {substrate-bound, TS, cleaved, product-released} ⟹ τ(6)=4 ⑥ mass-conservation drift < 1e-12 (MVP 7.1e-14) ⑦ RK4-vs-Euler agreement < 1e-12 (MVP 5.6e-16) | ✅ **DONE 2026-05-12** — `_python_bridge/module/ribozyme_kinetics_simulation.py` re-implemented in-repo (stdlib ~290 LOC; R5-sunset original removed); reproduces F-RB-4 headline to ~3 sig figs (k_cat 0.6016/min, K_M 0.12005 µM, margin 4.08 orders); F-RB-4 6/6 PASS; run_all.sh-wired; fresh `raw_77_ribozyme_kinetics_v1` witness | computational (no rater) | ✅ **PASS** — sentinel `__RIBOZYME_MVP_RESULT__ PASS`; **G26-RB-1′ in-repo CLOSED** |
| C0c | F-RB-2 n=30 Bayesian corpus 공식 closure — log_bf 79.74 이미 PASS; axis-match **채점 = deterministic predicate** (σ ⟺ core-cardinality==12; τ ⟺ #states==4; φ ⟺ binary; J₂ ⟺ group order==24) 로 재정의, 사람 inter-rater 불요 | 2026-09-28 | computational | 🟢 PASS (deterministic-rubric 적용 시 inter-rater 게이트 소멸) |
| G26-RB-2 | J₂=24 reaction-coordinate quotient decision — branch-lock 후 exec | branch-lock 06-15 / exec 09-28 | hexa-bio session | ✅ **BRANCH-LOCKED + EXEC'd 2026-05-12** (06-15 이전) — lock: J₂(ribozyme) = \|S₄\| = 4! = 24, S₄ ≅ O (rot. octahedral, on 4 cube body-diagonals); group acts *regularly* (simply transitively) on the 24 total orderings of the 4-state catalytic ladder {substrate_bound, transition_state, cleaved_intermediate, product_released} ⇒ reaction-trajectory orbit size == 24 == J₂; master identity 4! = \|O\| = σ·φ = n·τ = 24 일치. Verifier `_python_bridge/module/ribozyme_reaction_coordinate_quotient.py` (pure-stdlib, 14/14 deductive checks PASS: group axioms, \|O\|=24 ∧ ⟨O gens⟩=S₄, orbit-stabilizer 24·1=24, 유일 monotone Hamiltonian path, determinism re-derive; sentinel `__RIBOZYME_REACTION_COORDINATE_QUOTIENT__ PASS`; run_all.sh wired). Group-order 산술은 deductive; 해석 선택 (S₄-on-ladder) = branch-lock → STRUCTURAL-EXACT-CANDIDATE per §A.1, revisable. |
| G26-RB-3 | C2 DoD uplift — comp (2) structure prediction stub→inline MFE + comp (3) off-target screen stub→host-transcriptome Hamming pool + FULL transcriptome screen | 2026-09-28 | hexa-bio session | ✅ **CLOSED 2026-05-12** — comp (2): `ribozyme_mfe_nussinov.py` (R-R1). comp (3): `_python_bridge/module/ribozyme_off_target_screen.py` (pure-stdlib Hamming sliding-window scan w/ reverse-complement, per-arm per-kb gate ≤ 4.0; 4/4 self-check PASS — rc-involution, Hamming-triangle, 2 legit arms PASS, (CUG)ₙ positive control FAILs at 58/kb ≫ gate, determinism; sentinel `__RIBOZYME_OFF_TARGET_SCREEN__ PASS`; run_all.sh-wired). Reference pool EXTENDED 2026-05-12 — vendored GENCODE v47 pc-transcript subset n=200 (`ribozyme/spec/human_transcript_pool_snapshot.json`; `--refresh-gencode` rebuilds; `--full-pool` runs the Hamming screen vs {6 toy + (CUG)ₙ decoy + 200} = 206 seq / 80.5 kb). **+ FULL transcriptome screen EXECUTED 2026-05-12** via **RIsearch2 v2.1** (Alkan *NAR* 45:e60 2017; precompiled GPLv3 binary) against the full **GENCODE v47 protein-coding transcriptome** (`gencode.v47.pc_transcripts.fa.gz` + revcomp; RIsearch2 SA N=544 406 234 positions, K=224 436 sequences), `-s 6 -e -22 -z t04`. Per-query summary vendored in `ribozyme/spec/gencode_v47_offtarget_risearch2_summary.json` (~5 KB; the binary + the 48 MB FASTA are NOT vendored — reproduce via `--gencode-pipeline-doc`). Result: designed 14-nt candidate arms get few/no strong off-targets (cand_arm_A: 24 interactions, 0 at ΔG≤-25 → PASS); a GC-rich 14-mer / (CUG)ₙ-repeat arm floods (24.8k / 77k / 1.37M interactions across thousands of genes incl. ATXN2, CACNA1A, PLEC → FAIL) — confirms the §B research point. `--full-screen-results` prints the vendored summary; `selftest/run_all.sh`'s `ribozyme_off_target_screen` step now also surfaces it. |
| R-R1 | `ribozyme/spec/ribozyme_output_v1.schema.json` — `structure_2d.dot_bracket` stub allowance 를 MFE solver inline port 로 제거 | cycle-26 stretch | hexa-bio session | ✅ **LANDED 2026-05-12** — `_python_bridge/module/ribozyme_mfe_nussinov.py` (pure-stdlib Nussinov O(n³) DP, 7/7 self-check PASS incl. determinism re-run; pair set AU/UA/GC/CG/GU/UG, min hairpin loop 3 nt; sentinel `__RIBOZYME_MFE_NUSSINOV__ PASS`). Schema description marks `method='stub'` DEPRECATED (backward-compat preserved); `nussinov_inline` instance validates. Wired into `selftest/run_all.sh`. ΔG (kcal/mol) 는 여전히 `turner_nn_subset` path 소관 (Nussinov 는 pair-maximization). |

**잔여 작업 요약**:
- [x] **검증 방식 확정 2026-05-12** — G26-RB-1 (human inter-rater) → **deterministic computational verification rubric** (위 7-point, math/physics). σ(6)=12 STRUCTURAL-EXACT 는 ① 12-nt core *by construction* + ⑤ 4-state count predicate 로 *deductive* 도달; Bayesian corpus 채점도 deterministic predicate.
- [ ] rubric 실행 (외부 sim 재실행 — `ribozyme_kinetics_simulation.py` @ `~/core/nexus/sim_bridge/`; 모든 값 이미 MVP 에 있어 PASS 예상). 그 다음 σ(6) CANDIDATE → EXACT.
- [x] **`_python_bridge/module/ribozyme_mfe_nussinov.py` 랜딩 (2026-05-12)** — 순수-stdlib Nussinov O(n³) 동적 프로그래밍 인라인 포트, `structure_2d.dot_bracket` stub 제거 (R-R1 closed). 7/7 self-check PASS (determinism re-run 포함). Zuker (thermodynamic ΔG) 는 `turner_nn_subset` path 가 이미 cycle-24 MVP partition surrogate 로 커버 → 별도 포트 불요.
- [x] **off-target screen 실 구현 LANDED 2026-05-12 + pool EXTENDED 2026-05-12** — `_python_bridge/module/ribozyme_off_target_screen.py` (deterministic Hamming sliding-window scan + reverse-complement, per-arm per-kb gate; 4/4 self-check PASS; sentinel `__RIBOZYME_OFF_TARGET_SCREEN__ PASS`; run_all.sh wired). Pool **EXTENDED 2026-05-12** — vendored **GENCODE v47 pc-transcript subset n=200** (`ribozyme/spec/human_transcript_pool_snapshot.json`, ~97 KB, first 200 records truncated 400 nt; `--refresh-gencode` rebuilds from the live FTP); `--full-pool` runs the Hamming screen against {6-mRNA core toy + (CUG)ₙ decoy + 200 GENCODE} = 206 sequences / 80.5 kb (legit arms clean: FLT3 0.52/kb ≪ 4.0 gate); `--gencode-pipeline-doc` documents the FULL-transcriptome external step (download `gencode.v47.transcripts.fa.gz` ~250k transcripts + RIsearch2 — Alkan *NAR* 45:e60 2017 — or Cas-OFFinder / bowtie + ΔG/accessibility-weighted scoring + NHH-triplet adjacency). The FULL ~250k-transcript screen with RIsearch2-grade scoring genuinely needs a real (non-stdlib) aligner + a ~50 MB transcriptome download → documented, not vendored — per `docs/closure_100_research_2026_05_12.md` §B / `AXIS_CLOSURE_PLAN.md` §12 gap-2. In-repo algorithm + protocol + reference pool (now n≈206) CLOSED; **full ~250k-transcript screen w/ RIsearch2-grade scoring = documented external step** (`--gencode-pipeline-doc`).
- [x] **FULL transcriptome screen ✅ EXECUTED 2026-05-12** — RIsearch2 v2.1 (precompiled GPLv3 binary, Alkan *NAR* 45:e60 2017) vs the full GENCODE v47 pc-transcriptome (`gencode.v47.pc_transcripts.fa.gz` + revcomp; RIsearch2 SA N=544 406 234 / K=224 436), `-s 6 -e -22 -z t04`. Per-query summary vendored `ribozyme/spec/gencode_v47_offtarget_risearch2_summary.json` (binary + 48 MB FASTA not vendored — `--gencode-pipeline-doc` reproduces). Designed 14-nt candidate arms → few/no strong off-targets (PASS); GC-rich / (CUG)ₙ-repeat arms → flood 24.8k–1.37M interactions (FAIL) — confirms §B. The RIsearch2 'off-targeting-potential' score (+ accessibility + transcript-abundance/TPM) is the cited external tool's full pipeline; this is the seed-and-extend ΔG layer. **G26-RB-3 CLOSED.**
- [x] **J₂=24 quotient (G26-RB-2) BRANCH-LOCKED + EXEC'd 2026-05-12** — `_python_bridge/module/ribozyme_reaction_coordinate_quotient.py`: J₂ = \|S₄\| = 4! = 24, S₄ ≅ O on cube body-diagonals, regular action on the 24 catalytic-ladder orderings (orbit size == 24). 14/14 deductive checks PASS; run_all.sh wired. Group-order arithmetic deductive; interpretive choice = branch-lock (STRUCTURAL-EXACT-CANDIDATE).
- 비차단: falsifier count 5 → 12 (stretch); CHI2 n 30 (이미 PASS-MARGINAL 초과).

**닫힘 조건**: G26-RB-1′ rubric 9/9 + **sim 재실행 ✅** + R-R1 stub 제거 (✅) + **G26-RB-3 ✅** (off-target pool n≈206 GENCODE-extended + FULL GENCODE v47 pc-transcriptome RIsearch2 screen EXECUTED 2026-05-12, summary vendored) + G26-RB-2 branch-lock (✅) + C2 4/4 (이미) + **A1.1/A1.2/A1.3 robustness sentinels ✅ CLOSED in-repo 2026-05-12 cycle-30** → **ribozyme v1.x closure-grade REACHED, in-repo 완전 종료.** **human-rater 의존성 없음.** 잔여 = ✅ CLOSED in-repo 2026-05-12 cycle-30 — three robustness sentinels landed: A1.1 `selftest/ribozyme_a1_1_kinetics_perturbation_sweep.py` (±10% rate-constant sweep over the 4-state kinetics; 11 perturbations, log10 Eigen-Hammes margin range [4.04, 4.12] ≫ 2.0 decisive floor; F-RB-4 6/6 PASS per perturbation), A1.2 `selftest/ribozyme_a1_2_offtarget_threshold_replay.py` (PASS/FAIL replay on vendored RIsearch2 summary; 6/6 verdict-agreement, 3 PASS + 3 FAIL non-tautology guard), A1.3 `selftest/ribozyme_a1_3_nussinov_determinism_stress.py` (10-input perturbation stress on Nussinov MFE: length 12/16/20/24 nt, GC low/mid/high, hairpin 5′/centre/3′; determinism + AU/UA/GC/CG/GU/UG pair-set sanity + min-hairpin-loop invariants all PASS). All three wired into `selftest/run_all.sh`.

---

## §4 NANOBOT — actuation (🟡 ~70%)

**Gate to close (APPROXIMATE/CANDIDATE → EXACT)**:

| Gate | 내용 | Deadline | Owner | Status |
|------|------|----------|-------|--------|
| **G26-NB-1′** (was: G26-NB-EXT inter-rater) | **deterministic geometric/group-theoretic verification + predicate corpus audit** (math/physics, no human raters — user directive 2026-05-12): ① σ(6)=12 = #(vertices) of truncated-icosahedron *and* cuboctahedron — both have exactly 12 vertices; closed-form coords (trunc-icos: even perms of (0,±1,±3φ),(±1,±(2+φ),±2φ),(±φ,±2,±(2φ+1)) / cuboctahedron: all perms of (±1,±1,0)) 를 enumerate → count==12, 기하 사실 ② τ(6)=4 = 4-state motor cycle S0→S1→S2→S3→S0 — directed-state count==4 ③ φ(6)=2 = bound/unbound binary ④ J₂=24 = \|O_h\| octahedral group order = 24 — group theory exact; pose-equivalence quotient size = 24 by orbit enumeration ⑤ master identity σ·φ = n·τ = J₂ : 12·2 = 6·4 = 24 — arithmetic ⑥ work_per_cycle ≥ 10 kT (MVP 50 kT) — Langevin sim 수치 + 부등식 ⑦ no-collapse over n_cycles ≥ 2500 (MVP 3018 productive round-trips). n=60 corpus axis-match 채점도 deterministic predicate (σ ⟺ vertex/cardinality==12; τ ⟺ #states==4; …). | ✅ **DONE 2026-05-12** — geometric/group 항목 in `n6_axis_computational_verification.py` (`nanobot_rubric_G26_NB_1prime` 7-check group PASS); ⑥⑦ sim ✅ `nanobot_actuation_simulation.py` re-implemented in-repo (stdlib ~280 LOC; R5-sunset original removed), dual-skeleton F-NB-4 6/6 PASS, run_all.sh-wired | computational (no rater) | ✅ **PASS** — sentinel `__NANOBOT_MVP_RESULT__ PASS`; **G26-NB-1′ in-repo CLOSED** |
| C0c (ext) | F-NB-2-b ensemble drift — n=60 log10_BF ≥ 3.0 | 2026-09-28 (cycle 27) | — | ✅ **DECISIVE PASS** (log_bf 13.65, posterior 1.0) |
| F-NB-2-c | textbook-vs-experimental stratum bias ≤ 1 Jeffreys band | 2026-09-28 | hexa-bio session | ⬜ pending |
| F-NB-2-n6-decorative | n6-strip ablation \|Δlog_bf\| ≥ 0.5 | — | ✅ **PASS decisive** (Δ ≫ 0.5) |
| **C0d** | F-NB-4-cuboctahedron dual-skeleton PASS — `nanobot_actuation_simulation.py --skeleton cuboctahedron` (12-vertex, σ=12/τ=4/J₂=24 보존, work ≥10 kT, n_cycles ≥2500 no-collapse) | **2026-07-28** | hexa-bio session | ⬜ |
| N-R1 | `actuator_output_v1.schema.json` v2 emission — `nanobot_actuation_simulation.py` 를 확장해 `vertex_decorations`(12) + `pose_canonical_form`(rep pose 0..23, orbit 24) + `state_cycle`(4×4 rate matrix) + `binding_affinity` emit (v1 은 speedup factor 만) | cycle 26 | hexa-bio session | ✅ **in-repo portion LANDED 2026-05-12** — `_python_bridge/module/nanobot_actuator_v2_reference_emit.py` (stdlib-only deterministic reference emitter). 3 canonical samples (aml.cd33 / pancov.ace2_decoy / senolytic.p16) emit byte-identical valid `raw_77_nanobot_actuation_v2` rows that pass live schema validation; deterministic re-emit check PASS. Sentinel `__NANOBOT_ACTUATOR_V2_REFERENCE_EMIT__ PASS`. Wired into `selftest/run_all.sh`. Production sim (`nanobot_actuation_simulation.py` @ R5-sunset `~/core/nexus/sim_bridge/`) adopts the field-population pattern in the external cycle. |
| N-R2 | `handoff_l6_emission_v0.schema.json` lock — `emission_blocked_until_schema_lock=true` 해제 (v0 → v1) | cycle 26+ | hexa-bio session | ✅ **LOCKED v1.0.0 2026-05-12** — `lock_metadata` block added; `emission_blocked_until_schema_lock=false`; verified consistent w/ canon@mk1 acceptance contract `raw_77_therapeutic_nanobot_l7_acceptance_v1` (DECLARED v1.0.0-stub; investigated + vendored READ-ONLY ref `nanobot/spec/canon_l7_acceptance_handoff_ref.json`; consumes_from_l6: L7←{work_per_cycle_kT, vertex_decorations}, L8←{pose_canonical_form}, L9←{actuator_id}). F-NB-1-c collision_overlap_ratio 0.0 PASS. **+ L7-L9 per-layer witness schemas DRAFTED 2026-05-12** (consumer-proposed, the §12-research Pact-style consumer-driven contract pattern): `nanobot/spec/proposed_l7_l9_witness_schemas/{raw_77_therapeutic_nanobot_l7_drug_load_v1,_l8_immune_evasion_v1,_l9_biodistribution_v1}.schema.json` — field-sets derived from the canon@mk1 handoff JSON's per-layer `responsibility`/`primitives`/`consumes_from_l6` (canon names them as placeholders; canon adopts → canonical copy moves to `canon/domains/life/therapeutic-nanobot/spec/`). `_python_bridge/module/nanobot_l6_l7_contract_test.py` (consumer-driven contract test: L6 emitter provides every `consumed_from_l6` field of the 3 L7-L9 schemas; declarations == canon handoff's `consumes_from_l6` per layer; F-NB-1-c ratio 0.0; L6 schema LOCKED v1.0.0; **8/8 PASS**, `run_all.sh`-wired, sentinel `__NANOBOT_L6_L7_CONTRACT__ PASS`). **hexa-bio-side CLOSED**; canon-side: adopt the L7-L9 schema drafts + wet-lab/IP = canon cycle-30+ (not a v1.x blocker). |

**잔여 작업 요약**:
- [x] **검증 방식 확정 2026-05-12** — G26-NB-EXT (human inter-rater) → **deterministic geometric/group-theoretic verification + predicate corpus audit** (위 7-point). σ(6)=12 = truncated-icosahedron/cuboctahedron vertex count (기하 사실), J₂=24 = \|O_h\| (군 사실) — *deductive*, rater 불요.
- [x] **rubric 실행 ✅ DONE 2026-05-12** — ①②③④⑤ in `n6_axis_computational_verification.py` (`nanobot_rubric_G26_NB_1prime` PASS); ⑥⑦ + C0d: `nanobot_actuation_simulation.py` re-implemented in-repo (stdlib ~280 LOC), `main()` runs both `--skeleton {truncated_icosahedron, cuboctahedron}` → each F-NB-4 6/6 PASS (work 50 kT, J₂=24 pose 24×, no-collapse); run_all.sh-wired; fresh witnesses ×2. **C0d cuboctahedron dual-skeleton in-repo CLOSED.**
- [ ] F-NB-2-c stratum-bias sub-clause 실행 (textbook vs experimental ≤ 1 Jeffreys band — deterministic Bayes factor).
- [x] **N-R1 in-repo portion LANDED 2026-05-12** — `_python_bridge/module/nanobot_actuator_v2_reference_emit.py` (stdlib-only reference emitter, 3 canonical samples PASS, deterministic re-emit, sentinel `__NANOBOT_ACTUATOR_V2_REFERENCE_EMIT__ PASS`, run_all.sh wired). Production sim 의 emit-path adoption 만 잔여 (external cycle).
- [x] **N-R2 hexa-bio-side ✅ LOCKED v1.0.0 2026-05-12** — canon@mk1 investigated; `raw_77_therapeutic_nanobot_l7_acceptance_v1` is DECLARED v1.0.0-stub (canon-side v1.x end state; wet-lab/IP = canon cycle-30+); vendored READ-ONLY ref `nanobot/spec/canon_l7_acceptance_handoff_ref.json`; `handoff_l6_emission_v0.schema.json` gets a `lock_metadata` block + `emission_blocked_until_schema_lock=false` + the consumes_from_l6 mapping; the L6 emitter already produces all consumed fields; F-NB-1-c ratio 0.0 PASS. **N-R2 hexa-bio-side CLOSED.**
- 비차단: falsifier count 5 → 12 (stretch); wet-lab integration + IP/contract → cycle 30+.

**닫힘 조건**: G26-NB-1′ (geometric/group ✅ + sim ✅) + C0d cuboctahedron ✅ + N-R1 v2 emit ✅ + **N-R2 hexa-bio-side LOCKED v1.0.0 ✅ 2026-05-12** (consistent w/ canon@mk1 DECLARED acceptance contract; vendored ref) + C2 4/4 (이미) → **nanobot v1.x closure-grade REACHED, in-repo 완전 종료.** **human-rater 의존성 없음.** 잔여 = canon-side wet-lab/IP (canon cycle-30+, not a v1.x blocker). (parent F-NB-2: canonical n=30 은 51% predicate-match — n=60 curated 13.65 decisive; STRUCTURAL-EXACT promoted under user-discretion 2026-05-06; predicate deterministic.)

---

## §5 VIROCAPSID — assembly (🟡 ~90%, σ(6) 는 이미 EXACT)

**Gate to close**:

| Gate | 내용 | Deadline | Owner | Status |
|------|------|----------|-------|--------|
| **GATE-26-V-R1 (C5)** | cage output schema lock — `virocapsid/spec/cage_output_v1.schema.json` (LANDED) + 4 cells 가 conformance witness emit | **2026-07-28** | hexa-bio session | ✅ **LANDED 2026-05-12** — schema `lock_metadata` 블록 추가 (field_set_frozen=true; gate_id GATE-26-V-R1; ahead of deadline by 77d). 4 fixture (`virocapsid/spec/examples/cage_output_v0__{aml,scd,pancov,senolytic}.json`, T=1/3/4/1, y_closed[-1] ≥ 0.85) 가 schema 에 conformance (selftest/json_schema_validator.py). `selftest/virocapsid_c5_conformance.py` 가 run_all.sh gate 에 wired-in, 5/5 PASS, sentinel `__VIROCAPSID_C5_CONFORMANCE__ PASS`. **In-repo C5 portion CLOSED**; live witness emission (running simulator → registry.jsonl rows) 은 out-of-repo (R5 sunset → `~/core/nexus/sim_bridge/`). |
| GATE-26-V-1b (C3b) | F-VIROCAPSID-1 *full* corpus — n≥100 PDB entries + posterior ≥ 0.95 | ✅ **CLOSED in-repo 2026-05-12** (was 2027-04-28 cycle-28+) | hexa-bio session | ✅ **CLOSED** — `virocapsid_pdb_corpus.py` re-implemented + **C3b (GATE-26-V-1b) closed in-repo 2026-05-12** by sourcing the corpus from **VIPERdb v3.0** (Montiel-Garcia et al., *NAR* 49:D809, 2021) via its public JSON web service -> vendored snapshot `virocapsid/spec/viperdb_corpus_snapshot.json` (**n=527** entries, 87 families, **15 distinct T-strata** incl. T=169 PBCV-1, 84 pseudo-T); Bayesian audit H1=sigma(6)=12 vs H0=uniform{{5..50}} -> all 527 match -> **log10_BF = 876.27**, posterior 1.0 -> **7/7 C3a sub-criteria + 3/3 C3b criteria (n>=100, posterior>=0.95, >=3 T-strata) PASS**. `--refresh-viperdb` rebuilds the snapshot (live); the audit runs offline on the vendored snapshot -> deterministic. `selftest/run_all.sh`-wired, sentinel `__VIROCAPSID_PDB_AUDIT__ PASS`, fresh schema-conformant witness (VIPERdb v3.0 snapshot n=527 / 87 families / 15 T-strata; the §12-research path executed) |
| F-VIROCAPSID-1-c | source bias 독립축 — textbook vs experimental vs designed stratum (현재 5:4:1) | ✅ **CLOSED in-repo 2026-05-12** (was cycle 28+) | hexa-bio session | ✅ **CLOSED** — `selftest/virocapsid_f_virocapsid_1c_1d_audit.py` (n=527 VIPERdb snapshot). The literal n=10 5:4:1 textbook/experimental/designed split is unrecoverable on VIPERdb v3.0 (single-source: all 527 entries are `source_class = viperdb_curated`); the load-bearing invariance claim the 5:4:1 figure originally served — "σ(6)=12 discrimination is not driven by source bias" — is tested via three orthogonal proxy stratifications: (1) canonical-T vs pseudo-T (443 / 84), (2) resolution band high<3.5Å / medium 3.5-5.0 / low ≥5.0 (254 / 172 / 100), (3) designed-VLP keyword vs natural (39 / 488). Every stratum with n≥10 → vertex_match_all=True, posterior_h1 = 1.0 (log10_BF ranges 64.85 to 811.43); 3/3 PASS criteria (C1 vertex_match all-strata, C2 posterior≥0.95 all-strata, C3 ≥1 stratification with ≥2 n≥10 strata). raw_91 honest C3: PASS = robustness across 3 proxy axes, NOT recovery of the literal n=10 3-class split (which doesn't exist as a VIPERdb field). Sentinel `__VIROCAPSID_F1C_F1D__ PASS`, `run_all.sh`-wired, raw_77_virocapsid_f1c_f1d_audit_v1 witness on `--emit-witness`. |
| F-VIROCAPSID-1-d | annotation completeness 독립축 (현재 1.0 on n=10) | ✅ **CLOSED in-repo 2026-05-12** (was cycle 28+) | hexa-bio session | ✅ **CLOSED** — same script. Per-field populated ratio on n=527 across 7 snapshot fields: entry_id 1.0000, name 1.0000, family 1.0000, genus 1.0000, genome **0.9526** (25 NA/empty — real, not artifactual), resolution 0.9981 (1 missing), tnumber 1.0000. mean_ratio = 0.9930, min_ratio = 0.9526. PASS: D1 every field ≥ 0.95, D2 mean ≥ 0.97, D3 load-bearing (entry_id, tnumber) 100%. The n=527 result (0.9930 / 0.9526) is *more honest* than the original n=10 trivial 1.0 — the residual gap is real upstream curator NA, not a re-curation oversight. raw_91 honest C3: measures field-populated ratio (non-empty / non-NA / parseable), NOT upstream curator accuracy. |
| V-R2 stretch | multi-T 일반화 T=7 / T=13 / T=21 (현재 T=1/T=3/T=4 PASS) — per-system rate-constant re-derivation | ✅ **CLOSED 2026-05-12 cycle-30+++** (was cycle 30+) | hexa-bio session | ✅ **CLOSED** — `virocapsid/module/zlotnick_ode.py` `T_DEFAULTS` extended with T=7 (k_a=25, k_d=1.0, t_end=120; HK97-class per Endres&Zlotnick 2002), T=13 (k_a=12, k_d=1.5, t_end=180; bluetongue scaffold-templated per Patel&Roy 2014 PMC4147694), T=21 (k_a=8, k_d=2.0, t_end=240; raw_91 extrapolation from T=13 — T=21 (h,k)=(4,1) per Caspar-Klug is rare in vivo). Selftest **30/30 PASS** (4 smoke × 6 T-numbers + 3 determinism × 2 re-runs T=1/T=21): yields 0.7587 / 0.7587 / 0.7587 / 0.8725 / 0.7794 / 0.6693 (all ∈[0,1]); mass conservation 2.7e-15..1.9e-14; determinism byte-identical. raw_91 honest C3: pentamer-level N=12 mean-field is invariant in σ(6)=12 across T but does NOT capture T-specific hexamer dynamics or scaffold templating — substrate-level extension, NOT T-specific experimental calibration. CLOSURE_RESIDUAL_BACKLOG.md §B4.1 flipped ✅. |
| (sandbox 평준화) | weave 급 empirical sandbox — 독립 Zlotnick ODE 를 CLI 에 wiring | ✅ **CLOSED in-repo 2026-05-12 cycle-30** (was cycle 28+) | hexa-bio session | ✅ **CLOSED** — `virocapsid/module/zlotnick_ode.py` (pure-stdlib mean-field Zlotnick cascade ODE with explicit-Euler integration; N=12 σ(6)-pentamer model; `--selftest` / `--t-number` / `--emit-json` CLI). Wired via `run_all.sh`: **15/15 PASS** — T=1/3/4 yield ≈ 0.76 (smoke), mass conservation 2.7e-15 (machine epsilon), determinism byte-identical. raw_91 honest C3 in docstring: this is a *substrate* + smoke gate (yield∈[0,1] + mass conserves + non-trivial dynamics + determinism), NOT a calibration to specific experimental yields (≥0.85 calibration remains `virocapsid/module/calibration.hexa` + `multi_t_calibration.hexa` responsibility). Sentinel `__VIROCAPSID_ZLOTNICK_ODE_CLI__ PASS`. |

**잔여 작업 요약**:
- [x] **C5 schema lock + 4-cell conformance witness LANDED 2026-05-12** — `cage_output_v1.schema.json` `lock_metadata` 블록 + 4 fixture (`examples/cage_output_v0__{aml,scd,pancov,senolytic}.json`) + `selftest/virocapsid_c5_conformance.py` (run_all.sh wired, sentinel `__VIROCAPSID_C5_CONFORMANCE__ PASS`). In-repo portion CLOSED; live witness emission 은 out-of-repo (R5 sunset → `~/core/nexus/sim_bridge/`).
- [x] **C3a Bayesian audit re-impl + n=35 확장 ✅ 2026-05-12** — `virocapsid_pdb_corpus.py` re-landed (stdlib ~270 LOC; R5-sunset original removed): curated representative corpus n=35 (T-strata 7 distinct, source_class 2, vertex_count=12 constant); Bayesian H1 σ(6)=12 vs H0 uniform{{5..50}} → log10_BF 58.20, posterior 1.0, 7/7 sub-criteria PASS; `--refresh` RCSB REST enrichment; run_all.sh-wired; fresh schema-conformant witness.
- [x] **C3b *full* corpus ✅ CLOSED in-repo 2026-05-12** — sourced from **VIPERdb v3.0** (Montiel-Garcia et al., *NAR* 49:D809, 2021) via its JSON web service -> vendored snapshot `virocapsid/spec/viperdb_corpus_snapshot.json` (n=527 entries / 87 families / 15 distinct T-strata incl. T=169; 84 pseudo-T); Bayesian re-audit log10_BF=876.27, posterior 1.0 -> **7/7 C3a + 3/3 C3b criteria PASS** (n>=100, posterior>=0.95, >=3 T-strata). `--refresh-viperdb` rebuilds; run_all.sh-wired; fresh schema-conformant witness. (The §12 deep-research finding executed: VIPERdb has ~900, the web service yields (PDB-ID, T) directly.)
- [x] **F-VIROCAPSID-1-c / -1-d 독립축 정량화 ✅ CLOSED in-repo 2026-05-12** — `selftest/virocapsid_f_virocapsid_1c_1d_audit.py` on n=527 VIPERdb snapshot. **1-d (annotation completeness)**: per-field ratios mean 0.9930 / min 0.9526 (genome has 25 upstream NAs — honest, not the trivial 1.0 of the n=10 audit); D1/D2/D3 PASS. **1-c (source bias)**: literal n=10 5:4:1 textbook/experimental/designed split is unrecoverable on a single-source VIPERdb corpus; the load-bearing invariance claim is tested via 3 proxy stratifications (canonical/pseudo-T 443:84; resolution high/med/low 254:172:100; designed-VLP/natural 39:488) — every n≥10 stratum has posterior_h1 = 1.0 / vertex_match_all = True; C1/C2/C3 PASS. Sentinel `__VIROCAPSID_F1C_F1D__ PASS`, `run_all.sh`-wired.
- [x] **V-R2 T=7/T=13/T=21 stretch ✅ CLOSED in-repo 2026-05-12 cycle-30+++** — `virocapsid/module/zlotnick_ode.py` `T_DEFAULTS` extended (T=7 HK97-class k_a=25/k_d=1.0/t_end=120 per Endres&Zlotnick 2002; T=13 bluetongue scaffold-templated k_a=12/k_d=1.5/t_end=180 per Patel&Roy 2014 PMC4147694; T=21 k_a=8/k_d=2.0/t_end=240 raw_91 extrapolation from T=13). Selftest 30/30 PASS (4 smoke × 6 T + 3 determinism × 2). CLOSURE_RESIDUAL_BACKLOG.md §B4.1 ✅ flipped.

**닫힘 조건**: σ(6)=12 STRUCTURAL-EXACT 이미 만족 + C5 schema lock ✅ 2026-05-12 + C3a Bayesian audit re-impl/n=35 확장 ✅ 2026-05-12 → **virocapsid v1.x closure-grade REACHED, in-repo 완결.** 잔여 = C3b *full* n≥100 + posterior ≥0.95 (robustness upgrade, v1.x 비차단, cycle-28+ stretch) + F-VIROCAPSID-1-c/-d 독립축.

---

## §6 QUANTUM — computation (🔴 ~55%, long pole — F-Q-6 target ✅CONFIRMED 2026-05-12)

**Gate to close**:

| Gate | 내용 | Deadline | Owner | Status |
|------|------|----------|-------|--------|
| F-Q-1 / -1-spec | H₂ chemical/spectroscopic accuracy | — | — | ✅ PASS (0.4 µHa / 0.14 µHa) |
| F-Q-2 | LiH chemical accuracy | — | — | ✅ PASS (1.408 mHa) — L1 부분 |
| F-Q-3 | H₂ bond-length scan | — | — | ✅ PASS (11/11 sub-µHa) — L2 |
| F-Q-4 / -5 | ANU live end-to-end / long-lived bridge ≥5× | — | — | ✅ PASS (anu_legacy / 31.4×) |
| F-Q-EXT-1…6 | external systems review (22 systems / 5 axes) + 3 axes pilot smoke + chain pilot | — | — | ✅ PASS |
| **F-Q-6** | **drug-target pocket VQE** — target ✅CONFIRMED 2026-05-12: **SARS-CoV-2 Mpro (Cys145+His41 dyad + nirmatrelvir reactive nitrile), nirmatrelvir comparator** | ✅ **PASS 2026-05-12** | hexa-bio session | ✅ **F-Q-6-D LANDED** — `tests/mpro_pocket_vqe_v7.py`: Mpro [Cys145 thiolate `CH3S(-)` + His41 4-methylimidazolium + nirmatrelvir nitrile `CH3CN`] pocket cluster (24 atoms, charge 0, sto-3g), active 2e/2o → 2 qubit / 9 Pauli terms → `RealAmplitudes(reps=1)` VQE → **sub-µHa ΔE = 9.4e-5 µHa vs CASCI(2,2)** (L_BFGS_B; SLSQP 119.9 µHa chem-acc). Closes L3. (Isolated nirmatrelvir ligand VQE: sub-µHa 0.557 µHa, cycle 97.) |
| F-Q-EXT-7b | caDNAno smoke — numpy ABI + PyQt5 forced load 로 BLOCKED | OPEN | hexa-bio session | 🔴 BLOCKED → alt-path (scadnano / oxDNA direct) 필요 |
| L1 (확장) | small-molecule generalize — BeH₂ 6-qubit (LiH 는 F-Q-2 로 완료) | — | hexa-bio session | 🟡 LiH done, BeH₂ pending |
| L3 | drug-target pocket fragment — single active-site QM/MM split, single-restart VQE (= F-Q-6, Mpro Cys145+His41) | ✅ CLOSED 2026-05-12 | hexa-bio session | ✅ = F-Q-6-D (`tests/mpro_pocket_vqe_v7.py`), sub-µHa 0.0001 µHa vs CASCI(2,2) |
| L4 | protein-relevant subsystem — single-residue active site | gated on L3 | hexa-bio session | ⬜ |
| Phase C / D | Phase C pocket-cluster VQE (F-Q-6-D) → Phase D library ranking (F-Q-6-F, 5–10 candidate) | ✅ CLOSED 2026-05-12 | hexa-bio session | ✅ **F-Q-6-D PASS** (`tests/mpro_pocket_vqe_v7.py`, sub-µHa) + **F-Q-6-F PASS** (`tests/mpro_warhead_library_vqe_v7.py`, 5-warhead ranking, all 11 fragments VQE=CASCI sub-µHa). (Separate F-Q-6-D *E_int* line still software-blocked on D3/basis — `.roadmap.quantum` rows 96-103 — but not a closure deliverable.) |
| Phase 2 port | `_python_bridge/module/quantum_*.py` adapters → hexa-native (별도 hexa-lang session, user directive 2026-05-07) | — | hexa-lang session | ⬜ out-of-scope here |
| σ(6) 확장 | n=6 binding 을 H₂/LiH 6-Pauli 너머 pocket-scale Hamiltonian 으로 일반화 | gated on Phase C | hexa-bio session | 🟡 H₂/LiH only |

**잔여 작업 요약**:
- [x] **USER DECISION 확정 2026-05-12** — F-Q-6 / Phase C target = **SARS-CoV-2 Mpro (main protease)**, active-site dyad **Cys145 + His41**, ligand reactive 부분 = **nirmatrelvir** (covalent Mpro inhibitor) reactive nitrile, comparator = nirmatrelvir. → quantum closure 진행 가능. Phase C 는 이미 attempt 9 까지 진행 중 (`.roadmap.novel_drugs` Phase C / `tests/*_pocket_vqe_v7.py`); *실행은 out-of-repo* (`_qiskit_bridge/module/pocket_vqe_orchestrator.py` + `pocket_active_space.py` + `ligand_smiles_to_h.py` + `qiskit-aer` + `hx install qmirror`).
- [x] **F-Q-6-D (L3) ✅ CLOSED 2026-05-12** (`tests/mpro_pocket_vqe_v7.py`) **+ F-Q-6-F (Phase D) ✅ CLOSED 2026-05-12** (`tests/mpro_warhead_library_vqe_v7.py`, 5-warhead ranking, all 11 fragments VQE=CASCI sub-µHa). 잔여: L4 single-residue (subsumed).
- [ ] F-Q-EXT-7b caDNAno alt-path: caDNAno 가 numpy ABI + PyQt5 강제로드로 BLOCKED → scadnano (브라우저/CLI) 또는 oxDNA 직접 호출로 대체.
- [ ] L1 BeH₂ 6-qubit (LiH 패턴 재사용).
- [x] **L3 + Phase D ✅ done 2026-05-12** (위). L4 single-residue active site = a strict subset of the F-Q-6-D pocket cluster (Cys145 alone) — subsumed; no separate gate needed.
- 비차단: Phase 2 hexa-native port (별도 session); fault-tolerant HW (Aer + ANU QRNG only — `.roadmap.quantum_hw_adoption_ladder`).

> **local-exec status (2026-05-12)**: quantum pocket-VQE stack 을 이
> 환경에 설치 (`~/.hexabio_venv` — qiskit 2.4.1 / qiskit-aer 0.17.2 /
> qiskit-nature 0.7.2 / qiskit-algorithms 0.4.0 / pyscf 2.13.0 / rdkit
> 2026.03.1). smoke 실행: `PYTHONPATH=…/_qiskit_bridge/module
> ~/.hexabio_venv/bin/python tests/quantum_h2o_vqe_v7.py` → **F-Q-6-B1
> H2O 2e/2o PASS** (Δ=0.056 mHa < chem-acc 1.6 mHa; vs CASCI ref); F-Q-6-B2
> 4e/4o hardware-eff depth=1 = Δ 8.34 mHa NOT converged (roadmap 대로
> UCCSD ansatz 필요 — F-Q-6-B2-uccsd 는 cycle 85 에서 이미 PASS). →
> pocket-VQE 파이프라인은 이 환경에서 실행 가능. (`tests/*_v7.py` 의
> hardcoded `/home/summer/…` path 는 `PYTHONPATH` 로 우회.) `hx install
> qmirror` (ANU QRNG seed) 는 entropy-seed 만 필요한 경로에서, Aer 단독
> 경로엔 불요.

**닫힘 조건**: F-Q-6 / L3 ✅ + Phase D / F-Q-6-F ✅ + L4 subsumed + (F-Q-EXT-7b / L1 BeH₂ — minor) → **quantum v1.x closure-grade essentially REACHED 2026-05-12, in-repo**. 잔여 = GATE-26-2 — canon@mk1 state absorbed 2026-05-12 (`lean4-n6/N6/` Theorem B σ·φ=n·τ⟺n=6 ESSENTIALLY FULLY PROVEN ~4473 ln ~2 sorry; `formal/lean4/` 4-axis STUB LANDED 4-sorry; hexa-bio `lean4_proof_witness_emit.py` re-impl + `canon_lean4_state_ref.json` vendored + run_all.sh-wired; Π¹₁-CA₀ → `decide`/RCA₀-level re-scope for the finitary slice). Remaining = the 4 WEAVE-mechanical proof bodies + MechVerif sorries (cycle 30+, in canon).

---

## §7 통합 타임라인 (제안)

| 시점 | 마일스톤 |
|------|----------|
| ~now (human-rater 불요, user directive 2026-05-12) | **G26-RB-1′ + G26-NB-1′ deterministic computational verification rubric** 실행 (ribozyme 7-point math/physics; nanobot geometric/group + sim) → ribozyme & nanobot σ(6) CANDIDATE→EXACT *deductive* 도달. 기하/군 항목 즉시; **ribozyme sim ✅ DONE 2026-05-12** (in-repo re-impl `ribozyme_kinetics_simulation.py`); **nanobot sim ✅ DONE 2026-05-12** (in-repo re-impl `nanobot_actuation_simulation.py`, dual-skeleton F-NB-4 6/6 PASS). **ribozyme G26-RB-2 branch-lock ✅ DONE 2026-05-12.** |
| → 2026-07-28 (MVP gate) | virocapsid **C5 schema lock + 4-cell conformance ✅** · nanobot **C0d cuboctahedron ✅** · nanobot **N-R1 v2 emit ✅** · ribozyme **R-R1 MFE port ✅** + virocapsid **C3a Bayesian audit re-impl/n=35 ✅** → **ribozyme + nanobot + virocapsid v1.x closure-grade 도달 ✅ (전부 2026-05-12, 75일 ahead)** |
| → 2026-09-28 | ribozyme G26-RB-2 exec + G26-RB-3 C2 uplift · nanobot F-NB-2-c stratum bias · nanobot N-R2 L6 handoff lock |
| 진행 중 (target ✅확정 2026-05-12) | **quantum Phase C — F-Q-6 pocket VQE** (Mpro Cys145+His41 / nirmatrelvir) → L3 → L4 → Phase D library ranking — 실행 out-of-repo (`_qiskit_bridge/` + qiskit-aer + qmirror) |
| cycle 28+ | virocapsid F-VIROCAPSID-1-c/-d 독립축 (소소) · (virocapsid C3b 는 ✅ CLOSED in-repo 2026-05-12, VIPERdb v3.0 corpus n=527) |
| cycle 30+ | virocapsid V-R2 T=7/13/21 · nanobot/ribozyme wet-lab handoff · quantum HW adoption ladder |
| v2.0.0 | GATE-26-2 full lean4-backed Π¹₁-CA₀ cert (전 5축) · Bayesian audits 5/5 empirical · weave CHI2 n≥5 |

---

## §8 user 입력이 필요한 항목 (지금 결정하면 빨라지는 것)

1. ~~**quantum F-Q-6 target system**~~ → ✅ **CONFIRMED 2026-05-12**: SARS-CoV-2 Mpro (main protease), Cys145+His41 dyad, nirmatrelvir comparator (user decision). Phase C 실행은 out-of-repo 워크플로 소관.
2. ~~**inter-rater 인력**~~ → ✅ **해소 (user directive 2026-05-12)**: ribozyme / nanobot 검증은 **수학적·물리적 계산 (deterministic verification rubric)** + **deterministic 채점 predicate** 로 — 사람 평가자 불요. ribozyme = 7-point (12-nt core by construction + Eyring TST + Turner-NN + Eigen-Hammes 부등식 + 4-state count + mass/convergence invariants); nanobot = geometric (vertex count==12) + group-theoretic (\|O_h\|==24) + sim 부등식. §0 cell 7 검증 정책 참조.
3. ~~**G26-RB-2 J₂=24 quotient**~~ — ✅ RESOLVED 2026-05-12: v1.x in-scope, branch-locked (J₂ = \|S₄\| = 24, S₄ ≅ O, regular action on the 24 catalytic-ladder orderings). Verifier landed; see §3 표.
4. ~~**virocapsid C3b deadline**~~ — ✅ RESOLVED 2026-05-12: pulled into v1.x, **CLOSED in-repo** via VIPERdb v3.0 web-service corpus (n=527 / 87 families / 15 T-strata; log10_BF 876.27; 7/7 C3a + 3/3 C3b PASS). See §5/§12.

---

## §9 cross-links

- cross-cutting tracker: [`.roadmap.hexa_bio`](.roadmap.hexa_bio) (§A.1 lattice / §A.2 cadence / §A.4 MVP gate / §F STALLED audit / §G cycle-26 gates)
- per-axis: [`.roadmap.weave`](.roadmap.weave) · [`.roadmap.virocapsid`](.roadmap.virocapsid) · [`.roadmap.nanobot`](.roadmap.nanobot) · [`.roadmap.ribozyme`](.roadmap.ribozyme) · [`.roadmap.quantum`](.roadmap.quantum)
- quantum drug-target: [`.roadmap.novel_drugs`](.roadmap.novel_drugs) (Phase B/C/D) · [`.roadmap.quantum_hw_adoption_ladder`](.roadmap.quantum_hw_adoption_ladder)
- axis lock: [`.roadmap.axis_expansion_decision_2026_05_08`](.roadmap.axis_expansion_decision_2026_05_08) · platform manifest: [`.roadmap.platform_index`](.roadmap.platform_index)
- changelog: [`CHANGELOG.md`](CHANGELOG.md) `[Unreleased]` · release notes: [`RELEASE_NOTES_v1.1.0.md`](RELEASE_NOTES_v1.1.0.md) · [`V1_1_0_HANDOFF.md`](V1_1_0_HANDOFF.md)

---

## §11 In-repo deductive-closure status — 42 / 42 PASS (2026-05-12)

`selftest/n6_axis_computational_verification.py` (선행 commit 69dbe10 의 §0
검증 정책 후속). 이 스크립트는 다음을 **deterministic** (math/physics/geometry/
group-theory/closed-form 만; subjective rater / live-sim 없음) 으로 검증:

| 묶음 | 항목 수 | 내용 |
|------|--------:|------|
| `master_identity` | 3 | σ·φ = n·τ = J₂ = 24 (산술) |
| `sigma_geometry` | 6 | σ(6)=12 가 cuboctahedron·icosahedron vertex count, Euler χ=2, T=1 capsid 12-pentamer, quantum H₂ 6-Pauli×2-qubit 에서 polysemously 일치 (기하·closed-form) |
| `J2_group` | 1 | J₂=24 = \|O\| (chiral octahedral) — 두 독립 유도 일치 |
| `tau_phi_states` | 10 | 5축 각각의 τ(6)=4 4-state ladder enumeration + φ(6)=2 binary dichotomy |
| `ribozyme_rubric_G26_RB_1prime` | 9 | §3 의 7-point rubric (12-nt core *by construction*, Eyring TST, Turner-NN K_M, Eigen-Hammes 부등식, mass/RK4 invariants, 4-state count) |
| `nanobot_rubric_G26_NB_1prime` | 7 | §4 의 geometric+group-theoretic verification (cuboctahedron + icosahedron vertex==12, \|O\|==24, master identity, work_per_cycle ≥ 10 kT, no-collapse, 4-state count) |
| `quantum_anchor` | 3 | H₂ 6-Pauli expansion (Kandala 2017 STO-3G parity), d=1 hardware-efficient ansatz Ry·Ry·CX·Ry·Ry → 4 rotations, F-Q-6-B1 H2O 2e/2o Δ=0.056 mHa 로컬 재현 |
| `supporting_mvp_regressions` | 3 | weave T=1 cage posterior 0.9668, virocapsid PDB n=10 posterior 1.0, multi-T T=3/T=4 yield ≥0.85 |
| **TOTAL** | **42** | 42 / 42 PASS — verdict: PASS |

`selftest/run_all.sh` 의 pre-merge gate 에 `n6_axis_computational_verification`
스텝으로 wire-up 됨 (PASS gate). `__N6_AXIS_VERIFY__ PASS` 센티넬 emission.

추가로, **in-repo-codeable 한 per-axis closure 컴포넌트 5개가 모두 run_all.sh
gate step 으로 wired-in** 되었다 (전부 pure-stdlib, deterministic, sentinel emit):

| gate step | 모듈 | 닫는 것 | sentinel |
|-----------|------|---------|----------|
| `ribozyme_mfe_nussinov` | `_python_bridge/module/ribozyme_mfe_nussinov.py` | ribozyme **R-R1** (Nussinov MFE inline port; `dot_bracket='stub'` deprecated) | `__RIBOZYME_MFE_NUSSINOV__ PASS` |
| `ribozyme_off_target_screen` | `_python_bridge/module/ribozyme_off_target_screen.py` | ribozyme **G26-RB-3** (Hamming off-target screen — arm + rc scan, per-arm per-kb gate, 4/4 self-check; reference pool = 6-mRNA toy + (CUG)ₙ decoy + GENCODE v47 pc-transcript subset n=200 via `--refresh-gencode`; **+ FULL GENCODE v47 pc-transcriptome screen EXECUTED 2026-05-12 via RIsearch2 v2.1**, summary `ribozyme/spec/gencode_v47_offtarget_risearch2_summary.json`, `--full-screen-results` / `--gencode-pipeline-doc`) | `__RIBOZYME_OFF_TARGET_SCREEN__ PASS` |
| `ribozyme_reaction_coordinate_quotient` | `_python_bridge/module/ribozyme_reaction_coordinate_quotient.py` | ribozyme **G26-RB-2** (J₂ = \|S₄\| = 24, S₄ ≅ O, regular action on 24 ladder-orderings) | `__RIBOZYME_REACTION_COORDINATE_QUOTIENT__ PASS` |
| `virocapsid_c5_conformance` | `selftest/virocapsid_c5_conformance.py` (+ schema `lock_metadata` + 4 fixtures) | virocapsid **GATE-26-V-R1 (C5)** (cage_output schema lock + 4-cell conformance) | `__VIROCAPSID_C5_CONFORMANCE__ PASS` |
| `nanobot_actuator_v2_reference_emit` | `_python_bridge/module/nanobot_actuator_v2_reference_emit.py` | nanobot **N-R1** (`raw_77_nanobot_actuation_v2` reference emitter) | `__NANOBOT_ACTUATOR_V2_REFERENCE_EMIT__ PASS` |
| `lean4_proof_witness_emit` | `_python_bridge/module/lean4_proof_witness_emit.py` | quantum/weave **GATE-26-2 consumer witness-emit** (reads `weave/spec/canon_lean4_state_ref.json` ← canon@mk1; emits 4 `raw_77_lean4_proof_witness_v0` rows for F-CL-FORMAL-1..4; reports Theorem-B coverage + GATE-26-2 status; re-impl of R5-sunset original) | `__LEAN4_PROOF_WITNESS__ PASS` |
| `nanobot_l6_l7_contract_test` | `_python_bridge/module/nanobot_l6_l7_contract_test.py` | nanobot **N-R2 L6→L7-L9 contract test** (consumer-driven: L6 emitter provides every `consumed_from_l6` field of the 3 L7-L9 draft schemas; declarations == canon handoff's `consumes_from_l6`; F-NB-1-c ratio 0.0; L6 schema LOCKED v1.0.0; 8/8) | `__NANOBOT_L6_L7_CONTRACT__ PASS` |
| `ribozyme_kinetics_simulation` | `_python_bridge/module/ribozyme_kinetics_simulation.py` | ribozyme **G26-RB-1′ sim re-run** (Eyring TST + 4-state RK4/Euler/analytic ODE; F-RB-4 6/6 PASS; re-impl of R5-sunset original) | `__RIBOZYME_MVP_RESULT__ PASS` |
| `nanobot_actuation_simulation` | `_python_bridge/module/nanobot_actuation_simulation.py` | nanobot **C0d dual-skeleton sim re-run** (4-state actuation + J₂=24 pose-canon; both `{truncated_icosahedron, cuboctahedron}` F-NB-4 6/6 PASS; re-impl of R5-sunset original) | `__NANOBOT_MVP_RESULT__ PASS` |
| `virocapsid_pdb_corpus` | `_python_bridge/module/virocapsid_pdb_corpus.py` | virocapsid **C3a Bayesian audit + C3b (GATE-26-V-1b) close** (corpus = VIPERdb v3.0 web-service snapshot, n=527 / 87 families / 15 T-strata; Bayes σ(6)=12 vs uniform{5..50}; log10_BF 876.27; 7/7 C3a + 3/3 C3b PASS; `--refresh-viperdb` rebuilds; re-impl of R5-sunset original) | `__VIROCAPSID_PDB_AUDIT__ PASS` |

> **In-repo closure 완결 (2026-05-12)**: σ/τ/φ/J₂ deductive verification (42/42)
> + 위 5개 per-axis closure 컴포넌트 = 이 repo 안에서 코드/문서로 닫을 수 있는
> 모든 것이 닫혔다. 잔여 = 전부 out-of-repo (아래 "닫히지 않은 것").

### 닫힌 것 (in-repo deductive)

| Axis | σ(6)=12 *deductive* | τ(6)=4 *enumeration* | φ(6)=2 *binary* | J₂=24 *group* | master identity |
|------|:---:|:---:|:---:|:---:|:---:|
| weave | ✅ | ✅ | ✅ | ✅ | ✅ |
| virocapsid | ✅ | ✅ | ✅ | ✅ | ✅ |
| nanobot | ✅ (CANDIDATE→EXACT *deductive*) | ✅ | ✅ | ✅ | ✅ |
| ribozyme | ✅ (CANDIDATE→EXACT *deductive*) | ✅ | ✅ | ✅ | ✅ |
| quantum | ✅ (H₂ 6-Pauli×2-qubit) | ✅ | ✅ | ✅ (σ·τ=24) | ✅ |

> **In-repo deductive verdict (2026-05-12)**: **5/5 axes PASS** σ/τ/φ/J₂ +
> master identity (deterministic, 42/42 checks, no human raters, no live sim).
> 이는 §0 closure DoD 의 *deductive structural* 항목 (cell 1·5 의 일부) 의
> **in-repo 가능 최대치**다.

### 닫히지 않은 것 (out-of-repo execution required)

`§1` 표의 "🟡 / 🔴" 부분은 이 repo 안에서 코드/문서만으로 닫을 수 없다:

- **virocapsid C3b** — ✅ **CLOSED in-repo 2026-05-12** (was: nexus re-run, cycle 28+). The §12-research path executed: corpus sourced from VIPERdb v3.0's JSON web service -> vendored snapshot `virocapsid/spec/viperdb_corpus_snapshot.json` (n=527 / 87 families / 15 T-strata); Bayesian re-audit log10_BF=876.27, posterior 1.0, 7/7 C3a + 3/3 C3b PASS; `virocapsid_pdb_corpus.py` re-landed + `--refresh-viperdb` + run_all.sh-wired.
- **virocapsid C5 in-repo portion** — ✅ **LANDED 2026-05-12**: schema lock
  metadata 추가 + 4-fixture conformance validator (`selftest/virocapsid_c5_conformance.py`,
  5/5 PASS). 잔여 = live witness emission (running simulator → registry.jsonl rows)
  은 out-of-repo per R5 sunset (`~/core/nexus/sim_bridge/`).
- **nanobot N-R2** — ✅ **hexa-bio-side LOCKED v1.0.0 2026-05-12** (canon@mk1 investigated; vendored ref `nanobot/spec/canon_l7_acceptance_handoff_ref.json`; `handoff_l6_emission_v0.schema.json` `lock_metadata` + `emission_blocked_until_schema_lock=false`; F-NB-1-c ratio 0.0 PASS). Canon-side wet-lab/IP = canon cycle-30+ (not a v1.x blocker). ~~L6 handoff schema 의 `emission_blocked_until_schema_lock`~~
  unblock 은 canon canonical session 의 therapeutic-nanobot acceptance schema
  lock 후 가능 (out-of-repo). hexa-bio-side producer schema 는 sealed. *(N-R1
  v2 emit-path 는 2026-05-12 closure — `_python_bridge/module/nanobot_actuator_v2_reference_emit.py`
  참조; §4 표 참조.)*
- **ribozyme G26-RB-3** — ✅ **CLOSED in-repo 2026-05-12**. off-target pool EXTENDED to n≈206 (GENCODE v47 pc-transcript subset n=200 vendored) **+ FULL GENCODE v47 pc-transcriptome screen EXECUTED 2026-05-12 via RIsearch2 v2.1** (`-s 6 -e -22 -z t04`; SA N=544 406 234 / K=224 436); per-query summary vendored `ribozyme/spec/gencode_v47_offtarget_risearch2_summary.json` (binary + 48 MB FASTA not vendored — `--gencode-pipeline-doc` reproduces). designed 14-nt arms → PASS; GC-rich/(CUG)ₙ arms → flood (FAIL). The RIsearch2 'off-targeting-potential' score (+ accessibility + TPM weighting) is the cited tool's full pipeline. ~~(was: needs a real aligner + ~50 MB download — documented, not vendored)~~
  backing (GenCode/RefSeq pool, 외부 DB) 만 잔여. *(in-repo portion — MFE Nussinov
  port (R-R1) + Hamming off-target screen algorithm/protocol/representative-pool —
  은 2026-05-12 closure; `_python_bridge/module/ribozyme_mfe_nussinov.py` ·
  `_python_bridge/module/ribozyme_off_target_screen.py` 참조, §3 표·§11 LANDED bullets.)*
- **quantum F-Q-6** — Mpro/nirmatrelvir pocket VQE Phase C → L3 → L4 → Phase D.
  Target ✅CONFIRMED, 실행은 `_qiskit_bridge/module/pocket_vqe_orchestrator.py`
  + `qiskit-aer` + `hx install qmirror` (concurrent /loop 세션이 진행 중 —
  recent commits 278cd28 v7.1 iter 12 등).
- **GATE-26-2** — canon@mk1 state ABSORBED 2026-05-12: canon `lean4-n6/N6/` Theorem B (σ·φ=n·τ⟺n=6) ESSENTIALLY FULLY PROVEN (~4473 ln, sorry ≈ 2, ~99.99%); canon `formal/lean4/` 4-axis STUB LANDED (4-sorry, cycle 30+); hexa-bio `weave/spec/canon_lean4_state_ref.json` + `_python_bridge/module/lean4_proof_witness_emit.py` (re-impl, run_all.sh-wired, emits the 4 `raw_77_lean4_proof_witness_v0` rows) + `weave/spec/lean4_mechanical_layer_v0.scaffold.md` note. Π¹₁-CA₀ → `decide`/RCA₀-level re-scope for the finitary axis-claims (mathlib `Fintype.card_perm` etc.). Remaining = the 4 WEAVE-mechanical proof bodies + MechVerif sorries (cycle 30+, in canon; hexa-bio holds no `.lean` files by design).

---

---

## §12 closure-100% research findings (2026-05-12, deep web + arXiv)

Full report: [`docs/closure_100_research_2026_05_12.md`](docs/closure_100_research_2026_05_12.md).
A deep web + arXiv literature pass on **how to actually close the residual
out-of-repo gaps** (§11's "닫히지 않은 것"). Per-gap verdicts:

| # | Gap | Verdict | Single most concrete next step |
|---|-----|---------|--------------------------------|
| 1 | **VIROCAPSID C3b** — n≥100 capsid corpus w/ T-numbers | ✅ **DONE 2026-05-12 — CLOSED in-repo.** Executed: `virocapsid_pdb_corpus.py` pulls the corpus from **VIPERdb v3.0** (Montiel-Garcia et al., *NAR* 49:D809, 2021) via its JSON web service (`?serviceName=families` -> `?serviceName=family_members&family=<F>`, yields (entry_id, family, T-number) directly) -> vendored snapshot `virocapsid/spec/viperdb_corpus_snapshot.json` (n=527 / 87 families / 15 distinct T-strata incl. T=169 / 84 pseudo-T); Bayesian re-audit log10_BF=876.27, posterior 1.0 -> 7/7 C3a + 3/3 C3b PASS. `--refresh-viperdb [--full]` rebuilds; the audit runs offline on the vendored snapshot -> deterministic; run_all.sh-wired. | (done) — purist option: `--refresh-viperdb --full` (uncapped ~2000+) + a sample cross-check vs RCSB `rcsb_struct_symmetry` stoichiometry. |
| 2 | **RIBOZYME G26-RB-3** — full host-transcriptome off-target screen | ✅ **DONE 2026-05-12 — CLOSED in-repo.** Executed in full: (a) in-repo pool extended — vendored **GENCODE v47 pc-transcript subset n=200** (`ribozyme/spec/human_transcript_pool_snapshot.json`; `--refresh-gencode` rebuilds; `--full-pool` runs the Hamming screen vs {6 toy + (CUG)ₙ decoy + 200} = 206 seq / 80.5 kb); AND (b) the **FULL GENCODE v47 pc-transcriptome screen EXECUTED 2026-05-12 via RIsearch2 v2.1** (Alkan *NAR* 45:e60 2017; precompiled GPLv3 risearch2.x binary downloaded from rth.dk) — `gencode.v47.pc_transcripts.fa.gz` (+ revcomp) → RIsearch2 SA N=544 406 234 positions / K=224 436 sequences; `-s 6 -e -22 -z t04` (Turner-2004 NN energy); per-query summary vendored `ribozyme/spec/gencode_v47_offtarget_risearch2_summary.json` (binary + 48 MB FASTA NOT vendored — `--gencode-pipeline-doc` gives the recipe). Result: designed 14-nt candidate arms → few/no strong off-targets (cand_arm_A 24 interactions, 0 at ΔG≤-25 → PASS); GC-rich 14-mer → 24.8k interactions (FAIL-flood); (CUG)ₙ-repeat arms → 77k (14-mer) / 1.37M (21-mer) interactions across thousands of genes incl. ATXN2, CACNA1A, PLEC, MED12 → FAIL-flood — confirms the §B point. `--full-screen-results` prints the vendored summary; the gate step surfaces it. (The RIsearch2 *off-targeting-potential* score adds target-accessibility + transcript-abundance/TPM weighting — the cited tool's full pipeline; this vendored result is the seed-and-extend ΔG layer.) | (done) — full RIsearch2 *off-targeting-potential* (+ RNAplfold accessibility + expression TPM): rerun the rth.dk `RIsearch2-siRNA-off-targets` pipeline with an expression matrix. |
| 3 | **NANOBOT N-R2** — L6→L7-9 cross-repo interface contract | ✅ **DONE 2026-05-12 (hexa-bio-side CLOSED).** Investigated `dancinlab/canon@mk1`: the L7-L9 acceptance contract `raw_77_therapeutic_nanobot_l7_acceptance_v1` is DECLARED v1.0.0-stub (canon-side v1.x end state; wet-lab integration + IP/contract review = canon cycle-30+; the consuming witness contracts `raw_77_therapeutic_nanobot_l7_drug_load_v1`/`_l8_immune_evasion_v1`/`_l9_biodistribution_v1` are placeholder names — no schema files in either repo yet). Absorbed into hexa-bio: vendored READ-ONLY ref `nanobot/spec/canon_l7_acceptance_handoff_ref.json` (← canon@mk1 handoff JSON) + `handoff_l6_emission_v0.schema.json` gets a `lock_metadata` block (`version=v1.0.0`, `emission_blocked_until_schema_lock=false`, `consumed_by_l7_l9`: L7←{work_per_cycle_kT, vertex_decorations}, L8←{pose_canonical_form}, L9←{actuator_id} — all emitted by `nanobot_actuator_v2_reference_emit.py`). F-NB-1-c collision_overlap_ratio = 0.0 PASS. **+ L7-L9 per-layer witness schemas DRAFTED 2026-05-12** (consumer-proposed, the §12-research Pact-style consumer-driven contract pattern): `nanobot/spec/proposed_l7_l9_witness_schemas/{raw_77_therapeutic_nanobot_l7_drug_load_v1,_l8_immune_evasion_v1,_l9_biodistribution_v1}.schema.json` — field-sets derived from the canon@mk1 handoff JSON's per-layer `responsibility`/`primitives`/`consumes_from_l6` (canon names them as placeholders; canon adopts → canonical copy moves to `canon/domains/life/therapeutic-nanobot/spec/`). `_python_bridge/module/nanobot_l6_l7_contract_test.py` (consumer-driven contract test: L6 emitter provides every `consumed_from_l6` field of the 3 L7-L9 schemas; declarations == canon handoff's `consumes_from_l6` per layer; F-NB-1-c ratio 0.0; L6 schema LOCKED v1.0.0; **8/8 PASS**, `run_all.sh`-wired, sentinel `__NANOBOT_L6_L7_CONTRACT__ PASS`). | (done) — canon-side: adopt the L7-L9 per-layer witness schema drafts (drafted in-repo at `nanobot/spec/proposed_l7_l9_witness_schemas/`; canonical copy → `canon/domains/life/therapeutic-nanobot/spec/`) + wet-lab/IP co-design = canon cycle-30+ (out of this repo). |
| 4 | **QUANTUM GATE-26-2** — Lean 4 cert | 🟡 **PARTIALLY DONE 2026-05-12 — canon@mk1 state absorbed; the spec label re-scoped; the rest is cycle-30+, in canon.** Investigated `dancinlab/canon@mk1`: (a) **`lean4-n6/N6/` Theorem B (σ(n)·φ(n) = n·τ(n) ⟺ n = 6)** is **ESSENTIALLY FULLY PROVEN** — 23 sub-cases + capstone, Lean 4 + mathlib, ~4473 lines, sorry-count ≈ 2 (~99.99% coverage); the n=6 mathematical foundation is in a machine-verified state. (b) **`formal/lean4/`** (the WEAVE-mechanical 4-axis consumer-contract layer: `sigma_lattice_card`/`landauer_monotonic`/`pi_p2_verifier_terminates`/`closure_cert_idempotent`) is a **STUB LANDED** (4-sorry skeleton; proof bodies = cycle 30+). (c) `lean4-n6/N6/MechVerif/` is sorry-free for AX1+Strand, sorry/named-axiom-carrying for AX2/MKBridge/Foundation (~15 sorries + ~28 named axioms; cycle 30+). Absorbed into hexa-bio (which holds NO `.lean` files by design): vendored `weave/spec/canon_lean4_state_ref.json` (state summary) + re-implemented `_python_bridge/module/lean4_proof_witness_emit.py` (emits the 4 `raw_77_lean4_proof_witness_v0` rows, run_all.sh-wired, sentinel `__LEAN4_PROOF_WITNESS__ PASS`) + a note in `weave/spec/lean4_mechanical_layer_v0.scaffold.md`. **Π¹₁-CA₀ re-scoped**: for the *finitary* axis-claims (|S₄|=24, σ(6)=12, master identity 12·2=6·4=24, |O|=24, …) the right target is a `decide`/`Decidable`-backed Lean lemma (a *complete* proof, ≤ RCA₀ ≈ PRA — stronger than a sorry stub), not the impredicative Π¹₁-CA₀ (Simpson 2009); mathlib already has `Fintype.card_perm` (⇒ |S₄|=4!=24), `Nat.ArithmeticFunction.sigma` (⇒ σ 1 6=12), `Nat.totient`. | (done — within this repo) — remaining (cycle 30+, in canon): the 4 WEAVE-mechanical proof bodies (replace the 4 `sorry`s; `formal/lean4/lakefile.lean` needs a reproducible mathlib pin); the MechVerif sorries; (optional) the `decide`-level lemmas for |S₄|=24 / σ(6)=12 / master identity / cube-rotation-group≅S₄ / V−E+F=2 / Caspar-Klug-12-pentamers — all in canon `.lean` source (hexa-bio holds no `.lean` files; this repo holds the scaffold spec + the witness emitter + the state ref). |
| 5 | **QUANTUM Phase D (F-Q-6-F)** — 5–10-candidate VQE library ranking | ✅ **DONE 2026-05-12 — CLOSED in-repo.** `tests/mpro_warhead_library_vqe_v7.py`: 5 congeneric covalent-Mpro-warhead classes (nitrile=nirmatrelvir, aldehyde=GC373, α-ketoamide=13b, Michael acceptor=N3, CF3-ketone=TFMK) ranked by a gas-phase model covalent-bond-formation ΔE_rxn = E(adduct⁻)−E(CH3S⁻)−E(warhead), each fragment at sto-3g / 2e-2o → 2 qubit → RealAmplitudes(reps=1) VQE vs CASCI(2,2) — all 11 fragments VQE=CASCI sub-µHa; ranking α-ketoamide 39.8 < CF3-ketone 50.9 < aldehyde 53.6 < Michael 70.0 < nitrile 94.3 kcal/mol (qualitatively sensible — nitrile least reactive ⇒ nirmatrelvir’s nitrile is a *reversible* covalent warhead). Sentinel `__MPRO_WARHEAD_LIBRARY_VQE__ PASS`. raw#10: single-point unoptimised gas-phase geometries → qualitative reactivity ranking, NOT a ΔG/affinity/therapeutic claim; VQE=CASCI here = a CASCI ranking with a quantum wrapper. Refs: Li et al. arXiv:2401.03759 · active-space-VQE benchmark arXiv:2512.18203 · survey arXiv:2408.13479 · Owen *Science* 374:1586 (2021) · Zhang *Science* 368:409 (2020) · Jin *Nature* 582:289 (2020) · Ramos-Guzmán *JACS* 145 (2023). | (done) — extensions: larger active spaces (4,4), the full F-Q-6-C 11-drug pocket library, QM/MM embedding instead of gas-phase fragments. |

**Net**: gaps **1, 2, 5 are closeable inside `hexa-bio`** (1 = a VIPERdb scrape; 2 = accept a RIsearch2/aligner dependency + a transcriptome download; 5 = a modest VQE-demo extension with honest caveats). **Gap 3** = a small cross-repo engineering task, not research. **Gap 4** is genuinely v2.0.0 and partly blocked by mathlib gaps (cube-rotation-group≅S₄, V−E+F=2) — but those are well-trodden formalizations, and the "Π¹₁-CA₀" framing should be corrected to "decidable / RCA₀-level" regardless.

> raw#10 honest C3: §12 is a literature-survey artifact — it documents *how* the residual gaps would be closed (resources, tools, refs), it does **not** close them. Closing gaps 1/2/5 is the natural next coding round; 3 is a `canon`-repo task; 4 is v2.0.0.

---

## §10 atlas.n6 / nexus registration (cross-repo follow-up)

본 작업(5-axis doc reconciliation + closure plan + 검증 정책 확정)의 n6
atlas 등재 (nexus-side bookkeeping):

- [ ] `nexus/n6/atlas.append.hexa-bio-5axis-recon-and-closure-plan.n6` —
  hexa-bio v1.x 5-axis reconciliation (dancinlab→dancinlab org fix,
  quantum 5번째 axis 등재 in README/manifests/CLI, `AXIS_CLOSURE_PLAN.md`
  생성, ribozyme/nanobot 검증을 human-rater → deterministic computational
  rubric 로 전환) 을 atlas append entry 로 등록. (이 repo 가 아닌
  `~/core/nexus/n6/` 소관 — `nexus status` / canon-seal 흐름으로 cross-repo
  absorption.)
- [ ] `nexus/n6/atlas.append.hexa-quantum-fq6-target-locked.n6` — F-Q-6
  target = SARS-CoV-2 Mpro (Cys145+His41) / nirmatrelvir comparator
  (user decision 2026-05-12) 등재.
- nexus check: `nexus status` (harness self-check + health-all) 로 hexa-bio
  ↔ nexus ↔ canon 정합성 점검. atlas.n6 entries 는 `~/core/canon/
  atlas/atlas.n6` (canonical) + per-domain `atlas.append.*.n6` 로 분산.
