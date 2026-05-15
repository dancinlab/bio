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
# ECOLOGY-AGRICULTURE-FOOD.tape — architecture-current (editable per v1.2)
# Event history → ECOLOGY-AGRICULTURE-FOOD.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "ecology-agriculture-food" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · compound substrate — food-system planetary boundaries + nutrition-environment-health nexus"
  brief = "Food-system + planetary boundaries + nutrition-environment nexus · n=6 NOT used as a derivation (honest) · cross-link ECOLOGY+AGRICULTURE+FOOD-SCIENCE siblings"
  parent = "dancinlab/hexa-bio"
  siblings = [ECOLOGY.tape, AGRICULTURE.tape, FOOD-SCIENCE.tape]
  sibling-log = "ECOLOGY-AGRICULTURE-FOOD.log.tape"
  scope = "in-silico food-system knowledge SSOT · NOT dietary/policy advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see ECOLOGY-AGRICULTURE-FOOD.log.tape audit"

@N scope_disclaimer := "food-system scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico food-system substrate. Food-system figures (GHG fractions, waste estimates, planetary-boundary status, dietary association strengths) are paraphrased from published scientific literature for modeling context ONLY — they are NOT dietary advice, policy prescriptions, land-use guidance, or clinical nutrition recommendations. Real food-system decisions involve jurisdiction-specific agricultural policy, economic constraints, cultural context, and empirical field/clinical data well beyond this tape's scope."

# ── §1 Planetary boundaries — the food-system envelope ────────────────

@D dom_planetary_boundaries := "planetary boundaries framework — food-system relevance (Rockström 2009, Steffen 2015)" :: domain [ok]
  framework = "Rockström et al (2009 Nature 461:472-475) introduced nine Earth-system boundaries within which humanity can operate safely. Steffen et al (2015 Science 347:1259855) updated quantification and found four boundaries already transgressed as of that assessment."
  food-system-driven = "Three of the four transgressed boundaries are primarily or substantially driven by food-system activities: (1) biogeochemical flows (N/P cycles — synthetic fertiliser, livestock manure); (2) land-system change (agricultural expansion, especially tropical deforestation); (3) biosphere integrity (biodiversity loss — habitat conversion, agrochemicals, homogenisation). Climate change (the fourth transgressed boundary) is further amplified by food-system emissions."
  nitrogen-boundary = "The nitrogen boundary is the most severely transgressed; the planetary safe limit for reactive-nitrogen fixation is estimated at ~62 Tg N/yr (Steffen 2015); anthropogenic fixation (dominated by Haber–Bosch fertiliser production and legume cultivation) exceeds this substantially. See [@x_steffen_2015] and ECOLOGY.tape cross-link."
  phosphorus-boundary = "The phosphorus boundary — both the global and regional sub-boundaries — is transgressed; runoff from agricultural fields is the dominant P flux to aquatic systems driving eutrophication. P is also a finite mined resource (see AGRICULTURE.tape [@x_cordell_2009] cross-link)."
  |> "[@x_rockstrom_2009] · [@x_steffen_2015]"

@D dom_biodiversity_food_link := "food-system as primary biodiversity driver" :: domain [ok]
  habitat-conversion = "Agricultural expansion is the single largest driver of terrestrial habitat loss globally. The Millennium Ecosystem Assessment (MEA 2005) identified land-use change — primarily conversion to agriculture — as the leading cause of biodiversity loss in the 20th century. Ceballos et al (2015) framing of the sixth mass extinction pulse is substantially traceable to agricultural land-use (cross-link ECOLOGY.tape [@x_ceballos_2015])."
  homogenisation = "Green Revolution semi-dwarf cereal varieties (Borlaug/IRRI era; cross-link AGRICULTURE.tape [@x_evenson_gollin_2003]) dramatically increased yields but narrowed cultivated genetic diversity — a vulnerability to novel pathogens and climate extremes."
  agrochemical-pressure = "Pesticide use (especially neonicotinoids and broad-spectrum insecticides) contributes to insect and pollinator decline, which feeds back into crop pollination services. See [@dom_pollinators]."
  |> "[@x_mea_2005] · [@x_ceballos_2015]"

# ── §2 EAT-Lancet Commission — planetary health diet ──────────────────

