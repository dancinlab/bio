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
# HIV.tape — architecture-current (editable per v1.2)
# Event history → HIV.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "hiv" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · HIV virology + epidemiology + AIDS-defining illnesses (in-silico knowledge SSOT)"
  brief = "HIV-1/HIV-2 virology + epidemiology + AIDS-defining illnesses · n=6 NOT used as a derivation (honest) · therapeutic content cross-link HIV-TREATMENT"
  parent = "dancinlab/hexa-bio"
  sibling-log = "HIV.log.tape"
  scope = "in-silico HIV virology knowledge SSOT · NOT clinical advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see HIV.log.tape audit"
  axis-note = "HIV.tape is the STANDALONE in-silico knowledge SSOT for HIV virology proper — HIV-1 vs HIV-2 species distinction, SIV origins, virion architecture, genome organisation, replication cycle, host-genetic susceptibility (CCR5-Δ32), pandemic phylogeography, epidemiology, and AIDS-defining illness taxonomy. Therapeutic / antiretroviral / cure-direction content lives in HIV-TREATMENT.tape (sister axis) — cross-linked, NOT duplicated (hexa-bio AGENTS.tape f3 no-shadow-impl-of-sister-tape applies between sibling axes). General virology framing (Baltimore classification placement, life-cycle scaffold, restriction-factor frame) lives in VIROLOGY.tape and is cross-linked, not duplicated."

@N scope_disclaimer := "clinical/public-health scope honesty" :: note [required]
  text = "This tape is a knowledge index of public peer-reviewed HIV virology literature for an in-silico modeling substrate. Virology descriptions, species/strain distinctions, life-cycle steps, host-genetic findings (CCR5-Δ32), pandemic-origin phylogeography, AIDS-defining illness taxonomy and epidemiology descriptors are paraphrased from primary peer-reviewed papers and consensus public-health-surveillance literature (CDC / WHO / UNAIDS classification literature). They are NOT clinical advice, NOT diagnostic guidance, NOT a treatment regimen, NOT prescribing instructions, NOT public-health-policy recommendations. Real HIV care and HIV public-health work require licensed infectious-disease clinicians and accredited public-health authorities working from current guidelines. All claims here are scoped to in-silico simulator/metadata consistency only; the wet-lab → clinical → regulatory boundary is explicitly out of scope (hexa-bio AGENTS.tape g8_in_silico_only / f2). Where exact volume/page references cannot be confidently asserted, citations are flagged primary-author/era (literature-honesty rule)."
  |> "[@x_barre_sinoussi_1983] · [@x_worobey_2008] · [@x_faria_2014] · [@x_hexa_bio_agents]"

# ─── §1 What HIV is — species, taxonomy placement ────────────────────

@D dx_definition := "what HIV is" :: domain [ok]
  pathogen = "Human immunodeficiency virus — an enveloped, positive-sense single-stranded RNA retrovirus of the Lentivirus genus, family Retroviridae (Baltimore Group VI ssRNA-RT, see VIROLOGY.tape fam_retroviridae). Establishes lifelong infection by reverse-transcribing its RNA genome into double-stranded DNA and integrating that DNA copy into host-cell chromosomes."
  species = "Two species are recognised: HIV-1 (the agent of the global pandemic) and HIV-2 (largely confined to West Africa and to populations with strong West African demographic links)."
  disease = "Untreated HIV-1 infection progressively depletes CD4+ T cells over a period of years, culminating in acquired immunodeficiency syndrome (AIDS) — a clinical syndrome defined by the appearance of specified opportunistic infections, specified malignancies, or by CD4+ T-cell count below a defined threshold (see §6 AIDS-defining illnesses)."
  isolation = "First isolated from a patient with lymphadenopathy by Barré-Sinoussi, Montagnier and colleagues at the Institut Pasteur, reported in Science in 1983; later confirmed in 1984 by a series of papers from the Gallo group at the National Cancer Institute (USA) as the causative agent of AIDS, with related independent characterisation work in the same period."
  nobel-context = "The 2008 Nobel Prize in Physiology or Medicine was awarded to Françoise Barré-Sinoussi and Luc Montagnier 'for their discovery of human immunodeficiency virus' (sharing the prize with Harald zur Hausen for the HPV-cervical-cancer link). Cited as historical record."
  |> "[@x_barre_sinoussi_1983] · [@x_gallo_1984_era] · [@x_virology_sibling]"

@D species_hiv1_vs_hiv2 := "HIV-1 vs HIV-2 species distinction" :: classification [ok]
  hiv1 = "HIV-1 is responsible for the global pandemic. It is more transmissible per exposure, drives faster CD4 decline on average, and produces the dominant epidemic burden worldwide. HIV-1 is subdivided into four GROUPS (M, N, O, P) corresponding to separate cross-species transmissions from chimpanzee SIV reservoirs (see §3 origin). Group M is by far the dominant pandemic lineage and is itself partitioned into multiple subtypes (A, B, C, D, F, G, H, J, K) plus a growing list of Circulating Recombinant Forms (CRFs) generated by intra-host recombination between subtypes."
  hiv2 = "HIV-2 is largely confined to West Africa with secondary spread along West African demographic links. It is less transmissible per exposure than HIV-1, drives slower CD4 decline on average, and has lower plasma viral loads at any given clinical stage. HIV-2 is partitioned into groups A and B (the human-circulating lineages) plus additional groups (C through I-class designations) detected in fewer individuals; the literature partitions vary slightly by author."
  intrinsic-resistance = "HIV-2 is intrinsically resistant to non-nucleoside reverse-transcriptase inhibitors (NNRTIs) and to enfuvirtide (T-20) by virtue of sequence differences in the corresponding binding sites — a relevant cross-link to HIV-TREATMENT.tape, NOT a treatment claim here."
  same-disease-class = "Both species cause acquired immunodeficiency syndrome (AIDS) with the same broad clinical spectrum; differences are in transmissibility, kinetics, antiretroviral-class compatibility, and geographic distribution."
  honesty = "Subtype letters, CRF numbering, and group designations are taxonomic record from the published HIV nomenclature literature; specific subtype prevalence by region is paraphrased qualitatively and is not asserted as a precise point estimate."
  |> "[@x_sharp_hahn_2011_era]"

@D siv_origins := "SIV reservoirs — HIV-1 from SIVcpz, HIV-2 from SIVsmm" :: domain [ok]
  hiv1-from-sivcpz = "HIV-1 originated from cross-species transmissions of simian immunodeficiency virus from chimpanzees (SIVcpz, Pan troglodytes troglodytes — the central chimpanzee subspecies) in West-central Africa. The four HIV-1 groups (M, N, O, P) correspond to at least four independent cross-species events: M and N from SIVcpz reservoirs in P. t. troglodytes; O and P with closer phylogenetic affinity to SIVgor in western lowland gorillas (Gorilla gorilla gorilla), themselves derived from SIVcpz at an earlier point. Group M is the dominant pandemic lineage; groups N, O, P are geographically restricted with much lower case counts."
  hiv2-from-sivsmm = "HIV-2 originated from cross-species transmissions of SIVsmm from sooty mangabeys (Cercocebus atys atys) in West Africa. Multiple independent cross-species events generated the HIV-2 groups (A and B being the human-circulating ones; additional groups detected in fewer individuals)."
  natural-host-tolerance = "Sooty mangabeys naturally infected with SIVsmm in the wild do not generally progress to an AIDS-like disease, despite high viral loads — a long-standing observation in primate-virology / pathogenesis literature (e.g. the Silvestri/Sodora era) used as a reference point for the question of why HIV-1 in humans is pathogenic but the ancestral SIV in its natural host frequently is not. Primary-author/era cited; this is a reference observation, not a derivation."
  honesty = "Cross-species event counts and reservoir-host species are public peer-reviewed-literature record; phylogenetic specifics paraphrased qualitatively rather than as point estimates."
  |> "[@x_sharp_hahn_2011_era] · [@x_korber_2000_era]"

