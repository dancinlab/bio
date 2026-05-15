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
# URBAN-FARMING.tape — architecture-current (editable per v1.2)
# Event history → URBAN-FARMING.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "urban-farming" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · urban-farming substrate — urban agriculture + controlled-environment agriculture knowledge SSOT"
  brief = "Urban agriculture + CEA · n=6 NOT used as a derivation (honest) · explicit on what scales vs what doesn't"
  parent = "dancinlab/hexa-bio"
  sibling-log = "URBAN-FARMING.log.tape"
  scope = "in-silico urban-agriculture knowledge SSOT · NOT a farming-protocol / food-safety / regulatory / clinical claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see URBAN-FARMING.log.tape audit"

@N scope_disclaimer := "knowledge-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico urban-agriculture substrate. Figures (crop yield ranges, energy-cost fractions, nutrient concentrations) are paraphrased from published literature for modeling context ONLY — they are NOT a farming protocol, product recommendation, food-safety guarantee, or regulatory claim. Real decisions require local site assessment, agronomists, and jurisdiction-specific permits. Vertical farming is hype-prone: economic viability is currently limited to a narrow crop set (leafy greens, microgreens, specialty herbs); staple-crop vertical farming is NOT currently economical at scale."

# ── §1 Definitions & typology ─────────────────────────────────────────

@D def_urban_agriculture := "urban and peri-urban agriculture — typology" :: domain [ok]
  urban-agriculture = "The practice of growing, processing, and distributing food within or on the fringe of cities. Covers a spectrum from small household plots to commercial greenhouse complexes."
  peri-urban = "Agriculture on the rural–urban fringe, benefiting from proximity to urban markets; typically larger scale than in-city operations but outside urban-land-cost pressures."
  typology = [
    "rooftop gardens (soil or substrate on building roofs)",
    "community gardens and allotments (shared plots; UK allotment tradition dating to 19th century)",
    "vacant-lot reclamation / brownfield gardens",
    "indoor vertical farms / plant factories",
    "greenhouse CEA (controlled-environment agriculture)",
    "aquaponics (fish + hydroponic plant production in recirculating system)",
    "urban orchards and agroforestry",
    "balcony / windowsill growing"
  ]
  fao-context = "FAO Urban Food Agenda (2019) frames urban food systems as a food-security and sustainability lever for a world that is >55% urban (2018 UN estimate; projected >68% by 2050)."
  |> "[@x_fao_urban_food_agenda]"

@D def_cea := "controlled-environment agriculture (CEA)" :: domain [ok]
  definition = "CEA = production in enclosed structures where temperature, humidity, light, CO₂, nutrients, and pest pressure are actively controlled, decoupling crop growth from outdoor climate."
  spectrum = "Greenhouses (passive solar + supplemental heat/light) at one end; fully indoor plant factories with artificial lighting (PFAL) at the other."
  plant-factory = "A fully controlled, multi-layer indoor system relying entirely on artificial light (LED or fluorescent); no reliance on sunlight. Highest control, highest operating cost, typically shortest crop cycles for leafy greens."
  |> "[@x_kozai_2022]"

@D def_vertical_farming := "vertical farming — concept and origin" :: domain [ok]
  concept-origin = "Popularised by Dickson Despommier's 2010 book 'The Vertical Farm' (Columbia University professor; concept developed from 1999 teaching exercises). The term and mainstream public discourse flow from this work."
  meaning = "Multi-story or stacked-shelf indoor crop production, maximising yield per unit of floor area (land area is replaced by energy for lighting). Often equated with plant-factory / PFAL CEA."
  honesty = "Despommier's 2010 book is a visionary-concept text; subsequent peer-reviewed literature on CEA economics was more sobering (see [@lim_energy_economics] + [@lim_crop_scope])."
  |> "[@x_despommier_2010]"

# ── §2 Hydroponics — systems and nutrient solutions ───────────────────