@D dom_eat_lancet := "EAT-Lancet Commission — healthy diets from sustainable food systems (Willett et al 2019)" :: domain [ok]
  commission = "The EAT-Lancet Commission on Food, Planet, Health (37 scientists, 16 countries) synthesised evidence on healthy diets and sustainable food production. Published: Willett W et al. Food in the Anthropocene: the EAT–Lancet Commission on healthy diets from sustainable food systems. Lancet 2019;393:447-492."
  planetary-health-diet = "The Commission proposed a 'planetary health diet' — a reference diet that is simultaneously health-promoting and environmentally sustainable. It is predominantly plant-based, with moderate amounts of fish and poultry, small amounts of red meat, and limits on ultra-processed foods and free sugars."
  dual-burden = "The Commission framed a double duty: >820 million people are undernourished while >2 billion are overweight/obese and non-communicable diseases linked to diet (cardiovascular, type-2 diabetes, cancer) are the leading global mortality causes. A food system that feeds everyone healthily within planetary boundaries requires simultaneous dietary transition AND production transformation."
  production-shifts = "Production-side shifts include: at least 50% reduction in food loss and waste; dietary shifts away from red meat in high-income settings; reallocation of cropland and nitrogen toward a more diverse crop portfolio; expansion of aquaculture under ecological management."
  honesty = "The planetary-health-diet reference quantities are scenario-derived modelled targets, not prescriptions. The Commission acknowledges major uncertainty ranges and cultural variability. Figures paraphrased for modeling context — see [@scope_disclaimer]."
  |> "[@x_willett_2019]"

# ── §3 Food-system GHG emissions ──────────────────────────────────────

@D dom_food_ghg := "food-system GHG emissions — Poore & Nemecek 2018" :: domain [ok]
  landmark = "Poore J & Nemecek T (2018 Science 360:987-992) analysed environmental impacts of 40 food products from 38,700 farms in 119 countries — the largest meta-analysis of food-system life-cycle assessments to date."
  headline-finding = "Food systems account for roughly 26% of global greenhouse-gas emissions (CO₂-equivalent; combining all land use, farming, processing, transport, retail, packaging, household, food waste). This is one of the largest single-sector contributions to anthropogenic GHG."
  animal-vs-plant = "Across all impact metrics (GHG, land use, freshwater use, eutrophication), animal-sourced foods generate substantially higher impacts per unit of nutrition than plant-sourced equivalents. Beef (ruminant) production is the largest single food-category land-use and GHG driver; it occupies ~60% of agricultural land while providing ~2% of global calories."
  variability = "There is high producer variability: the lowest-impact producers of beef produce ~12× fewer GHGs than the highest-impact producers of beef. This variability means average impact figures hide a wide actionable range."
  diet-vs-production = "The analysis found that dietary change (shifting to lower animal-product diets) would reduce food-system land use by 76% and GHG by 49%, while production-side efficiency improvements alone are insufficient to meet sustainability targets while feeding 10 billion people."
  |> "[@x_poore_nemecek_2018]"

@D dom_livestock_systems := "livestock, land-use and methane" :: domain [ok]
  enteric = "Ruminants (cattle, sheep, goats, buffalo) produce methane (CH₄) via enteric fermentation — a potent short-lived climate forcer (~80× CO₂ GWP100 in AR6, higher on 20-year horizon). Global livestock is the largest anthropogenic non-CO₂ agricultural GHG source."
  land-opportunity = "Dietary shift away from ruminant products would free agricultural land for reforestation or restoration, generating a carbon-sequestration opportunity on top of reduced emission flows — a key mechanism in the Poore & Nemecek food-system model."
  lca-caveat = "Life-cycle assessment of food systems has significant methodological heterogeneity (functional units, allocation methods, system boundaries); the Poore & Nemecek meta-regression addressed this but uncertainty ranges remain wide. Stated as a methodological observation, not as a disqualification of the direction of effect."
  |> "[@x_poore_nemecek_2018] · [@x_steffen_2015]"

# ── §4 Agricultural intensification — Green Revolution trade-offs ──────

