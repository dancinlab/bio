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
# BAKING.tape — architecture-current (editable per v1.2)
# Event history → BAKING.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "baking" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · baking substrate — cereal chemistry and baking science knowledge SSOT"
  brief = "wheat flour composition · gluten network · leavening · Maillard reaction · starch gelatinization · staling — real-limits anchored · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "BAKING.log.tape"
  scope = "in-silico cereal-chemistry knowledge SSOT · NOT food-safety advice / not a bakery protocol / not a clinical or regulatory claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see BAKING.log.tape audit"

@N scope_disclaimer := "knowledge-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico cereal-chemistry and baking substrate. Figures (temperature ranges, composition percentages, reaction thresholds) are paraphrased from published food-science and cereal-chemistry literature for modeling context ONLY — they are NOT a bakery formulation, food-safety protocol, or dietary/clinical recommendation. Real baking decisions require validated recipes, HACCP plans, allergen management, and jurisdiction-specific food-safety regulation."

# ── §1 Wheat flour composition ─────────────────────────────────────────

@D dom_flour_composition := "wheat flour composition" :: domain [ok]
  starch = "Starch is the dominant component of white wheat flour (~68–75% dry weight): a mixture of amylose (~25–28%; linear α-1,4-glucan chains) and amylopectin (~72–75%; highly branched α-1,4 with α-1,6 branch points). The amylose/amylopectin ratio is a wheat-variety characteristic that affects gelatinization temperature and retrogradation rate."
  protein = "Total protein typically ~8–14% (flour dry weight basis), depending on wheat variety and growing conditions. The storage proteins gliadin (monomeric, prolamins) and glutenin (polymeric, glutenins — HMW and LMW subunits) are the gluten precursors: hydration + mechanical work causes them to associate into the viscoelastic gluten network."
  lipids = "Flour lipids (~1–2%) are disproportionately important to baking: polar lipids (glycolipids, phospholipids) stabilize gas-cell interfaces in dough, interact with gluten proteins, and influence loaf volume."
  pentosans = "Non-starch polysaccharides — especially arabinoxylans (pentosans, ~2–3% of flour) — bind large amounts of water (up to 10× their own weight) and influence dough rheology and bread crumb texture."
  honesty = "Composition ranges cited above are typical literature ranges for bread wheat (Triticum aestivum); they vary by variety, growing environment, and milling extraction rate — they are empirical descriptions, not lattice values."
  |> "[@x_pomeranz_1988] · [@x_hoseney_1994]"

@D mech_gluten_network := "gluten network formation and viscoelasticity" :: mechanism [ok]
  precursors = "Dry flour contains gliadin + glutenin as separate, inactive storage proteins. On hydration, they begin to associate; kneading imparts mechanical energy that drives disulfide-bond (S-S) formation between cysteine residues, forming extended glutenin macropolymers."
  hmw-lmw = "HMW glutenin subunits (encoded at the Glu-1 loci on homeologous chromosomes 1A/1B/1D) provide an 'elastic backbone'; LMW glutenin subunits and gliadins fill the network and contribute extensibility. HMW subunit composition is the primary genetic determinant of bread-making quality (Shewry et al.)."
  viscoelasticity = "The resulting gluten network is uniquely viscoelastic: elastic (stores energy on deformation, recovers on release — dough springs back) and viscous (flows slowly under sustained stress — dough is workable). This rheological duality is what traps CO₂ during fermentation and allows oven-spring."
  oxidation = "Oxidizing improvers (e.g. ascorbic acid at flour-oxidation level) strengthen the network by promoting additional S-S bonds; reducing agents (cysteine, excess protease) relax it — both are cereal-chemistry controls, not lattice parameters."
  |> "[@x_shewry_2009] · [@x_belton_1999]"

# ── §2 Leavening mechanisms ────────────────────────────────────────────

