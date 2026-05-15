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
# BIO-PHARMA.tape — architecture-current (editable per v1.2)
# Event history → BIO-PHARMA.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "bio-pharma" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · bio-pharma in-silico knowledge SSOT"
  brief = "Drug development pipeline biology + R&D economics + regulatory pathway landscape · evidence-based · real-limits anchored · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  scope = "in-silico knowledge SSOT · NOT prescribing / clinical / investing advice"
  sibling-log = "BIO-PHARMA.log.tape"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see BIO-PHARMA.log.tape audit"

@N scope_disclaimer := "pharma pipeline knowledge SSOT — scope honesty" :: note [required]
  text = "This tape is an evidence-summary knowledge SSOT for the meta-domain of pharmaceutical development: how drugs are discovered, developed, approved, and why that process fails so often. Drug efficacy/cost/timeline figures are paraphrased from published literature for modeling context only — they are NOT prescribing guidance, NOT investment advice, and NOT regulatory advice for a specific program. The domain is the PIPELINE (target ID → NDA/BLA) and its structural economics — not specific therapeutic claims (those belong in CANCER-THERAPY.tape, HIV-TREATMENT.tape, VACCINE.tape etc.). All claims here are in-silico simulator/metadata consistency only; hexa-bio AGENTS.tape g8 / f2 apply."

# ── §1 What the drug development pipeline is ─────────────────────────

@D dx_pipeline_overview := "drug development pipeline: canonical staged process" :: domain [ok]
  summary = "Pharmaceutical drug development is a staged, high-attrition process from biological-target identification to marketed medicine, governed by regulatory agencies requiring evidence of safety and efficacy before public use."
  stages = "Target ID → Target Validation → Hit Discovery (HTS) → Hit-to-Lead → Lead Optimization → Preclinical (PK/PD/toxicology) → IND filing → Phase I (safety/dosing) → Phase II (efficacy signal) → Phase III (pivotal) → NDA/BLA filing → Regulatory Review → Approval → Phase IV (post-marketing)."
  why-staged = "Each stage applies a progressively higher evidentiary standard; stages are not an n-tuple derived from an invariant — the number of regulatory stages varies by jurisdiction, disease area, and pathway designation (breakthrough, accelerated, adaptive). Stage count is NOT lattice-derived. See [@f_lattice_fit]."
  |> "[@x_paul_2010]"

@D dx_target_id_validation := "target identification and validation" :: domain [ok]
  target-id = "Target identification: the process of identifying a molecular entity (protein, RNA, pathway node) whose modulation could produce a therapeutically useful effect. Sources include genetics (GWAS, Mendelian randomisation), functional genomics, proteomics, phenotypic screening."
  target-validation = "Target validation: establishing that modulation of the target DOES produce the hypothesised effect in relevant biological models. Validation grades range from in-vitro (lowest) through animal models to genetic human evidence (strongest, e.g. loss-of-function human carriers)."
  mendelian-randomisation = "Mendelian randomisation uses genetic variants as proxies for lifetime target exposure; targets with human genetic validation have materially higher clinical success rates than those without."
  failure-mode = "Many clinical-stage failures trace back to inadequate target validation; the 'druggable genome' is smaller than the 'genome' — not every target is tractable to a small molecule or biologic."
  |> "[@x_munos_2009] · [@x_paul_2010]"

@D dx_hts_hit_to_lead := "high-throughput screening and hit-to-lead" :: domain [ok]
  hts = "High-throughput screening (HTS): automated testing of large compound libraries (often 10^5–10^6 compounds) against a target assay to identify 'hits' — molecules showing activity at a threshold. Hit rate is typically a small percentage of the library; most hits fail secondary confirmation."
  hit-to-lead = "Hit-to-lead: confirmed hits are characterised for selectivity, potency, solubility, and preliminary ADMET properties; a subset becomes 'leads' with sufficiently drug-like profiles for chemical optimization."
  phenotypic-vs-target = "Phenotypic screening (optimise for cellular or organism-level effect without a predefined target) and target-based screening are complementary strategies; neither dominates for all therapeutic areas."

@D dx_lead_optimization := "lead optimization" :: domain [ok]
  process = "Medicinal chemists iterate on a lead series to simultaneously improve potency, selectivity, metabolic stability, solubility, and toxicological profile — a multi-parameter optimization problem in high-dimensional chemical space."
  admet = "ADMET = absorption, distribution, metabolism, excretion, toxicity. These properties must be optimised in parallel with pharmacodynamic potency; improving one axis often degrades another — the 'ADMET ceiling' is a real limit, not a derivable number."
  attrition-source = "Lead optimization is the stage at which many programs fail or stall indefinitely; the tractability of chemical space around a given target is not guaranteed."

@D dx_preclinical := "preclinical development (PK/PD/toxicology)" :: domain [ok]
  pk_pd = "Pharmacokinetics (PK): what the body does to the drug (absorption, distribution, metabolism, excretion). Pharmacodynamics (PD): what the drug does to the body (target engagement, downstream effect). PK/PD modelling links dose to exposure to effect — informs first-in-human dose selection."
  tox = "Regulatory-package toxicology: single-dose, repeat-dose (subchronic/chronic as required by ICH M3 guidelines), genetic toxicology (Ames test, chromosomal aberration), safety pharmacology (cardiac — hERG/ICH S7B), reproductive/developmental toxicity (ICH S5) — required before IND submission."
  animal-models = "Preclinical animal models are required but often poor translational proxies for human disease response — a genuine hard limit. See [@lim_animal_gap]."
  ind = "A successful preclinical package supports an Investigational New Drug (IND) application to the FDA (21 CFR Part 312) — or equivalent EMA/national CTA — to begin human trials."
  |> "[@x_fda_21cfr_312] · [@x_ich_guidelines]"