@D dom_green_revolution_link := "Green Revolution impacts — cross-link AGRICULTURE.tape" :: domain [ok]
  evenson-gollin = "Evenson RE & Gollin D (2003 Science 300:758-762) conducted the most comprehensive empirical assessment of the Green Revolution's global productivity and equity impacts. Found very large aggregate yield gains (avoided hundreds of millions of additional poverty/hunger cases), but with heterogeneous regional uptake and documented negative externalities."
  trade-offs = "Productivity gains came with: increased dependence on synthetic nitrogen (Haber–Bosch — see AGRICULTURE.tape cross-link [@x_galloway_2004]); irrigation expansion depleting aquifers; homogenisation of cultivated genetic diversity; unequal distribution of gains favoring larger, capital-rich farmers; agroecosystem simplification reducing ecosystem services."
  sustainable-intensification = "The concept of 'sustainable intensification' (producing more food on existing land while reducing environmental impact) emerged as a policy framework to address Green Revolution trade-offs. Its operationalisation is contested — the tension between yield and biodiversity/water/GHG outcomes is a documented real-limits problem, not a lattice-resolved one."
  |> "[@x_evenson_gollin_2003]"

# ── §5 Food security — UN SDG 2 and FAO SOFI ──────────────────────────

@D dom_food_security := "global food security — SDG 2 and FAO SOFI" :: domain [ok]
  sdg2 = "United Nations Sustainable Development Goal 2 (SDG 2) — 'Zero Hunger' — calls for ending hunger and all forms of malnutrition and achieving food security by 2030. As of recent FAO State of Food Security and Nutrition reports, SDG 2 is off-track globally: the number of undernourished people increased in 2020-2022 following COVID-19 and conflict disruptions, reversing a decade of gains."
  sofi = "The FAO, IFAD, UNICEF, WFP and WHO annually produce the 'State of Food Security and Nutrition in the World' (SOFI) report — the institutional SSOT for global food-security statistics. The 2022 edition estimated approximately 735 million people were hungry globally."
  four-pillars = "Food security rests on four pillars established in the World Food Summit definition (FAO 1996, then consolidated in subsequent SOFI reports): (1) availability (sufficient food produced); (2) access (economic/physical); (3) utilisation (nutritional adequacy, dietary diversity, food safety); (4) stability (over time). This is an institutional classification framework, not a lattice partition."
  honesty = "Food-security statistics from SOFI are institutional estimates with substantial uncertainty bounds; they are reported as the authoritative institutional source, not as precise factual assertions. See [@scope_disclaimer]."
  |> "[@x_fao_sofi_institutional]"

# ── §6 Dietary transitions — nutrition transition + ultra-processed foods

@D dom_nutrition_transition := "nutrition transition (Popkin 1993 era)" :: domain [ok]
  concept = "Barry Popkin articulated the 'nutrition transition' concept (primary author/era, ~1993 and subsequent landmark reviews): as countries economically develop, populations shift from traditional plant-rich diets toward high-fat, high-sugar, high-sodium diets with increased animal products and processed foods. Accompanied by declining physical activity."
  epidemiological-consequence = "The nutrition transition is associated epidemiologically with rising rates of overweight/obesity and non-communicable diseases (cardiovascular, type-2 diabetes, colorectal cancer). The mechanisms (dietary fat/sugar loading, low fiber, ultra-processing) are active research areas; causal attribution varies by disease outcome."
  global-reach = "The transition is now occurring simultaneously in low- and middle-income countries, creating a 'double burden of malnutrition' — persistent undernutrition (stunting, micronutrient deficiency) coexisting with rising overweight. This is a documented epidemiological pattern across Asia, Africa, and Latin America."
  honesty = "The nutrition transition is a documented epidemiological pattern; causal attribution of specific diet components to specific disease outcomes requires careful epidemiological assessment. Paraphrased for modeling context; not a clinical prescription."
  |> "[@x_popkin_1993]"

@D dom_upf := "ultra-processed foods (UPF) — NOVA classification (Monteiro 2019)" :: domain [ok]
  nova = "Monteiro CA et al (2019 Public Health Nutr 22:936-941) formalised the NOVA food classification system grouping foods by degree of industrial processing. NOVA group 4 = ultra-processed foods (UPF): industrial formulations with five or more ingredients, typically containing additives, cosmetic enhancers, artificial flavours, emulsifiers, preservatives not used in home cooking."
  epidemiology = "Multiple large prospective cohort studies (NutriNet-Santé, UK Biobank and others) have reported associations between higher UPF consumption and elevated risks of obesity, cardiovascular disease, type-2 diabetes, depression, and all-cause mortality. The causal chain is debated: possible mechanisms include energy density, displacement of whole foods, additives, ultra-processed matrix effects on gut microbiota and satiety."
  food-system-link = "UPFs are heavily produced from a small number of commodity crops (maize, wheat, soy, sugar cane/beet, palm oil) and are a major economic driver of the processed-food industry. Their global growth is a feature of the nutrition transition."
  classification-honesty = "NOVA is a processing-based classification, not a nutrient-based one. The causal mechanisms linking UPF to health outcomes are an active scientific debate; NOVA group 4 correlates with known dietary risk factors, making attribution difficult. Stated as a documented epidemiological association, not an established monocausal claim."
  |> "[@x_monteiro_2019]"

