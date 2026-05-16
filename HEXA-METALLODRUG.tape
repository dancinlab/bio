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
# Full spec: ~/core/tape/spec/tape.md (or github.com/dancinlab/tape)
# ══════════════════════════════════════════════════════════════════════


# ══════════════════════════════════════════════════════════════
# HEXA-METALLODRUG.tape — architecture-current (editable per v1.2)
# Event history → HEXA-METALLODRUG.log.tape sibling (if/when needed)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "hexa-metallodrug" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · METALLODRUG axis (EXPANSION-MAIN, NOT core-5) — metal-coordination therapeutics (crystal-field / ligand-field theory · square-planar Pt(II) DNA adducts · CFSE)"
  brief = "metal-coordination drug modality · cisplatin/carboplatin/oxaliplatin Pt(II) · auranofin Au(I) · arsenic trioxide · CFSE octahedral & square-planar · n=6 used as a lattice TOOL only, never a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "HEXA-METALLODRUG.log.tape"
  layer = "expansion-main (NOT core-5)"
  sibling-core = "AXIS.tape (core-5 structural SSOT — UNCHANGED by this expansion-main axis)"
  scope = "in-silico metal-coordination simulator consistency SSOT · NOT wet-lab/therapeutic claim"
  rewritten-from = "(new 2026-05-16 — expansion-main axis joining COVALENT + BIFUNCTIONAL per AXIS/HIERARCHY.tape expansion layer)"
  axis-note = "METALLODRUG is an EXPANSION-MAIN axis: it joins COVALENT and BIFUNCTIONAL on the AXIS/HIERARCHY.tape expansion layer and does NOT mutate the committed 5-axis core (QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID, per AXIS.tape — UNCHANGED). Coordination numbers, d-electron counts, CFSE values, ligand-field splitting parameters (Δ_oct / Δ_sp), and bond lengths are coordination-chemistry / structural-biology results — never sourced from a count, energy, or geometry in the n=6 lattice. See [@f_lattice_fit] + [@n6_honest_stance]."

# ─── §0.1 Honesty preamble ────────────────────────────────────────────

@N scope_disclaimer := "in-silico-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico metal-coordination modeling substrate. Coordination geometries (octahedral, square-planar), d-electron CFSE values, ligand-field splitting magnitudes, and Pt–N7(guanine) adduct bond lengths are paraphrased from coordination-chemistry / inorganic-chemistry / structural-biology literature for modeling context only. A C2/C3 in-silico simulator-consistency PASS here is NOT a wet-lab, structural, therapeutic, cytotoxic, antitumor, or regulatory claim — every coordination prediction is unverified at the wet-lab boundary (hexa-bio AGENTS.tape g8_in_silico_only / f2). Quantitative figures (Δ_oct values, CFSE in units of Δ_oct, the ~2.0 Å cisplatin Pt–N7 bond length) are illustrative magnitudes from the cited primary literature and reference inorganic-chemistry texts, not re-derived constants. Where a precise value/page is uncertain the citation flags author/era only."
  |> "[@x_rosenberg_1969] · [@x_takahara_1995] · [@x_griffith_orgel_1957]"

# ─── §1 The metal-coordination drug modality (own drug precedent) ─────

