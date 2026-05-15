#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# .tape v1.2 — grammar primer (cold-read by any LLM / agent / human)
# ══════════════════════════════════════════════════════════════════════
# Form: each entry is `@<type> <id> := "<subject>" :: <kind> [<grades>]`
#       optionally followed by body lines (2-space indent) — key=value,
#       edges (<- -> => …), or quoted prose.
#
# ENTRY TYPES (17):
#   Runtime (10): @S session  @U user  @A assistant  @T tool-call  @R result
#                 @H hook  @D decision  @K cost  @P provider  @? anomaly
#   Foundation:   @I identity-claim
#   Declarative:  @X external-citation  @F forbidden-pattern  @N note
#                 @C config  @L layout  @V spec-version
#
# EDGES (12, on body lines, 2-space indent):
#   Causal:     <- caused-by   -> triggers   == continues
#               ~> supersedes  !! aborts     |> verified-by
#   Effect:     => produces (followed by quoted natural-language)
#   Structural: <: specializes  :> generalizes  ?> soft-depends
#               !> conflicts-with  @> projects-to (e.g. @> AGENTS.md)
#
# GRADE TAGS (in [...] on entry header):
#   Delivery:   ok · err · denied · cancelled · partial · superseded
#   Governance: required · recommended · optional · draft · active · deprecated
#   Scoped:     allow:<x> · deny:<x>
#   Time/index: T<n> (turn)  N<n> (wall-sec)  d=<YYYY-MM-DD>
#
# PAYLOAD SYNTAX (body lines):
#   key = "value"           single-line string
#   key = [a, b, c]         array literal
#   key <<~EOF              heredoc (multi-line; ends with EOF on own line)
#     multi-line text
#   EOF
#   "see [@x1] §3"          inline citation by entry id
#   `cmd or path`           backtick code-span (inline only)
#
# Full spec: ~/core/tape/spec/tape.md (or github.com/dancinlab/tape)
# ══════════════════════════════════════════════════════════════════════


# ══════════════════════════════════════════════════════════════
# RADIATION-BIOLOGY.tape — architecture-current (editable per v1.2)
# Event history → RADIATION-BIOLOGY.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "radiation-biology" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · radiation biology in-silico knowledge SSOT"
  brief = "Radiation biology — DNA damage + dose-response models · n=6 NOT used as a derivation (honest) · explicitly honest about LNT-vs-hormesis debate"
  parent = "dancinlab/hexa-bio"
  scope = "in-silico radiation-biology knowledge SSOT · NOT clinical/dosimetric/regulatory advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see RADIATION-BIOLOGY.log.tape audit"
  sibling-log = "RADIATION-BIOLOGY.log.tape"

@N scope_disclaimer := "clinical/dosimetric-scope honesty" :: note [required]
  text = "This tape is an evidence-summary knowledge SSOT for an in-silico radiation-biology substrate. Dose thresholds, LD50 estimates, RBE values, repair-pathway lists and epidemiology figures are paraphrased from published radiobiology literature and authoritative bodies (ICRP, BEIR, UNSCEAR) for modeling context only — they are NOT prescribing guidance, NOT dosimetric / radiation-protection prescription, and NOT a clinical or regulatory claim. Real radiation-therapy planning, occupational dose limits, and emergency-response decisions require licensed medical physicists, radiation oncologists and qualified radiation-protection authorities. All claims here are in-silico simulator/metadata consistency only; the wet-lab → preclinical → clinical → regulatory boundary is explicitly out of scope (hexa-bio AGENTS.tape g8 / f2). This tape is also explicitly honest about the active scientific debate over low-dose dose-response (LNT vs threshold vs hormesis) — see §4 [@dx_lnt_debate] and §5 real-limit [@lim_low_dose_epistemic]."

# ── §1 What radiation biology is ──────────────────────────────────────

@D dx_definition := "what radiation biology is" :: domain [ok]
  field = "Radiation biology = the study of how ionizing (and to a much lesser extent non-ionizing) radiation interacts with living matter — from initial energy deposition through DNA damage, repair, cellular response, tissue effects, organism-level syndromes, and population-level stochastic risk."
  scope-here = "This tape covers IONIZING radiation (photons, charged particles, neutrons, heavy ions). UV photobiology and RF/non-ionizing bioeffects are mechanistically distinct → out of scope."
  two-axes = "(1) DETERMINISTIC effects: above a threshold dose, severity rises with dose (acute radiation syndrome, cataract, skin reactions, fibrosis). (2) STOCHASTIC effects: probability (not severity) rises with dose (cancer induction, hereditary effects) — the focus of low-dose epidemiology and protection standards."
  honesty = "Radiation biology is heterogeneous (cell type, dose, dose-rate, radiation quality, oxygenation, repair status all matter). Uniform 'one number' claims about radiation effects are biologically wrong; ranges and qualifiers are the rule."
  |> "[@x_hall_giaccia_textbook]"

# ── §2 Physics of radiation–matter interaction ────────────────────────

@D phys_photons := "photons — X-ray and gamma" :: mechanism [ok]
  classes = "X-rays (electronic origin, e.g. clinical linac, diagnostic tube), gamma rays (nuclear de-excitation, e.g. Co-60, Cs-137); physically identical above the X/γ energy boundary — distinguished by origin, not by what they do to tissue."
  interaction = "Indirectly ionizing: photoelectric, Compton scattering, pair production transfer photon energy to secondary electrons; the secondary electrons then do most of the actual ionization on biological molecules."
  let = "LOW LET (≈ 0.2–2 keV/μm in tissue depending on energy) — sparse ionization tracks, predominantly indirect (water-radiolysis-mediated) damage."
  |> "[@x_attix_textbook] · [@x_hall_giaccia_textbook]"

