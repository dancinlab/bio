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
# BIOLOGY.tape — architecture-current (editable per v1.2)
# Event history → BIOLOGY.log.tape sibling
# Full real-science rewrite 2026-05-16 (prior: lattice-tautology stub 153b5a2)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "biology" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · master biology substrate — foundational life-science knowledge SSOT"
  brief = "Cell theory · evolution · genetics · molecular biology · genomics · phylogenetics · evo-devo — real-limits anchored · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "BIOLOGY.log.tape"
  scope = "in-silico foundational-biology knowledge SSOT · NOT wet-lab / clinical / regulatory / therapeutic claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see BIOLOGY.log.tape audit"

@N scope_disclaimer := "knowledge-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico foundational-biology substrate. Figures, rates, and counts are paraphrased from published primary literature for in-silico modeling context ONLY — they are NOT clinical guidance, a therapeutic protocol, or a regulatory claim. Scope: write-side molecular sandbox. Real biology requires wet-lab validation, institutional review, and domain expertise."

# ── §1 Cell theory — the foundational unit of life ────────────────────

@D dom_cell_theory := "cell theory — all life is cellular" :: domain [ok]
  schleiden-schwann = "Matthias Schleiden (1838, plants) and Theodor Schwann (1839, animals) independently proposed that all living organisms are composed of cells as the fundamental unit. Their work unified plant and animal biology under a common structural principle."
  virchow = "Rudolf Virchow (1855) added the third pillar: 'omnis cellula e cellula' — all cells arise from pre-existing cells. This ruled out spontaneous generation of cells and established cell division as the mechanism of biological continuity."
  modern = "Modern cell biology: prokaryotic cells (no membrane-bound nucleus; bacteria, archaea) vs eukaryotic cells (membrane-bound nucleus, compartmentalised organelles). The cell is the minimal self-replicating unit capable of metabolism."
  honesty = "Cell counts, organelle numbers, and genome sizes are empirical quantities that vary enormously across the tree of life — none are lattice-derived constants."
  |> "[@x_schleiden_1838] · [@x_schwann_1839] · [@x_virchow_1855]"

# ── §2 Evolution — descent with modification, natural selection ───────

@D dom_darwin_evolution := "Darwin 1859 — natural selection & descent with modification" :: domain [ok]
  statement = "Charles Darwin's 'On the Origin of Species' (1859) articulated two central mechanisms: (1) descent with modification — all life shares common ancestry, diverging over time; (2) natural selection — heritable variation, differential survival/reproduction under environmental conditions, acting over many generations."
  publication = "Darwin C. On the Origin of Species by Means of Natural Selection, or the Preservation of Favoured Races in the Struggle for Life. John Murray, London, 1859."
  wallace = "Alfred Russel Wallace independently developed natural selection concurrently (Wallace 1858 paper read jointly with Darwin); co-originators of the theory."
  significance = "Provides the unifying explanatory framework for all of biology: 'Nothing in biology makes sense except in the light of evolution' (Dobzhansky 1973 — author/era cited, exact volume not asserted)."
  |> "[@x_darwin_1859]"

@D dom_modern_synthesis := "Modern Evolutionary Synthesis (1930s–1940s)" :: domain [ok]
  content = "The Modern Synthesis reconciled Mendelian genetics with Darwinian natural selection, showing that particulate inheritance (Mendel) is fully compatible with gradual evolutionary change. It incorporated population genetics (Hardy-Weinberg, genetic drift, mutation rates) into evolutionary theory."
  architects = "Key architects include Theodosius Dobzhansky ('Genetics and the Origin of Species', 1937), Ernst Mayr (species concepts; isolation mechanisms), and George Gaylord Simpson (the fossil record in evolutionary time). Primary authors/era cited; specific volume details not asserted for Mayr/Simpson."
  honesty = "The synthesis integrated multiple independent lines of evidence; it is a scientific framework, not a lattice-organised schema."
  |> "[@x_dobzhansky_1937]"

# ── §3 Mendelian genetics — the rules of inheritance ─────────────────