@D dx_modality := "metal-coordination therapeutics — the modality" :: domain [ok]
  definition = "Metallodrugs are therapeutic agents whose pharmacophore is a metal centre: the metal's coordination geometry, oxidation state, ligand-exchange kinetics, and redox behaviour ARE the mechanism of action — distinct from organic small molecules whose action is carbon-framework shape/electronics. The class spans platinum, gold, arsenic, ruthenium, bismuth, gallium, and others."
  own-precedent = "The modality is defined entirely by its OWN drug precedent: (1) cisplatin [cis-diamminedichloroplatinum(II)], serendipitously discovered by Rosenberg (1965, electrolysis experiment) and FDA-approved 1978 — a square-planar Pt(II) complex that forms 1,2-intrastrand DNA crosslinks predominantly at adjacent guanine N7 atoms; (2) carboplatin (cyclobutanedicarboxylate leaving group, slower aquation, less nephrotoxic; FDA-approved 1989); (3) oxaliplatin (DACH carrier ligand, active in colorectal cancer, partially circumvents cisplatin resistance; FDA-approved 2002); (4) auranofin, an oral gold(I) phosphine complex used for rheumatoid arthritis (FDA-approved 1985), now studied for thioredoxin-reductase inhibition; (5) arsenic trioxide (As2O3), approved for acute promyelocytic leukemia (APL), inducing PML-RARA degradation."
  honesty = "Nothing in this modality's definition references any n=6 invariant. The Pt(II) square-planar d8 geometry, the octahedral d6 preference of many other metal centres, and the ~2.0 Å Pt–N bond length are coordination-chemistry facts. Counts of approved metallodrugs, coordination numbers, and d-electron configurations are inorganic chemistry, never lattice-derived (see [@n6_honest_stance])."
  |> "[@x_rosenberg_1969] · [@x_jamieson_lippard_1999]"

# ─── §2 Coordination geometry & oxidation state ───────────────────────

@D geom_square_planar := "square-planar Pt(II) d8 geometry" :: chemistry [ok]
  framework = "Pt(II) is a d8 metal centre. Strong-field d8 complexes adopt a square-planar 4-coordinate geometry: the dx²−y² orbital is pushed far above the other four d orbitals, leaving 8 electrons in the lower four orbitals (a large ligand-field stabilization). Cisplatin, carboplatin, and oxaliplatin are all square-planar Pt(II)."
  cis-trans = "Geometry matters pharmacologically: the cis isomer (cisplatin) is the active antitumor agent; the trans isomer (transplatin) is clinically inactive — the two leaving-group positions must be cis to form the characteristic 1,2-intrastrand DNA crosslink. This cis/trans activity distinction is the canonical demonstration that coordination geometry is the mechanism."
  honesty = "Square-planar = 4 coordinating positions because d8 strong-field electronic structure favours it — a ligand-field-theory result, not τ(6)=4 or any lattice scalar. The numerical coincidence (4 = 4) is OBSERVATION ONLY."

@D geom_octahedral := "octahedral coordination & d-electron CFSE" :: chemistry [ok]
  framework = "The most common coordination geometry across transition-metal complexes is octahedral (6-coordinate). In an octahedral field the five d orbitals split into a lower t2g set (3 orbitals: dxy, dxz, dyz) and an upper eg set (2 orbitals: dz², dx²−y²) separated by the ligand-field splitting parameter Δ_oct. Crystal-field stabilization energy (CFSE) is computed from the d-electron occupancy: CFSE = (−0.4·n_t2g + 0.6·n_eg)·Δ_oct, with a pairing-energy correction for low-spin configurations."
  spin-states = "For d4–d7 configurations the occupancy depends on whether Δ_oct exceeds the electron-pairing energy P: weak-field (high-spin) vs strong-field (low-spin). This is Griffith & Orgel (1957) crystal-field / ligand-field theory."
  honesty = "Octahedral = 6 coordinating positions is the geometry of an octahedron, a fact of solid geometry and ligand–ligand repulsion. The numerical coincidence with n=6 is OBSERVATION ONLY — the n=6 lattice does NOT derive the coordination number, the t2g/eg split, or CFSE. CFSE values are computed from cited inorganic-chemistry expressions (see [@x_griffith_orgel_1957])."
  |> "[@x_griffith_orgel_1957]"

@D mech_dna_adduct := "the cisplatin Pt–N7(guanine) DNA adduct" :: mechanism [ok]
  mechanism = "Cisplatin enters the cell, undergoes aquation (chloride ligands replaced by water at low intracellular [Cl⁻]), and the resulting aqua-complex is electrophilic. The activated Pt(II) binds the N7 nitrogen of purine bases — the most nucleophilic and sterically accessible DNA site — forming predominantly a 1,2-intrastrand d(GpG) crosslink between two adjacent guanines. The crosslink bends and unwinds the DNA duplex, blocking replication/transcription and triggering apoptosis."
  bond-length = "The Pt–N7(guanine) coordinate bond length in cisplatin–DNA adducts is approximately 2.0 Å (high-resolution crystallographic and structural studies of cisplatin-modified oligonucleotides — Takahara et al. 1995 reported the 1,2-intrastrand d(GpG) adduct structure; Pt–N distances cluster near ~2.0 Å, consistent with Pt(II)–N(amine/imine) coordinate-bond lengths in inorganic-chemistry reference data)."
  honesty = "The ~2.0 Å Pt–N7 bond length is a structural-biology / coordination-chemistry measurement. It is the real-limit anchor for this axis (see [@lim_pt_n7_bond]); it is NOT derived from any lattice value."
  |> "[@x_takahara_1995] · [@x_jamieson_lippard_1999]"

