#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# .tape v1.2 — grammar primer (cold-read by any LLM / agent / human)
# ══════════════════════════════════════════════════════════════════════
# Form: each entry is `@<type> <id> := "<subject>" :: <kind> [<grades>]`
#       optionally followed by body lines (2-space indent) — key=value,
#       edges (<- caused-by   -> triggers   == continues
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
# NEUROSCIENCE.tape — architecture-current (editable per v1.2)
# Event history → NEUROSCIENCE.log.tape sibling
# Full real-science rewrite 2026-05-16 (prior: lattice-tautology stub 153b5a2)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "neuroscience" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · foundational neuroscience knowledge SSOT — cellular / systems / cognitive"
  brief = "Foundational neuroscience — cellular/systems/cognitive · n=6 NOT used as a derivation (honest) · distinct from NEURO=BCI and NEUROPHARMACOLOGY"
  parent = "dancinlab/hexa-bio"
  sibling-log = "NEUROSCIENCE.log.tape"
  scope = "in-silico neuroscience knowledge SSOT · NOT clinical / therapeutic / regulatory advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see NEUROSCIENCE.log.tape audit"
  sibling-bci = "NEURO.tape — BCI / neurotechnology in-silico SSOT (cross-link, don't duplicate)"
  sibling-pharm = "NEUROPHARMACOLOGY.tape — CNS pharmacology in-silico SSOT (cross-link, don't duplicate)"

@N scope_disclaimer := "knowledge-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico foundational-neuroscience substrate. Cell counts, receptor inventories, neuroimaging parameters, connectivity figures, and disease-mechanism summaries are paraphrased from published primary literature for modeling context ONLY — they are NOT clinical guidance, a therapeutic protocol, a diagnostic claim, or a regulatory submission. Scope: write-side molecular sandbox (foundational knowledge). Real neuroscience requires wet-lab validation, institutional ethics review, patient consent, and domain expertise. Disease entries are mechanistic knowledge, not diagnostic or treatment advice. In-silico knowledge SSOT only."

# ── §1 Cellular neuroscience — the neuron doctrine ───────────────────

@D dom_neuron_doctrine := "neuron doctrine — Cajal and the independent nerve cell" :: domain [ok]
  cajal = "Santiago Ramón y Cajal's meticulous Golgi-stain microscopy (late 1880s–1890s) established that the nervous system is composed of discrete individual cells — neurons — rather than a continuous reticular net (Golgi's competing hypothesis). Cajal demonstrated dendritic trees, axonal specificity, and the directionality of signal flow from dendrite to axon ('the law of dynamic polarisation'). Cajal and Golgi were jointly awarded the 1906 Nobel Prize in Physiology or Medicine — the only Nobel in which the two recipients held incompatible theories on the same topic."
  golgi = "Camillo Golgi invented the chromate-silver staining method (~1873) that made individual neuron morphology visible for the first time; the same method Cajal exploited to refute Golgi's reticular theory. Golgi's technique outlasted his interpretive framework."
  legacy = "The neuron doctrine is the foundational cell-biology claim of neuroscience: neurons are the anatomical and physiological units of the nervous system. All subsequent cellular, synaptic, and circuit analysis builds on this substrate."
  honesty = "Cajal's era spans late 19th–early 20th century; the Nobel date 1906 is asserted. Primary-volume page citations paraphrased as primary-author/era."
  |> "[@x_cajal_1906_era]"

@D dom_neuron_types := "neuron diversity — cell types and principal subtypes" :: domain [ok]
  principal-excitatory = "Glutamatergic pyramidal neurons (cortex, hippocampus) are the dominant excitatory projection neurons; stellate cells are excitatory in granule layers. Purkinje cells (cerebellar cortex) are large GABAergic inhibitory projection neurons — one of the largest neurons in the brain."
  interneurons = "GABAergic interneurons provide local inhibition and circuit gating; diverse subtypes defined by morphology, marker expression, and connectivity (e.g. parvalbumin+ fast-spiking basket cells, somatostatin+ Martinotti cells, VIP+ disinhibitory interneurons in cortex). Parvalbumin-basket-cell perisomatic inhibition sets gamma oscillation timing."
  glia = "Glia (astrocytes, oligodendrocytes, microglia, radial glia) outnumber or match neurons depending on region and species; they are NOT passive support but active participants in synapse formation, myelination, BBB maintenance, and neuroinflammation."
  total-neurons = "Herculano-Houzel and colleagues (2009 era; isotropic fractionation method) revised the canonical estimate of the human brain's neuron count to approximately 86 billion neurons (roughly 69 billion in the cerebellum, ~16 billion in the cerebral cortex). The long-cited '100 billion' figure is an informal approximation; the revised count is method-dependent but methodologically more rigorous than earlier estimates."
  honesty = "86 billion is the Herculano-Houzel 2009-era isotropic-fractionation result — a real empirical measurement, not a lattice constant (see [@n6_honest_stance])."
  |> "[@x_herculano_houzel_2009_era]"

@D dom_action_potential := "action potential — Hodgkin & Huxley 1952" :: mechanism [ok]
  what = "An action potential is a transient (~1–2 ms) membrane potential depolarization propagating along a neuron's axon as the canonical 'spike'. The resting membrane potential (~-65 to -70 mV in typical cortical neurons) is maintained by the Na+/K+-ATPase and leak conductances; threshold depolarization triggers regenerative sodium-channel opening."
  hh-model = "Hodgkin and Huxley (J Physiol 1952;117:500–544) derived a quantitative conductance-based model from voltage-clamp recordings on the squid giant axon, describing voltage-gated Na+ and K+ conductances via empirical gating variables (m, h, n). This model remains the foundational quantitative framework for excitable-membrane biology, and earned Hodgkin and Huxley the 1963 Nobel Prize in Physiology or Medicine (jointly with Eccles)."
  propagation = "Saltatory conduction along myelinated axons (action potential jumps between nodes of Ranvier) dramatically accelerates conduction velocity relative to unmyelinated fibres — a key vertebrate adaptation enabling long-range neural communication at biological speeds."
  cross-link = "NEURO.tape uses the H&H model as its foundational mechanism reference; not duplicated there in detail — cross-link only."
  |> "[@x_hodgkin_huxley_1952]"

@D dom_synaptic_transmission := "synaptic transmission — chemical synapse" :: mechanism [ok]
  eccles = "John Eccles demonstrated that synaptic transmission at the neuromuscular junction and in spinal cord is chemical (not electrical as some proposed) — inhibitory postsynaptic potentials are real, graded, and mediated by neurotransmitter-gated ion channels. Eccles shared the 1963 Nobel Prize with Hodgkin and Huxley."
  katz-quantal = "Bernard Katz (1950s–1960s era) established the quantal nature of neurotransmitter release: neurotransmitter is released from presynaptic terminals in discrete packets ('quanta') corresponding to individual synaptic vesicles fusing with the membrane; the number of quanta released per stimulus follows statistical (binomial/Poisson) distributions. Katz shared the 1970 Nobel Prize in Physiology or Medicine with Axelrod and von Euler."
  vesicle-cycle = "The SNARE complex (VAMP/synaptobrevin, SNAP-25, syntaxin) drives synaptic vesicle docking and fusion; synaptotagmin is the calcium sensor. The entire vesicle cycle (docking → priming → fusion → retrieval → refilling) is highly regulated and constitutes a major drug-target landscape (cross-link: NEUROPHARMACOLOGY.tape for the pharmacology layer)."
  ?> "NEUROPHARMACOLOGY.tape for neurotransmitter-receptor pharmacology — not duplicated here"
  |> "[@x_eccles_1963_era] · [@x_katz_1970_era]"

