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
# FERMENTATION.tape — architecture-current (editable per v1.2)
# Event history → FERMENTATION.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "fermentation" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · fermentation substrate — microbiology + biotechnology knowledge SSOT"
  brief = "microbial fermentation · food/industrial biotechnology · real-limits anchored · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "FERMENTATION.log.tape"
  scope = "in-silico fermentation microbiology + biotechnology knowledge SSOT"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see FERMENTATION.log.tape audit"

@N scope_disclaimer := "knowledge-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico fermentation substrate. Microbiological figures (pathway stoichiometries, yield data, inhibition thresholds) are paraphrased from published fermentation-science literature for modeling context ONLY — they are NOT a fermentation-process recipe, regulatory submission, food-safety certification, or clinical claim. Industrial process design requires engineering validation, food-safety regulation compliance, and GMO-release rules where applicable."

# ─── §1 Definition & scope ────────────────────────────────────────────

@D dom_definition := "fermentation — definition" :: domain [ok]
  primary = "Anaerobic or facultative anaerobic microbial conversion of organic substrates into energy + metabolic end-products (acids, alcohols, gases). Strictly, fermentation is substrate-level phosphorylation without an external electron acceptor; colloquially it encompasses any large-scale microbial bioprocess."
  food-scope = "Traditional food/beverage fermentations (alcoholic, lactic, acetic, propionic): millennia-old; driven by Saccharomyces, Lactobacillales, Acetobacter, Propionibacterium and mixed consortia."
  industrial-scope = "Industrial biotechnology fermentations: citric acid, antibiotics, amino acids, enzymes, biofuels, bioplastic precursors — typically submerged stirred-tank reactors with controlled aeration and sterility."
  honesty = "The substrate count, organism count, or product count in fermentation microbiology is NOT constrained by any n=6 invariant — see [@n6_honest_stance]."
  |> "[@x_hutkins_2006] · [@x_stanieretal_1963]"

# ─── §2 Alcoholic fermentation ────────────────────────────────────────

@D dom_alcoholic := "alcoholic fermentation" :: domain [ok]
  organism = "Saccharomyces cerevisiae — the primary brewing and wine yeast; also Saccharomyces pastorianus (lager), Kluyveromyces marxianus (whey), and diverse non-Saccharomyces wine yeasts."
  pathway = "EMP glycolysis (Embden–Meyerhof–Parnas) → pyruvate; in anaerobic yeast: pyruvate → acetaldehyde (pyruvate decarboxylase) → ethanol (alcohol dehydrogenase) + CO₂. Net: C₆H₁₂O₆ → 2 C₂H₅OH + 2 CO₂ + 2 ATP. These stoichiometric coefficients are fixed by conservation of atoms — NOT by the lattice."
  pasteur = "Pasteur demonstrated in 'Mémoire sur la fermentation alcoolique' (1857) that fermentation is driven by living yeast, not merely chemical catalysis — the first demonstration of microorganism-driven fermentation as a vital activity, refuting the purely chemical view of Liebig."
  products = "Ethanol (primary), CO₂ (leavening in baking, carbonation), fusel alcohols (higher alcohols from amino-acid catabolism — aroma/flavour at trace levels, palate harshness at excess). Glycerol is the main by-product under osmotic stress."
  applications = "Beer, wine, sake, distilled spirits, fuel ethanol (bioethanol), bread leavening."
  |> "[@x_pasteur_1857] · [@x_hutkins_2006]"

# ─── §3 Lactic acid fermentation ─────────────────────────────────────

