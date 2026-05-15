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
# VIROLOGY.tape — architecture-current (editable per v1.2)
# Event history → VIROLOGY.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "virology" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · virology in-silico knowledge SSOT"
  brief = "Virology — viral biology + emerging pathogens · n=6 NOT used as a derivation (honest) — capsid geometry delegated to HEXA-VIROCAPSID"
  parent = "dancinlab/hexa-bio"
  sibling-log = "VIROLOGY.log.tape"
  scope = "in-silico virology knowledge SSOT · NOT clinical/public-health-policy advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see VIROLOGY.log.tape audit"
  axis-note = "VIROLOGY is the umbrella in-silico knowledge SSOT for viral biology, host-virus interaction, emerging viruses, and pandemic/epidemic descriptive context. CAPSID geometry / T-number / Caspar-Klug / packaging motors / AAV vector pharmacology live in HEXA-VIROCAPSID.tape (sibling axis) — referenced here, NOT duplicated (hexa-bio AGENTS.tape f3 no-shadow-impl-of-sister-tape applies between sibling axes). Therapeutic / vaccine specifics live in HIV-TREATMENT.tape and VACCINE.tape — also referenced, not duplicated."

@N scope_disclaimer := "clinical/public-health scope honesty" :: note [required]
  text = "This tape is an evidence-summary knowledge SSOT for an in-silico virology substrate. Viral taxonomy, life-cycle steps, family exemplars, pandemic chronology, and host-restriction-factor mechanisms are paraphrased from textbook (Fields/Knipe & Howley era) and primary peer-reviewed literature for modeling context only. Nothing here is a clinical claim, an outbreak-response recommendation, a public-health-policy prescription, an immunogenicity prediction, or a regulatory submission. Real virology / public-health work requires licensed clinicians and public-health authorities (national CDC equivalents · WHO · ICTV for taxonomy). All claims are in-silico simulator/metadata consistency only; the wet-lab → preclinical → clinical → regulatory boundary is explicitly out of scope (hexa-bio AGENTS.tape g8_in_silico_only / f2). Where exact volume/page references cannot be confidently asserted, citations are flagged primary-author/era (literature-honesty rule)."
  |> "[@x_baltimore_1971] · [@x_knipe_howley_fields]"

# ─── §1 What virology is & how this tape is scoped ────────────────────

@D dx_definition := "what virology is" :: domain [ok]
  field = "Virology — the biology of viruses, sub-cellular obligate intracellular replicators that lack independent metabolism and require a host cell to express, replicate, and package their genomes."
  this-tape = "Umbrella in-silico knowledge SSOT for viral biology, taxonomy, life cycle, host-virus arms race, and emerging-virus / pandemic descriptive context. Capsid geometry → HEXA-VIROCAPSID. Therapeutic regimens for specific viruses → HIV-TREATMENT (and analogous future viral-treatment tapes). Vaccine immunology and platform landscape → VACCINE."
  not-this-tape = "Capsid T-number derivation / Caspar-Klug / packaging-motor mechanics / AAV vector engineering belong to HEXA-VIROCAPSID. Specific antiretroviral pharmacology belongs to HIV-TREATMENT. Vaccine platform classes belong to VACCINE. Veterinary / zoonotic-reservoir specifics belong to VETERINARY. Cross-link, do not duplicate."
  |> "[@x_knipe_howley_fields] · [@x_hexa_virocapsid_sibling] · [@x_hiv_treatment_sibling] · [@x_vaccine_sibling]"

# ─── §2 Baltimore classification (7 groups — NOT 6) ───────────────────

@D cls_baltimore := "Baltimore classification — 7 groups" :: classification [ok]
  origin = "David Baltimore proposed a genome-replication-strategy classification of viruses in 1971, organising the diversity of viral genomes by the path taken from genome → mRNA. The framework is foundational and remains widely used alongside the ICTV phylogenetic taxonomy."
  groups = "Group I: double-stranded DNA (dsDNA) — e.g. herpesviruses, adenoviruses, poxviruses, polyomaviruses. Group II: single-stranded DNA (ssDNA) — e.g. parvoviruses (AAV — see HEXA-VIROCAPSID), circoviruses. Group III: double-stranded RNA (dsRNA) — e.g. reoviruses (rotavirus). Group IV: positive-sense single-stranded RNA ((+)ssRNA) — e.g. coronaviruses, picornaviruses, flaviviruses. Group V: negative-sense single-stranded RNA ((−)ssRNA) — e.g. orthomyxoviruses (influenza), paramyxoviruses (measles), rhabdoviruses (rabies), filoviruses (Ebola). Group VI: ssRNA reverse-transcribing (ssRNA-RT) — retroviruses (HIV — see HIV-TREATMENT). Group VII: dsDNA reverse-transcribing (dsDNA-RT) — hepadnaviruses (HBV)."
  count = "SEVEN groups (I–VII). Explicitly NOT six. The stub-era claim that 'Baltimore = σ-sopfr = 7' or that the system 'should have been' 6 is a lattice-tautology error — Baltimore proposed seven categories based on replication biology, the count is a biological/historical fact, not a lattice derivation. See [@n6_honest_stance]."
  ictv-relation = "Baltimore is a REPLICATION-STRATEGY classification; the International Committee on Taxonomy of Viruses (ICTV) maintains the formal phylogenetic taxonomy (Realm/Kingdom/Phylum/Class/Order/Family/Genus/Species + sub-ranks). The two systems are complementary; a virus has both a Baltimore group and an ICTV taxonomic placement."
  |> "[@x_baltimore_1971] · [@x_ictv_taxonomy]"

# ─── §3 Viral life cycle (stages — descriptive, not a lattice) ───────

@D life_cycle_overview := "viral life cycle — common scaffold" :: mechanism [ok]
  stages = "Attachment / entry → uncoating → genome replication & transcription → translation of viral proteins → assembly → egress (release). Specific viruses elaborate, omit, or reorder these stages; this is a descriptive scaffold not a universal mandatory n-tuple."
  stage-count-honesty = "Different textbooks enumerate the cycle as 5, 6, 7, or more stages depending on splitting (e.g. uncoating as separate vs. fused with entry; maturation as separate vs. fused with assembly). The stub-era claim '복제 = 6 단계 = n=6' was a lattice-fit on a convention-dependent count. See [@n6_honest_stance]."
  |> "[@x_knipe_howley_fields]"

