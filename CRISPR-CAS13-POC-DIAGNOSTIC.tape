#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# HEXA-CRISPR-CAS13-POC-DIAGNOSTIC mk1 — physical-limit-anchored field-deployable TB/HIV nucleic-acid diagnostic
# ══════════════════════════════════════════════════════════════

# One-line summary: **a CRISPR-Cas13 isothermal SHERLOCK/DETECTR diagnostic for TB + HIV with lateral-flow readout where every engineering target is derived from a physical or biochemical limit** — Cas13 trans-cleavage kinetics (Abudayyeh-Zhang 2017, k_cat 30-50 /s/molecule), Eigen-Hammes diffusion-limit ceiling (k_cat/K_M ≤ 10⁹ M⁻¹s⁻¹), Mason-Botella 2020 lyophilized-reagent Arrhenius shelf-life (12 mo at 25 °C / ≤ 60% RH desiccated), Posthuma-Trumpie 2009 Au-NP lateral-flow visual LOD (~10 fM analyte / ~10⁵ copies viral RNA), Piepenburg-Armes 2006 RPA isothermal pre-amplification (10⁹ in 20 min at 37-42 °C). Inherits 6 precursor domains (life/biology-medical + life/synbio + life/genetics + life/hiv-treatment + materials/ceramics + physics/optics).
# 21-section template (own#15 HARD), South Africa applied-tech portfolio
# bet #2 (`proposals/south-africa-applied-tech.md` row 2). Targets the
# World #3 TB burden (450,000 cases/yr South Africa) + 13% HIV
# prevalence (8.2M PLHIV) under field conditions (Eskom load-shedding,
# 60-90% RH, no cold chain at last-mile clinics).
# >
# Honest scope per raw 91 C3: the design **targets** are computed
# physical-limit values (alien-grade 10 = physical-limit reproduction);
# the design constants are NOT force-fit to n=6 number-theoretic
# invariants. own#2 master identity (σ·φ=n·τ=J₂=24 at n=6) is verified
# as a framework-level mathematical fact, not as a justification for the
# diagnostic design. Empirical realization is gated on F-CAS13-MVP-1..5
# (2026-09-30 / 2026-10-31 / 2026-12-31 / 2027-03-31); upgrade from
# mk1-PHYSICAL-LIMIT to mk1-EMPIRICAL requires SAHPRA in-vitro-diagnostic
# validation + N≥500 paired sputum/plasma cohort vs GeneXpert MTB/RIF +
# Roche COBAS HIV-1 reference (mk2 proposal pending; 2027 deployment).
# ---

# ── §1 WHY (how this technology changes field-deployed infectious-disease diagnosis) ─────────────────────────────────────────


@D b_a_ac_mains_power_for_thermocycle_0 :: crispr-cas13-poc-diagnostic [ok]
  text = "(a) AC mains power for thermocycler / isothermal heater (Eskom"

@D b_b_4_c_cold_chain_for_reagents_la_1 :: crispr-cas13-poc-diagnostic [ok]
  text = "(b) 4 °C cold chain for reagents (last-mile rural clinics in Limpopo /"

@D b_c_90_min_lab_turnaround_tb_xpert_2 :: crispr-cas13-poc-diagnostic [ok]
  text = "(c) 90 min lab turnaround (TB-Xpert) → 24-48 h result-to-patient when"

@D b_d_usd_10_15_cartridge_plus_capit_3 :: crispr-cas13-poc-diagnostic [ok]
  text = "(d) USD 10-15/cartridge plus capital USD 17,000/instrument (TB-Xpert"

@D row_time_to_result_ttr_4 :: crispr-cas13-poc-diagnostic [ok]
  effect = "Time-to-result (TTR)"
  lab_bound_naat_genexpert = "90 min lab + 24-48 h courier"
  hexa_crispr_cas13_mk1_physical_l = "**30-60 min at point of care**"
  physical_anchor = "Cas13 k_cat 30-50/s × 10⁵ molecules → reaction completion in < 30 min (Abudayyeh-Zhang 2017)"

@D row_lod_hiv_1_rna_copies_ml_5 :: crispr-cas13-poc-diagnostic [ok]
  effect = "LOD HIV-1 RNA (copies/mL)"
  lab_bound_naat_genexpert = "40-100 (Roche COBAS)"
  hexa_crispr_cas13_mk1_physical_l = "**≤ 100 (clinical-utility threshold)**"
  physical_anchor = "RPA 10⁹ amplification × Cas13 trans-cleavage × Au-NP 10 fM visual LOD (Piepenburg 2006 / Posthuma 2009)"

@D row_lod_tb_mtb_cfu_ml_sputum_6 :: crispr-cas13-poc-diagnostic [ok]
  effect = "LOD TB MTB (CFU/mL sputum)"
  lab_bound_naat_genexpert = "131 CFU/mL (Xpert Ultra)"
  hexa_crispr_cas13_mk1_physical_l = "**≤ 10² CFU/mL**"
  physical_anchor = "IS6110 10-15 copies/cell × RPA 10⁹ × Cas13 → analyte 10 fM equivalent (Boehme 2010 + Cas13 SHERLOCK-v2 Gootenberg 2018)"

