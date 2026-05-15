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
# BIOLOGY-MEDICAL.tape — architecture-current (editable per v1.2)
# Event history → BIOLOGY-MEDICAL.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "biology-medical" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · biology↔medicine bridge knowledge SSOT"
  brief = "Biology↔medicine bridge knowledge SSOT · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "BIOLOGY-MEDICAL.log.tape"
  scope = "in-silico knowledge SSOT · NOT clinical advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see BIOLOGY-MEDICAL.log.tape audit"

@N scope_disclaimer := "clinical-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico biology↔medicine bridge substrate. Historical and epidemiological figures are paraphrased from published biomedical literature for modeling context only — they are NOT clinical advice, NOT a treatment protocol, and NOT a diagnostic guide. Real clinical decisions require a licensed clinician. All claims are in-silico simulator/metadata consistency only; the wet-lab → preclinical → clinical → regulatory boundary is explicitly out of scope (hexa-bio AGENTS.tape g8 / f2)."

# ── §1 Germ theory — microbial causation of disease ──────────────────

@D dom_germ_theory := "germ theory — microbial causation of infectious disease" :: domain [ok]
  pre-germ = "Before the mid-19th century, disease was attributed to miasma (bad air), humors, or supernatural causes. The germ-theory revolution established that specific transmissible agents cause specific diseases."
  pasteur-swan-neck = "Louis Pasteur's swan-neck flask experiments (1859–1861) refuted spontaneous generation and demonstrated that microbes in air cause spoilage — a foundational demonstration that living agents, not miasma, were the proximate cause of fermentation and putrefaction."
  lister-antecedent = "Joseph Lister read Pasteur's work and inferred that wound infection arose from airborne microbes, not bad air — the intellectual bridge from germ theory to surgical antisepsis (see [@mech_surgical_antisepsis])."
  |> "[@x_pasteur_1861]"

@D dom_koch_postulates := "Koch's postulates — causal proof of infectious disease" :: domain [ok]
  origin = "Robert Koch, 1884 era (exact lecture/publication sequence: Tuberculosis lecture 1882; formal postulate statement ~1884)."
  four-postulates = "1. The microorganism must be found in all cases of the disease. 2. It must be isolated from the diseased host and grown in pure culture. 3. The cultured microorganism must cause disease when introduced into a healthy susceptible host. 4. The microorganism must be reisolated from the experimentally diseased host and shown to be identical to the original isolate."
  impact = "Established a rigorous causal standard for linking a specific pathogen to a specific disease — the methodological foundation of medical microbiology."
  refinements = "Modern 'molecular Koch's postulates' (Falkow, 1988 era) extend the framework to virulence genes; some obligate intracellular parasites (e.g. Mycobacterium leprae) do not satisfy all four classically, so the postulates are guidelines, not an absolute rule."
  |> "[@x_koch_1884]"

# ── §2 Epidemiology — John Snow and the Broad Street pump ─────────────

@D dom_snow_epidemiology := "Snow 1854 — cholera, Broad Street pump, and the birth of modern epidemiology" :: domain [ok]
  event = "1854 Soho cholera outbreak, London. John Snow traced cases to a single contaminated water pump on Broad Street by systematic geographic mapping of cases — before the cholera bacterium was even identified."
  method = "Spot map of cholera deaths clustered around the pump; comparison of mortality between water companies supplying different districts; door-to-door interviews to identify exceptions."
  significance = "First major demonstration of epidemiologic case-mapping: established that waterborne transmission (not miasma) caused the outbreak; persuaded local authorities to remove the pump handle. Recognized as a founding act of modern epidemiology and public health."
  honesty = "The pump removal was one element in ending the outbreak; the epidemic was already waning when the handle was removed (Snow himself acknowledged this). The causal attribution to the pump is well-supported by his data even if timing is complex."
  |> "[@x_snow_1855]"

# ── §3 Surgical antisepsis and anesthesia ─────────────────────────────

