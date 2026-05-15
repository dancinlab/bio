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
# NEUROPHARMACOLOGY.tape — architecture-current (editable per v1.2)
# Event history → NEUROPHARMACOLOGY.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "neuropharmacology" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · CNS pharmacology in-silico knowledge SSOT"
  brief = "CNS pharmacology — neurotransmitter systems + drug classes · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "NEUROPHARMACOLOGY.log.tape"
  scope = "in-silico CNS-pharmacology knowledge SSOT · NOT prescribing/clinical advice"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see NEUROPHARMACOLOGY.log.tape audit"

@N scope_disclaimer := "clinical-scope honesty" :: note [required]
  text = "This tape is an evidence-summary knowledge SSOT for an in-silico CNS-pharmacology substrate. Receptor inventories, drug-class mechanisms, landmark-trial framing and pharmacokinetic considerations are paraphrased from published peer-reviewed psychopharmacology literature for modeling context only — they are NOT prescribing guidance, NOT a clinical protocol, NOT a regulatory submission, and explicitly DO NOT include dosing schedules, regimens, or individualized treatment recommendations. CNS drugs (antidepressants, antipsychotics, anxiolytics, mood stabilizers, opioids, anti-Parkinson agents, anti-epileptics, cognitive enhancers, psychedelics) carry serious risks (suicidality, dependence/withdrawal, extrapyramidal effects, teratogenicity, lethal overdose, drug-drug interactions). Real diagnosis and treatment require a licensed prescriber. All claims here are in-silico simulator/metadata consistency only; the wet-lab → preclinical → clinical → regulatory boundary is explicitly out of scope (hexa-bio AGENTS.tape g8 / f2)."

# ── §1 Neurotransmitter systems (receptor inventory — no dosing) ─────

@D nt_dopamine := "dopamine — pathways & receptors" :: mechanism [ok]
  pathways = "Four canonical projections: (1) mesolimbic (VTA → nucleus accumbens / limbic) — reward, salience, positive symptoms of schizophrenia; (2) mesocortical (VTA → prefrontal cortex) — cognition, motivation, negative symptoms; (3) nigrostriatal (substantia nigra → dorsal striatum) — motor control, the pathway lost in Parkinson's; (4) tuberoinfundibular (arcuate nucleus → median eminence) — prolactin inhibition by hypothalamic dopamine, the source of antipsychotic-induced hyperprolactinaemia."
  receptors = "Five G-protein-coupled receptor subtypes grouped into two families: D1-like (D1, D5 — Gs/Golf-coupled, ↑ cAMP); D2-like (D2, D3, D4 — Gi/o-coupled, ↓ cAMP). D2 is the dominant antipsychotic target."
  why-it-matters = "The Carlsson dopamine hypothesis of schizophrenia, recognised by the 2000 Nobel Prize in Physiology or Medicine, anchored the D2-blockade rationale for typical antipsychotics; the same D2 axis underlies extrapyramidal motor side-effects (nigrostriatal blockade) and prolactin elevation (tuberoinfundibular blockade)."
  honesty = "Subtype list is the textbook count, not an n=6 invariant. Five subtypes ≠ a lattice value (see [@f_lattice_fit])."
  |> "[@x_carlsson_nobel_2000]"

@D nt_serotonin := "serotonin (5-HT) — receptor families" :: mechanism [ok]
  receptors = "Seven receptor families (5-HT1 through 5-HT7), all G-protein-coupled except 5-HT3 (a ligand-gated cation channel). Subtypes most relevant to psychopharmacology: 5-HT1A (Gi-coupled — anxiolysis, partial-agonist target of buspirone), 5-HT1B/1D (triptan migraine target), 5-HT2A (Gq — cortical pyramidal-cell modulation, psychedelic and atypical-antipsychotic site), 5-HT2C, 5-HT3 (chemoreceptor-trigger-zone nausea, ondansetron target), 5-HT6 / 5-HT7 (cognitive, circadian)."
  projections = "Raphe nuclei (dorsal and median) → cortex, limbic system, hypothalamus, brainstem; diffuse modulatory architecture."
  bridge = "5-HT2A occupancy is the convergent locus of classical serotonergic psychedelics (LSD / psilocybin / DMT) and is a co-target of atypical antipsychotics (alongside D2). The 'monoamine hypothesis' of depression motivated SSRI/SNRI development but does not explain the delayed clinical onset (see [@x_stahl_textbook])."
  honesty = "Seven 5-HT families is the established pharmacological count, not lattice-derived."

@D nt_glutamate := "glutamate — ionotropic + metabotropic" :: mechanism [ok]
  ionotropic = "Three ionotropic families: NMDA (NR1/NR2A-D/NR3 — Ca2+-permeable, voltage-dependent Mg2+ block; learning/memory; the receptor at which ketamine and memantine act as channel blockers), AMPA (GluA1-4 — fast excitatory transmission), kainate (GluK1-5)."
  metabotropic = "Eight metabotropic mGluR subtypes (mGluR1-8) in three groups: Group I (mGluR1, 5 — Gq, postsynaptic excitatory modulation), Group II (mGluR2, 3 — Gi, presynaptic autoreceptor, anxiolytic targets in trials), Group III (mGluR4, 6, 7, 8 — Gi, presynaptic)."
  clinical = "NMDA hypofunction hypothesis complements (does not replace) the dopamine hypothesis of schizophrenia; ketamine's rapid antidepressant effect (esketamine nasal spray approved post-2019 era) is the most-cited clinical NMDA-pharmacology finding of recent years."
  honesty = "Ionotropic count (3 families) and metabotropic count (8 subtypes) are textbook tallies, not lattice values."

