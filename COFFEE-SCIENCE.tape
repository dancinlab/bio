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
# COFFEE-SCIENCE.tape — architecture-current (editable per v1.2)
# Event history → COFFEE-SCIENCE.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "coffee-science" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · specialty coffee + brewing science + sensory knowledge SSOT"
  brief = "Specialty coffee + brewing science + sensory · cup-quality · climate-economics deep-dive · n=6 NOT used as a derivation (honest) · companion to COFFEE.tape"
  parent = "dancinlab/hexa-bio"
  sibling-log = "COFFEE-SCIENCE.log.tape"
  sibling-companion = "COFFEE.tape (committed f714f7a) — general coffee biology + chemistry; this tape is the specialty-science + sensory + economics deep-dive; no duplication of COFFEE.tape content"
  scope = "in-silico specialty-coffee science knowledge SSOT · NOT a barista protocol / not a food-safety / not a clinical / not a regulatory claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see COFFEE-SCIENCE.log.tape audit"

@N scope_disclaimer := "knowledge-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico specialty-coffee science substrate. Figures (extraction yields, TDS targets, Q-grade scores, economic shares) are paraphrased from published food-science, sensory-evaluation, and agro-economic literature for modeling context ONLY — they are NOT a brewing recipe, quality-certification guide, agricultural prescription, or economic prescription. Real decisions require domain specialists (Q-graders, agronomists, food scientists, supply-chain economists)."

# ── §1 SCA cupping protocol and quality grading ───────────────────────

@D dom_sca_cupping := "SCA cupping protocol — 100-point Q-grade system" :: domain [ok]
  institution = "Specialty Coffee Association (SCA) — formed by merger of SCAA (Specialty Coffee Association of America) and SCAE (Specialty Coffee Association of Europe) in 2017. Sets the internationally used cupping (sensory evaluation) protocol for green and roasted coffee."
  scoring = "100-point scale; coffees scoring ≥80 points qualify as 'specialty grade'; scores 90+ are considered 'outstanding'. Score reflects panelist consensus, not an objective instrument readout."
  attributes = "Ten scored attributes (SCA institutional protocol): (1) Fragrance/Aroma — dry and wet nose; (2) Flavor — the primary impression; (3) Aftertaste — length and quality of finish; (4) Acidity — brightness and quality; (5) Body — tactile weight and texture; (6) Balance — integration of the above; (7) Uniformity — consistency across 5 cups in the flight; (8) Clean Cup — absence of defects; (9) Sweetness — perceptible sweetness; (10) Overall — holistic impression (this is NOT a sum of the others but a holistic adjustment)."
  q-grader = "Q-Grader certification programme (licensed by Coffee Quality Institute, CQI) trains professional cuppers to apply the SCA protocol reproducibly."
  honesty = "10 attributes are an institutional protocol choice — they reflect practitioner consensus on perceptually separable dimensions, not a mathematically derived count. The number 10 coincides with the familiar decimal scale; it is not lattice-derived (see [@n6_honest_stance])."
  |> "[@x_sca_cupping] · [@x_lingle_1996]"

@D dom_defect_grading := "green-bean defect grading (SCA and ICO standards)" :: domain [ok]
  primary-defects = "Category-1 (primary) defects in SCA green-coffee classification: full black / full sour / pod / fungus-damaged / foreign matter / severe insect damage. Any single category-1 defect disqualifies specialty grade."
  secondary-defects = "Category-2 (secondary) defects include partial black / partial sour / floater / immature / withered / shell / broken / small sour / hull/husk / slight insect damage. Counted by defect-equivalent weighting."
  specialty-threshold = "Specialty-grade green coffee: 0 category-1 defects; fewer than 5 category-2 defects per 350 g sample."
  honesty = "Defect count thresholds are institutional SCA standards calibrated by industry consensus — not lattice-derived numbers."
  |> "[@x_sca_cupping] · [@x_lingle_1996]"

# ── §2 Brewing control chart — extraction yield and TDS ──────────────