@D dom_semmelweis := "Semmelweis 1847 — handwashing and puerperal fever" :: domain [ok]
  observation = "Ignaz Semmelweis (Vienna Maternity Hospital, 1847) observed that maternal mortality from puerperal fever was dramatically higher in the clinic staffed by medical students who came directly from cadaver dissection than in the midwife-staffed clinic — before germ theory was established."
  intervention = "Instituted chlorinated-lime handwashing. Mortality in the doctor-staffed clinic dropped to levels comparable to the midwife clinic."
  resistance = "His findings were rejected by much of the medical establishment during his lifetime; he died in 1865. The mechanism was not understood until germ theory matured (Pasteur, Koch). Retrospectively, his intervention anticipated both germ theory and aseptic technique."
  |> "[@x_semmelweis_1861]"

@D mech_surgical_antisepsis := "Lister 1867 — carbolic acid and surgical antisepsis" :: mechanism [ok]
  origin = "Joseph Lister applied Pasteur's germ-theory reasoning to surgery: wound infections were caused by microbes settling from air and instruments, not 'bad air' per the miasma view."
  method = "Carbolic acid (phenol) spray on wounds, instruments and dressings — published in a landmark series in The Lancet, 1867."
  impact = "Surgical wound infection and mortality fell dramatically; established antisepsis as surgical principle. Antisepsis (killing microbes on contact) preceded asepsis (excluding microbes from the operative field) as the dominant paradigm."
  |> "[@x_lister_1867]"

@D dom_anesthesia := "Morton 1846 — surgical anesthesia" :: domain [ok]
  event = "William T.G. Morton's public demonstration of ether anesthesia at Massachusetts General Hospital, October 16, 1846 ('Ether Day'). The first widely publicized successful demonstration of a patient undergoing painless surgery."
  impact = "Made prolonged, complex surgery feasible by eliminating the constraint of operating speed dictated by patient pain and movement; a prerequisite for the later development of sterile technique (post-Lister/Semmelweis) and modern surgery."
  prior-use = "Nitrous oxide was documented as an analgesic by Humphry Davy ~1800; Crawford Long used ether in 1842 but did not publish; Morton's priority claim was historically contested."
  |> "[@x_morton_1846]"

# ── §4 The antibiotic era ─────────────────────────────────────────────

@D dom_fleming_penicillin := "Fleming 1929 — penicillin discovery" :: domain [ok]
  observation = "Alexander Fleming, 1929: a contaminating Penicillium mould lysed a zone of Staphylococcus aureus colonies on a culture plate — the serendipitous observation that the mould produced an antibacterial substance he named penicillin."
  publication = "Fleming A. On the antibacterial action of cultures of a penicillium, with special reference to their use in the isolation of B. influenzae. Br J Exp Pathol 1929;10:226–236."
  limitation-then = "Fleming could not isolate sufficient stable penicillin for therapeutic use; it remained a laboratory curiosity for over a decade."
  |> "[@x_fleming_1929]"

@D dom_chain_florey_penicillin := "Chain & Florey 1940s — penicillin industrialization" :: domain [ok]
  work = "Ernst Boris Chain and Howard Walter Florey (Oxford, early 1940s) purified, stabilized and demonstrated therapeutic penicillin — first clinical use in humans 1941; partnership with US pharmaceutical industry scaled production in time for World War II battlefield use."
  nobel = "Fleming, Chain, and Florey shared the 1945 Nobel Prize in Physiology or Medicine."
  impact = "Opened the antibiotic era: previously lethal bacterial infections (septicemia, pneumonia, syphilis, wound infections) became treatable. The subsequent 'golden age of antibiotics' (~1940s–1960s) produced most of the major antibiotic classes still in use."
  |> "[@x_chain_florey_1940]"

# ── §5 Vaccinology — Jenner and the germ–immune link ─────────────────

