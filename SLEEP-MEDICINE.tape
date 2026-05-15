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
# SLEEP-MEDICINE.tape — architecture-current (editable per v1.2)
# Event history → SLEEP-MEDICINE.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "sleep-medicine" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · sleep science + clinical sleep medicine in-silico knowledge SSOT"
  brief = "Sleep science + clinical sleep medicine · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "SLEEP-MEDICINE.log.tape"
  scope = "in-silico sleep-medicine knowledge SSOT · NOT clinical advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see SLEEP-MEDICINE.log.tape audit"

@N scope_disclaimer := "clinical-scope honesty" :: note [required]
  text = "This tape is an evidence-summary knowledge SSOT for an in-silico sleep-medicine substrate. Diagnostic thresholds, drug names, device parameters, scoring rules and epidemiologic figures are paraphrased from published sleep-medicine literature and institutional manuals for modeling context only — they are NOT diagnostic guidance, NOT a prescribing protocol, NOT a sleep-study report. Real sleep complaints (excessive sleepiness, suspected sleep apnea, narcolepsy, chronic insomnia, parasomnias) require a licensed clinician and, where indicated, polysomnography. All claims here are in-silico simulator/metadata consistency only; the wet-lab → preclinical → clinical → regulatory boundary is explicitly out of scope (hexa-bio AGENTS.tape g8 / f2)."

# ── §1 What sleep is — architecture & physiology ──────────────────────

@D dx_definition := "what sleep is" :: domain [ok]
  defn = "Sleep is a reversible, regulated state of reduced consciousness and responsiveness with characteristic, stage-specific neural, autonomic and motor signatures — distinct from coma, sedation and quiet wakefulness."
  not-one-state = "Sleep is NOT a single homogeneous state: it alternates between non-REM (NREM) and REM (rapid-eye-movement) sleep across the night."
  why-it-matters = "The macro-architecture of sleep (stages, cycles, REM/NREM ratios) is what polysomnography measures and what disorders disturb; treating sleep as a single block obscures the relevant pathophysiology."
  honesty = "Sleep is a domain of active research; the FUNCTION of sleep (why animals do it) is not fully closed science — multiple non-exclusive hypotheses coexist (see [@dx_functions])."

@D dx_architecture := "NREM / REM stages & cycles" :: mechanism [ok]
  rem-discovery = "REM sleep — the 'paradoxical' state with low-voltage fast EEG resembling waking but with skeletal-muscle atonia and rapid eye movements — was identified by Aserinsky & Kleitman (1953) in infants and adults; this is the founding observation of modern sleep architecture."
  nrem-rem-cycle = "Sleep alternates between NREM and REM in cycles on the order of roughly 90 minutes in adults; cycle length and REM fraction shift across the night (more slow-wave sleep early, more REM late)."
  nrem-stages = "Modern AASM scoring partitions NREM into N1 (drowsy transition, mixed alpha/theta), N2 (sleep spindles, K-complexes), and N3 (slow-wave sleep, dominant delta) — N3 corresponds to the older Rechtschaffen & Kales stages 3 and 4 collapsed."
  rem-features = "REM: low-voltage desynchronized EEG, phasic rapid eye movements, REM-atonia of postural muscles (active brainstem inhibition), autonomic variability, vivid narrative dreaming predominantly reported on REM awakenings."
  scoring-tool = "Stages are scored in 30-second epochs from polysomnography per AASM rules — institutional scoring guidance, not a derived n-tuple."
  |> "[@x_aserinsky_kleitman_1953] · [@x_aasm_scoring_manual]"

@D dx_psg := "polysomnography (PSG)" :: mechanism [ok]
  channels = "Standard PSG combines EEG (cortical state), EOG (eye movements — REM detection), submental EMG (muscle tone — REM atonia, arousals), ECG, airflow, respiratory effort (thoracic/abdominal belts), pulse oximetry (SpO2), and limb EMG; expanded montages add video, capnography, esophageal pressure."
  montage-choice = "EEG channels follow the 10–20 placement convention; the exact derivation set is a clinical choice within AASM guidance, NOT a lattice-derived channel count."
  scoring = "Epoch-by-epoch scoring of stage + respiratory events + arousals + leg movements yields the hypnogram and event indices (AHI, PLMI, arousal index) that drive diagnosis."
  honesty = "Home sleep apnea tests (limited-channel) are a valid clinical screening tool for suspected moderate-severe OSA but do NOT score sleep stages and are NOT equivalent to attended PSG."
  |> "[@x_aasm_scoring_manual]"

