# Sister-repos brainstorm — `~/core/` 의 hexa-bio 연결 가능성

작성일: 2026-05-07
사용자 트리거: "sim-universe 활용방법도 있나?? 브레인스토밍 검토 고갈시까지 + ~/core/ 우리 프로젝트들 검토해서 또 아이디어 있지 않을까 연결할 bg go"
규모: surface-level brainstorm. 각 connection 의 actual integration cycle 은 별도.

---

## 0. 정리한 sister repos (`~/core/`)

직접 family + 그 외 60+ sub-projects. 본 brainstorm 은 hexa-bio 의 5 axes (RIBOZYME / VIROCAPSID / NANOBOT / WEAVE / QUANTUM) 와의 connection 가능성 spot 만.

| repo | role / 1-line | connection priority |
|------|---------------|--------------------|
| sim-universe | virtual universe + QRNG + qpu_bridge — Apache 2.0, 11 modules, ~17.8k LoC | **HIGH ★ direct sister** |
| anima | consciousness + Φ ratchet + IIT 4.0 + 1030 laws — MIT, Python 3.14 | **HIGH** (Φ for biology) |
| canon | 225 AI techniques + chip + crypto/OS/display — MIT, biology canonical | **HIGH** (existing consumer) |
| nexus | 216 lenses + OUROBOROS evolution + 5-phase singularity | **MED-HIGH** (bio lenses) |
| hexa-lang | self-hosted 100% .hexa runtime — host of our hexa native modules | **HIGH** (runtime) |
| hexa-bot | 4-verb robot substrate (ROBOTICS/TRANSPORT/AUTOMATION/DOG_ROBOT) | LOW (different domain) |
| hexa-brain | neural EEG + closed-loop BMI substrate | **HIGH** (RIBOZYME senolytic axis) |
| hexa-cern | particle accelerator (100 MeV ~ 1 GeV/m) | MED (quantum chemistry adjacency) |
| hexa-chip | 28-verb semiconductor (photonic / 3D / consciousness-chip) | MED (quantum chip backend) |
| hexa-codex | 17-verb AI knowledge substrate | MED (orchestration) |
| hexa-antimatter | antimatter factory + PET cyclotron | LOW-MED (radio-pharmaceutical) |
| airgenome | 60 bytes / 6 axes genome representation | MED (genome) |
| papers | Zenodo collection of all dancinlab papers | LOW (publication target) |
| orpheus | Bitcoin puzzle solver | LOW (off-domain) |
| wraith-wallet / ghost | settlement / opsec | LOW (off-domain) |

---

## 1. sim-universe ★ direct sister

### 1.1 wifi already

sim-universe 의 **qpu_bridge** module 이 우리 cycle 1 (docs/qpu_bridge_bio_application.md 의 §2-§5) 의 source! 즉 우리 hexa-bio quantum 작업이 sim-universe 의 bio-domain spinoff.

sim-universe 11 modules:
1. anu_time τ-clock — Lorentz-metric scalar field
2. multiverse interferometer — KS-test + mutual-info (M=15, T=500)
3. qpu_bridge — VQE-H2 + ANU noise model
4. ouroboros QRNG — perturbation pipeline
5. Bostrom test harness — pre-registered statistical tests
6. Gödel-Q mutator — self-rewriting AST
7. (and 5 more)

### 1.2 흡수 가능 connections

A. **multiverse interferometer for ribozyme variants** — M=15 parallel "mini-worlds" → 15 parallel ribozyme sequence variants 평가. KS-test on k_cat 분포 / 활성도 분포. mutual-info on σ(6)=12 catalytic core conservation. RIBOZYME C2 cells 의 ensemble selection.

B. **Gödel-Q mutator on ansatz parameters** — VQE 의 θ optimization 을 self-rewriting AST 로. 우리 NM 대신 Gödel-Q 의 mutation + verify-gate 패턴. F-Q-* falsifier 의 self-mutation 가능성.

C. **ouroboros QRNG → multi-restart seed source** — 우리 sweep 의 seed_offsets 를 sim-universe 의 ouroboros pipeline 으로 (현재 hardcoded explicit seeds). more entropy diversity.

D. **Bostrom test harness for hexa-bio falsifiers** — 우리 F-Q-1, F-Q-2 등 falsifier 들을 Bostrom test 의 pre-registered statistical test 로 record. cross-cycle audit.

### 1.3 우선순위

A (multiverse for ribozyme) — RIBOZYME axis 에 직접 적용 가능. 별도 cycle.

---

## 2. anima — consciousness + Φ ratchet

### 2.1 흡수 가능

A. **biological Φ measurement** — anima 의 Φ ratchet (IIT 4.0) 을 RIBOZYME / VIROCAPSID kinetic intermediates 에 적용. n=6 lattice 의 φ(6)=2 axis 가 binary 인데, Φ_bio 가 그것의 continuous extension 가능. ribozyme 의 4-state ladder (substrate / TS / cleaved / released) 가 Φ 측정의 4-element subsystem.

