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
# PHARMACOLOGY.tape — architecture-current (editable per v1.2)
# Event history → PHARMACOLOGY.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "pharmacology" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · pharmacology in-silico knowledge SSOT"
  brief = "Pharmacology fundamentals + ADME + receptor theory · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  scope = "in-silico pharmacology knowledge SSOT · NOT prescribing/clinical advice"
  sibling-log = "PHARMACOLOGY.log.tape"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see PHARMACOLOGY.log.tape audit"

@N scope_disclaimer := "pharmacology knowledge SSOT — scope honesty" :: note [required]
  text = "This tape is an evidence-summary knowledge SSOT for pharmacology fundamentals: receptor theory, dose-response, ADME, drug-drug interactions, receptor classes, and pharmacogenomics. Drug examples, concentration/effect figures, enzyme nomenclature, and pharmacogenomic genotypes are paraphrased from published peer-reviewed literature and standard pharmacology textbooks for modeling context only — they are NOT prescribing guidance, NOT diagnostic guidance, and NOT a substitute for clinical judgement. Specific drug-drug interaction lists are illustrative landmark examples, not exhaustive. Real prescribing requires a licensed clinician and current authoritative references (product labels, drug-interaction databases, CPIC guidelines). All claims here are in-silico simulator/metadata consistency only; hexa-bio AGENTS.tape g8 / f2 apply."

# ── §1 Receptor theory — the conceptual foundation ───────────────────

@D rt_clark_mass_action := "Clark 1933 — drug-receptor mass-action equation" :: receptor-theory [ok]
  what = "A.J. Clark, in The Mode of Action of Drugs on Cells (1933), formalised the idea that drug effect at a tissue arises from drug molecules occupying specific receptor sites, with binding governed by mass-action kinetics. The fraction of receptors occupied scales as [D]/([D]+K_D), where [D] is free drug concentration and K_D is the equilibrium dissociation constant."
  why-foundational = "This is the conceptual bridge from medicinal-chemistry empiricism to quantitative pharmacology — effect becomes a function of occupancy, occupancy becomes a function of concentration and an intrinsic affinity constant of the drug-receptor pair."
  honesty = "Clark's original framework assumed effect proportional to occupancy; later work (Stephenson, Furchgott, Black) refined this — see [@rt_stephenson_efficacy]."
  |> "[@x_clark_1933]"

@D rt_stephenson_efficacy := "Stephenson 1956 — efficacy / intrinsic activity distinction" :: receptor-theory [ok]
  what = "R.P. Stephenson (1956) distinguished AFFINITY (how tightly a drug binds the receptor, captured by K_D) from EFFICACY (the strength of response per unit of receptor occupancy). Two ligands can share the same affinity but differ in intrinsic activity — explaining partial agonism, full agonism, and competitive antagonism within a single occupancy framework."
  why-matters = "Receptor occupancy alone does not predict response; a full agonist saturates the response at sub-100% occupancy if 'spare receptors' exist, while a partial agonist plateaus below the maximal possible response regardless of dose."
  era-flag = "Stephenson 1956 (Br J Pharmacol Chemother era) — primary-author/era citation; this distinction is part of every textbook of pharmacology."
  |> "[@x_stephenson_1956]"

@D rt_black_propranolol := "Black 1962 — propranolol and selective β-blockade" :: receptor-theory [ok]
  what = "Sir James Black and colleagues, at ICI in the early 1960s, used Stephenson-style structure-activity reasoning to rationally design β-adrenergic receptor antagonists. Propranolol (initial Lancet communication: Black & Stephenson 1962) became the prototype β-blocker — a practical demonstration that receptor pharmacology could be turned into selective therapy."
  prize = "Black was awarded the 1988 Nobel Prize in Physiology or Medicine for these methods of rational drug design; the same approach later yielded H2-receptor antagonists (cimetidine) for peptic ulcer disease."
  why-here = "Propranolol is cited not as a clinical recommendation but as the historical proof that drug-receptor theory is a working scientific framework — the conceptual capstone of §1."
  |> "[@x_black_stephenson_1962]"

@D rt_dose_response_curves := "graded dose-response: shape and parameters" :: receptor-theory [ok]
  curve-shape = "Plotted as effect vs log(concentration), graded dose-response curves are typically sigmoidal. The four standard parameters are: potency (location on the dose axis — EC50/ED50), efficacy (maximal effect achievable — E_max), slope (steepness around midpoint — related to the Hill coefficient), and threshold."
  ec50-vs-kd = "EC50 is the concentration producing half-maximal EFFECT (functional readout). K_D is the concentration at which half the RECEPTORS are bound (binding readout). EC50 == K_D only in the idealised no-spare-receptor full-agonist case; in real tissues with receptor reserve, EC50 can be considerably lower than K_D ([@rt_stephenson_efficacy])."
  ic50 = "IC50 — concentration producing half-maximal INHIBITION — is the antagonist/inhibitor analogue of EC50."
  honesty = "Curve parameters are empirical descriptors fit to data; no parameter is a lattice constant."

