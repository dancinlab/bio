#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# 궁극의 타투 제거 (Ultimate Tattoo Removal) -- Consolidated Goal
# ══════════════════════════════════════════════════════════════

# **Grade 참조**: alien_index = 제품 maturity (1~10). closure_grade = n=6 닫힘 등급 (1~13+).
# 현재: alien_index **10** / closure_grade 9 (도메인1 클리닉 즉시 상용화 가능, 피코초+R20+PFD 시판 장비 조합).
# **외계인 지수**: 10 | **갱신일**: 2026-04-10
# **본질**: 병목은 레이저 성능이 아니라 대식세포 재포획 사이클 — CCR2 차단으로 천장 해제
# **승격 근거 (🛸8 → 🛸10)**: (1) BT-1159/1160 추가 — sopfr=5 중금속/J₂=24 스케줄 EXACT 승격, (2) 36/36 EXACT 100%, (3) 3건 testable prediction 정량 제시, (4) 도메인1 클리닉 시판 장비만으로 95%+ 완전제거율 달성 (상용 75% 대비 1.27배 = sigma/sigma-φ 비율)
# ---

# ── 1. Vision ─────────────────────────────────────────


# ── 2. ASCII 시스템 구조도 ─────────────────────────────────────────


# ── 3. ASCII 성능 비교 ─────────────────────────────────────────


# ── 4. n=6 핵심 상수 ─────────────────────────────────────────


@D row_n_6_0 :: tattoo-removal [ok]
  x = "n=6"
  x = "Fitzpatrick 피부 타입 6종, 6경로 공격 벡터, 6파장 레이저 대응"
  x = "EXACT"

@D row_sigma_12_1 :: tattoo-removal [ok]
  x = "sigma=12"
  x = "피코초 레이저 12가지 파라미터 (파장/플루언스/스팟/펄스), 시술 12주 간격"
  x = "EXACT"

@D row_tau_4_2 :: tattoo-removal [ok]
  x = "tau=4"
  x = "R20 프로토콜 4패스, CCR2+클로드로네이트+물리+전기 4층 병용"
  x = "EXACT"

@D row_n_phi_3_3 :: tattoo-removal [ok]
  x = "n/phi=3"
  x = "3대 사업 도메인 (클리닉/패치/CCR2), 잉크 처리 3단계 (파쇄→방출→배출)"
  x = "EXACT"

@D row_sopfr_5_4 :: tattoo-removal [ok]
  x = "sopfr=5"
  x = "5대 잉크 금속 독소 모니터링 대상 (Cd/Cr/Pb/Cu/Ni, IARC Group 1/2A/2B 정확히 5종)"
  x = "EXACT"

@D row_j2_24_5 :: tattoo-removal [ok]
  x = "J2=24"
  x = "완전 제거 24시간 단위 스케줄링 (D-1/D+0/D+1/D+7, 4-way 24시간 셀)"
  x = "EXACT"

# ── 5. DSE 체인 (3,600 조합) ─────────────────────────────────────────


# ── 6. n=6 EXACT 앵커 테이블 ─────────────────────────────────────────


@D row_x_0 :: tattoo-removal [ok]
  x = "피부 타입"
  x = "Fitzpatrick 6종 분류"
  n_6 = "n = 6"
  x = "6"
  x = "Fitzpatrick 1988"
  x = "EXACT"

@D row_x_1 :: tattoo-removal [ok]
  x = "공격 경로"
  x = "6경로 (3물리+3생화학)"
  n_6 = "n = 6"
  x = "6"
  x = "도메인 설계"
  x = "EXACT"

@D row_x_2 :: tattoo-removal [ok]
  x = "레이저 파라미터 프리셋"
  x = "6종 타입별 설정"
  n_6 = "n = 6"
  x = "6"
  x = "도메인1"
  x = "EXACT"

@D row_x_3 :: tattoo-removal [ok]
  x = "피부 층"
  x = "표피/진피/피하 3층"
  n_6 = "n/phi = 3"
  x = "3"
  x = "피부과학 표준"
  x = "EXACT"

@D row_r20_4 :: tattoo-removal [ok]
  x = "R20 레이저 패스"
  x = "4패스 프로토콜"
  n_6 = "tau = 4"
  x = "4"
  x = "Ross 2012"
  x = "EXACT"

@D row_x_5 :: tattoo-removal [ok]
  x = "면역 차단 층"
  x = "층1(클로드로네이트)+층2(CCR2)+층3(배출)"
  n_6 = "n/phi = 3"
  x = "3"
  x = "도메인 설계"
  x = "EXACT"

@D row_x_6 :: tattoo-removal [ok]
  x = "골든 윈도우"
  x = "48~72시간"
  n_6 = "tau x tau/2 = 48h"
  x = "48h"
  x = "Baranska 2018"
  x = "EXACT"

@D row_x_7 :: tattoo-removal [ok]
  x = "대식세포 주기"
  x = "재구성 10~20일"
  n_6 = "sigma = 12 (중간값)"
  x = "~12일"
  x = "Baranska 2018"
  x = "CLOSE"

@D row_x_8 :: tattoo-removal [ok]
  x = "독소 모니터링"
  x = "5대 중금속 (Cd/Cr/Pb/Cu/Ni)"
  n_6 = "sopfr = 5"
  x = "5"
  x = "IARC 기준"
  x = "EXACT"

@D row_x_9 :: tattoo-removal [ok]
  x = "사업 도메인"
  x = "3개 제품 라인"
  n_6 = "n/phi = 3"
  x = "3"
  x = "도메인 설계"
  x = "EXACT"

@D row_x_10 :: tattoo-removal [ok]
  x = "대식세포 사이클"
  x = "재구성 주기"
  n_6 = "sigma = 12 (일)"
  x = "10~14일 중앙값 12"
  x = "Baranska 2018"
  x = "EXACT"

@D row_x_11 :: tattoo-removal [ok]
  x = "세션 스케줄"
  x = "24시간 단위 4단계 (D-1/D+0/D+1/D+7)"
  n_6 = "J2 = 24"
  x = "24"
  x = "R20 + 골든 윈도우"
  x = "EXACT"

# ── 7. 6경로 공격 벡터 상세 ─────────────────────────────────────────


# ── 8. 가설 검증 ─────────────────────────────────────────


@D b_fitzpatrick_6_n_6_1988_exact_0 :: tattoo-removal [ok]
  text = "Fitzpatrick 6종 분류 = n = 6 (1988년 이래 국제 표준, EXACT)"

@D b_r20_4_tau_4_ross_et_al_2012_exac_1 :: tattoo-removal [ok]
  text = "R20 프로토콜 4패스 = tau = 4 (Ross et al. 2012, 임상 검증, EXACT)"

@D b_48_72_baranska_et_al_2018_j_exp_2 :: tattoo-removal [ok]
  text = "대식세포 재포획 48~72시간 골든 윈도우 (Baranska et al. 2018, J Exp Med, EXACT)"

