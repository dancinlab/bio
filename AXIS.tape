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
# AXIS.tape — architecture-current (editable per v1.2)
# 5-axis structural SSOT for the hexa-bio molecular toolkit
# Event history → AXIS.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "axis" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · axis verification SSOT"
  brief = "5-axis structural SSOT · declares the hexa-bio molecular substrate architecture (QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "AXIS.log.tape"
  tape-class = "meta/axis-verification"
  rewritten-from = "philosophical/VQE-reflection stub (lattice-tautology content, pre-2026-05-16); structural rewrite 2026-05-16 — see AXIS.log.tape audit"
  honesty-notes = "5-axis structural SSOT · lattice may appear in native-spec context (g2) but NOT as derivation · each axis is declared as project architecture, not derived from n=6 · numerical coincidences are observation only"

# ─── §0.1 Honesty preamble ────────────────────────────────────────────

@N scope_disclaimer := "in-silico-scope honesty" :: note [required]
  text = "This tape is the structural meta-SSOT for the hexa-bio 5-axis molecular toolkit. It declares the five computation axes (QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID) as project architecture, cross-linking each to its dedicated per-axis tape (HEXA-WEAVE.tape · HEXA-NANOBOT.tape · HEXA-RIBOZYME.tape · HEXA-VIROCAPSID.tape) and the quantum/ directory. Each axis is an in-silico simulation substrate only — a C2/C3 in-silico simulator-consistency PASS is NOT a wet-lab, clinical, therapeutic, or regulatory claim. All 5 axes are scientifically unverified at the wet-lab boundary (hexa-bio AGENTS.tape g8_in_silico_only). This tape makes no efficacy claims; it declares architecture."
  authority = "[@x_agents_tape] g8_in_silico_only · [@x_lattice_policy] g1/g2"

@F f_lattice_fit := "lattice-fit-in-axis-verification" :: governance [required deny:write]
  pattern = "Deriving any axis count, axis position, or verification claim FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) inside this tape — e.g. 'there are N axes because σ·φ/k', or 'axis X passes because of lattice invariant Y'."
  why = "Per AGENTS.tape g2 (lattice-is-tool) the n=6 lattice legitimately APPEARS in native-lattice-spec context as a structural identifier — the hexa-bio project name and axis names carry the 'hexa' token as a branding/naming artifact. That is observation. The anti-pattern is when the lattice becomes a DERIVATION: claiming the axis count is 5 because of σ, or that any axis result follows from a lattice scalar. The axes are architectural decisions grounded in biology and computational scope, not in the lattice."
  exception = "Lattice tokens (σ · τ · φ · J₂ · n=6 · hexa) may APPEAR as artifact names, structural identifiers, or cross-references to the n=6 lattice TOOL — these are observation/naming provenance. Derivation of any count, yield, or result from those tokens is forbidden."
  authority = "[@x_lattice_policy] g1/g2 · [@x_agents_tape] f1 · [@x_agents_tape] g2"

@N n6_honest_stance := "5-axis architecture is observation-not-derivation from n=6" :: note [required]
  text = "The hexa-bio project has 5 molecular axes: QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID. This count (5) is the project's architectural decision grounded in the computational scope chosen for each biological substrate — quantum chemistry VQE, icosahedral capsid self-assembly, molecular nanotechnology, ribozyme catalysis, and viral capsid virology — not derived from any lattice invariant. The 'hexa' in project name is a branding/naming artifact (the dancinlab hexa family). If the n=6 lattice happens to appear in per-axis tapes (e.g. HEXA-WEAVE.tape cites hexamer packing in icosahedral geometry), that is a biological/geometric observation from the capsid science literature, not a derivation. The lattice is a tool (AGENTS.tape g2, LATTICE_POLICY §1.2) — lattice tokens are structural identifiers here, NEVER derivation source."
  methodology-cite = "AGENTS.tape g2 (lattice-is-tool) · LATTICE_POLICY §1.2 (observation-not-derivation) · HEXA-WEAVE.tape axis-note (WEAVE native-spec lattice precedent)"

# ─── §1 External citations ────────────────────────────────────────────

@X x_lattice_policy := "echoes/LATTICE_POLICY.md" :: governance [active]
  url = "https://github.com/dancinlab/echoes/blob/main/LATTICE_POLICY.md"
  scope = "real-limits-first · lattice-is-tool · observation-not-derivation — the governance authority this preamble enforces"

@X x_agents_tape := "hexa-bio AGENTS.tape" :: governance [active]
  path = "./AGENTS.tape"
  scope = "g1 real-limits-first · g2 lattice-is-tool · g8_in_silico_only · g_meta_mode_optin · f1 lattice-fit-on-external-entity · id001 5-axis substrate declaration"