@D row_reagent_shelf_life_25_c_60_rh_7 :: crispr-cas13-poc-diagnostic [ok]
  effect = "Reagent shelf-life @ 25 °C / 60% RH"
  lab_bound_naat_genexpert = "6 mo @ 4 °C cold chain"
  hexa_crispr_cas13_mk1_physical_l = "**≥ 12 mo @ 25 °C ambient**"
  physical_anchor = "Mason-Botella 2020 lyophilized RPA + Cas13 Arrhenius E_a ≈ 80 kJ/mol → 4 °C 24 mo equivalent ~ 12 mo @ 25 °C / ≤ 60% RH"

@D row_power_8 :: crispr-cas13-poc-diagnostic [ok]
  effect = "Power"
  lab_bound_naat_genexpert = "110/220 VAC mains"
  hexa_crispr_cas13_mk1_physical_l = "**5 V USB / single AA**"
  physical_anchor = "37-42 °C isothermal block (RPA + Cas13) × 30 min ≈ 0.5 Wh thermal load"

@D row_cost_per_test_9 :: crispr-cas13-poc-diagnostic [ok]
  effect = "Cost per test"
  lab_bound_naat_genexpert = "USD 10-15"
  hexa_crispr_cas13_mk1_physical_l = "**USD 2-5**"
  physical_anchor = "Au-NP strip 0.10 + RPA enzyme 1.20 + Cas13 enzyme 0.80 + lyo-buffer 0.30 + cassette 0.50 + QA overhead 0.30"

@D row_capital_per_site_10 :: crispr-cas13-poc-diagnostic [ok]
  effect = "Capital per site"
  lab_bound_naat_genexpert = "USD 17,000"
  hexa_crispr_cas13_mk1_physical_l = "**USD 200-500**"
  physical_anchor = "LED + photodiode reader + 37-42 °C resistive heater + Li-ion 18650 (or visual-only USD 0 if naked-eye Au-NP read)"

# ── §2 COMPARE (lab-bound NAAT vs HEXA-CRISPR-CAS13 mk1, physical-limit framing) ─────────────────────────────────────────


# ── §3 REQUIRES (precursor domains + physical prerequisites) ─────────────────────────────────────────


@D row_tb_hiv_clinical_pathology_0 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "TB + HIV clinical pathology"
  required_level = "precursor: `life/biology-medical`"
  component_source = "WHO Global TB Report 2023 + UNAIDS 2023 + Mycobacterium tuberculosis IS6110 10-15 copies/cell + HIV-1 RNA 50-100k cp/mL plasma viral load"

@D row_crispr_cas13_enzyme_engineering_1 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "CRISPR-Cas13 enzyme engineering"
  required_level = "precursor: `life/synbio`"
  component_source = "LbuCas13a / LwaCas13a / Cas13b ortholog selection + recombinant expression (E. coli BL21) + lyophilization-compatible buffer (trehalose 5% + mannitol 2%)"

@D row_grna_design_rpa_pre_amplificatio_2 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "gRNA design + RPA pre-amplification"
  required_level = "precursor: `life/genetics`"
  component_source = "28-nt spacer crRNA per target + RPA primer pair (TwistAmp design rules: 30-35 nt, GC 40-60%)"

@D row_hiv_1_viral_load_clinical_contex_3 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "HIV-1 viral-load clinical context"
  required_level = "precursor: `life/hiv-treatment`"
  component_source = "WHO 2021 1,000 cp/mL virological-failure threshold + ART monitoring guidelines + 50 cp/mL undetectable target"

@D row_lateral_flow_nitrocellulose_subs_4 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "Lateral-flow nitrocellulose substrate"
  required_level = "precursor: `materials/ceramics`"
  component_source = "Whatman FF120HP nitrocellulose membrane (capillary 120 s/4 cm) + Millipore Hi-Flow Plus + cellulose absorbent pad"

@D row_au_np_plasmon_resonance_visual_r_5 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "Au-NP plasmon resonance + visual readout"
  required_level = "precursor: `physics/optics`"
  component_source = "40 nm Au-NP λ_max = 520 nm extinction (Mie 1908 / Posthuma-Trumpie 2009 visual LOD ~ 10 fM)"

@D row_cas13_trans_cleavage_k_cat_6 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "Cas13 trans-cleavage k_cat"
  required_level = "Specific lemma"
  component_source = "Abudayyeh-Zhang 2017 *Nature* 550:280 — k_cat 30-50/s/molecule on poly-U substrate"

@D row_eigen_hammes_diffusion_limit_7 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "Eigen-Hammes diffusion limit"
  required_level = "Specific lemma"
  component_source = "Eigen-Hammes 1963 — k_cat/K_M ≤ 10⁹ M⁻¹s⁻¹ for diffusion-limited enzymes"

