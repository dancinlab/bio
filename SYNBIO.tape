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
# SYNBIO.tape — architecture-current (editable per v1.2)
# Event history → SYNBIO.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "synbio" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · synthetic biology in-silico knowledge SSOT"
  brief = "Synthetic biology — engineering + biosecurity awareness · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "SYNBIO.log.tape"
  scope = "in-silico synthetic-biology knowledge SSOT · NOT operational protocols, biosecurity-circumvention content, or path-to-pathogen instruction"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see SYNBIO.log.tape audit"

@N scope_disclaimer := "synbio knowledge SSOT — scope + dual-use discipline" :: note [required]
  text = "This tape is an evidence-summary knowledge SSOT for synthetic biology as a research and engineering discipline. It summarises peer-reviewed academic / industrial work in published primary literature for modelling context only — it is NOT a laboratory protocol, NOT a synthesis or assembly how-to, NOT a regulatory/clinical claim, NOT instruction for releasing engineered organisms, and NOT guidance for circumventing biosecurity controls. Synthetic biology has well-recognised dual-use risk (Dual-Use Research of Concern / DURC, NSABB framework): the same techniques that enable beneficial industrial fermentation, vaccines, and diagnostics can in principle be applied to enhancing pathogens or evading biosecurity controls — so this tape names mechanisms and landmarks at the level of cited peer-reviewed literature only, and explicitly declines operational specifics (synthesis routes, optimised pathogen-enhancement parameters, gene-drive deployment recipes). Per hexa-bio AGENTS.tape g8 (in-silico-only) + f2 (no clinical/operational claim from in-silico) and g3 (honesty-obligation-external): governance bodies named here (BWC, Australia Group, NSABB) are external institutions cited at institutional / framework level — no operational compliance, evasion, or strategy advice is offered."

# ── §1 Foundations — biological engineering as a discipline ──────────

@D dx_definition := "what synthetic biology is" :: domain [ok]
  what = "Synthetic biology is the engineering-discipline framing of biology: applying systematic abstraction, standardisation, and design–build–test cycles to the construction of biological systems with prescribed function."
  contrast = "Distinguished from classical genetic engineering primarily by (a) explicit use of engineering abstractions (parts, devices, systems), (b) computer-aided design of genetic constructs, (c) increasing reliance on chemically synthesised DNA rather than cloned fragments, and (d) explicit attention to standardisation and reusability of components."
  honesty = "The boundary with molecular biology / metabolic engineering / genome engineering is convention, not a sharp scientific line; many results predate the term 'synthetic biology' (Endy era ≈ 2005)."
  |> "[@x_endy_2005]"

@D dx_foundations_endy := "engineering-foundations framing" :: domain [ok]
  thesis = "Endy (2005, Nature) articulated 'Foundations for engineering biology': three pillars commonly summarised as standardisation, decoupling (design from fabrication), and abstraction (parts → devices → systems hierarchy)."
  parts-devices-systems = "Standardised parts (e.g. promoters, ribosome binding sites, terminators) compose into devices (e.g. inverters, oscillators) which in turn compose into systems (e.g. metabolic pathways, sensors)."
  honesty = "These principles are framing — the actual reliability of biological composition remains substantially below the analogous electronics-engineering ideal; this gap is a recognised real limit (see [@lim_composability])."
  |> "[@x_endy_2005]"

@D dx_biobricks := "BioBricks and parts registries" :: domain [ok]
  origin = "BioBricks Foundation parts standard emerged from the Knight (2003-era) MIT effort to define a physical-assembly standard (prefix/suffix restriction sites) for interchangeable DNA parts. Era cited; this tape does not assert a specific published assembly-protocol step list."
  igem = "iGEM (International Genetically Engineered Machine) competition (founded ~2003-2004 at MIT) and the associated Registry of Standard Biological Parts operationalised the parts framework as an educational and community resource. iGEM is referenced here as an institutional development, not a technical step list."
  honesty = "BioBricks RFC10 prefix/suffix and successor standards exist; this tape names the standard at framework level — not a how-to. Standardisation in practice has been less universal than the early engineering metaphor anticipated; many laboratories now use other assembly chemistries (Golden Gate, Gibson) over BioBricks RFC10. See [@lim_composability]."
  |> "[@x_knight_era] · [@x_endy_2005]"

@D dx_synthesis_economics := "DNA synthesis economics (Carlson curve era)" :: domain [ok]
  carlson = "Carlson (era ≈ mid-2000s onward) documented that the cost of chemical DNA synthesis (per base) has declined on a long-run trajectory comparable to or faster than Moore's-Law-per-component cost reduction — an empirical 'Carlson curve' observed in commercial gene-synthesis pricing."
  consequence = "Falling synthesis cost shifted the field from 'cloning what already exists' to 'designing and ordering arbitrary sequences', enabling de-novo gene / pathway / genome construction at academic budgets."
  era-flag = "Carlson curve is cited as a long-run empirical price trajectory; specific dollar figures depend on year, vendor and oligo length and are not asserted here. Author/era reference only."
  honesty = "The cost decline applies primarily to short oligos and gene-length fragments; whole-genome synthesis remains substantially more expensive and a major capital constraint at organism scale."
  |> "[@x_carlson_era]"

# ── §2 Minimal cell and genome rewriting (peer-reviewed landmarks) ──