@X x_hexa_weave_sibling := "HEXA-WEAVE.tape" :: sibling-tape [active]
  path = "./HEXA-WEAVE.tape"
  scope = "WEAVE axis canonical tape — Caspar–Klug quasi-equivalence · Zlotnick nucleation–elongation · icosahedral capsid self-assembly · lattice-in-native-spec precedent (hexamer packing is geometric observation, not n=6 derivation)"

@X x_hexa_nanobot_sibling := "HEXA-NANOBOT.tape" :: sibling-tape [active]
  path = "./HEXA-NANOBOT.tape"
  scope = "NANOBOT axis canonical tape — DNA nanotechnology · molecular motors · single-actuator C0b skeleton · Brownian/thermal-noise real limits"

@X x_hexa_ribozyme_sibling := "HEXA-RIBOZYME.tape" :: sibling-tape [active]
  path = "./HEXA-RIBOZYME.tape"
  scope = "RIBOZYME axis canonical tape — ribozyme catalysis · Eyring k_cat limits · MFE/Nussinov secondary structure · off-target screen"

@X x_hexa_virocapsid_sibling := "HEXA-VIROCAPSID.tape" :: sibling-tape [active]
  path = "./HEXA-VIROCAPSID.tape"
  scope = "VIROCAPSID axis canonical tape — viral capsid assembly · PDB corpus · virocapsid structural biology"

@X x_quantum_dir := "quantum/ directory" :: sibling-tape [active]
  path = "./quantum/"
  scope = "QUANTUM axis implementation — VQE pipeline via qmirror · pocket active-space · ligand SMILES → H · UCCSD/HE/H2 ansatz · Qiskit bridge (legacy)"

# ─── §2 Axis registry ─────────────────────────────────────────────────

@D axis_quantum := "QUANTUM — VQE / quantum chemistry axis" :: axis-declaration [active d=2026-05-16]
  axis-id = "QUANTUM"
  substrate = "quantum chemistry · VQE (Variational Quantum Eigensolver) · active-space selection · molecular Hamiltonian construction"
  impl = "quantum/ · _qiskit_bridge/ · qmirror sister-repo (CLI gate, not reimplemented here)"
  real-limits = "chemical accuracy threshold (1 kcal/mol ≈ 1.6e-3 Ha) · active-space exponential scaling (N-electron Hilbert space grows as C(2K,N)) · shot noise 1/√shots · decoherence T1/T2 on hardware"
  scope-boundary = "in-silico VQE simulation only · hardware execution is deferred (COMPUTE_PORTFOLIO.md)"
  honesty = "VQE convergence claims are in-silico simulator-consistency checks. Chemical accuracy, basis-set limits, and Hamiltonian truncation are real computational-chemistry limits. The 'quantum' label refers to gate-based quantum computation, not to an n=6-derived quantity."
  ?> x_quantum_dir

@D axis_weave := "WEAVE — icosahedral capsid self-assembly axis" :: axis-declaration [active d=2026-05-16]
  axis-id = "WEAVE"
  substrate = "protein-cage / viral capsid self-assembly · Caspar–Klug quasi-equivalence · Zlotnick nucleation–elongation thermodynamics · triangulation-number T geometry"
  impl = "hexa-weave/ · HEXA-WEAVE.tape"
  real-limits = "Caspar–Klug T-number quantization (T = h²+hk+k² — geometric; T=2,5,6 not attainable) · thermodynamic cooperativity (assembly ΔG from per-contact bond energies, typically a few kcal/mol × contact-number) · Euler-characteristic 12-pentamer constraint (topological, not lattice-derived)"
  scope-boundary = "in-silico self-assembly modeling only · no wet-lab structural claim"
  honesty = "Hexamer counts in icosahedral shells are geometric consequences of the Caspar–Klug surface lattice (icosahedral net folding). Any occurrence of '6' or 'hexamer' in HEXA-WEAVE.tape is biological/geometric observation from the structural-virology literature, not derived from n=6. See [@x_hexa_weave_sibling] axis-note."
  ?> x_hexa_weave_sibling

