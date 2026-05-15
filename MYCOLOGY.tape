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
# MYCOLOGY.tape — architecture-current (editable per v1.2)
# Event history → MYCOLOGY.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "mycology" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · mycology substrate — fungi biology knowledge SSOT"
  brief = "Fungi biology · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "MYCOLOGY.log.tape"
  scope = "in-silico mycology knowledge SSOT · NOT wet-lab / clinical / food-safety / regulatory claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see MYCOLOGY.log.tape audit"

@N scope_disclaimer := "knowledge-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico mycology substrate. Figures (species estimates, diversity ranges, antifungal efficacy contexts) are paraphrased from published mycological literature for modeling context ONLY — they are NOT a cultivation protocol, antifungal prescribing guide, food-safety certification, or regulatory claim. Wet-lab / clinical / regulatory steps are out-of-repo scope per hexa-bio AGENTS.tape g8/g9."

# ── §1 Fungal cell biology ─────────────────────────────────────────────

@D dom_cell_wall := "fungal cell wall — chitin distinguishes fungi from plants" :: domain [ok]
  composition = "Primary structural polymer is chitin (N-acetylglucosamine polymer via β-1,4 linkages), distinguishing fungi from plants (cellulose) and animals (none). β-1,3-glucan forms the matrix; mannan and galactomannan are outer-layer polysaccharides in many species."
  significance = "Chitin and β-1,3-glucan are absent from mammals, making them prime antifungal drug targets (echinocandins inhibit β-1,3-glucan synthase; see §5 antifungals)."
  |> "[@x_gow_2017]"

@D dom_hyphal_growth := "hyphae, mycelium, and apical extension" :: domain [ok]
  hyphae = "Fungi grow as tubular filaments (hyphae); the branching network is the mycelium — the dominant vegetative body in most multicellular fungi."
  apical = "Growth occurs at the hyphal tip (apical extension); turgor pressure drives elongation via new wall material delivered by vesicles (Spitzenkörper)."
  septation = "Ascomycota and Basidiomycota hyphae are septate (cross-walls with septal pores allowing cytoplasmic streaming); Zygomycota (broad sense) are predominantly coenocytic (aseptate — multinucleate with no cross-walls)."
  yeast-form = "Some fungi exhibit yeast (unicellular) form; dimorphic fungi (e.g. Histoplasma, Candida albicans) switch between hyphal and yeast morphologies in response to temperature, CO₂, or nutrient cues — a virulence-relevant transition."
  |> "[@x_gow_2017]"

@D dom_reproduction := "fungal reproduction — spores, meiosis, dikaryosis" :: domain [ok]
  asexual = "Conidia (asexual spores) produced on specialised structures (conidiophores in Aspergillus, Penicillium); sporangiospores in Mucoromycota; blastoconidia in Candida."
  sexual = "Sexual reproduction via fusion of compatible mating types; Basidiomycota maintain a prolonged dikaryotic stage (two genetically distinct nuclei per cell) before nuclear fusion (karyogamy) and meiosis."
  dispersal = "Spore dispersal by air, water, or vectors; atmospheric sampling commonly detects Cladosporium, Alternaria, Aspergillus, Penicillium conidia as the dominant fungal air spora."

# ── §2 Classification — five major phyla ──────────────────────────────

@D cls_ascomycota := "Ascomycota — the largest fungal phylum" :: classification [ok]
  morphology = "Define by sexual spore (ascospore) borne in a sac (ascus); usually in a fruiting body (ascocarp). Hyphae septate."
  diversity = "Includes: yeasts (Saccharomyces cerevisiae — baker's/brewer's yeast); Penicillium (blue/green moulds, including P. chrysogenum penicillin source and P. roqueforti/camemberti cheese fungi); Aspergillus (A. niger, A. flavus, A. fumigatus — industrial + pathogenic); Neurospora crassa (classical genetics model); truffles (Tuber)."
  honesty = "Ascomycota is the largest described phylum by species count (~64,000+ described species, per estimates in the mycological literature — not a lattice-fixed number)."
  |> "[@x_hawksworth_2017] · [@x_james_2006]"

@D cls_basidiomycota := "Basidiomycota — mushrooms, rusts, smuts" :: classification [ok]
  morphology = "Define by sexual spores (basidiospores) borne externally on a club-shaped cell (basidium). Prolonged dikaryotic stage (see [@dom_reproduction])."
  diversity = "Includes: mushrooms (Agaricus bisporus — cultivated; Amanita phalloides — death cap); bracket fungi; ectomycorrhizal partners (Suillus, Boletus, Pisolithus — critical for forest trees; see §4); white-rot fungi (Trametes versicolor, Phanerochaete chrysosporium — lignin degraders, see §3); smuts (Ustilago maydis on maize); rusts (Puccinia graminis on wheat, see §6)."
  |> "[@x_james_2006]"

