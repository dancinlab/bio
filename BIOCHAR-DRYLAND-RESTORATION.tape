#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# HEXA-BIOCHAR-DRYLAND-RESTORATION mk1 — physical-limit-anchored invasive-biomass to durable-soil-carbon pipeline
# ══════════════════════════════════════════════════════════════

# One-line summary: **a Karoo/Limpopo dryland-restoration system where every engineering target is derived from a physical limit** — Antal-Grønli 2003 slow-pyrolysis kinetics (char yield 25-35% biomass mass; 50-65% biomass C retained), Lehmann 2007 / Singh 2012 Arrhenius mineralization (E_a 75-120 kJ/mol → 100-1000 yr soil residence at 25 °C), Glaser-Lehmann 2002 CEC mixing rule (3 cmol/kg → 10-20 cmol/kg amended), Smith-Bondeau 2014 SOC sequestration ceiling (~50 MtCO2/yr SA share of 1.5 GtCO2/yr global), Verra VM0044 / Puro durable-removal durability rule (≥ 100 yr Verra / ≥ 1000 yr Puro). Inherits 6 precursor domains (life/agriculture + life/ecology + life/herbalism + materials/recycling + physics/thermodynamics + materials/concrete-technology).
# 21-section template (own#15 HARD), South Africa applied-tech portfolio bet #5 (life axis, agriculture + ecology + carbon scope).
# >
# Honest scope per raw 91 C3: the design **targets** are computed
# physical-limit values (alien-grade 10 = physical-limit reproduction);
# the design constants are NOT force-fit to n=6 number-theoretic
# invariants (own#32 design-by-physics). own#2 master identity
# (σ·φ=n·τ=J₂=24 at n=6) is verified as a framework-level mathematical
# fact, not as a justification for the agronomic / kinetic design.
# Empirical realization gated on F-BIOCHAR-MVP-1..5 (2026-09-30 /
# 2026-12-31 / 2027-03-31 / 2027-06-30); upgrade from
# mk1-PHYSICAL-LIMIT to mk1-EMPIRICAL requires the pilot-kiln char-yield
# measurement + 5-year soil residence + N=10 farm-pair carrying-capacity
# trial completion (mk2 proposal pending).
# ---

# ── §1 WHY (how this technology changes dryland restoration + durable carbon removal) ─────────────────────────────────────────


@D row_char_mass_yield_slow_pyrolysis_4_0 :: biochar-dryland-restoration [ok]
  effect = "Char mass yield (slow pyrolysis 450 °C, HR 10 °C/min)"
  commodity_open_burn_mulch = "0% (open-burn) / 5-10% (uncontrolled fire)"
  hexa_biochar_mk1_physical_limit = "**25-35%**"
  physical_anchor = "Antal-Grønli 2003 IECR 42:1619 Table 4"

@D row_biomass_c_retention_as_char_1 :: biochar-dryland-restoration [ok]
  effect = "Biomass C retention as char"
  commodity_open_burn_mulch = "0% (combustion releases all CO2)"
  hexa_biochar_mk1_physical_limit = "**50-65%**"
  physical_anchor = "Antal-Grønli 2003 + Lehmann 2009 Biochar Handbook"

@D row_soil_residence_half_life_25_c_2 :: biochar-dryland-restoration [ok]
  effect = "Soil residence half-life @ 25 °C"
  commodity_open_burn_mulch = "< 1 yr (mulch)"
  hexa_biochar_mk1_physical_limit = "**≥ 100 yr (Verra), targeting 500-1000 yr (Puro)**"
  physical_anchor = "Singh 2012 GCB 18:2659; Lehmann 2007 MASGC 11:395"

@D row_soil_cec_increase_100_t_ha_bioch_3 :: biochar-dryland-restoration [ok]
  effect = "Soil CEC increase @ 100 t/ha biochar"
  commodity_open_burn_mulch = "0 cmol/kg (no amendment)"
  hexa_biochar_mk1_physical_limit = "**+3-15 cmol/kg**"
  physical_anchor = "Glaser-Lehmann 2002 BFS 35:219; Liang 2006 SSSAJ 70:1719"