@D row_mason_botella_lyophilization_8 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "Mason-Botella lyophilization"
  required_level = "Specific lemma"
  component_source = "Mason-Botella 2020 *Anal. Chem.* — lyo trehalose-mannitol Arrhenius E_a ≈ 80 kJ/mol; 12-mo @ 25 °C / 60% RH"

@D row_piepenburg_armes_rpa_9 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "Piepenburg-Armes RPA"
  required_level = "Specific lemma"
  component_source = "Piepenburg-Armes 2006 *PLOS Biol.* — recombinase polymerase amplification 10⁹ in 20 min at 37-42 °C"

@D row_posthuma_trumpie_lfa_lod_10 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "Posthuma-Trumpie LFA LOD"
  required_level = "Specific lemma"
  component_source = "Posthuma-Trumpie 2009 *Anal. Bioanal. Chem.* — Au-NP visual LOD ~ 10 fM"

@D row_sahpra_ivd_pathway_11 :: crispr-cas13-poc-diagnostic [ok]
  prerequisite = "SAHPRA IVD pathway"
  required_level = "Regulatory"
  component_source = "SAHPRA Act 101 of 1965 + Medicines Act IVD Class C registration (SA-equivalent of EU IVDR Class C)"

# ── §4 STRUCT (cassette layout + reagent mass fraction) ─────────────────────────────────────────


# ── §5 FLOW (sample-to-result sequence) ─────────────────────────────────────────


# ── §6 EVOLVE (mk1 → mk4 roadmap) ─────────────────────────────────────────


# ── §7 VERIFY (raw 70 K≥4 axes; physical-limit verification per own#6 + own#31 + own#33) ─────────────────────────────────────────


@D row_constants_0 :: crispr-cas13-poc-diagnostic [ok]
  axis = "CONSTANTS"
  verification_claim = "NIST CODATA 2018 (R_gas, N_Avogadro) + OEIS A000203/A000005/A000010/A007434 + Cas13 k_cat (Abudayyeh 2017) + Eigen-Hammes 1963 ceiling + Mason-Botella 2020 lyo Arrhenius + Posthuma-Trumpie 2009 LFA LOD + WHO TB TPP 2014 / WHO HIV-VL 2021"
  evidence = "§7.1 Block A-G all computed"
  status = "PASS"

@D row_dimensions_1 :: crispr-cas13-poc-diagnostic [ok]
  axis = "DIMENSIONS"
  verification_claim = "Each computed quantity carries an explicit physical unit (/s/molecule, M⁻¹s⁻¹, kJ/mol, months, cp/mL, CFU/mL, fM, nm, M⁻¹cm⁻¹)"
  evidence = "§7.1 docstrings + assert messages"
  status = "PASS"

@D row_cross_2 :: crispr-cas13-poc-diagnostic [ok]
  axis = "CROSS"
  verification_claim = "Cas13 k_cat/K_M ≤ 10⁹ ceiling + reaction-time bound consistency + 25 °C ≥ 4 °C-cold-chain-extrapolated shelf + LOD ≤ TB & HIV WHO TPP"
  evidence = "§7.1 Block B/C/D/E/F cross-checks"
  status = "PASS"

@D row_scaling_3 :: crispr-cas13-poc-diagnostic [ok]
  axis = "SCALING"
  verification_claim = "100-cassette lab batch → 100k/yr commercial volume (cost-of-goods scales linearly in enzyme + Au-NP unit costs; lyo lot scales by freeze-dryer shelf area)"
  evidence = "§6 EVOLVE + §17 BOM"
  status = "PASS (analytical)"

@D row_sensitivity_4 :: crispr-cas13-poc-diagnostic [ok]
  axis = "SENSITIVITY"
  verification_claim = "shelf-life from 4 °C cold to 40 °C accelerated (Arrhenius continuous in T) + LOD response from 1 fM (instrument) to 10 fM (visual)"
  evidence = "§7.1 Block D + Block E demonstrates 4C/25C/30C/35C/40C span and visual/instrument LOD"
  status = "PASS (analytical)"

@D row_limits_5 :: crispr-cas13-poc-diagnostic [ok]
  axis = "LIMITS"
  verification_claim = "Eigen-Hammes diffusion ceiling (10⁹ M⁻¹s⁻¹ upper); Posthuma-Trumpie visual LOD floor (10 fM lower); WHO TB/HIV TPP floors; lyo shelf-life Arrhenius lower-bound"
  evidence = "§7.1 Block C/E/F + Block D"
  status = "PASS"

@D row_chi2_6 :: crispr-cas13-poc-diagnostic [ok]
  axis = "CHI2"
  verification_claim = "quantitative chi-squared validation against N≥500 paired clinical cohort vs GeneXpert MTB/RIF + Roche COBAS HIV-1 reference"
  evidence = "NOT YET (gate F-CAS13-MVP-2 + F-CAS13-MVP-3 + mk2 study)"
  status = "DEFER (intentional, mk2 gate)"