@D mech_hydroponics := "hydroponics — soilless culture systems" :: mechanism [ok]
  definition = "Growing plants in nutrient solution without soil; roots are supported by inert substrate (rockwool, perlite, coco coir, clay pebbles) or suspended directly in solution or mist."
  nft = "Nutrient film technique (NFT): a thin stream of nutrient solution flows continuously over bare roots in sloped channels; roots are partially exposed to air above the film. Developed and characterised by Allen Cooper in the UK, ~1970s (Cooper 1979 era)."
  dwc = "Deep water culture (DWC): plant roots are suspended in oxygenated nutrient solution; airstones maintain dissolved oxygen to prevent hypoxia."
  drip-systems = "Nutrient solution delivered by emitters to substrate-rooted plants; run-to-waste or recirculating variants; widely used for tomatoes and cucumbers in commercial greenhouse production."
  ebb-flow = "Ebb-and-flow (flood and drain): growing trays periodically flooded then drained to oxygenate roots; used in propagation and small-scale indoor systems."
  hoagland = "Standard reference nutrient solution formulated by Hoagland & Arnon (~1933–1938); provides all essential macro- and micronutrients in defined ionic form. The Hoagland solution is a research and teaching standard, widely adapted for commercial formulation."
  |> "[@x_hoagland_arnon_1950] · [@x_cooper_1979]"

@D mech_nutrient_solution := "nutrient solution management" :: mechanism [ok]
  parameters = "EC (electrical conductivity, proxy for total dissolved salts/nutrient concentration), pH (controls nutrient ion speciation and availability — optimal ≈5.5–6.5 for most crops), dissolved oxygen, temperature."
  recirculating = "Recirculating systems capture and re-dose unused solution; reduce water and fertiliser waste but require monitoring for ion imbalance and pathogen accumulation (Pythium, etc.)."
  ph-buffering = "pH drifts upward as plants take up anions (NO₃⁻, H₂PO₄⁻) and release OH⁻/HCO₃⁻; acid dosing (HNO₃, H₃PO₄) or CO₂ injection counteracts drift."
  honesty = "Optimal EC and pH windows are crop- and growth-stage-specific; figures quoted in extension literature are ranges, not universal constants."
  |> "[@x_hoagland_arnon_1950] · [@x_kozai_2022]"

# ── §3 Aeroponics and aquaponics ──────────────────────────────────────

@D mech_aeroponics := "aeroponics — root-zone misting" :: mechanism [ok]
  definition = "Plant roots are suspended in air in a dark chamber; nutrient solution is misted directly onto root surfaces at high frequency (high-pressure systems: ≤50 µm droplet, cycles every few seconds to minutes)."
  advantages = "Maximum root-zone oxygenation; very low water use per kg of produce; faster growth rates reported for some crops vs NFT/DWC."
  challenges = "Nozzle clogging; power-outage sensitivity (roots dry rapidly); higher capital cost per unit area than NFT."
  research-use = "Used extensively in potato mini-tuber seed production (FAO-promoted aeroponic seed-potato programs in sub-Saharan Africa and Asia)."
  |> "[@x_kozai_2022]"

@D mech_aquaponics := "aquaponics — fish + plant integration" :: mechanism [ok]
  definition = "Recirculating aquaculture system (RAS) coupled to hydroponic plant production: fish waste → bacterial nitrification (ammonia → nitrite → nitrate) → plant nutrient uptake → clean water returned to fish."
  nutrient-cycle = "Ammonia excreted by fish is converted by Nitrosomonas (NH₃ → NO₂⁻) and Nitrobacter/Nitrospira (NO₂⁻ → NO₃⁻); plants assimilate NO₃⁻ and other nutrients, reducing the water's nutrient load."
  ratios = "Fish:plant area ratios and stocking densities are system- and species-specific; no universal lattice constant — they are determined by fish excretion rates, plant uptake, and bacterial capacity."
  common-systems = "Coupled (continuous flow) vs decoupled (separate hydraulics, more design flexibility) systems. Common fish: tilapia (high temperature tolerance, robust), perch, trout (lower temperatures)."
  cross-link = "Detailed fish-production biology → AQUACULTURE.tape (sibling)"
  |> "[@x_lennard_2012]"