# ── §2 Synaptic plasticity — learning and memory ─────────────────────

@D dom_hebb_rule := "Hebbian plasticity — 'cells that fire together wire together'" :: mechanism [ok]
  statement = "Donald Hebb (1949, 'The Organization of Behavior') proposed that repeated coincident pre- and postsynaptic activation strengthens synaptic efficacy — the Hebbian postulate. The condensed slogan 'cells that fire together, wire together' is a popularisation; Hebb's actual formulation was more nuanced ('some growth process or metabolic change' in the cell)."
  significance = "The Hebbian framework was the conceptual precursor to NMDA-receptor-dependent LTP and the computational connectionist tradition; it remains one of the most-cited single conceptual contributions to neuroscience."
  honesty = "Hebb 1949 cited as primary-author/era; exact volume/page paraphrased. The famous slogan was not Hebb's exact words."

@D dom_ltp := "long-term potentiation (LTP) — Bliss & Lømo 1973" :: mechanism [ok]
  discovery = "Tim Bliss and Terje Lømo reported in 1973 that brief high-frequency stimulation of the perforant path in the rabbit hippocampus produced a long-lasting increase in synaptic efficacy — now called long-term potentiation (LTP). This was the first demonstration of activity-dependent, persistent synaptic strengthening in the mammalian brain."
  publication = "Bliss TVP, Lømo T. Long-lasting potentiation of synaptic transmission in the dentate area of the anaesthetized rabbit following stimulation of the perforant path. J Physiol 1973;232:331–356."
  nmda-gate = "LTP at many synapses (hippocampal CA1 Schaffer-collateral pathway, extensively studied) requires NMDA receptor activation as the coincidence detector: the NMDA receptor opens only when both presynaptic glutamate release and postsynaptic depolarisation occur simultaneously, providing a molecular implementation of the Hebbian rule. AMPA receptor trafficking (insertion into postsynaptic density) is the major early-phase LTP expression mechanism."
  ltd = "Long-term depression (LTD) is the complementary weakening process; NMDA-dependent (low-frequency stimulation in hippocampus — Dudek & Bear 1992 era) and metabotropic-glutamate-receptor-dependent (cerebellar LTD — primary-author/era). Together LTP and LTD provide bidirectional Hebbian plasticity and support synapse scaling (homeostatic plasticity)."
  collingridge = "Graham Collingridge and colleagues provided key pharmacological and mechanistic dissection of NMDA receptor requirement for LTP induction (1983 era, Nature — primary author/era cited)."
  |> "[@x_bliss_lomo_1973]"

@D dom_kandel_aplysia := "Kandel — Aplysia simple-system learning (2000 Nobel)" :: mechanism [ok]
  approach = "Eric Kandel chose the marine mollusk Aplysia californica — with its large, identifiable neurons and simple behaviours (gill-withdrawal reflex) — as a model system for the neural and molecular basis of learning. By tracing habituation, sensitisation, and classical conditioning to specific synaptic changes in a small, accessible circuit, Kandel established molecular links between experience, synaptic plasticity, and memory."
  molecular = "Short-term sensitisation involves cAMP/PKA phosphorylation of K+-channel subunits (broadening presynaptic action potentials, increasing Ca2+ entry and transmitter release). Long-term sensitisation and memory storage require CREB-mediated transcription, new protein synthesis, and structural synaptic growth — establishing that long-term memory formation depends on gene expression and protein synthesis."
  significance = "This work earned Kandel the 2000 Nobel Prize in Physiology or Medicine (jointly with Carlsson and Greengard). It unified molecular biology and neuroscience and provided mechanistic support for the idea that memories are encoded as physical synaptic changes."
  honesty = "Nobel 2000 is asserted. Primary volume/page for landmark Kandel Aplysia papers (Science 1970s–1980s era) paraphrased as primary-author/era."
  |> "[@x_kandel_2000_nobel]"

# ── §3 Sensory systems ─────────────────────────────────────────────────

@D dom_visual_cortex := "visual cortex receptive fields — Hubel & Wiesel 1962" :: domain [ok]
  discovery = "David Hubel and Torsten Wiesel systematically mapped receptive-field properties of neurons in primary visual cortex (V1) of cats and monkeys using single-unit electrophysiology. Their landmark 1962 paper characterised simple cells (orientation-selective, ON/OFF subfield structure) and complex cells (orientation-selective, position-invariant) in cat V1."
  publication = "Hubel DH, Wiesel TN. Receptive fields, binocular interaction and functional architecture in the cat's visual cortex. J Physiol 1962;160:106–154."
  columnar-architecture = "Hubel and Wiesel also demonstrated ocular dominance columns (alternating cortical columns preferentially driven by one eye) and orientation columns — introducing the concept of the cortical column as a functional processing unit. These columns are prominent in cat and macaque but vary across species."
  critical-period = "They also showed a critical period for visual cortical development: monocular deprivation during a sensitive postnatal window permanently alters ocular dominance and visual acuity — establishing that cortical architecture is activity-dependent during development."
  nobel = "Hubel and Wiesel received the 1981 Nobel Prize in Physiology or Medicine, shared with Roger Sperry (split-brain / hemispheric specialisation)."
  honesty = "Nobel 1981 and J Physiol volume/page asserted."
  |> "[@x_hubel_wiesel_1962]"

@D dom_cochlea := "auditory transduction — von Békésy travelling wave (1961 Nobel)" :: domain [ok]
  discovery = "Georg von Békésy provided a physical description of cochlear mechanics: sound vibrations propagate as a travelling wave along the basilar membrane, with the peak of the wave occurring at a frequency-specific location (tonotopy) — high frequencies near the base, low frequencies near the apex."
  nobel = "von Békésy received the 1961 Nobel Prize in Physiology or Medicine for this work."
  tonotopy = "Tonotopic organisation is maintained all the way from the cochlea through the auditory brainstem nuclei to auditory cortex — a key principle of auditory system organisation. The inner hair cells transduce basilar membrane movement into neural signals via mechanoelectric transduction (tip-link / stereocilia deflection → MET channel opening)."
  outer-hair-cells = "Outer hair cells act as a cochlear amplifier (electromotility via prestin protein), sharpening frequency selectivity beyond the passive basilar-membrane motion — a biological active-amplifier mechanism discovered decades after von Békésy's work."
  honesty = "Nobel 1961 asserted for von Békésy. Outer hair cell / prestin mechanism cited as discovery-era following Nobel; exact volume/page for prestin (Zheng et al. 2000 Nature era) not asserted."
  |> "[@x_vonbekesy_1961_era]"