@D rt_hill_equation := "Hill equation — cooperative binding" :: receptor-theory [ok]
  origin = "Archibald Vivian Hill (1910, J Physiol) introduced the Hill equation to fit cooperative oxygen binding to haemoglobin: Y = [L]^n / (K + [L]^n), where Y is fractional saturation, [L] is ligand concentration, K is an affinity constant and n is the Hill coefficient (n>1 indicates positive cooperativity, n=1 reduces to a non-cooperative hyperbola)."
  pharmacology-reuse = "The same functional form is routinely used to fit graded dose-response curves in pharmacology; the Hill coefficient in pharmacology is an empirical curve-shape parameter (not necessarily a true binding stoichiometry)."
  haemoglobin-history = "Hill's 1910 paper is the foundational kinetic description of haemoglobin cooperativity; subsequent allosteric models (MWC, KNF) provided mechanistic interpretations of the same curve."
  era-flag = "Hill 1910 — J Physiol; landmark biochemistry paper, primary-author/year cited as in standard references."
  |> "[@x_hill_1910]"

@D rt_therapeutic_index := "ED50, TD50, and therapeutic index" :: receptor-theory [ok]
  definitions = "ED50 (median effective dose, in vivo) is the dose producing the target effect in 50% of a population; TD50 / LD50 are analogously the doses producing toxicity / lethality in 50%. The Therapeutic Index (TI) is the ratio TD50/ED50 — a measure of the population-level margin between efficacy and toxicity."
  caveat = "TI is a crude single-number summary of two distributions; a high TI does not guarantee individual safety, and a low TI does not preclude clinical use with careful monitoring (see [@lim_narrow_ti])."
  use = "TI is the textbook framing that anchors the real-limit on narrow-TI drugs (warfarin, lithium, digoxin) — these require therapeutic drug monitoring because the dose-response and dose-toxicity curves nearly overlap."
  |> "[@x_goodman_gilman]"

# ── §2 ADME — what the body does to the drug ─────────────────────────

@D adme_absorption := "Absorption: bioavailability and first-pass effect" :: adme [ok]
  bioavailability = "F (oral bioavailability) is operationally defined as F = (AUC_PO / AUC_IV) × (Dose_IV / Dose_PO), where AUC is the area under the plasma concentration-time curve after oral (PO) vs intravenous (IV) administration with appropriate dose correction. F=1 means complete bioavailability; F=0 means no systemic exposure from oral dosing."
  first-pass = "Orally absorbed drugs travel via the portal circulation through the liver before reaching systemic circulation. Hepatic metabolism on this first pass (and gut-wall metabolism by enterocyte CYPs and efflux by P-glycoprotein) can substantially reduce F — the 'first-pass effect'. Drugs with high first-pass extraction (e.g. nitroglycerin, propranolol historically) have markedly lower oral than parenteral bioavailability."
  factors = "F is determined by: gastrointestinal solubility/permeability (Biopharmaceutics Classification System axes), gut-wall metabolism (CYP3A4 enterocyte), efflux transporters (P-glycoprotein/ABCB1), portal-vein first-pass extraction, and formulation/release characteristics."
  honesty = "Bioavailability figures are drug- and formulation-specific empirical measurements. The defining formula (AUC_PO/AUC_IV with dose correction) is standard pharmacology textbook material, not a lattice derivation."
  |> "[@x_goodman_gilman]"

@D adme_distribution := "Distribution: V_d, protein binding, BBB" :: adme [ok]
  vd = "Apparent volume of distribution V_d = Dose / C_0, where C_0 is the extrapolated initial plasma concentration. V_d is a proportionality constant, not a true anatomical volume — drugs that bind extensively to tissue (e.g. amiodarone, digoxin) can have V_d orders of magnitude larger than total body water."
  protein-binding = "Two dominant plasma binding proteins: serum ALBUMIN (binds acidic drugs preferentially — warfarin, phenytoin, NSAIDs) and α1-ACID GLYCOPROTEIN (AAG; binds basic drugs — lidocaine, propranolol, many psychotropics). Only the unbound (free) fraction is pharmacologically active and available for elimination."
  bbb = "The blood-brain barrier (BBB) — tight-junctioned cerebral capillary endothelium reinforced by efflux transporters (P-gp, BCRP) — restricts CNS drug penetration. Lipophilic small molecules generally cross; large polar molecules and biologics generally do not. CNS drug design is in large part an exercise in BBB optimisation."
  honesty = "V_d is a derived parameter from PK measurements; albumin/AAG binding partitioning is established biochemistry; BBB transporter biology is active research area. None of these is lattice-derived."