@D phys_particles := "charged particles & neutrons" :: mechanism [ok]
  electrons-positrons = "Directly ionizing; clinical electron beams treat superficial targets; positrons are produced by pair production and annihilate to 511 keV photons (PET physics, not therapy here)."
  protons = "Directly ionizing; Bragg-peak depth-dose profile concentrates dose at end of range, sparing distal normal tissue — the rationale for proton therapy."
  alpha = "He nucleus; HIGH LET (~80–250 keV/μm); short range in tissue (tens of μm), but highly damaging per unit track length — relevant for internal emitters (e.g. radium, radon progeny, targeted α-therapy)."
  neutrons = "Uncharged; interact via nuclear reactions producing recoil protons and heavy fragments → effectively high-LET; relevant for reactor/criticality exposures, neutron capture therapy, and atomic-bomb survivor dosimetry."
  heavy-ions = "Carbon and heavier ions: HIGH LET in Bragg peak; clinical carbon-ion therapy in several centres for radioresistant tumors."
  |> "[@x_attix_textbook] · [@x_icrp_103]"

@D phys_let_rbe := "LET and RBE" :: mechanism [ok]
  let-definition = "Linear Energy Transfer (LET): energy deposited per unit path length (keV/μm). Low-LET (photons, fast electrons) deposits sparsely; high-LET (alphas, neutrons, slow heavy ions) deposits densely along the track."
  rbe-definition = "Relative Biological Effectiveness (RBE) = ratio of reference low-LET dose (typically 250 kV X-rays or Co-60 γ) to test-radiation dose producing the same biological endpoint. RBE depends on radiation quality, dose, dose-rate, endpoint and tissue — explicitly NOT a single fixed number."
  rbe-protons = "Clinical proton therapy is operationally treated with RBE ≈ 1.1 as a planning convention, though tissue/end-of-range RBE is known to vary (literature range), and active research refines this."
  rbe-alpha = "Alpha-particle RBE for biological endpoints is typically several-fold to ~20× depending on endpoint, dose-rate, and biological system (literature ranges; ICRP uses radiation-weighting factor w_R = 20 for alphas in protection)."
  honesty = "RBE is endpoint- and dose-dependent and reported as ranges, not a lattice value."
  |> "[@x_icrp_103] · [@x_hall_giaccia_textbook]"

@D phys_radiolysis := "water radiolysis & indirect damage" :: mechanism [ok]
  primary = "Most cellular damage from low-LET radiation is INDIRECT, mediated by water-radiolysis radicals: ·OH (hydroxyl), H· (hydrogen), e⁻_aq (hydrated electron), with H2O2 and H2 as molecular products."
  hydroxyl-dominant = "·OH is the dominant DNA-damaging species in indirect action; diffusion-limited reactions with deoxyribose and bases produce strand breaks and base damage."
  direct-vs-indirect = "Direct action (ionization in DNA itself) dominates for high-LET tracks; indirect (radical-mediated) action dominates for low-LET sparse tracks. Oxygen fixes radical damage (rationale for OER, [@bio_oer])."
  |> "[@x_hall_giaccia_textbook]"

# ── §3 DNA damage, repair, and cellular response ─────────────────────

@D bio_dna_damage := "spectrum of radiation-induced DNA lesions" :: mechanism [ok]
  dsb = "Double-strand break (DSB) — the primary lethal lesion. Misrepaired DSBs drive cell death, chromosomal aberrations, and oncogenic translocations."
  ssb = "Single-strand break (SSB) — very abundant per Gy but generally well repaired (BER); not primarily lethal unless clustered."
  base-damage = "Base damage (e.g. 8-oxoG from ·OH on guanine), abasic sites — substrate for BER."
  clustered-damage = "Clustered / locally multiply damaged sites (multiple lesions within ~1–2 helical turns) — disproportionately mutagenic/lethal, characteristic of high-LET tracks."
  per-gy-rough = "Order-of-magnitude per cell per Gy of low-LET radiation: thousands of SSBs, tens of DSBs, ~10⁵ base damages — qualitative orders cited in textbook radiobiology, not asserted as exact constants."
  |> "[@x_hall_giaccia_textbook] · [@x_friedberg_textbook]"

@D bio_repair_pathways := "DNA repair pathways relevant to ionizing radiation" :: mechanism [ok]
  nhej = "Non-Homologous End Joining: Ku70/Ku80 ring binds DSB ends → recruits DNA-PKcs (catalytic) → processing (Artemis, polymerases) → Ligase IV / XRCC4 / XLF seal. Operates in ALL cell-cycle phases; predominant DSB-repair pathway in G0/G1 mammalian cells; error-prone (small indels at junctions)."
  hr = "Homologous Recombination: uses an undamaged homologous template (sister chromatid). Key factors: MRN complex (MRE11/RAD50/NBN), CtIP, BRCA1, BRCA2, RAD51 filament, RAD52, RAD54. Restricted to S/G2 phase (sister chromatid required); essentially error-free. BRCA1/2 deficiency abolishes HR — basis for PARP-inhibitor synthetic lethality."
  mmej = "Microhomology-Mediated End Joining (alt-NHEJ): PARP1 / Polθ-driven backup; uses short microhomologies; highly error-prone (deletions, translocations)."
  ber = "Base Excision Repair: repairs base damage and SSBs — glycosylases (OGG1 etc.) → APE1 → polβ → ligase. Major pathway for oxidative/radiolysis base damage."
  ner = "Nucleotide Excision Repair: bulky helix-distorting lesions (mainly UV photoproducts, also some oxidative); minor for ionizing damage but mechanistically essential biology."
  mmr = "Mismatch Repair: post-replicative mispairs; not a primary IR-damage pathway, but loss (MSH2/MLH1) modulates radiosensitivity and mutagenesis."
  cell-cycle-coupling = "NHEJ is cell-cycle independent; HR requires a sister chromatid → S/G2 only. This pathway choice depends on cell-cycle phase — a real biological constraint, not a lattice number."
  |> "[@x_friedberg_textbook]"