# ── §2 Clinical development (Phase I → III) ──────────────────────────

@D dx_phase1 := "Phase I clinical trials (first-in-human)" :: domain [ok]
  purpose = "Establish safety, tolerability, PK and dose range in a small number of subjects (typically 20–100). Usually healthy volunteers for non-oncology; patients for oncology (due to toxicity profile)."
  endpoints = "Maximum tolerated dose (MTD) or biologically effective dose; dose-limiting toxicities (DLTs); PK parameters (Cmax, AUC, half-life); preliminary PD markers."
  attrition = "Phase I is generally the most tolerated stage in terms of scientific attrition; most failures here are unexpected toxicity or unacceptable PK."
  honesty = "Phase I is primarily a safety/dose-ranging exercise, NOT an efficacy experiment — do not conflate Phase I 'signals' with evidence of efficacy."

@D dx_phase2 := "Phase II clinical trials (proof of concept / dose selection)" :: domain [ok]
  purpose = "Demonstrate a signal of efficacy in the target patient population; refine dose and regimen; identify preliminary efficacy biomarkers."
  design = "Often randomised controlled (vs placebo or active comparator), 100–500 patients, shorter duration. May be split into Phase IIa (proof-of-concept) and IIb (dose-ranging)."
  attrition = "Phase II is the highest-attrition stage. Hay et al. (2014) estimated clinical-development success rates from Phase I through approval; Phase II is where most 'biological hypotheses' fail in patients. See [@lim_phase2_attrition]."
  |> "[@x_hay_2014]"

@D dx_phase3 := "Phase III clinical trials (pivotal)" :: domain [ok]
  purpose = "Establish efficacy and safety with sufficient power and duration to support a regulatory submission (NDA/BLA/MAA); typically the basis for labelling."
  design = "Randomised, often double-blind, controlled; typically 1,000–10,000+ patients; primary endpoint agreed with regulator; ICH E9 statistical guidance governs pre-specified analysis."
  cost-driver = "Phase III is the dominant cost driver in drug development. Paul et al. (2010) estimated total out-of-pocket cost for a new drug at approximately $872M (with costs of capital, estimated total ~ $1.8B as of that era). These figures are era-specific and have been updated by subsequent DiMasi analyses — see [@x_paul_2010] and [@x_dimasi_series]."
  note = "The number of Phase III trials, their size, duration and control arm are disease-area-specific regulatory expectations, not lattice invariants."
  |> "[@x_paul_2010] · [@x_hay_2014] · [@x_ich_guidelines]"

@D dx_nda_bla := "regulatory submission: NDA / BLA / MAA" :: domain [ok]
  nda = "New Drug Application (NDA) — FDA submission for a small-molecule drug under 21 CFR Part 314. Includes all clinical, preclinical, CMC (chemistry, manufacturing and controls) data."
  bla = "Biologics License Application (BLA) — FDA submission for a biologic (protein, mAb, gene therapy, etc.) under 21 CFR Part 600. Distinct from NDA; CMC requirements for biologics are substantially more complex (cell banks, post-translational modifications, comparability)."
  maa = "Marketing Authorisation Application (MAA) — the EMA centralised procedure equivalent. Centralised procedure covers most novel drugs/biologics; decentralised and mutual-recognition procedures exist for member-state routes."
  review = "Standard FDA review timeline is 10 months (PDUFA) after filing acceptance; Priority Review (serious conditions with unmet need) is 6 months. PDUFA cycle targets are agreed every 5 years."
  |> "[@x_fda_21cfr_314] · [@x_fda_21cfr_600] · [@x_fda_21cfr_312]"

@D dx_phase4 := "Phase IV: post-marketing surveillance and studies" :: domain [ok]
  what = "Phase IV encompasses mandatory (as conditions of approval) and voluntary post-marketing studies: pharmacovigilance, REMS (Risk Evaluation and Mitigation Strategies) programs, comparative effectiveness, rare-AE detection, and health-technology assessment (HTA)."
  real-world = "Real-world evidence (RWE) from EHR, claims and registry data is increasingly used to supplement or, in specific contexts, substitute for traditional RCT evidence in post-market settings — FDA and EMA have published frameworks."
  safety-signal = "Post-marketing surveillance routinely identifies safety signals not apparent in pre-approval trials (sample-size / duration / population-selection limits of Phase III). This is a structural feature of the development system, not a failure of pre-market review."

# ── §3 Therapeutic modality landscape ────────────────────────────────

@D mod_small_molecule := "small molecule drugs" :: modality [ok]
  definition = "Chemically synthesized organic compounds of typically low molecular weight (<900 Da) that can be absorbed orally and often penetrate cell membranes to reach intracellular targets."
  advantages = "Oral bioavailability; chemical diversity for targeting many protein classes; established manufacturing; low COGS at scale; long history of regulatory precedent."
  limits = "Cannot address flat protein-protein interaction surfaces or highly dynamic targets (PPI space remains largely undrugged). Selectivity within gene families (kinase, GPCR) is a recurring medicinal-chemistry challenge."
  |> "[@x_paul_2010] · [@x_munos_2009]"

