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
# HEXA-SKIN.tape — architecture-current (editable per v1.2)
# Event history → HEXA-SKIN.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "hexa-skin" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · SKIN axis — electronic-skin / stretchable bioelectronics (epidermal electronics platform + intrinsically stretchable conductors + wearable biosensing)"
  brief = "wearable conformal sensors · epidermal / on-skin electronics · stretchable interconnects (serpentine + intrinsically stretchable conductors) · multimodal biosensing (mechanical / thermal / electrophysiological / sweat-analyte) · n=6 used as a lattice TOOL only, never a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "HEXA-SKIN.log.tape"
  scope = "in-silico bioelectronic-substrate simulator consistency SSOT · NOT clinical / regulatory claim"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see HEXA-SKIN.log.tape audit"
  axis-note = "SKIN is the wearable / on-body bioelectronic-substrate axis of hexa-bio: electronic skin and stretchable bioelectronics, NOT dermatology. Skin disease (e.g. AGA, melanoma) is out of scope; that axis lives in florea and is referenced, not shadowed (hexa-bio AGENTS.tape g5_sister_repo_cli / f3). Electronic-skin engineering has no derivational n=6 invariant — see [@f_lattice_fit] + [@n6_honest_stance]."

@N scope_disclaimer := "in-silico-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico bioelectronic-substrate modeling target. Materials properties, sensor architectures, and platform descriptions are paraphrased from primary stretchable-electronics / wearable-biosensor literature for modeling context only. A C2/C3 in-silico simulator-consistency PASS here is NOT a wet-lab validation, biocompatibility approval, medical-device claim, or regulatory clearance — every claim about long-term wearability or clinical signal quality is unverified at the wet-lab/clinical boundary (hexa-bio AGENTS.tape g8_in_silico_only / f2). Quantitative figures (e.g. Young's-modulus ranges of skin, strain limits, frequency bands) are illustrative magnitudes paraphrased from the cited primary literature, not re-derived constants. Where author/era is asserted but the exact volume/page is uncertain, that is flagged on the corresponding @X entry."
  |> "[@x_kim_2011_epidermal] · [@x_someya_2004_pressure]"

# ─── §1 The electronic-skin / epidermal-electronics platform ──────────

@D platform_epidermal := "Rogers epidermal-electronics platform" :: domain [ok]
  problem = "Conventional silicon microelectronics is rigid, planar, and brittle (Si Young's modulus ~150 GPa) while human skin is soft, curvilinear, and dynamically strained (skin modulus ~kPa–MPa range, routine strains of tens of percent during motion). Direct lamination of rigid devices on skin fails on contact-mechanics grounds: stress concentrates at the device/skin interface, delamination follows motion, and the wearer feels foreign-body sensation."
  insight = "Kim, Rogers and co-workers (Science 2011) introduced 'epidermal electronics' — ultrathin (~µm), low-modulus, low-areal-mass multifunctional sensor arrays that conform to skin via van der Waals adhesion alone, achieving conformal contact without bulk adhesive."
  components = "Sensors (temperature, strain, electrophysiology), radios/antennas, photodiodes/LEDs, and passive components — built on ultrathin polyimide or elastomer substrates with filamentary serpentine metal interconnects."
  honesty = "The platform is a structural-mechanics achievement: making functional circuits behave like a skin-modulus membrane via thickness scaling + geometric strain isolation. There is no n=6 invariant in this engineering — the relevant invariants are mechanical (skin modulus, fracture strain, bending stiffness ∝ t³)."
  |> "[@x_kim_2011_epidermal] · [@x_rogers_someya_huang_2010]"

@D platform_someya_largearea := "Someya large-area flexible electronics" :: domain [ok]
  insight = "In parallel to the Rogers ultrathin-device path, Someya and co-workers established a large-area route to flexible electronics using organic transistors on plastic foils, demonstrating that pressure-sensitive matrices over hand-sized areas could be built with organic active devices on bendable substrates (Someya 2004 PNAS, large-area flexible pressure-sensor matrix; Someya et al. 2005, conformal e-skin with active matrix)."
  follow-up = "Sekitani & Someya later articulated 'rubber-like electronics' (Adv Mater 2010) — combining intrinsically stretchable conductive composites with stretchable active devices toward truly skin-mechanical electronic systems."
  honesty = "Numerical density and array sizes vary across the series and improved over a decade of work; this entry summarizes a research lineage, not a single number."
  |> "[@x_someya_2004_pressure] · [@x_sekitani_someya_2010]"

# ─── §2 Stretchable conductors / interconnects (the mechanical core) ──

