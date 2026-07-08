# CMT FREE drug-design campaign — arXiv + web research grounding (d18 lit-grounding · d_novel_only)

**Date:** 2026-06-22 · **Scope:** literature research only (no compute). Fan-out of 5 parallel research lanes (HDAC6 · SARM1 · MFN2 · ClC-1 · pipeline/novelty).
**Method:** PubMed/PMC, RCSB PDB, bioRxiv/medRxiv, journal pages, company press, clinicaltrials.gov via WebSearch/WebFetch. arXiv hosts essentially no structural-biology/med-chem for these targets, so primary sources are biomedical (noted honestly, not forced).
**Honesty:** all citations below retrieved/verified against primary sources. Fabricated names in the prompt are flagged NOT FOUND. Uncertainty called out per item.

> Campaign context: 4 small-molecule CMT candidates ABFE-screened on summer (FREE) — HDAC6 `hxq-cmt-hd6-001`, SARM1 `hxq-cmt-sar1-001`, MFN2 `hxq-cmt-mfn2-001`, ClC-1 `hxq-cmt-clc1-001`. All SMILES are scaffold PLACEHOLDERS. Two structural problems flagged: (a) ClC-1 ABFE BLOCKED (no clash-free pore pose, no membrane); (b) MFN2 pocket approximated at the GDP G-site but real modulators may bind HR1/HR2.

---

## Q1 — HDAC6: canonical catalytic-pocket inhibitor mode + CMT rationale + competitor status

**Pocket choice = CORRECT.** Targeting the catalytic Zn2+ site of HDAC6 **CD2** using **5EDU** (human CD2 + Trichostatin A `TSN` + catalytic Zn2+) at the TSN centroid is the canonical, structurally validated choice. CD2 is the catalytically dominant human domain; this is exactly where TSA, tubastatin A, ricolinostat, CKD-504 and the difluoromethyl-oxadiazole class all act.