# ── §4 CEA lighting — LEDs and plant photobiology ─────────────────────

@D mech_cea_lighting := "LED-based plant lighting in CEA" :: mechanism [ok]
  par = "Photosynthetically active radiation (PAR): 400–700 nm. Plants primarily absorb red (≈640–680 nm) and blue (≈430–460 nm) for photosynthesis; far-red (700–800 nm) affects phytochrome-mediated morphology and Emerson enhancement."
  led-adoption = "Narrow-band red + blue LEDs were characterised for plant-factory use in the early LED-plant-lighting era (Massa et al. 2008 era — NASA-affiliated research on sole-source LED lighting for spaceflight food production). Full-spectrum white LEDs and tunable multi-channel LED luminaires subsequently became practical for commercial CEA."
  dli = "Daily light integral (DLI = mol photons m⁻² d⁻¹) is the agronomically relevant metric for plant-factory scheduling; target DLI is crop- and growth-stage-specific."
  photoperiod = "Daylength manipulation (long-day, short-day, day-neutral induction) is uniquely controllable in a fully indoor system — enables year-round flowering induction independent of season."
  cost-reality = "Electricity for lighting is the dominant cost in sole-source CEA (see [@lim_energy_economics]). LED efficacy has improved substantially (µmol/J), but the biophysical limit is the thermodynamic efficiency of photon conversion to PAR — further gains are bounded."
  |> "[@x_massa_2008] · [@x_kozai_2022]"

# ── §5 What works economically (crop scope) ───────────────────────────

@D dom_crop_scope_success := "crops that work economically in vertical farms (currently)" :: domain [ok]
  leafy-greens = "Lettuce, baby-leaf spinach, arugula, pak choi — short cycle (25–40 days), high value/kg for premium fresh-cut market, low canopy height enabling dense multi-layer stacking. The commercial backbone of the indoor-farming industry."
  herbs = "Basil, cilantro, chives, dill — high $/kg; fast turnover; aroma/volatile degradation in long supply chains makes local CEA production a real quality advantage."
  microgreens = "Cotyledon-stage seedlings (sunflower, pea, radish, brassica, etc.); very short cycles (7–14 days); very high $/kg in specialty food markets; small system footprint."
  strawberries = "Higher-value berry with some successful vertical-farm implementations (shorter supply-chain benefit for a perishable crop); economics more marginal than leafy greens."
  specialty-pharma = "Medicinal/cosmetic-crop plants with very high $/kg (e.g. specialty compounds, seed-production systems) can justify CEA economics; each crop requires individual business-case validation."
  rationale = "Common drivers: short cycle time, high $/kg, perishability advantage from local production, low canopy height allowing stacking, premium freshness differentiation."
  |> "[@x_avgoustaki_xydis_2020] · [@x_kozai_2022]"

@D dom_crop_scope_uneconomical := "crops that do NOT currently work economically in vertical farms" :: domain [ok required]
  staples = "Cereals (wheat, rice, maize), root crops (potato, cassava, carrot, beet), pulses (soybean, dry bean) — all face the same structural barrier: very low $/kg on commodity markets combined with long growth cycles, high canopy heights (cereals), and high water/area demand."
  energy-math = "Wheat: ~120 days cycle, grain $/kg far below the electricity cost of sole-source lighting for that cycle. The unit economics simply do not close without a radical drop in electricity cost that has not yet occurred."
  tomato-complexity = "Tomatoes and cucumbers are economic in greenhouse CEA (supplemental light + solar) at commercial scale in northern latitudes, but rarely in fully sole-source vertical farms — energy economics are marginal even for these higher-value crops."
  honest-summary = "The 'vertical farms will grow all our food' narrative (prominent in popular media 2010–2020 era) is not supported by the current crop-economics literature. Leafy greens are the success category; staples are not a realistic near-term target without structural cost changes."
  |> "[@x_avgoustaki_xydis_2020] · [@x_despommier_2010]"