@D mod_biologic_mab := "biologics — monoclonal antibodies (mAb)" :: modality [ok]
  definition = "Protein-based therapeutics produced in mammalian cell culture; mAbs bind with high specificity and affinity to extracellular or surface targets."
  classes = "Full mAbs, Fab/Fv fragments, bispecifics, nanobodies. Formats include IgG1/2/4 backbones with distinct effector profiles."
  manufacturing = "CMC complexity is substantially higher than small molecules: cell bank qualification, glycosylation control, comparability bridging for manufacturing changes — the basis for biosimilar regulatory complexity."
  landmark = "Trastuzumab (Herceptin; Slamon 2001) established the mAb paradigm in oncology — HER2-targeted; adalimumab (Humira) became one of the best-selling drugs globally in inflammatory disease."
  limits = "Generally require parenteral administration; higher COGS than small molecules at similar doses; immunogenicity (anti-drug antibodies) is a real-world phenomenon. See [@lim_manufacturing_cmc]."
  |> "[@x_paul_2010]"

@D mod_adc := "antibody-drug conjugates (ADC)" :: modality [ok]
  definition = "Hybrid molecules: a mAb (conferring target selectivity) linked via a chemical linker to a cytotoxic payload (conferring cell-killing potency). Design space covers linker chemistry (cleavable/stable), payload class, drug-antibody ratio (DAR)."
  rationale = "Aim to deliver cytotoxin selectively to antigen-bearing tumour cells while sparing normal tissue — an attempt to improve the therapeutic index of cytotoxic chemotherapy."
  landmarks = "Brentuximab vedotin (Adcetris; CD30 × MMAE) and ado-trastuzumab emtansine (Kadcyla/T-DM1; HER2 × DM1) are regulatory precedents. The ADC field expanded substantially post-2010 with improved linker/payload science."
  limits = "Linker instability (bystander killing), payload heterogeneity, antigen-loss resistance, complex CMC (3-component conjugation consistency). Therapeutic index improvements are real but bounded."

@D mod_peptide := "peptide therapeutics" :: modality [ok]
  definition = "Linear or cyclic amino-acid polymers (typically 2–50 residues) as drugs — intermediate between small molecules and biologics in size and properties."
  examples = "GLP-1 receptor agonists (semaglutide, liraglutide — landmark metabolic medicine outcomes), cyclosporine (cyclic peptide, immunosuppression), octreotide."
  limits = "Typically low oral bioavailability without formulation innovation (degradation, permeation); usually parenteral or modified delivery required. Proteolytic stability is the primary medicinal-chemistry axis."

@D mod_gene_therapy := "gene therapy (AAV / lentiviral vectors)" :: modality [ok]
  definition = "Delivery of nucleic-acid cargo to modify or replace defective gene function. Major vector platforms: adeno-associated virus (AAV) for in-vivo delivery; lentiviral vectors (LV) for ex-vivo cell modification."
  cross-link = "AAV and LV are viral vectors — directly cross-linked to HEXA-VIROCAPSID axis (hexa-bio virocapsid substrate). Capsid biology (tropism, immunogenicity, payload capacity) is the engineering constraint."
  aav-limits = "AAV payload capacity ~4.7 kb; pre-existing neutralizing antibodies against specific AAV serotypes are prevalent in the human population and can exclude patients from AAV gene therapy trials; manufacturing scale remains a major CMC challenge; long-term durability data are still accumulating."
  lv-limits = "Lentiviral vectors integrate into the genome (insertional mutagenesis risk, historically seen with gamma-retroviral vectors; LV have lower integration-site propensity for active promoters but risk is not zero); ex-vivo cell therapy manufacturing adds complexity."
  landmarks = "Voretigene neparvovec (Luxturna; AAV2, RPE65 for LCA — first FDA-approved in-vivo AAV gene therapy, 2017); hemophilia gene therapy programs; SMA (zolgensma)."
  |> "[@x_paul_2010]"

@D mod_cell_therapy := "cell therapy (CAR-T, autologous / allogeneic)" :: modality [ok]
  definition = "Administration of living cells — either patient's own (autologous) or donor-derived (allogeneic) — often genetically engineered to recognise and kill target cells."
  cart = "CAR-T: T cells expressing a chimeric antigen receptor. CD19 CAR-T (tisagenlecleucel, axicabtagene) demonstrated deep responses in relapsed/refractory B-ALL and B-cell lymphomas. Maude et al. (2014) reported landmark results in paediatric B-ALL."
  autologous-limits = "Autologous manufacturing is patient-specific, logistically intensive, and typically weeks-long — a structural access barrier. Vein-to-vein time and manufacturing failure are real-world problems."
  allogeneic = "Allogeneic ('off-the-shelf') CAR-T eliminates the autologous manufacturing bottleneck but must engineer out graft-versus-host disease and immune rejection — active area of development."
  limits = "Cytokine release syndrome (CRS) and immune effector cell-associated neurotoxicity syndrome (ICANS) are life-threatening toxicities requiring specialised management. Antigen-loss relapse occurs. Solid tumour extension is limited by the immunosuppressive microenvironment."
  |> "[@x_maude_2014]"

@D mod_oligonucleotide := "oligonucleotide therapeutics (siRNA / ASO)" :: modality [ok]
  definition = "Short synthetic nucleic-acid sequences that modulate gene expression post-transcriptionally."
  sirna = "Small interfering RNA (siRNA): double-stranded, triggers RISC-mediated mRNA degradation → silences gene expression. Patisiran (Adams et al. 2018 NEJM) — the first FDA-approved siRNA drug — demonstrated clinical benefit in TTR amyloidosis, validating the platform after ~15 years of development effort."
  aso = "Antisense oligonucleotides (ASO): single-stranded, bind target mRNA via Watson-Crick base-pairing; can sterically block translation or recruit RNase H for mRNA degradation, or modulate splicing (e.g. nusinersen in SMA)."
  delivery = "Delivery remains the dominant challenge: unmodified oligonucleotides are rapidly degraded by nucleases and have poor cell-membrane penetration; chemical modifications (2'-OMe, LNA, phosphorothioate backbone) and delivery vehicles (GalNAc conjugates for hepatic delivery, LNPs) have partially addressed hepatic and some CNS targets; extra-hepatic delivery remains a frontier."
  |> "[@x_adams_2018]"