# ── §7 Food waste ──────────────────────────────────────────────────────

@D dom_food_waste := "food loss and waste — FAO Gustavsson 2011" :: domain [ok]
  gustavsson = "Gustavsson J et al (2011 FAO report) estimated that approximately one-third of all food produced globally for human consumption is lost or wasted — roughly 1.3 billion tonnes per year. This is the foundational institutional estimate frequently cited in food-system analyses."
  loss-vs-waste = "Food loss: occurs during production, post-harvest handling, and processing — primarily in low-income countries due to infrastructure and technology constraints. Food waste: occurs at retail and consumer stages — more prevalent in high-income countries."
  environmental-consequence = "Wasted food represents wasted agricultural inputs (land, water, fertiliser, energy) and wasted embodied GHG emissions — producing food that is not consumed generates GHG with no nutritional benefit. If global food waste were a country, its emissions would be the third largest nationally."
  reduction-challenge = "Reducing food waste requires behavioural, logistical, supply-chain and policy interventions simultaneously. Economic and behavioural barriers to reduction are well documented; the '50% reduction by 2030' target (SDG 12.3 and EAT-Lancet Commission recommendation) is widely acknowledged as ambitious given current trajectories."
  honesty = "The one-third estimate is widely cited but involves significant methodological uncertainty (definition, measurement methodology vary across the supply chain and countries). Reported as the authoritative institutional baseline estimate."
  |> "[@x_gustavsson_2011]"

# ── §8 Pollinators and food production ────────────────────────────────

@D dom_pollinators := "pollinator-dependent crops and pollinator decline (Klein 2007)" :: domain [ok]
  klein = "Klein AM et al (2007 Proc R Soc B 274:303-313) systematically assessed global crop dependence on animal pollination. Found that roughly 35% of global food production volume (by weight of crops contributing to human food) depends on animal pollinators, primarily bees."
  crop-coverage = "Of 115 leading food crops assessed, 87 depend to some degree on animal pollination. Pollinator-dependent crops include most fruits, vegetables, nuts, oilseeds, and some staple legumes. Insect-pollinated crops contribute disproportionately to micronutrient and dietary diversity compared to their caloric contribution."
  decline = "Wild bee and managed honeybee populations have declined in many regions due to: habitat loss (agricultural intensification reducing floral resources and nesting sites), pesticide exposure (especially neonicotinoids), parasites and pathogens (Varroa destructor in Apis mellifera), and climate change shifting phenological synchrony. Cross-link ECOLOGY.tape (habitat-loss-driven biodiversity decline)."
  food-security-link = "Pollinator decline represents a food-system risk: yield reductions or increased production costs in pollinator-dependent crop sectors. The quantitative risk estimate is uncertain but directionally robust across multiple assessments."
  |> "[@x_klein_2007]"

# ── §9 Alternative proteins and precision agriculture ──────────────────

@D dom_alt_proteins := "alternative proteins — cultivated meat, microbial protein, plant-based" :: domain [ok]
  motivation = "Alternative protein development is motivated by the environmental footprint of conventional animal protein (see [@dom_food_ghg]), the GHG-intensity of ruminant enteric fermentation, and projected growth in global protein demand."
  cultivated-meat = "Cultivated (cell-cultured) meat: growing animal muscle cells in bioreactors to produce meat without slaughter. Not yet at commercial scale; energy and media-cost challenges are the primary barriers. LCA uncertainty is high — GHG savings vs conventional beef depend critically on energy source and process efficiency. First regulatory approvals (Singapore 2020, US FDA/USDA 2023) have been granted for limited products."
  microbial-protein = "Microbial protein (single-cell protein): fermentation of bacteria, yeasts, or fungi on substrates (methane, hydrogen, CO₂, agricultural residues) to produce protein-rich biomass. Quorn (mycoprotein) is the longest-established commercial example. Efficiency advantages in land use vs conventional animal protein are documented."
  plant-based = "Plant-based meat analogues using soy, pea, wheat gluten, etc. are commercially mature in high-income markets; nutritional equivalence and consumer acceptance vary by product design and population."
  honesty = "This tape documents the technology landscape at knowledge-cutoff. LCA claims for novel proteins depend heavily on scenario assumptions (energy grid, production scale, location). In-silico SSOT only; no endorsement of specific products."
  |> "[@x_poore_nemecek_2018]"