@D dom_brewing_control := "brewing control chart — extraction yield × TDS" :: domain [ok]
  origin = "The 'Coffee Brewing Control Chart' traces to E.E. Lockhart's institutional research at MIT / NCA (National Coffee Association) in the 1950s–1960s. Lockhart's foundational work mapped extraction yield vs TDS vs trained-panel preference. The SCAA 'Coffee Brewing Handbook' formalised this framework for industry."
  extraction-yield = "Extraction yield (%) = mass of dissolved solubles extracted / mass of dry coffee used × 100. Practical measurement via TDS refractometry + known brew ratio. SCAA/SCA consensus optimal zone: ~18–22% — calibrated by sensory preference panels, not by a physical optimum."
  tds = "TDS (Total Dissolved Solids) for filter / drip: ~1.15–1.45% (11.5–14.5 g/L) in the SCA optimal zone. Measured by refractometer (expressed as Brix, converted to TDS by a coffee-specific constant)."
  under-extraction = "Below ~18% yield: sour, salty, thin — organic acids extracted first, balancing sweetness / bitterness not yet solubilised."
  over-extraction = "Above ~22% yield: bitter, astringent, hollow — chlorogenic-acid degradation products, phenolics, and high-molecular-weight bitters over-extracted."
  grind-temp-ratio-time = "The four principal brewing variables interact: grind size (surface area), water temperature, brew ratio (coffee:water mass), and contact time. Changing one requires compensating adjustment in others to stay in the optimal window."
  honesty = "18–22% and 1.15–1.45% TDS are empirically sensory-calibrated guidelines, not physical or mathematical invariants. Different beverage formats (espresso, cold brew, Turkish coffee) have different optimal ranges. See [@lim_brew_window_empirical]."
  |> "[@x_lockhart_era] · [@x_rao_2008] · [@x_lingle_1996]"

@D dom_espresso_physics := "espresso extraction physics — pressure, contact time, TDS" :: domain [ok]
  pressure = "Standard espresso extraction pressure: ~9 bar (pump pressure at the group head, specified by INEI/Italian espresso standard and widely adopted by SCA). This is an engineering specification chosen for the extraction physics it enables, not a lattice value."
  contact-time = "Typical espresso extraction: ~25–30 seconds (first drop to last drop). Varies by dose, grind, machine, barista intent. Shorter → under-extracted; longer → over-extracted. The 25–30 s window is a practitioner heuristic, not a fixed physical law."
  tds-espresso = "Espresso TDS: ~8–12% — roughly 10–15× higher solubles concentration than filter coffee. Suspended lipids and emulsified CO₂ (crema) are additional components not captured by refractometer TDS alone."
  dose-yield = "Espresso 'recipe' is typically expressed as a brew ratio: input coffee mass (dose, e.g. 18 g) and output beverage mass (yield, e.g. 36 g) — a 1:2 ratio commonly used in specialty espresso. This ratio is a practitioner convention, calibrated sensorially."
  grind-fineness = "Espresso requires fine grind (high surface area) to achieve adequate extraction in the short contact window under pressure. Particle distribution (not just median size) affects extraction evenness — a topic of current research (Weisz / Hendon era work)."
  vs-filter = "Compared to filter coffee: espresso uses ~20× higher solubles concentration, pressure vs gravity/vacuum, coarser-to-fine grind contrast, ~10–25× shorter contact time."
  honesty = "9 bar is an engineering/institutional specification. 25–30 s is a practitioner range. These numbers emerge from physics + sensory calibration, not mathematical derivation."
  |> "[@x_illy_viani_2005] · [@x_rao_2008]"

# ── §3 Roast chemistry deep-dive (COFFEE.tape has overview; this is distinct) ─

@D mech_strecker_degradation := "Strecker degradation — aroma precursor mechanism" :: mechanism [ok]
  definition = "Strecker degradation: α-amino acids react with α-dicarbonyl compounds (generated by Maillard browning) via oxidative deamination and decarboxylation → Strecker aldehydes + aminoketones. Named after Adolph Strecker (19th c. organic chemistry origin of the name)."
  key-compounds = "Strecker aldehydes formed from key coffee amino acids: methional (from methionine — cooked potato / sulphurous), phenylacetaldehyde (from phenylalanine — honey, rose), 2-methylbutanal + 3-methylbutanal (from isoleucine/leucine — malty, cocoa)."
  importance = "Strecker aldehydes are major contributors to coffee aroma alongside pyrazines (Maillard) and phenols (chlorogenic-acid pyrolysis). Their relative contribution shifts with roast degree and temperature profile."
  |> "[@x_belitz_2009] · [@x_flament_2002]"

@D mech_volatile_profile := "coffee volatile profile — >800 identified aroma compounds" :: mechanism [ok]
  count = "More than 800 volatile compounds have been identified in roasted coffee aroma (estimate from Flament 2002 and subsequent LC-MS/GC-MS studies); not all are sensorially relevant — odour-active compounds number in the dozens to low hundreds."
  key-classes = "Furans (furfural, 2-furfuryl alcohol — caramel-like); pyrazines (2-methylpyrazine, 2,3-diethylpyrazine — nutty, roasty); aldehydes (Strecker + others); ketones (acetoin, diacetyl — buttery); phenols (guaiacol, 4-vinylguaiacol — smoky, clove-like); thiols (furfurylthiol — roasted, sulphurous at trace); lactones."
  threshold-dependence = "Perceptual salience is detection-threshold dependent: furfurylthiol has an extremely low odour threshold (~ppb range) so its trace concentration is disproportionately impactful — mass-spectrometry concentration alone does not rank aroma contribution."
  honesty = "The >800 figure is from the volatile-chemistry literature (Flament 2002 era); exact counts vary by analytical method and roast degree. Not lattice-derived."
  |> "[@x_flament_2002] · [@x_belitz_2009]"

