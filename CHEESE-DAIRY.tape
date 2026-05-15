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
# CHEESE-DAIRY.tape — architecture-current (editable per v1.2)
# Event history → CHEESE-DAIRY.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "cheese-dairy" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · cheese and dairy chemistry substrate — dairy science knowledge SSOT"
  brief = "milk composition · casein micelle models · cheesemaking unit operations · ripening biochemistry · lactose intolerance genetics · probiotic context — real-limits anchored · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "CHEESE-DAIRY.log.tape"
  scope = "in-silico dairy-chemistry knowledge SSOT · NOT food-safety guidance / dietary advice / clinical or regulatory claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see CHEESE-DAIRY.log.tape audit"

@N scope_disclaimer := "knowledge-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico dairy-chemistry substrate. Compositional figures, enzymatic parameters, and microbiology facts are paraphrased from published dairy-science literature for modeling context ONLY — they are NOT food-safety guidance, dietary advice, a cheesemaking protocol, or a clinical/nutritional claim. Real production decisions require food-science expertise and jurisdiction-specific food-safety regulation."

# ── §1 Milk composition ───────────────────────────────────────────────

@D dom_milk_composition := "bovine milk gross composition" :: domain [ok]
  water = "~87% by mass. The continuous phase of milk as a colloidal system."
  fat = "~3.5–4% (breed-variable; Jersey > Holstein). Secreted as membrane-enveloped fat globules (milk-fat globule membrane, MFGM — phospholipid/protein). Emulsified by the MFGM, not by caseins."
  total-protein = "~3.2–3.4%. Partitioned into casein (~80% of total protein) and whey (~20%)."
  lactose = "~4.7–4.9%. The dominant disaccharide (galactose + glucose); principal fermentable substrate for lactic acid bacteria in cheesemaking. See [@dom_lac_intolerance] for genetics."
  minerals = "~0.7%. Calcium and phosphate quantitatively dominant; ~67% of Ca is colloidal (bound to casein micelles as calcium phosphate clusters); remainder ionic. Mg, K, Na also present."
  honesty = "Figures are representative ranges for bovine milk; breed, season, feed, and mastitis status shift them — these are not lattice-derived constants."
  |> "[@x_fox_cheese] · [@x_walstra_dairy]"

@D dom_casein_proteins := "casein fractions — α-s1, α-s2, β, κ" :: domain [ok]
  alpha-s1 = "αs1-casein: most abundant casein in bovine milk (~38% of casein). High phosphoserine content → strong calcium-sensitivity; binds calcium phosphate clusters."
  alpha-s2 = "αs2-casein: ~10% of casein. Highest phosphorylation level; also cysteine-containing (disulfide bonds possible). Most calcium-sensitive fraction."
  beta = "β-casein: ~36% of casein. Amphipathic; the most hydrophobic casein; releases β-casomorphins on proteolysis. Temperature-sensitive association with micelle — partially dissociates at low temperature."
  kappa = "κ-casein: ~13% of casein. Only casein not strongly calcium-sensitive; concentrated at the micelle surface; its glycosylated C-terminal macropeptide (glycomacropeptide, GMP/CMP) forms the 'hairy layer' that provides steric + electrostatic stabilization of micelles against aggregation."
  count-honesty = "Four casein fractions is a biochemical classification by phosphorylation state, hydrophobicity, and calcium sensitivity — not a lattice partition. Genetic variants (A1/A2 β-casein polymorphism) exist within fractions."
  |> "[@x_fox_cheese] · [@x_walstra_dairy]"