@D bio_lq_model := "linear-quadratic (LQ) cell-survival model" :: mechanism [ok]
  equation = "Surviving fraction SF(D) = exp(−αD − βD²) for acute single-dose irradiation; for fractionated dose with sufficient inter-fraction repair: SF = exp(−n(αd + βd²)) for n fractions of dose d."
  alpha-beta = "α/β ratio — the dose at which the linear (α, single-track) and quadratic (β, two-track interaction) components contribute equally. High α/β (~10 Gy) characterizes early-responding tissues and most tumors; low α/β (~3 Gy) characterizes late-responding normal tissues — basis of fractionation rationale (literature ranges)."
  bed = "Biologically Effective Dose BED = nd(1 + d/(α/β)); a tool for comparing fractionation schedules."
  honesty = "α/β ratios are TISSUE/TUMOR-SPECIFIC literature estimates with uncertainty bands — clinical convention values, not derived constants. Caution at very large dose-per-fraction (SBRT/SRS) where the simple LQ model is known to be approximate."
  |> "[@x_withers_4rs_era] · [@x_hall_giaccia_textbook]"

@D bio_elkind_sld := "Elkind sublethal damage repair (split-dose)" :: mechanism [ok]
  observation = "When a single radiation dose is split into two fractions separated by an interval, survival rises with separation up to several hours — Elkind's classic split-dose experiments — operationalized as sublethal damage repair between fractions (the 'R' for Repair in the 4 R's)."
  consequence = "Inter-fraction intervals long enough for sublethal damage repair preferentially spare slowly-repairing late-responding normal tissue (low α/β), creating the fractionation therapeutic window."
  honesty = "The 'Elkind recovery' kinetics are reported as time-constants on the order of hours and vary by tissue — cited as the classic phenomenon (Elkind & Sutton era), exact volumes paraphrased."
  |> "[@x_elkind_sld_era]"

@D bio_oer := "oxygen enhancement ratio (OER)" :: mechanism [ok]
  definition = "OER = ratio of dose under hypoxia to dose under normoxia producing the same biological effect. Oxygen 'fixes' radical-induced DNA damage; hypoxic cells are more radioresistant."
  values = "For low-LET radiation, OER for cell killing is approximately 2.5–3 (literature range). OER decreases toward ~1 at high LET, where dense direct ionization makes oxygen fixation less rate-limiting — a clinical advantage cited for high-LET modalities against hypoxic tumors."
  |> "[@x_hall_giaccia_textbook]"

@D bio_4rs_5rs := "the 4 R's (+5th R) of radiobiology" :: mechanism [ok]
  framework = "Withers-era framework for fractionated radiotherapy rationale."
  repair = "Repair: sublethal-damage repair between fractions ([@bio_elkind_sld]) spares late-responding (low α/β) normal tissue more than tumor."
  reassortment = "Reassortment: cells redistribute through the cell cycle between fractions; cells re-enter radiosensitive phases (G2/M), increasing tumor kill across the course."
  repopulation = "Repopulation: surviving tumor (and normal) cells proliferate between fractions; accelerated repopulation in some tumors after ~3–4 weeks is a real treatment-time pressure (the rationale for not unduly prolonging therapy)."
  reoxygenation = "Reoxygenation: hypoxic tumor regions become better oxygenated between fractions as oxygenated cells die — increasing average tumor radiosensitivity over the course (relates to [@bio_oer])."
  fifth-r = "Radiosensitivity: intrinsic tissue/tumor radiosensitivity is the fifth R (added later by Steel and others). Five is the OBSERVED number of items in this teaching framework — not a lattice value; the framework is a pedagogical organization of mechanisms, not a derivation."
  honesty = "The 4 R's (and the later 5th R) are cited as the Withers-era teaching framework — author/era confident, exact original article paraphrased."
  |> "[@x_withers_4rs_era] · [@x_hall_giaccia_textbook]"

# ── §4 Whole-organism, population, and clinical radiation biology ────

@D ars_syndromes := "Acute Radiation Syndrome (ARS)" :: domain [ok]
  hematopoietic = "Hematopoietic (bone-marrow) syndrome: approximately 2–6 Gy whole-body acute external low-LET dose; lymphocyte and neutrophil depletion, infection/bleeding risk; survivable with intensive supportive care, growth factors and potentially hematopoietic stem-cell transplant for the upper range."
  gi = "Gastrointestinal syndrome: approximately 6–12 Gy; loss of intestinal crypt cells, denudation of epithelium, fluid/electrolyte collapse and sepsis; high mortality with current best supportive care at the upper end."
  cns-cv = "Neurovascular / CNS-cardiovascular syndrome: above approximately 12–15 Gy; rapid, refractory, near-uniformly fatal."
  ld50 = "LD50/60 for whole-body acute low-LET exposure (with minimal medical support) is widely cited around 3.5–4.5 Gy; with modern intensive supportive care this is shifted upward — exact figures are scenario-dependent ranges, not constants."
  honesty = "ARS dose ranges and LD50 figures are literature ranges (Hall & Giaccia textbook, ICRP) — they vary with dose-rate, dose distribution, individual susceptibility, and medical support. Quoted here as ranges, not asserted as exact thresholds."
  |> "[@x_hall_giaccia_textbook] · [@x_icrp_103]"

