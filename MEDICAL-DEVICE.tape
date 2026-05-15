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
# MEDICAL-DEVICE.tape — architecture-current (editable per v1.2)
# Event history → MEDICAL-DEVICE.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "medical-device" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · medical-device engineering & regulatory pathway in-silico knowledge SSOT"
  brief = "Medical-device classification, pathways, QMS, biocompatibility, SaMD, human factors, sterilization, clinical evaluation, post-market surveillance · standards-grounded · real-limits anchored · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  scope = "in-silico knowledge SSOT · NOT regulatory / legal / clinical advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see MEDICAL-DEVICE.log.tape audit"
  sibling-log = "MEDICAL-DEVICE.log.tape"

@N scope_disclaimer := "regulatory/clinical-scope honesty" :: note [required]
  text = "This tape is a knowledge SSOT summarising publicly available medical-device regulation, standards and engineering practice for in-silico modeling context only. It is NOT regulatory advice, NOT legal advice, NOT clinical guidance, and NOT a substitute for qualified Regulatory Affairs, Quality Assurance, clinical-evaluation or notified-body consultation. Regulatory regimes (US FDA, EU MDR, ISO, IEC) evolve; specific document revisions, classifications, predicate determinations and submission pathways require verification against current authoritative sources for any real device program. All claims here are in-silico simulator/metadata consistency only; wet-lab → bench → animal → human → regulatory submission → market authorisation is explicitly out of scope (hexa-bio AGENTS.tape g8 / f2)."

# ── §1 What a medical device is, and how it is classified ─────────────

@D dx_definition := "what a medical device is" :: domain [ok]
  device = "A medical device is an article (instrument, apparatus, implant, in-vitro reagent, software) intended by its manufacturer to be used for medical purposes — diagnosis, prevention, monitoring, treatment, alleviation of disease or injury, or modification of anatomy/physiological process — whose principal intended action is NOT achieved by pharmacological, immunological or metabolic means (those are drugs/biologics)."
  intended-use = "Intended use (the manufacturer's stated medical purpose) is the central determinant of classification and pathway — a piece of hardware can be a device or non-device depending on labelled claims."
  not-a-device = "Wellness/consumer-fitness products without medical claims, general-purpose laboratory equipment, and articles intended for non-medical purposes fall outside the device frameworks of FDA/MDR."
  scope-note = "Device frameworks include hardware, accessories, software-as-a-medical-device (SaMD) and combination products (drug-device, biologic-device); each regime has tailored rules."
  |> "[@x_fda_21cfr_part820] · [@x_eu_mdr_2017_745]"

@D dx_classification_fda := "FDA risk classification (US)" :: classification [ok]
  framework = "U.S. FDA classifies devices into three classes by risk and the controls needed to assure safety/effectiveness."
  class-i = "Class I — lowest risk; subject to General Controls (registration, listing, labelling, GMP). Most Class I are 510(k)-exempt."
  class-ii = "Class II — moderate risk; General Controls plus Special Controls (performance standards, post-market surveillance, special labelling, guidance); typical pathway is 510(k) clearance based on substantial equivalence to a predicate."
  class-iii = "Class III — highest risk (life-supporting, life-sustaining, or substantial-risk implants where General + Special Controls are insufficient); typical pathway is Premarket Approval (PMA) with clinical evidence of safety and effectiveness."
  authority = "Classification regulations live in U.S. 21 CFR Parts 862–892 (organised by medical specialty panel); the classification framework itself is codified in 21 CFR Part 860."
  honesty = "Class count is THREE — explicitly not 6. Classification is risk-based and panel-specific, not lattice-derived. See [@f_lattice_fit]."
  |> "[@x_fda_21cfr_part860]"

@D dx_classification_mdr := "EU MDR risk classification" :: classification [ok]
  framework = "Regulation (EU) 2017/745 (Medical Device Regulation, MDR) classifies devices into four classes — I, IIa, IIb, III — by intended use, duration of contact, invasiveness and active/non-active status, using classification rules in Annex VIII."
  class-i = "Class I — lowest risk; self-certification under conformity assessment with notified-body involvement only for sub-classes (Is sterile, Im measuring, Ir reusable surgical instruments)."
  class-iia = "Class IIa — medium-low risk; notified-body conformity assessment required."
  class-iib = "Class IIb — medium-high risk; notified-body conformity assessment with more stringent design-dossier scrutiny."
  class-iii = "Class III — highest risk (implants, life-support, critical drug-delivery); requires notified-body assessment of a full technical-documentation dossier, often including a clinical evaluation consultation procedure (CECP) for certain implantables."
  ce-mark = "Successful conformity assessment → CE marking → market access across the EU; ongoing post-market surveillance and EUDAMED database obligations apply."
  honesty = "MDR classes number FOUR — also explicitly not 6. Stage labels are regulatory ordinals, not lattice values."
  |> "[@x_eu_mdr_2017_745]"