@D cls_zygomycota := "Mucoromycota / classical Zygomycota — coenocytic moulds" :: classification [ok]
  note = "Classical 'Zygomycota' has been reclassified; the core group is now Mucoromycota; Kickxellomycotina and others are separate lineages. Retained here as 'Zygomycota' for cross-referencing convenience with older literature."
  representatives = "Rhizopus stolonifer (bread mould); Mucor spp. Coenocytic hyphae (aseptate)."
  clinical-note = "Mucormycosis (rhinocerebral, pulmonary, cutaneous) is caused by Mucoromycota members (Rhizopus, Mucor, Lichtheimia); invasive in immunocompromised hosts, high mortality. Angioinvasion is a hallmark."
  |> "[@x_james_2006]"

@D cls_chytridiomycota := "Chytridiomycota — the basal aquatic phylum" :: classification [ok]
  morphology = "Oldest diverging fungal lineage; produce motile zoospores with a single posterior flagellum — the only flagellate fungi."
  ecology = "Predominantly aquatic/soil decomposers of pollen, chitin, keratin."
  disease = "Batrachochytrium dendrobatidis (Bd) causes chytridiomycosis in amphibians — one of the most impactful wildlife diseases recorded, linked to global amphibian declines (see [@lim_chytrid_amphibian])."
  |> "[@x_berger_1998] · [@x_skerratt_2007]"

@D cls_glomeromycota := "Glomeromycota — arbuscular mycorrhizal fungi" :: classification [ok]
  morphology = "Obligate biotrophic symbionts; form arbuscular mycorrhizal (AM) associations with plant roots. Asexual only (no known sexual stage); large multi-nucleate spores."
  ecology = "Associate with >70% of land plant species; among the most ecologically significant fungi globally. Phosphorus acquisition is the dominant exchange: fungus delivers P (and other nutrients) to plant in exchange for photosynthate."
  honesty = ">70% land-plant figure is a widely cited estimate from the mycorrhizal symbiosis literature; see [@x_smith_read_2008]. Exact percent varies with dataset/methodology."
  |> "[@x_smith_read_2008] · [@x_james_2006]"

# ── §3 Ecological roles — decomposers ─────────────────────────────────

@D dom_decomposers := "fungi as primary decomposers — white-rot, brown-rot" :: domain [ok]
  white-rot = "White-rot fungi (Basidiomycota: Trametes versicolor, Phanerochaete chrysosporium, Pleurotus ostreatus) are the primary biodegraders of lignin — the recalcitrant aromatic polymer that locks carbon in woody biomass. They deploy ligninolytic peroxidases (manganese peroxidase, lignin peroxidase) and laccases. This is the dominant pathway for carbon release from woody substrates in terrestrial ecosystems."
  brown-rot = "Brown-rot fungi (Basidiomycota: Postia placenta, Serpula lacrymans) degrade cellulose and hemicellulose while leaving a modified lignin residue; responsible for the characteristic cubical cracking of rotted timber. Hydroxyl-radical (Fenton chemistry) mechanism."
  ecological-significance = "Without fungal decomposition, terrestrial carbon cycling would be severely impaired — dead woody biomass would accumulate rather than re-enter the carbon cycle. Fungi thus underpin nutrient cycling and soil organic matter formation."
  |> "[@x_floudas_2012]"

@D dom_mycorrhizal_ecology := "mycorrhizal symbioses — ecto and arbuscular" :: domain [ok]
  ectomycorrhizal = "Ectomycorrhizal (ECM) fungi (mainly Basidiomycota/Ascomycota: Suillus, Boletus, Pisolithus, Amanita, Cenococcum) ensheath root tips in a Hartig net without penetrating cells. Dominant in boreal and temperate forest trees (Pinus, Picea, Fagus, Betula, Quercus). ECM networks connect multiple trees; nutrient (especially N and P) and possibly carbon transfer between trees via the hyphal network ('wood-wide web') is documented, though transfer magnitude and direction remain active research."
  arbuscular = "Arbuscular mycorrhizal (AM) fungi (Glomeromycota; see [@cls_glomeromycota]) penetrate root cortical cells, forming arbuscules (branched haustoria for symbiotic exchange). AM associations dominate tropical and agricultural ecosystems — the primary mechanism by which most crop plants acquire phosphorus from low-P soils."
  phosphorus-acquisition = "Plant phosphorus acquisition via AM/ECM hyphal networks extends the effective root-absorption volume beyond root-hair length, accessing soil P pools inaccessible to roots alone. Agronomically significant under P-limited conditions."
  |> "[@x_smith_read_2008]"

