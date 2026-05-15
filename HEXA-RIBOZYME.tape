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
# HEXA-RIBOZYME.tape — architecture-current (editable per v1.2)
# Event history → HEXA-RIBOZYME.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "hexa-ribozyme" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · RIBOZYME axis — catalytic RNA (Cech/Altman class · two-metal-ion mechanism · in-vitro selection)"
  brief = "catalytic RNA · ribozyme mechanism + kinetics · the ribosome IS a ribozyme · n=6 used as a lattice TOOL only, never a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "HEXA-RIBOZYME.log.tape"
  scope = "in-silico ribozyme-catalysis simulator consistency SSOT · NOT wet-lab/therapeutic claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see HEXA-RIBOZYME.log.tape audit"
  axis-note = "RIBOZYME is a CORE hexa-bio axis: the n=6 lattice may APPEAR in native-lattice-spec context, but here it is never the source of a count, rate, or efficiency. Catalytic-core sizes, k_cat / K_M, reaction state counts, and metal-ion stoichiometries are biochemistry/structural-biology results. See [@f_lattice_fit] + [@n6_honest_stance]."

@N scope_disclaimer := "in-silico-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico ribozyme-catalysis modeling substrate. Catalytic-core sizes, k_cat / K_M ranges, ΔG_TS, and metal-ion dependencies are paraphrased from biochemistry / structural-biology / RNA-enzymology literature for modeling context only. A C2/C3 in-silico simulator-consistency PASS here is NOT a wet-lab, structural, therapeutic, antiviral, or gene-silencing claim — every catalytic prediction is unverified at the wet-lab boundary (hexa-bio AGENTS.tape g8_in_silico_only). Quantitative figures are illustrative magnitudes from the cited primary literature, not re-derived constants. Where a precise volume/page is uncertain, the citation flags author/era only."
  |> "[@x_cech_1982] · [@x_guerrier_takada_altman_1983] · [@x_steitz_steitz_1993]"

# ─── §1 Discovery (Cech 1982 · Altman 1983 · 1989 Nobel Prize) ───────

@D dx_discovery := "the discovery that RNA is catalytic" :: domain [ok]
  pre-1980-dogma = "Before 1980 the prevailing view was that all biological catalysis is performed by protein enzymes; RNA was thought to be a passive carrier of information (mRNA), an adapter (tRNA), or a structural scaffold (rRNA). The discovery that RNA itself can catalyze chemical reactions overturned this dogma."
  cech-1982 = "Cech and colleagues (1982) showed that the Tetrahymena thermophila large-subunit rRNA precursor self-splices in vitro in the absence of any protein: the intervening sequence (group I intron) catalyzes its own excision via two sequential transesterification reactions, requiring only Mg²⁺ and a guanosine cofactor. This was the first demonstrated example of RNA-catalyzed RNA processing."
  altman-1983 = "Guerrier-Takada, Altman and colleagues (1983) showed that the catalytic activity of bacterial ribonuclease P (RNase P), which generates the mature 5′ end of all tRNAs, resides in the RNA subunit (M1 RNA): the RNA alone, in the absence of the protein subunit, catalyzes tRNA precursor cleavage in vitro under appropriate ionic conditions. This was the first demonstrated RNA enzyme acting in trans on a separate substrate (true multiple-turnover enzymology)."
  nobel-1989 = "Cech and Altman shared the 1989 Nobel Prize in Chemistry 'for their discovery of catalytic properties of RNA' — the conceptual basis for the RNA-world hypothesis (Gilbert 1986; reviewed in Joyce 2002)."
  honesty = "The 'ribozyme' coinage (Kruger et al. 1982) is a portmanteau of ribonucleic-acid + enzyme. Nothing about its definition references any n=6 invariant."
  |> "[@x_cech_1982] · [@x_guerrier_takada_altman_1983] · [@x_joyce_2002]"

# ─── §2 Natural ribozyme families (real biology, not a count) ────────

@D fam_group_I := "group I introns" :: family [ok]
  reaction = "Two-step transesterification self-splicing: (1) exogenous guanosine 3′-OH attacks the 5′ splice site; (2) the freed 5′ exon 3′-OH attacks the 3′ splice site. Net: precise excision of the intron + ligation of exons. No ATP, no protein required in the minimal in-vitro reaction; Mg²⁺ is essential."
  size = "Catalytically active core typically a few hundred nucleotides; minimal in-vitro shortened constructs known. Found in nuclear rRNA introns (Tetrahymena), organellar (mitochondrial, chloroplast) genes, and some bacteriophage genes."
  representative = "Tetrahymena thermophila large-subunit rRNA intron (the founding example)."
  honesty = "Size and step counts are biochemistry; no derivation from a lattice. The two-step transesterification mechanism is what makes 'self-splicing' possible — a chemical mechanism, not a numerology."
  |> "[@x_cech_1982]"