B. **PureField repulsion → cage assembly** — anima 의 PureField 가 repulsion-field 기반 dynamics. VIROCAPSID 의 cage_assembly_simulation 의 K_CLOSE/K_OPEN 의 alternative 모델로 PureField 적용 가능.

C. **1030 laws → ribozyme design rules** — anima 의 1030 laws collection 의 일부가 분자 design 에 적용 가능. specific subset 식별 cycle 필요.

### 2.2 우선순위

A (Φ_bio measurement) — RIBOZYME/VIROCAPSID 의 새 falsifier 후보. cycle 가능.

---

## 3. canon — 225 AI techniques + biology canonical

### 3.1 already deeply connected

hexa-bio 가 n6 의 `domains/biology/` symlink consumer. 이미 cross-repo SSOT. memory feedback_cross_repo_canonical.

### 3.2 흡수 가능 (biology 외)

A. **n6/cognitive → drug-target VQE 의 cognitive 측면** — n6 cognitive domain 의 일부 (예: signal processing, decision theory) 가 active-site VQE 의 ranking algorithm 에 적용.

B. **n6/chip → quantum hardware backend** — 우리 quantum (Aer simulator) 이 future 에 real QPU 로 elevated. n6 chip domain (specifically photonic / quantum) 이 그 backend 의 architecture.

C. **n6/crypto → secret-chain integration** — qmirror 의 secret-chain (ANU_KEY_*) 이 n6 crypto domain 의 instance.

### 3.3 우선순위

각 cross-domain integration 은 별도 큰 작업. n6 자체의 cycle 에서 진행 (cross-repo SSOT 규칙).

---

## 4. nexus — 216 lenses + OUROBOROS

### 4.1 흡수 가능

A. **bio-lenses subset** — 216 lenses 중 bio-related 것들 (folding / dynamics / kinetics 등) 을 우리 hexa-bio falsifier 와 매칭. cross-lens evidence aggregation.

B. **OUROBOROS evolution → mutator pattern** — sim-universe Gödel-Q 와 같은 패턴. nexus 의 OUROBOROS 가 더 큰 evolution framework.

C. **5-phase singularity cycle → drug discovery pipeline 5-stage** — 우리 review §14 의 drug-discovery pipeline 4-stage 가 nexus 의 5-phase 와 isomorphic 가능성. cross-cycle aware.

### 4.2 우선순위

A (lens matching) — 자동 가능, 별도 cycle.

---

## 5. hexa-lang — runtime host

### 5.1 already

quantum/module/quantum.hexa + external_pilot_runner.hexa + tests/test_quantum.hexa 가 hexa-lang runtime 위에서 작동. 직접 sister.

### 5.2 upstream proposals (cycle 51 §2)

`stdlib/external_pool.hexa` — long-lived subprocess + JSON request loop. 우리 quantum_aer_pool.py 의 hexa native equivalent. RFC-001 land 시 우리 quantum/module/ 가 그것을 사용.

---

## 6. hexa-brain — neural EEG / BMI

### 6.1 흡수 가능

A. **RIBOZYME senolytic ↔ neural inflammation marker** — RIBOZYME C2 cell senolytic (SASP IL-6 등) 의 target mRNA 가 neural aging biomarker. hexa-brain 의 EEG marker → senolytic ribozyme target.

B. **neural folding / protein → BMI 의 protein-based electrode** — 단백질 design pipeline (RFdiffusion + ProteinMPNN + ESMFold) 의 응용 = neural electrode 표면 단백질 코팅.

### 6.2 우선순위

A (senolytic ↔ neural marker) — RIBOZYME C2 cell δ (senolytic) 의 새 evidence source.

---

## 7. hexa-cern — particle accelerator

### 7.1 흡수 가능

A. **VQE 의 Standard Model 확장** — H2 / LiH 의 chemistry VQE 가 hexa-cern 의 particle physics simulation 으로 확장. Higgs / Z-boson 의 toy VQE.

B. **antimatter chemistry adjacency** — hexa-antimatter 와 함께. positron-induced ionization → drug pharmacokinetics.

### 7.2 우선순위

LOW-MED. 직접 hexa-bio bio application 보다 quantum chemistry 의 더 일반화.

---

## 8. hexa-chip — semiconductor

### 8.1 흡수 가능

A. **photonic / quantum chip → real-QPU backend** — 우리 quantum (현재 Aer simulator) 이 hexa-chip 의 photonic chip 위에서 실제 양자 회로 실행. Phase B6 후보.

B. **consciousness-chip ↔ Φ_bio** — anima Φ 와 연결. neural chip 의 hexa-bio 측 application.

### 8.2 우선순위