@D dom_precision_agriculture := "precision agriculture and agroecology" :: domain [ok]
  precision = "Precision agriculture applies sensors, GPS mapping, variable-rate application technology and digital tools to optimise inputs (fertiliser, water, pesticide) at sub-field resolution — closing the yield-gap yield-by-site while reducing input overuse and environmental loss."
  agroecology = "Agroecology applies ecological principles to agricultural system design: diversified cropping, integration of natural enemies for pest management, soil biological activity as the fertility engine, landscape heterogeneity to support beneficial insects. Positioned as an alternative/complement to chemical-input intensification."
  debate = "The intensification vs agroecology debate is a real policy and agronomic controversy: agroecological systems generally show lower yields per unit area than high-input systems in direct comparisons but generate more ecosystem services; the tradeoff between land efficiency and sustainability-service provision is an empirical, context-dependent question. Cross-link AGRICULTURE.tape (yield-gap analysis [@x_vanittersum_2013])."
  |> "[@x_evenson_gollin_2003]"

# ── §10 Real-limits anchors ────────────────────────────────────────────

@D lim_liebig_food_system := "Liebig's limiting factor applies at food-system scale" :: real-limit [ok required]
  wall = "HARD LAW (resource-limitation principle; cross-link AGRICULTURE.tape)"
  statement = "The most limiting input governs crop production at field scale — nitrogen, water, or phosphorus depending on system and geography. At food-system scale the same logic applies: the global food-security ceiling is set by the scarcest critical input across the system (arable land, phosphorus supply, freshwater availability, climate stability), not by the most abundant one. Liebig's minimum holds from the plot to the planetary boundary."
  consequence = "Addressing a non-limiting input while ignoring the binding constraint does not improve the system. The policy implication: phosphorus and freshwater scarcity may become binding faster than nitrogen in some regional systems — whichever is limiting governs."
  |> "[@x_steffen_2015] · [@x_cordell_2009]"

@D lim_planetary_boundaries_exceeded := "N/P/biodiversity planetary boundaries already transgressed" :: real-limit [ok required]
  wall = "HARD EMPIRICAL LIMIT — boundaries already exceeded per Steffen 2015"
  statement = "The planetary boundaries for biogeochemical flows (nitrogen, phosphorus), land-system change, and biosphere integrity (biodiversity) — all primarily food-system driven — are already transgressed as of the Steffen 2015 assessment. This is not a projected risk but an already-realised state. Operating beyond these boundaries introduces risk of abrupt/irreversible Earth-system change."
  consequence = "There is no safe headroom remaining in N/P/biodiversity boundaries for additional food-system intensification at the global scale under current practices. The food system needs to operate within the residual capacity, requiring either efficiency improvement or consumption-pattern change."
  |> "[@x_steffen_2015] · [@x_rockstrom_2009]"

@D lim_dietary_transition_irreversibility := "dietary cultural preferences resist rapid change" :: real-limit [ok required]
  wall = "SOFT WALL (behavioural/cultural)"
  statement = "Cultural food preferences, culinary traditions, economic accessibility, infrastructure, and agricultural vested interests create strong inertia against rapid dietary transitions. The EAT-Lancet Commission (Willett 2019) acknowledged that the required shift in high-income-country red-meat consumption represents a multi-generational dietary transformation, not a policy-implementable switch. Consumer behaviour and food environment co-determine dietary patterns — purely information-based interventions show limited population-level dietary change."
  consequence = "Scenarios requiring large, rapid dietary transitions face this behavioural and structural limit. Policy modelling that assumes full and rapid adoption of the planetary health diet will overestimate achievable food-system improvement on decadal timescales."
  |> "[@x_willett_2019]"

@D lim_food_waste_reduction := "food waste reduction — economic and behavioural barriers" :: real-limit [ok required]
  wall = "SOFT WALL (economic/behavioural)"
  statement = "Approximately one-third of global food production is lost or wasted (Gustavsson 2011 FAO). Reducing this waste is widely identified as the single most cost-effective food-system intervention for sustainability. However, halving waste by 2030 (SDG 12.3 target) faces structural barriers: retail pricing incentives reward overproduction, consumer habits of excess purchasing and cosmetic quality expectations are resistant to change, and cold-chain infrastructure deficits in low-income countries require capital investment."
  consequence = "Even if achievable in principle, the policy and investment pathway to 50% waste reduction by 2030 is not on track globally. The limit is not thermodynamic but economic-institutional."
  |> "[@x_gustavsson_2011] · [@x_willett_2019]"

