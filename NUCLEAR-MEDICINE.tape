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
# NUCLEAR-MEDICINE.tape — architecture-current (editable per v1.2)
# Event history → NUCLEAR-MEDICINE.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "nuclear-medicine" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · nuclear medicine in-silico knowledge SSOT"
  brief = "Nuclear medicine — radionuclides + imaging + theranostics · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  scope = "in-silico nuclear-medicine knowledge SSOT · NOT clinical/dosimetric advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see NUCLEAR-MEDICINE.log.tape audit"
  sibling-log = "NUCLEAR-MEDICINE.log.tape"

@N scope_disclaimer := "clinical/dosimetric-scope honesty" :: note [required]
  text = "This tape is an evidence-summary knowledge SSOT for an in-silico nuclear-medicine substrate. Isotope half-lives, imaging modalities, theranostic regimens and dosimetry frameworks are paraphrased from published nuclear-medicine literature and authoritative regulatory/standards bodies for modeling context only — they are NOT prescribing guidance, NOT dosimetric advice, NOT a treatment protocol, and NOT radiation-safety guidance. Radiopharmaceutical handling, patient dosing and dosimetry require qualified nuclear-medicine physicians, medical physicists and radiation-safety officers operating under jurisdictional radioactive-materials licences. All claims here are in-silico simulator/metadata consistency only; the wet-lab → preclinical → clinical → regulatory → clinical-use boundary is explicitly out of scope (hexa-bio AGENTS.tape g8 / f2)."

# ── §1 What nuclear medicine is ───────────────────────────────────────

@D dx_definition := "what nuclear medicine is" :: domain [ok]
  field = "Nuclear medicine is the medical specialty that uses unsealed radioactive sources (radiopharmaceuticals) for diagnosis and therapy — distinct from diagnostic radiology (which uses external X-rays) and from radiation oncology (which uses sealed sources or external beams). The defining feature is that the radioactivity is administered to the patient and distributes via biology."
  diagnostic = "Diagnostic nuclear medicine images functional/molecular processes: tracer biodistribution reveals perfusion, metabolism, receptor density, transporter activity. Anatomy is a by-product; physiology/biology is the primary signal."
  therapeutic = "Therapeutic nuclear medicine delivers a cytotoxic radiation dose preferentially to target tissue by exploiting a targeting molecule (or organ-specific uptake) carrying a particle-emitting radionuclide (β⁻, α, or Auger electrons)."
  theranostics = "Theranostics pairs a diagnostic radiopharmaceutical (γ/PET emitter) with a therapeutic radiopharmaceutical sharing the same targeting moiety, enabling patient selection and dosimetry-informed therapy on the same biology."
  not-this-tape = "External-beam radiotherapy, brachytherapy and X-ray/CT diagnostic radiology are mechanistically and regulatorily distinct neighbours — covered elsewhere; this tape's scope is unsealed radiopharmaceuticals."

@D dx_emission_modes := "decay modes used in nuclear medicine" :: mechanism [ok]
  gamma = "γ photons — used for single-photon imaging (SPECT, planar). Diagnostic energy window typically chosen to balance penetration with collimator/detector efficiency."
  beta-plus = "β⁺ (positron) — used for PET. Positron annihilates with a nearby electron yielding two ~511 keV photons emitted ~180° apart; coincidence detection reconstructs the line of response."
  beta-minus = "β⁻ — short-range therapeutic electrons (mm-scale path length, tissue-dependent); used for radionuclide therapy (e.g. ¹³¹I, ¹⁷⁷Lu, ⁹⁰Y)."
  alpha = "α — high-LET, very short range (~tens of μm, a few cell diameters); used for targeted alpha therapy (e.g. ²²³Ra, emerging ²²⁵Ac conjugates)."
  auger = "Auger / conversion electrons — very short range (sub-cellular); therapeutic only if delivered intracellularly/intranuclearly."
  honesty = "Decay-mode physics is well-established nuclear-physics knowledge; specific decay-scheme parameters live in evaluated data libraries (NNDC, ICRP, ENSDF) — verify exact branching ratios/energies against current evaluated data for any real program."

# ── §2 Diagnostic imaging — SPECT and PET ─────────────────────────────

@D img_spect := "SPECT and the gamma camera" :: imaging [ok]
  what = "Single-Photon Emission Computed Tomography (SPECT) reconstructs 3-D radiotracer distributions from gamma photons detected by a rotating gamma camera fitted with collimators."
  detector-origin = "The Anger scintillation gamma camera (NaI(Tl) crystal + photomultiplier-tube array with position logic) is the architectural ancestor of SPECT — introduced by Hal Anger in the late 1950s (primary-author/era; widely cited as the foundation of clinical scintigraphy)."
  pros-cons = "Single-photon imaging is widely deployed and uses long-lived isotopes amenable to generator/reactor production; spatial resolution and quantitation are inferior to PET, mitigated by SPECT/CT hybridisation."
  hybrid = "SPECT/CT is now the standard configuration for many indications, providing co-registered attenuation-corrected functional + anatomical imaging."
  |> "[@x_anger_1958] · [@x_cherry_sorenson_phelps]"

@D img_pet := "Positron Emission Tomography (PET)" :: imaging [ok]
  what = "PET detects coincident ~511 keV annihilation photons from positron-electron annihilation; coincidence timing reconstructs lines of response into 3-D images. Modern scanners use scintillators (BGO, LSO/LYSO, BaF₂-family) in ring geometry with time-of-flight (TOF) capability on contemporary systems."
  origin = "Quantitative PET in humans was developed in the 1970s. Phelps, Hoffman and colleagues are widely cited as the team that translated coincidence-detection physics into a practical tomographic medical scanner in the mid-1970s (primary-author/era; specific instrument-paper citations from 1975 onward in the foundational PET literature)."
  resolution = "PET typically achieves better spatial resolution and quantitative accuracy than SPECT; the fundamental physical floor on PET resolution includes positron range (isotope-dependent) and non-collinearity of annihilation photons — physics-set limits, not engineering bugs ([@lim_pet_resolution_floor])."
  hybrid = "PET/CT is the dominant clinical hybrid modality; PET/MR is established for selected indications (neuro, pediatric, soft-tissue) where MR contrast adds value over CT."
  |> "[@x_phelps_hoffman_1975_era] · [@x_cherry_sorenson_phelps]"

