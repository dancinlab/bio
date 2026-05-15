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
# HEXA-LIMB.tape — architecture-current (editable per v1.2)
# Event history → HEXA-LIMB.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "hexa-limb" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · neural-direct AI prosthetic limb (의수/의족) — control-and-sensory neural-prosthetic stack"
  brief = "Upper- and lower-limb prosthetics with neural interfaces · evidence-based control modalities (EMG / TMR / peripheral-nerve / cortical BCI) and sensory feedback (intraneural microstimulation) · real-limits anchored · n=6 used as a lattice TOOL only, never a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "HEXA-LIMB.log.tape"
  scope = "in-silico neural-prosthetic simulator consistency SSOT · NOT clinical / surgical advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see HEXA-LIMB.log.tape audit"
  axis-note = "Cross-links the NEURO axis (cortical BCI) for high-level intent decoding and is itself a control-and-actuation substrate; n=6 may appear in native-lattice-spec context as a TOOL (g2 lattice-is-tool), but no count (motor channels, electrode contacts, sensory modalities, degrees of freedom) is derived from it here. See [@f_lattice_fit] + [@n6_honest_stance]."

@N scope_disclaimer := "in-silico-and-clinical-scope honesty" :: note [required]
  text = "This tape is an evidence-summary SSOT for an in-silico neural-prosthetic modeling substrate. Electrode counts, channel counts, control-decoder accuracies, sensory-percept thresholds and rehabilitation outcomes are paraphrased from published clinical and preclinical literature for modeling context only. Real implantation of any peripheral-nerve, intraneural, intracortical, or osseointegrated device is INVASIVE SURGERY with non-trivial morbidity and lifelong device-management implications — it requires qualified surgical, neurology, prosthetist, and rehabilitation teams; nothing here is surgical, neurosurgical, rehabilitation or clinical advice. A C2/C3 in-silico simulator-consistency PASS here is NOT a clinical, regulatory, safety, or therapeutic claim (hexa-bio AGENTS.tape g8_in_silico_only / f2). Quantitative magnitudes are illustrative from the cited primary literature, not re-derived constants."
  |> "[@x_kuiken_2009] · [@x_raspopovic_2014] · [@x_tan_2014]"

# ─── §1 Levels of motor control (where the command signal comes from) ──

@D ctl_cortical_bci := "intracortical BCI for limb control (cross-link NEURO axis)" :: mechanism [ok]
  signal-source = "Microelectrode arrays (e.g. Utah array, 96-channel; later high-density arrays) implanted in primary motor cortex / posterior parietal cortex record multi-unit spiking + LFP from populations of cortical neurons whose firing rates encode intended movement kinematics."
  decoding = "Kalman / linear-Gaussian or recurrent-neural-network decoders map population activity to continuous end-effector velocity or joint trajectories (reach + grasp); typical training cycles re-calibrate decoders per session to compensate for neural drift."
  landmark-evidence = "Hochberg et al. demonstrated tetraplegic participants performing reach-and-grasp with a robotic arm via intracortical BCI ([@x_hochberg_2012]); Collinger et al. extended this to high-DOF reach-and-grasp in a person with tetraplegia ([@x_collinger_2013])."
  scope-here = "HEXA-LIMB uses cortical BCI as the HIGH-LEVEL INTENT layer for whole-arm/whole-leg prosthetics in high-level amputation or paralysis; mechanism and tissue-response detail belong to the NEURO axis cross-link. Intracortical arrays carry the chronic-microelectrode longevity wall ([@lim_chronic_electrode])."
  honesty = "Decoded movement fidelity, training time and longevity are subject- and study-specific; figures are not lattice-derived."
  |> "[@x_hochberg_2012] · [@x_collinger_2013]"

@D ctl_peripheral_nerve := "peripheral-nerve interface for upper-limb control" :: mechanism [ok]
  signal-source = "Recording electrodes placed on/within residual peripheral nerves (median, ulnar, radial in upper limb; tibial, peroneal in lower limb) capture motor efferents headed for missing distal musculature; the same electrodes can stimulate afferents to deliver sensory feedback."
  electrode-types = "See [@nerve_electrodes_taxonomy]: cuff (extraneural), LIFE / TIME (longitudinal / transverse intrafascicular), USEA (Utah Slanted Electrode Array, intraneural penetrating), regenerative sieve / microchannel, high-density flexible."
  trade-off = "Selectivity vs invasiveness vs chronic stability vary by electrode class; no current electrode achieves all three simultaneously (see [@lim_chronic_electrode], [@lim_selectivity_stability_tradeoff])."
  scope-here = "Peripheral-nerve interfaces are the natural control layer for transradial / transhumeral upper-limb prosthetics with adequate residual nerve; they bypass the need for cortical surgery and exploit the amputee's preserved descending motor pathways."
  |> "[@x_raspopovic_2014] · [@x_tan_2014]"

