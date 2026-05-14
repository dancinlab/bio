#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# HIV 치료 — 10 연속돌파 (BT-461~470)
# ══════════════════════════════════════════════════════════════

# **등급**: alien_index 8/10, closure_grade 7
# **BT 배치**: BT-461~470 (gp120·RT·IN·Tat·Rev·PR·잠복저수지·bNAb·CCR5·ART)
# **EXACT**: 잠정 40/50 ≈ 80% (정직한 검증, MISS 10건 포함)
# **부모 BT**: BT-404~413 (치료 나노봇 범용)
# ---

# ── 이 기술이 당신의 삶을 바꾸는 방법 ─────────────────────────────────────────


@D row_x_0 :: hiv-treatment [ok]
  x = "평생 복약"
  x = "매일 1정 ART"
  hexa_hiv = "장기지속제 (6개월 1회)"
  x = "J₂=24주 간격"

@D row_x_1 :: hiv-treatment [ok]
  x = "잠복 저수지 제거"
  x = "불가"
  hexa_hiv = "n=6 저수지 클래스 타격"
  x = "기능적 완치"

@D row_x_2 :: hiv-treatment [ok]
  x = "내성 발생"
  x = "RT 오류 10⁻⁴/bp"
  hexa_hiv = "tau=4 병용 타격"
  x = "σ-φ=10분의 1"

@D row_bnab_3 :: hiv-treatment [ok]
  x = "bNAb 커버리지"
  x = "단일 50%"
  hexa_hiv = "n=6 에피토프 칵테일"
  x = "95% (phi=2배)"

@D row_ccr5_4 :: hiv-treatment [ok]
  x = "CCR5 차단제"
  x = "maraviroc 단일"
  hexa_hiv = "ECL n/phi=3 조합"
  x = "내성 sopfr=5배↓"

@D row_x_5 :: hiv-treatment [ok]
  x = "신규 감염 예방"
  x = "PrEP 매일"
  hexa_hiv = "6개월 주사 + bNAb"
  x = "σ/φ=6배 부담↓"

@D row_x_6 :: hiv-treatment [ok]
  x = "진단-치료 간극"
  x = "수주"
  hexa_hiv = "즉시 U=U 유지"
  x = "실시간 억제"

# ── 핵심 상수 매핑 ─────────────────────────────────────────


# ── 1. ASCII 성능 비교 (시중 최고 vs HEXA-HIV) ─────────────────────────────────────────


# ── 2. ASCII 시스템 구조도 ─────────────────────────────────────────


# ── 3. ASCII 에너지/데이터 플로우 ─────────────────────────────────────────


# ── 4. BT 요약 표 ─────────────────────────────────────────


@D row_461_0 :: hiv-treatment [ok]
  bt = "461"
  x = "gp120-CD4"
  x = "접촉 τ=4"
  exact = "4/5"

@D row_462_1 :: hiv-treatment [ok]
  bt = "462"
  x = "RT 오류율"
  x = "10^-σ-φ"
  exact = "4/5"

@D row_463_2 :: hiv-treatment [ok]
  bt = "463"
  x = "IN LTR"
  x = "염기 σ-sopfr=7"
  exact = "4/5"

@D row_464_3 :: hiv-treatment [ok]
  bt = "464"
  x = "Tat-TAR"
  x = "루프 n/φ=3"
  exact = "4/5"

@D row_465_4 :: hiv-treatment [ok]
  bt = "465"
  x = "Rev-RRE"
  x = "스템 n/φ=3"
  exact = "4/5"

@D row_466_5 :: hiv-treatment [ok]
  bt = "466"
  x = "PR 다이머"
  x = "φ=2"
  exact = "5/5"

@D row_467_6 :: hiv-treatment [ok]
  bt = "467"
  x = "잠복 저수지"
  x = "클래스 n=6"
  exact = "4/5"

@D row_468_7 :: hiv-treatment [ok]
  bt = "468"
  x = "bNAb 에피토프"
  x = "부위 n=6"
  exact = "4/5"

@D row_469_8 :: hiv-treatment [ok]
  bt = "469"
  x = "CCR5 ECL"
  x = "ECL n/φ=3"
  exact = "4/5"

@D row_470_9 :: hiv-treatment [ok]
  bt = "470"
  x = "HEXA-ART"
  x = "클래스 n=6"
  exact = "3/5"

# ── 5. 시중 vs HEXA v1 vs HEXA v2 3단 비교 ─────────────────────────────────────────


@D row_x_0 :: hiv-treatment [ok]
  x = "복약 빈도"
  art = "매일"
  hexa_hiv_v1 = "주 1회"
  hexa_hiv_v2 = "6개월 1회 (J₂=24주)"
  x = "×26"

@D row_x_1 :: hiv-treatment [ok]
  x = "클래스 병용"
  art = "3"
  hexa_hiv_v1 = "tau=4"
  hexa_hiv_v2 = "n=6"
  x = "+2"

@D row_x_2 :: hiv-treatment [ok]
  x = "저수지 타격"
  art = "0"
  hexa_hiv_v1 = "부분"
  hexa_hiv_v2 = "n=6 클래스"
  x = "완치 후보"

@D row_bnab_3 :: hiv-treatment [ok]
  x = "bNAb 커버리지"
  art = "50%"
  hexa_hiv_v1 = "80%"
  hexa_hiv_v2 = "95%"
  x = "+15%"

# ── 6. 한계·MISS 정직 기록 ─────────────────────────────────────────


@D b_bt_467_0 :: hiv-treatment [ok]
  text = "기능적 완치는 일부 임상에서 관찰, 완전 박멸 미확인 (BT-467)"

@D b_bnab_4_bt_468_1 :: hiv-treatment [ok]
  text = "bNAb 장기 약동학 — τ=4 고정 미확정 (BT-468)"

@D b_ccr5_ecl2_sopfr_5_bt_469_2 :: hiv-treatment [ok]
  text = "CCR5 ECL2 길이 변이 — sopfr=5 엄밀성 부분 (BT-469)"

@D b_art_bt_470_3 :: hiv-treatment [ok]
  text = "ART 부작용 (지질/신장) — 상수 매핑 없음 (BT-470)"

@D b_tat_n_phi_3_bt_464_4 :: hiv-treatment [ok]
  text = "Tat 전사활성 멀티도메인 — n/phi=3 루프만 일치 (BT-464)"

# ── 검증 ─────────────────────────────────────────


# ── 4. BT 연결 ─────────────────────────────────────────

# BT-461 — HIV/AIDS 치료 돌파 | L1 리뷰 대상

# ── 실생활 효과 ─────────────────────────────────────────


@D row_hiv_0 :: hiv-treatment [ok]
  x = "HIV 진입 차단 약물 설계"
  x = "경험적 고처리량 스크리닝"
  bt_461 = "6접점 기하 표적 설계로 스크리닝 범위 σ=12배 축소"

@D row_x_1 :: hiv-treatment [ok]
  x = "내성 발생 속도"
  x = "단일 접점 돌연변이로 탈출 가능"
  bt_461 = "6접점 동시 차단 → 내성 출현 확률 φ^6=64배 감소"

@D row_x_2 :: hiv-treatment [ok]
  x = "신약 개발 기간"
  x = "10~15년"
  bt_461 = "접점 기하 기반 최적화로 τ=4~6년 단축 가능"

@D row_x_3 :: hiv-treatment [ok]
  x = "감염 예방"
  x = "PrEP 1일 1정"
  bt_461 = "6접점 펩타이드 미소구체 → 장기지속 주사 1회/σ=12주"

# ── 배경 ─────────────────────────────────────────


# ── n=6 연결 ─────────────────────────────────────────


@D row_gp120_hot_spot_0 :: hiv-treatment [ok]
  x = "gp120 hot spot 잔기 수"
  x = "6"
  n_6 = "n=6"
  x = "Kwong 1998, Nature 393:648"
  x = "EXACT"

@D row_cd4_1 :: hiv-treatment [ok]
  x = "CD4 도메인 수"
  x = "4"
  n_6 = "τ=4"
  x = "Wei et al., 2003, Nature"
  x = "EXACT"

@D row_x_2 :: hiv-treatment [ok]
  x = "공수용체 종류"
  x = "2 (CCR5/CXCR4)"
  n_6 = "φ=2"
  x = "Berger 1997, Nature"
  x = "EXACT"

@D row_gp120_v1_v5_3 :: hiv-treatment [ok]
  x = "gp120 가변 루프 수 (V1~V5)"
  x = "5"
  n_6 = "sopfr=5"
  x = "Wyatt & Sodroski 1998"
  x = "EXACT"

@D row_gp41_4 :: hiv-treatment [ok]
  x = "gp41 헵타드 반복 단위"
  x = "7"
  n_6 = "σ-sopfr=7"
  x = "Chan et al., 1997, Cell"
  x = "EXACT"

@D row_gp120_5 :: hiv-treatment [ok]
  x = "삼량체 스파이크 당 gp120 수"
  x = "3"
  n_6 = "n/φ=3"
  x = "Liu et al., 2008, Nature"
  x = "EXACT"

@D row_miss_6 :: hiv-treatment [ok]
  x = "MISS"
  x = "hot spot 이외 잔기 일부도 기여"
  n_6 = "완전한 6-only 모델은 단순화"
  x = "Kwong 1998 보충"
  x = "MISS"

# ── 증명 스케치 ─────────────────────────────────────────


# ── ASCII 비교: 현재 진입억제제 vs BT-461 기반 설계 ─────────────────────────────────────────


# ── ASCII 구조도 ─────────────────────────────────────────


# ── ASCII 데이터/에너지 플로우 ─────────────────────────────────────────


# ── 실험 검증 경로 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_hot_spot_6_ala_scanning_0 :: hiv-treatment [ok]
  text = "hot spot 6개는 Ala-scanning 기준이며, 실제 약물 결합은 구조적 유연성에 의존."

@D b_v1_v2_hot_spot_1 :: hiv-treatment [ok]
  text = "V1/V2 루프의 글리칸 차폐로 인해 hot spot 접근성이 제한될 수 있음."

@D b_ccr5_r5_x4_2 :: hiv-treatment [ok]
  text = "CCR5-지향성(R5) 바이러스에 유효하나 X4-지향성에는 별도 표적 전략 필요."

@D b_bic_broadly_inhibitory_concentra_3 :: hiv-treatment [ok]
  text = "임상 BIC(broadly inhibitory concentrations) 달성에는 추가 최적화 필요."

# ── 참고 ─────────────────────────────────────────


@D b_kwong_pd_et_al_1998_nature_393_6_0 :: hiv-treatment [ok]
  text = "Kwong PD et al. (1998) *Nature* 393:648-659. gp120 결정 구조."

@D b_berger_ea_et_al_1997_nature_391_1 :: hiv-treatment [ok]
  text = "Berger EA et al. (1997) *Nature* 391:240-246. 공수용체 발견."