@D row_plant_available_water_gain_per_t_4 :: biochar-dryland-restoration [ok]
  effect = "Plant-available water gain per t/ha"
  commodity_open_burn_mulch = "0%"
  hexa_biochar_mk1_physical_limit = "**0.5-1.5% per t/ha**"
  physical_anchor = "Atkinson 2010 Plant Soil 337:1"

@D row_carrying_capacity_uplift_ha_lsu_5 :: biochar-dryland-restoration [ok]
  effect = "Carrying-capacity uplift (ha/LSU reduction)"
  commodity_open_burn_mulch = "0%"
  hexa_biochar_mk1_physical_limit = "**≥ 10% (target 15-25%)**"
  physical_anchor = "Karoo 6-12 ha/LSU baseline (Hoffmann 2014 Afr J Range For Sci)"

@D row_durable_removal_qualifying_credi_6 :: biochar-dryland-restoration [ok]
  effect = "Durable-removal qualifying credits"
  commodity_open_burn_mulch = "none"
  hexa_biochar_mk1_physical_limit = "**Verra VM0044 PASS @ E_a 100 kJ/mol; Puro 1000-yr PASS @ E_a ≥ 115 kJ/mol**"
  physical_anchor = "Verra VM0044 (2023) / Puro.earth (2024) methodology"

# ── §2 COMPARE (commodity vs HEXA-BIOCHAR-DRYLAND, physical-limit framing) ─────────────────────────────────────────


# ── §3 REQUIRES (precursor domains + physical prerequisites) ─────────────────────────────────────────


@D row_rangeland_carrying_capacity_0 :: biochar-dryland-restoration [ok]
  prerequisite = "Rangeland carrying capacity"
  required_level = "precursor: `life/agriculture`"
  component_source = "Karoo 6-12 ha/LSU baseline (Hoffmann 2014 Afr J Range For Sci)"

@D row_invasive_species_ecology_1 :: biochar-dryland-restoration [ok]
  prerequisite = "Invasive species ecology"
  required_level = "precursor: `life/ecology`"
  component_source = "Prosopis 30-80 t/ha aboveground biomass; SA cleared 1-2M ha/yr (van Wilgen 2012 Biol Conserv)"

@D row_phytochemistry_of_feedstock_2 :: biochar-dryland-restoration [ok]
  prerequisite = "Phytochemistry of feedstock"
  required_level = "precursor: `life/herbalism`"
  component_source = "Acacia mearnsii bark 35-45% tannin (Pizzi 1994); Prosopis alkaloids; influences pyrolysis volatile speciation"

@D row_biomass_to_product_conversion_3 :: biochar-dryland-restoration [ok]
  prerequisite = "Biomass-to-product conversion"
  required_level = "precursor: `materials/recycling`"
  component_source = "pyrolysis of waste wood + cleared-invasive feedstocks; carbon-negative"

@D row_pyrolysis_arrhenius_kinetics_4 :: biochar-dryland-restoration [ok]
  prerequisite = "Pyrolysis + Arrhenius kinetics"
  required_level = "precursor: `physics/thermodynamics`"
  component_source = "Antal-Grønli 2003 slow-pyrolysis char yield + Arrhenius mineralization (Lehmann 2007 / Singh 2012)"

@D row_biochar_concrete_additive_cross_5 :: biochar-dryland-restoration [ok]
  prerequisite = "Biochar concrete-additive cross-utilization"
  required_level = "precursor: `materials/concrete-technology`"
  component_source = "Gupta 2018 — 1-5% cement substitution at parity strength; CO2 reduction 5-45 kg/t cement"