@D life_attachment_entry := "attachment & entry" :: mechanism [ok]
  attachment = "Virion surface protein(s) bind one or more host-cell-surface receptor(s) (sometimes plus co-receptor); receptor identity is a major determinant of host range and tissue tropism. Examples: gp120/CD4 + CCR5/CXCR4 for HIV (see HIV-TREATMENT); SARS-CoV-2 spike / ACE2 (Zhou et al 2020); influenza HA / sialic-acid; rabies G / nicotinic ACh receptor; measles H / SLAM/CD46/nectin-4."
  entry-routes = "Two broad routes: (a) plasma-membrane fusion (enveloped viruses with class-I/II/III fusion proteins; e.g. paramyxovirus F, HIV gp41, influenza HA2, SARS-CoV-2 S2); (b) receptor-mediated endocytosis with subsequent endosomal release (many enveloped + non-enveloped viruses; pH-triggered conformational change in fusion protein, or endosomal escape of non-enveloped capsid)."
  honesty = "Receptor / co-receptor pairs are virus-specific biology, established by primary literature and cryo-EM / biochemistry. Not lattice-derived."
  |> "[@x_zhou_2020]"

@D life_uncoating_replication := "uncoating, genome replication, transcription" :: mechanism [ok]
  uncoating = "Capsid disassembly / partial disassembly releases or exposes genome for replication. Mechanism varies: pH-triggered (rhinovirus), motor-mediated injection (tailed phage), reverse-transcription-within-capsid (HIV), nuclear-import + cap-uncoating (influenza)."
  replication-strategy = "Determined by Baltimore group — dsDNA viruses largely use host (or virus-encoded) DNA polymerases; +ssRNA viruses translate immediately then encode an RNA-dependent RNA polymerase (RdRp) for replication; −ssRNA viruses package their RdRp in the virion (the genome is non-translatable mRNA); retroviruses reverse-transcribe then integrate; hepadnaviruses (HBV) reverse-transcribe a pregenomic RNA."
  rdrp-motifs = "RNA-dependent RNA polymerases (RdRps) of (+)ssRNA and (−)ssRNA viruses share a set of conserved structural/sequence motifs historically designated A–G in the literature (palm-domain catalytic motifs). The exact count of named motifs is a structural-virology convention, not a lattice-derived constant — different reviews enumerate them slightly differently."
  |> "[@x_knipe_howley_fields]"

@D life_assembly_egress := "assembly & egress" :: mechanism [ok]
  assembly = "Capsid self-assembly (icosahedral / helical / complex), genome packaging (often by ATP-driven motors for large dsDNA viruses — see HEXA-VIROCAPSID phi29 motor entry), and (for enveloped viruses) acquisition of host-derived lipid envelope during budding."
  capsid-geometry-cross-link = "T-number quasi-equivalence (Caspar-Klug), Zlotnick assembly thermodynamics, HK97 chainmail maturation, and packaging-motor mechanics are all CROSS-REFERENCED to HEXA-VIROCAPSID — NOT re-derived here. f3 sibling-tape rule applies."
  egress = "Lytic release (non-enveloped viruses; cell lysis), budding (most enveloped viruses; from plasma membrane or organelle membrane), or controlled exocytosis. Some viruses (e.g. SARS-CoV-2) appear to egress through the lysosomal pathway — biological details continue to be refined."
  |> "[@x_hexa_virocapsid_sibling]"

# ─── §4 Major viral families & exemplars ─────────────────────────────

@D fam_coronaviridae := "Coronaviridae — SARS-CoV-1 / MERS / SARS-CoV-2" :: classification [ok]
  baltimore = "Group IV ((+)ssRNA)."
  genome = "~26–32 kb single-stranded positive-sense RNA — among the largest RNA virus genomes. Four canonical structural proteins (S spike, E envelope, M membrane, N nucleocapsid) plus a large set of non-structural proteins encoded in ORF1ab and an array of accessory ORFs."
  exemplars = "SARS-CoV-1 (Drosten et al 2003 NEJM — original SARS coronavirus isolated and characterised in the 2002–2003 outbreak); MERS-CoV (Middle East respiratory syndrome coronavirus, 2012-onwards, dromedary camel zoonotic reservoir); SARS-CoV-2 (Zhou et al 2020 Nature — genome characterisation + ACE2 receptor identification at the start of the COVID-19 pandemic)."
  receptor = "SARS-CoV-1 and SARS-CoV-2 both use ACE2 as the entry receptor; MERS-CoV uses DPP4. Receptor identity is the primary determinant of these viruses' tropism and zoonotic potential."
  honesty = "Genome lengths and accessory-ORF counts are field-standard from primary literature; treated as paraphrased reference figures, not lattice-derived constants."
  |> "[@x_drosten_2003] · [@x_zhou_2020]"

@D fam_orthomyxoviridae := "Orthomyxoviridae — influenza A/B/C/D" :: classification [ok]
  baltimore = "Group V ((−)ssRNA), SEGMENTED genome (8 segments for influenza A and B; 7 for influenza C; 7 for influenza D)."
  exemplars = "Influenza A — the principal pandemic-capable orthomyxovirus, with surface antigens hemagglutinin (HA, many subtypes H1–H18 described) and neuraminidase (NA, N1–N11 described); influenza B — primarily human-restricted, two co-circulating lineages (Yamagata, Victoria); influenza C / D — generally milder / less prominent in human disease."
  drift-shift = "Antigenic DRIFT (point mutations in HA/NA accumulating each season → annual strain mismatch and reformulation pressure) and antigenic SHIFT (reassortment of segments between co-infecting strains, especially across species at human-avian-swine interfaces, → pandemic-capable novel subtypes). Cross-link VACCINE.tape lim_antigenic_change."
  pandemic-history = "Major influenza A pandemics include 1918 H1N1 (the 'Spanish flu' — the most deadly recent pandemic; reconstructed in the 2000s by Taubenberger and colleagues from archived autopsy and permafrost samples — primary-author/era literature), 1957 H2N2 ('Asian'), 1968 H3N2 ('Hong Kong'), 2009 H1N1pdm (the most recent confirmed influenza A pandemic). Counts and dating are historical record, not lattice derivations."
  |> "[@x_knipe_howley_fields] · [@x_taubenberger_era] · [@x_vaccine_sibling]"

@D fam_filoviridae := "Filoviridae — Ebola / Marburg" :: classification [ok]
  baltimore = "Group V ((−)ssRNA), filamentous helical capsid."
  exemplars = "Ebolavirus genus (Zaire, Sudan, Bundibugyo, Taï Forest, Reston species); Marburgvirus."
  outbreaks = "Periodic outbreaks since the 1976 Ebola index events; the 2014–2016 West African outbreak (Guinea / Liberia / Sierra Leone) was the largest by case count and led to deployment-stage Ebola vaccine development (rVSV-ZEBOV — Henao-Restrepo et al 2017 Lancet ring-vaccination trial, see VACCINE.tape plat_viral_vector); ongoing periodic outbreaks in central and east Africa."
  reservoir = "Fruit-bat reservoir (Pteropodidae) is widely supported by the field literature; intermediate-host pathways to humans depend on context (bushmeat, direct bat contact). Zoonotic-spillover framework applies (cross-link [@spillover_plowright])."
  |> "[@x_knipe_howley_fields]"