@D dx_functions := "candidate functions of sleep (active research)" :: mechanism [ok]
  memory-consolidation = "Sleep — especially slow-wave sleep for declarative material and REM/sleep-overall for procedural and emotional content — is associated with offline memory consolidation; the Stickgold / Walker era of human cognitive studies established robust behavioural sleep × memory dependencies."
  synaptic-homeostasis = "Synaptic Homeostasis Hypothesis (SHY, Tononi & Cirelli) proposes that wake-related net synaptic potentiation is renormalised by sleep (preferentially slow-wave sleep), supporting next-day plasticity capacity — a leading but actively debated framework."
  glymphatic-clearance = "Xie et al (2013) reported expanded interstitial space and enhanced clearance of solutes including amyloid-β in sleeping mouse brain via a 'glymphatic' system — a landmark paper that is also actively debated and not yet a settled mechanism in humans."
  energy-metabolism = "Other hypotheses (whole-organism energy conservation, immune/inflammatory regulation, developmental brain maturation) coexist; the function of sleep is best treated as multiply-constrained, NOT closed to a single mechanism."
  honesty = "These are non-exclusive working hypotheses with varying evidence grade; this tape paraphrases the landmark sources without asserting any single 'function of sleep' as established."
  |> "[@x_xie_2013] · [@x_tononi_cirelli_2014]"

# ── §2 Circadian regulation — the molecular & systems clock ───────────

@D circ_molecular_clock := "molecular circadian clock (per / tim / cry / Clock / Bmal1)" :: mechanism [ok]
  konopka-benzer = "Konopka & Benzer (1971) isolated Drosophila mutants with altered circadian period and mapped them to a single gene, period (per) — the first demonstration that a single gene controls circadian behaviour and the conceptual founding of molecular chronobiology."
  feedback-loops = "The eukaryotic clock is built on transcription-translation negative-feedback loops: in Drosophila per/tim products feed back to repress their own transcription via the CLK/CYC transcription factors; in mammals the homologous loop involves PER1-3 / CRY1-2 repressing CLOCK/BMAL1, with secondary stabilising loops (REV-ERB / ROR · NR1D1 / NR1D2)."
  nobel-2017 = "Hall, Rosbash and Young shared the 2017 Nobel Prize in Physiology or Medicine for elucidating molecular mechanisms controlling the circadian clock — the canonical recognition of this body of work."
  cell-autonomous = "Most mammalian cells carry a cell-autonomous circadian oscillator; peripheral oscillators are synchronised by the master pacemaker in the suprachiasmatic nucleus (SCN)."
  |> "[@x_konopka_benzer_1971] · [@x_nobel_2017_chronobiology]"

@D circ_scn_pacemaker := "suprachiasmatic nucleus (SCN) as master pacemaker" :: mechanism [ok]
  what = "The SCN, a paired hypothalamic nucleus above the optic chiasm, is the principal mammalian circadian pacemaker; lesion abolishes free-running behavioural rhythms and SCN tissue maintains rhythmicity in vitro."
  light-entrainment = "Light is the dominant zeitgeber (entraining signal). Intrinsically-photosensitive retinal ganglion cells (ipRGCs) expressing melanopsin signal ambient light to the SCN via the retinohypothalamic tract; phase-response curves to light underpin therapeutic light timing for jet-lag and shift-work."
  efferents = "The SCN drives downstream rhythms in core body temperature, cortisol, autonomic tone and pineal melatonin secretion."

@D circ_melatonin := "melatonin (pineal hormone)" :: mechanism [ok]
  isolation = "Melatonin was isolated and named in the late 1950s (Lerner and colleagues) from bovine pineal extracts as a skin-lightening factor; its role as the night-secreted pineal hormone gating sleep/wake timing was elaborated subsequently."
  secretion = "Pineal melatonin secretion is night-locked (high during the biological night, low in daytime) under SCN control; bright light at night suppresses it."
  therapeutic-axis = "Exogenous melatonin and melatonin-receptor agonists (e.g. ramelteon — MT1/MT2 agonist) are used for circadian phase-shifting (jet lag, delayed sleep-wake phase) and sleep-initiation; effect size for chronic insomnia is modest and dose-/timing-sensitive."
  honesty = "Melatonin is widely sold over-the-counter in some jurisdictions and prescription-only in others; product-strength variability has been documented, and 'sleep aid' framing oversells its hypnotic potency."
  |> "[@x_lerner_1958]"

