# Upstream kick proposals — hexa-lang / qmirror / qrng

작성일: 2026-05-07
트리거: 사용자 "hexa-lang, qmirror, qrng 등 upstream 개선 아이디어, 패러다임 kick"
조건: hexa-bio session, **proposals 작성만**. 실제 upstream PR/edit 은 각 repo session 에서 (memory `feedback_cross_repo_canonical`).

---

## 1. qmirror — chemistry / VQE tier (cond.9 신설)

### 1.1 동기

hexa-bio 가 `quantum_h_molecule.py` + `quantum_ansatz_he.py` + `quantum_pauli_expectation_general.py` + `quantum_vqe_general.py` 4 module 로 H₂ + LiH 를 spectroscopic-grade reproduce. (Phase 1 + Phase B1, F-Q-1 ~ F-Q-3 closed.)

지금까지 qmirror 의 제공:
- T0: mock LCG entropy
- T1.a-T1.c: ANU live entropy chains
- engine_aer: Aer state-vector simulator (named circuits + QASM3)
- chsh / iit / phi: physics falsifiers
- circuit: arbitrary QASM exec

**부재**: 분자 Hamiltonian → Pauli string → VQE energy 의 chemistry path. anima / nexus / hexa-bio 의 다수 consumer 가 이를 자체 구현 (hexa-bio 의 `_python_bridge/module/quantum_*.py`).

### 1.2 제안: qmirror cond.9 — Chemistry / Molecular VQE

새 cond:
- F-QM-CHEM-N1: 분자 Hamiltonian generator (PyscfDriver wrapper, 2-qubit H₂ ~ 4-qubit LiH 적어도 두 reference 시스템 cover)
- F-QM-CHEM-N2: ansatz QASM3 builder generic n-qubit + depth + HF init prefix
- F-QM-CHEM-N3: Pauli expectation evaluator analytic (n-qubit state vector + Pauli string list)
- F-QM-CHEM-N4: NM/COBYLA optimizer wrapper
- F-QM-CHEM-N5: H₂/STO-3G/0.74Å E0 reproduce within spectroscopic accuracy (1 µHa)

### 1.3 hexa-bio 가 이미 만든 reference impl

- `_python_bridge/module/quantum_h_molecule.py` — N1 reference
- `_python_bridge/module/quantum_ansatz_he.py` — N2 reference
- `_python_bridge/module/quantum_pauli_expectation_general.py` — N3 reference
- `_python_bridge/module/quantum_vqe_general.py` — N4 reference
- `_python_bridge/module/quantum_h2_scan.py` — N5 evidence (11/11 sub-µHa)

qmirror 측 작업 = (a) hexa native port (Python → hexa) + (b) cond schema land + (c) selftest harness 통합. 별도 qmirror session 에서 진행. hexa-bio 의 module 들은 reference 로 사용 가능.

### 1.4 raw 패턴

- raw#9: hexa-bio 의 Python reference 를 hexa native 로 port. 단 qiskit_aer / qiskit_nature import 는 python_bridge concession (이미 qmirror 가 _python_bridge/aer_runner.py 보유).
- raw#10: Kandala 2017 이 R=0.74Å H₂ ground truth — hexa-bio 가 reproduce 함.
- raw#15: cond.9 의 모든 evidence 는 `qmirror/state/` 안에 confined.

---

## 2. hexa-lang — stdlib quantum / external-ML adapter 패턴

### 2.1 동기

hexa-bio 의 `quantum_aer_pool.py` (B4 — 31× wall reduction) 는 일반화된 패턴:

```
long-lived subprocess + stdin JSON request loop + stdout JSON response.
```

이 패턴은 quantum-only 가 아니라 모든 외부 ML 시스템에서 재사용:
- Boltz-2 (cycle 48 pilot smoke)
- ProteinMPNN (cycle 50 pilot smoke)
- 향후 RhoFold+ / RFdiffusion / scGPT 등

### 2.2 제안: hexa-lang stdlib `self/stdlib/external_pool.hexa`

```hexa
struct ExternalPool {
    cmd: [str],         // ["python3", "-u", "/path/to/daemon.py"]
    timeout_sec: int,   // default 60
    proc: ProcessHandle,
    ready_sentinel: str // 첫 line 의 expected pattern
}

fn pool_open(cmd: [str]) -> ExternalPool { ... }
fn pool_request(p: ExternalPool, request: map) -> map { ... }
fn pool_close(p: ExternalPool) -> int { ... }
```