MED. quantum chemistry 의 hardware backend 로 elevation.

---

## 9. hexa-codex — AI knowledge

### 9.1 흡수 가능

A. **17-verb AI orchestration** — hexa-codex 의 ops verb 들이 우리 drug-discovery pipeline (scGPT → Boltz-2 → DiffSBDD → hexa-bio Q) 의 stage transitions 자동화.

B. **safety verb → wet-lab validation gate** — codex 의 safety verb 가 hexa-bio 의 wet-lab handoff 결정 (synbio cross-repo SSOT 와 연결).

### 9.2 우선순위

MED. AI 자동화 layer 가 우리 5-axis pipeline 위 의 orchestration.

---

## 10. hexa-antimatter — radio-pharmaceutical adjacency

### 10.1 흡수 가능

A. **PET cyclotron → drug pharmacokinetics** — drug-target VQE 결과 의 in-vivo distribution 측정 = PET imaging. hexa-antimatter 의 cyclotron 이 isotope (F-18 등) 생산.

### 10.2 우선순위

LOW-MED. drug-discovery pipeline 의 wet-lab stage 후속.

---

## 11. airgenome — 60 bytes / 6 axes genome

### 11.1 흡수 가능

A. **genome representation 표준화** — airgenome 의 60-byte schema 가 우리 RIBOZYME C2 cell candidate 의 compact representation. cross-repo schema.

### 11.2 우선순위

MED. genome 표현 의 표준화 — bio 가 host axis.

---

## 12. papers — Zenodo publication

### 12.1 흡수 가능

A. **F-Q-* + F-RB-* + F-VIR-* 등 hexa-bio falsifier evidence Zenodo paper** — 우리 .roadmap.* 의 falsifier closure record 를 Zenodo DOI'd paper 로 publication.

### 12.2 우선순위

LOW (paper publication 은 user decision).

---

## 13. 정리 — 가장 ROI 높은 다음 cycle 후보

(brainstorm closure 시점, 사용자 결정 영역 별 분류):

### Tier 1 — 즉시 진행 가능 (사용자 결정 약함, ML/code path)

- **sim-universe multiverse interferometer ↔ RIBOZYME variant ensemble** (§1.2.A)
- **anima Φ_bio measurement on RIBOZYME 4-state ladder** (§2.1.A)
- **nexus 216 lenses ↔ hexa-bio falsifier matching** (§4.1.A)

### Tier 2 — 새 wet-lab evidence 의존 (큰 cycle, 사용자 결정 강함)

- **hexa-brain neural marker ↔ senolytic RIBOZYME target** (§6.1.A)
- **hexa-chip photonic ↔ real-QPU backend** (§8.1.A)
- **hexa-antimatter PET cyclotron ↔ drug pharmacokinetics** (§10.1.A)

### Tier 3 — schema 표준화 / orchestration

- **airgenome 60-byte ↔ RIBOZYME candidate compact** (§11.1.A)
- **hexa-codex AI orchestration ↔ drug-discovery pipeline** (§9.1.A)

### Tier 4 — publication

- **Zenodo paper from F-* closure rows** (§12.1.A)

---

## 14. raw#10 honest C3

1. 본 brainstorm 은 **README + 1-line 1-paragraph** 수준. 각 connection 의 진정한 흡수 가능성 검증은 별도 cycle (Tier 1 부터 시작 권장).
2. **off-domain repos** (orpheus / wraith-wallet / ghost) 는 connection priority LOW 로 marked. 미래 연관 가능성 (예: Bitcoin 이 wet-lab funding 으로 흐름) 은 가능하지만 immediate ML/code path 없음.
3. **hexa family** 의 다수가 **spec-first, working impl 적음** (예: hexa-antimatter 0/3 wired, hexa-cern 3-pillar 초기). 즉 "connection 가능" 이 곧 "code-ready" 의미 아님.
4. **canon connection (§3)** 은 "이미 connected" 상태 — 본 brainstorm 의 "discovery" 가 아니라 "expansion" 영역.
5. **사용자 cron `97d9422c`** 는 hexa-bio session-bound. 다른 repo session 진입 시 본 docs 가 reference 로 사용 가능 (memory `feedback_cross_repo_canonical` 규칙 — actual edits 는 그 repo 자체 session 에서).

---

## 15. 다음 cycle 진입점

cron 자동 진행:
- Tier 1 의 § 1.2.A (sim-universe multiverse ↔ RIBOZYME) 가장 단순. 별도 cycle 작성.
- 또는 docs 의 specific connection deepening (Tier 2-3 한 entry 의 detail).

사용자 결정:
- Tier 2 entries (wet-lab adjacency) 의 actual cycle 개시.
- Tier 4 publication path.

cron `97d9422c` 활성. 다음 fire 시 Tier 1 § 1.2.A 진행 (자동) 또는 별 cycle.