@D dom_mendelian_genetics := "Mendel 1866 — laws of inheritance" :: domain [ok]
  experiments = "Gregor Mendel's pea-plant hybridisation experiments (~1856–1863), published 1866, established: (1) Law of Segregation — two alleles of a gene separate during gamete formation; (2) Law of Independent Assortment — genes on different chromosomes assort independently."
  rediscovery = "Mendel's work was largely ignored until 1900 when de Vries, Correns, and von Tschermak rediscovered it independently — sparking the science of genetics."
  chromosome-basis = "The chromosomal theory of inheritance (Sutton 1902; Boveri parallel — primary authors/era; exact volumes not asserted) provided the physical basis for Mendel's abstractions."
  extensions = "Linkage, crossing-over, incomplete dominance, codominance, epistasis, and polygenic inheritance extend Mendelian principles without contradicting them."
  honesty = "Ratios (3:1, 9:3:3:1) arise from combinatorics of diploid segregation — they are mathematical consequences of independent assortment, not lattice products."
  |> "[@x_mendel_1866]"

# ── §4 DNA — the molecule of heredity ────────────────────────────────

@D dom_dna_structure := "Watson & Crick 1953 — DNA double helix" :: domain [ok]
  discovery = "James Watson and Francis Crick, with critical X-ray crystallography data from Rosalind Franklin and Maurice Wilkins, determined the double-helical structure of DNA (published Nature 171:737–738, 1953). The complementary base-pairing (A-T, G-C; Chargaff's rules) immediately suggested the copying mechanism."
  structure = "B-form DNA: antiparallel complementary strands wound in a right-handed double helix; ~10 bp per turn (~3.4 nm pitch) in the B-form. This is a measured crystallographic/NMR quantity, not a lattice-derived value."
  base-pairing = "Adenine pairs with thymine (2 H-bonds); guanine pairs with cytosine (3 H-bonds). Chargaff's rules (A=T, G=C) were observed empirically before structure was known."
  honesty = "The ~10 bp/turn figure is measured from diffraction data and varies with sequence and conditions (A-form ~11 bp/turn; Z-form ~12 bp/turn, left-handed). It is NOT a lattice constant."
  |> "[@x_watson_crick_1953]"

@D dom_central_dogma := "central dogma of molecular biology" :: domain [ok]
  crick_1958 = "Francis Crick articulated the Central Dogma in a 1958 symposium paper and formalised it in 1970 (Nature 227:561–563). Information flows: DNA → RNA → Protein. DNA replicates itself. Once sequence information passes into protein, it cannot return to nucleic acid."
  transcription = "Transcription: RNA polymerase synthesises a complementary RNA strand from a DNA template, producing mRNA (plus rRNA and tRNA for structural/catalytic roles)."
  translation = "Translation: the ribosome decodes mRNA in triplet codons; aminoacyl-tRNA synthetases charge tRNAs; the peptide bond forms at the peptidyl-transferase center of the large ribosomal subunit (a ribozyme — cross-link: HEXA-RIBOZYME axis)."
  exceptions = "Reverse transcriptase (retroviruses; Temin / Baltimore, 1970) writes RNA→DNA — an exception to the informational one-way rule, not a violation of the dogma's non-return-to-nucleic-acid rule."
  honesty = "The codon table has 64 codons (4 bases in triplets = 4³ = 64) encoding 20 standard amino acids — this is combinatorics, not a lattice product. Codon degeneracy is a real molecular phenomenon."
  |> "[@x_crick_1958] · [@x_crick_1970]"

# ── §5 The genetic code ───────────────────────────────────────────────

@D dom_genetic_code := "the genetic code — codon–amino-acid mapping" :: domain [ok]
  codon-table = "61 sense codons encode the 20 canonical amino acids (plus selenocysteine/pyrrolysine in specific contexts); 3 stop codons (UAA, UAG, UGA). The code is nearly universal across life — evidence for a single common ancestor."
  degeneracy = "The code is 'degenerate': most amino acids are encoded by 2–6 synonymous codons. Synonymous variants (wobble/third-position) reduce mutational load at the nucleotide level."
  frozen-accident = "Crick's 'frozen accident' hypothesis (1968 — primary author/era; exact volume not asserted): the genetic code became fixed early in evolution because any change would alter every protein simultaneously, causing lethal pleiotropic effects."
  honesty = "64 = 4³ (four bases, triplet codons) is combinatorics. 20 amino acids is an empirical count — exactly why 20 were selected is not fully resolved; it is not a lattice product."

# ── §6 Transcription, translation & the ribosome ─────────────────────