@D land_jcvi_syn1 := "JCVI-syn1.0 — first synthetic genome transplant" :: landmark [ok]
  what = "Gibson et al. (2010, Science 329:52–56) chemically synthesised a 1.08-Mb Mycoplasma mycoides genome in yeast, transplanted it into a recipient M. capricolum cell, and demonstrated that the synthetic genome alone could direct viable, self-replicating cells (designated JCVI-syn1.0)."
  significance = "First demonstration that a chemically synthesised genome could 'boot' a cell — published as a landmark, with explicit watermarks/identifiers in the synthesised sequence to distinguish it from natural M. mycoides."
  honesty = "Cited at the level of the published landmark; not a route map to genome assembly. Many technical steps (yeast assembly, methylation matching, recipient preparation) were specific to the M. mycoides / M. capricolum system."
  |> "[@x_gibson_2010]"

@D land_jcvi_syn3 := "JCVI-syn3.0 — minimal bacterial genome" :: landmark [ok]
  what = "Hutchison et al. (2016, Science 351:aad6253) reported JCVI-syn3.0, a designed minimal Mycoplasma genome of approximately 531 kb encoding 473 genes — the smallest known genome of any autonomously replicating cell at the time of publication."
  unknown-function = "Approximately one-third of the 473 essential genes were of unknown biological function — a candid empirical result: even the 'minimal' bacterial cell required a substantial set of genes the field could not assign to a pathway. This is the explicitly stated honesty of the original paper, not a hedge by this tape."
  significance = "Provided an empirical lower bound on bacterial gene content for autonomous life under controlled laboratory conditions; the unknown-function fraction is a quantitative measurement of how much basic prokaryotic biology remains uncharacterised."
  |> "[@x_hutchison_2016]"

@D land_sc2_yeast := "Sc2.0 — synthetic yeast chromosome programme" :: landmark [ok]
  what = "The Sc2.0 (Synthetic Yeast Genome) programme, led by Jef Boeke and an international consortium, undertook the redesign and chemical synthesis of all 16 Saccharomyces cerevisiae chromosomes — incorporating systematic edits (recoding, loxP-site insertions for inducible genome reshuffling 'SCRaMbLE')."
  era-flag = "Cited at Boeke-and-consortium / era level. Individual synthetic chromosome papers (synIII, synVI, etc.) appeared across the mid-2010s in Science / Nature Communications and related venues; this tape does not assert a single canonical citation for the multi-paper programme."
  significance = "Largest eukaryotic-genome-rewriting project to date; demonstrated chromosome-scale design + synthesis + functional substitution in a model eukaryote."
  honesty = "Cited at programme/era level; not as a how-to. Specific design rules (e.g. PCR tags, TAG → TAA stop-codon recoding for one stop) are documented in the consortium's primary literature."
  |> "[@x_sc2_era]"

@D land_lajoie_recoded := "Lajoie 2013 — genome-wide codon reassignment in E. coli" :: landmark [ok]
  what = "Lajoie et al. (2013, Science 342:357–360) reported a recoded E. coli strain in which all 321 TAG stop codons in the chromosome had been systematically replaced with TAA, freeing TAG for reassignment to non-canonical amino acids via a dedicated orthogonal aminoacyl-tRNA synthetase / tRNA pair."
  significance = "Demonstrated that the genetic code itself is a designable substrate at organism scale; opened the path to multi-virus-resistant and biocontainment-relevant recoded strains (in principle, organisms that cannot incorporate amino acids without a designated synthetic feedstock)."
  honesty = "Cited at the level of the published recoding landmark; this tape does not provide design parameters for further recoding. Recoded strains have been proposed as a biocontainment mechanism but are not, on their own, a safety guarantee."
  |> "[@x_lajoie_2013]"

# ── §3 Metabolic engineering (published applications) ────────────────

@D land_artemisinic_yeast := "artemisinic acid in yeast — proof of microbial production" :: landmark [ok]
  what = "Ro et al. (2006, Nature 440:940–943) — Keasling group — reported the engineering of S. cerevisiae for high-yield production of artemisinic acid, a precursor to the antimalarial artemisinin, via a heterologous mevalonate/terpene pathway."
  significance = "Established a canonical example of microbial-fermentation production of a high-value plant-derived pharmaceutical precursor — the metabolic-engineering 'proof' for using yeast as a chassis for terpene biosynthesis."
  honesty = "Cited at the level of the published landmark. The proof-of-concept paper is not a commercial-process specification."

@D land_artemisinin_scaleup := "artemisinin commercial scale-up — era-flagged honesty" :: landmark [ok]
  what = "Paddon and colleagues (era ≈ 2013) reported scaled production of artemisinic acid in engineered yeast under the Artemisinin Project (Sanofi / OneWorld Health / Keasling group). The commercial trajectory subsequently illustrated that 'proof in flask → industrial competitiveness vs agricultural extraction' is itself a hard step."
  honesty = "Cited at primary-author / era level: the field commonly references 'Paddon 2013 era' for the scale-up paper; this tape does not assert an exact NEJM/Nature volume. The commercial-titre / market-competitiveness story is acknowledged in the field as a cautionary example of the titre/scale-up gap (see [@lim_titre_scaleup])."
  |> "[@x_paddon_era]"