@D dom_whey_proteins := "whey proteins — β-lactoglobulin and α-lactalbumin" :: domain [ok]
  beta-lg = "β-lactoglobulin (β-lg): dominant bovine whey protein (~50% of whey protein). Not found in human milk. Lipocalin fold; binds retinol, fatty acids; major allergen in bovine-milk allergy. Denatures at ~70–75°C — critical for HTST vs UHT differentiation and acid-gel texture in yoghurt."
  alpha-la = "α-lactalbumin (α-la): ~25% of whey protein. Ca²⁺-binding metalloprotein; regulatory subunit of lactose synthase (specifies galactose → lactose; without α-la, the enzyme makes N-acetyllactosamine instead)."
  bsa = "Bovine serum albumin (BSA) and immunoglobulins: minor whey components; transferred from blood. Colostrally enriched in immunoglobulins (passive immunity transfer to neonates)."
  |> "[@x_fox_cheese] · [@x_walstra_dairy]"

# ── §2 Casein micelle structure ───────────────────────────────────────

@D dom_casein_micelle := "casein micelle structure — competing models" :: domain [ok]
  scale = "Diameter ~50–600 nm (mean ~200 nm). Colloidal particle; ~94% protein, ~6% inorganic (calcium phosphate). Internal structure is heterogeneous and hydrated."
  schmidt-holt-submicelle = "Sub-micelle model (Schmidt era / Holt early): micelles composed of ~20–25 nm sub-micelle units (hydrophobic core, κ-casein on surface), cemented by calcium phosphate bridges. Dominant textbook model for decades."
  holt-nanoclusters = "Nanocluster/dual-binding model (Holt later, refining his earlier sub-micelle view; developed ca. late 1990s–2000s): colloidal calcium phosphate nanoclusters (~2.5 nm) act as cross-links by binding phosphoserine clusters of multiple casein chains. Sub-micelle units are not required as structural entities; internal organisation is less regular."
  horne-dual-binding = "Horne dual-binding model: polymerisation driven by two parallel mechanisms — hydrophobic interactions (among casein A-regions) AND calcium phosphate bridging (at phosphoserine clusters). κ-casein terminates growth sterically. Provides a physical-chemistry rationale for micelle stability without requiring a fixed submicelle lattice."
  hairy-layer = "κ-casein glycomacropeptide ('hairy layer') at the micelle surface provides steric stabilisation — prevents approach and aggregation of micelles in native milk. Enzymatic removal of the GMP by rennet chymosin destroys this steric barrier → coagulation. See [@dom_coagulation]."
  consensus = "No single model is universally accepted; the nanocluster and dual-binding frameworks are currently more consistent with small-angle X-ray scattering and cryo-TEM data than the strict sub-micelle model. The exact internal organisation remains an active research area."
  |> "[@x_holt_casein_micelle] · [@x_horne_dual_binding] · [@x_fox_cheese]"

# ── §3 Cheesemaking unit operations ──────────────────────────────────

@D dom_acidification := "acidification — lactic acid bacteria (LAB) starter cultures" :: domain [ok]
  function = "LAB ferment lactose → lactic acid, dropping pH from ~6.7 (milk) toward ~5.0–5.3 (depending on variety). pH drop (1) solubilises colloidal calcium phosphate from the micelle, (2) reduces net casein charge toward its isoelectric point (~4.6), reducing micelle electrostatic repulsion — both affecting gel texture and syneresis."
  primary-starters = "Streptococcus thermophilus (thermophilic; mozzarella, yoghurt, Swiss-type). Lactobacillus delbrueckii subsp. bulgaricus (thermophilic; yoghurt co-culture with S. thermophilus). Lactococcus lactis subsp. cremoris/lactis (mesophilic; Cheddar, Gouda, Edam)."
  secondary-cultures = "Propionibacterium freudenreichii (Swiss-type eye formation + propionic/acetic acid flavour). Leuconostoc mesenteroides (flavour, CO₂, diacetyl). Brevibacterium linens (smear/washed-rind surface). Penicillium roqueforti (blue cheese). Penicillium camemberti / Penicillium candidum (white mold surface, Brie/Camembert)."
  phage-risk = "Bacteriophage contamination of LAB starter cultures is a critical industrial HARD WALL — see [@lim_phage]."
  |> "[@x_fox_cheese] · [@x_walstra_dairy]"