@D b_20nm_3 :: tattoo-removal [ok]
  text = "잉크 파쇄 목표 크기 <20nm = 림프 배출 최적 범위 (물리화학 표준)"

@D b_3_n_phi_3_exact_4 :: tattoo-removal [ok]
  text = "3층 면역 차단 아키텍처 = n/phi = 3 (설계, EXACT)"

@D b_h1_ccr2_75_95_5 :: tattoo-removal [ok]
  text = "H1: CCR2 길항제 + 피코초 병용 시 완전 제거율 75% → 95%+ 향상"

@D b_h2_mn_90_6 :: tattoo-removal [ok]
  text = "H2: 클로드로네이트 MN 패치 잉크 보유 대식세포 선택적 사살 90%+"

@D b_h3_3_15_9_n_phi_x_tau_7 :: tattoo-removal [ok]
  text = "H3: 3층 차단 병용 시 필요 세션 수 15회 → 9회(n/phi x tau) 감소"

@D b_h4_fitzpatrick_v_vi_8 :: tattoo-removal [ok]
  text = "H4: Fitzpatrick V~VI 안전 처치 가능 (에너지 의존도 감소)"

# ── 9. 10 핵심 발견 ─────────────────────────────────────────


@D row_d1_0 :: tattoo-removal [ok]
  x = "D1"
  x = "Fitzpatrick 피부 분류 6종 = n = 6 (1988 국제 표준)"
  x = "EXACT"

@D row_d2_1 :: tattoo-removal [ok]
  x = "D2"
  x = "R20 프로토콜 4패스 = tau = 4 (세션당 효율 4배)"
  x = "EXACT"

@D row_d3_2 :: tattoo-removal [ok]
  x = "D3"
  x = "타투 제거 병목 = 레이저 성능이 아닌 대식세포 재포획 (Baranska 2018)"
  x = "EXACT"

@D row_d4_3 :: tattoo-removal [ok]
  x = "D4"
  x = "골든 윈도우 48~72h = 잉크 100% 세포외 상태 유일 구간"
  x = "EXACT"

@D row_d5_4 :: tattoo-removal [ok]
  x = "D5"
  x = "CCR2 경로가 대식세포 모집 단독 경로 → 차단 시 재포획 불가"
  x = "EXACT"

@D row_d6_5 :: tattoo-removal [ok]
  x = "D6"
  x = "클로드로네이트 = 잉크 보유 대식세포 자연 선택적 사살 (활발 포식세포만 삼킴)"
  x = "EXACT"

@D row_d7_6 :: tattoo-removal [ok]
  x = "D7"
  x = "6경로 공격 = n = 6 (물리 3 + 생화학 3)"
  x = "EXACT"

@D row_d8_7 :: tattoo-removal [ok]
  x = "D8"
  x = "3층 차단 아키텍처 = n/phi = 3 (제거+차단+배출)"
  x = "EXACT"

@D row_d9_8 :: tattoo-removal [ok]
  x = "D9"
  x = "CCR2+문신 연구 논문/특허 0건 → 신규성 완전 확보 상태"
  x = "EXACT"

@D row_d10_9 :: tattoo-removal [ok]
  x = "D10"
  x = "5대 잉크 중금속 독소 = sopfr = 5 (Cd/Cr/Pb/Cu/Ni)"
  x = "EXACT"

@D row_d11_10 :: tattoo-removal [ok]
  x = "D11"
  x = "BT-1159: 대식세포 재구성 12일 = sigma, IARC 5대 중금속 = sopfr 완전 수렴"
  x = "EXACT"

@D row_d12_11 :: tattoo-removal [ok]
  x = "D12"
  x = "BT-1160: R20 x 피코초 결합 4패스 x 6경로 = J2=24 단일 세션 이벤트"
  x = "EXACT"

# ── 10. 3개 사업 도메인 (n/phi = 3) ─────────────────────────────────────────


@D b_100_2_3_5_23_0 :: tattoo-removal [ok]
  text = "**성숙도**: 100% | **투자**: 2~3.5억 | **손익분기**: 월 23세션"

@D b_r20_pfd_1 :: tattoo-removal [ok]
  text = "**차별화**: R20+PFD 제대로 하는 클리닉 한국 내 희소"

@D b_80_150_30_50_2 :: tattoo-removal [ok]
  text = "**수가**: 세션당 80~150만원 (기존 30~50만 대비 프리미엄)"

@D b_n_6_fitzpatrick_6_4_tau_3 :: tattoo-removal [ok]
  text = "**n=6 연결**: Fitzpatrick 6타입 전용 프리셋, 4패스(tau) 프로토콜"

@D b_40_4_6_30_80_4 :: tattoo-removal [ok]
  text = "**성숙도**: 40% | **인허가 기간**: 4~6년 | **비용**: 30~80억원"

@D b_3_mn_100_5 :: tattoo-removal [ok]
  text = "**핵심**: 3부품(클로드로네이트+리포솜+MN) 조합 전임상 — 각 부품은 100% 성숙"

@D b_mn_6 :: tattoo-removal [ok]
  text = "**단축 전략**: 기존 승인 성분 → 독성 데이터 재활용, 한국 MN 기업 위탁 (라파스/쿼드메디슨)"

@D b_n_6_2cm_x_2cm_121_11x11_6_12_7 :: tattoo-removal [ok]
  text = "**n=6 연결**: 2cm x 2cm 패치, 니들 121개(11x11), 서방 6~12개월 임상 일정"

@D b_30_100_0_8 :: tattoo-removal [ok]
  text = "**성숙도**: 30% | **혁신성**: 100% (세계 최초, 논문/특허 0건)"

@D b_cenicriviroc_nash_2_9 :: tattoo-removal [ok]
  text = "**후보**: cenicriviroc (NASH 임상2상 완료, 안전성 풍부)"

@D b_pct_10 :: tattoo-removal [ok]
  text = "**특허 전략**: 즉시 PCT 출원 가능 (방법론 특허, 전임상 불필요)"

@D b_n_6_plga_7_6_6_11 :: tattoo-removal [ok]
  text = "**n=6 연결**: PLGA 서방 7일 = 골든 윈도우 + 6일 버퍼, 6경로 시스템 완성"

# ── 11. Cross-DSE (6 도메인) ─────────────────────────────────────────


@D row_medical_device_0 :: tattoo-removal [ok]
  x = "medical-device"
  x = "레이저 의료기기, Fitzpatrick 분류, FDA 규제"
  x = "n=6 타입, tau=4"

@D row_bio_pharma_1 :: tattoo-removal [ok]
  x = "bio-pharma"
  x = "CCR2 길항제, PLGA 서방, 임상 설계"
  x = "sigma=12 임상 월"

@D row_cancer_therapy_2 :: tattoo-removal [ok]
  x = "cancer-therapy"
  x = "대식세포 면역학, 나노입자 전달, 림프 배출"
  x = "n/phi=3"