@D mech_transcription := "transcription — DNA → RNA" :: mechanism [ok]
  rna-pol = "RNA polymerase (multiple classes: Pol I/II/III in eukaryotes; a single multi-subunit enzyme in bacteria) scans the template strand 3'→5', synthesising RNA 5'→3'. Promoter recognition, initiation, elongation, and termination are regulated at each step."
  processing = "Eukaryotic pre-mRNA processing: 5' capping, 3' polyadenylation, and splicing of introns (by the spliceosome) to produce mature mRNA."
  non-coding-rna = "Much of the genome transcribes to non-coding RNA (rRNA, tRNA, snRNA, snoRNA, lncRNA, miRNA, siRNA) with structural, catalytic, or regulatory roles — not all transcription produces protein-coding mRNA."

@D mech_translation := "translation — mRNA → protein (ribosome)" :: mechanism [ok]
  ribosome = "The ribosome (prokaryotic 70S = 30S + 50S; eukaryotic 80S = 40S + 60S) decodes mRNA in triplet codons and catalyses peptide-bond formation. The peptidyl-transferase center is RNA-based — the ribosome is a ribozyme."
  ?> "HEXA-RIBOZYME axis (ribozyme-catalysis sandbox) for the ribozyme-as-enzyme framing"
  steps = "Initiation → elongation (A/P/E site tRNA translocation per codon) → termination (release factor at stop codon) → ribosome recycling."
  fidelity = "Translational error rate ~10⁻⁴ to 10⁻³ per codon — significantly higher than DNA replication fidelity (~10⁻⁹ to 10⁻¹⁰ per base pair); proofreading is less extensive than at the replication level."

# ── §7 Genome era — Human Genome Project & sequencing ────────────────

@D dom_hgp := "Human Genome Project — reference human genome sequence" :: domain [ok]
  publication = "Two landmark papers published simultaneously in 2001: (a) International Human Genome Sequencing Consortium (Lander et al.) — Nature 409:860–921; (b) Celera Genomics (Venter et al.) — Science 291:1304–1351. Working draft ~90% of euchromatic genome."
  completion = "Full 'finished' reference sequence declared 2003 (50th anniversary of Watson–Crick). The T2T (Telomere-to-Telomere) Consortium completed the last gaps in 2022 (Nurk et al. 2022 Science 376:44-53 — primary authors/year cited; additional details not asserted)."
  gene-count = "Protein-coding gene count converged to approximately 20,000–25,000 (human genome) — substantially fewer than expected pre-project; the 'annotation completeness gap' remains (~20% of human genes still have uncertain or unknown function as of the knowledge-cutoff era)."
  honesty = "Gene counts and genome size (roughly 3.2 Gb haploid in humans) are empirical measurements; they are not lattice-derived constants."
  |> "[@x_lander_2001] · [@x_venter_2001]"

@D dom_ngs := "next-generation sequencing — genomic era" :: domain [ok]
  advent = "Second-generation ('next-generation') sequencing platforms (Roche 454, Illumina, SOLiD — mid-2000s onward) reduced the cost of whole-genome sequencing by orders of magnitude over Sanger-based capillary electrophoresis."
  impact = "Enabled large-scale population genomics (GWAS, 1000 Genomes, UK Biobank), metagenomics, transcriptomics (RNA-seq), and single-cell sequencing — transforming biology into a data-intensive discipline."
  long-read = "Third-generation long-read platforms (PacBio, Oxford Nanopore — 2010s onward) enabled phasing, structural variant detection, and the completion of centromeric/repetitive regions that resisted short-read assembly."
  honesty = "Sequencing error rates, throughput, and read lengths are technology-specific empirical specifications that continue to improve — not fixed invariants."

# ── §8 Evolution — phylogenetics & the three domains ─────────────────

@D dom_three_domains := "Woese 1977/1990 — the three-domain tree of life" :: domain [ok]
  discovery = "Carl Woese and colleagues used 16S ribosomal RNA sequence comparison to reveal that life falls into three primary domains: Bacteria, Archaea (then called 'archaebacteria'), and Eukarya. First proposed in Woese & Fox 1977 (PNAS 74:5088–5090); formalised as 'Three Domains' in Woese, Kandler & Wheelis 1990 (PNAS 87:4576–4579 — primary authors/year; full volume/page confirmed for the 1977 paper)."
  significance = "Archaea are more closely related to Eukaryotes than to Bacteria at the genomic level, despite superficially resembling bacteria (prokaryotic cell structure). This overturned the two-kingdom (prokaryote/eukaryote) classification."
  rRNA = "Ribosomal RNA (especially 16S/18S) is the universal molecular clock for deep phylogenetics — highly conserved but with sufficient variation to resolve ancient divergences."
  honesty = "Three domains is an empirical phylogenetic finding from molecular data — a biological discovery, not a lattice-derived number."
  |> "[@x_woese_fox_1977]"