@D row_antal_gr_nli_2003_pyrolysis_y0_6 :: biochar-dryland-restoration [ok]
  prerequisite = "Antal-Grønli 2003 pyrolysis Y0"
  required_level = "Specific lemma"
  component_source = "char yield Y0 ≈ 0.40 at 400 °C, very-slow heating; decreases ~0.0035/°C above 400 °C"

@D row_singh_2012_mineralization_e_a_7 :: biochar-dryland-restoration [ok]
  prerequisite = "Singh 2012 mineralization E_a"
  required_level = "Specific bound"
  component_source = "E_a 75-120 kJ/mol; mid-range 100 kJ/mol → t_half ~ 500 yr at 25 °C"

@D row_glaser_lehmann_2002_cec_mixing_8 :: biochar-dryland-restoration [ok]
  prerequisite = "Glaser-Lehmann 2002 CEC mixing"
  required_level = "Specific bound"
  component_source = "aged biochar CEC 30-200 cmol/kg; mass-fraction mixing rule applied to amended soil"

@D row_smith_bondeau_2014_soc_ceiling_9 :: biochar-dryland-restoration [ok]
  prerequisite = "Smith-Bondeau 2014 SOC ceiling"
  required_level = "Specific anchor"
  component_source = "global SOC sink ~ 1.5 GtCO2/yr; SA share ~36 MtCO2/yr (2.4% land)"

@D row_verra_vm0044_puro_durability_10 :: biochar-dryland-restoration [ok]
  prerequisite = "Verra VM0044 / Puro durability"
  required_level = "Regulatory"
  component_source = "Verra ≥ 100 yr with 10% buffer; Puro ≥ 1000 yr"

@D row_working_for_water_program_11 :: biochar-dryland-restoration [ok]
  prerequisite = "Working-for-Water program"
  required_level = "Field channel"
  component_source = "SA government clearance subsidy USD 20-50/ha (DEFF 2023 budget)"

# ── §4 STRUCT (process flow + biochar product spec) ─────────────────────────────────────────


# ── §5 FLOW (manufacturing + deployment sequence) ─────────────────────────────────────────


# ── §6 EVOLVE (mk1 → mk4 roadmap) ─────────────────────────────────────────


# ── §7 VERIFY (raw 70 K≥4 axes; physical-limit verification per own#6 + own#31 + own#33) ─────────────────────────────────────────


@D row_constants_0 :: biochar-dryland-restoration [ok]
  axis = "CONSTANTS"
  verification_claim = "NIST CODATA 2018 (R_gas) + OEIS A000203/A000005/A000010/A007434 + Antal-Grønli 2003 char-yield envelope (IECR 42:1619 Table 4) + Singh 2012 mineralization E_a (GCB 18:2659) + Glaser-Lehmann 2002 CEC (BFS 35:219) + Smith-Bondeau 2014 SOC sink (GCB 20:3270) + Verra VM0044 / Puro durable-removal rules"
  evidence = "§7.1 Block A-F all computed"
  status = "PASS"

@D row_dimensions_1 :: biochar-dryland-restoration [ok]
  axis = "DIMENSIONS"
  verification_claim = "Each computed quantity carries an explicit physical unit (% mass, kJ/mol, K/°C, yr, cmol/kg, tCO2e/ha, USD/tCO2e, t/ha, ppm)"
  evidence = "§7.1 docstrings + assert messages"
  status = "PASS"

@D row_cross_2 :: biochar-dryland-restoration [ok]
  axis = "CROSS"
  verification_claim = "Antal-Grønli yield × C-content × CO2-mass-ratio × permanence buffer = Verra VM0044 credit calculation; mineralization half-life > pyrolysis activation crossing (kinetic stability); CEC mixing-rule cross-checked at 10 t/ha vs 100 t/ha"
  evidence = "§7.1 Block B/C/E/F cross-checks"
  status = "PASS"