# ── §4 Species diversity ───────────────────────────────────────────────

@D dom_species_diversity := "fungal species diversity — Hawksworth estimate" :: domain [ok]
  described = "Approximately 120,000–150,000 fungal species have been formally described and named (figure from Hawksworth & Lücking 2017 era estimate)."
  estimated-total = "The total estimated species richness is approximately 2.2–3.8 million, based on scaling from described diversity, habitat extrapolation, and molecular methods — the majority remain undiscovered. The 1.5 million figure (Hawksworth 1991) was a widely cited earlier estimate; the 2017 update raised it to 2.2–3.8 million."
  honesty = "Range reflects genuine uncertainty in sampling and extrapolation methodology. The estimate is author/era-flagged (Hawksworth & Lücking 2017); exact volume cited below."
  implication = "Discovery of the estimated described fraction (~3–5% of total) is a major limit — see [@lim_species_gap]."
  |> "[@x_hawksworth_2017]"

# ── §5 Antifungal pharmacology ─────────────────────────────────────────

@D dom_echinocandins := "echinocandins — β-1,3-glucan synthase inhibitors" :: domain [ok]
  moa = "Echinocandins (caspofungin, micafungin, anidulafungin) noncompetitively inhibit the Fks subunit of β-1,3-glucan synthase, disrupting fungal cell-wall synthesis. Fungicidal against Candida; fungistatic against Aspergillus."
  spectrum = "Best activity against Candida spp. (including most Candida auris isolates); variable activity against moulds. Inactive against Cryptococcus (low glucan content) and Mucorales."
  target-honesty = "β-1,3-glucan is absent from mammalian cells — the basis of the drug class's selectivity. This is real cell-biology selectivity, not a lattice-derived drug count."
  |> "[@x_pfaller_2012]"

@D dom_azoles := "azoles — ergosterol biosynthesis inhibitors" :: domain [ok]
  moa = "Triazoles (fluconazole, itraconazole, voriconazole, posaconazole, isavuconazole) and imidazoles inhibit fungal CYP51 (lanosterol 14α-demethylase), blocking ergosterol synthesis. Ergosterol is the primary sterol of fungal membranes (vs. cholesterol in mammals) — another selectivity basis."
  spectrum = "Fluconazole: Candida spp. (C. krusei intrinsically resistant; C. glabrata often reduced susceptibility). Voriconazole: Aspergillus (first-line invasive aspergillosis). Posaconazole/isavuconazole: also Mucorales coverage."
  resistance = "CYP51 point mutations, efflux pump upregulation (CDR1/2, MDR1), and ERG3 mutations confer azole resistance. Azole-resistant A. fumigatus (cyp51A TR34/L98H) emerging in agriculture-adjacent environmental exposure to triazole fungicides — an antifungal resistance route that bypasses the patient (see [@lim_antifungal_resistance])."
  |> "[@x_pfaller_2012]"

@D dom_polyenes := "polyenes — ergosterol binding / membrane disruption" :: domain [ok]
  moa = "Polyenes (amphotericin B, nystatin) bind ergosterol in the fungal membrane, forming pores that cause ion leakage and cell death. Broad spectrum, fungicidal."
  amphotericin = "Amphotericin B deoxycholate: the broad-spectrum fallback for severe/resistant infections; nephrotoxicity is the dose-limiting adverse effect. Lipid formulations (liposomal amphotericin B) reduce nephrotoxicity while retaining efficacy."
  candida-auris = "Candida auris (emerging since ~2009) shows variable, often high-level resistance to all three antifungal classes (azoles, echinocandins, polyenes) — pan-resistant isolates documented (see [@lim_antifungal_resistance])."
  |> "[@x_pfaller_2012]"

# ── §6 Fungal pathogens of plants ─────────────────────────────────────

@D dom_wheat_rust := "Puccinia graminis — wheat stem rust" :: domain [ok]
  biology = "Puccinia graminis f. sp. tritici (Pgt) is a heteroecious Basidiomycota rust: sexual cycle on barberry (Berberis), asexual urediniospore cycle on wheat. Airborne urediniospores can travel intercontinentally."
  impact = "One of the most destructive wheat pathogens historically; responsible for major pre-Green-Revolution crop losses. Norman Borlaug's breeding program targeting stem-rust resistance was central to the Green Revolution (1970 Nobel Peace Prize)."
  Sr31-break = "Race Ug99 (TTKSK), first identified in Uganda 1998–1999, breaks Sr31 resistance (present in most modern wheat cultivars); global threat to wheat food security, subject to international monitoring."
  honesty = "Borlaug/wheat-rust breeding context is author/era-flagged; Ug99 race designation and its Sr31-breaking phenotype are well-documented in the cereal pathology literature (primary author/era, not a single paper claim)."
  |> "[@x_singh_2011]"