@D axis_nanobot := "NANOBOT — molecular machines / DNA nanotechnology axis" :: axis-declaration [active d=2026-05-16]
  axis-id = "NANOBOT"
  substrate = "DNA nanotechnology · DNA origami · synthetic molecular motors/rotaxanes · biological motor proteins (kinesin/myosin/ATP-synthase) as reference benchmarks · internal codename: C0b single-actuator skeleton"
  impl = "hexa-nanobot/ · HEXA-NANOBOT.tape"
  real-limits = "thermal noise floor kT = 4.1 pN·nm at 298 K (Brownian limit) · viscous drag (Stokes–Einstein D = kT/(6πηr)) · DNA base-pair thermodynamics (Tm, ΔG hybridization) · motor efficiency η ≤ ~50% (Carnot-bounded for isothermal machines; known motors 25–50% in literature)"
  scope-boundary = "in-silico actuation simulator only · not a therapeutic nanobot or clinical device claim"
  honesty = "Step-size, torque, and fuel-cost figures are drawn from the molecular-machines literature (kinesin 8 nm/step, ATP-synthase ~120° per ATP, etc.) — real physical measurements, not lattice-derived quantities."
  ?> x_hexa_nanobot_sibling

@D axis_ribozyme := "RIBOZYME — ribozyme catalysis axis" :: axis-declaration [active d=2026-05-16]
  axis-id = "RIBOZYME"
  substrate = "ribozyme catalysis · RNA secondary structure (MFE / Nussinov bracket) · kinetic rate constants · off-target screening · reaction-coordinate quotient"
  impl = "hexa-ribozyme/ · HEXA-RIBOZYME.tape"
  real-limits = "Eyring transition-state theory (k_cat = (kT/h)·exp(-ΔG‡/RT)) · RNA minimum-free-energy structure (Nussinov / Turner nearest-neighbor thermodynamics) · off-target cleavage floor set by sequence complementarity and secondary-structure accessibility"
  scope-boundary = "in-silico ribozyme kinetics and structure modeling only · not a therapeutic or diagnostic claim"
  honesty = "Rate constants and ΔG‡ values are from the ribozyme-catalysis literature (hammerhead, HDV, VS, hairpin ribozymes) or computed via Eyring TST with ab-initio ΔG‡ estimates. No lattice derivation."
  ?> x_hexa_ribozyme_sibling

@D axis_virocapsid := "VIROCAPSID — viral capsid structural biology axis" :: axis-declaration [active d=2026-05-16]
  axis-id = "VIROCAPSID"
  substrate = "viral capsid assembly · PDB structure corpus · virocapsid geometry · icosahedral symmetry parameters (distinct from but related to WEAVE axis: WEAVE = assembly thermodynamics/kinetics; VIROCAPSID = structural database + PDB mining)"
  impl = "hexa-virocapsid/ · HEXA-VIROCAPSID.tape"
  real-limits = "PDB resolution limits (cryo-EM ~2–4 Å for large viruses) · icosahedral T-number quantization (same Caspar–Klug constraint as WEAVE axis) · genome packaging constraints (genome/capsid co-evolution)"
  scope-boundary = "in-silico structural mining and consistency checking only · not a vaccine efficacy, antiviral, or immunogenic claim"
  honesty = "Capsid geometry parameters (T-number, subunit count = 60·T, 12 pentamers) are crystallographic/cryo-EM observations from deposited PDB structures. The recurrence of '12 pentamers' is the Euler-characteristic topological invariant, not the n=6 lattice σ=12 invariant — numerical coincidence noted, derivation forbidden."
  ?> x_hexa_virocapsid_sibling

# ─── §3 Structural cross-links ────────────────────────────────────────

@N axis_count_note := "5-axis count — architecture, not lattice" :: note [active]
  text = "The project has 5 axes: QUANTUM, WEAVE, NANOBOT, RIBOZYME, VIROCAPSID. The count 5 is an architectural decision (the five biological/computational substrates chosen for the hexa-bio molecular toolkit at v1.x). It does not coincide with any n=6 lattice invariant (σ=12, τ=4, φ=2, J₂=24, n=6). There is no lattice alignment to note. The per-axis HEXA-*.tape files each carry their own @F/@N honesty preambles under the same LATTICE_POLICY authority."
  ?> x_agents_tape
  ?> x_lattice_policy

@L axis_layout := "axis-to-tape mapping" :: structure [active]
  QUANTUM   -> "quantum/ · _qiskit_bridge/"
  WEAVE     -> "hexa-weave/ · HEXA-WEAVE.tape"
  NANOBOT   -> "hexa-nanobot/ · HEXA-NANOBOT.tape"
  RIBOZYME  -> "hexa-ribozyme/ · HEXA-RIBOZYME.tape"
  VIROCAPSID -> "hexa-virocapsid/ · HEXA-VIROCAPSID.tape"
  selftest  -> "selftest/run_all.sh · selftest/tape_lattice_honesty_lint.py"
  meta-ssot -> "AXIS.tape (this file) · AGENTS.tape §1 id001"
