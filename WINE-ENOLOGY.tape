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
# WINE-ENOLOGY.tape — architecture-current (editable per v1.2)
# Event history → WINE-ENOLOGY.log.tape sibling
# Note: VITICULTURE.tape (grape-growing) is a separate sibling;
#       this tape covers winemaking chemistry and microbiology.
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "wine-enology" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · wine enology substrate — winemaking chemistry + microbiology knowledge SSOT"
  brief = "Wine chemistry + microbiology · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "WINE-ENOLOGY.log.tape"
  scope = "in-silico enology knowledge SSOT · NOT winemaking protocol / regulatory / commercial advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see WINE-ENOLOGY.log.tape audit"

@N scope_disclaimer := "knowledge-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico wine enology substrate. Chemical and microbiological figures (sugar concentrations, ethanol ranges, SO₂ regulatory limits, sensory thresholds) are paraphrased from published enology literature for modeling context ONLY — they are NOT a winemaking recipe, a food-safety certification, a quality guarantee, or a regulatory compliance claim. Practical winemaking requires analytical testing, jurisdiction-specific regulation, and trained sensory evaluation."

# ─── §1 Must composition (pre-fermentation) ───────────────────────────

@D dom_must_sugars := "grape must — sugar composition" :: domain [ok]
  primary-sugars = "Glucose and fructose — the two principal fermentable sugars in grape must; they are hexoses present in approximately equal concentrations at maturity, though ratios shift with ripening stage and cultivar."
  typical-range = "Total fermentable sugars in ripe must are commonly cited in the range of approximately 200–260 g/L (varies with vintage, cultivar, region, and harvest decision) — an agronomic/viticultural variable, not a lattice constant."
  non-fermentable = "Pentoses (arabinose, rhamnose, xylose) are present at lower concentrations and are not fermented by Saccharomyces cerevisiae under normal conditions."
  ripeness-gradient = "Sugar concentration rises during berry ripening (véraison onward) as phloem import of sucrose continues and water is lost; the progression is a biological curve, not a lattice schedule."
  honesty = "The sugar range (~200–260 g/L) is a practical guideline from enology teaching literature; actual musts span a wider range depending on climate, chaptalization practice, and style target. Do not treat this as a lattice-derived constant."
  |> "[@x_ribereau_gayon_enology] · [@x_boulton_principles_1996]"

@D dom_must_acids := "grape must — organic acid composition" :: domain [ok]
  tartaric = "L-tartaric acid — the dominant grape-specific acid; relatively stable during fermentation and aging (not easily metabolized by common wine organisms). Its stability makes it the anchor of wine titratable acidity."
  malic = "L-malic acid — the second dominant organic acid; synthesized in the berry and partially respired during warm periods; higher in cool-climate grapes. Susceptible to malolactic fermentation (MLF) — see [@dom_mlf]."
  citric = "Citric acid — present in minor concentrations in grape must; can serve as a secondary carbon source for some lactic acid bacteria."
  ph-buffering = "The tartrate/bitartrate buffering system in wine is pH-significant; potassium bitartrate (cream of tartar) crystallizes on cold stabilization — a physical chemistry consequence of tartaric acid and potassium co-precipitation, not a design artifact."
  |> "[@x_ribereau_gayon_enology] · [@x_boulton_principles_1996]"

@D dom_must_phenolics := "grape must — phenolic compounds" :: domain [ok]
  tannins = "Condensed tannins (proanthocyanidins) — oligomers/polymers of flavan-3-ol units (catechin, epicatechin, epigallocatechin) located primarily in seeds and skins. The seed tannins are more astringent and harder/greener in character."
  anthocyanins = "Anthocyanins — the principal red/purple pigments of red-grape skins (malvidin glucoside dominant in Vitis vinifera); responsible for initial red color that evolves during aging. Singleton's era work characterized phenolic distribution and quantification methods."
  singleton-era = "Singleton (1985 era) published influential work on wine oxidation chemistry and phenolic measurement — the basis for phenolic fractionation and oxidation understanding in enology."
  white-vs-red = "White wines are made with minimal skin contact (low polyphenol extraction); red wines require maceration (skin-on fermentation) to extract anthocyanins and tannins — the technical distinction is extraction management, not inherent grape chemistry."
  |> "[@x_singleton_1985_era] · [@x_ribereau_gayon_enology]"