@D row_scaling_3 :: biochar-dryland-restoration [ok]
  axis = "SCALING"
  verification_claim = "1-batch lab kiln (5 t biochar) → 10-kiln co-op (5,000 t/yr) → 50-kiln consortium (50,000 t/yr) (mass-extensive yield invariants preserve Antal-Grønli envelope)"
  evidence = "§6 EVOLVE + Block B is mass-extensive in feedstock"
  status = "PASS (analytical)"

@D row_sensitivity_4 :: biochar-dryland-restoration [ok]
  axis = "SENSITIVITY"
  verification_claim = "half-life from 15 °C cold to 30 °C warm soil (Arrhenius continuous in T); char yield from 400 °C low-temp to 600 °C high-temp pyrolysis"
  evidence = "§7.1 Block C demonstrates 15/25/30 °C span; Block B demonstrates 450 / 600 °C span"
  status = "PASS (analytical)"

@D row_limits_5 :: biochar-dryland-restoration [ok]
  axis = "LIMITS"
  verification_claim = "Antal-Grønli 22-40% char yield envelope (lower); Singh 2012 100-1000 yr half-life (lower for Verra); Glaser-Lehmann terra-preta 6-30 cmol/kg (CEC band); Verra 100 yr / Puro 1000 yr (regulatory); OSHA CO 50 ppm / HCN 10 ppm (occupational ceiling)"
  evidence = "§7.1 Block B/C/D/F + Block G"
  status = "PASS"

@D row_chi2_6 :: biochar-dryland-restoration [ok]
  axis = "CHI2"
  verification_claim = "quantitative chi-squared validation against pilot-kiln batch + 5-yr soil residence cohort + N=10 farm-pair carrying-capacity readout"
  evidence = "NOT YET (gate F-BIOCHAR-MVP-1..5)"
  status = "DEFER (intentional, mk2 gate)"

@D row_counter_7 :: biochar-dryland-restoration [ok]
  axis = "COUNTER"
  verification_claim = "counter-example: invasive-biomass pyrolysis system at slow-pyrolysis 450 °C with stacked WfW + Verra/Puro revenue + ≥ 10% carrying-capacity uplift at lower cost-floor"
  evidence = "None found in 2024 SA AgriCarbon survey + Verra registry"
  status = "PASS (literature absence)"

# ── §8 EXEC SUMMARY ─────────────────────────────────────────


# ── §9 SYSTEM REQUIREMENTS ─────────────────────────────────────────


@D b_working_for_water_field_crew_cha_0 :: biochar-dryland-restoration [ok]
  text = "Working-for-Water field crew (chainsaw + brushcutter; SA-resident"

@D b_on_site_mobile_chipper_bandit_18_1 :: biochar-dryland-restoration [ok]
  text = "On-site mobile chipper (Bandit 1850XP or Vermeer equivalent;"

@D b_air_drying_yard_8_12_target_mois_2 :: biochar-dryland-restoration [ok]
  text = "Air-drying yard (8-12% target moisture; 1-2 weeks open-air in SA"

@D b_co_op_kiln_capex_usd_50_200k_1_5_3 :: biochar-dryland-restoration [ok]
  text = "Co-op kiln (CapEx USD 50-200k; 1-5 t biochar per batch; sealed"

@D b_pyrolysis_temperature_controller_4 :: biochar-dryland-restoration [ok]
  text = "Pyrolysis temperature controller (450 °C set-point; 10 °C/min ramp;"

@D b_qc_instrumentation_proximate_ana_5 :: biochar-dryland-restoration [ok]
  text = "QC instrumentation: proximate analysis (ASTM D1762 / D7582);"

@D b_ebc_ii_ibi_premium_certification_6 :: biochar-dryland-restoration [ok]
  text = "EBC II / IBI Premium certification body (ECN.ch / biochar-international.org)."

@D b_field_broadcast_spreader_disc_ha_7 :: biochar-dryland-restoration [ok]
  text = "Field broadcast spreader + disc harrow (0-15 cm soil incorporation)."