@D img_99mtc := "⁹⁹ᵐTc — the workhorse diagnostic radionuclide" :: imaging [ok]
  why-dominant = "Technetium-99m is the most-used diagnostic radionuclide in nuclear medicine worldwide. It is produced at the point of use from a ⁹⁹Mo/⁹⁹ᵐTc generator ('moly cow'): the parent ⁹⁹Mo decays to ⁹⁹ᵐTc, which is eluted as pertechnetate. ⁹⁹Mo itself is reactor-produced (fission-product or n,γ routes)."
  physics = "⁹⁹ᵐTc emits a ~140 keV γ photon — close to the detection optimum for NaI(Tl) Anger-camera collimator/detector trade-offs — and has a physical half-life of approximately 6 hours (NNDC evaluated decay data is the authoritative source for exact values)."
  why-half-life = "The ~6 h half-life is a practical compromise: long enough for biological distribution, image acquisition and same-day patient logistics; short enough to limit patient dose after the study completes. It is an EMPIRICAL FIT of nuclear physics to clinical workflow, NOT a derivation from any lattice constant — see [@f_lattice_fit]."
  chemistry = "⁹⁹ᵐTc chemistry supports a large family of kits (perfusion: ⁹⁹ᵐTc-sestamibi, ⁹⁹ᵐTc-tetrofosmin for myocardial perfusion; bone: ⁹⁹ᵐTc-MDP/HDP; renal: ⁹⁹ᵐTc-MAG3, ⁹⁹ᵐTc-DTPA; thyroid: ⁹⁹ᵐTc-pertechnetate; brain perfusion: ⁹⁹ᵐTc-HMPAO; many others). This radiochemical versatility is part of the reason ⁹⁹ᵐTc is dominant."
  |> "[@x_iaea_99mo_2011] · [@x_oecd_nea_99mo_2019]"

@D img_pet_tracers := "PET radionuclides and tracers" :: imaging [ok]
  fdg = "¹⁸F-FDG ([¹⁸F]fluorodeoxyglucose) is the dominant PET tracer in oncology, neurology and inflammation/infection imaging — a glucose analog trapped in cells after hexokinase phosphorylation, mapping glycolytic activity (Warburg-style for many tumors)."
  short-lived-c-n-o = "¹¹C (t½ ≈ 20 min), ¹³N (t½ ≈ 10 min) and ¹⁵O (t½ ≈ 2 min) are cyclotron-produced PET radionuclides; their very short half-lives mandate an on-site or close-coupled cyclotron and a radiochemistry facility — a logistical wall, not a lattice value (verify exact half-lives against current evaluated data)."
  ga68 = "⁶⁸Ga is generator-produced from ⁶⁸Ge (t½ ≈ 68 min for ⁶⁸Ga, again per evaluated data) and powers receptor-targeted PET (e.g. ⁶⁸Ga-DOTATATE for somatostatin-receptor neuroendocrine imaging, ⁶⁸Ga-PSMA for prostate-cancer imaging)."
  f18 = "¹⁸F (t½ ≈ 110 min per evaluated data) is the workhorse PET nuclide because its half-life supports regional distribution from a cyclotron-equipped radiopharmacy."
  cu64-zr89 = "⁶⁴Cu and ⁸⁹Zr (longer-lived PET nuclides) enable imaging of antibodies (immuno-PET) whose biological clearance is slow."
  honesty = "Half-life and energy parameters cited at approximate / evaluated-data-family level; authoritative values live in NNDC/ENSDF and ICRP publications, not in this tape."
  |> "[@x_nndc_chart] · [@x_cherry_sorenson_phelps]"

@D img_other_diagnostic := "other diagnostic radionuclides (selected)" :: imaging [ok]
  i123 = "¹²³I (γ emitter, t½ ≈ 13 h) — diagnostic thyroid imaging and uptake; preferred over ¹³¹I for diagnostic imaging because of lower patient dose."
  i131-diag = "¹³¹I — emits both β⁻ (therapeutic) and γ (imageable); historically used for thyroid uptake and whole-body iodine-avid disease scans, but its β⁻ delivers significant patient dose, so ¹²³I is preferred for diagnostic-only indications."
  ga67 = "⁶⁷Ga-citrate — historical infection/inflammation and lymphoma imaging; largely displaced by ¹⁸F-FDG-PET for those indications."
  in111 = "¹¹¹In — used for labelled white-cell (infection imaging), ¹¹¹In-pentetreotide (OctreoScan, somatostatin-receptor SPECT historically), and labelled antibodies."
  tl201 = "²⁰¹Tl-chloride — historical myocardial perfusion imaging tracer; largely displaced by ⁹⁹ᵐTc-perfusion agents (sestamibi/tetrofosmin) and by PET perfusion agents in many centres."
  honesty = "Half-lives and roles cited at approximate / clinical-practice level; specific decay parameters per NNDC/ICRP evaluated data."

@D img_hybrid := "hybrid imaging (SPECT/CT, PET/CT, PET/MR)" :: imaging [ok]
  why = "Functional radionuclide imaging localises disease but does not directly show anatomy; hybrid scanners co-register a CT or MR image acquired in the same session. CT additionally provides an attenuation map for quantitative reconstruction."
  spect-ct = "SPECT/CT — standard configuration for many clinical SPECT indications; CT provides attenuation correction and anatomical localisation."
  pet-ct = "PET/CT — the dominant clinical PET configuration; widely deployed in oncology, neurology, cardiology and infection imaging."
  pet-mr = "PET/MR — adds MR soft-tissue contrast (and avoids CT radiation dose); clinically established for paediatrics, neurology and selected oncology applications where MR contrast adds diagnostic value."
  honesty = "Modality selection is indication-specific and depends on the local imaging-equipment installed base ([@lim_isotope_supply] interacts with installed-base economics)."

