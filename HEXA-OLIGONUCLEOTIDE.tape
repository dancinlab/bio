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
# HEXA-OLIGONUCLEOTIDE.tape — architecture-current (editable per v1.2)
# OLIGONUCLEOTIDE axis · EXPANSION-MAIN layer (NOT core-5)
# Event history → HEXA-OLIGONUCLEOTIDE.log.tape sibling (if/when needed)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "hexa-oligonucleotide" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · OLIGONUCLEOTIDE axis — antisense oligonucleotide (ASO) + siRNA therapeutics"
  brief = "synthetic oligonucleotide drugs · Watson-Crick target hybridization → RNase-H / RISC silencing · SantaLucia nearest-neighbor duplex thermodynamics as the real limit · n=6 used (if at all) as a lattice TOOL only, never a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  layer = "expansion-main (NOT core-5)"
  sibling-core = "AXIS.tape (core-5 structural SSOT — QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID — UNCHANGED by this axis)"
  sibling-hierarchy = "AXIS/HIERARCHY.tape (expansion-layer convention this axis follows)"
  sibling-log = "HEXA-OLIGONUCLEOTIDE.log.tape"
  scope = "in-silico ASO/siRNA hybridization-thermodynamics simulator-consistency SSOT · NOT wet-lab/therapeutic claim"
  axis-note = "OLIGONUCLEOTIDE is an EXPANSION-MAIN axis: it does NOT mutate the committed 5-axis core (AXIS.tape). It is RNA-domain-ADJACENT to the RIBOZYME core axis but mechanism-DISTINCT (see [@n_non_overlap]). Duplex ΔG°/ΔH°/ΔS°/Tm and any sequence count are nucleic-acid-chemistry results, never lattice scalars. See [@f_lattice_fit] + [@n6_honest_stance]."

# ─── §0.1 Honesty preamble ────────────────────────────────────────────

@N scope_disclaimer := "in-silico-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico ASO/siRNA hybridization-thermodynamics modeling substrate. Nearest-neighbor ΔH°/ΔS° parameters, Tm regimes, and the duplex-stability framework are paraphrased from nucleic-acid biophysics literature for modeling context only. A C2/C3 in-silico simulator-consistency PASS here is NOT a wet-lab, structural, therapeutic, gene-silencing, immunogenic, potency, or efficacy claim — every hybridization prediction is unverified at the wet-lab boundary (hexa-bio AGENTS.tape g8_in_silico_only / f2). The OLIGONUCLEOTIDE modality is described ONLY via its own approved-drug precedent (nusinersen/Spinraza · patisiran/Onpattro · inclisiran), never via the n=6 lattice (g3/f1). The 1 M Na+ standard state used by the unified nearest-neighbor parameters is non-physiological; salt-corrected Tm, 2'-modified backbones, RNA:DNA hybrid parameters, RNase-H/RISC recruitment and delivery are out of repo scope."
  |> "[@x_santalucia_1998] · [@x_crooke_aso] · [@x_setten_sirna]"

@N expansion_layer := "expansion-main, not core-5" :: note [required d=2026-05-16 active]
  text = "OLIGONUCLEOTIDE is registered as an EXPANSION-MAIN axis per the AXIS/HIERARCHY.tape expansion convention. The hexa-bio CORE remains the committed 5 axes (QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID) per AXIS.tape — that SSOT is UNCHANGED by this file. Expansion-main C2/C3 is in-silico simulator-consistency ONLY — never a wet-lab/clinical/regulatory claim (g8/f2). Citing this tape as if it modified AXIS.tape's committed core, or as if OLIGONUCLEOTIDE were a core axis, is forbidden — expansion-main ≠ core axis."
  authority = "AXIS/HIERARCHY.tape · AXIS.tape · AGENTS.tape g8"

# ─── §1 Modality (own drug precedent ONLY — g3/f1) ────────────────────

