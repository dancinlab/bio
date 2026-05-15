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
# HEXA-NANOBOT.tape — architecture-current (editable per v1.2)
# Event history → HEXA-NANOBOT.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "hexa-nanobot" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · NANOBOT axis — molecular machines (DNA nanotechnology / DNA origami; synthetic molecular motors/rotaxanes; biological motor proteins as reference; internal codename: C0b)"
  brief = "single-device molecular actuation · DNA-nanotech & molecular-machine engineering · biological motor benchmarks · Brownian/thermal-noise limits · n=6 used as a lattice TOOL only, never a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "HEXA-NANOBOT.log.tape"
  scope = "in-silico assembly/actuation simulator consistency SSOT · NOT wet-lab/clinical claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see HEXA-NANOBOT.log.tape audit"
  axis-note = "NANOBOT is a CORE hexa-bio axis: per hexa-bio AGENTS.tape g2 (lattice-is-tool) the n=6 lattice may appear in native-axis context, but in this tape it is never the source of a step size, torque, fuel cost, efficiency, yield, or assembly count. Molecular-machine behavior is set by single-molecule physics (kT, viscous drag), DNA-base-pairing thermodynamics, photochemistry, and enzyme catalysis — see [@f_lattice_fit] + [@n6_honest_stance]."
  internal-codename = "C0b — internal nickname for the single-actuator skeleton model used by hexa-nanobot/ simulators (preserved for cross-reference; the science below stands on real-world molecular-machines literature, not on the codename)."

@N scope_disclaimer := "in-silico-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico molecular-machine modeling substrate. Step sizes, stall forces, rotational rates, ΔG and rate constants paraphrased from single-molecule biophysics and synthetic-molecular-machine literature are illustrative magnitudes from the cited primary work, not re-derived constants. A C2/C3 in-silico simulator-consistency PASS here is NOT a wet-lab, structural, therapeutic, or clinical claim — autonomous in-vivo nanobots at clinical scale are currently UNSOLVED (hexa-bio AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG.md §0). What is real today: DNA-origami shapes; bench-top synthetic motors; well-characterised biological motor proteins. What is not real today: programmable autonomous in-vivo nanobots."
  |> "[@x_rothemund_2006] · [@x_feringa_1999]"

# ─── §1 DNA nanotechnology foundations ────────────────────────────────

@D dna_seeman_junctions := "Seeman immobile junctions" :: domain [ok]
  problem = "Natural Holliday junctions can branch-migrate because their four arms have sequence symmetry. To use DNA as a programmable structural material the junction must be IMMOBILE — designed so each arm has a distinct sequence and no symmetric branch-migration position exists."
  principle = "Seeman (1982) proposed building 3-dimensional periodic matter from such designed branched DNA junctions: minimize sequence symmetry across the junction so the branch point is thermodynamically fixed, then use sticky ends to connect junctions into a programmable lattice/polyhedron."
  significance = "This is the founding theoretical move of structural DNA nanotechnology: DNA becomes an engineering substrate whose folded geometry is set by Watson–Crick base pairing rather than by an evolved protein fold. Every later DNA-origami construct inherits this design discipline."
  honesty = "Junction immobility is a Watson–Crick base-pairing thermodynamics argument — a sequence-design constraint, not a lattice value. The recurring '4' arms in a Holliday/immobile junction is the topology of two duplexes meeting, not the n=6 lattice."
  |> "[@x_seeman_1982]"

@D dna_origami := "scaffolded DNA origami (Rothemund)" :: domain [ok]
  technique = "Rothemund (2006): a long (~7-kilobase) single-stranded viral scaffold (e.g. M13mp18) is folded into a defined 2-D shape by adding ~200 short synthetic 'staple' strands, each complementary to several distant scaffold segments. Crossovers between adjacent helices lock the shape."
  yield = "Rothemund reported that ~70–80% of imaged objects matched the target shape (smiley faces, stars, maps), in a one-pot anneal — a single-experiment yield far above any earlier DNA-based assembly. Exact number reported in the cited paper; treated here as the cited illustrative yield, not a re-derived constant."
  consequence = "Once the scaffold sequence and crossover topology are chosen, the 2-D shape is fully programmed by ~200 staple sequences. The technique scales to many shapes per anneal without redesigning the scaffold."
  honesty = "Origami yield and stiffness come from Watson–Crick pairing energy and crossover geometry, NOT from any n=6 invariant. Helices and crossovers are designed on the natural DNA helical pitch (~10.5 bp/turn) — a structural-biology fact, not a lattice."
  |> "[@x_rothemund_2006] · [@x_seeman_1982]"