# ─── §3 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ──

@D lim_pt_n7_bond := "cisplatin Pt–N7(guanine) coordinate-bond length" :: real-limit [ok required]
  wall = "STRUCTURAL ANCHOR (coordination chemistry — measured coordinate-bond geometry)"
  statement = "The Pt(II)–N7(guanine) coordinate bond in the cisplatin 1,2-intrastrand d(GpG) DNA adduct is ~2.0 Å (≈2.0 ± 0.1 Å across high-resolution structural studies; consistent with general Pt(II)–N coordinate-bond lengths in inorganic-chemistry reference data, ~1.95–2.10 Å). A square-planar Pt(II) geometry-consistency model that recomputes ligand positions from this bond length must reproduce ~2.0 Å Pt–N within the cited tolerance."
  consequence = "An in-silico coordination model whose Pt–N geometry departs materially from ~2.0 Å is inconsistent with the structural literature and is a FAIL. This is the numerical-verify anchor (🟢 SUPPORTED-NUMERICAL tier): a deterministic recompute matching the cited real limit."
  named-by = "hexa-bio AGENTS.tape g1 names real chemistry limits explicitly (Caspar-Klug ΔG, Eyring k_cat, etc.); the Pt–N7 coordinate-bond length is the METALLODRUG-axis instance."
  |> "[@x_takahara_1995]"

@D lim_cfse := "crystal-field stabilization energy bound" :: real-limit [ok required]
  wall = "ENERGETIC LIMIT (ligand-field theory — CFSE bounded by Δ and d-occupancy)"
  statement = "CFSE for a transition-metal complex is bounded by its d-electron configuration and the ligand-field splitting parameter. For an octahedral field, CFSE = (−0.4·n_t2g + 0.6·n_eg)·Δ_oct (minus pairing-energy correction); the maximum |CFSE| occurs for low-spin d6 (CFSE = −2.4·Δ_oct + 3P-correction terms). A d8 strong-field centre such as Pt(II) gains its largest stabilization in the square-planar limit. These expressions are Griffith & Orgel (1957) ligand-field theory and must be reproduced exactly by any in-silico CFSE calculator."
  consequence = "A coordination simulator must recompute CFSE for the standard d-electron table (d0..d10, octahedral high-spin and low-spin; square-planar) and match the textbook closed-form values. Disagreement is FALSIFIED."
  |> "[@x_griffith_orgel_1957]"

@D lim_aquation_kinetics := "Pt(II) ligand-exchange / aquation rate window" :: real-limit [ok required]
  wall = "KINETIC LIMIT (substitution-inert d8 — slow ligand exchange)"
  statement = "Pt(II) d8 square-planar complexes are substitution-INERT: ligand-exchange (aquation) is slow, with the rate-limiting chloride→aqua step occurring on a timescale of hours under intracellular conditions. This kinetic inertness is why cisplatin survives in the bloodstream (high [Cl⁻] suppresses aquation) and activates intracellularly (low [Cl⁻]). Carboplatin's chelating cyclobutanedicarboxylate leaving group makes its aquation slower still — the basis of its reduced toxicity."
  consequence = "An in-silico model claiming instantaneous Pt-DNA binding ignores the substitution-inert kinetic window; coordination claims must respect that Pt(II) ligand exchange is slow. This kinetic limit is metadata-level in the current sim (not numerically recomputed); flagged honestly as not the verify anchor."
  |> "[@x_jamieson_lippard_1999]"