@D mech_cga_degradation := "chlorogenic acid (CGA) degradation during roasting" :: mechanism [ok]
  starting-material = "Chlorogenic acids (CGAs) — predominantly caffeoylquinic acids (CQAs, e.g. 5-CQA = chlorogenic acid sensu stricto) — are major green-bean phenolics (~6–12% DW arabica, higher in robusta)."
  roasting-products = "CGA thermolysis during roasting yields: quinic acid + caffeic acid (primary hydrolysis products); further dehydration/cyclization → quinides (bitter taste-active); caffeic acid → 4-vinylguaiacol + CO₂ (decarboxylation — phenolic aroma); quinic acid → volatile phenols and furans."
  bitterness = "CGA-derived quinides and chlorogenic-acid lactones are significant contributors to roasted-coffee bitterness alongside caffeine. Dark roasts deplete residual CGA but accumulate more quinides — net bitterness is not monotonically lower with darker roast."
  light-roast-antioxidant = "Light-roast coffee retains higher CGA content and thus higher in-cup antioxidant capacity than dark roast — a real chemical consequence of roast degree, not a lattice-derived performance claim."
  |> "[@x_farah_2006] · [@x_illy_viani_2005] · [@x_belitz_2009]"

@D mech_trigonelline_pyridines := "trigonelline pyrolysis → niacin + pyridines" :: mechanism [ok]
  trigonelline = "Trigonelline (1-methylnicotinic acid / N-methylpyridinium-3-carboxylic acid) is a major alkaloid in green arabica (~1% DW). Biosynthetically related to niacin (vitamin B3)."
  pyrolysis = "At roasting temperatures (>170°C): trigonelline undergoes demethylation and decarboxylation → niacin (nicotinic acid) + CO₂ + a series of pyridine volatiles."
  aroma-contribution = "Pyridines formed include: pyridine (earthy, roasty), 1-methylpyridinium, and nicotinamide — minor contributors to the roast-aroma bouquet."
  niacin-formation = "Roasting is a primary source of niacin in coffee; dark roast converts more trigonelline to niacin. Brewed coffee is a meaningful dietary niacin source in populations with high coffee consumption."
  |> "[@x_farah_2006] · [@x_belitz_2009]"

# ── §4 Sensory science — evaluation frameworks ────────────────────────

@D dom_sensory_science := "sensory evaluation — Lawless & Heymann framework" :: domain [ok]
  framework = "Sensory Evaluation of Food: Principles and Practices — Lawless HT, Heymann H (2nd ed. Springer, 2010). Standard academic reference for food sensory methodology: discriminative tests (triangle, duo-trio), descriptive analysis, affective/hedonic testing."
  trained-panel = "Descriptive sensory analysis with trained panels: panelists calibrated on reference standards; attribute intensity rated on structured scales; statistical analysis (ANOVA, multivariate) separates product differences from panelist noise."
  consumer-panel = "Hedonic / affective testing (consumer preference): untrained panelists; uses 9-point hedonic scale or best-worst scaling; captures preference, not analytical description."
  relevance = "Specialty coffee Q-grader cupping is a specialised trained-panel protocol — closer to descriptive analysis than hedonic. SCA cupping scores combine trained-panel descriptor agreement with attribute intensity."
  |> "[@x_lawless_heymann_2010]"

@D dom_flavor_wheel := "SCA Coffee Flavor Wheel (revised 2016)" :: domain [ok]
  history = "Coffee flavor wheel developed originally by SCAA (Ted Lingle era, 1995); substantially revised and expanded in 2016 by SCA in collaboration with World Coffee Research (WCR), grounded in formal sensory science (using the WCR Sensory Lexicon to anchor descriptors in validated references)."
  structure = "Three tiers: (1) outer rim — specific descriptors (e.g. 'jasmine', 'black currant', 'cedar'); (2) middle ring — categories (e.g. 'floral', 'fruity', 'roasted'); (3) inner ring — high-level groups (e.g. 'sweet', 'nutty/cocoa', 'spices'). Colour-coded by group."
  use = "Wheel provides a controlled vocabulary for cupping communication and panel calibration; anchored descriptors reduce inter-panelist variability."
  honesty = "The number of top-level groups and middle-tier categories on the 2016 wheel are institutional design choices grounded in sensory taxonomy, not lattice-derived. Not all categories carry equal weight in any given cup."
  |> "[@x_sca_flavor_wheel_2016] · [@x_lawless_heymann_2010]"