@D circ_two_process := "Borbély two-process model (S × C)" :: mechanism [ok]
  process-s = "Process S: a homeostatic sleep drive that accumulates monotonically during wake and dissipates during sleep — empirically tracked by EEG slow-wave activity (delta power) early in NREM."
  process-c = "Process C: a circadian alerting signal driven by the SCN, roughly sinusoidal across 24 h, largely independent of prior sleep amount."
  interaction = "Their combination predicts when sleep occurs and how consolidated it is; misalignment (e.g. shift work, jet lag) appears as a mismatch between S and C drives."
  utility = "The two-process model remains the workhorse conceptual framework for sleep regulation across the field — referenced repeatedly in chronobiology and clinical sleep medicine."
  |> "[@x_borbely_1982]"

@D circ_short_sleeper := "short-sleeper genetic variants (DEC2 / ADRB1)" :: mechanism [ok]
  what = "Familial natural short sleep — habitual sleep durations well below population norms without measurable next-day deficits — has been linked to rare coding variants, including DEC2 (BHLHE41) and ADRB1, in pedigrees studied by the Ying-Hui Fu / Louis Ptáček group and collaborators (publications from the 2009 DEC2 paper era onward through later ADRB1 and other loci)."
  implication = "Total sleep need has a strong heritable component with multiple loci; population recommendations are RANGES, not a single physiological constant."
  honesty = "Short-sleeper variants are RARE; presence does NOT license self-diagnosed short-sleeper status, and the published cases are well-characterised families, not casual reporters of low sleep. Primary-author/era cited rather than asserting volume/page."
  |> "[@x_dec2_short_sleeper_he_2009] · [@x_adrb1_short_sleeper_2019]"

# ── §3 Sleep duration epidemiology & individual variation ─────────────

@D epi_duration := "adult sleep duration" :: domain [ok]
  range = "Mainstream adult recommendations cluster around roughly 7–9 hours per night (institutional consensus statements, including those from the American Academy of Sleep Medicine and the Sleep Research Society); these are population recommendations and not a clinically diagnostic threshold for any individual."
  variation = "Individual sleep need varies substantially; some adults are habitual short sleepers without measurable deficits (see [@circ_short_sleeper]), most are not."
  age-effect = "Total sleep, slow-wave sleep fraction, sleep continuity and chronotype shift across the lifespan: infants/children sleep more; slow-wave sleep declines with age; older adults more frequently report fragmented sleep and earlier chronotype."
  honesty = "Population duration figures are SURVEILLANCE estimates with method- and country-dependence; no exact lattice-derived constant. Self-reported sleep generally overestimates actigraphy- or PSG-measured sleep."
  |> "[@x_aasm_srs_duration_consensus]"

@D epi_chronotype := "chronotype & individual phase" :: domain [ok]
  morningness-eveningness = "Preferred sleep timing varies across the population on a morning-evening axis (Horne & Östberg MEQ era questionnaires; later Munich Chronotype Questionnaire); chronotype is partly heritable and shifts with age."
  social-jetlag = "'Social jet lag' — chronic phase mismatch between biological and socially imposed sleep windows — is associated with cardiometabolic and mood correlates in epidemiologic studies; causality vs association is still debated."

# ── §4 Sleep disorders — clinical landscape ───────────────────────────

@D disorder_osa := "obstructive sleep apnea (OSA)" :: disorder [ok]
  defn = "Repetitive upper-airway collapse during sleep causing apneas (cessation) and hypopneas (partial reduction) with desaturation and arousal; quantified per hour of sleep as the apnea–hypopnea index (AHI)."
  cpap-origin = "Sullivan et al (1981) reported reversal of obstructive sleep apnea by continuous positive airway pressure (CPAP) delivered via a nasal mask — the founding clinical demonstration of CPAP therapy and the basis of standard OSA care."
  burden = "OSA is common in adult populations and substantially underdiagnosed; prevalence estimates depend on AHI threshold, equipment, population age/sex/BMI distribution and screening reach — these are RANGES, not lattice-derived constants."
  comorbidity = "OSA is associated with daytime sleepiness, motor-vehicle accident risk, hypertension and cardiovascular morbidity; causality and the size of CPAP's effect on hard cardiovascular endpoints in non-sleepy populations remains an active debate (SAVE 2016 era trials)."
  therapy = "First-line: CPAP / APAP / BiPAP. Adjuncts/alternatives: mandibular advancement devices, positional therapy, weight loss / metabolic intervention, hypoglossal nerve stimulation for selected patients, upper-airway surgery in selected anatomy."
  |> "[@x_sullivan_1981]"