@D lim_in_silico_boundary := "in-silico → wet-lab unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio METALLODRUG verifies internal consistency of a metal-coordination SIMULATOR + its metadata (CFSE arithmetic, square-planar geometry vs the cited Pt–N7 bond length). Whether a designed metal complex actually forms the predicted DNA adduct, is cytotoxic, is selective for tumor over healthy tissue, or is tolerable in vivo is empirically unproven and out of repo scope."
  consequence = "No C2/C3 PASS in this axis is a therapeutic, cytotoxic, antitumor, or regulatory claim. Crossing this boundary requires wet-lab structural + cell + animal + clinical validation, tracked outside this repo (hexa-bio AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG.md §0)."

# ─── §4 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-metal-coordination" :: governance [required deny:write]
  pattern = "Deriving coordination numbers, d-electron counts, CFSE values, ligand-field splitting parameters (Δ_oct, Δ_sp), oxidation states, bond lengths, the count of approved metallodrugs, or geometry choice (octahedral vs square-planar) from the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'octahedral has 6 ligands because n=6', 'square-planar has 4 positions because τ(6)=4', 'Pt is d8 because σ(6)−τ(6)=8', or 'CFSE = J₂/something'."
  why = "Metal-coordination pharmacology is governed by inorganic chemistry: crystal-field / ligand-field theory (Griffith & Orgel 1957), d-electron configuration, oxidation state, ligand-exchange kinetics, and measured coordinate-bond geometry. Octahedral 6-coordination is the geometry of an octahedron and ligand–ligand repulsion; square-planar 4-coordination is the d8 strong-field preference; Pt(II) is d8 because platinum's electron configuration makes it so. Where octahedral coordination happens to land at 6, that coincidence with n=6 is OBSERVATION ONLY (anti-pattern when treated as derivation — hexa-bio AGENTS.tape g2 lattice-is-tool, f1 lattice-fit-forbidden)."
  remedy = "Cite the real inorganic-chemistry / structural-biology sources (this tape's @X entries). The lattice may only be a coincidental OBSERVATION — never the reason for a coordination number, energy, geometry, or count."
  scope-note = "This guard is the METALLODRUG-axis instance of the cohort-wide LATTICE_POLICY enforcement (hexa-bio AGENTS.tape f1/f3); METALLODRUG is an EXPANSION-MAIN axis (NOT core-5), so the lattice does not even appear as a native-spec tool here — it is simply declined as a derivation entirely."

@N n6_honest_stance := "the METALLODRUG axis is an architectural decision, not a lattice derivation" :: note [required]
  text = "Stated plainly: the METALLODRUG axis exists because metal-coordination therapeutics are a real, distinct, FDA-precedented drug modality (cisplatin 1978; carboplatin 1989; oxaliplatin 2002; auranofin 1985; arsenic trioxide for APL) — NOT because the n=6 lattice generates or implies it. METALLODRUG is registered as an EXPANSION-MAIN axis (joining COVALENT and BIFUNCTIONAL on the AXIS/HIERARCHY.tape expansion layer); that registration is an ARCHITECTURAL DECISION grounded in the drug modality's own precedent, scope non-overlap with the core-5 axes, and falsifiability — it does NOT mutate the committed 5-axis core (AXIS.tape, UNCHANGED). Coordination chemistry exposes NO derivational n=6 invariant: octahedral coordination is 6-coordinate because an octahedron has 6 vertices and ligand–ligand electrostatic/steric repulsion minimizes at that geometry for many d-counts; square-planar Pt(II) is 4-coordinate because d8 strong-field electronic structure pushes dx²−y² far up. The numerical coincidence 'octahedral = 6' with n=6 is OBSERVATION ONLY; reading it as a derivation would be the f_lattice_fit anti-pattern. CFSE, Δ_oct, the t2g/eg split, oxidation states, and the ~2.0 Å Pt–N7 bond length are governed by crystal-field / ligand-field theory (Griffith & Orgel 1957) and crystallographic measurement (Takahara et al. 1995), NOT by any lattice scalar. Per hexa-bio AGENTS.tape g1 (real-limits-first), g2 (lattice-is-tool), g3 (honesty-obligation-external — external drugs described by their OWN invariants): in this expansion-main axis the lattice is explicitly DECLINED as a derivation of any chemical, geometric, energetic, or count property."