@D ctl_emg_surface_pr := "surface EMG with pattern recognition" :: mechanism [ok]
  signal-source = "Surface electromyography (sEMG) from residual-limb musculature; multiple electrodes feed a pattern-recognition classifier (LDA / SVM / CNN) that distinguishes intended grasp postures, wrist rotation, elbow flexion etc. from muscle-activation patterns."
  scope = "Mainstream, non-invasive, FDA-cleared on multiple commercial systems (Coapt and others); steepest practical learning curve is the user's, not the device's. Robust to a small set of well-separated classes; degrades with electrode shift, sweat, donning variability and posture changes."
  limit = "Inherently limited by how many INDEPENDENT muscle synergies remain in the residual limb — a higher-level amputation (e.g. shoulder disarticulation) has too few residual muscles for many distinct classes; this is the gap targeted by TMR (see [@ctl_tmr])."
  honesty = "Classification accuracies in laboratory settings (often cited as percentage figures for a fixed class count) routinely degrade in free-living use; this is a well-known gap in the prosthetics literature, not a flaw of any one device."

@D ctl_imes := "intramuscular EMG / IMES" :: mechanism [ok]
  signal-source = "Implanted MyoElectric Sensors (IMES) — wireless miniature electrodes embedded directly in individual residual muscles — record from specific muscles with greater spatial selectivity and less crosstalk than surface EMG."
  rationale = "Resolves a major surface-EMG limitation (shift, sweat, crosstalk) by physically placing the electrode IN the muscle of interest; multiple IMES units allow independent simultaneous control of more degrees of freedom."
  status = "Demonstrated in upper-limb prosthetic users with multi-DOF control; chronically implanted, telemetered. Invasive (minor surgical implantation per electrode) but less so than peripheral-nerve or intracortical routes."

@D ctl_tmr := "Targeted Muscle Reinnervation (TMR)" :: mechanism [ok]
  procedure = "Surgically reroute the proximal end of an amputated peripheral nerve to a denervated residual muscle (e.g. pectoralis segments for a shoulder-disarticulation amputee). After nerve regrowth and reinnervation (~months), efferent signals destined for the missing distal muscle now drive contractions of the reinnervated proximal muscle — providing additional, intuitive EMG control sites for a multi-DOF prosthesis."
  landmark = "Kuiken et al. (JAMA 2009) randomized/longitudinal study in shoulder-disarticulation and transhumeral amputees showed that TMR-amplified EMG enabled faster, more accurate multi-DOF prosthetic control than conventional EMG; this established TMR as a standard option for high-level upper-limb amputees ([@x_kuiken_2009])."
  ts-r = "Targeted Sensory Reinnervation (TSR) is the sensory analog: rerouting sensory afferents from the amputated nerve to a patch of residual chest/upper-arm skin produces 'referred' touch sensation — pressing the skin patch is felt on the missing hand. Useful for sensory substitution but does not by itself restore graded force or proprioception with the fidelity of intraneural stimulation ([@ctl_sensory_intraneural])."
  honesty = "TMR is established standard of care for high-level upper-limb amputees with adequate residual tissue; outcomes depend on surgeon experience, time since amputation, and rehabilitation."
  |> "[@x_kuiken_2009]"

@D ctl_osseo := "osseointegrated skeletal attachment (Brånemark family / OPRA)" :: mechanism [ok]
  procedure = "A titanium implant is anchored directly into the residual long-bone medullary canal; a percutaneous abutment extends through the skin and the prosthesis attaches mechanically to that abutment — replacing the conventional socket interface."
  rationale = "Eliminates socket-related pain, skin breakdown, perspiration and donning issues; provides osseoperception (transmitted vibrotactile feedback through bone) and improved load-coupling efficiency. Critical for users who cannot tolerate a socket and for very short residual limbs."
  evidence = "Branemark and successors developed osseointegrated dental and limb-prosthetic attachment; the OPRA (Osseointegrated Prostheses for the Rehabilitation of Amputees) system and later e-OPRA variants have published case series and cohort outcomes from European/Australian groups (primary-authors/era cited — see [@x_branemark_osseo])."
  limit = "Permanent percutaneous interface = lifelong skin–implant breach: chronic superficial infection, periprosthetic loosening and (rarely) deep infection are well-documented complications ([@lim_osseo_infection]). Implant strength bounds permissible loading; falls/impacts can fracture the abutment by design (a fuse to protect the bone)."
  honesty = "Outcomes vary by amputation level (transfemoral > transhumeral well-characterized; partial-foot/hand less so), surgical center, and rigour of long-term follow-up."
  |> "[@x_branemark_osseo]"

