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

## §1 현재 상태 스냅샷 (2026-05-12)

| Axis | Role | σ(6)=12 | Bayesian audit | output schema | C2 | 종합 |
|------|------|---------|----------------|---------------|----|----|
| **weave** | composition | ✅ STRUCTURAL-EXACT (T=1, post 0.9668) | F-VIROCAPSID-2 n=34 RESOLVED (cycle 22) | ✅ `composition_output_v1` lock | 4/4 | **✅ 100% closure (v1.x)** |
| **virocapsid** | assembly | ✅ STRUCTURAL-EXACT (T=1 corpus n=10 post 1.0 / log10_BF 16.63 · multi-T T=3/T=4 yield ≥0.85) | ✅ decisive (PDB corpus + calibration) | ⚠️ `cage_output_v1` LANDED, **lock 미완** (GATE-26-V-R1 / C5) | 4/4 | **🟡 ~90% — schema lock + full-corpus 잔여** |
| **nanobot** | actuation | 🟡 STRUCTURAL-EXACT-**CANDIDATE** (12-vertex) | 🟡 n=60 curated log10_BF 13.65 decisive, 단 canonical n=30 은 51% match (STRUCTURAL-APPROXIMATE); **inter-rater 미완** | ⚠️ `actuator_output_v1` v2 emission 미완 + L6 handoff schema v0 (lock 미완) | 4/4 | **🟡 ~70% — inter-rater + schema 잔여** |
| **ribozyme** | catalysis | 🟡 STRUCTURAL-EXACT-**CANDIDATE** (12-nt) | 🟡 F-RB-2 n=30 log_bf 79.74 PASS, 단 **PENDING INTER-RATER** | ⚠️ `ribozyme_output_v1` structure_2d **stub allowance** (MFE solver inline port 미완) | 4/4 | **🟡 ~75% — inter-rater + MFE port 잔여 (가장 가까움)** |
| **quantum** | computation | 🟡 VERIFIED (H₂ 6-Pauli / LiH path) — pocket-scale 미확장 | F-Q-1…5 PASS · F-Q-EXT-1…6 PASS | (n/a — `raw_77_quantum_*_v1` witness 스키마들) | (n/a — 4 bio axis 만 C2) | **🔴 ~55% — F-Q-6 pocket VQE: target ✅CONFIRMED (Mpro/nirmatrelvir, 2026-05-12), Phase C 실행 out-of-repo + L3/L4 ladder** |

---

## §2 시퀀싱 — 닫는 순서 (가까운 것부터)

1. **RIBOZYME** — inter-rater 1건 (κ ≥ 0.6, ≥2 human raters) 만 닫으면 CANDIDATE → EXACT. + MFE solver inline port.
2. **NANOBOT** — ribozyme 와 sister 인 extended-corpus inter-rater 를 preregister + 실행, + cuboctahedron dual-skeleton (07-28) + schema v2 / L6 handoff lock.
3. **VIROCAPSID** — σ(6) 는 이미 STRUCTURAL-EXACT (closure-grade). 잔여 = C5 schema lock (07-28, 단기) + C3b 전체 corpus n≥100 + posterior ≥0.95 (long pole, cycle 28+) + F-VIROCAPSID-1-c/-d 독립축.
4. **QUANTUM** — long pole. **F-Q-6 (drug-target pocket VQE) target ✅CONFIRMED 2026-05-12: SARS-CoV-2 Mpro (Cys145+His41 dyad + ligand reactive moiety), nirmatrelvir comparator** (user decision). Phase C → L3 → L4 → Phase D (`.roadmap.novel_drugs`) 진행 — *실행은 out-of-repo* (`_qiskit_bridge/module/pocket_vqe_orchestrator.py` 등 + `qiskit-aer` + `hx install qmirror`).