# ─── §2 Virion architecture and genome ───────────────────────────────

@D virion_architecture := "virion architecture (capsid + envelope)" :: mechanism [ok]
  size = "Mature HIV virions are roughly spherical particles in the ~100–120 nm diameter range (electron-microscopy literature)."
  envelope = "Host-derived lipid bilayer envelope acquired during budding from the plasma membrane. The envelope carries the viral Env glycoprotein TRIMER — three heterodimers of surface subunit gp120 (receptor binding) non-covalently associated with transmembrane subunit gp41 (fusion machinery)."
  matrix = "Matrix protein (MA, p17) underlies the envelope, attached to its inner leaflet."
  capsid = "Conical capsid of CA (p24) subunits arranged in a fullerene-cone lattice of hexamers with twelve pentameric defects (seven at the wide end + five at the narrow end is the canonical Ganser-Barton/Briggs/Sundquist cryo-EM/cryo-ET description) — order of ~1500 CA subunits derived from the Gag polyprotein after PR cleavage. The capsid encloses the two genome copies plus the viral enzymes."
  enzymes = "Reverse transcriptase (RT, p66/p51 heterodimer; carries RNA-dependent and DNA-dependent DNA polymerase activities plus RNase H), integrase (IN), and protease (PR) are packaged from the Gag-Pol polyprotein and matured into their active forms by PR cleavage during particle maturation."
  honesty = "Subunit counts and dimensions are field-standard reference figures from cryo-EM / cryo-ET / electron-microscopy literature; treated as paraphrased reference values, not lattice-derived constants."
  |> "[@x_briggs_capsid_era]"

@D genome_organisation := "genome organisation — gag/pol/env + regulatory + accessory" :: mechanism [ok]
  format = "Two copies of single-stranded positive-sense RNA genome, ~9.7 kb each, packaged within the capsid (the genome is functionally diploid in this sense; only one is reverse-transcribed productively, with strand transfer between the two templates during reverse transcription generating recombination)."
  structural-genes = "Three canonical structural / enzymatic reading frames: gag (encodes Gag polyprotein → MA p17, CA p24, NC p7, p6 after PR cleavage); pol (encodes Pol polyprotein → PR, RT, IN after PR cleavage); env (encodes Env precursor gp160 → gp120 + gp41 after furin-class cleavage)."
  regulatory-genes = "Two essential regulatory genes: tat (trans-activates LTR-driven transcription, dramatically increasing viral-RNA output) and rev (exports unspliced and singly-spliced viral RNA from the nucleus via the CRM1 export pathway). Loss-of-function in either Tat or Rev is replication-lethal."
  accessory-genes-hiv1 = "HIV-1 accessory genes: nef (downregulates CD4 and MHC-I, modulates T-cell signalling, is a key virulence determinant); vif (counteracts the host APOBEC3 family of restriction factors, see VIROLOGY.tape host_apobec3); vpr (multiple functions including G2 cell-cycle arrest); vpu (antagonises tetherin/BST-2 to enable virion release, see VIROLOGY.tape host_bst2_tetherin)."
  accessory-genes-hiv2 = "HIV-2 has the same structural / regulatory frames and shares nef / vif / vpr; HIV-2 carries vpx in place of vpu. Vpx targets SAMHD1 for degradation (see VIROLOGY.tape host_samhd1), explaining HIV-2's enhanced ability to replicate in resting myeloid cells relative to HIV-1. HIV-2 does NOT carry vpu — tetherin antagonism is performed by HIV-2 Env in lineage-specific manner."
  ltr-flanking = "Both species' integrated proviral DNA is flanked by long-terminal repeats (LTRs) carrying U3 / R / U5 elements; the 5' LTR is the dominant transcriptional promoter and the binding platform for host transcription factors plus Tat trans-activation."
  honesty = "Gene products and their functions are textbook-and-primary-literature consensus; specific quantitative effects (CD4-downregulation efficiency, transactivation fold-change) live in the primary literature and are paraphrased qualitatively rather than asserted as point estimates."
  |> "[@x_hiv_treatment_sibling] · [@x_virology_sibling]"

# ─── §3 Replication cycle (descriptive, cross-link VIROLOGY) ─────────

@D entry_receptors := "entry — CD4 primary receptor + chemokine co-receptor" :: mechanism [ok]
  primary-receptor = "gp120 binds CD4 on T helper cells, monocytes/macrophages, and dendritic cells. CD4 engagement triggers a conformational change in gp120 that exposes the co-receptor binding site."
  co-receptors = "A chemokine co-receptor is REQUIRED in addition to CD4 for fusion to proceed. The two principal co-receptors used by HIV are CCR5 and CXCR4. Viruses that use CCR5 only are 'R5-tropic'; viruses that use CXCR4 only are 'X4-tropic'; dual-tropic viruses can use either."
  r5-x4-trajectory = "R5-tropic virus dominates transmission and early-stage infection in the majority of HIV-1 cases. In a subset of individuals, X4-tropic or dual-tropic virus emerges later in disease and is statistically associated with faster CD4 decline (a clinical-observation correlation, paraphrased from natural-history literature; mechanism remains an active research topic)."
  fusion-mechanics = "After co-receptor engagement, gp41 undergoes a spring-loaded conformational refolding into a six-helix bundle (three HR1 helices pack with three HR2 helices), driving apposition of viral and cellular membranes and triggering fusion. This is a structural fact of class-I viral fusion proteins, NOT a derivation source for treatment claims (see [@n6_honest_stance])."
  honesty = "Receptor identity, co-receptor usage, and fusion mechanism are established by primary literature spanning the 1980s–2000s; cited descriptively, not derived."
  |> "[@x_hiv_treatment_sibling] · [@x_virology_sibling]"

@D ccr5_delta32_genetics := "CCR5-Δ32 host genetics" :: domain [ok]
  variant = "A 32-base-pair deletion in the CCR5 coding sequence (CCR5-Δ32) produces a truncated, non-functional CCR5 protein that is not delivered to the cell surface. Homozygotes for the Δ32 allele lack functional CCR5 on the surface of CD4+ T cells and macrophages."
  protection = "Δ32/Δ32 homozygotes are strongly (but not absolutely) protected against R5-tropic HIV-1 infection; rare reported infections in Δ32/Δ32 individuals have generally involved X4-tropic viruses. Δ32/+ heterozygotes are not protected from infection but show, on average, slower progression to AIDS."
  discovery = "The Δ32 variant and its protective effect were reported in 1996 by Liu et al (Cell 86:367–377, identifying CCR5 as the major macrophage-tropic HIV-1 co-receptor and characterising the Δ32 allele) and concurrently by Samson et al (Nature 382:722–725, characterising the Δ32 mutation and its loss-of-function phenotype) — landmark dual-citation that opened the chemokine-receptor route to HIV biology."
  allele-frequency = "The Δ32 allele is common in some European-ancestry populations and uncommon to absent in most non-European-ancestry populations. Heterozygous-or-homozygous Δ32 carriers are roughly on the order of ~10% of Northern European-ancestry populations, with homozygotes a small fraction of that (numbers vary across published surveys; paraphrased qualitatively rather than asserted as a precise figure). This geographic restriction is precisely why Δ32/Δ32 donor matching is rare — the cross-link to the Berlin/London-patient cure cases lives in HIV-TREATMENT.tape (see [@x_hiv_treatment_sibling] cure_berlin / cure_london / lim_ccr5_donor) and is NOT duplicated here."
  honesty = "Allele frequencies are paraphrased qualitatively; exact percentages depend on the surveyed population and are not asserted here. The discovery-pair citation (Liu et al 1996 Cell; Samson et al 1996 Nature) is exact."
  |> "[@x_liu_1996] · [@x_samson_1996]"

