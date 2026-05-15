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
# ECOLOGY.tape — architecture-current (editable per v1.2)
# Event history → ECOLOGY.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "ecology" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · ecology substrate — ecological science knowledge SSOT"
  brief = "population ecology · community dynamics · ecosystem function · conservation biology · Anthropocene limits — real-limits anchored · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "ECOLOGY.log.tape"
  scope = "in-silico ecological-science knowledge SSOT · NOT field ecology advice / not a conservation management protocol / not a regulatory or land-use claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see ECOLOGY.log.tape audit"

@N scope_disclaimer := "knowledge-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico ecology substrate. Ecological figures (extinction rates, carrying-capacity estimates, planetary-boundary values) are paraphrased from published ecological literature for modeling context ONLY — they are NOT field-survey protocols, conservation management prescriptions, land-use recommendations, or regulatory guidance. Real conservation decisions require site surveys, population viability analyses, and jurisdiction-specific environmental law."

# ── §1 Population ecology — growth, limits, life-history ──────────────

@D dom_pop_growth := "exponential vs logistic population growth" :: domain [ok]
  exponential = "Malthusian model: dN/dt = rN. Population grows at constant per-capita rate r (intrinsic rate of natural increase) when resources are unlimited. Described by Malthus (1798) in a demographic/economic context; formalised mathematically as the basis for population biology."
  logistic = "Verhulst (1838) added intraspecific competition: dN/dt = rN(1 − N/K). Growth decelerates as population size N approaches carrying capacity K. Sigmoidal trajectory; inflection at K/2 where growth is maximal."
  carrying-capacity = "K is the population ceiling set by resource availability (food, space, territory) in a given environment — an empirical, environment-dependent quantity, not a mathematical constant of the lattice."
  honesty = "The stoichiometric '6' does not appear in population-growth equations; K is environment-specific. Numeric agreement with any lattice token is coincidental observation only."
  |> "[@x_verhulst_1838] · [@x_lotka_1925]"

@D dom_rk_selection := "r/K selection (life-history theory)" :: domain [ok]
  r_selected = "High intrinsic growth rate, small body size, short lifespan, high fecundity, low parental investment. Colonisers / disturbance-adapted species. Examples: insects, annual plants, rodents."
  K_selected = "Slow growth, large body size, long lifespan, low fecundity, high parental investment. Regulated near carrying capacity. Examples: large mammals, trees, sharks."
  MacArthur_Wilson = "The r/K conceptual framework was developed by MacArthur and Wilson (1967) in the context of island biogeography and subsequently expanded as life-history theory (primary authors/era; the terminology 'r/K selection' was consolidated in their work)."
  refinement = "The r/K dichotomy is a heuristic gradient, not a binary; subsequent life-history theory (Grime's CSR, etc.) refined it into multi-axis frameworks. Count of axes varies; no natural n=6 invariant."
  |> "[@x_macarthur_wilson_1967]"

# ── §2 Species interactions — Lotka-Volterra, competition, niche ──────

@D mech_lotka_volterra := "Lotka-Volterra predator-prey dynamics" :: mechanism [ok]
  equations = "Prey: dN/dt = αN − βNP. Predator: dP/dt = δNP − γP. N = prey density, P = predator density; α, β, δ, γ are interaction parameters."
  prediction = "Cyclical population oscillations of prey and predator, out of phase, with period determined by interaction parameters — a mathematical consequence of coupled growth/depletion, not a lattice product."
  origin-lotka = "Alfred Lotka (1925) derived the equations in 'Elements of Physical Biology' from analogy to chemical kinetics."
  origin-volterra = "Vito Volterra (1926) independently derived essentially the same system, motivated by Adriatic fishing data (published in Nature 118:558-560, 1926)."
  empirical-caveat = "Real predator-prey cycles (e.g. lynx/hare) show Lotka-Volterra-like oscillations but damped by habitat complexity, alternative prey, age structure and stochasticity — model is idealised."
  |> "[@x_lotka_1925] · [@x_volterra_1926]"