@D mech_serpentine := "geometry-isolated serpentine / mesh interconnects" :: mechanism [ok]
  principle = "Conventional metal films fracture at ~1–2% strain. A film laid out as a serpentine / horseshoe / fractal mesh on (or floating above) an elastomer substrate converts global biaxial strain into mostly out-of-plane / in-plane bending of the trace, so the local material strain stays well below its fracture limit while the overall structure stretches by tens to hundreds of percent."
  range = "Reported stretchability for thin-film-metal serpentines reaches the order of tens of percent and, with optimized fractal layouts plus substrate engineering, much higher — sufficient for skin-strain regimes during routine motion (joints commonly see ~30–50% local strain). Exact numbers depend on metal/thickness/substrate."
  pre-strained-buckled = "An adjacent strategy is to bond a flat film to a pre-stretched elastomer; on release, the film buckles into a wavy/sinusoidal profile that subsequently un-buckles as the elastomer is restretched, accommodating strain without exceeding the material limit (Kim/Rogers and co-workers)."
  honesty = "Serpentine and buckled designs are strain-tolerance via GEOMETRY, not new material physics. The base material is still brittle; the geometry hides the strain. This is a structural-mechanics strategy, with nothing n=6 about it."
  |> "[@x_kim_2011_epidermal] · [@x_lacour_wagner_2003]"

@D mech_intrinsic_conductors := "intrinsically stretchable conductors" :: mechanism [ok]
  strategy = "Where geometry isolation is impractical (e.g. dense active-matrix backplanes, large-area transparent conductors), an alternative is materials that are conductive AND elastic in bulk: conductive elastomer composites (e.g. silver-nanowire / liquid-metal / carbon-nanotube networks in elastomer matrices), conductive polymers and their elastomer blends (PEDOT:PSS + ionic/elastomer additives), and intrinsically stretchable semiconductors (Bao group, conjugated-polymer / nanoconfined-network blends)."
  example-bao = "Bao and co-workers have demonstrated intrinsically stretchable transistor arrays at high device density on elastomeric substrates, including stretchable display backplanes (Bao et al. Nature 2022, intrinsically stretchable AMOLED display — primary-authors/era cited for the demonstration class; not a re-derivation of numbers)."
  honesty = "Two coexisting routes — geometry-isolated serpentine and intrinsically stretchable composite — are complementary, not competing. Each makes a different mechanical-vs-density tradeoff."
  |> "[@x_lacour_wagner_2003] · [@x_bao_2022_stretchable_display]"

@D mech_lacour_wagner_metal := "stretchable thin-metal films via deliberate cracking" :: mechanism [ok]
  observation = "Lacour, Wagner and co-workers (early-2000s era) reported that thin gold films on PDMS, when stretched, develop a controlled network of microcracks while retaining electrical conduction along percolating paths — a 'cracked-metal' route to stretchable interconnects without a serpentine pattern."
  use = "This phenomenon (and related thin-metal-on-elastomer studies) underlies a broad family of strain-sensitive resistive sensors: deliberate cracking gives a gauge factor much larger than the bulk Poisson value, useful as a strain sensor when the same effect would be a failure mode in an interconnect."
  honesty = "Date cited as early-2000s era — exact volume/page of the foundational paper is not asserted (see [@x_lacour_wagner_2003] author/era flag)."
  |> "[@x_lacour_wagner_2003]"

@D mech_conformal_contact := "conformal contact mechanics (rigid-island / soft-bridge)" :: mechanism [ok]
  problem = "Even with stretchable interconnects, integrated circuits, batteries, antennas and many transducers remain locally rigid. Bonding such 'rigid islands' to skin via a uniformly soft membrane causes strain concentration at the island edge."
  solution = "Standard practice is a rigid-island / soft-bridge layout — small device islands carry the rigid parts; serpentine bridges between islands absorb the strain; a low-modulus elastomer encapsulant (or hydrogel adhesive) buffers the skin interface."
  energy-criterion = "Conformal van-der-Waals contact requires the elastic energy stored by deforming the device to match skin topography to remain below the device/skin adhesion energy; this is favored by thin substrates (bending stiffness ∝ t³) and low Young's modulus. The criterion is a contact-mechanics inequality, not a lattice rule (Rogers/Someya/Huang 2010 review formalizes it)."
  honesty = "Bending stiffness ∝ t³ is the central scaling: an order-of-magnitude reduction in substrate thickness produces a thousand-fold reduction in bending stiffness, which is why the platform is built around micrometre-thick films."
  |> "[@x_rogers_someya_huang_2010]"

@D mech_ionic_skin := "ionic skin / hydrogel transparent conductors" :: mechanism [ok]
  insight = "Ionic conductors (hydrogels, ionogels) can be made highly stretchable, biocompatible, transparent, and skin-compliant; they conduct via mobile ions rather than electrons and have been used to build transparent stretchable touch/strain sensors and 'ionic skin' devices (Suo/Whitesides groups, 'highly stretchable and tough hydrogels' / ionic-conductor strategies, early-2010s era)."
  tradeoff = "Ionic conduction is intrinsically slow (bandwidth-limited by ion mobility) and water-content-dependent (drying changes properties), so ionic-skin works best for low-bandwidth sensing or soft-touch interfaces, not for fast electrophysiology."
  honesty = "Cited as a representative class (Suo and co-workers, early-2010s) without asserting a single landmark volume/page."
  |> "[@x_suo_2012_tough_hydrogel]"