@D lim_agricultural_emissions_yield_tradeoff := "reducing agricultural emissions without yield loss — the core tradeoff" :: real-limit [ok required]
  wall = "SOFT WALL (agronomic and economic)"
  statement = "Reducing agriculture's GHG emissions (N₂O from fertiliser, CH₄ from livestock, CO₂ from land-use change) while maintaining or increasing yields for a growing population is a binding tradeoff, not a free lunch. Many of the highest-yield practices (high synthetic-N rates, ruminant-heavy livestock systems, cropland expansion) are also the highest-GHG-intensity practices. Decoupling yield from GHG impact requires: enhanced nitrogen-use efficiency, feed improvement, enteric-fermentation management, renewable energy in food processing, and large-scale dietary shift — each with technical, economic and adoption constraints."
  |> "[@x_poore_nemecek_2018] · [@x_evenson_gollin_2003]"

# ── §11 n=6 lattice stance (HONEST — observation, not derivation) ──────

@F f_lattice_fit := "lattice-fit-on-food-system" :: governance [required deny:write]
  pattern = "Deriving food-system quantities (GHG percentages, waste fractions, planetary-boundary counts, dietary transition timescales, pollinator-dependence fractions, food-security statistics) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'food-system GHG = 26% because σ/sopfr' or 'boundary count = 9 because …' or '35% pollinator-dependent because sopfr=5'."
  why = "This is exactly the fabrication the pre-rewrite ECOLOGY-AGRICULTURE-FOOD.tape committed (lattice-tautology stub with Korean-language σ/τ/φ/J₂ row-by-row mappings and EXACT markers; see ECOLOGY-AGRICULTURE-FOOD.log.tape audit). hexa-bio AGENTS.tape @F f1 (lattice-fit-on-external-entity) + @D g1/g2 forbid it."
  remedy = "Cite real food-system literature (this tape's @X entries). Nine planetary boundaries is an Earth-system classification (Rockström 2009); 35% pollinator dependence is from Klein et al 2007; ~1/3 food waste is from Gustavsson 2011 FAO; 26% of GHG from food systems is from Poore & Nemecek 2018. None of these arise from the n=6 lattice."

@N n6_honest_stance := "food-system science has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: food-system science exposes NO natural n=6 invariant. The nine planetary boundaries (Rockström/Steffen) are an Earth-system classification — not lattice-derived. The ~35% pollinator dependence of global food production (Klein 2007) is an empirical estimate from a systematic crop survey. The one-third food-waste fraction (Gustavsson 2011) is an institutional estimate. The NOVA classification's four food groups (Monteiro 2019) are a processing-taxonomy. FAO's four food-security pillars (availability, access, utilisation, stability) are an institutional framework. The EAT-Lancet planetary health diet reference quantities are scenario outputs from nutrition and life-cycle modelling. None of these numbers are derived from σ=12, τ=4, φ=2, or J₂=24 — any numerical coincidence is OBSERVATION ONLY, never a derivation. Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool) and LATTICE_POLICY: the lattice is declined here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub."

# ── §12 Verifiable predictions (real, falsifiable — NOT lattice) ───────

@D tp_1 := "TP-1 food-system GHG dominance of animal products" :: prediction [ok]
  claim = "Any life-cycle assessment meta-analysis of ≥1000 food production systems covering diverse geographies and production methods will find beef (ruminant) generating higher GHG emissions per 100g protein and per 100 kcal than any mainstream plant-sourced food category (legumes, grains, vegetables)."
  falsifier = "If a properly scoped LCA meta-analysis with transparent system boundaries and representative global coverage finds a plant-sourced food category with median GHG per unit protein exceeding median beef, the directional claim in [@dom_food_ghg] would require revision."
  source = "[@x_poore_nemecek_2018]"

@D tp_2 := "TP-2 planetary boundaries — N/P exceedance" :: prediction [ok]
  claim = "Under business-as-usual agricultural intensification trajectories, the biogeochemical flow boundaries for nitrogen and phosphorus will remain transgressed through 2050 without large-scale dietary change or nitrogen-use efficiency improvements that substantially outpace demand growth."
  falsifier = "If a peer-reviewed Earth-system model shows biogeochemical boundaries returning within safe limits under BAU agricultural intensification by 2050, the planetary-boundary transgression framing in [@lim_planetary_boundaries_exceeded] and [@x_steffen_2015] would need major revision."
  source = "[@x_steffen_2015] · [@x_rockstrom_2009]"