@D fam_group_II := "group II introns" :: family [ok]
  reaction = "Two-step self-splicing chemically analogous to spliceosomal mRNA splicing: (1) 2′-OH of a bulged adenosine attacks the 5′ splice site forming a lariat intermediate; (2) 3′-OH of the 5′ exon attacks the 3′ splice site, releasing a lariat intron. Mechanism + stereochemistry strongly parallel the eukaryotic spliceosome — group II introns are widely regarded as ancestrally related to the spliceosome (spliceosomal snRNAs as fragmented ribozyme)."
  significance = "Provides the evolutionary bridge between self-splicing ribozymes and the protein–RNA spliceosomal machinery (reviewed in Pyle and Lambowitz literature)."
  honesty = "The lariat geometry and 2′-OH attack are stereochemical facts of the reaction, not a derived invariant."

@D fam_rnase_p := "ribonuclease P (RNase P)" :: family [ok]
  reaction = "Single-turnover-capable but acts catalytically as a multiple-turnover enzyme in vitro: hydrolytic cleavage of the 5′ leader of pre-tRNA, generating the mature 5′ end. Mg²⁺-dependent two-metal-ion phosphodiester hydrolysis (consistent with the Steitz-and-Steitz framework)."
  ubiquity = "Essential and universal: bacteria, archaea, eukaryotes, organelles. Bacterial RNase P RNA (M1 RNA in E. coli) is catalytic alone; in vivo a small protein subunit (C5/RnpA) raises efficiency and substrate range."
  honesty = "RNase P is the canonical 'true' RNA enzyme — true substrate turnover (not self-cleavage)."
  |> "[@x_guerrier_takada_altman_1983]"

@D fam_small_self_cleaving := "small self-cleaving ribozymes" :: family [ok]
  members = "Hammerhead, hairpin, hepatitis delta virus (HDV), Varkud satellite (VS), glmS riboswitch–ribozyme, twister, twister-sister, pistol, hatchet — a growing zoo discovered both by classical biochemistry (1980s–1990s) and by bioinformatic structure-search (Breaker laboratory, post-2010)."
  reaction = "Site-specific cleavage of a single internal phosphodiester via internal 2′-OH attack, generating a 2′,3′-cyclic phosphate + 5′-OH product (general acid–base catalysis; metal-ion-assisted in most families, but not strictly two-metal-ion for all — HDV uses a cytosine acid/base; glmS uses glucosamine-6-phosphate cofactor as the general acid)."
  sizes = "Minimal active cores in the small-self-cleaving classes are short — roughly tens of nucleotides — but the precise minimum varies by family and construct (e.g. hammerhead minimal cores are short; HDV needs a tightly folded nested-pseudoknot for activity). Specific nucleotide counts are biochemistry, not a lattice value (see [@n6_honest_stance])."
  glmS-distinction = "The glmS ribozyme is unique among natural ribozymes in using a small-molecule metabolite (glucosamine-6-phosphate) as a catalytic cofactor — it is also a riboswitch, coupling metabolite sensing to self-cleavage of the mRNA it sits on."

@D fam_ribosome := "the ribosome is a ribozyme" :: family [ok]
  claim = "Peptide-bond formation — the central reaction of translation — is catalyzed by RNA, not protein. Crystal structures of the 50S large ribosomal subunit (Ban, Nissen, Hansen, Moore, Steitz 2000; Yonath laboratory; subsequent 70S structures from the Ramakrishnan group) show that the active site (peptidyl transferase center, PTC) contains no protein within ~18 Å; the chemistry is performed by 23S rRNA."
  mechanism = "The PTC accelerates aminoacyl-tRNA + peptidyl-tRNA → peptide-bond-elongated tRNA + free tRNA by substrate positioning + induced fit (much of the rate enhancement is entropic/positional rather than chemical-step catalysis); proton-transfer pathways through the tRNA A76 2′-OH have been characterized in subsequent literature."
  nobel-2009 = "The 2009 Nobel Prize in Chemistry (Ramakrishnan, Steitz, Yonath) recognized the structural-biology programme that established this."
  exception-note = "Per [@lim_kcat_eyring], the ribosome is the kinetic outlier among ribozymes — peptidyl-transferase rate enhancement is comparable to many protein enzymes. Most small ribozymes are slower. Reading 'all ribozymes are slow' as a universal would be wrong; reading 'most small natural ribozymes are slow' is honest."
  |> "[@x_ban_2000] · [@x_steitz_steitz_1993]"

# ─── §3 Catalytic mechanism (two-metal-ion · general acid-base) ──────