@D dom_olfaction := "olfactory receptor families — Buck & Axel 1991 (2004 Nobel)" :: domain [ok]
  discovery = "Linda Buck and Richard Axel identified and characterised the large family of odorant receptor genes in the mammalian genome, published in their landmark 1991 Cell paper. They demonstrated that odorant receptors are encoded by a multigene family of G-protein-coupled receptors (the largest such family in the mammalian genome), and that each olfactory sensory neuron typically expresses only one receptor type."
  publication = "Buck L, Axel R. A novel multigene family may encode odorant receptors: a molecular basis for odor recognition. Cell 1991;65:175–187."
  receptor-count = "The mouse genome encodes roughly 1,000 functional odorant receptor genes; the human genome encodes roughly 400 functional OR genes plus ~600 pseudogenes. This is the largest family of G-protein-coupled receptors. Neither count is lattice-derived — it is a genomic count (see [@n6_honest_stance])."
  combinatorial-code = "Each receptor responds to multiple odorants, and each odorant activates multiple receptors — a combinatorial code generating the large odour discriminatory capacity from a finite receptor repertoire. Axonal projections from neurons expressing the same receptor type converge on the same glomeruli in the olfactory bulb, providing a spatial map of receptor identity."
  nobel = "Buck and Axel received the 2004 Nobel Prize in Physiology or Medicine."
  honesty = "Nobel 2004 and Cell volume/page asserted."
  |> "[@x_buck_axel_1991]"

# ── §4 Brain mapping and neuroimaging ─────────────────────────────────

@D dom_fmri_bold := "fMRI BOLD signal — Ogawa et al 1990" :: domain [ok]
  discovery = "Seiji Ogawa and colleagues demonstrated in 1990 that the ratio of oxygenated to deoxygenated haemoglobin in blood is detectable by MRI due to its differential magnetic susceptibility — deoxyhaemoglobin is paramagnetic, oxyhaemoglobin is diamagnetic. This blood-oxygenation-level-dependent (BOLD) contrast became the basis of functional MRI (fMRI)."
  publication = "Ogawa S, Lee TM, Kay AR, Tank DW. Brain magnetic resonance imaging with contrast dependent on blood oxygenation. Proc Natl Acad Sci USA 1990;87:9868–9872."
  bold-as-proxy = "The BOLD signal is an INDIRECT proxy for neural activity: regional neural firing increases local metabolic demand → local vasodilation / increased blood flow → a haemodynamic response function (HRF) peaking roughly 4–6 seconds after the neural event. fMRI measures haemodynamics, NOT action potentials directly. This indirection has implications for temporal and spatial resolution (see [@lim_fmri_resolution])."
  cross-link-neuro = "NEURO.tape documents fMRI as a non-invasive neural-recording modality (in the BCI context); this entry establishes the underlying BOLD physics at the foundational science level."
  |> "[@x_ogawa_1990]"

@D dom_diffusion_mri := "diffusion MRI tractography" :: domain [ok]
  what = "Diffusion-weighted MRI measures the directional diffusion of water molecules in tissue; in white matter, water diffuses preferentially along myelinated axon bundles (anisotropic diffusion). Diffusion tensor imaging (DTI) and more advanced models (HARDI, tractography algorithms) exploit this to reconstruct white-matter fibre tracts non-invasively."
  resolution = "Tractography reconstructs population-level fibre orientation — it is not single-axon resolution. False-positive tracts, inability to resolve crossing fibres with simple DTI, and susceptibility to acquisition artefacts are documented limitations; tractography results must be interpreted with anatomical knowledge and validated against histological methods where possible."
  cross-link = "see [@lim_connectomics_scale] for scale/resolution limits."

@D dom_pet := "PET neuroimaging" :: domain [ok]
  what = "Positron emission tomography (PET) uses radiolabelled tracers to image receptor density, metabolic activity (18F-FDG glucose uptake), amyloid/tau deposition (amyloid-PET, tau-PET), and neurotransmitter turnover. PET provides molecular specificity that fMRI BOLD cannot."
  cross-link-nuclear = "PET physics and tracer chemistry → NUCLEAR-MEDICINE.tape (cross-link if present). This entry records the neuroscience application of PET."
  amyloid-pet = "Amyloid-PET (Pittsburgh compound B / florbetapir / florbetaben era) enabled in-vivo detection of cerebral amyloid deposition, enabling pre-symptomatic Alzheimer's biomarker studies and defining the biological-Alzheimer's disease (A/T/N) framework. Tau-PET followed for neurofibrillary tangle imaging."
  cross-link-pharm = "Anti-amyloid pharmacology (lecanemab/donanemab) → NEUROPHARMACOLOGY.tape §2 rx_cognitive_anti_amyloid (not duplicated here)."

# ── §5 Cognitive neuroscience — place cells, grid cells, PFC ─────────

@D dom_hippocampal_place_cells := "hippocampal place cells — O'Keefe 1971 (2014 Nobel)" :: domain [ok]
  discovery = "John O'Keefe discovered in 1971 that certain neurons in the hippocampus of freely moving rats fire selectively when the animal is in a specific location in the environment — 'place cells'. Each cell has a 'place field': a region of space where it fires preferentially. Together, active place cells form a dynamic 'cognitive map' of the current environment."
  first-publication = "O'Keefe J, Dostrovsky J. The hippocampus as a spatial map. Preliminary evidence from unit activity in the freely-moving rat. Brain Res 1971;34:171–175. (primary author/year/journal asserted)"
  cognitive-map = "O'Keefe and Nadel's 1978 monograph ('The Hippocampus as a Cognitive Map') elaborated the idea into a comprehensive theory; hippocampal spatial mapping generalised to non-spatial 'cognitive maps' in broader contexts."
  role = "The hippocampus is required for episodic memory formation (as established by the amnesic patient H.M. — studied by Milner, Penfield-era, following bilateral hippocampal resection ca. 1953); place cells provide one cellular substrate linking space, memory, and navigation."
  cross-link = "see [@dom_grid_cells] for the complementary grid-cell discovery; both were the basis of the 2014 Nobel."
  |> "[@x_okeefe_1971]"

@D dom_grid_cells := "grid cells — Moser et al 2005 (2014 Nobel)" :: domain [ok]
  discovery = "May-Britt Moser and Edvard Moser (with colleagues in the Moser lab) discovered in 2005 that neurons in the medial entorhinal cortex (mEC) fire at multiple locations arranged in a regular hexagonal grid covering the environment — 'grid cells'. Each cell tiles the environment with a hexagonal lattice (intrinsic property of the cell's firing, not imposed by the environment)."
  publication = "Hafting T, Fyhn M, Molden S, Moser M-B, Moser EI. Microstructure of a spatial map in the entorhinal cortex. Nature 2005;436:801–806."
  grid-properties = "Grid cells are characterised by spatial period (scale of the hexagonal pattern), grid orientation, and grid phase (offset of the pattern within a cell population sharing the same scale and orientation). Multiple modules exist with different scales; scale increases dorsoventrally in mEC."
  circuit = "Place cells (hippocampus) and grid cells (mEC) interact in a hippocampal-entorhinal circuit: grid cells provide metric distance/direction input; place cells form context-specific maps. Together they constitute a GPS-like neural navigation system."
  honesty = "Grid-cell firing is hexagonally periodic — this is a property of the animal's neural geometry (2D hexagonal tiling of the environment), not derived from the n=6 hexa lattice. 'Hexagonal' here refers to the geometric packing of firing fields in 2D space, arising from an unknown neural attractor-network mechanism. See [@n6_honest_stance]."
  nobel = "O'Keefe, May-Britt Moser, and Edvard Moser jointly received the 2014 Nobel Prize in Physiology or Medicine."
  |> "[@x_moser_2005]"

