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
# HEXA-WEAVE.tape — architecture-current (editable per v1.2)
# Event history → HEXA-WEAVE.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "hexa-weave" :: identity-claim [d=2026-05-15 active]
  kind = "HEXA-Bio family · WEAVE axis — capsid / protein-cage self-assembly (Caspar–Klug quasi-equivalence + Zlotnick nucleation–elongation thermodynamics)"
  brief = "icosahedral capsid & cage self-assembly · triangulation-number geometry · assembly ΔG / kinetic-trap landscape · n=6 used as a lattice TOOL only, never a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "HEXA-WEAVE.log.tape"
  scope = "in-silico assembly-simulator consistency SSOT · NOT a wet-lab claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-15 — see HEXA-WEAVE.log.tape audit"
  axis-note = "WEAVE is a CORE hexa-bio axis: the n=6 lattice legitimately APPEARS in native-lattice-spec context, but here it is never the source of a count, yield, or ΔG. T-numbers, hexamer/pentamer counts and assembly energetics are geometry/thermodynamics. See [@f_lattice_fit] + [@n6_honest_stance]."

@N scope_disclaimer := "in-silico-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico self-assembly modeling substrate. T-numbers, subunit counts, ΔG and rate constants are paraphrased from structural-virology / self-assembly literature for modeling context only. A C2/C3 in-silico simulator-consistency PASS here is NOT a wet-lab, structural, therapeutic, or vaccine claim — every assembled-cage prediction is unverified at the wet-lab boundary (hexa-bio AGENTS.tape g8_in_silico_only). Quantitative figures are illustrative magnitudes from the cited primary literature, not re-derived constants."
  |> "[@x_caspar_klug_1962] · [@x_zlotnick_1994]"

# ─── §1 Caspar–Klug quasi-equivalence (the foundational theory) ───────

@D ck_quasi_equivalence := "Caspar–Klug quasi-equivalence" :: domain [ok]
  problem = "Genetic economy: a small viral genome cannot encode a unique protein for every position in a large shell. Crick & Watson (1956) argued the shell must be built from many copies of one (or few) proteins arranged with symmetry so each copy sits in a near-identical environment."
  principle = "Caspar & Klug (1962): identical subunits tolerate small, specific deformations of their bonding ('quasi-equivalence') so a closed shell can be built from a fixed icosahedral asymmetric unit replicated 60·T times, with subunits clustered into 12 pentamers + 10(T−1) hexamers."
  symmetry = "Icosahedral point group: 12 five-fold, 20 three-fold, 30 two-fold axes; the asymmetric unit is 1/60 of the shell."
  honesty = "Quasi-equivalence is a structural/energetic theory grounded in genetic economy + protein bonding. It is NOT derived from an n=6 invariant; the recurring '6' (hexamers) is the hexavalent clustering of the icosahedral net, a geometric fact of the surface lattice."
  |> "[@x_crick_watson_1956] · [@x_caspar_klug_1962]"

@D ck_triangulation := "triangulation number T (geometry)" :: classification [ok]
  definition = "T = h² + hk + k² for non-negative integers h, k (Goldberg/Caspar–Klug class). T enumerates how a hexagonal net is folded onto an icosahedron."
  allowed-values = "T ∈ {1, 3, 4, 7, 9, 12, 13, 16, 19, 21, 25, …} — the quadratic form h²+hk+k² does NOT take every integer (e.g. T=2,5,6,8,10,11,14 are NOT attainable). This gap is a real number-theoretic / geometric quantization, NOT a lattice choice — see [@lim_t_quantization]."
  subunit-count = "Total subunits = 60·T. Capsomers = 12 pentamers + 10·(T−1) hexamers (e.g. T=1: 12 pent, 0 hex, 60 subunits; T=3: 12 pent, 20 hex, 180 subunits; T=7: 12 pent, 60 hex, 420 subunits — chirality d/l for h≠k≠0)."
  examples = "T=1 satellite tobacco necrosis virus; T=3 many plant/RNA viruses (e.g. tomato bushy stunt, cowpea mosaic); T=4 hepatitis B core; T=7 many tailed bacteriophages (HK97); T=13 rotavirus / reovirus inner layers; very large T in giant viruses & herpesviruses (T=16)."
  honesty = "T-numbers and the 12-pentamer rule are theorems of icosahedral surface geometry (Caspar–Klug; Goldberg polyhedra). Any numerical coincidence with an invariant-lattice scalar is OBSERVATION ONLY (anti-pattern when treated as a derivation — see [@f_lattice_fit]), never a cause."
  |> "[@x_caspar_klug_1962] · [@x_crick_watson_1956]"