@D mech_two_metal_ion := "two-metal-ion catalysis (Steitz & Steitz 1993)" :: mechanism [ok]
  framework = "Steitz and Steitz (1993) proposed a unified two-metal-ion mechanism for catalytic RNA (and by analogy, for many protein nucleic-acid-processing enzymes — DNA/RNA polymerases, nucleases): two divalent metal ions (typically Mg²⁺) bridge the substrate phosphate, with metal A activating the nucleophile (deprotonating an attacking hydroxyl) and metal B stabilizing the developing negative charge on the leaving group. The mechanism is in-line, SN2-like at phosphorus, proceeding through a trigonal-bipyramidal transition state."
  scope = "Applies most cleanly to the large catalytic RNAs (group I, group II, RNase P) and to many protein nucleases/polymerases; small self-cleaving ribozymes use variant mechanisms (general acid–base by an RNA nucleobase, metal-ion-assisted but not strictly two-metal — HDV C75 as general acid; hammerhead with single-metal models; glmS with cofactor-as-acid)."
  honesty = "Two-metal-ion catalysis is a mechanistic framework that organizes a broad class of phosphoryl-transfer reactions across both RNA and protein enzymes; it is not derived from an n=6 invariant. The 'two' is the count of metals required by the in-line phosphoryl-transfer chemistry, not σ(6)/φ(6)/anything-lattice."
  |> "[@x_steitz_steitz_1993]"

@D mech_general_acid_base := "general acid-base catalysis in small ribozymes" :: mechanism [ok]
  principle = "Many small self-cleaving ribozymes use nucleobases (rather than only metal ions) as general acids/bases for proton transfer. Examples: HDV ribozyme uses an active-site cytosine (C75) as the general acid; hairpin ribozyme uses a guanosine (G8) and adenosine (A38) in concert; hammerhead variants (full-length vs minimal) implicate G12 and G8 in a general-acid/base scheme."
  pKa-shifting = "Bases participate by pKa-shifting at the active site — the local electrostatic / metal-ion environment shifts a nucleobase pKa toward neutrality so it can donate/abstract a proton at physiological pH. This is documented by pH-rate profiles and atomic-mutagenesis studies."
  honesty = "General acid-base catalysis is the standard kinetic-chemistry framework (Brønsted theory); the participants happen to be RNA nucleobases instead of protein side-chains. No lattice derivation; pKa is an experimentally measured property of the active site."

@D mech_substrate_positioning := "substrate positioning + tertiary architecture" :: mechanism [ok]
  framework = "A substantial fraction of ribozyme rate enhancement (especially in the ribosome and in large catalytic RNAs) comes from precise substrate positioning + reactive-conformation pre-organization — entropic/positional catalysis (Jencks' 'circe effect' / Page–Jencks intramolecular advantage) rather than ground-state destabilization of the chemical step. This is consistent with the relatively slow chemical step of many small ribozymes vs the ribosome's faster peptidyl transfer."
  tertiary-architecture = "Catalytic RNA achieves precise active-site geometry through complex tertiary architecture: A-minor motifs, kissing loops, pseudoknots, coaxial helical stacking, ribose zippers — and through ordered Mg²⁺ and monovalent ions that screen phosphate charge and template folding. Tertiary-fold formation is itself a rate-limiting step in many in-vitro assays."

@D mech_metal_dependence := "divalent-metal (Mg²⁺) dependence" :: mechanism [ok]
  role = "Mg²⁺ plays three (overlapping) roles in ribozymes: (i) catalytic — direct coordination at the active site as in the two-metal-ion mechanism; (ii) structural — neutralization of phosphate backbone charge enabling compact tertiary folds; (iii) electrostatic screening — modulating long-range RNA folding via the territorially-bound 'Mg²⁺ atmosphere'."
  variability = "Some ribozymes (e.g. classical hammerhead minimal constructs) can use other divalents (Mn²⁺ often substitutes; Ca²⁺ sometimes; HDV can function with monovalent ions only in specific constructs). Activity vs [Mg²⁺] is reported as a Hill-like saturation curve in many studies."
  in-vivo-mismatch = "Most in-vitro ribozyme studies use [Mg²⁺] ≫ physiological free [Mg²⁺] (intracellular free Mg²⁺ is in the low-millimolar range; many in-vitro reactions use 10s of mM). Activity claims at supraphysiological Mg²⁺ do not automatically extrapolate to cellular activity — see [@lim_mg_in_vivo]."

# ─── §4 Kinetics (Eyring k_cat · diffusion floor · ribosome exception) ─