@D dom_pfc_executive := "prefrontal cortex — executive function" :: domain [ok]
  anatomy = "The prefrontal cortex (PFC) comprises the anterior-most part of the frontal lobe — including dorsolateral PFC (dlPFC), ventromedial PFC (vmPFC), orbitofrontal cortex (OFC), and anterior cingulate cortex (ACC). It receives convergent input from virtually all cortical and subcortical regions and projects back widely, placing it at the apex of cortical hierarchy."
  function = "Working memory (dlPFC — Fuster/Goldman-Rakic era; unit recordings during delay periods in monkeys showing persistent firing 'holding' information across seconds); inhibitory control; decision-making under uncertainty (vmPFC/OFC); conflict monitoring and error detection (ACC); planning; social cognition and theory of mind (frontal pole / temporoparietal junction interactions)."
  goldman-rakic = "Patricia Goldman-Rakic's work on dlPFC microcircuitry (1990s era) — showing persistent activity in layer III pyramidal networks via recurrent excitation and D1-receptor modulation — is the foundational cellular model of working memory. Primary-author/era cited."
  lesion-evidence = "PFC lesion syndromes (from frontal-lobe tumours, trauma, stroke, and surgical cases) produce characteristic deficits: dysexecutive syndrome, perseveration, impaired planning, personality change (Phineas Gage case, 1848 era — historical, not a controlled study). Imaging converges on the same regions for the same functions."
  honesty = "PFC subdivisions, layer counts, and projection densities are empirical anatomical facts; they are not lattice values."

# ── §6 Neurological disease mechanisms ────────────────────────────────

@D dom_stroke := "stroke — ischaemic and haemorrhagic" :: domain [ok]
  definition = "Stroke is the sudden interruption of cerebral blood supply (ischaemic — ~85% of strokes; haemorrhagic — ~15%). Ischaemic stroke is caused by arterial occlusion (thrombus, embolus, small-vessel disease); haemorrhagic by arterial rupture (intracerebral haemorrhage, subarachnoid haemorrhage)."
  penumbra = "The ischaemic penumbra — tissue with reduced but not zero perfusion — is the therapeutic target: infarct core (irreversibly damaged within minutes) surrounds tissue that is electrically silent but potentially salvageable. The ischaemic cascade (energy failure → glutamate excitotoxicity → calcium overload → calpain/caspase activation → necrosis/apoptosis) is the mechanistic framework."
  treatment-era = "Intravenous tPA (alteplase) for acute ischaemic stroke within the 4.5-hour window (time-sensitive thrombolysis) and mechanical thrombectomy for large-vessel occlusion (multiple landmark RCTs 2015 era: MR CLEAN, ESCAPE, EXTEND-IA, SWIFT PRIME, DAWN — consistent functional-outcome benefit up to 24-hour windows for selected patients) are the evidence-based acute interventions."
  cross-link-pharm = "Stroke pharmacology (antiplatelet, anticoagulation, statins for secondary prevention) → NEUROPHARMACOLOGY.tape (not duplicated here)."
  honesty = "Stroke statistics (~85/15 ischaemic/haemorrhagic) and treatment windows are empirical clinical estimates, not lattice constants."

@D dom_alzheimer := "Alzheimer's disease — amyloid + tau hypothesis" :: domain [ok]
  amyloid = "The amyloid hypothesis (originally articulated by Hardy and Higgins in a 1992 Science paper — the definitive full review by Hardy and Selkoe, Science 2002 — proposes that the accumulation of amyloid-β peptide, particularly in oligomeric and fibrillar forms, is the primary pathogenic trigger in Alzheimer's disease. Amyloid precursor protein (APP) is cleaved by β-secretase (BACE1) and γ-secretase to produce Aβ40 and Aβ42; Aβ42 is more prone to aggregation."
  hardy-selkoe = "Hardy J, Selkoe DJ. The amyloid hypothesis of Alzheimer's disease: progress and problems on the road to therapeutics. Science 2002;297:353–356. (landmark review of the amyloid hypothesis — assembles the genetic, biomarker, and therapeutic evidence up to 2002)"
  tau = "Tau is a microtubule-associated protein; in Alzheimer's (and other tauopathies), hyperphosphorylated tau misfolds and aggregates into neurofibrillary tangles (NFTs). NFT burden correlates with neuronal loss and cognitive decline more closely than amyloid plaque load alone — hence the 'amyloid cascade → tau propagation → neurodegeneration' sequential model."
  a-t-n = "The biological A/T/N framework (Jack et al. era, 2016–2018) defines Alzheimer's disease biomarker status by amyloid (A+/-), tau (T+/-), and neurodegeneration (N+/-), enabling pre-symptomatic classification. This framework was enabled by amyloid-PET and tau-PET, plus CSF Aβ42/phospho-tau measures."
  honest-limit = "The amyloid hypothesis is supported by: GWAS risk loci (APOE ε4, TREM2, CLU, CR1), Down syndrome amyloid pathology, familial APP/PSEN1/PSEN2 mutations all increasing Aβ. But anti-amyloid drugs until 2021 uniformly failed to produce clear clinical benefit — the 2022-2024 lecanemab/donanemab era produced the first modest slowing signals. The field remains contested on clinical meaningfulness. Cross-link: NEUROPHARMACOLOGY.tape rx_cognitive_anti_amyloid."
  cross-link-pharm = "Anti-amyloid mAb pharmacology and cholinergic hypothesis → NEUROPHARMACOLOGY.tape (not duplicated here)."
  |> "[@x_hardy_selkoe_2002]"

@D dom_parkinson := "Parkinson's disease — α-synuclein and dopaminergic degeneration" :: domain [ok]
  pathway-lost = "Parkinson's disease (PD) is characterised by progressive degeneration of dopaminergic neurons in the substantia nigra pars compacta and their projections to the striatum (nigrostriatal pathway). By the time motor symptoms emerge (~bradykinesia, rigidity, resting tremor, postural instability), roughly 60–80% of dopaminergic nigral neurons have been lost — a substantial presymptomatic window."
  alpha-syn = "α-Synuclein (SNCA gene) is the major protein component of Lewy bodies (intracellular inclusions that are the neuropathological hallmark of PD and related Lewy-body disorders). SNCA missense mutations (A53T, A30P, E46K) and duplications/triplications of the SNCA locus cause autosomal dominant Parkinson's disease — establishing α-synuclein as a pathogenic protein. The prion-like propagation hypothesis (Braak staging, 2003 era) proposes that α-synuclein pathology spreads in a predictable anatomical sequence from lower brainstem/enteric nervous system to cortex."
  gwas-loci = "GWAS of sporadic PD has identified loci at SNCA, LRRK2, MAPT, MCCC1, GAK, BST1, and others — emphasising that sporadic PD is polygenic. LRRK2 G2019S is the most common known pathogenic variant in familial/sporadic PD."
  cross-link-pharm = "L-DOPA, DA agonists, MAO-B inhibitors, DBS → NEUROPHARMACOLOGY.tape and NEURO.tape stim_dbs_neuromodulation (not duplicated here)."
  honesty = "Percentages (60–80% neuron loss at symptom onset) are empirical estimates from post-mortem and imaging studies; figures are paraphrased, not asserted to decimal precision."