@D epi_stochastic := "stochastic risk & protection framework" :: domain [ok]
  framework = "Stochastic effects (cancer induction, hereditary effects) are modeled as probability rising with dose — typically with no operational threshold for protection purposes."
  beir-vii = "BEIR VII (2006) US National Academies report: comprehensive synthesis of low-dose ionizing-radiation health risks, supporting (with caveats) a linear-no-threshold (LNT) extrapolation as the central estimate for solid-cancer risk."
  icrp = "ICRP Publication 103 (2007): system of radiological protection, tissue-weighting factors (w_T) for effective dose, radiation-weighting factors (w_R) for equivalent dose, dose limits for occupational and public exposure; the recommendations are explicitly grounded in stated assumptions including LNT as a protection-purposes model."
  unscear = "UNSCEAR (United Nations Scientific Committee on the Effects of Atomic Radiation): periodic reports including the Chernobyl (UNSCEAR 2008 Annex D) and Fukushima (UNSCEAR 2013/2020 reports) population-exposure assessments — institutional consensus syntheses."
  honesty = "Authoritative bodies cited by institution + report era; numerical w_T / w_R values and dose limits are best read from the live ICRP/BEIR/UNSCEAR documents, not re-derived here."
  |> "[@x_beir_vii_2006] · [@x_icrp_103] · [@x_unscear_chernobyl] · [@x_unscear_fukushima]"

@D dx_lnt_debate := "LNT vs threshold vs hormesis — honest framing of an active debate" :: domain [ok required]
  lnt-position = "Linear No-Threshold (LNT): low-dose stochastic risk extrapolates linearly from epidemiologic estimates at higher doses, with no protective threshold. Currently the regulatory default of ICRP, BEIR VII (US NAS), NCRP, IAEA and most national protection bodies."
  threshold-position = "Threshold model: a finite dose below which excess stochastic risk is zero (or effectively zero); a minority position supported by some authors arguing low-dose biology (e.g. adaptive responses, repair fidelity) is qualitatively different from high-dose biology."
  hormesis-position = "Radiation hormesis: a stimulatory/beneficial response at very low doses (often within natural background plus a small margin); claimed mechanisms include adaptive response and immune modulation. A minority position; contested by mainstream protection bodies as not adequately supported for protection purposes."
  epidemiology-floor = "Direct epidemiologic detection of excess risk below approximately 100 mSv acute (or low-dose-rate equivalents) is power-limited: confidence intervals on excess relative risk become so wide that LNT, threshold, and modest hormesis can all be statistically consistent with the same data. This is a HARD epistemic floor, not a moral or political position — see [@lim_low_dose_epistemic]."
  honest-stance = "This tape's honest position: LNT is the operational REGULATORY default (and remains the position of ICRP/BEIR/NCRP at the time of authoring), AND the low-dose dose-response is the subject of genuine ongoing scientific debate with non-fringe authors on the threshold/hormesis side. Both statements are true simultaneously. This tape does NOT take a strong side; it reports the debate honestly (per LATTICE_POLICY g3 honesty-obligation-external and hexa-bio AGENTS.tape g8 in-silico-only-claim-scope)."
  |> "[@x_beir_vii_2006] · [@x_icrp_103] · [@x_unscear_chernobyl]"

@D epi_lss := "Hiroshima-Nagasaki Life Span Study (LSS / RERF)" :: domain [ok]
  cohort = "The Life Span Study (LSS) of atomic-bomb survivors of Hiroshima and Nagasaki, maintained by the Radiation Effects Research Foundation (RERF), is the principal landmark epidemiologic cohort underpinning radiation-cancer risk estimates."
  preston-era = "Preston et al, Radiation Research (e.g. 2003 solid cancer / 2007 mortality / continuing update era): cohort-wide and site-specific cancer-incidence and mortality dose-response analyses that anchor much of BEIR VII and ICRP risk modeling."
  honesty = "LSS findings are the bedrock low-LET human epidemiology data — the dose-response is consistent with linear (or linear-quadratic) over the resolvable dose range, but the very-low-dose extrapolation is exactly where the LNT debate ([@dx_lnt_debate]) lives because epidemiologic power runs out."
  |> "[@x_preston_lss]"

@D epi_chernobyl := "Chernobyl outcomes" :: domain [ok]
  thyroid = "Excess thyroid cancer in those exposed as children/adolescents (predominantly via I-131 contamination of milk and the food chain in affected areas of Belarus, Ukraine, Russian Federation) is the most robust radiation-attributable cancer outcome — documented in UNSCEAR and WHO reports."
  acute = "Acute radiation syndrome and acute deaths occurred predominantly in emergency workers (firefighters, plant operators) immediately after the 1986 accident."
  societal = "Beyond direct radiation effects, large adverse mental-health and socioeconomic consequences arose in affected populations — these are well-documented and are a major component of total health impact, distinct from but not less real than direct radiation effects."
  honesty = "Quantitative cancer-excess estimates in the wider exposed population vary substantially between modeling assumptions (LNT projection, dose distribution, follow-up duration); reported here as the institutional consensus picture, not as exact numbers."
  |> "[@x_unscear_chernobyl]"

@D epi_fukushima := "Fukushima Daiichi outcomes" :: domain [ok]
  exposures = "The 2011 Fukushima Daiichi accident produced markedly lower public doses than Chernobyl, due in part to faster evacuation and protective actions; UNSCEAR's Fukushima assessments concluded that no clearly attributable radiation-induced increases in cancer or hereditary effects were expected at the population level."
  thyroid-screening = "An enhanced thyroid-ultrasound screening programme in Fukushima Prefecture detected thyroid findings whose interpretation as 'radiation-attributable' is contested (screening/lead-time effects vs. radiation effects) — a genuine epidemiologic debate, not a fabricated controversy."
  societal = "As at Chernobyl, evacuation-related and stress-related health and societal harms have been substantial — explicitly distinguished from direct radiation effects."
  honesty = "Quantitative attribution at Fukushima is reported as ranges/qualitative consensus across UNSCEAR/WHO reports; specific incidence numbers paraphrased."
  |> "[@x_unscear_fukushima]"