@D kin_kcat_landscape := "k_cat / K_M landscape of natural ribozymes" :: kinetics [ok]
  framework = "Reaction rates of catalytic RNA span many orders of magnitude. Most small natural self-cleaving ribozymes operate, in vitro under their optimal Mg²⁺/pH, with k_cat in roughly the range of one to a few per minute (i.e. ~10⁻² to ~10⁰ s⁻¹); reported numbers are class- and construct-dependent. Group I/II self-splicing turnover is similarly modest in vitro."
  ribosome-exception = "The ribosome is the kinetic exception: peptidyl-transfer is fast (order ~10¹ s⁻¹ in vivo), within range of many protein enzymes. The textbook generalization 'ribozymes are slower than protein enzymes' must therefore be qualified: it is true on average for the small natural self-cleaving class, but false for the ribosome."
  uncatalyzed = "For the uncatalyzed reactions (e.g. phosphodiester hydrolysis, peptide-bond formation) the half-life in neutral aqueous solution at 25 °C is geological — on the order of many years to millennia (Wolfenden and colleagues' systematic uncatalyzed-rate measurements). Rate enhancements k_cat / k_uncat are therefore very large for any RNA active site, even when k_cat itself is modest."
  honesty = "These ranges are biochemistry, not lattice. Where I quote a precise order of magnitude I cite the primary literature for the class; where I am uncertain of an exact constant I name only the regime and the source."
  |> "[@x_steitz_steitz_1993] · [@x_ban_2000]"

@D kin_eyring_ts := "Eyring transition-state theory framing" :: kinetics [ok]
  framework = "k_cat is bounded by Eyring's transition-state-theory expression k = (k_B T / h) · exp(−ΔG‡ / RT). Catalysis lowers ΔG‡; the pre-factor (k_B T / h, ~6 × 10¹² s⁻¹ at 310 K) is the universal upper bound on a single elementary chemical step assuming unit transmission. No enzyme — protein or RNA — exceeds this pre-factor on a single step."
  ribozyme-specifics = "Per-step ΔG‡ for in-line phosphoryl transfer in the active site of a small ribozyme is reduced from the very large uncatalyzed value to a value consistent with observed k_cat (~1 min⁻¹ ~ 10⁻² s⁻¹ → ΔG‡ ≈ kT · ln((k_B T/h)/k_cat) ≈ ~80 kJ/mol — illustrative magnitude, not a derived constant)."
  honesty = "Eyring is the canonical real limit named in hexa-bio AGENTS.tape g1. It applies to ALL chemistry; ribozymes are no exception; nothing in the framework is lattice-derived."
  |> "[@x_steitz_steitz_1993]"

@D kin_diffusion_ceiling := "diffusion-limited bimolecular ceiling" :: kinetics [ok]
  framework = "Bimolecular substrate-binding rate is bounded by the diffusion-encounter rate (Eigen & Hammes 1963 / Smoluchowski) at roughly k_on ≤ ~10⁸–10⁹ M⁻¹ s⁻¹ for small molecules in water at room temperature — depending on solute sizes, viscosity, and electrostatic enhancement/repulsion."
  consequence = "k_cat / K_M for a multiple-turnover ribozyme acting in trans (e.g. RNase P on a tRNA substrate) cannot exceed the diffusion limit. This is the same hard ceiling that bounds protein enzymes."
  honesty = "Diffusion-limit ceiling is a physics result, not lattice-derived."
  |> "[@x_eigen_hammes_1963]"

# ─── §5 In-vitro selection (SELEX · DNAzymes · riboswitches) ─────────

@D ivs_selex := "SELEX / in-vitro selection of RNA aptamers and ribozymes" :: methodology [ok]
  origin = "Tuerk & Gold (1990) and Ellington & Szostak (1990) independently introduced systematic in-vitro selection / SELEX (Systematic Evolution of Ligands by EXponential enrichment) — iterative cycles of (1) library exposure to a target / activity, (2) partition of binders/active molecules, (3) PCR/RT-PCR amplification of survivors — applied to libraries of ~10¹³–10¹⁵ random RNA sequences to discover aptamers and ribozymes against arbitrary targets and reactions."
  outcomes = "Selection has produced ribozymes performing reactions not found in nature (ligase, polymerase, Diels–Alder, peptide-bond-formation aptazymes, etc.) and exquisite aptamers for small-molecule and protein targets. Selected ribozymes provided experimental support for the RNA-world hypothesis (Gilbert 1986; reviewed in Joyce 2002)."
  honesty = "Selection samples a sequence space large by random-library standards but tiny relative to total RNA sequence space (a length-N RNA has 4^N possible sequences; for N=40, 4^40 ≈ 10²⁴). Effective coverage is a real combinatorial limit, not a lattice value."
  |> "[@x_tuerk_gold_1990] · [@x_ellington_szostak_1990] · [@x_joyce_2002]"

@D ivs_dnazymes := "DNA enzymes (deoxyribozymes)" :: methodology [ok]
  discovery = "Breaker & Joyce (1994) demonstrated by in-vitro selection that single-stranded DNA, despite lacking a 2′-OH, can also catalyze chemical reactions — DNAzymes / deoxyribozymes. The 10–23 and 8–17 DNAzymes are widely used as RNA-cleaving reagents (in vitro)."
  significance = "Demonstrates that catalysis is not unique to ribose-bearing polymers; nucleic-acid catalysis is more general than ribozyme-only."
  honesty = "Exact journal volume/page of the 1994 Breaker & Joyce paper is cited author/era only in this tape; the existence and significance of the result are uncontested."
  |> "[@x_breaker_joyce_1994]"