@D dna_origami_3d := "3-D origami honeycomb lattice" :: domain [ok]
  technique = "Douglas et al. (2009) extended scaffolded origami into 3-D by stacking parallel double helices on a honeycomb lattice of crossovers; caDNAno computer-aided design software made the staple layout routine."
  shapes = "Reported objects include square nuts, gears, railed beams, and a 'honeycomb monolith' — rigid, ~MDa-scale objects with nanometer-precision feature placement."
  consequence = "3-D origami turns DNA into a CAD-able stiff material; cryo-EM reconstructions of designed objects match the target geometry within nanometer tolerance (as reported in the cited work)."
  honesty = "The honeycomb arrangement of helices is a packing/crossover choice that optimises bending stiffness; '6-around-1' helix neighbourhood is the geometry of close-packed cylinders, NOT the n=6 lattice tool. Numerical coincidence is observation only ([@f_lattice_fit])."
  |> "[@x_douglas_2009_nature]"

@D dna_origami_curved := "curved & complex 3-D shapes" :: domain [ok]
  curvature = "Han et al. (2011) showed DNA origami can be folded into curved 3-D shapes (spheres, flasks, vases) by varying crossover spacing to introduce designed twist and curvature into the bundle — origami is not restricted to flat or rectilinear forms."
  computational = "Castro, Dietz and co-workers developed computational design tools (caDNAno + finite-element analysis e.g. CanDo) that predict the mean shape and mechanical fluctuations of an origami design before synthesis."
  honesty = "Curvature is engineered by insertion/deletion of bases at crossovers (thermodynamic strain accumulation), not by lattice values. The number of distinct stable poses a shape can occupy is a free-energy-landscape question, not an n=6 count."
  |> "[@x_han_2011_science] · [@x_castro_dietz_compdesign]"

@D dna_origami_box := "addressable DNA box with controllable lid" :: domain [ok]
  device = "Andersen et al. (2009) reported a hollow DNA-origami 'box' (~42×36×36 nm) whose lid can be opened by external DNA 'key' strands that hybridise to a designed lock motif, displacing the closure duplex via toehold-mediated strand displacement."
  significance = "First explicit demonstration that origami can be both a STATIC container AND a DYNAMICALLY actuated device — a precursor to logic-gated cargo carriers. Operation is in-vitro / in cuvette."
  honesty = "Open/close is a strand-displacement reaction (Yurke et al. branch-migration kinetics) with two states; the count '2' is the topology of a lid — any lattice attribution is the forbidden anti-pattern flagged by [@f_lattice_fit] and [@n6_honest_stance]."
  |> "[@x_andersen_2009_nature]"

# ─── §2 Dynamic DNA devices & cargo delivery ──────────────────────────

@D dna_walker := "DNA walkers & strand-displacement motors" :: mechanism [ok]
  walker = "Yin/Pierce, Seelig, Turberfield and co-workers built DNA 'walkers' that processively step along a designed track by sequential strand-displacement (toehold exchange) reactions — each step consumes a small ΔG difference between bound states."
  fuel = "Most operate on stoichiometric fuel (sacrificial 'fuel' strands or hairpins) or on enzymatic cleavage of the track (nicking enzymes / RNase H); a purely autonomous, fuelled, in-vivo walker comparable to a protein motor remains a research problem."
  rate = "Step rates are slow compared to protein motors (often seconds per step) and processivities are bounded by mis-stepping/run-off; rates from the cited primary work are illustrative, not re-derived."
  honesty = "Strand-displacement kinetics is set by toehold length and base-pairing thermodynamics — well below the kT noise floor per single base pair, so directionality comes from net free-energy gradient across the cycle ([@lim_thermal_noise]), not from a lattice."
  |> "[@x_yin_pierce_walker] · [@x_seelig_strand_displacement]"

@D dna_origami_cargo := "logic-gated origami cargo carrier (Douglas/Bachelet/Church 2012)" :: mechanism [ok]
  device = "A barrel-shaped DNA-origami container whose two halves are held shut by aptamer-based locks. The locks open only when both target ligands (e.g. specific cell-surface markers) are present — an aptamer-AND logic gate."
  payload = "When the locks dissociate the barrel splays open and exposes payload molecules (antibody fragments / nanoparticles) covalently attached to the inner surface."
  scope = "Demonstrated in cell culture against selected leukemia cell lines (Science 2012). This is a RESEARCH-STAGE in-vitro proof-of-concept of programmable cargo delivery — NOT an approved clinical platform; see [@lim_biocompatibility] and [@lim_in_silico_boundary]."
  honesty = "Logic gating is aptamer–ligand binding thermodynamics. The 'AND' is a 2-input combinatorial unlock, set by ligand-aptamer Kd, not by an n=6 invariant."
  |> "[@x_douglas_bachelet_church_2012]"

# ─── §3 Synthetic molecular machines (Sauvage / Stoddart / Feringa) ───