@D dom_jenner_vaccine := "Jenner 1798 — cowpox and the first vaccine" :: domain [ok]
  origin = "Edward Jenner, 1798: observed that milkmaids who contracted cowpox (Vaccinia) were protected from smallpox. Tested the hypothesis by inoculating a child with cowpox material and then challenging with smallpox material — the child did not develop smallpox."
  publication = "An Inquiry into the Causes and Effects of the Variolae Vaccinae, Jenner, 1798."
  etymology = "'Vaccine' derives from Vacca (Latin: cow) — named by Louis Pasteur in honor of Jenner when Pasteur generalised the principle to other pathogens."
  cross-link = "Variolation (deliberate inoculation with smallpox material) predated Jenner's cowpox approach by decades in the Ottoman Empire and was introduced to the American colonies by Cotton Mather / Onesimus (~1721). Jenner's innovation was using a cross-reactive but milder agent."
  impact = "Led ultimately to the global eradication of smallpox (1980, WHO declaration) — the only human disease eradicated to date."
  ?> VACCINE_IMMUNOLOGY
  |> "[@x_jenner_1798]"

# ── §6 Diagnostic imaging and electrophysiology ───────────────────────

@D dom_xray := "Röntgen 1895 — X-ray discovery and diagnostic imaging" :: domain [ok]
  discovery = "Wilhelm Conrad Röntgen, November 8, 1895: observed that cathode-ray tube experiments produced a new ray capable of penetrating soft tissue and imaging bone — named 'X-ray' for its unknown nature."
  first-image = "Röntgen produced the first medical radiograph — an image of his wife Bertha's hand — within weeks of the discovery."
  nobel = "First Nobel Prize in Physics, 1901."
  impact = "Inaugurated non-invasive anatomical imaging; X-ray diagnosis entered clinical practice within months of the discovery, an unusually rapid translation. CT, fluoroscopy, mammography and interventional radiology all descend from this discovery."
  |> "[@x_rontgen_1895]"

@D dom_ecg := "Einthoven ~1903 — ECG and cardiac electrophysiology" :: domain [ok]
  origin = "Willem Einthoven developed a practical string galvanometer capable of recording the electrical activity of the heart with sufficient fidelity for clinical use — published results from approximately 1902–1906."
  leads = "Defined the limb-lead system (leads I, II, III) and the standard ECG waveform nomenclature (P, Q, R, S, T waves) that remains in use."
  nobel = "Nobel Prize in Physiology or Medicine, 1924."
  impact = "Enabled non-invasive diagnosis of arrhythmias, myocardial infarction and conduction disease; the ECG remains a first-line cardiac diagnostic tool over a century later."
  |> "[@x_einthoven_1903]"

# ── §7 Genomics to clinic — pharmacogenomics ─────────────────────────

@D dom_pharmacogenomics := "pharmacogenomics — genotype-guided dosing" :: domain [ok]
  definition = "Pharmacogenomics studies how an individual's genetic variants alter drug metabolism, efficacy and toxicity — enabling genotype-guided prescribing."
  warfarin-cyp2c9-vkorc1 = "Warfarin (anticoagulant with narrow therapeutic index): CYP2C9 variants reduce metabolic clearance → higher drug exposure → bleeding risk at standard doses. VKORC1 variants alter the target enzyme sensitivity → dose requirements differ up to 5-fold across genotypes. FDA label updated to include pharmacogenomic information."
  abacavir-hla = "Abacavir (HIV antiretroviral): HLA-B*5701 allele is the required predisposing factor for severe hypersensitivity reaction. Prospective HLA-B*5701 screening before abacavir prescription eliminated the reaction in screened populations. A clean example of a pharmacogenomic test with unambiguous clinical utility and regulatory adoption."
  cross-links = "?> CANCER-THERAPY (oncology pharmacogenomics: e.g. DPYD variants + fluoropyrimidines); ?> BIO-PHARMA (drug metabolism substrate of drug discovery pipeline)"
  |> "[@x_johnson_2017] · [@x_mallal_2008]"