# ─── §2 Peripheral-nerve electrode taxonomy (the selectivity/invasiveness ladder) ─

@D nerve_electrodes_taxonomy := "peripheral-nerve electrode classes" :: classification [ok]
  cuff = "Extraneural cuff (e.g. spiral, helical, FINE 'flat interface'). Sits around the nerve trunk WITHOUT penetrating epineurium. Lowest invasiveness, best chronic mechanical stability, lowest fascicular selectivity; FINE cuffs improve selectivity by gently flattening the nerve to bring fascicles closer to surface contacts."
  life = "LIFE / TIME — Longitudinal / Transverse Intrafascicular Electrodes. Thin filaments threaded longitudinally inside (LIFE) or transversely across (TIME) the nerve fascicles. Higher selectivity (closer to individual fibres) than cuffs; greater foreign-body response than cuffs but less than penetrating multi-electrode arrays. Used in landmark sensory-restoration studies ([@x_raspopovic_2014])."
  usea = "USEA — Utah Slanted Electrode Array. ~100 penetrating microelectrodes of graded length, inserted INTO the nerve. Highest spatial selectivity (many independent stimulation/recording sites within nerve cross-section); greatest acute tissue disruption; chronic-longevity wall is most acute ([@lim_chronic_electrode])."
  regenerative = "Regenerative / sieve / microchannel electrodes. Inserted between cut nerve stumps; axons regenerate through micro-holes or microchannels, each functionally addressable. Theoretical maximum selectivity (per-axon access) but requires successful regeneration through the device — chronically constrained by axonal die-back and channel fibrosis."
  flexible = "High-density flexible / polymer arrays (parylene, polyimide, PDMS). Lower mechanical mismatch with nerve tissue → reduced fibrotic encapsulation in principle; chronic-stability evidence still maturing."
  trade-off = "An ordering exists along the invasiveness ↔ selectivity axis: cuff < LIFE/TIME < USEA < regenerative; chronic-stability ordering is roughly reversed. No present electrode wins on all three of selectivity, longevity and low invasiveness simultaneously — this is the structural reason for [@lim_selectivity_stability_tradeoff]."
  honesty = "Class boundaries are fuzzy; many published electrodes are hybrids. Counts of contacts/channels are device-specific and not lattice values."
  |> "[@x_raspopovic_2014] · [@x_tan_2014]"

# ─── §3 Sensory feedback (closing the loop) ───────────────────────────

@D ctl_sensory_intraneural := "intraneural microstimulation for sensory restoration" :: mechanism [ok]
  approach = "Electrically stimulate sensory afferents in the residual peripheral nerve via implanted intraneural electrodes (LIFE/TIME/USEA). Modulating stimulation parameters (charge per pulse, pulse-width, frequency, contact location) elicits graded percepts that map to specific locations on the phantom hand/foot."
  landmark-raspopovic = "Raspopovic et al. (Sci Transl Med 2014) implanted TIME intraneural electrodes in the median and ulnar nerves of a transradial amputee; intraneural microstimulation elicited graded, location-specific touch percepts that the participant used in REAL-TIME closed-loop control to discriminate object shape and stiffness — the first demonstration of bidirectional intraneural-nerve neuroprosthesis in a human ([@x_raspopovic_2014])."
  landmark-tan = "Tan et al. (Sci Transl Med 2014) used chronic FINE cuff electrodes in transradial amputees and demonstrated stable, modality-discriminable touch percepts over many months, including 'natural' (non-paresthetic) sensations with patterned stimulation ([@x_tan_2014])."
  micera-group = "Subsequent work by Micera, Cipriani, Carpaneto, Petrini, Valle and collaborators (Italian/EPFL prosthetics groups) extended bidirectional intraneural prosthetics to longer-term home-use trials, with reports of reduced phantom-limb pain and improved embodiment alongside object-recognition gains (primary-authors/era cited — see [@x_micera_group])."
  modality-coverage = "Restored percepts cover a SUBSET of native afferent richness: touch (and to a lesser extent pressure / vibration / 'feel of contact') is the most reliably restored channel; full proprioception, fine temperature, and the integrated 'natural skin' sensorium remain only partially recovered (see [@lim_sensory_coverage])."
  honesty = "Percept quality, stability and naturalness are subject- and protocol-specific; figures are not lattice-derived."
  |> "[@x_raspopovic_2014] · [@x_tan_2014]"