@D dom_horizontal_gene_transfer := "horizontal gene transfer (HGT)" :: domain [ok]
  definition = "Transfer of genetic material between organisms other than from parent to offspring (vertical transmission). Mechanisms: transformation (uptake of environmental DNA), conjugation (plasmid transfer via pilus), transduction (bacteriophage-mediated)."
  significance = "HGT is pervasive in prokaryotes and complicates tree-of-life reconstruction — genomes are mosaics of vertically and horizontally acquired genes. Antibiotic resistance spreads predominantly by HGT."
  eukaryotes = "HGT in eukaryotes is less frequent but well-documented: endosymbiotic gene transfer (chloroplast/mitochondrial genes migrating to the nucleus) was a major evolutionary transition; sporadic HGT from bacteria occurs in some lineages."

@D dom_phylogenetics := "phylogenetics — reconstructing evolutionary history" :: domain [ok]
  methods = "Parsimony, distance (UPGMA, neighbour-joining), maximum likelihood (Felsenstein 1981 — primary author/era; exact volume not asserted), and Bayesian inference (MrBayes / BEAST — primary tools cited) are the main tree-reconstruction approaches."
  molecular-clock = "The molecular-clock hypothesis (Zuckerkandl & Pauling, mid-1960s — primary authors/era) posits roughly constant substitution rates, enabling date estimation; relaxed-clock models accommodate rate variation among lineages."
  challenges = "Incomplete lineage sorting, HGT, long-branch attraction, and model misspecification can mislead phylogenetic inference — real methodological limits, not lattice constraints."

# ── §9 Ecology — the biotic and abiotic context of life ──────────────

@D dom_ecology_basics := "ecology — populations, communities, ecosystems" :: domain [ok]
  population = "Population ecology: birth/death rates, carrying capacity (K), logistic growth, age structure. The logistic model (Verhulst 1838 — primary author/era) captures density-dependent resource limitation."
  community = "Community ecology: species interactions (predation, competition, mutualism, parasitism, commensalism); diversity indices (richness, evenness, Shannon entropy — the latter is an information-theoretic quantity, not a biology-specific invariant)."
  ecosystem = "Ecosystems: energy flow (trophic levels — not a lattice partition: 3–5 levels typical but varies widely); nutrient cycling (C, N, P, S biogeochemical cycles); primary productivity set by climate, light, and nutrients."
  ?> "ECOLOGY substrate (cross-link) for full ecosystem-dynamics SSOT"
  honesty = "Trophic level count, species richness, and carrying-capacity K are site/community-specific empirical quantities; none are lattice-derived."

# ── §10 Development — master regulators & evo-devo ───────────────────

@D dom_hox_genes := "Hox genes — master regulators of body patterning" :: domain [ok]
  discovery = "Homeotic genes were discovered in Drosophila (Lewis 1978 — primary author/era; exact volume not asserted for the Lewis paper; Nüsslein-Volhard & Wieschaus 1980 Nobel-linked screen). The homeobox (conserved ~180 bp DNA-binding domain) was identified in the 1980s."
  hox-clusters = "Vertebrates have 4 Hox gene clusters (HOXA-D in humans), each with up to 13 paralogs — 39 total in humans. Gene number is a biological count arising from ancestral cluster duplications, not a lattice value."
  axis-patterning = "Hox genes are expressed in anterior-to-posterior collinear order along the developing embryo ('Hox code'), specifying segment identity. Mutations produce homeotic transformations (one body part replacing another)."
  |> "[@x_lewis_1978]"