@D fam_retroviridae := "Retroviridae — HIV-1 / HIV-2 / HTLV-1" :: classification [ok]
  baltimore = "Group VI (ssRNA-RT)."
  exemplars = "HIV-1 (global pandemic since the 1980s; first isolated Barré-Sinoussi/Montagnier 1983 — see HIV-TREATMENT.tape); HIV-2 (West Africa, slower CD4 decline); HTLV-1 (adult T-cell leukaemia, tropical spastic paraparesis, endemic in some regions)."
  cross-link = "Full HIV biology + ART pharmacology + cure-direction literature is in HIV-TREATMENT.tape (sister tape, not duplicated here). VIROLOGY only places retroviruses in the Baltimore framework."
  |> "[@x_hiv_treatment_sibling]"

@D fam_hepatitis_viruses := "hepatitis viruses (A/B/C/D/E)" :: classification [ok]
  honesty = "The five named human hepatitis viruses are unrelated taxonomically — they share a tissue tropism (liver), not a phylogeny. The letter sequence A–E is historical-naming, not a lattice."
  hep-a = "Hepatitis A virus (HAV) — Picornaviridae, Group IV (+)ssRNA. Acute fecal-oral hepatitis, vaccine-preventable (inactivated; see VACCINE.tape)."
  hep-b = "Hepatitis B virus (HBV) — Hepadnaviridae, Group VII (dsDNA-RT). Chronic infection risk; HBV core (T=4 capsid — see HEXA-VIROCAPSID) and HBsAg (recombinant subunit/VLP vaccine antigen — see VACCINE.tape)."
  hep-c = "Hepatitis C virus (HCV) — Flaviviridae, Group IV (+)ssRNA. Chronic infection; cured by direct-acting antiviral (DAA) regimens (NS5A/NS5B/protease combinations) since the mid-2010s — a major therapeutic milestone (Nobel-recognised discovery era including Houghton, Alter, Rice for HCV identification)."
  hep-d = "Hepatitis D virus (HDV) — a defective satellite virus requiring HBV co-infection for envelope (HBsAg); worst-case chronic hepatitis."
  hep-e = "Hepatitis E virus (HEV) — Hepeviridae, Group IV (+)ssRNA. Acute hepatitis with high mortality in pregnancy; VLP vaccine (Hecolin) licensed in China — see VACCINE.tape."

@D fam_herpesviridae := "Herpesviridae — HSV / VZV / EBV / CMV / HHV-6/7/8" :: classification [ok]
  baltimore = "Group I (dsDNA), large enveloped icosahedral T=16 capsid (cross-link HEXA-VIROCAPSID viral_family_t16). Lifelong latency is the defining feature."
  human-herpesviruses = "Eight characterised human herpesviruses: HSV-1 (oral / orofacial), HSV-2 (genital), VZV (varicella-zoster — chickenpox / shingles), EBV (Epstein-Barr — infectious mononucleosis, Burkitt lymphoma, nasopharyngeal carcinoma), CMV (cytomegalovirus — congenital infection, transplant-recipient complications), HHV-6A/6B (roseola, transplant complications), HHV-7, HHV-8 (Kaposi sarcoma-associated herpesvirus, KSHV)."
  latency = "Latency is the defining clinical reality: after acute infection the viral genome persists indefinitely in characteristic cell types (HSV in neurons, VZV in dorsal-root ganglia, EBV in memory B cells, HHV-6 integrated in some cases), with periodic reactivation. Antivirals (acyclovir-class for HSV/VZV; ganciclovir-class for CMV) suppress replication; they do NOT eliminate latency."
  honesty = "The count of eight human herpesviruses is biological / discovery history, not a lattice number. Latency is a categorical biological property, not a derivation."
  |> "[@x_knipe_howley_fields] · [@x_hexa_virocapsid_sibling]"

@D fam_papillomaviridae := "Papillomaviridae — HPV" :: classification [ok]
  baltimore = "Group I (dsDNA), T=7 all-pentamer capsid (the 'papova' non-quasi-equivalent architecture — cross-link HEXA-VIROCAPSID viral_family_t7)."
  oncogenicity = "Persistent infection with high-risk HPV genotypes (especially HPV 16 and HPV 18, plus 31/33/45/52/58 and others) is the etiologic agent of cervical cancer and is implicated in a substantial fraction of anal, oropharyngeal, penile, vulvar, and vaginal cancers. The HPV-cervical-cancer causal link was established by Harald zur Hausen and colleagues (Nobel Prize in Physiology or Medicine 2008)."
  vaccine = "HPV VLP vaccines (Gardasil-9, Cervarix) target the L1 major-capsid protein and are a major cancer-prevention milestone — cross-link VACCINE.tape plat_vlp and HEXA-VIROCAPSID vc_immunogenicity_vlp. Specific composition and clinical outcomes are paraphrased from public licensure literature."
  honesty = "The zur Hausen Nobel context is a real historical-record citation, not a re-derivation. HPV typing is biological / clinical, not lattice-derived."
  |> "[@x_zur_hausen_nobel_2008] · [@x_vaccine_sibling] · [@x_hexa_virocapsid_sibling]"

@D fam_poxviridae := "Poxviridae — smallpox / mpox / vaccinia" :: classification [ok]
  baltimore = "Group I (dsDNA), large complex (brick-shaped) virion architecture (NOT icosahedral) with cytoplasmic replication."
  smallpox = "Variola virus — the agent of smallpox; declared globally eradicated by WHO in 1980 following the global smallpox-eradication campaign (Henderson, Foege and many others — primary-program citation). Vaccinia virus (the cowpox-related vaccine strain, lineage tracing to Jenner 1798 cowpox cross-protection observation) was the eradication vaccine."
  mpox = "Mpox (monkeypox) virus — endemic in central / west Africa with sporadic global cases; the 2022 multi-country mpox outbreak (declared a PHEIC by WHO in 2022) demonstrated continued circulation and zoonotic potential."
  honesty = "Smallpox eradication is the single human-disease eradication-by-vaccination success in history — cited descriptively, not as a lattice metric. Eradication conditions (smallpox-specific biology + global infrastructure + political will) do not generalise trivially to other pathogens (see [@lim_eradication_difficulty])."
  |> "[@x_who_smallpox_1980]"