@D ck_pentamer_invariant := "exactly twelve pentamers" :: mechanism [ok]
  statement = "Every closed icosahedral deltahedral shell has exactly 12 five-coordinated vertices (pentamers); only the number of six-coordinated sites (hexamers) grows with T. This is the discrete Gauss–Bonnet / Euler-characteristic constraint (χ=2) for a closed polyhedral surface, the same constraint behind '12 pentagons on a soccer ball / fullerene'."
  consequence = "Pentamers introduce the required curvature; hexamers are flat. Assembly must place exactly 12 disclinations regardless of shell size."
  honesty = "The '12' is topological (Euler characteristic), not the n=6 lattice σ(6)=12. Numerical coincidence is observation; the derivation is Euler's polyhedron formula. Flagged here so it is never mis-cited as lattice-derived."
  |> "[@x_caspar_klug_1962]"

# ─── §2 Beyond strict quasi-equivalence (real exceptions) ─────────────

@D ex_pseudo_t := "pseudo-T and non-quasi-equivalent capsids" :: classification [ok]
  pseudo-T = "Some capsids built from a single ~T arrangement but with chemically distinct subunits at quasi-equivalent positions are described as 'pseudo-T=N' (e.g. picornaviruses: pseudo-T=3 / P=3 from three different jelly-roll proteins occupying the T=3 positions)."
  papova-exception = "Polyoma-/papillomaviruses violate strict Caspar–Klug: 360 subunits as 72 pentamers (NO hexamers), a pentamer at both 5- and 6-coordinated positions — 'all-pentamer T=7' that classical quasi-equivalence cannot describe."
  resolution = "Tiling theory (Twarock and co-workers) generalizes Caspar–Klug, modeling subunit bonding as a tiling (rhomb/kite) and recovering both standard and exceptional capsids; uses a higher-dimensional (6D) lattice projection as a MATHEMATICAL construction tool — explicitly a geometric tool, not an n=6 biology invariant."
  honesty = "These exceptions are the strongest evidence that capsid architecture is governed by protein-bonding geometry + thermodynamics, not by any fixed small invariant. The '6D lattice' in tiling theory is a Penrose-style projection device; it is unrelated to and must not be conflated with the hexa n=6 lattice tool."
  |> "[@x_twarock_2004] · [@x_caspar_klug_1962]"

@D ex_scaffolding := "scaffolding proteins & assembly chaperoning" :: mechanism [ok]
  role = "Many dsDNA bacteriophages/herpesviruses do not self-assemble the mature capsid directly: a transient internal scaffolding protein co-assembles with coat protein into a procapsid, templating curvature/size, then exits during genome packaging and maturation expansion."
  example = "Bacteriophage P22: ~415 copies coat protein (gp5) + ~250–300 copies scaffolding protein (gp8) form the procapsid; scaffolding exits, procapsid expands to the mature, angular capsid (counts paraphrased from cryo-EM literature, illustrative)."
  consequence = "Size/T-number selection is an active kinetic+templating process, not a passive geometric inevitability. Mis-scaffolding yields aberrant T-numbers (T=4 vs T=7 petit/giant phage variants)."
  honesty = "Scaffolding-mediated assembly is direct evidence that the final geometry is selected by protein–protein kinetics and chaperoning, reinforcing 'observation-not-derivation' for any count."
  |> "[@x_fane_prevelige_2003] · [@x_caspar_klug_1962]"

# ─── §3 Zlotnick assembly thermodynamics & kinetics ──────────────────

@D z_equilibrium_model := "Zlotnick equilibrium self-assembly model" :: mechanism [ok]
  model = "Zlotnick (1994): capsid assembly modeled as a cascade of reversible subunit-addition equilibria between free subunit, intermediates, and complete capsid; a single pairwise association free energy per contact, summed over the contact graph, gives the assembly free-energy landscape."
  cooperativity = "Even without an explicit cooperativity term, the model predicts highly cooperative, all-or-none behavior: at equilibrium essentially only free subunit OR complete capsid is abundant; intermediates are present only in trace amounts."
  pseudo-critical = "There is a pseudo-critical subunit concentration: below it almost no capsid; above it assembly proceeds strongly — sharp concentration dependence resembling a phase transition."
  honesty = "ΔG_assembly is a sum of measured/estimated per-contact bond energies (typically weak, a few kcal/mol per contact, multiplied over many contacts) — a thermodynamic quantity from the cited literature, never a lattice scalar."
  |> "[@x_zlotnick_1994]"