# ─── §3 Sensor modalities (mechanical / thermal / electrophysiological / sweat) ─

@D sens_pressure := "pressure / tactile sensing modalities" :: mechanism [ok]
  piezoresistive = "Resistance changes with applied normal force; implementations include cracked-metal films, CNT / carbon-black elastomer composites, conductive-foam sandwiches, and microstructured PDMS with metal coating. Wide dynamic range, simple readout; suffers temperature and drift cross-sensitivity."
  capacitive = "Two electrodes separated by a compliant dielectric (often microstructured PDMS); pressure shrinks the gap and raises capacitance. Excellent low-pressure sensitivity, low hysteresis, but sensitive to electromagnetic environment and humidity."
  piezoelectric = "Charge generated proportional to time-rate of strain (PVDF, PVDF-TrFE, ZnO/PZT nanowires). Self-powered, high-frequency-favored; cannot read static pressure (DC response is zero)."
  triboelectric = "Contact-electrification voltage between dissimilar materials (TENG class, Wang and co-workers). Self-powered, large signal, but bias to dynamic events; environmental dependence (humidity, contamination)."
  someya-matrix = "Large-area pressure-sensor matrix on plastic via organic transistors (Someya 2004) established that hand-area, conformable pressure imaging is feasible with organic active devices."
  honesty = "These four (piezoresistive / capacitive / piezoelectric / triboelectric) are real and complementary; nothing about the count is lattice-derived. Implementation choice is application-driven (static vs dynamic, power, environment)."
  |> "[@x_someya_2004_pressure] · [@x_sekitani_someya_2010]"

@D sens_strain := "strain sensing on skin" :: mechanism [ok]
  cracked-metal = "Deliberately cracked thin-metal films on elastomer (Lacour/Wagner-era physics) give very high gauge factors over moderate strain — useful for joint-motion and respiration sensing."
  composite = "CNT / graphene / silver-nanowire / liquid-metal composites in elastomer matrices give tunable gauge factor vs stretch range tradeoffs."
  ionic = "Ionic-hydrogel strain sensors give transparent, biocompatible, very-large-strain options at lower bandwidth (Suo group class)."
  honesty = "Choice is a (gauge factor) × (range) × (linearity) × (drift) Pareto front; specific sensors live somewhere on it, not at a lattice corner."
  |> "[@x_lacour_wagner_2003] · [@x_suo_2012_tough_hydrogel]"

@D sens_temperature := "skin-temperature sensing" :: mechanism [ok]
  thermistor = "Resistance-vs-temperature transducer integrated into the epidermal platform (negative-temperature-coefficient (NTC) ceramic / thin-film metal serpentines used as RTDs); the Rogers 2011 epidermal-electronics demonstration integrates skin temperature alongside ECG/EMG and strain."
  thermal-conductivity = "An on-skin heater + nearby sensor can extract local thermal conductivity and tissue hydration via transient-plane-source-style measurements — a method demonstrated in the Rogers epidermal-sensor program."
  honesty = "Temperature transduction physics is conventional; the achievement is conformal integration, not new thermometry."
  |> "[@x_kim_2011_epidermal]"

@D sens_biopotential := "biopotential (ECG / EMG / EEG) dry-electrode sensing" :: mechanism [ok]
  goal = "Record surface biopotentials (mV-range ECG, sub-mV EMG, µV-range EEG) without the wet conductive gel used in clinical electrodes, so the electrode can be worn continuously."
  strategy = "Conformal dry electrodes (the Rogers epidermal platform demonstrated multi-channel ECG/EMG quality comparable to wet electrodes in short-duration tests). Skin–electrode impedance and motion artifact dominate signal quality; intimate conformal contact reduces both."
  tradeoff = "Dry-electrode quality degrades with sweat layer changes, lift-off micro-events, and electrochemical drift; standardized long-term comparisons remain limited (see [@lim_dry_electrode_snr])."
  honesty = "Cited as a class result of the Rogers platform; clinical-grade equivalence for chronic monitoring is not a settled claim."
  |> "[@x_kim_2011_epidermal]"