# ── §6 Food-security context and community food systems ───────────────

@D dom_food_security := "urban food security and the FAO Urban Food Agenda" :: domain [ok]
  fao-framework = "FAO's Urban Food Agenda (2019) identifies urban agriculture as one component of urban food-system resilience — alongside retail access, supply-chain logistics, and waste reduction."
  food-deserts = "Food deserts — areas (often low-income urban neighbourhoods) with limited access to affordable fresh produce — are a documented public-health concern in the United States and other high-income countries; research on the causal link between food-desert geography and diet quality is ongoing, with mixed findings on intervention effectiveness."
  community-gardens = "Community gardens and urban allotments provide social, health, and supplementary nutritional benefits in addition to produce; the scale of food production is typically supplementary (not replacing household food budgets) but the co-benefits are documented."
  equity-honesty = "Urban farming projects, especially commercial vertical farms, tend to produce premium-priced produce — accessibility for low-income residents is not automatic. Policy design matters."
  |> "[@x_fao_urban_food_agenda]"

# ── §7 Soil quality and contamination in urban gardens ────────────────

@D dom_urban_soil := "urban soil — heavy-metal legacy and contamination" :: domain [ok]
  issue = "Urban soils are frequently contaminated by historical land use: industrial sites, roads (tyre dust, exhaust), leaded paint (pre-1978 US ban; similar bans in other countries, varying dates), leaded gasoline (phased out progressively through 1970s–2000s globally)."
  lead = "Lead (Pb) is the primary heavy-metal concern in residential urban soils in countries with a leaded-gasoline/paint legacy. Pb is immobile in neutral-to-alkaline soils but bioavailable at low pH; accumulates near foundations and roadsides."
  testing = "Soil testing for Pb, As, Cd, and other heavy metals is recommended before establishing in-ground urban food gardens, especially for root crops and leafy greens (which concentrate metals)."
  mitigation = "Options include raised beds with clean fill soil, geotextile barriers, pH adjustment (raises Pb sorption), and crop selection (fruiting crops like tomatoes absorb less Pb than leafy greens or roots)."
  hydroponics-advantage = "Hydroponic and soilless CEA systems sidestep urban soil contamination entirely — a genuine advantage over in-ground urban growing for contaminated sites."
  |> "[@x_brown_chaney_2011]"

# ── §8 Urban beekeeping and pollinators ───────────────────────────────

@D dom_pollinators := "pollinator-friendly urban landscaping and urban beekeeping" :: domain [ok]
  pollinator-context = "Urban green spaces (gardens, parks, green roofs) can support bee and other pollinator populations, with studies documenting comparable or higher honeybee foraging diversity in urban vs some agricultural landscapes (due to monoculture reduction)."
  urban-beekeeping = "Urban beekeeping (Apis mellifera) has grown substantially in cities since the 2000s. Cross-link: APICULTURE.tape (sibling) for detailed bee biology and hive management."
  relevance = "For outdoor urban food gardens and rooftop gardens relying on open pollination (tomatoes, squash, herbs), proximity to pollinators is relevant. Fully enclosed CEA systems use vibration pollination (tomatoes) or are self-pollinating crops (leafy greens) — outdoor pollinators are not a production input."
  cross-link = "Detailed apiculture science → APICULTURE.tape (sibling)"