@D z_nucleation_elongation := "nucleation–elongation kinetics" :: mechanism [ok]
  nucleus = "Assembly is nucleation-limited: a rate-limiting small oligomeric 'nucleus' must form before favorable elongation proceeds. This produces a characteristic lag phase followed by rapid growth (sigmoidal assembly curve)."
  elongation = "After nucleation, sequential subunit addition along the growing edge is fast and increasingly favorable as each added subunit forms more contacts (more bonds per subunit toward completion)."
  rate-law = "Assembly rate is steeply (super-linear) dependent on free-subunit concentration; nucleus size and the per-contact ΔG set the lag time and the apparent cooperativity (Endres & Zlotnick model-based analysis)."
  honesty = "Nucleus size, lag time, and rate constants are kinetic parameters fitted to light-scattering / SEC / mass-spec assembly data in the cited work — not derived from n=6."
  |> "[@x_zlotnick_1994] · [@x_endres_zlotnick_2002]"

@D z_kinetic_trap := "kinetic traps & off-pathway aggregation" :: mechanism [ok]
  trap = "If nucleation outpaces the supply of subunits for elongation (e.g. subunit concentration or bond strength too high), many partial shells start and deplete free subunit, stalling as incomplete/malformed capsids — a kinetic trap, not the thermodynamic minimum."
  off-pathway = "Excessively strong contacts also drive off-pathway aggregation (closed but malformed, or open aberrant assemblies) that cannot anneal on biological timescales."
  optimum = "Robust assembly requires an intermediate bond strength / subunit-flux window: weak enough that incorrect contacts dissociate (error correction), strong enough that correct intermediates persist."
  honesty = "The kinetic-trap landscape is the central real limit of self-assembly engineering; see [@lim_kinetic_trap]. It is a thermodynamic/kinetic constraint, fully independent of any lattice."
  |> "[@x_endres_zlotnick_2002] · [@x_zlotnick_1994]"

@D z_hysteresis := "assembly–disassembly hysteresis" :: mechanism [ok]
  observation = "Capsid assembly and disassembly do not retrace the same path versus subunit concentration / denaturant: a large free-energy barrier separates few-bond early states from the many-bond complete capsid, so assembled capsids persist below the concentration at which they would form."
  consequence = "Hysteresis means a thermodynamically metastable capsid can be kinetically stable — useful for engineered cages (assemble at high flux, deploy in dilute conditions) but also a source of trapped malformed states."
  honesty = "Hysteresis is an experimentally and theoretically established kinetic phenomenon (Zlotnick and co-workers), reported as a barrier/path effect — not a derived quantity."
  |> "[@x_endres_zlotnick_2002]"

@D z_error_correction := "error correction in self-assembly" :: mechanism [ok]
  mechanism = "Reversibility is the error-correction mechanism: weak, reversible subunit binding lets incorrectly placed subunits dissociate and the correct contact to form, so the system anneals toward the symmetric closed minimum rather than freezing in the first contact made."
  tradeoff = "There is an inherent speed/fidelity tradeoff: stronger bonds → faster but more trapped errors; weaker bonds → slower but higher-fidelity closed shells. The same tradeoff governs designed protein cages."
  honesty = "Error correction by reversible binding is a general statistical-mechanical principle of cooperative self-assembly, grounded in the Zlotnick-class kinetic models — not a lattice rule."
  |> "[@x_zlotnick_1994] · [@x_endres_zlotnick_2002]"

# ─── §4 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ───

@D lim_kinetic_trap := "kinetic-trap / off-pathway aggregation limit" :: real-limit [ok required]
  wall = "SOFT WALL (kinetic, tunable but never eliminable)"
  statement = "Cooperative subunit self-assembly has an intrinsic kinetic-trap regime: if effective nucleation flux exceeds elongation supply, the system stalls in incomplete/malformed shells rather than reaching the symmetric minimum. There is no bond-strength setting that gives both maximal speed and zero trapping."
  consequence = "An in-silico designed cage cannot be claimed to assemble cleanly purely from a target geometry; the assembly trajectory must clear this kinetic constraint. Designed yields are bounded by the trap landscape, not by a count."
  |> "[@x_endres_zlotnick_2002]"

@D lim_thermo_window := "thermodynamic assembly window" :: real-limit [ok required]
  wall = "SOFT WALL (concentration/energy bounded)"
  statement = "Productive assembly exists only inside a window: above a pseudo-critical subunit concentration AND within a per-contact ΔG band. Too weak → no capsid (no stable nucleus); too strong → trapped/aggregated. The window is set by per-contact bond energetics and stoichiometry, not by design freedom."
  consequence = "Self-assembling-cage designs must hit this thermodynamic window; existence of a closed geometry does not imply an accessible assembly path. Bounds come from ΔG/Kd of the engineered interface."
  |> "[@x_zlotnick_1994]"