@D dom_coagulation := "coagulation — rennet chymosin and calcium-dependent aggregation" :: domain [ok]
  enzymatic-phase = "PRIMARY (enzymatic): chymosin (the dominant protease in calf rennet; EC 3.4.23.4) cleaves κ-casein at the Phe105–Met106 bond. This releases the hydrophilic C-terminal glycomacropeptide (GMP) into the whey — destroying the steric/electrostatic hairy layer. Micelles are converted to 'para-κ-casein' micelles that no longer repel each other."
  aggregation-phase = "SECONDARY (calcium-dependent): para-κ-casein micelles aggregate in the presence of Ca²⁺ at temperatures > ~20°C. Network formation produces the gel ('curd'). Rate and gel firmness are strongly temperature- and pH-dependent."
  gel-firming = "Gel network continues to stiffen post-coagulation. Cutting time and gel firmness at cut are critical process parameters that determine moisture content in the final cheese — a milk-specific, empirically calibrated decision, not a lattice-fixed ratio."
  microbial-rennet = "Recombinant chymosin (fermentation-produced, expressed in Aspergillus/Kluyveromyces/E.coli systems) is now the dominant industrial coagulant globally — functionally equivalent to calf rennet chymosin."
  |> "[@x_fox_cheese] · [@x_walstra_dairy]"

@D dom_syneresis := "syneresis — whey expulsion and curd concentration" :: domain [ok]
  mechanism = "After cutting the gel into curd particles, syneresis (whey expulsion from the gel network) concentrates the casein matrix. Driven by curd-particle contraction under gravity, stirring, pH fall, and heating."
  control = "Temperature, pH, cut size, stirring rate, and time control moisture content — higher temperature and lower pH accelerate syneresis → drier, firmer cheeses (Parmesan ≈ 30–32% moisture; fresh cheeses ≈ 60–80% moisture). These are technological parameters, not lattice-set constants."
  |> "[@x_fox_cheese]"

@D dom_salting := "salting and its roles" :: domain [ok]
  modes = "Surface salting (dry or brine immersion) or in-curd salting (Cheddar milling). Most hard/semi-hard cheeses use brine salting."
  roles = "Draws whey (additional moisture reduction), controls aw (water activity) → microbial safety and shelf life, inhibits unwanted microbes, activates/inhibits ripening enzymes, contributes flavour, influences texture (salt-in bridges at casein matrix)."
  regulation = "Salt-in-moisture (S/M) ratio is a key quality/safety parameter — not a lattice value."
  |> "[@x_fox_cheese] · [@x_walstra_dairy]"

@D dom_ripening := "cheese ripening — primary, secondary, tertiary biochemistry" :: domain [ok]
  primary-proteolysis = "PRIMARY: residual coagulant (chymosin, plasmin) + starter/non-starter bacterial proteases cleave αs1- and β-caseins into large polypeptides and smaller peptides → texture softening, bitterness risk. The major textural change in hard cheeses over months/years."
  secondary-proteolysis = "SECONDARY: bacterial peptidases hydrolyse peptides to free amino acids (FAAs). FAAs are the pool from which flavour compounds are generated."
  tertiary-proteolysis = "TERTIARY: FAA catabolism → Strecker degradation (aldehydes, amines), transamination → α-keto acids → thiols, sulfides, branched-chain volatiles. These are the dominant flavour-impact volatiles in aged cheeses."
  lipolysis = "Lipase (milk lipoprotein lipase; mold lipases in blue/mold-surface cheeses; bacterial lipases) hydrolyse triglycerides → free fatty acids (FFAs). Short-chain FFAs (butyric C4, caproic C6, caprylic C8) are the soapy/rancid pungent notes of blue/aged cheese. Penicillium roqueforti lipases are dominant in blue cheese ripening."
  glycolysis = "Residual lactose is fermented by starter LAB; citrate metabolised (Leuconostoc → diacetyl/acetoin = buttery flavour); propionic fermentation in Swiss-type (holes + nutty flavour)."
  duration = "Ripening duration spans weeks (fresh/soft) to several years (Parmesan 24–36 mo+, extra-aged Gouda, Comté). Time is a biological and economic parameter — the cheese's biochemistry, not a lattice-fixed schedule."
  |> "[@x_fox_cheese] · [@x_mcsweeney_cheese]"