# ── §9 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_energy_economics := "vertical-farm energy economics — dominant operating cost" :: real-limit [ok required]
  wall = "SOFT WALL (techno-economic — improving but not yet resolved for staples)"
  statement = "In sole-source CEA (no sunlight input), electricity for lighting and HVAC is typically the dominant operating cost — commonly estimated at 25–40% of total operating cost, with some analyses placing it higher for high-DLI crops. Without access to cheap, low-carbon electricity, indoor vertical farming has a larger carbon footprint per kg of produce than field production for high-water-consumption crops."
  implication = "Vertical farms are NOT inherently more climate-positive than field agriculture unless powered by low-cost renewable electricity. The economics hinge on electricity price + carbon intensity + premium produce price. The hype of 2010s 'zero-mile' sustainability claims requires this qualification."
  source-basis = "Review of CEA energy economics literature (Avgoustaki & Xydis 2020 era — primary-author/era cited, representative of the peer-reviewed energy-analysis literature on vertical farming; exact journal volume not asserted beyond author/era)."
  |> "[@x_avgoustaki_xydis_2020]"

@D lim_crop_scope := "crop-scope economic barrier — staples remain uneconomical" :: real-limit [ok required]
  wall = "HARD WALL (current techno-economics)"
  statement = "Cereal grains, root crops, and most pulses cannot be grown profitably in sole-source indoor vertical farms at current electricity prices. The unit economics require a commodity price ($/kg) that is orders of magnitude higher than what global grain markets bear. No route to cost parity exists without a step-change reduction in lighting electricity cost or a dramatic rise in staple-crop market prices."
  consequence = "Vertical farming cannot feed the world's staple caloric demand under current economics. Claims that it can are not supported by techno-economic analysis. The industry's current viability depends on leafy-green premium markets."
  |> "[@x_avgoustaki_xydis_2020] · [@x_kozai_2022]"

@D lim_urban_land := "urban land economics" :: real-limit [ok required]
  wall = "HARD WALL (economic geography)"
  statement = "Urban land is priced orders of magnitude above agricultural land. In-ground urban farming competes economically with all other urban land uses (residential, commercial, infrastructure). Rooftop and vertical-farm land use partially decouples from this by stacking production area, but building-structure costs, load limits, and building-code compliance add capital costs absent in field production."
  consequence = "Urban agriculture's comparative advantage is not low production cost per kg — it is proximity to market (supply-chain savings, freshness), premium pricing, and social/community co-benefits. Cost-per-kg comparisons with field farming typically favour field farming substantially for most crops."
  |> "[@x_avgoustaki_xydis_2020]"

@D lim_soil_contamination := "soil contamination legacy in urban food gardens" :: real-limit [ok required]
  wall = "HARD WALL (for affected sites; site-specific)"
  statement = "Many urban sites carry heavy-metal contamination (Pb, As, Cd) from historical industrial use, leaded paint, and leaded gasoline. In-ground food production on such sites poses food-safety risk without remediation, which is costly. This is a real physical limit on in-ground urban farming in contaminated cities — not a recoverable cost advantage of urban farming."
  consequence = "Site soil testing before in-ground urban food production is not optional on legacy-contaminated sites. The contamination limit also argues for raised-bed or hydroponic systems as the default for urban contexts."
  |> "[@x_brown_chaney_2011]"

# ── §10 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-urban-farming" :: governance [required deny:write]
  pattern = "Deriving urban-farming quantities (nutrient counts, crop-tier counts, LED-band counts, system types) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. '6 macronutrients because n=6' or '6 vertical-farm tiers because n=6' or '6-band spectrum because n=6'."
  why = "This is exactly the fabrication the pre-rewrite URBAN-FARMING.tape committed: the stub asserted 'Hoagland 6 macronutrients · 6 vertical-farm tiers · 6-band grow-LED spectrum' as if these were lattice connections, with zero real citations. hexa-bio AGENTS.tape @F f1 (lattice-fit-on-external-entity) + @D g1/g2 forbid derivation; observation is acceptable."
  remedy = "Cite real urban-farming / agronomy / CEA literature (this tape's @X entries). Numbers from science (Hoagland solution ions, LED spectral bands) arise from plant photobiology and crop-physiology research — not from σ/τ/φ/J₂. The lattice may only be a coincidental OBSERVATION, never a derivation."