@D dx_modality := "what an oligonucleotide therapeutic is" :: domain [ok]
  definition = "An antisense oligonucleotide (ASO) is a short (typically ~18-25 nt) synthetic single-stranded oligonucleotide, chemically modified for nuclease resistance and affinity, designed to Watson-Crick hybridize to a specific target transcript. A small interfering RNA (siRNA) is a short synthetic double-stranded RNA whose guide strand is loaded into the RNA-induced silencing complex (RISC). Both are sequence-programmable transcript-silencing drugs."
  mechanism-aso = "Gapmer ASOs recruit endogenous RNase-H1, which cleaves the RNA strand of an RNA:DNA heteroduplex — the ASO hybridizes, RNase-H does the catalysis, the transcript is degraded. Splice-modulating ASOs instead occupy a splice site / regulatory element by steric block without recruiting a nuclease (e.g. exon-inclusion modulation)."
  mechanism-sirna = "The siRNA guide strand directs the Argonaute-2 (Ago2) endonuclease within RISC to slice the complementary mRNA. Again the oligonucleotide is the sequence-recognition guide; the catalysis is performed by the host enzyme."
  precedent = "Approved-drug precedent (the ONLY frame used to describe this modality — AGENTS.tape g3/f1): nusinersen (Spinraza, splice-modulating ASO for spinal muscular atrophy, FDA approval 2016); patisiran (Onpattro, lipid-nanoparticle-delivered siRNA for hereditary transthyretin amyloidosis, FDA approval 2018); inclisiran (siRNA targeting PCSK9 for hypercholesterolemia, approved 2021). The modality is established by these drugs, NOT by any n=6 invariant."
  honesty = "Nothing about the ASO/siRNA definition or its drug precedent references any n=6 lattice scalar. Oligo lengths (~18-25 nt), the count of approved drugs, and any sequence figure are pharmacology/chemistry, not σ/τ/φ/J₂."
  |> "[@x_crooke_aso] · [@x_setten_sirna]"

@N n_non_overlap := "OLIGONUCLEOTIDE vs RIBOZYME — adjacent, mechanism-distinct (<30% overlap)" :: note [required d=2026-05-16 active]
  text = "OLIGONUCLEOTIDE (expansion-main) is RNA-domain-ADJACENT to the RIBOZYME core axis but is mechanism-DISTINCT, with non-overlap explicitly documented to satisfy the AXIS/README promotion criterion #2 (a new main axis must be <30% overlapping with the core). The ONLY shared substrate is Watson-Crick base-pairing. The catalytic principle is ORTHOGONAL: (a) ASO/siRNA = synthetic oligonucleotide DRUGS — the oligonucleotide is a passive sequence-recognition GUIDE; the bond-breaking chemistry is performed by a recruited HOST enzyme (RNase-H1 for gapmer ASOs, Ago2/RISC for siRNA), or there is no catalysis at all (steric-block splice-modulating ASOs such as nusinersen). (b) RIBOZYME = catalytic RNA ENZYMES (hammerhead/HDV/hairpin/VS/group I-II introns/RNase P/the ribosomal PTC) — the RNA molecule ITSELF performs the in-line phosphoryl-transfer chemistry (Steitz-Steitz two-metal-ion mechanism or nucleobase general-acid/base catalysis). Estimated mechanistic overlap < 30%: the recognition step (short complementary pairing) is shared; the catalysis step, the molecular identity (synthetic drug vs natural/selected enzyme), the therapeutic-class history, and the design/delivery engineering are all distinct. This non-overlap is the honest basis for registering OLIGONUCLEOTIDE as a separate expansion-main axis rather than folding it into RIBOZYME."
  authority = "AXIS/HIERARCHY.tape (expansion convention) · AXIS/README.md §promotion-criteria #2"

# ─── §2 Hybridization thermodynamics (the real-science core) ──────────

@D mech_nn_model := "nearest-neighbor duplex thermodynamics (SantaLucia 1998)" :: mechanism [ok]
  framework = "The stability of a nucleic-acid duplex is predicted by the nearest-neighbor (NN) model: the standard-state free energy / enthalpy / entropy of duplex formation is the sum over adjacent base-pair doublet 'steps', each carrying an experimentally-determined ΔH°/ΔS° parameter, plus helix-initiation terms (a terminal-A·T penalty and, for self-complementary duplexes, a symmetry correction). SantaLucia (1998) unified previously divergent NN parameter sets into a single internally-consistent set of 10 unique Watson-Crick doublet parameters."
  tm-equation = "From the two-state van 't Hoff model, the melting temperature is Tm = ΔH° / (ΔS° + R·ln(C_T/x)), where C_T is total strand concentration, x = 4 for a non-self-complementary duplex at equal strand concentrations and x = 1 for a self-complementary duplex."
  reference-duplex = "A standard deductive anchor is the self-complementary 12-mer 5'-CGCGAATTCGCG-3' (the Dickerson dodecamer): the NN sum gives ΔH° on the order of -95 to -101 kcal/mol, ΔS° on the order of -266 to -274 cal/(mol·K), and Tm in the high-50s to ~60 °C regime at micromolar strand concentration in 1 M Na+. The hexa-bio bridge oligonucleotide_hybridization_sim.py recomputes exactly this duplex and asserts the result lands in that literature regime."
  honesty = "ΔG°/ΔH°/ΔS°/Tm are nucleic-acid biophysics — base-pair stacking free energies measured by calorimetry and UV-melting. They are not derived from any n=6 lattice scalar. The NN model is the real limit named for this axis (see [@lim_nn_thermo])."
  |> "[@x_santalucia_1998]"