# ── §3 Radiopharmaceutical design ─────────────────────────────────────

@D rx_design := "radiopharmaceutical design — targeting moiety + linker/chelator + radionuclide" :: design [ok]
  template = "A modern targeted radiopharmaceutical is a three-part construct: (1) a TARGETING MOIETY (small molecule, peptide, antibody, antibody fragment, or nanobody) that binds a tumor- or organ-expressed target; (2) a LINKER/CHELATOR that holds the radionuclide on the targeting moiety; (3) the RADIONUCLIDE itself, chosen for its emission mode (γ/β⁺ for imaging, β⁻/α/Auger for therapy) and physical half-life."
  chelators = "Macrocyclic chelators are dominant for trivalent metal radionuclides: DOTA (1,4,7,10-tetraazacyclododecane-N,N′,N″,N‴-tetraacetic acid) is the workhorse for ⁶⁸Ga, ¹⁷⁷Lu, ²²⁵Ac, ⁹⁰Y and others; NOTA (triazacyclononane-triacetic acid) and variants are preferred for ⁶⁴Cu and small ⁶⁸Ga peptides; HBED-CC, DOTAGA and others are used for specific applications. Chelator choice is dictated by radiometal coordination chemistry and in-vivo stability — not by a numeric invariant."
  small-mol-vs-antibody = "Small-molecule/peptide ligands (octreotide-family for SSTR; PSMA-binding ureas like PSMA-617) clear quickly and pair well with short-lived nuclides (⁶⁸Ga, ¹⁷⁷Lu). Antibodies clear slowly and require longer-lived nuclides (⁸⁹Zr for immuno-PET; ⁹⁰Y, ¹⁷⁷Lu, or α-emitters for therapy) — half-life matching is a real-design constraint."
  honesty = "Chelator/radionuclide pairings are an active design space; specific in-vivo stability, demetallation rates and radiolysis behaviour are reagent- and condition-specific empirical findings, not lattice values."

# ── §4 Theranostics — landmark trials ─────────────────────────────────

@D theranostics_concept := "theranostics — paired diagnostic + therapeutic on the same biology" :: theranostics [ok]
  principle = "A diagnostic γ/β⁺ analog images and quantifies target expression in vivo; if expression is sufficient, the patient receives the therapeutic β⁻/α analog sharing the same targeting moiety. The diagnostic step selects responders and supports dosimetry — this is what 'see what you treat, treat what you see' refers to."
  paradigm-pairs = "⁶⁸Ga-DOTATATE (PET diagnostic) + ¹⁷⁷Lu-DOTATATE (β⁻ therapy) for somatostatin-receptor neuroendocrine tumors. ⁶⁸Ga-PSMA-11 / ¹⁸F-PSMA-1007 (PET diagnostic) + ¹⁷⁷Lu-PSMA-617 (β⁻ therapy) for PSMA-expressing prostate cancer. ¹²³I/¹²⁴I (imaging) + ¹³¹I (β⁻ therapy) for thyroid disease — the original theranostic pairing, decades-old."
  no-universal-target = "Theranostics works where a tumor expresses a high-density, accessible target shared with normal tissue minimally enough to spare it; not every tumor has such a target. This is a biology-set ceiling, not a methodological one."

@D theranostics_lutathera := "¹⁷⁷Lu-DOTATATE (Lutathera) for neuroendocrine tumors" :: theranostics [ok recommended]
  what = "¹⁷⁷Lu-DOTATATE is a ¹⁷⁷Lu-labelled somatostatin analog (DOTA-Tyr³-octreotate) used as peptide-receptor radionuclide therapy (PRRT) for somatostatin-receptor-positive midgut neuroendocrine tumors."
  landmark = "The NETTER-1 phase-3 randomised trial (Strosberg et al., NEJM 2017) demonstrated significantly improved progression-free survival vs high-dose octreotide LAR control in patients with advanced, progressive, well-differentiated midgut neuroendocrine tumors — leading to regulatory approval (FDA 2018, EMA 2017) as Lutathera."
  selectivity = "Patient selection requires somatostatin-receptor imaging (typically ⁶⁸Ga-DOTATATE PET or historical ¹¹¹In-pentetreotide SPECT) demonstrating sufficient receptor expression — theranostics in clinical operation."
  toxicity = "Predominantly haematologic (lymphopenia, thrombocytopenia, rare myelodysplastic syndromes / acute leukaemia at longer follow-up) and renal (mitigated by co-infused amino acids that competitively reduce proximal-tubule reabsorption)."
  |> "[@x_strosberg_2017_netter1]"

@D theranostics_pluvicto := "¹⁷⁷Lu-PSMA-617 (Pluvicto) for metastatic castration-resistant prostate cancer" :: theranostics [ok recommended]
  what = "¹⁷⁷Lu-PSMA-617 is a ¹⁷⁷Lu-labelled small-molecule ligand of prostate-specific membrane antigen (PSMA), a glycoprotein highly expressed on most prostate cancers and a minority of normal tissues (salivary glands, kidneys, small bowel)."
  landmark = "The VISION phase-3 randomised trial (Sartor et al., NEJM 2021) demonstrated improved overall survival and radiographic progression-free survival when ¹⁷⁷Lu-PSMA-617 was added to standard of care in PSMA-positive metastatic castration-resistant prostate cancer (mCRPC) progressing on prior taxane and androgen-receptor-pathway therapy — leading to FDA approval (2022) as Pluvicto."
  selectivity = "Patient selection requires a PSMA PET scan demonstrating PSMA-avid disease; PSMA-negative mCRPC does not qualify for this therapy — a biology-set selection criterion, not a target-of-opportunity criterion."
  toxicity = "Salivary-gland and lacrimal dryness (xerostomia, xerophthalmia) — on-target/off-tumor uptake; haematologic toxicity; renal monitoring."
  emerging-alpha = "²²⁵Ac-PSMA-617 (an α-emitter analog) is the subject of active investigation in patients with insufficient response to or progression on ¹⁷⁷Lu-PSMA-617 — emerging α-theranostics literature; not standard of care as of this tape's knowledge cutoff."
  |> "[@x_sartor_2021_vision]"