@D adme_metabolism_cyp := "Metabolism: cytochrome P450 (CYP) family" :: adme [ok]
  cyp450 = "The cytochrome P450 (CYP) superfamily is the dominant Phase I (oxidative) drug-metabolising enzyme system, located primarily in hepatocyte endoplasmic reticulum. Standard pharmacology textbooks report CYP3A4 as responsible for the metabolism of approximately half of clinically used drugs — a textbook figure widely cited; the exact percentage depends on the drug sample considered."
  major-isoforms = "Clinically dominant isoforms: CYP3A4/3A5 (broad substrate range; gut + liver); CYP2D6 (~25% of drugs; highly polymorphic — see [@pgx_cyp2d6]); CYP2C9 (warfarin, phenytoin, NSAIDs); CYP2C19 (clopidogrel, PPIs); CYP1A2 (caffeine, theophylline); CYP2B6 (efavirenz, bupropion); CYP2E1 (alcohol, paracetamol)."
  phase-i-vs-ii = "Phase I reactions (oxidation/reduction/hydrolysis) introduce or expose polar functional groups; Phase II reactions (glucuronidation by UGTs, sulfation, glutathione conjugation, acetylation, methylation) conjugate those groups for excretion."
  honesty = "The '~50% of drugs metabolised by CYP3A4' figure is a textbook approximation; exact dataset-dependent percentages vary. CYP nomenclature follows the standard cytochrome-P450-superfamily naming convention (family/subfamily/gene)."
  |> "[@x_goodman_gilman]"

@D adme_excretion := "Excretion: renal and biliary routes" :: adme [ok]
  renal = "Renal excretion via glomerular filtration (size/charge selective; free unbound drug only), active tubular secretion (organic-anion and organic-cation transporters — OATs/OCTs), and passive tubular reabsorption (pH-dependent for ionisable drugs)."
  creatinine-clearance = "Creatinine clearance (CrCl) is the workhorse clinical estimate of glomerular filtration. The Cockcroft-Gault equation (Cockcroft & Gault, 1976 Nephron) is the long-standing bedside estimator: CrCl ≈ [(140−age) × weight] / (72 × SerumCr) × (0.85 if female). Subsequent equations (MDRD, CKD-EPI) refine eGFR for clinical CKD staging."
  biliary = "Biliary excretion concentrates drugs (and conjugates) into bile for elimination via faeces, with potential enterohepatic recirculation (bacterial deconjugation by gut flora can re-release the parent drug for reabsorption — extends apparent half-life)."
  era-flag = "Cockcroft & Gault 1976 (Nephron) — primary-author/era cited; equation is era-defining bedside pharmacology."
  |> "[@x_cockcroft_gault_1976]"

# ── §3 Drug-drug interactions: CYP induction and inhibition ──────────

@D ddi_axis := "DDI mechanism axis" :: ddi [ok]
  pharmacokinetic = "Pharmacokinetic DDIs alter the concentration of one drug by changing its ADME (absorption/distribution/metabolism/excretion). The dominant axis clinically is metabolic — CYP induction or inhibition by a co-administered substance."
  pharmacodynamic = "Pharmacodynamic DDIs alter the effect of one drug without changing its concentration — additive/synergistic/antagonistic effects on a shared receptor or pathway (e.g. multiple QT-prolonging agents)."
  transporter = "Transporter-mediated DDIs (P-glycoprotein, BCRP, OATPs) are increasingly recognised in regulatory guidance — substrate, inhibitor and inducer interactions with efflux/uptake transporters can drive clinically significant exposure changes."

@D ddi_cyp3a4_induction := "CYP3A4 induction — rifampicin and St John's Wort" :: ddi [ok]
  rifampicin = "Rifampicin is a potent inducer of CYP3A4 and several other CYPs (via PXR-mediated transcriptional upregulation). Co-administration with CYP3A4 substrates (e.g. many anticoagulants, anti-infectives, hormonal contraceptives, calcineurin inhibitors) can substantially reduce substrate plasma levels and therapeutic effect."
  st-johns-wort = "Hyperforin, a constituent of Hypericum perforatum (St John's Wort), is a PXR agonist and CYP3A4/P-glycoprotein inducer. Clinically significant interactions have been documented with cyclosporine, oral contraceptives, antiretrovirals and warfarin, among others. This is the canonical example of an herbal-pharmaceutical DDI."
  cross-link = "Herbal-drug interactions are a recurring cross-link to the HERBALISM tape — botanicals modulate CYP/transporter activity and are not pharmacokinetically inert."
  honesty = "Specific interaction magnitudes vary by drug, dose and duration; the directional claim (CYP3A4 induction reduces substrate exposure) is robust. Real prescribing requires checking a current interaction database."
  |> "[@x_goodman_gilman]"