@D mech_biological_leavening := "biological leavening — Saccharomyces cerevisiae" :: mechanism [ok]
  fermentation = "Baker's yeast (Saccharomyces cerevisiae) ferments sugars (mono- and disaccharides available from flour amylase activity + added sugars) via glycolysis → pyruvate → ethanol + CO₂ (anaerobic, dominant in dough) and some aerobic respiration at the dough surface."
  co2-role = "CO₂ production inflates existing gas nuclei already present from mixing; it does NOT create new bubbles de novo in properly mixed dough. Gas retention depends on gluten-network integrity (see [@mech_gluten_network])."
  temperature-dependence = "Yeast activity peaks roughly 25–35°C and is retarded below ~10°C (retarded fermentation) and killed above ~55–60°C. These temperature bounds are microbiology, not lattice schedules."
  flavour = "Secondary metabolic products (organic acids, esters, higher alcohols from yeast + any endogenous flour bacteria) contribute bread flavour complexity. Fermentation time and temperature management shapes this flavour profile."
  |> "[@x_reed_nagodawithana_1991]"

@D mech_sourdough_leavening := "sourdough leavening — mixed culture (LAB + wild yeast)" :: mechanism [ok]
  ecology = "Sourdough starters are complex ecosystems of lactic acid bacteria (LAB; principally heterofermentative species such as Fructilactobacillus sanfranciscensis / Limosilactobacillus fermentum clade, and homofermentative species) and wild yeasts (often Kazachstania humilis / Candida humilis) in a stable, mutually reinforcing community."
  acids = "LAB produce lactic acid (homofermentative) and lactic + acetic acid + CO₂ + ethanol (heterofermentative); the lactic:acetic ratio governs flavour profile (milder vs tangier). Acidification lowers dough pH, affecting gluten properties, proteolysis, and crust Maillard reactions."
  co2 = "Wild-yeast component provides CO₂ leavening; LAB provide acid + flavour; the two populations interact metabolically (LAB produce CO₂/ethanol that yeasts can use; yeasts liberate vitamins LAB require — mutualism)."
  stability = "Stable sourdough microbiota is maintained by selective pressure: low pH and competition from established strains excludes pathogens and commensals. Starter stability is a real-ecology limit (see [@lim_starter_ecology])."
  |> "[@x_ganzle_2014] · [@x_de_vuyst_2014]"

@D mech_chemical_leavening := "chemical leavening — baking soda and baking powder" :: mechanism [ok]
  baking-soda = "Sodium bicarbonate (NaHCO₃) reacts with acid present in the batter (buttermilk, yogurt, brown sugar, cocoa — acidic components) to release CO₂. Net: NaHCO₃ + H⁺ → CO₂ + H₂O + salt. Requires stoichiometric acid."
  baking-powder = "Baking powder is NaHCO₃ + solid acid (monocalcium phosphate, sodium aluminum sulfate, etc.) + inert starch diluent; double-acting formulations release CO₂ in two phases — on mixing (acid-base) and in the oven (heat-triggered). This is applied acid-base chemistry, not a lattice schedule."
  ph-effect = "Excess NaHCO₃ (over-base) → alkaline residue → soapy flavour and browning suppression; under-dosing yields dense product. pH management is a formulation constraint grounded in food-acid chemistry."
  |> "[@x_hoseney_1994]"

# ── §3 Maillard reaction (browning, flavour, colour) ──────────────────

@D mech_maillard := "Maillard reaction — mechanism and baking significance" :: mechanism [ok]
  discovery = "First described by Louis-Camille Maillard (French chemist/physician) in 1912: reducing sugars react with free amino groups (amino acids, protein N-termini, lysine ε-amino) in a complex cascade."
  hodge-mechanism = "John E. Hodge's 1953 mechanistic framework (J Agric Food Chem 1:928–943) remains the canonical mechanistic scaffold: (1) condensation of reducing sugar + amine → N-substituted glycosylamine; (2) Amadori rearrangement → 1-amino-1-deoxy-2-ketose (Amadori product); (3) degradation of Amadori compound → α-dicarbonyl intermediates (deoxyosones, reductones); (4) further condensation/polymerization → high-molecular-weight nitrogenous brown pigments (melanoidins). Hundreds of volatile flavour compounds arise from parallel fragmentation pathways."
  strecker = "Strecker degradation: α-amino acids react with α-dicarbonyls to yield Strecker aldehydes (the key aroma aldehydes characteristic of baked goods — maltol, furaneol, etc.) + CO₂ + ammonia. This is a sub-reaction within the Maillard cascade."
  drivers = "Maillard rate increases with: higher temperature, lower water activity (a_w), higher pH (alkaline speeds reaction; acidic dough retards — important for bread vs pretzel browning). At bakery conditions (surface temperatures >150°C, low surface a_w in crust), the reaction proceeds rapidly; interior crumb is too moist and cool to brown."
  |> "[@x_maillard_1912] · [@x_hodge_1953]"