@D dom_huntington := "Huntington's disease — CAG repeat expansion" :: domain [ok]
  discovery = "Huntington's disease (HD) is caused by an expansion of a CAG trinucleotide repeat in exon 1 of the HTT gene (chromosome 4p) beyond a pathogenic threshold (typically >36 repeats in full penetrance). The HD Collaborative Research Group cloned the HD gene and characterised the repeat expansion."
  publication = "The Huntington's Disease Collaborative Research Group. A novel gene containing a trinucleotide repeat that is expanded and unstable on Huntington's disease chromosomes. Cell 1993;72:971–983. (landmark gene identification paper)"
  mechanism = "The expanded CAG repeat encodes a polyglutamine (polyQ) tract in the huntingtin protein. Mutant huntingtin (mHTT) with an expanded polyQ tract misfolds, aggregates, and disrupts multiple cellular processes: transcription (HDAC interactions), axonal transport, mitochondrial function, and striatal medium spiny neuron (MSN) survival (striatum is the most vulnerable region)."
  genotype-phenotype = "There is an inverse correlation between CAG repeat length and age of onset: longer repeats → earlier onset. Repeat lengths >60 cause juvenile-onset HD. This genotype-phenotype relationship is robust and is the primary prognostic determinant — a real biological finding, not a lattice constant."
  therapeutic = "No disease-modifying therapy is approved as of the knowledge cutoff; antisense oligonucleotides (ASOs) targeting HTT mRNA are in clinical trials. Symptomatic treatment (tetrabenazine/deutetrabenazine for chorea) is standard."
  honesty = "CAG repeat thresholds (36 / 40 / 60) and gene location (4p) are asserted as established molecular genetic facts. The 1993 Cell paper volume/page is asserted per the widely-cited canonical reference."
  |> "[@x_hd_collab_1993]"

# ── §7 Connectomics and enabling technologies ─────────────────────────

@D dom_optogenetics := "optogenetics — Boyden et al 2005 (Deisseroth-Boyden)" :: domain [ok]
  discovery = "Edward Boyden and colleagues (in Karl Deisseroth's lab at Stanford) reported in 2005 that channelrhodopsin-2 (ChR2), a light-gated cation channel from the green alga Chlamydomonas reinhardtii, could be genetically expressed in mammalian neurons to drive millisecond-precise action potentials with blue-light illumination — the foundational optogenetics paper."
  publication = "Boyden ES, Zhang F, Bamberg E, Nagel G, Deisseroth K. Millisecond-timescale, genetically targeted optical control of neural activity. Nat Neurosci 2005;8:1263–1268."
  significance = "Optogenetics provides cell-type-specific, millisecond-precise neural control — far beyond what electrical stimulation (which is cell-type-agnostic and spatially diffuse) could achieve. It became the dominant tool for circuit causality analysis in systems neuroscience, enabling a decade of discoveries about circuit mechanisms of behavior."
  toolbox = "The optogenetics toolbox has expanded to include inhibitory opsins (halorhodopsin — NpHR, chloride pump; archaerhodopsin — Arch, proton pump), step-function opsins, red-shifted variants, and soma-targeted variants. Chemogenetics (DREADDs — designer receptors exclusively activated by designer drugs) is a complementary non-optical approach for more sustained, diffuse modulation."
  cross-link = "Optogenetics is a neurotechnology tool (cross-link NEURO.tape for the BCI/neurotech framing); this entry is foundational science — the discovery paper and principle."
  |> "[@x_boyden_2005]"

@D dom_clarity := "CLARITY tissue clearing — Chung et al 2013" :: domain [ok]
  discovery = "Karl Deisseroth and colleagues (Kwanghun Chung lead author) published CLARITY in 2013 — a technique that renders intact neural tissue (up to whole-brain scale in mice) optically transparent by replacing lipids with a hydrogel scaffold while preserving proteins, nucleic acids, and fluorescent labels in place. This allows three-dimensional imaging of intact circuits without physical sectioning."
  publication = "Chung K, Wallace J, Kim SY, Kalyanasundaram S, Andalman AS, Davidson TJ, Mirzabekov JJ, Zalocusky KA, Mattis J, Denisin AK, Pak S, Bernstein H, Ramakrishnan C, Grosenick L, Gradinaru V, Deisseroth K. Structural and molecular interrogation of intact biological systems. Nature 2013;497:332–337."
  significance = "CLARITY enables whole-brain single-cell resolution imaging in fixed tissue — bridging the gap between light microscopy (fast, protein-preserving) and electron microscopy (synaptic resolution but labour-intensive sectioning). It catalysed the brain atlas and connectome fields, enabling registration of molecular markers, cell types, and circuits in the same intact tissue."
  scale-limit = "Diffusion of antibodies and fluorescent probes into thick cleared tissue is limiting; imaging time and data volume (terabytes per brain) are practical constraints. Scaling to primate / human brains requires further technical development."
  |> "[@x_chung_2013]"

@D dom_single_cell_atlas := "single-cell brain atlases (scRNA-seq era)" :: domain [ok]
  approach = "Single-cell RNA sequencing (scRNA-seq) and related single-nucleus methods allow the transcriptome of individual cells to be measured at genome scale, enabling cell-type classification without prior anatomical knowledge. Applied to the brain, this enables systematic census of neuronal and non-neuronal cell types."
  milestones = "Allen Brain Atlas (whole-brain in-situ hybridisation era, early 2010s) established transcriptomic anatomy of the mouse brain. Large-scale scRNA-seq initiatives (Allen Institute, Human Cell Atlas — brain component, Tabula Sapiens era, BRAIN Initiative cell census network) are generating comprehensive human and mouse brain cell atlases as of the knowledge cutoff. Major programs include the BRAIN Initiative Cell Census Network (BICCN)."
  cell-type-count = "The number of molecularly distinct cell types in the mammalian brain is not yet settled; estimates from large-scale scRNA-seq cluster at hundreds of subtypes in regions like the mouse motor cortex and far more across the whole brain. This is an empirical, evolving count — NOT a lattice value."
  cross-link = "see [@lim_connectomics_scale] for the computational / connectomic limits."

# ── §8 Adult neurogenesis — discovery and contested scope ─────────────

@D dom_adult_neurogenesis := "adult neurogenesis — dentate gyrus discovery and species debate" :: domain [ok]
  discovery = "Peter Eriksson and colleagues (1998, Nature Medicine) provided direct evidence for adult neurogenesis in the human dentate gyrus (hippocampus) using BrdU labelling of dividing cells in cancer patients who had received BrdU for tumour staging. This established adult hippocampal neurogenesis as a real phenomenon in humans, building on earlier rodent work by Altman (1960s era) and the more direct demonstrations by Bhagya Rao and Fred Gage (Salk Institute era)."
  publication = "Eriksson PS et al. Neurogenesis in the adult human hippocampus. Nat Med 1998;4:1313–1317. (primary author/year/journal asserted)"
  sorrells-challenge = "Shawn Sorrells and colleagues challenged the extent of adult human hippocampal neurogenesis in a 2018 Nature paper using updated histological methods and antibody panels, reporting limited evidence for adult-born neurons in the human dentate gyrus compared to earlier BrdU studies and rodent data."
  sorrells-publication = "Sorrells SF et al. Human hippocampal neurogenesis drops sharply in children to undetectable levels in adults. Nature 2018;555:377–381."
  controversy = "The field is actively debating this question as of the knowledge cutoff: different antibodies, tissue fixation conditions, and histological methods give very different results. Some subsequent studies (using fresh-frozen tissue, newer markers) do report adult-born neurons in human dentate gyrus; others, using rigorous archival tissue, do not. The honest position is that adult human hippocampal neurogenesis exists in rodents and likely in primates at a lower rate, but its quantitative extent in adult humans is genuinely uncertain."
  olfactory-bulb = "The rostral migratory stream (from the subventricular zone to the olfactory bulb) is a second established neurogenic zone in rodents; evidence for this route in adult humans is substantially weaker."
  honesty = "The methodological debate is explicitly preserved: this is not a resolved scientific consensus point. Both Eriksson 1998 and Sorrells 2018 are cited; the contradictory results are honestly acknowledged."
  |> "[@x_eriksson_1998] · [@x_sorrells_2018]"