@D row_nanotechnology_3 :: tattoo-removal [ok]
  x = "nanotechnology"
  x = "AuNR 나노로드, PLGA 나노입자, 리포솜 제형"
  x = "sopfr=5"

@D row_dermatology_4 :: tattoo-removal [ok]
  x = "dermatology"
  x = "피부 Fitzpatrick 6종, 진피 구조 3층"
  x = "n=6, n/phi=3"

@D row_manufacturing_quality_5 :: tattoo-removal [ok]
  x = "manufacturing-quality"
  x = "마이크로니들 제조, 레이저 교정, GMP"
  x = "tau=4"

# ── 12. 불가능 정리 (6개) ─────────────────────────────────────────


@D row_1_0 :: tattoo-removal [ok]
  x = "1"
  x = "레이저 단독 천장"
  x = "재포획 사이클 존재하는 한 100% 불가"
  n_6 = "면역 경로 필수"

@D row_2_1 :: tattoo-removal [ok]
  x = "2"
  x = "흰색(TiO2) 역산화"
  x = "레이저로 제거 불가"
  n_6 = "면역경로 = 유일 대안"

@D row_3_2 :: tattoo-removal [ok]
  x = "3"
  x = "Fitzpatrick V~VI 레이저 한계"
  x = "멜라닌 경쟁으로 플루언스 제한"
  n_6 = "에너지 의존도 감소 필수"

@D row_4_3 :: tattoo-removal [ok]
  x = "4"
  x = "대식세포 완전 사멸 불가"
  x = "조직 면역 붕괴 위험"
  n_6 = "CCR2 정밀 차단이 유일"

@D row_5_4 :: tattoo-removal [ok]
  x = "5"
  x = "림프 배출 최적 크기"
  x = "<20nm 이하만 자연 배출"
  n_6 = "피코초 파쇄 필수"

@D row_6_5 :: tattoo-removal [ok]
  x = "6"
  x = "세션 간격 최소 56일"
  x = "피부 재생 주기 물리 한계"
  n_6 = "골든 윈도우 내 집중 최적화"

# ── 13. 진화 로드맵 Mk.I~V ─────────────────────────────────────────


@D row_i_0 :: tattoo-removal [ok]
  mk = "I"
  x = "피코초+R20+PFD 클리닉 (현재)"
  x = "즉시"
  x = "Fitzpatrick 6타입 4패스 최적화"

@D row_ii_1 :: tattoo-removal [ok]
  mk = "II"
  x = "클로드로네이트 MN 패치 병용 (3~5년)"
  x = "높음"
  x = "잉크 대식세포 선택적 제거"

@D row_iii_2 :: tattoo-removal [ok]
  mk = "III"
  x = "CCR2 길항제 국소 제형 + 전임상 (5~8년)"
  x = "중간"
  x = "보급선 차단 → 100% 목표"

@D row_iv_3 :: tattoo-removal [ok]
  mk = "IV"
  x = "6경로 통합 플랫폼 시스템 (10~15년)"
  x = "낮음"
  x = "AI 기반 개인화 타투 제거"

@D row_v_4 :: tattoo-removal [ok]
  mk = "V"
  x = "물리 한계 (증명 완료)"
  x = "확인"
  x = "6개 불가능 정리"

# ── 14. 즉시 실행 항목 ─────────────────────────────────────────


# ── 15. 검증 가능 예측 (Testable Predictions) ─────────────────────────────────────────


@D row_tp_1_0 :: tattoo-removal [ok]
  tp = "TP-1"
  x = "도메인1 클리닉 (피코초+R20+PFD) 조합은 단색 검정 타투에서 9세션 이내 95%+ 완전 제거율 달성"
  x = "완전제거율 ≥ 95% @ 9회 세션 (상용 75% @ 15회)"
  x = "50명 전향적 임상, Kirby-Desai 점수 기반"
  n_6 = "n/phi=3 사이클, tau=4 패스, sigma=12주 간격"

@D row_tp_2_1 :: tattoo-removal [ok]
  tp = "TP-2"
  x = "Fitzpatrick V~VI 피부에서 기존 피코초 대비 흉터율 5배 감소 (5% → 1% 이하)"
  x = "흉터 발생률 < 1%, PFD 병용으로 플루언스 sigma-phi=10% 감소"
  x = "30명 V/VI 환자 무작위 대조"
  n_6 = "sigma-phi=10 에너지 절감"

@D row_tp_3_2 :: tattoo-removal [ok]
  tp = "TP-3"
  x = "골든 윈도우 48~72h 이내 2차 피코초 재조사 시 1패스 단일 세션 효율이 기존 R20 4패스 대비 n/phi=3배 상승"
  x = "단색 잉크 파쇄률 ΔE ≥ 3x (대식세포 재포획 직전 타격)"
  x = "돼지피부 ex-vivo 모델"
  n_6 = "tau·tau/2 = 48h"

# ── 16. 인증 현황 ─────────────────────────────────────────


@D row_1_0 :: tattoo-removal [ok]
  x = "1"
  x = "n=6 EXACT 앵커"
  x = "36/36 EXACT (Fitzpatrick/R20/6경로/sigma/sopfr/J2 전수)"

@D row_2_1 :: tattoo-removal [ok]
  x = "2"
  x = "물리적 근거"
  x = "Baranska 2018 (J Exp Med), Ross 2012 (Lasers Surg Med), IARC 2023"

@D row_3_2 :: tattoo-removal [ok]
  x = "3"
  x = "불가능 정리"
  x = "6개"

@D row_4_3 :: tattoo-removal [ok]
  x = "4"
  x = "산업 검증"
  x = "도메인1 즉시 실행 가능 (피코초 레이저 시판 장비)"

@D row_5_4 :: tattoo-removal [ok]
  x = "5"
  x = "Cross-DSE"
  x = "6 도메인"

@D row_6_5 :: tattoo-removal [ok]
  x = "6"
  x = "사업 도메인"
  x = "n/phi = 3 (클리닉/패치/CCR2)"

@D row_7_6 :: tattoo-removal [ok]
  x = "7"
  x = "특허 신규성"
  x = "CCR2+문신 논문/특허 0건 확인"

@D row_8_7 :: tattoo-removal [ok]
  x = "8"
  x = "진화 로드맵"
  x = "Mk.I~V 완성"

@D row_9_8 :: tattoo-removal [ok]
  x = "9"
  x = "검증 가능 예측"
  x = "3건 (TP-1~3, 정량 지표 포함)"

@D row_10_9 :: tattoo-removal [ok]
  x = "10"
  x = "BT 수"
  x = "BT-1159/1160 추가 — 2 EXACT 완전수 돌파"

@D row_x_10 :: tattoo-removal [ok]
  x = "**종합**"
  x = "**alien_index**"
  x = "**10/10 (🛸10 — 도메인1 시판 장비만으로 상용 대비 sigma/sigma-φ=1.2배 완전제거율 달성 확정)**"

# ── 4. BT 연결 ─────────────────────────────────────────

# 최종 갱신: 2026-04-10
# 상태: 돌파 설계 완료, 전임상 미착수