@D rt_integration_latency := "reverse transcription, integration, latency" :: mechanism [ok]
  rt-step = "Within the infected cell, RT copies the +ssRNA genome into double-stranded proviral DNA using the host tRNA-Lys3 as primer for minus-strand synthesis. RT has no proofreading 3'→5' exonuclease and a high in-vivo error rate (on the order of one nucleotide mis-incorporation per round of genome copy is the historical Mansky/Temin-era figure for HIV-1 in cell culture, around ~1 in 10⁴ per base per replication cycle; combined with the large within-host replicating population this produces extensive pre-existing variation). The error-prone-RT picture is the mechanistic basis of HIV drug-resistance evolution — full discussion in HIV-TREATMENT.tape lim_resistance, not duplicated here."
  integration = "Integrase catalyses 3' processing and concerted strand-transfer, covalently inserting the proviral DNA into host chromatin. Integration preferentially targets actively transcribed regions of the genome (chromatin / cofactor LEDGF-mediated tethering, established by the Cherepanov / Engelman / Bushman lineage of integration-site work)."
  provirus = "Once integrated, the provirus is a permanent fixture of that cell's genome — replicating with the host cell and transmitting to daughter cells on mitosis."
  latency = "A small fraction of integrations occur in resting memory CD4+ T cells, where chromatin context and the absence of viral transactivators silences transcription. These latently infected cells are the basis of the persistent reservoir — invisible to ART, decay on a half-life measured in years, foundational obstacle to cure. Demonstrated and quantified by Chun, Siliciano and colleagues (Chun 1995 Nature Medicine, Chun 1997 Nature / PNAS — see HIV-TREATMENT.tape cure_reservoir / lim_reservoir, not duplicated)."
  honesty = "RT error-rate figures are mechanistic-virology consensus from the 1990s–2000s primary literature, paraphrased qualitatively. Integration site preference is an empirical observation supported by genome-wide integration-site mapping literature."
  |> "[@x_hiv_treatment_sibling]"

@D assembly_maturation := "assembly, budding, maturation" :: mechanism [ok]
  transcription = "After integration, the proviral 5' LTR drives transcription. Tat dramatically trans-activates the LTR promoter by recruiting P-TEFb to the TAR RNA hairpin; Rev enables nuclear export of unspliced and singly-spliced viral RNAs via CRM1, releasing them from the otherwise-default splicing destiny of incompletely-spliced transcripts."
  translation-assembly = "Gag and Gag-Pol polyproteins are translated; Gag-Pol arises from a programmed -1 ribosomal frameshift at a defined frequency. Gag drives assembly at the plasma membrane through MA-mediated lipid binding, CA-mediated lattice formation, NC-mediated genome packaging (recognising the Ψ packaging signal in the viral RNA), and p6-mediated recruitment of host ESCRT machinery."
  budding = "ESCRT-mediated membrane scission releases an immature particle from the cell surface."
  maturation = "After budding, the viral protease (PR) cleaves Gag and Gag-Pol polyproteins at specific sites in an ordered cascade, triggering conformational reorganisation of CA into the mature conical lattice and yielding an infectious mature virion. PR-blocked virions remain immature and non-infectious — the mechanistic basis of the protease-inhibitor drug class (HIV-TREATMENT.tape drug_pi)."
  honesty = "Each step is established by decades of primary structural / biochemistry / virology literature; cited descriptively. Specific kinetic parameters live in the primary literature and are not asserted here."

# ─── §4 Pandemic origin & phylogeography ─────────────────────────────

@D origin_zoonosis := "pandemic origin — multiple zoonotic spillovers, West-central Africa, early 20th century" :: domain [ok]
  framework = "HIV-1 group M (the pandemic lineage) is attributable to a cross-species transmission of SIVcpz from chimpanzees (Pan troglodytes troglodytes) to humans, with the index event(s) located in West-central Africa (cross-link VIROLOGY.tape spillover_plowright zoonotic-spillover framework). The four HIV-1 groups (M, N, O, P) correspond to at least four independent cross-species events: groups M and N from SIVcpz reservoirs, groups O and P with closer affinity to SIVgor (gorilla SIV, itself derived from SIVcpz at an earlier point)."
  timing = "Molecular-clock reconstructions place the most recent common ancestor of HIV-1 group M near the early decades of the 20th century (with sizeable confidence intervals, paraphrased qualitatively rather than asserted as a specific year). The pandemic was thus underway, undetected, for several decades before clinical recognition in the early 1980s."
  earliest-confirmed-sample = "The earliest unambiguously confirmed HIV-1 sample is the ZR59 sequence recovered from a Kinshasa (then-Léopoldville/-Stanleyville, Democratic Republic of the Congo) plasma sample collected in 1959, characterised molecularly in subsequent decades and used to anchor molecular-clock reconstructions. Worobey et al 2008 Nature 455:661–664 reported the second-oldest confirmed HIV-1 sequence (DRC60, also from Kinshasa) and combined it with ZR59 to refine the timing of HIV-1 group M emergence."
  phylogeography = "Faria et al 2014 Science 346:56–61 reconstructed the spatiotemporal phylogeography of HIV-1 group M and identified Kinshasa (Democratic Republic of the Congo) as the inferred geographic and temporal epicentre of group M's early diversification, with subsequent radial spread along regional transport corridors."
  hiv2-origins = "HIV-2 originated similarly via cross-species transmission of SIVsmm from sooty mangabeys in West Africa, with multiple independent groups corresponding to multiple events; the timing of HIV-2 group A and group B emergence is also placed in the early-to-mid 20th century by molecular-clock work, with broader confidence intervals than for HIV-1 group M (paraphrased qualitatively)."
  honesty = "Specific calendar-year estimates carry substantial uncertainty intervals in the primary literature; the qualitative picture (multiple early-20th-century cross-species events, Kinshasa epicentre for HIV-1 group M, dual SIVcpz/SIVsmm reservoir lines) is robust and paraphrased here. Cross-link to VIROLOGY.tape spillover_plowright (Plowright zoonotic-spillover framework) — not duplicated."
  |> "[@x_worobey_2008] · [@x_faria_2014] · [@x_korber_2000_era] · [@x_sharp_hahn_2011_era] · [@x_virology_sibling]"

# ─── §5 Epidemiology (descriptive, qualitative) ──────────────────────