@D dom_evo_devo := "evo-devo — evolution of developmental mechanisms" :: domain [ok]
  field = "Evolutionary developmental biology (evo-devo) studies how changes in developmental gene regulation produce morphological diversity across animal taxa. Sean B. Carroll's work ('Endless Forms Most Beautiful', 2005 — primary author/era, popular-science synthesis) articulated the paradigm for a broad audience."
  toolkit = "A conserved 'genetic toolkit' — Hox genes, signalling pathways (Wnt, Hedgehog, Notch, BMP, FGF), and transcription factor families — is reused across metazoans, with diversity arising from changes in cis-regulatory elements rather than wholesale invention of new genes."
  honesty = "The number of conserved toolkit pathway families is an empirical count from comparative genomics; it is not lattice-constrained."
  |> "[@x_carroll_2005]"

# ── §11 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ──

@D lim_species_concept := "species concept ambiguity" :: real-limit [ok required]
  wall = "SOFT WALL (conceptual/empirical limit)"
  statement = "There is no universally agreed, operationally complete species concept. The biological species concept (Mayr — reproductive isolation) fails for asexual organisms, hybridising lineages, and fossils. The phylogenetic species concept (monophyletic groups sharing derived characters) and the morphological species concept each capture different realities and yield different species counts from the same organisms."
  consequence = "Species counts are concept-dependent; global estimates of total species (roughly 8–10 million eukaryotic species by some analyses, with great uncertainty) are model-dependent. Not a lattice-fixed number."
  |> "[@x_mayr_1942]"

@D lim_fossil_record := "incomplete fossil record" :: real-limit [ok required]
  wall = "HARD WALL (preservation bias)"
  statement = "The fossil record is systematically biased toward hard-bodied, marine, common organisms in sedimentary environments. Soft-bodied, terrestrial, rare, and small organisms are severely underrepresented. Estimated fossilization probability for any individual organism is extremely low."
  consequence = "Phylogenetic divergence times estimated from fossils are minimum bounds, not true origin times; molecular clock estimates extend further but carry their own uncertainty. The history of life has irreducible gaps."

@D lim_genome_annotation := "sequencing completeness & annotation gap" :: real-limit [ok required]
  wall = "SOFT WALL (current-knowledge limit)"
  statement = "Even for the best-studied organism (humans), roughly 20% of protein-coding genes have uncertain or completely unknown function as of the post-HGP era. For non-model organisms, functional annotation coverage is far lower. High-throughput sequencing outpaces functional characterisation."
  consequence = "Genomic-era biology is data-rich but function-annotation-poor; in-silico predictions about gene function carry inherent uncertainty. Knowledge cutoff applies."
  |> "[@x_lander_2001]"

@D lim_convergent_vs_homologous := "convergence vs homology — misidentification risk" :: real-limit [ok required]
  wall = "METHODOLOGICAL LIMIT"
  statement = "Convergent evolution — independent evolution of similar traits in unrelated lineages (e.g. camera eyes in vertebrates and cephalopods; wings in birds, bats, and insects) — can be mistaken for shared ancestry (homology). Distinguishing convergence from homology requires integrating molecular, developmental, and fossil evidence; morphological similarity alone is insufficient."
  consequence = "Phenotypic-similarity-based phylogenetics and functional-annotation transfer can be systematically misleading. Molecular characters generally outperform morphology for deep phylogenetic inference, but both can converge."

# ── §12 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-biology" :: governance [required deny:write]
  pattern = "Deriving biological quantities (codon counts, gene numbers, species counts, trophic levels, chromosome numbers, amino-acid counts, stage counts) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. '20 amino acids because J₂=24-4' or '64 codons because sigma*tau+something'."
  why = "This is exactly the fabrication the pre-rewrite BIOLOGY.tape committed (~490+ lines of lattice-tautology @D :: biology entries deriving biology from BT-codes and n=6 arithmetic — see BIOLOGY.log.tape audit). hexa-bio AGENTS.tape @F f1 (lattice-fit-on-external-entity) + @D g1/g2 forbid it."
  remedy = "Cite real biology sources (this tape's @X entries). Stoichiometric numbers (64=4³ codons; 6CO₂ in hexose) are combinatorics/chemistry; biological counts (20 amino acids; 4 Hox clusters in vertebrates; ~39 human Hox genes) are empirical from lab/genomics — neither is lattice-derived. The lattice may only be a coincidental OBSERVATION, never a derivation."