@D dom_lactic := "lactic acid fermentation" :: domain [ok]
  organisms-homo = "Homofermentative LAB (Lactococcus lactis, Streptococcus thermophilus, Lactobacillus delbrueckii): ferment hexoses almost exclusively via EMP glycolysis → lactate (>85% of carbon recovered as lactate). No CO₂ from sugar catabolism in homofermentative mode."
  organisms-hetero = "Heterofermentative LAB (Leuconostoc mesenteroides, Lactobacillus brevis, Weissella spp.): ferment hexoses via the phosphoketolase (6-phosphogluconate/phosphoketolase) pathway → lactate + CO₂ + ethanol or acetate (approximately equimolar from hexose). Obligate heterofermenters by enzymatic constitution (lack aldolase + triosephosphate isomerase)."
  products = "L-lactate and/or D-lactate (stereospecificity is organism-/LDH-determined); CO₂; ethanol; acetate. The product mix is biochemically determined, not lattice-derived."
  applications = "Yogurt (S. thermophilus + L. bulgaricus coculture), cheese (diverse LAB + rennet), sauerkraut (Leuconostoc then Lactobacillus succession), kimchi (similar LAB succession), sourdough (LAB + wild yeast; Gänzle 2014 era review documents the LAB-yeast ecology), kefir, olives, meat fermentations."
  lactic-acid-bioplastic = "Lactic acid is also the monomer for PLA (polylactic acid) bioplastics — a major industrial fermentation target."
  |> "[@x_hutkins_2006] · [@x_ganzle_2014]"

# ─── §4 Acetic acid & propionic acid fermentation ────────────────────

@D dom_acetic := "acetic acid fermentation (vinegar)" :: domain [ok]
  organisms = "Acetobacter aceti, Acetobacter pasteurianus, Gluconobacter oxydans — obligate aerobes that oxidise ethanol → acetic acid (acetate) in a two-step oxidation using alcohol dehydrogenase and aldehyde dehydrogenase. This is NOT fermentation in the strict anaerobic sense — it is an aerobic oxidation, but grouped with fermented foods conventionally."
  process = "Orleans process (slow, surface), submerged aeration (industrial trickling/submersion). Final product: vinegar (≈4–8% acetic acid)."
  application = "Vinegar (wine vinegar, cider vinegar, rice vinegar, malt vinegar), industrial acetic acid."
  |> "[@x_hutkins_2006]"

@D dom_propionic := "propionic acid fermentation — Swiss cheese" :: domain [ok]
  organisms = "Propionibacterium freudenreichii subsp. shermanii — the defining organism of Swiss-type cheese (Emmental, Gruyère). Ferments lactate (produced by LAB) → propionate + acetate + CO₂ via the Wood–Werkman (methylmalonyl-CoA) pathway."
  cheese-eyes = "CO₂ accumulates in the semi-solid curd → characteristic 'eyes' (holes) of Swiss cheese. Eye size and distribution depend on ripening temperature, inoculation rate, and curd pH — measurable, empirical parameters, not lattice-derived ratios."
  |> "[@x_hutkins_2006]"

# ─── §5 Industrial fermentations ─────────────────────────────────────

@D dom_citric_acid := "citric acid production (Aspergillus niger)" :: domain [ok]
  organism = "Aspergillus niger — filamentous fungus capable of accumulating citric acid to high concentrations (>100 g/L in optimised industrial fermentations) under conditions of high sucrose/glucose, limiting Mn²⁺, low pH (~2–3), and high aeration."
  currie = "Currie (1917 era) demonstrated that A. niger could accumulate commercial quantities of citric acid under acid/Mn-limiting conditions — foundational for the industrial citric acid process that displaced the Italian lemon industry."
  mechanism = "Citric acid accumulates via truncated TCA cycle: isocitrate dehydrogenase is downregulated under Mn limitation; citrate synthase is active; the net result is export of citrate rather than complete oxidation."
  scale = "Citric acid is among the highest-volume microbial fermentation products globally (>2 million tonnes/year era); produced predominantly by A. niger submerged fermentation."
  |> "[@x_currie_1917_era] · [@x_stanieretal_1963]"