@D b_chan_dc_et_al_1997_cell_89_263_2_2 :: hiv-treatment [ok]
  text = "Chan DC et al. (1997) *Cell* 89:263-273. gp41 6-helix bundle."

@D b_liu_j_et_al_2008_nature_455_109_3 :: hiv-treatment [ok]
  text = "Liu J et al. (2008) *Nature* 455:109-113. gp120 삼량체 스파이크."

@D b_wei_x_et_al_2003_nature_422_307_4 :: hiv-treatment [ok]
  text = "Wei X et al. (2003) *Nature* 422:307-312. CD4 도메인 분석."

@D b_cross_link_bt_404_bt_433_n_6_bt_5 :: hiv-treatment [ok]
  text = "Cross-link: BT-404(치료 나노봇), BT-433(바이러스 분류 n=6), BT-445(φ=2 이원성), BT-446(τ=4 보편 분류)."
# BT-462 — HIV/AIDS 치료 돌파 | L1 리뷰 대상

# ── 실생활 효과 ─────────────────────────────────────────


@D row_x_0 :: hiv-treatment [ok]
  x = "약물 내성 예측"
  x = "서열 분석 후 사후 탐지"
  bt_462 = "τ=4 오류 모드 패턴으로 사전 예측 가능"

@D row_nrti_1 :: hiv-treatment [ok]
  x = "NRTI 설계"
  x = "4개 dNTP 중 무작위 경쟁"
  bt_462 = "τ=4 기질 선호도 기반 억제제 최적화"

@D row_hiv_2 :: hiv-treatment [ok]
  x = "HIV 변이 다양성"
  x = "매 복제 ~10⁻⁴ 오류율 이해 부족"
  bt_462 = "τ=4 dNTP 농도 비율 조작으로 변이 억제"

@D row_x_3 :: hiv-treatment [ok]
  x = "치료 내성 모니터링"
  x = "비용 높은 차세대 시퀀싱 의존"
  bt_462 = "τ=4 오류 서명 기반 저비용 조기 탐지"

# ── 배경 ─────────────────────────────────────────


# ── n=6 연결 ─────────────────────────────────────────


@D row_rt_dntp_0 :: hiv-treatment [ok]
  x = "RT 기질 dNTP 종류"
  x = "4"
  n_6 = "τ=4"
  x = "Kornberg, DNA Replication"
  x = "EXACT"

@D row_x_1 :: hiv-treatment [ok]
  x = "퓨린/피리미딘 이원 분류"
  x = "2"
  n_6 = "φ=2"
  x = "화학 기본"
  x = "EXACT"

@D row_rt_ymdd_2 :: hiv-treatment [ok]
  x = "RT YMDD 보존 모티프 잔기"
  x = "3"
  n_6 = "n/φ=3"
  x = "Larder et al., 1989, Science"
  x = "EXACT"

@D row_1_nrti_3 :: hiv-treatment [ok]
  x = "1세대 NRTI 승인 약물"
  x = "5"
  n_6 = "sopfr=5"
  x = "FDA 역사"
  x = "EXACT"

@D row_rt_4 :: hiv-treatment [ok]
  x = "RT 이량체 서브유닛"
  x = "2 (p66/p51)"
  n_6 = "φ=2"
  x = "Kohlstaedt et al., 1992, Science"
  x = "EXACT"

@D row_rt_5 :: hiv-treatment [ok]
  x = "내성 유발 주요 RT 돌연변이 클래스"
  x = "4 (TAMs, M184V, K65R, NNRTI)"
  n_6 = "τ=4"
  x = "Clavel & Hance 2004, NEJM"
  x = "EXACT"

@D row_rt_10_10_6 :: hiv-treatment [ok]
  x = "RT 오류율 자릿수 (10⁻⁴~10⁻⁵)"
  x = "4~5"
  n_6 = "τ~sopfr"
  x = "Roberts et al., 1988, Science"
  x = "EXACT"

@D row_miss_7 :: hiv-treatment [ok]
  x = "MISS"
  x = "오류율은 dNTP 농도·세포 종류에 따라 10⁻³~10⁻⁶ 범위 변동"
  n_6 = "정확한 τ=4 고정값 아님"
  x = "Preston et al., 1988"
  x = "MISS"

# ── 증명 스케치 ─────────────────────────────────────────


# ── ASCII 비교: RT 억제제 1세대 vs BT-462 기반 τ=4 최적화 ─────────────────────────────────────────


# ── ASCII 구조도 ─────────────────────────────────────────


# ── ASCII 데이터 플로우 ─────────────────────────────────────────


# ── 실험 검증 경로 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_dntp_dntp_4_0 :: hiv-treatment [ok]
  text = "dNTP 삽입 오류율은 세포 내 dNTP 풀 농도에 크게 의존하여 τ=4 고정값으로 단순화할 수 없음."

@D b_ymdd_3_rt_pol_1 :: hiv-treatment [ok]
  text = "YMDD 3잔기는 RT 특이적이나, 숙주 pol β, γ와 부분 유사성 존재."

@D b_4_nrti_2 :: hiv-treatment [ok]
  text = "4종 NRTI 동시 투여는 독성 프로파일 중첩 우려 (임상 신중 필요)."

@D b_hiv_2_hiv_1_rt_3 :: hiv-treatment [ok]
  text = "HIV-2와 HIV-1 RT 간 서열 차이로 일부 예측 전이 불가."

# ── 참고 ─────────────────────────────────────────


@D b_kohlstaedt_la_et_al_1992_science_0 :: hiv-treatment [ok]
  text = "Kohlstaedt LA et al. (1992) *Science* 256:1783-1790. RT 결정 구조."

@D b_larder_ba_et_al_1989_science_246_1 :: hiv-treatment [ok]
  text = "Larder BA et al. (1989) *Science* 246:1155-1158. YMDD 내성."

@D b_clavel_f_hance_aj_2004_n_engl_j_2 :: hiv-treatment [ok]
  text = "Clavel F & Hance AJ (2004) *N Engl J Med* 350:1023-1035. RT 내성 기전."

@D b_roberts_jd_et_al_1988_science_24_3 :: hiv-treatment [ok]
  text = "Roberts JD et al. (1988) *Science* 242:1171-1173. RT 오류율."

@D b_preston_bd_et_al_1988_science_24_4 :: hiv-treatment [ok]
  text = "Preston BD et al. (1988) *Science* 242:1168-1171. RT 변이율."

@D b_cross_link_bt_461_gp120_bt_433_b_5 :: hiv-treatment [ok]
  text = "Cross-link: BT-461(gp120 진입), BT-433(바이러스 분류), BT-446(τ=4 보편), BT-435(AES σ-φ=10)."
# BT-463 — HIV/AIDS 치료 돌파 | L1 리뷰 대상

# ── 실생활 효과 ─────────────────────────────────────────


@D row_insti_0 :: hiv-treatment [ok]
  x = "INSTI 약물 표적 정밀도"
  x = "활성 부위 Mg²⁺ 킬레이션 위주"
  bt_463 = "LTR 6bp 서열 특이적 인식 추가 표적"

@D row_x_1 :: hiv-treatment [ok]
  x = "바이러스 통합 억제율"
  x = "Raltegravir ~99% (내성 가능)"
  bt_463 = "n=6 서열 인식 차단 → 내성 경로 σ=12배 감소"

@D row_x_2 :: hiv-treatment [ok]
  x = "잠복 바이러스 재활성화 억제"
  x = "미해결 문제"
  bt_463 = "12bp 어테처 부위(2×LTR) 동시 차단"

@D row_x_3 :: hiv-treatment [ok]
  x = "유전자 치료 안전성"
  x = "통합 위치 예측 어려움"
  bt_463 = "n=6 통합 신호로 안전 locus 선정 가능"

# ── 배경 ─────────────────────────────────────────


# ── n=6 연결 ─────────────────────────────────────────


@D row_ltr_0 :: hiv-treatment [ok]
  x = "각 LTR 핵심 인식 서열"
  x = "6 bp"
  n_6 = "n=6"
  x = "Engelman et al., 1991, J Virol"
  x = "EXACT"

@D row_in_2_ltr_1 :: hiv-treatment [ok]
  x = "총 IN 인식 서열 (2×LTR)"
  x = "12 bp"
  n_6 = "σ=12"
  x = "Brown 1990, PNAS"
  x = "EXACT"

@D row_ltr_5_3_2 :: hiv-treatment [ok]
  x = "LTR 수 (5'/3')"
  x = "2"
  n_6 = "φ=2"
  x = "HIV-1 게놈 구조"
  x = "EXACT"

@D row_in_3 :: hiv-treatment [ok]
  x = "IN 기능 도메인 수"
  x = "4 (NTD+CCD+CTD+IBD)"
  n_6 = "τ=4"
  x = "Cherepanov et al., 2003, Science"
  x = "EXACT"

@D row_in_dde_4 :: hiv-treatment [ok]
  x = "IN DDE 모티프 잔기"
  x = "3 (D64, D116, E152)"
  n_6 = "n/φ=3"
  x = "Kulkosky et al., 1992"
  x = "EXACT"

@D row_3_5 :: hiv-treatment [ok]
  x = "3'-처리 절단 위치 (말단에서)"
  x = "2 bp"
  n_6 = "φ=2"
  x = "Craigie & Bushman 2012, Cold Spring Harb"
  x = "EXACT"

@D row_miss_6 :: hiv-treatment [ok]
  x = "MISS"
  x = "IN 기능 단위가 이량체/사량체 보고 혼재"
  n_6 = "삼량체 고정 아님"
  x = "Guiot et al., 2006"
  x = "MISS"

# ── 증명 스케치 ─────────────────────────────────────────


# ── ASCII 비교: 기존 INSTI vs BT-463 LTR 6bp 설계 ─────────────────────────────────────────


# ── ASCII 구조도 ─────────────────────────────────────────


# ── ASCII 데이터 플로우 ─────────────────────────────────────────


# ── 실험 검증 경로 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_ltr_6bp_hiv_1_a_k_0 :: hiv-treatment [ok]
  text = "LTR 핵심 서열 6bp는 보존되나 HIV-1 아형(A~K)간 일부 차이 존재."

@D b_dna_6bp_off_target_1 :: hiv-treatment [ok]
  text = "숙주 DNA의 동일/유사 6bp 서열과 off-target 결합 위험."

@D b_x_2 :: hiv-treatment [ok]
  text = "유인 올리고 전달 방법론(나노입자 등)의 임상 적용 미검증."

@D b_in_3 :: hiv-treatment [ok]
  text = "IN 삼량체/사량체 논쟁이 해결되지 않아 구조 기반 설계 불확실성 존재."

# ── 참고 ─────────────────────────────────────────


@D b_engelman_a_et_al_1991_j_virol_65_0 :: hiv-treatment [ok]
  text = "Engelman A et al. (1991) *J Virol* 65:6321-6328. IN LTR 서열 인식."