@D sens_sweat := "wearable sweat-analyte biosensing" :: mechanism [ok]
  insight = "Sweat carries electrolytes (Na+, K+, Cl−), metabolites (lactate, glucose, urea), and pH information; a flexible patch can perform continuous, non-invasive multiplex assay using ion-selective electrodes and amperometric enzyme electrodes on a stretchable substrate."
  landmark = "Gao, Javey and co-workers (Nature 2016) demonstrated a fully integrated wearable sensor array with on-board signal conditioning and wireless transmission, measuring multiple sweat analytes simultaneously during exercise."
  limits = "Sweat composition is a non-trivial function of sweat rate, skin region, and intercompartmental partition; correlating sweat-analyte concentration with blood analyte concentration is analyte-specific and not universally established. The platform is wearable and real; the clinical-decision equivalence to blood draw is not (see [@lim_sweat_correlation])."
  honesty = "Gao 2016 is a real, peer-reviewed Nature paper; specific analyte-to-blood correlation magnitudes are not re-derived here."
  |> "[@x_gao_2016_sweat]"

@D sens_self_healing := "self-healing electronic skin" :: mechanism [ok]
  insight = "Tee, Bao and co-workers (Nature Nanotechnology 2012) demonstrated a conductive composite that mechanically and electrically self-heals after cut damage at room temperature, by re-forming dynamic supramolecular bonds in a polymer matrix loaded with metallic micro/nanoparticles."
  significance = "Wearable bioelectronics on skin will accumulate damage (abrasion, cuts, fatigue). Self-healing materials offer an alternative to either over-engineered durability or routine replacement."
  honesty = "The 2012 demonstration is electrical-resistance recovery in a composite, not a fully integrated functional e-skin that re-heals all device layers; later work has extended the concept (transistors, sensors). Cite the 2012 paper as the landmark, not a deployed product."
  |> "[@x_tee_bao_2012_selfhealing]"

@D sens_multimodal := "multimodal integration & decorrelation" :: mechanism [ok]
  goal = "A real on-skin patch must measure several signals simultaneously — pressure + strain + temperature + ECG/EMG + sweat — and the modalities crosstalk: temperature drifts a resistive pressure reading, motion contaminates ECG, sweat layer changes electrode impedance."
  approach = "Multimodal sensor co-location plus a calibration model (often per-wearer) decorrelates the channels; the Rogers and Someya programs both pursued this co-integration over the 2010s."
  honesty = "Multimodal e-skin is real engineering, but the published metrics are usually short-duration / supervised; long-term wearer-independent multimodal decorrelation remains open."
  |> "[@x_kim_2011_epidermal] · [@x_sekitani_someya_2010]"

# ─── §4 Power, wireless, and recent advances ─────────────────────────

@D power_harvesting := "battery-less / energy-harvesting e-skin" :: mechanism [ok]
  routes = "On-body harvesting sources include: thermoelectric (body-vs-ambient ΔT, small µW–mW scale per cm²-class patch), photovoltaic (ambient/indoor light), motion (piezoelectric and triboelectric nanogenerators, TENGs — Wang group), and RF/NFC harvesting from a reader."
  reality = "Each source produces low power, intermittently, with environmental dependence; practical wearables typically combine harvesting with a small battery or supercapacitor buffer and operate the SoC duty-cycled. Wang and co-workers' TENG class is a real research direction, not a deployed primary power source."
  honesty = "Numbers vary across implementations; no single harvesting modality reliably runs a continuous-streaming bioelectronic patch from body alone with current technology — see [@lim_power]."
  |> "[@x_rogers_someya_huang_2010]"

@D wireless_nfc := "wireless / NFC battery-less patches" :: mechanism [ok]
  insight = "A battery-less wireless patch (e.g. Rogers-group NFC-powered epidermal sensors) collects power from a smartphone-class reader via NFC at short range (centimetres), runs sensing for the contact duration, and transmits the result by the same link. This eliminates the battery (the largest, stiffest e-skin component) at the cost of requiring an active reader present."
  bluetooth-mesh = "For longer-range / longer-duration wear, Bluetooth Low Energy (BLE) plus a thin-film battery is the alternative; thicker and stiffer than NFC-only patches but operates autonomously."
  tradeoff = "NFC-only = thinnest, battery-less, but requires reader proximity. BLE = autonomous, but battery dominates patch mass/thickness/stiffness."
  honesty = "Wireless integration is real and demonstrated; protocol choice is application-driven."

@D recent_organic_biosignal := "organic transistors for biosignal recording" :: mechanism [ok]
  insight = "Organic electrochemical transistors (OECTs, e.g. PEDOT:PSS channel) operate in physiological media at low voltage and amplify ionic-electrochemical signals at the source — Malliaras and co-workers have demonstrated high-quality electrophysiology with OECT-based skin and brain-interface electrodes (mid-2010s onward, primary-authors/era)."
  why-it-matters = "OECTs offer transistor-level gain at the electrode itself, mitigating the long-cable noise problem of passive electrodes — relevant for on-skin EMG/EEG."
  honesty = "Cited as a research class with named primary authors/era; exact volume/page not asserted."