@D nt_gaba := "GABA — ionotropic GABA-A + metabotropic GABA-B" :: mechanism [ok]
  gaba-a = "Pentameric ligand-gated chloride channel (most commonly 2α/2β/1γ); distinct allosteric binding sites for benzodiazepines (α/γ interface), barbiturates, neurosteroids, ethanol and propofol. Benzodiazepine action requires a γ subunit and is selective across α1 (sedation), α2/α3 (anxiolysis), α5 (memory)."
  gaba-b = "Heterodimeric Gi/o-coupled metabotropic receptor (GABA-B1 + GABA-B2); baclofen is the canonical agonist (spasticity)."
  clinical = "GABA-A positive allosteric modulators (benzodiazepines, Z-drugs, barbiturates) account for the dominant clinical anxiolytic / hypnotic / anticonvulsant pharmacology; tolerance, dependence and withdrawal are well-characterised class limits (see [@lim_addiction])."
  honesty = "GABA pharmacology is not a 2-receptor system; it is two RECEPTOR-CLASSES (ionotropic vs metabotropic) with multiple subunit combinations. 'Two' is a categorical split, not a lattice φ=2."

@D nt_acetylcholine := "acetylcholine — nicotinic + muscarinic" :: mechanism [ok]
  nicotinic = "Pentameric ligand-gated cation channels assembled from α and β subunits; neuronal nAChRs (e.g. α4β2, α7) mediate CNS effects; muscle nAChR is the neuromuscular target of curare-class blockers."
  muscarinic = "Five GPCR subtypes M1–M5: M1/M3/M5 are Gq-coupled, M2/M4 are Gi-coupled. M1 dominates cortical/hippocampal cognitive signalling; M2/M4 are presynaptic autoreceptors and cardiac (M2 → bradycardia)."
  clinical = "Acetylcholinesterase inhibitors (donepezil, rivastigmine, galantamine) raise synaptic ACh in Alzheimer's; muscarinic antagonist anticholinergic burden is a recognised iatrogenic cognitive-decline risk in older adults."
  honesty = "Five muscarinic subtypes coincidentally matches the count of dopamine subtypes; both are textbook receptor tallies, neither is derived from anything lattice-shaped."

@D nt_norepinephrine := "norepinephrine — α/β adrenergic" :: mechanism [ok]
  receptors = "Three α1 subtypes (α1A, α1B, α1D — Gq, vasoconstriction, prazosin-class blockade for PTSD nightmares per practice literature), three α2 subtypes (α2A, α2B, α2C — Gi, presynaptic autoreceptor; central α2A agonism is the clonidine/guanfacine mechanism), three β subtypes (β1 — cardiac, β2 — bronchial/skeletal, β3 — adipose). Locus coeruleus is the principal CNS noradrenergic nucleus."
  clinical = "NE reuptake inhibition is the second axis of SNRIs (alongside 5-HT); α2A agonism (guanfacine, clonidine) is established for ADHD; β-blockers cross BBB to varying degree (propranolol crosses; atenolol does not), explaining differential CNS side-effect profile."
  honesty = "α/β subtype count is textbook adrenergic pharmacology, not lattice-fit."

@D nt_histamine := "histamine — H1 through H4" :: mechanism [ok]
  receptors = "Four GPCR subtypes: H1 (Gq — sedation when blocked centrally; the somnolent first-generation antihistamine effect; mirtazapine sedation), H2 (Gs — gastric-acid secretion), H3 (Gi — presynaptic autoreceptor on histaminergic neurons; H3 antagonist pitolisant for narcolepsy), H4 (Gi — immune cell modulation)."
  cns-context = "Tuberomammillary nucleus is the sole histaminergic cell population in the brain; histaminergic tone supports arousal/wakefulness — explaining centrally-acting H1 antagonism = sedation."
  honesty = "H1-H4 is the established subtype count."

@D nt_opioid := "opioid receptors — μ, δ, κ" :: mechanism [ok]
  receptors = "Three classical GPCR subtypes (Gi/o-coupled): μ (MOR — analgesia, euphoria, respiratory depression, dependence — the morphine/fentanyl target; β-arrestin signalling implicated in respiratory depression / constipation), δ (DOR — analgesia with anxiolytic-like profile in models), κ (KOR — analgesia with dysphoria/aversion; salvinorin-A is a κ agonist). Nociceptin/orphanin FQ receptor (NOP / ORL1) is a related fourth member, often grouped separately."
  clinical = "All approved opioid analgesics are μ-agonists (full agonists: morphine, fentanyl, oxycodone; partial agonist: buprenorphine — ceiling effect on respiratory depression underlies its addiction-medicine use); μ-antagonists naloxone (acute reversal) and naltrexone (relapse prevention)."
  honesty = "Three classical subtypes (or four including NOP) is the established pharmacological count; the opioid crisis is a real public-health limit, not a lattice product (see [@lim_addiction])."

@D nt_cannabinoid := "cannabinoid — CB1 / CB2" :: mechanism [ok]
  receptors = "Two cloned cannabinoid GPCR subtypes (Gi/o): CB1 (densely expressed in CNS — cortex, basal ganglia, hippocampus, cerebellum; the principal target of Δ9-THC and endocannabinoid anandamide / 2-AG; absent from brainstem cardiorespiratory centres, explaining the low lethality of cannabinoid-only overdose vs opioids), CB2 (predominantly immune cells; sparse CNS expression, mainly microglia and brainstem under inflammation)."
  clinical = "Nabiximols (THC:CBD oromucosal) and pure CBD (cannabidiol — FDA approval era for specific paediatric epilepsies post-2018) are the approved cannabinoid-class drugs at the knowledge cutoff; CB1 inverse agonist rimonabant was withdrawn for psychiatric AEs (depression, suicidality) — a class-pharmacology limit."
  honesty = "Two cloned receptors is a count, not a φ=2."

# ── §2 Drug-class landscape (literature names only — NO dosing) ──────

@D rx_antidepressants_tca := "tricyclic antidepressants (TCAs)" :: therapy [ok]
  era = "Kuhn 1957 imipramine era — first effective antidepressant class identified clinically (imipramine, amitriptyline, nortriptyline, clomipramine, desipramine)."
  moa = "Inhibition of serotonin and norepinephrine reuptake (variable selectivity by agent), plus muscarinic, histaminergic, α1-adrenergic and Na+-channel antagonism — the multireceptor profile that underlies both efficacy and the class side-effect burden."
  signature-ae = "Anticholinergic load (dry mouth, urinary retention, cognitive blunting), orthostatic hypotension (α1), sedation (H1), QT prolongation, and lethality in overdose (Na+-channel block → arrhythmia, seizures) — the dominant reason TCAs were displaced by SSRIs as first-line therapy."
  honesty = "Era citation only — Kuhn 1957 is paraphrased as a landmark era, not a specific volume/page assertion."
  |> "[@x_kuhn_1957]"