# ─── §2 Alcoholic fermentation ────────────────────────────────────────

@D dom_alcoholic_ferment := "alcoholic fermentation — Saccharomyces and primary conversion" :: domain [ok]
  pasteur-era = "Pasteur's 'Études sur le vin' (~1866 era, following his 1857 alcoholic fermentation memoir) established that alcoholic fermentation in wine is a vital activity of living yeast — not a purely chemical reaction. This was foundational for applied enology."
  primary-organism = "Saccharomyces cerevisiae — the dominant fermenter in most winemaking contexts; tolerates ethanol, sulfur dioxide, low pH, and high sugar. Selected strains (cultured yeasts) are widely used in commercial winemaking for consistency."
  native-vs-cultured = "Native (spontaneous) fermentation relies on the mixed yeast population naturally present on grapes and in the cellar; cultured yeasts provide predictability. Non-Saccharomyces species (Hanseniaspora/Kloeckera, Metschnikowia, Torulaspora, Lachancea) dominate early in spontaneous fermentation before Saccharomyces overtakes them as ethanol rises."
  stoichiometry = "Net: C₆H₁₂O₆ → 2 C₂H₅OH + 2 CO₂. These coefficients are conservation of atoms (Gay-Lussac/Pasteur established), not lattice tokens; the '6' in glucose is hexose organic chemistry."
  kinetic-phases = "Lag (yeast adaptation to must conditions), exponential (rapid sugar consumption and CO₂ evolution), stationary/deceleration (sugar depleted, ethanol accumulating, nutrient exhaustion), arrest/decline. This 4-phase growth model is general microbiology — it is not derived from τ=4 (see [@n6_honest_stance])."
  ethanol-range = "Typical table wine final ethanol: approximately 10–15% v/v depending on initial sugar, yeast strain, fermentation management, and stylistic target. Higher-alcohol wines (15–17%) are achievable but approach yeast stress limits."
  volatile-acidity = "Acetic acid (the primary volatile acid) accumulates during fermentation from yeast metabolism; elevated levels indicate stuck fermentation, stressed yeast, or Acetobacter contamination. Total volatile acidity is a standard wine quality parameter."
  |> "[@x_pasteur_1866_era] · [@x_ribereau_gayon_enology] · [@x_boulton_principles_1996]"

@D dom_yeast_nitrogen := "yeast assimilable nitrogen (YAN) and fermentation health" :: domain [ok]
  yan-definition = "Yeast assimilable nitrogen (YAN) = free amino nitrogen (FAN: amino acids except proline) + ammonium ion. Proline is not assimilated aerobically by wine yeast."
  nitrogen-role = "YAN is a primary determinant of fermentation rate and completion; nitrogen-deficient must produces slow/stuck fermentation and promotes H₂S production (from sulfate reduction as an alternative N source)."
  henschke-jiranek = "Henschke & Jiranek (1993 era) characterized yeast nitrogen metabolism in grape must — the mechanistic basis for DAP (diammonium phosphate) additions and the YAN recommendation framework in commercial winemaking."
  supplementation = "YAN deficiency is corrected by DAP and/or organic N supplements (yeast hulls, autolyzed yeast); overdose contributes to high biomass and off-aromas (fusel alcohols from excess amino acid catabolism via Ehrlich pathway)."
  |> "[@x_henschke_jiranek_1993_era]"

# ─── §3 Malolactic fermentation (MLF) ────────────────────────────────

@D dom_mlf := "malolactic fermentation (MLF)" :: domain [ok]
  reaction = "L-malic acid → L-lactic acid + CO₂, catalyzed by the malolactic enzyme (malate decarboxylase, NAD-independent) of lactic acid bacteria. Net: one dicarboxylic acid is converted to one monocarboxylic acid — titratable acidity decreases."
  primary-organism = "Oenococcus oeni — the most ethanol- and acid-tolerant lactic acid bacterium found in wine; the principal MLF organism in most commercial winemaking. Other LAB (Lactobacillus, Pediococcus) also perform MLF but with greater quality risk."
  sensory-effects = "Acidity reduction (softer mouthfeel in high-acid wines); diacetyl production from citric acid metabolism → 'buttery' or 'creamy' character at low concentrations; at high diacetyl it is a defect. CO₂ is released (minor effervescence during MLF)."
  style-choice = "MLF is encouraged for most red wines and many high-acid whites (e.g. Chardonnay); inhibited (by early SO₂ addition, low pH, filtration) when fresh fruity acidity is desired (Riesling, Sauvignon Blanc, sparkling wine base)."
  bartowsky-henschke-era = "Bartowsky & Henschke (reviews, late 1990s–2000s era) documented Oenococcus oeni physiology, strain diversity, and the biochemical basis of diacetyl and other MLF-derived flavor compounds in wine."
  |> "[@x_bartowsky_henschke_era] · [@x_ribereau_gayon_enology]"