@D disorder_insomnia := "insomnia disorder" :: disorder [ok]
  defn = "Chronic insomnia disorder is defined in DSM-5 and ICSD-3 by persistent difficulty initiating or maintaining sleep (or non-restorative sleep) with daytime consequences, occurring on multiple nights per week for an extended duration, not better accounted for by another disorder. Acute insomnia (situational) is a separate category."
  first-line = "Cognitive Behavioural Therapy for Insomnia (CBT-I) — combining stimulus control, sleep restriction, cognitive restructuring and sleep-hygiene education — is the recommended first-line treatment in major guidelines (AASM and others), with durable effects often comparable to or exceeding hypnotic pharmacotherapy."
  pharmacotherapy = "When pharmacotherapy is used: benzodiazepine-receptor agonists ('Z-drugs' — zolpidem, eszopiclone, zaleplon); melatonin-receptor agonists (ramelteon); dual orexin-receptor antagonists / DORAs (suvorexant, lemborexant, daridorexant); low-dose sedating antidepressants in selected patients (e.g. doxepin). Each class has its own efficacy / next-day-impairment / tolerance / dependence profile."
  honesty = "Pharmacotherapy is generally adjunctive or short-term; CBT-I is the durable foundation. Drug selection is individualised; this tape lists classes, not prescribing rules."
  |> "[@x_icsd3] · [@x_cbti_aasm_guideline]"

@D disorder_narcolepsy := "narcolepsy (orexin / hypocretin deficiency)" :: disorder [ok]
  defn = "Narcolepsy is characterised by excessive daytime sleepiness with abnormally rapid transitions into REM sleep; type 1 (narcolepsy with cataplexy) is defined by loss of hypocretin (orexin) signalling, typically reflected as undetectable CSF hypocretin-1."
  hypocretin-discovery = "In 1999 two landmark Cell papers converged on the orexin/hypocretin system as the central narcolepsy axis: Lin & Mignot et al identified mutations in the hypocretin receptor 2 gene in canine narcolepsy, and Chemelli et al independently showed that prepro-orexin knockout mice exhibit a narcolepsy phenotype — together establishing hypocretin loss-of-function as a sufficient cause of narcolepsy."
  human-mechanism = "Most human type-1 narcolepsy involves selective loss of the lateral-hypothalamic hypocretin neurons; an autoimmune mechanism is suspected (HLA-DQB1*06:02 association, post-H1N1 / post-Pandemrix-era pharmacovigilance signals), though the precise effector mechanism is still being characterised."
  therapy = "Symptomatic: wake-promoting agents (modafinil, armodafinil, solriamfetol, pitolisant — H3 inverse agonist); sodium oxybate / mixed-oxybate for cataplexy and consolidation; antidepressants for cataplexy. Hypocretin-receptor-agonist development is an active investigational field."
  |> "[@x_lin_mignot_1999] · [@x_chemelli_1999]"

@D disorder_rbd := "REM-sleep behaviour disorder (RBD)" :: disorder [ok]
  defn = "RBD is loss of normal REM atonia with motor enactment of dream content (kicking, punching, vocalising) during REM sleep, confirmed by PSG showing REM without atonia and a corresponding history."
  prodromal-marker = "Isolated (idiopathic) RBD is a clinically important prodromal marker of α-synucleinopathy: a substantial proportion of patients with confirmed idiopathic RBD subsequently develop Parkinson's disease, dementia with Lewy bodies, or multiple system atrophy over years of follow-up, making RBD one of the earliest accessible clinical markers of these disorders."
  management = "Bedroom safety (padded environment, partner separation if needed); clonazepam and melatonin are commonly used pharmacologic options; counselling about the prodromal-marker meaning is now standard practice."
  honesty = "RBD is distinct from NREM parasomnias (sleepwalking, sleep terrors), which arise from incomplete arousal out of slow-wave sleep and lack the REM-without-atonia signature; conflating them is a common diagnostic error."

@D disorder_parasomnias := "NREM parasomnias (sleepwalking · sleep terrors · confusional arousals)" :: disorder [ok]
  defn = "NREM parasomnias are partial-arousal events from slow-wave sleep with dissociated cortical/subcortical state (motor behaviour without full awareness or recall); common in children and decreasing with age, but persistent or new-onset adult cases warrant evaluation."
  precipitants = "Sleep deprivation, alcohol, fever, certain medications (including some sedative-hypnotics), and stress increase event frequency."
  management = "Most paediatric cases are self-limiting; adult-onset or injurious episodes warrant clinical workup and treatment of precipitants; behavioural safety measures take priority over routine pharmacotherapy."