@D recent_bao_stretch_display := "intrinsically stretchable display (Bao 2022 Nature)" :: mechanism [ok]
  insight = "Bao and co-workers (Nature 2022) reported an intrinsically stretchable AMOLED display using stretchable transistor backplanes and emissive layers — a major step toward visual e-skin output devices on conformable substrates."
  significance = "Closes a missing piece of the wearable platform (output / display) on the same intrinsically-stretchable-material thesis that underlies the conductor and transistor work."
  honesty = "Cited as the 2022 Nature demonstration; specific resolution / lifetime numbers not re-derived here."
  |> "[@x_bao_2022_stretchable_display]"

@D recent_magnetoreception := "magnetoreception / magnetosensitive e-skin" :: mechanism [ok]
  insight = "Magneto-sensitive elastomer composites and giant-magnetoresistance (GMR) sensors on ultrathin foils give wearers a magnetic-field 'sixth sense' on the skin (Makarov/Schmidt-group class, mid-2010s onward, primary-authors/era)."
  use = "Beyond curiosity demonstrations, these enable contactless input (proximity to a magnet) and orientation sensing without an inertial-measurement unit power budget."
  honesty = "Cited as a research class with primary authors/era; not at consumer deployment."

# ─── §5 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ───

@D lim_biocompat_wear := "biocompatibility & long-term wear" :: real-limit [ok required]
  wall = "SOFT WALL (host-biology, regulatory)"
  statement = "An on-skin device must not produce sensitization, contact dermatitis, blistering, or occlusion-driven maceration over its intended wear time. Common encapsulants (PDMS, polyurethane, polyimide) are reasonably skin-tolerated short-term but vary in moisture-vapour transmission and adhesive compatibility; sustained occlusion impairs the skin barrier and supports microbial overgrowth (hygiene). Multi-day to multi-week continuous wear is constrained by these biology/hygiene effects, not by the electronics."
  consequence = "Continuous-wear duration is a clinical, per-design, per-adhesive question — not a derivation. Vapor-permeable substrates, breathable mesh layouts, and replaceable skin-side liners are practical mitigations, none of them lattice-derived."
  scope = "In-silico simulator consistency CANNOT close this gap (hexa-bio AGENTS.tape g8_in_silico_only / f2 — wet-lab / clinical / regulatory claims are out of repo scope)."

@D lim_power := "power / energy-harvesting limit" :: real-limit [ok required]
  wall = "SOFT WALL (thermodynamic / area-bounded)"
  statement = "Available body-area harvesting power is set by thermodynamics and geometry: thermoelectric harvesting is bounded by body-ambient ΔT and ZT; piezoelectric/triboelectric by mechanical input and conversion efficiency; photovoltaic by ambient irradiance and area; NFC/RF by reader proximity and regulatory power limits. Aggregate continuous power densities for a centimetre-class skin patch generally remain in the µW–low-mW range, not enough to run a continuous-streaming radio + analog front-end + sensor array without a buffer or duty-cycle."
  consequence = "Duty-cycling and event-driven streaming are not design preferences — they are forced by the harvesting ceiling. Continuous high-bandwidth multimodal e-skin still requires a battery; battery mass/thickness/stiffness then dominate the patch mechanics."
  honesty = "Exact power densities are platform-specific; we cite a range, not a magic number."
  |> "[@x_rogers_someya_huang_2010]"

@D lim_wireless_adhesion := "wireless bandwidth + adhesion durability" :: real-limit [ok required]
  wall = "SOFT WALL (link-budget + adhesive aging)"
  statement = "Wireless bandwidth on a low-power skin patch is bounded by the harvested/battery power budget and by regulatory ISM-band constraints — continuous high-channel-count raw streaming (e.g. 64-channel EMG at full bandwidth) is not a practical BLE/NFC payload, forcing on-patch compression/feature extraction. Independently, adhesive durability — whether van-der-Waals (skin oils, motion peel-off), acrylic, hydrogel, or silicone — degrades with sweat, sebum, and mechanical cycling; long-duration wear loses contact area progressively."
  consequence = "Throughput × adhesion-time is a joint frontier — not independently maxable. Designs trade raw-channel bandwidth for on-patch processing, and trade aggressive adhesion (longer wear) for skin irritation (back to [@lim_biocompat_wear])."
  honesty = "Both limits are well-known in the wearable literature; specific durability hours are device- and skin-specific."