@D dx_classification_ivdr := "EU IVDR classification (in-vitro diagnostics, brief)" :: classification [ok]
  framework = "In-vitro diagnostic medical devices are governed in the EU by a sister regulation, Regulation (EU) 2017/746 (IVDR), with its own four-class risk scheme (A, B, C, D) and rules — IVDR is distinct from MDR and out of primary scope here, but interacts with combination/companion-diagnostic programs."
  honesty = "Mentioned for completeness; IVDR detail is not the focus of this tape."
  |> "[@x_eu_ivdr_2017_746]"

# ── §2 Premarket pathways ─────────────────────────────────────────────

@D path_510k := "FDA 510(k) substantial-equivalence pathway" :: pathway [ok]
  what = "Premarket notification under section 510(k) of the FD&C Act: the sponsor demonstrates the new device is substantially equivalent (SE) to a legally marketed predicate device in intended use and technological characteristics (or different characteristics that do not raise new questions of safety/effectiveness and perform at least as well)."
  who = "Most Class II devices and a minority of Class I devices."
  evidence = "Bench performance, biocompatibility, electrical safety/EMC, software, and limited clinical data when needed for SE determination; full clinical effectiveness studies are typically not required."
  authority = "Procedural regulation: U.S. 21 CFR Part 807, Subpart E."
  honesty = "510(k) clears for marketing on the basis of equivalence to a predicate; it does NOT in itself establish independent safety/effectiveness in the way PMA does."
  |> "[@x_fda_21cfr_part807]"

@D path_denovo := "FDA De Novo classification request" :: pathway [ok]
  what = "Pathway for novel low-to-moderate-risk devices without a legal predicate. The sponsor requests risk-based classification into Class I or II with applicable Special Controls; granting a De Novo creates a new device type and a new predicate for future 510(k)s."
  why = "Avoids forcing genuinely novel low-risk devices through PMA solely for lack of predicate."
  honesty = "De Novo is regulator-discretionary; rate-limiting steps include the FDA's establishment of Special Controls for the new device type."
  |> "[@x_fda_denovo_guidance]"

@D path_pma := "FDA PMA premarket approval" :: pathway [ok]
  what = "Premarket Approval (PMA) is the most stringent FDA device review pathway, applied to Class III devices. The sponsor submits a comprehensive dossier including manufacturing, design and valid scientific evidence — typically pivotal clinical trial(s) — to establish reasonable assurance of safety and effectiveness."
  authority = "U.S. 21 CFR Part 814."
  cost-time = "PMA programs are multi-year and capital-intensive; meaningful PMA timelines and costs are well outside what 510(k) clearance demands (see [@lim_regulatory_time_cost])."
  honesty = "PMA approval is a regulator's determination of reasonable assurance — not a guarantee of effectiveness in every patient or context; PMS obligations follow."
  |> "[@x_fda_21cfr_part814]"

@D path_breakthrough := "FDA Breakthrough Devices Program" :: pathway [ok]
  what = "Voluntary program to provide more interactive and timely FDA review for devices intended to treat or diagnose life-threatening or irreversibly debilitating conditions where the device offers a more effective treatment/diagnosis than existing alternatives or addresses unmet medical needs."
  effect = "Designation grants enhanced sponsor-FDA interaction, prioritised review, and may interact favourably with reimbursement pathways; designation is NOT a market authorisation and does not lower the substantive evidentiary bar — it accelerates the path, it does not change the standard."
  |> "[@x_fda_breakthrough_guidance]"

@D path_ce_mdr := "EU CE marking under MDR" :: pathway [ok]
  what = "Conformity assessment per MDR Annex IX/X/XI (route depends on class) by a notified body, including QMS audit (ISO 13485) and technical-documentation review; for Class III implantables a clinical-evaluation consultation procedure (CECP) may apply."
  output = "CE marking and entry into EUDAMED; ongoing PMS, PSUR (periodic safety update report), trend reporting and vigilance obligations follow."
  honesty = "Notified-body capacity, MDR transition timelines and certificate validity are operational realities for real programs and have been an active topic of EU Commission extensions; verify currency before relying on any specific deadline."
  |> "[@x_eu_mdr_2017_745]"

@D path_eudamed := "EUDAMED European database" :: pathway [ok]
  what = "EUDAMED is the European database on medical devices established under MDR/IVDR — modules cover actor registration, UDI/devices, notified bodies/certificates, clinical investigations/performance studies, vigilance and market surveillance."
  status = "Module rollout is phased and has progressed in stages since MDR's date of application; specific module-mandatory dates evolve with Commission decisions — verify currency for a real submission."
  |> "[@x_eu_mdr_2017_745]"