@D disorder_rls_plms := "restless legs syndrome (RLS) & periodic limb movements (PLMS)" :: disorder [ok]
  rls = "RLS (Willis-Ekbom disease) is a sensorimotor disorder of an urge to move the legs, worsened by rest, relieved by movement, worse in the evening; diagnosis is clinical (essential URGE criteria)."
  plms = "Periodic limb movements during sleep are stereotyped, repetitive limb movements scored on PSG; they co-occur with RLS but are not synonymous and can occur asymptomatically."
  workup = "Iron status (ferritin) is part of standard RLS workup; iron repletion is first-line where deficient. Dopamine agonists are effective but carry an augmentation-syndrome risk on long-term use; α-2-δ ligands (gabapentin enacarbil, pregabalin) are alternative first-line agents in many guidelines."

@D disorder_circadian := "circadian rhythm sleep-wake disorders (jet lag · shift-work · DSWPD / ASWPD)" :: disorder [ok]
  jet-lag = "Jet-lag disorder follows rapid transmeridian travel; entrainment of the central pacemaker proceeds at an empirical pace on the order of about one time-zone per day (eastward travel is usually slower to adapt than westward), making rapid multi-time-zone shifts the longest to resolve."
  shift-work = "Shift-work disorder follows sustained non-day work schedules with sleep/wake at biological-night times; cumulative health correlates (cardiometabolic, mood, possible carcinogenicity classification of certain shift patterns by IARC) are an active epidemiologic literature."
  intrinsic = "Intrinsic circadian phase disorders include Delayed Sleep-Wake Phase Disorder (DSWPD — habitual late phase) and Advanced Sleep-Wake Phase Disorder (ASWPD — habitual early phase); management uses timed light exposure, timed melatonin, behavioural scheduling."

# ── §5 Sleep functions, memory & glymphatic clearance (active research) ─

@D fn_memory_consolidation := "sleep-dependent memory consolidation" :: mechanism [ok]
  declarative = "Slow-wave sleep is associated with consolidation of hippocampus-dependent declarative memory; behavioural and neuroimaging human studies repeatedly demonstrate sleep × memory benefits over equivalent wake intervals."
  procedural = "REM and overall sleep are associated with procedural and emotional memory consolidation; the partition is not strict, and the Stickgold / Walker era literature spans both classes."
  honesty = "Sleep-dependent consolidation is robust as a behavioural effect; the underlying mechanistic chain (replay, spindle-ripple coupling, neuromodulator gating) is an active research front, not a closed mechanism."

@D fn_synaptic_homeostasis := "Synaptic Homeostasis Hypothesis (SHY)" :: mechanism [ok]
  claim = "Tononi & Cirelli propose that net synaptic potentiation accumulates during wake and is renormalised, with selective preservation of salient circuits, during sleep — particularly slow-wave sleep — preserving learning capacity and energy budget."
  evidence-grade = "SHY draws on EEG slow-wave activity dynamics, molecular/structural correlates of synaptic strength across wake/sleep in rodents and flies, and converging human EEG evidence; framework-grade, with continuing critique and refinement."
  honesty = "SHY is one of the leading current hypotheses, NOT a closed mechanistic theorem; presented as such."
  |> "[@x_tononi_cirelli_2014]"

@D fn_glymphatic := "glymphatic clearance during sleep" :: mechanism [ok]
  claim = "Xie et al (2013) reported that during sleep in mice the interstitial space expands and CSF–ISF exchange increases, accelerating clearance of solutes including amyloid-β; this is the 'glymphatic' system in its sleep-coupled formulation."
  status = "Landmark paper of the past decade in sleep biology; subsequent literature has both built on and challenged the formulation (e.g. methodological critiques, alternative interpretations of the imaging signal, debate about magnitude and human translation). Treat as influential framework still under active validation, NOT as settled mechanism."
  |> "[@x_xie_2013]"

# ── §6 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_individual_need_variation := "individual sleep-need variation (heritable)" :: real-limit [ok required]
  wall = "HARD WALL (biological)"
  statement = "Total sleep need is heritable and varies meaningfully across individuals; rare coding variants (e.g. DEC2 / BHLHE41, ADRB1) produce robust natural short sleep without measurable deficits in well-characterised pedigrees. There is NO single physiologically optimal sleep duration that applies uniformly; population recommendations are ranges that envelope most — not all — adults."
  consequence = "Any sleep claim of the form 'every adult needs exactly X hours' is biologically wrong. Clinical sleep duration assessment is individualised against the patient's daytime function, not a universal constant."
  |> "[@x_dec2_short_sleeper_he_2009] · [@x_adrb1_short_sleeper_2019]"

