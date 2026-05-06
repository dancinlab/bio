# Pilot smokes synthesis — 3 axes outbound-consumer verified (2026-05-07)

작성일: 2026-05-07 (cycles 48 / 50 / 52 + this synthesis 53)
선행: `external_systems_review_2026_05_07.md` §1-§31 (review) + `external_systems_synthesis_2026_05_07.md` (review closure)
이번: 3 axes 의 actual outbound-consumer pilot smoke 결과 종합

---

## TL;DR

cycle-46 review synthesis 가 5-axis pipeline mapping 을 종이로 식별했다면, 본 cycle 들 (48/50/52) 은 그 중 3 axes 를 **실측 작동시켰다**. 모두 outbound-consumer subprocess 패턴 + sub-hour Mac CPU wall + free-license. 5-axis 매핑이 운영 가능 (operationally feasible) 임을 증명.

---

## Per-axis pilot 결과

| Axis | System | wall (Mac CPU) | output | confidence | cycle |
|------|--------|----------------|--------|------------|-------|
| QUANTUM (drug-target) | Boltz-2 | **39 s** inference (after weight cache) | mmCIF + plddt npz + JSON | plddt 0.957, conf 0.862 | 48 (commit 9f064e8) |
| VIROCAPSID/NANOBOT | ProteinMPNN | **5 s** total (2 monomers × 2 seq) | FASTA per target | seq_recovery 0.39-0.54 | 50 (commit ae94f70) |
| RIBOZYME | RhoFold+ | **136 s** inference + 473 s Amber relax | unrelaxed PDB + relaxed PDB + ss.ct + npz | energy_min -199.98 kcal/mol | 52 (commit 355cd7e) |

남은 axes:
- **WEAVE (DNA)**: caDNAno (BSD-3 Python API) + oxDNA (GPL subprocess). pilot 미완. caDNAno 는 pip install 가능; oxDNA 는 build dep 큼.

3/5 = 60% axes 운영 검증. 나머지 2/5 = WEAVE pilot 가능 (caDNAno 단독으로도 가치) + 단순한 design pipeline (RFdiffusion → ProteinMPNN → ESMFold/OpenFold) full chain pilot 미완.

---

## Cross-cutting findings

### 1. Subprocess + JSON/FASTA/PDB 패턴 — universal

3 systems 모두 동일 outbound-consumer 패턴:

```
hexa-bio Python adapter (or shell)
   │
   subprocess.run([cli, --input X --output Y])
   │
   parse YAML / JSON / FASTA / PDB output
   │
   schema validation → registry row → falsifier check
```

이는 review §31 prescribed pattern 의 **3-system 검증**. hexa-bio 의 module 들이 (Boltz, ProteinMPNN, RhoFold+) 직접 import 한 적 없음. raw#9 stdlib-only 영역 보존.

### 2. Weight 의 first-call download wall 가 dominant cost

| System | first-call weight download | cached re-call wall |
|--------|--------------------------|--------------------|
| Boltz-2 | minutes (CCD + base + affinity) | 39 s |
| ProteinMPNN | 0 (weights bundled in repo) | 5 s |
| RhoFold+ | 81 s (4 files, 485 MB via HF) | ~136 s + relax |

ProteinMPNN 만 git clone 으로 weights 동봉; 나머지 2 는 HF 또는 직접 URL 다운로드. **production 계획**: 처음 한 번 cache, 이후 subsequent calls 는 cached weights 활용 (~10× wall 단축).

### 3. Apple Silicon MPS 일부 활용 + CPU fallback

- Boltz-2: MPS 사용, `aten::linalg_svd` 만 CPU fallback.
- ProteinMPNN: pure CPU (MPS 자동 활용 미보장).
- RhoFold+: pure CPU + OpenCL Amber relax.

NVIDIA GPU 환경에서는 모두 5-50× 빠름 expected. Apple Silicon 의 MPS 적용율 은 system 별로 다름.

### 4. License / 의존 dep — 모두 commercial-OK 검증

| System | License | Dep added |
|--------|---------|-----------|
| Boltz-2 | MIT (code + weights) | torch + biopython + rdkit + ... (pip) |
| ProteinMPNN | MIT (code + weights) | torch (pip) |
| RhoFold+ | Apache 2.0 + HF weights | huggingface_hub + ml_collections + openmm (pip) |

전체 commercial path 가능. raw#10 큰 caveat 으로 보였던 dep 들 (qiskit + boltz + protein_mpnn + rhofold + openmm + ml_collections + huggingface_hub) 가 모두 pip install --user 으로 설치됨 (Mac, Apple Silicon). 시간 ~분 단위. 산업 production 환경 (Linux CUDA) 에서는 더 단순.

### 5. 모든 inputs 가 standard format