@D rx_antidepressants_maoi := "monoamine oxidase inhibitors (MAOIs)" :: therapy [ok]
  moa = "Inhibition of MAO-A (preferential for 5-HT, NE) and/or MAO-B (preferential for DA, β-PEA); irreversible non-selective (phenelzine, tranylcypromine, isocarboxazid) and reversible selective (moclobemide — RIMA)."
  signature-ae = "Hypertensive crisis on dietary tyramine ('cheese reaction') with irreversible non-selective agents; serotonin syndrome on combination with serotonergic drugs (mandatory washout intervals respected in practice); the dietary/interaction burden is why MAOIs are second/third-line despite efficacy in atypical / treatment-resistant depression."
  honesty = "Listed as a class; no dosing or specific regimen described."

@D rx_antidepressants_ssri := "selective serotonin reuptake inhibitors (SSRIs)" :: therapy [ok recommended]
  era = "Wong/Lilly 1974 fluoxetine discovery era — fluoxetine launched as the first SSRI, followed by sertraline, paroxetine, citalopram/escitalopram, fluvoxamine."
  moa = "Selective inhibition of serotonin reuptake (SERT). The 'monoamine hypothesis' framing is incomplete — the receptor occupancy is rapid but the clinical antidepressant effect emerges over weeks, implicating downstream adaptive changes (autoreceptor desensitization, BDNF, neuroplasticity) — see Stahl textbook synthesis."
  signature-ae = "GI upset, sexual dysfunction, sleep disturbance, discontinuation syndrome (especially short-half-life agents like paroxetine), serotonin syndrome on combination, and an FDA boxed warning era (post-2004) on increased suicidal ideation in children/adolescents/young adults — a class-pharmacology safety signal taken seriously in practice."
  honesty = "Wong/Lilly 1974 cited as discovery-era reference, not volume/page."
  |> "[@x_wong_1974] · [@x_stahl_textbook]"

@D rx_antidepressants_snri := "serotonin-norepinephrine reuptake inhibitors (SNRIs)" :: therapy [ok]
  moa = "Dual SERT + NET inhibition (venlafaxine, desvenlafaxine, duloxetine, levomilnacipran); NE-component dose-dependence (venlafaxine is more SERT-selective at low exposure)."
  clinical = "Approved indications include MDD and several chronic-pain / anxiety conditions; class-shared AE profile with SSRIs plus more prominent blood-pressure / sweating effects."

@D rx_antidepressants_atypical := "atypical / next-generation antidepressants" :: therapy [ok]
  examples = "Bupropion (NDRI — NE/DA reuptake; lower sexual-dysfunction risk; lowers seizure threshold), mirtazapine (α2 antagonist + 5-HT2/3 antagonist, H1-antagonist sedation), trazodone (5-HT2 antagonist / SARI; sedation; priapism warning), vortioxetine (multimodal 5-HT)."
  fast-acting = "Ketamine / esketamine (NMDA antagonist, rapid antidepressant effect — approved-era esketamine nasal spray under REMS programmes post-2019)."

@D rx_antidepressants_stard := "STAR*D trial era — treatment-resistant depression empiricism" :: therapy [ok]
  era = "Rush et al 2006 (Am J Psychiatry 163:1905-1917) reported the cumulative remission rates across sequenced antidepressant steps in major depressive disorder — landmark naturalistic effectiveness trial. Roughly half of patients achieve remission across multiple treatment steps; later steps yield diminishing incremental remission."
  implication = "Antidepressant choice in real practice is empirical and stepwise; class membership is not a guarantee of response. This is a clinical-effectiveness reality, NOT a lattice statistic."
  |> "[@x_rush_stard_2006]"

@D rx_antipsychotics_typical := "typical (first-generation) antipsychotics" :: therapy [ok]
  era = "Delay & Deniker 1952 — chlorpromazine recognised as the first effective antipsychotic, foundational to modern psychopharmacology. Subsequent typicals: haloperidol, fluphenazine, perphenazine, thioridazine, loxapine."
  moa = "Primarily D2 receptor antagonism (Carlsson dopamine hypothesis); efficacy on positive symptoms scales with striatal D2 occupancy; the same occupancy in nigrostriatal pathway causes extrapyramidal symptoms (EPS) and in tuberoinfundibular pathway causes hyperprolactinaemia."
  signature-ae = "EPS (acute dystonia, parkinsonism, akathisia), tardive dyskinesia (delayed, often irreversible movement disorder — a major clinical concern after months/years of exposure), neuroleptic malignant syndrome (rare, life-threatening), hyperprolactinaemia, QT prolongation."
  honesty = "Delay & Deniker 1952 cited as era — paraphrased landmark, not volume/page asserted."
  |> "[@x_delay_deniker_1952] · [@x_carlsson_nobel_2000]"

@D rx_antipsychotics_atypical := "atypical (second-generation) antipsychotics" :: therapy [ok recommended]
  landmark = "Kane et al 1988 (Arch Gen Psychiatry 45:789-796) — clozapine demonstrated superior efficacy in treatment-resistant schizophrenia in a controlled trial, re-establishing clozapine despite its 1970s withdrawal for agranulocytosis. Clozapine remains the only agent with class-recognised superior efficacy in TRS and is the gold-standard treatment-resistance comparator."
  moa = "Combined D2 antagonism with prominent 5-HT2A antagonism, plus variable affinity at 5-HT1A, 5-HT2C, α1, H1, M1; partial-agonist atypicals (aripiprazole, brexpiprazole, cariprazine) modulate rather than fully block D2."
  agents = "Clozapine, risperidone, olanzapine, quetiapine, ziprasidone, aripiprazole, paliperidone, lurasidone, brexpiprazole, cariprazine."
  signature-ae = "Reduced EPS vs typicals (especially clozapine, quetiapine); metabolic syndrome (weight gain, dyslipidaemia, hyperglycaemia — olanzapine and clozapine highest); sedation; orthostatic hypotension; clozapine-specific risks of agranulocytosis (mandatory haematological monitoring), myocarditis, seizures, severe constipation/ileus."
  honesty = "Kane et al 1988 is a real, citable landmark RCT; volume/page asserted from peer-reviewed primary source as user-specified."
  |> "[@x_kane_1988]"

