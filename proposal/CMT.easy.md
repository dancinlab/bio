<!-- @agent-directive: AGENT-UPDATE-DIRECTIVE
status: LIVING-DOC
action: 이 문서는 CMT 캠페인 진행에 따라 갱신해야 함 (snapshot 아님)
update_when:
  - ABFE 실ΔG 결과 도착 (summer HDAC6 / aiden GJB1 / SARM1·MFN2 production)
  - 후보 신규성 게이트 판정 변경 (d_novel_only)
  - 후보 status 변경 (DESIGN → SMOKE → production → gate)
ssot:
  - ARCHITECTURE.json → hexa-bio-archive / flagship_CMT (verification_status·free_abfe_campaign·gjb1_fold_rescue·research_grounding)
  - hexa-bio-archive/.roadmap.disease_cmt_specific  (후보 10종 원본 정의)
  - exports/CMT/  (RESULT.md·research/REPORT.md·gjb1/·RESULT_repocket.md)
rule: 후보 status·ΔG·신규성은 위 SSOT가 1차 출처. 이 easy.md는 사람용 미러 — SSOT 갱신 시 함께 갱신.
honesty: 전 ΔG scaffold-placeholder SMILES 기반(약물후보 아님)·임상 미검증·논문 미발행(d_paper_gate). d6 정직.
-->

# 🦶 CMT — 발끝부터 망가지는 유전성 신경병, 후보 전체 설계판

> **CMT = 샤르코-마리-투스병**(Charcot-Marie-Tooth) · 가장 흔한 유전성 말초신경병(2,500명당 1명), **승인된 근본 치료제 0**.
> 🤖 **이 문서는 살아있는 설계판(LIVING-DOC)** — 위 `@agent-directive` 참조. 후보 status·ΔG·신규성은 진행에 따라 **갱신 대상**.
> 모든 수치는 in-silico(계산)·문헌 기반이며 **임상은커녕 wet-lab 검증도 아직**입니다(정직 d6).

---

## 🦶 CMT — "발끝부터 시드는 병"

- **하는 일(병)**: 다리·손의 말초신경 절연(미엘린)/축삭이 서서히 망가져 **발·종아리 근육이 마르고**(요족·foot drop) 걸음·손놀림이 둔해지는 유전병.
- **비유**: 집 안 **전선 피복이 끝쪽부터 닳아** 신호가 새고 약해져 가장 먼 방(발끝)부터 불이 안 들어옴.

```
정상 신경                    CMT 신경
─────────────              ─────────────
 ▣▣▣ 피복 멀쩡   →          ▣▣░ 끝쪽 피복 닳음
 ⚡ 신호 쌩쌩      →          ⚡··· 신호 약함·느림
```

---

## 후보 10종 전체 (hxq-cmt-*) — 설계판

> 상태 범례: 🟢 lead(진행 가치 최고) · 🟡 진행/큐 · 🔴 막힘(기술적 fail) · ⚪ ABFE N/A(모달리티)
> 신규성 범례: **PARTIAL**(일부 novel) · 🌊 **레드오션**(경쟁약 존재·신규성 낮음 — *실패 아님*, 과학은 정상) · 🟠 투기적/플랫폼
> ABFE = "약이 표적에 얼마나 붙나" 무료 계산(OpenMM). 소분자만 해당.

| # | 후보 id | CMT 아형 | 표적·전략 | 모달리티 | 이번 세션 status | 신규성(d_novel_only) |
|---|---------|---------|-----------|---------|----------------|--------------------|
| 1 | `hxq-cmt-gjb1-001` | CMT1X | Cx32 변이-선택 fold 샤페론 | 소분자(척수강내) | 🟢 **lead** · L143P TM1/TM4 cryptic pocket · aiden 막ABFE **빌드벽 돌파**(addMembrane 폐기→packmol 오프라인막 51,860 atoms·분리-λ SMOKE NaN 0 PASS)·placeholder 막ABFE anchor 완료 dG_bind=−48.82(method anchor·결합세기 아님)·실분자 K≥3(CX32L8/L14/L1) 자동발사중 | **PARTIAL(유일 열린축)** — Cx32 직접샤페론 미보고, 기전은 Cx26 기출판 |
| 2 | `hxq-cmt-hd6-001` | CMT1·2·2F | HDAC6 말초한정 non-hydroxamate | 경구 소분자 | ✅ ABFE **완료 dG_bind=−4.13** kcal/mol(scaffold·K=1·method-grade) | 🌊 레드오션 (AGT-100216 Ph1) |
| 3 | `hxq-cmt-sar1-001` | CMT2 축삭 | SARM1 reversible 억제 | 경구 소분자 | ✅ ABFE **완료 dG_bind=−7.05** kcal/mol(교정 ARM-allosteric 7NAL·scaffold·K=1·method-grade) | 🌊 레드오션 (ASHA-624 등) |
| 4 | `hxq-cmt-mfn2-001` | CMT2A R94Q | MFN2 corrector(dominant-neg 안정화 해제) | 경구 소분자 | ✅ ABFE **완료 dG_bind=+2.11** kcal/mol(교정 HR1-HR2·양수=약결합·4종 최약·scaffold·K=1·method-grade) | 🌊 레드오션 (MiM111/MASM7) |
| 5 | `hxq-cmt-clc1-001` | 증상(근력) | 골격근 ClC-1 state-dep partial blocker | 경구 소분자 | 🔴 SMOKE BLOCKED(막 없음→NaN) · 막FEP 필요 | 🌊 레드오션 (NMD670 Ph2a) |
| 6 | `hxq-cmt-pmp22-001` | CMT1A(중복) | PMP22 3'UTR allele-선택 knockdown | siRNA(지방산/SQ conjugate) | ⚪ ABFE N/A · design-audit PASS | 🌊 레드오션 (DTx-1252/Novartis) |
| 7 | `hxq-cmt-pmp22-002` | CMT1A·1E·HNPP | PMP22 splice-조절 ASO | gapmer ASO | ⚪ ABFE N/A · design-audit PASS | 🌊 레드오션 (Ionis-Svaren PoC) |
| 8 | `hxq-cmt-nrg1-001` | CMT1A(미엘린) | NRG1-III/ErbB partial agonist | Fc-fusion(WEAVE) | ⚪ ABFE N/A · design-audit PASS(ErbB1/4 cross 감사) | 🟠 투기적(미보고이나 미검증) |
| 9 | `hxq-cmt-fig4-001` | CMT4J(FIG4 LoF) | AAV9 FIG4 유전자 치환 | 유전자치료(VIROCAPSID) | ⚪ ABFE N/A · design-audit PASS | 🌊 레드오션 (ELP-02) |
| 10 | `hxq-cmt-nano-001` | CMT1·2(modular) | Schwann-perineurium 나노전달체 | PLGA-PEG 나노(NANOBOT) | ⚪ ABFE N/A · design-audit PASS | 🟠 플랫폼(전달체) |