@D dom_olfaction := "orthonasal vs retronasal olfaction in coffee perception" :: domain [ok]
  orthonasal = "Orthonasal: sniffing aroma directly from the cup before drinking (Fragrance: dry grounds; Aroma: wet/brewed). SCA cupping protocol explicitly separates orthonasal evaluation (fragrance/aroma scored from sniffing) from in-mouth retronasal."
  retronasal = "Retronasal: volatile compounds migrate from the mouth/pharynx to the olfactory epithelium during eating/drinking and after swallowing. Most of what we colloquially call 'flavour' is retronasal olfaction, not taste (tongue)."
  taste = "Taste (gustation via taste buds): acidity (H⁺ and titratable acids — malic, citric, acetic, quinic), bitterness (caffeine + quinides + chlorogenic-acid derivatives), sweetness (residual sugars + glycols), saltiness (minerals — minor), umami (glutamate from protein degradation — minor)."
  aftertaste = "Aftertaste (finish) = the retronasal + taste sensation that persists after swallowing. High-quality coffee: long, pleasant, clean aftertaste. Defective: short or off-note (astringent, sour, medicinal)."
  |> "[@x_lawless_heymann_2010] · [@x_shepherd_2012]"

# ── §5 Decaffeination processes ───────────────────────────────────────

@D dom_decaffeination := "decaffeination — process overview" :: domain [ok]
  why = "Decaffeination removes the majority of caffeine (target: <0.1% residual caffeine DW by EU standard; <0.1% by most regulatory frameworks) while preserving flavour. Applied to green beans before roasting."
  challenge = "Caffeine is polar and water-soluble; chlorogenic acids, sucrose, and other flavour precursors are also polar and water-soluble. Selective removal of caffeine without co-extracting flavour precursors is the technical challenge."
  |> "[@x_belitz_2009] · [@x_ramirez_2019]"

@D mech_swiss_water := "Swiss Water Process (SWP) — water + activated carbon" :: mechanism [ok]
  principle = "Soaking green beans in hot water extracts caffeine and flavour compounds into solution (a 'green coffee extract' or GCE). The extract is then passed through activated-carbon filters sized to adsorb caffeine molecules while allowing smaller/larger molecules (flavour compounds) to pass — yielding 'flavour-charged water' (FCW) that is saturated in flavour molecules but depleted in caffeine."
  recycling = "The FCW is reused as the solvent for the next batch of green beans: because FCW is already saturated in flavour compounds, it cannot extract further flavour from the fresh beans — only caffeine migrates out. Cycle repeats until caffeine is below the regulatory threshold."
  advantage = "No organic solvent involved; certified organic-compatible; proprietary to Swiss Water Decaffeinated Coffee Company (operated in Burnaby, BC, Canada)."
  residual = "Typically achieves 99.9%+ caffeine removal."
  |> "[@x_belitz_2009] · [@x_ramirez_2019]"

@D mech_co2_decaf := "supercritical CO₂ decaffeination" :: mechanism [ok]
  principle = "CO₂ above its critical point (Tc ≈ 31°C, Pc ≈ 74 bar) becomes a supercritical fluid: density intermediate between gas and liquid; caffeine dissolves selectively (caffeine is more soluble in scCO₂ than most chlorogenic acids)."
  selectivity = "scCO₂ is relatively selective for caffeine vs flavour precursors, making it the preferred industrial method for preserving specialty-grade green bean character."
  advantage = "No solvent residue (CO₂ is gaseous at ambient conditions); high selectivity; recyclable CO₂. Capital cost is high (pressure vessels)."
  |> "[@x_ramirez_2019] · [@x_belitz_2009]"

@D mech_solvent_decaf := "solvent-based decaffeination (methylene chloride / ethyl acetate)" :: mechanism [ok]
  methylene-chloride = "Dichloromethane (DCM / methylene chloride): pre-moistened green beans soaked in DCM; DCM selectively dissolves caffeine; solvent removed by steam/evaporation. EU: maximum 2 mg/kg DCM residue in finished roasted coffee (well below toxicological concern at dose, but regulatory oversight exists)."
  ethyl-acetate = "Ethyl acetate (EA) — sometimes marketed as 'naturally processed' (EA occurs naturally in fermentation); similar solvent-extraction mechanism. Lower boiling point than DCM."
  honesty = "Solvent-based processes are regulated, widely used for commercial-grade decaf. Residual levels are well below toxicological thresholds under regulatory frameworks. Specialty segment tends to prefer SWP or scCO₂ for flavour-quality reasons."
  |> "[@x_belitz_2009] · [@x_ramirez_2019]"

# ── §6 Climate-economics deep-dive (cross-link COFFEE.tape §7) ────────