@D theranostics_alpha_emerging := "targeted α-therapy (TAT) and ²²⁵Ac" :: theranostics [draft]
  rationale = "α particles deliver high linear energy transfer (LET) over a very short range (~tens of μm — a few cell diameters), maximising tumor-cell DNA double-strand-break induction while sparing tissue further than the α track length. In principle, fewer α decays per cell are needed to sterilise it than β⁻ decays."
  status = "²²⁵Ac-PSMA-617 has accumulated early-phase clinical experience in prostate cancer; broader α-radioligand-therapy clinical evidence is accumulating across indications. NOT yet standard of care broadly as of this tape's knowledge cutoff (verify currency before treating any specific approval as fact)."
  supply-wall = "²²⁵Ac global supply is severely limited — produced by a small number of routes (²²⁹Th decay-chain milking; high-energy proton spallation of ²³²Th; ²²⁶Ra(p,2n)²²⁵Ac at select cyclotrons) and is a documented bottleneck for both clinical translation and routine clinical use (see [@lim_isotope_supply])."

# ── §5 Therapeutic radionuclides beyond theranostics ─────────────────

@D rx_i131_thyroid := "¹³¹I — thyroid disease and differentiated thyroid cancer" :: therapy [ok recommended]
  what = "Radioactive iodine-131 (β⁻ + γ; reactor-produced) is delivered as oral Na¹³¹I (sodium iodide) and is concentrated by the sodium-iodide symporter (NIS) in thyroid follicular cells and most differentiated thyroid cancers."
  uses = "Treatment of hyperthyroidism (Graves disease, toxic nodular disease) at lower activities; ablation of residual thyroid tissue after thyroidectomy and treatment of iodine-avid metastatic differentiated thyroid carcinoma at higher activities."
  durability = "Among the longest-established radionuclide therapies, predating the modern theranostic vocabulary — historically the proof-of-concept for targeted radionuclide therapy: a biological pump (NIS) does the targeting."
  honesty = "Activity selection, pre-treatment preparation (TSH stimulation, low-iodine diet) and post-treatment isolation depend on jurisdictional radiation-safety regulations and clinical-pathway specifics — out of scope for this tape."

@D rx_ra223 := "²²³Ra-dichloride (Xofigo) — bone-targeted α therapy" :: therapy [ok recommended]
  what = "Radium-223 (an α emitter) behaves chemically as a calcium analog and is deposited in areas of high bone turnover — bone metastases. Its α emissions deliver a high-LET dose to osteoblastic metastatic deposits while sparing bone marrow more than β⁻ emitters of comparable activity (because α path length is far shorter than β⁻)."
  landmark = "The ALSYMPCA phase-3 trial (Parker et al., NEJM 2013) demonstrated an overall-survival benefit and prolonged time to first symptomatic skeletal event vs placebo in men with castration-resistant prostate cancer and symptomatic bone metastases without known visceral metastases — leading to regulatory approval as Xofigo."
  scope-note = "Indicated for symptomatic bone metastases without visceral metastatic disease; combination/sequencing with other prostate-cancer therapies is an active clinical-practice question (out of scope here)."
  |> "[@x_parker_2013_alsympca]"

@D rx_y90_sirt := "⁹⁰Y selective internal radiation therapy (SIRT/TARE)" :: therapy [ok recommended]
  what = "Yttrium-90 (β⁻, no γ) microspheres (glass or resin) are infused via a hepatic-artery catheter into the arterial supply of liver tumors; the microspheres lodge in tumor microvasculature and deliver a local β⁻ dose to the tumor while sparing the largely portal-vein-fed normal parenchyma."
  use = "Selective internal radiation therapy (SIRT), also called trans-arterial radioembolisation (TARE), for hepatocellular carcinoma and selected liver metastases."
  safety = "Pre-therapy ⁹⁹ᵐTc-MAA mapping is used to quantify pulmonary shunt and exclude unsafe extrahepatic deposition — an essential safety step grounded in real tracer biodistribution."
  honesty = "SIRT/TARE clinical outcomes and patient-selection criteria are tumor- and protocol-specific; cited at standard-of-care-family level."

@D rx_153sm := "¹⁵³Sm-EDTMP and bone-pain palliation (historical/contextual)" :: therapy [ok]
  what = "Samarium-153 EDTMP and strontium-89 chloride are bone-seeking β⁻ emitters historically used for palliation of pain from osteoblastic bone metastases. They concentrate in areas of high bone turnover via the chemistry of the bisphosphonate (¹⁵³Sm-EDTMP) or as a calcium analog (⁸⁹Sr)."
  status = "Largely superseded for prostate-cancer survival-impacting indications by ²²³Ra-dichloride (Xofigo, ALSYMPCA — [@x_parker_2013_alsympca]) which adds an overall-survival benefit. Bone-pain-palliation β⁻ agents remain in selected use; this is a historical/contextual entry."

# ── §6 Dosimetry and radiation protection ─────────────────────────────