@D lim_osa_cv_residual := "OSA cardiovascular sequelae despite CPAP (adherence + residual risk)" :: real-limit [ok required]
  wall = "SOFT WALL (treatment-ceiling, multi-factorial)"
  statement = "CPAP is the most effective therapy for moderate-severe OSA on AHI, sleepiness and quality-of-life outcomes; its effect on hard cardiovascular endpoints in less-sleepy populations is more modest than early observational data suggested, and is co-bounded by imperfect long-term adherence (CPAP usage hours per night, drop-off over time) and by the multifactorial nature of cardiovascular disease in OSA patients (shared metabolic, vascular and lifestyle risk)."
  consequence = "Even with CPAP, cardiovascular risk in chronic OSA is not driven to baseline. Honest framing distinguishes symptom benefit (which is large in adherent users) from population-level cardiovascular benefit (which is real but not unlimited, and not equivalent to abolishing OSA's cardiovascular risk)."
  |> "[@x_sullivan_1981]"

@D lim_insomnia_chronification := "insomnia chronification against single-modality therapy" :: real-limit [ok required]
  wall = "HARD WALL (clinical)"
  statement = "Chronic insomnia disorder rarely yields durably to single-modality therapy. Hypnotics typically produce short-term sleep-onset / continuity improvement bounded by tolerance, dependence and next-day-impairment trade-offs; CBT-I is the most durable single intervention but is bounded by access, time investment and clinician availability. Combined / stepped-care approaches address the limits of monotherapy."
  consequence = "Insomnia treated as 'just give a sleeping pill' under-performs against the natural history of chronic insomnia disorder; the real-world ceiling on outcomes is set by modality combination, behavioural adherence and ongoing access to care, NOT by drug potency."
  |> "[@x_cbti_aasm_guideline]"

@D lim_jet_lag_kinetics := "jet-lag adaptation kinetics" :: real-limit [ok required]
  wall = "SOFT WALL (chronobiologic kinetics)"
  statement = "Resynchronisation of the central circadian pacemaker after rapid transmeridian travel proceeds at an empirical pace on the order of about one time-zone per day, with directionality asymmetry (eastward generally slower than westward); timed bright-light exposure and timed exogenous melatonin can hasten adaptation but cannot collapse it to near-zero."
  consequence = "Multi-time-zone east-bound travel produces several days of biologically expected misalignment; 'instant jet-lag cures' are over-claim. The relevant constant is a biological kinetic, NOT a lattice number."

@D lim_shift_work_misalignment := "shift-work cumulative circadian misalignment" :: real-limit [ok required]
  wall = "HARD WALL (epidemiologic / biologic)"
  statement = "Chronic shift-work — particularly rotating night-shift patterns — produces sustained misalignment between the central circadian pacemaker, peripheral oscillators and behavioural sleep/wake. Epidemiologic literature associates such patterns with elevated cardiometabolic risk, mood disturbance and sleep-quality decrement; certain shift-work patterns have been the subject of IARC carcinogenicity classification activity (the precise grade and scope have been revised — institutional, not lattice-derived)."
  consequence = "No within-job 'sleep hygiene' is enough to fully neutralise the cumulative misalignment of chronic biological-night work; the constraint is structural to the schedule, and population-level mitigation requires organisational design as well as individual countermeasures."

@D lim_psg_burden := "diagnostic burden (PSG vs home testing)" :: real-limit [ok required]
  wall = "PRACTICAL / RESOURCE LIMIT"
  statement = "Attended polysomnography is the diagnostic reference for sleep-disorder evaluation but is resource-intensive (technologist time, dedicated lab, scoring workload); home sleep apnea testing widens access for suspected moderate-severe OSA but does NOT score sleep stages, parasomnias, REM-atonia loss or many central events. There is no test-of-everything-at-home."
  consequence = "Diagnostic strategy is a structured choice (history → screening → home test where appropriate → PSG where indicated), bounded by access and disease pretest probability, NOT a single all-purpose device."

# ── §7 n=6 lattice stance (HONEST — observation, not derivation) ──────

@F f_lattice_fit := "lattice-fit-on-sleep-medicine" :: governance [required deny:write]
  pattern = "Deriving sleep architecture / disorder / efficacy / duration counts FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's 'AASM 6-stage staging', '~6 sleep cycles per full night', 'PSG 12-channel EEG = σ(6)=12'. AASM actually scores 5 stages (W, N1, N2, N3, REM); typical nights show on the order of 4–6 NREM/REM cycles depending on sleep duration and architecture, not exactly six; PSG channel counts are clinical-montage choices, not σ(6)."
  why = "Sleep medicine exposes NO natural n=6 invariant. The deleted stub fabricated stage counts and channel-count equalities by reading off lattice tokens — a direct hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3 violation. f1 forbids lattice-fit, f2 forbids in-silico→clinical claims, f3 forbids shadow re-derivation of sister-substrate facts."
  remedy = "Cite real sleep-medicine sources (this tape's @X entries). The lattice may only be a coincidental OBSERVATION, never a derivation source for any sleep-stage count, channel count, cycle count, duration recommendation, drug efficacy or disorder prevalence."