# ─── §4 Phenolic chemistry and color evolution ────────────────────────

@D dom_phenolic_chemistry := "phenolic extraction, polymerization, and color evolution" :: domain [ok]
  extraction = "During red wine maceration, anthocyanins (water-soluble) extract first; tannins (extracting more slowly) need alcohol to solubilize from skin cell vacuoles. Extended maceration increases tannin but risks harsh, seed-derived astringency."
  tannin-anthocyanin-polymerization = "During aging, anthocyanins react with tannins to form stable pigmented tannin-anthocyanin adducts (direct condensation and acetaldehyde-mediated bridging). These polymeric pigments are less susceptible to SO₂ bleaching and pH variation — accounting for color stabilization in aged red wine."
  somers-era = "Somers' structural model (structural studies era, 1970s–1980s) characterized the chemistry of the anthocyanin-bisulfite equilibrium and the formation of polymeric pigments; this established the mechanistic framework for color evolution in red wine."
  color-evolution = "Fresh red wine color (monomeric anthocyanin-dominant, pH-sensitive, bright red-purple) → aged color (polymeric pigment-dominant, more stable, brick-orange at rim) is a chemical aging trajectory, not a scheduled lattice transition."
  |> "[@x_singleton_1985_era] · [@x_ribereau_gayon_enology]"

# ─── §5 Sulfur dioxide (SO₂) ─────────────────────────────────────────

@D dom_so2 := "sulfur dioxide (SO₂) — preservative chemistry" :: domain [ok]
  forms = "SO₂ in wine exists in equilibrium: molecular SO₂ (antimicrobial active form) ↔ bisulfite (HSO₃⁻) ↔ sulfite (SO₃²⁻), governed by pH. Only molecular SO₂ is antimicrobially effective; at wine pH (~3.2–3.6), bisulfite is the dominant species and molecular SO₂ is a small fraction of free SO₂."
  free-vs-total = "Free SO₂ = uncombined forms (molecular + bisulfite + sulfite). Total SO₂ = free + bound (SO₂ bound to aldehydes, ketones, sugars, pigments). Binding compounds (especially acetaldehyde) reduce effective free SO₂."
  antimicrobial = "Molecular SO₂ inhibits yeast and bacteria by entering cells (uncharged, membrane-permeable) and reacting with intracellular targets; it is the primary protection against Brettanomyces contamination and unwanted bacterial growth."
  antioxidant = "SO₂ scavenges oxygen and inhibits oxidative enzymes (laccase from Botrytis-infected grapes); both functions protect wine color and aroma from oxidation."
  regulatory-limits = "EU regulations (Council Regulation [EC] 606/2009 era and subsequent) specify maximum total SO₂ limits: approximately 150 mg/L for dry red wine; approximately 200 mg/L for dry white and rosé; higher limits for sweet wines. These are regulatory thresholds derived from safety assessments, not lattice constants."
  |> "[@x_ribereau_gayon_enology] · [@x_boulton_principles_1996]"

# ─── §6 Wine faults ───────────────────────────────────────────────────