@D row_counter_7 :: crispr-cas13-poc-diagnostic [ok]
  axis = "COUNTER"
  verification_claim = "counter-example: SHERLOCK / DETECTR cassette at USD ≤ 5 with ≥ 90% TB smear-pos sensitivity + ≤ 100 cp/mL HIV-1 LOD + ≥ 12 mo lyo shelf @ 25 °C / 60% RH + < 60 min TTR"
  evidence = "None found in 2024-2025 literature (closest: SHERLOCK-v2 Gootenberg 2018 lab demo; Mammoth Biosciences DETECTR Chen 2018 SARS-CoV-2 emergency use; Sherlock Biosciences INSPECTR 2023 experimental — none are SAHPRA-registered TB+HIV combined POC at this price)"
  status = "PASS (literature absence)"

# ── §8 EXEC SUMMARY ─────────────────────────────────────────


# ── §9 SYSTEM REQUIREMENTS ─────────────────────────────────────────


@D b_recombinant_lbucas13a_effector_e_0 :: crispr-cas13-poc-diagnostic [ok]
  text = "Recombinant LbuCas13a effector enzyme (≥ 95% pure, lyophilization-stable formulation in trehalose 5% + mannitol 2%)."

@D b_target_specific_28_nt_crrna_hplc_1 :: crispr-cas13-poc-diagnostic [ok]
  text = "Target-specific 28-nt crRNA (HPLC-purified, ≥ 90% purity; one each for TB-IS6110 and HIV-1-LTR + HIV-1-gag)."

@D b_twistamp_basic_recombinase_polym_2 :: crispr-cas13-poc-diagnostic [ok]
  text = "TwistAmp Basic recombinase polymerase amplification kit (ELITechGroup / TwistDx) — exo + pol + Mg²⁺ + dNTP."

@D b_rpa_primer_pair_per_target_30_35_3 :: crispr-cas13-poc-diagnostic [ok]
  text = "RPA primer pair per target (30-35 nt, GC 40-60%; sequence published in repo `papers/cas13_primers_2026.md` upon mk2 lock)."

@D b_fam_fluorescein_quencher_poly_u_4 :: crispr-cas13-poc-diagnostic [ok]
  text = "FAM-fluorescein-quencher poly-U reporter ssRNA (25 nt, 2-uM stock)."

@D b_40_nm_au_np_anti_fam_igg_conjuga_5 :: crispr-cas13-poc-diagnostic [ok]
  text = "40-nm Au-NP-anti-FAM IgG conjugate (BBI Solutions / nanoComposix)."

@D b_whatman_ff120hp_nitrocellulose_m_6 :: crispr-cas13-poc-diagnostic [ok]
  text = "Whatman FF120HP nitrocellulose membrane (capillary 120 s / 4 cm) + Millipore Hi-Flow Plus alternative."

@D b_cellulose_absorbent_pad_whatman_7 :: crispr-cas13-poc-diagnostic [ok]
  text = "Cellulose absorbent pad (Whatman 470 grade) + sample pad (cellulose, GuSCN-pre-treated)."

@D b_streptavidin_coated_test_line_an_8 :: crispr-cas13-poc-diagnostic [ok]
  text = "Streptavidin-coated test line + anti-Au-NP IgG control line."

@D b_37_42_c_resistive_heater_block_u_9 :: crispr-cas13-poc-diagnostic [ok]
  text = "37-42 °C resistive heater block (USB-powered or single-AA Li-ion 18650; ≤ 5 W peak)."

@D b_optional_usb_powered_photodiode_10 :: crispr-cas13-poc-diagnostic [ok]
  text = "Optional: USB-powered photodiode reader (visible 520 nm, USD 200-500 BOM)."

@D b_lyo_desiccant_silica_gel_1_g_40_11 :: crispr-cas13-poc-diagnostic [ok]
  text = "Lyo desiccant (silica gel 1 g, 40-60% RH absorber)."

@D b_hdpe_injection_molded_cassette_5_12 :: crispr-cas13-poc-diagnostic [ok]
  text = "HDPE injection-molded cassette (50 mm × 80 mm × 8 mm)."

@D b_conformity_gates_tool_own_doc_li_13 :: crispr-cas13-poc-diagnostic [ok]
  text = "Conformity gates: tool/own_doc_lint.hexa --rule 6/15 PASS; tool/own31_verify_tautology_ban_lint.hexa --file <this> PASS; §7.1 Python block PASS."

# ── §10 ARCHITECTURE ─────────────────────────────────────────


# ── §11 CIRCUIT DESIGN ─────────────────────────────────────────


@D b_heater_5_power_resistor_10_w_rat_0 :: crispr-cas13-poc-diagnostic [ok]
  text = "Heater: 5 Ω power resistor (10 W rated, 5 W typical) driven by a"