@D rx_antipsychotics_lai := "long-acting injectable (LAI) antipsychotics" :: therapy [ok]
  rationale = "Depot intramuscular formulations of haloperidol, fluphenazine, risperidone, paliperidone, aripiprazole, olanzapine — address non-adherence (the dominant cause of relapse in schizophrenia) and stabilise plasma levels."
  honesty = "LAIs do not change efficacy potential vs the equivalent oral; they change adherence-bound effectiveness — a behavioural-pharmacology lever ([@lim_adherence_cns])."

@D rx_anxiolytics_bzd := "benzodiazepines (BZDs)" :: therapy [ok]
  moa = "Positive allosteric modulator of GABA-A receptor at the α/γ interface — increases chloride-channel opening frequency without intrinsic agonism. Class agents: diazepam, lorazepam, clonazepam, alprazolam, midazolam, chlordiazepoxide; pharmacokinetic differentiation (short/intermediate/long half-life, active metabolites) drives indication choice."
  uses = "Acute anxiety, panic, alcohol withdrawal, status epilepticus, procedural sedation, muscle spasm."
  signature-ae-and-limit = "Addiction / physiological dependence with chronic use; tolerance to anxiolytic and hypnotic effects; rebound anxiety and seizure-risk on abrupt withdrawal (especially short-half-life agents); falls and cognitive impairment in older adults; respiratory depression risk in combination with opioids (FDA boxed warning era). The BZD-opioid interaction is a documented mortality driver in real-world overdose data."
  |> "[@x_stahl_textbook]"

@D rx_anxiolytics_buspirone := "buspirone (5-HT1A partial agonist)" :: therapy [ok]
  moa = "Partial agonist at 5-HT1A; slower onset (weeks) than BZDs; no GABA-A activity → no dependence/withdrawal/respiratory-depression class profile."
  trade-off = "Lower acute anxiolytic punch, no abuse liability — exactly the trade the GAD treatment literature describes."

@D rx_mood_stabilisers_lithium := "lithium" :: therapy [ok recommended]
  landmark = "Cade 1949 (Med J Aust 2:349-352) — landmark first report of lithium salts in manic-depressive psychosis. Lithium remains the prototype mood stabiliser and the only agent with consistent meta-analytic anti-suicide signal in bipolar disorder."
  moa = "Multiple proposed mechanisms (GSK-3β inhibition, inositol depletion, BDNF/Bcl-2 modulation, second-messenger interference); exact MOA still debated."
  signature-ae-and-limit = "Narrow therapeutic index (lithium toxicity at levels close to therapeutic — a recognised CNS-drug TI ceiling, see [@lim_therapeutic_index_cns]); thyroid dysfunction, nephrogenic diabetes insipidus, chronic kidney effects with long use; teratogenicity (Ebstein anomaly historical signal). Plasma-level monitoring is the standard precaution."
  honesty = "Cade 1949 cited as the landmark — Med J Aust volume/page is consistent with the widely-cited canonical reference."
  |> "[@x_cade_1949]"

@D rx_mood_stabilisers_anticonvulsants := "anticonvulsant mood stabilisers" :: therapy [ok]
  agents = "Valproate (broad-spectrum; teratogenic — fetal valproate syndrome / neural-tube defects, contraindicated in pregnancy potential without specialist oversight), carbamazepine (CYP3A4 inducer with extensive DDIs; aplastic anaemia / SJS risks, HLA-B*1502 screening in at-risk populations), lamotrigine (depression-pole mood stabilisation; slow titration required for SJS/TEN risk)."
  honesty = "Anticonvulsant mood stabilisers are a real class; specific dosing/regimens not described — see [@lim_dosing_out_of_scope]."

@D rx_cognitive_ache := "AChE inhibitors for Alzheimer's dementia" :: therapy [ok]
  agents = "Donepezil, rivastigmine (also butyrylcholinesterase inhibition; transdermal patch formulation reduces GI burden), galantamine (also allosteric nicotinic modulation)."
  moa = "Inhibit acetylcholinesterase to raise synaptic ACh in cortical/hippocampal projections from the basal forebrain — the 'cholinergic hypothesis' of Alzheimer's."
  honesty = "Symptomatic effect only — modest cognitive and global-function improvement in mild-to-moderate Alzheimer's; AChE inhibitors are NOT disease-modifying, they do NOT halt or reverse the underlying neurodegeneration. This honesty is a class-defining limit. Cross-link to HERBALISM tape (Ginkgo biloba and similar 'cognitive' herbals are not equivalent to nor a replacement for evaluated cholinesterase pharmacology)."
  cross-link = "see HERBALISM.tape — distinct evidence frame; herbal cognitive claims do not meet AChE-inhibitor evidence bar."

@D rx_cognitive_memantine := "memantine (NMDA partial antagonist)" :: therapy [ok]
  moa = "Uncompetitive, voltage-dependent, low-affinity NMDA channel blocker — preserves physiological signal-to-noise while reducing pathological glutamate excitotoxicity in moderate-to-severe Alzheimer's."
  honesty = "Symptomatic; modest effect size; not disease-modifying."

@D rx_cognitive_anti_amyloid := "anti-amyloid monoclonal antibodies (lecanemab / donanemab era 2022-2024)" :: therapy [ok]
  agents = "Lecanemab (anti-amyloid-β protofibril mAb — FDA accelerated then full approval 2023 era for early Alzheimer's), donanemab (anti-amyloid plaque mAb — approval era 2024). The class targets cerebral amyloid plaque clearance."
  honest-effect-size = "These agents demonstrate MODEST slowing of cognitive decline on continuous endpoints (e.g. CDR-SB) in early symptomatic Alzheimer's; they do NOT halt, reverse or cure the disease, and the clinical-meaningfulness of the measured slowing is actively debated in the field. ARIA (amyloid-related imaging abnormalities — oedema 'ARIA-E' and microhaemorrhage / siderosis 'ARIA-H') is a recognised class adverse event with management implications, especially in APOE ε4 homozygotes. Recent class-era reference (2022-2024) — primary-author/era cited; exact citation per registration-trial publications."
  honesty = "Framing matches the FDA-approval-era discussion: 'first disease-modifying class for Alzheimer's' is the regulatory characterisation; the lived effect size is small relative to the disease trajectory. Do NOT overclaim cure."
  |> "[@x_lecanemab_donanemab_era_2022_2024]"