@D mech_competitive_exclusion := "competitive exclusion principle (Gause 1934)" :: mechanism [ok]
  statement = "Two species competing for the same limiting resource in the same niche cannot stably coexist indefinitely; the superior competitor excludes the other. Also known as Gause's law."
  origin = "Georgy Gause (1934) demonstrated competitive exclusion experimentally with Paramecium species. Primary author/era; exact publication details in [@x_gause_1934]."
  qualification = "Coexistence in nature is maintained by niche differentiation, spatial/temporal heterogeneity, frequency-dependent predation, disturbance, and trade-offs — the exclusion principle defines the lower bound on differentiation required for stable coexistence."
  |> "[@x_gause_1934]"

@D mech_hutchinson_niche := "Hutchinson's niche concept (1957)" :: mechanism [ok]
  fundamental-niche = "The n-dimensional hypervolume in environmental space (temperature, humidity, food size, etc.) within which a species can persist indefinitely without immigration. Introduced by G. Evelyn Hutchinson, 1957 Cold Spring Harbor Symposium."
  realized-niche = "The subset of the fundamental niche actually occupied in the presence of competitors, predators, and parasites. Realized ≤ fundamental by definition."
  citation = "Hutchinson GE (1957) Concluding remarks. Cold Spring Harbor Symposia on Quantitative Biology 22:415-427. The n-dimensional hypervolume formulation."
  honesty = "The 'n' in 'n-dimensional niche' is a species-specific ecological integer, completely independent of and unrelated to the hexa-bio n=6 lattice."
  |> "[@x_hutchinson_1957]"

# ── §3 Community ecology — keystones, foundation species, cascades ────

@D mech_keystone_species := "keystone species concept (Paine 1966)" :: mechanism [ok]
  definition = "A species whose ecological impact is disproportionately large relative to its abundance. Removal causes a structural collapse of the community (loss of species richness or trophic organisation) far exceeding what its biomass fraction would predict."
  origin = "Robert T. Paine's 1966 field experiment removing Pisaster ochraceus (sea star) from intertidal communities in Washington State: mussel (Mytilus) monoculture replaced the previously diverse community. Published Am Nat 100:65-75, 1966."
  examples = "Sea otter/sea urchin/kelp (Estes 1974 era); wolf reintroduction in Yellowstone; fig trees as figs are a keystone food source in many tropical forests."
  |> "[@x_paine_1966] · [@x_estes_1974]"

@D dom_foundation_species := "foundation species" :: domain [ok]
  definition = "Species that define and maintain the physical structure of a community (habitat engineers). Examples: kelp (kelp forests), oysters (reef structure), beavers (dam-created wetlands), Sphagnum moss (bogs)."
  relationship = "Foundation species create habitat that keystone species and many others depend on; their loss cascades structurally, not just trophically."
  honesty = "The category 'foundation species' emerged from community ecology as a descriptive classification, not a lattice-counted set."

@D mech_trophic_cascade := "trophic cascades" :: mechanism [ok]
  definition = "Indirect effects propagating through food webs when a high-trophic predator suppresses herbivores, releasing primary producers — a top-down regulation effect."
  sea-otter = "Estes & Palmisano (1974 era): sea otters suppress sea urchins → urchin grazing on kelp reduced → kelp forest recovers. A documented cascade from Aleutian islands fieldwork."
  freshwater = "Power (1990) documented cascades in river systems: predatory fish suppress invertebrates → algae released. Reference: Power ME (1990) Effects of fish in river food webs. Science 250:811-814."
  top-down-vs-bottom-up = "Whether communities are top-down (predator-controlled) or bottom-up (nutrient/productivity-controlled) varies by ecosystem type — an empirical question, not a lattice-derivable answer."
  |> "[@x_estes_1974] · [@x_power_1990]"

# ── §4 Island biogeography ─────────────────────────────────────────────