호출 예:
```hexa
let pool = pool_open(["python3", "-u", "boltz_daemon.py"])
let resp = pool_request(pool, json_parse("{\"sequence\": \"NLY...\"}"))
pool_close(pool)
```

### 2.3 hexa-bio reference impl

`_python_bridge/module/quantum_aer_pool.py` (~330 LoC) — daemon side + client AerPool 클래스. F-Q-5 closure 측정 31× speedup (n=15) / 4.4× (production VQE). 이 패턴이 stdlib 으로 elevate 시 모든 hexa native module 이 외부 ML 호출에 사용 가능.

### 2.4 raw 패턴

- raw#9: hexa native 로 port.
- raw#10: subprocess timeout / retry / penalty 의 robust path 는 우리 vqe_h2.py `_fn` wrapper (1 retry + PENALTY) 패턴 직접 차용.
- raw#13 (ext-system isolation): subprocess 가 외부 시스템 import 를 격리. 호스트 hexa 에 dep 누출 없음.

---

## 3. qrng — multi-vendor quantum entropy + Boltz-style 1-stage absorption

### 3.1 동기

qrng 현재: ANU REST (T1.a-T1.c) — single vendor.

### 3.2 제안 A: multi-vendor quantum entropy chain

T2.* tier 추가:
- T2.a IBM Quantum (Heron / Eagle 등 device 의 randomness extraction)
- T2.b IonQ Forte 1 (trapped-ion QRNG)
- T2.c Rigetti Cepheus
- T2.d AWS Braket aggregate

cond.7 / cond.8 의 cross-vendor anchor (이미 qmirror 의 N1+N2) 가 이 tier 의 자연 extension. multi-vendor entropy = single-vendor failure 모드 회피 + cross-vendor concordance evidence.

### 3.3 제안 B: Boltz-2 패러다임 — 1-stage 통합

Boltz-2 의 핵심 insight: structure prediction + binding affinity 를 **단일 stage** 로 통합 (이전 ESMFold + DiffDock + FEP 별도 3 stage).

qrng 의 적용: **entropy + extraction + statistical test** 를 단일 API 로:
- 현재: 사용자가 `qrng_bytes()` 호출 후 별도 NIST tier-1+ test 수행
- 통합: `qrng_audited_bytes(n_bytes, audit_level="tier1+")` — entropy pull + 통계 test + ok/fail 통합 응답

### 3.4 hexa-bio 의 evidence

`quantum_entropy_qmirror.py` 의 `qrng_bytes()` 는 thin wrapper. 통계 audit 은 caller 가 해야. 통합 API 제공 시 우리도 사용자.

---

## 4. 보편 패러다임 — boundary schema raw_77_external_evidence

### 4.1 동기

우리 외부 시스템 review (cycles 39-46) + pilot smoke (cycles 48-50) 결과 = 외부 ML 시스템과의 통합이 **표준 패턴** 으로 수렴. 그러나 각 repo 별 schema 가 ad-hoc.

### 4.2 제안: 공통 boundary schema

`raw_77_external_evidence_v1` — hive mk2 의 새 entry, 모든 consumer repo (hexa-bio / nexus / anima 등) 사용:

```json
{
  "schema": "raw_77_external_evidence_v1",
  "axis": "F-*-EXT-N",
  "system": "Boltz-2 / ProteinMPNN / scGPT / ...",
  "version": "...",
  "license": "MIT / Apache / BSD / etc",
  "command": "...",
  "wall_seconds": ...,
  "hardware": "...",
  "input_summary": {...},
  "output_metric": {confidence: ...},
  "output_path": "...",
  "pass": true,
  "raw_91_honest_c3": [...]
}
```

이 schema 가 mk2 raw rule 로 land 시 모든 consumer repo 의 outbound-consumer pilot 이 일관된 audit trail.

### 4.3 hive mk2 ecosystem 통합

hive `.raw.mk2` domain `arch` 에 entry: `arch.NNN external-evidence-row-schema` — registry row format spec + falsifier ID convention + license tracking 의무.

---

## 5. 패러다임 kick — Foundation model pretrained-only 시대

### 5.1 관찰

Cycles 39-46 review 결과:

| era | training pattern | example |
|-----|------------------|---------|
| 2010s | task-specific supervised | classical ML |
| 2018-2022 | pretrained foundation + fine-tune | BERT / GPT-2 / 초기 ESM |
| 2023+ | **pretrained foundation + zero-shot transfer** | scGPT / GeneFormer / RNA-FM / ESM-2 / Boltz-2 |