@D dom_brett := "Brettanomyces — barnyard fault" :: domain [ok]
  organism = "Brettanomyces bruxellensis (anamorph: Dekkera bruxellensis) — a spoilage yeast capable of growing in wine under low-nutrient, low-SO₂ conditions, particularly in red wines aged in oak barrels."
  metabolites = "Produces volatile phenols: 4-ethylphenol (EP, 'barnyard', 'leather', 'horse') and 4-ethylguaiacol (EG, 'smoky', 'spicy') via hydroxycinnamic acid decarboxylation and vinyl-phenol reductase. Perception thresholds: EP ~140–400 µg/L range in red wine (wide depending on matrix and individual sensitivity); EG detectable at lower concentrations."
  precursors = "Precursors (p-coumaric acid → 4-vinylphenol → 4-ethylphenol; ferulic acid → 4-vinylguaiacol → 4-ethylguaiacol) come from grape phenolics and oak. Barrels are a reservoir for Brettanomyces in wood grain."
  control = "Molecular SO₂ maintenance, sterile filtration prior to bottling, barrel sanitation (hot water, SO₂, ozone), and timely topping. None of these fully sterilize a contaminated barrel — Brettanomyces is near-impossible to fully eliminate from an infected cellar. See [@lim_brett_elimination]."
  |> "[@x_brettanomyces_era] · [@x_ribereau_gayon_enology]"

@D dom_cork_taint := "cork taint — TCA" :: domain [ok]
  compound = "2,4,6-Trichloroanisole (TCA) — the primary compound responsible for 'musty', 'wet cardboard', 'dank' cork-taint character. Formed by microbial O-methylation of chlorophenol precursors (2,4,6-trichlorophenol and related compounds) present in natural cork from chlorine-based bleaching or environmental contamination."
  threshold = "Detection threshold for TCA is extremely low — commonly cited in the range of a few nanograms per liter (ng/L) in wine; the human olfactory system is exceptionally sensitive to this class of compound."
  2,4,6-tba = "2,4,6-Tribromoanisole (TBA) and other haloanisoles contribute to similar musty defects (often from treated wood packaging/pallets)."
  prevention = "Reduction strategies: non-chlorine cork processing, DIAM agglomerate corks, synthetic closures, screwcaps. Once TCA is in a bottle at threshold levels, there is no known cost-effective remediation at scale after bottling."
  detection = "Analytical detection by GC-MS at ng/L levels is reliable; sensory-based sorting of individual corks (Cork Nose assessment) is impractical at production scale."
  |> "[@x_tca_cork_era] · [@x_ribereau_gayon_enology]"

@D dom_reductive_faults := "reductive faults — H₂S and mercaptans" :: domain [ok]
  hydrogen-sulfide = "H₂S — produced by yeast from sulfate reduction (when YAN is insufficient and yeast use sulfate as a N source) or from residual elemental sulfur (fungicide residues). 'Struck match' / 'rotten egg' character; detectable at µg/L concentrations."
  mercaptans = "Methanethiol and ethanethiol — formed from H₂S reacting with acetaldehyde or other carbonyl compounds. 'Onion', 'drains', 'cooked cabbage'; more stable than H₂S and harder to remediate."
  remediation = "Aeration (post-fermentation racking) volatilizes H₂S; copper fining (CuSO₄ at micro-doses) precipitates Cu₂S; mercaptans less responsive to aeration alone. Over-reliance on copper in wine is subject to regulatory limits."
  |> "[@x_ribereau_gayon_enology] · [@x_boulton_principles_1996]"

@D dom_oxidation := "oxidative faults" :: domain [ok]
  mechanism = "Dissolved oxygen reacts with wine constituents (ethanol → acetaldehyde; phenolics oxidized; SO₂ consumed; color altered). Enzymatic (laccase/tyrosinase) and non-enzymatic (metal-catalyzed) pathways."
  aldehyde = "Acetaldehyde accumulation from ethanol oxidation produces 'sherry-like', 'bruised apple', 'flat' character in still table wines (desirable in sherry/flor yeast context but a defect in fresh whites)."
  brown = "Phenolic browning in white wines (Polyphenol oxidase on must phenolics pre-fermentation; post-fermentation non-enzymatic oxidation during aging) — brownish/golden color development correlated with oxidative exposure."
  protection = "SO₂ (antioxidant and oxidase inhibitor), inert gas blanketing, reductive winemaking (minimal oxygen contact), antioxidant additions (ascorbic acid, as supplement to SO₂ — ascorbic acid alone is a pro-oxidant without SO₂)."
  |> "[@x_singleton_1985_era] · [@x_ribereau_gayon_enology]"