@D dom_island_biogeography := "MacArthur & Wilson island biogeography (1967)" :: domain [ok]
  theory = "Species richness on an island reaches an equilibrium between immigration rate (from a mainland source pool) and local extinction rate. Equilibrium species number increases with island area and decreases with distance from the mainland."
  species-area = "Species-area relationship: S ≈ cA^z, where S = species richness, A = island area, c and z are fitted constants (z typically 0.2–0.4 for passive samples). Empirical relationship; parameters vary by taxon and region."
  immigration-extinction = "At equilibrium, immigration rate equals extinction rate; turnover continues — composition shifts even while richness is approximately stable."
  conservation-link = "The theory underpins habitat-patch / reserve design in conservation biology: fragmenting habitat into smaller patches raises extinction rates and lowers equilibrium richness (the 'habitat-island' application)."
  citation = "MacArthur RH, Wilson EO (1967). The Theory of Island Biogeography. Princeton University Press. The foundational monograph."
  |> "[@x_macarthur_wilson_1967]"

# ── §5 Biodiversity ───────────────────────────────────────────────────

@D dom_biodiversity := "biodiversity — definition, dimensions, measurement" :: domain [ok]
  coined = "'Biodiversity' as a compound was coined/popularised around 1986 (E.O. Wilson is commonly credited with popularising it; the 1986 National Forum on BioDiversity colloquium). Prior literature used 'biological diversity'."
  dimensions = "Species richness (count), abundance distribution (evenness), phylogenetic diversity, functional diversity, genetic diversity — not a fixed-count list, not lattice-constrained."
  diversity-indices = "Shannon entropy index H' = -Σ(p_i ln p_i); Simpson's D = 1 - Σp_i². Each is an information-theoretic or probability-based measure; numbers are statistical, not lattice products."
  invasions = "Elton (1958) 'The Ecology of Invasions by Animals and Plants' — early synthesis of the ecological impact of non-native species introductions. Primary author/era citation."
  |> "[@x_elton_1958] · [@x_macarthur_wilson_1967]"

# ── §6 Ecosystem services & the Millennium Ecosystem Assessment ───────

@D dom_ecosystem_services := "ecosystem services framework (MEA 2005)" :: domain [ok]
  framework = "The Millennium Ecosystem Assessment (MEA, 2005) systematised the concept: the benefits humans obtain from ecosystems, classified into provisioning (food, water, fibre, genetic resources), regulating (climate, flood, disease, water purification, pollination), cultural (recreation, aesthetic, spiritual), and supporting (nutrient cycling, soil formation, primary production)."
  origin = "MEA was a 2001–2005 UN-convened assessment involving ~1360 experts. The classification into service categories emerged from the assessment process — the number of categories is a working taxonomy, not a lattice structure."
  policy-use = "The framework became the basis for natural capital accounting, payment-for-ecosystem-services schemes, and biodiversity-policy metrics (e.g. IPBES assessments)."
  honesty = "The count of service categories (provisioning/regulating/cultural/supporting = 4) is a heuristic classification from the MEA report — not a τ(6)=4 derivation. Cited as era/institution."
  |> "[@x_mea_2005]"

# ── §7 Conservation biology — metapopulations, Soulé ─────────────────

@D dom_metapopulation := "metapopulation ecology (Hanski, ~1990s era)" :: domain [ok]
  definition = "A 'population of populations' — a set of local subpopulations connected by dispersal across a fragmented landscape. Local extinctions are rescued by recolonisation from other patches (rescue effect). Subpopulations fluctuate asynchronously, so the metapopulation persists even when individual patches turn over."
  levins-origin = "Formal metapopulation concept introduced by Richard Levins (~1969) in mathematical form; Ilkka Hanski developed empirical metapopulation biology through field studies on Melitaea cinxia (Glanville fritillary) butterflies in Finland during the 1990s, synthesised in Hanski (1999) 'Metapopulation Ecology' book."
  conservation-link = "Metapopulation theory underlies conservation corridor design: maintaining connectivity between habitat patches sustains rescue dynamics and long-term persistence."
  |> "[@x_hanski_1999]"