@D dom_watson_crick := "Watson & Crick 1953 — DNA double helix, the foundation" :: domain [ok]
  publication = "Watson JD, Crick FHC. Molecular structure of nucleic acids: a structure for deoxyribose nucleic acid. Nature 1953;171:737–738."
  significance = "Proposed the double-helix structure of DNA with complementary base pairing — immediately suggesting the copying mechanism ('It has not escaped our notice that the specific pairing we have postulated immediately suggests a possible copying mechanism for the genetic material.')."
  context = "Built on X-ray crystallography data from Rosalind Franklin and Raymond Gosling (Photo 51); Nobel Prize in Physiology or Medicine 1962 (Watson, Crick, Wilkins; Franklin died 1958)."
  downstream = "The molecular basis of heredity → central dogma (Crick 1958) → restriction enzymes (Arber/Smith/Nathans 1970s) → recombinant DNA → sequencing (Sanger 1977) → PCR (Mullis 1983) → Human Genome Project (2003) → next-generation sequencing → pharmacogenomics, CRISPR."
  cross-link = "crispr-gene-editing/ (hexa-bio CRISPR axis); CANCER-THERAPY (driver genetics)"
  |> "[@x_watson_crick_1953]"

# ── §8 One Health — zoonosis and pandemic spillover ───────────────────

@D dom_one_health := "One Health — zoonosis and cross-species spillover" :: domain [ok]
  concept = "One Health recognizes that human health, animal health, and environmental health are interdependent. Emerging infectious diseases predominantly originate as zoonoses (pathogens crossing from animal reservoirs to humans)."
  sars-2003 = "SARS-CoV-1 (2002–2003): betacoronavirus; reservoir = horseshoe bats (Rhinolophus); intermediate host = palm civets in live-animal markets; human pandemic starting in Guangdong, China. Contained through quarantine and surveillance; ~8,000 cases, ~10% case-fatality rate."
  mers-2012 = "MERS-CoV (first identified 2012): betacoronavirus; reservoir = dromedary camels; geographically concentrated in Arabian Peninsula; ongoing sporadic spillover. Not pandemic-scale but sustained zoonotic transmission interface."
  covid-19-2019 = "SARS-CoV-2 / COVID-19 (emerged 2019, declared pandemic 2020): betacoronavirus closely related to bat coronaviruses; intermediate host not definitively established. Caused a global pandemic, demonstrating that novel zoonotic respiratory pathogens can spread globally with pandemic potential before countermeasures scale."
  historical-pattern = "Influenza pandemics (1918 H1N1, 1957 H2N2, 1968 H3N2, 2009 H1N1) and HIV (SIV spillover from non-human primates, ~1920s–1950s) follow the same cross-species emergence pattern."
  honesty = "Intermediate-host and precise spillover-route details for SARS-CoV-2 remain under scientific investigation as of knowledge cutoff; claims here describe the epidemiological consensus, not resolved mechanistic certainty."
  |> "[@x_drosten_2003] · [@x_who_covid_2020]"

# ── §9 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_amr := "antimicrobial resistance (AMR) — WHO global priority pathogen threat" :: real-limit [ok required]
  wall = "HARD WALL (evolutionary — irreversible selection once resistance spreads)"
  statement = "Antimicrobial resistance arises by Darwinian selection under antibiotic pressure: de-novo mutation, horizontal gene transfer (plasmids, integrons), and clonal spread of resistant lineages. Once widespread resistance establishes in a pathogen population, it is practically irreversible on human timescales absent sustained stewardship and novel-agent development."
  scale = "The WHO Global Priority Pathogens List (2017) identifies the most critical AMR threats (ESKAPE pathogens and others); carbapenem-resistant Gram-negatives and methicillin-resistant Staphylococcus aureus (MRSA) represent currently life-threatening examples with limited remaining options."
  antibiotic-pipeline = "The antibiotic discovery pipeline has historically lagged resistance emergence; the post-golden-age (~1960s–present) period has produced few truly novel antibiotic classes."
  consequence = "AMR is a hard evolutionary ceiling on antibiotic utility — not a deficiency of dosing or adherence alone, but a fundamental biological limit on any single-mechanism antimicrobial used at scale."
  |> "[@x_who_amr_2017] · [@x_chain_florey_1940]"