# ── §4 Cheese variety axes ────────────────────────────────────────────

@D dom_cheese_varieties := "cheese variety classification axes" :: domain [ok]
  moisture-axis = "Hard (Parmesan/Grana Padano ≈ 30–34% moisture) → semi-hard (Cheddar, Gouda ≈ 36–42%) → semi-soft (Havarti, Fontina ≈ 42–50%) → soft (Brie, Camembert ≈ 50–55%) → fresh (ricotta, quark, cottage ≈ 60–80%)."
  mold-surface = "White-mold surface (P. camemberti / P. candidum): Brie, Camembert, Coulommiers. Surface ripening inward — proteolysis produces the characteristic soft creamy interior and ammoniacal notes."
  blue-mold = "Blue / internal mold (P. roqueforti): Roquefort, Gorgonzola, Stilton, Danish Blue. Needled to create aerobic channels; P. roqueforti lipolysis dominant flavour driver; distinctive veining."
  washed-rind = "Washed-rind / smear-ripened: Taleggio, Limburger, Époisses. Periodic washing with brine/alcohol/beer removes unwanted surface flora, selects Brevibacterium linens + yeasts → orange/orange-red surface, strong pungency (sulfur volatiles from Brevibacterium)."
  brined = "Brined (Feta, Halloumi, fresh mozzarella): stored/transported in brine; Halloumi has high cooking-point (not melting) due to thermal denaturation of whey proteins during manufacture and low moisture."
  honesty = "Classification axes (moisture, mold type, rind treatment, brine) are technological/biological taxonomy — the variety space is continuous and culture-historically enormous, not counted or partitioned by a lattice value."
  |> "[@x_fox_cheese]"

# ── §5 Pasteurisation and homogenisation ─────────────────────────────

@D dom_pasteurisation := "pasteurisation — Pasteur era to HTST/UHT" :: domain [ok]
  history = "Pasteur's germ theory and practical demonstrations (1860s) established that heating wine/beer/milk destroyed spoilage microorganisms without full sterilisation. Applied to milk by Soxhlet and others in the late 19th century."
  htst = "HTST (High-Temperature Short-Time): 72°C for ≥15 seconds (US/EU standard). Inactivates pathogens (Mycobacterium tuberculosis, Salmonella, Listeria, Campylobacter, Brucella); denatures most β-lg (see [@dom_whey_proteins]). The global industrial standard."
  uht = "UHT (Ultra-High Temperature): 135–150°C for 2–5 seconds; commercially sterile; shelf-stable at ambient temperature. Greater Maillard browning and 'cooked' flavour; altered protein denaturation profile."
  raw-milk = "Unpasteurised (raw) milk cheesemaking is legal in some jurisdictions (France AOP requirements; US aged ≥60 days exemption); carries documented Listeria, Brucella, STEC, Campylobacter risk — regulatory hard wall in many jurisdictions. See [@lim_rawmilk_pathogen]."
  |> "[@x_walstra_dairy] · [@x_fox_cheese]"

@D dom_homogenisation := "homogenisation — fat-globule size reduction" :: domain [ok]
  mechanism = "High-pressure forcing of milk through a narrow valve disrupts fat globules from ~1–8 µm to < 1 µm. New membrane is formed from milk proteins (caseins, whey proteins) replacing part of the native MFGM."
  effect = "Prevents cream separation (creaming = gravity-driven Stokes sedimentation of large globules); improves whiteness; increases lipolysis susceptibility (new membrane less protective). Homogenised milk is not used for most traditional hard cheeses — texture and flavour are affected."
  |> "[@x_walstra_dairy]"