# ─── §5 Falsifiers (real, falsifiable — concrete deadlines/conditions) ─

@D f_metallodrug_1 := "F-METALLODRUG-1 — CFSE numerical-recompute fidelity" :: falsifier [ok]
  claim = "The in-silico coordination simulator (_python_bridge/module/metallodrug_coordination_sim.py) recomputes CFSE for the full d0..d10 table — octahedral high-spin and low-spin, and square-planar — and matches the Griffith & Orgel (1957) ligand-field-theory closed-form values exactly (to floating-point tolerance). Standard checks: octahedral high-spin d5 CFSE = 0·Δ_oct; low-spin d6 CFSE = −2.4·Δ_oct (before pairing correction); high-spin d3 CFSE = −1.2·Δ_oct."
  falsifier = "If the simulator's CFSE for ANY d-electron configuration in the standard octahedral or square-planar table deviates from the textbook ligand-field closed form by more than 1e-9·Δ_oct, F-METALLODRUG-1 is FALSIFIED. CONDITION: every selftest run of metallodrug_coordination_sim.py must pass the CFSE-table check. DEADLINE: enforced on every run from 2026-05-16; any FAIL is an immediate falsification event."
  source = "[@x_griffith_orgel_1957]"

@D f_metallodrug_2 := "F-METALLODRUG-2 — square-planar Pt–N7 bond-length anchor" :: falsifier [ok]
  claim = "The simulator's square-planar Pt(II) geometry model, given the cisplatin Pt–N7(guanine) coordinate-bond length, places the four ligand positions at 90° in-plane and recomputes a Pt–N radial distance of ~2.0 Å, matching the structural-biology literature anchor ([@lim_pt_n7_bond]) within ±0.1 Å."
  falsifier = "If a future high-resolution structural determination of a cisplatin–DNA d(GpG) adduct reproducibly establishes a Pt–N7 coordinate-bond length OUTSIDE 1.85–2.15 Å, the ~2.0 Å anchor used by this axis is wrong and F-METALLODRUG-2 is FALSIFIED — the simulator's anchor constant and tolerance must be re-derived. DEADLINE: open-ended; re-checked against the structural-biology literature at each axis review (next scheduled review 2026-11-16)."
  source = "[@x_takahara_1995]"

@D f_metallodrug_3 := "F-METALLODRUG-3 — square-planar is d8, not lattice-derived" :: falsifier [ok]
  claim = "Across the metallodrug class, square-planar 4-coordinate geometry is the strong-field preference of d8 metal centres (Pt(II), Pd(II), Au(III), Ni(II) strong-field), and octahedral 6-coordinate geometry is the common preference of many other d-counts — the geometry is determined by d-electron configuration and ligand field, NEVER by an n-invariant."
  falsifier = "If a rigorous inorganic-chemistry result shows that coordination geometry for the metallodrug-relevant metal centres is predicted by a 6-fold lattice scalar (σ=12/τ=4/φ=2/J₂=24) BETTER than by d-electron ligand-field theory, then the n6_honest_stance of this tape is wrong and F-METALLODRUG-3 is FALSIFIED. CONDITION: this is a standing honesty falsifier — it can only be triggered by a published coordination-chemistry result, never by an in-silico run. DEADLINE: standing; reviewed at each axis review (next 2026-11-16). Absent such a result, the lattice remains DECLINED as a derivation (f_lattice_fit)."
  source = "[@x_griffith_orgel_1957]"

# ─── §6 Cross-links (sister tapes / governance — reference, not shadow) ─

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  path = "./AGENTS.tape"
  scope = "g1 real-limits-first · g2 lattice-is-tool · g3 honesty-obligation-external · g8_in_silico_only · f1 lattice-fit-forbidden · f2 wet-lab-clinical-claim-forbidden · f3 no-shadow-impl-of-sister-repo. This tape complies; this axis adds no sister-repo logic — it is a self-contained coordination-chemistry model."