@D dom_arabica_climate_crosslink := "arabica narrow climate envelope — cross-link COFFEE.tape" :: domain [ok]
  cross-link = "COFFEE.tape [@lim_climate_envelope] (Bunn et al 2015, Climatic Change 129:89–101) establishes the foundational arabica climate constraint: optimal mean annual temperature ~18–21°C; projected area loss under warming scenarios."
  this-tape-scope = "This entry adds the specialty-quality and economic dimensions of that climate limit (not duplicating COFFEE.tape biology)."
  elevation-quality = "High-elevation growing environments (typically >1200 m for quality arabica, with 1500–2200 m producing most high-scoring specialty lots) provide lower mean temperatures and larger diurnal swings — slower bean development → denser bean, higher sugar and acid complexity. Climate change compresses the viable altitude band upward."
  migration-limit = "Upward migration of arabica cultivation has a hard ceiling: land above ~2500–3000 m in most origin regions is not available or is ecologically constrained (protected forest). Horizontal geographic migration faces soil, infrastructure, and social barriers."
  |> "[@x_bunn_2015] · [@x_davis_2011_coffee]"

@D dom_c_market := "green coffee C-market price volatility" :: domain [ok]
  c-market = "The 'C price' refers to the ICE (Intercontinental Exchange) arabica coffee futures contract — the global benchmark price. Robusta trades on the Euronext LIFFE (London). C-market price is denominated in US cents per pound."
  volatility = "Coffee is one of the most traded and most volatile agricultural commodities. C-market price has ranged from below 50 c/lb (historic lows, e.g. 2001–2002 global oversupply crisis) to above 300 c/lb (supply shocks, e.g. Brazil frosts/droughts). This is extreme volatility relative to most agricultural commodities."
  specialty-premium = "Specialty-grade coffees trade at premiums above the C price — but the C price sets the floor for all coffees and depresses specialty premiums during sustained low-C periods when commodities flood the market."
  |> "[@x_daviron_ponte_2005] · [@x_ico_reports]"

@D dom_trade_models := "Fairtrade, direct trade, and smallholder margin models" :: domain [ok]
  fairtrade = "Fairtrade International certification: guaranteed minimum price floor (e.g. $1.40/lb floor for washed arabica, with Fairtrade premium on top for cooperative social funds — specific floor values subject to periodic review by FLO). Targets smallholder cooperatives; requires certified supply chain."
  direct-trade = "Direct trade (not a certification — a relationship model): buyer sources directly from farm or cooperative, bypassing broker/import layers; can yield higher farmgate prices and quality-driven pricing. Transparency varies; no universal standard or audit."
  smallholder-share = "Studies on price transmission show that even at C-market peaks, farm-gate prices represent a minority fraction of consumer retail price. Daviron & Ponte (2005) analysed the 'coffee paradox' — roaster-country value capture vs producer-country income stagnation."
  honesty = "Specific floor prices and premium amounts change over time; cited here as model architecture (how pricing is structured), not as a fixed current number. See [@x_daviron_ponte_2005] for structural analysis."
  |> "[@x_daviron_ponte_2005] · [@x_ico_reports]"

@D dom_coffee_waste := "coffee waste valorisation — spent grounds, silverskin, cascara" :: domain [ok]
  scale = "Coffee processing generates large volumes of waste by-product. Wet processing: coffee pulp (mesocarp) and wastewater are major effluent streams. Dry processing: dried husks/hulls. Roasting and brewing: spent coffee grounds (SCG)."
  spent-grounds = "SCG: the largest spent-product stream by volume in consumer markets. Rich in dietary fibre, residual lipids (including cafestol/kahweol diterpenoids), phenolics (residual CGA), and proteins. Bioactive compound recovery from SCG is an active research area (antioxidant extracts, dietary fibre, bioenergy feedstock — Bondesson era / Murthy & Naidu 2012 era)."
  silverskin = "Silverskin (testa / spermoderm): fine chaff shed during roasting from the bean surface. Rich in dietary fibre and polyphenols; small volume; used as horticultural amendment or dietary supplement."
  cascara = "Cascara (from dried coffee cherry skins/pulp — 'qishr' in Yemen, 'sultana' in Bolivia): infused as a tea-like beverage; contains caffeine (lower than brewed coffee), CGAs, and fruit acids. Growing specialty-market interest."
  honesty = "Waste valorisation applications are at various TRL levels — some commercial (SCG in mushroom substrate, bioenergy), others at research stage. No fabricated commercialisation claims."
  |> "[@x_murthy_naidu_2012] · [@x_farah_2006]"

# ── §7 Real-limits anchors ────────────────────────────────────────────

@D lim_brew_window_empirical := "brewing yield window is empirical, not physically optimal" :: real-limit [ok required]
  wall = "SOFT WALL (sensory-empirical calibration)"
  statement = "The 18–22% extraction-yield optimal window is calibrated by trained-panel preference from the Lockhart/SCAA era, refined by subsequent sensory studies. It is NOT a physical or mathematical optimum — different coffee varieties, roast degrees, water mineral profiles, and consumer populations shift the preferred window. Specialty espresso practitioners regularly extract outside this range deliberately."
  consequence = "The control chart is a calibration tool, not a law. Machine-learning and precision-extraction research (Hendon, Melrose era) has shown the relationship between grind particle distribution and sensory outcome is more complex than yield × TDS alone."
  |> "[@x_lockhart_era] · [@x_rao_2008]"