# ── §9 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_connectomics_scale := "connectomics scale — full human connectome is computationally intractable at synaptic resolution (HARD)" :: real-limit [ok required]
  wall = "HARD WALL (current technology — engineering scale)"
  statement = "The human brain contains approximately 86 billion neurons (Herculano-Houzel 2009 era) forming roughly 100–150 trillion synapses (estimates vary by method and brain region; figures are empirical, not lattice constants). Achieving synapse-level resolution connectomics across a full human brain is beyond current capabilities: the C. elegans connectome (302 neurons, ~7,000 synapses — White et al. 1986 era — primary-author/era cited) took years; the adult fly brain connectome (roughly 140,000 neurons — Flywire 2023 era) required large-scale automated EM and computational infrastructure. Scaling to the human brain by orders of magnitude in neuron count and connectivity represents a transformative future challenge, not a near-term solved problem."
  consequence = "Brain network analysis at human scale is currently possible only at the mesoscale (fMRI functional connectivity, tractography structural connectivity) — which lacks single-synapse resolution. Cell-type-resolution wiring diagrams of entire brain regions in the mouse are achieved in small volumes; human equivalent is not yet feasible."
  |> "[@x_herculano_houzel_2009_era]"

@D lim_fmri_resolution := "fMRI BOLD temporal and spatial resolution (HARD physical)" :: real-limit [ok required]
  wall = "HARD WALL (haemodynamic physics)"
  statement = "fMRI BOLD is limited in temporal resolution by the haemodynamic response function (HRF) — which peaks 4–6 seconds after the neural event — precluding sub-second neural dynamics from being directly resolved. Spatial resolution is limited by vascular architecture (draining veins collect signal from large cortical volumes) and SNR considerations; typical human fMRI voxels are 2–3 mm on a side, covering hundreds of thousands of neurons per voxel. Ultra-high-field (7T) MRI improves spatial resolution to roughly 1 mm or below but does not change the haemodynamic temporal constraint."
  consequence = "fMRI reveals where and broadly when (not millisecond spike timing) neural activity occurs; temporal dynamics at the neural-circuit timescale (milliseconds) require EEG/MEG or direct recording. The spatial resolution is insufficient to resolve individual cortical columns or single-cell identity in human subjects non-invasively."

@D lim_reproducibility_neuroimaging := "neuroimaging reproducibility crisis (Button et al 2013)" :: real-limit [ok required]
  wall = "METHODOLOGICAL LIMIT (statistical power + analytic flexibility)"
  statement = "Button and colleagues (2013) conducted a meta-analysis of neuroscience studies and found that the median statistical power of studies was very low (median power estimated at around 20% for many typical effect sizes) — meaning that if a true effect of a given size exists, individual studies would frequently miss it (false negatives), and positive studies were likely to be biased by selection. Analytic flexibility in fMRI (thousands of possible pre-processing and analysis pipelines — 'researcher degrees of freedom') further inflates false-positive risk."
  publication = "Button KS et al. Power failure: why small sample size undermines the reliability of neuroscience. Nat Rev Neurosci 2013;14:365–376."
  consequence = "Many neuroimaging findings from the 2000s–2010s era (particularly small-sample-size whole-brain fMRI studies) have poor replication rates. Larger samples, pre-registration, multiverse/robustness analysis, and open data sharing are the scientific response. This limit applies to the field's own methods — it is not a claim against neuroscience as a whole."
  |> "[@x_button_2013]"

@D lim_adult_neurogenesis_uncertainty := "adult human neurogenesis — methodological uncertainty" :: real-limit [ok required]
  wall = "METHODOLOGICAL LIMIT (histological + experimental)"
  statement = "Whether adult human hippocampal neurogenesis occurs at a biologically significant rate in the adult brain is genuinely contested as of the knowledge cutoff — not merely politically but scientifically, due to methodological divergence in tissue fixation, antibody specificity, cell-marker interpretation, and quantification approaches. The honest position: adult neurogenesis is well-established in rodents, substantially attenuated in primates, and quantitatively uncertain in adult humans."
  consequence = "Claims about human adult neurogenesis being a modifiable target for depression or cognitive enhancement are speculative at the human-scale biological level, even if rodent evidence is suggestive."
  |> "[@x_sorrells_2018] · [@x_eriksson_1998]"

@D lim_consciousness_hard_problem := "the hard problem of consciousness" :: real-limit [ok required]
  wall = "PHILOSOPHICAL / EMPIRICAL HARD WALL"
  statement = "David Chalmers' 'hard problem of consciousness' (1995 era) identifies the explanatory gap between any physical / neural correlate of consciousness (a 'neural correlate of consciousness', or NCC) and the subjective, first-person phenomenal experience ('what it is like') that consciousness involves. No current neuroscientific or computational framework resolves this gap: we can identify neural correlates of conscious states (e.g. fronto-parietal networks, gamma oscillations, specific thalamo-cortical dynamics) without explaining why or how they give rise to subjective experience rather than just information processing."
  consequence = "Any in-silico simulator of neural dynamics operates on the 'easy problems' of consciousness (information integration, attention, access, reportability); it cannot by definition simulate the hard problem. This tape's scope is the in-silico knowledge SSOT for foundational neuroscience; it does not claim to simulate consciousness."

# ── §10 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-neuroscience" :: governance [required deny:write]
  pattern = "Deriving foundational neuroscience facts FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's '해상도 μm = μ=1 연결', '뇌지도 영역 = σ²=144', '신경영상 지표 = σ=12', '표준화 = 6대 핵심 지표 n=6', '신뢰성 = μ=1', '정확도 = n/φ', or equivalent derivation claims for neuron counts, receptor inventories, cortical area counts, layer counts, stage counts, or any other biological quantity."
  why = "Foundational neuroscience exposes NO natural n=6 invariant. The deleted stub fabricated performance claims, area counts, and staging figures by reading off lattice tokens — a direct hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2 violation. f1 forbids lattice-fit on biology and external entities; f2 forbids in-silico→clinical/efficacy claims. The stub committed both and embedded Korean lattice-mapping prose with zero scientific citation."
  remedy = "Cite real neuroscience literature (this tape's @X entries — Hodgkin & Huxley 1952, Hubel & Wiesel 1962, Bliss & Lømo 1973, Buck & Axel 1991, Ogawa et al 1990, Moser et al 2005, Boyden et al 2005, Chung et al 2013, HD Collab 1993, Hardy & Selkoe 2002, Sorrells et al 2018, Button et al 2013, and author/era citations for Cajal 1906, Kandel 2000, Eccles/Katz-era, O'Keefe 1971, Eriksson 1998, Herculano-Houzel 2009). Lattice may only be a coincidental OBSERVATION (e.g. grid cells use hexagonal tiling of 2D space — this is Euclidean geometry of efficient 2D packing, not derived from the n=6 hexa invariant), never a derivation source for any neuroscience count, frequency, rate, accuracy, or stage."