@D mm_topology := "mechanically interlocked molecules (rotaxanes, catenanes)" :: domain [ok]
  rotaxane = "A rotaxane is a 'macrocycle threaded on an axle' with bulky stoppers preventing dethreading. Position of the macrocycle along the axle can be switched between specific 'stations' by changing protonation / redox / photochemistry — a chemically actuated linear shuttle."
  catenane = "Catenanes are mechanically interlocked rings; controlled rotation/translation of one ring relative to another constitutes a molecular-scale switch."
  history = "Sauvage developed metal-templated catenane synthesis; Stoddart developed bistable rotaxanes ('molecular shuttles'); both lines are recognised in the 2016 Nobel Prize in Chemistry shared with Feringa."
  honesty = "Switching states and binding energies are chemistry — coordination, π-stacking, hydrogen-bonding, redox potentials — taken from the cited literature. The number of stable shuttle stations is a free-energy-landscape engineering choice, never an n=6 quartet."
  |> "[@x_sauvage_nobel_2016] · [@x_stoddart_nobel_2016]"

@D mm_feringa_motor := "Feringa light-driven unidirectional rotary motor" :: mechanism [ok]
  motor = "Feringa et al. (1999, Nature) reported the first synthetic molecule whose chiral structure converts photon absorption + thermal helix inversion into NET unidirectional rotation about a central C=C bond — a 4-step cycle of two photoisomerisations alternating with two thermal helix inversions."
  unidirectionality = "Directionality comes from the chiral 'overcrowded alkene' design: each photoisomerisation is followed by an irreversible thermal step that locks the molecule in the next chirality, so the cycle is broken-symmetry and net-rotary."
  rate = "Original design rotated slowly (thermal step rate-limiting, ~minutes per half-turn at room temperature in the seminal paper); later engineered analogues rotate at much higher rates by lowering the thermal barrier — design-driven rate change, not a count from a lattice."
  honesty = "The '4 steps' of the photoisomer/thermal cycle is the photochemistry of the overcrowded alkene; any lattice attribution is the forbidden anti-pattern flagged by [@f_lattice_fit] — coincidence-as-derivation is exactly the violation we refuse."
  |> "[@x_feringa_1999] · [@x_feringa_nobel_2016]"

@D mm_nobel_2016 := "2016 Nobel Prize — molecular machines" :: note [active]
  recognition = "The 2016 Nobel Prize in Chemistry was awarded jointly to Jean-Pierre Sauvage, Sir J. Fraser Stoddart, and Bernard L. Feringa 'for the design and synthesis of molecular machines'. Each of the three established a distinct paradigm: Sauvage / template-directed catenanes; Stoddart / bistable rotaxane shuttles; Feringa / unidirectional rotary motors."
  significance = "External validation that bench-top synthetic molecular machines are an established field. What is unsolved is bridging from cuvette to autonomous in-vivo function (see [@lim_in_silico_boundary])."
  |> "[@x_sauvage_nobel_2016] · [@x_stoddart_nobel_2016] · [@x_feringa_nobel_2016]"

# ─── §4 Biological motor proteins (reference benchmarks) ──────────────

@D bio_motors_overview := "biological motors as engineering benchmark" :: domain [ok]
  why-reference = "Biological motor proteins are the existence proofs that single-molecule machines can do mechanical work in solution at body temperature against the kT noise floor. Their measured step sizes, stall forces and efficiencies set the practical benchmarks that synthetic machines aspire to."
  examples = "Cytoskeletal: kinesin (microtubule-walking, ~8 nm step), myosin (actin, several variants with different step/duty), dynein (microtubule, retrograde). Rotary: F1-ATPase (rotary ATP synthase, ~120° steps per ATP). RNA/DNA: helicases, polymerases, viral packaging motors (e.g. phi29)."
  measurement = "Step sizes, stall forces and dwell-time distributions were established by optical-trap and single-molecule fluorescence experiments (Yanagida, Spudich, Block, and others) — referenced as primary-author/era; specific numerical step sizes are from the cited primary literature, not re-derived."
  honesty = "These are real engineering benchmarks (real measured forces, real ATP costs), not lattice values. The recurring '3' in F1-ATPase comes from its three catalytic β-subunits (Boyer's binding-change mechanism), a protein architecture fact, not an n=6 derivation."
  |> "[@x_yanagida_single_molecule] · [@x_boyer_walker_atp_nobel_1997]"

@D bio_f1_atpase := "F1-ATPase rotary motor (Boyer/Walker)" :: mechanism [ok]
  device = "F1-ATPase is the catalytic head of ATP synthase: a hexameric (α3β3) ring around a central γ-shaft. Three catalytic β-subunits cycle through three conformations ('binding change') as the γ-shaft rotates; one full rotation hydrolyses (or synthesises) 3 ATP."
  rotation = "In the synthase direction, proton flow through the membrane-embedded F0 turns the γ-shaft; in reverse (hydrolysis) F1 alone can act as a rotary motor whose rotation has been directly observed by single-molecule fluorescence."
  efficiency = "F1-ATPase is among the most energy-efficient motors known, approaching the thermodynamic limit set by the ΔG of ATP hydrolysis under cellular conditions — efficiency figures from the cited Nobel-era literature, not re-derived."
  history = "Paul Boyer (binding-change mechanism) and John Walker (crystal structure of F1) shared the 1997 Nobel Prize in Chemistry (with Jens Skou) for ATP synthase work."
  honesty = "The α3β3 'hexameric' ring is protein architecture (three αβ pairs); any lattice attribution is the forbidden anti-pattern flagged by [@f_lattice_fit] — the cause is gene duplication and binding-change geometry, not a lattice quartet."
  |> "[@x_boyer_walker_atp_nobel_1997]"