@D dom_chestnut_blight := "Cryphonectria parasitica — American chestnut blight" :: domain [ok]
  pathogen = "Cryphonectria parasitica (Ascomycota: Diaporthales) causes chestnut blight; introduced to North America ~1904, first identified in New York Zoological Park."
  impact = "Functionally eliminated the American chestnut (Castanea dentata) as an ecological dominant from eastern North American forests within ~50 years of introduction — one of the most ecologically devastating biological invasions recorded. Billions of trees killed; the species persists only as root-sprouting stumps that are re-infected before reaching reproductive maturity."
  mechanism = "Canker-forming: invades bark, secretes oxalic acid, girdles and kills aerial tissue; roots survive (hence sprout persistence) because the fungus cannot grow at soil pH."
  honesty = "The ~1904 New York date and the functional-extinction characterisation are standard historical mycology/conservation facts. Exact original paper author/era flagged."
  |> "[@x_anagnostakis_1987]"

@D dom_phytophthora := "Phytophthora infestans — Irish Famine blight (honest oomycete note)" :: domain [ok]
  pathogen = "Phytophthora infestans, causative agent of late blight of potato, caused the Irish Potato Famine 1845–1852 — among the most consequential plant disease events in human history."
  honesty-taxon = "IMPORTANT HONESTY CAVEAT: Phytophthora infestans is an oomycete (Stramenopila/Oomycota), NOT a true fungus. Oomycetes were historically classified with fungi (they superficially resemble filamentous fungi) but are more closely related to brown algae and diatoms. Cell walls contain cellulose, not chitin. They do not belong to kingdom Fungi. Included here because mycology textbooks and courses historically cover oomycete plant pathogens, and 'late blight' is paradigmatic in disease modeling contexts — but the distinction is scientifically mandatory."
  historical-impact = "The Irish Famine (~1845–1852) resulted in approximately 1 million deaths and 1–2 million emigrations from Ireland. Phytophthora also destroyed a significant fraction of Europe's potato crop in the same period."
  source-era = "Phytophthora infestans identification / Irish Famine: primary authors de Bary (~1861 formal description), Berkeley (~1846 early description; era flagged)."

@D dom_rusts_smuts := "rusts and smuts — Basidiomycota cereal pathogens" :: domain [ok]
  rusts = "Obligate biotrophic Basidiomycota (Pucciniales order); also include stripe rust (P. striiformis), leaf rust (P. triticina) on wheat, and many others. See [@dom_wheat_rust] for Pgt detail."
  smuts = "Ustilaginomycotina: Ustilago maydis (corn smut / 'huitlacoche' — also a Mexican food delicacy), Tilletia (bunt/stinking smut of wheat). Replace host grain tissue with smut spore masses."
  management = "Seed treatment fungicides, host resistance breeding, and crop rotation — standard IPM approaches. See hexa-bio AGRICULTURE.tape for IPM framework."

# ── §7 Fungal pathogens of animals and humans ─────────────────────────

@D dom_candida := "Candida — opportunistic yeast pathogens" :: domain [ok]
  species = "Candida albicans is the leading human fungal pathogen (commensalism → pathogenesis in immunocompromised or disrupted-barrier patients). Also: C. glabrata (now Nakaseomyces glabrata — intrinsically reduced azole susceptibility), C. parapsilosis, C. tropicalis, C. krusei (now Pichia kudriavzevii — intrinsically fluconazole resistant), C. auris."
  candida-auris = "Candida auris: first described ~2009 (Japan, Satoshi Sugita et al.; exact volume cited author/era only). Multidrug-resistant, hospital-transmitted, thermotolerant yeast; pan-resistant isolates documented. WHO fungal priority pathogen list 2022 — critical priority."
  virulence = "Albicans virulence factors: hyphal switching (invasion), biofilm formation (catheter colonisation, drug tolerance), secreted aspartyl proteases, Als adhesins."
  |> "[@x_pfaller_2012]"