@N n6_honest_stance := "urban farming has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: urban farming exposes NO natural n=6 invariant. The Hoagland nutrient solution contains multiple essential ions (not a fixed 'n=6' set — the number of macro-elements depends on definition and evolves with nutrition science). Vertical-farm tier counts are engineering choices. LED spectral bands are determined by plant photobiology (PAR 400–700 nm, with far-red extensions) — not by σ or τ. Hydroponic system typologies (NFT, DWC, drip, ebb-flow, aeroponics) are a practical engineering taxonomy, not a lattice partition. Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool) and LATTICE_POLICY: the lattice is DECLINED here as a derivation tool. This honesty is the corrective for the audited stub that claimed 'Hoagland 6 macronutrients · 6 vertical-farm tiers · 6-band grow-LED spectrum' as lattice connections."

# ── §11 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 LED vs fluorescent crop yield parity (CEA lighting)" :: prediction [ok]
  claim = "In a properly designed sole-source CEA trial, high-efficacy narrow-band red+blue LEDs produce comparable or superior fresh-weight yield for lettuce relative to equivalent DLI from fluorescent lamps, with lower electricity consumption per kg."
  falsifier = "If a controlled factorial trial under matched DLI shows no yield or electricity-consumption advantage for LEDs over fluorescent in lettuce CEA, the efficiency basis for LED adoption in plant factories is overstated."
  source = "[@x_massa_2008] (LED plant-lighting era research basis)"

@D tp_2 := "TP-2 staple crops uneconomical at current electricity prices" :: prediction [ok]
  claim = "A techno-economic analysis of wheat or rice grown in a sole-source vertical farm at retail electricity prices in a high-income country will show cost per kg (not counting capital amortisation) exceeding commodity grain price by at least an order of magnitude."
  falsifier = "If a peer-reviewed full techno-economic analysis shows wheat or rice sole-source vertical farming approaching commodity-grain economics without subsidies or breakthrough electricity costs, [@lim_crop_scope] and [@lim_energy_economics] need revision."
  source = "[@x_avgoustaki_xydis_2020]"

@D tp_3 := "TP-3 urban soil Pb remediation is site-specific, not universal" :: prediction [ok]
  claim = "Pb concentration in urban garden soils varies by orders of magnitude across a single city depending on proximity to painted structures, arterial roads, and industrial legacy — precluding a universal 'safe for all urban gardens' generalisation."
  falsifier = "If a citywide soil survey shows Pb concentrations uniformly below health-threshold values across all urban garden sites regardless of site history, [@lim_soil_contamination]'s site-specificity claim is too strong."
  source = "[@x_brown_chaney_2011]"

# ── §12 Cross-links ───────────────────────────────────────────────────

@X x_aquaculture_sibling := "AQUACULTURE.tape" :: sibling-tape [active]
  scope = "Detailed fish-production biology (recirculating aquaculture systems, species, water quality parameters); cross-link from aquaponics ([@mech_aquaponics])"

@X x_apiculture_sibling := "APICULTURE.tape" :: sibling-tape [active]
  scope = "Bee biology, hive management, urban beekeeping; cross-link from pollinator context ([@dom_pollinators])"

@X x_agriculture_sibling := "AGRICULTURE.tape" :: sibling-tape [active]
  scope = "Field-scale agronomy (photosynthesis, soil science, nutrient cycling, IPM, crop genetics, yield-gap analysis) — the substrate urban farming adapts to controlled indoor environments"

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). This tape complies: real urban-agriculture science, in-silico knowledge SSOT only, lattice declined as derivation tool."

# ── §13 External citations (real, landmark literature) ────────────────
# Where exact bibliographic detail is not asserted with confidence,
# the entry names primary author + era only and says so explicitly.