@D epi_smith_bindman_ct := "medical-imaging radiation dose growth (CT era)" :: domain [ok]
  finding = "Smith-Bindman et al, Arch Intern Med 2009, documented substantial heterogeneity in CT doses across institutions and indications, and estimated modeled lifetime cancer risks attributable to specific CT examinations — establishing that medical-imaging radiation is a non-trivial population dose source amenable to justified-and-optimized use."
  consequence = "Medical-imaging radiation is now a leading source of population radiation exposure in many developed-country settings (alongside natural background); the 'as low as reasonably achievable' (ALARA) principle and justification are explicit protection-program responses."
  honesty = "Smith-Bindman 2009 estimates are MODELED risks (using LNT projection from epidemiology) — uncertainty bands are wide, and the underlying LNT assumption is the same one debated in [@dx_lnt_debate]. Cited as a landmark paper raising the issue, not as a definitive risk count."
  |> "[@x_smith_bindman_2009]"

# ── §5 Clinical radiation oncology ───────────────────────────────────

@D clin_ebrt_fractionation := "external-beam radiotherapy: fractionation rationale" :: therapy [ok recommended]
  principle = "Conventional fractionated external-beam radiotherapy (EBRT) splits the total prescription dose into many small daily fractions (commonly ~1.8–2.0 Gy/fraction, literature range), exploiting the 4 R's ([@bio_4rs_5rs]) to widen the therapeutic window between tumor and late-responding normal tissue."
  modalities = "3D-conformal RT, intensity-modulated RT (IMRT), volumetric-modulated arc therapy (VMAT), image-guided RT (IGRT) — successive engineering advances in conforming dose to target while sparing organs at risk."
  scope = "Curative-intent (definitive ± chemoradiation), neoadjuvant / adjuvant, palliative."
  honesty = "Specific fractionation schedules are highly disease- and site-specific; ranges quoted are conventional textbook values, not lattice constants. Real prescriptions live in disease-specific clinical guidelines."
  |> "[@x_hall_giaccia_textbook]"

@D clin_sbrt_srs := "hypofractionation: SBRT and SRS" :: therapy [ok recommended]
  sbrt = "Stereotactic Body Radiation Therapy (SBRT): ablative-intent delivery of a few large dose-per-fraction fractions (commonly ~8–20 Gy/fraction over 1–5 fractions, literature range) under high geometric precision; used in early-stage lung NSCLC, oligometastatic disease, liver and spine lesions."
  srs = "Stereotactic Radiosurgery (SRS): single-fraction (or few-fraction) high-precision cranial irradiation for brain metastases, AVMs, vestibular schwannomas, etc.; technical lineage from Leksell's gamma knife."
  rationale = "At ablative dose-per-fraction, mechanisms beyond classic mitotic cell death (vascular/endothelial damage, immunogenic effects) likely contribute; the simple LQ model is acknowledged to be approximate in this regime — an active area of radiobiology research."
  honesty = "Hypofractionation schedules are disease- and site-specific; ranges are conventional, not derived. SBRT/SRS radiobiology is genuinely incompletely settled at the modeling level."
  |> "[@x_hall_giaccia_textbook]"

@D clin_brachy := "brachytherapy" :: therapy [ok recommended]
  principle = "Placement of sealed radioactive sources within or adjacent to the target (interstitial, intracavitary, intraluminal); steep dose fall-off concentrates dose at the target and spares distant normal tissue."
  examples = "Prostate brachytherapy (I-125, Pd-103 permanent seeds; HDR Ir-192), gynecological brachytherapy (cervical cancer), skin/breast applications."
  |> "[@x_hall_giaccia_textbook]"

@D clin_protons_ions := "proton and heavy-ion therapy" :: therapy [ok recommended]
  protons = "Bragg-peak depth-dose distal sparing (see [@phys_particles]); clinical indications include pediatric tumors (reduced integral dose to developing tissue), select skull-base and ocular tumors, and ongoing trials in many adult sites."
  carbon-ion = "Carbon-ion therapy: high-LET Bragg peak (higher RBE in the target, less oxygen dependence) for selected radioresistant tumors; operating centres exist in Japan, Germany, Italy, China and elsewhere; comparative-effectiveness evidence still maturing."
  honesty = "Proton-vs-photon and carbon-ion comparative effectiveness for many indications remains an active clinical-evidence question — reported neutrally here."
  |> "[@x_attix_textbook] · [@x_hall_giaccia_textbook]"

@D clin_radiosensitizers := "radiosensitizers" :: therapy [ok recommended]
  oxygen = "Tumor hypoxia reduces radiosensitivity ([@bio_oer]); historic interest in hyperbaric oxygen and hypoxic-cell sensitizers (nimorazole, etc.)."
  cisplatin-combinations = "Concurrent platinum-based chemoradiation is standard in multiple disease sites (head & neck SCC, locally advanced NSCLC, cervical cancer, etc.) — cisplatin acts as a radiosensitizer in addition to its cytotoxic effect, exploiting DNA-damage interaction."
  newer = "DDR (DNA damage response) inhibitors — PARP, ATR, ATM, DNA-PK, WEE1 inhibitors — are an active class of investigational radiosensitizers exploiting tumor-specific repair defects."
  honesty = "Concurrent-chemoradiation regimens are highly disease-specific; cited mechanistically here, not as a prescribing recommendation."
  |> "[@x_hall_giaccia_textbook]"