@D dom_antibiotics := "antibiotic fermentation" :: domain [ok]
  penicillin-discovery = "Fleming (1929) reported that Penicillium notatum mould produced a diffusible substance inhibiting Staphylococcus cultures — published as 'On the Antibacterial Action of Cultures of a Penicillium' (Br J Exp Pathol 10:226–236, 1929). This observation was the discovery of penicillin."
  penicillin-industrial = "Chain & Florey (1940s era) developed penicillin purification and demonstrated clinical efficacy; wartime industrial fermentation (Penicillium chrysogenum in deep submerged culture) scaled production from milligram to ton scale — one of the fastest scale-ups in industrial fermentation history."
  streptomyces = "Streptomyces spp. are the dominant bacterial source of natural antibiotics (streptomycin — Waksman 1943/1944 era; tetracyclines; erythromycin; vancomycin; avermectins). Secondary metabolite production is nutritionally triggered (N/P starvation, stationary phase)."
  mechanism = "Antibiotic biosynthesis typically proceeds via polyketide synthase (PKS) or non-ribosomal peptide synthetase (NRPS) enzyme complexes — large modular assembly lines encoding structural diversity."
  resistance = "Antibiotic resistance evolves under selection; industrial-scale antibiotic fermentation is itself a driver of environmental resistance gene pools — a documented biotechnology/public-health tension."
  |> "[@x_fleming_1929] · [@x_hutkins_2006]"

@D dom_other_industrial := "other industrial fermentation targets" :: domain [ok]
  lactic-pla = "Lactic acid → PLA (polylactic acid) bioplastic: fermentation-derived monomer for a biodegradable polymer replacing petroleum-derived plastics in packaging."
  bioethanol = "Fuel ethanol from sugarcane, corn starch, or lignocellulosic biomass; Saccharomyces fermentation of fermentable sugars; yield bounded by ethanol toxicity ceiling to yeast (see [@lim_ethanol_toxicity])."
  enzymes = "Industrial enzymes (amylases, proteases, lipases, cellulases) produced by Aspergillus, Bacillus, Trichoderma; the enzymes ARE the product, not the fermentation metabolite."
  amino-acids = "Glutamate (MSG) by Corynebacterium glutamicum (Kinoshita/Udaka era, 1957); lysine, threonine similarly — metabolic flux engineering via auxotrophies or feedback-deregulated mutants."
  |> "[@x_hutkins_2006]"

# ─── §6 Process modes ─────────────────────────────────────────────────

@D dom_process_modes := "fermentation process modes" :: domain [ok]
  solid-state = "SSF (Solid-State Fermentation): substrate is a solid with low free water; used for koji (Aspergillus oryzae on rice/soybean → miso/sake/soy sauce enzymes), tempeh (Rhizopus oligosporus on soybean), certain enzyme productions. Low energy cost, no large effluent volume, but hard to control heat + mass transfer."
  submerged = "SmF (Submerged Fermentation): organism grows in liquid medium; the dominant mode for industrial antibiotic, citric acid, enzyme, amino acid, bioethanol production. Enables fine control of dissolved oxygen, pH, temperature, feeding."
  batch = "Batch: closed-system, single inoculation → fermentation runs to completion. Simple; product accumulation eventually causes inhibition or substrate depletion."
  fed-batch = "Fed-batch: substrate is fed incrementally to maintain sub-inhibitory concentrations and avoid catabolite repression or product toxicity; standard for high-yield antibiotic and enzyme production."
  continuous = "Continuous (chemostat): fresh medium in, broth out at equal rate; steady-state maintained; used for kinetics research and some commodity fermentations (fuel ethanol). Contamination and strain drift are operational challenges."
  |> "[@x_hutkins_2006]"

# ─── §7 Starter cultures & bacteriophage management ──────────────────

@D dom_starters := "starter cultures & bacteriophage management" :: domain [ok]
  starters = "Defined starter cultures (single-strain or defined-mixture) replaced uncontrolled natural-microbiota fermentation in industrial dairy, meat, and beverage production to ensure reproducibility, safety, and product specification."
  bacteriophage = "Bacteriophage (bacterial viruses) infect and lyse starter bacteria in dairy fermentation — the primary cause of slow/failed acidification ('slow vats') in cheese/yogurt. Lactococcal phages (c2, 936, P335 families) are endemic in commercial dairy environments."
  phage-hard-wall = "Phage contamination is a persistent HARD limitation on industrial fermentation: phages are airborne, survive pasteurisation of whey, and evolve rapidly to overcome bacterial resistance mechanisms. See [@lim_phage]."
  management = "Phage management: phage-resistant starter rotations, defined-strain programs with diversity pools, aseptic inoculation, positive-pressure air filtration, monitoring by plaque assay. None of these strategies fully eliminates the hazard — they manage a permanent industrial risk."
  |> "[@x_hutkins_2006]"