@D mech_caramelization := "caramelization — sugar pyrolysis (no nitrogen)" :: mechanism [ok]
  distinction = "Caramelization is thermally induced sugar pyrolysis above approximately 160°C (sucrose: ~186°C; fructose: ~103°C; glucose: ~146°C) — no amino/protein reactant required, unlike the Maillard reaction. The two browning mechanisms coexist on bread crust but are mechanistically distinct."
  products = "Caramelization produces: invert sugar (sucrose hydrolysis by heat), dehydration products (anhydrosugars), polymerization to caramel-flavoured polymers (dark brown). Gives caramel aroma/colour notes; contributes to crust sweetness and colour distinct from Maillard-derived flavours."
  baking-context = "On bread crust, both caramelization and Maillard reactions occur simultaneously above ~150°C; below that temperature and in the moist interior, neither proceeds at meaningful rate."
  |> "[@x_hoseney_1994] · [@x_hodge_1953]"

# ── §4 Starch gelatinization and retrogradation (staling) ─────────────

@D mech_gelatinization := "starch gelatinization" :: mechanism [ok]
  mechanism = "On heating in excess water (~55–85°C for wheat starch, depending on starch type and test method), crystalline regions of starch granules absorb water and melt: granules swell irreversibly, lose birefringence, and amylose leaches into solution. The resulting hot paste is a semi-gel."
  temperature = "Gelatinization onset/peak/completion temperatures for wheat starch are typically reported in the range ~58–65°C (onset) to ~75°C (completion) under excess water conditions (DSC; literature varies with water content and heating rate — these are empirical ranges, not a designed lattice bracket)."
  role-in-baking = "Gelatinization irreversibly transforms raw dough to the semi-solid crumb during baking. Gluten network sets simultaneously as egg/gluten proteins denature, and oven-spring concludes as the starch paste gels around the gas cell structure."
  |> "[@x_goesaert_2005]"

@D mech_retrogradation := "starch retrogradation and bread staling" :: mechanism [ok]
  mechanism = "On cooling and subsequent storage, gelatinized starch re-orders: amylose retrogrades rapidly (hours; gels); amylopectin retrogrades slowly (days–weeks; crystallizes partially). Recrystallized amylopectin is the primary molecular cause of bread crumb firming (staling)."
  kinetics = "Amylopectin retrogradation kinetics are temperature-dependent: fastest around 4–7°C (refrigerator temperature accelerates staling — a counterintuitive but well-established finding); storage at room temperature or frozen retards it by different mechanisms."
  remedies = "Staling is retarded by: emulsifiers (DATEM, mono-/diglycerides) that complex amylose and hinder retrogradation; amylase (bacterial or fungal) added to flour that degrades amylopectin side-chains; higher water content; sourdough acids (lower pH affects starch-network interactions)."
  |> "[@x_goesaert_2005]"

# ── §5 Bread quality factors ───────────────────────────────────────────

