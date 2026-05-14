#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# Nuclear medicine (HEXA-NUCMED) — n=6 Tc-99m 6-hour half-life
# ══════════════════════════════════════════════════════════════


# ── §1 WHY ─────────────────────────────────────────


@D b_6_12_phi_6_2_tau_6_4_identity_un_0 :: nuclear-medicine [ok]
  text = "σ(6)=12 · phi(6)=2 · tau(6)=4 — identity uniquely at n=6."

@D b_tc_99m_t_6_01_h_measured_balance_1 :: nuclear-medicine [ok]
  text = "**Tc-99m t½ = 6.01 h** (measured): balances imaging statistics (slow enough"

@D b_pet_detector_rings_6_detector_bl_2 :: nuclear-medicine [ok]
  text = "**PET detector rings**: 6 detector blocks is the minimum angular sampling"

# ── §2 n=6 CONNECTION (depth > 2 — nuclear physics + clinical optimum) ─────────────────────────────────────────


# ── §3 DIFFERENTIATION ─────────────────────────────────────────


# ── §4 VERIFY (roadmap) ─────────────────────────────────────────


@D b_atlas_node_add_m_nuclear_medicin_0 :: nuclear-medicine [ok]
  text = "[ ] Atlas node: add `@M:nuclear-medicine` under life sector"

@D b_assert_tc99m_half_life_hours_6_1_1 :: nuclear-medicine [ok]
  text = "[ ] Assert `tc99m_half_life_hours == 6` (±1% tolerance) in"

@D b_cross_link_to_physics_medical_ph_2 :: nuclear-medicine [ok]
  text = "[ ] Cross-link to `physics/medical-physics` and `life/cancer-therapy`."

# ── §5 SOURCES ─────────────────────────────────────────


@D b_nndc_chart_of_nuclides_tc_99m_t_0 :: nuclear-medicine [ok]
  text = "NNDC Chart of Nuclides (Tc-99m t½ = 6.0067 h ± measurement)."

@D b_cherry_sorenson_phelps_physics_i_1 :: nuclear-medicine [ok]
  text = "Cherry, Sorenson & Phelps, *Physics in Nuclear Medicine*."

# ── §6 STATUS ─────────────────────────────────────────