# ─── §8 Synthetic biology context ────────────────────────────────────

@D dom_synbio := "synthetic biology cross-link" :: domain [ok]
  scope = "Metabolic engineering and synthetic biology extend classical fermentation by rationally re-routing or expanding biosynthetic capacity: heterologous pathway expression, CRISPR-based genome editing in industrial strains, pathway balancing via promoter/RBS tuning, orthogonal regulation."
  hexa-bio-sibling = "Detailed CRISPR/synthetic-biology coverage lives in hexa-bio crispr-gene-editing/ and crispr-cas13-poc-diagnostic/ — this fermentation tape cross-references, does not shadow, that domain."
  honesty = "Synthetic biology expands the fermentation product space but does not override the real physical/biological limits ([@lim_oxygen_transfer], [@lim_product_toxicity], [@lim_phage], [@lim_economics]). Engineering extends ceilings incrementally."
  ?> "crispr-gene-editing/ (hexa-bio sibling)"

# ─── §9 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ──

@D lim_phage := "bacteriophage contamination — HARD production risk" :: real-limit [ok required]
  wall = "HARD WALL (biological, persistent)"
  statement = "Bacteriophages infecting starter or production organisms are an irreducible hazard in any open industrial fermentation environment. Lactococcal phages can destroy a dairy fermentation batch in hours. The phage–bacterium coevolutionary arms race means that resistance acquired by a strain is temporary — phage mutants evade it."
  consequence = "Phage management is a permanent operational cost and risk. There is no engineering solution that eliminates the hazard to zero; phage-free 'clean' environments are an asymptote, not an achievable steady state."
  |> "[@x_hutkins_2006]"

@D lim_product_toxicity := "product toxicity — ethanol, acids, and the inhibition ceiling" :: real-limit [ok required]
  wall = "SOFT WALL (organism-specific inhibition threshold)"
  statement = "End-products accumulate and inhibit the producing organism. Ethanol toxicity to S. cerevisiae limits achievable ethanol titre in conventional fermentations to roughly 12–15% v/v (Crabtree effect and membrane toxicity); acid accumulation (lactic, acetic) lowers pH and inhibits LAB growth; high citrate concentrations can feedback-inhibit A. niger. These thresholds are organism-intrinsic, not engineering choices."
  consequence = "The achievable product concentration in a batch/fed-batch is bounded by organism tolerance; raising it requires either tolerance engineering (often with metabolic tradeoffs) or in-situ product removal."
  |> "[@x_hutkins_2006]"

@D lim_oxygen_transfer := "oxygen-transfer rate (kLa) — aerobic scale-up limit" :: real-limit [ok required]
  wall = "HARD WALL (engineering, scale-dependent)"
  statement = "In aerobic industrial fermentations (A. niger, Penicillium, aerobic enzyme producers), the volumetric oxygen-transfer rate (kLa × C* — Cs) governs how much oxygen reaches the organism. kLa scales poorly with reactor volume (mixing becomes less efficient, bubble size increases, shear gradients appear); dissolved oxygen falls below the critical value (Km,O₂) at scale, limiting biomass and productivity."
  consequence = "Aerobic fermentation productivity is oxygen-transfer-limited at industrial scale. Engineering mitigations (high-shear impellers, aeration cascade, pure O₂ sparging) raise the ceiling but impose capital and energy costs. Not a lattice constraint — a fluid-dynamics / mass-transfer constraint."
  |> "[@x_hutkins_2006]"