@D bio_kinesin_myosin := "kinesin & myosin single-molecule mechanics" :: mechanism [ok]
  kinesin = "Conventional kinesin (kinesin-1) walks processively on microtubules in hand-over-hand fashion with a step of ~8 nm per ATP hydrolysed, generating piconewton-scale forces — established by optical-trap measurements (Block, Svoboda and others)."
  myosin = "Myosin variants differ markedly in duty ratio and step size — muscle myosin-II is non-processive with a small power-stroke; myosin-V is processive on actin with a larger step. Single-molecule mechanics was advanced notably by Yanagida and co-workers (Japan) and Spudich/Finer/Simmons (US)."
  honesty = "Step sizes are set by the geometry of the motor-track interaction (microtubule/actin periodicity), not by lattice values. The numbers come from optical-trap measurements in the cited primary literature."
  |> "[@x_yanagida_single_molecule]"

# ─── §5 Brownian ratchets & statistical-mechanical limits ─────────────

@D ratchet_brownian := "Brownian ratchet / fluctuation rectification" :: mechanism [ok]
  principle = "A passive 'Maxwell-demon' ratchet that rectifies thermal noise into directed motion is forbidden by the Second Law of Thermodynamics (Smoluchowski/Feynman). To produce net work, a small machine must consume free energy from a non-equilibrium source (chemical, photonic, electrochemical) — directionality always costs ΔG."
  flashing-ratchet = "Real molecular machines (biological and synthetic alike) operate as 'flashing' / 'rocked' ratchets: an external time-varying input (ATP hydrolysis, photon absorption, redox cycling) repeatedly modifies the potential landscape, biasing diffusion in one direction. Astumian, Magnasco, Jülicher, Prost and co-workers developed the modern theory."
  consequence = "There is no free-energy-free direction-from-noise route. Designing a 'nanobot' that does useful work necessarily implies a fuel cycle and a thermodynamic accounting — see [@lim_fueling]."
  honesty = "Brownian-ratchet theorems are statistical-mechanical results; no n=6 dependence."
  |> "[@x_astumian_brownian_ratchet]"

# ─── §6 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ───

@D lim_thermal_noise := "kT thermal-noise / Brownian floor" :: real-limit [ok required]
  wall = "HARD WALL (fundamental physical limit)"
  statement = "At body temperature (~310 K) k_B·T ≈ 4.3 zJ ≈ 0.026 eV ≈ 0.6 kcal/mol per degree of freedom. Any per-step free-energy bias smaller than a few kT is overwhelmed by thermal fluctuations and produces no net directed motion; per-bond enthalpies near kT are reversed by random kicks. Single-molecule machines must spend free energy comparable to or greater than kT per step to maintain directionality."
  consequence = "A nanobot cannot do clean, directional work with sub-kT energy quanta. This sets a minimum fuel-cost-per-step, a minimum bond-strength for stable assembly, and a maximum useful gear ratio. Origami crossovers, motor power strokes, and rotaxane shuttle ΔΔG must all clear this floor by a comfortable margin."
  honesty = "kT is fundamental thermodynamics, not a lattice value. Numerical magnitude from textbook statistical mechanics; quoted as standard physical constant, not re-derived."
  |> "[@x_astumian_brownian_ratchet]"

@D lim_fueling := "fueling problem (no in-vivo ATP-analog supply at scale)" :: real-limit [ok required]
  wall = "HARD WALL (current engineering / supply-chain limit)"
  statement = "Synthetic molecular machines need a non-equilibrium fuel source (light, chemical fuel, redox cycle) to do directed work. In cuvette this is supplied by the experimenter. In a living organism, the only abundant chemical fuel is ATP (and a few related nucleotides) — and that fuel is consumed and replenished by enzymes that the nanobot is not part of. Engineering a synthetic device that taps ATP catalytically without interfering with normal cellular metabolism is an unsolved problem."
  consequence = "Today, biological motors run on ATP because evolution co-engineered enzyme + substrate; designed synthetic motors typically need exogenous photons or sacrificial chemical fuels delivered in vitro. Bridging to a self-fuelling, regenerable in-vivo cycle is a research frontier."
  honesty = "ATP cost per power stroke is a real biochemical accounting (free energy of ATP hydrolysis at cellular concentrations); any lattice attribution is the forbidden anti-pattern flagged by [@f_lattice_fit]."
  |> "[@x_boyer_walker_atp_nobel_1997] · [@x_astumian_brownian_ratchet]"