@D fam_rhabdoviridae := "Rhabdoviridae — rabies" :: classification [ok]
  baltimore = "Group V ((−)ssRNA), bullet-shaped helical capsid."
  rabies = "Rabies virus — universally fatal in symptomatic patients without post-exposure prophylaxis (PEP); PEP (vaccine + immunoglobulin) is highly effective if administered promptly. Major reservoirs include dogs (the dominant source globally), bats, and various wild carnivores depending on region. Cross-link VETERINARY for One-Health context."
  honesty = "Rabies PEP regimen specifics are clinical (Essen / Zagreb / WHO 2018 abbreviated regimens) and are NOT prescribing guidance here — they are clinical-immunology examples paraphrased from public guideline literature."
  |> "[@x_knipe_howley_fields] · [@x_veterinary_sibling]"

@D fam_reoviridae := "Reoviridae — rotavirus / bluetongue" :: classification [ok]
  baltimore = "Group III (dsRNA), SEGMENTED genome, multi-shell capsid architecture (cross-link HEXA-VIROCAPSID viral_family_t13)."
  rotavirus = "Rotavirus — the leading global cause of severe childhood diarrhoeal disease; live-attenuated oral rotavirus vaccines (RotaTeq / Rotarix; earlier RotaShield was withdrawn for intussusception signal — see VACCINE.tape lim_rare_ae) have substantially reduced rotavirus mortality in vaccinated populations."
  bluetongue = "Bluetongue virus — veterinary pathogen of ruminants (Culicoides-vectored); cross-link VETERINARY."
  honesty = "Segment counts (rotavirus 11, reovirus 10, bluetongue 10, Colorado tick fever 12) are family-specific biology; coincidences with lattice values do not constitute a derivation. See [@n6_honest_stance]."
  |> "[@x_knipe_howley_fields]"

# ─── §5 Host-virus arms race (innate restriction + viral counter) ────

@D host_interferons := "type I/III interferons (IFN)" :: mechanism [ok]
  innate-signal = "On viral infection, pattern-recognition receptors (PRRs — RIG-I / MDA5 in cytoplasm; TLR3/7/8/9 in endosomes; cGAS-STING for cytosolic DNA) sense viral PAMPs and trigger transcription of type I (IFN-α/β) and type III (IFN-λ) interferons. IFNs act in autocrine/paracrine fashion to induce hundreds of interferon-stimulated genes (ISGs) that establish an antiviral state."
  isgs = "ISGs include direct antiviral effectors (MxA against influenza nucleoprotein; ISG15 conjugation; OAS-RNase L cleavage of viral RNA; PKR translation shut-down) and immune-modulating factors. The type-I IFN response is the dominant systemic antiviral early response; type-III IFNs dominate at epithelial surfaces."
  honesty = "ISG counts (hundreds) are biological-fact survey numbers; specific ISG mechanisms are virus-specific. Not a lattice."
  |> "[@x_knipe_howley_fields]"

@D host_apobec3 := "APOBEC3 cytidine deaminases (HIV restriction)" :: mechanism [ok]
  mechanism = "APOBEC3G (and other APOBEC3 family members) are cytidine deaminases that, packaged into nascent retroviral particles, deaminate cytosine to uracil in the viral minus-strand DNA during reverse transcription, producing G-to-A hypermutation that lethally mutagenises the virus."
  viral-counter = "HIV-1 Vif binds APOBEC3G and recruits a Cullin5 ubiquitin-ligase complex, targeting APOBEC3G for proteasomal degradation and excluding it from progeny virions — a clear restriction-factor / viral-antagonist arms race. (HIV-2 has analogous Vif activity; SIV strains vary in APOBEC3 specificity.)"
  citation-era = "Established by Sheehy/Malim and many subsequent groups in the early 2000s onward (primary-author/era; exact volumes not asserted here)."
  |> "[@x_restriction_factor_era]"

@D host_bst2_tetherin := "BST-2 / tetherin (release restriction)" :: mechanism [ok]
  mechanism = "BST-2 (also called tetherin / CD317) is a membrane-anchored ISG that physically tethers nascent enveloped virions to the host cell membrane, preventing their release. Active against HIV-1, Lassa, Ebola, and many other enveloped viruses."
  viral-counter = "HIV-1 Vpu antagonises tetherin (counter-acting BST-2 to allow virion release); HIV-2 / SIVmac use Env or Nef instead; Ebola uses GP. Each major virus group has evolved a tetherin antagonist — classic arms-race pattern."
  citation-era = "Established by Neil/Bieniasz and others in the late 2000s onward (primary-author/era)."
  |> "[@x_restriction_factor_era]"

@D host_trim5alpha := "TRIM5α (capsid restriction)" :: mechanism [ok]
  mechanism = "TRIM5α (and TRIM-Cyp fusions in some primates) is a cytoplasmic capsid-binding restriction factor that recognises the incoming retroviral capsid lattice in a species-specific way, triggering capsid disassembly and inhibiting reverse transcription. TRIM5α explains much of the cross-species barrier to retroviral infection in primates."
  viral-counter = "HIV-1 has evolved to be relatively resistant to human TRIM5α but is restricted by rhesus-macaque TRIM5α — an early-2000s discovery that helped explain why HIV-1 strains don't generally infect rhesus macaques and shaped the choice of animal models."
  citation-era = "Established by Sodroski, Stremlau and colleagues in the mid-2000s onward (primary-author/era)."
  |> "[@x_restriction_factor_era]"

@D host_samhd1 := "SAMHD1 (dNTP pool restriction)" :: mechanism [ok]
  mechanism = "SAMHD1 is a dGTP-activated dNTPase that depletes cytoplasmic dNTP pools below the level required for efficient reverse transcription, restricting HIV-1 in resting (non-cycling) myeloid and CD4+ T cells. SAMHD1 is the substrate of the Vpx accessory protein of HIV-2 / SIVsmm, which targets it for degradation — a partial explanation for HIV-2 vs HIV-1 myeloid-cell tropism differences."
  citation-era = "Established by Hrecka/Skowronski, Laguette/Benkirane and colleagues in the early 2010s (primary-author/era)."
  |> "[@x_restriction_factor_era]"

@D host_arms_race := "host-virus arms race — interpretive frame" :: mechanism [ok]
  pattern = "Across these examples (interferons, APOBEC3, BST-2, TRIM5α, SAMHD1, and many others) a recurrent pattern emerges: a host restriction factor evolves to inhibit a viral step; the virus evolves a counter-antagonist; the host evolves a workaround; positive-selection signatures appear in restriction-factor genes across primate evolution. This arms-race framework is the dominant interpretive lens for innate antiviral immunity."
  honesty = "The arms-race frame is a real evolutionary-genomics interpretation, broadly supported; specific dating and which factor is dominant for which virus is virus-specific. Listed conceptually, not as a quantitative claim."
  |> "[@x_restriction_factor_era]"