@D dx_metabolic_engineering := "metabolic engineering — discipline framing" :: domain [ok]
  what = "Metabolic engineering rewires cellular biochemistry to redirect flux toward a chosen product — by gene insertion, deletion, regulatory rewiring, and now genome-scale modelling."
  scope = "Examples in published literature include biofuels (isobutanol, farnesene), bulk chemicals (1,3-propanediol, succinate), specialty molecules (opioid precursors in yeast, cannabinoids in yeast — peer-reviewed academic landmarks), and food-protein precision fermentation."
  honesty = "Most published 'high-titre' results are laboratory-scale; the gap from grams/litre in 1-L bioreactor to commercially competitive industrial fermentation is a structural limit (see [@lim_titre_scaleup]). This tape does not provide pathway-design recipes."

# ── §4 Gene drives (peer-reviewed conceptual + experimental work) ────

@D dx_gene_drive_concept := "CRISPR-based gene drives — Esvelt 2014" :: domain [ok]
  what = "Esvelt et al. (2014, eLife 3:e03401) articulated the concept of CRISPR-based gene drives in sexually reproducing wild populations: a Cas9 + guide cassette that copies itself to the homologous chromosome upon cleavage biases inheritance well above Mendelian 50% — in principle propagating a designed allele through a population."
  significance = "Reframed earlier homing-endonuclease gene-drive proposals (Burt era) as a tractable, programmable construct, and explicitly raised governance / ecological-reversibility questions at the same time the technical proposal was made."
  honesty = "Cited at the level of the published conceptual paper. This tape does not provide drive-construct design parameters."
  |> "[@x_esvelt_2014]"

@D land_gantz_bier_drosophila := "Gantz & Bier 2015 — first lab Drosophila gene drive" :: landmark [ok]
  what = "Gantz & Bier (2015, Science 348:442–444) demonstrated a CRISPR-based 'mutagenic chain reaction' in Drosophila melanogaster: a homing construct that propagated through a laboratory fly population with near-100% transmission to offspring in controlled crosses."
  significance = "First peer-reviewed experimental demonstration of an artificial CRISPR drive's super-Mendelian transmission in a metazoan model — a proof of principle of the Esvelt-class proposal."
  honesty = "Performed under contained laboratory conditions; explicit governance/biosafety discussion accompanied the original publication. Cited as a peer-reviewed scientific landmark, not as a route map."
  |> "[@x_gantz_bier_2015]"

@D land_kyrou_anopheles := "Kyrou 2018 — caged Anopheles gambiae population suppression" :: landmark [ok]
  what = "Kyrou et al. (2018, Nat Biotechnol 36:1062–1066) reported a CRISPR-Cas9 gene drive targeting the doublesex (dsx) gene in Anopheles gambiae (malaria vector) that achieved complete suppression of caged mosquito populations within 7–11 generations under laboratory conditions."
  significance = "Demonstrated that a CRISPR gene drive can drive a caged population of a real disease vector to local extinction in the laboratory — the highest-stakes experimental proof of CRISPR-drive capability published to date in a vector mosquito."
  honesty = "Performed in physically contained insectaries with explicit ecological-risk and governance discussion. Field deployment is a separate decision involving regulatory, ecological, and community-engagement considerations beyond the scope of this knowledge SSOT."
  |> "[@x_kyrou_2018]"

@D dx_daisy_drive := "Esvelt 2017 — daisy-drive proposal for limited propagation" :: domain [ok]
  what = "Subsequent work by Esvelt and colleagues (era ≈ 2017) proposed 'daisy-drive' and related local-drive architectures intended to be self-limiting — drives whose copying competence is exhausted after a finite number of cross-generation cycles, limiting spatial and temporal spread."
  honesty = "Cited at primary-author / era level: daisy-drive is a theoretical / modelling proposal with limited large-scale experimental validation as of the field's mainstream literature. Its claimed reversibility property remains unproven at population scale (see [@lim_drive_reversibility])."
  |> "[@x_esvelt_daisy_era]"

@D dx_drive_governance := "gene-drive governance — NASEM 2016 framing" :: domain [ok]
  what = "The U.S. National Academies of Sciences, Engineering, and Medicine (NASEM, 2016) published 'Gene Drives on the Horizon', a consensus report framing research-stage, contained-laboratory, and (hypothetical) staged-field-trial governance for gene-drive technology — emphasising public engagement, ecological-risk assessment, and the irreducibility of cross-border ecological effects."
  honesty = "Cited at the level of the institutional consensus report. This tape names governance frameworks as institutional facts; it does not advise compliance/evasion strategy."
  |> "[@x_nasem_genedrive_2016]"

# ── §5 Cell-free synthetic biology & paper-based diagnostics ────────

@D dx_cellfree := "cell-free synthetic biology — discipline framing" :: domain [ok]
  what = "Cell-free protein synthesis (CFPS / TX-TL) uses extracted ribosomes, transcription/translation machinery, and energy regeneration to express engineered genetic constructs OUTSIDE intact cells."
  advantages = "No cell-membrane barrier (direct access to circuit components and to toxic products); rapid prototyping of genetic circuits in hours rather than days; potentially safer (no replicating organism)."
  era-flag = "Vincent Noireaux, Michael Jewett, Richard Murray and other groups (Sun, Tabuchi era ≈ 2013 onward) drove the modern resurgence of TX-TL cell-free synthetic biology as a prototyping platform. Cited at lab/era level."
  honesty = "Cell-free expression is energetically expensive and limited in time-window relative to live cells; not a wholesale replacement for cellular synthetic biology. This tape does not provide reaction recipes."

