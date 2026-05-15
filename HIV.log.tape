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
# HIV.log.tape — append-only event history (v1.2 split)
# Sibling: HIV.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite := "HIV.tape rewritten from lattice-tautology stub to real-science SSOT (standalone HIV virology)" :: rewrite [ok d=2026-05-16]
  origin = "HIV.tape was a fabricated lattice-tautology stub (created in the hexa-bio mass-split, commit 153b5a2). It 'derived' HIV claims FROM n=6 lattice numbers (sigma=12 / tau=4 / phi=2 / J2=24 / sopfr=5) — '바이러스 억제 99.9% because σ·sopfr/10', '생존율 95%', '내성 2% because φ=2', '모니터 지표 12 = σ', 'σ=12 모니터 수', 'τ=4 주기 동기', 'φ=2 대칭 중복', 'sopfr=5 채널', 'J₂=24 지표', 'σ·φ=n·τ 핵심', 'EXACT 비율 93%' rows, 'σ·sopfr=60', 'μ=1' reliability rows, 'n=6 최소 완전수' axioms, and TP-1~10 lattice-tautology predictions ('억제율 최적값 = σ·sopfr/10 = 99.9%' etc.) — a direct LATTICE_POLICY g1/g2 + f1 violation. Every row_*, b_* lattice-tautology entry deleted."
  authored = "Hand-written with real HIV virology + epidemiology + AIDS-defining-illness literature. STANDALONE virology axis — distinct from HIV-TREATMENT.tape (the therapeutic axis, rewritten under commit ab4090f). Cross-link to HIV-TREATMENT for ART / cure-direction content (NOT duplicated, hexa-bio AGENTS.tape f3 no-shadow rule). Cross-link to VIROLOGY.tape for Baltimore-classification placement, life-cycle scaffold, host-virus arms race (NOT duplicated). Real content added: HIV-1 vs HIV-2 species distinction with subtype/group/CRF partitioning; SIV-reservoir origins (SIVcpz Pan troglodytes for HIV-1; SIVsmm sooty mangabey for HIV-2) with natural-host SIV tolerance reference; virion architecture (CA fullerene cone with twelve pentameric defects, gp120/gp41 Env trimer, RT p66/p51, IN, PR); genome organisation (gag/pol/env structural + tat/rev essential regulatory + nef/vif/vpr/vpu HIV-1 accessory or vpx in HIV-2); replication cycle descriptive (CD4 + CCR5/CXCR4 co-receptor entry, gp41 six-helix-bundle fusion, RT error rate, integration with LEDGF preference, latency in resting memory CD4 cells); CCR5-Δ32 host genetics (Liu et al 1996 Cell + Samson et al 1996 Nature dual landmark); pandemic origin (Worobey 2008 Nature ZR59/DRC60 anchors, Faria 2014 Science Kinshasa phylogeography epicentre, Korber 2000-era / Sharp & Hahn 2011-era origin reconstruction citations); epidemiology descriptive (UNAIDS surveillance frame, 95-95-95 targets, key-population terminology, burden distribution); AIDS-defining illnesses by pathogen (PCP/Pneumocystis jirovecii, Kaposi sarcoma/HHV-8 — Chang & Moore 1994 Science KSHV discovery, CMV retinitis, oesophageal candidiasis, disseminated MAC/MAI, cryptococcal meningitis with CrAg, HIV-TB co-infection, AIDS-associated lymphomas, PML/JCV, cerebral toxoplasmosis). 6 real-limit anchors: viral genetic-diversity HARD WALL on universal vaccine ([@lim_genetic_diversity]); CD4+ T-cell-tropism paradoxical HARD WALL ([@lim_cd4_tropism]); CCR5-Δ32 zygosity-rarity STRUCTURAL/EPIDEMIOLOGIC limit gating Berlin/London generalisation ([@lim_ccr5_delta32_rarity]); surveillance-gap STRUCTURAL/EPIDEMIOLOGIC ([@lim_surveillance_gap]); HIV-2 lower-transmissibility-but-reduced-ART-overlap STRUCTURAL ([@lim_hiv2_treatment_overlap]); in-silico→clinical epistemic HARD WALL ([@lim_in_silico_boundary]). 3 falsifiable predictions with sourced falsifiers (TP-1 quasispecies wall on single-antigen sterilising vaccine; TP-2 Berlin/London non-generalisability gate, cross-link to HIV-TREATMENT.tape tp_3 same gate; TP-3 HIV-1 group M phylogeographic-epicentre falsifiability)."
  citations = "Confident exact author-year-journal-volume-page: x_barre_sinoussi_1983 (Science 220:868–871, Institut Pasteur · Montagnier group), x_worobey_2008 (Nature 455:661–664, DRC60 + ZR59 Kinshasa anchors), x_faria_2014 (Science 346:56–61, HIV-1 group M phylogeography), x_liu_1996 (Cell 86:367–377, CCR5 co-receptor + Δ32 characterisation), x_samson_1996 (Nature 382:722–725, Δ32 mutation discovery), x_chang_moore_kshv_1994 (Science 266:1865–1869, KSHV/HHV-8 discovery). Author/era-flagged (volume/page NOT asserted): x_gallo_1984_era (NCI Science series 1984 — multi-paper attribution series, primary-author/1984 era cited), x_korber_2000_era (Los Alamos / Korber group origin-timing era including Science 2000 'Timing the ancestor of the HIV-1 pandemic strains' — primary-author/era), x_sharp_hahn_2011_era (Sharp & Hahn 2011 Cold Spring Harb Perspect Med era — primary-author/era), x_briggs_capsid_era (HIV capsid cryo-EM/cryo-ET era — Ganser 1999 / Briggs / Sundquist / Pornillos collective, primary-author/era), x_unaids_reports_era (UNAIDS Global AIDS Update / Country Progress Reports — institutional periodic reporting, specific year-on-year figures not asserted), x_cdc_case_definition_era (CDC MMWR AIDS case-definition 1993 revision + 2014 update lineage — institutional, exact MMWR volume not asserted for individual lines), x_who_clinical_staging_era (WHO HIV clinical-staging guideline literature — institutional, document IDs not asserted)."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: HIV virology has no natural n=6 invariant. HIV-1 has 4 groups (M/N/O/P), group M has ~9 named subtypes plus CRFs (an open list), the Env spike is a trimer (3), the entry machinery uses 2 receptors (CD4 + co-receptor — coincidence with φ(6)=2 is OBSERVATION ONLY, never derivation), the gp41 fusion machinery refolds into a six-helix bundle (a structural-virology fact set by class-I viral-fusion-protein biology — coincidence with n=6 is OBSERVATION ONLY, never derivation), the Baltimore group is VI (group ordinal, not a lattice constant), HIV-1 genome ~9.7 kb with 3 structural + 2 essential-regulatory + 4 accessory genes (HIV-1 nef/vif/vpr/vpu; HIV-2 nef/vif/vpr/vpx), AIDS-defining-illness catalogue is open and CDC/WHO revisable, CCR5-Δ32 allele frequency is population-genetics fact (~10% Northern European-ancestry heterozygous-or-homozygous; rare in non-European populations) not a lattice value, pandemic origin reconstructed from molecular-clock literature with substantial uncertainty intervals. This honesty IS the corrective for the audited lattice-tautology stub."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first — 6 real-limit anchors), g2 (lattice-is-tool — declined as derivation), g3 (honesty-obligation-external — Institut Pasteur / NCI / UNAIDS / WHO / CDC cited per their own institutional invariants, not lattice-fitted), g8 (in-silico-only-claim-scope — @N scope_disclaimer added: not clinical advice / diagnostic guidance / treatment regimen / prescribing / public-health policy; real HIV care requires licensed infectious-disease clinicians and accredited public-health authorities), f1 (no lattice-fit derivation), f2 (no in-silico→clinical/therapeutic/efficacy claim — virology and epidemiology paraphrased qualitatively from public peer-reviewed literature for modeling context only), f3 (no shadow-implementation of sister tapes — therapeutic content cross-linked to HIV-TREATMENT.tape rather than duplicated; general virology framing cross-linked to VIROLOGY.tape rather than duplicated). Provenance recorded in @I id001 rewritten-from key."
  honesty-caveats = "Distinction from HIV-TREATMENT.tape: HIV.tape (this file) is STANDALONE HIV virology — species/strain/SIV-origins, virion + genome, replication cycle, CCR5-Δ32 host genetics, pandemic phylogeography, epidemiology descriptive frame, AIDS-defining-illness taxonomy. HIV-TREATMENT.tape (committed ab4090f) is the THERAPEUTIC axis — drug classes, treatment landmarks (HAART/START/PrEP/U=U/MTCT), cure-direction literature, treatment-side real-limits (reservoir, resistance, adherence, immune-reconstitution, structural/social, CCR5-Δ32-donor-rarity). The CCR5-Δ32 cure cases (Berlin/London) are owned by HIV-TREATMENT.tape (cure_berlin / cure_london / lim_ccr5_donor); HIV.tape cross-references them but does not duplicate. The CCR5-Δ32 allele biology is owned here (genetics + general allele frequency); the therapeutic implication of Δ32 donor rarity is referenced both places. No fabricated numbers/citations. Allele frequencies paraphrased qualitatively (no specific population point-estimate asserted). Pandemic-origin dating paraphrased qualitatively (no specific year asserted; broad early-20th-century placement only). UNAIDS / CDC / WHO numerical figures NOT asserted (institutional reporting cited as source; year-on-year specifics live in the source documents — literature-honesty rule). HIV-2 group partitioning (A/B plus rarer groups) paraphrased per the public taxonomic literature; specific group counts beyond A/B vary slightly by author and are not asserted as a fixed integer. Per-act transmission probabilities NOT asserted (substantial co-factor dependence; lives in transmission literature). AIDS-defining-illness CD4 thresholds cited per the public CDC/WHO definitions (CD4 <200 in adults for the CDC 1993 revision) without prescribing prophylaxis or treatment specifics. No content-filter hesitation encountered — the tape stayed strictly in SSOT-paraphrasing frame throughout, descriptive of literature rather than directive."
  lint = "python3 selftest/tape_lattice_honesty_lint.py HIV.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; deriv_warnings expected to contain only @F f_lattice_fit / @N n6_honest_stance own-body lines that quote the forbidden phrasing to forbid it — no live derivation claims remain; all row_* / b_* lattice-tautology garbage deleted)."