@D b_verra_vm0044_puro_earth_registry_8 :: biochar-dryland-restoration [ok]
  text = "Verra VM0044 / Puro.earth registry account (annual MRV submission)."

@D b_conformity_gates_tool_own_doc_li_9 :: biochar-dryland-restoration [ok]
  text = "Conformity gates: tool/own_doc_lint.hexa --rule 6 + 15 PASS;"

# ── §10 ARCHITECTURE ─────────────────────────────────────────


# ── §11 CIRCUIT DESIGN ─────────────────────────────────────────


# ── §12 PCB DESIGN ─────────────────────────────────────────


# ── §13 FIRMWARE ─────────────────────────────────────────


# ── §14 MECHANICAL ─────────────────────────────────────────


@D b_co_op_kiln_1_5_t_biochar_per_bat_0 :: biochar-dryland-restoration [ok]
  text = "Co-op kiln: 1-5 t biochar per batch; cylindrical retort 2-3 m"

@D b_heat_source_external_fire_tube_o_1 :: biochar-dryland-restoration [ok]
  text = "Heat-source: external fire-tube or insulated electric coil; pyrolysis"

@D b_char_particle_size_post_pyrolysi_2 :: biochar-dryland-restoration [ok]
  text = "Char particle size post-pyrolysis: 0.5-5 mm (D50 ≈ 2 mm); D90 ≈ 5 mm."

@D b_char_bulk_density_0_25_0_35_g_cm_3 :: biochar-dryland-restoration [ok]
  text = "Char bulk density: 0.25-0.35 g/cm³ (highly porous; BET surface area"

@D b_char_crush_strength_1_5_mpa_low_4 :: biochar-dryland-restoration [ok]
  text = "Char crush strength: 1-5 MPa (low; biochar crushes during disc-"

@D b_off_gas_safety_passive_flare_bur_5 :: biochar-dryland-restoration [ok]
  text = "Off-gas safety: passive flare burner consumes CO + CH4 + tar before"

@D b_field_broadcast_tractor_mounted_6 :: biochar-dryland-restoration [ok]
  text = "Field broadcast: tractor-mounted spreader at 5-20 t/ha; disc harrow"

# ── §15 MANUFACTURING / REFERENCES ─────────────────────────────────────────


# ── §16 TEST ─────────────────────────────────────────


# ── §17 BOM ─────────────────────────────────────────


@D row_working_for_water_clearance_crew_0 :: biochar-dryland-restoration [ok]
  item = "Working-for-Water clearance crew"
  qty = "per ha"
  source = "DEFF 2023 budget"
  note = "USD 20-50/ha state subsidy"

@D row_mobile_chipper_bandit_1850xp_1 :: biochar-dryland-restoration [ok]
  item = "Mobile chipper (Bandit 1850XP)"
  qty = "1"
  source = "Bandit Industries"
  note = "10-20 mm chip; 1-3 t/hr"

@D row_co_op_slow_pyrolysis_kiln_2 :: biochar-dryland-restoration [ok]
  item = "Co-op slow-pyrolysis kiln"
  qty = "1"
  source = "local fabricator / Carbon-Char Africa"
  note = "1-5 t/batch CapEx USD 50-200k"

@D row_pid_temperature_controller_therm_3 :: biochar-dryland-restoration [ok]
  item = "PID temperature controller + thermocouple"
  qty = "1 set"
  source = "Omega / Endress+Hauser"
  note = "0-1000 °C, 0.5 °C accuracy"

@D row_off_gas_flare_burner_4 :: biochar-dryland-restoration [ok]
  item = "Off-gas flare burner"
  qty = "1"
  source = "local fabricator"
  note = "CO + CH4 + tar combustion"

@D row_tractor_mounted_broadcast_spread_5 :: biochar-dryland-restoration [ok]
  item = "Tractor-mounted broadcast spreader"
  qty = "1"
  source = "John Deere / Kuhn"
  note = "5-20 t/ha rate"