@D land_pardee_2014_paperdx := "Pardee 2014 — freeze-dried paper-based diagnostics" :: landmark [ok]
  what = "Pardee et al. (2014, Cell 159:940–954) reported toehold-switch-based RNA sensors deployed on freeze-dried, paper-substrate cell-free expression reactions — a portable, room-temperature-stable platform for nucleic-acid detection."
  significance = "Re-framed cell-free synthetic biology as a deployable diagnostic chassis (not just an in-laboratory prototyping tool); demonstrated programmable, paper-format detection of Ebola RNA (among other targets) under field-relevant constraints."
  honesty = "Cited at the level of the published landmark. The deployed platform addresses detection at field-laboratory level, not point-of-care under regulatory clearance."
  |> "[@x_pardee_2014]"

@D land_pardee_2016_zikacas13 := "Pardee 2016 — Zika diagnostic with toehold + Cas9/CRISPR" :: landmark [ok]
  what = "Pardee et al. (2016, Cell 165:1255–1266) extended the paper-based platform to Zika virus, combining toehold sensors with NASBA isothermal amplification and CRISPR/Cas9-based genotype discrimination — a deployable nucleic-acid diagnostic developed during the 2016 outbreak window."
  cross-link = "Adjacent CRISPR-Cas13 (SHERLOCK / DETECTR class) diagnostics built on the same conceptual line; cross-linked to hexa-bio CRISPR-CAS13-POC-DIAGNOSTIC subdomain — see [@x_crispr_tape_sibling]."
  honesty = "Cited at the level of the published paper. Translation from published prototype to globally regulated field diagnostic is a separate, much longer trajectory."
  |> "[@x_pardee_2016]"

# ── §6 Engineered probiotics / live biotherapeutics (research-stage) ─

@D dx_lbp_research := "engineered probiotics / live biotherapeutic products (LBPs)" :: domain [ok]
  what = "Engineered probiotics are commensal or food-safe microbes engineered to sense disease-associated metabolites and produce a therapeutic output (a metabolite, a secreted enzyme, an immunomodulatory molecule) in situ in the gut or other niche."
  examples = "Published academic examples include engineered E. coli Nissle 1917 strains designed to consume phenylalanine in phenylketonuria models and to produce anti-inflammatory peptides in IBD models; multiple programmes have entered early human studies (Synlogic and academic groups, era ≈ late-2010s onward)."
  honesty = "Live biotherapeutic products are a research / early-clinical area with no large-scale standard-of-care approvals as of common-knowledge field status. Containment, engraftment, horizontal gene transfer, and durability remain open biology questions. This tape does not provide engineering parameters."

# ── §7 Dual-use governance + DURC framing (institutional, not how-to) ─

@D dx_durc_framework := "Dual-Use Research of Concern (DURC) — NSABB framework" :: domain [ok deny:write]
  what = "The U.S. National Science Advisory Board for Biosecurity (NSABB) defined Dual-Use Research of Concern (DURC) as life-sciences research that, based on current understanding, can be reasonably anticipated to provide knowledge, information, products, or technologies that could be directly misapplied to pose a significant threat with broad potential consequences to public health, agriculture, the environment, or national security."
  what-it-does = "DURC frameworks place additional oversight on a defined subset of high-concern experiments (originally enumerated in U.S. policy as a list of agents and categories of 'gain-of-function' experiments) and require institutional/funder review before publication or further work."
  honesty = "This tape names the DURC framework as an institutional fact (g3 honesty-obligation-external). It does NOT offer compliance strategy, list controlled techniques, advise on how to structure a study to avoid review, or otherwise act as DURC-circumvention content."
  |> "[@x_nsabb_durc_institutional]"

@D dx_bwc := "Biological Weapons Convention (BWC) — institutional reference" :: domain [ok deny:write]
  what = "The Biological Weapons Convention (1972 BWC; entered into force 1975) is the international treaty that bans the development, production, stockpiling, and acquisition of biological and toxin weapons. As of common knowledge it has near-universal state party adoption."
  what-it-does = "The BWC establishes the global prohibition norm against biological weapons; verification regime negotiations have been historically incomplete but the norm itself is well-established and reaffirmed at Review Conferences."
  honesty = "Cited as an institutional/treaty fact. This tape does not advise on treaty compliance/evasion; it does not enumerate banned agents or activities at operational granularity."
  |> "[@x_bwc_institutional]"

@D dx_australia_group := "Australia Group — export-control regime" :: domain [ok deny:write]
  what = "The Australia Group is an informal forum of states maintaining harmonised export controls on chemicals, biological agents, dual-use manufacturing equipment, and related technologies, intended to prevent contribution to chemical and biological weapons programmes."
  honesty = "Cited as an institutional regime. This tape does not enumerate controlled agents or equipment, does not advise on licensing strategy, and does not describe how to navigate export-control regimes."
  |> "[@x_australia_group_institutional]"