@D rx_opioids := "opioid pharmacology — μ-agonists, antagonists, partial agonists" :: therapy [ok]
  full-agonists = "Morphine, fentanyl, oxycodone, hydromorphone, methadone (also NMDA antagonism + serotonergic effects, long variable half-life), codeine (CYP2D6 pro-drug to morphine — pharmacogenomic variability)."
  antagonists = "Naloxone (short-acting μ-antagonist — overdose reversal; standard public-health intervention), naltrexone (longer-acting μ-antagonist — relapse prevention in opioid- and alcohol-use disorder)."
  partial-agonist = "Buprenorphine (high-affinity μ-partial agonist with ceiling on respiratory depression; mainstay of opioid-use-disorder treatment under addiction-medicine literature alongside methadone and naltrexone)."
  limit = "The μ-receptor reward + respiratory-depression coupling is the pharmacological substrate of the opioid crisis (see [@lim_addiction]); pharmacology alone does not solve a sociotechnical epidemic."
  cross-link = "Addiction-medicine literature characterises medication-assisted treatment (MAT / MOUD) with methadone or buprenorphine as the evidence-based standard for opioid-use disorder."

@D rx_parkinsons_ldopa := "L-DOPA and Parkinson's pharmacology" :: therapy [ok recommended]
  era = "Cotzias 1967/1969 era — landmark NEJM-era reports that high-dose oral L-DOPA produced dramatic motor improvement in Parkinson's disease, establishing dopamine replacement as the foundational therapy."
  moa = "L-DOPA (levodopa) crosses BBB via LAT1 amino-acid transporter; decarboxylated to dopamine in remaining nigrostriatal neurons; co-administered with peripheral aromatic L-amino-acid decarboxylase inhibitor (carbidopa or benserazide) and increasingly with COMT inhibitor (entacapone) to extend plasma half-life."
  long-term-honesty = "After several years, motor fluctuations ('wearing-off') and L-DOPA-induced dyskinesias emerge in a majority of patients — the well-known motor-complication wall of chronic levodopa therapy. This is not a dosing failure; it is a progressive-disease-plus-pharmacodynamic limit."
  |> "[@x_cotzias_1967_1969_era]"

@D rx_parkinsons_other := "MAO-B inhibitors and dopamine agonists" :: therapy [ok]
  mao-b = "Selegiline, rasagiline, safinamide — MAO-B inhibitors used as adjunct or monotherapy in early disease."
  agonists = "Pramipexole, ropinirole, rotigotine (transdermal), apomorphine (rescue) — direct D2/D3 agonists; class signature AEs include impulse-control disorders (pathological gambling, hypersexuality), sudden-onset somnolence and peripheral oedema."
  honesty = "Class included for completeness; no dosing or step-by-step regimen described."

@D rx_antiepileptics := "anti-epileptic drugs (AEDs)" :: therapy [ok]
  classes-by-mechanism = "Na+-channel blockers (phenytoin, carbamazepine, lamotrigine, lacosamide), GABA-A enhancement (BZDs, barbiturates), SV2A modulation (levetiracetam, brivaracetam), Ca2+-channel modulation (gabapentin, pregabalin, ethosuximide), broad/multi-mechanism (valproate, topiramate, perampanel)."
  honesty = "AEDs are a broad heterogeneous class; many cross over into mood-stabilising, neuropathic-pain and migraine-prevention indications. Specific seizure-type matching, plasma-level targets and pregnancy considerations are clinical-prescriber territory ([@lim_dosing_out_of_scope])."

@D rx_psychedelics := "investigational psychedelic pharmacology (Carhart-Harris / Griffiths era)" :: therapy [draft]
  agents = "Psilocybin, LSD, DMT/ayahuasca, MDMA, ketamine-as-psychedelic (ketamine separately holds an approved-era rapid-antidepressant role via esketamine nasal spray)."
  shared-mechanism = "Classical serotonergic psychedelics converge on 5-HT2A agonism (Vollenweider / Carhart-Harris); MDMA is mechanistically distinct (5-HT releaser + monoamine actions); ketamine is NMDA-antagonist mechanism."
  status = "Investigational for treatment-resistant depression, PTSD (MDMA-assisted therapy programmes), end-of-life existential distress in advanced cancer. Carhart-Harris/Griffiths era (post-2010 reawakening of clinical psychedelic research) produced the body of published peer-reviewed trials. Not approved standard of care for most indications at knowledge cutoff; trial-grade evidence varies by indication and agent."
  honesty = "Listed for completeness, NOT endorsed; risks include challenging psychological experiences, persistent perceptual changes, serotonin syndrome with combinations, and population subgroups (psychotic-spectrum risk) where 5-HT2A agonism is contraindicated."
  |> "[@x_carhart_harris_griffiths_era]"

# ── §3 BBB pharmacology (CNS penetration constraint) ──────────────────

@D bbb_lipophilicity := "blood-brain barrier (BBB) — lipophilicity & MW" :: mechanism [ok]
  what = "The BBB is formed by brain microvascular endothelial cells with tight junctions, supported by pericytes and astrocytic endfeet; it restricts free passage of polar/large molecules into the CNS extracellular space."
  passive-rules-of-thumb = "Small, lipophilic, uncharged molecules cross by passive transcellular diffusion; high polar-surface-area, charged, or large molecules (>~500 Da depending on physicochemistry) generally do not. These are heuristics from medicinal-chemistry literature, not lattice constants."
  active-transport = "Selected nutrients/peptides cross via specific transporters (GLUT1 glucose; LAT1 large neutral amino acids — L-DOPA, methionine; nucleoside transporters); LAT1 is the L-DOPA entry route."