@D dom_va := "volatile acidity (VA)" :: domain [ok]
  definition = "Volatile acidity (VA) = total steam-distillable acids in wine, dominated by acetic acid; expressed as g/L acetic acid. Minor contributors: formic, propionic, butyric acids."
  sources = "Acetic acid is a normal fermentation by-product (small amounts from yeast); elevated VA results from Acetobacter or Gluconobacter aerobic oxidation (Acetobacter converts ethanol → acetic acid in the presence of oxygen) or from Lactobacillus spoilage."
  legal-limits = "EU regulations specify maximum VA limits (approximately 1.08 g/L for white/rosé wines; 1.20 g/L for red; era-of-regulation applies — consult current regulation). These thresholds are analytical/regulatory, not lattice-derived."
  |> "[@x_ribereau_gayon_enology]"

# ─── §7 Aging — oak and bottle ────────────────────────────────────────

@D dom_oak_aging := "oak aging — barrel chemistry" :: domain [ok]
  extraction = "Oak (Quercus robur, Q. petraea for French; Q. alba for American) contributes extractable compounds to wine: lignans, ellagitannins (hydrolyzable tannins — oak-specific), oak lactones (β-methyl-γ-octalactone — 'coconut', 'vanilla' aroma esp. in American oak), vanillin (from lignin degradation — 'vanilla' aroma), furfural, eugenol."
  toast = "Toasting during barrel manufacture (light/medium/heavy) modifies the extractable compound profile: heavy toast reduces ellagitannin and increases vanillin, syringaldehyde, guaiacol. Toast level is an empirical cellar tool."
  oxygen-ingress = "Barrels allow slow oxygen micro-ingress through staves (permeability is barrel, humidity, and species-dependent) — this controlled micro-oxidation drives tannin polymerization, reduces VA as acetaldehyde bridges tannins, and softens wine texture over time. Approximately 10–60 mg O₂/L/year range cited for barrels (highly variable; exact figure depends on barrel age and conditions)."
  bottle-aging = "In bottle, wine ages under reductive conditions (minimal oxygen ingress through cork or screwcap); reactions include further polymerization, ester formation/hydrolysis, aroma evolution toward tertiary 'bouquet' characters."
  |> "[@x_ribereau_gayon_enology] · [@x_boulton_principles_1996]"

# ─── §8 Sparkling wine production ────────────────────────────────────

@D dom_sparkling := "sparkling wine production methods" :: domain [ok]
  traditional-method = "Méthode traditionnelle (Champagne method): base wine → second fermentation in bottle induced by addition of tirage (sugar + yeast liqueur) → autolysis on lees in bottle → riddling (remuage) to collect lees at neck → disgorgement (removal of yeast plug) → dosage (liqueur d'expédition to set final sweetness). Autolysis on lees produces yeasty, brioche, toasty characters (mannoprotein and amino acid liberation from spent yeast)."
  charmat = "Charmat (tank/Martinotti) method: secondary fermentation in sealed pressurized tank; filtered and bottled under pressure without extended lees contact. Faster and less expensive; preserves fresh, fruity character. Used for Prosecco (Glera grape, Italian DOC/DOCG)."
  carbonation = "Simple carbonation (injection of CO₂): lowest cost; no secondary fermentation. Legal in some categories; not 'traditional method'."
  pressure = "Sparkling wine pressure typically 5–6 bar at 20°C for Champagne style (Champagne AOC specifies minimum 3.5 bar). The CO₂ solubility/pressure relationship follows Henry's Law — a physical chemistry law, not a lattice value."
  |> "[@x_ribereau_gayon_enology] · [@x_boulton_principles_1996]"

# ─── §9 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ──

@D lim_ethanol_toxicity := "ethanol toxicity ceiling on S. cerevisiae" :: real-limit [ok required]
  wall = "HARD WALL (organism-intrinsic)"
  statement = "Ethanol is toxic to Saccharomyces cerevisiae at elevated concentrations; fermentation typically arrests at roughly 14–16% v/v ethanol for standard wine yeast strains, as membrane integrity is disrupted and cellular metabolism impaired. Some highly selected strains tolerate 18%+ but these are the exception, not the rule."
  consequence = "There is a biological ceiling on achievable wine alcohol from a given sugar load without physical ethanol removal or non-Saccharomyces engineering. High-sugar musts (dessert wines) often result in arrested fermentation leaving residual sugar — this is the organism's real limit, not a design parameter."
  |> "[@x_boulton_principles_1996] · [@x_ribereau_gayon_enology]"