@D lim_substrate_economics := "substrate-supply economics" :: real-limit [ok required]
  wall = "ECONOMIC / SUPPLY-CHAIN LIMIT"
  statement = "Fermentation substrate cost (sucrose, glucose syrup, corn starch, molasses, whey permeate) constitutes 40–60% of industrial fermentation production cost. Commodity sugar/molasses price volatility (harvest, geopolitical) directly impacts fermentation economics. Lignocellulosic substrate conversion (cellulose + hemicellulose) is technically feasible but enzymatic pretreatment cost has not yet made second-generation bioethanol fully competitive at scale."
  consequence = "Fermentation economics are partly governed by global agricultural commodity markets — a supply-chain constraint external to any in-silico optimization."

@D lim_gmo_regulatory := "GMO release and novel-organism regulatory constraints" :: real-limit [ok required]
  wall = "REGULATORY HARD WALL (jurisdiction-dependent)"
  statement = "Genetically modified microorganisms (GMM) used in industrial fermentation face regulatory requirements under various frameworks (e.g. EU GMM contained-use directive, US TSCA/FDCA, national biosafety committees). Open-environment release (field-scale agriculture inoculants, open-water bioremediation) is more restrictively regulated than contained industrial use."
  consequence = "Novel GMM fermentation products require regulatory approval pathways that can take years and impose significant cost — a real boundary on how quickly in-silico strain engineering translates to industrial deployment."

# ─── §10 n=6 lattice stance (HONEST — observation, not derivation) ────

@F f_lattice_fit := "lattice-fit-on-fermentation" :: governance [required deny:write]
  pattern = "Deriving fermentation process parameters, pathway stoichiometries, product counts, organism counts, or fermentation-stage counts FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'ethanol yield = X% because J₂=24' or 'fermentation runs n=6 stages because n=6' or 'pH optimum = τ~sopfr'."
  why = "This is exactly the fabrication the pre-rewrite FERMENTATION.tape committed (dozens of @D row_h_fer_* entries with n_6 = 'sopfr~J₂-τ', 'φ=2', 'n=6' as alleged derivations of chemical stoichiometries, yeast chromosome counts, and cultural practices like막걸리 ABV — see FERMENTATION.log.tape audit). hexa-bio AGENTS.tape @F f1 (lattice-fit-on-external-entity) + @D g1/g2 forbid it."
  remedy = "Cite real fermentation-science sources (this tape's @X entries). Stoichiometric coefficients (2 CO₂ per glucose in alcoholic fermentation) are conservation of atoms — not lattice tokens. Chromosome counts, regulatory standards, and cultural practices are biology/law/history, not n=6-derived. Lattice may only be a coincidental OBSERVATION, never a derivation."

@N n6_honest_stance := "fermentation microbiology has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: fermentation microbiology exposes NO natural n=6 invariant. The alcoholic-fermentation stoichiometry (C₆H₁₂O₆ → 2 ethanol + 2 CO₂) has a '6' in the hexose molecular formula — this is hexose organic chemistry (the 'hex' in hexose IS the six carbons), NOT a lattice derivation. The glycolysis pathway has 10 steps (not 6, not 12). Lactic acid (C₃H₆O₃) has 12 atoms total — a coincidence with σ=12, NOT a derivation; atom-counting matches σ=12 in many small molecules without implying the lattice governs biochemistry. S. cerevisiae has 16 haploid chromosomes — this is established genomics (yeast genome project, 1996), not φ^τ. The stages of batch fermentation (lag / exponential / stationary / decline) are 4 — a microbiological growth phase model, not τ=4. Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool) and LATTICE_POLICY: the lattice is declined here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub."

# ─── §11 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 homofermentative vs heterofermentative LAB product profile" :: prediction [ok]
  claim = "Under anaerobic hexose fermentation, a homofermentative LAB (Lactococcus lactis) produces >85% lactate relative to total carbon products, while a heterofermentative LAB (Leuconostoc mesenteroides) produces approximately equimolar lactate, CO₂, and ethanol/acetate."
  falsifier = "If HPLC/GC analysis of a controlled fermentation with these organism classes shows comparable product profiles (both >85% lactate or both near-equimolar mixed), the homo/heterofermentative classification is wrong."
  source = "[@x_hutkins_2006]"