@D dom_aspergillus := "Aspergillus — mould pathogen and industrial workhorse" :: domain [ok]
  clinical = "Aspergillus fumigatus: primary agent of invasive pulmonary aspergillosis in immunocompromised hosts (haematological malignancy, transplant, prolonged corticosteroid). Also: A. flavus (produce aflatoxins; see [@lim_mycotoxins]); A. niger (industrial citric acid production, ear infections); A. terreus (amphotericin-B-resistant)."
  voriconazole = "Voriconazole is first-line therapy for invasive aspergillosis; isavuconazole or liposomal amphotericin B as alternatives."
  resistance = "Azole-resistant A. fumigatus (cyp51A TR34/L98H and other mutations) is an emerging concern; environmental selection via agricultural triazide fungicides is the dominant hypothesis for cryptic (azole-naive patient) resistance — see [@lim_antifungal_resistance]."
  |> "[@x_pfaller_2012]"

@D dom_cryptococcus := "Cryptococcus — encapsulated basidiomycete meningitis pathogen" :: domain [ok]
  biology = "Cryptococcus neoformans and C. gattii (Basidiomycota). Distinctive thick polysaccharide capsule (glucuronoxylomannan) that inhibits phagocytosis. Environmental reservoir: soil, pigeon guano (C. neoformans), eucalyptus (C. gattii)."
  disease = "Cryptococcal meningoencephalitis is a leading AIDS-defining illness; C. gattii infects immunocompetent individuals (Vancouver Island outbreak ~1999 documented). Estimated ~180,000–220,000 AIDS-related cryptococcal meningitis deaths/year globally (estimate era: ~2017 global burden data)."
  treatment = "Induction: liposomal amphotericin B + flucytosine (gold standard per WHO 2022 consolidated guidelines); consolidation/maintenance: fluconazole."
  |> "[@x_pfaller_2012]"

@D dom_other_pathogens := "other notable human fungal pathogens" :: domain [ok]
  histoplasma = "Histoplasma capsulatum (Ascomycota): dimorphic, endemic in Ohio/Mississippi River valleys and tropical regions; causes histoplasmosis (pulmonary → disseminated in immunocompromised). Soil reservoir: bird/bat guano."
  pneumocystis = "Pneumocystis jirovecii (Ascomycota, Pneumocystidomycetes): obligate human pathogen; causes Pneumocystis pneumonia (PCP) in immunosuppressed patients; historically a leading AIDS death cause before prophylaxis. Previously classified as a protozoan; molecular data confirmed fungal identity in the 1980s."
  dermatophytes = "Tinea infections: Trichophyton, Microsporum, Epidermophyton cause dermatophytoses (ringworm, athlete's foot, onychomycosis) — ubiquitous superficial infections globally."

@D dom_chytrid_disease := "Batrachochytrium — chytridiomycosis and amphibian decline" :: domain [ok]
  pathogen = "Batrachochytrium dendrobatidis (Bd) and B. salamandrivorans (Bsal; salamander-specific, first described 2013) cause chytridiomycosis — a skin infection that disrupts osmoregulation and electrolyte balance, causing cardiac arrest."
  emergence = "Berger et al 1998 (PNAS) described chytridiomycosis as the cause of amphibian population collapses in Australia and Central America — a pivotal discovery ([@x_berger_1998])."
  global-scope = "Skerratt et al 2007 (EcoHealth 4:125–134) documented Bd as responsible for the most spectacular loss of vertebrate biodiversity due to disease in recorded history — over 200 amphibian species declined, with at least 43 confirmed extinctions attributed to Bd ([@x_skerratt_2007])."
  irreversibility = "Population-level declines are largely irreversible (see [@lim_chytrid_amphibian]); captive-breeding / probiotic bioaugmentation under research."
  |> "[@x_berger_1998] · [@x_skerratt_2007]"

# ── §8 Industrial, food, and agricultural mycology ────────────────────

@D dom_industrial := "industrial mycology — Saccharomyces, Aspergillus, Penicillium" :: domain [ok]
  saccharomyces = "Saccharomyces cerevisiae: the primary fermentation yeast for bread (leavening via CO₂), beer, wine, and bioethanol. Also the foremost eukaryotic genetics model organism. Genome sequenced 1996. Cross-link: FERMENTATION / BAKING domains."
  penicillin = "Penicillium chrysogenum (syn. P. rubens) produces penicillin — discovered by Alexander Fleming 1928 (Staphylococcus inhibition) and developed for therapeutic use by Florey, Chain et al ~1940–1941. Industrial production via deep-tank fermentation transformed 20th-century medicine."
  citric-acid = "Aspergillus niger is the primary industrial source of citric acid via submerged fermentation — the dominant food-grade acidulant globally. An early (1919 Currie) demonstration of fungal acid overproduction established the industrial fermentation principle."
  cheese = "Penicillium roqueforti (blue cheese: Roquefort, Gorgonzola, Stilton) and P. camemberti (white-rind cheese: Camembert, Brie) — classical examples of fungal secondary metabolites in food (blue pigment, proteases, lipases). Cross-link: CHEESE-DAIRY domain."
  |> "[@x_papagianni_2007] · [@x_hawksworth_2017]"