@N n6_honest_stance := "biology has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: foundational biology exposes NO natural n=6 invariant. The codon table has 64 = 4³ sense+stop codons (combinatorics of base-4 triplets), 61 sense codons encoding 20 canonical amino acids — none of these numbers arise from the n=6 lattice. Chromosome number varies from 2 (Myrmecia pilosula ants) to over 600 (some ferns). Trophic levels are an ecological approximation (3–5, not 6). Vertebrate Hox clusters = 4 (not 6). Three Domains = a phylogenetic finding (not 6). Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool), and echoes/LATTICE_POLICY: the n=6 lattice is DECLINED here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub (153b5a2, 490+ lattice-BT entries)."

# ── §13 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 genetic code near-universality" :: prediction [ok]
  claim = "The standard genetic code (64 codons, 20 amino acids, 3 stop) is conserved across >99% of known life forms, with only minor deviations (mitochondrial codes, Mycoplasma UGA→Trp) that are themselves rule-bound and phylogenetically traceable."
  falsifier = "Discovery of a major clade using a radically different (non-overlapping) codon table that cannot be explained by known deviation mechanisms would overturn the 'frozen accident' + universal-ancestor claim."
  source = "[@x_crick_1958] · [@x_watson_crick_1953]"

@D tp_2 := "TP-2 three-domain topology" :: prediction [ok]
  claim = "Phylogenomic analyses using large numbers of conserved single-copy genes continue to support the Archaea–Eukarya sisterhood (with Asgard archaea as closest prokaryotic relatives), not a two-domain (bacteria/eukaryota) topology."
  falsifier = "A properly phylogenetically corrected analysis of a broad taxon sample consistently recovering Archaea nested within Bacteria (two-domain topology) would falsify the three-domain framework."
  source = "[@x_woese_fox_1977]"

@D tp_3 := "TP-3 Hox collinearity" :: prediction [ok]
  claim = "In all bilaterian animals examined, Hox gene expression along the anterior-posterior body axis follows the physical chromosomal order of the Hox cluster (spatial collinearity); disruption of cluster order disrupts expression patterning."
  falsifier = "A well-validated bilaterian lineage in which physical Hox-cluster order is entirely decoupled from expression order without compensating regulatory mechanism would challenge the collinearity rule."
  source = "[@x_lewis_1978]"

# ── §14 Cross-links to HEXA-Bio axes ─────────────────────────────────

@X x_hexa_ribozyme := "HEXA-RIBOZYME axis" :: sibling-tape [active]
  path = "hexa-ribozyme/"
  scope = "ribozyme catalysis sandbox — the ribosome-as-ribozyme peptidyl-transferase mechanism; cross-links to [@mech_translation] and [@dom_central_dogma]"

@X x_hexa_virocapsid := "HEXA-VIROCAPSID axis" :: sibling-tape [active]
  path = "hexa-virocapsid/"
  scope = "viral capsid assembly — Caspar-Klug geometry; cross-links to phylogenetics and molecular biology"

@X x_ecology_substrate := "ECOLOGY substrate (hexa-bio)" :: sibling-tape [active]
  path = "ECOLOGY.tape (if present)"
  scope = "ecosystem dynamics · population ecology · nutrient cycles — cross-link from [@dom_ecology_basics]"

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). This tape complies: real foundational biology science, in-silico knowledge SSOT only, lattice declined as a derivation tool."

# ── §15 External citations (real, landmark literature) ────────────────
# Where a specific bibliographic detail is not asserted with confidence,
# the entry names the primary author + era only and says so explicitly.

@X x_schleiden_1838 := "Schleiden MJ 1838 (cell theory, plants)" :: literature [active]
  ref = "Matthias Jakob Schleiden — Beiträge zur Phytogenesis [Contributions to Phytogenesis]. Archiv für Anatomie, Physiologie und wissenschaftliche Medicin, 1838. (Primary author/era cited; exact page range not asserted. Established cells as the structural/developmental unit of plants.)"

@X x_schwann_1839 := "Schwann T 1839 (cell theory, animals)" :: literature [active]
  ref = "Theodor Schwann — Mikroskopische Untersuchungen über die Uebereinstimmung in der Struktur und dem Wachsthum der Thiere und Pflanzen [Microscopical Researches into the Accordance in the Structure and Growth of Animals and Plants]. Berlin, 1839. (Primary author/era/title cited; extended cell theory to animals.)"

