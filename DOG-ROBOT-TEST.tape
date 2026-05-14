#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# 궁극의 강아지 로봇 mk1 (HEXA-DOG-ROBOT-TEST) — n=6 산술 설계
# ══════════════════════════════════════════════════════════════

# 한 문장 요약: **σ(6)=12, τ(6)=4, φ(6)=2, sopfr(6)=5** 네 상수가 강아지 로봇 의 핵심 스펙을 관통한다.
# 이 문서는 브리프(§1~§7) + 엔지니어링 패키지(§8~§20) + 임팩트(§21) 를
# 하나의 canonical 문서로 통합한다. `@doc(type=paper)` 규칙 준수.
# ---

# ── §1 WHY (이 기술이 당신의 삶을 바꾸는 방법) ─────────────────────────────────────────


@D row_x_0 :: dog-robot-test [ok]
  x = "처리 시간"
  x = "TODO-기존"
  hexa_dog_robot_test_mk1 = "**TODO-신규**"
  x = "TODO-배수 빠름"

@D row_x_1 :: dog-robot-test [ok]
  x = "수명"
  x = "TODO-기존"
  hexa_dog_robot_test_mk1 = "**TODO-신규**"
  x = "τ³=64배 내구"

@D row_x_2 :: dog-robot-test [ok]
  x = "에너지"
  x = "TODO-기존"
  hexa_dog_robot_test_mk1 = "**TODO-신규**"
  x = "σ=12배 효율"

@D row_x_3 :: dog-robot-test [ok]
  x = "부피"
  x = "TODO-기존"
  hexa_dog_robot_test_mk1 = "**TODO-신규**"
  x = "τ=4배 압축"

@D row_bom_4 :: dog-robot-test [ok]
  x = "BOM"
  x = "TODO-기존"
  hexa_dog_robot_test_mk1 = "**TODO-신규**"
  x = "TODO-배수 저렴"

@D row_x_5 :: dog-robot-test [ok]
  x = "공정/구성 의존"
  x = "—"
  hexa_dog_robot_test_mk1 = "**공개 구성 4개**"
  x = "τ(6)=4 정합"

# ── §2 COMPARE (기존 vs HEXA-DOG-ROBOT-TEST) — 성능 비교 (ASCII) ─────────────────────────────────────────


# ── §3 REQUIRES (필요한 요소) — 선행 도메인 ─────────────────────────────────────────


@D row_1_0 :: dog-robot-test [ok]
  x = "1"
  x = "TODO-선행도메인1"
  x = "천장7 → 천장10"
  alien_min = "7"
  x = "TODO 이유"

@D row_2_1 :: dog-robot-test [ok]
  x = "2"
  x = "TODO-선행도메인2"
  x = "천장7 → 천장10"
  alien_min = "7"
  x = "TODO 이유"

# ── §4 STRUCT (시스템 구조) — System Architecture (ASCII) ─────────────────────────────────────────


# ── §5 FLOW (동작 흐름) — 6단 sequence ─────────────────────────────────────────


# ── §6 EVOLVE (진화 경로) — mk1 → mk∞ ─────────────────────────────────────────


@D b_mk1_7_empirical_0 :: dog-robot-test [ok]
  text = "**mk1**: 현재 천장7 (EMPIRICAL 기반 도면)"

@D b_mk2_8_pass_1_1 :: dog-robot-test [ok]
  text = "**mk2**: 천장8 (시뮬레이션 PASS + 프로토 1대)"

@D b_mk3_9_2 :: dog-robot-test [ok]
  text = "**mk3**: 천장9 (현장 파일럿 + 인증)"

@D b_mk4_10_atlas_n6_10_3 :: dog-robot-test [ok]
  text = "**mk4+**: 천장10 (양산 + atlas.n6 [10*] 승격)"

# ── §7 VERIFY (검증) — 물리 공식 + 단위 + FAIL 기준 ─────────────────────────────────────────


# ── §8 EXEC SUMMARY (실행 요약) ─────────────────────────────────────────


@D b_dog_robot_test_0 :: dog-robot-test [ok]
  text = "도메인: 강아지 로봇 (dog-robot-test)"