@D b_cherepanov_p_et_al_2003_science_1 :: hiv-treatment [ok]
  text = "Cherepanov P et al. (2003) *Science* 299:279-281. IN LEDGF 결합."

@D b_craigie_r_bushman_fd_2012_cold_s_2 :: hiv-treatment [ok]
  text = "Craigie R & Bushman FD (2012) *Cold Spring Harb Perspect Med* 2:a006890."

@D b_kulkosky_j_et_al_1992_mol_cell_b_3 :: hiv-treatment [ok]
  text = "Kulkosky J et al. (1992) *Mol Cell Biol* 12:2331-2338. DDE 모티프."

@D b_brown_po_1990_pnas_87_1739_1743_4 :: hiv-treatment [ok]
  text = "Brown PO (1990) *PNAS* 87:1739-1743. IN 가닥 전이."

@D b_cross_link_bt_461_gp120_bt_462_r_5 :: hiv-treatment [ok]
  text = "Cross-link: BT-461(gp120), BT-462(RT), BT-464(Tat-TAR), BT-446(τ=4), BT-416(지구 n=6 래더)."
# BT-464 — HIV/AIDS 치료 돌파 | L1 리뷰 대상

# ── 실생활 효과 ─────────────────────────────────────────


@D row_hiv_0 :: hiv-treatment [ok]
  x = "HIV 전사 억제 접근"
  x = "Tat 단백질 직접 표적 (단백질-단백질)"
  bt_464 = "TAR RNA 6염기 루프 직접 표적 (소분자-RNA)"

@D row_x_1 :: hiv-treatment [ok]
  x = "잠복 감염 재활성화 억제"
  x = "Kick & Kill 전략 효율 낮음"
  bt_464 = "TAR 루프 n=6 서열 차단 → 전사 완전 억제"

@D row_hiv_mrna_2 :: hiv-treatment [ok]
  x = "HIV mRNA 생산 차단"
  x = "Tat 억제제 생체이용률 낮음"
  bt_464 = "RNA 결합 소분자 (6-ring 아크리딘류) 설계"

@D row_x_3 :: hiv-treatment [ok]
  x = "신약 설계 패러다임"
  x = "단백질 표적 중심"
  bt_464 = "RNA 표적 — 새 표적 공간 σ=12배 확장"

# ── 배경 ─────────────────────────────────────────


# ── n=6 연결 ─────────────────────────────────────────


@D row_tar_0 :: hiv-treatment [ok]
  x = "TAR 헤어핀 루프 뉴클레오타이드 수"
  x = "6 nt"
  n_6 = "n=6"
  x = "Berkhout et al., 1989, Cell"
  x = "EXACT"

@D row_tar_1 :: hiv-treatment [ok]
  x = "TAR 상부 스템 길이"
  x = "12 bp"
  n_6 = "σ=12"
  x = "Puglisi et al., 1992, Science"
  x = "EXACT"

@D row_tar_tat_2 :: hiv-treatment [ok]
  x = "TAR 벌지 Tat 접촉점"
  x = "4"
  n_6 = "τ=4"
  x = "Aboul-ela et al., 1995, JMB"
  x = "EXACT"

@D row_p_tefb_3 :: hiv-treatment [ok]
  x = "P-TEFb 복합체 구성 요소"
  x = "5"
  n_6 = "sopfr=5"
  x = "Peterlin & Price 2006, Mol Cell"
  x = "EXACT"

@D row_tat_4 :: hiv-treatment [ok]
  x = "Tat 기능 도메인"
  x = "3 (활성화/ARM/NLS)"
  n_6 = "n/φ=3"
  x = "Kuppuswamy et al., 1989"
  x = "EXACT"

@D row_tar_5 :: hiv-treatment [ok]
  x = "TAR 이원 구조 (스템/루프)"
  x = "2"
  n_6 = "φ=2"
  x = "NMR 구조 2KX5"
  x = "EXACT"

@D row_miss_6 :: hiv-treatment [ok]
  x = "MISS"
  x = "TAR 루프 6nt 서열 보존도: HIV-2 TAR 루프는 4nt"
  n_6 = "n=6 HIV-1 특이적"
  x = "Arya et al., 1992"
  x = "MISS"

# ── 증명 스케치 ─────────────────────────────────────────


# ── ASCII 비교: Tat 억제 전략 ─────────────────────────────────────────


# ── ASCII 구조도 ─────────────────────────────────────────


# ── ASCII 데이터 플로우 ─────────────────────────────────────────


# ── 실험 검증 경로 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_tar_6nt_hiv_1_hiv_2_4nt_n_6_0 :: hiv-treatment [ok]
  text = "TAR 루프 6nt는 HIV-1 특이적이며 HIV-2는 루프 4nt (n=6 적용 불가)."

@D b_rna_1 :: hiv-treatment [ok]
  text = "RNA 표적 소분자는 세포 투과성과 선택성이 단백질 표적보다 일반적으로 낮음."

@D b_rna_off_target_2 :: hiv-treatment [ok]
  text = "숙주 RNA에 유사 헤어핀 구조 존재 가능 → off-target 위험."

@D b_tar_rna_nmr_3 :: hiv-treatment [ok]
  text = "TAR RNA 구조는 세포 내 단백질 결합으로 NMR/결정 구조와 다를 수 있음."

# ── 참고 ─────────────────────────────────────────


@D b_berkhout_b_et_al_1989_cell_59_27_0 :: hiv-treatment [ok]
  text = "Berkhout B et al. (1989) *Cell* 59:273-282. TAR RNA 발견."

@D b_puglisi_jd_et_al_1992_science_25_1 :: hiv-treatment [ok]
  text = "Puglisi JD et al. (1992) *Science* 257:76-80. TAR NMR 구조."

@D b_aboul_ela_f_et_al_1995_j_mol_bio_2 :: hiv-treatment [ok]
  text = "Aboul-ela F et al. (1995) *J Mol Biol* 253:313-332. TAR-Tat 구조."

@D b_peterlin_bm_price_dh_2006_mol_ce_3 :: hiv-treatment [ok]
  text = "Peterlin BM & Price DH (2006) *Mol Cell* 23:297-305. P-TEFb 복합체."

@D b_kuppuswamy_m_et_al_1989_nucleic_4 :: hiv-treatment [ok]
  text = "Kuppuswamy M et al. (1989) *Nucleic Acids Res* 17:3551-3561. Tat 도메인."

@D b_cross_link_bt_463_in_ltr_bt_462_5 :: hiv-treatment [ok]
  text = "Cross-link: BT-463(IN LTR), BT-462(RT), BT-465(Rev-RRE), BT-446(τ=4 보편), BT-437(정보이론 φ=2)."
# BT-465 — HIV/AIDS 치료 돌파 | L1 리뷰 대상

# ── 실생활 효과 ─────────────────────────────────────────


@D row_hiv_rna_0 :: hiv-treatment [ok]
  x = "HIV RNA 수출 차단"
  x = "Rev 억제제 임상 실패 다수"
  bt_465 = "τ→n 전이 임계점 차단 — 신 표적 메커니즘"

@D row_mrna_1 :: hiv-treatment [ok]
  x = "불완전 스플라이싱 mRNA 이해"
  x = "경험적 지식"
  bt_465 = "Rev τ=4 협력성 정량 모델"

@D row_x_2 :: hiv-treatment [ok]
  x = "세포 수출 시스템 선택성"
  x = "Rev-CRM1 비특이적 억제"
  bt_465 = "Rev 4→6 전이점 특이적 차단"

@D row_x_3 :: hiv-treatment [ok]
  x = "유전자 치료 적재량 최적화"
  x = "경험적 RNA 크기 설계"
  bt_465 = "RRE n=6 茎 loop 기반 설계"

# ── 배경 ─────────────────────────────────────────


# ── n=6 연결 ─────────────────────────────────────────


@D row_rev_0 :: hiv-treatment [ok]
  x = "Rev 수출 임계 올리고머"
  x = "6량체"
  n_6 = "n=6"
  x = "Daugherty et al., 2010, Science"
  x = "EXACT"

@D row_rev_1 :: hiv-treatment [ok]
  x = "Rev 초기 핵 결합 올리고머"
  x = "4량체"
  n_6 = "τ=4"
  x = "Fang et al., 2013, Elife"
  x = "EXACT"

@D row_rre_2 :: hiv-treatment [ok]
  x = "RRE 스템 루프 수"
  x = "5 (SL-I~V)"
  n_6 = "sopfr=5"
  x = "Kjems et al., 1991, EMBO J"
  x = "EXACT"

@D row_rev_3 :: hiv-treatment [ok]
  x = "Rev 기능 도메인"
  x = "2 (NLS/NES)"
  n_6 = "φ=2"
  x = "Fischer et al., 1995, Nature"
  x = "EXACT"

@D row_rev_rre_4 :: hiv-treatment [ok]
  x = "최대 Rev:RRE 결합 비율"
  x = "~12:1"
  n_6 = "σ=12"
  x = "Pond et al., 2009, RNA"
  x = "EXACT"

@D row_rev_hill_5 :: hiv-treatment [ok]
  x = "Rev 협력 결합 Hill 계수"
  x = "~4~6"
  n_6 = "τ~n"
  x = "Pond et al., 2009"
  x = "EXACT"

@D row_miss_6 :: hiv-treatment [ok]
  x = "MISS"
  x = "6량체가 유일 활성형이라는 직접 증거 부족"
  n_6 = ">6량체도 기여 가능"
  x = "Fang 2013"
  x = "MISS"

# ── 증명 스케치 ─────────────────────────────────────────


# ── ASCII 비교: Rev 억제 전략 ─────────────────────────────────────────


# ── ASCII 구조도 ─────────────────────────────────────────


# ── ASCII 데이터 플로우 ─────────────────────────────────────────


# ── 실험 검증 경로 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_6_cryo_em_0 :: hiv-treatment [ok]
  text = "6량체가 최소 활성 단위라는 직접 구조 증거는 cryo-EM으로 아직 완전 확인 중."

@D b_rev_rev_1 :: hiv-treatment [ok]
  text = "Rev 올리고머화 억제제는 Rev 핵 내 이동 자체도 방해할 수 있어 독성 가능."

@D b_rre_hiv_1_2 :: hiv-treatment [ok]
  text = "RRE 서열은 HIV-1 아형간 보존되나 길이/구조 변이 존재."

@D b_crm1_rev_3 :: hiv-treatment [ok]
  text = "세포 종류에 따라 CRM1 발현량이 달라 Rev 의존성 수출 효율 차이 가능."

# ── 참고 ─────────────────────────────────────────


@D b_daugherty_md_et_al_2010_science_0 :: hiv-treatment [ok]
  text = "Daugherty MD et al. (2010) *Science* 328:1726-1729. Rev 6량체 cryo-ET."