@D lim_cupping_subjectivity := "cupping subjectivity — panelist and protocol variability" :: real-limit [ok required]
  wall = "HARD WALL (inter-rater variability in sensory evaluation)"
  statement = "Even trained Q-graders using the SCA cupping protocol show measurable inter-panelist variability. Intra-panelist repeatability is higher than inter-panelist agreement, but absolute score differences of 1–3 points between different Q-graders on the same coffee lot are common. This is a fundamental limit of psychophysical measurement: sensory perception is host-intrinsic and culturally modulated."
  consequence = "A Q-grade score is a trained-consensus estimate with an implicit confidence interval, not a precise physical measurement. 'Specialty' (≥80) vs 'commodity' (<80) boundary calls near the threshold can differ by panelist."
  |> "[@x_lawless_heymann_2010] · [@x_sca_cupping]"

@D lim_climate_envelope := "arabica climate envelope — hard agro-climatic limit (cross-link COFFEE.tape)" :: real-limit [ok required]
  wall = "HARD WALL (agro-climatic — cross-link COFFEE.tape)"
  statement = "Cross-link: COFFEE.tape [@lim_climate_envelope] — Coffea arabica's narrow thermal optimum (~18–21°C mean annual temperature) is a real agro-climatic ceiling. See COFFEE.tape for full entry. This entry records the limit in COFFEE-SCIENCE.tape for completeness; science is in the sibling."
  |> "[@x_bunn_2015]"

@D lim_smallholder_economics := "price discovery + smallholder economics — structural soft wall" :: real-limit [ok required]
  wall = "SOFT WALL (economic/structural)"
  statement = "Specialty quality premiums are bounded by the C-market commodity floor and by the price-transmission inefficiency between consumer retail and farm-gate. Smallholder farmers (~60–70% of global production by ICO/FAO estimates) bear weather, pest, and price risk with limited capital to invest in quality-improving practices. This is a structural economic constraint, not a lattice parameter."
  consequence = "Even technically excellent specialty-coffee production does not guarantee farmer viability if the C-market crashes, production costs rise (labour, inputs, climate adaptation), and premium transmission is incomplete."
  |> "[@x_daviron_ponte_2005] · [@x_ico_reports]"

# ── §8 Governance — lattice stance ───────────────────────────────────

@F f_lattice_fit := "lattice-fit-on-coffee-science" :: governance [required deny:write]
  pattern = "Deriving specialty-coffee science quantities (SCA cupping attribute count, extraction yield %, TDS, espresso pressure bar, espresso time seconds, Q-grade score thresholds, decaffeination residual limits, trade-price values) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'espresso pressure = 9 bar because σ - n/φ' or 'cupping attributes = 10 because σ - φ'."
  why = "This is exactly the violation the pre-rewrite COFFEE-SCIENCE.tape committed — a 695-line lattice-tautology stub full of @D row_* with n_6 = σ, n_6 = τ, derivation claims, 'EXACT' assertions. hexa-bio AGENTS.tape @F f1 (lattice-fit-on-external-entity) + @D g1/g2 forbid it. COFFEE.tape @F f_lattice_fit already covers the general case; this entry covers the specialty-science-specific patterns."
  remedy = "Cite real specialty-coffee science sources (this tape's @X entries). Specialty coffee science has no natural n=6 invariant — see [@n6_honest_stance]. The lattice may only be a coincidental OBSERVATION, never a derivation."

@N n6_honest_stance := "specialty coffee science has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: specialty coffee science exposes NO natural n=6 invariant. The SCA cupping protocol has 10 scored attributes — 10 is an institutional count chosen for perceptual separability (coincidence with a decimal scale), not a lattice product. Espresso pressure is ~9 bar — an engineering specification for the extraction physics it enables, not σ - n/φ = 12 - 3. Optimal extraction yield is 18–22% — a sensory calibration window, not a lattice derivation. Espresso contact time is ~25–30 s — a practitioner heuristic. Q-grade specialty threshold is 80 points — an institutional calibration. Decaffeination residual target <0.1% DW — a regulatory limit. Arabica caffeine ~1.2–1.5% DW — plant biochemistry. None of these numbers arise from σ/τ/φ/J₂. They are food science empiricism, institutional convention, regulatory specification, and agro-economics. Per hexa-bio AGENTS.tape g1 (real-limits-first) and g2 (lattice-is-tool): the lattice is declined here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub."

# ── §9 Verifiable predictions ─────────────────────────────────────────