@D ddi_cyp3a4_inhibition := "CYP3A4 inhibition — ketoconazole and grapefruit" :: ddi [ok]
  ketoconazole = "Ketoconazole (azole antifungal) is a potent CYP3A4 inhibitor and is frequently used as the canonical 'strong CYP3A4 inhibitor' arm in regulatory DDI studies. Co-administration with sensitive CYP3A4 substrates can raise substrate exposure several-fold."
  grapefruit = "Grapefruit juice inhibits enterocyte CYP3A4 via furanocoumarins (notably bergamottin and 6',7'-dihydroxybergamottin), causing irreversible degradation of intestinal CYP3A4. Effects on enterocyte CYP3A4 can persist for hours to days after a single juice exposure, raising the bioavailability of CYP3A4 substrates (e.g. certain calcium-channel blockers, statins, immunosuppressants)."
  honesty = "Magnitude of grapefruit effect depends on juice quantity, processing, and individual enzyme expression; the mechanism (mechanism-based irreversible CYP3A4 inhibition) is established. Specific drug labels list grapefruit-avoid instructions where clinically relevant."
  |> "[@x_goodman_gilman]"

# ── §4 Receptor and target classes ───────────────────────────────────

@D class_gpcr := "G-protein-coupled receptors (GPCRs)" :: target-class [ok]
  what = "Seven-transmembrane receptors coupled to heterotrimeric G proteins (Gαs/Gαi/Gαq and β/γ subunits) which modulate downstream second messengers (cAMP, IP3/DAG, Ca²⁺). Family includes β-adrenergic, muscarinic, histamine, dopamine, serotonin, opioid, angiotensin, chemokine receptors and many more."
  drug-share = "GPCRs are consistently reported as the largest single class of approved-drug targets — review surveys (e.g. Sriram & Insel 2018, Mol Pharmacol era) commonly report approximately one-third of all FDA-approved drugs target a GPCR. The exact percentage depends on the dataset and counting convention; the directional dominance is robust."
  pharmacology = "GPCR pharmacology supplies many classical receptor-theory examples: full vs partial agonism (morphine vs buprenorphine at μ-opioid), inverse agonism (some H1 antihistamines), biased agonism (ligand-specific signalling pathway bias)."
  era-flag = "Drug-target enumeration figures cited at survey-era level (Sriram & Insel 2018 and predecessors); not asserted as a precise constant."

@D class_nuclear := "Nuclear receptors" :: target-class [ok]
  what = "Ligand-activated transcription factors — bind small lipophilic ligands (steroid hormones, thyroid hormone, vitamin D, retinoic acid, fatty-acid metabolites) and directly modulate gene transcription via DNA response elements."
  examples = "Glucocorticoid receptor (GR — corticosteroids), estrogen receptor (ER — tamoxifen, aromatase inhibitor downstream targets), androgen receptor (AR — antiandrogens), thyroid receptor (TR — thyroxine), progesterone, mineralocorticoid receptors; also PPARs (fibrates, thiazolidinediones), retinoid receptors (retinoic acid)."
  cross-link = "AR pharmacology cross-links to the AGA tape (florea ANDROGENETIC-ALOPECIA.tape); ER pharmacology cross-links to CANCER-THERAPY.tape (endocrine therapy in breast cancer)."

@D class_ion_channel := "Ion channels" :: target-class [ok]
  what = "Membrane proteins forming gated ionic conductances. Subfamilies: voltage-gated (Na+, K+, Ca²⁺, h-channels), ligand-gated (nicotinic AChR, GABA_A, glycine, ionotropic glutamate — NMDA/AMPA/kainate), TRP family, K_ATP, and others."
  drug-examples = "Local anaesthetics block voltage-gated Na+ channels; benzodiazepines positively modulate GABA_A; calcium-channel blockers (dihydropyridines, non-DHPs) target L-type Ca²⁺ channels; sulfonylureas close pancreatic K_ATP channels."