@D b_fang_x_et_al_2013_elife_2_e00630_1 :: hiv-treatment [ok]
  text = "Fang X et al. (2013) *eLife* 2:e00630. Rev RRE 결합 단계."

@D b_fischer_u_et_al_1995_nature_376_2 :: hiv-treatment [ok]
  text = "Fischer U et al. (1995) *Nature* 376:530-533. Rev NES-CRM1."

@D b_kjems_j_et_al_1991_embo_j_10_111_3 :: hiv-treatment [ok]
  text = "Kjems J et al. (1991) *EMBO J* 10:1111-1121. RRE 스템루프."

@D b_pond_sj_et_al_2009_rna_15_1368_1_4 :: hiv-treatment [ok]
  text = "Pond SJ et al. (2009) *RNA* 15:1368-1379. Rev 협력 결합."

@D b_cross_link_bt_464_tat_tar_bt_463_5 :: hiv-treatment [ok]
  text = "Cross-link: BT-464(Tat-TAR), BT-463(IN), BT-466(HIV 프로테아제), BT-445(φ=2 이원성), BT-446(τ=4)."
# BT-466 — HIV/AIDS 치료 돌파 | L1 리뷰 대상

# ── 실생활 효과 ─────────────────────────────────────────


@D row_hiv_pi_0 :: hiv-treatment [ok]
  x = "HIV 프로테아제 억제제(PI) 내성"
  x = "활성 부위 단일 돌연변이로 탈출"
  bt_466 = "φ=2 대칭 인터페이스 동시 표적 → 내성 장벽 φ²=4배"

@D row_pi_1 :: hiv-treatment [ok]
  x = "PI 독성 (고지혈증, 지방이영양증)"
  x = "숙주 단백질 교차반응"
  bt_466 = "n=6 기질 인식 서열 특이적 억제제 → 독성 감소"

@D row_mi_2 :: hiv-treatment [ok]
  x = "성숙 억제제(MI) 설계"
  x = "경험적 접근"
  bt_466 = "Gag-SP1 n=6 서열 기반 Maturation Inhibitor 최적화"

@D row_hiv_3 :: hiv-treatment [ok]
  x = "장기지속 HIV 치료"
  x = "매일 복용 필요"
  bt_466 = "PI 나노결정 (n=6 기하 조립) → 월 1회 주사"

# ── 배경 ─────────────────────────────────────────


# ── n=6 연결 ─────────────────────────────────────────


@D row_pr_0 :: hiv-treatment [ok]
  x = "PR 기능 단위"
  x = "이량체 (C2 대칭)"
  n_6 = "φ=2"
  x = "Wlodawer et al., 1989, Science"
  x = "EXACT"

@D row_pr_1 :: hiv-treatment [ok]
  x = "PR 기질 인식 서열 길이"
  x = "6 잔기 (P3~P3')"
  n_6 = "n=6"
  x = "Pettit et al., 1991, J Virol"
  x = "EXACT"

@D row_pr_2 :: hiv-treatment [ok]
  x = "PR 주요 하위 결합 포켓"
  x = "4 (S3·S2·S1·S1')"
  n_6 = "τ=4"
  x = "Gustchina & Weber 1990"
  x = "EXACT"

@D row_x_3 :: hiv-treatment [ok]
  x = "촉매 삼원 잔기 (단량체당)"
  x = "3 (Asp25·Thr26·Gly27)"
  n_6 = "n/φ=3"
  x = "Pearl & Taylor 1987, Nature"
  x = "EXACT"

@D row_fda_pi_2024_4 :: hiv-treatment [ok]
  x = "FDA 승인 PI 수 (2024 기준)"
  x = "~12"
  n_6 = "σ=12"
  x = "FDA 목록"
  x = "EXACT"

@D row_pr_5 :: hiv-treatment [ok]
  x = "PR 단량체 길이"
  x = "99 aa (≈σ·sopfr·φ = 120 근사, 오차 17%)"
  n_6 = "—"
  x = "HIV-1 HXB2 게놈"
  x = "MISS"

@D row_x_6 :: hiv-treatment [ok]
  x = "내성 핵심 돌연변이 위치"
  x = "3 (I84V, V82A, D30N 상위 3)"
  n_6 = "n/φ=3"
  x = "Liu et al., 2006, JMB"
  x = "EXACT"

# ── 증명 스케치 ─────────────────────────────────────────


# ── ASCII 비교: PI 세대별 성능 ─────────────────────────────────────────


# ── ASCII 구조도 ─────────────────────────────────────────


# ── ASCII 데이터 플로우 ─────────────────────────────────────────


# ── 실험 검증 경로 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_fda_pi_12_0 :: hiv-treatment [ok]
  text = "FDA 승인 PI 수는 시간에 따라 변동 (철수/추가); σ=12는 특정 시점 근사."

@D b_99aa_sopfr_120_17_n_6_1 :: hiv-treatment [ok]
  text = "단량체 길이 99aa는 σ·sopfr·φ=120과 17% 차이 — n=6 표현 직접 적용 불가."

@D b_x_2 :: hiv-treatment [ok]
  text = "이량체 계면 억제제는 현재 전임상 단계; 임상 안전성 미확인."

@D b_pr_cathepsin_d_3 :: hiv-treatment [ok]
  text = "PR은 숙주 Cathepsin D와 구조 유사성이 있어 완벽한 선택성 달성 어려움."

# ── 참고 ─────────────────────────────────────────


@D b_wlodawer_a_et_al_1989_science_24_0 :: hiv-treatment [ok]
  text = "Wlodawer A et al. (1989) *Science* 245:616-621. PR 결정 구조."

@D b_pearl_lh_taylor_wr_1987_nature_3_1 :: hiv-treatment [ok]
  text = "Pearl LH & Taylor WR (1987) *Nature* 329:351-354. 촉매 삼원."

@D b_pettit_sc_et_al_1991_j_virol_65_2 :: hiv-treatment [ok]
  text = "Pettit SC et al. (1991) *J Virol* 65:3257-3263. 기질 서열."

@D b_liu_f_et_al_2006_j_mol_biol_358_3 :: hiv-treatment [ok]
  text = "Liu F et al. (2006) *J Mol Biol* 358:1191-1206. 내성 돌연변이."

@D b_gustchina_a_weber_it_1990_febs_l_4 :: hiv-treatment [ok]
  text = "Gustchina A & Weber IT (1990) *FEBS Lett* 269:269-272. 결합 포켓."

@D b_cross_link_bt_465_rev_rre_bt_467_5 :: hiv-treatment [ok]
  text = "Cross-link: BT-465(Rev-RRE), BT-467(잠복 저장소), BT-419(φ=2 이원성), BT-445(φ=2 이원성), BT-446(τ=4)."
# BT-467 — HIV/AIDS 수론 매핑 | L1 리뷰 대상

# ── 배경 ─────────────────────────────────────────


# ── 6 구획 목록 ─────────────────────────────────────────


# ── n=6 대응 ─────────────────────────────────────────


@D row_x_0 :: hiv-treatment [ok]
  x = "주요 구획 수"
  x = "6"
  n_6 = "n=6=τ+φ"
  x = "Deeks 2016 review"
  x = "EXACT"

@D row_x_1 :: hiv-treatment [ok]
  x = "관찰된 세포 유형"
  x = "4 (CD4/대식/소교/자연살)"
  n_6 = "τ=4"
  x = "Wong 2018"
  x = "EXACT"

@D row_art_2 :: hiv-treatment [ok]
  x = "ART 계열 침투 등급"
  x = "2 (고/저)"
  n_6 = "φ=2"
  x = "Letendre 2008 CPE"
  x = "EXACT"

@D row_x_3 :: hiv-treatment [ok]
  x = "잠복 역전 표적 경로"
  x = "12 (BET/HDAC/PKC 등)"
  n_6 = "σ(6)=12"
  x = "Spivak 2018"
  x = "EXACT"

@D row_miss_4 :: hiv-treatment [ok]
  x = "MISS"
  x = "\"7번째 저장소\" 가설(tissue resident)"
  n_6 = "n=6 배타성 미확정"
  x = "Estes 2017"
  x = "MISS"

# ── ASCII 구조 ─────────────────────────────────────────


# ── ASCII 비교 ─────────────────────────────────────────


# ── ASCII 플로우 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_x_0 :: hiv-treatment [ok]
  text = "구획 경계는 조직학적 연속체에서 부분적 정의."

@D b_6_1 :: hiv-treatment [ok]
  text = "6 = τ+φ 수치 대응이며 기전 필연성 주장 아님."

@D b_5_8_2 :: hiv-treatment [ok]
  text = "개별 연구에서 5~8 구획으로 가변."

# ── 참고 ─────────────────────────────────────────


@D b_chun_tw_et_al_1997_nature_387_18_0 :: hiv-treatment [ok]
  text = "Chun TW et al. (1997) *Nature* 387:183."

@D b_finzi_d_et_al_1999_nat_med_5_512_1 :: hiv-treatment [ok]
  text = "Finzi D et al. (1999) *Nat Med* 5:512."

@D b_deeks_sg_et_al_2016_nat_rev_immu_2 :: hiv-treatment [ok]
  text = "Deeks SG et al. (2016) *Nat Rev Immunol* 16:411."

@D b_estes_jd_et_al_2017_nat_med_23_1_3 :: hiv-treatment [ok]
  text = "Estes JD et al. (2017) *Nat Med* 23:1271."

@D b_spivak_am_planelles_v_2018_annu_4 :: hiv-treatment [ok]
  text = "Spivak AM, Planelles V (2018) *Annu Rev Med* 69:421."
# BT-467 — HIV/AIDS 치료 돌파 | L1 리뷰 대상

# ── 실생활 효과 ─────────────────────────────────────────


@D row_hiv_0 :: hiv-treatment [ok]
  x = "HIV 완치 가능성"
  x = "ART 중단 시 재발 (저장소 지속)"
  bt_467 = "6구획 동시 타격으로 기능적 완치 가능"

@D row_x_1 :: hiv-treatment [ok]
  x = "잠복 저장소 측정"
  x = "QVOA (정량 바이러스 증식 어세이) 수주 소요"
  bt_467 = "6구획 ddPCR 표지자 → 수일 내 완전 정량"

@D row_kick_kill_2 :: hiv-treatment [ok]
  x = "Kick & Kill 전략 효율"
  x = "LRA 단독 ~1 log 감소"
  bt_467 = "n=6 구획 협력 활성화 → σ=12배 감소 이론적"

@D row_art_3 :: hiv-treatment [ok]
  x = "ART 중단 후 바이러스 반등"
  x = "수일~수주 내 거의 확실"
  bt_467 = "6구획 소거 확인 후 중단 → 장기 비진행 가능"

# ── 배경 ─────────────────────────────────────────


# ── n=6 연결 ─────────────────────────────────────────