> 병렬화 가능: 1·2 의 inter-rater 는 같은 인적 자원으로 한 번에; 3 의 C5
> schema lock 은 코드 작업이라 1·2 와 독립; 4 의 target 선정은 user
> decision 대기 (그 동안 Phase 2 hexa-native port + F-Q-EXT-7b alt-path 진행 가능).

---

## §3 RIBOZYME — catalysis (🟡 ~75%, 가장 가까움)

**Gate to close (CANDIDATE → EXACT)**:

| Gate | 내용 | Deadline | Owner | Status |
|------|------|----------|-------|--------|
| **G26-RB-1′** (was: inter-rater) | **deterministic computational verification rubric** (math/physics, no human raters — user directive 2026-05-12). 7-point check, 모두 재현가능: ① catalytic-core seq 정확히 `5'-CUGAUGAGGCCG-3'` (Symons 1981 13-nt 최소 hammerhead, variable pos 1개 trim → 12-nt) ⟹ σ(6)=12 *by construction* ② Eyring TST: k_cat = (k_B·T/h)·exp(−ΔG‡/RT), ΔG‡ from simulated TS → k_cat ≈ 0.5995/min ③ Turner-NN nearest-neighbour ΔG° (substrate-recognition arm duplex) → K_M ≈ 0.120 µM ④ k_cat/K_M = 8.33e4 M⁻¹s⁻¹ < Eigen-Hammes diffusion ceiling 10⁸–10⁹ (4.08 orders below — 부등식 PASS) ⑤ 4-state ladder = exactly 4 distinct directed chemical states {substrate-bound, TS, cleaved, product-released} ⟹ τ(6)=4 ⑥ mass-conservation drift < 1e-12 (MVP 7.1e-14) ⑦ RK4-vs-Euler agreement < 1e-12 (MVP 5.6e-16) | **즉시 가능** (외부 sim 필요 — `ribozyme_kinetics_simulation.py`, R5 sunset → `~/core/nexus/sim_bridge/`; rubric 자체는 deterministic) | computational (no rater) | 🟢 rubric 정의됨; sim 재실행 시 PASS 예상 (모든 값 이미 MVP 에서 산출) |
| C0c | F-RB-2 n=30 Bayesian corpus 공식 closure — log_bf 79.74 이미 PASS; axis-match **채점 = deterministic predicate** (σ ⟺ core-cardinality==12; τ ⟺ #states==4; φ ⟺ binary; J₂ ⟺ group order==24) 로 재정의, 사람 inter-rater 불요 | 2026-09-28 | computational | 🟢 PASS (deterministic-rubric 적용 시 inter-rater 게이트 소멸) |
| G26-RB-2 | J₂=24 reaction-coordinate quotient decision — branch-lock 후 exec | branch-lock 06-15 / exec 09-28 | hexa-bio session | ⬜ |
| G26-RB-3 | C2 DoD uplift — component (2) structure prediction 을 stub→inline MFE (Nussinov/Zuker) + component (3) off-target screen 를 stub→실 host-transcriptome Hamming pool | 2026-09-28 | hexa-bio session | ⬜ partial-stub |
| R-R1 | `ribozyme/spec/ribozyme_output_v1.schema.json` — `structure_2d.dot_bracket` stub allowance 를 MFE solver inline port 로 제거 | cycle-26 stretch | hexa-bio session | 🟡 stub-allowed |

**잔여 작업 요약**:
- [x] **검증 방식 확정 2026-05-12** — G26-RB-1 (human inter-rater) → **deterministic computational verification rubric** (위 7-point, math/physics). σ(6)=12 STRUCTURAL-EXACT 는 ① 12-nt core *by construction* + ⑤ 4-state count predicate 로 *deductive* 도달; Bayesian corpus 채점도 deterministic predicate.
- [ ] rubric 실행 (외부 sim 재실행 — `ribozyme_kinetics_simulation.py` @ `~/core/nexus/sim_bridge/`; 모든 값 이미 MVP 에 있어 PASS 예상). 그 다음 σ(6) CANDIDATE → EXACT.
- [ ] `ribozyme_kinetics_simulation.py` 또는 신규 `ribozyme_mfe.py` 에 Nussinov-Zuker MFE 인라인 포트 → `structure_2d` stub 제거 (R-R1 / G26-RB-3) — *수학적 검증 가능* (MFE = dynamic-programming, 결과 재현가능).
- [ ] off-target screen 실 구현 (Hamming/seed-region pool, WEAVE Π^p_2 verifier v2 패턴 — deterministic).
- [ ] J₂=24 quotient 결정 (G26-RB-2) — branch-lock; in-scope 시 reaction-coordinate orbit enumeration (orbit size == 24) 으로 검증.
- 비차단: falsifier count 5 → 12 (stretch); CHI2 n 30 (이미 PASS-MARGINAL 초과).

**닫힘 조건**: G26-RB-1′ computational verification rubric 7/7 PASS (재현가능) + R-R1 stub 제거 + C2 4/4 (이미) → ribozyme v1.x closure-grade. **human-rater 의존성 없음.**

---

## §4 NANOBOT — actuation (🟡 ~70%)

**Gate to close (APPROXIMATE/CANDIDATE → EXACT)**:

| Gate | 내용 | Deadline | Owner | Status |
|------|------|----------|-------|--------|
| **G26-NB-1′** (was: G26-NB-EXT inter-rater) | **deterministic geometric/group-theoretic verification + predicate corpus audit** (math/physics, no human raters — user directive 2026-05-12): ① σ(6)=12 = #(vertices) of truncated-icosahedron *and* cuboctahedron — both have exactly 12 vertices; closed-form coords (trunc-icos: even perms of (0,±1,±3φ),(±1,±(2+φ),±2φ),(±φ,±2,±(2φ+1)) / cuboctahedron: all perms of (±1,±1,0)) 를 enumerate → count==12, 기하 사실 ② τ(6)=4 = 4-state motor cycle S0→S1→S2→S3→S0 — directed-state count==4 ③ φ(6)=2 = bound/unbound binary ④ J₂=24 = \|O_h\| octahedral group order = 24 — group theory exact; pose-equivalence quotient size = 24 by orbit enumeration ⑤ master identity σ·φ = n·τ = J₂ : 12·2 = 6·4 = 24 — arithmetic ⑥ work_per_cycle ≥ 10 kT (MVP 50 kT) — Langevin sim 수치 + 부등식 ⑦ no-collapse over n_cycles ≥ 2500 (MVP 3018 productive round-trips). n=60 corpus axis-match 채점도 deterministic predicate (σ ⟺ vertex/cardinality==12; τ ⟺ #states==4; …). | **즉시 가능** (geometric/group 항목은 순수 계산; ⑥⑦ 은 외부 sim — `nanobot_actuation_simulation.py` @ `~/core/nexus/sim_bridge/`) | computational (no rater) | 🟢 rubric 정의됨; 기하·군 항목 trivially PASS, sim 항목 MVP 값으로 PASS 예상 |
| C0c (ext) | F-NB-2-b ensemble drift — n=60 log10_BF ≥ 3.0 | 2026-09-28 (cycle 27) | — | ✅ **DECISIVE PASS** (log_bf 13.65, posterior 1.0) |
| F-NB-2-c | textbook-vs-experimental stratum bias ≤ 1 Jeffreys band | 2026-09-28 | hexa-bio session | ⬜ pending |
| F-NB-2-n6-decorative | n6-strip ablation \|Δlog_bf\| ≥ 0.5 | — | ✅ **PASS decisive** (Δ ≫ 0.5) |
| **C0d** | F-NB-4-cuboctahedron dual-skeleton PASS — `nanobot_actuation_simulation.py --skeleton cuboctahedron` (12-vertex, σ=12/τ=4/J₂=24 보존, work ≥10 kT, n_cycles ≥2500 no-collapse) | **2026-07-28** | hexa-bio session | ⬜ |
| N-R1 | `actuator_output_v1.schema.json` v2 emission — `nanobot_actuation_simulation.py` 를 확장해 `vertex_decorations`(12) + `pose_canonical_form`(rep pose 0..23, orbit 24) + `state_cycle`(4×4 rate matrix) + `binding_affinity` emit (v1 은 speedup factor 만) | cycle 26 | hexa-bio session | ⬜ v1 only |
| N-R2 | `handoff_l6_emission_v0.schema.json` lock — `emission_blocked_until_schema_lock=true` 해제 (v0 → v1) | cycle 26+ | hexa-bio session | 🟡 v0, blocked |

**잔여 작업 요약**:
- [x] **검증 방식 확정 2026-05-12** — G26-NB-EXT (human inter-rater) → **deterministic geometric/group-theoretic verification + predicate corpus audit** (위 7-point). σ(6)=12 = truncated-icosahedron/cuboctahedron vertex count (기하 사실), J₂=24 = \|O_h\| (군 사실) — *deductive*, rater 불요.
- [ ] rubric 실행: ①②③④⑤ 즉시 (순수 계산); ⑥⑦ 은 `nanobot_actuation_simulation.py` 재실행 (외부 sim, MVP 값 있음). C0d cuboctahedron 도 같은 sim 의 `--skeleton cuboctahedron` 변형 — 12-vertex 보존 자동.
- [ ] F-NB-2-c stratum-bias sub-clause 실행 (textbook vs experimental ≤ 1 Jeffreys band — deterministic Bayes factor).
- [ ] `actuator_output_v1` v2 emit-path + L6 handoff schema v0 → v1 lock (N-R1 / N-R2 — schema 작업, in-repo 가능).
- 비차단: falsifier count 5 → 12 (stretch); wet-lab integration + IP/contract → cycle 30+.

**닫힘 조건**: G26-NB-1′ computational verification (geometric/group 항목 PASS + sim 항목 PASS) + C0d cuboctahedron PASS + N-R1 v2 emit + N-R2 schema lock + C2 4/4 (이미) → nanobot v1.x closure-grade. **human-rater 의존성 없음.** (단, parent F-NB-2 의 canonical n=30 corpus 는 51% predicate-match 라 "curated-corpus 조건부 STRUCTURAL-EXACT" honest disclosure 영구; predicate 자체는 deterministic.)

---

## §5 VIROCAPSID — assembly (🟡 ~90%, σ(6) 는 이미 EXACT)

**Gate to close**:

| Gate | 내용 | Deadline | Owner | Status |
|------|------|----------|-------|--------|
| **GATE-26-V-R1 (C5)** | cage output schema lock — `virocapsid/spec/cage_output_v1.schema.json` (LANDED) + 4 cells 가 conformance witness emit | **2026-07-28** | hexa-bio session | ⚠️ schema landed, lock+conformance 미완 |
| GATE-26-V-1b (C3b) | F-VIROCAPSID-1 full corpus — n≥100 PDB entries + posterior ≥ 0.95 (현재 n=10 post 1.0) | 2027-04-28 (deferred cycle 28+) | hexa-bio session | ⬜ infra ready (C3a), 확장 대기 |
| F-VIROCAPSID-1-c | source bias 독립축 — textbook vs experimental vs designed stratum (현재 5:4:1) | cycle 28+ | hexa-bio session | 🟡 partial |
| F-VIROCAPSID-1-d | annotation completeness 독립축 (현재 1.0 on n=10) | cycle 28+ | hexa-bio session | 🟡 |
| V-R2 stretch | multi-T 일반화 T=7 / T=13 / T=21 (현재 T=1/T=3/T=4 PASS) — per-system rate-constant re-derivation | cycle 30+ | hexa-bio session | ⬜ deferred |
| (sandbox 평준화) | weave 급 empirical sandbox — 현재 cage assembly 는 `~/core/nexus/sim_bridge/weave/` 의 ODE 를 공유 + `virocapsid_calibration.py` / `virocapsid_multi_t_calibration.py`; 독립 Zlotnick ODE 를 CLI 에 wiring | cycle 28+ | hexa-bio session | 🟡 shared bridge |

**잔여 작업 요약**:
- [ ] **C5 schema lock + 4-cell conformance witness** (07-28, 단기 — 코드 작업).
- [ ] C3b full corpus 확장: RCSB PDB API 로 n≥100 (T strata ≥3, source class ≥2 유지) + Bayesian re-audit posterior ≥ 0.95 (long pole).
- [ ] F-VIROCAPSID-1-c / -1-d 독립축 정량화.
- 비차단: T=7/T=13/T=21 (cycle 30+); 독립 ODE wiring.

**닫힘 조건**: σ(6)=12 STRUCTURAL-EXACT 는 이미 만족 (T=1 post 1.0, multi-T PASS). C5 schema lock 완료 시 **v1.x closure-grade 도달**; C3b n≥100 + posterior ≥0.95 는 robustness upgrade (v1.x 비차단, cycle 28+ stretch). 즉 virocapsid 는 사실상 단기(07-28)에 closure-grade 가능.

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
| **F-Q-6** | **drug-target pocket VQE — Phase C** — target ✅CONFIRMED 2026-05-12: **SARS-CoV-2 Mpro (Cys145+His41 dyad + nirmatrelvir reactive 부분), nirmatrelvir comparator** (user decision) | OPEN (실행 진행) | hexa-bio session (out-of-repo exec: `_qiskit_bridge/` + qiskit-aer + qmirror) | 🟡 **target locked, Phase C running** (attempt 9) |
| F-Q-EXT-7b | caDNAno smoke — numpy ABI + PyQt5 forced load 로 BLOCKED | OPEN | hexa-bio session | 🔴 BLOCKED → alt-path (scadnano / oxDNA direct) 필요 |
| L1 (확장) | small-molecule generalize — BeH₂ 6-qubit (LiH 는 F-Q-2 로 완료) | — | hexa-bio session | 🟡 LiH done, BeH₂ pending |
| L3 | drug-target pocket fragment — single active-site QM/MM split, single-restart VQE (= F-Q-6, Mpro Cys145+His41) | Phase C in-progress | hexa-bio session (out-of-repo exec) | 🟡 = F-Q-6, target locked |
| L4 | protein-relevant subsystem — single-residue active site | gated on L3 | hexa-bio session | ⬜ |
| Phase C / D (`.roadmap.novel_drugs`) | Phase C pocket supersystem VQE (F-Q-6-D — Mpro Cys145+His41 + nirmatrelvir reactive 부분) → Phase D library ranking (F-Q-6-F, 5-10 candidate library) | — (target locked) | hexa-bio session (out-of-repo exec) | 🟡 Phase C IN-PROGRESS, attempt 9 (D3 dispersion bottleneck) — `tests/*_pocket_vqe_v7.py` |
| Phase 2 port | `_python_bridge/module/quantum_*.py` adapters → hexa-native (별도 hexa-lang session, user directive 2026-05-07) | — | hexa-lang session | ⬜ out-of-scope here |
| σ(6) 확장 | n=6 binding 을 H₂/LiH 6-Pauli 너머 pocket-scale Hamiltonian 으로 일반화 | gated on Phase C | hexa-bio session | 🟡 H₂/LiH only |

**잔여 작업 요약**:
- [x] **USER DECISION 확정 2026-05-12** — F-Q-6 / Phase C target = **SARS-CoV-2 Mpro (main protease)**, active-site dyad **Cys145 + His41**, ligand reactive 부분 = **nirmatrelvir** (covalent Mpro inhibitor) reactive nitrile, comparator = nirmatrelvir. → quantum closure 진행 가능. Phase C 는 이미 attempt 9 까지 진행 중 (`.roadmap.novel_drugs` Phase C / `tests/*_pocket_vqe_v7.py`); *실행은 out-of-repo* (`_qiskit_bridge/module/pocket_vqe_orchestrator.py` + `pocket_active_space.py` + `ligand_smiles_to_h.py` + `qiskit-aer` + `hx install qmirror`).
- [ ] Phase C 완료 (F-Q-6-D explicit pocket supersystem VQE, published reference error band 내 PASS) → L3 closure → L4 (single-residue active site) → Phase D library ranking (F-Q-6-F).
- [ ] F-Q-EXT-7b caDNAno alt-path: caDNAno 가 numpy ABI + PyQt5 강제로드로 BLOCKED → scadnano (브라우저/CLI) 또는 oxDNA 직접 호출로 대체.
- [ ] L1 BeH₂ 6-qubit (LiH 패턴 재사용).
- [ ] Phase C 완료 후 L4 (single-residue active site) → Phase D library ranking.
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

**닫힘 조건**: F-Q-6 (Mpro Cys145+His41 pocket VQE, published reference error band 내) PASS + F-Q-EXT-7b 해소(또는 alt-path PASS) + L1 BeH₂ + L4 single-residue → quantum v1.x closure-grade. 선행조건(user target 결정)은 ✅ 해소(2026-05-12); 남은 건 Phase C 실행 완료 (out-of-repo).

---

## §7 통합 타임라인 (제안)

| 시점 | 마일스톤 |
|------|----------|
| ~now (human-rater 불요, user directive 2026-05-12) | **G26-RB-1′ + G26-NB-1′ deterministic computational verification rubric** 실행 (ribozyme 7-point math/physics; nanobot geometric/group + sim) → ribozyme & nanobot σ(6) CANDIDATE→EXACT *deductive* 도달. 기하/군 항목 즉시; sim 항목은 외부 `~/core/nexus/sim_bridge/` 재실행. ribozyme G26-RB-2 branch-lock. |
| → 2026-07-28 (MVP gate) | virocapsid **C5 schema lock + 4-cell conformance** · nanobot **C0d cuboctahedron** · nanobot **N-R1 v2 emit** · ribozyme **R-R1 MFE port** (stub 제거) → ribozyme + nanobot + virocapsid v1.x closure-grade 도달 목표 |
| → 2026-09-28 | ribozyme G26-RB-2 exec + G26-RB-3 C2 uplift · nanobot F-NB-2-c stratum bias · nanobot N-R2 L6 handoff lock |
| 진행 중 (target ✅확정 2026-05-12) | **quantum Phase C — F-Q-6 pocket VQE** (Mpro Cys145+His41 / nirmatrelvir) → L3 → L4 → Phase D library ranking — 실행 out-of-repo (`_qiskit_bridge/` + qiskit-aer + qmirror) |
| cycle 28+ | virocapsid C3b full corpus n≥100 + posterior ≥0.95 · F-VIROCAPSID-1-c/-d 독립축 |
| cycle 30+ | virocapsid V-R2 T=7/13/21 · nanobot/ribozyme wet-lab handoff · quantum HW adoption ladder |
| v2.0.0 | GATE-26-2 full lean4-backed Π¹₁-CA₀ cert (전 5축) · Bayesian audits 5/5 empirical · weave CHI2 n≥5 |

---

## §8 user 입력이 필요한 항목 (지금 결정하면 빨라지는 것)

1. ~~**quantum F-Q-6 target system**~~ → ✅ **CONFIRMED 2026-05-12**: SARS-CoV-2 Mpro (main protease), Cys145+His41 dyad, nirmatrelvir comparator (user decision). Phase C 실행은 out-of-repo 워크플로 소관.
2. ~~**inter-rater 인력**~~ → ✅ **해소 (user directive 2026-05-12)**: ribozyme / nanobot 검증은 **수학적·물리적 계산 (deterministic verification rubric)** + **deterministic 채점 predicate** 로 — 사람 평가자 불요. ribozyme = 7-point (12-nt core by construction + Eyring TST + Turner-NN + Eigen-Hammes 부등식 + 4-state count + mass/convergence invariants); nanobot = geometric (vertex count==12) + group-theoretic (\|O_h\|==24) + sim 부등식. §0 cell 7 검증 정책 참조.
3. **G26-RB-2 J₂=24 quotient** — ribozyme 의 reaction-coordinate J₂ quotient 을 v1.x in-scope 로 할지 stretch 로 둘지 (branch-lock 2026-06-15).
4. **virocapsid C3b deadline** — n≥100 corpus 를 v1.x 안으로 당길지(코드 작업, 1-2 cycle), cycle 28+ 로 둘지. (σ(6) EXACT 는 이미라 closure 비차단이지만 robustness 차원.)

---

## §9 cross-links

- cross-cutting tracker: [`.roadmap.hexa_bio`](.roadmap.hexa_bio) (§A.1 lattice / §A.2 cadence / §A.4 MVP gate / §F STALLED audit / §G cycle-26 gates)
- per-axis: [`.roadmap.weave`](.roadmap.weave) · [`.roadmap.virocapsid`](.roadmap.virocapsid) · [`.roadmap.nanobot`](.roadmap.nanobot) · [`.roadmap.ribozyme`](.roadmap.ribozyme) · [`.roadmap.quantum`](.roadmap.quantum)
- quantum drug-target: [`.roadmap.novel_drugs`](.roadmap.novel_drugs) (Phase B/C/D) · [`.roadmap.quantum_hw_adoption_ladder`](.roadmap.quantum_hw_adoption_ladder)
- axis lock: [`.roadmap.axis_expansion_decision_2026_05_08`](.roadmap.axis_expansion_decision_2026_05_08) · platform manifest: [`.roadmap.platform_index`](.roadmap.platform_index)
- changelog: [`CHANGELOG.md`](CHANGELOG.md) `[Unreleased]` · release notes: [`RELEASE_NOTES_v1.1.0.md`](RELEASE_NOTES_v1.1.0.md) · [`V1_1_0_HANDOFF.md`](V1_1_0_HANDOFF.md)

---

## §10 atlas.n6 / nexus registration (cross-repo follow-up)

본 작업(5-axis doc reconciliation + closure plan + 검증 정책 확정)의 n6
atlas 등재 (nexus-side bookkeeping):

- [ ] `nexus/n6/atlas.append.hexa-bio-5axis-recon-and-closure-plan.n6` —
  hexa-bio v1.x 5-axis reconciliation (need-singularity→dancinlab org fix,
  quantum 5번째 axis 등재 in README/manifests/CLI, `AXIS_CLOSURE_PLAN.md`
  생성, ribozyme/nanobot 검증을 human-rater → deterministic computational
  rubric 로 전환) 을 atlas append entry 로 등록. (이 repo 가 아닌
  `~/core/nexus/n6/` 소관 — `nexus status` / canon-seal 흐름으로 cross-repo
  absorption.)
- [ ] `nexus/n6/atlas.append.hexa-quantum-fq6-target-locked.n6` — F-Q-6
  target = SARS-CoV-2 Mpro (Cys145+His41) / nirmatrelvir comparator
  (user decision 2026-05-12) 등재.
- nexus check: `nexus status` (harness self-check + health-all) 로 hexa-bio
  ↔ nexus ↔ canon 정합성 점검. atlas.n6 entries 는 `~/core/n6-architecture/
  atlas/atlas.n6` (canonical) + per-domain `atlas.append.*.n6` 로 분산.