@D epi_descriptive := "epidemiology — descriptive surveillance frame" :: domain [ok]
  surveillance-source = "Global HIV epidemiology surveillance is coordinated principally by UNAIDS in concert with WHO and national HIV-surveillance authorities. UNAIDS publishes periodic Global AIDS Updates / Joint UN Programme on HIV/AIDS reports presenting estimates and country-level data; CDC (USA), ECDC (Europe), and national counterparts provide region-specific surveillance products."
  estimates-scope = "Global estimates published in this institutional reporting literature describe people living with HIV, new infections per year, AIDS-related deaths per year, and coverage of testing / ART / PrEP — all reported as estimates with uncertainty intervals. This tape paraphrases the existence and structure of those estimates rather than asserting specific point values; specific numerical estimates evolve year-on-year and are the province of the source documents."
  burden-distribution = "The HIV pandemic burden is unequally distributed geographically, with sub-Saharan Africa carrying a disproportionate share of global cases and incidence. Specific key populations (men who have sex with men, people who inject drugs, sex workers and their clients, transgender people, people in prisons and other closed settings) carry disproportionate burden in many epidemic contexts, with patterns varying by region. This is descriptive surveillance literature, not stigmatising framing — UNAIDS / WHO key-population terminology is itself an effort to direct attention without stigma."
  trajectory = "Sustained scale-up of testing, ART, and PrEP has reduced AIDS-related deaths and new HIV infections from their respective historical peaks, but the trajectory toward globally agreed milestones (e.g. UNAIDS 95-95-95 targets — 95% of people with HIV know their status, 95% of them on ART, 95% of those virologically suppressed) is uneven and progress has slowed in some regions; full numerical detail lives in UNAIDS reports."
  honesty = "All epidemiology descriptors here are paraphrased qualitatively from institutional reporting; specific point estimates and recent-year figures are not asserted in this tape — they live in the source documents ([@x_unaids_reports_era]). The 95-95-95 target framing is named because the targets themselves are a published UNAIDS-set policy frame, not a lattice-derived value."
  |> "[@x_unaids_reports_era]"

@D epi_modes := "modes of transmission (descriptive)" :: domain [ok]
  routes = "Established modes of HIV transmission, from the public peer-reviewed transmission-literature: (1) sexual exposure (receptive and insertive routes, with per-act risk varying by route, viral load, presence of co-infections like HSV-2 or other STIs, and circumcision status); (2) parenteral exposure (blood transfusion before reliable donor screening; needle-sharing in injection-drug use; needlestick injuries among health workers; iatrogenic transmission through inadequately sterilised medical equipment in some historical / resource-limited settings); (3) vertical / mother-to-child transmission (in utero, intrapartum, breastfeeding — see HIV-TREATMENT.tape mtct for prevention literature, NOT duplicated here)."
  not-transmitted = "HIV is NOT transmitted by casual contact (handshakes, shared utensils, shared toilets, mosquitoes, saliva exposure of intact skin) — established by decades of household-contact studies and basic biology of the virus. Stigma-management literature emphasises this point explicitly."
  honesty = "Per-act transmission probabilities are reported in the published transmission-literature with substantial dependence on co-factors; not asserted as point estimates here. Mode-of-transmission categories are descriptive surveillance taxonomy, not a closed n-tuple."
  |> "[@x_unaids_reports_era]"

# ─── §6 AIDS-defining illnesses (CDC/WHO classification) ─────────────

@D aids_definition := "what AIDS is — clinical-stage definition" :: classification [ok]
  definition-scheme = "Acquired immunodeficiency syndrome (AIDS) is the clinical-stage designation applied when HIV-induced immunodeficiency has progressed sufficiently to produce defined opportunistic infections, defined malignancies, or to meet a CD4+ T-cell count threshold. Two principal classification schemes are in use in the public clinical / surveillance literature: the U.S. Centers for Disease Control and Prevention (CDC) revised case definition (an evolving series, with the 1993 revision incorporating the CD4+ count of <200 cells/µL as an AIDS-defining criterion in adults, and a 2014 update revising surveillance staging) and the World Health Organization clinical-stage classification (Stages 1–4, with Stage 4 corresponding to clinical AIDS-defining conditions). The schemes overlap substantially in clinical content."
  cd4-threshold = "The CD4+ T-cell count of <200 cells/µL is a key threshold in adults in the CDC scheme, and below this count the risk of the AIDS-defining illnesses in §6 entries below rises substantially. This is a clinical-surveillance threshold from the published case-definition literature, not a lattice value."
  pre-art-history = "Before the cART/HAART era (1996+ — cross-link HIV-TREATMENT.tape era_haart, NOT duplicated), AIDS-defining illnesses were the dominant cause of morbidity and mortality in HIV-positive populations. cART has greatly reduced their incidence in populations with sustained access and adherence; in late-presenting / treatment-naive / structurally-marginalised populations, AIDS-defining illnesses remain clinically important."
  honesty = "Classification schemes are paraphrased from publicly published CDC / WHO definition literature; not prescribing guidance. Specific case-definition criteria evolve in subsequent revisions; cited descriptively, not asserted as current-revision text."
  |> "[@x_cdc_case_definition_era] · [@x_who_clinical_staging_era]"

@D aids_illness_pcp := "AIDS-defining illness — Pneumocystis jirovecii pneumonia (PJP/PCP)" :: domain [ok]
  pathogen = "Pneumocystis jirovecii — an opportunistic atypical fungus (taxonomically reclassified from protozoa to fungi in the late 1980s based on rRNA / cell-wall biochemistry). The species infecting humans is P. jirovecii; the historical name P. carinii is now reserved for the rodent species, but 'PCP' remains the common acronym for Pneumocystis pneumonia in humans."
  clinical = "Subacute progressive dyspnoea, dry cough, fever in a person with CD4+ <200 cells/µL (typical risk range). One of the index AIDS-defining illnesses in the early-1980s recognition of AIDS itself — the cluster of unusual PCP cases in previously healthy young men reported by Gottlieb / Masur / Siegal and colleagues in 1981 and the contemporaneous MMWR report were among the events that defined the syndrome."
  honesty = "PCP risk-threshold figures are clinical-literature consensus; cited descriptively. Prophylaxis / treatment regimens are NOT specified here — that is clinical guidance handled outside this tape."
  |> "[@x_cdc_case_definition_era]"

@D aids_illness_kaposi := "AIDS-defining illness — Kaposi sarcoma (KS)" :: domain [ok]
  pathogen = "Kaposi sarcoma is etiologically associated with infection by Kaposi-sarcoma-associated herpesvirus (KSHV / human herpesvirus 8, HHV-8) — a gammaherpesvirus discovered by Chang and Moore in 1994 (their original Science paper) using representational difference analysis applied to AIDS-KS biopsy tissue."
  clinical = "Mucocutaneous (and visceral) vascular tumour driven by HHV-8 infection in immunosuppressed individuals. AIDS-associated KS was one of the cluster of unusual cancer presentations in previously healthy young men that contributed to AIDS recognition in the early 1980s (Friedman-Kien and colleagues 1981 MMWR cluster reports)."
  epidemiology = "KSHV/HHV-8 has a strikingly geographic seroprevalence — high in sub-Saharan Africa, intermediate in Mediterranean regions, low in most of Northern Europe / North America / East Asia. This geographic structure is the substrate over which AIDS-KS risk varies by region."
  honesty = "Cited descriptively. HHV-8 / KSHV biology is also referenced from VIROLOGY.tape fam_herpesviridae (HHV-8 named among the eight human herpesviruses) and is NOT duplicated here."
  |> "[@x_chang_moore_kshv_1994] · [@x_virology_sibling]"