@D dom_mycotoxins := "mycotoxins — secondary metabolites as food safety hazards" :: domain [ok]
  aflatoxins = "Aflatoxins B1/B2/G1/G2 produced by Aspergillus flavus and A. parasiticus in contaminated grains, maize, peanuts. Aflatoxin B1 is the most potent naturally occurring hepatotoxin and IARC Group 1 human carcinogen. Maximum limits regulated internationally (e.g. 4–20 ppb in EU food/feed)."
  ochratoxin = "Ochratoxin A: produced by Aspergillus ochraceus and Penicillium verrucosum; nephrotoxic; found in cereal grains, coffee, wine, dried fruit. IARC Group 2B (possible human carcinogen)."
  limit = "See [@lim_mycotoxins] — irreversible contamination of bulk grain lots is the key food-safety hazard."
  |> "[@x_bennett_klich_2003]"

# ── §9 Real-limits anchors ─────────────────────────────────────────────

@D lim_species_gap := "fungal species discovery gap — ~95% estimated undescribed" :: real-limit [ok required]
  wall = "HARD LIMIT (sampling/cultivability)"
  statement = "Of an estimated 2.2–3.8 million fungal species (Hawksworth & Lücking 2017), only ~120,000–150,000 are formally described — approximately 3–7% of the total. The vast majority have never been cultured, sequenced, or named. This is not a lattice ratio; it is an empirical gap between formal taxonomy and estimated total diversity."
  consequence = "Functional ecology, antifungal discovery pipelines, and ecological risk assessment are all constrained by this gap. Sequencing-based (eDNA/metabarcoding) approaches expand detection but do not resolve cultivability or biochemical characterisation."
  |> "[@x_hawksworth_2017]"

@D lim_cultivability := "cultivability bottleneck — most fungi not culturable on standard media" :: real-limit [ok required]
  wall = "BIOLOGICAL LIMIT (obligate biotrophy / unknown nutritional requirements)"
  statement = "Estimated ~5–10% of environmental fungi are culturable on standard laboratory media. Obligate biotrophs (e.g. Glomeromycota AM fungi, rust and smut pathogens) cannot complete their life cycle without a host and cannot be axenically cultured — a fundamental experimental constraint, not a lattice value."
  consequence = "Drug discovery, industrial screening, and ecology depend on culturable isolates. Metagenomic approaches characterise uncultured diversity functionally but cannot replace pure-culture biochemistry for mechanism/metabolite work."

@D lim_antifungal_resistance := "emerging antifungal resistance — Candida auris and azole-resistant Aspergillus" :: real-limit [ok required]
  wall = "BREAKABLE_WITH_TECH (slow) / SOFT WALL"
  candida-auris = "Candida auris, first described ~2009, exhibits multidrug resistance including pan-resistance in some isolates; rapid nosocomial spread; thermotolerant (survives on environmental surfaces longer than C. albicans). WHO critical priority pathogen 2022."
  aspergillus = "Azole-resistant A. fumigatus (cyp51A TR34/L98H) is documented worldwide; attributed in part to environmental triazole selection from agricultural fungicide use — a resistance route that bypasses the patient. Rates vary by geography (Netherlands: up to ~15% of clinical isolates in some reports; other regions lower)."
  consequence = "A limited antifungal armamentarium (three major classes) combined with emerging pan-resistance is a genuine public-health ceiling on treatable invasive fungal disease. New drug classes (e.g. ibrexafungerp, olorofim) in development but pipeline is thin."
  |> "[@x_pfaller_2012]"

@D lim_chytrid_amphibian := "chytridiomycosis — amphibian declines largely irreversible at population level" :: real-limit [ok required]
  wall = "HARD WALL (ecological — population-level functional extinction)"
  statement = "Batrachochytrium dendrobatidis (Bd) has caused population collapse or extinction of hundreds of amphibian species globally; Skerratt et al 2007 characterised it as responsible for the most spectacular vertebrate biodiversity loss due to disease in recorded history. At-risk populations in Bd-endemic environments face continued selection pressure with no scalable field intervention proven effective."
  consequence = "Unlike drug-resistant pathogens where new compounds are feasible, mass wild-population chytrid mitigation has no proven scalable solution; captive assurance colonies and probiotic bioaugmentation are under research but not deployed at landscape scale."
  |> "[@x_skerratt_2007] · [@x_berger_1998]"