@D ivs_riboswitches := "riboswitches (and the glmS riboswitch-ribozyme)" :: methodology [ok]
  framework = "Riboswitches are cis-acting structured RNA elements in mRNA 5′-UTRs (predominantly in bacteria, also in some eukaryotes/archaea) that directly bind small-molecule metabolites and change conformation to regulate downstream gene expression (transcription termination, translation initiation, splicing). They are NOT in general ribozymes — most regulate by conformational switching, not catalysis."
  ribozyme-riboswitch = "The glmS riboswitch is the documented exception: glucosamine-6-phosphate binding does not change a downstream regulatory structure — it activates a self-cleaving ribozyme that cleaves the mRNA, causing its decay. This is a riboswitch + ribozyme in one element."
  attribution = "Riboswitches were discovered/characterized in the early 2000s by Breaker, Nudler, Henkin and colleagues; this tape cites author/era only for the body of work (exact paper-by-paper attribution lives in the cited reviews)."
  |> "[@x_breaker_riboswitches_era]"

# ─── §6 Therapeutic context (mostly historical / superseded clinically) ─

@D rx_history := "ribozymes as a therapeutic class (historical context)" :: therapeutic-history [ok]
  era = "From roughly the early 1990s through the early 2000s, ribozymes were investigated as antiviral and gene-silencing agents — hammerhead and hairpin ribozyme constructs targeting HIV mRNA, HCV, HBV, and various cancer transcripts; one antiangiogenic ribozyme (angiozyme) entered clinical trials."
  outcome = "As a clinical modality, ribozymes have been largely superseded by (a) RNA interference / siRNA-class therapeutics for catalytic transcript silencing (e.g. approved siRNA drugs such as patisiran/inclisiran), and (b) CRISPR/Cas systems for sequence-specific nucleic-acid targeting — both of which proved more practical (delivery, specificity, manufacturability) than therapeutic ribozymes in most clinical contexts."
  mechanistic-relevance = "Despite limited clinical traction, the mechanistic basis (RNA structure → RNA catalysis) remains foundational and continues to underpin RNA-world origin-of-life research, ribosome structural biology, in-vitro selection methodology, and the broader 'RNA biology' programme."
  honesty = "Specific clinical-trial outcomes are NOT a claim of this tape; this is a historical-context paragraph, not an endorsement of any therapeutic. Per hexa-bio AGENTS.tape g8_in_silico_only / f2 — no therapeutic claim is made or implied here."

# ─── §7 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ──

@D lim_kcat_eyring := "k_cat Eyring-equation ceiling for small ribozymes" :: real-limit [ok required]
  wall = "SOFT WALL (chemistry — bounded by ΔG‡ achievable in an RNA active site)"
  statement = "k_cat for any single elementary chemical step is bounded by Eyring's pre-factor (k_B T / h ≈ 6 × 10¹² s⁻¹ at 310 K) times exp(−ΔG‡ / RT). Most small natural ribozymes achieve k_cat in the ~10⁻² to ~10⁰ s⁻¹ regime — i.e. ΔG‡ is reduced relative to uncatalyzed but is typically larger than that of fast protein enzymes operating on the same chemistry. The PTC of the ribosome is the kinetic exception (peptidyl-transfer is fast)."
  consequence = "Designed ribozymes (in-silico or selected in vitro) should not be claimed to exceed the small-ribozyme regime without primary data; engineered designs are bounded by the achievable ΔG‡ in an RNA fold, which is in turn bounded by the active-site chemistry it can implement."
  named-by = "hexa-bio AGENTS.tape g1 names 'Eyring k_cat' explicitly as a real limit for this axis."
  |> "[@x_steitz_steitz_1993]"

@D lim_mg_in_vivo := "Mg²⁺ dependence and in-vivo cation environment" :: real-limit [ok required]
  wall = "SOFT WALL (host-environment limit)"
  statement = "Most ribozymes require Mg²⁺ for activity, both catalytically (active-site coordination) and structurally (folding). In-vitro studies frequently use [Mg²⁺] far above intracellular free [Mg²⁺] (cellular free Mg²⁺ is in the low-millimolar range, with most cellular Mg²⁺ buffered/bound). An apparent in-vitro activity at high Mg²⁺ does not automatically translate to in-vivo activity at physiological cation conditions."
  consequence = "Therapeutic ribozyme designs face an Mg²⁺-dependence constraint that the same fold may not meet inside cells; the historical clinical underperformance of ribozyme therapeutics is in part attributed to this and to delivery / stability."