@D class_enzymes := "Enzyme inhibitors and modulators" :: target-class [ok]
  what = "Enzymes as drug targets cover kinases (~tyrosine and serine/threonine — many oncology targets), phosphatases, proteases (HIV protease, thrombin/factor-Xa, ACE), oxidoreductases, hydrolases (acetylcholinesterase, monoamine oxidase), polymerases (DNA, RNA — antiviral and oncology)."
  examples = "Statins inhibit HMG-CoA reductase; ACE inhibitors inhibit angiotensin-converting enzyme; SSRIs are functionally serotonin-reuptake transporter inhibitors (transporter, not classical enzyme); HIV protease inhibitors target the viral aspartyl protease; imatinib inhibits BCR-ABL1 tyrosine kinase (cross-link CANCER-THERAPY.tape)."

@D class_transporter := "Transporters" :: target-class [ok]
  what = "Membrane transport proteins — uptake (SLC family: OATs, OCTs, OATPs, SERT/NET/DAT monoamine transporters) and efflux (ABC family: P-glycoprotein/ABCB1, BCRP/ABCG2, MRPs). Both as drug targets and as PK determinants."
  drug-examples = "SSRIs target SERT; tricyclics target NET/SERT; methylphenidate, cocaine target DAT/NET. ABC transporters are major contributors to multidrug resistance in oncology (efflux of cytotoxics) and to PK variability (intestinal P-gp limits oral exposure of substrates such as digoxin)."

# ── §5 Pharmacogenomics ──────────────────────────────────────────────

@D pgx_cyp2d6 := "CYP2D6 metabolizer phenotypes" :: pharmacogenomics [ok]
  what = "CYP2D6 is among the most polymorphic clinically important CYP enzymes. Population genotyping identifies poor metabolizers (PM — two non-functional alleles), intermediate (IM), extensive/normal (EM), and ultra-rapid metabolizers (UM — gene duplications) with substantial frequency variation across ancestral populations."
  codeine = "Codeine is a CYP2D6 prodrug — O-demethylated to morphine by CYP2D6 for analgesic effect. PMs derive little analgesia; UMs can convert codeine to morphine rapidly enough to produce toxic morphine levels at standard doses (basis of CYP2D6-related codeine label warnings, including paediatric breastfeeding warnings)."
  tamoxifen-debate = "CYP2D6 status has been investigated as a predictor of tamoxifen efficacy via endoxifen formation; the clinical relevance remains debated in the literature."
  honesty = "CYP2D6 phenotype-to-allele mapping is established; the clinical predictive value varies by drug and outcome. CPIC guidelines provide an evidence-graded interface — see [@pgx_cpic]."
  |> "[@x_cpic_guidelines]"

@D pgx_hla_b5701 := "HLA-B*5701 and abacavir hypersensitivity" :: pharmacogenomics [ok]
  what = "Mallal et al. (2008, NEJM) showed in the PREDICT-1 study that prospective HLA-B*5701 screening eliminates immunologically confirmed abacavir hypersensitivity reactions in HIV-1 patients initiating abacavir-containing regimens. This is one of the cleanest examples of pharmacogenomic preemptive screening preventing a drug-specific severe adverse event."
  status = "HLA-B*5701 screening before abacavir is now standard of care in HIV treatment guidelines (cross-link HIV-TREATMENT.tape) and is a CPIC level A recommendation."
  cross-link = "Cross-link to BIOLOGY-MEDICAL meta-domain — HLA pharmacogenomics is the interface where immunology, genetics and pharmacology meet for several severe-cutaneous-adverse-reaction (SCAR) drug-gene pairs (e.g. carbamazepine and HLA-B*1502 in Han Chinese populations)."
  |> "[@x_mallal_2008]"

@D pgx_cpic := "CPIC: Clinical Pharmacogenetics Implementation Consortium" :: pharmacogenomics [ok]
  what = "CPIC is an international consortium publishing peer-reviewed gene-drug clinical guidelines (e.g. CYP2C19-clopidogrel, CYP2D6-codeine, HLA-B-abacavir, TPMT-thiopurines, DPYD-fluoropyrimidines, CYP2C9/VKORC1-warfarin). Guidelines specify how to apply genotype to prescribing decisions when a clinical genetic test result is available."
  scope = "CPIC explicitly addresses 'given the test result, what should be done', rather than 'should the test be ordered'. Updates are continuous; verify the current revision for any clinical use."
  honesty = "Guideline references cited at consortium-family level — specific guidelines are individually published in Clin Pharmacol Ther and indexed on the CPIC website. The directional importance of CPIC guidelines for actionable pharmacogenomics is widely accepted."
  |> "[@x_cpic_guidelines]"