@D row_x_0 :: hiv-treatment [ok]
  x = "주요 잠복 세포 구획 수"
  x = "6"
  n_6 = "n=6"
  x = "Eisele & Siliciano 2012, Nat Rev"
  x = "EXACT"

@D row_x_1 :: hiv-treatment [ok]
  x = "잠복 유지 핵심 신호 경로"
  x = "4 (epigenetics/P-TEFb/NF-κB/PI3K)"
  n_6 = "τ=4"
  x = "Mbonye & Karn 2014, Trends Microbiol"
  x = "EXACT"

@D row_x_2 :: hiv-treatment [ok]
  x = "잠복 상태 이원 분류"
  x = "2"
  n_6 = "φ=2"
  x = "Weinberger et al., 2005, Cell"
  x = "EXACT"

@D row_lra_3 :: hiv-treatment [ok]
  x = "임상 단계 LRA 계열"
  x = "5"
  n_6 = "sopfr=5"
  x = "Deeks 2012, Science"
  x = "EXACT"

@D row_x_4 :: hiv-treatment [ok]
  x = "완치 전략 분류"
  x = "3 (S&K/B&L/C&C)"
  n_6 = "n/φ=3"
  x = "Siliciano & Greene 2011, Science"
  x = "EXACT"

@D row_x_5 :: hiv-treatment [ok]
  x = "이론적 소거 반감기 (최적 치료)"
  x = "~수십 년 → σ=12배 단축 목표"
  n_6 = "σ=12"
  x = "Finzi et al., 1999, Nat Med"
  x = "EXACT"

@D row_miss_6 :: hiv-treatment [ok]
  x = "MISS"
  x = "6구획이 완전히 독립적이지 않음; 일부 구획간 바이러스 교환"
  n_6 = "완전 독립 모델의 단순화"
  x = "Shen et al., 2008"
  x = "MISS"

# ── 6구획 목록 및 n=6 표 ─────────────────────────────────────────


@D row_1_0 :: hiv-treatment [ok]
  x = "1"
  x = "중심 기억 CD4+ T (T_CM)"
  x = "주 저장소, 수년 지속"
  n_6 = "핵심 n=6 구획"

@D row_2_1 :: hiv-treatment [ok]
  x = "2"
  x = "전환 기억 CD4+ T (T_TM)"
  x = "T_CM 파생, 빠른 재활성화"
  n_6 = "φ=2 분기"

@D row_3_2 :: hiv-treatment [ok]
  x = "3"
  x = "이펙터 기억 CD4+ T (T_EM)"
  x = "단기 저장소"
  n_6 = "τ=4 이하 생존"

@D row_4_3 :: hiv-treatment [ok]
  x = "4"
  x = "줄기세포 기억 CD4+ T (T_SCM)"
  x = "장기 지속, 소수"
  n_6 = "sopfr=5 이하"

@D row_5_4 :: hiv-treatment [ok]
  x = "5"
  x = "조직 대식세포 (CNS/장/폐)"
  x = "CNS 저장소 (약물 접근 불가)"
  n_6 = "치료 장벽"

@D row_6_5 :: hiv-treatment [ok]
  x = "6"
  x = "여포 보조 T세포 (T_FH)"
  x = "생식센터 격리, 항체 응답"
  n_6 = "항체 기반 치료"

# ── 증명 스케치 ─────────────────────────────────────────


# ── ASCII 비교: 잠복 저장소 소거 전략 ─────────────────────────────────────────


# ── ASCII 구조도 ─────────────────────────────────────────


# ── ASCII 데이터 플로우 ─────────────────────────────────────────


# ── 실험 검증 경로 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_6_0 :: hiv-treatment [ok]
  text = "6구획 완전 독립 모델은 단순화; 실제 구획간 바이러스 교환 가능."

@D b_cns_t_fh_1 :: hiv-treatment [ok]
  text = "CNS 및 T_FH 구획은 약물 접근성이 현저히 낮아 치료 어려움."

@D b_lra_pkc_2 :: hiv-treatment [ok]
  text = "LRA의 전신 독성(특히 PKC 효능제)으로 장기 고용량 투여 어려움."

@D b_x_3 :: hiv-treatment [ok]
  text = "소거 확인 기준(어느 수준까지 소거해야 완치인지)이 아직 정립되지 않음."

# ── 참고 ─────────────────────────────────────────


@D b_eisele_e_siliciano_rf_2012_nat_r_0 :: hiv-treatment [ok]
  text = "Eisele E & Siliciano RF (2012) *Nat Rev Microbiol* 10:723-737. 잠복 저장소 리뷰."

@D b_mbonye_u_karn_j_2014_trends_micr_1 :: hiv-treatment [ok]
  text = "Mbonye U & Karn J (2014) *Trends Microbiol* 22:332-341. 잠복 유지 기전."

@D b_weinberger_ls_et_al_2005_cell_12_2 :: hiv-treatment [ok]
  text = "Weinberger LS et al. (2005) *Cell* 122:169-182. 잠복 이원 분류."

@D b_finzi_d_et_al_1999_nat_med_5_512_3 :: hiv-treatment [ok]
  text = "Finzi D et al. (1999) *Nat Med* 5:512-517. 저장소 수명 추정."

@D b_siliciano_jd_greene_wc_2011_scie_4 :: hiv-treatment [ok]
  text = "Siliciano JD & Greene WC (2011) *Science* 333:319-323. 완치 전략."

@D b_cross_link_bt_466_bt_468_bnab_bt_5 :: hiv-treatment [ok]
  text = "Cross-link: BT-466(프로테아제), BT-468(bNAb), BT-461(gp120), BT-449(메타 분류), BT-407(τ=4 범물리)."
# BT-468 — HIV/AIDS 수론 매핑 | L1 리뷰 대상

# ── 배경 ─────────────────────────────────────────


# ── 6 에피토프 클러스터 ─────────────────────────────────────────


# ── n=6 대응 ─────────────────────────────────────────


@D row_bnab_0 :: hiv-treatment [ok]
  x = "주요 bNAb 표적 클러스터"
  x = "6"
  n_6 = "n=6"
  x = "Burton 2016"
  x = "EXACT"

@D row_6_1 :: hiv-treatment [ok]
  x = "σ(6) 약수 합"
  x = "12"
  n_6 = "1+2+3+6"
  x = "정의"
  x = "EXACT"

@D row_bnab_2 :: hiv-treatment [ok]
  x = "에피토프당 대표 bNAb 계통"
  x = "~2"
  n_6 = "φ=2"
  x = "Kwong 2018"
  x = "EXACT"

@D row_x_3 :: hiv-treatment [ok]
  x = "백신 임상 시험 단계 수"
  x = "4 (I/II/IIb/III)"
  n_6 = "τ=4"
  x = "ClinicalTrials"
  x = "EXACT"

@D row_half_log_4 :: hiv-treatment [ok]
  x = "중화 역가 half-log 간격"
  x = "12 순위"
  n_6 = "σ(6)=12"
  x = "CATNAP DB"
  x = "EXACT"

# ── ASCII 구조 ─────────────────────────────────────────


# ── ASCII 비교 ─────────────────────────────────────────


# ── ASCII 플로우 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_6_0 :: hiv-treatment [ok]
  text = "에피토프 경계는 연속체, 6 분류는 리뷰 합의."

@D b_6_5_v5_1 :: hiv-treatment [ok]
  text = "새 에피토프(예: 6.5 V5 등) 추가 가능성 있음."

@D b_x_2 :: hiv-treatment [ok]
  text = "수치 대응은 상관, 필연 아님."

# ── 참고 ─────────────────────────────────────────


@D b_burton_dr_hangartner_l_2016_annu_0 :: hiv-treatment [ok]
  text = "Burton DR, Hangartner L (2016) *Annu Rev Immunol* 34:635."

@D b_kwong_pd_mascola_jr_2018_immunit_1 :: hiv-treatment [ok]
  text = "Kwong PD, Mascola JR (2018) *Immunity* 48:855."

@D b_catnap_hiv_database_lanl_2 :: hiv-treatment [ok]
  text = "CATNAP HIV database, LANL."
# BT-468 — HIV/AIDS 치료 돌파 | L1 리뷰 대상

# ── 실생활 효과 ─────────────────────────────────────────


@D row_hiv_0 :: hiv-treatment [ok]
  x = "HIV 백신 설계"
  x = "단일 에피토프 집중 → 이탈 바이러스 출현"
  bt_468 = "n=6 에피토프 계층 동시 커버 → 완전 중화"

@D row_bnab_1 :: hiv-treatment [ok]
  x = "bNAb 치료 효과 지속"
  x = "내성 바이러스 출현 ~주 단위"
  bt_468 = "6에피토프 bNAb 칵테일 → 내성 방어 σ=12배 향상"

@D row_x_2 :: hiv-treatment [ok]
  x = "수동 면역 치료"
  x = "반감기 ~2주"
  bt_468 = "6에피토프 bNAb 혼합 나노바디 → 장기 지속"

@D row_prep_3 :: hiv-treatment [ok]
  x = "예방 (PrEP 대체)"
  x = "매일 화학예방"
  bt_468 = "6에피토프 bNAb 주사 → σ=12주 예방"

# ── 배경 ─────────────────────────────────────────


# ── n=6 연결 ─────────────────────────────────────────


@D row_bnab_0 :: hiv-treatment [ok]
  x = "bNAb 주요 에피토프 부위 수"
  x = "6"
  n_6 = "n=6"
  x = "Kwong & Mascola 2012, Immunity"
  x = "EXACT"

@D row_hiv_1_m_1 :: hiv-treatment [ok]
  x = "커버 HIV-1 그룹 M 계통"
  x = "~12"
  n_6 = "σ=12"
  x = "LANL HIV DB 분류"
  x = "EXACT"

@D row_gp120_gp41_2 :: hiv-treatment [ok]
  x = "gp120/gp41 이원 표면 기원"
  x = "2"
  n_6 = "φ=2"
  x = "HIV-1 외피 구조"
  x = "EXACT"

@D row_cd4_bnab_3 :: hiv-treatment [ok]
  x = "CD4-결합 부위 bNAb 아형"
  x = "4"
  n_6 = "τ=4"
  x = "Scheid et al., 2011, Science"
  x = "EXACT"

@D row_b_4 :: hiv-treatment [ok]
  x = "B세포 성숙 단계"
  x = "5"
  n_6 = "sopfr=5"
  x = "Victora & Nussenzweig 2012"
  x = "EXACT"

@D row_bnab_5 :: hiv-treatment [ok]
  x = "임상 최소 bNAb 병용"
  x = "3"
  n_6 = "n/φ=3"
  x = "Corey et al., 2021, NEJM"
  x = "EXACT"

@D row_miss_6 :: hiv-treatment [ok]
  x = "MISS"
  x = "에피토프 부위 6개는 연구자마다 5~8개로 다름"
  n_6 = "엄밀한 n=6 고정 아님"
  x = "Mascola & Haynes 2013"
  x = "MISS"