**Binding mode.** HDAC6 = Zn-dependent class IIb deacetylase (CD1+CD2). Canonical inhibitors chelate the catalytic Zn2+ via a zinc-binding group (ZBG, classically hydroxamate, bidentate) in an ~11 A channel.
- Hai & Christianson, "Histone deacetylase 6 structure and molecular basis of catalysis and inhibition," *Nat Chem Biol* 2016;12(9):741-747 — DOI 10.1038/nchembio.2134 — PMID 27454933. (Foundational; nchembio.2158 is the News & Views, not the primary article.)
- Miyake et al., "Structural insights into HDAC6 tubulin deacetylation and its selective inhibition," *Nat Chem Biol* 2016;12(9):748-754 — DOI 10.1038/nchembio.2140.
- PDBs: **5EDU** (human CD2 + TSA + Zn2+ — campaign's structure), 5G0H/5EEK (zebrafish CD2 + TSA), 5EEF (zebrafish CD1 + TSA).
- Geometry caveat: some HDAC6-selective hydroxamates bind Zn2+ **monodentate** — Watson et al., *PNAS* 2017;114(51):13459-13464 — DOI 10.1073/pnas.1718823114. Do not hard-code bidentate geometry.

**CMT rationale.** HDAC6 = alpha-tubulin (Lys40) deacetylase; inhibition raises acetyl-alpha-tubulin and rescues axonal transport.
- **Seminal:** d'Ydewalle et al., "HDAC6 inhibitors reverse axonal loss in a mouse model of mutant HSPB1-induced CMT," *Nat Med* 2011;17(8):968-974 — DOI 10.1038/nm.2396 — PMID 21785432 (tubastatin A in HSPB1/CMT2F).
- Benoy et al., "HDAC6 is a therapeutic target in mutant GARS-induced CMT," *Brain* 2018;141(3):673-687 (CMT2D).
- Benoy et al., "Development of Improved HDAC6 Inhibitors for Axonal CMT," *Neurotherapeutics* 2017 — DOI 10.1007/s13311-016-0501-z.

**Competitor status — peripheral-restricted / non-hydroxamate HDAC6 for CMT is ALREADY IN THE CLINIC.**
- **Augustine Therapeutics AGT-100216** — "first peripherally-restricted, selective HDAC6 inhibitor," novel **non-hydroxamate, non-hydrazide** chemotype sparing HDAC6 non-catalytic functions. **First patient dosed Phase 1, 27 May 2025** (Leuven; SAD/MAD healthy volunteers). Source: GlobeNewswire 2025-05-27; augustinetx.com; CMTA. NCT not found (likely EU CTIS). Series A EUR 77.7M Mar 2025.
- CKD-504 (Chong Kun Dang) — selective HDAC6i, efficacy in C22 CMT1A — Ha et al., *Br J Pharmacol* 2020;177(22):5096-5113 — DOI 10.1111/bph.15231 (hydroxamate-class).
- Ricolinostat/ACY-1215 (Regenacy) — selective HDAC6 hydroxamate, Phase II diabetic peripheral neuropathy.

**ZBG trend.** Hydroxamate = high affinity but genotoxicity + poor selectivity, disqualifying for chronic CMT dosing. Leading non-hydroxamate ZBG = **difluoromethyl-1,3,4-oxadiazole (DFMO)**: >1e4-fold HDAC6-selective, mechanism-based/irreversible — *J Med Chem* 2023 — DOI 10.1021/acs.jmedchem.3c01345 — PMID 37782298.

**Comment on `hxq-cmt-hd6-001` (phenyl-thiosemicarbazide benzoic acid):** ZBG chemically reasonable (thiosemicarbazides are N,S Zn chelators) but **under-precedented** — no verified thiosemicarbazide-ZBG HDAC6 co-crystal found; promiscuous-chelator/PAINS-adjacent tox reputation. Treat as novel-leaning hypothesis; carry novelty-PENDING.

---

## Q2 — SARM1: correct druggable site + competitor sites + implication for our pocket

**KEY STRUCTURAL FINDING — our pocket is mis-identified.** PDB **7NAK** = cryo-EM of **activated human SARM1 (TIR:1AD)**; ligand **1QD is in the TIR-domain NADase catalytic active site, NOT the ARM allosteric NMN/NAD+ pocket.** 1QD = the 5-iodo-isoquinoline-adenine dinucleotide base-exchange adduct (C24H28IN6O13P2) of the DSRM-3716/isoquinoline class. If the intent was an ARM allosteric binder, 7NAK/1QD is the **wrong template**.

**Three druggable sites.**
- (a) **ARM allosteric NMN/NAD+ regulatory pocket** (NMN activates, NAD+ inhibits, same site): Figley et al., *Neuron* 2021;109(7):1118-1136 — DOI 10.1016/j.neuron.2021.02.009 — PMID 33657413 (PDB 7LCY apo, **7LCZ NMN-bound**, 7LD0 human octamer). Sporny et al., *eLife* 2020;9:e62021 — DOI 10.7554/eLife.62021.
- (b) **TIR-domain NADase catalytic pocket** (orthosteric; composite across two TIR protomers; catalytic E642).
- (c) **Covalent base-exchange 1AD/1QD site = the TIR active site**: Shi, Ve, Hughes, Milbrandt, DiAntonio, Kobe et al., "Structural basis of SARM1 activation, substrate recognition, and inhibition by small molecules," *Mol Cell* 2022;82(9):1643-1659 — DOI 10.1016/j.molcel.2022.03.007 — PMID 35334231 (PDB 7NAG TIR+1AD, **7NAK** TIR:1AD, 7NAL ARM+SAM+NMN).
- (d, bonus) **ARM covalent Cys311 allosteric site**: Feldman/Cravatt et al., *PNAS* 2022;119(35):e2208457119 — DOI 10.1073/pnas.2208457119 — PMID 35994671.

**Which site real inhibitors hit?**
- **Disarm/Lilly DSRM-3716** (5-iodoisoquinoline, IC50 ~75 nM) — **TIR active site via base-exchange** (parent of 1AD/1QD). Hughes et al., *Cell Reports* 2021;34(1):108588; Bosanac et al., *Brain* 2021;144(10):3226-3238. Lilly candidate LY3873862 (Ph1) — LY<->DSRM-3716 identity UNVERIFIED.
- **Sironax SIR2501** — **allosteric** (ARM, NAD-non-competitive), Ph1 done, CIPN/ALS, FDA Fast Track (press-tier).
- Asha **ASHA-624** (molecular-glue SARM1i, only CMT2A-specific SARM1 program, preclinical); Nura Bio.
- **NOT FOUND / likely fabricated:** "Nobel/Nervonyx," "Nuvonis," "Sphesumni" — no records; do not cite. "2-aminoquinazolinone clinical chemotype" — only generic patent language, unverified.

**Implication for `hxq-cmt-sar1-001` (difluoro-quinazolinone):**
1. 1QD-centroid = **TIR orthosteric site, not ARM allosteric.** If allosteric intended, re-center on **7NAL or 7LCZ (NMN/ARM)**.
2. 1QD is a covalent inter-protomer **dinucleotide** spanning two TIR chains — docking a compact drug-like molecule to its centroid gives an unreliable pose.
3. **Published liability:** subinhibitory base-exchange/orthosteric inhibitors **paradoxically ACTIVATE SARM1** and worsen neurodegeneration — Mani et al., *npj Drug Discovery* 2025;2:12 — DOI 10.1038/s44386-025-00016-3; Green et al., *ACS Med Chem Lett* 2025;16(6):1147-1154 — DOI 10.1021/acsmedchemlett.5c00189 — PMID 40529094.
4. **Recommendation:** re-target the **ARM allosteric pocket** (NMN-competitive and/or C311) — better-de-risked (SIR2501 in clinic + Cravatt PoC) and differentiated.
5. **CMT caveat:** SARM1->CMT rationale is contested (no benefit across 3 CMT mouse models — pipeline lane). SARM1 strongest for axon degeneration/CIPN broadly, weaker as a CMT-specific axis.

---

## Q3 — MFN2: G-site vs HR1/HR2 + correct pocket for CMT2A R94Q

**KEY FINDING — our pocket is wrong for a conformational agonist.** Real MFN2 agonists (Dorn/Franco/Rocha: HR1-minipeptide -> MASM7 -> drug-like analogs) **do NOT bind the GTPase nucleotide G-site. They bind HR2, mimicking HR1, acting on the HR1-HR2 conformational interface** to shift MFN2 from closed/folded (fusion-constrained) to open/extended (fusion-permissive).

**Architecture.** MFN2: G domain -> HR1 -> 2xTM -> HR2. Resting = HR1 folds onto HR2 intramolecularly (antiparallel clamp), restraining fusion. Disrupting the clamp releases fusion-competent state.
- Cao et al., "MFN1 structures reveal nucleotide-triggered dimerization," *Nature* 2017;542:372-376 — DOI 10.1038/nature21077 — PMID 28114303.
- Li et al., "Structural insights of human mitofusin-2 into mitochondrial fusion and CMT2A onset," *Nat Commun* 2019;10:4914 — DOI 10.1038/s41467-019-12912-0 — PMID 31664033. **Source of PDB 6JFK** (GDP-bound MFN2, **residues 22-400 = G domain + HD1 only; HR2 (~401-705) DELETED**).
- Yan et al., *Nat Struct Mol Biol* 2018;25:233-243 — DOI 10.1038/s41594-018-0034-8 (PDB 5YEW). Qi et al., *J Cell Biol* 2016;215(5):621-633 (PDB 5GOE).

**Agonists bind HR2/HR1-HR2 interface.**
- Franco et al., "Correcting mitochondrial fusion by manipulating mitofusin conformations," *Nature* 2016;540:74-79 — DOI 10.1038/nature20156 — PMID 27775718.
- Rocha et al., "MFN2 agonists reverse mitochondrial defects in preclinical models of CMT2A," *Science* 2018;360:336-341 — DOI 10.1126/science.aao1785 (PMC6109362). Pharmacophore from HR1 side chains **Val372/Met376/His380** (Ser378/Met381) -> contact HR2 **Asp725/Leu727**; minimal HR1 epitope ~367-384.
- "Direct Small Molecule Activation of Mitofusins," bioRxiv 2018 — DOI 10.1101/301713 (MASM7 binds recombinant HR2; MFI8 different HR2 site).
- Dorn, *Nat Commun* 2022;13:3775 — DOI 10.1038/s41467-022-31324-1.

**CMT2A R94Q.** R94 = G-domain hinge-2 (G->HD1), common severe early-onset hotspot, NOT in HR1/HR2. Rocha 2018 tested R94Q+T105M: agonists do not fix the mutant G domain; they **allosterically activate the WT allele/MFN1 via the HR1-HR2 interface**, overcoming dominant-negative suppression and bypassing the defective G domain.

**Implication for `hxq-cmt-mfn2-001` (bis-nicotinamide cyclohexyl):** 6JFK GDP G-site is the **wrong pocket** — 6JFK lacks HR2 (the actual target); agonist mechanism is allosteric at HR1/HR2, never the nucleotide pocket. Cyclohexyl/amide chemotype direction is plausible (Dorn analogs; piperine-derived activator, *J Biol Chem* 2024, PMC11493442) but must match the HR2 interface.

---

## POCKET / POSE FIX (actionable for next ABFE pass)

### ClC-1 fix — unblock the NaN-at-minimize ABFE

**Direction:** therapeutic direction is ClC-1 **INHIBITION** (partial block -> raises muscle excitability -> restores neuromuscular transmission). `hxq-cmt-clc1-001` correctly a blocker.

**Structure:** Park & MacKinnon, *eLife* 2018;7:e36629 — DOI 10.7554/eLife.36629 — PMID 29809153. PDBs **6COY** (TM domain — campaign's structure), 6COZ (CBS). **No co-crystal inhibitor — only Cl- (Sext/Scen/Sint); gating glutamate E144.** (Prompt's "6QV6" NOT confirmed as ClC-1 — use 6COY.)

**Blocker pocket (validated, intracellular-mouth, pore-buried, NOT lipid-facing):**
- Estevez et al., *Neuron* 2003;38(1):47-59 — DOI 10.1016/S0896-6273(03)00168-5 — PMID 12691663 (**Ser537** critical for 9-AC/CPP; near Cl-, intracellular-accessible).
- Altamura et al., *Br J Pharmacol* 2018;175(10):1770-1780 — DOI 10.1111/bph.14192 — PMID 29500929 (PMC5913395). **9-AC -> pocket P1** (K231, R421 salt bridges, F484/F488 pi-stack); **NFA -> P4** (R421 + F484/F488). Both block from intracellular side.

**NMD670** (NMD Pharma partial ClC-1 inhibitor): Skov/Pedersen/Riisager et al., *Sci Transl Med* 2024;16(739):eadk9109 — DOI 10.1126/scitranslmed.adk9109 — PMID 38507469. Phase 2 **SYNAPSE-CMT, NCT06482437** (CMT1+2, ~81 pts, FDA orphan). **No published binding pose/structure for NMD670** (uncertain).

**Membrane question:** for a TM channel, explicit bilayer is standard of care. Papadourakis et al., "Alchemical Free Energy Calculations on Membrane-Associated Proteins," *J Chem Theory Comput* 2023 — DOI 10.1021/acs.jctc.3c00365 (PMC11017255): lipid-facing sites collapse without lipids (R2 0.85->0.20). ClC-1 blocker site is pore-buried/solvent-exposed (lipid contribution largely cancels), so a water box *might* numerically work — **but for a TM channel use explicit POPC** for TM-fold stability + pore electrostatics. Supporting: PMC11267607; *JCTC* 2022 DOI 10.1021/acs.jctc.1c01251 (bilayer correction).

**CONCRETE RECIPE:**
1. **Build POPC bilayer first** — 6COY (TM domain; skip CBS/6COZ), keep crystallographic Cl- at Sext/Sint, CHARMM-GUI Membrane Builder (OPM/PPM orient), TIP3P + 0.15 M NaCl, CHARMM36m/CHARMM36-lipid (or Lipid21+ff19SB+GAFF2). Equilibrate apo (6-step) before alchemy.
2. **Dock a clash-free pose (do NOT hand-place)** — AutoDock Vina/smina, box on validated residues **K231, R421, S537, F484, F488** (adjacent Scen/Sint), **flexible sidechains** K231/R421/F484/F488. Sanity check: carboxylate salt-bridges R421/K231, aromatic pi-stacks F484/F488. Write `lig_CL1_bound.sdf` (ABFE deck auto-prefers `*_bound.sdf`).
3. **Relieve clashes before alchemy** (the NaN cause) — soft-core/restrained minimize (protein heavy-atom restrained, ligand free) -> short NPT with gradual restraint release; verify no atom pair < ~1.5 A.
4. **ABFE** — double-decoupling, Boresch restraints (ligand atom + anchors near K231/R421) + analytic standard-state correction, in the membrane-embedded complex.
5. **Anchor honesty (d_novel_only):** no experimental affinity for the placeholder; reproduce a known blocker (9-AC or NFA, measured IC50 + validated P1/P4) as a **method-validation anchor only**, not a claimed result.

### MFN2 fix — re-target G-site -> HR1/HR2 interface

- **Abandon the 6JFK GDP centroid.** 6JFK lacks HR2 entirely.
- **Target pocket = the HR2 surface that engages HR1.** Pharmacophore: HR1 **Val372/Met376/His380** (+Ser378/Met381) -> HR2 **Asp725/Leu727**; minimal HR1 epitope ~367-384.
- **No experimental HR2/HR1-HR2 complex structure exists** (functional alanine-scan + computational pharmacophore only — genuine uncertainty). Options: (a) AlphaFold/homology model of MFN2 HR2 (~601-705) + HR1 (~367-390), define pocket from the Dorn pharmacophore; (b) engineered Cao 2017 MFN1 construct as closest experimental coiled-coil surrogate (imperfect — MFN1, minimal HR2 fragment).
- Dock `hxq-cmt-mfn2-001` against the modeled HR2 interface, not the nucleotide pocket.

---

## NOVELTY VERDICT (d_novel_only)

### Verdict: **PARTIAL** — sharp split (per-target PUBLISHED / integration concept PARTIAL / one genuinely-open axis)

**Per-target = PUBLISHED / red-ocean (DIRECT COLLISIONS):**

| demiurge id | target+modality | DIRECT COLLISION | strength |
|---|---|---|---|
| hxq-cmt-hd6-001 | HDAC6 small molecule | Augustine AGT-100216 (Ph1); CKD-504 (preclin) | FULL — competitor in-clinic |
| hxq-cmt-clc1-001 | ClC-1 small molecule | NMD Pharma NMD670 (Ph2a SYNAPSE-CMT, NCT06482437) | FULL — competitor ahead in dedicated CMT trial |
| hxq-cmt-sar1-001 | SARM1 small molecule | Asha ASHA-624 (CMT2A preclin); Lilly LY3873862 / Sironax SIR2501 / Nura | STRONG — occupied; SARM1->CMT contested |
| hxq-cmt-mfn2-001 | MFN2 agonist SM | Mitochondria in Motion MiM111 (CMT2A preclin) | STRONG — same target/modality/subtype |
| PMP22 siRNA | PMP22 oligo lowering | DTx-1252 / Novartis (siRNA) | FULL |
| PMP22 ASO | PMP22 gapmer | Ionis (Zhao et al. JCI 2018) | FULL |
| GJB1 fold-rescue | Cx32 SM trafficking rescue | only Kleopa AAV gene replacement — no SM competitor | PARTIAL — modality-differentiated, OPEN |
| NRG1-III Fc-fusion | NRG1 biologic | academic only (Fledrich) — no company; counter-signal risk | PARTIAL — open but high-risk |
| PLGA-PEG nanocarrier | delivery | crowded (FALCON, squalene-NP, AAV) | not a discovery axis |

**Integrated multi-target orthogonal portfolio = PARTIAL (novel as program organization, NOT as discovery).** No competitor runs a coordinated multi-target/multi-subtype campaign as one program — the field is structurally single-target/single-subtype. But assembling individually-published, competitor-occupied targets is **packaging, not a falsifiable Delta** — does not satisfy d_novel_only as a discovery.

**Genuinely OPEN axes:**
- **GJB1/Cx32 small-molecule fold/trafficking rescue** (best) — only GJB1 effort is gene replacement; pharmacological-chaperone rescue of misfolded Cx32 is unoccupied. Novelty PENDING mutation-specific rescue mechanism + falsifier.
- **NRG1-III Fc-fusion** (speculative) — no commercial competitor, but published counter-signal (*Nat Commun* 2019, PMC6022927): endogenous soluble NRG1 already elevated in CMT1A.
- **CMT-SORD** reopened by govorestat INSPIRE primary-endpoint failure (NCT05397665).

**Pipeline anchors (verified):** PXT3003 (Pharnext) Ph3 FAILED (NCT04762758, sponsor liquidated); EN001 (ENCell) MSC Ph1b/2a (NCT06328712); govorestat (Applied) missed primary (NCT05397665, co. acquired); Armatus TVR110 (AAV-miR-PMP22, pre-IND 2026); Elpida ELP-02 (AAV-FIG4, IND cleared); Kleopa AAVrh10-GJB1 (preclin, Sarepta-funded).

**Reasoning (d_novel_only):** demiurge per-target small-molecule claims are red-ocean — several competitors *ahead in the clinic*. Do NOT report any single hxq-cmt-* candidate as a "discovery." To satisfy d_novel_only, pivot the *discovery* claim to an unoccupied axis (GJB1 SM fold-rescue best; or reopened CMT-SORD) with a pre-registered falsifier.

### Honest uncertainty / negatives
- arXiv yielded nothing for these biomedical targets (expected; not forced).
- NCT not confirmed: AGT-100216 (likely EU CTIS), DTx-1252, LY3873862, SIR2501, Ionis PMP22 ASO — real programs (press/papers verified) but registry IDs not in clinicaltrials.gov.
- NOT FOUND / likely fabricated (do not cite): SARM1 "Nobel/Nervonyx," "Nuvonis," "Sphesumni"; MFN2 "MitoBlue." "MASM7" is real (lineage Dorn -> Mitochondria in Motion -> MiM111). "Bratkowski 2022 Nature covalent TIR" not DOI-verified — use Shi et al. 2022 Mol Cell. PDB "6QV6" not confirmed as ClC-1 — use 6COY.
- No experimental structures for: MFN2 HR1-HR2 agonist complex, NMD670-ClC-1 pose, thiosemicarbazide-ZBG HDAC6 complex — all model-derived/unpublished.