@D bbb_pgp := "P-glycoprotein (ABCB1) efflux at the BBB" :: mechanism [ok]
  what = "P-gp at the luminal endothelial membrane actively effluxes a broad range of substrates back into blood, reducing CNS exposure; many would-be CNS drugs are P-gp substrates and fail to reach therapeutic CNS concentrations despite good lipophilicity."
  consequence = "Loperamide (opioid agonist but P-gp substrate at the BBB) is the textbook example of P-gp keeping a peripheral-active drug effectively out of CNS; oncology / antiretroviral examples (some kinase inhibitors, some PIs) show why P-gp limits CNS efficacy. This is a foundational design constraint for any new CNS therapeutic."
  honesty = "P-gp is one of several BBB efflux pumps (BCRP / ABCG2, MRPs); 'one transporter' is shorthand, not the whole picture."

# ── §4 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ───

@D lim_bbb_delivery := "BBB delivery wall on hydrophilic / large molecules" :: real-limit [ok required]
  wall = "HARD WALL (current delivery technology)"
  statement = "Hydrophilic small molecules, peptides, antibodies and other macromolecules generally fail to cross the intact BBB at therapeutic CNS concentrations. Specialised strategies (receptor-mediated transcytosis 'molecular Trojan horses', focused-ultrasound BBB opening, intrathecal delivery, AAV-mediated gene delivery) exist but are not routine or universally applicable."
  consequence = "Many otherwise promising CNS targets have no deliverable drug. Anti-amyloid mAbs (lecanemab/donanemab era) achieve CNS exposure at low single-percent fractions of plasma concentration even with iv dosing — high doses, accepted ARIA risk, infusion-clinic infrastructure. The BBB is the foundational CNS-pharmacology constraint."

@D lim_therapeutic_index_cns := "CNS therapeutic index — narrower than peripheral" :: real-limit [ok required]
  wall = "HARD WALL (pharmacodynamic + organ-irreplaceability)"
  statement = "CNS drugs typically have narrower therapeutic indices than peripheral analogues because the brain is the action site AND the toxicity site, and CNS receptor families are heavily cross-reactive (DA / 5-HT / NE / ACh / H / GABA / glutamate are co-expressed across many circuits). Lithium (toxic at levels close to therapeutic), TCAs (lethal in overdose), MAOIs (hypertensive crisis / serotonin syndrome on interactions), antipsychotics (NMS, tardive dyskinesia), AEDs (idiosyncratic SJS/TEN, hepatotoxicity), opioids (lethal respiratory depression) are class-level illustrations."
  consequence = "Plasma-level monitoring, slow titration, drug-interaction screening and pregnancy precautions are not optional bureaucracy — they are responses to a real pharmacological-index ceiling."

@D lim_addiction := "addiction risk on reward-system-acting drugs" :: real-limit [ok required]
  wall = "HARD WALL (pharmacology + sociotechnical)"
  statement = "Drugs that increase mesolimbic dopaminergic signalling — directly (stimulants, cocaine), indirectly (opioids via μ-receptor disinhibition of VTA GABA interneurons; alcohol, BZDs via GABA-A enhancement with downstream dopaminergic effects; nicotine via nAChR), or via specific 5-HT2A/dopaminergic interplay — carry addiction liability that is intrinsic, not eliminable by reformulation alone. The US opioid crisis (annual deaths in the tens of thousands range; widely characterised as a public-health emergency) is the most-cited clinical illustration of CNS-pharmacology addiction risk at population scale."
  consequence = "Any CNS therapeutic acting on the reward system inherits a real-world abuse-liability axis; medication-assisted treatment (MAT) for opioid-use disorder (methadone, buprenorphine, naltrexone) is the evidence-grounded harm-reduction response."

@D lim_cns_trial_attrition := "CNS clinical-trial attrition >> peripheral (Eroom)" :: real-limit [ok required]
  wall = "HARD WALL (current discovery + trial science)"
  statement = "CNS drug development has historically had among the highest failure rates of any therapeutic area in pharma R&D — frequently cited as one of the worst by attrition / cost / time-to-approval. Causes include translation-failure of animal models, heterogeneity of psychiatric diagnoses, placebo-response variability in depression/anxiety trials, BBB delivery failure, and rare-AE detection demanding very large cohorts."
  consequence = "Inflation-adjusted R&D cost per approved CNS drug has trended unfavourably (Eroom's law context) — cross-link to BIO-PHARMA tape's Eroom framing for the cross-domain economics."
  cross-link = "see BIO-PHARMA.tape — Eroom's law / R&D productivity decline (CNS is one of the worst-affected therapeutic areas)."

@D lim_polypharmacy_ddi := "polypharmacy & drug-drug interactions in psychiatric populations" :: real-limit [ok required]
  wall = "SOFT WALL (clinical-operational)"
  statement = "Psychiatric and neurological patients are frequently on multiple CNS-active agents simultaneously (antidepressant + mood stabiliser + antipsychotic + anxiolytic + hypnotic + AED + opioid + ADHD stimulant in various combinations), plus medical comorbidity drugs. Pharmacodynamic interactions (additive serotonin → serotonin syndrome; opioid + BZD → respiratory depression; QT-prolonging combinations → torsades) and pharmacokinetic interactions (CYP induction/inhibition cascades — carbamazepine, valproate, fluoxetine, paroxetine) are pervasive."
  consequence = "Real-world CNS-drug effectiveness is bounded by interaction safety as much as by intrinsic efficacy; deprescribing literature and computerised DDI screening are responses to this limit, not its solution."