@D lim_t_quantization := "geometric quantization of T-numbers" :: real-limit [ok required]
  wall = "HARD WALL (number-theoretic / geometric)"
  statement = "Only T = h²+hk+k² (h,k ≥ 0) are realizable as quasi-equivalent icosahedral shells; integers not of this form (T=2,5,6,8,10,11,14,…) are geometrically forbidden. Exactly 12 pentamers is fixed by the closed-surface Euler characteristic. These are theorems, not tunable parameters."
  consequence = "A target shell size cannot be set to an arbitrary subunit count: 60·T is discretized to allowed T only (or requires a non-quasi-equivalent / pseudo-T architecture, itself constrained — see [@ex_pseudo_t]). This is a geometric constraint, explicitly NOT an n=6 lattice value."
  honesty = "This is the real geometric quantization that a naive 'pick any n' design would violate — it is exactly the kind of hard limit LATTICE_POLICY g1 requires us to anchor to, and it has nothing to do with the n=6 invariant lattice."
  |> "[@x_caspar_klug_1962]"

@D lim_in_silico_boundary := "in-silico → wet-lab unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio WEAVE verifies internal consistency of an assembly SIMULATOR + its metadata. Whether a designed sequence actually folds, oligomerizes, nucleates, and closes into the predicted cage in vitro/in vivo is empirically unproven and out of repo scope."
  consequence = "No C2/C3 PASS in this axis is a structural, therapeutic, or vaccine-platform claim. Crossing this boundary requires wet-lab structural validation (cryo-EM/X-ray) tracked outside this repo (hexa-bio AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG.md §0)."

# ─── §5 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-capsid-assembly" :: governance [required deny:write]
  pattern = "Deriving capsid/cage subunit counts, T-numbers, hexamer/pentamer counts, yields, ΔG, or assembly rates FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. '12 pentamers because σ(6)=12', or 'hexamer because n=6', or 'assembly yield = J₂/… '."
  why = "Capsid/cage assembly is governed by Caspar–Klug quasi-equivalence + icosahedral surface geometry (Euler χ=2) and Zlotnick-class assembly thermodynamics/kinetics. WEAVE is a core hexa-bio axis where the lattice may APPEAR in native-spec context, but appearance is not derivation (hexa-bio AGENTS.tape g2 lattice-is-tool, f1 lattice-fit-forbidden)."
  remedy = "Cite the real structural-virology / self-assembly sources (this tape's @X entries). The lattice may only be a coincidental OBSERVATION (e.g. 12 pentamers numerically equals σ(6)=12) — never the reason."
  scope-note = "This guard is the WEAVE-axis instance of the cohort-wide LATTICE_POLICY enforcement (hexa-bio AGENTS.tape f1/f3); it does NOT shadow qmirror/hexa-meta/xeno logic — it references, not reimplements (f3)."

@N n6_honest_stance := "capsid assembly has no derivational n=6 invariant" :: note [required]
  text = "Stated plainly: icosahedral capsid and protein-cage self-assembly exposes NO natural n=6 invariant. Subunit count is 60·T where T = h²+hk+k² (geometry/number theory). There are exactly 12 pentamers by the closed-surface Euler characteristic (χ=2) — this numerically COINCIDES with σ(6)=12 but is OBSERVATION ONLY; the cause is Euler's polyhedron formula, never the lattice. Hexamers (six-coordinated capsomers) are a geometric feature of the hexagonal surface net, not the n=6 tool. T-numbers (1,3,4,7,13,16,…), the allowed/forbidden T gap, ΔG_assembly, nucleus size, and lag time are governed by Caspar–Klug quasi-equivalence and Zlotnick assembly thermodynamics/kinetics — NOT by an n=6 invariant. Per hexa-bio AGENTS.tape g1 (real-limits-first) / g2 (lattice-is-tool): in this CORE axis the lattice is permitted to appear in native-spec files as a TOOL, but it is here explicitly DECLINED as a derivation of any count, yield, or energy. This honesty is the corrective for the audited lattice-tautology stub this tape replaced."

# ─── §6 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 forbidden T-numbers" :: prediction [ok]
  claim = "No quasi-equivalent icosahedral capsid will be observed with a subunit number 60·T where T ∉ {h²+hk+k²} (e.g. no genuine quasi-equivalent T=2 or T=6 capsid); apparent counterexamples will resolve to pseudo-T or non-quasi-equivalent (tiling-theory) architectures."
  falsifier = "A cryo-EM/X-ray structure of a strictly quasi-equivalent capsid with a geometrically forbidden T (and not reducible to pseudo-T / tiling) falsifies [@lim_t_quantization]."
  source = "[@x_caspar_klug_1962] · [@x_twarock_2004]"