@D lim_motion_artifact := "sweat / water / motion artifact" :: real-limit [ok required]
  wall = "SOFT WALL (signal-environment)"
  statement = "Motion modulates skin–electrode contact and capacitance, generating large artifact bursts (orders of magnitude above the biopotential of interest) at exactly the frequencies of activity (~0.5–10 Hz for ambulatory motion). Sweat changes electrode impedance and ion concentration mid-recording. Water immersion / showering disrupts adhesion and may short electrodes. These artifacts cannot be removed by stronger amplification — they share spectral support with the signal."
  consequence = "Robust on-body biosignals require multimodal artifact rejection (motion reference channels, adaptive filters, IMU-aware models). Performance numbers from supervised, stationary, lab settings DO NOT TRANSFER unchanged to ambulatory wear."
  honesty = "This is the headline failure mode of wearable biopotential systems; engineers know it, marketing often does not."

@D lim_mechanical_mismatch := "rigid-island / soft-skin mechanical mismatch" :: real-limit [ok required]
  wall = "HARD WALL (contact mechanics)"
  statement = "Even with serpentine bridges and ultrathin substrates, any locally rigid component (chip die, battery, antenna chip) creates a modulus and thickness mismatch with the underlying skin. At the island boundary, stress concentrates; over enough cycles, the island delaminates or pinches skin under it. The mismatch is set by elastic-modulus and thickness ratios and cannot be eliminated as long as integrated circuits, batteries and antennas remain rigid solids."
  consequence = "There is a hard frontier between 'ultrathin / island-free' (low function) and 'fully integrated SoC + battery + radio' (locally rigid). Real wearable platforms sit somewhere on this frontier by design; closing the rigid-island problem requires fundamentally different (e.g. intrinsically stretchable) active devices."
  |> "[@x_rogers_someya_huang_2010] · [@x_kim_2011_epidermal]"

@D lim_dry_electrode_snr := "dry-electrode signal-to-noise" :: real-limit [ok required]
  wall = "SOFT WALL (electrochemistry / thermal-noise floor)"
  statement = "Without conductive gel, the electrode–skin interface impedance is higher and more variable; thermal-noise floor scales with √(R·BW), so higher interface resistance raises noise. Additionally, electrochemical drift (electrode polarization, double-layer dynamics) introduces slow baseline wander. These set a floor on µV-range chronic recording (EEG is hardest, ECG is easiest, EMG in between)."
  consequence = "Dry electrodes can match wet electrodes acutely in lab tests, but chronic, ambulatory dry-electrode performance — especially EEG-grade — remains an open problem. Higher-impedance electrodes need active (transistor-on-electrode) amplification (OECT class) to compensate."
  honesty = "Cited as the structural reason dry-electrode wearable EEG is hard, not as a derivation of a specific µV number."

@D lim_sweat_correlation := "sweat-to-blood analyte correlation" :: real-limit [ok required]
  wall = "SOFT WALL (physiology — analyte-specific)"
  statement = "Sweat is a real, accessible body fluid, but sweat-to-blood concentration ratios are analyte-specific, sweat-rate-dependent, and not universally established as clinical surrogates. Electrolytes (Na+/K+/Cl−) have well-characterized sweat physiology; metabolites (glucose, lactate, urea) vary in how tightly they track blood concentration."
  consequence = "A wearable sweat sensor that measures sweat-analyte concentration accurately is NOT automatically a wearable blood-analyte sensor; that step is a separate, analyte-specific physiological validation. Conflating the two is a marketing failure mode, not a measurement failure."
  honesty = "Stated as a known physiology constraint; we do not assert a single correlation magnitude per analyte."
  |> "[@x_gao_2016_sweat]"

@D lim_in_silico_boundary := "in-silico → wet-lab unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio SKIN verifies internal consistency of a wearable-bioelectronics SIMULATOR + its metadata. Whether a designed patch actually conforms, adheres, records artifact-free signals, harvests enough power, and remains skin-safe in real wear is empirically unproven and out of repo scope."
  consequence = "No C2/C3 PASS in this axis is a clinical, regulatory, or medical-device claim. Wet-lab / IRB / IDE / 510(k) workflows belong outside this repo (hexa-bio AGENTS.tape g8_in_silico_only · CLOSURE_RESIDUAL_BACKLOG.md §0)."

# ─── §6 n=6 lattice stance (HONEST — observation, not derivation) ────

@F f_lattice_fit := "lattice-fit-on-eskin-engineering" :: governance [required deny:write]
  pattern = "Deriving electronic-skin engineering numbers — sensor density, stretchability, channel count, sampling rate, power budget, adhesion duration, signal-to-noise — FROM the n=6 invariant lattice (σ=12, τ=4, φ=2, J₂=24). E.g. 'sensor density σ²=144/cm² because n=6', 'σ-τ=8 sensor modalities because lattice', 'σ²=144 Hz LRA resonance', or 'σ-φ=10% allowable resistance change'."
  why = "Electronic-skin / stretchable bioelectronics is governed by contact mechanics (Hertzian / van-der-Waals adhesion, bending stiffness ∝ t³), thin-film fracture mechanics, polymer rheology, electrochemistry, thermodynamics of harvesting, and biology of skin — NONE of which has an n=6 invariant. The axis-note in [@id001] permits the lattice to APPEAR in native-spec tooling, but appearance is NOT derivation (hexa-bio AGENTS.tape g1 real-limits-first / g2 lattice-is-tool / f1 lattice-fit-forbidden / f3 no-shadow-impl)."
  remedy = "Cite the real stretchable-electronics / wearable-sensor sources (this tape's @X entries). The lattice may only be a coincidental OBSERVATION (e.g. a count that happens to equal σ(6)=12) — never the reason. Replace any 'n=6 derivation' phrasing in pre-rewrite material with 'mechanical / electrochemical / biological / number-theoretic' derivation as appropriate."
  scope-note = "This guard is the SKIN-axis instance of the cohort-wide LATTICE_POLICY enforcement; it does NOT shadow qmirror/hexa-meta/xeno logic — it references, not reimplements (f3)."