@D mech_off_target := "off-target hybridization screening" :: mechanism [ok]
  framework = "An oligonucleotide drug recognizes its target by short complementary base-pairing; a fully complementary or partially complementary stretch elsewhere in the transcriptome is an off-target hybridization site. A ΔG-scored screen slides the oligonucleotide across a decoy pool of nucleic-acid windows, recomputes the duplex free energy of each window via the same NN model, and flags windows whose ΔG° is at or below an off-target gate (more negative = more stable = worse)."
  hexa-bio-impl = "oligonucleotide_hybridization_sim.py implements this as a deterministic stdlib-only screen against a small decoy pool (housekeeping + oncogene windows + low-complexity CTG-repeat + AT-tract decoys). It is the ΔG-scored analogue of the RIBOZYME-axis Hamming off-target screen (ribozyme_off_target_screen.py) — a separate, non-shadowing implementation (f3): it screens an oligonucleotide DRUG, not a ribozyme catalytic arm."
  honesty = "The in-repo decoy pool is a small representative seed, NOT a full host transcriptome. A production off-target screen replaces it with a full GENCODE/RefSeq transcriptome + an RNA-RNA interaction predictor + transcript-abundance weighting — the documented out-of-repo step. The mismatched-duplex ΔG° here is a deterministic match-fraction surrogate; a true internal-loop/bulge calculation needs loop parameters out of repo scope."

# ─── §3 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ───

@D lim_nn_thermo := "nearest-neighbor duplex-stability ceiling" :: real-limit [ok required]
  wall = "SOFT WALL (nucleic-acid biophysics — bounded by base-pair stacking free energy)"
  statement = "Duplex stability is bounded by the nearest-neighbor base-pair stacking free energy: ΔG°(duplex) is the sum of NN doublet free energies plus initiation terms, and the melting temperature follows the two-state van 't Hoff relation. No oligonucleotide design can make a duplex more stable than its nearest-neighbor free-energy sum allows; affinity engineering (length, GC content, 2'-modified backbones) shifts ΔG° within this framework, it does not escape it."
  consequence = "Designed ASO/siRNA affinity claims must be consistent with the NN free-energy sum; a Tm or ΔG° claim outside the NN-predicted regime for the given sequence/salt is a red flag. The unified NN parameter set is the canonical real limit named for this axis."
  named-by = "hexa-bio AGENTS.tape g1 — real-limits-first; the nearest-neighbor model is the OLIGONUCLEOTIDE-axis instance of the named real-limit obligation (sibling to RIBOZYME's Eyring k_cat)."
  |> "[@x_santalucia_1998]"

@D lim_specificity_floor := "off-target hybridization / specificity floor" :: real-limit [ok required]
  wall = "SOFT WALL (sequence-recognition information limit)"
  statement = "An oligonucleotide recognizes its target by a short complementary stretch (~18-25 nt for the full oligo; the seed region is shorter). The information content of such recognition is bounded — partially complementary stretches recur across a ~10^10-11 nt human transcriptome, producing a non-zero off-target hybridization floor. Seed-region complementarity in particular drives miRNA-like off-target silencing for siRNA."
  consequence = "Specificity engineering (length, chemistry, seed design, dose) can reduce but not eliminate off-target hybridization. The off-target floor is a fundamental sequence-information constraint, not lattice-derived. This is the OLIGONUCLEOTIDE analogue of the CRISPR off-target floor and the RIBOZYME specificity floor named in AGENTS.tape g1."