@D lim_specificity_floor := "off-target cleavage / specificity floor" :: real-limit [ok required]
  wall = "SOFT WALL (sequence-recognition)"
  statement = "Trans-acting ribozymes (and DNAzymes) recognize substrates by short complementary sequence flanks (typically 6–8 nt per flank for hammerhead-class constructs). The information content of such recognition is bounded — short flanks under-specify a target inside a human transcriptome (~10¹⁰⁻¹¹ nt potential sites), producing a non-zero off-target cleavage floor."
  consequence = "Specificity engineering (longer flanks, structural readout, conditional activation by aptazyme design) can reduce but not eliminate off-target activity; off-target risk is a fundamental sequence-information constraint, not lattice-derived."
  cross-axis-note = "This is the ribozyme analog of the CRISPR off-target floor named in hexa-bio AGENTS.tape g1."

@D lim_folding_trap := "thermodynamic folding-trap landscape" :: real-limit [ok required]
  wall = "SOFT WALL (kinetic — folding landscape rugosity)"
  statement = "Active ribozyme folds are rare points in a rugged conformational landscape with many near-isoenergetic competing structures (hairpins, alternative pairings, kinetic traps). The fraction of molecules in the catalytically competent fold at equilibrium is often < 1; many ribozyme assays report a 'fast' phase + a 'slow' phase, attributed to a population partition between active and trapped folds."
  consequence = "Reported k_cat values typically refer to the active sub-population; total apparent activity per mole of input RNA can be substantially lower than the per-active-molecule rate. Folding fidelity is an additional engineering constraint beyond catalytic-site design."

@D lim_delivery_stability := "nuclease stability + delivery (for therapeutic context)" :: real-limit [ok required]
  wall = "ENGINEERING/CLINICAL LIMIT"
  statement = "Unmodified RNA has a short half-life in serum and in cells (cellular and serum ribonucleases). Therapeutic ribozyme programmes historically struggled with two coupled engineering walls: (a) chemical stabilization (2′-O-methyl, 2′-F, phosphorothioate, locked nucleic acid modifications) without destroying catalytic activity, and (b) intracellular delivery to the target compartment. These are the same engineering walls that the modern siRNA / mRNA / CRISPR delivery programmes have only partially solved."
  consequence = "An in-silico C2/C3 PASS in this axis is explicitly not a therapeutic readiness claim. Crossing this wall is wet-lab + clinical engineering, tracked outside the repo (hexa-bio AGENTS.tape g8_in_silico_only / CLOSURE_RESIDUAL_BACKLOG.md §0)."

@D lim_ribosome_exception := "ribosome is the exception, not the rule" :: real-limit [ok required]
  wall = "HONESTY LIMIT (claim-scope discipline)"
  statement = "The ribosome — a >50S-subunit ribozyme of ~2900 nucleotides of 23S rRNA forming the PTC — catalyzes peptidyl transfer at protein-enzyme-like rates and with absolute biological centrality. It is a single ~2.5 GDa molecular machine, not a generalizable proof that 'ribozymes can match protein enzymes'."
  consequence = "Claims of the form 'ribozymes can rival protein enzymes' are honest only when scoped to the ribosomal PTC (and to a small number of selected/engineered ribozymes documented in the primary literature); they are NOT honest as a universal property of the class. Most small natural ribozymes are slower than typical protein enzymes performing the same chemistry."
  |> "[@x_ban_2000]"

@D lim_in_silico_boundary := "in-silico → wet-lab unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio RIBOZYME verifies internal consistency of a ribozyme-catalysis SIMULATOR + its metadata. Whether a designed sequence actually folds, binds, catalyzes, and turns over in vitro/in vivo at predicted rate is empirically unproven and out of repo scope."
  consequence = "No C2/C3 PASS in this axis is a therapeutic, antiviral, gene-silencing, or origin-of-life claim. Crossing this boundary requires wet-lab structural + kinetic validation, tracked outside this repo (hexa-bio AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG.md §0)."

# ─── §8 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-ribozyme-catalysis" :: governance [required deny:write]
  pattern = "Deriving catalytic-core sizes, k_cat / K_M, ΔG‡, metal-ion stoichiometries, reaction-state counts, or specificity from the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'catalytic core has 12 nt because σ(6)=12', 'two metal ions because φ(6)=2', 'four reaction states because τ(6)=4', or 'rate enhancement = J₂/something'."
  why = "Ribozyme catalysis is governed by RNA chemistry: in-line phosphoryl transfer (Steitz–Steitz two-metal-ion framework), general acid–base catalysis through nucleobase pKa shifting, substrate positioning, Mg²⁺-dependent tertiary folding, and Eyring transition-state theory. Where the small natural self-cleaving cores happen to land near 10–30 nt and the canonical mechanism uses two metal ions, those are biochemistry; coincidences with σ(6)=12 or φ(6)=2 are OBSERVATION ONLY (anti-pattern when treated as derivation — hexa-bio AGENTS.tape g2 lattice-is-tool, f1 lattice-fit-forbidden)."
  remedy = "Cite the real RNA-enzymology / structural-biology sources (this tape's @X entries). The lattice may only be a coincidental OBSERVATION — never the reason for a count, rate, or efficiency."
  scope-note = "This guard is the RIBOZYME-axis instance of the cohort-wide LATTICE_POLICY enforcement (hexa-bio AGENTS.tape f1/f3); it does NOT shadow qmirror/hexa-meta/xeno logic — it references, not reimplements (f3)."