# ─── §6 Emerging viruses & zoonotic spillover ────────────────────────

@D spillover_plowright := "zoonotic-spillover framework — Plowright et al 2017" :: domain [ok]
  framework = "Plowright et al 2017 (Nat Rev Microbiol) formalised zoonotic spillover as a multi-stage process: reservoir-host distribution and viral prevalence within reservoir → reservoir-host shedding → pathogen survival outside the host (environmental exposure / vector-mediated transfer) → recipient-species exposure dose × route → recipient-species susceptibility (genetic, immune, prior exposure) → within-recipient replication and onward-transmission potential. Each stage is a barrier; a successful spillover (especially a SUSTAINED human-to-human one) requires alignment across all of them."
  applications = "Used to interpret SARS / MERS / SARS-CoV-2 / Ebola / Nipah / Hendra / Lassa / Marburg / mpox / avian-influenza spillovers and to model intervention points (reservoir vaccination, vector control, livestock biosecurity, surveillance at human-livestock-wildlife interfaces, early-detection systems)."
  cross-link = "VETERINARY for animal-reservoir specifics; PUBLIC-HEALTH-policy implications are out-of-repo scope."
  |> "[@x_plowright_2017] · [@x_veterinary_sibling]"

@D one_health := "One Health framework" :: domain [ok]
  framework = "One Health is a collaborative interpretive frame integrating human, animal, and environmental health — particularly relevant for zoonotic emerging viruses where the pathogen spans species and the surveillance / intervention strategy must too. Promoted by WHO / FAO / WOAH (former OIE) jointly."
  cross-link = "Cross-link VETERINARY tape for animal-side specifics and AGRICULTURE / ECOLOGY adjacencies where reservoir / vector ecology drives spillover risk."
  honesty = "One Health is a coordination FRAME, not a quantitative model; useful for organising surveillance and response, not for deriving threshold values."
  |> "[@x_plowright_2017]"

@D emerging_baseline := "emerging-virus surveillance baseline" :: domain [ok]
  premise = "Many novel viruses circulate undetected at low prevalence in animal reservoirs until ecological / behavioural changes (deforestation, livestock intensification, wildlife trade, climate-driven range shifts of reservoirs and vectors) elevate human-exposure probability. Detection systems (ProMED, WHO event-based surveillance, national CDCs, sequencing-based surveillance networks like GISAID for influenza/SARS-CoV-2) attempt to identify spillovers early."
  honesty = "Surveillance gaps remain substantial in low-resource settings; detection is uneven. This is a descriptive observation supported by the public-health and emerging-disease literature, not a derivation."
  |> "[@x_plowright_2017]"

# ─── §7 Pandemic / epidemic descriptive context (chronology) ─────────

@D pandemics_descriptive := "selected pandemic / epidemic events — descriptive only" :: domain [ok]
  scope = "Descriptive chronology of selected major pandemics / epidemics for in-silico modeling context. NO public-health-policy recommendations. NO retrospective second-guessing of specific responses. Treatment-recommendation-style claims are explicitly out of scope here (cross-link clinician-facing tapes / public-health authorities)."
  h1n1-1918 = "1918 H1N1 influenza A — among the deadliest pandemics in modern history (tens of millions of estimated deaths); reconstructed and characterised molecularly in the 2000s by Taubenberger and colleagues from preserved tissue. Genomic features (especially of HA / polymerase complex) studied as a virulence reference point."
  h1n1-2009 = "2009 H1N1pdm influenza A — the most recent confirmed influenza A pandemic; reassortment of swine / avian / human lineages."
  hiv-aids = "HIV/AIDS — global pandemic since the early 1980s; SIVcpz → human cross-species event(s) in the early-20th-century Central Africa region per molecular-clock reconstruction (Worobey and colleagues, primary-author/era). Cross-link HIV-TREATMENT."
  sars-2003 = "SARS (SARS-CoV-1) — 2002–2003 outbreak, identified by Drosten et al 2003 NEJM among others; controlled by classical public-health measures (case isolation, contact tracing, quarantine)."
  mers = "MERS (MERS-CoV) — 2012-onwards, dromedary-camel zoonotic reservoir; sporadic outbreaks especially in the Arabian Peninsula and one large nosocomial outbreak in South Korea 2015."
  ebola-2014 = "Ebola West Africa 2014–2016 — Guinea / Liberia / Sierra Leone; rVSV-ZEBOV vaccine ring-trial (Henao-Restrepo et al 2017) and later licensure; deployment of monoclonal-antibody therapies in subsequent outbreaks."
  zika-2015 = "Zika virus 2015–2016 — Americas; flavivirus, primarily Aedes-mosquito vectored; congenital Zika syndrome (microcephaly) recognised as a complication."
  covid-19 = "COVID-19 (SARS-CoV-2) — 2019-onwards; the most recent declared pandemic; characterised genomically Zhou et al 2020 Nature; mRNA, viral-vector, and protein-subunit vaccines developed at unprecedented pace (cross-link VACCINE.tape platforms)."
  mpox-2022 = "Mpox 2022 multi-country outbreak — Orthopoxvirus; declared a PHEIC by WHO in 2022; first-generation smallpox vaccines (Jynneos/MVA-BN; ACAM2000) deployed."
  honesty = "Dates, agents, and the existence of these events are public historical record. Per-event impact estimates are paraphrased from public surveillance literature; precise numbers vary by source and are not asserted here. NO claim is made about what specific public-health responses should have been done."
  |> "[@x_drosten_2003] · [@x_zhou_2020] · [@x_henao_restrepo_2017] · [@x_taubenberger_era] · [@x_who_smallpox_1980]"

# ─── §8 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ──

@D lim_antigenic_evolution := "antigenic drift/shift — hard wall on persistent control" :: real-limit [ok required]
  wall = "HARD WALL"
  statement = "Some viruses (influenza A; coronaviruses including seasonal HCoVs and SARS-CoV-2; HIV-1; HCV pre-DAA era) evolve their surface antigens faster than population immunity can track. Influenza requires annual strain selection and reformulation; SARS-CoV-2 has produced repeated variant waves (Alpha→Delta→Omicron→BA.x→XBB→further descendants) with escape from prior-strain neutralising-antibody profiles."
  consequence = "Sterilising, lifelong immunity to a rapidly-evolving viral pathogen is generally NOT achievable with a single, fixed antigen formulation — the constraint is set by the pathogen's evolutionary rate × population-immunity-selection landscape, NOT by therapy potency or any numeric invariant. Strain-matched reformulation / multivalent antigens / conserved-epitope-targeting strategies are the only routes around this wall, and they do not eliminate it. Cross-link VACCINE.tape lim_antigenic_change."
  |> "[@x_vaccine_sibling]"