@D lim_delivery_stability := "nuclease stability + delivery" :: real-limit [ok required]
  wall = "ENGINEERING/CLINICAL LIMIT"
  statement = "Unmodified oligonucleotides have a short half-life in serum and cells (nucleases) and do not freely cross cell membranes. Approved oligonucleotide drugs depend on chemical modification (phosphorothioate linkages, 2'-O-methyl / 2'-O-methoxyethyl / locked-nucleic-acid sugars) and on delivery technology (lipid nanoparticles for patisiran; GalNAc conjugation for inclisiran's hepatocyte uptake). These are coupled engineering walls."
  consequence = "An in-silico C2/C3 PASS in this axis is explicitly not a therapeutic-readiness claim. Crossing this wall is wet-lab + clinical chemistry/delivery engineering, tracked outside the repo (AGENTS.tape g8_in_silico_only / CLOSURE_RESIDUAL_BACKLOG.md §0)."

@D lim_salt_standard_state := "1 M Na+ standard state is non-physiological" :: real-limit [ok required]
  wall = "HONESTY LIMIT (model-scope discipline)"
  statement = "The unified nearest-neighbor parameters (SantaLucia 1998) are referenced to a 1 M Na+ standard state. Physiological monovalent + divalent cation conditions, and the 2'-modified backbones of real oligonucleotide drugs, shift ΔG° and Tm relative to the standard-state prediction. The hexa-bio bridge computes the standard-state NN values; a salt correction and modified-backbone parameters are NOT applied."
  consequence = "A Tm computed by oligonucleotide_hybridization_sim.py is a standard-state value, honest only as such. It must not be quoted as a physiological-condition or modified-oligo Tm without the corresponding correction — that correction is out of repo scope."

@D lim_in_silico_boundary := "in-silico → wet-lab unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio OLIGONUCLEOTIDE verifies the internal consistency of an ASO/siRNA hybridization-thermodynamics SIMULATOR + its metadata. Whether a designed oligonucleotide actually hybridizes, recruits RNase-H / loads into RISC, silences its target, avoids off-target effects, evades immune sensing, and is deliverable in vivo is empirically unproven and out of repo scope."
  consequence = "No C2/C3 PASS in this axis is a therapeutic, gene-silencing, immunogenic, potency, or efficacy claim. Crossing this boundary requires wet-lab + clinical validation, tracked outside this repo (AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG.md §0)."

# ─── §4 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-oligonucleotide-hybridization" :: governance [required deny:write]
  pattern = "Deriving oligonucleotide lengths, duplex ΔG°/ΔH°/ΔS°, melting temperatures, NN parameter counts, off-target counts, the count of approved oligonucleotide drugs, or specificity from the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'the NN model has 12 doublet parameters because σ(6)=12', 'a duplex has two strands because φ(6)=2', 'the seed is τ(6) nt', or 'Tm = J₂·something'."
  why = "Oligonucleotide hybridization is governed by nucleic-acid biophysics: nearest-neighbor base-pair stacking free energy (SantaLucia 1998), the two-state van 't Hoff melting relation, and sequence-recognition information theory. Approved-drug counts and oligo lengths are pharmacology. Any coincidence with σ(6)=12 / τ(6)=4 / φ(6)=2 / J₂=24 is OBSERVATION ONLY — an anti-pattern when treated as a derivation (AGENTS.tape g2 lattice-is-tool, f1 lattice-fit-forbidden)."
  remedy = "Cite the real nucleic-acid-biophysics / pharmacology sources (this tape's @X entries). The lattice may only be a coincidental OBSERVATION — never the reason for a count, free energy, temperature, or specificity figure."
  scope-note = "This guard is the OLIGONUCLEOTIDE-axis instance of the cohort-wide LATTICE_POLICY enforcement (AGENTS.tape f1/f3); it does NOT shadow qmirror/hexa-meta/xeno logic — it references, not reimplements (f3)."

@N n6_honest_stance := "oligonucleotide hybridization has no derivational n=6 invariant" :: note [required]
  text = "Stated plainly: ASO/siRNA hybridization exposes NO natural n=6 invariant. Therapeutic oligonucleotide lengths span a range (~18-25 nt typical, with both shorter and longer constructs in use); duplex ΔG°/ΔH°/ΔS°/Tm are continuous nucleic-acid-biophysics quantities set by base-pair stacking, not by σ/τ/φ/J₂. The nearest-neighbor model happens to have 10 unique Watson-Crick doublet parameters (4-letter alphabet combinatorics with reverse-complement equivalence) — that 10 is combinatorics, not a lattice scalar; any numerical coincidence with a lattice value is OBSERVATION ONLY. The two strands of a duplex are two because Watson-Crick pairing is a two-strand relationship — a chemistry fact, not φ(6)=2. The count of approved oligonucleotide drugs is pharmacology history, not a lattice count. Per AGENTS.tape g1 (real-limits-first — the nearest-neighbor model is the named real limit for this axis) / g2 (lattice-is-tool): in this EXPANSION-MAIN axis the lattice is explicitly DECLINED as a derivation of any thermodynamic, sequence, or pharmacological property. This honesty is a precondition of the axis's registration."