@D ctl_sensory_tsr_osseo := "non-stimulation sensory routes (TSR, osseoperception)" :: mechanism [ok]
  tsr = "Targeted Sensory Reinnervation (Kuiken / Marasco and co-workers): rerouting cut sensory nerve fascicles to denervated skin patches creates a 'remapped' sensory surface — touch on the skin patch is referred to the phantom limb. Less invasive than intraneural electrodes but lower modality fidelity and not graded by stimulation parameters."
  osseoperception = "Osseointegrated attachments transmit limb-prosthesis loading through bone, producing vibrotactile cues the user can interpret as ground/object contact ('osseoperception'). A passive, mechanical sensory channel — useful adjunct, not a substitute for active intraneural feedback."
  honesty = "TSR and osseoperception are complementary, not competitive, with intraneural microstimulation; combination is the typical real-world approach."

# ─── §4 Mechanical / actuation hand & leg designs ─────────────────────

@D act_hand_designs := "powered prosthetic hands (commercial / research)" :: domain [ok]
  examples = "Active multi-articulated hands (e.g. i-Limb / Össur, Bebionic, Michelangelo, Vincent / modular Vincent, TASKA): individually powered fingers with selectable grip patterns. Research hands (DEKA / 'Luke', Modular Prosthetic Limb / APL) push toward higher DOF and intrinsic-hand actuation."
  dof-motor-tradeoff = "More DOF → more motors → more mass / volume / battery drain. Real hands collapse this with under-actuated tendon-coupled designs (one motor drives several joints through compliant tendons) — trades exact joint independence for weight and simplicity ([@lim_weight_envelope])."
  control-binding = "Number of independently CONTROLLABLE DOF is bounded by the available control signals (sEMG class count / TMR sites / IMES channels / peripheral-nerve recording channels) — not by the number of motors. Many-DOF mechanical hands are routinely under-controlled in practice."

@D act_leg_designs := "powered & passive lower-limb prosthetics" :: domain [ok]
  passive = "Passive energy-storing feet (carbon-fibre Flex-Foot family pioneered by Van Phillips; subsequent generations) recover stored strain energy at toe-off, sufficient for walking and many sport activities; bionic ankle/knee variants add micro-controlled damping."
  powered-knees = "Microprocessor knees (e.g. C-Leg / Genium / Rheo Knee) modulate damping in real time from gait-phase sensors; reduce falls and metabolic cost of walking versus purely passive knees."
  powered-ankles = "Active powered ankles (e.g. BiOM / EmPower, Herr / MIT Media Lab group) supply net positive ankle power at push-off, restoring near-normal metabolic cost of walking for transtibial amputees in level-ground walking."
  control-source = "Lower-limb control is typically gait-cycle inferred from inertial / load sensors; direct neural control of the lower limb is an active research area (peripheral-nerve interfaces in the tibial/peroneal nerves, intracortical for above-knee paralysis)."
  honesty = "Metabolic-cost reductions reported for active ankle/knee devices are real and significant in well-controlled studies, but vary with terrain, user fitness, and amputation level."

@D act_envelopes := "force/speed/weight envelopes" :: domain [ok]
  hand-mass = "A clinically tolerated transradial-hand prosthesis mass is bounded by the residual limb's load tolerance over a full day of wear; exceeding this drives skin breakdown, fatigue and disuse — a behavioural-economic limit far more binding than peak motor force."
  force = "Powered hand grip forces in commercial devices are sufficient for most activities of daily living; lower-limb actuators must deliver biomechanically appropriate joint torques (knee, ankle) within size/mass budgets — a packaging problem, not a lattice one."
  speed = "Movement speeds are bounded by motor/transmission dynamics + safety (a fast actuator near the human body is a hazard); closed-loop control with sensory feedback (see §3) is what makes useful speeds usable."

# ─── §5 Closed-loop control: visuomotor integration, embodiment, phantom limb ─

@D loop_visuomotor := "visuomotor integration & embodiment" :: mechanism [ok]
  visual-dominance = "Without sensory feedback, users rely heavily on vision to monitor prosthesis position and grasp; this raises cognitive load and slows performance vs intact-limb control."
  embodiment = "Restoration of touch (TSR, intraneural stimulation) and proprioception consistently improves the SUBJECTIVE sense that the prosthesis is part of one's body ('embodiment'); embodiment correlates with reduced phantom-limb pain, lower abandonment rates and improved skilled use."
  phantom-mapping = "Phantom-limb percepts are stable enough that referred sensation (TSR) and intraneural-evoked percepts can be reliably mapped to phantom-hand locations and used for closed-loop control."
  honesty = "Embodiment scales (e.g. body-ownership questionnaires) are subjective psychometrics — well-validated, but distinct from objective task metrics; outcomes are reported as group means with substantial individual variance."
  |> "[@x_raspopovic_2014] · [@x_micera_group]"