@D lim_brett_elimination := "Brettanomyces near-impossibility of elimination" :: real-limit [ok required]
  wall = "HARD WALL (biological, cellar-environment persistent)"
  statement = "Brettanomyces bruxellensis forms biofilms in the stave pores of oak barrels and in cellar equipment crevices. Steam and SO₂ treatments reduce populations but rarely eliminate them completely. Re-contamination from the cellar environment is continuous."
  consequence = "A Brettanomyces-infected cellar cannot be made sterile through any practically available means; management (molecular SO₂ maintenance, filtration, barrel replacement schedule) reduces spoilage incidence rather than eliminating the organism. The 'detection but no cure after bottling' reality means that post-bottling, the consumer has no recourse for Brettanomyces-tainted wine."
  |> "[@x_brettanomyces_era] · [@x_ribereau_gayon_enology]"

@D lim_cork_taint_no_cure := "cork taint (TCA) — no remediation post-bottling at scale" :: real-limit [ok required]
  wall = "HARD WALL (physical-chemical, post-bottling)"
  statement = "Once TCA is present in a bottled wine above sensory threshold (a few ng/L range), there is no practical remediation at commercial scale. Individual 'rescue' protocols (e.g. polyethylene exposure) can bind some TCA but are impractical for retail or cellar operations."
  consequence = "Prevention is the only effective strategy — cork selection, non-chlorine processing, alternative closures (synthetic cork, screwcap, DIAM). TCA incidence rates have decreased significantly with process changes but have not been driven to zero. Economic loss from cork taint remains a significant industry cost (historically estimated at several percent of bottled production — exact figures vary by era and region)."
  |> "[@x_tca_cork_era]"

@D lim_alcohol_creep := "climate-driven alcohol creep vs. traditional style balance" :: real-limit [ok required]
  wall = "SOFT WALL (agro-climatic, cumulative)"
  statement = "Rising average growing-season temperatures over recent decades in established wine regions have elevated grape sugar concentrations at traditional harvest phenolic/flavor maturity. Wine alcohol levels in many regions have increased materially (from traditional ~12–12.5% toward 13.5–15%+ in warm vintages) as winemakers balance physiological (sugar) maturity against flavor/phenolic targets."
  consequence = "This trend creates a structural tension: harvesting earlier preserves alcohol balance but risks phenolic under-ripeness; harvesting later achieves phenolic maturity but produces high-alcohol wines. Mitigation options (reverse osmosis, vacuum evaporation, water addition — jurisdiction-dependent) add cost and may affect quality. This is an agro-climatic constraint compounding into a stylistic and regulatory challenge, not a lattice value."

# ─── §10 n=6 lattice stance (HONEST — observation, not derivation) ────

@F f_lattice_fit := "lattice-fit-on-enology" :: governance [required deny:write]
  pattern = "Deriving enology quantities (ethanol %, aging duration, phenolic counts, fermentation stage counts, SO₂ limits, sensory scores) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'optimal aging = 24 months because J₂=24' or 'σ=12 monitor sources' or '6 core quality parameters because n=6'."
  why = "This is exactly the fabrication the pre-rewrite WINE-ENOLOGY.tape committed (100+ lines of @D row_* entries with n_6='σ=12', 'τ=4', 'φ=2', 'J₂=24', 'EXACT' tags asserted as derivations for alcohol %, aging months, and sensory scores — see WINE-ENOLOGY.log.tape audit). hexa-bio AGENTS.tape @F f1 (lattice-fit-on-external-entity) + @D g1/g2 forbid it."
  remedy = "Cite real enology science sources (this tape's @X entries). Chemical stoichiometries (glucose C₆H₁₂O₆ has 6 carbons — hexose organic chemistry) and regulatory numbers (SO₂ limits from food safety assessments) are domain science, not lattice tokens. Lattice may only be a coincidental OBSERVATION, never a derivation."