@D lim_hai := "hospital-acquired infections (HAI) — healthcare transmission paradox" :: real-limit [ok required]
  wall = "HARD WALL (institutional / ecological)"
  statement = "Healthcare settings concentrate immunocompromised hosts, invasive devices, and antibiotic-selected microbial communities, creating a structural transmission ecology that is partially irreducible even with best-practice infection control."
  scope = "HAIs include CLABSI (central-line-associated bloodstream infection), CAUTI (catheter-associated UTI), ventilator-associated pneumonia (VAP), Clostridioides difficile infection (CDI), and surgical-site infections. In aggregate, they affect millions of patients annually in high-income countries alone."
  consequence = "Some baseline HAI rate is an emergent property of intensive care; the floor cannot reach zero because immunodeficient hosts in close proximity to device surfaces are a structural risk regardless of control effort. The real limit is the irreducible residual after best-practice measures, not the achievable reduction."
  |> "[@x_who_hai_2011]"

@D lim_translational_gap := "translational gap (Eroom's Law) — biology-to-clinic attrition" :: real-limit [ok required]
  wall = "SOFT WALL (economic / biological / regulatory)"
  statement = "Drug development attrition rates are high: the large majority of candidate drugs that show activity in preclinical models fail in human trials. Eroom's Law (Scannell et al.) observes that R&D productivity in terms of new drugs per dollar has declined for decades — the opposite of Moore's Law."
  causes = "Complexity of human biology vs in-vitro/animal models; safety signals that emerge only in diverse human populations; regulatory evidence requirements; publication bias inflating preclinical effect estimates."
  cross-link = "?> BIO-PHARMA (drug-discovery pipeline)"
  consequence = "The biology↔medicine bridge is the hardest part of biomedical science: in-silico and in-vitro evidence is necessary but not sufficient. An explicit real-world limit that this tape's scope (in-silico SSOT) cannot resolve — per g8/f2."
  |> "[@x_scannell_2012]"

@D lim_diagnostic_error := "diagnostic error — cognitive and systemic floor" :: real-limit [ok required]
  wall = "SOFT WALL (cognitive / information-theoretic)"
  statement = "Diagnostic error (incorrect, delayed, or missed diagnosis) affects an estimated ~10–15% of clinical encounters in some studies (figures vary widely by methodology and setting). It arises from cognitive bias, information overload, atypical presentations, and system factors — not solely from lack of knowledge."
  irreducibility = "Zero-error diagnosis is not achievable: human cognition has irreducible heuristic biases (availability, anchoring, premature closure); disease presents atypically; diagnostic tests have sensitivity/specificity below unity. Quality improvement reduces but cannot eliminate the floor."
  consequence = "A real cognitive/systemic limit that does not dissolve with more information volume alone — relevant to any in-silico decision-support tool claiming to eliminate diagnostic error."
  |> "[@x_graber_2005]"

@D lim_health_equity := "health equity — access and social determinants" :: real-limit [ok required]
  wall = "HARD WALL (structural / socioeconomic)"
  statement = "Mortality and morbidity from preventable disease are systematically distributed along socioeconomic, racial/ethnic, and geographic lines, independent of the biomedical knowledge available. The existence of a therapy does not guarantee its access or uptake."
  sdh = "Social determinants of health (income, education, housing, food security, environmental exposure) account for a large fraction of population-level health variation — arguably larger than clinical-care access."
  consequence = "In-silico biomedical knowledge SSOTs (including this tape) operate at the biology layer; closing the biology↔health-outcome gap requires addressing structural and economic limits that are outside the scope of any molecular modeling system. Honest acknowledgment is required by g8/f2 (no in-silico→clinical-outcome conflation)."
  |> "[@x_marmot_2010]"