# ── §6 Lactose intolerance — pharmacogenetics of lactase persistence ──

@D dom_lac_intolerance := "lactose intolerance — lactase persistence alleles and convergent evolution" :: domain [ok]
  enzyme = "Lactase (lactase-phlorizin hydrolase, LPH; gene LCT): intestinal brush-border enzyme that cleaves lactose → glucose + galactose. Activity is high in infancy (lactation), declines post-weaning in most mammals (lactase non-persistence, LNP) — the ancestral mammalian state."
  lnp = "Lactase non-persistence (LNP) = the ancestral state. Undigested lactose passes to the colon where microbial fermentation produces gas (H₂, CO₂, CH₄) and short-chain fatty acids → bloating, flatulence, osmotic diarrhea. Clinical manifestation is dose-dependent and microbiome-influenced."
  lp-alleles = "Lactase persistence (LP) alleles: LCT gene expression is regulated by MCM6 enhancer cis-elements. The derived T-allele at rs4988235 (C/T-13910, ~14 kb upstream of LCT) is dominant in European dairying populations. Multiple independent alleles arose convergently in African pastoralist populations (Tishkoff et al.) — including G-13915T (East Africa), G-13907C, C-14010T variants."
  convergent-evolution = "LP is a textbook example of convergent natural selection — independently derived at different MCM6 enhancer positions in European, East African, and Arabian pastoralist populations, correlating with a history of dairying and raw-milk consumption. Demonstrates gene–culture co-evolution."
  global-prevalence = "LP allele frequency varies greatly: high in North/West Europe (~80–95%), lower in Southeast Asia and East Asia (<10–20% in many populations), intermediate in Middle East, South Asia. Population figures are approximate ranges from genetic epidemiology literature."
  |> "[@x_tishkoff_2007] · [@x_ingram_swallow_lp]"

# ── §7 Probiotic context ──────────────────────────────────────────────

@D dom_probiotics := "probiotic context in dairy fermentation" :: domain [ok]
  definition = "Hill et al. (2014) consensus: 'live microorganisms that, when administered in adequate amounts, confer a health benefit on the host.' The definition requires a specific strain × dose × health-outcome claim — generic 'fermented dairy is probiotic' claims are insufficient under the scientific consensus."
  dairy-strains = "Lactobacillus rhamnosus GG, Lactobacillus acidophilus LA-5, Bifidobacterium animalis subsp. lactis BB-12, Lactobacillus casei Shirota — examples of strains with substantial evidence bases. Strain-specificity matters: effects are NOT class-wide."
  yoghurt-exception = "Traditional yoghurt starters (S. thermophilus + L. bulgaricus) are generally considered probiotics by many regulatory bodies in sufficient amounts; some meta-analyses show reduced lactose malabsorption symptoms."
  honesty = "Probiotic health-benefit claims are under active regulatory and scientific scrutiny. This tape reports the scientific consensus framework qualitatively; it does not endorse product or dosage claims."
  |> "[@x_hill_2014]"

# ── §8 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_phage := "bacteriophage contamination of LAB starter cultures" :: real-limit [ok required]
  wall = "HARD WALL (industrial production)"
  statement = "Lytic bacteriophage specific to Lactococcus and Lactobacillus starter strains are a pervasive and serious threat in cheese factories. Phage infection can destroy an entire batch by preventing acidification — milk pH fails to drop, coagulation is inhibited or absent, the vat is lost."
  consequence = "Industrial dairy operations require strict phage-exclusion protocols (bulk-starter protection, defined-strain rotation, cheesemaking-room air handling, sanitisation regimes). Phage resistance is an active LAB breeding/selection target. This is a hard biological constraint on industrial cheesemaking, not a process variable to optimise around."
  |> "[@x_fox_cheese] · [@x_walstra_dairy]"