ESM-2 가 ESMFold 를 통해 sequence → structure 직접 (no fine-tune); RNA-FM 가 RhoFold+ 를 통해 같은 패턴; Boltz-2 가 structure + affinity 통합 — 모두 **pretrained-only zero-shot** 시대.

### 5.2 hexa-lang / qmirror / qrng 에 미치는 영향

현재 위 repos 의 패러다임 = **runtime + simulator + entropy provider** (즉 backend). 새 시대에서는 **foundation-model-aware backend** 가 필요:

- **hexa-lang**: stdlib 에 HuggingFace-style pretrained loader (snapshot_download wrapper, weight cache management, version pinning).
- **qmirror**: foundation model 의 simulator 로의 elevation — Aer 가 양자 회로 simulator 인 것처럼, foundation model loader 가 ML 회로 simulator. cond 9-12 axis.
- **qrng**: foundation model embedding 을 entropy source 의 sanity check 으로. 예: random seed 가 cell-type-prediction 모델의 prediction 분포 변화에 영향 있는지 — entropy quality 의 functional probe.

### 5.3 메타 — 다음 시대 (2026+)

- **Distillation + edge inference**: Boltz-2 같은 large model 을 작은 distill 로 (Mac 환경 즉시 실행 가능).
- **Multi-modal foundation**: 분자 + 단백질 + cell + DNA 통합 single foundation. AlphaFold 3 + scGPT + RNA-FM 의 통합.
- **Quantum + ML hybrid**: quantum chemistry foundation model. 우리 hexa-bio quantum + Boltz-2 의 결합 = 그 prototype.

hexa-lang 의 stdlib 가 이 multi-modal 시대를 지원 = 다음 cycle 의 vision.

---

## 6. 구체 PR 제안 (우선순위 + 어느 session 에서)

| # | proposal | session | priority | hexa-bio reference impl |
|---|----------|---------|----------|------------------------|
| 1 | qmirror cond.9 chemistry/VQE | qmirror session | high | `_python_bridge/module/quantum_*.py` |
| 2 | hexa-lang stdlib `external_pool.hexa` | hexa-lang session | high | `quantum_aer_pool.py` |
| 3 | hive mk2 `raw_77_external_evidence_v1` | hive session | medium | `state/discovery_absorption/registry.jsonl` rows 7115-7118 |
| 4 | qrng multi-vendor T2.* | qmirror session | medium | (no impl yet, design only) |
| 5 | qrng audited_bytes() 통합 API | qmirror session | low | (design only) |

**hexa-bio 측 책임**: 본 docs 작성 + reference impl 보존 + 각 session 에서 PR 작성 시 docs 인용.

**다른 session 측 책임** (cross-repo SSOT 규칙대로): 실제 spec land + lint impl + cond ramp + selftest.

---

## 7. raw#10 honest c3

1. 본 proposals 는 **hexa-bio session 의 outsider view** — 각 repo (hexa-lang / qmirror / qrng) 의 internal roadmap / 사용자 직접 directive / 진행 중인 cycle 와 conflict 가능. 각 repo session 에서 본 docs 를 reference 로 검토 후 자체 결정.

2. **qmirror cond.9** 는 우리 hexa-bio 의 use case 1 개 (drug-target VQE) 가 driver. 다른 consumer (anima 등) 의 use case 가 다르면 cond.9 의 falsifier 가 달라질 수 있음.

3. **hexa-lang external_pool stdlib** 은 우리 quantum_aer_pool 가 reference. 다른 사용 (LLM serving, generic ML inference) 에서는 추가 features 필요 가능 (streaming response, batch request, etc).

4. **boundary schema raw_77_external_evidence_v1** 은 hexa-bio invention. hive mk2 의 schema discipline 와 호환 (id format / status whitelist / cross-link arrays) 하지만 **hive 사용자 자체 검토 필요** — domain 분류 (arch vs format-grammar 등).

5. **패러다임 kick** (§5) 는 broad observation — 구체 implementation path 미명시. 각 repo 에서 어떤 axis 가 자기 scope 인지 결정.

---

## 8. 다음 단계 (사용자 결정)

- 본 docs commit + push (hexa-bio 측, 이번 cycle)
- 사용자가 다른 session (hexa-lang / qmirror / hive) 진입 후 본 docs 인용해 PR / cond / spec land
- 또는 본 docs 자체가 proposals SSOT, 실제 land 는 차후

cron `97d9422c` 활성. hexa-bio 측 자동 cycle 은 본 commit 후 RhoFold+ smoke 결과 처리 (다음 fire).