@D dom_bread_quality := "key bread quality factors" :: domain [ok]
  hydration = "Hydration (water:flour ratio, baker's percent) governs dough workability and final crumb open-ness. Higher hydration → more open, irregular crumb (ciabatta/baguette style) but demands stronger gluten and skilled handling. Lower hydration → tighter, more even crumb (sandwich loaf). No lattice number prescribes optimal hydration — it is variety/formulation-specific."
  fermentation-time = "Extended fermentation (slow proofing, retarded at low temperature) allows more complete starch hydrolysis by flour amylases (more fermentable sugars), deeper flavour development (Strecker/Maillard precursors), and gluten relaxation by limited proteolysis. Over-fermentation exhausts fermentable sugars and weakens gluten via acid proteolysis."
  gluten-strength = "Flour protein quality (HMW glutenin composition — see [@mech_gluten_network]) sets the ceiling on gluten strength. Under-developed gluten cannot retain CO₂; over-developed gluten is tough and inhibits oven-spring."
  baking-temperature = "Baking temperature governs oven-spring duration, crust Maillard/caramelization, starch gelatinization rate, and final water-activity of crust and crumb. Typical deck-oven temperatures for bread are 220–250°C — empirical baking practice, not a lattice schedule."
  oven-spring = "The rapid volume increase in the first minutes of baking results from CO₂ thermal expansion, rapid yeast activity burst (before it is killed ~55–60°C), ethanol vaporisation, and water-vapor pressure — simultaneous physics, not a lattice product."
  |> "[@x_cauvain_young_2006] · [@x_hoseney_1994]"

# ── §6 Acrylamide (Maillard side-reaction, regulatory limit) ──────────

@D mech_acrylamide := "acrylamide formation — Maillard side-reaction from asparagine" :: mechanism [ok]
  discovery = "Acrylamide (CH₂=CH-CO-NH₂; a probable human carcinogen, IARC Group 2A) was discovered in heat-processed foods in 2002 (Tareke et al.); prior to this it was not thought to form in food."
  pathway = "The dominant pathway in cereal/potato foods: free asparagine (abundant amino acid in flour/potato) reacts with reducing sugars under the Maillard conditions (>120°C, low water activity) — the same conditions that generate beneficial crust colour and flavour, but producing acrylamide as a side-product."
  mitigation = "Formation rises steeply above ~120°C and with pH; it is mitigated by: lower baking temperature/time (but at a colour/flavour trade-off); pH reduction (acidification suppresses asparagine reaction); asparaginase enzyme treatment to deplete free asparagine before baking; selecting low-asparagine wheat varieties."
  regulatory = "EU Commission Regulation (EU) 2017/2158 sets benchmark levels for acrylamide in various food categories; national food-safety authorities worldwide apply similar monitoring frameworks. This is a real regulatory limit, not a designed lattice ceiling."
  |> "[@x_stadler_2002] · [@x_mottram_2002]"

# ── §7 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_celiac := "celiac disease / gluten sensitivity — absolute exclusion limit" :: real-limit [ok required]
  wall = "HARD WALL (immunological)"
  statement = "In individuals with celiac disease, ingestion of gluten (gliadin + glutenin from wheat, rye, barley) triggers a T-cell-mediated autoimmune response damaging small-intestinal villi. There is NO safe gluten threshold for confirmed celiacs — the limit is effectively zero. Wheat-based baked goods are incompatible with a celiac diet regardless of processing."
  prevalence = "Celiac disease affects roughly 1% of the global population (author/era: Catassi; Lebwohl — exact figures are population-study-dependent; Catassi-era literature commonly cited)."
  consequence = "Gluten-containing baked goods cannot be rendered celiac-safe by any reduction in gluten content short of total elimination; complete reformulation to gluten-free starches/flours is required. Non-celiac gluten sensitivity (NCGS) is a clinically recognized but less defined entity with a lower absolute limit."
  |> "[@x_catassi_2015] · [@x_lebwohl_2015]"

@D lim_retrogradation_staling := "starch retrogradation — staling kinetic limit" :: real-limit [ok required]
  wall = "SOFT WALL (thermodynamic/kinetic — manageable but not eliminated)"
  statement = "Amylopectin retrogradation is thermodynamically driven and cannot be stopped completely — only retarded. At ambient temperature, wheat-bread crumb firmness increases measurably within 24 hours and substantially within 3–4 days; this is a physical process intrinsic to the starch gel, not a formulation failure."
  consequence = "Shelf-life of unmodified bread is physically bounded by retrogradation kinetics. Industrial remediation (emulsifiers, amylases, sourdough acidification, modified-atmosphere packaging) extends shelf life but does not arrest retrogradation — each remedy shifts the onset, not the inevitability."
  |> "[@x_goesaert_2005]"