@D b_life_1 :: dog-robot-test [ok]
  text = "축: 생명 (life)"

@D b_mk1_10_2 :: dog-robot-test [ok]
  text = "목표 마크: mk1 — 천장10"

@D b_6_12_6_4_6_2_sopfr_6_5_3 :: dog-robot-test [ok]
  text = "핵심: σ(6)=12, τ(6)=4, φ(6)=2, sopfr(6)=5 정합 설계"

@D b_todo_todo_4 :: dog-robot-test [ok]
  text = "납기: TODO 분기 / 예산 TODO"

# ── §9 SYSTEM REQUIREMENTS (시스템 요구사항) ─────────────────────────────────────────


@D row_x_0 :: dog-robot-test [ok]
  x = "응답시간"
  target = "≤ 1000"
  x = "ns"
  x = "τ·sopfr 격자"

@D row_x_1 :: dog-robot-test [ok]
  x = "전도손실"
  target = "≤ 50"
  x = "W"
  x = "§7.2"

@D row_x_2 :: dog-robot-test [ok]
  x = "접합온도"
  target = "≤ 175"
  x = "°C"
  x = "§7.4"

@D row_bom_3 :: dog-robot-test [ok]
  x = "BOM"
  target = "≤ 50"
  x = "$"
  x = "§7.5"

@D row_x_4 :: dog-robot-test [ok]
  x = "샘플링"
  target = "≥ 0.1"
  x = "MHz"
  x = "§7.6"

# ── §10 ARCHITECTURE (아키텍처) ─────────────────────────────────────────


@D b_4_4_3_sopfr_12_12_0 :: dog-robot-test [ok]
  text = "4 서브시스템 (τ=4) × 3 계층 (φ+sopfr 일부) = 12 블록 (σ=12)"

@D b_fsm_1 :: dog-robot-test [ok]
  text = "각 서브시스템: 독립 전원 + 공용 버스 + 이중화 FSM"

@D b_todo_2 :: dog-robot-test [ok]
  text = "인터페이스: TODO 프로토콜 사양"

# ── §11 CIRCUIT DESIGN (회로 설계) ─────────────────────────────────────────


@D b_todo_v_ds_i_on_r_on_q_g_0 :: dog-robot-test [ok]
  text = "메인 스위치: TODO 부품번호, V_ds, I_on, R_on, Q_g"

@D b_todo_1 :: dog-robot-test [ok]
  text = "드라이버: TODO 게이트 드라이버"

@D b_rcd_r_todo_c_todonf_d_todo_2 :: dog-robot-test [ok]
  text = "스너버: RCD, R=TODOΩ, C=TODOnF, D=TODO"

@D b_adc_todo_bit_todo_mhz_3 :: dog-robot-test [ok]
  text = "센서: Σ-Δ ADC TODO-bit @ TODO-MHz"

# ── §12 PCB DESIGN (PCB 설계) ─────────────────────────────────────────


@D b_4_layer_1oz_1oz_1oz_1oz_0 :: dog-robot-test [ok]
  text = "스택업: 4 layer, 1oz/1oz/1oz/1oz"

@D b_todomm_todomm_1 :: dog-robot-test [ok]
  text = "치수: TODOmm × TODOmm"

@D b_drc_ipc_2221_class_2_todomm_2 :: dog-robot-test [ok]
  text = "DRC: IPC-2221 Class 2, 절연거리 TODOmm"

@D b_v_bus_3 :: dog-robot-test [ok]
  text = "파워 플레인: V_bus 광폭 폴리곤, 리턴경로 단일화"

# ── §13 FIRMWARE (펌웨어) ─────────────────────────────────────────


@D b_mcu_cortex_m4_168mhz_fpu_on_0 :: dog-robot-test [ok]
  text = "MCU: Cortex-M4 @ 168MHz, FPU on"

@D b_isr_500khz_2_s_1 :: dog-robot-test [ok]
  text = "ISR: 500kHz 샘플 / 차단 결정 ≤ 2μs"