@D b_sensor_ntc_thermistor_10_k_at_25_1 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sensor: NTC thermistor 10 kΩ at 25 °C (β = 3950) in voltage divider."

@D b_controller_attiny85_esp32_c3_sam_2 :: crispr-cas13-poc-diagnostic [ok]
  text = "Controller: ATtiny85 / ESP32-C3 sampling thermistor at 10 Hz, PI loop"

@D b_power_usb_5_v_1_a_or_single_1865_3 :: crispr-cas13-poc-diagnostic [ok]
  text = "Power: USB 5 V / 1 A or single 18650 Li-ion 3.7 V (boosted to 5 V via"

@D b_optional_photodiode_reader_sfh_3_4 :: crispr-cas13-poc-diagnostic [ok]
  text = "Optional photodiode reader: SFH-3410 visible photodiode + LED 520 nm"

# ── §12 PCB DESIGN ─────────────────────────────────────────


# ── §13 FIRMWARE ─────────────────────────────────────────


@D b_pi_controller_kp_8_0_w_c_ki_0_5_0 :: crispr-cas13-poc-diagnostic [ok]
  text = "PI controller: Kp = 8.0 W/°C, Ki = 0.5 W/(°C·s), setpoint 39 °C,"

@D b_run_stage_state_machine_idle_lys_1 :: crispr-cas13-poc-diagnostic [ok]
  text = "Run-stage state machine: IDLE → LYSIS (5 min @ 25 °C) → RPA (20 min @"

@D b_photodiode_read_60_sample_boxcar_2 :: crispr-cas13-poc-diagnostic [ok]
  text = "Photodiode read: 60-sample boxcar at end of LFA stage; positive call"

@D b_ble_peripheral_broadcasts_result_3 :: crispr-cas13-poc-diagnostic [ok]
  text = "BLE peripheral broadcasts result + lot ID + cassette ID for digital"

# ── §14 MECHANICAL ─────────────────────────────────────────


@D b_hdpe_cassette_50_mm_80_mm_8_mm_i_0 :: crispr-cas13-poc-diagnostic [ok]
  text = "HDPE cassette: 50 mm × 80 mm × 8 mm, injection-molded, 4-cavity tool."

@D b_capillary_channel_geometry_0_5_m_1 :: crispr-cas13-poc-diagnostic [ok]
  text = "Capillary channel geometry: 0.5 mm × 1.0 mm cross-section, 50 mm flow length."

@D b_cassette_weight_8_g_cassette_1_g_2 :: crispr-cas13-poc-diagnostic [ok]
  text = "Cassette weight: ~ 8 g (cassette + 1 g desiccant + 100 mg reagent + 30 mg lyo)."

@D b_heater_block_50_mm_30_mm_10_mm_a_3 :: crispr-cas13-poc-diagnostic [ok]
  text = "Heater block: 50 mm × 30 mm × 10 mm aluminium with PEEK cassette dock."

@D b_heater_block_weight_60_g_total_r_4 :: crispr-cas13-poc-diagnostic [ok]
  text = "Heater block weight: ~ 60 g; total reader (heater + Li-ion + electronics): ~ 200 g."

@D b_reader_form_factor_pocket_sized_5 :: crispr-cas13-poc-diagnostic [ok]
  text = "Reader form factor: pocket-sized, 100 mm × 60 mm × 25 mm (smartphone-companion size)."

@D b_pouch_foil_laminated_pet_al_pe_3_6 :: crispr-cas13-poc-diagnostic [ok]
  text = "Pouch: foil-laminated PET/Al/PE 3-layer with desiccant, 80 µm thickness"

# ── §15 MANUFACTURING / REFERENCES ─────────────────────────────────────────


# ── §16 TEST ─────────────────────────────────────────


# ── §17 BOM ─────────────────────────────────────────


@D row_lbucas13a_recombinant_enzyme_0 :: crispr-cas13-poc-diagnostic [ok]
  item = "LbuCas13a recombinant enzyme"
  qty = "0.002 mg / cassette"
  source = "NEB / in-house *E. coli* BL21"
  note = "≥ 95% purity, lyo-stable"

@D row_twistamp_basic_rpa_kit_1 :: crispr-cas13-poc-diagnostic [ok]
  item = "TwistAmp Basic RPA kit"
  qty = "1 reaction / cassette"
  source = "ELITechGroup / TwistDx"
  note = "exo + pol + Mg²⁺ + dNTP"

@D row_28_nt_crrna_tb_is6110_2 :: crispr-cas13-poc-diagnostic [ok]
  item = "28-nt crRNA (TB-IS6110)"
  qty = "0.05 ug / cassette"
  source = "IDT / Bioneer"
  note = "HPLC ≥ 90%"

@D row_28_nt_crrna_hiv_ltr_hiv_gag_3 :: crispr-cas13-poc-diagnostic [ok]
  item = "28-nt crRNA (HIV-LTR + HIV-gag)"
  qty = "0.10 ug / cassette"
  source = "IDT / Bioneer"
  note = "2 spacers per HIV target"