# ── §10 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-biology-medical" :: governance [required deny:write]
  pattern = "Deriving biology-medical efficacy / disease counts / staging / mechanism counts FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's '진단 정확도 99% because σ·sopfr/10' or '모니터 지표 수=12=σ' or 'Koch postulates = 4 = τ'."
  why = "This is exactly the violation the pre-rewrite BIOLOGY-MEDICAL.tape committed (lattice-tautology stub, mass-split 153b5a2 — see BIOLOGY-MEDICAL.log.tape audit). hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2 forbid it: f1 forbids lattice-fit, f2 forbids in-silico→clinical claims."
  remedy = "Cite real biomedical history / landmark clinical literature (this tape's @X entries). Lattice may only be a coincidental OBSERVATION, never a derivation source for any biology-medical claim."

@N n6_honest_stance := "biology↔medical bridge has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: the biology↔medicine domain exposes NO natural n=6 invariant. Koch's postulates are 4 (not 6) — and even those 4 are guidelines with documented exceptions, not a closed invariant. Norwood staging (AGA, cross-link) is VII, not 6. TNM stage groups are clinical ordinals (see CANCER-THERAPY.tape). The antibiotic classes are not 6. Coronaviruses of pandemic concern are not 6. Diagnostic-error rate is an empirical range, not a lattice fraction. Per LATTICE_POLICY g1/g2 + lattice-as-tool: the lattice is DECLINED here as a derivation tool — numeric coincidences may exist in any domain, but are OBSERVATION ONLY, never derivation. This honesty is the corrective for the audited lattice-tautology stub this file replaced."

# ── §11 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 germ-theory causal Koch test" :: prediction [ok]
  claim = "A pathogen candidate satisfying all four of Koch's postulates (isolated, pure-cultured, disease reproduced, reisolated) in a properly controlled experiment constitutes strong causal evidence for that pathogen-disease relationship."
  falsifier = "If a properly controlled experiment satisfies all four postulates for a microorganism that provably does NOT cause the disease in question (e.g., using an independently verified non-causal isolate), Koch's postulate framework as a causal standard is wrong."
  source = "[@x_koch_1884]"

@D tp_2 := "TP-2 AMR evolutionary inevitability" :: prediction [ok]
  claim = "Any new antibiotic class deployed at sufficient scale and duration will eventually select for resistant organisms — resistance will be detectable in clinical isolates within years to decades of widespread use."
  falsifier = "If an antibiotic deployed at high volume across a large population showed no detectable resistance emergence after several decades of use, [@lim_amr] is empirically wrong for that compound class."
  source = "[@x_who_amr_2017] · [@x_chain_florey_1940]"

@D tp_3 := "TP-3 pharmacogenomic abacavir HLA screen" :: prediction [ok]
  claim = "Prospective HLA-B*5701 screening before abacavir prescription eliminates abacavir hypersensitivity reactions in tested populations — confirmed by the PREDICT-1 RCT."
  falsifier = "If a properly powered prospective study showed HLA-B*5701-negative patients experiencing abacavir hypersensitivity at the same rate as unscreened populations, the HLA-B*5701 pharmacogenomic mechanism is wrong."
  source = "[@x_mallal_2008]"

# ── §12 Cross-links ───────────────────────────────────────────────────

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity) · @F f2 (no in-silico→clinical claims). This tape complies: real biomedical history and science, in-silico knowledge SSOT only, lattice declined as a derivation tool."

@X x_cancer_therapy_sibling := "CANCER-THERAPY.tape (hexa-bio)" :: sibling-tape [active]
  scope = "Oncology modality landscape + driver genetics; cross-linked from pharmacogenomics and translational-gap entries."

@X x_bio_pharma_sibling := "bio-pharma/ (hexa-bio)" :: sibling-tape [active]
  scope = "Pharmaceutical workflow primitives; cross-linked from translational-gap + pharmacogenomics."

@X x_crispr_sibling := "crispr-gene-editing/ (hexa-bio)" :: sibling-tape [active]
  scope = "CRISPR primitives; downstream of Watson-Crick/DNA structure → molecular-biology lineage."

# ── §13 External citations (real, landmark literature) ────────────────
# Where a specific bibliographic detail is not asserted with confidence,
# the entry names the primary author + era only and says so explicitly.