@N n6_honest_stance := "enology has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: wine enology exposes NO natural n=6 invariant. Glucose (C₆H₁₂O₆) has 6 carbons — this is hexose organic chemistry, the etymological origin of 'hexose', and a conservation-of-atoms stoichiometry, NOT lattice σ/φ. The 4 phases of yeast fermentation growth (lag/exponential/stationary/decline) are general microbiology — not τ=4. Aging duration (12, 18, 24 months) is cellar convention and style target driven by wine chemistry (tannin polymerization rates, oak extraction, market demand) — not σ=12 or J₂=24. SO₂ regulatory limits (~150–200 mg/L) are risk-assessment-derived regulatory thresholds — not lattice constants. The number of enology 'quality pillars' or 'fault categories' is a pedagogical taxonomy, not n=6. Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool) and LATTICE_POLICY: the lattice is declined here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub."

# ─── §11 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 ethanol toxicity arrest" :: prediction [ok]
  claim = "A standard commercial S. cerevisiae wine strain (unengineered for ethanol tolerance) in batch fermentation will cease net ethanol production below 17% v/v when all other nutrients are non-limiting — arrested by membrane toxicity and metabolic impairment."
  falsifier = "If a peer-reviewed batch fermentation with an unengineered, commercially standard wine S. cerevisiae strain (no in-situ ethanol removal, no high-tolerance selection) shows sustained ethanol production reliably above 17% v/v, [@lim_ethanol_toxicity] ceiling is underestimated for commercial strains."
  source = "[@x_boulton_principles_1996] · [@x_ribereau_gayon_enology]"

@D tp_2 := "TP-2 malolactic fermentation acidity reduction" :: prediction [ok]
  claim = "Completion of MLF by Oenococcus oeni in a wine with measurable L-malic acid will reduce titratable acidity and increase pH, with the magnitude of change proportional to initial malic acid concentration — quantifiable by enzymatic or HPLC malic acid assay."
  falsifier = "If a properly controlled MLF completion trial (confirmed by paper chromatography or enzymatic assay showing malic acid consumption) shows no measurable change in titratable acidity or pH, the biochemical mechanism of MLF is wrong."
  source = "[@x_bartowsky_henschke_era] · [@x_ribereau_gayon_enology]"

@D tp_3 := "TP-3 TCA cork taint sensory threshold" :: prediction [ok]
  claim = "A wine spiked with TCA at a few ng/L (within the reported detection-threshold range) will be correctly identified as tainted versus control by a panel of trained tasters at greater than chance frequency."
  falsifier = "If a properly powered, double-blind triangle test with trained evaluators fails to detect TCA at concentrations within the literature-cited detection-threshold range, the reported TCA sensory threshold is materially overestimated."
  source = "[@x_tca_cork_era]"

# ─── §12 Cross-links ──────────────────────────────────────────────────

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). This tape complies: real enology science, in-silico knowledge SSOT only, lattice declined as a derivation tool."

@X x_fermentation_sibling := "FERMENTATION.tape (hexa-bio sibling)" :: sibling-tape [active]
  scope = "General microbial fermentation — alcoholic/lactic/acetic fermentation, industrial biotechnology, bacteriophage, process modes. WINE-ENOLOGY.tape specializes the wine domain; does not shadow FERMENTATION.tape's general coverage."
  ?> "FERMENTATION.tape"

@X x_viticulture_sibling := "VITICULTURE.tape (hexa-bio sibling)" :: sibling-tape [active]
  scope = "Grape-growing — viticulture, vineyard management, terroir, phenology. WINE-ENOLOGY.tape begins at the winery (crush/must) and does not cover viticulture."
  ?> "VITICULTURE.tape"

# ─── §13 External citations (real, landmark literature) ───────────────
# Where specific bibliographic detail is not asserted with full confidence,
# the entry names the primary author + era and says so explicitly.

@X x_pasteur_1866_era := "Pasteur — Études sur le vin (~1866 era)" :: literature [active]
  ref = "Pasteur L. Études sur le vin, ses maladies, causes qui les provoquent, procédés nouveaux pour le conserver et pour le vieillir. Paris: Imprimerie Impériale, 1866. (The foundational applied enology text — Pasteur demonstrated fermentation as a vital yeast activity and identified the microbial basis of wine diseases; established the science of oenology. Primary author/title/year/publisher cited from the established historical record of this landmark work.)"