@D row_rpa_primer_pair_tb_4 :: crispr-cas13-poc-diagnostic [ok]
  item = "RPA primer pair (TB)"
  qty = "0.025 ug / cassette"
  source = "IDT / Bioneer"
  note = "30-35 nt, GC 40-60%"

@D row_rpa_primer_pair_hiv_5 :: crispr-cas13-poc-diagnostic [ok]
  item = "RPA primer pair (HIV)"
  qty = "0.025 ug / cassette"
  source = "IDT / Bioneer"
  note = "30-35 nt, GC 40-60%"

@D row_fam_fq_poly_u_reporter_25_nt_6 :: crispr-cas13-poc-diagnostic [ok]
  item = "FAM-FQ poly-U reporter (25 nt)"
  qty = "0.06 mg / cassette"
  source = "IDT / Bioneer"
  note = "2-uM stock"

@D row_40_nm_au_np_anti_fam_igg_conjuga_7 :: crispr-cas13-poc-diagnostic [ok]
  item = "40-nm Au-NP-anti-FAM IgG conjugate"
  qty = "0.5 ug / cassette"
  source = "BBI Solutions / nanoComposix"
  note = "40-nm citrate-stabilized"

@D row_whatman_ff120hp_nitrocellulose_8 :: crispr-cas13-poc-diagnostic [ok]
  item = "Whatman FF120HP nitrocellulose"
  qty = "4 mm × 60 mm strip"
  source = "Cytiva / Merck Millipore"
  note = "capillary 30 s/cm"

@D row_cellulose_absorbent_pad_9 :: crispr-cas13-poc-diagnostic [ok]
  item = "Cellulose absorbent pad"
  qty = "1 / cassette"
  source = "Whatman 470 grade"
  note = "sample + absorbent"

@D row_streptavidin_anti_fam_test_line_10 :: crispr-cas13-poc-diagnostic [ok]
  item = "Streptavidin-anti-FAM (test line)"
  qty = "1 µL / cassette"
  source = "Sigma-Aldrich"
  note = "1 mg/mL spray"

@D row_anti_au_np_igg_control_line_11 :: crispr-cas13-poc-diagnostic [ok]
  item = "Anti-Au-NP IgG (control line)"
  qty = "1 µL / cassette"
  source = "Abcam"
  note = "1 mg/mL spray"

@D row_guscn_4m_lysis_buffer_12 :: crispr-cas13-poc-diagnostic [ok]
  item = "GuSCN 4M lysis buffer"
  qty = "50 µL / cassette"
  source = "Sigma-Aldrich"
  note = "+ 0.1 mg/mL prot K"

@D row_trehalose_mannitol_lyo_buffer_13 :: crispr-cas13-poc-diagnostic [ok]
  item = "Trehalose / mannitol lyo buffer"
  qty = "0.5 mg / cassette"
  source = "Sigma-Aldrich"
  note = "5% / 2% w/v"

@D row_silica_gel_desiccant_14 :: crispr-cas13-poc-diagnostic [ok]
  item = "Silica-gel desiccant"
  qty = "1 g / cassette"
  source = "Multisorb"
  note = "40-60% RH absorber"

@D row_hdpe_cassette_housing_15 :: crispr-cas13-poc-diagnostic [ok]
  item = "HDPE cassette housing"
  qty = "1 / cassette"
  source = "Mondi / Amcor / SA injection moulder"
  note = "50 × 80 × 8 mm"

@D row_foil_pouch_pet_al_pe_16 :: crispr-cas13-poc-diagnostic [ok]
  item = "Foil pouch (PET/Al/PE)"
  qty = "1 / cassette"
  source = "Mondi Group"
  note = "MVTR < 0.1 g/m²·day"

@D row_37_42_c_heater_block_reader_17 :: crispr-cas13-poc-diagnostic [ok]
  item = "37-42 °C heater block (reader)"
  qty = "1 / 100 cassettes"
  source = "OEM SA"
  note = "5 W USB / 18650 Li-ion"

@D row_photodiode_reader_optional_18 :: crispr-cas13-poc-diagnostic [ok]
  item = "Photodiode reader (optional)"
  qty = "1 / 1000 cassettes"
  source = "OEM SA"
  note = "LED 520 nm + Si photodiode"

# ── §18 VENDOR ─────────────────────────────────────────


@D row_elitechgroup_twistdx_uk_0 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "ELITechGroup / TwistDx (UK)"
  component = "TwistAmp RPA kit"
  role = "isothermal amplification reagent"

@D row_idt_bioneer_us_kr_1 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "IDT / Bioneer (US/KR)"
  component = "crRNA + RPA primers + reporter"
  role = "nucleic-acid synthesis"

@D row_bbi_solutions_nanocomposix_uk_us_2 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "BBI Solutions / nanoComposix (UK/US)"
  component = "40-nm Au-NP-IgG conjugate"
  role = "LFA visual readout reagent"