@D lim_acrylamide_regulatory := "acrylamide formation — regulatory and toxicological limit" :: real-limit [ok required]
  wall = "HARD REGULATORY LIMIT (IARC Group 2A + EU/national food-safety framework)"
  statement = "Acrylamide formation from asparagine + reducing sugars at elevated temperature is an inherent Maillard side-reaction chemistry that cannot be entirely avoided in baked/toasted cereal products without unacceptable loss of colour and flavour. Regulatory benchmarks define the maximum tolerated levels; formation rises steeply with temperature and time beyond ~120°C."
  consequence = "There is a real temperature-time-colour/flavour trade-off: sufficient browning (flavour/aesthetics) inevitably generates some acrylamide; minimization requires process optimization and ingredient selection, not lattice constants."
  |> "[@x_stadler_2002] · [@x_mottram_2002]"

@D lim_allergen_crosscontact := "allergen cross-contact — the hard 'ppm' floor" :: real-limit [ok required]
  wall = "HARD WALL (regulatory/biological — effective detection floor)"
  statement = "Wheat (gluten), milk, eggs, tree nuts, sesame, soy, peanuts, and other major allergens in bakery goods pose cross-contact risk. Regulatory thresholds for 'gluten-free' labeling (typically ≤20 ppm gluten by Codex standard) define the practical detection and biological-response floor; below it is effectively undetectable, above it triggers immune responses in sensitized individuals."
  consequence = "Bakery environments that handle both standard and 'free-from' products cannot eliminate cross-contact without strict physical separation and validated cleaning procedures. This is a food-safety engineering constraint, not a lattice product."

@D lim_starter_ecology := "sourdough starter stability — lactic-bacteria/yeast ecology limit" :: real-limit [ok required]
  wall = "SOFT WALL (ecological — intrinsically dynamic)"
  statement = "Sourdough starter microbiota is a living community under continuous selective pressure. While well-maintained starters exhibit remarkable stability over years (acidic pH + established strain competition excludes most contaminants), the community composition drifts in response to flour source, hydration, temperature regime, and refreshment interval. A starter is not a fixed biological entity."
  consequence = "Reproducible sourdough properties require consistent process management — fixed flour, water, temperature, and refreshment schedule; changing any parameter risks community shift and unpredictable fermentation outcome. This ecological instability is not a controllable lattice parameter."
  |> "[@x_ganzle_2014] · [@x_de_vuyst_2014]"

# ── §8 n=6 lattice stance (HONEST — observation, not derivation) ──────

@F f_lattice_fit := "lattice-fit-on-baking-chemistry" :: governance [required deny:write]
  pattern = "Deriving baking quantities (oven temperature, protein percentage, Maillard onset, starch gelatinization range, leavening gas volumes, stage counts) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'optimal bake temperature = 240°C because J₂×10' or 'gluten has 12 fraction types because σ=12' or 'dough passes through 4 stages because τ=4'."
  why = "This is exactly the fabrication the pre-rewrite BAKING.tape committed (~379 lines of `@D row_*` / `@D b_*` lattice-tautology entries with `n_6 = \"σ=12\"`, `n_6 = \"τ=4\"`, `x=\"EXACT\"` — zero real science, all values derived from lattice constants. See BAKING.log.tape audit). hexa-bio AGENTS.tape @F f1 (lattice-fit-on-external-entity) + @D g1/g2 forbid it."
  remedy = "Cite real cereal-chemistry/baking-science sources (this tape's @X entries). Temperature/ratio/composition numbers are empirical food-science measurements; the lattice may only be a coincidental OBSERVATION, never a derivation."

@N n6_honest_stance := "baking chemistry has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: baking chemistry and cereal science expose NO natural n=6 invariant. Wheat starch amylose/amylopectin ratio, flour protein content (8–14%), Maillard onset temperature (~120°C), starch gelatinization range (~58–75°C), fermentation stages, and leavening-gas volumes are empirical food-science quantities determined by polymer physics, organic chemistry, microbiology, and thermodynamics — NOT by σ/τ/φ/J₂. The number of main flour fractions, leavening types, or browning reactions is a biochemical taxonomy (evolving as understanding deepens), not an n=6-constrained set. Any numeric coincidences (e.g. 'gluten has ~2 main protein types' — actually 4+ fractions of gliadin + glutenin subunits) are OBSERVATION ONLY, not derivations. Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool) and LATTICE_POLICY: the lattice is declined here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub."