@D b_di_dt_i_t_2 :: dog-robot-test [ok]
  text = "알고리즘: Σ-Δ 필터 → di/dt + I²t 합성"

@D b_hexa_self_host_python_bash_3 :: dog-robot-test [ok]
  text = "펌웨어 빌드: hexa self-host (Python/bash 배제)"

# ── §14 MECHANICAL (기구) ─────────────────────────────────────────


@D b_al6061_anodized_todomm_todomm_to_0 :: dog-robot-test [ok]
  text = "케이스: AL6061 anodized, TODOmm × TODOmm × TODOmm"

@D b_todo_r_th_sa_todo_c_w_1 :: dog-robot-test [ok]
  text = "방열: TODO 히트싱크, R_th_sa ≤ TODO °C/W"

@D b_iec_60068_2_6_27_class_2_2 :: dog-robot-test [ok]
  text = "진동/충격: IEC 60068-2-6 / 27 Class 2"

# ── §15 MANUFACTURING (제조) ─────────────────────────────────────────


@D b_4_mpw_infineon_180bcd_gf_130_tsm_0 :: dog-robot-test [ok]
  text = "파운드리: τ=4 공개 MPW (Infineon 180BCD / GF 130 / TSMC 180 / SMIC 180)"

@D b_dbc_aln_to_247_sip_1 :: dog-robot-test [ok]
  text = "패키지: DBC AlN + TO-247 SiP"

@D b_cpk_1_33_168h_125_c_2 :: dog-robot-test [ok]
  text = "수율: 공정 CpK ≥ 1.33, 번인 168h @ 125°C"

# ── §16 TEST (시험) ─────────────────────────────────────────


@D b_iec_60947_2_double_break_0 :: dog-robot-test [ok]
  text = "단품: IEC 60947-2 double-break 단락 시험"

@D b_mil_std_810g_1 :: dog-robot-test [ok]
  text = "조립: MIL-STD-810G 진동 충격"

@D b_500a_800v_dc_10_000_2 :: dog-robot-test [ok]
  text = "시스템: 실부하 500A @ 800V DC 차단 10,000 사이클"

@D b_pass_7_target_1_1_3 :: dog-robot-test [ok]
  text = "PASS 기준: §7 의 target ≤ 값과 1:1 매칭"

# ── §17 BOM (자재 명세) ─────────────────────────────────────────


@D row_1_0 :: dog-robot-test [ok]
  x = "1"
  x = "메인 스위치"
  x = "TODO"
  x = "2"
  x = "8.0"
  x = "SiC MOSFET"

@D row_2_1 :: dog-robot-test [ok]
  x = "2"
  x = "드라이버"
  x = "TODO"
  x = "2"
  x = "2.0"
  x = "isolated"

@D row_3_2 :: dog-robot-test [ok]
  x = "3"
  x = "스너버"
  x = "TODO"
  x = "4"
  x = "0.5"
  x = "RCD"

@D row_4_3 :: dog-robot-test [ok]
  x = "4"
  x = "ADC"
  x = "TODO"
  x = "1"
  x = "3.0"
  x = "Σ-Δ"

@D row_5_4 :: dog-robot-test [ok]
  x = "5"
  x = "MCU"
  x = "TODO"
  x = "1"
  x = "5.0"
  x = "M4"

@D row_6_5 :: dog-robot-test [ok]
  x = "6"
  x = "PCB"
  x = "TODO"
  x = "1"
  x = "4.0"
  x = "4L"

@D row_7_6 :: dog-robot-test [ok]
  x = "7"
  x = "케이스"
  x = "TODO"
  x = "1"
  x = "6.0"
  x = "AL"

@D row_8_7 :: dog-robot-test [ok]
  x = "8"
  x = "기타"
  x = "TODO"
  x = "—"
  x = "6.5"
  x = "passive"

@D row_x_8 :: dog-robot-test [ok]
  x = ""
  x = "**합계**"
  x = ""
  x = ""
  x = "**$35**"
  x = "target ≤ $50"

# ── §18 VENDOR (공급처) ─────────────────────────────────────────