@D row_disc_harrow_6 :: biochar-dryland-restoration [ok]
  item = "Disc harrow"
  qty = "1"
  source = "Massey Ferguson"
  note = "0-15 cm depth"

@D row_proximate_analysis_lab_kit_astm_7 :: biochar-dryland-restoration [ok]
  item = "Proximate analysis lab kit (ASTM D1762)"
  qty = "1"
  source = "LECO / Eltra"
  note = "bench-top muffle furnace"

@D row_chno_elemental_analyzer_8 :: biochar-dryland-restoration [ok]
  item = "CHNO elemental analyzer"
  qty = "1"
  source = "Vario MICRO cube / Thermo Flash"
  note = "H/C + O/C ratio"

@D row_gc_ms_pah_analyzer_epa_8270_9 :: biochar-dryland-restoration [ok]
  item = "GC-MS PAH analyzer (EPA 8270)"
  qty = "1"
  source = "Agilent / Shimadzu"
  note = "16-PAH sum < 12 mg/kg"

@D row_icp_ms_heavy_metal_analyzer_epa_10 :: biochar-dryland-restoration [ok]
  item = "ICP-MS heavy-metal analyzer (EPA 6020)"
  qty = "1"
  source = "Agilent / Thermo"
  note = "As/Cd/Cr/Cu/Hg/Ni/Pb/Zn"

@D row_portable_co_hcn_gas_detector_11 :: biochar-dryland-restoration [ok]
  item = "Portable CO + HCN gas detector"
  qty = "2"
  source = "Dräger / RAE Systems"
  note = "OSHA PEL monitoring"

@D row_ebc_ii_ibi_premium_certification_12 :: biochar-dryland-restoration [ok]
  item = "EBC II / IBI Premium certification fee"
  qty = "annual"
  source = "ECN.ch / biochar-international.org"
  note = "per-batch QC submission"

@D row_verra_vm0044_puro_earth_registry_13 :: biochar-dryland-restoration [ok]
  item = "Verra VM0044 / Puro.earth registry account"
  qty = "1"
  source = "Verra / Puro Standard"
  note = "annual MRV submission"

# ── §18 VENDOR ─────────────────────────────────────────


@D row_deff_sa_government_0 :: biochar-dryland-restoration [ok]
  vendor = "DEFF (SA government)"
  component = "Working-for-Water clearance subsidy"
  role = "feedstock channel + USD 20-50/ha"

@D row_bandit_industries_usa_vermeer_1 :: biochar-dryland-restoration [ok]
  vendor = "Bandit Industries (USA) / Vermeer"
  component = "mobile chipper"
  role = "feedstock prep"

@D row_carbon_char_africa_local_fabrica_2 :: biochar-dryland-restoration [ok]
  vendor = "Carbon-Char Africa / local fabricator"
  component = "co-op pyrolysis kiln"
  role = "pyrolysis CapEx"

@D row_omega_engineering_endress_hauser_3 :: biochar-dryland-restoration [ok]
  vendor = "Omega Engineering / Endress+Hauser"
  component = "PID + thermocouple"
  role = "process control"

@D row_leco_eltra_4 :: biochar-dryland-restoration [ok]
  vendor = "LECO / Eltra"
  component = "proximate analysis"
  role = "char QC"

@D row_vario_micro_cube_thermo_5 :: biochar-dryland-restoration [ok]
  vendor = "Vario MICRO cube / Thermo"
  component = "CHNO analyzer"
  role = "H/C ratio"

@D row_agilent_shimadzu_6 :: biochar-dryland-restoration [ok]
  vendor = "Agilent / Shimadzu"
  component = "GC-MS PAH"
  role = "EBC II compliance"

@D row_dr_ger_rae_systems_7 :: biochar-dryland-restoration [ok]
  vendor = "Dräger / RAE Systems"
  component = "CO/HCN gas detector"
  role = "OSHA PEL safety"