@D aids_illness_cmv := "AIDS-defining illness — CMV retinitis / CMV disease" :: domain [ok]
  pathogen = "Cytomegalovirus (CMV / HHV-5), a betaherpesvirus (cross-link VIROLOGY.tape fam_herpesviridae)."
  clinical = "CMV retinitis is a sight-threatening retinal infection that historically was a common complication in advanced AIDS with very low CD4 counts. Pre-cART, CMV retinitis was a frequent cause of blindness in AIDS-affected populations; in the cART era its incidence in adherent / virologically-suppressed individuals has fallen markedly. Other CMV manifestations in advanced HIV include colitis, oesophagitis, encephalitis, pneumonitis."
  honesty = "Risk-threshold and incidence shifts are paraphrased from the natural-history and cART-era literature; not asserted as point estimates here."

@D aids_illness_candida := "AIDS-defining illness — mucocutaneous and oesophageal candidiasis" :: domain [ok]
  pathogen = "Candida species (predominantly C. albicans; non-albicans species can present in advanced disease)."
  clinical = "Oropharyngeal candidiasis ('oral thrush') and OESOPHAGEAL candidiasis. Oropharyngeal thrush is an early-stage HIV-immunosuppression marker; oesophageal candidiasis is one of the AIDS-defining illnesses in the case definitions (CDC / WHO). Clinical picture: white plaques in mouth and pharynx for oral candidiasis; odynophagia / dysphagia for oesophageal involvement."
  honesty = "Cited descriptively; not prescribing guidance."

@D aids_illness_mac_mai := "AIDS-defining illness — disseminated Mycobacterium avium complex (MAC/MAI)" :: domain [ok]
  pathogen = "Mycobacterium avium complex (MAC, formerly often called M. avium-intracellulare, MAI) — environmental atypical mycobacteria."
  clinical = "Disseminated MAC presents with fever, weight loss, night sweats, anaemia, hepatosplenomegaly, often diarrhoea, in patients with severe immunosuppression (CD4 typically <50 cells/µL — paraphrased from the natural-history literature). Pre-cART this was a major cause of morbidity and mortality in advanced AIDS."
  honesty = "Cited descriptively; CD4 thresholds and prophylaxis specifics live in clinical guidelines, not in this tape."

@D aids_illness_cryptococcus := "AIDS-defining illness — cryptococcal meningitis" :: domain [ok]
  pathogen = "Cryptococcus neoformans (and C. gattii) — encapsulated yeast acquired by inhalation."
  clinical = "Subacute meningoencephalitis with raised intracranial pressure, headache, fever, in patients with severe immunosuppression. Cryptococcal meningitis is a leading cause of HIV-associated meningitis morbidity / mortality globally, with the burden concentrated in sub-Saharan Africa in late-presenting populations. Diagnostic landmark: cryptococcal antigen (CrAg) testing of serum and cerebrospinal fluid is the standard rapid test (lateral-flow CrAg assays are widely used in resource-limited settings)."
  honesty = "Cited descriptively; treatment regimens are clinical guidance, not specified here."
  |> "[@x_who_clinical_staging_era]"

@D aids_illness_tb := "AIDS-defining illness — extrapulmonary / disseminated tuberculosis" :: domain [ok]
  pathogen = "Mycobacterium tuberculosis."
  clinical = "Pulmonary tuberculosis at any CD4 count, and extrapulmonary / disseminated TB at advanced immunosuppression, are clinically prominent HIV-associated illnesses. Globally, TB is the single leading cause of death in people living with HIV in many surveillance contexts (paraphrased from WHO TB / HIV-TB co-infection reporting tradition). HIV-TB co-infection is a public-health priority distinct from either disease alone."
  honesty = "Cited descriptively; HIV-TB co-infection treatment is a clinical-guideline matter NOT specified here."
  |> "[@x_who_clinical_staging_era]"

@D aids_illness_lymphomas := "AIDS-defining illness — HIV-associated lymphomas" :: domain [ok]
  conditions = "Aggressive non-Hodgkin lymphomas (notably Burkitt-type / diffuse large B-cell lymphoma) and primary central nervous system lymphoma (PCNSL) are AIDS-defining malignancies in the case definitions. Epstein-Barr virus (EBV/HHV-4) is implicated in many of these lymphomas, particularly PCNSL (cross-link VIROLOGY.tape fam_herpesviridae)."
  honesty = "Cited descriptively."

@D aids_illness_pml := "AIDS-defining illness — progressive multifocal leukoencephalopathy (PML)" :: domain [ok]
  pathogen = "JC polyomavirus (JCV), a member of the Polyomaviridae acquired commonly in childhood and then re-activating in severely immunosuppressed individuals."
  clinical = "Progressive multifocal demyelinating CNS disease, MRI showing characteristic white-matter lesions, typically in severe HIV-immunosuppression. Historically often fatal pre-cART; outcome in the cART era has improved with virological control."
  honesty = "Cited descriptively; PML is also a recognised complication of certain other immunomodulatory contexts outside HIV (e.g. natalizumab-treated multiple sclerosis), which is a cross-reference observation not duplicated in detail here."

@D aids_illness_toxo := "AIDS-defining illness — cerebral toxoplasmosis" :: domain [ok]
  pathogen = "Toxoplasma gondii (intracellular protozoan parasite); reactivation of latent infection."
  clinical = "Focal-neurological deficits and/or seizures with ring-enhancing brain lesions on imaging, in patients with advanced HIV. Differential diagnosis with PCNSL is a recurring clinical problem (the EBV-associated CSF marker has been studied as one discriminator)."
  honesty = "Cited descriptively."

# ─── §7 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ──

@D lim_genetic_diversity := "viral genetic diversity — hard wall on universal-vaccine strategies" :: real-limit [ok required]
  wall = "HARD WALL"
  statement = "HIV-1 has extraordinary within-host and between-host genetic diversity, arising from (a) the error-prone reverse transcriptase, (b) very high in-host replication turnover, (c) recombination between the two packaged genome copies during reverse transcription, and (d) the resulting accumulation of viral 'quasispecies' within each infected host. Across hosts and time this generates the multiple HIV-1 group M subtypes (A–K) and the steadily growing catalogue of Circulating Recombinant Forms (CRFs). HIV-1 group M shows greater diversity within a single host than influenza A shows worldwide in a single season — paraphrased qualitative comparison from the published comparative-virology literature."
  consequence = "A single-antigen 'sterilising universal vaccine' for HIV-1 has so far been an unmet research goal; the diversity wall is a major structural reason. Active research directions (broadly neutralising antibodies, mosaic immunogens, germline-targeting prime-boost strategies) attempt to elicit immunity broad enough to cover this diversity — cross-link HIV-TREATMENT.tape cure_bnabs research-direction taxonomy; NOT a treatment claim here, simply the structural-immunological reason vaccines remain difficult for HIV."
  cross-link = "Cross-link VIROLOGY.tape lim_vaccine_variability (vaccine-protection variability across viral families lists HIV as an unsolved / partial vaccine problem) and lim_antiviral_resistance (mutation-rate basis is shared) — not duplicated."
  |> "[@x_virology_sibling]"