@D lim_spillover_baseline := "sustained zoonotic-spillover baseline risk" :: real-limit [ok required]
  wall = "HARD WALL (ecological)"
  statement = "Animal reservoirs of mammalian viruses (bats, rodents, primates, livestock, birds) carry a large unsampled diversity; ecological and behavioural drivers (deforestation, wildlife trade, livestock intensification, climate-driven reservoir range shifts) tend monotonically to INCREASE human-reservoir contact in many regions. Spillover (the Plowright framework) is a recurring baseline, not an eliminable risk."
  consequence = "Future emerging-virus events are predictable in expectation if not in detail. Surveillance, reservoir-host research, and outbreak-response infrastructure are the addressable levers; closure of spillover risk to zero is not a real-world option. This is descriptive, not prescriptive."
  |> "[@x_plowright_2017]"

@D lim_antiviral_resistance := "antiviral resistance emergence under selection" :: real-limit [ok required]
  wall = "SOFT WALL"
  statement = "Viral polymerases (RdRps, reverse transcriptases) generally lack proofreading (most RNA viruses) or have limited proofreading, generating high mutation rates that combined with large within-host viral populations produce pre-existing variation. Under sustained antiviral selection (single-agent monotherapy especially), drug-resistance mutations are selected: HIV reverse-transcriptase K103N (NNRTI), M184V (3TC/FTC), K65R (TDF) — see HIV-TREATMENT; influenza neuraminidase H275Y (oseltamivir-resistance); HCV NS3/NS5A/NS5B resistance to DAAs (largely overcome by combination DAA regimens); HSV thymidine-kinase mutations (acyclovir resistance)."
  consequence = "Combination therapy with non-overlapping mechanisms raises the resistance barrier substantially; high-barrier single agents (e.g. dolutegravir-class INSTI for HIV) raise it further; but no antiviral regimen abolishes the long-term selection pressure indefinitely. Resistance is a real, mechanism-grounded biological limit — not pessimism, not a lattice value."
  |> "[@x_hiv_treatment_sibling]"

@D lim_vaccine_variability := "vaccine-protection variability across viral families" :: real-limit [ok required]
  wall = "HARD WALL (current science, pathogen-by-pathogen)"
  statement = "Vaccine development success is highly variable across viral pathogens: HPV / HBV / HAV / measles / mumps / rubella / VZV / polio / yellow fever / Ebola (rVSV-ZEBOV) are major successes. HIV / RSV (historically — only recently addressed with prefusion-F subunit vaccines and nirsevimab; the 1960s FI-RSV vaccine caused enhanced respiratory disease) / parainfluenza / many others remain partial or unsolved problems. Reasons are pathogen-specific (antigenic variability, immune-privileged reservoirs, integration, conformational instability of key antigens, enhanced-disease risk)."
  consequence = "Vaccine-platform pluralism is essential because no single platform / antigen-design approach is optimal across all viral families. Cross-link VACCINE.tape lim_pathogen_specific_failures."
  |> "[@x_vaccine_sibling]"

@D lim_surveillance_gap := "detection-surveillance gap in emerging viruses" :: real-limit [ok required]
  wall = "STRUCTURAL / EPIDEMIOLOGIC LIMIT"
  statement = "Global surveillance for emerging viruses is uneven; many low- and middle-income regions with the highest spillover ecology have the least surveillance infrastructure (laboratory diagnostics, sequencing capacity, reporting networks, trained workforce). Even high-income regions have surveillance gaps for under-prioritised pathogens. Index cases of emerging diseases are routinely detected late, sometimes after substantial onward transmission has occurred."
  consequence = "The expected time-to-detection for the next emerging virus event is bounded below by the slowest link in the global surveillance network. Improving surveillance is a programmatic / political / financial problem, not a virological one; this tape simply records the limit, it does not prescribe specific policy."
  |> "[@x_plowright_2017]"

@D lim_eradication_difficulty := "viral-disease eradication is rare and conditions-specific" :: real-limit [ok required]
  wall = "HARD WALL (epidemiologic + biological)"
  statement = "Global eradication of a viral disease has been achieved exactly once in humans (smallpox, 1980) and once in animals (rinderpest, 2011 — cross-link VETERINARY). Eradication required a confluence of conditions: no non-human reservoir, no chronic / latent carrier state significantly contributing to transmission, an effective stable vaccine, a reliable diagnostic / case-definition, plus sustained global infrastructure and political will. Most viral pathogens fail one or more of these conditions (HIV — chronic infection, no vaccine; influenza — animal reservoirs + drift/shift; herpesviruses — lifelong latency; measles — interrupted in many regions but global elimination not yet achieved largely due to coverage gaps)."
  consequence = "Eradication is not a generic option in viral-disease control; control / elimination / management are the realistic goals for most pathogens. Polio is in a long-running endgame phase; many other targets are at the elimination (regional zero-incidence) stage but not eradication."
  |> "[@x_who_smallpox_1980]"

@D lim_capsid_cargo_cross_link := "capsid-cargo limit (delegated to HEXA-VIROCAPSID)" :: real-limit [ok required]
  wall = "HARD WALL (geometric — delegated)"
  statement = "Viral-vector gene-therapy cargo size is bounded by capsid interior volume × DNA packaging density; AAV ~4.7 kb is the canonical hard wall, with workarounds (dual-AAV, mini-genes) only partially recovering oversized cargos. Lentivirus (~8 kb) and adenovirus (~36 kb but different trade-offs) bound the other vector classes."
  delegation = "Full mechanism + numbers in HEXA-VIROCAPSID.tape lim_aav_cargo. Cited here because the capsid-cargo limit is a virological reality that shapes which gene therapies are feasible — referenced, not re-derived."
  |> "[@x_hexa_virocapsid_sibling]"

@D lim_in_silico_boundary := "in-silico → wet-lab / clinical / public-health unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio VIROLOGY verifies internal consistency of a virological KNOWLEDGE SSOT. Whether any specific outbreak prediction, vaccine-development priority, antiviral target, surveillance investment, or public-health response is correct, optimal, or even appropriate is empirically unverified and out of repo scope."
  consequence = "No C2/C3 PASS in this axis is a clinical, vaccine-recommendation, antiviral-prescribing, public-health-policy, or regulatory claim. Crossing this boundary requires the appropriate domain workflows (clinical trials, public-health agency review, regulatory submission, peer-reviewed surveillance analysis) and is tracked outside this repo (hexa-bio AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG)."