@D lim_cyp_variability := "CYP2D6 / CYP3A4 pharmacogenomic variability" :: real-limit [ok required]
  wall = "BIOLOGICAL LIMIT (host-intrinsic)"
  statement = "Many CNS drugs are CYP2D6 substrates (TCAs, many SSRIs particularly paroxetine and fluoxetine, atomoxetine, codeine pro-drug bioactivation, risperidone, aripiprazole) or CYP3A4 substrates (many BZDs, methadone, several antipsychotics). CYP2D6 phenotype distribution (poor / intermediate / extensive / ultrarapid metabolisers) varies by population; CYP3A4 is strongly inducible/inhibitable by other drugs and foods (grapefruit)."
  consequence = "Same dose → very different exposures across individuals. Pharmacogenomic CYP2D6 testing has CPIC guideline support for codeine, tramadol and some TCAs/SSRIs; cross-link to PHARMACOLOGY tape for the deeper PK / PGx layer."
  cross-link = "see PHARMACOLOGY.tape — CYP enzymology, PGx, and the general PK frame."

@D lim_adherence_cns := "non-adherence in CNS conditions" :: real-limit [ok required]
  wall = "BEHAVIORAL/CLINICAL LIMIT"
  statement = "Non-adherence is the leading cause of relapse in chronic CNS conditions (schizophrenia, bipolar disorder, epilepsy); causes include lack of insight in psychotic illness, side-effect burden (sexual AE on SSRIs, metabolic AE on atypical antipsychotics), stigma, polypharmacy complexity. Long-acting injectable antipsychotics and depot mood-stabiliser strategies are the pharmacological response."
  consequence = "Reported efficacy and real-world effectiveness diverge; adherence is part of the outcome equation, not a confound."

@D lim_dosing_out_of_scope := "dosing / regimen specifics are out of scope" :: real-limit [ok required]
  wall = "GOVERNANCE LIMIT (g8 / f2)"
  statement = "This tape paraphrases drug-class mechanisms and landmark literature only. Specific doses, titration schedules, plasma-level targets, route-of-administration choices and individualised regimen design are explicitly out of scope — they are clinical-prescriber territory and would constitute prescribing advice."
  consequence = "Any downstream consumer of this SSOT must NOT extract dosing rules from this file. Reference points to peer-reviewed psychopharmacology textbooks (Stahl) and primary literature for the prescribing layer."

# ── §5 n=6 lattice stance (HONEST — observation, not derivation) ─────

@F f_lattice_fit := "lattice-fit-on-neuropharmacology" :: governance [required deny:write]
  pattern = "Deriving CNS-pharmacology facts FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's 'SSRI 반응률 ↔ n/φ=3 모노아민 동시 표적', 'φ=2 수용체 유형 기반 이중 조절', 'sopfr=5 도파민 D1~D5 아형', 'σ=12 신경전달물질 네트워크', 'J₂=24시간 일주기', 'σ-φ=10 mg 기본 용량', 'σ-τ=8시간 반감기', 'τ=4 ADME 단계', 'σ/φ=6배 단축' etc."
  why = "Neuropharmacology exposes NO natural n=6 invariant. The deleted stub fabricated mechanisms, doses, half-lives and development timelines by reading off lattice tokens — a direct hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2 violation. f1 forbids lattice-fit on biology; f2 forbids in-silico→clinical/efficacy claims; the deleted stub committed both."
  remedy = "Cite real psychopharmacology literature (this tape's @X entries — Kane 1988 / Cade 1949 / Rush STAR*D 2006 / Carlsson Nobel 2000 / Kuhn 1957 era / Delay & Deniker 1952 era / Cotzias 1967-69 era / Stahl textbook / lecanemab-donanemab era / Carhart-Harris-Griffiths era). The lattice may only be a coincidental OBSERVATION (e.g. five dopamine subtypes coincidentally equals five muscarinic subtypes — observation), never a derivation source for any CNS-pharmacology claim about mechanism, efficacy, dose, half-life or trial outcome."

@N n6_honest_stance := "neuropharmacology has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: CNS pharmacology exposes NO natural n=6 invariant. Dopamine has 5 receptor subtypes (D1-D5), not 6; muscarinic ACh has 5 (M1-M5), not 6; serotonin has 7 receptor families (5-HT1 through 5-HT7), not 6; glutamate has 3 ionotropic families + 8 metabotropic subtypes; histamine has 4 (H1-H4); opioid has 3 classical (μ/δ/κ) or 4 with NOP; cannabinoid has 2 cloned; GABA splits ionotropic vs metabotropic — none of these counts is 6, and where coincidence does occur (e.g. 12 dominant CNS neurotransmitter species in some textbook tabulations coincidentally matches σ(6)=12) it is observation only and is not a derivation source. Receptor subtype counts are anatomical / molecular biology, not lattice values. Drug classes (antidepressants, antipsychotics, anxiolytics, mood stabilisers, AEDs, opioids, anti-Parkinson agents, cognitive enhancers, psychedelics) are an open / expanding taxonomy revised by the field, not a closed n-tuple. Pharmacokinetic phases (LADME — liberation, absorption, distribution, metabolism, excretion = 5; or ADME = 4) are organisational shorthand, not lattice values; '4-phase ADME equals τ=4' is the exact lattice-fit error of the deleted stub. Per LATTICE_POLICY g1/g2 + lattice-as-tool: the lattice is DECLINED here as a derivation tool — values may coincide by accident (observation OK) but never derive a clinical or pharmacological claim. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ── §6 Verifiable predictions (real, falsifiable — NOT lattice) ──────

@D tp_1 := "TP-1 clozapine TRS superiority" :: prediction [ok]
  claim = "In treatment-resistant schizophrenia (failure of at least two adequate prior antipsychotic trials), clozapine produces a higher response rate than another standard antipsychotic in matched, adequately-powered head-to-head conditions."
  falsifier = "If a properly powered TRS RCT showed clozapine equivalent to or worse than a comparator antipsychotic on a primary symptom-response endpoint, the Kane et al 1988 finding (and the entire 'clozapine-as-TRS-gold-standard' framework) would be wrong."
  source = "[@x_kane_1988]"

@D tp_2 := "TP-2 STAR*D step-wise diminishing returns" :: prediction [ok]
  claim = "In real-world MDD treatment, the incremental remission rate at each subsequent antidepressant treatment step (after a non-remitting prior step) is lower than at the preceding step — diminishing-returns curvature, not a flat per-step probability."
  falsifier = "If a STAR*D-like sequenced-treatment study showed flat or increasing per-step incremental remission rates across multiple steps, the STAR*D 2006 finding would be wrong and the empirical-stepwise rationale would not be evidence-supported."
  source = "[@x_rush_stard_2006]"