# ─── §5 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D F_OLIGO_1 := "F-OLIGO-1 — ASO:mRNA duplex Tm tracks the SantaLucia NN sum" :: prediction [ok]
  claim = "For a perfectly-matched ASO:nucleic-acid duplex, the melting temperature computed from the SantaLucia (1998) unified nearest-neighbor ΔH°/ΔS° sum via the two-state van 't Hoff relation will, at micromolar strand concentration and 1 M Na+ standard state, land in the duplex-class-appropriate regime. Concretely: the Dickerson dodecamer 5'-CGCGAATTCGCG-3' recomputed from the NN sum gives ΔH° in roughly -85 to -105 kcal/mol, ΔS° in roughly -240 to -300 cal/(mol·K), and Tm in roughly 50-68 °C — the SantaLucia (1998) regime."
  falsifier = "A perfectly-matched duplex whose NN-sum-predicted Tm reproducibly disagrees with a calorimetrically/UV-melting-measured Tm by more than the documented NN-model error band (for the standard-state, unmodified-DNA regime the model was parameterized in) would falsify the use of the NN model as the duplex-stability real limit for this axis. In-repo, a drift of the recomputed Dickerson-dodecamer ΔH°/ΔS°/Tm outside the regimes above fails the oligonucleotide_hybridization_sim.py self-check."
  verified-by = "oligonucleotide_hybridization_sim.py — literature-anchor self-check (Dickerson dodecamer)"
  source = "[@x_santalucia_1998]"

@D F_OLIGO_2 := "F-OLIGO-2 — GC>AT Tm ordering and ΔG° length monotonicity" :: prediction [ok]
  claim = "Base-pair stacking energetics impose two qualitative orderings that the NN model must reproduce: (a) a GC-rich duplex melts at a higher Tm than an equal-length AT-rich duplex (G·C stacking contributes more stabilizing free energy than A·T); (b) extending a duplex by additional matched base pairs lowers (makes more negative) the total ΔG° of duplex formation."
  falsifier = "An NN-model implementation in which a GC-rich duplex computes a LOWER Tm than an equal-length AT-rich duplex, or in which extending a matched duplex RAISES (makes less negative) ΔG°, would be internally inconsistent with the NN free-energy sum and would fail this prediction. In-repo, either violation fails the oligonucleotide_hybridization_sim.py self-check."
  verified-by = "oligonucleotide_hybridization_sim.py — GC>AT ordering + length-monotonicity checks"
  source = "[@x_santalucia_1998]"

@D F_OLIGO_3 := "F-OLIGO-3 — off-target hybridization is ΔG-detectable" :: prediction [ok]
  claim = "A ΔG-scored sliding screen of an oligonucleotide against a decoy pool of nucleic-acid windows will flag a window that is deliberately complementary to the oligonucleotide (a low-complexity off-targeter — e.g. an oligo complementary to a CTG triplet-repeat tract). The screen must detect a strong off-targeter; it must not be silent."
  falsifier = "An off-target screen that returns zero flagged windows for an oligonucleotide that is, by construction, the reverse complement of a window present in the decoy pool would be a non-functional screen and would falsify this prediction. In-repo, a zero-flag result for the deliberately-designed low-complexity off-targeter fails the oligonucleotide_hybridization_sim.py self-check."
  verified-by = "oligonucleotide_hybridization_sim.py — off-target-screen self-check (deliberate CTG-repeat off-targeter)"

# ─── §6 Cross-links (sister repos / sibling axes — reference, no shadow) ─

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "g1 real-limits-first (SantaLucia nearest-neighbor model named as the OLIGONUCLEOTIDE real limit) · g2 lattice-is-tool · g3 honesty-external · g8_in_silico_only · f1 lattice-fit-forbidden · f3 no-shadow-impl-of-sister-repo. This tape complies; it neither mutates the core-5 (AXIS.tape) nor shadows qmirror/hexa-meta/xeno logic."