# ── §3 Quality Management System & design controls ───────────────────

@D qms_iso13485 := "ISO 13485 quality management system" :: qms [ok required]
  what = "ISO 13485 is the international standard for QMS requirements specific to medical-device organisations — design & development, purchasing, production, traceability, CAPA, document control, management responsibility, with risk-based thinking throughout."
  edition = "ISO 13485:2016 is the current edition."
  use = "Acts as the QMS backbone for CE marking conformity routes; widely adopted globally; in the US, the FDA's Quality Management System Regulation (QMSR, formerly the Quality System Regulation/QSR under 21 CFR Part 820) is being aligned with ISO 13485:2016 by rule, reducing duplication for manufacturers operating internationally."
  |> "[@x_iso_13485_2016] · [@x_fda_21cfr_part820]"

@D qms_design_controls := "FDA design controls" :: qms [ok required]
  what = "21 CFR 820.30 design controls: design & development planning, design input, design output, design review, design verification, design validation, design transfer, design changes, and the design history file (DHF) which documents the design history of a finished device."
  scope = "Applies to all Class II and Class III devices and certain Class I devices; design controls are the structured engineering discipline that produces an auditable evidence trail across the product lifecycle."
  output = "Design History File (DHF) — record of design history; complemented by Device Master Record (DMR) and Device History Record (DHR)."
  |> "[@x_fda_21cfr_part820]"

@D qms_risk_iso14971 := "risk management ISO 14971" :: qms [ok required]
  what = "ISO 14971 specifies a process for medical-device risk management — risk analysis (hazard identification, foreseeable misuse), risk evaluation, risk control (inherently safe design, protective measures, information for safety), evaluation of overall residual risk, risk-management report, and post-production information feedback."
  edition = "ISO 14971:2019 is the current edition; widely paired with the TR ISO/TR 24971 guidance."
  honesty = "Risk management is a process standard — it does not enumerate hazards FOR a given device; that remains the manufacturer's engineering and clinical judgement."
  |> "[@x_iso_14971_2019]"

# ── §4 Biocompatibility & sterilization ──────────────────────────────

@D bio_iso10993 := "biocompatibility ISO 10993" :: biocompatibility [ok required]
  what = "ISO 10993 is a multi-part series for biological evaluation of medical devices. Part 1 (ISO 10993-1) provides the evaluation framework and selection of tests based on the device's nature/duration of body contact; other parts cover specific endpoints."
  endpoints = "Cytotoxicity, sensitization, irritation/intracutaneous reactivity, acute/sub-chronic/chronic systemic toxicity, genotoxicity, implantation, hemocompatibility, carcinogenicity (where indicated), reproductive/developmental toxicity, degradation, and toxicokinetics, applied risk-based per device contact category and duration."
  edition = "ISO 10993-1:2018 is the current part-1 edition."
  honesty = "Modern guidance favours chemical characterisation + toxicological risk assessment over reflex animal testing where scientifically justified; full part-by-part adoption status evolves across jurisdictions — verify currency."
  |> "[@x_iso_10993_1_2018]"

@D ster_standards := "sterilization standards" :: sterilization [ok required]
  what = "Validation and routine control of sterilization processes for healthcare products is governed by process-specific ISO standards."
  eo = "Ethylene oxide (EO): ISO 11135 (current edition family) — widely used for temperature/moisture-sensitive devices; subject to environmental and residual-EO constraints."
  radiation = "Radiation (gamma/electron-beam/X-ray): ISO 11137 (multi-part family) — material compatibility (polymer embrittlement, change in mechanical/optical properties) is the practical constraint."
  moist-heat = "Moist heat (autoclave): ISO 17665 (family) — limited to materials that tolerate steam at typical autoclave cycles."
  reusable = "Reprocessing of reusable devices follows ISO 17664 + AAMI ST91 family conventions; cleaning validation is a recurring real-world failure mode in surveys."
  honesty = "Specific revision years vary across ISO families; cited at standard-family level here. Real programs verify the exact applicable edition with the notified body / FDA recognised-consensus-standards list."
  |> "[@x_iso_11135_family] · [@x_iso_11137_family] · [@x_iso_17665_family]"

# ── §5 Software as a Medical Device (SaMD) and AI/ML ────────────────