@D lim_mycotoxins := "mycotoxin contamination — irreversible in bulk grain" :: real-limit [ok required]
  wall = "HARD LIMIT (chemical contamination — irreversible in bulk)"
  statement = "Once aflatoxin or ochratoxin contamination exceeds regulatory limits in a bulk grain or peanut lot, the lot cannot be decontaminated to safe levels by washing, heating, or sorting at commercial scale — economic and public-health loss is essentially irreversible. Prevention (pre-harvest drought/insect management; post-harvest moisture control) is the only effective intervention."
  consequence = "Climate-change-driven increases in heat/drought stress are expected to expand aflatoxin risk geographically — a food-security concern with no post-contamination remedy."
  |> "[@x_bennett_klich_2003]"

# ── §10 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-mycology" :: governance [required deny:write]
  pattern = "Deriving mycological quantities (species counts, phylum counts, growth rates, antifungal drug class counts, spore yields, infection rates) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'five phyla because sopfr=5' or 'three antifungal classes because φ(6)=2+1' or 'spore yield = σ·τ'."
  why = "This is exactly the fabrication the pre-rewrite MYCOLOGY.tape committed (rows of @D row_* x='n=6' x='EXACT' lattice-tautologies — see MYCOLOGY.log.tape audit). hexa-bio AGENTS.tape @F f1 (lattice-fit-on-external-entity) + @D g1/g2 forbid it."
  remedy = "Cite real mycology sources (this tape's @X entries). Domain numbers (5 phyla covered, 3 antifungal classes, ~120k described species) are biological taxonomy and empirical counts — NOT lattice products. The lattice may only be a coincidental OBSERVATION, never a derivation."

@N n6_honest_stance := "mycology has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: mycology exposes NO natural n=6 invariant. The major fungal phyla covered here (Ascomycota, Basidiomycota, Mucoromycota, Chytridiomycota, Glomeromycota) number five (5) — not six, and not lattice-constrained (phylum count reflects evolutionary phylogenomics, not an integer design principle). The three antifungal drug classes (echinocandins, azoles, polyenes) are mechanistically dictated by fungal cell-wall/membrane biology — not σ/τ/φ/J₂. Species counts (2.2–3.8M estimated total; ~120k–150k described) are empirical. Growth-rate observations are biological measurements. Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool) and LATTICE_POLICY: the lattice is declined here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub."

# ── §11 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 Hawksworth species estimate falsifier" :: prediction [ok]
  claim = "Total described fungal species will not reach 2.2 million (the low end of the Hawksworth 2017 range) within 50 years at current taxonomic description rates — the discovery gap is structural, not merely resourcing."
  falsifier = "If the rate of formal species descriptions (currently ~1,000–2,000 new fungal taxa/year) accelerates by >100× via metagenomics-to-taxonomy pipelines within a decade, and total described species cross 500,000, the 'structural gap' framing of [@lim_species_gap] requires revision."
  source = "[@x_hawksworth_2017]"

@D tp_2 := "TP-2 Bd amphibian decline irreversibility" :: prediction [ok]
  claim = "Wild amphibian population recovery in areas with established Bd infection will NOT occur at landscape scale without active management intervention (bioaugmentation, isolation, or environmental engineering); spontaneous recovery to pre-Bd census levels will not be documented for Bd-susceptible species in Bd-endemic zones."
  falsifier = "If a replicated multi-site study documents spontaneous recovery of a Bd-susceptible species to >80% of pre-decline population density in a Bd-endemic zone without active management intervention, [@lim_chytrid_amphibian] must be revised."
  source = "[@x_skerratt_2007]"

@D tp_3 := "TP-3 antifungal pan-resistance ceiling" :: prediction [ok]
  claim = "Candida auris pan-resistant isolates (resistant to all three major antifungal classes) will continue to be documented globally, and treatment-attributable mortality in pan-resistant C. auris infections will exceed 30% in immunocompromised hosts, consistent with documented outcomes in early outbreak reports."
  falsifier = "If a new antifungal class (e.g. ibrexafungerp or olorofim or a novel target) achieves >90% in vitro activity against pan-resistant C. auris in a multi-centre susceptibility survey, the ceiling on treatable pan-resistant Candida is broken — revise [@lim_antifungal_resistance]."
  source = "[@x_pfaller_2012]"

# ── §12 Cross-links ───────────────────────────────────────────────────

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). This tape complies: real mycology science, in-silico knowledge SSOT only, lattice declined as a derivation tool."

# ── §13 External citations (real, landmark literature) ────────────────
# Where a specific bibliographic detail is not asserted with confidence,
# the entry names the primary author + era only and says so explicitly.