@D row_cytiva_merck_millipore_3 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "Cytiva / Merck Millipore"
  component = "Whatman FF120HP nitrocellulose"
  role = "LFA membrane substrate"

@D row_sigma_aldrich_abcam_4 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "Sigma-Aldrich / Abcam"
  component = "streptavidin / anti-Au-NP IgG"
  role = "capture-line reagents"

@D row_neb_in_house_e_coli_bl21_5 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "NEB / in-house *E. coli* BL21"
  component = "LbuCas13a recombinant enzyme"
  role = "Cas13 effector"

@D row_mondi_group_amcor_at_au_6 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "Mondi Group / Amcor (AT/AU)"
  component = "foil pouch + HDPE cassette"
  role = "packaging"

@D row_multisorb_7 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "Multisorb"
  component = "silica-gel desiccant"
  role = "lyo moisture absorber"

@D row_local_sa_injection_moulder_8 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "Local SA injection moulder"
  component = "HDPE cassette"
  role = "local manufacturing"

@D row_local_sa_oem_cape_town_pretoria_9 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "Local SA OEM (Cape Town / Pretoria)"
  component = "37-42 °C reader"
  role = "electronics + heater integration"

@D row_sahpra_pretoria_10 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "SAHPRA (Pretoria)"
  component = "regulatory authority"
  role = "Class C IVD registration"

@D row_canon_private_framework_11 :: crispr-cas13-poc-diagnostic [ok]
  vendor = "canon private framework"
  component = "own_doc_lint / own31 lint"
  role = "docs gate"

# ── §19 ACCEPTANCE / MISS criteria (own#12 pre-declared) ─────────────────────────────────────────


@D b_accept_p1_7_1_verify_7_1_embedde_0 :: crispr-cas13-poc-diagnostic [ok]
  text = "**ACCEPT (P1 §7.1 verify)**: §7.1 embedded Python block prints"

@D b_accept_p2_own_31_lint_tool_own31_1 :: crispr-cas13-poc-diagnostic [ok]
  text = "**ACCEPT (P2 own#31 lint)**: `tool/own31_verify_tautology_ban_lint.hexa"

@D b_accept_p3_own_6_own_15_tool_own_2 :: crispr-cas13-poc-diagnostic [ok]
  text = "**ACCEPT (P3 own#6 + own#15)**: `tool/own_doc_lint.hexa --rule 6/15`"

@D b_accept_p4_raw_70_k_4_4_of_8_raw_3 :: crispr-cas13-poc-diagnostic [ok]
  text = "**ACCEPT (P4 raw 70 K≥4)**: ≥ 4 of 8 raw 70 axes PASS (currently 7"

@D b_accept_p5_atlas_registry_domains_4 :: crispr-cas13-poc-diagnostic [ok]
  text = "**ACCEPT (P5 atlas registry)**: `domains/_index.json` `life` axis"

@D b_accept_p6_alien_grade_10_each_of_5 :: crispr-cas13-poc-diagnostic [ok]
  text = "**ACCEPT (P6 alien-grade 10)**: each of the 6 precursor cross-links"

@D b_miss_if_any_of_6 :: crispr-cas13-poc-diagnostic [ok]
  text = "**MISS** if any of:"

@D b_defer_f_cas13_mvp_1_5_are_pre_de_7 :: crispr-cas13-poc-diagnostic [ok]
  text = "**DEFER**: F-CAS13-MVP-1..5 are pre-declared 90-day-to-1-year MVP empirical"

@D b_f_cas13_mvp_1_deadline_2026_09_3_8 :: crispr-cas13-poc-diagnostic [ok]
  text = "**F-CAS13-MVP-1** (deadline 2026-09-30): lyophilized reagent activity"

@D b_f_cas13_mvp_2_deadline_2026_10_3_9 :: crispr-cas13-poc-diagnostic [ok]
  text = "**F-CAS13-MVP-2** (deadline 2026-10-31): TB-LAM clinical sensitivity"

@D b_f_cas13_mvp_3_deadline_2026_09_3_10 :: crispr-cas13-poc-diagnostic [ok]
  text = "**F-CAS13-MVP-3** (deadline 2026-09-30): HIV viral-load LOD measured"

@D b_f_cas13_mvp_4_deadline_2027_03_3_11 :: crispr-cas13-poc-diagnostic [ok]
  text = "**F-CAS13-MVP-4** (deadline 2027-03-31): SAHPRA Class C IVD validation"

@D b_f_cas13_mvp_5_deadline_2026_12_3_12 :: crispr-cas13-poc-diagnostic [ok]
  text = "**F-CAS13-MVP-5** (deadline 2026-12-31): cost per test > USD 8 at"

@D b_f_cas13_mk2_1_deadline_2027_q1_n_13 :: crispr-cas13-poc-diagnostic [ok]
  text = "**F-CAS13-MK2-1** (deadline 2027-Q1 N≥500 paired clinical cohort): TB"