@D dosim_mird := "MIRD dosimetry schema" :: dosimetry [ok]
  what = "The MIRD (Medical Internal Radiation Dose) committee schema is the standard internal-dosimetry framework in nuclear medicine. It expresses absorbed dose to a target organ as a sum over source organs of cumulated activity × an S-value (or radiopharmaceutical dose factor) capturing the physics of energy deposition between source and target."
  origin = "The MIRD schema was developed by the Society of Nuclear Medicine MIRD committee with foundational pamphlets including formalism papers by Loevinger and colleagues (primary-author/era; specific MIRD-pamphlet numbers and revisions span decades) and is the authoritative internal-dosimetry framework used clinically."
  modern = "Patient-specific dosimetry (Monte Carlo on patient anatomy from CT/MR, voxel-level dose-rate-curve integration, biokinetic-model fitting) is built on the MIRD foundation and is increasingly mainstream for theranostics."
  honesty = "S-values, dose factors and biokinetic models are evolving with computing-power and patient-specific anatomy availability; cited at framework-family / primary-author-era level."
  |> "[@x_mird_loevinger_era]"

@D dosim_icrp := "ICRP framework for organ dose and effective dose" :: dosimetry [ok]
  what = "The International Commission on Radiological Protection (ICRP) provides the framework of dose quantities (equivalent dose, effective dose) and reference computational phantoms used worldwide for radiation protection of patients, workers and the public from radiopharmaceuticals and external radiation alike."
  publications = "Key ICRP publications include the 1990 framework (ICRP Publication 60), the 2007 recommendations (ICRP Publication 103), and the long-running radiopharmaceutical-dose series (ICRP Publications 53, 80, 106, 128 and successors) tabulating dose-per-administered-activity coefficients for many radiopharmaceuticals."
  honesty = "Specific tissue weighting factors and dose coefficients have been revised between ICRP recommendations (notably 1990 → 2007); cited at publication-family level. ICRP recommendations are adopted with national variation — verify current jurisdictional regulation for any real program."
  |> "[@x_icrp_framework]"

@D safety_alara := "ALARA and the diagnostic-quality trade-off" :: safety [ok required]
  what = "ALARA — 'As Low As Reasonably Achievable' — is the foundational radiation-protection principle: keep exposures as low as reasonably achievable, taking economic and social factors into account. It bounds, but does not eliminate, the administered activity necessary for diagnostic image quality."
  trade-off = "Lower administered activity → lower patient dose, AND lower count statistics → noisier images / longer acquisition. Modern detector technology (e.g. solid-state SPECT, digital PET, TOF-PET) and reconstruction algorithms shift but do NOT abolish this trade-off (see [@lim_alara_quality_tradeoff])."
  pregnancy = "Pregnancy is a relative or absolute contraindication for most diagnostic radioisotope studies depending on indication, urgency and isotope; emergency clinical-radiology judgement is jurisdiction-specific and out of scope here. Lactation considerations (transfer of radioactivity into breast milk, isotope-specific interruption recommendations) are similarly real and out of scope."
  licensing = "Use of unsealed radioactive sources requires a radioactive-materials licence (jurisdiction-specific: e.g. NRC and Agreement-State licences in the US under 10 CFR Part 35 for medical use; analogous national-competent-authority licences elsewhere). Radiation-safety officer (RSO) oversight is mandated."
  honesty = "Pregnancy/lactation/licensing practices are framework-level realities; specific dose limits and procedural rules live in jurisdictional regulation, not in this tape."

# ── §7 Isotope supply chain ───────────────────────────────────────────

@D supply_99mo := "⁹⁹Mo/⁹⁹ᵐTc supply chain" :: supply [ok]
  what = "⁹⁹ᵐTc is delivered to clinical sites via ⁹⁹Mo/⁹⁹ᵐTc generators; ⁹⁹Mo itself is largely reactor-produced (fission of ²³⁵U targets being the long-dominant route). Because ⁹⁹Mo has a ~66 h half-life it cannot be stockpiled, so global ⁹⁹Mo supply rests on a handful of ageing research reactors operating in coordination."
  crisis-2009-2010 = "The 2009–2010 global ⁹⁹Mo supply crisis arose when several principal production reactors (notably NRU in Canada and HFR in the Netherlands) were offline simultaneously, causing major worldwide ⁹⁹ᵐTc shortages and forcing clinical-practice substitutions. The crisis is the canonical case study in nuclear-medicine supply fragility — extensively documented by the IAEA and the OECD Nuclear Energy Agency High-Level Group on the Security of Supply of Medical Radioisotopes (institutional reporting, primary-author/era for the 2009–2010 events)."
  diversification = "Post-crisis efforts pushed for non-HEU (highly-enriched-uranium) ⁹⁹Mo production, cyclotron-based ⁹⁹ᵐTc routes and accelerator alternatives; the supply chain remains a topic of active policy attention."
  |> "[@x_iaea_99mo_2011] · [@x_oecd_nea_99mo_2019]"

@D supply_225ac := "²²⁵Ac global scarcity" :: supply [ok]
  what = "Actinium-225 supply is structurally limited. Principal routes include ²²⁹Th decay-chain milking (the ²²⁹Th stockpile itself is finite and ageing), high-energy proton spallation of ²³²Th at large accelerators, and ²²⁶Ra(p,2n)²²⁵Ac at selected cyclotrons. Each route has scale, capital and regulatory limits."
  consequence = "²²⁵Ac scarcity is a documented bottleneck for both clinical translation and routine clinical use of targeted α therapy — a real wall on how broadly α theranostics can be deployed in the near term ([@lim_isotope_supply])."
  honesty = "Supply-expansion programs (new ²²⁹Th sources, alternative ²²⁵Ac production routes, recycling of ²¹³Bi daughters) are in progress at multiple national laboratories; statements here are framework-level, not a forecast."