@D samd_definition := "Software as a Medical Device (SaMD)" :: samd [ok]
  what = "SaMD is software intended to be used for one or more medical purposes that performs those purposes without being part of a hardware medical device (IMDRF definition; adopted by FDA and other regulators). Software embedded in a hardware device is 'software in a medical device' (SiMD), a related but distinct category."
  risk-categorisation = "IMDRF SaMD risk-categorisation framework considers the significance of information provided (treat/diagnose vs drive vs inform clinical management) and the state of the healthcare situation (critical, serious, non-serious); FDA SaMD policy aligns with this framework."
  examples = "Diagnostic imaging analysis (e.g., AI/ML triage or detection), clinical-decision support meeting device criteria, continuous-glucose monitoring algorithms, software that drives a hardware device."
  |> "[@x_imdrf_samd_framework]"

@D samd_iec62304 := "IEC 62304 software lifecycle" :: samd [ok required]
  what = "IEC 62304 specifies lifecycle processes for medical-device software — planning, requirements, architectural design, detailed design, implementation, integration, system testing, release, maintenance, configuration management, problem resolution — scaled to software safety classification (Class A: no injury or damage to health possible; B: non-serious injury possible; C: death or serious injury possible)."
  edition = "IEC 62304:2006 + Amendment 1 (2015) is the widely recognised consensus edition; harmonised in the EU and recognised by the FDA in its consensus-standards list."
  |> "[@x_iec_62304_2006_a1]"

@D samd_ai_ml := "AI/ML SaMD and predetermined change control" :: samd [ok]
  what = "FDA's AI/ML-based SaMD action plan (FDA 2021) and follow-on guidance establish the framework for software whose performance evolves with continued learning — including the concept of a Predetermined Change Control Plan (PCCP) that pre-specifies allowable model modifications and the algorithm-change protocol used to validate them, allowing certain updates without a new submission."
  honesty = "Concrete PCCP authorisations and guidance documents continue to be issued; specific document IDs and final-guidance dates evolve — verify the current version when relying on any specific provision."
  |> "[@x_fda_aiml_actionplan_2021] · [@x_imdrf_samd_framework]"

@D samd_cybersecurity := "device cybersecurity" :: samd [ok required]
  what = "Cybersecurity is an integral part of device safety; FDA premarket cybersecurity guidance (2023) outlines expectations for a Secure Product Development Framework (SPDF), threat modelling, software bill of materials (SBOM), vulnerability management and coordinated disclosure across the device lifecycle. EU MDR carries explicit IT-security requirements in Annex I (general safety and performance requirements), with MDCG guidance amplifying expectations."
  authority = "21st Century Cures Act amendments and the FDA Omnibus 2022 (PATCH-related provisions) establish premarket cybersecurity-information requirements for cyber devices."
  honesty = "Threat surface, exploit publicity and required mitigation evolve faster than guidance documents (see [@lim_cybersecurity]); citing standard family and era for the 2023 cybersecurity guidance."
  |> "[@x_fda_cybersecurity_2023]"

# ── §6 Human factors / usability engineering ─────────────────────────

@D hf_iec62366 := "usability engineering IEC 62366" :: human-factors [ok required]
  what = "IEC 62366-1 specifies the usability engineering process — use-specification, user-interface specification, identification of hazards related to use, formative and summative evaluation, validation that the user interface controls use-related risk."
  edition = "IEC 62366-1:2015 (with subsequent amendments) is the current part-1 edition; companion IEC/TR 62366-2 provides guidance."
  why = "Use error is a leading cause of device-related harm; usability engineering is the discipline that systematically reduces it. Required by FDA submissions for many device types and by EU MDR conformity routes."
  |> "[@x_iec_62366_1_2015]"

@D hf_fda_guidance := "FDA human factors guidance" :: human-factors [ok]
  what = "FDA guidance 'Applying Human Factors and Usability Engineering to Medical Devices' (2016) — describes expectations for human-factors validation testing, including summative simulated-use studies and the human-factors engineering report content. A subsequent list of device types likely to require human-factors data accompanies the framework."
  honesty = "Specific list-document revisions evolve; the 2016 guidance is the anchor."
  |> "[@x_fda_humanfactors_2016]"

# ── §7 Clinical evaluation, post-market surveillance & UDI ──────────

@D clin_mdr_annex_xiv := "MDR clinical evaluation (Annex XIV)" :: clinical [ok required]
  what = "Under EU MDR, the manufacturer plans and conducts a clinical evaluation per Annex XIV: a Clinical Evaluation Plan, systematic literature review, clinical-investigation data where required, a Clinical Evaluation Report (CER), and a Post-Market Clinical Follow-up (PMCF) plan/report — collectively the clinical evidence supporting safety and performance throughout the device lifecycle."
  pmcf = "PMCF generates clinical data post-market to confirm safety/performance and to detect previously unknown risks (e.g. registries, prospective studies, structured user surveys)."
  honesty = "Equivalence-based clinical evaluation routes are tightly constrained under MDR vs the prior MDD regime; many legacy devices required de-novo clinical data."
  |> "[@x_eu_mdr_2017_745]"