@D mod_mrna := "mRNA therapeutics and vaccines" :: modality [ok]
  definition = "Synthetic messenger RNA encoding a protein of interest, delivered (typically via lipid nanoparticles) to instruct cells to produce that protein transiently."
  vaccines = "COVID-19 mRNA vaccines (BNT162b2, mRNA-1273) represented the first large-scale clinical validation of mRNA technology — concept dating to Wolff et al. 1990 and Katalin Karikó's nucleoside-modification work. See era context: Karikó era, Nobel Prize 2023."
  therapeutic = "mRNA therapeutics (not just vaccines) for protein-replacement (rare diseases) and personalised cancer neo-antigen vaccines are active programs. Platform flexibility (encode any protein; no DNA-integration risk) is the core advantage."
  limits = "Lipid nanoparticle delivery drives hepatic tropism for most current platforms; extra-hepatic delivery is in development. mRNA is inherently transient — multiple dosing required for chronic conditions. Immunogenicity of LNPs and immunostimulatory properties of mRNA (partly managed by nucleoside modification) are design constraints."
  honesty = "mRNA platform figures, vaccine efficacy percentages, and supply-chain unit economics are context-specific and time-specific — no single number is asserted here; cited at era/author level."

# ── §4 R&D economics: Eroom's Law and the productivity crisis ────────

@D econ_erooms_law := "Eroom's Law — the R&D productivity decline" :: domain [ok]
  statement = "Scannell et al. (2012) documented 'Eroom's Law': the number of new drugs approved per billion US dollars of R&D expenditure has halved approximately every 9 years since the 1950s — the inverse of Moore's Law. This is an empirical macroeconomic observation, not a theoretical prediction."
  causes = "The authors proposed four contributing mechanisms: the 'better than the Beatles' problem (high efficacy standard for drugs treating well-managed conditions); the 'cautious regulator' problem (rising safety bar post-thalidomide); the 'throw money at it' tendency (escalating R&D spend on diminishing returns); and the 'basic research-brute force' bias (increasing clinical complexity not matched by scientific insight)."
  honesty = "The causal attribution remains contested; the empirical productivity decline is robust. No single lattice value captures it."
  |> "[@x_scannell_2012]"

@D econ_cost_new_drug := "cost of developing a new drug (era-flagged)" :: domain [ok]
  paul_2010 = "Paul et al. (2010) estimated the total out-of-pocket cost per approved drug at approximately $872M (2005–2009 sample), rising to ~$1.8B when cost of capital (time value of money during development) is included. Phase III costs dominate."
  dimasi_series = "DiMasi and colleagues have published successive cost-of-drug-development estimates over several decades. Later estimates (DiMasi, circa 2016) using similar methodology estimated total capitalised cost >$2.5B. These figures use pharmaceutical company internal data and are subject to debate on methodology, discount rates, and sample selection. See [@x_dimasi_series]."
  era-flag = "All cost figures are era-specific and company-sample-specific. The directional claim (drug development costs are high and rising) is robust; the exact figures should be read with the publication date and methodology in mind. No figure here is derived from a lattice."
  |> "[@x_paul_2010] · [@x_dimasi_series]"

@D econ_munos_productivity := "innovation patterns in drug R&D" :: domain [ok]
  statement = "Munos (2009) documented that the pharmaceutical industry has approved an approximately constant number of new molecular entities per year over decades, despite massively increased R&D spending — an 'innovation constant' suggesting structural inefficiency rather than a simple resource problem."
  implication = "Scientific productivity is not proportional to spending; this is a real structural limit, not a lattice derivation."
  |> "[@x_munos_2009]"

@D econ_reproducibility := "reproducibility crisis in preclinical research" :: domain [ok]
  statement = "A series of landmark analyses documented widespread failure to reproduce preclinical biomedical findings. Begley & Ellis (2012) reported that Amgen scientists were able to reproduce only 6 of 53 'landmark' cancer biology papers in internal replication attempts — approximately 11%. Prinz et al. (2011 — era; Bayer internal study) reported approximately 25% reproducibility of published cancer biology findings that informed internal drug projects."
  ioannidis = "Ioannidis (2005, PLoS Medicine) provided a statistical framework ('Why most published research findings are false') — under realistic prior probabilities and study sizes, the majority of positive published findings in many biomedical fields are false positives. This is a structural feature of small-sample, high-multiple-testing research, not a laboratory-specific failure."
  consequence = "Irreproducible preclinical findings that advance into drug development consume significant capital on a false biological premise — a direct contributor to clinical attrition."
  honesty = "The 6/53 and ~25% figures are from specific internal replication exercises with specific study samples; the directional message (substantial preclinical irreproducibility) is widely accepted; the exact figures should be read with that context."
  |> "[@x_begley_2012] · [@x_prinz_2011] · [@x_ioannidis_2005]"

# ── §5 Regulatory landscape (FDA, EMA, ICH) ──────────────────────────