@N n6_honest_stance := "electronic-skin engineering has no derivational n=6 invariant" :: note [required]
  text = "Stated plainly: electronic skin / stretchable bioelectronics exposes NO natural n=6 invariant. Stretchability comes from film/elastomer fracture mechanics + serpentine/buckled geometry + intrinsically stretchable composite materials — not from σ/τ/φ/J₂. Bending stiffness scales as substrate thickness cubed (t³) — a continuum-mechanics theorem, not a lattice scalar. Sensor counts (piezoresistive / capacitive / piezoelectric / triboelectric for pressure; the broader e-skin modality set) reflect physically distinct transduction mechanisms; their numerical count is not derived from φ, τ or σ. Skin temperature (~33 °C), pH (~5.5), epidermal thickness (~100 µm), Meissner-corpuscle density (~140/cm² fingertip) are all biology numbers from anatomy/physiology literature — observation, never derivation; any numerical coincidence with σ²=144 or sopfr+µ/φ=5.5 is COINCIDENCE ONLY. Per hexa-bio AGENTS.tape g1 (real-limits-first) / g2 (lattice-is-tool): in this axis the lattice is DECLINED as a derivation of any engineering or biological quantity. This honesty is the corrective for the lattice-tautology stub this tape replaced (96-EXACT-parameter 'n=6 공식에서 유도 (100%)' claim — explicitly falsified by this rewrite)."

# ─── §7 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 bending stiffness scales as t³" :: prediction [ok]
  claim = "An epidermal-electronics sensor membrane's bending stiffness (and therefore the substrate thickness required for spontaneous van-der-Waals conformal contact to skin topography) follows D = E·t³ / [12(1−ν²)] — a t³ law in substrate thickness. Order-of-magnitude reductions in t produce three-orders-of-magnitude reductions in stiffness."
  falsifier = "If an experimentally controlled thickness sweep of an otherwise identical epidermal-electronics film shows bending stiffness scaling as t^p with p significantly different from 3 (in the thin-plate regime), classical plate theory is violated for this composite class and [@mech_conformal_contact] is wrong."
  source = "[@x_rogers_someya_huang_2010] · [@x_kim_2011_epidermal]"

@D tp_2 := "TP-2 serpentine geometry vs straight-trace fracture" :: prediction [ok]
  claim = "A thin-film metal trace patterned as an optimized serpentine / horseshoe on an elastomer substrate sustains a many-fold larger global stretch before electrical failure than the same trace patterned as a straight line — strain-tolerance comes from geometry, not material change."
  falsifier = "If a head-to-head fatigue test (same metal, same thickness, same elastomer, same cyclic strain) shows equal-or-worse stretch-to-failure for an optimized serpentine vs a straight trace, [@mech_serpentine] is wrong (or the 'optimization' is misspecified)."
  source = "[@x_kim_2011_epidermal] · [@x_lacour_wagner_2003]"

@D tp_3 := "TP-3 dry-electrode chronic SNR ≤ wet-electrode" :: prediction [ok]
  claim = "Over multi-hour ambulatory wear, a dry epidermal-electronics electrode will show greater baseline drift and motion-artifact burden than a clinical-grade wet (gel) electrode in the same configuration — the acute lab-equivalence reported in short tests will narrow or invert under continuous activity."
  falsifier = "If a properly powered ambulatory crossover study shows dry-electrode chronic noise/drift equal-or-lower than wet, [@lim_dry_electrode_snr] is wrong."
  source = "[@x_kim_2011_epidermal]"

# ─── §8 Cross-links (sister repos / sibling axes — reference, do NOT shadow · f3) ─

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "g1 real-limits-first · g2 lattice-is-tool · g8_in_silico_only · f1 lattice-fit-forbidden · f3 no-shadow-impl-of-sister-repo. This tape complies; clinical / regulatory / medical-device claims remain explicitly out of scope and are not reimplemented from in-silico assertions."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  scope = "§0 in-silico-only scope boundary — wet-lab biocompatibility / IRB / IDE / 510(k) of any designed e-skin patch is out-of-repo and unverified."