> (+ `hxq-cmt-mfn2-002` = MFN2 R94Q ADAR 편집 가이드RNA, DESIGN 후속) · HNPP overshoot·심독성·난청 등 **부작용 회피 가드**는 각 후보 설계에 박혀 있음(roadmap §2).

---

## ★ lead 후보 — GJB1-RESCUE "구겨진 자리에만 생기는 손잡이"

- **하는 일**: CMT1X 변이로 **잘못 접힌 Cx32**를 작은 분자가 붙들어 다시 접히게(약리적 샤페론).
- **비유**: 멀쩡한 상자엔 손잡이가 없는데, **찌그러진 상자에만 쥘 홈이 패임** → 그 홈에 맞는 쐐기(약)를 끼움.
- **계산이 본 것(라운드1, 무료)**: 실제 인간 Cx32(7ZXM 2.14Å) · 최강 불안정화 **L143P** · **L143P서만 열리는 434ų 숨은 포켓**(TM1/TM4) · 도킹서 4-PBA류>삼투물질(올바른 판별).
- **신규성 PARTIAL**: 기전은 형제 Cx26서 기출판(VRT-534) — **방어가능 novel = Cx32 L143P 숨은 포켓 최초 식별**. ⛔과대주장 금지(L143=TM3·4-PBA는 앵커).
- vs 경쟁: 다들 유전자 통째 교체. 우리는 **변이가 만든 홈**을 노림 → d_novel_only 통과 유일 축.

---

## 정직한 현재 상태 (d6 · 사다리)

```
[✔] 후보 10종 설계 + 부작용가드 + design-audit
[✔] 소분자 4종 구조해결·SMOKE (HDAC6·SARM1·MFN2 PASS / ClC-1 BLOCKED)
[✔] GJB1 라운드1(구조·ΔΔG·포켓·도킹) + 신규성 PARTIAL
[~] ABFE 실ΔG  ← 진행중 (summer HDAC6 본샘플링 · aiden GJB1 막ABFE)  ※실ΔG 0개
[ ] wet-lab(trafficking 복구·결합 실측)  ← 미착수
[ ] 임상  ← 한참 멀음
```

- **실ΔG는 아직 0개** — summer/aiden GPU에서 진행 중. 이 표의 status는 결과 도착 시 **갱신 대상**(상단 @agent-directive).
- 전 SMILES는 **scaffold placeholder**(pharmacophore 좌표지 약물후보 아님). VQE 2e/2o·4e/4o는 chem-acc 검증됨(roadmap §VQE)이나 결합력·임상과는 별개.
- CMT는 **승인 치료 0** — 의미는 있으나 어떤 후보도 "성공/발견"으로 박제 금지(신규성 PARTIAL 이하).

---

## 출처 / 자세히 (SSOT)

- 설계 SSOT: `ARCHITECTURE.json` → `hexa-bio-archive / flagship_CMT` (verification_status · free_abfe_campaign · gjb1_fold_rescue/novelty_verdict · research_grounding)
- 후보 10종 원본: `hexa-bio-archive/.roadmap.disease_cmt_specific`
- 계산 산출물(raw): `exports/CMT/` (RESULT.md · research/REPORT.md · gjb1/NOVELTY.md · RESULT_repocket.md)
- 정식 논문: **아직 없음** — terminal 검증(d_paper_gate) 통과 전이라 PDF 미발행. easy+논문 통합 = 게이트 통과 시 이 슬러그에 발행.