@D clin_radioprotectors := "radioprotectors" :: therapy [ok recommended]
  amifostine = "Amifostine (WR-2721) is a thiol-based radioprotector approved (in specific indications and time windows) to reduce xerostomia in head-and-neck radiotherapy; its clinical role is narrower than initial hopes — toxicity (hypotension, nausea) and uncertain protective effect on tumor have limited adoption."
  others = "Investigational radioprotectors / mitigators (post-exposure agents) are an active research area motivated by both clinical radiotherapy and radiological/nuclear emergency-response preparedness; mainstream-approved options remain limited."
  honesty = "Amifostine is cited as the canonical approved-drug example with explicit acknowledgement of its limited adoption; not asserted as a routinely effective therapy across the board."
  |> "[@x_amifostine_era] · [@x_hall_giaccia_textbook]"

# ── §6 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_low_dose_epistemic := "low-dose dose-response epistemic floor" :: real-limit [ok required]
  wall = "EPISTEMIC / STATISTICAL HARD WALL"
  statement = "Direct epidemiologic resolution of excess stochastic risk below approximately 100 mSv acute (or low-dose-rate equivalents) is fundamentally power-limited. Confidence intervals on excess relative risk in this regime are so wide that the LNT, threshold, and modest-hormesis hypotheses can all be statistically compatible with the same cohorts. This is the underlying reason the LNT-vs-threshold-vs-hormesis debate ([@dx_lnt_debate]) is genuine and unresolved — not a moral or political stance."
  consequence = "Regulatory bodies (ICRP, BEIR, NCRP) adopt LNT as a PRECAUTIONARY operational model, explicitly distinct from a claim that LNT has been epidemiologically proven down to zero dose. Honest discussion of the low-dose regime must report both the regulatory default AND the genuine epistemic uncertainty."
  |> "[@x_beir_vii_2006] · [@x_icrp_103] · [@x_preston_lss]"

@D lim_deterministic_thresholds := "deterministic-effect thresholds" :: real-limit [ok required]
  wall = "BIOLOGICAL HARD WALL (above threshold)"
  statement = "Deterministic (tissue-reaction) effects exhibit real practical thresholds: severity below the threshold is essentially absent; above it, severity rises with dose. Examples include opacification/cataract of the ocular lens (thresholds being revised downward in recent ICRP guidance based on epidemiology of low-dose-rate exposures), erythema and skin reactions, hematopoietic suppression, organ-specific late tissue reactions in radiotherapy (radiation pneumonitis, hepatic veno-occlusive disease, etc.)."
  consequence = "Deterministic effects are the basis for organ-at-risk constraints in radiotherapy planning and for dose limits aimed at preventing tissue injury (separate from the stochastic dose limits). Thresholds are tissue-specific literature ranges, periodically updated by ICRP — not lattice values."
  |> "[@x_icrp_103] · [@x_hall_giaccia_textbook]"

@D lim_fetal_radiation := "pregnancy / fetal-radiation HARD WALL" :: real-limit [ok required]
  wall = "BIOLOGICAL HARD WALL (developmental)"
  statement = "The developing embryo/fetus has window-specific radiation sensitivities that are NOT present in the adult: (1) pre-implantation: 'all-or-none' lethality; (2) organogenesis (~2–8 weeks post-conception, with continuing risk through ~15 weeks): malformations and growth retardation are the dominant deterministic concerns above threshold; (3) ~8–15 weeks: peak sensitivity for radiation-induced severe intellectual disability (the LSS-derived classic finding); (4) all stages: stochastic childhood-cancer risk extending across gestation."
  consequence = "Pregnancy dosimetry is treated separately and stringently in clinical radiology, radiation oncology and occupational protection; deliberate elective irradiation in pregnancy is avoided absent overriding clinical need. Specific dose thresholds for malformation/IQ effects are quoted in ICRP/BEIR literature as ranges, not single derived numbers."
  |> "[@x_icrp_103] · [@x_preston_lss] · [@x_hall_giaccia_textbook]"

@D lim_cumulative_occupational := "cumulative-dose tracking & occupational limits" :: real-limit [ok required]
  wall = "REGULATORY / OPERATIONAL LIMIT (LNT-based, precautionary)"
  statement = "Occupational and public dose limits (ICRP Publication 103 framework: typical occupational effective-dose limits on the order of 20 mSv/year averaged over a 5-year period, with annual caps; public limits on the order of 1 mSv/year above natural background — read from live ICRP documents) are PRECAUTIONARY operational limits derived under the LNT model. They are administrative/regulatory limits, not biological thresholds."
  consequence = "Cumulative-dose tracking (dosimeters, dose registries) is essential to occupational protection programmes; ALARA (as low as reasonably achievable) is the operating principle below the limit, not just at it. Because these limits ride on LNT, they are vulnerable to revision if low-dose biology is materially clarified ([@dx_lnt_debate] / [@lim_low_dose_epistemic]) — but in the absence of clarification, the precautionary stance is the established policy default."
  |> "[@x_icrp_103]"

@D lim_medical_imaging_growth := "medical-imaging dose growth (CT era)" :: real-limit [ok required]
  wall = "OPERATIONAL / POPULATION LIMIT"
  statement = "Medical-imaging radiation exposure has grown markedly over the CT era and is now a leading anthropogenic contributor to population radiation dose in many developed-country settings (Smith-Bindman et al 2009 and successor literature). Both inter-institutional dose heterogeneity and per-examination dose modeling support real opportunities for ALARA-aligned dose reduction."
  consequence = "This is a real, addressable population exposure that justifies imaging protocols, automatic exposure control, dose tracking, and clinical-decision-support to reduce unnecessary exposure — independent of where the LNT debate eventually settles, since dose reduction without loss of diagnostic benefit is favored under any plausible low-dose model."
  |> "[@x_smith_bindman_2009]"