@D supply_cyclotron_vs_reactor := "cyclotron- vs reactor-produced radionuclides" :: supply [ok]
  reactor = "Reactor-produced radionuclides (¹³¹I, ⁹⁹Mo→⁹⁹ᵐTc, ¹⁷⁷Lu via ¹⁷⁶Yb(n,γ)¹⁷⁷Yb→¹⁷⁷Lu or ¹⁷⁶Lu(n,γ)¹⁷⁷Lu, ⁹⁰Y, ¹⁵³Sm, etc.) depend on neutron-flux availability — concentrated in a small number of research reactors globally."
  cyclotron = "Cyclotron-produced radionuclides (¹¹C, ¹³N, ¹⁵O, ¹⁸F, ⁶⁴Cu, ⁸⁹Zr, ¹²³I, and an emerging set of accelerator-produced therapy isotopes) require an accelerator facility and downstream radiochemistry — distributed model for short-lived PET nuclides, regional for longer-lived ones."
  honesty = "The split is technology- and infrastructure-driven, not lattice-driven; specific isotope routes are continuously re-engineered as accelerator capacity, target chemistry and regulatory environments evolve."

# ── §8 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_isotope_supply := "isotope supply on demand growth" :: real-limit [ok required]
  wall = "HARD WALL (production-infrastructure-bound)"
  statement = "Medical-radionuclide supply rests on a small number of high-flux research reactors (⁹⁹Mo, ¹³¹I, ¹⁷⁷Lu, ⁹⁰Y, others) and a similarly small number of high-energy accelerators or ²²⁹Th-stockpile sources (²²⁵Ac and other α emitters). Half-lives preclude stockpiling, the installed base is ageing, and capacity expansion has reactor- or accelerator-scale capital and regulatory lead times measured in years to decades."
  consequence = "Theranostic demand can outrun supply for specific isotopes (the documented ²²⁵Ac bottleneck; the historical ⁹⁹Mo crisis). Treatment access is supply-bounded as much as biology-bounded — a real-engineering / real-policy ceiling, not a clinical-efficacy ceiling."
  |> "[@x_iaea_99mo_2011] · [@x_oecd_nea_99mo_2019]"

@D lim_alara_quality_tradeoff := "ALARA / image-quality tension" :: real-limit [ok required]
  wall = "PHYSICAL/STATISTICAL WALL"
  statement = "Image quality in radiotracer imaging is photon-statistics-limited at clinically relevant administered activities. Lower administered activity reduces patient dose but raises image noise and lengthens acquisition. Detector and reconstruction advances (TOF-PET, solid-state SPECT, deep-learning denoising) shift the operating point — they do not abolish the underlying counting-statistics trade-off."
  consequence = "There is no administered activity that yields zero patient dose AND high diagnostic quality; ALARA defines the operating window, not a single optimum. Population-level dose-quality optimisation is genuinely Pareto, not a number to maximise."

@D lim_pregnancy_contraindication := "pregnancy contraindication for most diagnostic radioisotopes" :: real-limit [ok required]
  wall = "BIOLOGICAL/ETHICAL WALL"
  statement = "Fetal radiation exposure is a stochastic and (above thresholds) deterministic risk. Most diagnostic radiopharmaceuticals are contraindicated in confirmed or possible pregnancy except where indication urgency and benefit clearly outweigh the fetal-dose risk; some agents cross to fetal circulation or concentrate in fetal organs (e.g. iodine isotopes in fetal thyroid)."
  consequence = "Pregnancy categorically narrows the available nuclear-medicine toolset for many indications and may force substitution to non-ionising modalities (MR, ultrasound). This is a hard biology/ethics-set constraint, not a regulatory-paper one."
  honesty = "Lactation guidance (interruption of breastfeeding by isotope and indication) is the related real-world constraint, isotope-specific and per-jurisdiction; out of scope for this tape."

@D lim_specific_activity := "specific-activity ceiling on labelled compounds" :: real-limit [ok required]
  wall = "RADIOCHEMICAL WALL"
  statement = "Specific activity (radioactivity per mass of the labelled compound) is bounded by the radiochemical yield and the unlabelled-precursor mass present after labelling. Receptor-targeted radiopharmaceuticals at moderate specific activity can SATURATE the receptor with unlabelled (cold) ligand and reduce the imaged signal of labelled (hot) ligand — the imaging/dosing operating window is constrained by mass-balance pharmacology, not by radioactivity alone."
  consequence = "Higher specific activity is a real engineering goal (no-carrier-added production routes, optimised chelator-conjugate chemistry, residual-precursor purification); the relationship between specific activity, target density and tracer/therapy performance is a real-world design parameter to manage, not an unbounded knob."

@D lim_off_target_uptake := "off-target organ uptake limits therapeutic index" :: real-limit [ok required]
  wall = "HARD WALL (biology-set)"
  statement = "Most targeting moieties bind at least some normal tissue. PSMA-targeted ligands deposit in salivary glands, lacrimal glands, kidneys and small bowel; somatostatin-receptor agonists are taken up by spleen, kidneys and pituitary. Off-target uptake bounds achievable tumor-to-normal-tissue dose ratio, hence the therapeutic index — a real biology-set ceiling, NOT a derivation from a lattice value."
  consequence = "Real-program responses include co-infused renal-protective amino acids for PRRT, sialendoscopy/cryotherapy strategies for PSMA xerostomia, and active research into next-generation ligands with improved tumor-to-normal-tissue ratios. None abolishes off-target uptake; all manage it."
  |> "[@x_strosberg_2017_netter1] · [@x_sartor_2021_vision]"

@D lim_regulatory_radiation_license := "regulatory & radiation-license burden" :: real-limit [ok required]
  wall = "REGULATORY/OPERATIONAL WALL"
  statement = "Clinical use of unsealed radioactive sources requires a radioactive-materials licence (NRC + Agreement-State 10 CFR Part 35 in the US; analogous national regimes elsewhere), trained authorised users (AUs), an RSO, instrumented hot-lab facilities, ALARA programs, patient-release-criteria documentation, transport-of-radioactive-materials compliance and post-administration patient-instruction protocols."
  consequence = "Even where the underlying science and isotope supply are both in hand, every clinical site offering nuclear-medicine therapy carries a substantial licensing/operational overhead; this throttles institutional and regional access to therapy isotopes (interacts with [@lim_isotope_supply])."
  honesty = "Specific licence categories and procedural requirements are jurisdiction-specific; cited at framework level, not as legal advice."