@D lim_cd4_tropism := "CD4+ T-cell tropism + immune-system target — hard paradox" :: real-limit [ok required]
  wall = "HARD WALL"
  statement = "HIV's primary target is CD4+ T-helper cells — the central coordinator of adaptive immunity. The infection thus destroys the very cell population on which an adaptive immune response against HIV (and against opportunistic pathogens generally) depends. This is the paradoxical 'destroys the defender' biology of HIV pathogenesis and is the mechanistic basis of progressive immunodeficiency leading to AIDS."
  consequence = "Any therapeutic / immunological strategy must contend with the fact that the response apparatus is itself the substrate of infection. Vaccine and cure strategies that rely on robust HIV-specific CD4 help face a structural constraint; immunotherapies face this same constraint. This is virological reality, not pessimism."
  honesty = "Stated descriptively as the mechanistic feature of HIV pathogenesis; specific cytopathic-mechanism details (direct lysis vs bystander apoptosis vs pyroptosis vs gut-mucosal early depletion) are an active research area in the published literature."

@D lim_ccr5_delta32_rarity := "CCR5-Δ32 zygosity rarity gates generalisation of cure cases" :: real-limit [ok required]
  wall = "STRUCTURAL / EPIDEMIOLOGIC LIMIT"
  statement = "The CCR5-Δ32 allele is common in some European-ancestry populations but is uncommon to absent in most non-European-ancestry populations. Δ32/Δ32 homozygotes are a small fraction even within European-ancestry populations (rough order of ~1% is paraphrased qualitatively from the published allele-frequency literature; varies by surveyed population). The intersection of (a) a histocompatible allogeneic-stem-cell-transplant donor for a recipient with HIV AND (b) Δ32/Δ32 homozygosity in that donor is therefore vanishingly rare in unselected donor pools."
  consequence = "The published Berlin-patient and London-patient cure cases (Hütter 2009 NEJM, Gupta 2019 Nature — see HIV-TREATMENT.tape cure_berlin / cure_london / lim_ccr5_donor) cannot be generalised to a population-level cure strategy by donor matching alone; the rarity is a structural epidemiologic limit. Scalable generalisations require gene-therapy approaches that engineer CCR5-null haematopoiesis — a research direction, not standard care (cross-link HIV-TREATMENT.tape cure_strategies gene-therapy row, NOT duplicated)."
  honesty = "Allele frequencies and zygosity counts are paraphrased qualitatively from the published population-genetics literature; specific percentages depend on the surveyed population and are not asserted here. The structural-rarity argument is robust regardless of the exact figure."
  |> "[@x_liu_1996] · [@x_samson_1996] · [@x_hiv_treatment_sibling]"

@D lim_surveillance_gap := "surveillance gaps in low-resource settings" :: real-limit [ok required]
  wall = "STRUCTURAL / EPIDEMIOLOGIC LIMIT"
  statement = "Global HIV surveillance is uneven. Diagnostic-coverage, treatment-coverage, viral-load monitoring, and resistance-testing capacity vary substantially by country and within country. The UNAIDS reporting tradition documents the gaps between scientific possibility and delivered coverage; conflict, displacement, key-population marginalisation, criminalisation of behaviours associated with HIV risk in some jurisdictions, and chronic underfunding of health systems contribute to surveillance and care gaps in low- and lower-middle-income settings particularly."
  consequence = "Outcomes are bounded below by the slowest link in the surveillance / care continuum. Improving the gap is a programmatic / political / financial problem, not a virological one; this tape records the limit, it does not prescribe specific policy. Cross-link VIROLOGY.tape lim_surveillance_gap (detection-surveillance-gap structural limit applied to emerging viruses generally) — same shape, applied here to HIV's mature surveillance system."
  |> "[@x_unaids_reports_era] · [@x_virology_sibling]"

@D lim_hiv2_treatment_overlap := "HIV-2 — lower transmissibility, reduced ART option overlap" :: real-limit [ok required]
  wall = "STRUCTURAL LIMIT (drug-class compatibility)"
  statement = "HIV-2 is, on average, less transmissible per exposure and produces slower CD4 decline than HIV-1, which is a relative benefit for individual-level outcomes. However, HIV-2 is intrinsically resistant to non-nucleoside reverse-transcriptase inhibitors (NNRTIs) by virtue of sequence differences in the NNRTI-binding pocket of HIV-2 RT, and to the fusion inhibitor enfuvirtide (T-20) by sequence differences in gp41. This reduces the available antiretroviral drug-class palette compared with HIV-1: NRTIs, INSTIs, protease inhibitors, CCR5 antagonists (where tropism allows), and capsid inhibitors are typically the options, with regimen-design literature accordingly different (cross-link HIV-TREATMENT.tape drug_nnrti / drug_entry, NOT duplicated)."
  consequence = "HIV-2-specific clinical-guideline literature exists separately from HIV-1 guidelines for these reasons; choice of regimen, monitoring, and management requires this awareness — handled by infectious-disease clinicians, not this tape."
  honesty = "Intrinsic-resistance facts are virology consensus; cited descriptively. Per-exposure transmissibility differences are population-level epidemiology paraphrased qualitatively from the natural-history literature, not asserted as specific point estimates."
  |> "[@x_sharp_hahn_2011_era] · [@x_hiv_treatment_sibling]"

@D lim_in_silico_boundary := "in-silico → wet-lab / clinical / public-health unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio HIV verifies internal consistency of an HIV virology KNOWLEDGE SSOT. Whether any specific clinical decision, diagnostic workup, treatment regimen choice, prophylaxis strategy, public-health-response decision, or surveillance-investment prioritisation is correct, optimal, or even appropriate for any specific person or population is empirically unverified and out of repo scope."
  consequence = "No C2/C3 PASS in this axis is a clinical, diagnostic, therapeutic, vaccine-recommendation, prevention-strategy, public-health-policy, or regulatory claim. Crossing this boundary requires the appropriate domain workflows (clinician consultation, clinical trials, public-health agency review, regulatory submission, peer-reviewed surveillance analysis) and is tracked outside this repo (hexa-bio AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG)."

# ─── §8 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-hiv-virology" :: governance [required deny:write]
  pattern = "Deriving HIV virology / epidemiology / AIDS-defining-illness numerical claims FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24, sopfr, n/φ) — e.g. the deleted stub's '바이러스 억제 99.9% because σ·sopfr/10', 'σ=12 모니터 수', 'τ=4 주기', 'φ=2 대칭 중복', 'sopfr=5 채널', 'J₂=24 지표', 'σ·φ=n·τ 핵심', 'EXACT 비율 93%' lattice-tautology rows, or any '바이러스가 이미 n=6 격자를 따르고 있던 수학' framing that promotes coincidence to derivation."
  why = "This is exactly the violation the pre-rewrite HIV.tape committed (lattice-tautology stub, mass-split 153b5a2 — see HIV.log.tape audit). HIV virology has no natural n=6 invariant: HIV-1 has 4 groups (M/N/O/P), HIV-2 has multiple groups (A, B, plus rarer ones), the Env spike is a trimer (3), the genome is +ssRNA × 2 copies, the structural-and-essential gene set is 5 (gag/pol/env/tat/rev) plus accessory genes (4 in HIV-1: nef/vif/vpr/vpu; 4 in HIV-2: nef/vif/vpr/vpx), the entry machinery uses 2 receptors (CD4 + co-receptor), the gp41 fusion machinery forms a 6-helix bundle (a structural fact, NOT a derivation source for any virology / clinical claim), and the AIDS-defining illness list is open and growing as new opportunistic-pathogen associations are characterised. hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3 forbid lattice-fit derivation; f1 forbids lattice-fit, f2 forbids in-silico→clinical claims, f3 forbids shadow-implementation of sister tapes."
  remedy = "Cite the real HIV virology / epidemiology / clinical-classification literature (this tape's @X entries plus delegated @X entries in HIV-TREATMENT / VIROLOGY). The lattice may only be a coincidental OBSERVATION, never a derivation source for any HIV virology claim; numbers come from peer-reviewed papers and institutional surveillance reports — not from σ/τ/φ arithmetic."