@D reg_fda_nda_bla := "FDA NDA and BLA pathways (21 CFR Parts 314 / 600)" :: regulation [ok]
  nda = "New Drug Application: 21 CFR Part 314 governs FDA review of small-molecule drugs. Submission sections include administrative/drug-substance/drug-product CMC, nonclinical (preclinical toxicology + pharmacology), clinical pharmacology, integrated clinical data (safety + efficacy), proposed labelling."
  bla = "Biologics License Application: 21 CFR Part 600 and associated sections govern biologic approval. The threshold is safety, purity, and potency. CMC requirements for biologics are substantially more elaborate than small-molecule NDAs."
  standard-review = "Standard PDUFA (Prescription Drug User Fee Act) review goal: 10 months from filing date to action. Priority Review (serious unmet-need condition with potential advantage): 6-month goal."
  accelerated = "FDA accelerated approval (21 CFR Part 312 Subpart E for IND; 21 CFR Part 314 Subpart H): allows approval on a surrogate endpoint reasonably likely to predict clinical benefit, with post-market confirmatory trials required."
  honesty = "21 CFR citations are to the relevant part/subpart; specific regulation text evolves through rulemaking. Verify current CFR editions for any real program."
  |> "[@x_fda_21cfr_314] · [@x_fda_21cfr_600] · [@x_fda_21cfr_312]"

@D reg_ind := "Investigational New Drug (IND) application (21 CFR Part 312)" :: regulation [ok]
  what = "The IND is the regulatory gateway to beginning clinical trials in the US. The sponsor submits the preclinical safety package, CMC information, investigational plan, and investigator information. FDA has 30 days to place a clinical hold; absent a hold, the sponsor may proceed."
  types = "Commercial IND (sponsor-held, for drug development); Investigator IND (a physician investigator's own study); Emergency IND; and Expanded Access / Compassionate Use IND."
  cross-jurisdiction = "EMA equivalent: Clinical Trial Application (CTA) to the national competent authority + Ethics Committee. ICH M3(R2) harmonises the nonclinical package required to support first-in-human studies across major jurisdictions."
  |> "[@x_fda_21cfr_312] · [@x_ich_guidelines]"

@D reg_ema_centralised := "EMA centralised procedure (MAA)" :: regulation [ok]
  what = "The EMA's centralised procedure is mandatory for new active substances for cancer, HIV/AIDS, diabetes, neurodegenerative diseases, autoimmune diseases, rare diseases (Orphan), and advanced-therapy medicinal products (ATMPs — gene therapy, somatic cell therapy, tissue-engineered products). Optional for other new active substances."
  chmp = "The Committee for Medicinal Products for Human Use (CHMP) reviews the Marketing Authorisation Application (MAA) dossier. Standard review is 210 active assessment days (with clock-stops for sponsor responses to questions). Conditional marketing authorisation, exceptional circumstances, and accelerated assessment are available designations analogous to FDA mechanisms."
  atmp = "Advanced Therapy Medicinal Products (ATMPs) — gene therapy, somatic cell therapy, tissue-engineered products — are regulated under Regulation (EC) No 1394/2007 in the EU; they require a dedicated CHMP opinion with involvement of the Committee for Advanced Therapies (CAT)."

@D reg_ich := "ICH harmonisation guidelines" :: regulation [ok]
  what = "The International Council for Harmonisation of Technical Requirements for Pharmaceuticals for Human Use (ICH) produces guidelines that are adopted by FDA, EMA, PMDA and other regulators — reducing duplicative testing and submission requirements across jurisdictions."
  key-guidelines = "ICH E6 (GCP — Good Clinical Practice: the global standard for clinical trial conduct and data integrity); ICH E9 (statistical principles for clinical trials — pre-specification, blinding, analysis population, estimands); ICH S (safety / toxicology series: M3 non-clinical timelines, S7A/B cardiac safety, S5 reproductive tox, etc.); ICH M (multidisciplinary: M3 non-clinical, M4 CTD dossier structure — the Common Technical Document)."
  ctd = "The Common Technical Document (CTD) — organised in Modules 1–5 — is the standard dossier structure for submissions to ICH member regulators, materially reducing the submission-preparation burden for global filings."
  honesty = "ICH guideline versions evolve; cited at guideline-family level here. Verify current revision for a real submission."
  |> "[@x_ich_guidelines]"

# ── §6 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_clinical_attrition := "clinical development attrition (~90% fail from Phase I → approval)" :: real-limit [ok required]
  wall = "EMPIRICAL HARD WALL (systemic)"
  statement = "Hay et al. (2014, Nature Biotechnology) calculated overall clinical-development success rates across a large dataset. The approximate aggregate probability of a molecule entering Phase I eventually receiving approval was in the range of approximately 10% overall — meaning roughly 90% of Phase I entrants fail to reach market. Rates vary substantially by disease area and therapeutic modality."
  disease-variation = "Haematology / oncology historically have among the lowest success rates per phase; infectious disease has been above average in recent decades. These are empirical observations, not constants."
  consequence = "A drug development portfolio must fund many candidates to expect one approval; portfolio-level capital requirements are set by attrition, not by any invariant."
  honesty = "The ~10% aggregate success rate and ~90% attrition claim is the directional interpretation of Hay et al. 2014; exact figures depend on the dataset period, disease-area cut, and phase-entry definitions used — read with that context."
  |> "[@x_hay_2014]"

@D lim_phase2_attrition := "Phase II as the dominant attrition stage" :: real-limit [ok required]
  wall = "EMPIRICAL SOFT WALL (improvable but not eliminable with current science)"
  statement = "Phase II is the stage at which biological hypotheses — that a target matters, that a biomarker selects the right patients, that a dose produces the intended effect — are tested in patients. Most fail here because preclinical models are imperfect surrogates for human biology."
  consequence = "Better target validation (human genetics, biomarker-enriched trials) can improve Phase II success rates but cannot approach 100% — the translational gap is real. Bayesian adaptive trial designs and platform trials (e.g., I-SPY, RECOVERY) can reduce sample waste but not eliminate the biological uncertainty."
  |> "[@x_hay_2014] · [@x_paul_2010]"