@D lim_rawmilk_pathogen := "raw-milk pathogen risk — regulatory hard wall" :: real-limit [ok required]
  wall = "HARD WALL (regulatory, in many jurisdictions)"
  pathogens = "Listeria monocytogenes (psychrotrophic — grows under refrigeration; high fatality rate in immunocompromised, pregnant), Brucella abortus/melitensis (brucellosis), Mycobacterium bovis (bovine TB), Shiga toxin-producing E. coli (STEC), Campylobacter jejuni, Salmonella spp."
  statement = "Raw milk directly from the udder may carry any of the above pathogens; pasteurisation is the established effective control. Regulatory prohibition on unpasteurised milk sale is a hard wall in most industrial jurisdictions — a food-safety engineering limit, not a process optimisation choice."
  consequence = "For soft, short-aged cheeses (< 60 days), raw-milk production is prohibited or heavily regulated in the EU and USA. PDO/AOP designations (e.g. Roquefort, Comté from thermised/raw milk) exist within defined regulatory regimes — not a blanket raw-milk permission."
  |> "[@x_walstra_dairy] · [@x_fox_cheese]"

@D lim_allergen := "milk-protein allergen and lactose intolerance — population-level limits" :: real-limit [ok required]
  wall = "BIOLOGICAL LIMIT (population-wide)"
  milk-protein-allergy = "Cow's-milk protein allergy (CMPA): IgE-mediated or non-IgE-mediated immune response to milk proteins (β-lg major allergen; also αs1-casein, α-la). Predominantly a paediatric condition (2–7% of infants); most resolve with age. A hard biological constraint for affected individuals — not addressable by processing modification for those with IgE sensitisation."
  lactose-intolerance = "Lactase non-persistence (see [@dom_lac_intolerance]): dairy food access is physiologically constrained for a large fraction of the global adult population. Consequence: extensive market for lactose-reduced / lactase-added products; fermented dairy (yoghurt, hard aged cheese with low residual lactose) is better tolerated."
  |> "[@x_walstra_dairy]"

@D lim_coldchain := "cold-chain / supply-chain requirements" :: real-limit [ok required]
  wall = "LOGISTICAL/PHYSICAL HARD WALL"
  statement = "Fresh and soft cheeses (aw > 0.97) are highly perishable and require unbroken refrigerated cold chain from production to consumption. Temperature excursions accelerate spoilage microbes and permit Listeria growth. Hard cheeses (reduced aw from salting + low moisture) have greater ambient tolerance but still benefit from temperature control."
  consequence = "Cold-chain infrastructure is a supply-side bottleneck that limits global access to fresh dairy. It is an engineering and economics constraint, not a lattice-determined parameter."

@D lim_environmental := "environmental footprint of dairy farming" :: real-limit [ok required]
  wall = "SYSTEMIC/REAL LIMIT (resource and climate)"
  statement = "Dairy farming generates greenhouse gases (enteric CH₄ from ruminant fermentation, N₂O from manure management, CO₂ from land use) and places demands on water, land, and energy. Steinfeld et al. (2006 FAO) characterised livestock agriculture as contributing significantly to global environmental problems across multiple impact categories (GHG, water, land, biodiversity). Dairy is embedded within this broader livestock-sector challenge."
  honesty = "The Steinfeld et al. report is a landmark FAO-commissioned quantitative inventory (author/era cited); specific percent contributions to individual GHG categories require current literature cross-check and vary by production system. Cited as well-established directional finding, not as a single authoritative number."
  consequence = "Environmental constraints are real systemic limits on dairy-sector growth and are increasingly shaping regulatory and market requirements — not lattice values."
  |> "[@x_steinfeld_2006]"

# ── §9 n=6 lattice stance (HONEST — observation, not derivation) ──────