@X x_axis_hierarchy := "AXIS/HIERARCHY.tape" :: sibling-tape [active]
  path = "AXIS/HIERARCHY.tape"
  scope = "the expansion-layer convention this axis follows — expansion-main ≠ core axis; core-5 (AXIS.tape) UNCHANGED."

@X x_hexa_ribozyme_sibling := "HEXA-RIBOZYME.tape" :: sibling-tape [active]
  scope = "the RNA-domain-adjacent CORE axis. OLIGONUCLEOTIDE is mechanism-distinct from RIBOZYME (<30% overlap — see [@n_non_overlap]): ASO/siRNA = synthetic drugs recruiting host RNase-H/RISC; ribozymes = catalytic RNA enzymes. The off-target screens in the two axes are separate, non-shadowing implementations (f3)."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  scope = "§0 in-silico-only scope boundary — wet-lab hybridization/silencing/delivery/immunogenicity validation of any designed oligonucleotide is out-of-repo and unverified."

# ─── §7 External citations (real, landmark nucleic-acid science) ──────

@X x_santalucia_1998 := "SantaLucia J Jr 1998" :: literature [active]
  ref = "SantaLucia J Jr. A unified view of polymer, dumbbell, and oligonucleotide DNA nearest-neighbor thermodynamics. Proc Natl Acad Sci USA 1998;95(4):1460-1465. (the unified nearest-neighbor ΔH°/ΔS° parameter set + helix-initiation terms used as the duplex-stability real limit for this axis; the two-state van 't Hoff Tm relation framework)"

@X x_crooke_aso := "Crooke ST et al — antisense oligonucleotide pharmacology (author/era)" :: literature [active]
  ref = "Crooke ST and colleagues — antisense oligonucleotide mechanism + pharmacology body of work (gapmer RNase-H1 recruitment; 2'-modified chemistries; phosphorothioate backbones); cited author/era for the modality framework. Approved-drug precedent: nusinersen (Spinraza), splice-modulating ASO, FDA approval 2016."

@X x_setten_sirna := "Setten RL, Rossi JJ, Han S-P 2019 (siRNA therapeutics review — author/era)" :: literature [active]
  ref = "Setten RL, Rossi JJ, Han S-P. The current state and future directions of RNAi-based therapeutics. Nat Rev Drug Discov 2019;18:421-446. (siRNA / RISC / Ago2 therapeutic-modality review; cited author/era). Approved-drug precedent: patisiran (Onpattro), lipid-nanoparticle siRNA, FDA approval 2018; inclisiran, GalNAc-conjugated siRNA, approved 2021."

@X x_lattice_policy := "echoes/LATTICE_POLICY.md" :: policy [active]
  url = "https://github.com/dancinlab/echoes/blob/main/LATTICE_POLICY.md"
  scope = "real-limits-first · lattice-is-tool — the cohort-wide policy this axis's f_lattice_fit guard instances."

# ─── §8 Log ───────────────────────────────────────────────────────────

## Log

- 2026-05-16 — HEXA-OLIGONUCLEOTIDE.tape created. Registers OLIGONUCLEOTIDE
  (antisense oligonucleotide + siRNA therapeutics) as an EXPANSION-MAIN axis
  per the AXIS/HIERARCHY.tape expansion convention — the committed 5-axis
  core (AXIS.tape) is UNCHANGED, cross-linked. Real limit anchored to the
  SantaLucia (1998) unified nearest-neighbor duplex-thermodynamics model
  (PNAS 95:1460) + the two-state van 't Hoff Tm relation (g1). Modality
  described ONLY via approved-drug precedent — nusinersen/Spinraza (ASO,
  FDA 2016), patisiran/Onpattro (siRNA, 2018), inclisiran (siRNA, 2021) —
  never via the n=6 lattice (g3/f1/f_lattice_fit). Non-overlap with the
  RNA-domain-adjacent RIBOZYME core axis documented explicitly (@n_non_overlap,
  <30% overlap: ASO/siRNA = synthetic drugs recruiting host RNase-H/RISC;
  ribozymes = catalytic RNA enzymes — mechanism-distinct). Three falsifiers
  preregistered (F-OLIGO-1 Tm tracks the NN sum; F-OLIGO-2 GC>AT ordering +
  ΔG° length monotonicity; F-OLIGO-3 off-target hybridization is
  ΔG-detectable), each verified-by oligonucleotide_hybridization_sim.py.
  In-silico simulator-consistency scope ONLY (g8/f2) — NOT a therapeutic /
  gene-silencing / immunogenic / efficacy claim.