@D lim_animal_gap := "animal-model translational gap" :: real-limit [ok required]
  wall = "HARD WALL (biological — mechanism)"
  statement = "Non-human animal models reproduce some but not all aspects of human disease biology. Genetic background, immune system differences, lifespan, metabolic rate, microbiome, and disease induction method (often artificial) all limit predictive value. The reproducibility crisis ([@econ_reproducibility]) exacerbates this — many studies demonstrating efficacy in animals are irreproducible even in animals."
  consequence = "Preclinical package is a regulatory requirement and a scientific step — not a guarantee of human efficacy. Translational failure at Phase II is the dominant manifestation of this limit."
  |> "[@x_begley_2012] · [@x_prinz_2011]"

@D lim_manufacturing_cmc := "manufacturing and CMC complexity (biologics in particular)" :: real-limit [ok required]
  wall = "HARD WALL (engineering / capital)"
  statement = "Biologic manufacturing is a living-cell process; small changes in cell line, media, process parameters, or purification can alter post-translational modifications (glycosylation, oxidation, aggregation) in ways that affect safety/efficacy. Comparability studies are required for manufacturing changes post-approval. This is a regulatory and engineering constraint with no lattice analog."
  consequence = "CMC development timelines and capital requirements for biologics, gene therapies and cell therapies are substantially higher than for small molecules. Manufacturing scalability and COGS at commercial scale are genuine development-risk items that can sink otherwise scientifically promising programs."

@D lim_regulatory_time_cost := "regulatory time and cost of clinical programs" :: real-limit [ok required]
  wall = "HARD WALL (process and capital)"
  statement = "Phase III pivotal trials are multi-year and capital-intensive; regulatory review adds further time. Total IND-to-NDA review timelines for complex programs can exceed a decade. Paul et al. (2010) and DiMasi analyses (era-flagged) document the capital scale. These timelines are driven by biology (adequate exposure duration for endpoint maturation), statistics (power requirements), regulatory requirements (ICH guidelines) and operational factors — not by an invariant."
  consequence = "The long timelines are a structural feature of the safety/efficacy evidentiary standard. Expedited pathways (Breakthrough Therapy, Accelerated Approval, Adaptive Trial Design) reduce but do not eliminate them."
  |> "[@x_paul_2010] · [@x_hay_2014] · [@x_ich_guidelines]"

@D lim_erooms_wall := "Eroom's Law: declining R&D productivity" :: real-limit [ok required]
  wall = "EMPIRICAL SOFT WALL (structural)"
  statement = "The halving of new drugs per R&D dollar every ~9 years (Scannell et al. 2012) reflects cumulative structural inefficiencies: rising evidentiary standards, the increasing difficulty of demonstrating benefit over effective existing therapies, and the prior exhaustion of relatively tractable targets. This is a systemic limit on the industry, not a single program's failure."
  consequence = "Large-scale increases in R&D spending alone have not historically produced proportional increases in approved drugs — the systemic inefficiency is real."
  |> "[@x_scannell_2012] · [@x_munos_2009]"

@D lim_pricing_access := "drug pricing and access tension" :: real-limit [ok required]
  wall = "SOCIOECONOMIC WALL (structural)"
  statement = "The high cost of drug development (per the DiMasi/Paul estimates) creates pressure for high launch prices, particularly for small-population rare diseases and cancer. This creates a structural tension between developer cost-recovery, payer affordability, and patient access that cannot be resolved by biology alone. Health-technology assessment (HTA) bodies (NICE in the UK, G-BA in Germany, HAS in France) adjudicate cost-effectiveness, and their thresholds are not biology-derived."
  honesty = "Drug pricing and access are complex socioeconomic/policy domains; this tape notes the structural tension and cites it as a real limit on drug development strategy, without providing policy advice."

# ── §7 Notable landmarks (grounded examples, NOT therapeutic endorsements) ──

@D land_imatinib := "imatinib (Gleevec) — precision oncology proof of concept" :: landmark [ok]
  statement = "Imatinib, a BCR-ABL1 tyrosine kinase inhibitor developed at Novartis under Bruce Druker, transformed chronic-phase CML from a disease with limited survival to one with near-normal life expectancy for responders on sustained therapy. It is the canonical example of rationally designed, target-validated precision oncology."
  cross-link = "Referenced in CANCER-THERAPY.tape [@x_druker_2001]; cited here as a bio-pharma pipeline landmark — target (BCR-ABL1 TK) was biologically unambiguous, validation was rapid, Phase II results were unprecedented and accelerated approval."
  |> "[@x_druker_2001]"

@D land_patisiran := "patisiran — first RNAi drug approval (siRNA platform)" :: landmark [ok]
  statement = "Patisiran (Onpattro; Alnylam Pharmaceuticals) received FDA approval in 2018 for hereditary transthyretin-mediated amyloidosis (hATTR). Adams et al. (2018, NEJM) reported the pivotal Phase III trial. It validated the siRNA therapeutic platform after ~15 years from RNAi discovery (Fire & Mello, 1998) to approval — illustrating the characteristic timeline from biological mechanism to approved drug."
  honesty = "Cited as platform-validation landmark; specific efficacy percentages are in the published trial; not re-derived here."
  |> "[@x_adams_2018]"