@D lim_assembly_errors := "kinetic-trap & assembly-error floor in DNA origami" :: real-limit [ok required]
  wall = "SOFT WALL (tunable but never eliminable)"
  statement = "DNA-origami assembly is a cooperative annealing process whose final yield is bounded by the same kinetic-trap landscape as protein-cage assembly (cf. HEXA-WEAVE [@x_hexa_weave_sibling]): if effective contact strength is too high, partial / misfolded structures persist; if too low, no closed shape forms. Optimal anneal protocols (slow temperature ramps, staple stoichiometry adjustments) push yields toward — but never to — 100%."
  consequence = "Misfolded origami fractions are real and non-zero; downstream purification (gel/AFM screening) is part of every reported workflow. Designed-shape yield is bounded by the thermodynamic+kinetic landscape, not by a lattice count."
  honesty = "The kinetic-trap argument is a general result of cooperative self-assembly, cross-referenced to the WEAVE axis where it is the dominant limit ([@x_hexa_weave_sibling]); no n=6 dependence here either."
  |> "[@x_rothemund_2006] · [@x_hexa_weave_sibling]"

@D lim_biocompatibility := "biocompatibility / immunogenicity wall" :: real-limit [ok required]
  wall = "HARD WALL (in-vivo deployment)"
  statement = "Naked DNA / protein nanostructures injected into a mammalian organism encounter the innate immune system (TLR9 for unmethylated CpG; complement activation; nuclease degradation in serum). Origami constructs additionally face renal clearance, reticuloendothelial-system uptake, and serum-protein corona formation that alter targeting. These are real biological limits, not modelling artefacts."
  consequence = "An origami device that opens reliably in cuvette is not, by itself, a clinical platform. Crossing from in-vitro proof-of-concept (e.g. Douglas/Bachelet/Church 2012 [@x_douglas_bachelet_church_2012]) to safe in-vivo operation in humans is the dominant unsolved problem of therapeutic nanotechnology and is currently UNACHIEVED at clinical scale."
  honesty = "Immunogenicity figures (cytokine-response thresholds, half-life in serum) come from immunology and pharmacokinetics — out of scope for in-silico simulator-consistency and out of scope for this tape's claim ledger."

@D lim_t_quantization_handshake := "geometric quantization of icosahedral cages (NANOBOT↔WEAVE handshake)" :: real-limit [ok required]
  wall = "HARD WALL (number-theoretic / geometric)"
  statement = "When a nanobot design targets an icosahedral cage (DNA-origami polyhedron or protein-cage scaffold), the same Caspar–Klug quantization applies: closed icosahedral shells permit only T = h²+hk+k² (h,k ≥ 0) — values T = 2, 5, 6, 8, 10, 11, 14, … are geometrically forbidden; exactly 12 pentamers is fixed by Euler's polyhedron formula (χ = 2). These are theorems, not tunable design knobs."
  consequence = "A nanobot specification calling for an arbitrary number of cage vertices is over-constrained: the count must be 60·T for some allowed T (or use a non-quasi-equivalent / pseudo-T architecture, itself constrained). This is a geometric constraint inherited from the WEAVE axis; any lattice-derivation reading is the forbidden anti-pattern flagged by [@f_lattice_fit] — the '12' coincidence is Euler χ=2 (closed-surface topology), never an n=6 value."
  honesty = "Cross-references the dominant WEAVE-axis hard limit; verbatim 'observation, not derivation' stance carried across the sister-axis boundary."
  |> "[@x_hexa_weave_sibling]"

@D lim_in_silico_boundary := "in-silico → wet-lab unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio NANOBOT verifies internal consistency of an actuation/assembly SIMULATOR + its metadata. Whether a designed origami container or synthetic motor actually folds, switches, and does useful work in vitro/in vivo at the predicted rate is empirically unverified and out of repo scope. Autonomous in-vivo medical nanobots at clinical scale do NOT exist as of knowledge cutoff (2026-05-16) — what exists is decades of beautiful bench-top science (Feringa motors, DNA origami, motor-protein single-molecule biophysics) that has not yet bridged that gap at scale."
  consequence = "No C2/C3 PASS in this axis is a structural, mechanical, or therapeutic claim. Crossing this boundary requires single-molecule biophysics / cell-culture / animal-model studies tracked outside this repo (hexa-bio AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG.md §0)."