@D clin_pms_vigilance := "post-market surveillance & vigilance" :: clinical [ok required]
  what = "Continuous PMS captures field experience; vigilance covers reporting of serious incidents and field-safety-corrective actions (FSCA) to competent authorities."
  eu = "MDR mandates a PMS plan, periodic safety update report (PSUR), trend reporting and EUDAMED-routed vigilance; MEDDEV 2.12-1 (legacy guidance under MDD) provided long-standing vigilance practice and continues to inform terminology."
  us = "FDA Medical Device Reporting (MDR — note acronym collision with EU MDR) under 21 CFR Part 803 obliges manufacturers, importers and device user facilities to report deaths, serious injuries and malfunctions that would likely contribute to harm; MAUDE is the public adverse-event database; Class I/II/III recalls and 'safety alerts' are coded by harm potential."
  honesty = "Recalls and field actions are a routine feature of the real device ecosystem, not exceptional — see [@lim_pms_recall_reality]."
  |> "[@x_fda_21cfr_part803] · [@x_meddev_2_12_1] · [@x_kramer_2012]"

@D clin_udi := "Unique Device Identification (UDI)" :: clinical [ok required]
  what = "UDI is a manufacturer-assigned identifier with a device-identifier (DI, version/model-specific) and a production-identifier (PI, lot/serial/expiry/manufacture-date) machine-readable on labelling and human-readable on the device/packaging, registered in a UDI database (GUDID in the US; EUDAMED UDI module in the EU)."
  why = "Improves traceability across the supply chain, supports recall execution, enables post-market analysis, and is a building block for real-world-evidence programs."
  |> "[@x_fda_21cfr_part830]"

# ── §8 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_regulatory_time_cost := "regulatory time/cost wall" :: real-limit [ok required]
  wall = "HARD WALL (process & capital)"
  statement = "PMA-class device programs are multi-year and capital-intensive — pivotal clinical trials, GMP manufacturing scale-up, biocompatibility, sterilization validation and notified-body/FDA review are sequential rate-limiting steps that cannot be substituted by engineering speed alone. 510(k) clearance is materially faster than PMA, but is gated by predicate availability and substantial-equivalence demonstrability."
  consequence = "Regulatory pathway choice (and the existence/quality of a predicate) materially determines program time-to-market and capital requirements; 'just iterate the software' is not available once a device is in market for non-PCCP-covered changes."
  honesty = "Specific median timelines vary by panel and class and are reported in FDA performance reports — figures here are stated qualitatively, not as derived numbers."
  |> "[@x_fda_21cfr_part814] · [@x_fda_21cfr_part807]"

@D lim_biocompat_sterilization := "biocompatibility & sterilization constraint" :: real-limit [ok required]
  wall = "HARD WALL (materials science)"
  statement = "Patient-contacting materials must pass ISO 10993-aligned biological evaluation appropriate to body-contact nature and duration; sterilization process choice is constrained by material compatibility (EO residuals, radiation embrittlement, autoclave heat tolerance)."
  consequence = "Material selection is a coupled decision across biocompatibility, sterilization, manufacturability and clinical performance — not freely interchangeable late in design; design changes that cross material families typically reset prior biological-evaluation evidence."
  |> "[@x_iso_10993_1_2018] · [@x_iso_11135_family] · [@x_iso_11137_family]"

@D lim_cybersecurity := "cybersecurity attack surface" :: real-limit [ok required]
  wall = "EVOLVING WALL (adversarial)"
  statement = "Networked medical devices and SaMD have an attack surface that evolves with the deployed software stack, third-party libraries (SBOM components) and connected hospital networks. New CVEs in dependencies can render previously secure devices vulnerable without any change to the device's own code; coordinated disclosure and vulnerability management are continuous, lifecycle activities."
  consequence = "Cybersecurity is not a one-time submission artifact; field-deployed devices need patching, monitoring and end-of-support planning — a real operational cost that does not converge to zero."
  |> "[@x_fda_cybersecurity_2023]"

@D lim_pms_recall_reality := "recall & PMS reality" :: real-limit [ok required]
  wall = "EMPIRICAL WALL (field data)"
  statement = "Device recalls are common in routine operation — Class I recalls (reasonable probability of serious adverse health consequences or death) are publicly catalogued by FDA and major implant/cardiac/infusion-pump categories have repeatedly generated high-profile recalls. Premarket review is necessary but not sufficient for assured field safety; post-market data routinely surfaces issues invisible at submission."
  consequence = "An honest device program budgets for PMS, vigilance reporting, and the possibility of a field action; the prior literature (Kramer et al. 2012) documented that a non-trivial fraction of PMA-approved devices experienced safety-related events post-approval."
  |> "[@x_kramer_2012] · [@x_fda_21cfr_part803]"