@N n6_honest_stance := "HIV virology has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: HIV virology exposes NO natural n=6 invariant. HIV-1 has 4 groups (M/N/O/P; M is the pandemic lineage); HIV-1 group M itself splits into ~9 named subtypes (A, B, C, D, F, G, H, J, K) plus an expanding set of CRFs — these counts are biology and naming-convention history (the HIV sequence-classification literature evolved over decades) and not lattice values. The entry machinery uses TWO receptors (CD4 + co-receptor) — a biological fact that numerically coincides with φ(6)=2 but the cause is virology, not the lattice. The Env spike is a TRIMER (3) of gp120/gp41 heterodimers; the gp41 fusion machinery refolds into a SIX-HELIX BUNDLE during fusion (structural-virology fact; coincidence with n=6 is OBSERVATION ONLY, never derivation — this six is set by class-I viral-fusion-protein structural biology). The Baltimore group of HIV is VI (ssRNA-RT) — a Baltimore-group ordinal, not a lattice constant. The HIV-1 genome is roughly 9.7 kb with three structural reading frames (gag/pol/env) plus two regulatory genes (tat/rev) plus four accessory genes (HIV-1: nef/vif/vpr/vpu; HIV-2: nef/vif/vpr/vpx; HIV-2 carries vpx instead of vpu). The AIDS-defining illness catalogue is open, evolving, and revised by the CDC and WHO across successive case-definition revisions. CCR5-Δ32 allele frequency is a population-genetics fact (~10% Northern European-ancestry heterozygous-or-homozygous; rare in non-European populations), not a lattice value. Pandemic-origin dating, Kinshasa-epicentre phylogeography, multiple SIVcpz / SIVsmm cross-species transmissions are reconstructed from molecular-clock and sequence-phylogenetic literature. Per hexa-bio AGENTS.tape g1 (real-limits-first) / g2 (lattice-is-tool): the lattice is DECLINED here as a derivation tool; coincidence may be OBSERVED but never used as cause. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ─── §9 Verifiable predictions (real, falsifiable — NOT lattice) ─────

@D tp_1 := "TP-1 viral genetic-diversity / quasispecies wall on single-antigen sterilising vaccine" :: prediction [ok]
  claim = "Across the multi-year horizon of an HIV-1 vaccine field trial, a single-antigen vaccine targeting a single subtype's Env will not provide durable sterilising immunity against the full HIV-1 group M diversity in heterosexual / MSM populations exposed to multiple circulating subtypes / CRFs. The published HIV-vaccine trial history (a series of efficacy trials over multiple decades, including the early gp120 subunit, adenovirus-vectored, and prime-boost programmes) is the empirical evidence base for this prediction; vaccine concepts that have shown protection so far have been partial / waning / population-specific rather than the sterilising universal protection that the diversity wall makes structurally hard."
  falsifier = "A properly powered, multi-region efficacy trial of a single-antigen vaccine against HIV-1 demonstrating durable (multi-year) high-protection-fraction against incident HIV-1 acquisition across diverse circulating subtypes / CRFs would falsify [@lim_genetic_diversity] as the dominant wall. (Partial efficacy across narrow strain ranges would refine, not falsify, the wall.)"
  source = "[@x_hiv_treatment_sibling] · [@x_virology_sibling]"

@D tp_2 := "TP-2 Berlin/London cure cases do not generalise without Δ32 donor match + allograft indication" :: prediction [ok]
  claim = "The published Berlin-patient and London-patient ART-free-remission cases (Hütter 2009 NEJM, Gupta 2019 Nature) generalise only when both (a) an independent clinical indication for allogeneic stem-cell transplantation is present AND (b) a histocompatible CCR5-Δ32/Δ32 donor is available — the structural-rarity gate of [@lim_ccr5_delta32_rarity]. Programmatic cure via Δ32 donor matching alone is not feasible at population scale; alternative cure modalities (e.g. CCR5 gene therapy) belong to research, not standard care."
  falsifier = "Reproduction of sustained ART-free remission of HIV in unselected people living with HIV (without an allograft indication, without CCR5-Δ32 donor matching) by an alternative, scalable, acceptably-safe intervention would change the gate — and would itself be a major announcement in the HIV cure literature (cross-link HIV-TREATMENT.tape tp_3, same gate)."
  source = "[@x_liu_1996] · [@x_samson_1996] · [@x_hiv_treatment_sibling]"

@D tp_3 := "TP-3 HIV-1 group M phylogeographic epicentre falsifiability" :: prediction [ok]
  claim = "Future ancient-sample sequencing or molecular-clock refinements will continue to place the most recent common ancestor of HIV-1 group M in the early 20th century in West-central Africa, with the Kinshasa region the inferred geographic epicentre (Worobey 2008 ZR59/DRC60 anchors; Faria 2014 phylogeography). Substantial future revision of the temporal placement or the geographic epicentre would require either new earlier-than-1959 confirmed sequence samples or a major recalibration of the HIV molecular clock."
  falsifier = "Recovery of a confirmed pre-20th-century HIV-1 sequence sample, or a molecular-clock recalibration sharply moving the inferred most-recent-common-ancestor outside the early 20th century, would revise [@origin_zoonosis]. Recovery of HIV-1 group M genetic diversity demonstrating an epicentre clearly elsewhere than West-central Africa would falsify the Faria 2014 phylogeographic inference."
  source = "[@x_worobey_2008] · [@x_faria_2014]"

# ─── §10 Cross-links (sister tapes — reference, do NOT shadow · f3) ──

@X x_hiv_treatment_sibling := "HIV-TREATMENT.tape" :: sibling-tape [active]
  scope = "HIV biology + antiretroviral therapy literature index — drug classes (NRTI/NNRTI/INSTI/PI/entry/capsid/long-acting), treatment-strategy landmarks (HAART, START, PrEP, U=U, MTCT), cure-direction literature (latent reservoir, Berlin/London, bnAbs), treatment real-limits (reservoir, resistance, adherence, immune reconstitution, structural/social, Δ32-donor). HIV.tape (this file) cross-references HIV-TREATMENT for any therapeutic content; does NOT duplicate."

@X x_virology_sibling := "VIROLOGY.tape" :: sibling-tape [active]
  scope = "General virology — Baltimore classification (HIV is Group VI ssRNA-RT, see fam_retroviridae), life-cycle scaffold, host-virus arms race (interferons, APOBEC3, BST-2/tetherin, TRIM5α, SAMHD1 — all named with HIV-relevance), zoonotic-spillover framework (Plowright 2017), vaccine-protection variability across families (HIV listed among unsolved/partial). HIV.tape (this file) cross-references VIROLOGY for general virology framing; does NOT duplicate."

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "g1 real-limits-first · g2 lattice-is-tool · g3 honesty-obligation-external · g8_in_silico_only · f1 lattice-fit-forbidden · f2 in-silico→clinical-claim-forbidden · f3 no-shadow-impl-of-sister-tape (applies between sibling axes by the same principle)."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  scope = "§0 in-silico-only scope boundary — wet-lab HIV virology / clinical / public-health-response work for any predicted scenario is out-of-repo and unverified."

# ─── §11 External citations (real HIV virology literature) ───────────