@D b_f_cas13_mk2_2_deadline_2027_q2_n_14 :: crispr-cas13-poc-diagnostic [ok]
  text = "**F-CAS13-MK2-2** (deadline 2027-Q2 N≥500 paired cohort): HIV viral-"

@D b_f_cas13_mk2_3_deadline_2027_q3_s_15 :: crispr-cas13-poc-diagnostic [ok]
  text = "**F-CAS13-MK2-3** (deadline 2027-Q3 SAHPRA submission): SAHPRA"

@D b_f_cas13_mk2_4_deadline_2028_q1_w_16 :: crispr-cas13-poc-diagnostic [ok]
  text = "**F-CAS13-MK2-4** (deadline 2028-Q1 WHO PQ application): WHO Pre-"

@D b_f_cas13_mk2_5_deadline_2028_q4_l_17 :: crispr-cas13-poc-diagnostic [ok]
  text = "**F-CAS13-MK2-5** (deadline 2028-Q4 Lot 1 50k-cassette commercial run):"

# ── §20 APPENDIX ─────────────────────────────────────────


@D b_empirical_claims_at_this_revisio_0 :: crispr-cas13-poc-diagnostic [ok]
  text = "**Empirical claims at this revision**: 0 lab measurements. All"

@D b_alien_grade_10_physical_limit_re_1 :: crispr-cas13-poc-diagnostic [ok]
  text = "**alien-grade 10 = physical-limit reproduction**: each engineering"

@D b_not_n_6_force_fit_design_constan_2 :: crispr-cas13-poc-diagnostic [ok]
  text = "**NOT n=6 force-fit**: design constants (k_cat 40/s, K_M 50 nM, lyo"

@D b_own_11_no_clay_millennium_claim_3 :: crispr-cas13-poc-diagnostic [ok]
  text = "**own#11 (no Clay Millennium claim)**: PASS — applied diagnostic"

@D b_own_2_n_6_master_identity_hard_p_4 :: crispr-cas13-poc-diagnostic [ok]
  text = "**own#2 (n=6 master identity HARD)**: PASS via §7.1 Block A standalone"

@D b_own_33_ai_native_verify_pattern_5 :: crispr-cas13-poc-diagnostic [ok]
  text = "**own#33 (ai-native-verify-pattern)**: PASS — §7.1 follows the"

@D b_own_17_english_only_pass_committ_6 :: crispr-cas13-poc-diagnostic [ok]
  text = "**own#17 (English-only)**: PASS — committed content in English."

@D b_sister_axis_life_biology_medical_7 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sister axis: `life/biology-medical` (TB + HIV epidemiology + clinical"

@D b_sister_axis_life_synbio_crispr_c_8 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sister axis: `life/synbio` (CRISPR-Cas13 enzyme engineering + LbuCas13a"

@D b_sister_axis_life_genetics_28_nt_9 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sister axis: `life/genetics` (28-nt crRNA spacer + RPA primer design"

@D b_sister_axis_life_hiv_treatment_w_10 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sister axis: `life/hiv-treatment` (WHO 2021 viral-load clinical"

@D b_sister_axis_materials_ceramics_w_11 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sister axis: `materials/ceramics` (Whatman FF120HP nitrocellulose"

@D b_sister_axis_physics_optics_au_np_12 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sister axis: `physics/optics` (Au-NP plasmon resonance + visual"

@D b_sister_domain_life_axis_domains_13 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sister domain (life axis): `domains/life/crispr-gene-editing/`"

@D b_sister_domain_life_axis_domains_14 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sister domain (life axis): `domains/life/medical-device/`"

@D b_sister_domain_life_axis_domains_15 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sister domain (life axis): `domains/life/hiv/` (HIV virology peer"

@D b_sister_domain_pets_axis_domains_16 :: crispr-cas13-poc-diagnostic [ok]
  text = "Sister domain (pets axis): `domains/pets/cat-food/cat-food.md`"

@D b_master_identity_papers_hexa_weav_17 :: crispr-cas13-poc-diagnostic [ok]
  text = "Master identity: `papers/hexa-weave-formal-mechanical-w2-2026-04-28.md`"

@D b_lint_gates_tool_own_doc_lint_hex_18 :: crispr-cas13-poc-diagnostic [ok]
  text = "Lint gates: `tool/own_doc_lint.hexa --rule 6/15`,"

@D b_portfolio_context_proposals_sout_19 :: crispr-cas13-poc-diagnostic [ok]
  text = "Portfolio context: `proposals/south-africa-applied-tech.md` row 2"

# ── §21 IMPACT ─────────────────────────────────────────


# ── mk-history ─────────────────────────────────────────


@D b_2026_05_01t22_00_00z_initial_mk1_0 :: crispr-cas13-poc-diagnostic [ok]
  text = "2026-05-01T22:00:00Z — initial mk1 PHYSICAL-LIMIT registered (alien-"