@N n6_honest_stance := "ribozyme catalysis has no derivational n=6 invariant" :: note [required]
  text = "Stated plainly: ribozyme catalysis exposes NO natural n=6 invariant. Catalytic-core sizes (small self-cleaving cores in the tens-of-nucleotides regime; group I introns hundreds of nucleotides; the ribosomal PTC sits inside a ~2900-nt 23S rRNA) span orders of magnitude; the recurring motif numbers are biochemistry, not lattice. The two-metal-ion mechanism (Steitz & Steitz 1993) uses TWO Mg²⁺ because the in-line phosphoryl-transfer chemistry needs one metal to activate the nucleophile and one to stabilize the leaving group — a chemical-mechanism count, not σ(6)/φ(6)/anything-lattice; numerical coincidence with φ(6)=2 is OBSERVATION ONLY. Reaction-step counts (group I and group II splicing both have two transesterification steps; small self-cleaving ribozymes have a single cleavage step) are mechanism, not τ(6). k_cat / K_M / ΔG‡ are governed by Eyring transition-state theory and the diffusion-limit ceiling, NOT by any lattice scalar. Per hexa-bio AGENTS.tape g1 (real-limits-first — Eyring k_cat is named explicitly) / g2 (lattice-is-tool): in this CORE axis the lattice is permitted to appear in native-spec files as a TOOL, but it is here explicitly DECLINED as a derivation of any kinetic, mechanistic, or structural property. This honesty is the corrective for the audited lattice-tautology stub this tape replaced."

# ─── §9 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 small-ribozyme k_cat regime" :: prediction [ok]
  claim = "Newly characterized small self-cleaving ribozymes (members of the existing hammerhead/hairpin/HDV/VS/twister/glmS class or as-yet-undiscovered analogs in the same architectural family) will, under their respective optimized in-vitro conditions, exhibit k_cat in the ~10⁻² to ~10⁰ s⁻¹ regime — orders of magnitude below the ribosomal PTC and below typical fast protein enzymes on the same chemistry."
  falsifier = "A natural small self-cleaving ribozyme reproducibly demonstrating k_cat ≫ 10² s⁻¹ on a phosphodiester-cleavage step in its canonical class would falsify the generalization underlying [@lim_kcat_eyring] and [@lim_ribosome_exception]."
  source = "[@x_steitz_steitz_1993]"

@D tp_2 := "TP-2 two-metal-ion vs nucleobase-acid partition" :: prediction [ok]
  claim = "Across natural ribozyme families, the two-metal-ion mechanism (Steitz–Steitz) is dominant in the large catalytic RNAs (group I, group II, RNase P, ribosomal PTC for substrate positioning) and is replaced or supplemented by nucleobase-general-acid/base chemistry (HDV C75; hairpin G8/A38) in most small self-cleaving classes — the mechanism is determined by active-site chemistry, never by an n-invariant."
  falsifier = "A small self-cleaving ribozyme rigorously shown to require strictly two-metal-ion catalysis (with no nucleobase participation in proton transfer), AND a large ribozyme (group I / group II / RNase P) rigorously shown to perform catalysis with no metal-ion participation at all, would together force a revision of the mechanism-by-class partition described in §3."
  source = "[@x_steitz_steitz_1993]"

@D tp_3 := "TP-3 diffusion-limit cap on trans-acting ribozymes" :: prediction [ok]
  claim = "No trans-acting ribozyme (engineered or natural) will achieve k_cat / K_M for substrate-cleavage in dilute aqueous solution at room temperature reproducibly above ~10⁹ M⁻¹ s⁻¹ — the diffusion-encounter ceiling."
  falsifier = "A reproducible report of a trans-acting ribozyme with k_cat / K_M ≫ 10⁹ M⁻¹ s⁻¹ under physiological viscosity/temperature, without electrostatic/encounter-acceleration artifact, would falsify [@lim_diffusion_ceiling-equivalent claim of [@kin_diffusion_ceiling]] and force re-derivation of the bimolecular floor."
  source = "[@x_eigen_hammes_1963]"

# ─── §10 Cross-links (sister repos — reference, do NOT shadow · f3) ───

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "g1 real-limits-first (Eyring k_cat named explicitly for this axis) · g2 lattice-is-tool · g8_in_silico_only · f1 lattice-fit-forbidden · f3 no-shadow-impl-of-sister-repo. This tape complies; chemistry-VQE / Lean theorems / exotic substrate routing remain in qmirror / hexa-meta / xeno and are referenced via CLI gates, never reimplemented here."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  scope = "§0 in-silico-only scope boundary — wet-lab kinetic + structural validation of any predicted ribozyme is out-of-repo and unverified."