@D dx_de_novo_virus_durc := "de-novo virus synthesis as a DURC case study (Tumpey 2005)" :: domain [ok deny:write]
  what = "Tumpey et al. (2005, Science 310:77–80) reported the laboratory reconstruction of the 1918 H1N1 influenza A virus from sequenced gene fragments and characterised its virulence in animal models. The work was widely cited as a foundational case study in the dual-use debate — the same techniques that enable understanding of historical pandemic pathogens can in principle be applied to recreate or enhance them."
  why-this-tape-cites-it = "Cited here at the LITERATURE level as the canonical DURC example acknowledged in the field — to be honest about the dual-use frontier rather than ignore it. This tape does NOT provide reconstruction methods, fragment sourcing, virulence-enhancement parameters, or animal-model protocols. The Tumpey paper itself underwent specific NSABB review."
  governance-tie = "The Tumpey work and subsequent gain-of-function influenza research (era ≈ 2011–2014) drove the policy refinements that produced the modern DURC framework and the U.S. moratorium era on certain gain-of-function studies."
  honesty = "Cited as a literature landmark in the DURC debate, with explicit deny:write scope: no how-to, no operational specifics, no enhancement strategy."
  |> "[@x_tumpey_2005]"

# ── §8 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_release_biosafety := "de-novo engineered-organism release biosafety" :: real-limit [ok required]
  wall = "HARD WALL (containment + ecological reversibility)"
  statement = "Once a self-replicating engineered organism is released into an open environment, recovery / recall is not generally possible: replicating biology spreads, mutates, and can establish in unanticipated niches. Engineered biocontainment strategies (auxotrophy for synthetic amino acids in recoded strains, kill-switches with multiple redundant gates) reduce but do not eliminate this risk in principle."
  consequence = "Field deployment of any self-replicating engineered organism is a one-way decision in a way that pharmaceutical small-molecule release is not. The biosafety wall is structural — a property of replicating biology, not a number derivable from the n=6 lattice."
  honesty = "This tape names the limit; it does not specify containment-gate designs at engineering granularity."

@D lim_drive_reversibility := "gene-drive ecological reversibility limits" :: real-limit [ok required]
  wall = "HARD WALL (ecological — unproven mitigation)"
  statement = "Standard self-propagating CRISPR gene drives (Esvelt 2014 conceptual class; Gantz-Bier 2015 and Kyrou 2018 experimental demonstrations) are designed to spread through a sexually reproducing wild population once seeded — in principle indefinitely. Proposed mitigations (daisy-drive / local-drive architectures, ERACR/CHACR overwriter drives) aim to make drives self-limiting or reversible but have not been demonstrated at population/ecosystem scale."
  consequence = "Ecological reversibility of a deployed self-propagating drive is, as of common knowledge of peer-reviewed work, an UNPROVEN property at the scale at which drives would be deployed. This is a real biology + ecology limit, not a lattice quantity."
  governance-tie = "This limit is the technical backbone of the NASEM 2016 governance framing (see [@dx_drive_governance])."
  |> "[@x_esvelt_2014] · [@x_kyrou_2018] · [@x_nasem_genedrive_2016]"

@D lim_essential_unknown := "essential genes of unknown function (JCVI-syn3.0)" :: real-limit [ok required]
  wall = "SCIENTIFIC HARD WALL (uncharacterised biology)"
  statement = "In JCVI-syn3.0's 473-gene minimal genome (Hutchison 2016), approximately one-third of essential genes are of unknown biological function — i.e. the bacterial cell still depends on genes whose role is not yet mapped onto a pathway. This is an empirical statement of the depth of remaining basic biology, NOT a lattice value."
  consequence = "Minimal-genome design has a hard floor set by unmapped biology: we do not yet know what the cell is doing with a substantial fraction of the genes it cannot live without. Synthetic-biology engineering of these systems is, at this floor, working with components whose function remains to be characterised."
  |> "[@x_hutchison_2016]"

@D lim_titre_scaleup := "metabolic engineering titre / scale-up gap" :: real-limit [ok required]
  wall = "ENGINEERING + ECONOMIC SOFT WALL"
  statement = "Published 'high-titre' metabolic-engineering results are typically at laboratory scale (millilitre-to-litre bioreactor, batch); industrial fermentation requires titre, productivity (g/L/h) and yield (g product per g substrate) jointly above thresholds set by feedstock + downstream-processing economics. The gap from proof-of-concept titre to commercial competitiveness is itself a multi-year engineering project, frequently terminal."
  illustration = "The artemisinin commercial trajectory (Paddon 2013 era — see [@land_artemisinin_scaleup]) is a recognised cautionary example: scientific success, mixed industrial outcome relative to the agricultural baseline."
  consequence = "Engineered-pathway titre numbers in the academic literature are not, on their own, evidence of commercial viability. Cited as a real systems-engineering limit; no lattice derivation."
  |> "[@x_paddon_era]"

@D lim_composability := "biological composability gap (engineering metaphor vs reality)" :: real-limit [ok required]
  wall = "BIOLOGICAL SOFT WALL"
  statement = "Standardised parts (BioBricks, Anderson promoter series, etc.) do not compose with the modularity of electronic components: host-context effects (resource competition for ribosomes/RNA polymerase, retroactivity, growth-rate coupling, evolutionary instability of high-burden constructs) systematically degrade composability."
  consequence = "Predictable design + build of biological systems remains substantially below the engineering metaphor that motivated the field (Endy 2005). The Foundations agenda is a target, not a delivered platform. This is biology, not lattice."
  |> "[@x_endy_2005]"