@N n6_honest_stance := "sleep medicine has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: sleep science and clinical sleep medicine expose NO natural n=6 invariant. AASM scoring uses 5 stages (Wake, N1, N2, N3, REM), with the older Rechtschaffen & Kales system having 4 NREM stages — neither equals 6. NREM/REM cycle counts across a typical adult night are a range on the order of 4–6, depending on sleep duration and architecture, NOT exactly six. PSG channel counts are clinical-montage choices (EEG derivations following 10-20 placement, plus EOG / EMG / ECG / respiratory / SpO2 / limb-EMG / video) — engineering choices, NOT σ(6)=12. Adult sleep-duration recommendations cluster around a 7–9 h range — a population guideline, NOT a lattice constant. Per LATTICE_POLICY g1/g2 + lattice-as-tool: the lattice is DECLINED here as a derivation tool. Coincidences may be observed; nothing in this tape is derived from them. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ── §8 Verifiable predictions (real, falsifiable — NOT lattice) ───────

@D tp_1 := "TP-1 CPAP symptom benefit > hard-CV-endpoint benefit" :: prediction [ok]
  claim = "In adherent users with moderate-severe OSA, CPAP produces a large symptomatic / quality-of-life / sleepiness improvement; its effect on hard cardiovascular endpoints in less-sleepy populations is more modest than early observational data suggested. The two effect sizes are NOT interchangeable."
  falsifier = "If properly powered, adherent-population, non-sleepy-OSA RCTs showed CPAP reducing hard CV events at a magnitude matching the symptom-domain effect size, [@lim_osa_cv_residual] would be wrong."
  source = "[@x_sullivan_1981]"

@D tp_2 := "TP-2 CBT-I durability vs hypnotic monotherapy" :: prediction [ok]
  claim = "For chronic insomnia disorder, CBT-I produces sleep-continuity improvements that are durable beyond cessation of active treatment, whereas hypnotic monotherapy benefit attenuates after discontinuation; head-to-head and follow-up evidence favours CBT-I as the more durable single modality."
  falsifier = "If properly powered, long-follow-up RCTs showed equal or superior post-treatment durability of hypnotic monotherapy vs CBT-I, [@lim_insomnia_chronification] would be wrong."
  source = "[@x_cbti_aasm_guideline]"

@D tp_3 := "TP-3 jet-lag adaptation rate is bounded" :: prediction [ok]
  claim = "After rapid transmeridian travel, central-circadian resynchronisation proceeds at an empirical pace on the order of about one time-zone per day with eastward/westward asymmetry; timed-light and timed-melatonin protocols hasten it modestly but do NOT collapse it to near-instant."
  falsifier = "If a properly designed crossover study demonstrated routine, near-instant (<24 h) full circadian resynchronisation after multi-time-zone eastward travel by any intervention, [@lim_jet_lag_kinetics] would be wrong."

# ── §9 External citations (real, landmark literature) ─────────────────

@X x_aserinsky_kleitman_1953 := "Aserinsky E, Kleitman N 1953" :: literature [active]
  ref = "Aserinsky E, Kleitman N. Regularly occurring periods of eye motility, and concomitant phenomena, during sleep. Science 1953;118:273–274. (discovery of REM sleep)"

@X x_konopka_benzer_1971 := "Konopka RJ, Benzer S 1971" :: literature [active]
  ref = "Konopka RJ, Benzer S. Clock mutants of Drosophila melanogaster. Proc Natl Acad Sci USA 1971;68:2112–2116. (period gene — founding of molecular chronobiology)"

@X x_borbely_1982 := "Borbély AA 1982" :: literature [active]
  ref = "Borbély AA. A two process model of sleep regulation. Hum Neurobiol 1982;1:195–204. (process S × process C)"

@X x_sullivan_1981 := "Sullivan CE et al 1981" :: literature [active]
  ref = "Sullivan CE, Issa FG, Berthon-Jones M, Eves L. Reversal of obstructive sleep apnoea by continuous positive airway pressure applied through the nares. Lancet 1981;1:862–865. (CPAP origin)"