@D land_cart_all := "CD19 CAR-T in paediatric B-ALL" :: landmark [ok]
  statement = "Maude et al. (2014, NEJM) reported 90% complete remission rates in relapsed/refractory paediatric B-ALL with tisagenlecleucel (CD19 CAR-T). This validated the CAR-T platform — formerly investigational cell therapy — as a clinically transformative approach. Eventual FDA approval (2017) marked the first CAR-T approval."
  honesty = "The 90% complete remission figure is paraphrased from the published trial (Maude 2014); not re-derived. Cross-linked to CANCER-THERAPY.tape."
  |> "[@x_maude_2014]"

@D land_mrna_covid := "mRNA COVID-19 vaccines — platform validation at scale" :: landmark [ok]
  statement = "The 2020–2021 emergency authorisation of BNT162b2 (Pfizer-BioNTech) and mRNA-1273 (Moderna) represented the first large-scale human validation of mRNA-LNP technology. The platform concept traces to Wolff et al. (1990) and to Karikó's nucleoside-modification work enabling non-immunostimulatory mRNA. The COVID-19 deployment compressed a timeline that might otherwise have taken a decade."
  honesty = "Vaccine efficacy figures are publication/population/variant-specific; no single vaccine efficacy percentage is asserted here. Cited as a platform-validation era reference."

# ── §8 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-drug-development" :: governance [required deny:write]
  pattern = "Deriving drug development facts (pipeline stage counts, attrition rates, cost figures, regulatory timelines, clinical-trial sizes, modality counts) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's '생산량 12g/L because σ=12' / '배치 성공률 = 2σ·τ' / '4주기 표준 클록 = τ=4' / '6대 핵심 지표 = n=6'."
  why = "This is exactly the violation the pre-rewrite BIO-PHARMA.tape committed (lattice-tautology stub, mass-split 153b5a2 — see BIO-PHARMA.log.tape audit). hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3 forbid it. Drug development is an external empirical reality (pharma industry, FDA, EMA, ICH) — g3 honesty-obligation-external applies. Lattice constants bear no causal relationship to clinical attrition, R&D costs, or regulatory timelines."
  remedy = "Cite real pharma/regulatory/clinical literature (this tape's @X entries). The lattice may only be a coincidental OBSERVATION, never a derivation source for any pipeline, economic or regulatory claim."

@N n6_honest_stance := "drug development has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: pharmaceutical drug development exposes NO natural n=6 invariant. Pipeline stages are a regulatory/scientific convention that varies by jurisdiction, disease area and pathway — the count is not 6. Clinical trial phases (I, II, III, IV) number FOUR by common convention — not 6. FDA risk classes (for associated medical devices) number THREE; EMA drug review timelines are 210 active days by regulation — neither is 6. Attrition rates are empirical fractions from epidemiologic analyses (Hay 2014). R&D cost figures are economic measurements from industry datasets (Paul 2010, DiMasi series). Coincidences between any pipeline fact and lattice constants (σ=12, τ=4, φ=2, J₂=24) are OBSERVATIONS ONLY, never derivations — per LATTICE_POLICY g1/g2 + lattice-as-tool. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ── §9 Verifiable predictions (real, falsifiable — NOT lattice) ───────

@D tp_1 := "TP-1 Phase II as dominant attrition stage" :: prediction [ok]
  claim = "In any large multi-year drug development dataset, Phase II will show the highest per-phase attrition rate (compounds entering but failing to advance) compared to Phase I or Phase III — because Phase II is where the biological hypothesis is first tested in patients at a relevant dose and population."
  falsifier = "If a properly compiled retrospective analysis over ≥5 years of industry programs showed Phase I or Phase III attrition rates consistently exceed Phase II rates, [@lim_phase2_attrition] is wrong."
  source = "[@x_hay_2014] · [@x_paul_2010]"

@D tp_2 := "TP-2 human genetic validation improves Phase II success" :: prediction [ok]
  claim = "Drug programs with strong human genetic support for the target (e.g. Mendelian-randomisation evidence, loss-of-function carrier phenotypes consistent with mechanism) will show higher Phase II success rates than programs without such support, within a sufficiently large and comparable dataset."
  falsifier = "If a prospective or retrospective cohort controlling for disease area and phase-entry year showed no difference in Phase II success rates between genetically-validated and non-genetically-validated programs, this prediction is wrong."
  source = "[@x_munos_2009] · [@x_paul_2010]"

@D tp_3 := "TP-3 Eroom's Law: doubling time of R&D cost per approved drug" :: prediction [ok]
  claim = "If pharmaceutical R&D efficiency continues on the trajectory Scannell et al. documented through 2012, the inflation-adjusted cost per approved NME will approximately double again over the following ~9 years (i.e. approximately 2021 estimates should be roughly double 2012-era estimates)."
  falsifier = "If inflation-adjusted cost per approved drug has remained flat or declined over the 2012–2021 period in a rigorous cross-company dataset, Eroom's Law would have been broken — which would require explanation of what structural change produced the improvement."
  source = "[@x_scannell_2012] · [@x_munos_2009]"
  honesty = "This is a forward extrapolation of an empirical trend; structural changes (AI/ML drug discovery, human-genetic validation, adaptive trials) may partially break the trend — stated as falsifiable, not certain."

# ── §10 External citations (real, landmark literature) ────────────────

@X x_munos_2009 := "Munos B 2009" :: literature [active]
  ref = "Munos B. Lessons from 60 years of pharmaceutical innovation. Nature Reviews Drug Discovery 2009;8:959–968. (constant annual NME output despite rising R&D spend; productivity paradox)"

@X x_scannell_2012 := "Scannell JW et al 2012" :: literature [active]
  ref = "Scannell JW, Blanckley A, Boldon H, Warrington B. Diagnosing the decline in pharmaceutical R&D efficiency. Nature Reviews Drug Discovery 2012;11:191–200. (Eroom's Law — halving of drugs per R&D dollar every ~9 years; four proposed contributing mechanisms)"