@D tp_2 := "TP-2 nucleation lag & cooperativity" :: prediction [ok]
  claim = "In-vitro reassembly of a Zlotnick-class capsid protein will show a concentration-dependent lag phase and a pseudo-critical concentration below which assembled capsid is negligible; intermediates remain at trace levels at equilibrium."
  falsifier = "Reproducible assembly with no lag, no pseudo-critical concentration, and high steady-state intermediate populations under standard conditions falsifies the nucleation–elongation model [@z_nucleation_elongation]."
  source = "[@x_zlotnick_1994] · [@x_endres_zlotnick_2002]"

@D tp_3 := "TP-3 kinetic-trap from over-strong contacts" :: prediction [ok]
  claim = "Increasing effective subunit–subunit affinity (mutation or conditions) beyond the assembly window will REDUCE the yield of correctly closed capsids (more trapped/aggregated states), not increase it monotonically."
  falsifier = "Monotonic yield increase with unbounded contact strength, with no trapping/aggregation regime, falsifies the kinetic-trap limit [@lim_kinetic_trap]."
  source = "[@x_endres_zlotnick_2002]"

# ─── §7 Cross-links (sister repos — reference, do NOT shadow · f3) ────

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "g1 real-limits-first · g2 lattice-is-tool · g8_in_silico_only · f1 lattice-fit-forbidden · f3 no-shadow-impl-of-sister-repo. This tape complies; chemistry-VQE/Lean/exotic-routing remain in qmirror/hexa-meta/xeno and are referenced via CLI gates, never reimplemented here."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  scope = "§0 in-silico-only scope boundary — wet-lab structural validation (cryo-EM/X-ray) of any designed cage is out-of-repo and unverified."

# ─── §8 External citations (real, landmark structural-virology) ───────

@X x_crick_watson_1956 := "Crick FHC & Watson JD 1956" :: literature [active]
  ref = "Crick FHC, Watson JD. Structure of small viruses. Nature 1956;177:473–475. (genetic economy → identical subunits with identical environment; multiple of 60 for 5:3:2 symmetry)"

@X x_caspar_klug_1962 := "Caspar DLD & Klug A 1962" :: literature [active]
  ref = "Caspar DLD, Klug A. Physical principles in the construction of regular viruses. Cold Spring Harbor Symp Quant Biol 1962;27:1–24. (quasi-equivalence; triangulation number T = h²+hk+k²; 12 pentamers + 10(T−1) hexamers — the foundational theory)"

@X x_zlotnick_1994 := "Zlotnick A 1994" :: literature [active]
  ref = "Zlotnick A. To build a virus capsid: an equilibrium model of the self assembly of polyhedral protein complexes. J Mol Biol 1994;241:59–67. (reversible subunit-addition equilibrium model; nucleation-limited, all-or-none cooperative assembly; pseudo-critical concentration)"

@X x_endres_zlotnick_2002 := "Endres D & Zlotnick A 2002" :: literature [active]
  ref = "Endres D, Zlotnick A. Model-based analysis of assembly kinetics for virus capsids or other spherical polymers. Biophys J 2002;83:1217–1230. (nucleation–elongation kinetics, kinetic traps, assembly–disassembly hysteresis; primary-authors/era — exact page range cited from secondary sources, treat as approximate)"

@X x_twarock_2004 := "Twarock R 2004 (and co-workers)" :: literature [active]
  ref = "Twarock R. A tiling approach to virus capsid assembly explaining a structural puzzle in virology. J Theor Biol 2004;226:477–482. (tiling theory generalizing Caspar–Klug to polyoma-/papillomavirus all-pentamer T=7 'pseudo-T' exceptions; uses a 6D Penrose-style projection as a MATHEMATICAL device — unrelated to the hexa n=6 lattice; primary-author/era — exact volume not asserted)"

@X x_fane_prevelige_2003 := "Fane BA & Prevelige PE 2003 (scaffolding-protein assembly; primary-authors/era)" :: literature [active]
  ref = "Fane BA, Prevelige PE Jr. Mechanism of scaffolding-assisted viral assembly. Adv Protein Chem 2003;64:259–299. (transient internal scaffolding proteins template procapsid size/curvature, e.g. bacteriophage P22 coat gp5 + scaffolding gp8; review — primary-authors/era cited, exact volume not asserted)"