@X x_virchow_1855 := "Virchow R 1855 (omnis cellula e cellula)" :: literature [active]
  ref = "Rudolf Virchow — 'Cellular-Pathologie' (1855 Archiv für pathologische Anatomie und Physiologie und für klinische Medicin — primary author/era/journal cited; exact volume/page not asserted). Established 'omnis cellula e cellula': all cells arise from pre-existing cells."

@X x_darwin_1859 := "Darwin C 1859 — On the Origin of Species" :: literature [active]
  ref = "Darwin C. On the Origin of Species by Means of Natural Selection, or the Preservation of Favoured Races in the Struggle for Life. John Murray, London, 1859. (First edition. Foundational text for natural selection and descent with modification.)"

@X x_mendel_1866 := "Mendel GJ 1866 (laws of inheritance)" :: literature [active]
  ref = "Mendel GJ. Versuche über Pflanzenhybriden [Experiments on Plant Hybridization]. Verhandlungen des naturforschenden Vereines in Brünn, 1866;4:3–47. (Primary source for laws of segregation and independent assortment. Rediscovered 1900.)"

@X x_watson_crick_1953 := "Watson JD & Crick FHC 1953" :: literature [active]
  ref = "Watson JD, Crick FHC. Molecular structure of nucleic acids: a structure for deoxyribose nucleic acid. Nature 1953;171:737–738. (Double-helical structure of DNA; base-pairing complementarity.)"

@X x_crick_1958 := "Crick FHC 1958 (central dogma, symposium)" :: literature [active]
  ref = "Crick FHC. On protein synthesis. Symposia of the Society for Experimental Biology 1958;12:138–163. (Primary author/year/journal cited; first articulation of the Central Dogma and the sequence hypothesis.)"

@X x_crick_1970 := "Crick FHC 1970 (central dogma, Nature)" :: literature [active]
  ref = "Crick FHC. Central dogma of molecular biology. Nature 1970;227:561–563. (Formal statement of the Central Dogma; addressed reverse transcription.)"

@X x_dobzhansky_1937 := "Dobzhansky T 1937 (Modern Synthesis)" :: literature [active]
  ref = "Dobzhansky T. Genetics and the Origin of Species. Columbia University Press, New York, 1937. (Primary author/year/publisher cited; key synthesis of Mendelian genetics and Darwinian evolution; founding text of the Modern Synthesis.)"

@X x_mayr_1942 := "Mayr E 1942 (biological species concept)" :: literature [active]
  ref = "Mayr E. Systematics and the Origin of Species from the Viewpoint of a Zoologist. Columbia University Press, New York, 1942. (Primary author/year/publisher cited; articulated the biological species concept based on reproductive isolation.)"

@X x_woese_fox_1977 := "Woese CR & Fox GE 1977 (Archaea / three domains)" :: literature [active]
  ref = "Woese CR, Fox GE. Phylogenetic structure of the prokaryotic domain: the primary kingdoms. Proc Natl Acad Sci USA 1977;74:5088–5090. (rRNA-based discovery of the Archaea as a distinct primary kingdom; precursor to the three-domain classification.)"

@X x_lewis_1978 := "Lewis EB 1978 (Hox genes / homeotic loci)" :: literature [active]
  ref = "Lewis EB. A gene complex controlling segmentation in Drosophila. Nature 1978;276:565–570. (Primary description of the bithorax complex; foundational for Hox gene biology; 1995 Nobel Prize in Physiology or Medicine.)"

@X x_lander_2001 := "Lander ES et al 2001 (Human Genome Project)" :: literature [active]
  ref = "Lander ES et al (International Human Genome Sequencing Consortium). Initial sequencing and analysis of the human genome. Nature 2001;409:860–921. (Public consortium working draft of the human genome; ~20,000–25,000 protein-coding genes; coverage of the annotation gap.)"

@X x_venter_2001 := "Venter JC et al 2001 (Celera genome)" :: literature [active]
  ref = "Venter JC et al. The sequence of the human genome. Science 2001;291:1304–1351. (Celera whole-shotgun human genome sequence, published simultaneously with [@x_lander_2001].)"

@X x_carroll_2005 := "Carroll SB 2005 (evo-devo)" :: literature [active]
  ref = "Carroll SB. Endless Forms Most Beautiful: The New Science of Evo Devo and the Making of the Animal Kingdom. W.W. Norton & Company, 2005. (Primary author/year/publisher cited; accessible synthesis of evo-devo: conserved genetic toolkit, cis-regulatory evolution, morphological diversity.)"