@X x_pasteur_1861 := "Pasteur (swan-neck flasks, ~1859–1861)" :: literature [active]
  ref = "Louis Pasteur — swan-neck flask experiments refuting spontaneous generation and demonstrating microbial causation of fermentation/putrefaction (primary author/era; exact volume not asserted — the key reports appeared in Comptes rendus de l'Académie des Sciences, ~1859–1861). Foundational for [@dom_germ_theory]."

@X x_koch_1884 := "Koch (postulates, ~1882–1884 era)" :: literature [active]
  ref = "Robert Koch — tuberculosis lecture 1882 (Berlin Physiological Society); formal postulate statement published ~1884 in Koch R, 'Über die Aetiologie der Tuberkulose', Mitteilungen aus dem Kaiserlichen Gesundheitsamte (primary author/era; precise volume/page not asserted with full confidence). Foundation of [@dom_koch_postulates]."

@X x_snow_1855 := "Snow 1855 — On the Mode of Communication of Cholera" :: literature [active]
  ref = "Snow J. On the Mode of Communication of Cholera. 2nd ed. London: John Churchill; 1855. (includes the Broad Street pump spot-map data and comparison of water-company districts from the 1854 Soho outbreak). Foundation of [@dom_snow_epidemiology]."

@X x_semmelweis_1861 := "Semmelweis 1861 (puerperal fever, author/era)" :: literature [active]
  ref = "Ignaz Semmelweis — Die Ätiologie, der Begriff und die Prophylaxis des Kindbettfiebers. Pest/Wien/Leipzig: Hartleben; 1861. (his own account of the handwashing intervention and its mortality impact; primary author and publication-era cited). Foundation of [@dom_semmelweis]."

@X x_lister_1867 := "Lister 1867 — Lancet antiseptic principle" :: literature [active]
  ref = "Lister J. On the antiseptic principle in the practice of surgery. Lancet 1867;2:353–356. (carbolic acid antisepsis; primary-author/year cited; exact Lancet volume number flagged as author/era-asserted). Foundation of [@mech_surgical_antisepsis]."

@X x_morton_1846 := "Morton 1846 — ether anesthesia (author/era)" :: literature [active]
  ref = "William T.G. Morton — public demonstration of ether anesthesia, Massachusetts General Hospital, 16 October 1846 ('Ether Day'). Contemporary accounts in The Boston Medical and Surgical Journal and other period journals; exact volume/page not asserted. Foundation of [@dom_anesthesia]."

@X x_fleming_1929 := "Fleming 1929 — penicillin" :: literature [active]
  ref = "Fleming A. On the antibacterial action of cultures of a penicillium, with special reference to their use in the isolation of B. influenzae. Br J Exp Pathol 1929;10:226–236. Foundation of [@dom_fleming_penicillin]."

@X x_chain_florey_1940 := "Chain & Florey (penicillin, 1940s era)" :: literature [active]
  ref = "Chain E, Florey HW, Gardner AD, Heatley NG, Jennings MA, Orr-Ewing J, Sanders AG. Penicillin as a chemotherapeutic agent. Lancet 1940;2:226–228. (first published clinical-stage penicillin paper; primary authors/year). Foundation of [@dom_chain_florey_penicillin] + AMR context in [@lim_amr]."

@X x_jenner_1798 := "Jenner 1798 — cowpox vaccine" :: literature [active]
  ref = "Jenner E. An Inquiry into the Causes and Effects of the Variolae Vaccinae. London: Low; 1798. Foundation of [@dom_jenner_vaccine]."

@X x_rontgen_1895 := "Röntgen 1895 — X-ray discovery" :: literature [active]
  ref = "Röntgen WC. Über eine neue Art von Strahlen. Sitzungsberichte der Physikalisch-Medizinischen Gesellschaft zu Würzburg 1895;137:132–141. (primary German publication of the X-ray discovery; author/year cited; exact page range flagged as author/era-asserted). Foundation of [@dom_xray]."

