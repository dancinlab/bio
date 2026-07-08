# SENOLYX-AG — wet-lab 핸드오프: make-or-break ρ 측정 프로토콜

> in-silico 발견은 닫혔다(종결식 + 설계 + ~19× 선택성, d1). 남은 단 하나의
> make-or-break 는 인식 3축의 **교차세포 상관계수 ρ** — 추정상 낮으나(0.1–0.3)
> **미측정**. 이 한 실험이 SENOLYX-AG 의 곱셈적 선택성 전제를 확정/반증한다(d5 downstream).

## 0. 한 줄 요약 (왜 이 실험인가)

AND-gate 선택성 `S_total = ∏ Sᵢ` 는 축이 **독립**일 때만 곱해진다. 세 인식축
(uPAR / DPP4 / SA-β-gal)이 한 세포 안에서 함께 켜지면(ρ→1) 게이트는 단일축으로
붕괴한다. S1 모델: 3축은 ρ≤~0.3 에서 robust(box-min 4.34×), ρ↑이면 약화.
→ **세 마커의 단일세포 동시발현 상관 ρ 를 직접 재면 가부가 결정된다.**

## 1. 가설 / 사전등록 falsifier (논문 H3)

- **H3:** 세 인식축은 노화세포에서 통계적으로 독립에 가깝다
  (pairwise ρ ≲ 0.3) → 곱셈적 선택성 성립.
- **PASS:** 세 pairwise ρ 모두 ≤ 0.3 (특히 PLAUR↔DPP4, 예측 worst 0.30).
- **FALSIFY (closed-negative):** 어느 pair든 ρ ≥ 0.6 → 그 두 축은 사실상 한 축,
  3축 설계 무의미 → 2-기능축으로 재설계 또는 캠페인 종결.
- **예측(in-silico, 검증대상):** ρ(DPP4↔GLB1)≈0.10 · ρ(PLAUR↔GLB1)≈0.20 ·
  ρ(PLAUR↔DPP4)≈0.30 (조절허브 NF-κB / STAT1·HNF / TFEB 분리 근거).

## 2. 실험 설계 — 3색 flow cytometry (단일세포 공동발현)

### 2.1 세포 모델 (≥2 노화 유도 × 정상 대조)
- 1차 인간 fibroblast (dermal HDF 또는 gingival/PDL — PERIO 가 SENOLYX-AG FIRST 표적).
- 노화 유도: (a) replicative senescence (late passage), (b) RAS-OIS 또는 DNA-damage
  (etoposide/IR) — **유도 방식별로 ρ 가 다를 수 있으니 ≥2종**.
- 대조: 동일 계대 quiescent (저혈청 G0) + proliferating.
- senescence 확인: p16/p21 + SA-β-gal 양성, 증식정지(EdU−).

### 2.2 3색 패널 (동시 측정)
| 축 | 마커 | 시약(예) | 채널 |
|---|---|---|---|
| 표면 1 | uPAR / PLAUR | anti-uPAR-APC | APC |
| 표면 2 | DPP4 / CD26 | anti-CD26-PE | PE |
| 리소좀 효소 | SA-β-gal | C₁₂FDG (형광 β-gal 기질) | FITC |
+ viability (DAPI/7-AAD) + p16/p21 (고정·투과 시) 보조.

C₁₂FDG 전처리: bafilomycin A1 으로 리소좀 pH 상승 → SA-β-gal 신호 표준화(노화 특이성↑).

### 2.3 측정 & 분석 (핵심 산출 = ρ)
1. 단일세포 형광강도 3채널 동시 취득 (≥10⁴ live cells/조건).
2. compensation/spillover 보정(single-stain 대조 필수 — 형광 누설이 ρ 를 인위적으로 올림).
3. arcsinh 변환 후 **pairwise cross-cell 상관** 계산:
   ρ(uPAR,DPP4) · ρ(uPAR,SA-βgal) · ρ(DPP4,SA-βgal) — Spearman + Pearson 둘 다.
4. 삼중양성 분율 P(A∧B∧C) vs 독립가정 곱 P(A)P(B)P(C) 비교 → 곱셈성 직접 검정.
5. 유도방식·세포종류별로 ρ 안정성 확인.

### 2.4 직교검증 (선택, 강화)
- scRNA-seq (PLAUR/DPP4/GLB1 공발현 ρ) 또는 3색 imaging(공간 공동국재) 로 flow ρ 교차확인.

## 3. 판정 → 다음 행동 (decision tree)
```
ρ 측정
├─ 세 pair 모두 ≤0.3      → ✅ 곱셈성 확정 → SENOLYX-AG 빌드 GO (galacto-PROTAC 합성)
├─ PLAUR↔DPP4 만 0.3~0.6  → 🟠 표면축 1개를 GLB1-직교 마커로 교체(DPP4 유지·uPAR 대체)
└─ 어느 pair ≥0.6        → 🔴 closed-negative: 3축 무의미 → 2-기능축 재설계 or 종결
```

## 4. 후속 wet-lab (ρ PASS 이후·d5)
순서: galacto-caged BCL-xL→CRBN PROTAC 합성 → (S0) caged warhead 결합유지 확인
→ in-vitro 노화 fibroblast 선택적 사멸(예측 ~19×) → PERIO 국소전달 in-vivo
(CD81+ subtype 청소 → η_neo 기능 게이트: ≥+1mm CAL/bone fill).

## 5. provenance
- 설계 SSOT: `state/senolyx-novel-andgate/SENOLYX_AG_DESIGN_SPEC.md`
- S1 모델: `state/senolyx-novel-andgate/s1_andgate_index.py`
- ρ 추정 근거: `state/senolyx-novel-andgate/rho-estimate/FINDINGS.md`
- 논문: `PAPERS/senolyx-ag-selectivity/main.tex` (§9 make-or-break ρ)
- ARCHITECTURE: `campaigns/SENOLYX/SENOLYX-AG`