@D lim_repair_capacity := "DNA-repair capacity ceiling" :: real-limit [ok required]
  wall = "BIOLOGICAL CEILING (per-cell)"
  statement = "DNA-repair pathways ([@bio_repair_pathways]) operate with finite capacity, fidelity and substrate specificity. Sufficiently high dose-rate, dose-per-fraction, or clustered damage (high-LET, [@bio_dna_damage]) saturates or overwhelms repair — converting sublethal damage into lethal damage. Repair-deficient backgrounds (BRCA1/2, ATM, Fanconi anemia, ligase IV deficiency etc.) shift the dose-response leftward."
  consequence = "Repair capacity bounds (a) the protective effect of fractionation and dose-rate reduction; (b) the differential sparing of low-LET vs high-LET radiation; (c) the radiosensitivity of repair-deficient tumors (basis for synthetic-lethality strategies)."
  |> "[@x_friedberg_textbook] · [@x_hall_giaccia_textbook]"

# ── §7 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-radiation-biology" :: governance [required deny:write]
  pattern = "Deriving radiation-biology dose thresholds / RBE / LD50 / repair-pathway counts / 4 R's count / α/β ratios FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's '6 DSB-repair pathways', '6 radiation interaction mechanisms', '6 Gy LD50' as lattice-derived 'primitives' / 'constants'."
  why = "This is exactly the violation the pre-rewrite RADIATION-BIOLOGY.tape committed (lattice-tautology stub, mass-split 153b5a2 — see RADIATION-BIOLOGY.log.tape audit). hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3 forbid it; f1 forbids lattice-fit on external entities, f2 forbids in-silico→clinical claims."
  remedy = "Cite real radiation physics / radiobiology / radiation-protection literature (this tape's @X entries — Hall & Giaccia textbook, Attix physics textbook, ICRP 103, BEIR VII, UNSCEAR reports, Preston/LSS, Smith-Bindman, Withers 4 R's era, Elkind era). The lattice may only be a coincidental OBSERVATION, never a derivation source for any radiation-biology claim."

@N n6_honest_stance := "radiation biology has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: radiation biology exposes NO natural n=6 invariant. Repair pathway counts depend on how you taxonomize (NHEJ, HR, MMEJ, BER, NER, MMR... and arguably TLS, direct reversal, FA pathway — six is one taxonomy among several, not a derivation). Radiation-interaction mechanisms vary by particle/energy and are listed differently across textbooks (photoelectric/Compton/pair-production for photons; nuclear/elastic/inelastic for neutrons; etc.) — 'six' is a teaching choice, not a constant. LD50/60 is approximately 3.5–4.5 Gy (with-modern-support shifted upward), NOT exactly 6 Gy — the previously-stubbed '6 Gy LD50' was factually wrong as well as lattice-fit. The 4 R's of radiobiology are FOUR (or five with radiosensitivity), explicitly NOT six. Dose-response thresholds (deterministic), w_T / w_R values (protection), α/β ratios (LQ) are all literature ranges / clinical conventions / revisable institutional choices — none are n=6-derived. Per LATTICE_POLICY g1/g2 + lattice-as-tool: the lattice is DECLINED here as a derivation tool — values may coincide by accident (observation OK) but never derive a claim. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ── §8 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 fractionation spares late-responding normal tissue" :: prediction [ok]
  claim = "Splitting a total radiotherapy dose into many small fractions (with sufficient inter-fraction interval for repair) yields lower late-normal-tissue toxicity for an equivalent tumor effect than a single equivalent acute dose — operationally observable as the lower late-effect probability of conventional fractionation vs equivalent unfractionated delivery, predicted by the LQ model with low α/β late tissues."
  falsifier = "If a properly powered trial showed equivalent or higher late-normal-tissue toxicity from highly fractionated delivery vs single-fraction equivalent at matched tumor control, the LQ / α/β fractionation rationale ([@bio_lq_model], [@bio_4rs_5rs]) is wrong."
  source = "[@x_hall_giaccia_textbook] · [@x_withers_4rs_era]"

@D tp_2 := "TP-2 BRCA-deficient tumor radiosensitization" :: prediction [ok]
  claim = "Tumors with biallelic BRCA1/BRCA2 loss-of-function (or HR-deficient phenotype) exhibit enhanced sensitivity to ionizing radiation and to PARP inhibition (synthetic lethality) relative to HR-proficient counterparts, because HR-mediated DSB repair is the high-fidelity backstop being removed."
  falsifier = "If HR-deficient tumors showed equivalent or reduced radiosensitivity / PARP-inhibitor sensitivity vs HR-proficient counterparts in well-controlled experiments, the HR/PARP synthetic-lethality model and [@bio_repair_pathways] / [@lim_repair_capacity] are wrong."
  source = "[@x_friedberg_textbook] · [@x_hall_giaccia_textbook]"

@D tp_3 := "TP-3 low-dose epidemiology power floor" :: prediction [ok]
  claim = "Properly powered prospective epidemiology of population exposures below approximately 100 mSv (acute equivalent) will NOT resolve LNT vs modest-threshold vs modest-hormesis at conventional statistical significance — confidence intervals will remain wide enough that all three models are statistically compatible. This is a prediction about the data-gathering, not a prediction about ground truth."
  falsifier = "If a sufficiently large, well-controlled, low-confounder cohort study at <100 mSv yields a tight excess-relative-risk estimate that excludes either the LNT slope OR zero excess at conventional confidence levels, [@lim_low_dose_epistemic] is wrong."
  source = "[@x_beir_vii_2006] · [@x_preston_lss]"

# ── §9 External citations (real, landmark literature) ────────────────