@D tp_3 := "TP-3 food waste reduction against SDG targets" :: prediction [ok]
  claim = "Global food waste reduction will not achieve the SDG 12.3 target (50% per-capita food waste reduction by 2030) without structural policy interventions beyond current commitments — measured by FAO SOFI or equivalent monitoring against 2015 baselines."
  falsifier = "If FAO SOFI or equivalent authoritative global monitoring shows food waste per capita falling by 50% from 2015 baseline by 2030, the behavioural-barrier claim in [@lim_food_waste_reduction] would be refuted."
  source = "[@x_gustavsson_2011] · [@x_fao_sofi_institutional]"

# ── §13 Cross-links ───────────────────────────────────────────────────

@X x_ecology_sibling := "ECOLOGY.tape (hexa-bio)" :: sibling-tape [active]
  scope = "Planetary boundaries ecological science · biodiversity loss · ecosystem services (MEA 2005) · trophic cascades · Anthropocene context. Key cross-links: [@x_rockstrom_2009] · [@x_steffen_2015] · [@x_ceballos_2015] · [@x_mea_2005]"

@X x_agriculture_sibling := "AGRICULTURE.tape (hexa-bio)" :: sibling-tape [active]
  scope = "Agronomic science SSOT · Liebig's minimum · photosynthetic ceiling · nitrogen cycle ([@x_galloway_2004]) · Green Revolution ([@x_evenson_gollin_2003]) · phosphorus finitude ([@x_cordell_2009]) · yield-gap analysis ([@x_vanittersum_2013])"

@X x_food_science_sibling := "FOOD-SCIENCE.tape (hexa-bio)" :: sibling-tape [active]
  scope = "Food chemistry + safety SSOT · Maillard chemistry · lipid oxidation · hurdle technology · HACCP · water activity · food pathogens · acrylamide · allergens"

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @D g3 (honesty-obligation-external) · @F f1 (lattice-fit-on-external-entity). This tape complies: real food-system science, in-silico knowledge SSOT only, lattice declined as a derivation tool."

# ── §14 External citations (real, landmark literature) ────────────────
# Where a specific bibliographic detail is not asserted with confidence,
# the entry names the primary author + era only and says so explicitly.

@X x_rockstrom_2009 := "Rockström et al 2009 Nature" :: literature [active]
  ref = "Rockström J et al. A safe operating space for humanity. Nature 2009;461:472-475. (planetary boundaries framework — nine Earth-system boundaries; quantitative proposed limits; safe operating space concept. Cross-link: ECOLOGY.tape [@x_rockstrom_2009])"

@X x_steffen_2015 := "Steffen et al 2015 Science" :: literature [active]
  ref = "Steffen W et al. Planetary boundaries: Guiding human development on a changing planet. Science 2015;347:1259855. (updated planetary boundaries; identified four already-transgressed boundaries: climate change, biodiversity loss, land-system change, biogeochemical flows. Cross-link: ECOLOGY.tape [@x_steffen_2015])"

@X x_willett_2019 := "Willett et al 2019 Lancet — EAT-Lancet Commission" :: literature [active]
  ref = "Willett W et al. Food in the Anthropocene: the EAT–Lancet Commission on healthy diets from sustainable food systems. Lancet 2019;393:447-492. (37 scientists, 16 countries; planetary health diet reference; dual burden of malnutrition + environmental sustainability synthesis; production-side and dietary-transition targets)"

@X x_poore_nemecek_2018 := "Poore & Nemecek 2018 Science" :: literature [active]
  ref = "Poore J, Nemecek T. Reducing food's environmental impacts through producers and consumers. Science 2018;360:987-992. (38,700 farms, 40 food products, 119 countries; food-system LCA meta-analysis; headline: ~26% of global GHG from food systems; animal vs plant footprint comparison; producer variability finding)"

@X x_klein_2007 := "Klein et al 2007 Proc R Soc B" :: literature [active]
  ref = "Klein AM et al. Importance of pollinators in changing landscapes for world crops. Proceedings of the Royal Society B 2007;274:303-313. (systematic assessment of 115 leading food crops; finding that ~87 depend on animal pollination; ~35% of global food production volume pollinator-dependent)"