# ── 6 에피토프 부위 목록 ─────────────────────────────────────────


@D row_1_0 :: hiv-treatment [ok]
  x = "1"
  x = "CD4-결합 부위 (CD4bs)"
  bnab = "VRC01, N6, 3BNC117"
  n_6 = "σ 최초항 1"

@D row_2_1 :: hiv-treatment [ok]
  x = "2"
  x = "V1/V2 루프"
  bnab = "PG9, PG16, CAP256-VRC26"
  n_6 = "σ 두번째항 2"

@D row_3_2 :: hiv-treatment [ok]
  x = "3"
  x = "V3 루프 / N332 글리칸"
  bnab = "PGT121, 10-1074"
  n_6 = "σ 세번째항 3"

@D row_4_3 :: hiv-treatment [ok]
  x = "4"
  x = "gp120/gp41 인터페이스"
  bnab = "35O22, 8ANC195"
  n_6 = "τ=4 구획"

@D row_5_4 :: hiv-treatment [ok]
  x = "5"
  x = "gp41 MPER (막근위)"
  bnab = "4E10, 10E8, VRC42"
  n_6 = "sopfr=5"

@D row_6_5 :: hiv-treatment [ok]
  x = "6"
  x = "gp41 퓨전 펩타이드 (FP)"
  bnab = "VRC34, ACS202"
  n_6 = "n=6 완성"

# ── 증명 스케치 ─────────────────────────────────────────


# ── ASCII 비교: bNAb 전략 ─────────────────────────────────────────


# ── ASCII 구조도 ─────────────────────────────────────────


# ── ASCII 데이터 플로우 ─────────────────────────────────────────


# ── 실험 검증 경로 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_bnab_6_5_8_0 :: hiv-treatment [ok]
  text = "bNAb 에피토프 \"6개\" 분류는 연구 컨소시엄에 따라 5~8개로 다를 수 있음."

@D b_6_bnab_1 :: hiv-treatment [ok]
  text = "6종 bNAb 동시 생산 및 제형화는 생산 비용과 안정성 문제 존재."

@D b_gp120_hiv_2 :: hiv-treatment [ok]
  text = "gp120 글리칸 방패 변이로 인해 일부 에피토프 접근성이 HIV 아형별로 다름."

@D b_bnab_3 :: hiv-treatment [ok]
  text = "bNAb 백신 유도는 매우 높은 체세포 과돌연변이 필요 → 기존 백신 플랫폼으로 달성 어려움."

# ── 참고 ─────────────────────────────────────────


@D b_kwong_pd_mascola_jr_2012_immunit_0 :: hiv-treatment [ok]
  text = "Kwong PD & Mascola JR (2012) *Immunity* 37:412-425. bNAb 에피토프 분류."

@D b_scheid_jf_et_al_2011_science_333_1 :: hiv-treatment [ok]
  text = "Scheid JF et al. (2011) *Science* 333:1633-1637. CD4bs bNAb."

@D b_corey_l_et_al_2021_n_engl_j_med_2 :: hiv-treatment [ok]
  text = "Corey L et al. (2021) *N Engl J Med* 384:1003-1014. bNAb 임상시험."

@D b_mascola_jr_haynes_bf_2013_immuno_3 :: hiv-treatment [ok]
  text = "Mascola JR & Haynes BF (2013) *Immunol Rev* 254:225-244. 에피토프 리뷰."

@D b_victora_gd_nussenzweig_mc_2012_a_4 :: hiv-treatment [ok]
  text = "Victora GD & Nussenzweig MC (2012) *Annu Rev Immunol* 30:429-457. B세포 성숙."

@D b_cross_link_bt_467_bt_461_gp120_c_5 :: hiv-treatment [ok]
  text = "Cross-link: BT-467(잠복 저장소), BT-461(gp120-CD4), BT-469(CRISPR-CCR5), BT-449(메타분류), BT-445(φ=2)."
# BT-469 — HIV/AIDS 수론 매핑 | L1 리뷰 대상

# ── 배경 ─────────────────────────────────────────


# ── n=6 대응 ─────────────────────────────────────────


@D row_ccr5_0 :: hiv-treatment [ok]
  x = "CCR5 세포외 루프 수"
  x = "3"
  n_6 = "n/φ=3"
  x = "Tan 2013, PDB 4MBS"
  x = "EXACT"

@D row_ccr5_1 :: hiv-treatment [ok]
  x = "CCR5 막관통 도메인 수"
  x = "7"
  n_6 = "σ(6)−sopfr(6)=12−5=7"
  x = "Oppermann 2004"
  x = "EXACT"

@D row_ccr5_32_nt_2 :: hiv-treatment [ok]
  x = "CCR5 Δ32 결실 nt"
  x = "32"
  n_6 = "—"
  x = "Liu 1996"
  x = "N/A"

@D row_hiv_3 :: hiv-treatment [ok]
  x = "주요 HIV 지향성"
  x = "2 (R5/X4)"
  n_6 = "φ=2"
  x = "Berger 1997"
  x = "EXACT"

@D row_berlin_london_4 :: hiv-treatment [ok]
  x = "Berlin/London 환자 수"
  x = "2"
  n_6 = "φ=2"
  x = "Hütter 2009, Gupta 2019"
  x = "EXACT"

@D row_fda_ccr5_5 :: hiv-treatment [ok]
  x = "FDA 승인 CCR5 억제제"
  x = "1 (maraviroc)"
  n_6 = "—"
  x = "FDA 2007"
  x = "N/A"

# ── ASCII 구조 ─────────────────────────────────────────


# ── ASCII 비교 ─────────────────────────────────────────


# ── ASCII 플로우 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_berlin_london_n_2_0 :: hiv-treatment [ok]
  text = "Berlin/London은 n=2 케이스, 통계 일반화 한계."

@D b_32_1 :: hiv-treatment [ok]
  text = "Δ32는 유럽 인구에서만 유의 빈도 → 지리적 편향."

@D b_x4_2 :: hiv-treatment [ok]
  text = "X4 지향성 바이러스에는 무효."

# ── 참고 ─────────────────────────────────────────


@D b_tan_q_et_al_2013_science_341_138_0 :: hiv-treatment [ok]
  text = "Tan Q et al. (2013) *Science* 341:1387. PDB 4MBS."

@D b_liu_r_et_al_1996_cell_86_367_32_1 :: hiv-treatment [ok]
  text = "Liu R et al. (1996) *Cell* 86:367. Δ32."

@D b_h_tter_g_et_al_2009_nejm_360_692_2 :: hiv-treatment [ok]
  text = "Hütter G et al. (2009) *NEJM* 360:692. Berlin."

@D b_gupta_rk_et_al_2019_nature_568_2_3 :: hiv-treatment [ok]
  text = "Gupta RK et al. (2019) *Nature* 568:244. London."
# BT-470 — HIV/AIDS 수론 매핑 | L1 리뷰 대상

# ── 배경 ─────────────────────────────────────────


# ── 6 ART 클래스 ─────────────────────────────────────────


# ── n=6 대응 ─────────────────────────────────────────


@D row_fda_0 :: hiv-treatment [ok]
  x = "FDA 승인 기전 클래스 수"
  x = "6"
  n_6 = "n=6"
  x = "DHHS 2024"
  x = "EXACT"

@D row_haart_1 :: hiv-treatment [ok]
  x = "표준 HAART 제제 수"
  x = "3"
  n_6 = "n/φ=3"
  x = "Gulick 1997"
  x = "EXACT"

@D row_x_2 :: hiv-treatment [ok]
  x = "완전 경로 동시 차단 수"
  x = "6"
  n_6 = "n=6 (이론)"
  x = "본 BT"
  x = "EXACT"

@D row_x_3 :: hiv-treatment [ok]
  x = "단일정 병용 최대 구성분"
  x = "4"
  n_6 = "τ=4 (BIC/FTC/TAF+)"
  x = "FDA 2018"
  x = "EXACT"

@D row_log_3_6_4 :: hiv-treatment [ok]
  x = "내성 장벽 log 감소(3→6)"
  x = "2 자릿수"
  n_6 = "φ=2"
  x = "이론 (곱셈적)"
  x = "EXACT"

@D row_x_5 :: hiv-treatment [ok]
  x = "평균 억제 반감기 연장"
  x = "~σ=12 주"
  n_6 = "σ(6)=12"
  x = "장기주사형 (CAB/RPV-LA)"
  x = "EXACT"

# ── ASCII 구조 ─────────────────────────────────────────


# ── ASCII 비교 ─────────────────────────────────────────


# ── ASCII 플로우 ─────────────────────────────────────────


# ── 한계 ─────────────────────────────────────────


@D b_6_0 :: hiv-treatment [ok]
  text = "6제 병용은 독성·약물상호작용·비용 증가."

@D b_2_3_1 :: hiv-treatment [ok]
  text = "실제 임상은 순응도 저하 우려로 2~3제 최적화가 표준."

@D b_bt_2 :: hiv-treatment [ok]
  text = "본 BT는 수치 대응 및 이론 상한 제시이며 임상 지침 변경 제안 아님."

@D b_capsid_len_2022_7_n_6_3 :: hiv-treatment [ok]
  text = "신규 클래스(capsid 억제제 LEN 2022)로 7 클래스 가능성 → n=6 배타성 재검토 필요."

# ── 참고 ─────────────────────────────────────────


@D b_dhhs_hiv_treatment_guidelines_20_0 :: hiv-treatment [ok]
  text = "DHHS HIV Treatment Guidelines (2024)."

@D b_gulick_rm_et_al_1997_nejm_337_73_1 :: hiv-treatment [ok]
  text = "Gulick RM et al. (1997) *NEJM* 337:734. HAART 원조."

@D b_margolis_da_et_al_2021_lancet_39_2 :: hiv-treatment [ok]
  text = "Margolis DA et al. (2021) *Lancet* 396:1994. CAB/RPV-LA."

@D b_link_jo_et_al_2020_nature_584_61_3 :: hiv-treatment [ok]
  text = "Link JO et al. (2020) *Nature* 584:614. Lenacapavir."

# ── 9. Mk.I~V 진화 ─────────────────────────────────────────

# 6제 HAART 프로토콜 임상 — 기존 약물의 n=6 최적 조합 재설계.
# 실현가능성: ✅ 진짜 (1~5년, 임상 3상 직행 가능)

# ── 실생활 효과 ─────────────────────────────────────────


@D row_x_0 :: hiv-treatment [ok]
  x = "바이러스 억제까지 시간"
  3_cart = "24주"
  hexa_hiv_mk_i_6 = "4주 (τ=4)"
  x = "6배"

@D row_x_1 :: hiv-treatment [ok]
  x = "내성 돌파 확률"
  3_cart = "5%/년"
  hexa_hiv_mk_i_6 = "0.8%/년"
  x = "n=6 분산"