@D lim_pet_resolution_floor := "PET spatial-resolution physical floor" :: real-limit [ok required]
  wall = "PHYSICAL WALL (decay-physics-set)"
  statement = "PET spatial resolution is bounded below by isotope-dependent positron range (the distance a positron travels in tissue before annihilating with an electron — larger for higher β⁺-endpoint-energy isotopes such as ⁶⁸Ga or ⁸²Rb, smaller for ¹⁸F) and by non-collinearity of the two ~511 keV annihilation photons (their angular spread from exactly 180° from residual positron-electron momentum)."
  consequence = "Detector design improvements (smaller crystals, depth-of-interaction encoding, TOF reconstruction) reduce engineering contributions to point-spread but cannot push resolution below the physics floor for a given isotope. This is decay physics, not a lattice value."

# ── §9 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-nuclear-medicine" :: governance [required deny:write]
  pattern = "Deriving nuclear-medicine facts (isotope half-lives, PET detector counts, decay energies, dose limits, modality counts, MIRD organ partitioning) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's '⁹⁹ᵐTc t½ = 6 h because n=6', '6 PET detector rings as the minimum because n=6', or any '== identity at n=6' presented as a derivation source for a nuclear-medicine claim."
  why = "This is exactly the violation the pre-rewrite NUCLEAR-MEDICINE.tape committed (lattice-tautology stub, mass-split 153b5a2 — see NUCLEAR-MEDICINE.log.tape audit). hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3 forbid it; f1 forbids lattice-fit on external entities (NNDC, ICRP, IAEA, FDA, EMA, OECD NEA, AAPM, EANM are external scientific/regulatory bodies — g3 honesty-obligation-external applies), f2 forbids in-silico → clinical/dosimetric claims."
  remedy = "Cite real evaluated-data libraries (NNDC), real ICRP/IAEA/OECD-NEA reports, real landmark clinical trials (NETTER-1, VISION, ALSYMPCA), and standard nuclear-medicine reference texts (this tape's @X entries). The lattice may only be a coincidental OBSERVATION — never a derivation source for any nuclear-medicine, dosimetric or clinical claim."

@N n6_honest_stance := "nuclear medicine has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: nuclear medicine exposes NO natural n=6 invariant. The ⁹⁹ᵐTc physical half-life is approximately 6 hours per NNDC evaluated decay data — a measured nuclear-physics fact, NOT a derivation from σ=12 / τ=4 / φ=2 / J₂=24; it numerically coincides with 6 by accident and the empirically chosen clinical workflow happens to fit. PET scanner detector geometries (block count, ring count, time-of-flight timing windows) are engineered to optical/scintillator/cost constraints, not derived from the lattice. FDA device classes count THREE; EU MDR device classes count FOUR; ICRP recommendations span PUBLICATIONS 26 → 60 → 103; MIRD pamphlet numbering spans decades. Decay modes used in nuclear medicine (γ, β⁺, β⁻, α, Auger) count FIVE, not 6. Per LATTICE_POLICY g1/g2 + lattice-as-tool: the lattice is DECLINED here as a derivation tool — values may coincide by accident (observation OK) but never derive a claim. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ── §10 Verifiable predictions (real, falsifiable — NOT lattice) ─────

@D tp_1 := "TP-1 theranostic selection gradient" :: prediction [ok]
  claim = "Patients selected for ¹⁷⁷Lu-PSMA-617 therapy by a positive PSMA PET scan (PSMA-avid disease) achieve, on average, materially better outcomes than would an unselected mCRPC population — selection-by-imaging is the operative theranostic premise, NOT a uniform efficacy rate across all prostate cancers."
  falsifier = "If a prospectively unselected mCRPC cohort treated with ¹⁷⁷Lu-PSMA-617 achieved outcomes indistinguishable from the VISION-style PSMA-selected cohort, the selection-by-imaging premise (and [@lim_off_target_uptake] in its biological-selection form) would be wrong."
  source = "[@x_sartor_2021_vision]"

@D tp_2 := "TP-2 ⁹⁹Mo supply fragility recurrence" :: prediction [ok]
  claim = "Without substantive new ⁹⁹Mo production capacity, the global ⁹⁹ᵐTc supply chain remains vulnerable to clinically significant shortages from coordinated outages of the few principal production reactors — i.e. the conditions underlying the 2009–2010 crisis remain structurally present until additional independent supply sources are commissioned at scale."
  falsifier = "If a structural surplus of ⁹⁹Mo production capacity (from new reactors, accelerator-based routes, or non-fission processes) reached commercial scale and a sustained period of coordinated principal-reactor outages no longer produced shortages, [@lim_isotope_supply] in its ⁹⁹Mo form would be wrong."
  source = "[@x_iaea_99mo_2011] · [@x_oecd_nea_99mo_2019]"

@D tp_3 := "TP-3 α-therapy supply-bounded near-term scale" :: prediction [ok]
  claim = "Near-term clinical-scale deployment of ²²⁵Ac-labelled radiopharmaceuticals will be supply-bounded rather than efficacy-bounded: even if clinical evidence in a given indication continues to strengthen, the rate-limiting step on patient access will be ²²⁵Ac availability, not trial readout."
  falsifier = "If ²²⁵Ac supply expanded sufficiently to remove production capacity from the rate-limiting step for clinical adoption in major indications, the [@lim_isotope_supply] α-emitter form (and [@supply_225ac]) would be wrong."
  source = "[@supply_225ac]"