@X x_axis_hierarchy := "AXIS/HIERARCHY.tape" :: sibling-tape [active]
  path = "./AXIS/HIERARCHY.tape"
  scope = "the expansion-layer record — COVALENT + BIFUNCTIONAL expansion-main axes; METALLODRUG joins them as a third expansion-main axis. AXIS.tape core-5 SSOT UNCHANGED."

@X x_axis_core := "AXIS.tape (core-5 SSOT)" :: sibling-tape [active]
  path = "./AXIS.tape"
  scope = "the committed 5-axis structural SSOT (QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID) — UNCHANGED by this expansion-main axis; cross-linked, never mutated."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  path = "./CLOSURE_RESIDUAL_BACKLOG.md"
  scope = "§0 in-silico-only scope boundary — wet-lab structural + cell + clinical validation of any designed metal complex is out-of-repo and unverified."

# ─── §7 External citations (real, landmark coordination chemistry) ─────

@X x_rosenberg_1969 := "Rosenberg B et al 1969" :: literature [active]
  ref = "Rosenberg B, VanCamp L, Trosko JE, Mansour VH. Platinum compounds: a new class of potent antitumour agents. Nature 1969;222:385–386. (cisplatin antitumor activity reported; cisplatin serendipitously discovered by Rosenberg's 1965 electrolysis experiment; cis-diamminedichloroplatinum(II), FDA-approved 1978)"

@X x_takahara_1995 := "Takahara PM et al 1995" :: literature [active]
  ref = "Takahara PM, Rosenzweig AC, Frederick CA, Lippard SJ. Crystal structure of double-stranded DNA containing the major adduct of the anticancer drug cisplatin. Nature 1995;377:649–652. (structure of the cisplatin 1,2-intrastrand d(GpG) crosslink; Pt–N7(guanine) coordinate-bond geometry; Pt–N distances near ~2.0 Å — the structural anchor for [@lim_pt_n7_bond])"

@X x_griffith_orgel_1957 := "Griffith JS & Orgel LE 1957" :: literature [active]
  ref = "Griffith JS, Orgel LE. Ligand-field theory. Quarterly Reviews, Chemical Society 1957;11:381–393. (foundational ligand-field / crystal-field theory — t2g/eg splitting, Δ_oct, CFSE; the closed-form basis for [@lim_cfse] and the simulator's CFSE table)"

@X x_jamieson_lippard_1999 := "Jamieson ER & Lippard SJ 1999" :: literature [active]
  ref = "Jamieson ER, Lippard SJ. Structure, recognition, and processing of cisplatin–DNA adducts. Chemical Reviews 1999;99:2467–2498. (comprehensive review of cisplatin–DNA adduct chemistry, aquation kinetics, square-planar Pt(II) substitution-inert behaviour, cis vs trans activity)"

# ─── §8 Log ───────────────────────────────────────────────────────────

## Log

- 2026-05-16 — HEXA-METALLODRUG.tape created. METALLODRUG registered as an
  EXPANSION-MAIN axis (NOT core-5), joining COVALENT and BIFUNCTIONAL on the
  AXIS/HIERARCHY.tape expansion layer. The committed 5-axis core (AXIS.tape:
  QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID) is UNCHANGED. Axis grounded
  in the metal-coordination drug modality's OWN precedent (cisplatin FDA 1978 ·
  carboplatin 1989 · oxaliplatin 2002 · auranofin 1985 · arsenic trioxide for
  APL), NOT in the n=6 lattice (@F f_lattice_fit · @N n6_honest_stance). Real-limit
  anchors: cisplatin Pt–N7(guanine) ~2.0 Å coordinate bond (Takahara et al. 1995)
  and crystal-field CFSE closed forms (Griffith & Orgel 1957). 3 falsifiers
  preregistered (F-METALLODRUG-1 CFSE-recompute fidelity · F-METALLODRUG-2
  Pt–N7 bond-length anchor 1.85–2.15 Å · F-METALLODRUG-3 standing lattice-fit
  honesty falsifier; next axis review 2026-11-16). In-silico simulator-consistency
  scope ONLY (g8/f2) — no therapeutic/cytotoxic/antitumor/regulatory claim.