@D lim_legacy_interop := "legacy & interoperability constraints" :: real-limit [ok required]
  wall = "SOFT WALL (installed-base)"
  statement = "Hospitals operate heterogeneous mixes of devices of varying vintages; HL7 v2.x, FHIR, DICOM, IHE profiles and proprietary protocols must coexist. A 'better' new device that does not integrate with the installed EHR/PACS/IT landscape will not be procured at scale."
  consequence = "Interoperability and integration cost is a frequent dominant gate on real-world adoption — orthogonal to clinical efficacy or regulatory clearance and not solvable by additional clinical claim."
  honesty = "No single interop standard is universally adopted; cited as standards-family observation, not a quantitative ceiling."

@D lim_human_factors := "use-error / human-factors ceiling" :: real-limit [ok required]
  wall = "HARD WALL (cognitive & operational)"
  statement = "Use error is a leading mechanism by which technically-correct devices cause harm — confusable controls, alarm fatigue, ambiguous labelling, mode confusion. Usability engineering reduces but does not eliminate use error; some residual use risk is irreducible at the human-cognition limit."
  consequence = "Validation that the user interface controls use-related risk (per IEC 62366-1) is a substantive engineering effort, not a documentation tick — and is a recurring source of clearance deficiencies."
  |> "[@x_iec_62366_1_2015] · [@x_fda_humanfactors_2016]"

# ── §9 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-medical-device-regulation" :: governance [required deny:write]
  pattern = "Deriving medical-device facts (class counts, pathway timelines, recall rates, sigma-coil counts, lead counts, DoF) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's 'ECG sigma=12 leads' / '6-DOF surgical robot' / '12 impossibility theorems' / '4-regulator industrial validation' presented as n=6 derivations."
  why = "This is exactly the violation the pre-rewrite MEDICAL-DEVICE.tape committed (lattice-tautology stub, mass-split 153b5a2 — see MEDICAL-DEVICE.log.tape audit). hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3 forbid it; f1 forbids lattice-fit on external entities (and FDA/EU MDR/ISO/IEC are external regulators/standards bodies — g3 honesty-obligation-external applies), f2 forbids in-silico → clinical/regulatory claims."
  remedy = "Cite real device regulations / standards / journal literature (this tape's @X entries). The lattice may only be a coincidental OBSERVATION — never a derivation source for any device, regulatory or clinical claim."

@N n6_honest_stance := "medical-device regulation has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: medical-device engineering and regulation expose NO natural n=6 invariant. FDA risk classes count THREE (I/II/III); EU MDR risk classes count FOUR (I/IIa/IIb/III); EU IVDR risk classes count FOUR (A/B/C/D); ISO 10993 has many parts; ISO/IEC standard editions update on their own cadence. Standard-12-lead ECG happens to have 12 leads as a clinical convention dating to the early-20th-century evolution of Einthoven and the precordial-lead literature — a HISTORICAL CONVENTION, not a derivation from σ=12. SE(3) is six-dimensional because rigid-body motion in 3-space has 3 translations + 3 rotations (a classical-mechanics fact), not because n=6. Coincidence is OBSERVATION ONLY (per LATTICE_POLICY g1/g2 + lattice-as-tool); derivation is forbidden (f1, g3). This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ── §10 Verifiable predictions (real, falsifiable — NOT lattice) ─────

@D tp_1 := "TP-1 pathway-rigor gradient" :: prediction [ok]
  claim = "For a fixed device type, programs proceeding via PMA require, on average, materially longer time and larger capital outlay than programs proceeding via 510(k) substantial-equivalence — driven primarily by the pivotal-clinical-trial and dossier-review burden of PMA, not by engineering complexity."
  falsifier = "If FDA performance-reporting data showed PMA programs converged with 510(k) timelines and clinical-trial costs across multiple panels, [@lim_regulatory_time_cost] would be wrong."
  source = "[@x_fda_21cfr_part814] · [@x_fda_21cfr_part807]"

@D tp_2 := "TP-2 post-market recall non-zero" :: prediction [ok]
  claim = "Across a sufficiently large cohort of premarket-approved or cleared devices followed over years post-market, a non-trivial fraction will experience at least one recall or field-safety-corrective action — premarket review reduces but does not eliminate field-discovered safety/effectiveness issues."
  falsifier = "If long-running cohort data of premarket-approved/cleared devices showed near-zero recall/FSCA rates over multi-year follow-up, [@lim_pms_recall_reality] would be wrong."
  source = "[@x_kramer_2012] · [@x_fda_21cfr_part803]"