@D loop_abandonment := "real-world adoption & abandonment" :: domain [ok]
  observation = "A non-trivial fraction of upper-limb prostheses are abandoned by users, with cosmetic, body-powered, and myoelectric devices each showing measurable abandonment rates in published surveys; weight, lack of sensory feedback, training time, and perceived utility relative to one-handed strategies are recurring reasons."
  consequence = "Technical capability does not equal clinical adoption; sensory feedback, reduced weight and rehabilitation support are repeatedly identified as adoption drivers — the technical roadmap is set as much by adoption barriers as by control bandwidth ([@lim_adoption])."
  honesty = "Exact abandonment rates vary widely by device class, country and study era; this tape does not assert a single number."

# ─── §6 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ───

@D lim_chronic_electrode := "chronic-electrode longevity / fibrotic encapsulation" :: real-limit [ok required]
  wall = "HARD WALL (especially for intraneural / intracortical penetrating arrays)"
  statement = "Penetrating microelectrode arrays in nerve and cortex elicit a foreign-body response: microglial/macrophage activation, astrocytic gliosis (CNS) or epineurial/perineurial fibrotic encapsulation (PNS), and progressive neuronal die-back at the electrode tip. Recording quality typically degrades over months to years; high-channel-count cortical implants frequently lose a fraction of useful channels within the first 1–2 years."
  consequence = "Lifelong, fully stable high-resolution neural recording from penetrating arrays is not currently achievable. This caps achievable control-decoder fidelity, demands periodic recalibration, and motivates ongoing work on flexible / less-invasive electrodes (see [@nerve_electrodes_taxonomy] flexible)."
  honesty = "Specific degradation rates depend on electrode chemistry, geometry, implant site and surgical technique; the wall is qualitative-direction certain, exact-rate uncertain."

@D lim_selectivity_stability_tradeoff := "selectivity ↔ chronic stability tradeoff" :: real-limit [ok required]
  wall = "SOFT WALL (engineered, not eliminable with current materials)"
  statement = "Across the peripheral-nerve electrode taxonomy, higher fascicular selectivity is achieved by closer electrode-to-axon proximity (longitudinal/transverse intrafascicular, intraneural penetrating), which simultaneously increases tissue damage, fibrotic response and rate of recording-channel loss. Cuff electrodes are the most chronically stable AND the least selective."
  consequence = "An ideal electrode that is maximally selective AND maximally chronic does not yet exist; designs choose a position on the tradeoff. Flexible polymer arrays aim to shift the frontier outward but have not yet been shown to dominate it across all use cases."
  |> "[@x_tan_2014] · [@x_raspopovic_2014]"

@D lim_nerve_regeneration := "peripheral nerve regeneration & axon-count limits" :: real-limit [ok required]
  wall = "HARD WALL (biological)"
  statement = "Cut peripheral axons regenerate at roughly 1 mm/day order in favourable conditions, with substantial dropout and target-muscle reinnervation degrading with time and distance. Regenerative / sieve electrodes depend on successful axonal regrowth through the device, and reinnervation procedures (TMR/TSR) require months and never recover the full pre-injury axon population."
  consequence = "Surgical-reinnervation strategies have an intrinsic biological time-course (months) and a never-100% reinnervation ceiling; this bounds both the achievable control bandwidth from rerouted nerves and the eventual sensory richness of TSR-mediated feedback."

@D lim_control_bandwidth := "control bandwidth ceiling (channels × decoder accuracy)" :: real-limit [ok required]
  wall = "SOFT WALL (information-theoretic, scales but bounded in practice)"
  statement = "Total usable degrees of freedom delivered through a prosthesis equal the number of independently decodable control signals multiplied by per-channel accuracy. Surface EMG plateaus at a small number of robust classes per residual-muscle group; TMR and IMES expand it; peripheral-nerve and intracortical interfaces expand it further but at the cost of invasiveness and electrode-longevity ([@lim_chronic_electrode])."
  consequence = "A many-DOF mechanical hand is routinely operated with fewer DOF than its hardware supports because the control-signal budget runs out before the actuator budget does. This is a real information-bandwidth limit, NOT a lattice value."
  honesty = "Reported lab classification accuracies (often >90% for small class counts) routinely degrade in free-living wear — a recurring gap in the literature, flagged explicitly so it is not lattice-fit."

@D lim_weight_envelope := "battery / mechanical weight envelope" :: real-limit [ok required]
  wall = "ENGINEERING / BEHAVIOURAL LIMIT"
  statement = "All-day wearable prostheses must respect a residual-limb load budget (skin, soft-tissue and bone tolerance over hours of wear). Mass-energy budget = motors + transmission + structural mass + battery; adding actuators (more DOF) or sensors (closed loop) competes directly with battery life and comfort. Carbon-fibre structural mass and brushless DC motors set most of the present floor."
  consequence = "More-capable prostheses are heavier; heavier prostheses are abandoned more (see [@lim_adoption]). There is no current path that simultaneously maximizes DOF, sensory channels, all-day battery life and comfort — designers make tradeoffs against this envelope."

