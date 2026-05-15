# LVAD — Novel-급 hexa-bio 진입 지점

> **Scope**: hexa-bio 5축(QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID)이
> LVAD(좌심실보조장치) 임상 미해결 문제에 in-silico 분자 sandbox로 기여할 수 있는
> novel-급 지점 정리. 카테고리 (a) 분자 설계 후보 좁히기 단계 전용.
>
> **Out of scope**: LVAD 장치(임펠러·드라이브라인·컨트롤러) 자체의 기계공학·유체역학.
> wet-lab 검증·전임상·임상 — 전부 `CLOSURE_RESIDUAL_BACKLOG.md §0` 밖.
>
> **Governance anchor**: `g1_real_limits_first` · `g8_in_silico_only` ·
> `f2_wet_lab_clinical_claim_from_in_silico` (AGENTS.tape §3–§5).

---

## §1 LVAD 임상 미해결 문제 (open problems)

| 문제 | 왜 미해결 |
|---|---|
| **후천성 폰빌레브란트 증후군 (aVWS)** | 펌프 고전단응력이 vWF A2 도메인을 늘려 ADAMTS13가 절단 → 대형 멀티머 소실 → 위장관 출혈/혈관이형성. **승인약 0개**. LVAD 환자 >75%. |
| **펌프 혈전 ↔ 전신 출혈 trade-off** | 항응고제 진하면 뇌출혈, 묽으면 펌프 혈전. 좁은 치료창. |
| **드라이브라인 감염** | 경피 케이블 biofilm. LVAD 사망원인 상위. |
| **심근 회복 후 LVAD weaning** | 일부 환자(~5–15%) LVAD 거치 중 심장 회복. 누구·어떻게는 불명. |
| **우심실 부전 (post-LVAD RV failure)** | LVAD 후 30%. 예측·예방 수단 없음. |

## §2 시나리오 우선순위 (real-limits-first)

| 시나리오 | Real limit (`g1` 앵커) | hexa-bio novel 기여 | 임팩트 |
|---|---|---|---|
| **② A2 stabilizer** | ADAMTS13 절단 동역학 · A2 unfolding ΔG | QUANTUM (VQE) | 🔥 white space — 약 0개 |
| **① Shear-gated nanobot** | LVAD shear 70–150 dyn/cm² · 혈관계 평균 1–10 | NANOBOT + QUANTUM | 🔥 spatial specificity가 진짜 novel |
| **③ AAV BTR 유전자치료** | AAV9 cargo 4.7kb · 심근 transduction <30% | VIROCAPSID + RIBOZYME | 🌟 paradigm shift 가능성 |
| **⑥ WEAVE coating** | 표면 ζ-potential · 혈장단백 흡착 | WEAVE | 🌱 가장 사변적 |

## §3 시나리오 상세

### ② vWF A2 도메인 shear-unfolding stabilizer (QUANTUM)
> 전단응력으로 늘어난 vWF A2 도메인을 ADAMTS13 절단으로부터 보호하는 소분자 chaperone.

- **표적 문제**: aVWS — LVAD·ECMO·대동맥협착증 공통. 승인약 0개.
- **5축 기여**:
  - QUANTUM: A2 unfolding intermediate 양자화학 계산 → chaperone 후보 결합에너지 VQE (`quantum/pocket_vqe_orchestrator`).
  - 보조: classical MD로 shear-induced unfolding pathway 확보 후 QM 정밀화.
- **Novelty rationale**: 표적이 명확한데 약이 없는 깨끗한 white space.
- **정직한 한계**: A2 unfolding intermediate 구조 미확정 — docking 어려움이 학계 통설. hexa-bio 기여는 후보 좁히기까지.

### ① Shear-gated 치료 전달 시스템 (NANOBOT × QUANTUM)
> LVAD 펌프 고전단(>50 dyn/cm²) 구역에서만 페이로드를 방출하는 나노 디바이스.

- **표적 문제**: 펌프 혈전은 막되, 전신 출혈은 일으키지 않기. 공간적으로 항응고 작용을 가두기.
- **5축 기여**:
  - NANOBOT: shear-sensor 액추에이터 운동학 (`hexa-nanobot/`, `_python_bridge/module/nanobot_actuation_simulation`).
  - QUANTUM: 페이로드 후보(FXI 억제제 등) 활성부위 VQE.
- **Novelty rationale**: shear-responsive nanoparticle 자체는 있으나, **LVAD 임펠러 고전단 구역 = 명시적 트리거**로 설계한 작업은 거의 없음.
- **정직한 한계**: 펌프 내 체류시간(<1초)에서의 트리거 응답속도 — 실제 검증은 wet-lab.

### ③ AAV 기반 LVAD weaning 유전자치료 (VIROCAPSID × RIBOZYME)
> LVAD 거치 중 심근 회복을 유도해 LVAD를 제거(explant)하는 Bridge-to-Recovery 패러다임.

- **표적 문제**: 영구장착(DT)을 회복까지의 다리(BTR)로 전환.
- **5축 기여**:
  - VIROCAPSID: AAV9 / MyoAAV / AAVMYO 캡시드 조립 안정성 (`hexa-virocapsid/`, `_python_bridge/module/virocapsid_pdb_corpus`).
  - RIBOZYME: `LMNA` / `TTN` / `MYH7` 변이 교정 가이드 MFE + off-target (`hexa-ribozyme/`, `_python_bridge/module/ribozyme_mfe_nussinov`, `ribozyme_off_target_screen`).
  - 카고 후보: SERCA2a · 정상형 MYBPC3 · β-ARKct.
- **Novelty rationale**: 기존 심부전 유전자치료(CUPID·AGENT-HF)는 LVAD 미장착군. **LVAD 후부하 감소 + 유전자치료 시너지**는 미답지.
- **정직한 한계**: AAV9 카고 4.7kb 상한 · 심근 transduction <30% · 면역원성 — 모두 wet-lab 경계.

### ⑥ Hemocompatible cage coating (WEAVE)
> LVAD 유입 캐뉼라 표면의 기하학적 자기조립 항혈전 코팅.

- **표적 문제**: 펌프 표면 혈장단백 흡착·혈전 nucleation.
- **5축 기여**: WEAVE Caspar-Klug 격자 응용 → 표면 단위셀 설계.
- **Novelty rationale**: WEAVE 축의 유일한 LVAD 연결점. 가장 사변적.
- **정직한 한계**: 표면 ζ-potential·혈장단백 흡착은 in-vitro/in-vivo 영역. hexa-bio는 기하 검증까지.

## §4 정직 경계 (governance compliance)

- 위 모든 시나리오는 hexa-bio **C2 in-silico simulator+metadata 일관성 검증** 범위 (`g8_in_silico_only`).
- C2 PASS = "이 분자/캡시드/리보자임 설계가 simulator 내부에서 자기일관적" — wet-lab 효능·임상 효과 주장 아님 (`f2`).
- 가치 사슬:
  ```
  hexa-bio (in-silico 후보 좁히기)
        ↓
  wet-lab 검증 · 학술 협력 (USER_ACTION_REQUIRED.md §Phase 1)
        ↓
  전임상 → IND → Phase I/II/III  (CLOSURE_RESIDUAL_BACKLOG.md §0)
  ```
- 가장 짧은 임상화 경로: **② A2 stabilizer** (표적 명확 + 승인약 0개 + 소분자, 5–10년 추정).

---

## Log

- 2026-05-16 — initial draft. §1 open problems · §2 우선순위 테이블 · §3 4개 시나리오 상세 · §4 정직 경계.