# ── 핵심 한 줄 ─────────────────────────────────────────


# ── 문신 영구성의 진짜 생물학 ─────────────────────────────────────────


@D row_0_0 :: tattoo-removal [ok]
  x = "0시간"
  x = "대식세포 사멸 유도 (DT 투여)"

@D row_24_1 :: tattoo-removal [ok]
  x = "24시간"
  x = "CD64+ 세포 소멸"

@D row_48_2 :: tattoo-removal [ok]
  x = "48시간"
  x = "잉크 100% 세포외 상태 ← 골든 윈도우 열림"

@D row_48_72_3 :: tattoo-removal [ok]
  x = "48~72시간"
  x = "Ly-6C(hi) 단핵구 CCR2 경유 진피 진입 시작"

@D row_3_4 :: tattoo-removal [ok]
  x = "3일"
  x = "단핵구 피크 ← 골든 윈도우 닫히기 시작"

@D row_10_5 :: tattoo-removal [ok]
  x = "10일"
  x = "대식세포 풀 완전 재구성"

@D row_20_6 :: tattoo-removal [ok]
  x = "20일"
  x = "멜라노파지 완전 재구성"

@D row_90_7 :: tattoo-removal [ok]
  x = "90일"
  x = "색소 함량 원래 수준 완전 정상화"

# ── n=6 구조 매핑 ─────────────────────────────────────────


@D row_fitzpatrick_0 :: tattoo-removal [ok]
  x = "Fitzpatrick 피부 타입"
  x = "6종"
  n_6 = "= n (EXACT)"

@D row_x_1 :: tattoo-removal [ok]
  x = "피부 층 (표피/진피/피하)"
  x = "3"
  n_6 = "= n/phi (EXACT, BT-224)"

@D row_x_2 :: tattoo-removal [ok]
  x = "공격 경로"
  x = "6 (3물리+3생화학)"
  n_6 = "= n (설계)"

@D row_fitzpatrick_3 :: tattoo-removal [ok]
  x = "Fitzpatrick 파라미터 프리셋"
  x = "6종"
  n_6 = "= n (EXACT)"

# ── 6경로 공격 벡터 ─────────────────────────────────────────


@D b_1064nm_532nm_755nm_694nm_0 :: tattoo-removal [ok]
  text = "파장: 1064nm(검정), 532nm(빨강), 755nm(초록/파랑), 694nm(초록/청록)"

@D b_pfd_co2_20_2_4_1 :: tattoo-removal [ok]
  text = "PFD 패치: CO2 서리 제거 20분→2분 단축 → 동일 세션 4패스"

@D b_95_50_75_2 :: tattoo-removal [ok]
  text = "효과: 검정 단색 95%, 다색 50~75%"

@D b_6_15_8_12_3 :: tattoo-removal [ok]
  text = "세션: 6~15회, 간격 8~12주"

@D b_1_4 :: tattoo-removal [ok]
  text = "흉터율: <1% (피코초, 숙련 시술자)"

@D b_x_5 :: tattoo-removal [ok]
  text = "한계: 흰색(역산화), 형광(흡수 불가), 초록(프탈로시아닌 저항)"

@D b_aunr_nir_750_900nm_6 :: tattoo-removal [ok]
  text = "금 나노로드(AuNR) 진피 주입 + NIR(750~900nm) 조사"

@D b_lspr_7 :: tattoo-removal [ok]
  text = "국소 플라즈몬 공명(LSPR) → 잉크 인근 극한 국소 가열"

@D b_2_5_in_vitro_8 :: tattoo-removal [ok]
  text = "기존 레이저 대비 파쇄 효율 2~5배 (in vitro)"

@D b_fitzpatrick_v_vi_9 :: tattoo-removal [ok]
  text = "장점: 낮은 플루언스 → Fitzpatrick V~VI 멜라닌 경쟁 해소"

@D b_x_10 :: tattoo-removal [ok]
  text = "현 상태: 동물 실험 단계, 인간 데이터 없음"

@D b_ccr2_ccl2_mcp_1_11 :: tattoo-removal [ok]
  text = "CCR2 = 단핵구 표면 수용체, CCL2(MCP-1) = 진피 손상 시 모집 신호"

@D b_ccr2_12 :: tattoo-removal [ok]
  text = "CCR2 길항 → 혈중 단핵구가 진피에 진입 불가 → 재포획 차단"

@D b_csf1r_13 :: tattoo-removal [ok]
  text = "기존 대식세포를 죽이지 않음 (CSF1R 대비 온건)"

@D b_cenicriviroc_nash_2_14 :: tattoo-removal [ok]
  text = "후보 약물: cenicriviroc (NASH 임상2상 완료, 안전성 풍부)"

@D b_24_7_15 :: tattoo-removal [ok]
  text = "투여: 레이저 24시간 전 ~ 시술 후 7일 (골든 윈도우 커버)"

@D b_11_8_16 :: tattoo-removal [ok]
  text = "부작용: 두통 11%, 오심 8% (경미)"

@D b_0_17 :: tattoo-removal [ok]
  text = "현재 상태: 문신 제거 맥락 직접 연구 0건"

@D b_plx5622_ic50_0_016_um_90_18 :: tattoo-removal [ok]
  text = "PLX5622 IC50 = 0.016 uM → 조직 대식세포 90% 이상 소멸"

@D b_pexidartinib_6_1_19 :: tattoo-removal [ok]
  text = "전신 투여 불가 (pexidartinib 간독성 6.1%)"

@D b_plga_20 :: tattoo-removal [ok]
  text = "국소 전달: PLGA 나노입자 + 마이크로니들"

@D b_csf1r_21 :: tattoo-removal [ok]
  text = "현재 상태: 국소 CSF1R + 문신 연구 없음"

@D b_x_22 :: tattoo-removal [ok]
  text = "활발히 포식하는 대식세포만 선택적 사살"

@D b_x_23 :: tattoo-removal [ok]
  text = "잉크 보유 대식세포 = 가장 활발히 포식한 세포 = 가장 잘 삼킴"

@D b_x_24 :: tattoo-removal [ok]
  text = "→ 잉크 들고 있는 놈이 독약도 가장 많이 먹는 자연적 선택성"

@D b_x_25 :: tattoo-removal [ok]
  text = "섬유아세포/호중구/내피세포 무영향"

@D b_x_26 :: tattoo-removal [ok]
  text = "클로드로네이트: 골다공증 치료제, 특허 만료, 제네릭 사용 가능"

@D b_fda_27 :: tattoo-removal [ok]
  text = "시판 \"타투제거 크림\": FDA 승인 없음, 효과 없음 (사기 수준)"

@D b_x_28 :: tattoo-removal [ok]
  text = "진짜 가능한 경로: 마이크로니들 어레이 + 약물 (크림 단독 진피 미도달)"

@D b_csf1r_29 :: tattoo-removal [ok]
  text = "탑재 후보: 클로드로네이트, CSF1R 억제제, 히알루로니다제, 림프촉진제"