# ── §9 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 Maillard onset temperature" :: prediction [ok]
  claim = "Maillard browning in cereal systems does not proceed at detectable rate below approximately 120°C at low water activity; measurable colour development and characteristic aroma compound production is observed only above this threshold."
  falsifier = "If a controlled baking experiment at ≤100°C and sub-0.6 water activity shows equivalent Maillard colour/aroma development to a >120°C control, the temperature-dependence model ([@mech_maillard]) is wrong."
  source = "[@x_hodge_1953] · [@x_stadler_2002]"

@D tp_2 := "TP-2 staling acceleration in refrigerator" :: prediction [ok]
  claim = "Bread stored at ~4°C (refrigerator) firms faster than equivalent bread stored at room temperature (~20°C) because amylopectin retrogradation kinetics peak in the refrigerator temperature range — counterintuitive to naive expectation."
  falsifier = "If a controlled staling trial (texture-profile analysis of crumb firmness) shows refrigerated bread softening or firming at a rate equal to or slower than room-temperature control, [@mech_retrogradation] is wrong."
  source = "[@x_goesaert_2005]"

@D tp_3 := "TP-3 sourdough acidification reduces staling" :: prediction [ok]
  claim = "Sourdough bread (lower crumb pH from LAB-produced organic acids) shows slower crumb firming over equivalent storage time than comparable yeast-only bread, consistent with acid effects on starch-gluten network interactions."
  falsifier = "If a matched-pH-controlled trial (sourdough vs direct-yeast, identical formula/process except starter type) shows equivalent crumb firmness curves, the acid–retrogradation interaction ([@mech_retrogradation]) is overstated."
  source = "[@x_ganzle_2014] · [@x_goesaert_2005]"

# ── §10 Cross-links ───────────────────────────────────────────────────

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). This tape complies: real cereal-chemistry science, in-silico knowledge SSOT only, lattice declined as a derivation tool."

# ── §11 External citations (real, landmark literature) ────────────────
# Where a specific bibliographic detail is not asserted with confidence,
# the entry names the primary author + era only and says so explicitly.

@X x_maillard_1912 := "Maillard LC 1912 (primary-author/era)" :: literature [active]
  ref = "L.-C. Maillard — first description of the reaction between reducing sugars and amino acids (primary author/era; original publication in French: C R Acad Sci ~1912 era; exact volume not asserted). Basis for [@mech_maillard]."

@X x_hodge_1953 := "Hodge JE 1953" :: literature [active]
  ref = "Hodge JE. Dehydrated foods: chemistry of browning reactions in model systems. J Agric Food Chem 1953;1:928–943. (canonical Maillard reaction mechanism framework — glycosylamine → Amadori → α-dicarbonyl → melanoidins)"

@X x_ganzle_2014 := "Gänzle MG 2014" :: literature [active]
  ref = "Gänzle MG. Enzymatic and bacterial conversions during sourdough fermentation. Food Microbiol 2014;37:2–10. (sourdough LAB/wild-yeast ecology, heterofermentative metabolism, organic-acid production, lactic:acetic ratio)"

@X x_de_vuyst_2014 := "De Vuyst & Neysens 2005 / De Vuyst lab era" :: literature [active]
  ref = "De Vuyst L and colleagues — systematic reviews of sourdough LAB/yeast communities and their metabolic interactions (primary author/era reference; key reviews published ~2005–2014 in Trends Food Sci Technol and related journals; exact volume not asserted)."

@X x_shewry_2009 := "Shewry PR et al 2009" :: literature [active]
  ref = "Shewry PR, Halford NG, Belton PS, Tatham AS. The structure and properties of gluten: an elastic protein from wheat grain. Philos Trans R Soc Lond B Biol Sci 2002;357:133–142. (HMW/LMW glutenin subunits, gluten viscoelasticity — primary Shewry gluten review; era and title cited as representative of Shewry's body of work; exact 2009 volume not asserted)"