@D tp_3 := "TP-3 use-error residual non-zero" :: prediction [ok]
  claim = "After IEC 62366-1-compliant usability engineering and summative validation, a non-zero use-error rate remains for any non-trivial device user interface; usability engineering shifts the rate downward and characterises residual risk but does not drive use error to zero."
  falsifier = "If summative human-factors validation data routinely demonstrated zero residual use-error potential across diverse user populations, [@lim_human_factors] would be wrong."
  source = "[@x_iec_62366_1_2015] · [@x_fda_humanfactors_2016]"

# ── §11 External citations (real regulations, standards & literature) ─
# Regulatory and standards documents are real references with publishers,
# document numbers and revision dates — fully appropriate as `@X :: literature`
# entries. Specific revision years stated where confident; standard family/era
# flagged where exact edition is approximated.

@X x_fda_21cfr_part820 := "FDA 21 CFR Part 820 (QSR / QMSR)" :: literature [active]
  ref = "U.S. Food and Drug Administration. Title 21, Code of Federal Regulations, Part 820 — Quality System Regulation (current revision; superseded/aligned with the Quality Management System Regulation harmonising with ISO 13485:2016 under FDA's QMSR final rule). Publisher: U.S. Government Publishing Office / FDA."

@X x_fda_21cfr_part860 := "FDA 21 CFR Part 860 (medical-device classification)" :: literature [active]
  ref = "U.S. Food and Drug Administration. Title 21, Code of Federal Regulations, Part 860 — Medical Device Classification Procedures (current revision). Publisher: U.S. GPO / FDA."

@X x_fda_21cfr_part807 := "FDA 21 CFR Part 807 (510(k) procedural)" :: literature [active]
  ref = "U.S. Food and Drug Administration. Title 21, Code of Federal Regulations, Part 807 — Establishment Registration and Device Listing for Manufacturers and Initial Importers of Devices; Subpart E covers premarket notification (510(k)). Current revision. Publisher: U.S. GPO / FDA."

@X x_fda_21cfr_part814 := "FDA 21 CFR Part 814 (PMA)" :: literature [active]
  ref = "U.S. Food and Drug Administration. Title 21, Code of Federal Regulations, Part 814 — Premarket Approval of Medical Devices (current revision). Publisher: U.S. GPO / FDA."

@X x_fda_21cfr_part803 := "FDA 21 CFR Part 803 (Medical Device Reporting)" :: literature [active]
  ref = "U.S. Food and Drug Administration. Title 21, Code of Federal Regulations, Part 803 — Medical Device Reporting (current revision). Publisher: U.S. GPO / FDA."

@X x_fda_21cfr_part830 := "FDA 21 CFR Part 830 (UDI)" :: literature [active]
  ref = "U.S. Food and Drug Administration. Title 21, Code of Federal Regulations, Part 830 — Unique Device Identification (current revision); accompanies labelling requirements in 21 CFR Part 801. Publisher: U.S. GPO / FDA."

@X x_fda_denovo_guidance := "FDA De Novo classification" :: literature [active]
  ref = "U.S. Food and Drug Administration. De Novo Classification Process (Evaluation of Automatic Class III Designation) — final rule and accompanying guidance; FD&C Act §513(f)(2). Document-family citation; specific final-guidance revisions evolve and should be verified for the current edition."

@X x_fda_breakthrough_guidance := "FDA Breakthrough Devices Program" :: literature [active]
  ref = "U.S. Food and Drug Administration. Breakthrough Devices Program — guidance for industry and Food and Drug Administration staff. Established under the 21st Century Cures Act §3051 (2016) amending FD&C Act §515B. Specific guidance revision dates evolve; cited at document-family level."

@X x_fda_humanfactors_2016 := "FDA human factors 2016" :: literature [active]
  ref = "U.S. Food and Drug Administration. Applying Human Factors and Usability Engineering to Medical Devices — final guidance for industry and FDA staff, 2016 (with companion list-of-device-types document; revisions ongoing)."

@X x_fda_cybersecurity_2023 := "FDA cybersecurity 2023" :: literature [active]
  ref = "U.S. Food and Drug Administration. Cybersecurity in Medical Devices: Quality System Considerations and Content of Premarket Submissions — final guidance, 2023 (issued following the Omnibus 2022 / Section 524B 'cyber device' provisions). Standard-family/era citation; verify current revision before substantive reliance."

@X x_fda_aiml_actionplan_2021 := "FDA AI/ML action plan 2021" :: literature [active]
  ref = "U.S. Food and Drug Administration. Artificial Intelligence/Machine Learning (AI/ML)-Based Software as a Medical Device (SaMD) Action Plan, January 2021 — with subsequent guidance on predetermined change control plans for AI/ML-enabled device software functions (draft/final-guidance revisions evolve)."