@D dom_conservation_biology := "conservation biology — emergence (Soulé era)" :: domain [ok]
  founding = "Conservation biology emerged as a formal discipline in the 1970s–1980s. Michael Soulé is widely credited as a founding figure; the Society for Conservation Biology was established 1985; the journal Conservation Biology launched the same year."
  SLOSS = "SLOSS debate (Single Large Or Several Small reserves) was a central early controversy — informed by island biogeography theory and minimum viable population concepts."
  MVP = "Minimum viable population (MVP) — a population size below which demographic stochasticity, genetic drift, environmental stochasticity and catastrophes lead to a high extinction probability within a given timeframe. Quantitative MVPs are species/environment-specific, not lattice constants."
  honesty = "Extinction risk thresholds, reserve sizes, MVP estimates are empirical and species-specific — not lattice-derivable. The founding year and category counts are historical record."

# ── §8 Anthropocene & planetary boundaries ────────────────────────────

@D dom_anthropocene := "Anthropocene concept (Crutzen & Stoermer 2000)" :: domain [ok]
  term-origin = "Paul J. Crutzen and Eugene F. Stoermer proposed 'Anthropocene' as a new geological epoch in the IGBP (International Geosphere-Biosphere Programme) Newsletter in 2000, to characterise the era of dominant human modification of Earth systems."
  earth-system = "Characterised by: accelerating biodiversity loss, land-use change (deforestation, agriculture expansion), nitrogen/phosphorus cycle perturbation, atmospheric CO₂ / greenhouse gas rise, ocean acidification, freshwater extraction exceeding natural replenishment."
  |> "[@x_crutzen_2000]"

@D dom_planetary_boundaries := "planetary boundaries framework (Rockström et al 2009, Steffen et al 2015)" :: domain [ok]
  framework = "A set of Earth-system limits (boundaries) within which humanity can operate safely. Nine boundaries originally proposed: climate change, biodiversity loss, nitrogen/phosphorus cycles, land-system change, freshwater use, ocean acidification, stratospheric ozone depletion, atmospheric aerosol loading, introduction of novel entities."
  2009-paper = "Rockström J et al. A safe operating space for humanity. Nature 2009;461:472-475. Introduced the nine boundaries concept with quantitative proposed limits for each."
  2015-update = "Steffen W et al. Planetary boundaries: Guiding human development on a changing planet. Science 2015;347:1259855. Updated quantification and found four boundaries already transgressed (climate, biodiversity, land-system change, biogeochemical flows)."
  boundary-count = "Nine boundaries is an Earth-system classification based on the assessed major regulation regimes of the Earth System — it is not a lattice number and must not be lattice-fitted."
  |> "[@x_rockstrom_2009] · [@x_steffen_2015]"

# ── §9 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_biodiversity_loss := "modern extinction rate vs background" :: real-limit [ok required]
  wall = "HARD EMPIRICAL LIMIT (population/species irreversibility)"
  statement = "Current vertebrate extinction rates are estimated at 8-100× the background (pre-human) extinction rate. Ceballos et al (2015) estimated that a disproportionate number of vertebrate species have been lost in the past century relative to the expected natural background rate, constituting a 'sixth mass extinction' pulse."
  consequence = "Species extinction is irreversible on human timescales. Loss of keystone/foundation species collapses communities non-linearly. No engineering substitute exists for lost ecological function."
  citation = "Ceballos G et al (2015) Accelerated modern human-induced species losses: entering the sixth mass extinction. Science Advances 1:e1400253."
  |> "[@x_ceballos_2015]"

@D lim_climate_niche_shift := "climate-driven ecological niche displacement" :: real-limit [ok required]
  wall = "HARD WALL (physical climate system)"
  statement = "Species' thermal and precipitation niches are geographically bounded ([@x_hutchinson_1957]). As climate warms, suitable habitat shifts poleward / to higher elevation. Species unable to track the shifting envelope (limited dispersal, habitat barriers, small ranges) face extinction — a hard physical constraint on biological persistence, not a lattice value."
  consequence = "Ecological communities are being restructured by climate in real time; novel species assemblages with no historical analogue are forming. Modelled projections are scenario-dependent; the directional constraint is thermodynamic."
  |> "[@x_rockstrom_2009] · [@x_steffen_2015]"