# ─── §7 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-nanobot-design" :: governance [required deny:write]
  pattern = "Deriving nanobot step sizes, stall forces, rotation rates, motor-state counts, vertex/face counts, fuel costs, yields, or efficiencies FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. '4 motor states because τ(6)=4', or '12 vertices because σ(6)=12', or 'efficiency = J₂/sigma·…'."
  why = "Molecular-machine behavior is governed by single-molecule statistical mechanics (kT noise floor, viscous drag), Watson–Crick base-pairing thermodynamics, photochemistry/coordination chemistry, and enzyme catalysis — established in the cited literature (Seeman, Rothemund, Douglas, Andersen, Feringa, Sauvage, Stoddart, Yanagida, Boyer/Walker). NANOBOT is a core hexa-bio axis where the lattice may APPEAR in native-spec context, but appearance is not derivation (hexa-bio AGENTS.tape g2 lattice-is-tool, f1 lattice-fit-forbidden)."
  remedy = "Cite the real DNA-nanotechnology / synthetic-molecular-machine / single-molecule-biophysics sources (this tape's @X entries). The lattice may only be a coincidental OBSERVATION (e.g. F1-ATPase's α3β3 ring numerically has a '6' count, Feringa's photochemical cycle numerically has '4' steps) — never the reason."
  scope-note = "This guard is the NANOBOT-axis instance of the cohort-wide LATTICE_POLICY enforcement (hexa-bio AGENTS.tape f1/f3); it does NOT shadow qmirror/hexa-meta/xeno logic — it references, not reimplements (f3)."

@N n6_honest_stance := "nanobot design has no derivational n=6 invariant" :: note [required]
  text = "Stated plainly: molecular-machine and DNA-nanotechnology design exposes NO natural n=6 invariant. DNA-origami stiffness comes from helical pitch (~10.5 bp/turn) and crossover spacing — Watson–Crick / structural-biology facts. Feringa motor cycles have 4 photo/thermal steps because the overcrowded-alkene photochemistry has 4 states — this numerically COINCIDES with τ(6)=4 but is OBSERVATION ONLY; the cause is the photochemistry of the C=C bond. F1-ATPase is α3β3 (a hexameric ring with three catalytic β-subunits) because of binding-change geometry and gene duplication — coincidence with σ(6)=12 is observation, never derivation. Step sizes (~8 nm for kinesin) come from microtubule periodicity. Stall forces (piconewtons) come from optical-trap measurements. Fuel costs (ΔG_ATP per cycle) come from biochemistry. The kT floor (~4.3 zJ at 310 K) is fundamental statistical mechanics. The geometric T-quantization for icosahedral cages is number-theoretic (Caspar–Klug, [@x_hexa_weave_sibling]). Per hexa-bio AGENTS.tape g1 (real-limits-first) / g2 (lattice-is-tool): in this CORE axis the lattice is permitted to appear in native-spec files as a TOOL, but it is here explicitly DECLINED as a derivation of any count, force, rate, or energy. This honesty is the corrective for the audited lattice-tautology stub this tape replaced."

# ─── §8 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 sub-kT directionality is impossible" :: prediction [ok]
  claim = "No synthetic or biological molecular machine will be reproducibly observed to do net directional mechanical work with a per-cycle free-energy bias smaller than ~kT (room/body temperature), absent a hidden coupled non-equilibrium source. A device claimed to rectify thermal noise alone will, on careful accounting, be found to consume free energy from somewhere."
  falsifier = "A reproduced, peer-reviewed single-molecule experiment showing sustained directional work at strictly sub-kT per-cycle bias with no compensating ΔG flux falsifies [@lim_thermal_noise] and the Brownian-ratchet theorem ([@ratchet_brownian])."
  source = "[@x_astumian_brownian_ratchet]"

@D tp_2 := "TP-2 origami yield is bounded below 100%" :: prediction [ok]
  claim = "Scaffolded DNA-origami yield of a non-trivial 3-D shape, measured by single-particle imaging on a one-pot anneal, will not reach 100% — a non-zero misfolded / aggregated / open-product fraction will remain even under optimised anneal protocols, because the underlying assembly landscape has kinetic traps."
  falsifier = "A peer-reviewed report of a 100%-yield non-trivial 3-D origami fold (no misfolds, no partial products, in a one-pot anneal at a relevant scale) falsifies the kinetic-trap floor [@lim_assembly_errors]."
  source = "[@x_rothemund_2006] · [@x_douglas_2009_nature]"

@D tp_3 := "TP-3 in-vivo autonomous-nanobot gap" :: prediction [ok]
  claim = "As of knowledge cutoff, no synthetic molecular machine (rotaxane / catenane / Feringa motor / origami device) has been demonstrated to operate autonomously in a living mammalian organism with both (a) cell-type-targeted action and (b) sustained directional work, at a level meeting clinical efficacy/safety standards. This is a STATE-OF-FIELD prediction, falsifiable in time."
  falsifier = "Publication of a regulator-grade clinical trial (or equivalent peer-reviewed in-vivo demonstration with reproducibility) of an autonomous synthetic molecular machine delivering targeted therapeutic action in mammals falsifies [@lim_biocompatibility] and [@lim_in_silico_boundary] for this axis."
  source = "[@x_douglas_bachelet_church_2012] (RESEARCH-STAGE in-vitro proof-of-concept, NOT clinical)"

# ─── §9 Cross-links (sister repos / axes — reference, do NOT shadow · f3) ─

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "g1 real-limits-first · g2 lattice-is-tool · g8_in_silico_only · f1 lattice-fit-forbidden · f3 no-shadow-impl-of-sister-repo. This tape complies; chemistry-VQE/Lean/exotic-routing remain in qmirror/hexa-meta/xeno and are referenced via CLI gates, never reimplemented here."