@X x_ribereau_gayon_enology := "Ribéreau-Gayon — Handbook of Enology, Vols 1–2" :: literature [active]
  ref = "Ribéreau-Gayon P, Dubourdieu D, Donèche B, Lonvaud A. Handbook of Enology, Vol. 1: The Microbiology of Wine and Vinifications. Ribéreau-Gayon P, Glories Y, Maujean A, Dubourdieu D. Handbook of Enology, Vol. 2: The Chemistry of Wine, Stabilization and Treatments. (Wiley, 2nd English ed. era; originally Traité d'Œnologie, Dunod, French original editions mid-20th century onward — the standard 6-volume enology reference; English 2-volume translation is the widely cited form. Primary authors/title/publisher era cited; exact edition year not asserted with precision beyond 'Wiley 2nd English edition era'.)"

@X x_boulton_principles_1996 := "Boulton, Singleton, Bisson & Kunkee 1996" :: literature [active]
  ref = "Boulton RB, Singleton VL, Bisson LF, Kunkee RE. Principles and Practices of Winemaking. Chapman & Hall / Kluwer Academic, 1996. (Comprehensive winemaking textbook covering fermentation biochemistry, yeast physiology, MLF, phenolic chemistry, SO₂ chemistry, faults, and sparkling wine production. Primary authors/title/year cited.)"

@X x_singleton_1985_era := "Singleton (phenolics oxidation chemistry, 1985 era)" :: literature [active]
  ref = "V.L. Singleton — extensive publications on wine phenolic chemistry, including quantification methodology and oxidation mechanism characterization. Key era: mid-1970s through 1985 and beyond (e.g. Singleton VL, Rossi JA Jr. Colorimetry of total phenolics with phosphomolybdic-phosphotungstic acid reagents. Am J Enol Vitic 1965;16:144–158 for the Folin-Ciocalteu method adaptation; and Singleton's later oxidation chemistry reviews). Primary author/era cited; specific 1985 article volume not asserted."

@X x_bartowsky_henschke_era := "Bartowsky & Henschke (MLF reviews, late 1990s–2000s era)" :: literature [active]
  ref = "Bartowsky EJ, Henschke PA — peer-reviewed reviews on Oenococcus oeni physiology, MLF biochemistry, and diacetyl/flavor compound formation. Published across multiple journals in the late 1990s through 2000s era (e.g. Int J Food Microbiol and Aust J Grape Wine Res). Primary authors/era cited; individual article volume/page not asserted."

@X x_henschke_jiranek_1993_era := "Henschke & Jiranek (yeast N metabolism, 1993 era)" :: literature [active]
  ref = "Henschke PA, Jiranek V. Yeasts — metabolism of nitrogen compounds. In: Fleet GH (ed.), Wine Microbiology and Biotechnology. Harwood Academic, 1993. (Chapter characterizing yeast assimilable nitrogen, YAN requirements, and H₂S production from N deficiency — foundational for the YAN framework in commercial winemaking. Primary authors/book/year cited.)"

@X x_brettanomyces_era := "Brettanomyces volatile-phenol literature (late 1990s–2000s era)" :: literature [active]
  ref = "Chatonnet P, Dubourdieu D, Boidron JN, Pons M — characterization of volatile phenol (4-ethylphenol, 4-ethylguaiacol) production by Brettanomyces/Dekkera in wine. J Sci Food Agric 1992;60:165–178 and related publications. Also: Loureiro V, Malfeito-Ferreira M — Dekkera/Brettanomyces spoilage in wine: a review. Int J Food Microbiol 2003;86:1–16 (era review). Primary authors/era cited; detailed volume/page for the Chatonnet 1992 paper is cited with reasonable confidence based on its landmark status."

@X x_tca_cork_era := "TCA cork-taint mechanism and sensory threshold literature (1990s–2000s era)" :: literature [active]
  ref = "Mazzoleni V et al. — TCA in cork and wine (era literature); also Tanner H, Zanier C (chloroanisoles in cork characterization). The formation mechanism (microbial O-methylation of chlorophenols) and extremely low sensory threshold (ng/L range) have been extensively documented since the 1980s–1990s. Sefton MA, Simpson RF. Compounds causing cork taint and the factors affecting their transfer from natural cork closures to wine. Aust J Grape Wine Res 2005;11:226–240 (cited as a representative review; primary author/journal/year/volume cited). Author/era for earlier mechanistic studies not asserted to specific volume."