@X x_belton_1999 := "Belton PS 1999" :: literature [active]
  ref = "Belton PS. On the elasticity of wheat gluten. J Cereal Sci 1999;29:103–107. (gluten network rheological model, disulfide-bond network, viscoelasticity)"

@X x_pomeranz_1988 := "Pomeranz Y — Wheat: Chemistry and Technology (textbook, era ~1988)" :: literature [active]
  ref = "Pomeranz Y (ed.). Wheat: Chemistry and Technology, 3rd ed. AACC International, 1988. (comprehensive reference for wheat flour composition: starch amylose/amylopectin, protein fractions, lipids, pentosans — primary textbook, era cited; exact chapter/page not asserted)"

@X x_hoseney_1994 := "Hoseney RC — Principles of Cereal Science and Technology (textbook, era ~1994)" :: literature [active]
  ref = "Hoseney RC. Principles of Cereal Science and Technology, 2nd ed. AACC International, 1994. (foundation cereal-science text covering flour composition, leavening mechanisms, chemical leavening, baking reactions — primary author/era cited)"

@X x_goesaert_2005 := "Goesaert H et al 2005" :: literature [active]
  ref = "Goesaert H, Brijs K, Veraverbeke WS, Courtin CM, Gebruers K, Delcour JA. Wheat flour constituents: how they impact bread quality, and how to impact their functionality. Trends Food Sci Technol 2005;16:12–30. (starch gelatinization, retrogradation/staling mechanism, emulsifier/amylase remediation — comprehensive bread-staling review)"

@X x_cauvain_young_2006 := "Cauvain SP & Young LS — Baked Products (textbook, era ~2006)" :: literature [active]
  ref = "Cauvain SP, Young LS. Baked Products: Science, Technology and Practice. Blackwell Publishing, 2006. (bread quality factors: hydration, fermentation, gluten strength, oven temperature, oven-spring — primary textbook reference; era cited)"

@X x_reed_nagodawithana_1991 := "Reed G & Nagodawithana TW — Yeast Technology (era ~1991)" :: literature [active]
  ref = "Reed G, Nagodawithana TW. Yeast Technology, 2nd ed. Van Nostrand Reinhold, 1991. (Saccharomyces cerevisiae fermentation metabolism, baker's yeast CO₂ production, temperature dependence — primary author/era cited; standard yeast technology reference)"

@X x_stadler_2002 := "Stadler RH et al 2002" :: literature [active]
  ref = "Stadler RH, Blank I, Varga N, Robert F, Hau J, Guy PA, Robert MC, Riediker S. Acrylamide from Maillard reaction products. Nature 2002;419:449–450. (acrylamide discovery in heat-processed foods; asparagine + reducing sugar → acrylamide pathway confirmation)"

@X x_mottram_2002 := "Mottram DS, Wedzicha BL, Dodson AT 2002" :: literature [active]
  ref = "Mottram DS, Wedzicha BL, Dodson AT. Acrylamide is formed in the Maillard reaction. Nature 2002;419:448–449. (parallel concurrent discovery of acrylamide formation from asparagine in Maillard reactions — same Nature issue as Stadler 2002)"

@X x_catassi_2015 := "Catassi C et al (celiac epidemiology, era ~2015)" :: literature [active]
  ref = "Catassi C and colleagues — celiac disease global epidemiology, prevalence ~1% (primary author/era cited; key review publications in J Pediatr Gastroenterol Nutr and Gastroenterology; exact volume not asserted). Basis for [@lim_celiac]."

@X x_lebwohl_2015 := "Lebwohl B, Ludvigsson JF, Green PHR 2015" :: literature [active]
  ref = "Lebwohl B, Ludvigsson JF, Green PHR. Celiac disease and non-celiac gluten sensitivity. BMJ 2015;351:h4347. (celiac vs NCGS clinical distinction, zero-gluten threshold for celiacs, Codex 20 ppm standard)"