@X x_hexa_weave_sibling := "HEXA-WEAVE.tape" :: sibling-tape [active]
  scope = "Sister axis · Caspar–Klug quasi-equivalence + Zlotnick assembly thermodynamics for protein-cage self-assembly. NANOBOT inherits the geometric T-quantization HARD WALL ([@lim_t_quantization_handshake]) from WEAVE when nanobot designs target icosahedral cages. NANOBOT does NOT reimplement WEAVE's assembly thermodynamics — it references them (f3)."

@X x_qmirror_sibling := "qmirror (sister repo)" :: sister-repo [active]
  scope = "State-vector simulator + chemistry-VQE. If a NANOBOT design needs quantum chemistry (e.g. photoisomerisation energetics of a Feringa-class motor C=C bond, donor–acceptor energetics in a synthetic motor), hexa-bio shells out to qmirror via CLI per AGENTS.tape g5_sister_repo_cli. Hexa-bio NEVER reimplements VQE here (f3)."

@X x_hexa_meta_sibling := "hexa-meta (sister repo)" :: sister-repo [active]
  scope = "Formal/Lean4 layer. If a NANOBOT design proof obligation needs formal verification (e.g. a state-machine contract for a logic-gated container), hexa-bio shells out to hexa-meta via CLI per AGENTS.tape g5_sister_repo_cli. Hexa-bio NEVER reimplements Lean theorems here (f3)."

@X x_xeno_sibling := "xeno (sister repo)" :: sister-repo [active]
  scope = "Exotic-substrate routing (AKIDA / Loihi3 / IonQ / organoid / QRNG). If a NANOBOT design is to be exercised on an exotic substrate (e.g. neuromorphic accelerated MD), hexa-bio shells out to xeno via CLI per AGENTS.tape g5_sister_repo_cli. Hexa-bio NEVER reimplements substrate routing here (f3)."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  scope = "§0 in-silico-only scope boundary — wet-lab single-molecule mechanics, biodistribution, immunogenicity, and clinical efficacy of any designed nanobot are out-of-repo and unverified."

# ─── §10 External citations (real, landmark molecular-machines literature) ─

@X x_seeman_1982 := "Seeman NC 1982" :: literature [active]
  ref = "Seeman NC. Nucleic acid junctions and lattices. J Theor Biol 1982;99:237–247. (foundational paper of structural DNA nanotechnology: minimise sequence symmetry to immobilise junctions, then assemble via sticky ends — the design discipline every DNA-origami construct inherits; primary-author/era, exact pagination cited per long-standing record.)"

@X x_rothemund_2006 := "Rothemund PWK 2006" :: literature [active]
  ref = "Rothemund PWK. Folding DNA to create nanoscale shapes and patterns. Nature 2006;440:297–302. (scaffolded DNA origami: long M13 viral scaffold folded by ~200 short staples into defined 2-D shapes; foundational paper for programmable DNA shape synthesis.)"

@X x_douglas_2009_nature := "Douglas SM et al 2009" :: literature [active]
  ref = "Douglas SM, Dietz H, Liedl T, Högberg B, Graf F, Shih WM. Self-assembly of DNA into nanoscale three-dimensional shapes. Nature 2009;459:414–418. (3-D scaffolded DNA origami on a honeycomb lattice of crossovers; caDNAno design pipeline.)"

@X x_andersen_2009_nature := "Andersen ES et al 2009" :: literature [active]
  ref = "Andersen ES, Dong M, Nielsen MM, Jahn K, Subramani R, Mamdouh W, Golas MM, Sander B, Stark H, Oliveira CLP, Pedersen JS, Birkedal V, Besenbacher F, Gothelf KV, Kjems J. Self-assembly of a nanoscale DNA box with a controllable lid. Nature 2009;459:73–76. (DNA-origami hollow box with a strand-displacement-actuated lid — first demonstration of an addressable, dynamically actuated origami container.)"

@X x_han_2011_science := "Han D et al 2011" :: literature [active]
  ref = "Han D, Pal S, Nangreave J, Deng Z, Liu Y, Yan H. DNA origami with complex curvatures in three-dimensional space. Science 2011;332:342–346. (designed curved 3-D origami shapes — spheres, flasks, vases — via crossover-spacing-driven twist/curvature; primary-authors/era; exact page range cited from secondary sources, treat as approximate.)"

@X x_castro_dietz_compdesign := "Castro CE, Dietz H et al (computational origami design)" :: literature [active]
  ref = "Castro CE, Kilchherr F, Kim D-N, Shiao EL, Wauer T, Wortmann P, Bathe M, Dietz H. A primer to scaffolded DNA origami. Nat Methods 2011;8:221–229. (computational design pipeline + finite-element prediction of origami shape/mechanics, basis of caDNAno + CanDo workflows; primary-authors/era — cited as standard pedagogical reference.)"