@D lim_invasive_species := "invasive-species competitive and predatory pressure" :: real-limit [ok required]
  wall = "HARD ECOLOGICAL LIMIT (once established, eradication is typically infeasible at scale)"
  statement = "Once an invasive species establishes and spreads, eradication from large landscapes is rarely achievable. The competitive/predatory/pathogenic pressure exerted by established invaders is a continuing ecological burden — a practical limit on restoration success. Elton (1958) documented the ecological consequences of biological invasions; subsequent literature (Simberloff reviews) confirmed management constraint."
  honesty = "Species counts of invasive species, impact metrics, and management costs are empirical, jurisdiction-specific, and updated continuously — not lattice-derived."
  |> "[@x_elton_1958]"

@D lim_nutrient_overload := "nutrient overloading, eutrophication and dead zones" :: real-limit [ok required]
  wall = "SOFT→HARD WALL (threshold-driven state change)"
  statement = "Excess nitrogen and phosphorus loading from agriculture and sewage drives eutrophication of aquatic systems — algal blooms, hypoxia (dead zones), fish kills. Some lake/coastal systems flip into a turbid, low-diversity stable state that resists return to the clear-water state even after nutrient loads are reduced (hysteresis — a real nonlinear ecological limit, not a lattice-derivable threshold)."
  scope = "The Baltic Sea, Gulf of Mexico, Lake Erie, and hundreds of inland water bodies are documented examples. Planetary boundary for biogeochemical flows is transgressed ([@x_steffen_2015])."
  |> "[@x_galloway_ecology_2003] · [@x_steffen_2015]"

@D lim_carrying_capacity_tradeoff := "human extraction vs ecosystem carrying-capacity tradeoff" :: real-limit [ok required]
  wall = "HARD WALL (conservation biology principle)"
  statement = "Maximum sustainable yield (MSY) — the largest harvest that a renewable natural population can sustain indefinitely — is theoretically at N = K/2 (logistic model maximum growth). In practice, fishing/harvesting at or beyond MSY has driven fisheries collapses (e.g. Atlantic cod). The extraction ceiling is an ecological limit set by population biology, not an arbitrary policy number."
  consequence = "Extraction rates exceeding population renewal rates cause stock collapse; recovery is slow (decades to centuries) or may not occur if the population drops below a minimum viable threshold. The limit is the biology of the target population."
  |> "[@x_lotka_1925] · [@x_volterra_1926]"

# ── §10 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-ecology" :: governance [required deny:write]
  pattern = "Deriving ecological quantities (species counts, trophic levels, biodiversity indices, extinction rates, planetary-boundary counts, population parameters) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'trophic levels = τ=4' or 'extinction rate = σ·(σ-φ)/2' or '6 ecosystem services because n=6'."
  why = "This is exactly the fabrication the pre-rewrite ECOLOGY.tape committed (lattice-tautology stub — see ECOLOGY.log.tape audit). hexa-bio AGENTS.tape @F f1 (lattice-fit-on-external-entity) + @D g1/g2 forbid it. Ecology has no natural n=6 invariant."
  remedy = "Cite real ecological sources (this tape's @X entries). Numbers in ecology (9 planetary boundaries, VII Norwood stages, r/K spectrum, Hutchinson n-dimensional niche) are domain science outcomes — the lattice may only be a coincidental OBSERVATION, never a derivation."

@N n6_honest_stance := "ecology has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: ecology exposes NO natural n=6 invariant. Trophic levels (commonly 3-5, food-web-topology-dependent), planetary-boundary count (9, per Rockström/Steffen — not 6), diversity-index parameters (Shannon H', Simpson D — information-theoretic), species-area exponents (empirical, taxon-specific), MSY at K/2 (logistic model output) — all are empirical/mathematical ecology outputs set by real biology and physics, NOT by σ/τ/φ/J₂. Even the Lotka-Volterra parameter set (α, β, δ, γ = 4 terms) is a mathematical consequence of the coupled ODE structure, not a τ(6)=4 coincidence. Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool) and LATTICE_POLICY: the lattice is declined here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub."