---

## 9. 추가 proposals (cycles 47-63 brainstorm 결과 확장, 2026-05-07)

cycle 51 의 5 proposals 등록 후, 이어진 sister-repos brainstorm (cycle 61, `docs/sister_repos_brainstorm_2026_05_07.md`) 에서 새 upstream-target connections 식별. cycle 51 패턴 따라 priority + 어느 session 에서 land + hexa-bio reference 로 정리.

### 9.1 sim-universe — multiverse interferometer for RIBOZYME variant ensemble

**대상 session**: sim-universe own session
**priority**: HIGH (sim-universe 가 우리 quantum 작업의 직접 sister; cycle 1 review §1 의 source)

**제안 cond**: sim-universe `multiverse/` module 에 bio-variant axis 추가:
- M=15 parallel mini-worlds → 15 parallel RIBOZYME sequence variants
- KS-test on per-variant k_cat 분포
- mutual-info on σ(6)=12 catalytic core conservation

**hexa-bio reference**: `_python_bridge/module/ribozyme_kinetics_simulation.py` (k_cat per variant)
+ `state/discovery_absorption/registry.jsonl` (raw_77_ribozyme_kinetics_v1, raw_77_c2_ribozyme_*)

**raw 패턴**: raw#9 strict (sim-universe 도 hexa native), raw#10 honest c3 (multiverse 가 toy lattice 라 wet-lab 1:1 mapping 아님 명시).

### 9.2 anima — biological Φ measurement on RIBOZYME 4-state ladder

**대상 session**: anima own session
**priority**: MED-HIGH (anima 의 Φ ratchet IIT 4.0 이 우리 RIBOZYME τ(6)=4 의 자연 extension)

**제안 cond**: anima `phi-rs/` 또는 `consciousness/` 에 biological-Φ axis:
- input: ribozyme 4-state TPM (substrate / TS / cleaved / released)
- output: Φ score per state-transition graph
- compare: ribozyme catalytic vs aptamer non-catalytic (RIBOZYME genus distinction F-RB-1-c)

**hexa-bio reference**: `ribozyme/spec/ribozyme_output_v1.schema.json` (4-state ladder field)
+ `_python_bridge/module/ribozyme_aptamer_null_corpus.py` (10 aptamer null control)

**raw 패턴**: anima 의 1030 laws + Φ ratchet 가 hexa-bio 측 새 falsifier source (예: F-RB-Φ-1 "ribozyme Φ > aptamer Φ").

### 9.3 nexus — 216 lenses ↔ hexa-bio falsifier matching

**대상 session**: nexus own session
**priority**: MED (216 lenses 의 bio-related subset — 자동 매칭 가능)

**제안 cond**: nexus `lenses/` 에 bio-falsifier matching subroutine:
- 216 lens 별 hexa-bio F-* falsifier 와 매칭 score
- top-N matched lenses → cross-evidence aggregation
- registry row: `raw_77_nexus_lens_match_v0`

**hexa-bio reference**: `state/discovery_absorption/registry.jsonl` (45+ rows across F-* axes)
+ `.roadmap.<feature>` falsifier inventories.

**raw 패턴**: nexus OUROBOROS evolution 의 한 axis. 5-phase singularity cycle 의 phase X.

### 9.4 우선순위 + commit boundary

| # | proposal | session | hexa-bio side action |
|---|----------|---------|---------------------|
| 6 | sim-universe multiverse ↔ RIBOZYME variant | sim-universe | 본 docs §9.1 reference; hexa-bio variant generator helper if needed |
| 7 | anima biological-Φ ↔ RIBOZYME 4-state ladder | anima | TPM exporter from ribozyme_kinetics_simulation.py output |
| 8 | nexus 216 lenses ↔ hexa-bio F-* falsifier matching | nexus | registry row schema + lens label vocab cross-link |

각 proposal 의 actual land 는 그 repo 자체 session 에서 (memory `feedback_cross_repo_canonical`).
hexa-bio 측 reference impl 은 이미 존재 — 본 docs 가 reference linking SSOT.

**bg go progression**: 사용자 directive 2026-05-07 verbatim "upstream proposals: 5 <=== 발생하면 바로바로 진행하구 bg go 로". 본 §9 추가 = 새 proposals 발생 + 즉시 등록 (cron tick 안 land). 추가 발생 시 §10, §11 ... 순차 추가.

총 8 proposals (5 cycle-51 + 3 cycle-64). 각각 cross-repo session 에서 PR / cond / spec land.