@X x_barre_sinoussi_1983 := "Barré-Sinoussi F et al 1983" :: literature [active]
  ref = "Barré-Sinoussi F, Chermann JC, Rey F, Nugeyre MT, Chamaret S, Gruest J, Dauguet C, Axler-Blin C, Vézinet-Brun F, Rouzioux C, Rozenbaum W, Montagnier L. Isolation of a T-lymphotropic retrovirus from a patient at risk for acquired immune deficiency syndrome (AIDS). Science 1983;220:868–871. (Institut Pasteur · Montagnier group · original HIV isolation, then designated lymphadenopathy-associated virus / LAV)"

@X x_gallo_1984_era := "Gallo RC et al 1984 (Science series)" :: literature [active]
  ref = "Gallo RC, Popovic M, Sarngadharan MG, Read E and colleagues. Series of Science papers in 1984 from the National Cancer Institute (USA) characterising HTLV-III as the etiologic agent of AIDS, including the cell-line propagation (HUT-78 derivative H9) that enabled large-scale virological work and serological-test development. Subsequent reconciliation established that HTLV-III, LAV, and AIDS-Related Virus refer to the same agent — HIV. Primary-author / 1984 era cited; exact volume / page for any single line is not asserted because the 1984 attribution rests on the series and its subsequent reconciliation literature."

@X x_korber_2000_era := "Korber B et al 2000 (origin-timing era)" :: literature [active]
  ref = "Korber B and colleagues. Molecular-clock and phylogenetic reconstructions of the timing of HIV-1 group M emergence, Los Alamos HIV sequence database tradition, work in the late 1990s and 2000 — including the Science 2000 paper 'Timing the ancestor of the HIV-1 pandemic strains'. Primary-author / era cited; exact volume not asserted for individual lines."

@X x_sharp_hahn_2011_era := "Sharp PM, Hahn BH 2011 (era)" :: literature [active]
  ref = "Sharp PM, Hahn BH. Origins of HIV and the AIDS pandemic. Cold Spring Harbor Perspectives in Medicine, 2011 era — review of the cross-species-transmission origins of HIV-1 (from SIVcpz / SIVgor) and HIV-2 (from SIVsmm), the HIV-1 group M/N/O/P partition, and HIV-2 group A/B partition. Primary-author / era cited; exact volume / issue / page for individual claims is the journal's record."

@X x_worobey_2008 := "Worobey M et al 2008" :: literature [active]
  ref = "Worobey M, Gemmel M, Teuwen DE, Haselkorn T, Kunstman K, Bunce M, Muyembe J-J, Kabongo J-MM, Kalengayi RM, Van Marck E, Gilbert MTP, Wolinsky SM. Direct evidence of extensive diversity of HIV-1 in Kinshasa by 1960. Nature 2008;455:661–664. (DRC60 ancient sample combined with ZR59 to refine the timing of HIV-1 group M emergence — Kinshasa anchor)"

@X x_faria_2014 := "Faria NR et al 2014" :: literature [active]
  ref = "Faria NR, Rambaut A, Suchard MA, Baele G, Bedford T, Ward MJ, Tatem AJ, Sousa JD, Arinaminpathy N, Pépin J, Posada D, Peeters M, Pybus OG, Lemey P. The early spread and epidemic ignition of HIV-1 in human populations. Science 2014;346:56–61. (HIV-1 group M phylogeography — Kinshasa, DRC as the inferred geographic epicentre of group M diversification)"

@X x_liu_1996 := "Liu R et al 1996" :: literature [active]
  ref = "Liu R, Paxton WA, Choe S, Ceradini D, Martin SR, Horuk R, MacDonald ME, Stuhlmann H, Koup RA, Landau NR. Homozygous defect in HIV-1 coreceptor accounts for resistance of some multiply-exposed individuals to HIV-1 infection. Cell 1996;86:367–377. (CCR5 identified as the major macrophage-tropic HIV-1 co-receptor; CCR5-Δ32 allele characterised)"

@X x_samson_1996 := "Samson M et al 1996" :: literature [active]
  ref = "Samson M, Libert F, Doranz BJ, Rucker J, Liesnard C, Farber CM, Saragosti S, Lapouméroulie C, Cogniaux J, Forceille C, Muyldermans G, Verhofstede C, Burtonboy G, Georges M, Imai T, Rana S, Yi Y, Smyth RJ, Collman RG, Doms RW, Vassart G, Parmentier M. Resistance to HIV-1 infection in caucasian individuals bearing mutant alleles of the CCR-5 chemokine receptor gene. Nature 1996;382:722–725. (CCR5-Δ32 mutation characterised; the loss-of-function basis of the Δ32/Δ32 protected phenotype — landmark Nature paper dual with [@x_liu_1996] Cell paper)"

@X x_chang_moore_kshv_1994 := "Chang Y, Moore PS et al 1994" :: literature [active]
  ref = "Chang Y, Cesarman E, Pessin MS, Lee F, Culpepper J, Knowles DM, Moore PS. Identification of herpesvirus-like DNA sequences in AIDS-associated Kaposi's sarcoma. Science 1994;266:1865–1869. (Discovery of Kaposi-sarcoma-associated herpesvirus / human herpesvirus 8 / HHV-8 in AIDS-KS tissue by representational difference analysis)"

@X x_briggs_capsid_era := "HIV capsid cryo-EM / cryo-ET era — Briggs / Sundquist / Ganser-Pornillos and colleagues" :: literature [active]
  ref = "Multi-author capsid structural-biology literature establishing the HIV-1 mature capsid as a fullerene cone of CA hexamers with twelve pentameric defects (Ganser et al 1999 Science 283:80–83 — original mathematical / structural model; Briggs, Krausslich, and others subsequently using cryo-EM / cryo-ET to refine all-atom and sub-tomogram averages of the mature capsid; Sundquist laboratory contributions including Pornillos et al on CA hexamer X-ray structures). Primary-author / era cited collectively; exact volumes for individual claims are the journals' record."

@X x_unaids_reports_era := "UNAIDS Global AIDS Update / institutional reporting (era)" :: literature [active]
  ref = "Joint United Nations Programme on HIV/AIDS (UNAIDS). Global AIDS Update / 'AIDS by the numbers' / Country Progress Reports, annual / periodic since the late 1990s. Cited as institutional source for global epidemiology estimates, key-population framings, and the 95-95-95 target framework; specific point estimates and year-on-year figures evolve and live in the source documents — paraphrased here qualitatively rather than asserted as specific numbers (literature-honesty rule)."

@X x_cdc_case_definition_era := "CDC AIDS case-definition literature (1993 revision / subsequent)" :: literature [active]
  ref = "Centers for Disease Control and Prevention (USA). MMWR Recommendations and Reports series on the AIDS case definition — 1993 revision (incorporating CD4+ <200 cells/µL as an AIDS-defining criterion in adults) and subsequent revisions including a 2014 update of the HIV-infection surveillance case definition. Cited as institutional source for AIDS-defining-illness taxonomy and CD4-threshold criteria; exact MMWR volume / report number not asserted for individual lines because the case definition has evolved across multiple publications."

@X x_who_clinical_staging_era := "WHO HIV clinical-staging literature" :: literature [active]
  ref = "World Health Organization. WHO clinical staging of HIV/AIDS for adults and adolescents (Stages 1–4) and case-definition guideline documents in the public-health programmatic literature (associated with the WHO Treat-All / 90-90-90 era / 95-95-95 era guidance). Cited as institutional source; specific document IDs and revision dates are part of the WHO public archive and not asserted for individual lines (literature-honesty rule)."