@F f_lattice_fit := "lattice-fit-on-dairy-chemistry" :: governance [required deny:write]
  pattern = "Deriving dairy-chemistry quantities (yield %, ripening time, micelle counts, starter-culture cycle lengths, milk compositional ratios, cheese variety counts) FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'yield = 12 kg/100L because σ=12' or '4 casein fractions because τ=4' or 'ripening uniformity = 96% because 2·σ·τ'."
  why = "This is exactly the fabrication the pre-rewrite CHEESE-DAIRY.tape committed — the stub was entirely lattice-tautology rows with `n_6 = 'σ=12'`, `n_6 = 'n=6'` lines and no real dairy science (see CHEESE-DAIRY.log.tape audit). hexa-bio AGENTS.tape @F f1 (lattice-fit-on-external-entity) + @D g1/g2 forbid it."
  remedy = "Cite real dairy science sources (this tape's @X entries). Compositional numbers and process parameters are biochemistry, microbiology, and food technology — the lattice may only be a coincidental OBSERVATION, never a derivation."

@N n6_honest_stance := "dairy chemistry has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: dairy chemistry and cheesemaking expose NO natural n=6 invariant. Four casein fractions (αs1, αs2, β, κ) are a biochemical classification — not τ=4. Cheese variety space is a continuous spectrum (hundreds of named varieties). Ripening durations are set by biochemistry and economics. Milk compositional ratios are breed- and season-dependent biological measurements. Rennet cleavage at Phe105–Met106 is a protease specificity constraint, not a lattice bond index. Per hexa-bio AGENTS.tape g1 (real-limits-first) and g2 (lattice-is-tool) and LATTICE_POLICY: the lattice is declined here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub."

# ── §10 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 rennet cleavage site specificity" :: prediction [ok]
  claim = "Chymosin cleaves κ-casein at the Phe105–Met106 bond with high specificity; para-κ-casein micelles aggregate in the presence of Ca²⁺ above ~20°C; heat-denatured chymosin does not coagulate milk."
  falsifier = "If a controlled rennet-coagulation assay shows equivalent coagulation by heat-inactivated chymosin under standard conditions, or if a mass-spec analysis fails to identify the Phe105–Met106 cleavage site as the predominant primary cut site, [@dom_coagulation] is wrong."
  source = "[@x_fox_cheese]"

@D tp_2 := "TP-2 LP allele geography" :: prediction [ok]
  claim = "Lactase-persistence allele (T-13910 and cognate African alleles) frequency is highest in populations with long dairying histories (Northern/Western Europe, East African pastoralists) and lowest in populations without such history (East/Southeast Asia)."
  falsifier = "If population-genetic analysis of a representative East Asian cohort shows LP allele frequency comparable to Northern European cohorts, [@dom_lac_intolerance] / [@x_tishkoff_2007] are wrong."
  source = "[@x_tishkoff_2007] · [@x_ingram_swallow_lp]"

@D tp_3 := "TP-3 bacteriophage batch loss" :: prediction [ok]
  claim = "Lytic phage contamination in a mesophilic starter-culture vat causes measurable failure of pH drop (pH does not reach target ~5.2–5.4 in standard time), producing an uncoagulated or poorly set curd that must be discarded."
  falsifier = "If a properly controlled phage-inoculated vat reaches target pH on schedule and produces normal curd, [@lim_phage] is wrong (would require the culture to have acquired phage resistance unexpectedly)."
  source = "[@x_fox_cheese]"

# ── §11 Cross-links ───────────────────────────────────────────────────

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). This tape complies: real dairy science, in-silico knowledge SSOT only, lattice declined as a derivation tool."

# ── §12 External citations (real, landmark literature) ────────────────
# Where a specific bibliographic detail is not asserted with confidence,
# the entry names the primary author + era only and says so explicitly.

@X x_fox_cheese := "Fox et al — Cheese: Chemistry, Physics and Microbiology" :: literature [active]
  ref = "Fox PF, McSweeney PLH, Cogan TM, Guinee TP (eds). Cheese: Chemistry, Physics and Microbiology. 3rd ed. Elsevier Academic Press, 2004. (Standard reference for milk composition, casein micelle, cheesemaking biochemistry, ripening, variety classification. Primary editors/era cited; earlier editions Fox 1987/1993 also foundational.)"