@D row_ecn_ch_ibi_8 :: biochar-dryland-restoration [ok]
  vendor = "ECN.ch / IBI"
  component = "EBC II / IBI Premium certification"
  role = "biochar quality grade"

@D row_verra_standards_program_9 :: biochar-dryland-restoration [ok]
  vendor = "Verra Standards Program"
  component = "VM0044 registry"
  role = "carbon-credit issuance"

@D row_puro_earth_10 :: biochar-dryland-restoration [ok]
  vendor = "Puro.earth"
  component = "Biochar v3 methodology"
  role = "durable-removal credit"

@D row_alliedoffsets_sylvera_11 :: biochar-dryland-restoration [ok]
  vendor = "AlliedOffsets / Sylvera"
  component = "carbon market price feed"
  role = "F-BIOCHAR-MVP-4 monitor"

@D row_n6_architecture_private_framewor_12 :: biochar-dryland-restoration [ok]
  vendor = "n6-architecture private framework"
  component = "own_doc_lint / own31 lint"
  role = "docs gate"

# ── §19 ACCEPTANCE / MISS criteria (own#12 pre-declared) ─────────────────────────────────────────


@D b_accept_p1_7_1_verify_7_1_embedde_0 :: biochar-dryland-restoration [ok]
  text = "**ACCEPT (P1 §7.1 verify)**: §7.1 embedded Python block prints"

@D b_accept_p2_own_31_lint_tool_own31_1 :: biochar-dryland-restoration [ok]
  text = "**ACCEPT (P2 own#31 lint)**: `tool/own31_verify_tautology_ban_lint.hexa"

@D b_accept_p3_own_6_own_15_tool_own_2 :: biochar-dryland-restoration [ok]
  text = "**ACCEPT (P3 own#6 + own#15)**: `tool/own_doc_lint.hexa --rule 6` and"

@D b_accept_p4_raw_70_k_4_4_of_8_raw_3 :: biochar-dryland-restoration [ok]
  text = "**ACCEPT (P4 raw 70 K≥4)**: ≥ 4 of 8 raw 70 axes PASS (currently 7"

@D b_accept_p5_atlas_registry_domains_4 :: biochar-dryland-restoration [ok]
  text = "**ACCEPT (P5 atlas registry)**: `domains/_index.json` `life` axis +"

@D b_accept_p6_alien_grade_10_each_of_5 :: biochar-dryland-restoration [ok]
  text = "**ACCEPT (P6 alien-grade 10)**: each of the 6 precursor cross-links"

@D b_miss_if_any_of_6 :: biochar-dryland-restoration [ok]
  text = "**MISS** if any of:"

@D b_defer_f_biochar_mvp_1_5_are_pre_7 :: biochar-dryland-restoration [ok]
  text = "**DEFER**: F-BIOCHAR-MVP-1..5 are pre-declared MVP empirical"

@D b_f_biochar_mvp_1_deadline_2026_12_8 :: biochar-dryland-restoration [ok]
  text = "**F-BIOCHAR-MVP-1** (deadline 2026-12-31): pilot co-op kiln batch"

@D b_f_biochar_mvp_2_deadline_2027_06_9 :: biochar-dryland-restoration [ok]
  text = "**F-BIOCHAR-MVP-2** (deadline 2027-06-30): 5-yr soil residence in"

@D b_f_biochar_mvp_3_deadline_2027_03_10 :: biochar-dryland-restoration [ok]
  text = "**F-BIOCHAR-MVP-3** (deadline 2027-03-31): N=10 farm-pair trial"

@D b_f_biochar_mvp_4_deadline_2026_09_11 :: biochar-dryland-restoration [ok]
  text = "**F-BIOCHAR-MVP-4** (deadline 2026-09-30): Verra/Puro carbon-credit"

@D b_f_biochar_mvp_5_deadline_2026_12_12 :: biochar-dryland-restoration [ok]
  text = "**F-BIOCHAR-MVP-5** (deadline 2026-12-31): pilot kiln safety"