@D tp_1 := "TP-1 extraction yield and trained-panel preference" :: prediction [ok]
  claim = "Filter coffee extracted to 18–22% yield at 1.15–1.45% TDS scores higher on trained-panel sensory balance than matched-TDS comparators extracted below 16% or above 24%."
  falsifier = "If a properly controlled blind trained-panel study (≥20 panelists, replicated, balanced presentation) shows no systematic preference for the 18–22% zone over under/over-extracted comparators at matched TDS, the SCAA/SCA control-chart calibration is not reproducible at the declared yield boundaries."
  source = "[@x_lockhart_era] · [@x_rao_2008]"

@D tp_2 := "TP-2 scCO₂ decaf superior cup-character vs solvent decaf" :: prediction [ok]
  claim = "Blind cupping panel evaluating matched-origin beans decaffeinated by (a) supercritical CO₂ vs (b) methylene chloride solvent process will score (a) higher in cup clarity and aroma retention, controlling for roast profile."
  falsifier = "If a properly controlled blind study (same origin lot, matched roast, experienced panel) shows no significant cup-score difference between scCO₂ and solvent-processed decaf, the claimed flavour-preservation advantage of scCO₂ over solvent decaffeination is not practically significant at panel sensitivity."
  source = "[@x_ramirez_2019] (decaffeination process comparison era)"

@D tp_3 := "TP-3 arabica specialty area contraction with warming" :: prediction [ok]
  claim = "Under sustained +2°C mean warming relative to pre-industrial baseline, the fraction of current high-scoring specialty arabica growing area (>1500 m elevation, mean annual temp <21°C) suitable for quality production declines materially (>20% of current area) in the absence of upward elevation migration."
  falsifier = "If validated climate-crop models incorporating observed temperature trends through 2040 show that arabica specialty-growing area contraction is below 10% of 2000-era baseline under observed warming trajectories, the Bunn 2015 model projections were overstated."
  source = "[@x_bunn_2015] · [@x_davis_2011_coffee]"

# ── §10 Cross-links ───────────────────────────────────────────────────

@X x_coffee_tape := "COFFEE.tape (hexa-bio companion)" :: sibling-tape [active]
  path = "./COFFEE.tape"
  commit = "f714f7a"
  scope = "General coffee biology + chemistry SSOT: botany, arabica vs robusta, post-harvest processing, green-bean composition, roasting chemistry overview, caffeine pharmacology, climate sensitivity. COFFEE-SCIENCE.tape extends this with specialty-science, sensory, and economics depth — no duplication."

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). This tape complies: real specialty-coffee science, in-silico knowledge SSOT only, lattice declined as a derivation tool."

# ── §11 External citations (real, landmark literature) ────────────────
# Where a specific bibliographic detail is not asserted with confidence,
# the entry names the primary author + era only and says so explicitly.

@X x_sca_cupping := "SCA Cupping Protocols (institutional)" :: literature [active]
  ref = "Specialty Coffee Association (SCA). Cupping Protocols. Institutional standard. Available at: sca.coffee/research/protocols-best-practices. (100-point Q-grade system; 10 scored attributes; specialty threshold ≥80 points. Author/era: SCA institutional, current; previously SCAA prior to 2017 merger.)"

@X x_lingle_1996 := "Lingle TR 1996 — Coffee Cupping Handbook" :: literature [active]
  ref = "Lingle TR. The Coffee Cupping Handbook: A Systematic Guide to the Evaluation of Coffee's Flavor Quality. SCAA, 2nd ed., 1996. (foundational SCAA cupping protocol reference — Green Defect Grading; Q-grade scoring framework; primary author/era cited)"

@X x_lockhart_era := "Lockhart / NCA 1957–1960s — Coffee Brewing Handbook foundational work" :: literature [active]
  ref = "Lockhart EE. The soluble solids in beverage coffee as an index to cup quality. Coffee Brewing Center / NCA (National Coffee Association), Technical Publication No. 1, circa 1957. (foundational empirical work mapping extraction yield vs TDS vs trained-panel preference — basis of the Coffee Brewing Control Chart. Primary author/era; precise volume/page not asserted.)"

@X x_rao_2008 := "Scott Rao — Coffee Brewer's Handbook (era ~2008)" :: literature [active]
  ref = "Rao S. The Coffee Brewer's Handbook (self-published / SCAA editions, circa 2008). Practitioner reference synthesising SCA/SCAA brewing control chart methodology — extraction yield, TDS, optimal zone. (primary author/era; not an academic journal article — practitioner SSOT for brewing-control framework. Cross-reference from COFFEE.tape.)"

@X x_illy_viani_2005 := "Illy & Viani — Espresso Coffee (2nd ed.)" :: literature [active]
  ref = "Illy A, Viani R (eds). Espresso Coffee: The Science of Quality (2nd ed., Elsevier Academic, 2005). Comprehensive technical reference for espresso production science: bean composition, roasting, extraction, crema, pressure physics. (primary editors/era. Cross-reference from COFFEE.tape.)"