# ─── §9 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-virology" :: governance [required deny:write]
  pattern = "Deriving virology numerical claims FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24, sopfr, n/φ) — e.g. the deleted stub's 'Baltimore = σ-sopfr = 7 그룹', '복제 = n=6 단계', 'WHO 팬데믹 단계 = n=6', '감염 사슬 고리 = n=6', 'HIV 유전자 = n/φ+φ+τ = 9', 'σ-φ = 10분의 1', 'EXACT 43/43' lattice-tautology rows, or any '바이러스가 이미 따르고 있던 수학' framing that promotes coincidence to derivation."
  why = "This is exactly the violation the pre-rewrite VIROLOGY.tape committed (lattice-tautology stub, mass-split 153b5a2 — see VIROLOGY.log.tape audit). Virology has no natural n=6 invariant: Baltimore = 7 groups (NOT 6); life-cycle stage counts depend on textbook splitting convention; influenza segments = 8 (A/B) and 7 (C/D); HBV ORFs = 4; herpesviruses = 8 named human species; pandemic-stage and infection-chain breakdowns are public-health convention. Any of these may COINCIDENTALLY match a lattice value (e.g. 8 = σ-τ) but the cause is virology / public-health convention / discovery history, never the lattice. hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3 forbid lattice-fit derivation; f2 forbids in-silico→clinical/public-health claims."
  remedy = "Cite the real virology literature (this tape's @X entries plus delegated @X entries in HEXA-VIROCAPSID / HIV-TREATMENT / VACCINE). The lattice may only be a coincidental OBSERVATION, never a derivation source for any virology claim; numbers come from peer-reviewed papers, textbooks, and surveillance literature — not from σ/τ/φ arithmetic."

@N n6_honest_stance := "virology has no natural n=6 invariant — Baltimore = 7 groups, NOT 6" :: note [required]
  text = "Stated plainly: virology exposes NO natural n=6 invariant. The Baltimore classification has SEVEN groups (I dsDNA, II ssDNA, III dsRNA, IV (+)ssRNA, V (−)ssRNA, VI ssRNA-RT, VII dsDNA-RT) — explicitly NOT six; this count is biological/historical (Baltimore 1971), not a lattice derivation, and the stub-era framing of 'Baltimore = σ-sopfr = 7' inverts cause and effect (the count came first; the lattice expression is a coincidence). Life-cycle stage enumeration depends on textbook splitting (5 / 6 / 7+ stages all in use). Influenza segments are 8 (A/B) and 7 (C/D) — family biology, not a lattice; the genomic segmentation of orthomyxoviruses is a real evolutionary feature with permitted reassortment, not a derivation from φ. Capsid T-numbers are geometric (h²+hk+k², delegated to HEXA-VIROCAPSID + HEXA-WEAVE). Surveillance / pandemic-stage breakdowns are public-health-convention scales — they can change as guidance evolves (e.g. WHO retired the 1–6 pandemic phase ladder in 2013 in favour of a different stage framework). Eight human herpesviruses are taxonomy / discovery history. Per hexa-bio AGENTS.tape g1 (real-limits-first) / g2 (lattice-is-tool): the lattice is DECLINED here as a derivation tool; coincidence may be OBSERVED but never used as cause. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ─── §10 Verifiable predictions (real, falsifiable — NOT lattice) ─────

@D tp_1 := "TP-1 antigenic-drift-driven seasonal-vaccine mismatch" :: prediction [ok]
  claim = "For an antigenically variable respiratory virus (influenza A H3N2, SARS-CoV-2), the dominant circulating strain at any given epidemic season's peak will, with high probability over multi-year horizons, exhibit substantial antigenic distance from the prior season's vaccine antigen — driving continued reformulation pressure and predictably imperfect strain match in some seasons."
  falsifier = "If a multi-season cohort of influenza or SARS-CoV-2 surveillance showed antigenic distance between vaccine antigen and dominant circulating strain remaining trivial over many seasons without reformulation, [@lim_antigenic_evolution] would be wrong."
  source = "[@x_vaccine_sibling] (cross-link to VACCINE.tape tp_1 platform-rapid-redesign prediction)"

@D tp_2 := "TP-2 next-decade emerging-virus event" :: prediction [ok]
  claim = "Within the next decade (from any given recent baseline) at least one human emerging-virus event with notable regional or global impact is expected, drawn from the bat / rodent / livestock / wildlife reservoir pool described by the spillover framework. The IDENTITY of the agent is not predictable, but the existence of further events at non-trivial baseline rate is — this is a structural prediction of the Plowright framework, not a forecast of a specific outbreak."
  falsifier = "A decade of careful global surveillance reporting zero novel-virus spillover events of any consequence into humans would falsify [@lim_spillover_baseline] as a baseline. (Reporting zero novel events is itself a falsifiable surveillance outcome — distinct from missing events.)"
  source = "[@x_plowright_2017]"

@D tp_3 := "TP-3 RNA-virus polymerase mutation-rate vs DNA-virus stability" :: prediction [ok]
  claim = "Viruses with proofreading-deficient RNA polymerases (most RNA viruses; coronaviruses are an exception with the nsp14 ExoN proofreading exoribonuclease, hence their unusually large genomes) will, under sustained drug selection, generate resistance mutations on substantially faster timescales than DNA viruses with high-fidelity polymerases. This is the mechanistic basis of [@lim_antiviral_resistance]."
  falsifier = "If sustained monotherapy clinical trials in RNA-virus infections (HIV, HCV, influenza) showed resistance-mutation accumulation rates matched by DNA-virus infections (HSV, HBV) under similar selection pressure — adjusting for population size — the polymerase-fidelity link would be falsified."
  source = "[@x_knipe_howley_fields] · [@x_hiv_treatment_sibling]"

# ─── §11 Cross-links (sister tapes — reference, do NOT shadow · f3) ───

@X x_hexa_virocapsid_sibling := "HEXA-VIROCAPSID.tape" :: sibling-tape [active]
  scope = "VIROCAPSID axis — capsid geometry (Caspar–Klug T-number, quasi-equivalence), packaging motors (phi29, terminase), HK97 maturation chainmail, AAV/lentivirus/adenovirus vector pharmacology, anti-capsid neutralizing-antibody immunity, VLP vaccines. VIROLOGY references this sibling for any capsid-specific count, force, or vector-cargo limit; does NOT duplicate (f3 sibling-tape rule)."

@X x_hiv_treatment_sibling := "HIV-TREATMENT.tape" :: sibling-tape [active]
  scope = "HIV biology + antiretroviral therapy literature index. VIROLOGY places retroviruses in the Baltimore framework and references HIV-TREATMENT for full HIV biology / ART pharmacology / cure-direction; does NOT duplicate."