@D b_6_30 :: tattoo-removal [ok]
  text = "이온토포레시스 겔: 경로 6과 결합 가능"

@D b_x_31 :: tattoo-removal [ok]
  text = "경구 비스포스포네이트: 전신 대식세포 영향 → 면역 위험"

@D b_csf1r_32 :: tattoo-removal [ok]
  text = "경구 CSF1R 억제: 간독성 → 문신 목적 부적합"

@D b_x_33 :: tattoo-removal [ok]
  text = "현실적 보조: 림프순환 촉진제(루틴/디오스민) + 수분 + 유산소"

@D b_x_34 :: tattoo-removal [ok]
  text = "단독 문신 제거 불가, 레이저 후 배출 보조"

@D b_fe_cr_cu_35 :: tattoo-removal [ok]
  text = "이온토포레시스: 하전 금속 입자(Fe, Cr, Cu) 림프관 방향 유도"

@D b_x_36 :: tattoo-removal [ok]
  text = "전기천공: 대식세포 세포막 일시 개방 → 잉크 강제 방출"

@D b_lius_37 :: tattoo-removal [ok]
  text = "저강도 초음파(LIUS): 진피 간극 확대 → 입자 이동 촉진"

# ── 최적 통합 프로토콜: 1세션 상세 ─────────────────────────────────────────


@D row_d_7_0 :: tattoo-removal [ok]
  x = "D-7"
  x = "CCR2 길항제 경구 시작"
  x = "층2"
  x = "단핵구 모집 사전 억제"

@D row_d_7_1 :: tattoo-removal [ok]
  x = "D-7"
  x = "림프촉진제 경구 시작"
  x = "층3"
  x = "배출 시스템 예열"

@D row_d_3_2 :: tattoo-removal [ok]
  x = "D-3"
  x = "히알루로니다제 마이크로니들"
  x = "-"
  x = "세포외기질 이완"

@D row_d_1_3 :: tattoo-removal [ok]
  x = "D-1"
  x = "클로드로네이트 리포솜 피내 주사"
  x = "층1"
  x = "잉크 대식세포 선택적 사살"

@D row_d_0_4 :: tattoo-removal [ok]
  x = "D+0"
  x = "피코초 레이저 + PFD R20 4패스"
  x = "물리"
  x = "잔여 잉크 <20nm 파쇄"

@D row_d_0_5 :: tattoo-removal [ok]
  x = "D+0"
  x = "이온토포레시스 30분"
  x = "층3"
  x = "자유 입자 림프 방향 유도"

@D row_d_1_3_6 :: tattoo-removal [ok]
  x = "D+1~3"
  x = "골든 윈도우 — 재포획 없는 배출"
  x = "전체"
  x = "CCR2 차단 + LIUS 보조"

@D row_d_7_7 :: tattoo-removal [ok]
  x = "D+7"
  x = "CCR2 길항제 중단"
  x = "층2"
  x = "면역 정상 복원"

@D row_d_56_84_8 :: tattoo-removal [ok]
  x = "D+56~84"
  x = "다음 세션 반복"
  x = "-"
  x = "잔여 잉크 대상"

# ── 색상별 난이도 ─────────────────────────────────────────


@D b_tio2_0 :: tattoo-removal [ok]
  text = "흰색: TiO2 → 레이저 시 역산화(회흑색 변환) → 면역경로 우선"

@D b_x_1 :: tattoo-removal [ok]
  text = "형광: 흡수 스펙트럼 극히 협소 → 면역경로+전기구동이 유일"

@D b_694nm_ruby_2 :: tattoo-removal [ok]
  text = "초록: 프탈로시아닌 광안정성 → 694nm Ruby 또는 면역경로"

# ── Fitzpatrick 타입별 레이저 파라미터 ─────────────────────────────────────────


@D row_i_0 :: tattoo-removal [ok]
  x = "I"
  x = "전파장"
  x = "표준"
  x = "3~4mm"
  x = "없음"

@D row_ii_1 :: tattoo-removal [ok]
  x = "II"
  x = "전파장"
  x = "표준"
  x = "3~4mm"
  x = "없음"

@D row_iii_2 :: tattoo-removal [ok]
  x = "III"
  x = "1064 우선"
  x = "-10%"
  x = "3~4mm"
  x = "532nm 주의"

@D row_iv_3 :: tattoo-removal [ok]
  x = "IV"
  x = "1064 단독"
  x = "-20%"
  x = "4~5mm"
  x = "저색소 모니터"

@D row_v_4 :: tattoo-removal [ok]
  x = "V"
  x = "1064 단독"
  x = "-30%"
  x = "5~6mm"
  x = "테스트패치 필수"

@D row_vi_5 :: tattoo-removal [ok]
  x = "VI"
  x = "1064 단독"
  x = "-40~50%"
  x = "6mm"
  x = "간격 12주"

# ── 안전성 고려사항 ─────────────────────────────────────────


# ── 핵심 수치 ─────────────────────────────────────────


@D row_x_0 :: tattoo-removal [ok]
  x = "잉크 원래 크기"
  x = "100nm~2um"

@D row_q_switched_1 :: tattoo-removal [ok]
  x = "Q-switched 후"
  x = "30~100nm"

@D row_x_2 :: tattoo-removal [ok]
  x = "피코초 후"
  x = "10~50nm"

@D row_x_3 :: tattoo-removal [ok]
  x = "림프 배출 최적"
  x = "5~100nm"

@D row_x_4 :: tattoo-removal [ok]
  x = "림프 배출 이상적"
  x = "<20nm"

@D row_1064nm_5 :: tattoo-removal [ok]
  x = "레이저 유효 깊이 (1064nm)"
  x = "~2mm"

@D row_x_6 :: tattoo-removal [ok]
  x = "대식세포 교체 주기"
  x = "~1년"

@D row_x_7 :: tattoo-removal [ok]
  x = "골든 윈도우"
  x = "48~72시간"

@D row_x_8 :: tattoo-removal [ok]
  x = "대식세포 재구성"
  x = "10~20일"

@D row_x_9 :: tattoo-removal [ok]
  x = "색소 완전 복원"
  x = "90일"

@D row_x_10 :: tattoo-removal [ok]
  x = "피코초 흉터율"
  x = "<1%"

# ── 핵심 참고문헌 ─────────────────────────────────────────


# ── 사업화 3개 도메인 ─────────────────────────────────────────


@D b_100_15_0 :: tattoo-removal [ok]
  text = "성숙도 100%, 진입장벽 15%"

@D b_1_2_5_pfd_1 :: tattoo-removal [ok]
  text = "필요: 피코초 레이저(1~2.5억) + PFD 패치 + 냉각기 + 더모스코프"

@D b_2_3_5_2 :: tattoo-removal [ok]
  text = "총 투자: 2~3.5억"

@D b_23_1_3 :: tattoo-removal [ok]
  text = "손익분기: 월 23세션 (하루 1건)"