@X x_walstra_dairy := "Walstra et al — Dairy Science and Technology" :: literature [active]
  ref = "Walstra P, Wouters JTM, Geurts TJ. Dairy Science and Technology. 2nd ed. CRC Press / Taylor & Francis, 2006. (Authoritative textbook for milk physical chemistry, homogenisation, pasteurisation, cheesemaking unit operations, and product technology. Primary authors/era cited.)"

@X x_mcsweeney_cheese := "McSweeney — Cheese Problems Solved" :: literature [active]
  ref = "McSweeney PLH (ed). Cheese Problems Solved. Woodhead Publishing, 2007. (Practical and biochemical reference for ripening mechanisms, proteolysis, lipolysis, glycolysis in diverse cheese varieties. Primary editor/era cited.)"

@X x_holt_casein_micelle := "Holt — casein micelle structure (nanocluster model, ~1990s–2000s)" :: literature [active]
  ref = "C. Holt — casein micelle structure and calcium phosphate nanocluster models. Key papers include Holt C (1992) Structure and stability of bovine casein micelles. Adv Protein Chem 43:63–151; and subsequent refinements through the 1990s–2000s. Primary author/era cited; exact volume list not exhaustively asserted. The nanocluster/dual model supplants the strict sub-micelle view in much current literature."

@X x_horne_dual_binding := "Horne — dual-binding casein micelle model (~1998–2000s)" :: literature [active]
  ref = "D.S. Horne — dual-binding model of casein micelle assembly: hydrophobic + calcium-phosphate cross-linking drives polymerisation; κ-casein terminates growth sterically. Key review: Horne DS (1998) Casein interactions: casting light on the black boxes, the structure in dairy products. Int Dairy J 8:171–177. Primary author/era cited."

@X x_tishkoff_2007 := "Tishkoff SA et al 2007" :: literature [active]
  ref = "Tishkoff SA et al. Convergent adaptation of human lactase persistence in Africa and Europe. Nat Genet 2007;39:31–40. (Landmark study identifying multiple independent LP alleles — G-13915T, G-13907C, C-14010T — in African pastoralist populations; convergent evolution of LP with dairying culture; gene–culture co-evolution.)"

@X x_ingram_swallow_lp := "Ingram CJE & Swallow DM — lactase persistence genetics (era ~2009)" :: literature [active]
  ref = "Ingram CJE, Mulcare CA, Itan Y, Thomas MG, Swallow DM. Lactose digestion and the evolutionary genetics of lactase persistence. Hum Genet 2009;124:579–591. (Review of LP allele diversity, regulatory mechanism at MCM6 enhancer, population genetics, and gene–culture co-evolution context. Primary authors/era cited.)"

@X x_hill_2014 := "Hill C et al 2014" :: literature [active]
  ref = "Hill C, Guarner F, Reid G et al. Expert consensus document: The International Scientific Association for Probiotics and Prebiotics consensus statement on the scope and appropriate use of the term probiotic. Nat Rev Gastroenterol Hepatol 2014;11:506–514. (Defines 'probiotic' as live microorganisms conferring health benefit in adequate amounts; emphasises strain specificity and evidence standards.)"

@X x_steinfeld_2006 := "Steinfeld et al 2006 — FAO Livestock's Long Shadow" :: literature [active]
  ref = "Steinfeld H, Gerber P, Wassenaar T, Castel V, Rosales M, de Haan C. Livestock's Long Shadow: Environmental Issues and Options. FAO, Rome, 2006. (Landmark FAO report quantifying livestock-sector contributions to GHG emissions, land use, water, and biodiversity pressure — the foundational reference for environmental limits of livestock/dairy farming. Author/era cited; subsequent updates and critiques of specific GHG percentage figures exist in the literature — directional finding is robust.)"