@D lim_sensory_coverage := "sensory-modality coverage ceiling" :: real-limit [ok required]
  wall = "HARD WALL (biological richness)"
  statement = "Native cutaneous and proprioceptive afferent input includes mechanoreceptors with multiple submodalities (SA-I/II, RA-I/II / Pacinian; muscle spindles, Golgi tendon organs; thermoreceptors; nociceptors). Present intraneural-stimulation neuroprosthetics can elicit graded touch/pressure and a subset of vibration percepts; fine-grained proprioception, temperature discrimination, and the integrated 'natural skin' percept are only partially restored."
  consequence = "Restored sensation is a USEFUL SUBSET of native afferent richness, not a replication of it. Embodiment and object manipulation benefit even from this subset; honesty requires acknowledging that 'full sensory restoration' is not delivered by any present device."
  |> "[@x_raspopovic_2014] · [@x_tan_2014]"

@D lim_surgical_risk_access := "surgical risk, cost & access" :: real-limit [ok required]
  wall = "CLINICAL / ECONOMIC LIMIT"
  statement = "Higher-fidelity neural-prosthetic strategies (intraneural electrodes, TMR/TSR, osseointegration, intracortical BCI) require invasive surgery with the corresponding risks of bleeding, infection, nerve injury, device migration/failure and revision surgery. They also require specialized surgical teams, long rehabilitation, and (presently) high cost — access is geographically and economically constrained."
  consequence = "Even where a more advanced device is technically appropriate, the realistic ceiling on its population deployment is set by surgical / rehabilitation / economic infrastructure, not by lattice numbers."

@D lim_osseo_infection := "osseointegration infection & loosening risk" :: real-limit [ok required]
  wall = "HARD WALL (biology of a permanent percutaneous interface)"
  statement = "Direct skeletal attachment with a percutaneous abutment establishes a lifelong skin–implant breach. Superficial stoma infections occur in a non-trivial fraction of recipients and are typically managed conservatively; deep infection, periprosthetic osteolysis and aseptic loosening occur less often but can require revision or implant removal. The risk does not go to zero with present materials and protocols."
  consequence = "Osseointegration trades socket-related morbidity for percutaneous-implant morbidity; honest selection requires patient-specific risk weighting, not a universal claim of superiority."
  |> "[@x_branemark_osseo]"

@D lim_adoption := "real-world adoption & abandonment" :: real-limit [ok required]
  wall = "BEHAVIOURAL / SYSTEMS LIMIT"
  statement = "Prosthesis adoption depends on weight, training time, sensory feedback, perceived utility versus one-handed compensation strategies, cost, and rehabilitation support. Even high-DOF, high-precision devices are abandoned by a fraction of users if those non-technical factors are unfavourable."
  consequence = "The ceiling on real-world benefit is set as much by adoption as by capability; control-bandwidth gains that do not also improve weight, training or feedback often fail to translate into adoption."

@D lim_in_silico_boundary := "in-silico → wet-lab/clinical unverified boundary" :: real-limit [ok required]
  wall = "HARD WALL (epistemic — out of repo scope)"
  statement = "Hexa-bio HEXA-LIMB verifies internal consistency of a neural-prosthetic SIMULATOR + its metadata. Whether a particular control scheme, electrode design, sensory-mapping protocol or rehabilitation regime actually delivers safe, durable benefit in human users is empirically determined in clinical trials and post-market follow-up, OUT of repo scope."
  consequence = "No C2/C3 PASS in this axis is a clinical, surgical, safety, or therapeutic claim. Crossing this boundary requires regulated clinical investigation tracked outside this repo (hexa-bio AGENTS.tape g8_in_silico_only · f2 · CLOSURE_RESIDUAL_BACKLOG.md §0)."