@X x_lawless_heymann_2010 := "Lawless & Heymann — Sensory Evaluation of Food (2nd ed.)" :: literature [active]
  ref = "Lawless HT, Heymann H. Sensory Evaluation of Food: Principles and Practices. 2nd ed. Springer, 2010. (standard academic reference for food sensory methodology: trained panels, discriminative tests, descriptive analysis, affective testing — primary authors/era)"

@X x_sca_flavor_wheel_2016 := "SCA / WCR Coffee Flavor Wheel 2016" :: literature [active]
  ref = "Specialty Coffee Association / World Coffee Research. Coffee Taster's Flavor Wheel. 2016 revision. Developed in partnership with WCR using the WCR Sensory Lexicon (reference-anchored descriptors). Available at: sca.coffee/research/coffee-tasters-flavor-wheel. (institutional authorship; substantially revised from original SCAA 1995 Lingle-era wheel)"

@X x_shepherd_2012 := "Shepherd 2012 — neurogastronomy / retronasal olfaction" :: literature [active]
  ref = "Shepherd GM. Neurogastronomy: How the Brain Creates Flavor and Why It Matters. Columbia University Press, 2012. (retronasal olfaction mechanism; flavour perception neuroscience — primary author/era)"

@X x_flament_2002 := "Flament 2002 — Coffee Flavor Chemistry" :: literature [active]
  ref = "Flament I. Coffee Flavor Chemistry. Wiley, 2002. (comprehensive reference for coffee volatile compounds: >800 identified; pyrazines, furans, thiols, aldehydes, ketones, lactones — primary author/era)"

@X x_belitz_2009 := "Belitz, Grosch & Schieberle — Food Chemistry (textbook)" :: literature [active]
  ref = "Belitz HD, Grosch W, Schieberle P. Food Chemistry (4th ed., Springer, 2009). Standard food-chemistry reference including roasting chemistry, Maillard and Strecker reactions, CGA degradation, trigonelline, decaffeination processes. (primary authors/era. Cross-reference from COFFEE.tape.)"

@X x_farah_2006 := "Farah & Donangelo 2006 — phenolic compounds" :: literature [active]
  ref = "Farah A, Donangelo CM. Phenolic compounds in coffee. Brazilian Journal of Plant Physiology 2006;18:23–36. (chlorogenic acids, caffeine, trigonelline — green and roasted bean composition. Cross-reference from COFFEE.tape.)"

@X x_ramirez_2019 := "Ramirez-Coronel et al 2019 / decaffeination review era" :: literature [active]
  ref = "Ramirez-Coronel MA et al. Review of the decaffeination process and its effects on coffee quality. (Review, primary author/era cited; specific journal/volume not asserted with certainty — decaffeination process comparison: Swiss Water, scCO₂, solvent methods, residual caffeine, flavour impact. See also: Belitz 2009 §decaffeination.)"

@X x_daviron_ponte_2005 := "Daviron & Ponte 2005 — The Coffee Paradox" :: literature [active]
  ref = "Daviron B, Ponte S. The Coffee Paradox: Global Markets, Commodity Trade and the Elusive Promise of Development. Zed Books, 2005. (C-market structure; value-chain analysis; price transmission; smallholder income vs consumer-country value capture — primary authors/era)"

@X x_ico_reports := "ICO (International Coffee Organization) — market reports" :: literature [active]
  ref = "International Coffee Organization (ICO). Annual Coffee Reports / Monthly Coffee Report / Sustainability of the Coffee Sector. Available at: ico.org. (institutional source for C-market price history, production volume statistics, smallholder fraction estimates — institutional author; specific report year not fixed)"

@X x_murthy_naidu_2012 := "Murthy & Naidu 2012 — spent coffee grounds valorisation" :: literature [active]
  ref = "Murthy PS, Naidu MM. Sustainable management of coffee industry by-products and value addition — a review. Resources, Conservation and Recycling 2012;66:45–58. (spent coffee grounds bioactive compounds, silverskin, cascara / coffee waste valorisation — primary author/era)"

@X x_bunn_2015 := "Bunn et al 2015 — arabica climate suitability" :: literature [active]
  ref = "Bunn C et al. A bitter cup: climate change profile of global production of Arabica and Robusta coffee. Climatic Change 2015;129:89–101. (modelled contraction of suitable arabica area under warming scenarios — cross-reference from COFFEE.tape)"

@X x_davis_2011_coffee := "Davis et al 2011 — wild Coffea arabica climate vulnerability" :: literature [active]
  ref = "Davis AP et al. Multiple Threaten Rare Wild Coffee Species Coffea (Rubiaceae) in Ethiopia. PLoS ONE 2011;6:e21158. (wild Coffea arabica climate-vulnerability assessment — cross-reference from COFFEE.tape)"