@D lim_dual_use_governance := "dual-use biosecurity governance limit (no operational specifics)" :: real-limit [ok required deny:write]
  wall = "GOVERNANCE / NORMATIVE WALL (institutional + ethical)"
  statement = "A subset of synthetic-biology technique knowledge is dual-use: the same methods that enable beneficial industrial / medical / diagnostic outcomes can in principle be misapplied to enhance pathogen virulence, transmissibility, host range, or to circumvent existing countermeasures. International norms (BWC), export controls (Australia Group), and institutional oversight (NSABB DURC framework) collectively constrain this space."
  consequence = "Even where a technique is technically tractable, the responsible-research norm constrains what can be published, how, and where it can be done. This tape consequently declines, by design, to provide operational specifics for any pathogen-enhancement-relevant technique — naming literature landmarks at the level the published peer-reviewed paper itself sits."
  honesty = "This is a governance/ethical wall, not a lattice value. It is treated here as a real limit of equal weight to the biological and engineering walls."
  |> "[@x_nsabb_durc_institutional] · [@x_bwc_institutional] · [@x_australia_group_institutional]"

# ── §9 n=6 lattice stance (HONEST — observation, not derivation) ──────

@F f_lattice_fit := "lattice-fit-on-synbio" :: governance [required deny:write]
  pattern = "Deriving synthetic-biology facts (BioBrick part counts, BioBrick RFC numbers, restriction-enzyme recognition lengths, codon counts, amino-acid counts, Cas family counts, minimal-genome gene counts, metabolic-pathway step counts, gene-drive transmission ratios, DBTL stage counts) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's 'BioBrick 표준 RFC = σ-φ', 'restriction-enzyme recognition = τ~(σ-τ) bp', 'amino acids 20 = J₂-τ', 'codons 64 = 2^n', 'Cas {9,12,13,14} = sopfr-ladder', 'glucose atoms = J₂', 'DBTL 4 stages = τ'."
  why = "This is exactly the violation the pre-rewrite SYNBIO.tape committed (lattice-tautology stub, hexa-bio mass-split 153b5a2 — see SYNBIO.log.tape audit). hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3 forbid it. Synthetic biology is external empirical reality (iGEM, JCVI, Keasling / Kyrou / Esvelt labs, NSABB, BWC, Australia Group) — g3 honesty-obligation-external applies. The genetic code's structure (64 codons, 20 amino acids, etc.) is a biological constant of natural origin, NOT a derivation from σ/τ/φ/J₂. Coincidence with lattice tokens is OBSERVATION ONLY."
  remedy = "Cite real primary literature (this tape's @X entries). The lattice may be a coincidental OBSERVATION only — NEVER a derivation source for any synbio quantity. Stage counts (DBTL = 4), part-class counts (BioBrick families), and codon/amino-acid numbers come from biochemistry and community convention, not from n=6."

@N n6_honest_stance := "synbio has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: synthetic biology exposes NO natural n=6 invariant. The genetic code (64 codons, 20 standard amino acids, 3 stop codons) is a property of natural biochemistry — fixed by molecular evolution, not derivable from σ/τ/φ/J₂. BioBrick RFC10's restriction-site count, iGEM part-class counts, Cas type counts (I–VI, an evolving microbial classification — see CRISPR-GENE-EDITING.tape), DBTL stages (Design-Build-Test-Learn = 4 by convention, a workflow choice), JCVI-syn3.0's 473 essential genes (an empirical count, with ~⅓ of unknown function), and gene-drive transmission ratios (>50% biased by homing — biology) are all measured / observed / chosen, not lattice-derived. Any numeric coincidence with σ=12, τ=4, φ=2, J₂=24 is OBSERVATION ONLY, never derivation. Per LATTICE_POLICY g1/g2 + lattice-as-tool (격자는 도구이지 제약이 아니다): the n=6 lattice is declined here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ── §10 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 minimal-genome unknown-function fraction does not approach zero quickly" :: prediction [ok]
  claim = "Even with continued functional-genomics effort (Tn-seq, CRISPRi screens, structural-prediction-guided annotation), the fraction of essential genes in a JCVI-syn3.0-class minimal Mycoplasma genome whose biological function is known to pathway / molecular-mechanism resolution remains substantially short of 100% across the early-2020s decade following Hutchison 2016."
  falsifier = "If a follow-up publication credibly annotates ≥95% of JCVI-syn3.0's essential genes to specific pathways with experimental support, [@lim_essential_unknown] is wrong (or at least quantitatively outdated)."
  source = "[@x_hutchison_2016]"

@D tp_2 := "TP-2 self-propagating gene drives reach near-full transmission in laboratory caged settings" :: prediction [ok]
  claim = "Any properly constructed CRISPR-based homing drive against a non-essential or female-fertility locus in a sexually reproducing model organism with adequate homology-directed repair (Drosophila, Anopheles, Saccharomyces in mating cycles) achieves super-Mendelian transmission well above the 50% baseline under contained laboratory crosses — consistent with Gantz & Bier 2015 and Kyrou 2018."
  falsifier = "If, under matched contained conditions and adequate sample size, a properly constructed homing drive shows Mendelian (≈50%) transmission, the core CRISPR-drive mechanism is undermined."
  source = "[@x_gantz_bier_2015] · [@x_kyrou_2018]"
  honesty = "Falsifier explicitly restricted to contained laboratory settings; field-deployment predictions are out of scope (see [@lim_drive_reversibility])."