@X x_florea_sibling := "florea (dermatology / cosmetic-substrate sibling repo)" :: sibling-repo [active]
  scope = "Skin DISEASE biology (e.g. AGA, melanoma, tattoo removal) lives in florea, not hexa-bio. SKIN axis here is wearable bioelectronics on skin — referenced via CLI shell-out (hexa-bio tape-lint), never shadow-implemented (f3)."

# ─── §9 External citations (real, landmark stretchable-electronics / wearable-biosensor literature) ─

@X x_kim_2011_epidermal := "Kim DH et al 2011 (Rogers, Science — epidermal electronics)" :: literature [active]
  ref = "Kim DH et al. Epidermal electronics. Science 2011;333:838–843. (Rogers and co-workers; ultrathin multifunctional sensor arrays — ECG/EMG/EEG, strain, temperature, RF, photodiodes — that conformally laminate to skin via van der Waals; the foundational epidermal-electronics platform paper)"

@X x_tee_bao_2012_selfhealing := "Tee BCK, Bao Z et al 2012 (self-healing e-skin)" :: literature [active]
  ref = "Tee BCK, Wang C, Allen R, Bao Z. An electrically and mechanically self-healing composite with pressure- and flexion-sensitive properties for electronic skin applications. Nat Nanotechnol 2012;7:825–832. (room-temperature self-healing conductive polymer composite for e-skin)"

@X x_gao_2016_sweat := "Gao W, Javey A et al 2016 (wearable sweat sensor)" :: literature [active]
  ref = "Gao W, Emaminejad S, Nyein HYY, Challa S, Chen K, Peck A, Fahad HM, Ota H, Shiraki H, Kiriya D, Lien DH, Brooks GA, Davis RW, Javey A. Fully integrated wearable sensor arrays for multiplexed in situ perspiration analysis. Nature 2016;529:509–514. (multiplex electrolyte + metabolite sweat sensing with on-board signal conditioning and wireless transmission)"

@X x_someya_2004_pressure := "Someya T et al 2004 (large-area flexible pressure-sensor matrix)" :: literature [active]
  ref = "Someya T, Sekitani T, Iba S, Kato Y, Kawaguchi H, Sakurai T. A large-area, flexible pressure sensor matrix with organic field-effect transistors for artificial skin applications. Proc Natl Acad Sci USA 2004;101:9966–9970. (large-area conformable pressure-sensor matrix on plastic, organic active devices — the parallel route to e-skin alongside the Rogers ultrathin path)"

@X x_sekitani_someya_2010 := "Sekitani T & Someya T 2010 (rubber-like electronics; primary-authors/era)" :: literature [active]
  ref = "Sekitani T, Someya T. Stretchable, large-area organic electronics. Adv Mater 2010 (volume/page — primary-authors/era cited; intrinsically stretchable conductive composites + organic active devices toward truly skin-mechanical systems; exact volume not asserted)."

@X x_rogers_someya_huang_2010 := "Rogers JA, Someya T, Huang Y 2010 (materials & mechanics for stretchable electronics)" :: literature [active]
  ref = "Rogers JA, Someya T, Huang Y. Materials and mechanics for stretchable electronics. Science 2010;327:1603–1607. (the canonical review of geometry-based and material-based routes to stretchable electronics; formulates the conformal-contact / bending-stiffness ∝ t³ scaling and the rigid-island/soft-bridge layout)"

@X x_lacour_wagner_2003 := "Lacour S, Wagner S et al 2003 (stretchable gold-on-PDMS; primary-authors/era)" :: literature [active]
  ref = "Lacour SP, Wagner S, Huang Z, Suo Z. Stretchable gold conductors on elastomeric substrates. Appl Phys Lett 2003 — early-2000s era; thin gold films on PDMS develop controlled microcracks while retaining conduction, foundational for cracked-metal stretchable interconnects and strain sensors; primary-authors/era cited, exact volume not asserted."

@X x_bao_2022_stretchable_display := "Bao Z and co-workers 2022 (intrinsically stretchable AMOLED, Nature)" :: literature [active]
  ref = "Bao Z and co-workers. Intrinsically stretchable AMOLED display, Nature 2022 — primary-authors/era cited for the demonstration class (high-density intrinsically stretchable backplane + emissive layer on elastomer substrate); exact volume/page not asserted."

@X x_suo_2012_tough_hydrogel := "Sun JY, Suo Z et al 2012 (tough hydrogel; primary-authors/era)" :: literature [active]
  ref = "Sun JY et al (Suo group). Highly stretchable and tough hydrogels, Nature 2012 (primary-authors/era cited; ionic hydrogels underpin transparent stretchable ionic-skin / strain-sensor devices; exact volume not asserted)."