# ── §11 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 Lotka-Volterra oscillation" :: prediction [ok]
  claim = "In a closed two-species predator-prey system with fixed parameters, population densities oscillate with period and amplitude determined by the Lotka-Volterra equations; phase portrait is closed (neutral stability) in the idealised case."
  falsifier = "If a well-controlled experimental microcosm (e.g. Didinium/Paramecium) shows damped or exploding oscillations under constant conditions, the idealised Lotka-Volterra model needs extension (stochastic/structured models) — the basic oscillation prediction stands, the neutral-stability claim may need modification."
  source = "[@x_lotka_1925] · [@x_volterra_1926]"

@D tp_2 := "TP-2 keystone removal cascades species richness" :: prediction [ok]
  claim = "Experimental removal of a confirmed keystone predator (one with disproportionate impact relative to biomass) causes a measurable decline in prey-guild species richness within the community — not merely a numerical change in the keystone's own population."
  falsifier = "If a controlled removal experiment shows that eliminating the putative keystone leaves species richness unchanged or increases it, the keystone designation for that species is incorrect."
  source = "[@x_paine_1966]"

@D tp_3 := "TP-3 species-area power law" :: prediction [ok]
  claim = "For a given taxon and biogeographic region, species richness follows a power-law relationship with island/patch area (S ≈ cA^z, z ≈ 0.2–0.4 for most sampling contexts). Reducing habitat patch area by 90% reduces species richness by approximately 50% (z ≈ 0.3 implies S ∝ A^0.3; 10% of area → ~50% of species)."
  falsifier = "If a well-documented island system shows z > 0.6 or < 0.05 across a wide area range, the standard species-area generalisation for that system needs taxon-specific recalibration — the power-law form itself would remain, but the parameter regime would differ from the canonical range."
  source = "[@x_macarthur_wilson_1967]"

# ── §12 Cross-links ───────────────────────────────────────────────────

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). This tape complies: real ecological science, in-silico knowledge SSOT only, lattice declined as a derivation tool."

@X x_agriculture_sibling := "AGRICULTURE.tape" :: sibling-tape [active]
  scope = "Agriculture substrate — crop/soil/agronomy science SSOT. Ecology and agriculture are related (agroecosystem services, biodiversity-yield tradeoffs) but distinct tapes. See also ECOLOGY-AGRICULTURE-FOOD.tape for the cross-domain sibling."

# ── §13 External citations (real, landmark literature) ────────────────
# Where a specific bibliographic detail is not asserted with confidence,
# the entry names the primary author + era only and says so explicitly.

@X x_verhulst_1838 := "Verhulst 1838 (logistic growth)" :: literature [active]
  ref = "Verhulst PF. Notice sur la loi que la population suit dans son accroissement. Correspondance Mathématique et Physique 1838;10:113-121. (logistic equation; carrying capacity K; sigmoidal growth; primary author/era cited, article accessible in historical archives)"

@X x_lotka_1925 := "Lotka 1925 — Elements of Physical Biology" :: literature [active]
  ref = "Lotka AJ. Elements of Physical Biology. Williams & Wilkins, Baltimore, 1925. (derivation of predator-prey equations from chemical-kinetics analogy; foundational for mathematical population ecology)"

@X x_volterra_1926 := "Volterra 1926 Nature" :: literature [active]
  ref = "Volterra V. Fluctuations in the abundance of a species considered mathematically. Nature 1926;118:558-560. (independent derivation of Lotka-Volterra equations motivated by Adriatic fishery data)"

@X x_gause_1934 := "Gause 1934 — competitive exclusion (author/era)" :: literature [active]
  ref = "G.F. Gause — experimental demonstration of competitive exclusion with Paramecium species (~1934). Primary author/era cited. The competitive exclusion principle (Gause's law) is the principal contribution; exact journal volume not asserted."

@X x_hutchinson_1957 := "Hutchinson 1957 Cold Spring Harbor Symp" :: literature [active]
  ref = "Hutchinson GE. Concluding remarks. Cold Spring Harbor Symposia on Quantitative Biology 1957;22:415-427. (n-dimensional hypervolume niche concept; fundamental vs realized niche; foundational community ecology theory)"