@D pgx_other_polymorphisms := "Other clinically relevant CYP polymorphisms" :: pharmacogenomics [ok]
  cyp2c9 = "CYP2C9 polymorphisms (*2, *3) reduce metabolism of warfarin, phenytoin and certain NSAIDs; combined CYP2C9 + VKORC1 genotype meaningfully shifts warfarin dose requirement and is reflected in pharmacogenomic dosing algorithms."
  cyp2c19 = "CYP2C19 polymorphisms (*2, *3 loss-of-function; *17 gain-of-function) affect clopidogrel activation (PM = reduced antiplatelet response, basis of the FDA 'boxed-warning era' label update on clopidogrel) and PPI metabolism. Population frequency varies markedly by ancestry."
  era-flag = "Specific polymorphism-frequency figures and clinical-impact magnitudes are population- and outcome-specific; cited generally and via CPIC, not as fixed numbers."
  |> "[@x_cpic_guidelines]"

# ── §6 R&D productivity context (cross-link BIO-PHARMA) ──────────────

@D rd_eroom := "Eroom's Law — declining productivity context for pharmacology" :: economics [ok]
  what = "Scannell et al. (2012, Nature Reviews Drug Discovery) documented that the number of new drugs approved per inflation-adjusted billion US dollars of R&D spend has halved approximately every 9 years since 1950 — termed 'Eroom's Law' (Moore's Law backwards)."
  why-here = "Better pharmacology — receptor specificity, ADME prediction, pharmacogenomic patient selection, biomarker-driven trials — is one of the principal proposed routes to bending this productivity curve. The productivity context belongs to the BIO-PHARMA pipeline tape; pharmacology contributes the scientific levers."
  cross-link = "Cross-link to BIO-PHARMA.tape [@x_scannell_2012] / dx_pipeline_overview / econ_erooms_law — pharmacology is one input to the pipeline economics, not the whole story."
  |> "[@x_scannell_2012]"

# ── §7 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_narrow_ti := "narrow therapeutic-index drugs require monitoring" :: real-limit [ok required]
  wall = "HARD WALL (pharmacological)"
  statement = "Cytotoxics (oncology chemotherapy) and several non-oncology drugs (warfarin, lithium, digoxin, phenytoin, theophylline historically, aminoglycosides) operate close to their dose-toxicity threshold — the gap between effective and toxic plasma levels is small. Therapeutic drug monitoring (TDM), dose-titration to laboratory or clinical endpoints, and pharmacogenomic dosing (warfarin/CYP2C9-VKORC1) exist precisely to manage this limit."
  consequence = "The therapeutic-index ceiling caps achievable safe efficacy for these agents regardless of formulation refinement. No lattice value modifies it — it is set by the underlying receptor/target pharmacology and population variability ([@lim_pk_variability])."
  |> "[@x_goodman_gilman]"

@D lim_idiosyncratic_ae := "idiosyncratic adverse events: floor on safety prediction" :: real-limit [ok required]
  wall = "STATISTICAL HARD WALL (sample-size bounded)"
  statement = "Idiosyncratic adverse events (immune-mediated severe cutaneous reactions, drug-induced liver injury, agranulocytosis) typically occur at frequencies of approximately 1 in 1,000 to 1 in 100,000 patient-exposures or rarer. Pre-approval clinical trials with sample sizes in the thousands cannot reliably detect adverse events rarer than approximately 1 in (sample size / 3) — a direct consequence of the 'rule of three' for upper confidence bounds on unobserved events."
  consequence = "Phase IV pharmacovigilance and post-marketing real-world evidence are structural necessities, not optional add-ons. A drug can be 'safe' through Phase III and reveal an idiosyncratic AE only after broad use. This is a statistical limit on pre-market detection, not a regulatory failure."
  cross-link = "Cross-link to BIO-PHARMA.tape dx_phase4 / lim_clinical_attrition — the structural reason post-marketing surveillance exists."
  honesty = "Specific idiosyncratic-AE frequency ranges are illustrative; exact rates are drug-specific and dataset-specific."

@D lim_pk_variability := "individual PK variability: CYP polymorphisms + renal function + age" :: real-limit [ok required]
  wall = "HARD WALL (biological — host-intrinsic)"
  statement = "Inter-individual variability in drug concentrations at standard doses can span an order of magnitude or more. Drivers include CYP polymorphisms (CYP2D6 PM/UM, CYP2C9, CYP2C19 — see [@pgx_cyp2d6], [@pgx_other_polymorphisms]); renal function (creatinine clearance varies with age, sex, body mass — Cockcroft-Gault era, [@x_cockcroft_gault_1976]); hepatic function and disease state; age (paediatric and geriatric extremes); protein binding alterations (low albumin, AAG induction); and concomitant medications driving DDIs (§3)."
  consequence = "One-size-fits-all dosing is a population approximation; clinically important variability persists. Pharmacogenomic guidance (CPIC) and therapeutic drug monitoring address parts of this — they do not abolish it."
  |> "[@x_cpic_guidelines]"