@X x_vaccine_sibling := "VACCINE.tape" :: sibling-tape [active]
  scope = "Vaccine immunology + platform landscape (live-attenuated / inactivated / subunit / toxoid / conjugate / VLP / viral-vector / mRNA). VIROLOGY references VACCINE for vaccine-specific facts; does NOT duplicate."

@X x_veterinary_sibling := "VETERINARY.tape" :: sibling-tape [active]
  scope = "Veterinary medicine including animal reservoirs of zoonotic viruses, One-Health framing of spillover, livestock biosecurity, animal-disease eradication (rinderpest precedent). VIROLOGY cross-links for reservoir / spillover specifics; does NOT duplicate."

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "g1 real-limits-first · g2 lattice-is-tool · g8_in_silico_only · f1 lattice-fit-forbidden · f2 in-silico→clinical-claim-forbidden · f3 no-shadow-impl-of-sister-tape (applies between sibling axes by the same principle)."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  scope = "§0 in-silico-only scope boundary — wet-lab virology / outbreak response / clinical antiviral / vaccine licensure / public-health policy for any predicted scenario are out-of-repo and unverified."

# ─── §12 External citations (real virology literature) ───────────────

@X x_baltimore_1971 := "Baltimore D 1971" :: literature [active]
  ref = "Baltimore D. Expression of animal virus genomes. Bacteriological Reviews 1971;35:235–241. (The original Baltimore-classification paper: seven groups defined by genome → mRNA path. Foundational virology reference.)"

@X x_drosten_2003 := "Drosten C et al 2003" :: literature [active]
  ref = "Drosten C et al. Identification of a novel coronavirus in patients with severe acute respiratory syndrome. N Engl J Med 2003;348:1967–1976. (SARS-CoV-1 identification at the start of the 2002–2003 SARS outbreak.)"

@X x_zhou_2020 := "Zhou P et al 2020" :: literature [active]
  ref = "Zhou P et al. A pneumonia outbreak associated with a new coronavirus of probable bat origin. Nature 2020;579:270–273. (SARS-CoV-2 genome characterisation and ACE2 receptor identification at the start of the COVID-19 pandemic.)"

@X x_plowright_2017 := "Plowright RK et al 2017" :: literature [active]
  ref = "Plowright RK et al. Pathways to zoonotic spillover. Nature Reviews Microbiology 2017;15:502–510. (The canonical multi-stage zoonotic-spillover framework — reservoir → shedding → exposure → susceptibility → onward transmission.)"

@X x_zur_hausen_nobel_2008 := "zur Hausen H — Nobel 2008 context" :: literature [active]
  ref = "zur Hausen H. The 2008 Nobel Prize in Physiology or Medicine recognised Harald zur Hausen 'for his discovery of human papilloma viruses causing cervical cancer' (shared with Barré-Sinoussi and Montagnier for HIV). The HPV-cervical-cancer link was established by zur Hausen and colleagues from the 1970s–1980s onward; the Nobel context is cited as historical record (Nobel Prize documentation), not as a single primary paper."

@X x_who_smallpox_1980 := "WHO 1980 smallpox declaration" :: literature [active]
  ref = "World Health Assembly. Declaration of global eradication of smallpox. WHA33.3, 1980. (Formal WHO declaration following the Global Commission for the Certification of Smallpox Eradication; the only human-disease eradication by vaccination.)"

@X x_henao_restrepo_2017 := "Henao-Restrepo AM et al 2017" :: literature [active]
  ref = "Henao-Restrepo AM et al. Efficacy and effectiveness of an rVSV-vectored vaccine in preventing Ebola virus disease: final results from the Guinea ring vaccination, open-label, cluster-randomised trial (Ebola Ça Suffit!). Lancet 2017;389:505–518. (Landmark rVSV-ZEBOV Ebola ring-vaccination trial; also cited from VACCINE.tape.)"

@X x_knipe_howley_fields := "Fields Virology (textbook)" :: literature [active]
  ref = "Knipe DM, Howley PM (eds, founding co-editors Fields BN and others through earlier editions). Fields Virology. Wolters Kluwer / Lippincott, multiple editions. The 7th edition (2021) is the most recent at the time of writing; previous-edition material remains the standard reference for much of classical virology. Cited as primary-editor / era; specific edition / chapter not asserted for individual lines of text."

@X x_ictv_taxonomy := "ICTV taxonomy" :: literature [active]
  ref = "International Committee on Taxonomy of Viruses (ICTV). Master Species List and current ICTV taxonomy reports. Cited as institutional source; specific release year not asserted (ICTV updates annually). The formal phylogenetic counterpart to Baltimore's replication-strategy classification."

@X x_taubenberger_era := "Taubenberger JK et al — 1918 H1N1 reconstruction (era)" :: literature [active]
  ref = "Taubenberger JK, Reid AH, Lourens RM, Wang R, Jin G, Fanning TG and colleagues. Reconstruction and characterisation of the 1918 H1N1 influenza A virus from preserved tissue and permafrost samples, in a series of Science / Nature / PNAS papers in the early-to-mid 2000s. Primary-author / era cited; specific volumes not asserted (a multi-paper programme rather than a single landmark)."

@X x_restriction_factor_era := "host restriction-factor literature (Sheehy / Malim / Neil / Bieniasz / Sodroski / Stremlau / Hrecka / Skowronski / Laguette / Benkirane era)" :: literature [active]
  ref = "Multi-author literature establishing the major retroviral / viral restriction factors — APOBEC3G (Sheehy and Malim and colleagues, early 2000s onward), BST-2/tetherin (Neil/Bieniasz and others, late 2000s), TRIM5α (Stremlau/Sodroski and others, mid 2000s), SAMHD1 (Hrecka/Skowronski and Laguette/Benkirane and colleagues, early 2010s). Cited as a primary-author / era collective; exact volumes for individual mechanism claims are not asserted because each is a multi-paper line of work in the broader host-virus arms-race literature."

@X x_who_outbreak_sitreps := "WHO outbreak situation-report literature" :: literature [active]
  ref = "World Health Organization. Disease Outbreak News (DON) and situation-reports for SARS / MERS / Ebola / Zika / COVID-19 / mpox / avian influenza events, plus periodic Weekly Epidemiological Record entries. Cited as institutional source for outbreak chronology / case-count context; specific document IDs not asserted (WHO maintains an ongoing public archive)."

@X x_fields_virology_7th := "Fields Virology 7th ed 2021 (current edition pointer)" :: literature [active]
  ref = "Howley PM, Knipe DM, Whelan SPJ (eds). Fields Virology, 7th edition. Wolters Kluwer, 2021 (multi-volume — DNA viruses, RNA viruses, fundamentals, emerging viruses). Cited as the current edition of the standard reference at the time of writing; specific chapter / page references not asserted for individual lines of text."