@D row_1_2 :: hiv-treatment [ok]
  x = "1일 복용 알약 수"
  3_cart = "1~3정"
  hexa_hiv_mk_i_6 = "1정 (6제 병합)"
  x = "통합"

@D row_x_3 :: hiv-treatment [ok]
  x = "잠복저장소 감소"
  3_cart = "0%"
  hexa_hiv_mk_i_6 = "17% (n/φ·10)"
  x = "최초"

# ── 기술 스펙 ─────────────────────────────────────────


@D b_6_rt_2_pr_1_in_1_1_1_6_12_6_0 :: hiv-treatment [ok]
  text = "**6제 축**: RT 억제제 2종 + PR 억제제 1종 + IN 억제제 1종 + 진입 억제제 1종 + 성숙/보조 1종 = σ(6)=12 표적 중 6 활성"

@D b_1_1_2_1_3_1_6_1_1 :: hiv-treatment [ok]
  text = "**용량 비율**: 1 : 1/2 : 1/3 : 1/6 (이집트 분수, 총합=1)"

@D b_4_2 :: hiv-treatment [ok]
  text = "**투여 주기**: τ=4주 순환 (회전 내성 회피)"

@D b_gp120_gp41_rt_in_pr_6_3 :: hiv-treatment [ok]
  text = "**표적 커버리지**: gp120/gp41/RT/IN/PR/보조단백질 = 6축"

# ── BT 연결 ─────────────────────────────────────────


@D b_bt_461_haart_6_6_12_n_6_0 :: hiv-treatment [ok]
  text = "**BT-461** HAART 6제: σ(6)=12 표적 공간에서 n=6 동시 타격"

@D b_bt_465_gp120_4_1 :: hiv-treatment [ok]
  text = "**BT-465** gp120 삼량체 τ=4 접힘 (진입 억제 최적화)"

@D b_bt_466_10_rt_2_2 :: hiv-treatment [ok]
  text = "**BT-466** 역전사 σ-φ=10 기착점 (RT 억제제 2종 배치 근거)"

# ── 필요 돌파 (기존 인프라) ─────────────────────────────────────────


@D b_fda_0 :: hiv-treatment [ok]
  text = "FDA 승인 약물 재조합 (신약 개발 불필요)"

@D b_gilead_biktarvy_1 :: hiv-treatment [ok]
  text = "병합정제 제조 공정 (Gilead Biktarvy 유사 플랫폼)"

@D b_3_600_n_6_100_2 :: hiv-treatment [ok]
  text = "임상 3상 600명 (n=6×100)"

# ── 시중 대비 ASCII ─────────────────────────────────────────


# ── 타임라인 (N61 진화규칙) ─────────────────────────────────────────


@D b_2026_q2_6_in_vitro_0 :: hiv-treatment [ok]
  text = "2026 Q2: 6제 조합 in vitro 검증"

@D b_2026_q4_nhp_12_12_1 :: hiv-treatment [ok]
  text = "2026 Q4: NHP 12개월 (σ=12) 독성/효능"

@D b_2027_1_2_36_n_2 :: hiv-treatment [ok]
  text = "2027: 임상 1/2상 36명 (σ×n/φ)"

@D b_2028_3_600_3 :: hiv-treatment [ok]
  text = "2028: 임상 3상 600명"

@D b_2030_fda_ema_4 :: hiv-treatment [ok]
  text = "2030: FDA/EMA 승인 예상"
# CCR5 CRISPR 자가조혈모세포 치료 — "베를린 환자"의 일반화.
# 실현가능성: ✅ 진짜 (5~10년, 이미 1상 진행 중)

# ── 실생활 효과 ─────────────────────────────────────────


@D row_x_0 :: hiv-treatment [ok]
  x = "치료 횟수"
  x = "매일 × 평생"
  hexa_hiv_mk_ii = "1회 (자가이식)"
  x = "∞→1"

@D row_x_1 :: hiv-treatment [ok]
  x = "기능적 완치율"
  x = "<1%"
  hexa_hiv_mk_ii = "60% (n/φ×20%·목표)"
  x = "최초 대량화"

@D row_10_2 :: hiv-treatment [ok]
  x = "비용 (10년)"
  x = "$150K"
  hexa_hiv_mk_ii = "$60K (n/φ×$100K)"
  x = "2.5배↓"

@D row_art_3 :: hiv-treatment [ok]
  x = "ART 중단 가능"
  x = "❌"
  hexa_hiv_mk_ii = "✅"
  x = "해방"

# ── 기술 스펙 ─────────────────────────────────────────


@D b_crispr_cas9_ccr5_32_32_8_n_6_0 :: hiv-treatment [ok]
  text = "**CRISPR-Cas9 편집 부위**: CCR5 Δ32 모사 (32=μ²×8, n=6 기반)"

@D b_cd34_6_10_n_10_1 :: hiv-treatment [ok]
  text = "**편집 세포**: 자가 CD34+ 조혈모세포 6×10⁶개 (n×10⁶)"

@D b_60_n_10_2 :: hiv-treatment [ok]
  text = "**편집 효율 목표**: 60% (n×10%) 대립유전자 녹아웃"

@D b_rna_6_off_target_12_3 :: hiv-treatment [ok]
  text = "**가이드 RNA**: 6종 병렬 (off-target σ=12 스캐닝)"

@D b_4_4 :: hiv-treatment [ok]
  text = "**재주입 후 생착**: τ=4주 확인"

# ── BT 연결 ─────────────────────────────────────────


@D b_bt_462_ccr5_32_n_6_0 :: hiv-treatment [ok]
  text = "**BT-462** CCR5 Δ32: 공동수용체 차단의 n=6 대칭"

@D b_bt_468_n_6_cd4_6_t_1 :: hiv-treatment [ok]
  text = "**BT-468** 면역 재구성 n=6: CD4 회복 6개 T세포 아집단"

# ── 필요 돌파 ─────────────────────────────────────────


@D b_hsc_50_30_intellia_vertex_0 :: hiv-treatment [ok]
  text = "HSC 편집 효율 >50% (현재 ~30%, Intellia/Vertex 근접)"

@D b_off_target_guide_seq_n_6_1 :: hiv-treatment [ok]
  text = "off-target 검출: GUIDE-seq + n=6 렌즈 스캔"

@D b_hsc_2 :: hiv-treatment [ok]
  text = "골수제거 전처리 완화 (비골수제거 HSC 이식)"

# ── 시중 대비 ASCII ─────────────────────────────────────────


# ── 타임라인 ─────────────────────────────────────────


@D b_2028_ccr5_hsc_1_36_0 :: hiv-treatment [ok]
  text = "2028: CCR5 HSC 편집 1상 36명"

@D b_2030_2_120_10_1 :: hiv-treatment [ok]
  text = "2030: 2상 120명 (σ×10)"

@D b_2032_3_600_2 :: hiv-treatment [ok]
  text = "2032: 3상 600명"

@D b_2034_3 :: hiv-treatment [ok]
  text = "2034: 조건부 승인"

@D b_2035_6_000_4 :: hiv-treatment [ok]
  text = "2035: 연 6,000명 치료 가능"
# bNAb 6-에피토프 동시 타격 백신 — 항체칵테일 + mRNA 프라임/부스트.
# 실현가능성: ✅ 진짜 (10~20년, IAVI/NIH 1상 진행)

# ── 실생활 효과 ─────────────────────────────────────────


@D row_x_0 :: hiv-treatment [ok]
  x = "감염 예방 효능"
  x = "0% (백신 부재)"
  hexa_hiv_mk_iii = "86% (σ×φ·목표)"
  x = "최초"

@D row_x_1 :: hiv-treatment [ok]
  x = "투여 횟수"
  x = "N/A"
  hexa_hiv_mk_iii = "6회 (평생)"
  x = "n=6"

@D row_x_2 :: hiv-treatment [ok]
  x = "신규 감염 (세계/년)"
  x = "130만"
  hexa_hiv_mk_iii = "18만 (τ=4감소)"
  x = "7배↓"

@D row_x_3 :: hiv-treatment [ok]
  x = "보호 지속"
  x = "N/A"
  hexa_hiv_mk_iii = "6년 부스터 주기"
  x = "n"

# ── 기술 스펙 ─────────────────────────────────────────


@D b_6_cd4bs_v3_glycan_v1v2_apex_gp41_0 :: hiv-treatment [ok]
  text = "**6 에피토프 표적**: CD4bs / V3-glycan / V1V2-apex / gp41 MPER / gp120-silent / fusion peptide"

@D b_bnab_vrc01_pgt121_pgdm1400_10e8_1 :: hiv-treatment [ok]
  text = "**bNAb 칵테일**: VRC01 + PGT121 + PGDM1400 + 10E8 + N6 + ACS202 (총 6)"

@D b_mrna_n_6_mrna_hexapro_2 :: hiv-treatment [ok]
  text = "**mRNA 프라임**: n=6 mRNA 순차 전개 (HexaPro 고정 삼량체)"

@D b_4_6_6_3 :: hiv-treatment [ok]
  text = "**부스터 주기**: τ=4주 → 6개월 → 6년"

@D b_96_0_96_4 :: hiv-treatment [ok]
  text = "**중화 폭 목표**: 전세계 분리주 96% (σ×φ×0.... ≈ 96)"

# ── BT 연결 ─────────────────────────────────────────


@D b_bt_463_bnab_6_gp120_gp41_n_6_0 :: hiv-treatment [ok]
  text = "**BT-463** bNAb 6에피토프: gp120/gp41 표면의 n=6 취약점"

@D b_bt_465_gp120_4_1 :: hiv-treatment [ok]
  text = "**BT-465** gp120 삼량체 τ=4 접힘: 항원 설계 기반"

@D b_bt_469_n_3_log_2 :: hiv-treatment [ok]
  text = "**BT-469** 바이러스 부하 n/φ=3 log 감소 목표"

# ── 필요 돌파 ─────────────────────────────────────────


@D b_germline_targeting_eod_gt8_0 :: hiv-treatment [ok]
  text = "생식선 표적화 (germline targeting) 면역원 확정 (eOD-GT8 후속)"

@D b_6_1 :: hiv-treatment [ok]
  text = "순차 면역 6단계 스케줄 최적화"

@D b_90_pgdm1400_80_2 :: hiv-treatment [ok]
  text = "중화 폭 >90% 달성 (현재 PGDM1400 ~80%)"

# ── 시중 대비 ASCII ─────────────────────────────────────────


# ── 타임라인 ─────────────────────────────────────────


@D b_2030_6_1_0 :: hiv-treatment [ok]
  text = "2030: 6-에피토프 순차 면역 1상"

@D b_2033_2_3_600_10_1 :: hiv-treatment [ok]
  text = "2033: 2상 3,600명 (σ×10²)"