# ─── §7 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-neural-prosthetics" :: governance [required deny:write]
  pattern = "Deriving neural-prosthetic counts / efficacy / outcomes FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's 'sopfr=5 손가락 + σ-τ=8 감각 채널 + σ·sopfr=60 kg 악력 + J₂=24h 배터리' framings asserting that finger count, sensory-channel count, grip-strength, response latency and battery life are EXACT lattice consequences."
  why = "This is exactly the violation the pre-rewrite HEXA-LIMB.tape committed (lattice-tautology stub, mass-split 153b5a2 — see HEXA-LIMB.log.tape audit). Anatomically, human hands have five fingers because of vertebrate-limb developmental biology (Hox patterning, autopod skeletogenesis), not σ−1; sensory submodality count is a property of mechanoreceptor biology; grip strength, response latency, battery life are engineering quantities set by actuator/motor/battery design and biology, NOT by n=6 invariants. hexa-bio AGENTS.tape g1/g2/g8 + f1/f2/f3 forbid lattice-fit; f1 forbids lattice-fit-on-external-entity (and here, on neural-prosthetic biology), f2 forbids in-silico→clinical claims, f3 forbids shadow-implementation of sister-repo logic (cortical-BCI decoder math lives in qmirror/hexa-meta/xeno or in the NEURO axis — never reimplemented here)."
  remedy = "Cite real neural-prosthetics / structural-neuroscience / biomechanics sources (this tape's @X entries). The lattice may only be a coincidental OBSERVATION, never the source of any prosthetics claim."
  scope-note = "This guard is the LIMB-axis instance of the cohort-wide LATTICE_POLICY enforcement (hexa-bio AGENTS.tape f1/f2/f3); it does NOT shadow qmirror/hexa-meta/xeno or NEURO-axis logic — it references, not reimplements (f3)."

@N n6_honest_stance := "neural prosthetics has no derivational n=6 invariant" :: note [required]
  text = "Stated plainly: neural-direct AI prosthetic limbs expose NO natural n=6 invariant. The human hand has five digits as a vertebrate-autopod developmental outcome (Hox-cluster patterning), not a lattice consequence; numerical equality with sopfr(6)=5 is coincidence, not cause. Cutaneous mechanoreceptor submodalities (SA-I/SA-II/RA-I/RA-II/Pacinian) plus thermal and nociceptive afferents do not enumerate to a fixed small integer — and the sensory channels delivered by present neuroprostheses are a SUBSET of native richness ([@lim_sensory_coverage]), not a complete or lattice-enumerated set. Electrode counts (Utah 96-channel; USEA ~100; LIFE/TIME small contact counts; cuff a few contacts) are device-engineering choices; grip strength, response time and battery life are set by actuator and battery design; rehabilitation timelines are set by axonal regrowth biology ([@lim_nerve_regeneration]). Per hexa-bio AGENTS.tape g1 (real-limits-first) / g2 (lattice-is-tool): the lattice is DECLINED here as a derivation tool — values may coincide by accident (observation OK) but never derive a claim. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ─── §8 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 chronic-array channel loss" :: prediction [ok]
  claim = "Chronically implanted penetrating microelectrode arrays (intracortical or intraneural USEA-class) will, on average, show a measurable decline in the count of high-SNR recording channels and in decoder accuracy over months to years of implantation, requiring periodic recalibration."
  falsifier = "A properly powered longitudinal cohort showing stable channel count and decoder accuracy from penetrating arrays over multi-year implantation with no recalibration falsifies [@lim_chronic_electrode]."
  source = "[@x_hochberg_2012] · [@x_collinger_2013]"

@D tp_2 := "TP-2 intraneural-stimulation closed-loop benefit" :: prediction [ok]
  claim = "Adding intraneural-microstimulation sensory feedback to a peripheral-nerve-controlled upper-limb prosthesis improves object-manipulation performance (e.g. shape/stiffness discrimination, grasp-force regulation) and embodiment measures relative to vision-only feedback, in suitably trained users."
  falsifier = "A within-subject crossover study with adequate power showing equal or inverted performance with vs without intraneural feedback falsifies the closed-loop premise behind [@ctl_sensory_intraneural] and weakens the rationale for [@lim_sensory_coverage] as a useful-subset claim."
  source = "[@x_raspopovic_2014] · [@x_tan_2014]"

@D tp_3 := "TP-3 TMR improves high-level upper-limb EMG control" :: prediction [ok]
  claim = "Targeted Muscle Reinnervation provides additional, more intuitive EMG control sites for shoulder-disarticulation and transhumeral amputees, yielding faster and more accurate multi-DOF prosthetic control than conventional residual-limb sEMG in trained users."
  falsifier = "A randomized comparison of TMR vs conventional EMG in high-level amputees showing no benefit, or inverted performance, falsifies the operational premise of [@ctl_tmr]."
  source = "[@x_kuiken_2009]"

# ─── §9 Cross-links (sister tapes / sister repos — reference, do NOT shadow · f3) ─

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "g1 real-limits-first · g2 lattice-is-tool · g8_in_silico_only · f1 lattice-fit-forbidden · f2 wet-lab/clinical-claim-from-in-silico forbidden · f3 no-shadow-impl-of-sister-repo. This tape complies; cortical-BCI decoder math, Lean theorems and exotic-routing remain in qmirror/hexa-meta/xeno (and the NEURO-axis cross-link) and are referenced via @X edges, never reimplemented here."