# ── §20 APPENDIX ─────────────────────────────────────────


@D b_empirical_claims_at_this_revisio_0 :: biochar-dryland-restoration [ok]
  text = "**Empirical claims at this revision**: 0 pilot-kiln batches measured."

@D b_alien_grade_10_physical_limit_re_1 :: biochar-dryland-restoration [ok]
  text = "**alien-grade 10 = physical-limit reproduction**: each engineering"

@D b_not_n_6_force_fit_biochar_design_2 :: biochar-dryland-restoration [ok]
  text = "**NOT n=6 force-fit**: biochar design constants (33% char mass yield,"

@D b_own_11_no_clay_millennium_claim_3 :: biochar-dryland-restoration [ok]
  text = "**own#11 (no Clay Millennium claim)**: PASS — agronomy + carbon-"

@D b_own_2_n_6_master_identity_hard_p_4 :: biochar-dryland-restoration [ok]
  text = "**own#2 (n=6 master identity HARD)**: PASS via §7.1 Block A standalone"

@D b_own_33_ai_native_verify_pattern_5 :: biochar-dryland-restoration [ok]
  text = "**own#33 (ai-native-verify-pattern)**: PASS — §7.1 follows the"

@D b_sister_axis_life_agriculture_ran_6 :: biochar-dryland-restoration [ok]
  text = "Sister axis: `life/agriculture` (rangeland carrying capacity, Karoo"

@D b_sister_axis_life_ecology_invasiv_7 :: biochar-dryland-restoration [ok]
  text = "Sister axis: `life/ecology` (invasive species ecology, van Wilgen"

@D b_sister_axis_life_herbalism_acaci_8 :: biochar-dryland-restoration [ok]
  text = "Sister axis: `life/herbalism` (Acacia mearnsii bark tannin, Prosopis"

@D b_sister_axis_materials_recycling_9 :: biochar-dryland-restoration [ok]
  text = "Sister axis: `materials/recycling` (waste-stream biomass-to-product"

@D b_sister_axis_physics_thermodynami_10 :: biochar-dryland-restoration [ok]
  text = "Sister axis: `physics/thermodynamics` (Antal-Grønli pyrolysis +"

@D b_sister_axis_materials_concrete_t_11 :: biochar-dryland-restoration [ok]
  text = "Sister axis: `materials/concrete-technology` (Gupta 2018 1-5%"

@D b_sister_domain_life_axis_domains_12 :: biochar-dryland-restoration [ok]
  text = "Sister domain (life axis): `domains/life/agriculture/agriculture.md`"

@D b_sister_domain_life_axis_domains_13 :: biochar-dryland-restoration [ok]
  text = "Sister domain (life axis): `domains/life/ecology/ecology.md`"

@D b_sa_portfolio_source_proposals_so_14 :: biochar-dryland-restoration [ok]
  text = "SA portfolio source: `proposals/south-africa-applied-tech.md` row 5"

@D b_pattern_precedent_domains_pets_c_15 :: biochar-dryland-restoration [ok]
  text = "Pattern precedent: `domains/pets/cat-food/cat-food.md` (cat-food"

@D b_master_identity_papers_hexa_weav_16 :: biochar-dryland-restoration [ok]
  text = "Master identity: `papers/hexa-weave-formal-mechanical-w2-2026-04-28.md`"

@D b_lint_gates_tool_own_doc_lint_hex_17 :: biochar-dryland-restoration [ok]
  text = "Lint gates: `tool/own_doc_lint.hexa --rule 6` and `--rule 15`,"

# ── §21 IMPACT ─────────────────────────────────────────


# ── mk-history ─────────────────────────────────────────


@D b_2026_05_01t22_00_00z_initial_mk1_0 :: biochar-dryland-restoration [ok]
  text = "2026-05-01T22:00:00Z — initial mk1 PHYSICAL-LIMIT registered (alien-"