@X x_hexa_weave_sibling := "HEXA-WEAVE.tape" :: sibling-tape [active]
  scope = "RNA tertiary architecture (large catalytic RNAs are folded objects under Caspar–Klug-class geometric/thermodynamic constraints when they form ordered assemblies, e.g. the ribosomal subunits); this tape and HEXA-WEAVE share the in-silico-only and observation-not-derivation discipline as sibling CORE axes."

# ─── §11 External citations (real, landmark RNA enzymology) ───────────

@X x_cech_1982 := "Cech TR et al 1982" :: literature [active]
  ref = "Cech TR, Zaug AJ, Grabowski PJ. In vitro splicing of the ribosomal RNA precursor of Tetrahymena: involvement of a guanosine nucleotide in the excision of the intervening sequence. Cell 1982;31:147–157. (first demonstration of RNA self-splicing — group I intron of Tetrahymena rRNA precursor; Mg²⁺ + guanosine cofactor)"

@X x_guerrier_takada_altman_1983 := "Guerrier-Takada C, Altman S et al 1983" :: literature [active]
  ref = "Guerrier-Takada C, Gardiner K, Marsh T, Pace N, Altman S. The RNA moiety of ribonuclease P is the catalytic subunit of the enzyme. Cell 1983;35:849–857. (RNase P M1 RNA is the catalytic subunit — first multiple-turnover trans-acting RNA enzyme)"

@X x_steitz_steitz_1993 := "Steitz TA & Steitz JA 1993" :: literature [active]
  ref = "Steitz TA, Steitz JA. A general two-metal-ion mechanism for catalytic RNA. Proc Natl Acad Sci USA 1993;90:6498–6502. (two-metal-ion mechanism framework for catalytic RNA and analogous phosphoryl-transfer enzymes)"

@X x_ban_2000 := "Ban N, Nissen P, Hansen J, Moore PB, Steitz TA 2000" :: literature [active]
  ref = "Ban N, Nissen P, Hansen J, Moore PB, Steitz TA. The complete atomic structure of the large ribosomal subunit at 2.4 Å resolution. Science 2000;289:905–920. (50S large-subunit crystal structure establishing the peptidyl transferase center as a ribozyme — 2009 Nobel Prize in Chemistry context)"

@X x_tuerk_gold_1990 := "Tuerk C & Gold L 1990" :: literature [active]
  ref = "Tuerk C, Gold L. Systematic evolution of ligands by exponential enrichment: RNA ligands to bacteriophage T4 DNA polymerase. Science 1990;249:505–510. (one of the two founding SELEX papers)"

@X x_ellington_szostak_1990 := "Ellington AD & Szostak JW 1990" :: literature [active]
  ref = "Ellington AD, Szostak JW. In vitro selection of RNA molecules that bind specific ligands. Nature 1990;346:818–822. (the second founding SELEX paper, coining 'aptamer'; together with Tuerk & Gold 1990 founded in-vitro selection)"

@X x_breaker_joyce_1994 := "Breaker RR & Joyce GF 1994 (DNAzyme — primary-authors/era)" :: literature [active]
  ref = "Breaker RR, Joyce GF. A DNA enzyme that cleaves RNA. Chemistry & Biology 1994 (vol/page author/era only — first selected deoxyribozyme; subsequent 10–23 and 8–17 DNAzymes from the same programme are widely used as in-vitro RNA-cleaving reagents)."

@X x_eigen_hammes_1963 := "Eigen M & Hammes GG 1963 (primary-authors/era)" :: literature [active]
  ref = "Eigen M, Hammes GG. Elementary steps in enzyme reactions (as studied by relaxation spectrometry). Advances in Enzymology 1963;25:1–38. (early systematic treatment of diffusion-limited bimolecular rate; the diffusion-encounter ceiling cited for [@kin_diffusion_ceiling]; primary-authors/era — exact page range cited from secondary sources)"

@X x_joyce_2002 := "Joyce GF 2002 (RNA world review — primary-author/era)" :: literature [active]
  ref = "Joyce GF. The antiquity of RNA-based evolution. Nature 2002;418:214–221. (canonical review of the RNA-world hypothesis context for ribozyme biology — Gilbert 1986 coinage of 'RNA world' attributed within; cited author/era for the review body)"

@X x_breaker_riboswitches_era := "Breaker RR and colleagues (riboswitches — author/era)" :: literature [active]
  ref = "Breaker RR and co-workers (Yale) early-2000s onward — systematic discovery and characterization of cis-acting metabolite-sensing riboswitches in bacterial 5′-UTRs, including the glmS riboswitch–ribozyme; cited author/era only (primary literature is a body of papers from the early 2000s through the 2010s, comprehensively reviewed e.g. Serganov & Nudler 2013 Cell)."