@D tp_3 := "TP-3 cell-free / paper diagnostic platforms generalise beyond toehold + RNA targets" :: prediction [ok]
  claim = "The freeze-dried cell-free + nucleic-acid-sensor platform demonstrated by Pardee 2014/2016 generalises across additional nucleic-acid pathogen targets and additional sensor chemistries (toehold + isothermal amplification, CRISPR/Cas13 cleavage reporters) in peer-reviewed follow-ups during the 2017–2022 window."
  falsifier = "If subsequent follow-ups consistently fail to demonstrate freeze-dried cell-free platforms beyond the Ebola/Zika targets and toehold class with adequate analytical sensitivity, the platform-generality claim is undermined."
  source = "[@x_pardee_2014] · [@x_pardee_2016]"

# ── §11 Cross-links to sibling hexa-bio tapes ─────────────────────────

@X x_crispr_tape_sibling := "CRISPR-GENE-EDITING.tape" :: sibling-tape [active]
  scope = "Companion hexa-bio root tape. Programmable CRISPR-Cas mechanisms (Cas9/12/13, base/prime editing, off-target floor, germline-editing ethical hard wall). Synbio gene-drive entries here build on those mechanisms but treat them at the population-engineering / dual-use level rather than at the single-edit biochemistry level."

@X x_biopharma_tape_sibling := "BIO-PHARMA.tape" :: sibling-tape [active]
  scope = "Companion hexa-bio root tape. Drug-development pipeline biology + R&D economics + regulatory pathway. Synbio's commercial-titre / scale-up limit ([@lim_titre_scaleup]) and the engineered-LBP research-stage status connect to that tape's modality and regulatory landscape."

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) + g2 (lattice-is-tool) + g3 (honesty-obligation-external) + g8 (in-silico-only-claim-scope) + f1/f2/f3 governance authority cited throughout."

# ── §12 External citations (real, landmark literature + institutions) ─

@X x_endy_2005 := "Endy D 2005" :: literature [active]
  ref = "Endy D. Foundations for engineering biology. Nature 2005;438:449–453. (parts–devices–systems abstraction; standardisation, decoupling, abstraction principles)"

@X x_knight_era := "Knight TF — BioBricks era" :: literature [active]
  ref = "Knight TF and colleagues, MIT (era ≈ 2003). 'Idempotent vector design for standard assembly of BioBricks' and follow-on BioBricks Foundation technical reports introduced the BioBricks physical-assembly standard (RFC10 prefix/suffix restriction sites). Cited at primary-author / era level; this tape does not assert a single canonical journal citation for the framework, which propagated through MIT technical reports, BioBricks Foundation documents, and the iGEM Registry."

@X x_carlson_era := "Carlson R — Carlson curve era" :: literature [active]
  ref = "Carlson R. Various publications and biotechnology-industry analyses (era ≈ mid-2000s onward), including the long-running 'Carlson curve' tracking commercial gene-synthesis cost per base over time. The empirical price-decline trajectory is widely cited at primary-author level; this tape does not assert a single canonical journal citation."

@X x_gibson_2010 := "Gibson DG et al 2010" :: literature [active]
  ref = "Gibson DG, Glass JI, Lartigue C, Noskov VN, Chuang R-Y, Algire MA, Benders GA, Montague MG, Ma L, Moodie MM, Merryman C, Vashee S, Krishnakumar R, Assad-Garcia N, Andrews-Pfannkoch C, Denisova EA, Young L, Qi Z-Q, Segall-Shapiro TH, Calvey CH, Parmar PP, Hutchison CA III, Smith HO, Venter JC. Creation of a bacterial cell controlled by a chemically synthesized genome. Science 2010;329:52–56. (JCVI-syn1.0 — first synthetic-genome cell)"

@X x_hutchison_2016 := "Hutchison CA III et al 2016" :: literature [active]
  ref = "Hutchison CA III, Chuang R-Y, Noskov VN, Assad-Garcia N, Deerinck TJ, Ellisman MH, Gill J, Kannan K, Karas BJ, Ma L, Pelletier JF, Qi Z-Q, Richter RA, Strychalski EA, Sun L, Suzuki Y, Tsvetanova B, Wise KS, Smith HO, Glass JI, Merryman C, Gibson DG, Venter JC. Design and synthesis of a minimal bacterial genome. Science 2016;351:aad6253. (JCVI-syn3.0 — 473 genes; ~⅓ essential of unknown function honestly noted in the paper)"

@X x_sc2_era := "Boeke JD and Sc2.0 consortium — synthetic yeast chromosome era" :: literature [active]
  ref = "Boeke JD and the Synthetic Yeast Genome Project (Sc2.0) consortium. Multi-paper programme (era ≈ mid-2010s onward) reporting designed synthetic chromosomes of Saccharomyces cerevisiae (synIII, synV, synVI, synX, synXII, etc.) and the SCRaMbLE inducible-rearrangement system. Cited at programme/era level; this tape does not assert a single canonical citation for the multi-paper effort."

@X x_lajoie_2013 := "Lajoie MJ et al 2013" :: literature [active]
  ref = "Lajoie MJ, Rovner AJ, Goodman DB, Aerni H-R, Haimovich AD, Kuznetsov G, Mercer JA, Wang HH, Carr PA, Mosberg JA, Rohland N, Schultz PG, Jacobson JM, Rinehart J, Church GM, Isaacs FJ. Genomically recoded organisms expand biological functions. Science 2013;342:357–360. (321 TAG → TAA codon reassignment in E. coli; orthogonal non-canonical amino acid incorporation)"