@N n6_honest_stance := "neuroscience has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: foundational neuroscience exposes NO natural n=6 invariant. The human brain has ~86 billion neurons (Herculano-Houzel 2009 era measurement — not a lattice constant). Cortical layers number 6 in neocortex (a real anatomical fact — 6-layered neocortex is a feature of mammalian evolution; this coincides with the lattice n=6 but was not derived from it and is not a lattice claim). Cranial nerves number 12 (coincidentally matches σ(6)=12 — observation only, not derivation; cranial nerve count is embryological anatomy). Brodmann areas number ~52. Serotonin receptor families number 7 (see NEUROPHARMACOLOGY.tape). Grid cells tile the environment in hexagonal grids (Euclidean 2D efficient packing — geometric fact, not hexa-lattice derivation). Norwood hair-loss staging = VII (see AGA tape). Hippocampal place cells, grid cells, interneuron subtypes, cortical area counts, and BCI channel counts are empirical measurements that vary by species, individual, and method. The 6-layer neocortex is the only neuroscience count that coincidentally matches n=6; it is an OBSERVATION of a real biological fact with an independent evolutionary explanation, not a lattice derivation. Per LATTICE_POLICY g1/g2 + lattice-as-tool: the lattice is DECLINED here as a derivation tool. This honesty IS the corrective for the audited lattice-tautology stub (153b5a2) this file replaced."

# ── §11 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 LTP at CA1 synapses requires NMDA receptor coincidence detection" :: prediction [ok]
  claim = "High-frequency stimulation of the Schaffer-collateral pathway (CA3→CA1) induces LTP that is blocked by competitive NMDA-receptor antagonists (e.g. AP5/D-APV) — demonstrating that NMDA-receptor opening is necessary (not merely correlative) for LTP induction at this synapse."
  falsifier = "If AP5/D-APV-equivalent NMDA blockade reliably did not reduce LTP induction at CA1 Schaffer-collateral synapses in properly controlled in-vitro slice experiments, the NMDA-gate model of LTP induction ([@dom_ltp]) would be wrong."
  source = "[@x_bliss_lomo_1973] · Collingridge era (1983 Nature — primary-author/era)"

@D tp_2 := "TP-2 grid-cell hexagonal periodicity is preserved across familiar environments" :: prediction [ok]
  claim = "Individual entorhinal grid cells maintain their characteristic hexagonal firing-field pattern (same spatial period, same orientation, coherent phase relationships to co-recorded cells) across repeated exposures to the same familiar environment in the same recording context, even across days."
  falsifier = "If grid cells in intact, healthy animals routinely showed random, non-hexagonal spatial firing patterns in familiar environments over repeated exposures — without any pharmacological or lesion manipulation — the spatially periodic attractor-network model of grid-cell generation ([@dom_grid_cells]) would be wrong."
  source = "[@x_moser_2005]"

@D tp_3 := "TP-3 fMRI neuroimaging reproducibility improves monotonically with sample size (within a replication era)" :: prediction [ok]
  claim = "Within a single imaging site/protocol, the statistical reliability (test-retest ICC) of task-fMRI contrast estimates increases monotonically as sample size grows from tens to hundreds of participants, consistent with the low-power critique in Button et al 2013."
  falsifier = "If large-scale pre-registered replication studies (n > 500 per site) routinely failed to show improved reliability over n = 20–40 studies using the same protocol, the power-failure framing ([@lim_reproducibility_neuroimaging]) would be wrong."
  source = "[@x_button_2013]"

# ── §12 Cross-links to HEXA-Bio and sibling tapes ─────────────────────

@X x_neuro_sibling := "NEURO.tape — BCI / neurotechnology in-silico SSOT" :: sibling-tape [active]
  path = "NEURO.tape"
  scope = "Neural recording modalities · BCI decoding · implant longevity · Hodgkin-Huxley action-potential cross-link · population coding · BCI limitations. Do NOT duplicate BCI content here."

@X x_neuropharm_sibling := "NEUROPHARMACOLOGY.tape — CNS pharmacology in-silico SSOT" :: sibling-tape [active]
  path = "NEUROPHARMACOLOGY.tape"
  scope = "Neurotransmitter pharmacology · drug classes · anti-amyloid mAbs · L-DOPA / Parkinson's pharmacology · CNS trial attrition. Do NOT duplicate CNS-pharm content here."

@X x_hexa_ribozyme_sibling := "HEXA-RIBOZYME axis" :: sibling-tape [active]
  path = "hexa-ribozyme/"
  scope = "Ribozyme catalysis — the ribosome peptidyl-transferase mechanism cross-links to cellular neuroscience (protein synthesis required for long-term memory; see [@dom_kandel_aplysia])"

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "@D g1 (real-limits-first) · @D g2 (lattice-is-tool) · @D g8 (in-silico-only-claim-scope) · @F f1 (lattice-fit-on-external-entity). This tape complies: real foundational neuroscience science, in-silico knowledge SSOT only, lattice declined as derivation tool."

# ── §13 External citations (real, landmark literature) ────────────────
# Where a specific bibliographic detail is not asserted with confidence,
# the entry names the primary author + era only and says so explicitly.
# Asserted = confirmed volume/page. Paraphrased = author/era only.

@X x_hodgkin_huxley_1952 := "Hodgkin AL & Huxley AF 1952 (action potential model)" :: literature [active]
  ref = "Hodgkin AL, Huxley AF. A quantitative description of membrane current and its application to conduction and excitation in nerve. J Physiol 1952;117:500–544. (foundational quantitative model of the action potential via voltage-clamp; Nobel 1963 with Eccles)"

@X x_hubel_wiesel_1962 := "Hubel DH & Wiesel TN 1962 (visual cortex receptive fields)" :: literature [active]
  ref = "Hubel DH, Wiesel TN. Receptive fields, binocular interaction and functional architecture in the cat's visual cortex. J Physiol 1962;160:106–154. (simple and complex cell characterisation in V1; ocular dominance and orientation columns; Nobel 1981 with Sperry)"

@X x_bliss_lomo_1973 := "Bliss TVP & Lømo T 1973 (LTP discovery)" :: literature [active]
  ref = "Bliss TVP, Lømo T. Long-lasting potentiation of synaptic transmission in the dentate area of the anaesthetized rabbit following stimulation of the perforant path. J Physiol 1973;232:331–356. (first demonstration of activity-dependent persistent synaptic strengthening in the mammalian brain)"

@X x_buck_axel_1991 := "Buck L & Axel R 1991 (odorant receptor families)" :: literature [active]
  ref = "Buck L, Axel R. A novel multigene family may encode odorant receptors: a molecular basis for odor recognition. Cell 1991;65:175–187. (identification of the large GPCR odorant-receptor gene family; combinatorial olfactory code; Nobel 2004)"