@X x_douglas_bachelet_church_2012 := "Douglas SM, Bachelet I, Church GM 2012" :: literature [active]
  ref = "Douglas SM, Bachelet I, Church GM. A logic-gated nanorobot for targeted transport of molecular payloads. Science 2012;335:831–834. (aptamer-AND-logic DNA-origami barrel that opens to expose payloads against selected cell-surface markers — RESEARCH-STAGE in-vitro proof-of-concept in cell culture, NOT a clinical platform.)"

@X x_yin_pierce_walker := "Yin/Pierce strand-displacement walkers (primary-authors/era)" :: literature [active]
  ref = "Yin P, Pierce NA, Turberfield AJ and co-workers developed strand-displacement DNA walkers / cargo-sorting tracks in the late 2000s–early 2010s (multiple Nature/Nature-Nanotech papers). Primary-authors/era cited; this entry is a label for the body of work rather than a single paper. Representative line of research, not a single specific volume/page assertion."

@X x_seelig_strand_displacement := "Seelig G et al — DNA strand-displacement circuits (primary-author/era)" :: literature [active]
  ref = "Seelig G, Soloveichik D, Zhang DY, Winfree E developed toehold-mediated strand-displacement reaction networks (Science 2006 and following). Primary-authors/era cited; the body of work underlies most engineered DNA-walker kinetics. No single page/volume asserted beyond the well-known Seelig 2006 Science paper."

@X x_feringa_1999 := "Koumura N, Zijlstra RWJ, van Delden RA, Harada N, Feringa BL 1999" :: literature [active]
  ref = "Koumura N, Zijlstra RWJ, van Delden RA, Harada N, Feringa BL. Light-driven monodirectional molecular rotor. Nature 1999;401:152–155. (first synthetic unidirectional molecular rotary motor: overcrowded alkene with photoisomerisation + thermal helix-inversion 4-step cycle, broken-symmetry chirality.)"

@X x_sauvage_nobel_2016 := "Sauvage J-P — 2016 Nobel Prize (primary-author/era)" :: literature [active]
  ref = "Sauvage J-P. Development of metal-templated catenane synthesis (1980s onward), recognised by the 2016 Nobel Prize in Chemistry shared with Stoddart and Feringa 'for the design and synthesis of molecular machines'. Primary-author/era cited; foundational catenane work spans many papers."

@X x_stoddart_nobel_2016 := "Stoddart JF — 2016 Nobel Prize (primary-author/era)" :: literature [active]
  ref = "Stoddart JF. Development of bistable rotaxane molecular shuttles (1990s onward), recognised by the 2016 Nobel Prize in Chemistry shared with Sauvage and Feringa. Primary-author/era cited; foundational rotaxane shuttle work spans many papers."

@X x_feringa_nobel_2016 := "Feringa BL — 2016 Nobel Prize (primary-author/era)" :: literature [active]
  ref = "Feringa BL. Development of synthetic unidirectional molecular rotary motors (1999 onward, see [@x_feringa_1999]), recognised by the 2016 Nobel Prize in Chemistry shared with Sauvage and Stoddart 'for the design and synthesis of molecular machines'."

@X x_boyer_walker_atp_nobel_1997 := "Boyer PD, Walker JE — 1997 Nobel Prize in Chemistry (primary-authors/era)" :: literature [active]
  ref = "Boyer PD (binding-change mechanism of ATP synthase) and Walker JE (X-ray crystal structure of mitochondrial F1-ATPase) shared the 1997 Nobel Prize in Chemistry (with Jens C. Skou) for elucidating the enzymatic mechanism of ATP synthesis. Primary-authors/era cited; foundational F1-ATPase work spans many papers (Walker structure landmark: Abrahams JP, Leslie AGW, Lutter R, Walker JE, Nature 1994;370:621–628 — author/era cited as standard reference)."

@X x_yanagida_single_molecule := "Yanagida T and co-workers — single-molecule motor biophysics (primary-author/era)" :: literature [active]
  ref = "Yanagida T and co-workers (Osaka) developed single-molecule fluorescence/optical-trap measurements of myosin and kinesin step sizes and dwell-time statistics through the 1990s–2000s, alongside Spudich/Finer/Simmons (Stanford) and Block (Stanford) groups. Primary-author/era cited; the body of work is the empirical foundation for [@bio_kinesin_myosin] and [@bio_motors_overview]. No single specific page/volume asserted."

@X x_astumian_brownian_ratchet := "Astumian RD — Brownian-ratchet theory (primary-author/era)" :: literature [active]
  ref = "Astumian RD, Magnasco MO, Jülicher F, Prost J and co-workers developed the modern statistical-mechanical theory of Brownian / flashing ratchets through the 1990s–2000s (multiple Phys Rev Lett / Rev Mod Phys / Nature papers). Astumian RD. Thermodynamics and kinetics of a Brownian motor. Science 1997;276:917–922 is a standard entry-point reference; primary-author/era cited for the broader body of work."