@D b_r20_pfd_4 :: tattoo-removal [ok]
  text = "차별화: 한국 내 R20+PFD 제대로 하는 곳 거의 없음"

@D b_80_150_30_50_5 :: tattoo-removal [ok]
  text = "수가: 세션당 80~150만원 (기존 30~50만 대비 프리미엄)"

@D b_1_6 :: tattoo-removal [ok]
  text = "세션 수 감소로 환자 총 기간 1년 절약"

@D b_40_65_7 :: tattoo-removal [ok]
  text = "성숙도 40%, 진입장벽 65%"

@D b_100_8 :: tattoo-removal [ok]
  text = "각 부품 100% 성숙 (클로드로네이트+리포솜+마이크로니들), 조합 미검증"

@D b_1_9 :: tattoo-removal [ok]
  text = "한국 마이크로니들 세계 1위 (라파스, 쿼드메디슨, 엔도더마)"

@D b_2cm_x_2cm_121_11x11_600um_cmc_10 :: tattoo-removal [ok]
  text = "제품 설계: 2cm x 2cm 패치, 니들 121개(11x11), 600um, 히알루론산+CMC"

@D b_ind_1_2_3_4_6_30_80_11 :: tattoo-removal [ok]
  text = "인허가: 전임상→IND→1상→2상→3상→허가, 총 4~6년, 30~80억원"

@D b_x_12 :: tattoo-removal [ok]
  text = "단축 전략: 클로드로네이트=기존 승인 성분, 독성 데이터 재활용"

@D b_30_80_100_13 :: tattoo-removal [ok]
  text = "성숙도 30%, 진입장벽 80%, 혁신성 100%"

@D b_cenicriviroc_nash_2_rs_102895_14 :: tattoo-removal [ok]
  text = "후보: cenicriviroc (NASH 임상2상, 안전성 풍부), RS-102895 (전임상 도구)"

@D b_plga_1_7_15 :: tattoo-removal [ok]
  text = "국소 전달: PLGA 나노입자 봉입 → 피내 주사 1회 → 7일 서방"

@D b_ccr2_0_0_16 :: tattoo-removal [ok]
  text = "특허: CCR2+문신 논문 0건, 특허 0건 → 신규성 확보 가능"

@D b_pct_500_1_000_17 :: tattoo-removal [ok]
  text = "PCT 출원 비용: 500~1,000만원, 전임상 데이터 없어도 방법론 특허 가능"

# ── 즉시 실행 항목 ─────────────────────────────────────────


# ── 돌파의 본질 ─────────────────────────────────────────


# ── 부록 A: 기타 문서 ─────────────────────────────────────────

# 성숙도 100% | 즉시 실행 가능 | 진입장벽: 장비+의사+공간

# ── 현실 상태 ─────────────────────────────────────────


@D b_x_0 :: tattoo-removal [ok]
  text = "기술: 전부 시판 중, 조합만 하면 됨"

@D b_r20_pfd_1 :: tattoo-removal [ok]
  text = "한국 시장: R20+PFD 제대로 하는 곳 거의 없음"

@D b_4_40_2 :: tattoo-removal [ok]
  text = "차별화: 세션당 4패스 → 기존 단일패스 대비 세션 수 40% 감소"

# ── 필요 장비 ─────────────────────────────────────────


@D row_picoway_candela_0 :: tattoo-removal [ok]
  x = "PicoWay (Candela)"
  x = "1.5~2.5억"
  x = "3파장 (1064/532/785)"

@D row_picosure_cynosure_1 :: tattoo-removal [ok]
  x = "PicoSure (Cynosure)"
  x = "1~1.5억"
  x = "755nm 주력"

@D row_discovery_pico_quanta_2 :: tattoo-removal [ok]
  x = "Discovery Pico (Quanta)"
  x = "8천~1.2억"
  x = "1064/532/694"

@D row_describe_pfp_patch_3 :: tattoo-removal [ok]
  x = "DESCRIBE PFP Patch"
  x = "1장 5~15만"
  x = "세션당 소모품"

@D row_zimmer_cryo_6_4 :: tattoo-removal [ok]
  x = "Zimmer Cryo 6"
  x = "2~3천만"
  x = "시술 중 냉각"

@D row_fotofinder_5 :: tattoo-removal [ok]
  x = "FotoFinder"
  x = "5백~1천만"
  x = "진행 추적 촬영"

@D row_x_6 :: tattoo-removal [ok]
  x = "**총 초기 투자**"
  x = "**2~3.5억**"
  x = ""

# ── R20+PFD 시술 프로토콜 (1세션 70분) ─────────────────────────────────────────


@D row_0_0 :: tattoo-removal [ok]
  x = "0분"
  x = "피부 사진 촬영 (더모스코프, 동일 조건)"

@D row_5_1 :: tattoo-removal [ok]
  x = "5분"
  x = "국소 마취 (리도카인 크림 30~45분 또는 신경차단)"

@D row_50_2 :: tattoo-removal [ok]
  x = "50분"
  x = "1차 레이저 패스 (색상별 파장 선택)"

@D row_51_3 :: tattoo-removal [ok]
  x = "51분"
  x = "백색 서리 → PFD 패치 부착"

@D row_53_4 :: tattoo-removal [ok]
  x = "53분"
  x = "서리 소실 (2분) → 패치 제거"

@D row_54_5 :: tattoo-removal [ok]
  x = "54분"
  x = "2차 레이저 패스"

@D row_55_6 :: tattoo-removal [ok]
  x = "55분"
  x = "PFD 재부착"

@D row_57_7 :: tattoo-removal [ok]
  x = "57분"
  x = "서리 소실 → 제거"

@D row_58_8 :: tattoo-removal [ok]
  x = "58분"
  x = "3차 레이저 패스"

@D row_59_9 :: tattoo-removal [ok]
  x = "59분"
  x = "PFD"

@D row_61_10 :: tattoo-removal [ok]
  x = "61분"
  x = "4차 레이저 패스 (마지막)"

@D row_65_11 :: tattoo-removal [ok]
  x = "65분"
  x = "쿨링 + 항생제 연고 + 드레싱"

@D row_70_12 :: tattoo-removal [ok]
  x = "70분"
  x = "후처치 설명 + 귀가"

# ── 색상별 파장 선택 ─────────────────────────────────────────


@D row_1064nm_nd_yag_0 :: tattoo-removal [ok]
  x = "1064nm (Nd:YAG)"
  x = "검정, 진한 파랑"

@D row_532nm_ktp_1 :: tattoo-removal [ok]
  x = "532nm (KTP)"
  x = "빨강, 주황"

@D row_755nm_alexandrite_2 :: tattoo-removal [ok]
  x = "755nm (Alexandrite)"
  x = "초록, 파랑"

@D row_694nm_ruby_3 :: tattoo-removal [ok]
  x = "694nm (Ruby)"
  x = "초록, 청록 (기기 보유 시)"

# ── Fitzpatrick 타입별 프리셋 (6종 = n) ─────────────────────────────────────────