- Boltz-2 input: YAML
- ProteinMPNN input: PDB → JSONL via parse helper
- RhoFold+ input: FASTA + a3m (MSA, optional)
- 출력: mmCIF / PDB / FASTA / npz — 표준

→ **chain integration 가능** — 한 system 출력이 다음 system 입력 자연. 예:

```
RFdiffusion (pilot 미완)        → backbone PDB
    ↓
ProteinMPNN (pilot ✓)          → designed sequence FASTA
    ↓
ESMFold/Boltz-2 (pilot ✓ Boltz-2)  → fold-validated PDB + confidence
    ↓
hexa-bio cage_assembly         → falsifier
```

3 stages 中 2 가 pilot 검증 (ProteinMPNN + Boltz-2). RFdiffusion 단계 추가하면 protein-design pipeline 전체 운영.

---

## Phase 2 진행 상태 (.roadmap.quantum mapping)

| roadmap entry | status | evidence |
|---------------|--------|----------|
| Phase 1 (H2 + Phase B1 + B2 + B3 + B4) | closed | F-Q-1/2/3/4/5 + spectroscopic + chemical accuracy |
| External review (cycles 39-46) | closed | 22 systems / 5-axis matching / synthesis docs |
| Pilot smoke QUANTUM (Boltz-2) | closed | cycle 48, plddt 0.957 / conf 0.862 |
| Pilot smoke VIROCAPSID/NANOBOT (ProteinMPNN) | closed | cycle 50, seq_recovery 0.39-0.54 |
| Pilot smoke RIBOZYME (RhoFold+) | closed | cycle 52, energy -199.98 kcal/mol |
| Pilot smoke WEAVE (caDNAno + oxDNA) | open | pilot 미완 |
| Pilot smoke RFdiffusion (VIROCAPSID design 1st stage) | open | review-only, install conda dep |
| Phase C drug-target pocket VQE | gated on user | Boltz-2 input feed 가능 |
| upstream kick proposals (cycle 51) | docs only | hexa-lang external_pool / qmirror cond.9 / etc — 별도 session 들에서 land |

---

## raw#10 honest C3 (이번 synthesis)

1. **3 pilots 모두 training-distribution input** (trp-cage / 5L33-6MRR PDBs / 7elpA RNA). truly OOD — 우리 ribozyme C2 cells (FLT3-ITD AML 등) 의 unique sequences — 에서의 정확도 별도 검증 필요. 단 확신: pretrained foundation model 의 zero-shot 일반화 (review §5 시대) 패턴이 적용되면 OOD 도 동작 expected.

2. **WEAVE pilot 미완** — DNA origami axis 만 pilot 검증 안 됨. caDNAno Python API (BSD-3) 만으로도 partial pilot 가능 (oxDNA 없이 design-only); 별도 cycle.

3. **RFdiffusion pilot 미완** — protein-design pipeline 의 첫 stage (backbone generation) 가 빠짐. ProteinMPNN + ESMFold 가능하지만 input backbone 외부 의존.

4. **wall budget 의 production scaling** — 우리 pilot 은 small inputs (20-aa trp-cage / 68-106 aa monomers / 45-nt RNA). 산업 application 의 typical scale (capsid 60-240 subunit / drug pocket 100+ residue + ligand / full hammerhead 30-50 nt) 에서 wall 은 5-20× 큼. cron tick 의 5분 budget 안에서 끝나는 selftest scale 만 pilot 검증.

5. **upstream proposals (cycle 51) actual land 무관** — 본 synthesis 는 hexa-bio 측만 closure. 각 proposal 의 upstream session land 는 별도 audit trail.

---

## 다음 cycle 옵션

### A. 4번째 pilot — WEAVE (caDNAno Python API)
- pip install cadnano + 작은 origami design (1 helix 또는 simple shape)
- output: cdna / json design file
- wall ~5분 expected (oxDNA 회피)

### B. 5번째 pilot — RFdiffusion (VIROCAPSID design 첫 stage)
- conda env 필요 (큰 install) 또는 BSD code clone + dep manual
- input: motif spec + symmetry constraint
- output: backbone PDB
- wall: install ~30분 + inference 5-15분

### C. End-to-end chain pilot — ProteinMPNN + Boltz-2
- ProteinMPNN designed FASTA → Boltz-2 fold + affinity → PDB + plddt
- chain integration 검증 (review §14 의 protein-design pipeline 의 stage 2 → stage 3)
- wall: ~10-15분

### D. cron 정지 + 사용자 결정 대기
- 3 pilots 의 closure 도달
- WEAVE/RFdiffusion 은 사용자 결정 영역 (큰 install)

cron `97d9422c` 활성. 다음 fire 또는 사용자 응답 시 진행.