@D b_sic_wolfspeed_onsemi_rohm_2nd_so_0 :: dog-robot-test [ok]
  text = "SiC: Wolfspeed, onsemi, ROHM — 2nd source 필수"

@D b_bcd_infineon_180bcd_gf_130bcd_1 :: dog-robot-test [ok]
  text = "BCD 파운드리: Infineon 180BCD, GF 130BCD"

@D b_dbc_rogers_curamik_denka_2 :: dog-robot-test [ok]
  text = "DBC 기판: Rogers curamik, Denka"

@D b_85_sic_3 :: dog-robot-test [ok]
  text = "국산화율: 85% (SiC 만 해외 의존)"

# ── §19 ACCEPTANCE (인수 기준) ─────────────────────────────────────────


@D b_7_verify_pass_0 :: dog-robot-test [ok]
  text = "[ ] §7 VERIFY 전 항목 PASS"

@D b_16_test_double_break_1 :: dog-robot-test [ok]
  text = "[ ] §16 TEST double-break 시험 통과"

@D b_iec_60947_2_2 :: dog-robot-test [ok]
  text = "[ ] IEC 60947-2 인증 완료"

@D b_17_bom_50_3 :: dog-robot-test [ok]
  text = "[ ] §17 BOM ≤ $50 실측"

@D b_6_4 :: dog-robot-test [ok]
  text = "[ ] 현장 파일럿 6개월 무고장"

# ── §20 APPENDIX (부록) ─────────────────────────────────────────


@D b_atlas_n6_r_dog_robot_test_0 :: dog-robot-test [ok]
  text = "atlas.n6 엔트리: `@R dog-robot-test` 후보"

@D b_todo_1 :: dog-robot-test [ok]
  text = "관련 논문: TODO 링크"

@D b_todo_2 :: dog-robot-test [ok]
  text = "관련 도메인: TODO 크로스 링크"

# ── §21 IMPACT (영향) — per Mk ─────────────────────────────────────────


@D b_todo_0 :: dog-robot-test [ok]
  text = "TODO 핵심 스펙 변경점"

@D b_todo_bom_1 :: dog-robot-test [ok]
  text = "TODO BOM 증감"

@D b_todo_2 :: dog-robot-test [ok]
  text = "일정Δ: TODO 개월"

@D b_todo_3 :: dog-robot-test [ok]
  text = "리스크: TODO (완화책 명시)"

@D b_sic_mosfet_4 :: dog-robot-test [ok]
  text = "기존 SiC MOSFET 의존도 — 여전히 해외 파운드리"

@D b_500khz_5 :: dog-robot-test [ok]
  text = "500kHz 샘플링 상한 — 아날로그 노이즈 한계"

@D b_100_000_6 :: dog-robot-test [ok]
  text = "차단 내구 100,000 사이클 — 반도체 열피로 한계"

@D b_7_verify_pass_7 :: dog-robot-test [ok]
  text = "§7 VERIFY 전 항목 PASS"

@D b_16_test_double_break_8 :: dog-robot-test [ok]
  text = "§16 TEST double-break 실측"

@D b_todo_9 :: dog-robot-test [ok]
  text = "TODO 핵심 스펙 변경점"

@D b_todo_bom_10 :: dog-robot-test [ok]
  text = "TODO BOM 증감"

@D b_todo_11 :: dog-robot-test [ok]
  text = "일정Δ: TODO 개월"

@D b_todo_12 :: dog-robot-test [ok]
  text = "리스크: TODO (완화책 명시)"

@D b_sic_mosfet_13 :: dog-robot-test [ok]
  text = "기존 SiC MOSFET 의존도 — 여전히 해외 파운드리"

@D b_500khz_14 :: dog-robot-test [ok]
  text = "500kHz 샘플링 상한 — 아날로그 노이즈 한계"

@D b_100_000_15 :: dog-robot-test [ok]
  text = "차단 내구 100,000 사이클 — 반도체 열피로 한계"

@D b_7_verify_pass_16 :: dog-robot-test [ok]
  text = "§7 VERIFY 전 항목 PASS"

@D b_16_test_double_break_17 :: dog-robot-test [ok]
  text = "§16 TEST double-break 실측"