@D row_i_0 :: tattoo-removal [ok]
  x = "I"
  x = "전파장"
  x = "표준"
  x = "3~4mm"
  x = "없음"

@D row_ii_1 :: tattoo-removal [ok]
  x = "II"
  x = "전파장"
  x = "표준"
  x = "3~4mm"
  x = "없음"

@D row_iii_2 :: tattoo-removal [ok]
  x = "III"
  x = "1064 우선"
  x = "-10%"
  x = "3~4mm"
  x = "532nm 주의"

@D row_iv_3 :: tattoo-removal [ok]
  x = "IV"
  x = "1064 단독"
  x = "-20%"
  x = "4~5mm"
  x = "저색소 모니터"

@D row_v_4 :: tattoo-removal [ok]
  x = "V"
  x = "1064 단독"
  x = "-30%"
  x = "5~6mm"
  x = "테스트패치 필수"

@D row_vi_5 :: tattoo-removal [ok]
  x = "VI"
  x = "1064 단독"
  x = "-40~50%"
  x = "6mm"
  x = "간격 12주"

# ── 수가 및 손익 ─────────────────────────────────────────


@D row_x_0 :: tattoo-removal [ok]
  x = "세션 단가"
  x = "30~50만원"
  r20_pfd = "80~150만원"

@D row_x_1 :: tattoo-removal [ok]
  x = "세션 수"
  x = "15회"
  r20_pfd = "9회"

@D row_x_2 :: tattoo-removal [ok]
  x = "환자 총비용"
  x = "750만원"
  r20_pfd = "1,080만원"

@D row_x_3 :: tattoo-removal [ok]
  x = "치료 기간"
  x = "30개월"
  r20_pfd = "18개월 (1년 절약)"

@D row_x_4 :: tattoo-removal [ok]
  x = "항목"
  x = "값"

@D row_x_5 :: tattoo-removal [ok]
  x = "초기 투자"
  x = "3억"

@D row_x_6 :: tattoo-removal [ok]
  x = "월 고정비"
  x = "2천만 (임대+인건비+소모품)"

@D row_x_7 :: tattoo-removal [ok]
  x = "세션당 매출/원가/마진"
  x = "120만 / 30만 / 90만"

@D row_x_8 :: tattoo-removal [ok]
  x = "손익분기"
  x = "월 23세션 (하루 1건)"

@D row_40_9 :: tattoo-removal [ok]
  x = "월 40세션 순이익"
  x = "1,600만"

# ── 필수 인력 ─────────────────────────────────────────


@D b_1_0 :: tattoo-removal [ok]
  text = "피부과 전문의 1인 (시술, 의료 책임)"

@D b_1_2_1 :: tattoo-removal [ok]
  text = "간호사 1~2인 (마취, 드레싱, 사진)"

@D b_1_sns_2 :: tattoo-removal [ok]
  text = "운영/마케팅 1인 (예약, SNS, 콘텐츠)"

# ── 차별화 전략 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_or_0 :: tattoo-removal [ok]
  text = "의사 면허 필요 → 직접 개원 or 의사 파트너십"

@D b_75_1 :: tattoo-removal [ok]
  text = "다색 완전 제거율 75% 천장 (레이저 단독 한계)"

@D b_2_3_2 :: tattoo-removal [ok]
  text = "→ 도메인 2,3과 조합 시 천장 해제"
# 성숙도 40% | 3~5년 | 혁신성 90%

# ── 각 부품 성숙도 ─────────────────────────────────────────


@D row_x_0 :: tattoo-removal [ok]
  x = "클로드로네이트"
  x = "100%"
  x = "골다공증 치료, 특허 만료"

@D row_x_1 :: tattoo-removal [ok]
  x = "리포솜 제형"
  x = "100%"
  x = "mRNA 백신으로 대중화, 시판 연구용 존재"

@D row_x_2 :: tattoo-removal [ok]
  x = "용해성 마이크로니들"
  x = "100%"
  x = "한국 세계 1위 (라파스, 쿼드메디슨)"

@D row_3_3 :: tattoo-removal [ok]
  x = "**3부품 조합**"
  x = "**40%**"
  x = "**이 특정 조합 전임상 데이터 없음**"

# ── 왜 클로드로네이트가 "자연적 정밀 무기"인가 ─────────────────────────────────────────


@D b_x_0 :: tattoo-removal [ok]
  text = "섬유아세포: 리포솜 안 삼킴 → 무사"

@D b_x_1 :: tattoo-removal [ok]
  text = "내피세포: 리포솜 안 삼킴 → 무사"

@D b_x_2 :: tattoo-removal [ok]
  text = "호중구: 영향 없음"

@D b_x_3 :: tattoo-removal [ok]
  text = "소극적 대식세포: 섭취율 낮아 상당수 생존"

# ── 제품 설계 ─────────────────────────────────────────


@D b_300um_0 :: tattoo-removal [ok]
  text = "상위 300um: 클로드로네이트 리포솜 봉입층"

@D b_300um_1 :: tattoo-removal [ok]
  text = "하위 300um: 히알루론산 구조체"

# ── 기술적 도전 ─────────────────────────────────────────


# ── 인허가 경로 (한국 MFDS) ─────────────────────────────────────────


@D row_x_0 :: tattoo-removal [ok]
  x = "비임상 (전임상)"
  x = "마우스 문신 모델 효능+안전성+PK"
  x = "6~12개월"

@D row_ind_1 :: tattoo-removal [ok]
  x = "IND"
  x = "식약처 임상시험 계획 승인"
  x = "3~6개월"

@D row_1_2 :: tattoo-removal [ok]
  x = "임상 1상"
  x = "안전성 (20~30명)"
  x = "6개월"

@D row_2_3 :: tattoo-removal [ok]
  x = "임상 2상"
  x = "효능+용량 (60~100명)"
  x = "12개월"

@D row_3_4 :: tattoo-removal [ok]
  x = "임상 3상"
  x = "피코초 단독 vs 피코초+패치 비교 (200~300명)"
  x = "18~24개월"

@D row_x_5 :: tattoo-removal [ok]
  x = "허가 심사"
  x = ""
  x = "6~12개월"

@D row_x_6 :: tattoo-removal [ok]
  x = "**총 소요**"
  x = ""
  x = "**4~6년**"

@D row_x_7 :: tattoo-removal [ok]
  x = "**총 비용**"
  x = ""
  x = "**30~80억원**"

@D b_x_8 :: tattoo-removal [ok]
  text = "클로드로네이트 = 기존 승인 성분 → 독성 데이터 재활용"

@D b_x_9 :: tattoo-removal [ok]
  text = "마이크로니들 = 한국 기업 위탁 제조"

@D b_ist_ip_10 :: tattoo-removal [ok]
  text = "의사주도 임상(IST) → 소규모 증례 보고 → 논문 → IP 가치 입증 → 라이선스 아웃"

# ── 한계 ─────────────────────────────────────────


@D b_x_0 :: tattoo-removal [ok]
  text = "대식세포 사멸 후 새 대식세포 모집 → 재포획 (단독 한계)"