@X x_neuro_axis := "NEURO axis cross-link" :: sibling-axis [active]
  scope = "Cortical BCI / intracortical-array tissue response / motor-cortical decoder math lives in the NEURO axis. HEXA-LIMB consumes the NEURO axis's intent signal at the limb interface; it does NOT reimplement cortical-decoder internals (f3)."

@X x_closure_backlog := "CLOSURE_RESIDUAL_BACKLOG.md" :: doc [active]
  scope = "§0 in-silico-only scope boundary — clinical trial, surgical, regulatory and rehabilitation outcomes of any neural-prosthetic system are out-of-repo and unverified."

# ─── §10 External citations (real, landmark neural-prosthetics literature) ───

@X x_kuiken_2009 := "Kuiken TA et al 2009" :: literature [active]
  ref = "Kuiken TA, Li G, Lock BA, Lipschutz RD, Miller LA, Stubblefield KA, Englehart KB. Targeted muscle reinnervation for real-time myoelectric control of multifunction artificial arms. JAMA 2009;301:619–628. (TMR enables faster, more accurate multi-DOF EMG control in shoulder-disarticulation / transhumeral amputees)"

@X x_raspopovic_2014 := "Raspopovic S et al 2014" :: literature [active]
  ref = "Raspopovic S, Capogrosso M, Petrini FM, Bonizzato M, Rigosa J, Di Pino G, Carpaneto J, Controzzi M, Boretius T, Fernandez E, Granata G, Oddo CM, Citi L, Ciancio AL, Cipriani C, Carrozza MC, Jensen W, Guglielmelli E, Stieglitz T, Rossini PM, Micera S. Restoring natural sensory feedback in real-time bidirectional hand prostheses. Sci Transl Med 2014;6:222ra19. (intraneural TIME electrodes in median/ulnar nerves of a transradial amputee — graded, location-specific touch percepts, real-time closed-loop control)"

@X x_tan_2014 := "Tan DW et al 2014" :: literature [active]
  ref = "Tan DW, Schiefer MA, Keith MW, Anderson JR, Tyler J, Tyler DJ. A neural interface provides long-term stable natural touch perception. Sci Transl Med 2014;6:257ra138. (FINE cuff electrodes in transradial amputees; chronic stable modality-discriminable touch percepts including 'natural'-quality sensations via patterned stimulation)"

@X x_hochberg_2012 := "Hochberg LR et al 2012" :: literature [active]
  ref = "Hochberg LR, Bacher D, Jarosiewicz B, Masse NY, Simeral JD, Vogel J, Haddadin S, Liu J, Cash SS, van der Smagt P, Donoghue JP. Reach and grasp by people with tetraplegia using a neurally controlled robotic arm. Nature 2012;485:372–375. (intracortical BCI-driven robotic-arm reach-and-grasp in tetraplegic participants — cross-linked from the NEURO axis)"

@X x_collinger_2013 := "Collinger JL et al 2013" :: literature [active]
  ref = "Collinger JL, Wodlinger B, Downey JE, Wang W, Tyler-Kabara EC, Weber DJ, McMorland AJC, Velliste M, Boninger ML, Schwartz AB. High-performance neuroprosthetic control by an individual with tetraplegia. Lancet 2013;381:557–564. (high-DOF reach and grasp via intracortical BCI in a person with tetraplegia)"

@X x_branemark_osseo := "Brånemark and successors (osseointegration foundations)" :: literature [active]
  ref = "Brånemark PI and successors. Osseointegration of titanium implants for direct skeletal attachment was established in the dental implant literature from the 1960s and extended to limb prosthetics (OPRA / e-OPRA, transfemoral and transhumeral) by Brånemark R and collaborators (Sahlgrenska, Gothenburg) and subsequent European/Australian groups. Primary-authors/era cited; exact title/volume/page not asserted — figures and complication rates paraphrased from the cumulative case-series and cohort literature, not re-derived."

@X x_micera_group := "Micera S, Cipriani C, Carpaneto J, Petrini FM, Valle G and collaborators (intraneural prosthetics, 2010s–2020s)" :: literature [active]
  ref = "Micera S, Cipriani C, Carpaneto J, Petrini FM, Valle G and collaborators (SSSA Pisa / EPFL groups). Subsequent bidirectional intraneural prosthetics work extending [@x_raspopovic_2014] to longer-term and home-use settings, with reports of reduced phantom-limb pain and improved embodiment alongside object-recognition. Primary-authors/era cited; exact paper-by-paper volume/page not asserted — readers should consult the group's primary publications directly."