# ── §11 External citations (real literature & authoritative sources) ──
# Confidence-tier convention (mirrors gold tapes — gold/florea AGA, hexa-bio
# cancer-therapy, hexa-bio medical-device): named landmark trials cited at
# author/year/journal/volume/page level; older instrumentation founders and
# framework families cited at primary-author/era level only, with the era
# flagged in the ref to avoid fabricated specificity.

@X x_strosberg_2017_netter1 := "Strosberg JR et al. 2017 (NETTER-1)" :: literature [active]
  ref = "Strosberg JR et al. Phase 3 trial of ¹⁷⁷Lu-Dotatate for midgut neuroendocrine tumors. N Engl J Med 2017;376:125–135. (NETTER-1 — landmark phase-3 RCT establishing ¹⁷⁷Lu-DOTATATE / Lutathera in midgut NETs.)"

@X x_sartor_2021_vision := "Sartor O et al. 2021 (VISION)" :: literature [active]
  ref = "Sartor O et al. Lutetium-177–PSMA-617 for metastatic castration-resistant prostate cancer. N Engl J Med 2021;385:1091–1103. (VISION — landmark phase-3 RCT establishing ¹⁷⁷Lu-PSMA-617 / Pluvicto in PSMA-positive mCRPC.)"

@X x_parker_2013_alsympca := "Parker C et al. 2013 (ALSYMPCA)" :: literature [active]
  ref = "Parker C et al. Alpha emitter radium-223 and survival in metastatic prostate cancer. N Engl J Med 2013;369:213–223. (ALSYMPCA — landmark phase-3 RCT establishing ²²³Ra-dichloride / Xofigo in symptomatic-bone-metastatic CRPC.)"

@X x_anger_1958 := "Anger HO (late-1950s gamma camera)" :: literature [active]
  ref = "Anger HO. Scintillation camera. (Primary-author/era citation: the Anger NaI(Tl) scintillation gamma camera was introduced by Hal Anger in the late 1950s and is the architectural ancestor of clinical scintigraphy and SPECT. Exact founding-paper volume/year cited at era level to avoid fabricated specificity; the canonical foundational citation is widely attributed to Anger HO, Rev Sci Instrum 1958.)"

@X x_phelps_hoffman_1975_era := "Phelps ME & Hoffman EJ (1975-era PET)" :: literature [active]
  ref = "Phelps ME, Hoffman EJ and colleagues. Foundational human-PET instrumentation papers from the mid-1970s onward (canonically dated to 1975 instrument-papers and follow-on series). Primary-author/era citation; exact founding-paper volume/year cited at era level to avoid fabricated specificity. Phelps and Hoffman are widely credited with translating coincidence-detection physics into a practical clinical tomographic scanner."

@X x_mird_loevinger_era := "MIRD schema (Loevinger-era)" :: literature [active]
  ref = "Society of Nuclear Medicine MIRD (Medical Internal Radiation Dose) committee. MIRD pamphlet series (foundational formalism papers including author Loevinger and colleagues; later MIRD pamphlets through subsequent decades). Primary-author/era citation: the MIRD internal-dosimetry schema is the standard framework for radiopharmaceutical absorbed-dose estimation; specific MIRD-pamphlet numbers and revision years span decades and are not asserted here."

@X x_icrp_framework := "ICRP recommendations & radiopharmaceutical-dose series" :: literature [active]
  ref = "International Commission on Radiological Protection (ICRP). Key recommendations include ICRP Publication 60 (1990 framework) and ICRP Publication 103 (2007 recommendations); long-running radiopharmaceutical absorbed-dose series includes ICRP Publications 53, 80, 106, 128 and successors. Cited at publication-family level; specific tissue weighting factors and dose coefficients have been revised across editions — verify currency for any real program."

@X x_iaea_99mo_2011 := "IAEA — ⁹⁹Mo/⁹⁹ᵐTc supply (2009-2010 crisis institutional reporting)" :: literature [active]
  ref = "International Atomic Energy Agency (IAEA). ⁹⁹Mo/⁹⁹ᵐTc supply-of-medical-radioisotopes documentation, including post-2009-2010-crisis technical reports on diversification of ⁹⁹Mo production. Institutional-reporting / framework-family citation; the 2009–2010 global ⁹⁹Mo supply crisis is a documented institutional-reporting event (IAEA + OECD/NEA), not a single primary-author paper."

@X x_oecd_nea_99mo_2019 := "OECD Nuclear Energy Agency HLG-MR — medical-radioisotope security of supply" :: literature [active]
  ref = "Organisation for Economic Co-operation and Development, Nuclear Energy Agency, High-Level Group on the Security of Supply of Medical Radioisotopes (HLG-MR). Reports on the global ⁹⁹Mo/⁹⁹ᵐTc supply chain post-2009-2010 crisis and longer-term ⁹⁹Mo capacity outlook. Institutional-reporting citation; cited as the principal multilateral policy reference on medical-radioisotope supply."

@X x_nndc_chart := "NNDC Chart of Nuclides (evaluated decay data)" :: literature [active]
  ref = "Brookhaven National Laboratory. National Nuclear Data Center (NNDC) — Chart of Nuclides and Evaluated Nuclear Structure Data File (ENSDF). Authoritative source for evaluated decay-mode, half-life, branching-ratio and γ-energy data cited approximately in this tape; specific values should be retrieved from current NNDC/ENSDF for any quantitative program."

@X x_cherry_sorenson_phelps := "Cherry SR, Sorenson JA & Phelps ME — Physics in Nuclear Medicine" :: literature [active]
  ref = "Cherry SR, Sorenson JA, Phelps ME. Physics in Nuclear Medicine. Elsevier/Saunders. Standard reference textbook for nuclear-medicine physics — covers radionuclide production, detector physics, SPECT and PET instrumentation, dosimetry and image quantification. Cited as the canonical instructional reference for this tape's physics-and-instrumentation claims; latest-edition specifics evolve, the title is the anchor."