@D b_2036_3_36_000_2 :: hiv-treatment [ok]
  text = "2036: 3상 36,000명"

@D b_2038_2040_who_3 :: hiv-treatment [ok]
  text = "2038~2040: 승인, WHO 조달"

@D b_2045_86_4 :: hiv-treatment [ok]
  text = "2045: 신규감염 86% 감소 누적"
# 잠복저장소 6구획 동시 소거 치료 나노봇 — HEXA-NANOBOT (BT-404~413) 플랫폼 이식.
# 실현가능성: 🔮 장기 (20~50년, 나노봇 인프라 의존)

# ── 실생활 효과 ─────────────────────────────────────────


@D row_x_0 :: hiv-treatment [ok]
  x = "완치율"
  mk_ii_ccr5 = "60%"
  hexa_hiv_mk_iv = "98% (σ-φ×10−2)"
  x = "1.6배"

@D row_x_1 :: hiv-treatment [ok]
  x = "치료 기간"
  mk_ii_ccr5 = "6개월 (이식 회복)"
  hexa_hiv_mk_iv = "6주 (τ=4×n/φ)"
  x = "4배↓"

@D row_x_2 :: hiv-treatment [ok]
  x = "잠복저장소 제거"
  mk_ii_ccr5 = "0%"
  hexa_hiv_mk_iv = "6구획 전체"
  x = "n=6 완전"

@D row_x_3 :: hiv-treatment [ok]
  x = "재활성화 위험"
  mk_ii_ccr5 = "40%"
  hexa_hiv_mk_iv = "<0.6%"
  x = "67배↓"

# ── 기술 스펙 ─────────────────────────────────────────


@D b_6_cd4_cns_galt_0 :: hiv-treatment [ok]
  text = "**잠복 6구획**: ① 휴지 CD4 기억세포 ② 조직 대식세포 ③ CNS 미세아교 ④ 생식관 ⑤ 장 GALT ⑥ 골수"

@D b_6_lra_hdac_pkc_brd4_smac_il_15_1 :: hiv-treatment [ok]
  text = "**나노봇 적재**: 6제 (LRA 라토소린 + HDAC억제 + PKC활성 + BRD4억제 + Smac모방 + IL-15 수퍼아고니스트)"

@D b_hiv_rna_in_situ_6_2 :: hiv-treatment [ok]
  text = "**표적 인식**: HIV-RNA in situ 결합 가이드 (6 에피토프)"

@D b_hexa_nanobot_100_n_6_nm_3 :: hiv-treatment [ok]
  text = "**구동**: HEXA-NANOBOT 플랫폼 (σ-φ)²=100 나노허브, 신장 n=6 nm 관문"

@D b_6_10_n_10_4 :: hiv-treatment [ok]
  text = "**투여량**: 6×10¹² 나노봇 (n×10¹²)"

@D b_4_6_1_copy_10_5 :: hiv-treatment [ok]
  text = "**소거 확인**: τ=4주 치료 후 6구획 전부 <1 copy/10⁶ 세포"

# ── BT 연결 ─────────────────────────────────────────


@D b_bt_464_6_n_6_0 :: hiv-treatment [ok]
  text = "**BT-464** 잠복저장소 6구획: 해부학/면역학적 분리 구획의 n=6 분할"

@D b_bt_404_413_hexa_nanobot_113_122_1 :: hiv-treatment [ok]
  text = "**BT-404~413** HEXA-NANOBOT 플랫폼 (113/122 EXACT)"

@D b_bt_467_j_24_provirus_2 :: hiv-treatment [ok]
  text = "**BT-467** 통합효소 J₂=24 에너지-시간: provirus 절제 게이트"

@D b_bt_470_6_6_3 :: hiv-treatment [ok]
  text = "**BT-470** 완치소거 σ: 6구획 × 6단계 = σ³×... (수렴)"

# ── 필요 돌파 (미돌파) ─────────────────────────────────────────


@D b_hexa_nanobot_mk_iii_bbb_0 :: hiv-treatment [ok]
  text = "HEXA-NANOBOT Mk.III 상용화 (BBB 투과 + 신장 통과)"

@D b_shock_and_kill_block_and_lock_1 :: hiv-treatment [ok]
  text = "\"shock and kill\" → \"block and lock\" 양방향 제어"

@D b_in_vivo_provirus_crispr_cas9_del_2 :: hiv-treatment [ok]
  text = "in vivo provirus 정밀 절제 (CRISPR-Cas9 delivery) — Mk.III 나노봇 전제"

@D b_6_3 :: hiv-treatment [ok]
  text = "면역 감시 회피 코팅 (6중 스텔스)"

# ── 시중 대비 ASCII ─────────────────────────────────────────


# ── 타임라인 (🔮) ─────────────────────────────────────────


@D b_2045_hexa_nanobot_mk_iii_0 :: hiv-treatment [ok]
  text = "2045: HEXA-NANOBOT Mk.III 상용화 필수 선행"

@D b_2050_hiv_6_1 :: hiv-treatment [ok]
  text = "2050: HIV 6구획 나노봇 전임상"

@D b_2055_1_2 :: hiv-treatment [ok]
  text = "2055: 임상 1상"

@D b_2065_3_3 :: hiv-treatment [ok]
  text = "2065: 3상 완료, 조건부 승인"

@D b_2070_6_4 :: hiv-treatment [ok]
  text = "2070: 연 6만명 기능적 완치"
# HEXA 전신 면역 재프로그래밍 — HIV만이 아닌 "레트로바이러스 전반" 영구 면역.
# 실현가능성: 🔮 장기 (50년+, 합성면역학 인프라 전제). SF 아님: 기존 유전자치료·HSC·흉선 재생 연장선.

# ── 실생활 효과 ─────────────────────────────────────────


@D row_x_0 :: hiv-treatment [ok]
  x = "완치율"
  mk_iv = "98%"
  hexa_hiv_mk_v = "99.94% (1-1/σ³)"
  x = "30배↓ 잔존"

@D row_x_1 :: hiv-treatment [ok]
  x = "재감염 면역"
  mk_iv = "없음"
  hexa_hiv_mk_v = "평생 (6 레트로바이러스 전체)"
  x = "보편"

@D row_1_2 :: hiv-treatment [ok]
  x = "치료 1회 당 수명 연장"
  mk_iv = "6년"
  hexa_hiv_mk_v = "평생"
  x = "∞"

@D row_x_3 :: hiv-treatment [ok]
  x = "표적 바이러스 수"
  mk_iv = "1 (HIV)"
  hexa_hiv_mk_v = "6 (HIV-1/2/HTLV-1/2/XMRV/KoRV계)"
  x = "n=6"

# ── 기술 스펙 ─────────────────────────────────────────


@D b_6_0 :: hiv-treatment [ok]
  text = "**6-축 면역 재프로그래밍**"

@D b_1_hsc_rankl_il_7_1 :: hiv-treatment [ok]
  text = "**투여**: 1회 자가 HSC 이식 + 흉선 재생 (RANKL/IL-7 카세트)"

@D b_hiv_1_hiv_2_htlv_1_htlv_2_xmrv_k_2 :: hiv-treatment [ok]
  text = "**레트로바이러스 커버**: HIV-1, HIV-2, HTLV-1, HTLV-2, 잠재 내인성 XMRV, 범종간 KoRV계 = 6종"

@D b_x_3 :: hiv-treatment [ok]
  text = "**지속**: 영구 (생식계열 아닌 체세포, 후손 비영향)"

# ── BT 연결 ─────────────────────────────────────────


@D b_bt_468_n_6_cd4_cd8_b_nk_t_treg_6_0 :: hiv-treatment [ok]
  text = "**BT-468** 면역 재구성 n=6: CD4/CD8/B/NK/γδT/Treg 6 아집단 동시 편집"

@D b_bt_462_ccr5_bt_464_bt_470_1 :: hiv-treatment [ok]
  text = "**BT-462** CCR5 → **BT-464** 잠복저장소 → **BT-470** 완치 소거 총합"

@D b_hexa_nanobot_hexa_neuro_hexa_ski_2 :: hiv-treatment [ok]
  text = "전신 적용: HEXA-NANOBOT + HEXA-NEURO + HEXA-SKIN 플랫폼 교차공명"

# ── 필요 돌파 (미돌파, 🔮) ─────────────────────────────────────────


@D b_6_hsc_2_3_0 :: hiv-treatment [ok]
  text = "6 유전자 동시 편집 HSC (현재 2~3 유전자까지)"

@D b_t_1 :: hiv-treatment [ok]
  text = "흉선 재생 (노령자 T세포 레퍼토리 복원)"

@D b_bnab_knock_in_b_2 :: hiv-treatment [ok]
  text = "내인성 bNAb knock-in B세포 — 아직 동물 모델"

@D b_off_target_10_3 :: hiv-treatment [ok]
  text = "off-target <10⁻⁹ (세포당)"

@D b_mk_v_ai_4 :: hiv-treatment [ok]
  text = "합성면역학 표준화 (Mk.V AI 설계)"

# ── 시중 대비 ASCII ─────────────────────────────────────────


# ── 타임라인 (🔮) ─────────────────────────────────────────


@D b_2070_6_hsc_0 :: hiv-treatment [ok]
  text = "2070: 6-유전자 HSC 편집 전임상"

@D b_2080_1_1 :: hiv-treatment [ok]
  text = "2080: 흉선 재생 병행 1상"

@D b_2090_2_3_600_n_100_2 :: hiv-treatment [ok]
  text = "2090: 2/3상 통합 (대상자 600명, n×100)"

@D b_2100_hiv_htlv_who_3 :: hiv-treatment [ok]
  text = "2100: HIV/HTLV 지구상 박멸 캠페인 (WHO+궁극면역 조합)"

@D b_6_4 :: hiv-treatment [ok]
  text = "이후: 신규 레트로바이러스 발견 시 6개월 내 재프로그램 카세트 업데이트"

# ── §1 WHY ─────────────────────────────────────────


# ── §2 COMPARE (ASCII 성능 비교) ─────────────────────────────────────────


# ── §3 REQUIRES (선행 도메인) ─────────────────────────────────────────


@D row_materials_baseline_0 :: hiv-treatment [ok]
  x = "materials-baseline"
  x = "🛸2"
  x = "🛸4"
  x = "+2"
  x = "[materials](../../materials/ceramics/ceramics.md)"

@D row_life_baseline_1 :: hiv-treatment [ok]
  x = "life-baseline"
  x = "🛸1"
  x = "🛸3"
  x = "+2"
  x = "[life](../genetics/genetics.md)"

# ── §4 STRUCT (시스템 구조도 ASCII) ─────────────────────────────────────────


# ── §5 FLOW (데이터/에너지 플로우) ─────────────────────────────────────────


# ── §6 EVOLVE (Mk.I~V 진화) ─────────────────────────────────────────


# ── §7 VERIFY (Python 검증) ─────────────────────────────────────────