@X x_despommier_2010 := "Despommier 2010 — The Vertical Farm" :: literature [active]
  ref = "Despommier D. The Vertical Farm: Feeding the World in the 21st Century. Thomas Dunne Books / St. Martin's Press, 2010. (primary text for the vertical-farming concept; Dickson Despommier, Columbia University)"

@X x_hoagland_arnon_1950 := "Hoagland & Arnon (~1933–1950)" :: literature [active]
  ref = "Hoagland DR, Arnon DI. The water-culture method for growing plants without soil. California Agricultural Experiment Station Circular 347, 1950 (2nd edition; first edition 1938). Standard reference nutrient-solution formulation for hydroponics research and teaching. (Hoagland 1933/1938 era — the core formula was established in the 1930s; this citation is the widely-referenced 1950 circular revision.)"

@X x_cooper_1979 := "Cooper (NFT, ~1979)" :: literature [active]
  ref = "Allen J. Cooper — nutrient film technique (NFT) development and characterisation, UK Glasshouse Crops Research Institute, Littlehampton, ~1970s. Cooper AJ. The ABC of NFT. Grower Books, London, 1979. (primary author/era; the Cooper 1979 book is the canonical NFT reference — exact page count not asserted.)"

@X x_massa_2008 := "Massa et al. (LED plant lighting, 2008 era)" :: literature [active]
  ref = "Massa GD et al. — NASA Kennedy Space Center / Bionetics research on sole-source LED lighting for plant growth; narrow-band red and blue LED characterisation for CEA. Massa GD, Kim HH, Wheeler RM, Mitchell CA. Plant productivity in response to LED lighting. HortScience 2008;43:1951–1956. (primary authors/era for early LED plant-factory lighting research)"

@X x_kozai_2022 := "Kozai et al. — Plant Factory with Artificial Lighting" :: literature [active]
  ref = "Kozai T, Niu G, Takagaki M (eds). Plant Factory: An Indoor Vertical Farming System for Efficient Quality Food Production. 2nd ed., Academic Press/Elsevier, 2019 (first edition 2016; updated 2022 companion texts). Standard reference for CEA and plant-factory science and economics. (Toyoki Kozai, Chiba University; primary editor/author for this field.)"

@X x_avgoustaki_xydis_2020 := "Avgoustaki & Xydis (vertical-farm energy review, 2020 era)" :: literature [active]
  ref = "Avgoustaki DD, Xydis G. Indoor plant factories in the era of sustainability: energy footprint and economic analysis. Sustainability 2020;12:5516. (representative peer-reviewed techno-economic review of energy costs in vertical farming; primary authors/era for the energy-economics analysis literature; confirms electricity as dominant operating cost)"

@X x_lennard_2012 := "Lennard & Leonard (aquaponics, ~2006/2012)" :: literature [active]
  ref = "Lennard WA, Leonard BV. A comparison of three different hydroponic sub-systems (gravel bed, floating raft and nutrient film technique) in an aquaponic test system. Aquacultural Engineering 2006;34:90–105 (primary authors/era; one of the early controlled comparisons of aquaponic subsystem designs; exact volume confirmed for primary-author identification; detailed page range not asserted beyond the volume reference)."

@X x_fao_urban_food_agenda := "FAO Urban Food Agenda" :: literature [active]
  ref = "Food and Agriculture Organization of the United Nations (FAO). Urban Food Agenda. Rome: FAO, 2019. Institutional framework document linking urban agriculture to food-security policy. (FAO institutional; freely available at fao.org)"

@X x_brown_chaney_2011 := "Brown & Chaney (urban soil Pb, ~2011 era)" :: literature [active]
  ref = "Brown SL, Chaney RL, Hettiarachchi GM. Lead in urban soils: a real or perceived concern for urban agriculture? Journal of Environmental Quality 2016;45:26–36. (primary authors/era for urban-soil lead contamination and urban-gardening risk literature; the 2016 JEQ paper is a specific reference; volume/year stated as known; page range not asserted in full.)"