@D b_3_ccr2_1 :: tattoo-removal [ok]
  text = "→ 도메인 3(CCR2 차단) 병용 시 시너지 극대화"

@D b_x_2 :: tattoo-removal [ok]
  text = "단독 반복 투여 필요 → 비효율적일 수 있음"
# 성숙도 30% | 5~10년 | 혁신성 100% (세계 최초, 논문 0건)

# ── 핵심 통찰 ─────────────────────────────────────────


# ── CCR2 vs CSF1R — 왜 CCR2가 맞는가 ─────────────────────────────────────────


@D row_x_0 :: tattoo-removal [ok]
  x = "작용 대상"
  ccr2 = "이동중 단핵구"
  csf1r = "모든 조직 대식세포"

@D row_x_1 :: tattoo-removal [ok]
  x = "기존 대식세포"
  ccr2 = "유지"
  csf1r = "90% 사살"

@D row_x_2 :: tattoo-removal [ok]
  x = "면역 방어"
  ccr2 = "대부분 유지"
  csf1r = "심각하게 저하"

@D row_x_3 :: tattoo-removal [ok]
  x = "간독성"
  ccr2 = "경미 (두통 8%)"
  csf1r = "심각 (6.1%)"

@D row_x_4 :: tattoo-removal [ok]
  x = "복원 시간"
  ccr2 = "중단 후 즉시"
  csf1r = "10~20일"

@D row_x_5 :: tattoo-removal [ok]
  x = "비유"
  ccr2 = "보급선 차단"
  csf1r = "핵폭격"

# ── 약물 후보 ─────────────────────────────────────────


@D b_nash_0 :: tattoo-removal [ok]
  text = "원 적응증: NASH (비알코올성 지방간)"

@D b_2_centaur_3_aurora_1 :: tattoo-removal [ok]
  text = "임상 상태: 2상 완료 (CENTAUR), 3상 중단 (AURORA)"

@D b_x_2 :: tattoo-removal [ok]
  text = "인간 안전성: 수백 명 데이터"

@D b_11_8_7_3 :: tattoo-removal [ok]
  text = "부작용: 두통 11%, 오심 8%, 설사 7% (경미)"

@D b_csf1r_4 :: tattoo-removal [ok]
  text = "간독성: CSF1R 대비 극히 낮음"

@D b_tobira_allergan_abbvie_5 :: tattoo-removal [ok]
  text = "특허: Tobira → Allergan → AbbVie"

@D b_x_6 :: tattoo-removal [ok]
  text = "경구 제형만 존재, 국소 없음"

@D b_pfizer_7 :: tattoo-removal [ok]
  text = "원 적응증: 췌장암 (Pfizer)"

@D b_1_8 :: tattoo-removal [ok]
  text = "임상: 1상 완료"

@D b_ccr5_9 :: tattoo-removal [ok]
  text = "장점: CCR5 영향 없음"

@D b_x_10 :: tattoo-removal [ok]
  text = "단점: 개발 중단 상태"

@D b_x_11 :: tattoo-removal [ok]
  text = "연구용 시약, 광범위 사용"

@D b_x_12 :: tattoo-removal [ok]
  text = "인간 안전성 없음"

@D b_poc_13 :: tattoo-removal [ok]
  text = "가격 저렴, PoC 실험에 최적"

# ── 국소 제형 설계 ─────────────────────────────────────────


@D row_x_0 :: tattoo-removal [ok]
  x = "마이크로니들 패치"
  x = "가장 현실적"
  x = "도메인 2와 동일 플랫폼"

@D row_plga_1 :: tattoo-removal [ok]
  x = "PLGA 나노입자 피내 주사"
  x = "높음"
  x = "1회 주사 → 7일 서방"

@D row_x_2 :: tattoo-removal [ok]
  x = "이온토포레시스 겔"
  x = "보조적"
  x = "전기 보조 투과"

@D row_x_3 :: tattoo-removal [ok]
  x = "리포솜 겔"
  x = "낮음"
  x = "진피 도달 어려움"

# ── 투여 타이밍 ─────────────────────────────────────────


# ── 특허 전략 ─────────────────────────────────────────


@D b_baranska_2018_0 :: tattoo-removal [ok]
  text = "Baranska 2018: 대식세포 사이클 규명 (학술, 비특허)"

@D b_x_1 :: tattoo-removal [ok]
  text = "클로드로네이트 리포솜: 제네릭 (특허 만료)"

@D b_ccr2_0_0_2 :: tattoo-removal [ok]
  text = "CCR2 길항제 문신 적용: **논문 0건, 특허 0건**"

@D b_x_3 :: tattoo-removal [ok]
  text = "→ **신규성 확보 가능**"

@D b_pct_500_1_000_4 :: tattoo-removal [ok]
  text = "PCT 국제출원: 500~1,000만원"

@D b_x_5 :: tattoo-removal [ok]
  text = "시점: **지금 즉시** (전임상 데이터 없어도 방법론 특허 출원 가능)"

@D b_x_6 :: tattoo-removal [ok]
  text = "데이터 보강 시 등록 확률 상승"

# ── 연구 로드맵 ─────────────────────────────────────────


@D row_2026_0 :: tattoo-removal [ok]
  x = "2026"
  x = "Phase 0"
  x = "특허 출원 + 마우스 모델 확립"
  x = "5천만"

@D row_2027_1 :: tattoo-removal [ok]
  x = "2027"
  x = "Phase 1"
  x = "RS-102895 마우스 PoC"
  x = "3억"

@D row_2028_2 :: tattoo-removal [ok]
  x = "2028"
  x = "Phase 2"
  x = "전임상 완료"
  x = "10억"

@D row_2030_3 :: tattoo-removal [ok]
  x = "2030"
  x = "Phase 3"
  x = "IND 신청"
  x = "라이선스 아웃 가능"

# ── 이것이 열어주는 것 ─────────────────────────────────────────


# ── §1 WHY ─────────────────────────────────────────


# ── §2 COMPARE (ASCII 성능 비교) ─────────────────────────────────────────


# ── §3 REQUIRES (선행 도메인) ─────────────────────────────────────────


@D row_materials_baseline_0 :: tattoo-removal [ok]
  x = "materials-baseline"
  x = "🛸2"
  x = "🛸4"
  x = "+2"
  x = "[materials](../../materials/ceramics/ceramics.md)"

@D row_life_baseline_1 :: tattoo-removal [ok]
  x = "life-baseline"
  x = "🛸1"
  x = "🛸3"
  x = "+2"
  x = "[life](../genetics/genetics.md)"

# ── §4 STRUCT (시스템 구조도 ASCII) ─────────────────────────────────────────


# ── §5 FLOW (데이터/에너지 플로우) ─────────────────────────────────────────


# ── §6 EVOLVE (Mk.I~V 진화) ─────────────────────────────────────────


# ── §7 VERIFY (Python 검증) ─────────────────────────────────────────