@D tp_2 := "TP-2 bacteriophage lysis of dairy starter in open production" :: prediction [ok]
  claim = "In an unshielded industrial dairy fermentation using Lactococcus lactis without phage-resistant strain rotation, bacteriophage-driven slow vats will occur at detectable frequency in any facility with recycled whey streams."
  falsifier = "If a properly documented open-facility trial with L. lactis without phage management shows zero lysis events over a multi-year production run, [@lim_phage] is wrong."
  source = "[@x_hutkins_2006]"

@D tp_3 := "TP-3 ethanol toxicity ceiling in S. cerevisiae batch fermentation" :: prediction [ok]
  claim = "A standard industrial S. cerevisiae strain in batch fermentation will plateau ethanol production below 15% v/v ethanol titre without genetic tolerance engineering or physical removal — product toxicity limits further conversion even if glucose remains available."
  falsifier = "If a peer-reviewed batch fermentation with unengineered S. cerevisiae (no ethanol removal, no tolerance selection) shows sustained production above 17% v/v, [@lim_product_toxicity] ceiling is underestimated."
  source = "[@x_hutkins_2006]"

# ─── §12 Cross-links ──────────────────────────────────────────────────

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). This tape complies: real fermentation science, in-silico knowledge SSOT only, lattice declined as a derivation tool."

# ─── §13 External citations (real, landmark literature) ───────────────
# Where a specific bibliographic detail is not asserted with confidence,
# the entry names the primary author + era only and says so explicitly.

@X x_pasteur_1857 := "Pasteur 1857 — alcoholic fermentation" :: literature [active]
  ref = "Pasteur L. Mémoire sur la fermentation alcoolique. Ann Chim Phys 1857;3rd series 58:323–426. (Demonstrated that fermentation is driven by living yeast — the founding paper of microbial fermentation physiology; also the period of his 'Études sur la bière' and 'Études sur le vin' era work on wine spoilage and fermentation organisms, ~1857–1866.)"

@X x_fleming_1929 := "Fleming 1929 — penicillin discovery" :: literature [active]
  ref = "Fleming A. On the antibacterial action of cultures of a Penicillium, with special reference to their use in the isolation of B. influenzae. Br J Exp Pathol 1929;10:226–236. (Original penicillin discovery paper.)"

@X x_hutkins_2006 := "Hutkins — Microbiology and Technology of Fermented Foods" :: literature [active]
  ref = "Hutkins RW. Microbiology and Technology of Fermented Foods. Blackwell Publishing / IFT Press, 2006. (Comprehensive textbook on food fermentations — LAB physiology, alcoholic fermentation, cheese/yogurt/vinegar technology, starter culture management, bacteriophage in dairy; primary reference for this tape.)"

@X x_stanieretal_1963 := "Stanier, Doudoroff & Adelberg — The Microbial World" :: literature [active]
  ref = "Stanier RY, Doudoroff M, Adelberg EA. The Microbial World. Prentice-Hall, 1963 (and subsequent editions). (Classic microbiology textbook covering microbial metabolism, fermentation pathways, and the biochemistry of anaerobic catabolism; author/era cited.)"

@X x_currie_1917_era := "Currie (citric acid by A. niger, 1917 era)" :: literature [active]
  ref = "Currie JN. The citric acid fermentation of Aspergillus niger. J Biol Chem 1917;31:15–37. (Demonstrated industrial citric acid accumulation by A. niger under acid/Mn-limiting conditions; established the process basis for modern citric acid production. Primary author + journal/volume/page cited; era verified.)"

@X x_ganzle_2014 := "Gänzle 2014 — sourdough LAB" :: literature [active]
  ref = "Gänzle MG. Enzymatic and bacterial conversions during sourdough fermentation. Food Microbiol 2014;37:2–10. (Review of LAB–yeast ecology and biochemistry in sourdough; lactic/acetic acid formation, heterofermentative LAB pathways; primary author/journal/year cited, volume number era-consistent.)"