@X x_paul_2010 := "Paul SM et al 2010" :: literature [active]
  ref = "Paul SM, Mytelka DS, Dunwiddie CT, Persinger CC, Munos BH, Lindborg SR, Schacht AL. How to improve R&D productivity: the pharmaceutical industry's grand challenge. Nature Reviews Drug Discovery 2010;9:203–214. (stage-gate attrition model; ~$872M out-of-pocket / ~$1.8B capitalised per approved drug, 2005–2009 era; cost of capital analysis)"

@X x_hay_2014 := "Hay M et al 2014" :: literature [active]
  ref = "Hay M, Thomas DW, Craighead JL, Economides C, Rosenthal J. Clinical development success rates for investigational drugs. Nature Biotechnology 2014;32:40–51. (empirical success rates by phase, disease area; ~10% overall Phase I → approval; Phase II dominant attrition)"

@X x_dimasi_series := "DiMasi JA et al (series, era-flagged)" :: literature [active]
  ref = "DiMasi JA and colleagues. Series of analyses of drug development costs using Tufts Center for the Study of Drug Development data. Key publications: DiMasi JA, Hansen RW, Grabowski HG. J Health Econ 2003;22:151–185 (~$802M era estimate); DiMasi JA, Grabowski HG, Hansen RW. J Health Econ 2016;47:20–33 (~$2.6B capitalised cost, 2000s–2010s era). Era-flagged: methodology (cost of capital rate, sample of companies) is contested; directional claim (high and rising cost) is widely accepted."

@X x_begley_2012 := "Begley CG, Ellis LM 2012" :: literature [active]
  ref = "Begley CG, Ellis LM. Drug development: raise standards for preclinical cancer research. Nature 2012;483:531–533. (Amgen replication exercise: 6/53 landmark cancer biology papers reproducible internally; ~11% reproduction rate; structural preclinical irreproducibility)"

@X x_prinz_2011 := "Prinz F et al 2011 (era-flagged)" :: literature [active]
  ref = "Prinz F, Schlange T, Asadullah K. Believe it or not: how much can we rely on published data on potential drug targets? Nature Reviews Drug Discovery 2011;10:712 (letter). (Bayer internal replication study; ~25% reproducibility of published cancer biology findings informing drug projects; primary-author/era cited — exact Bayer internal sample context acknowledged)"

@X x_ioannidis_2005 := "Ioannidis JPA 2005" :: literature [active]
  ref = "Ioannidis JPA. Why most published research findings are false. PLoS Medicine 2005;2:e124. (statistical framework for false-positive rate under realistic priors, study sizes and multiple-testing in biomedical literature; foundational reproducibility-crisis reference)"

@X x_adams_2018 := "Adams D et al 2018" :: literature [active]
  ref = "Adams D, Gonzalez-Duarte A, O'Riordan WD, et al. Patisiran, an RNAi therapeutic, for hereditary transthyretin amyloidosis. New England Journal of Medicine 2018;379:11–21. (pivotal Phase III siRNA / RNAi drug — first approved siRNA therapeutic; hATTR amyloidosis)"

@X x_maude_2014 := "Maude SL et al 2014" :: literature [active]
  ref = "Maude SL, Frey N, Shaw PA, et al. Chimeric antigen receptor T cells for sustained remissions in leukemia. New England Journal of Medicine 2014;371:1507–1517. (CD19 CAR-T in relapsed/refractory paediatric B-ALL; platform-validation landmark)"

@X x_druker_2001 := "Druker BJ et al 2001" :: literature [active]
  ref = "Druker BJ, Talpaz M, Resta DJ, et al. Efficacy and safety of a specific inhibitor of the BCR-ABL tyrosine kinase in chronic myeloid leukemia. New England Journal of Medicine 2001;344:1031–1037. (imatinib — precision oncology proof of concept)"

@X x_fda_21cfr_312 := "FDA 21 CFR Part 312 (IND)" :: literature [active]
  ref = "U.S. Food and Drug Administration. Title 21, Code of Federal Regulations, Part 312 — Investigational New Drug Application (current revision). Governs IND requirements, clinical hold authority, and expanded access. Publisher: U.S. GPO / FDA."

@X x_fda_21cfr_314 := "FDA 21 CFR Part 314 (NDA)" :: literature [active]
  ref = "U.S. Food and Drug Administration. Title 21, Code of Federal Regulations, Part 314 — Applications for FDA Approval to Market a New Drug (NDA; current revision). Publisher: U.S. GPO / FDA."

@X x_fda_21cfr_600 := "FDA 21 CFR Part 600 (biologics/BLA)" :: literature [active]
  ref = "U.S. Food and Drug Administration. Title 21, Code of Federal Regulations, Part 600 — Biological Products: General (and associated Parts 601–610 governing BLA and licensed biologic standards; current revision). Publisher: U.S. GPO / FDA."

@X x_ich_guidelines := "ICH guideline family" :: literature [active]
  ref = "International Council for Harmonisation of Technical Requirements for Pharmaceuticals for Human Use (ICH). Guideline families: ICH E6(R2) Good Clinical Practice (2016 revision); ICH E9(R1) Statistical Principles (estimands addendum 2019); ICH M3(R2) Non-clinical safety studies for human clinical trials (2009); ICH S7A/S7B safety pharmacology; ICH S5(R3) reproductive toxicology; ICH M4 Common Technical Document (CTD). Document-family citation; specific guideline revisions evolve — verify current version for a real submission. Publisher: ICH Secretariat, Geneva."