@X x_monteiro_2019 := "Monteiro et al 2019 — NOVA classification" :: literature [active]
  ref = "Monteiro CA et al. Ultra-processed foods: what they are and how to identify them. Public Health Nutrition 2019;22:936-941. (NOVA four-group food classification system; definition of ultra-processed foods; cross-reference with dietary-transition and nutrition-transition literature)"

@X x_gustavsson_2011 := "Gustavsson et al 2011 — FAO food-waste report" :: literature [active]
  ref = "Gustavsson J, Cederberg C, Sonesson U, van Otterdijk R, Meybeck A. Global food losses and food waste — extent, causes and prevention. FAO, Rome, 2011. (Foundational institutional estimate: approximately one-third of global food production lost or wasted; 1.3 billion tonnes/yr; loss-by-supply-chain-stage breakdown by region)"

@X x_popkin_1993 := "Popkin 1993 — nutrition transition (author/era)" :: literature [active]
  ref = "Popkin BM. Nutritional patterns and transitions. Population and Development Review 1993;19:138-157. (The original nutrition-transition framework articulating the epidemiological shift from traditional plant-rich diets toward high-fat, high-sugar diets associated with economic development. Primary author/era; subsequent landmark reviews by same author updated the framework.)"

@X x_fao_sofi_institutional := "FAO SOFI — State of Food Security and Nutrition in the World" :: literature [active]
  ref = "FAO, IFAD, UNICEF, WFP and WHO. The State of Food Security and Nutrition in the World (SOFI). FAO, Rome (annual report series, 2017–present). The authoritative multi-agency institutional SSOT for global food-security statistics including undernourishment prevalence, stunting, wasting, and food-insecurity indicators. 2022 edition estimated ~735 million people facing hunger globally."

@X x_evenson_gollin_2003 := "Evenson & Gollin 2003 Science — Green Revolution assessment" :: literature [active]
  ref = "Evenson RE, Gollin D. Assessing the impact of the Green Revolution, 1960 to 2000. Science 2003;300:758-762. (empirical productivity and equity assessment of the Green Revolution; large aggregate yield gains; heterogeneous regional uptake; documented trade-offs. Cross-link: AGRICULTURE.tape [@x_evenson_gollin_2003])"

@X x_mea_2005 := "Millennium Ecosystem Assessment 2005 (MEA) — institution/era" :: literature [active]
  ref = "Millennium Ecosystem Assessment. Ecosystems and Human Well-being: Synthesis. Island Press, Washington DC, 2005. (land-use change as primary biodiversity-loss driver; ecosystem-services classification; UN-convened, ~1360 experts, 2001-2005. Cross-link: ECOLOGY.tape [@x_mea_2005])"

@X x_ceballos_2015 := "Ceballos et al 2015 Sci Adv — sixth mass extinction" :: literature [active]
  ref = "Ceballos G et al. Accelerated modern human-induced species losses: entering the sixth mass extinction. Science Advances 2015;1:e1400253. (modern vertebrate extinction rates 8-100× background; sixth mass extinction pulse; agricultural land-use as primary driver. Cross-link: ECOLOGY.tape [@x_ceballos_2015])"

@X x_cordell_2009 := "Cordell, Drangert & White 2009 — phosphorus finitude" :: literature [active]
  ref = "Cordell D, Drangert JO, White S. The story of phosphorus: Global food security and food for thought. Global Environmental Change 2009;19:292-305. (finite mined phosphate-rock reserves; P as non-renewable agricultural input. Cross-link: AGRICULTURE.tape [@x_cordell_2009])"

@X x_galloway_2004 := "Galloway et al 2004 — nitrogen cycles (cross-link AGRICULTURE)" :: literature [active]
  ref = "Galloway JN et al. Nitrogen cycles: past, present, and future. Biogeochemistry 2004;70:153-226. (global reactive-N cycle; Haber–Bosch dependence of modern agriculture; anthropogenic N perturbation. Cross-link: AGRICULTURE.tape [@x_galloway_2004])"

@X x_vanittersum_2013 := "van Ittersum et al 2013 — yield gap analysis (cross-link AGRICULTURE)" :: literature [active]
  ref = "van Ittersum MK et al. Yield gap analysis with local to global relevance — a review. Field Crops Research 2013;143:4-17. (yield-gap definition, decomposition methodology; sustainable-intensification context. Cross-link: AGRICULTURE.tape [@x_vanittersum_2013])"