@X x_hall_giaccia_textbook := "Hall & Giaccia, Radiobiology for the Radiologist" :: literature [active]
  ref = "Hall EJ, Giaccia AJ. Radiobiology for the Radiologist. Lippincott Williams & Wilkins / Wolters Kluwer (multiple editions, 6th–8th editions in print across the textbook's era). The standard graduate-level radiobiology textbook; cited for foundational radiobiology (LET/RBE, water radiolysis, repair pathways, LQ model, OER, 4 R's, ARS, clinical radiation oncology overview). Author/era cited — exact edition/page not asserted."

@X x_attix_textbook := "Attix, Introduction to Radiological Physics and Radiation Dosimetry" :: literature [active]
  ref = "Attix FH. Introduction to Radiological Physics and Radiation Dosimetry. Wiley-VCH / Wiley (textbook era; foundational reference reissued in subsequent printings). Standard graduate-level radiation-physics text; cited for photon and charged-particle interaction physics. Author/era cited — exact edition not asserted."

@X x_friedberg_textbook := "Friedberg et al, DNA Repair and Mutagenesis" :: literature [active]
  ref = "Friedberg EC, Walker GC, Siede W, Wood RD, Schultz RA, Ellenberger T. DNA Repair and Mutagenesis. ASM Press (textbook era, 2nd edition era, with successor editions). Standard reference for DNA repair pathway taxonomy and biochemistry; cited for repair-pathway organization (NHEJ/HR/MMEJ/BER/NER/MMR) and repair capacity. Author/era cited — exact edition not asserted."

@X x_icrp_103 := "ICRP Publication 103 (2007)" :: literature [active]
  ref = "International Commission on Radiological Protection. The 2007 Recommendations of the International Commission on Radiological Protection. ICRP Publication 103. Ann ICRP 2007;37(2-4). Institutional consensus document for the modern system of radiological protection (effective dose, w_T tissue-weighting factors, w_R radiation-weighting factors, dose limits, LNT-based protection framework). Institutional / report-era citation."

@X x_beir_vii_2006 := "BEIR VII (2006) — US NAS National Academies" :: literature [active]
  ref = "National Research Council (US), Committee to Assess Health Risks from Exposure to Low Levels of Ionizing Radiation. Health Risks from Exposure to Low Levels of Ionizing Radiation: BEIR VII Phase 2. National Academies Press, 2006. Institutional consensus synthesis underpinning LNT as the central estimate for low-LET solid-cancer risk in the US protection framework. Institutional / report-era citation."

@X x_unscear_chernobyl := "UNSCEAR Chernobyl reports" :: literature [active]
  ref = "United Nations Scientific Committee on the Effects of Atomic Radiation. Sources and Effects of Ionizing Radiation. UNSCEAR 2008 Report to the General Assembly, Annex D: Health effects due to radiation from the Chernobyl accident (and successor UNSCEAR reports). Institutional consensus assessment of Chernobyl exposures and outcomes (thyroid cancer in those exposed as children, acute deaths in emergency workers, societal/psychological impacts). Institutional / report-era citation."

@X x_unscear_fukushima := "UNSCEAR Fukushima reports" :: literature [active]
  ref = "United Nations Scientific Committee on the Effects of Atomic Radiation. Levels and effects of radiation exposure due to the nuclear accident after the 2011 great east-Japan earthquake and tsunami. UNSCEAR 2013 Report (and successor updates through ~2020 era). Institutional consensus assessment of Fukushima public and worker exposures and projected health outcomes. Institutional / report-era citation."

@X x_preston_lss := "Preston et al — LSS atomic-bomb-survivor cohort era" :: literature [active]
  ref = "Preston DL et al. Studies of mortality of atomic bomb survivors. Report on solid cancer and noncancer disease mortality in the Life Span Study (e.g. Radiation Research 2003 solid cancer report and 2007 mortality update; continuing-update series). Radiation Effects Research Foundation (RERF) Life Span Study cohort. Primary-author / publication-era cited — exact volume / page paraphrased."

@X x_smith_bindman_2009 := "Smith-Bindman et al 2009" :: literature [active]
  ref = "Smith-Bindman R et al. Radiation dose associated with common computed tomography examinations and the associated lifetime attributable risk of cancer. Arch Intern Med 2009;169:2078–2086. Landmark documentation of CT-era medical-imaging dose heterogeneity and modeled lifetime cancer-risk attribution."

@X x_withers_4rs_era := "Withers HR — the 4 R's of radiobiology era" :: literature [active]
  ref = "Withers HR. The four R's of radiotherapy. Advances in Radiation Biology 1975 (and successor publications). The foundational teaching framework organizing the rationale for fractionation (Repair, Reassortment, Repopulation, Reoxygenation); a fifth R (Radiosensitivity) was added later by Steel and others. Primary-author / era cited — exact volume / page paraphrased."

@X x_elkind_sld_era := "Elkind & Sutton — sublethal damage repair era" :: literature [active]
  ref = "Elkind MM, Sutton H. Radiation response of mammalian cells grown in culture — split-dose recovery (e.g. Nature 1959 / Radiation Research 1960 era and successor papers). The classic split-dose experiments operationalized as 'sublethal damage repair' (the 'R' for Repair in Withers's 4 R's). Primary-author / era cited — exact volume / page paraphrased."

@X x_amifostine_era := "Amifostine (WR-2721) clinical era literature" :: literature [active]
  ref = "Brizel DM et al — phase III randomized trial of amifostine as a radioprotector for xerostomia in head-and-neck cancer (J Clin Oncol, c. 2000), and successor literature on amifostine's narrower-than-hoped clinical role. Primary-investigator / era cited — exact volume / page paraphrased; cited as the canonical approved-radioprotector example with explicit acknowledgement of limited adoption."