@D tp_3 := "TP-3 anti-amyloid mAb modest effect-size honesty" :: prediction [ok]
  claim = "Anti-amyloid monoclonal antibodies (lecanemab / donanemab era) slow cognitive decline on continuous endpoints (e.g. CDR-SB) in early symptomatic Alzheimer's by a small absolute amount — i.e. they SLOW, not halt or reverse, the disease — and confer measurable ARIA-E / ARIA-H risk especially in APOE ε4 homozygotes."
  falsifier = "If a properly powered confirmatory anti-amyloid trial in early Alzheimer's showed disease HALT/REVERSAL on a primary cognitive endpoint or showed zero excess ARIA vs placebo, the modest-effect-size + class-AE framing in this tape (and the regulatory-era characterisation as 'disease-slowing, not curative') would be wrong."
  source = "[@x_lecanemab_donanemab_era_2022_2024]"

# ── §7 External citations (real, peer-reviewed psychopharmacology) ───

@X x_kane_1988 := "Kane J et al 1988 (clozapine TRS)" :: literature [active]
  ref = "Kane J, Honigfeld G, Singer J, Meltzer H. Clozapine for the treatment-resistant schizophrenic. A double-blind comparison with chlorpromazine. Arch Gen Psychiatry 1988;45:789-796. (landmark RCT re-establishing clozapine in TRS)"

@X x_rush_stard_2006 := "Rush AJ et al 2006 (STAR*D)" :: literature [active]
  ref = "Rush AJ et al. Acute and longer-term outcomes in depressed outpatients requiring one or several treatment steps: a STAR*D report. Am J Psychiatry 2006;163:1905-1917. (landmark naturalistic effectiveness trial of sequenced antidepressant treatment)"

@X x_cade_1949 := "Cade JF 1949 (lithium in mania)" :: literature [active]
  ref = "Cade JFJ. Lithium salts in the treatment of psychotic excitement. Med J Aust 1949;2:349-352. (landmark first clinical report — lithium for manic-depressive psychosis; canonical reference)"

@X x_carlsson_nobel_2000 := "Carlsson A 2000 Nobel context" :: literature [active]
  ref = "Carlsson A. Nobel Prize in Physiology or Medicine 2000 — 'for discoveries concerning signal transduction in the nervous system' (dopamine identified as a neurotransmitter; foundational to the dopamine hypothesis of schizophrenia and to D2-blockade antipsychotic pharmacology). Nobel-context reference, paraphrased."

@X x_wong_1974 := "Wong DT et al 1974 (fluoxetine discovery era)" :: literature [active]
  ref = "Wong DT, Horng JS, Bymaster FP, Hauser KL, Molloy BB (Lilly Research Laboratories). Identification of Lilly 110140 (later fluoxetine) as a selective serotonin uptake inhibitor — discovery-era reference, late 1974 publications and the early-1990s clinical launch defined the SSRI class. Author/era cited; exact volume/page paraphrased."

@X x_kuhn_1957 := "Kuhn R 1957 (imipramine era)" :: literature [active]
  ref = "Kuhn R. The treatment of depressive states with G 22355 (imipramine hydrochloride). 1957 — first clinical report of imipramine's antidepressant effect; foundational TCA-era reference. Author/era cited; exact volume/page paraphrased per the multiple original Swiss-German and English re-publications of the era."

@X x_delay_deniker_1952 := "Delay J & Deniker P 1952 (chlorpromazine era)" :: literature [active]
  ref = "Delay J, Deniker P. 1952 — clinical reports introducing chlorpromazine (RP 4560) as the first antipsychotic; foundational to modern psychopharmacology and to the dopamine hypothesis of schizophrenia. Author/era cited; exact volume/page paraphrased per the multiple original Annales/Congrès reports of 1952."

@X x_cotzias_1967_1969_era := "Cotzias GC 1967/1969 (L-DOPA in Parkinson's)" :: literature [active]
  ref = "Cotzias GC et al. Modification of parkinsonism — chronic treatment with L-DOPA. NEJM-era reports 1967 and 1969 — landmark establishment of high-dose oral L-DOPA as the foundational Parkinson's therapy; subsequent recognition of motor-fluctuation / dyskinesia long-term wall. Author/era cited; exact volume/page paraphrased."

@X x_lecanemab_donanemab_era_2022_2024 := "lecanemab / donanemab clinical-trial era 2022-2024" :: literature [active]
  ref = "Anti-amyloid monoclonal antibody clinical-trial era 2022-2024 — registration trials of lecanemab (anti-amyloid-β protofibril) and donanemab (anti-amyloid plaque) in early symptomatic Alzheimer's disease, reported in major journals 2022-2024. Class-level finding: modest slowing of cognitive decline on continuous endpoints (e.g. CDR-SB) with measurable ARIA-E / ARIA-H adverse events, especially in APOE ε4 homozygotes. Era reference paraphrased — no single volume/page asserted; clinical-meaningfulness of effect size is actively debated in the field."

@X x_carhart_harris_griffiths_era := "Carhart-Harris / Griffiths psychedelic-research era" :: literature [active]
  ref = "Carhart-Harris RL (Imperial College London) and Griffiths RR (Johns Hopkins) era — post-2010 reawakening of clinical psychedelic research in humans, generating peer-reviewed trials of psilocybin in treatment-resistant depression and end-of-life existential distress, plus mechanistic 5-HT2A neuroimaging work. Era reference paraphrased; multiple primary publications across the era — investigational status, not approved standard of care for most indications at knowledge cutoff."

@X x_stahl_textbook := "Stahl SM, Essential Psychopharmacology — textbook era" :: literature [active]
  ref = "Stahl SM. Essential Psychopharmacology (Cambridge University Press). Multiple editions across the textbook era — widely-used didactic synthesis of receptor-based CNS pharmacology, mechanism-of-action diagrams, antidepressant/antipsychotic/anxiolytic/mood-stabiliser pharmacology. Textbook reference paraphrased; not a single primary trial."