@X x_hawksworth_2017 := "Hawksworth & Lücking 2017" :: literature [active]
  ref = "Hawksworth DL, Lücking R. Fungal Diversity Revisited: 2.2 to 3.8 Million Species. Microbiol Spectr 2017;5(4):FUNK-0052-2016. (updated global fungal species richness estimate; ~120,000–150,000 described vs 2.2–3.8M total)"

@X x_james_2006 := "James et al 2006 — fungal phylogenomics" :: literature [active]
  ref = "James TY et al. Reconstructing the early evolution of Fungi using a six-gene phylogeny. Nature 2006;443:818–822. (phylogenomics of major fungal lineages; basis for current phylum-level classification)"

@X x_gow_2017 := "Gow et al 2017 — fungal cell wall" :: literature [active]
  ref = "Gow NAR, Latge JP, Munro CA. The Fungal Cell Wall: Structure, Biosynthesis, and Function. Microbiol Spectr 2017;5(3):FUNK-0035-2016. (chitin, β-glucan, mannan composition; drug-target basis)"

@X x_smith_read_2008 := "Smith & Read — Mycorrhizal Symbiosis 3rd ed 2008" :: literature [active]
  ref = "Smith SE, Read DJ. Mycorrhizal Symbiosis. 3rd ed. Academic Press, 2008. (textbook SSOT for ecto- and arbuscular mycorrhizal biology, plant phosphorus acquisition, >70% land-plant AM association estimate; era flagged — primary authors)"

@X x_berger_1998 := "Berger et al 1998 PNAS — chytridiomycosis discovery" :: literature [active]
  ref = "Berger L et al. Chytridiomycosis causes amphibian mortality associated with population declines in the rain forests of Australia and Central America. Proc Natl Acad Sci USA 1998;95:9031–9036. (first characterisation of Bd as the causative agent of population-collapse disease)"

@X x_skerratt_2007 := "Skerratt et al 2007 EcoHealth" :: literature [active]
  ref = "Skerratt LF et al. Spread of chytridiomycosis has caused the rapid global decline and extinction of frogs. EcoHealth 2007;4:125–134. (global scope of Bd amphibian decline; 'most spectacular loss of vertebrate biodiversity due to disease' characterisation)"

@X x_floudas_2012 := "Floudas et al 2012 — ligninolytic enzyme evolution" :: literature [active]
  ref = "Floudas D et al. The Paleozoic origin of enzymatic lignin decomposition reconstructed from 31 fungal genomes. Science 2012;336:1715–1719. (white-rot ligninolytic enzyme evolution; Trametes/Phanerochaete context)"

@X x_pfaller_2012 := "Pfaller & Diekema — clinical mycology reference" :: literature [active]
  ref = "Pfaller MA, Diekema DJ. Progress in antifungal susceptibility testing of Candida spp. by use of Clinical and Laboratory Standards Institute broth microdilution methods, 2010 to 2012. J Clin Microbiol 2012;50:2846–2856. (antifungal susceptibility / echinocandin / azole / polyene mechanisms; Candida epidemiology; cited as primary-author/era for class pharmacology — fuller drug-mechanism reference is the IDSA/ESCMID guidelines body)"

@X x_bennett_klich_2003 := "Bennett & Klich 2003 — mycotoxins review" :: literature [active]
  ref = "Bennett JW, Klich M. Mycotoxins. Clin Microbiol Rev 2003;16:497–516. (aflatoxin, ochratoxin, and other mycotoxin classes, biosynthesis, toxicology, regulatory context)"

@X x_singh_2011 := "Singh et al 2011 — wheat rust Ug99" :: literature [active]
  ref = "Singh RP et al. The emergence of Ug99 races of the stem rust fungus is a threat to world wheat production. Annu Rev Phytopathol 2011;49:465–481. (Puccinia graminis Ug99 race, Sr31-breaking, global wheat security threat)"

@X x_anagnostakis_1987 := "Anagnostakis 1987 — chestnut blight" :: literature [active]
  ref = "Anagnostakis SL. Chestnut blight: the classical problem of an introduced pathogen. Mycologia 1987;79:23–37. (Cryphonectria parasitica, American chestnut functional extinction history, biocontrol via hypovirulence)"

@X x_papagianni_2007 := "Papagianni 2007 — fungal biotechnology" :: literature [active]
  ref = "Papagianni M. Advances in citric acid fermentation by Aspergillus niger: biochemical aspects, membrane transport and modeling. Biotechnol Adv 2007;25:244–263. (A. niger citric-acid fermentation; industrial mycology context)"