@D lim_animal_translation := "animal-model translational gap" :: real-limit [ok required]
  wall = "HARD WALL (biological)"
  statement = "Preclinical species (mouse, rat, dog, monkey) differ from humans in target-receptor pharmacology, CYP isoform profiles, plasma protein binding, transporter expression, immune-system composition, and microbiome — all of which affect PK/PD translation. Animal models predict human pharmacokinetics imperfectly and disease-response even less reliably; Phase II is where this gap is most often exposed."
  consequence = "Preclinical pharmacology is a regulatory and scientific step, not a guarantee of human efficacy or safety. This limit is the pharmacological lens on the broader R&D attrition problem covered in BIO-PHARMA.tape."
  cross-link = "Cross-link to BIO-PHARMA.tape lim_animal_gap / lim_clinical_attrition / lim_phase2_attrition."
  |> "[@x_scannell_2012]"

# ── §8 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-pharmacology" :: governance [required deny:write]
  pattern = "Deriving pharmacology facts (bioavailability percentages, adverse-event rates, selectivity, dose-response slopes, CYP isoform counts, receptor-class counts, pharmacogenomic effect sizes) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's '생체이용율=95% because σ·sopfr/10' / '부작용=4% because τ=4' / '선택성=95% because σ=12' / '6대 핵심 지표 = n=6' / 'σ·φ=n·τ=24 core identity'."
  why = "This is exactly the violation the pre-rewrite PHARMACOLOGY.tape committed (lattice-tautology stub, mass-split 153b5a2 — see PHARMACOLOGY.log.tape audit). hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3 forbid it. Pharmacology is empirical pharmacological science with established quantitative frameworks (mass-action, Hill, ADME, CYP pharmacokinetics, CPIC pharmacogenomics) — lattice constants bear no causal relationship to receptor affinities, metabolic clearances, adverse-event frequencies, or pharmacogenomic effect sizes."
  remedy = "Cite real pharmacology / clinical-pharmacology / pharmacogenomics literature (this tape's @X entries) and standard pharmacology textbooks (Goodman & Gilman, Katzung). The lattice may only be a coincidental OBSERVATION, never a derivation source for any pharmacological claim."

@N n6_honest_stance := "pharmacology has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: pharmacology exposes NO natural n=6 invariant. The cytochrome P450 superfamily has dozens of human isoforms with about five to seven of pre-eminent clinical importance — not 6 by derivation. Receptor target classes commonly enumerated for approved drugs include GPCRs, ion channels, nuclear receptors, enzymes, and transporters — the count and grouping depend on the survey, not on the lattice. Dose-response curve parameters (EC50, E_max, Hill n, threshold) are empirical fits, not lattice constants. ED50/TD50 and therapeutic index are population ratios, not lattice ratios. CYP2D6 metabolizer phenotype categories (PM/IM/EM/UM) are clinical bins, not n=6 quanta. CPIC guidelines are evidence-graded human-curated documents, not lattice products. Coincidences between any pharmacology figure and lattice constants (σ=12, τ=4, φ=2, J₂=24) are OBSERVATIONS ONLY, never derivations — per LATTICE_POLICY g1/g2 + lattice-as-tool. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ── §9 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 CYP3A4 inducer reduces sensitive-substrate exposure" :: prediction [ok]
  claim = "Co-administration of a strong CYP3A4 inducer (rifampicin, or sustained St John's Wort use) with a sensitive CYP3A4 substrate (e.g. an oral contraceptive ethinylestradiol component, or a calcineurin inhibitor) will produce a clinically meaningful reduction in substrate plasma exposure (AUC) compared to substrate alone, in adequately designed PK studies in humans."
  falsifier = "If a properly designed and adequately powered DDI study showed no AUC change in a sensitive CYP3A4 substrate when co-administered with rifampicin at induction doses, the established CYP3A4-induction mechanism (FDA DDI guidance / Goodman & Gilman) would be wrong."
  source = "[@x_goodman_gilman]"

@D tp_2 := "TP-2 HLA-B*5701 screening eliminates abacavir hypersensitivity" :: prediction [ok]
  claim = "Prospective HLA-B*5701 screening before abacavir initiation, with abacavir avoidance in carriers, will yield approximately zero immunologically confirmed abacavir hypersensitivity reactions — as observed in the PREDICT-1 trial (Mallal et al. 2008, NEJM)."
  falsifier = "If a prospective study screening with HLA-B*5701 and excluding carriers reported a non-trivial rate of immunologically confirmed abacavir hypersensitivity in screen-negative patients, the established HLA-B*5701 mechanism would require revision."
  source = "[@x_mallal_2008]"