@X x_ogawa_1990 := "Ogawa S et al 1990 (fMRI BOLD)" :: literature [active]
  ref = "Ogawa S, Lee TM, Kay AR, Tank DW. Brain magnetic resonance imaging with contrast dependent on blood oxygenation. Proc Natl Acad Sci USA 1990;87:9868–9872. (BOLD contrast discovery — foundation of fMRI)"

@X x_moser_2005 := "Hafting T, Fyhn M, Molden S, Moser M-B, Moser EI 2005 (grid cells)" :: literature [active]
  ref = "Hafting T, Fyhn M, Molden S, Moser M-B, Moser EI. Microstructure of a spatial map in the entorhinal cortex. Nature 2005;436:801–806. (discovery of grid cells in medial entorhinal cortex; Nobel 2014 with O'Keefe)"

@X x_boyden_2005 := "Boyden ES et al 2005 (optogenetics)" :: literature [active]
  ref = "Boyden ES, Zhang F, Bamberg E, Nagel G, Deisseroth K. Millisecond-timescale, genetically targeted optical control of neural activity. Nat Neurosci 2005;8:1263–1268. (foundational optogenetics paper — ChR2 in mammalian neurons)"

@X x_chung_2013 := "Chung K et al 2013 (CLARITY tissue clearing)" :: literature [active]
  ref = "Chung K, Wallace J, Kim SY, Kalyanasundaram S, Andalman AS, Davidson TJ, Mirzabekov JJ, Zalocusky KA, Mattis J, Denisin AK, Pak S, Bernstein H, Ramakrishnan C, Grosenick L, Gradinaru V, Deisseroth K. Structural and molecular interrogation of intact biological systems. Nature 2013;497:332–337. (CLARITY: hydrogel-tissue fusion for 3D imaging of intact brain circuits)"

@X x_hd_collab_1993 := "Huntington's Disease Collaborative Research Group 1993 (HTT gene / CAG repeat)" :: literature [active]
  ref = "The Huntington's Disease Collaborative Research Group. A novel gene containing a trinucleotide repeat that is expanded and unstable on Huntington's disease chromosomes. Cell 1993;72:971–983. (HTT gene cloning; CAG repeat expansion as the cause of Huntington's disease)"

@X x_hardy_selkoe_2002 := "Hardy J & Selkoe DJ 2002 (amyloid hypothesis)" :: literature [active]
  ref = "Hardy J, Selkoe DJ. The amyloid hypothesis of Alzheimer's disease: progress and problems on the road to therapeutics. Science 2002;297:353–356. (definitive review of the amyloid hypothesis — genetics, biomarkers, and therapeutic progress up to 2002)"

@X x_sorrells_2018 := "Sorrells SF et al 2018 (adult human neurogenesis — limited)" :: literature [active]
  ref = "Sorrells SF et al. Human hippocampal neurogenesis drops sharply in children to undetectable levels in adults. Nature 2018;555:377–381. (challenge to robust adult human hippocampal neurogenesis using updated histological methods; explicitly contradictory to earlier BrdU-labelling studies)"

@X x_button_2013 := "Button KS et al 2013 (neuroimaging power failure)" :: literature [active]
  ref = "Button KS et al. Power failure: why small sample size undermines the reliability of neuroscience. Nat Rev Neurosci 2013;14:365–376. (meta-analysis showing low median statistical power across neuroscience studies; reproducibility-crisis framing)"

@X x_cajal_1906_era := "Cajal SR & Golgi C 1906 Nobel (neuron doctrine)" :: literature [active]
  ref = "Santiago Ramón y Cajal and Camillo Golgi — 1906 Nobel Prize in Physiology or Medicine, 'in recognition of their work on the structure of the nervous system'. Cajal's primary publications (late 1880s–1900s): 'Textura del Sistema Nervioso del Hombre y de los Vertebrados' (2 vols, 1899–1904) — primary-author/era cited; exact paper citations paraphrased per the multi-volume primary sources."

@X x_eccles_1963_era := "Eccles JC 1963 Nobel (synaptic inhibition)" :: literature [active]
  ref = "John Carew Eccles — 1963 Nobel Prize in Physiology or Medicine (jointly with Hodgkin and Huxley), 'for discoveries concerning the ionic mechanisms of excitation and inhibition in nerve cell membranes.' Key publications: Eccles JC. The Physiology of Synapses. Springer, 1964; earlier landmark work in J Physiol 1950s–1960s era on inhibitory postsynaptic potentials. Primary-author/era cited; exact volumes paraphrased."

@X x_katz_1970_era := "Katz B 1970 Nobel (quantal neurotransmitter release)" :: literature [active]
  ref = "Bernard Katz — 1970 Nobel Prize in Physiology or Medicine (jointly with Axelrod and von Euler), 'for discoveries concerning the humoral transmitters in the nerve terminals and the mechanism for their storage, release and inactivation.' Quantal release theory: Katz B, Miledi R (1960s–1970s era) work in J Physiol on statistical analysis of neurotransmitter release. Primary-author/era cited; exact volumes paraphrased."

@X x_kandel_2000_nobel := "Kandel ER 2000 Nobel (Aplysia / molecular learning)" :: literature [active]
  ref = "Eric R. Kandel — 2000 Nobel Prize in Physiology or Medicine (jointly with Carlsson and Greengard), 'for discoveries concerning signal transduction in the nervous system.' Key Aplysia publications: Kandel ER, Kupfermann I, Castellucci V, Carew TJ (1970s–1980s Science/PNAS era) — molecular mechanisms of short-term and long-term sensitisation and memory. Primary-author/era cited; landmark works paraphrased."

@X x_okeefe_1971 := "O'Keefe J & Dostrovsky J 1971 (hippocampal place cells)" :: literature [active]
  ref = "O'Keefe J, Dostrovsky J. The hippocampus as a spatial map. Preliminary evidence from unit activity in the freely-moving rat. Brain Res 1971;34:171–175. (discovery of hippocampal place cells; Nobel 2014 with May-Britt Moser and Edvard Moser)"

@X x_eriksson_1998 := "Eriksson PS et al 1998 (adult human neurogenesis — BrdU evidence)" :: literature [active]
  ref = "Eriksson PS, Perfilieva E, Björk-Eriksson T, Alborn AM, Nordborg C, Peterson DA, Gage FH. Neurogenesis in the adult human hippocampus. Nat Med 1998;4:1313–1317. (BrdU labelling evidence for adult hippocampal neurogenesis in humans; subsequently contested by Sorrells 2018)"

@X x_herculano_houzel_2009_era := "Herculano-Houzel S 2009 era (human neuron count)" :: literature [active]
  ref = "Herculano-Houzel S. The human brain in numbers: a linearly scaled-up primate brain. Front Hum Neurosci 2009;3:31. (isotropic fractionation method applied to human brains; revised total neuron count to ~86 billion, including ~69 billion in cerebellum and ~16 billion in cerebral cortex — primary-author/year/journal cited)"

@X x_vonbekesy_1961_era := "von Békésy G 1961 Nobel (cochlear travelling wave)" :: literature [active]
  ref = "Georg von Békésy — 1961 Nobel Prize in Physiology or Medicine, 'for discoveries of the physical mechanism of stimulation within the cochlea.' Primary work: von Békésy G. Experiments in Hearing (trans. Wever EG). McGraw-Hill, 1960. Primary-author/Nobel year asserted; page-level primary citation paraphrased as primary-author/era."