@X x_einthoven_1903 := "Einthoven (~1902–1906 era) — ECG" :: literature [active]
  ref = "Willem Einthoven — string galvanometer ECG, published across ~1902–1906 in Pflüger's Archiv and other journals (primary author/era cited; exact volume not asserted). Nobel Prize in Physiology or Medicine 1924. Foundation of [@dom_ecg]."

@X x_watson_crick_1953 := "Watson & Crick 1953" :: literature [active]
  ref = "Watson JD, Crick FHC. Molecular structure of nucleic acids: a structure for deoxyribose nucleic acid. Nature 1953;171:737–738. Foundation of [@dom_watson_crick]."

@X x_johnson_2017 := "Johnson JA et al — PharmGKB / warfarin pharmacogenomics" :: literature [active]
  ref = "Johnson JA et al. Clinical Pharmacogenomics Implementation Consortium (CPIC) guideline for pharmacogenomics-guided warfarin dosing: 2017 update. Clin Pharmacol Ther 2017;102:397–404. (CYP2C9 + VKORC1 warfarin-dosing guideline). Supports [@dom_pharmacogenomics]."

@X x_mallal_2008 := "Mallal S et al 2008 — PREDICT-1 abacavir HLA" :: literature [active]
  ref = "Mallal S et al. HLA-B*5701 screening for hypersensitivity to abacavir. N Engl J Med 2008;358:568–579. (PREDICT-1 RCT: prospective HLA-B*5701 screening eliminates abacavir hypersensitivity). Supports [@dom_pharmacogenomics] and [@tp_3]."

@X x_drosten_2003 := "Drosten C et al 2003 — SARS-CoV-1 identification" :: literature [active]
  ref = "Drosten C et al. Identification of a novel coronavirus in patients with severe acute respiratory syndrome. N Engl J Med 2003;348:1967–1976. (SARS-CoV-1 identification; landmark zoonosis spillover paper). Supports [@dom_one_health]."

@X x_who_covid_2020 := "WHO — COVID-19 pandemic declaration 2020 (institutional)" :: literature [active]
  ref = "World Health Organization. WHO Director-General's opening remarks at the media briefing on COVID-19, 11 March 2020 (pandemic declaration). Institutional citation for global SARS-CoV-2/COVID-19 pandemic context. Supports [@dom_one_health]."

@X x_who_amr_2017 := "WHO Global Priority Pathogens List 2017 (institutional)" :: literature [active]
  ref = "World Health Organization. Global priority list of antibiotic-resistant bacteria to guide research, discovery, and development of new antibiotics. Geneva: WHO; 2017. Institutional citation for [@lim_amr]."

@X x_who_hai_2011 := "WHO — Report on HAI burden (institutional)" :: literature [active]
  ref = "World Health Organization. Report on the Burden of Endemic Health Care-Associated Infection Worldwide. Geneva: WHO; 2011. Institutional citation for [@lim_hai]."

@X x_scannell_2012 := "Scannell JW et al 2012 — Eroom's Law" :: literature [active]
  ref = "Scannell JW, Blanckley A, Boldon H, Warrington B. Diagnosing the decline in pharmaceutical R&D efficiency. Nat Rev Drug Discov 2012;11:191–200. (Eroom's Law — declining drug-R&D productivity; translational-gap framing). Supports [@lim_translational_gap]."

@X x_graber_2005 := "Graber ML et al 2005 — diagnostic error" :: literature [active]
  ref = "Graber M, Franklin N, Gordon R. Diagnostic error in internal medicine. Arch Intern Med 2005;165:1493–1499. (cognitive-bias taxonomy; baseline diagnostic-error rate estimates). Supports [@lim_diagnostic_error]."

@X x_marmot_2010 := "Marmot M et al 2010 — social determinants of health" :: literature [active]
  ref = "Marmot M et al. Fair Society, Healthy Lives (The Marmot Review): Strategic Review of Health Inequalities in England post-2010. London: The Marmot Review; 2010. (social determinants of health; health equity). Supports [@lim_health_equity]."