@D tp_3 := "TP-3 CYP2D6 ultra-rapid metabolizers and codeine" :: prediction [ok]
  claim = "Patients with CYP2D6 ultra-rapid metabolizer genotypes show higher peak plasma morphine concentrations after a standard codeine dose than CYP2D6 normal metabolizers — the pharmacogenomic basis of paediatric and post-tonsillectomy codeine label warnings."
  falsifier = "If a properly designed CYP2D6-stratified PK study of codeine showed no difference in plasma morphine concentration between UM and EM phenotypes, the established CYP2D6-codeine-morphine activation pathway would be wrong."
  source = "[@x_cpic_guidelines]"

# ── §10 External citations (real, landmark literature) ───────────────

@X x_clark_1933 := "Clark AJ 1933" :: literature [active]
  ref = "Clark AJ. The Mode of Action of Drugs on Cells. London: Edward Arnold & Co.; 1933. (drug-receptor mass-action — foundational quantitative pharmacology monograph)"

@X x_stephenson_1956 := "Stephenson RP 1956" :: literature [active]
  ref = "Stephenson RP. A modification of receptor theory. Br J Pharmacol Chemother 1956. (efficacy / intrinsic activity distinction from affinity — primary-author/era; exact volume per Br J Pharmacol Chemother 1956)"

@X x_black_stephenson_1962 := "Black JW, Stephenson JS 1962" :: literature [active]
  ref = "Black JW, Stephenson JS. Pharmacology of a new adrenergic beta-receptor-blocking compound (Nethalide). Lancet 1962;2:311–314. (the line of work leading to propranolol — proof of receptor pharmacology as a basis for rational drug design; James Black, 1988 Nobel Prize in Physiology or Medicine)"

@X x_hill_1910 := "Hill AV 1910" :: literature [active]
  ref = "Hill AV. The possible effects of the aggregation of the molecules of haemoglobin on its dissociation curves. J Physiol 1910;40:iv–vii. (the Hill equation — cooperative oxygen binding to haemoglobin; the same functional form is reused throughout pharmacology dose-response analysis)"

@X x_cockcroft_gault_1976 := "Cockcroft DW, Gault MH 1976" :: literature [active]
  ref = "Cockcroft DW, Gault MH. Prediction of creatinine clearance from serum creatinine. Nephron 1976;16:31–41. (bedside CrCl estimating equation — primary-author/era; widely used historical baseline for renal dose adjustment)"

@X x_mallal_2008 := "Mallal S et al 2008" :: literature [active]
  ref = "Mallal S, Phillips E, Carosi G, et al. HLA-B*5701 screening for hypersensitivity to abacavir. N Engl J Med 2008;358:568–579. (PREDICT-1 — prospective HLA-B*5701 screening eliminates immunologically confirmed abacavir hypersensitivity; canonical pharmacogenomics-prevents-AE landmark)"

@X x_scannell_2012 := "Scannell JW et al 2012" :: literature [active]
  ref = "Scannell JW, Blanckley A, Boldon H, Warrington B. Diagnosing the decline in pharmaceutical R&D efficiency. Nature Reviews Drug Discovery 2012;11:191–200. (Eroom's Law — halving of new drugs per R&D dollar every ~9 years; cross-linked from BIO-PHARMA.tape)"

@X x_goodman_gilman := "Goodman & Gilman textbook (era-flagged)" :: literature [active]
  ref = "Brunton LL, Hilal-Dandan R, Knollmann BC (eds). Goodman & Gilman's The Pharmacological Basis of Therapeutics. McGraw-Hill, multiple editions (1st edition Goodman & Gilman 1941; current editions revised approximately every five years). Era-flagged textbook citation: the canonical reference for receptor theory (mass action, efficacy, dose-response), ADME (bioavailability, first-pass, CYP metabolism, renal clearance), drug-drug interactions (CYP induction/inhibition), and therapeutic-index framing used throughout this tape. Specific edition not asserted; the directional pharmacology content is stable across editions."

@X x_cpic_guidelines := "CPIC guideline family" :: literature [active]
  ref = "Clinical Pharmacogenetics Implementation Consortium (CPIC). Guideline family covering gene-drug pairs including (selected) CYP2D6-codeine, CYP2D6-opioids, CYP2C19-clopidogrel, CYP2C9/VKORC1-warfarin, CYP2C19-SSRIs, HLA-B-abacavir, TPMT-thiopurines, DPYD-fluoropyrimidines. Published in Clinical Pharmacology & Therapeutics and indexed on cpicpgx.org; updated continuously. Document-family citation; specific guideline revisions evolve — verify current version for any clinical use. Era-flag: CPIC formal guideline-publication era began approximately 2011; the consortium-family reference is widely accepted in clinical pharmacogenomics."