@X x_paine_1966 := "Paine 1966 Am Nat (keystone species)" :: literature [active]
  ref = "Paine RT. Food web complexity and species diversity. American Naturalist 1966;100:65-75. (experimental Pisaster removal establishing the keystone-species concept in Washington State intertidal)"

@X x_estes_1974 := "Estes & Palmisano 1974 (sea otter, trophic cascade) — author/era" :: literature [active]
  ref = "J.A. Estes & J.F. Palmisano — sea otter / sea urchin / kelp trophic cascade, Aleutian islands (~1974). Primary author/era cited; established the iconic top-down cascade example. Exact journal/volume not asserted."

@X x_macarthur_wilson_1967 := "MacArthur & Wilson 1967 — Island Biogeography" :: literature [active]
  ref = "MacArthur RH, Wilson EO. The Theory of Island Biogeography. Princeton University Press, Princeton NJ, 1967. (immigration-extinction equilibrium; species-area relationship; r/K selection context; foundational conservation-biology basis)"

@X x_elton_1958 := "Elton 1958 — Ecology of Invasions (author/era)" :: literature [active]
  ref = "Charles S. Elton. The Ecology of Invasions by Animals and Plants. Methuen, London, 1958. (early synthesis of the ecological consequences of biological invasions; primary author/era)"

@X x_power_1990 := "Power 1990 Science (trophic cascade, river food webs) — author/era" :: literature [active]
  ref = "M.E. Power. Effects of fish in river food webs. Science 1990;250:811-814. (cascading effects of predatory fish on invertebrates and algae; freshwater trophic cascade; primary author/era)"

@X x_hanski_1999 := "Hanski 1999 — Metapopulation Ecology (author/era)" :: literature [active]
  ref = "I. Hanski. Metapopulation Ecology. Oxford University Press, 1999. (synthesis of empirical metapopulation biology from Glanville fritillary butterfly fieldwork; conservation corridor theory; primary author/era)"

@X x_crutzen_2000 := "Crutzen & Stoermer 2000 IGBP Newsletter (author/era)" :: literature [active]
  ref = "P.J. Crutzen and E.F. Stoermer. The Anthropocene. IGBP (International Geosphere-Biosphere Programme) Newsletter 2000;41:17-18. (coining/proposal of the Anthropocene epoch; primary author/era)"

@X x_rockstrom_2009 := "Rockström et al 2009 Nature" :: literature [active]
  ref = "Rockström J et al. A safe operating space for humanity. Nature 2009;461:472-475. (planetary boundaries framework — nine Earth-system boundaries; quantitative proposed limits; safe operating space concept)"

@X x_steffen_2015 := "Steffen et al 2015 Science" :: literature [active]
  ref = "Steffen W et al. Planetary boundaries: Guiding human development on a changing planet. Science 2015;347:1259855. (updated planetary boundaries; identified four already-transgressed boundaries: climate change, biodiversity loss, land-system change, biogeochemical flows)"

@X x_ceballos_2015 := "Ceballos et al 2015 Sci Adv" :: literature [active]
  ref = "Ceballos G et al. Accelerated modern human-induced species losses: entering the sixth mass extinction. Science Advances 2015;1:e1400253. (modern vertebrate extinction rates 8-100× background; sixth mass extinction pulse; population and species loss quantification)"

@X x_mea_2005 := "Millennium Ecosystem Assessment 2005 (MEA) — institution/era" :: literature [active]
  ref = "Millennium Ecosystem Assessment. Ecosystems and Human Well-being: Synthesis. Island Press, Washington DC, 2005. (systematic classification of ecosystem services into provisioning / regulating / cultural / supporting categories; UN-convened, ~1360 experts, 2001-2005)"

@X x_galloway_ecology_2003 := "Galloway et al 2003 (reactive nitrogen / eutrophication) — author/era" :: literature [active]
  ref = "J.N. Galloway and colleagues — global reactive-nitrogen cycling and the ecological consequences of anthropogenic nitrogen fixation, including eutrophication pathways (~2003 era; exact journal/volume not asserted; Galloway's body of work on the nitrogen cascade is the authoritative reference base)."