@X x_xie_2013 := "Xie L et al 2013" :: literature [active]
  ref = "Xie L et al. Sleep drives metabolite clearance from the adult brain. Science 2013;342:373–377. (glymphatic clearance during sleep — landmark; actively debated)"

@X x_nobel_2017_chronobiology := "Nobel Prize 2017 — Hall, Rosbash, Young" :: literature [active]
  ref = "The Nobel Prize in Physiology or Medicine 2017 was awarded jointly to Jeffrey C. Hall, Michael Rosbash and Michael W. Young 'for their discoveries of molecular mechanisms controlling the circadian rhythm.' Cited as institutional recognition of the per/tim/cry/Clock/Bmal1 feedback-loop body of work; primary-author/era only, no single paper asserted here."

@X x_lerner_1958 := "Lerner AB et al 1958-era" :: literature [active]
  ref = "Lerner AB and colleagues. Isolation of melatonin from bovine pineal tissue (late-1950s era, including J Am Chem Soc 1958 isolation report). Primary-author/era cited as the founding isolation of melatonin; exact volume/page paraphrased."

@X x_lin_mignot_1999 := "Lin L, Mignot E et al 1999" :: literature [active]
  ref = "Lin L et al. The sleep disorder canine narcolepsy is caused by a mutation in the hypocretin (orexin) receptor 2 gene. Cell 1999;98:365–376. (Mignot lab; canine narcolepsy → HCRTR2)"

@X x_chemelli_1999 := "Chemelli RM et al 1999" :: literature [active]
  ref = "Chemelli RM et al. Narcolepsy in orexin knockout mice: molecular genetics of sleep regulation. Cell 1999;98:437–451. (Yanagisawa lab; prepro-orexin KO → narcolepsy phenotype)"

@X x_tononi_cirelli_2014 := "Tononi G, Cirelli C 2014-era" :: literature [active]
  ref = "Tononi G, Cirelli C. Sleep and the price of plasticity: from synaptic and cellular homeostasis to memory consolidation and integration. Neuron 2014;81:12–34. (Synaptic Homeostasis Hypothesis review-era; primary-author/era cited)"

@X x_dec2_short_sleeper_he_2009 := "He Y et al 2009 (DEC2 short sleeper)" :: literature [active]
  ref = "He Y et al. The transcriptional repressor DEC2 regulates sleep length in mammals. Science 2009;325:866–870. (Fu / Ptáček group; familial natural short sleep linked to DEC2/BHLHE41 mutation)"

@X x_adrb1_short_sleeper_2019 := "Shi G et al (ADRB1 short sleeper, ~2019)" :: literature [active]
  ref = "Shi G et al. A rare mutation of β1-adrenergic receptor affects sleep/wake behaviors. Neuron 2019 era (Fu / Ptáček group). Primary-author/era cited as a second-locus confirmation of familial natural short sleep; exact volume/page paraphrased."

@X x_aasm_scoring_manual := "AASM Manual for the Scoring of Sleep and Associated Events" :: literature [active]
  ref = "American Academy of Sleep Medicine (AASM). The AASM Manual for the Scoring of Sleep and Associated Events — Rules, Terminology and Technical Specifications. (institutional scoring manual; periodically revised — version/year paraphrased, not asserted to a specific edition)"

@X x_icsd3 := "ICSD-3 — International Classification of Sleep Disorders, 3rd edition" :: literature [active]
  ref = "American Academy of Sleep Medicine (AASM). International Classification of Sleep Disorders, 3rd edition (ICSD-3). (institutional nosology of sleep disorders; companion DSM-5 chronic-insomnia criteria cited where used. Primary-source institutional, exact edition / text-revision paraphrased)"

@X x_cbti_aasm_guideline := "AASM clinical practice guideline on behavioural / psychological treatment of chronic insomnia" :: literature [active]
  ref = "American Academy of Sleep Medicine clinical practice guideline (and companion behavioural-treatment guideline literature, Edinger et al era) recommending Cognitive Behavioural Therapy for Insomnia (CBT-I) as first-line treatment of chronic insomnia disorder. Institutional / primary-author-era cited; exact year/volume paraphrased."

@X x_aasm_srs_duration_consensus := "AASM / Sleep Research Society adult sleep duration consensus statement" :: literature [active]
  ref = "Consensus statement of the American Academy of Sleep Medicine and Sleep Research Society on recommended sleep duration for healthy adults (Watson NF and colleagues, mid-2010s era). Cited as institutional consensus for the 7–9 h adult range; primary-author/era — exact volume/page paraphrased."