@X x_ro_2006 := "Ro D-K et al 2006" :: literature [active]
  ref = "Ro D-K, Paradise EM, Ouellet M, Fisher KJ, Newman KL, Ndungu JM, Ho KA, Eachus RA, Ham TS, Kirby J, Chang MCY, Withers ST, Shiba Y, Sarpong R, Keasling JD. Production of the antimalarial drug precursor artemisinic acid in engineered yeast. Nature 2006;440:940–943. (yeast metabolic-engineering landmark — Keasling group)"

@X x_paddon_era := "Paddon CJ and Artemisinin Project — scale-up era" :: literature [active]
  ref = "Paddon CJ and colleagues; Artemisinin Project (Sanofi / OneWorld Health / Keasling group). Era ≈ 2013 — scaled microbial production of artemisinic acid from engineered yeast, widely cited in the synbio industrial-translation literature. The commercial-trajectory caveat is a field-recognised cautionary example. Cited at primary-author / era level; specific Nature 2013 (Paddon et al.) volume not asserted."

@X x_esvelt_2014 := "Esvelt KM et al 2014" :: literature [active]
  ref = "Esvelt KM, Smidler AL, Catteruccia F, Church GM. Concerning RNA-guided gene drives for the alteration of wild populations. eLife 2014;3:e03401. (CRISPR-based gene-drive conceptual paper, with governance/ecological discussion in the original publication)"

@X x_gantz_bier_2015 := "Gantz VM, Bier E 2015" :: literature [active]
  ref = "Gantz VM, Bier E. The mutagenic chain reaction: a method for converting heterozygous to homozygous mutations. Science 2015;348:442–444. (first laboratory CRISPR gene drive in a metazoan — Drosophila melanogaster)"

@X x_kyrou_2018 := "Kyrou K et al 2018" :: literature [active]
  ref = "Kyrou K, Hammond AM, Galizi R, Kranjc N, Burt A, Beaghton AK, Nolan T, Crisanti A. A CRISPR-Cas9 gene drive targeting doublesex causes complete population suppression in caged Anopheles gambiae mosquitoes. Nat Biotechnol 2018;36:1062–1066."

@X x_esvelt_daisy_era := "Esvelt KM — daisy-drive / local-drive era" :: literature [active]
  ref = "Esvelt KM and colleagues (era ≈ 2017). Proposals for daisy-drive and related local-drive architectures intended to be self-limiting in spatial spread and cross-cycle persistence depth. Cited at primary-author / era level; specific journal citation for the daisy-drive framework not asserted."

@X x_nasem_genedrive_2016 := "NASEM 2016 — Gene Drives on the Horizon" :: literature [active]
  ref = "National Academies of Sciences, Engineering, and Medicine. Gene Drives on the Horizon: Advancing Science, Navigating Uncertainty, and Aligning Research with Public Values. Washington, DC: The National Academies Press, 2016. (consensus institutional report on gene-drive research governance)"

@X x_pardee_2014 := "Pardee K et al 2014" :: literature [active]
  ref = "Pardee K, Green AA, Ferrante T, Cameron DE, DaleyKeyser A, Yin P, Collins JJ. Paper-based synthetic gene networks. Cell 2014;159:940–954. (freeze-dried paper-based cell-free expression; toehold-switch sensors; Ebola-RNA detection demonstration)"

@X x_pardee_2016 := "Pardee K et al 2016" :: literature [active]
  ref = "Pardee K, Green AA, Takahashi MK, Braff D, Lambert G, Lee JW, Ferrante T, Ma D, Donghia N, Fan M, Daringer NM, Bosch I, Dudley DM, O'Connor DH, Gehrke L, Collins JJ. Rapid, low-cost detection of Zika virus using programmable biomolecular components. Cell 2016;165:1255–1266. (toehold + NASBA + CRISPR/Cas9 paper-based Zika diagnostic)"

@X x_tumpey_2005 := "Tumpey TM et al 2005" :: literature [active]
  ref = "Tumpey TM, Basler CF, Aguilar PV, Zeng H, Solórzano A, Swayne DE, Cox NJ, Katz JM, Taubenberger JK, Palese P, García-Sastre A. Characterization of the reconstructed 1918 Spanish influenza pandemic virus. Science 2005;310:77–80. (foundational dual-use / DURC case-study landmark; cited at literature level, no methods reproduced here)"

@X x_nsabb_durc_institutional := "NSABB / DURC framework — institutional" :: literature [active]
  ref = "U.S. National Science Advisory Board for Biosecurity (NSABB). Dual-Use Research of Concern (DURC) policy framework and recommendations (institutional / framework level; documents evolved through successive NSABB reports and U.S. government DURC policy iterations from the mid-2000s onward). Cited as an institutional governance reference; this tape does not enumerate controlled experiment categories at operational granularity."

@X x_bwc_institutional := "Biological Weapons Convention — institutional" :: literature [active]
  ref = "Convention on the Prohibition of the Development, Production and Stockpiling of Bacteriological (Biological) and Toxin Weapons and on Their Destruction (Biological Weapons Convention, BWC). Opened for signature 1972; entered into force 1975. Cited as a treaty/institutional reference at framework level; United Nations Office for Disarmament Affairs maintains text and adherence records."

@X x_australia_group_institutional := "Australia Group — institutional" :: literature [active]
  ref = "The Australia Group — informal forum of states harmonising export controls on dual-use chemical and biological materials and equipment. Cited as an institutional/regime reference at framework level; specific control lists and licensing requirements are jurisdictional and not enumerated here."