@X x_eu_mdr_2017_745 := "EU MDR Regulation (EU) 2017/745" :: literature [active]
  ref = "European Union. Regulation (EU) 2017/745 of the European Parliament and of the Council of 5 April 2017 on medical devices (Medical Device Regulation, MDR); date of application 26 May 2021 (with transitional provisions amended by Regulation (EU) 2023/607 extending certain MDR certificates). Publisher: Official Journal of the European Union."

@X x_eu_ivdr_2017_746 := "EU IVDR Regulation (EU) 2017/746" :: literature [active]
  ref = "European Union. Regulation (EU) 2017/746 of the European Parliament and of the Council of 5 April 2017 on in vitro diagnostic medical devices (IVDR); date of application 26 May 2022 (with transitional provisions). Publisher: Official Journal of the European Union."

@X x_meddev_2_12_1 := "MEDDEV 2.12-1 vigilance" :: literature [active]
  ref = "European Commission. MEDDEV 2.12-1 rev. 8 — Guidelines on a Medical Devices Vigilance System (legacy guidance under MDD; continues to inform vigilance terminology under MDR alongside MDCG guidance). Publisher: European Commission DG SANTE."

@X x_iso_13485_2016 := "ISO 13485:2016" :: literature [active]
  ref = "International Organization for Standardization. ISO 13485:2016 — Medical devices — Quality management systems — Requirements for regulatory purposes. Geneva: ISO."

@X x_iso_14971_2019 := "ISO 14971:2019" :: literature [active]
  ref = "International Organization for Standardization. ISO 14971:2019 — Medical devices — Application of risk management to medical devices. Geneva: ISO. (Companion technical report ISO/TR 24971 provides guidance.)"

@X x_iso_10993_1_2018 := "ISO 10993-1:2018" :: literature [active]
  ref = "International Organization for Standardization. ISO 10993-1:2018 — Biological evaluation of medical devices — Part 1: Evaluation and testing within a risk management process. Geneva: ISO. (Multi-part series ISO 10993-2 … 10993-23 cover specific endpoints.)"

@X x_iso_11135_family := "ISO 11135 EO sterilization (family)" :: literature [active]
  ref = "International Organization for Standardization. ISO 11135 family — Sterilization of health-care products — Ethylene oxide — Requirements for the development, validation and routine control of a sterilization process for medical devices. Specific revision year cited at family/era level (current edition family circa 2014 with subsequent amendments); verify exact applicable revision for a real program."

@X x_iso_11137_family := "ISO 11137 radiation sterilization (family)" :: literature [active]
  ref = "International Organization for Standardization. ISO 11137 family (Parts 1, 2, 3 etc.) — Sterilization of health care products — Radiation. Standard-family/era citation; verify exact applicable revision (current part-1 edition family circa 2006 with subsequent amendments)."

@X x_iso_17665_family := "ISO 17665 moist-heat sterilization (family)" :: literature [active]
  ref = "International Organization for Standardization. ISO 17665 family — Sterilization of health-care products — Moist heat — Requirements for the development, validation and routine control of a sterilization process for medical devices. Standard-family/era citation; verify exact applicable revision."

@X x_iec_62304_2006_a1 := "IEC 62304:2006 + A1:2015" :: literature [active]
  ref = "International Electrotechnical Commission. IEC 62304:2006 — Medical device software — Software life cycle processes, with Amendment 1 (2015). Geneva: IEC."

@X x_iec_62366_1_2015 := "IEC 62366-1:2015" :: literature [active]
  ref = "International Electrotechnical Commission. IEC 62366-1:2015 — Medical devices — Part 1: Application of usability engineering to medical devices (with subsequent amendments). Geneva: IEC."

@X x_imdrf_samd_framework := "IMDRF SaMD framework" :: literature [active]
  ref = "International Medical Device Regulators Forum (IMDRF) SaMD Working Group. Software as a Medical Device (SaMD): Key Definitions (IMDRF/SaMD WG/N10) and Possible Framework for Risk Categorization and Corresponding Considerations (IMDRF/SaMD WG/N12). Document-family citation; adopted/referenced by FDA and other IMDRF member regulators."

@X x_kramer_2012 := "Kramer DB et al. 2012" :: literature [active]
  ref = "Kramer DB, Xu S, Kesselheim AS. Regulation of medical devices in the United States and European Union. N Engl J Med 2012;366:848–855. (Companion analyses by the same and adjacent authors in PLoS Medicine examined the post-market safety record of FDA-approved devices; primary-author/era cited as the anchoring regulatory-comparative reference for this tape.)"
