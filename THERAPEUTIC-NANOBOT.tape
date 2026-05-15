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
# THERAPEUTIC-NANOBOT.tape — architecture-current (editable per v1.2)
# Event history → THERAPEUTIC-NANOBOT.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "therapeutic-nanobot" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · therapeutic nanomedicine + 'nanobot' in-silico knowledge SSOT"
  brief = "Nanomedicine science · what is clinically DEPLOYED (LNP / liposome / ADC / polymeric NP) vs what is laboratory / INSPIRATIONAL (DNA-origami carriers, molecular-machine 'nanobots') · real-limits anchored · n=6 NOT used as a derivation (honest)"
  parent = "dancinlab/hexa-bio"
  sibling-log = "THERAPEUTIC-NANOBOT.log.tape"
  scope = "in-silico knowledge SSOT · NOT clinical / device-regulatory claim · distinguishes real clinical nanomedicine from inspirational nanobots"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); full real-science rewrite 2026-05-16 — see THERAPEUTIC-NANOBOT.log.tape audit"

@N scope_disclaimer := "deployed-vs-inspirational honesty" :: note [required]
  text = "This tape is a knowledge SSOT distinguishing two very different things that the word 'nanobot' is often used to conflate. (A) DEPLOYED clinical nanomedicine in 2026 = passive nanoscale drug-carriers: lipid nanoparticles (LNPs, e.g. COVID-19 mRNA vaccines), liposomes (Doxil), antibody-drug conjugates (T-DM1 / Kadcyla), polymeric nanoparticles (nab-paclitaxel / Abraxane), iron-oxide / inorganic carriers — none of these are 'robots', they are formulation chemistry. (B) INSPIRATIONAL / RESEARCH-STAGE = DNA-origami programmed delivery, Feringa-style molecular motors, autonomous swimmers, in-vivo molecular machines — real science, but NOT clinically deployed and NOT autonomous robotic agents in patients. This tape will not blur (A) and (B). All figures are paraphrased from published literature for modeling context; not prescribing guidance, not a device claim. In-silico simulator/metadata consistency only — wet-lab / preclinical / clinical / regulatory boundary is explicitly out of scope (hexa-bio AGENTS.tape g8 / f2)."

# ── §1 What 'therapeutic nanobot' actually means (deployed vs inspirational) ─

@D dx_definition := "definitional scope" :: domain [ok]
  nanomedicine = "Nanomedicine = therapeutic / diagnostic / imaging use of objects in the ~1–100 nm size regime — predominantly nanoscale drug-carriers and contrast agents."
  not-a-robot = "The clinically deployed 'nano' agents (LNP, liposome, ADC, polymeric NP, iron-oxide NP) are NOT robots: they have no sensors, no actuators, no on-board control. They are formulation chemistry that exploits size, surface chemistry and pharmacokinetics."
  what-a-robot-would-be = "An autonomous medical nanobot would minimally need: sensing → decision → actuation → energy → biocompatibility — all at <100 nm in vivo. No system meeting this definition has clinical approval."
  inspirational = "Research-stage molecular and DNA-based machines (DNA-origami carriers, molecular motors, magnetic micro/nano-swimmers) demonstrate elements of this in vitro / in small-animal models — proof of mechanism, not therapy."
  honesty = "Do not equate FDA-approved nanocarrier formulations with autonomous nanorobots. The popular-press conflation is the single biggest factual error in this field."

@D dx_size_regimes := "size regimes & nomenclature" :: domain [ok]
  small-molecule = "<~1 kDa, <~1 nm — most classical drugs."
  protein-therapeutic = "Antibody ≈ 10–15 nm; protein/peptide therapeutics 2–15 nm."
  nanoparticle = "~10–200 nm — the dominant deployed nanomedicine size class (LNP, liposome, polymeric NP, micelle)."
  microparticle = "≥1 µm — distinct biodistribution (often lung-trapped or splenic); not 'nano'."
  honesty = "Size class is the dominant determinant of biodistribution and immune handling — not a lattice index. Numbers are physical/biological ranges, not invariants."

# ── §2 Clinically DEPLOYED nanomedicine (real, approved, in patients) ─────

@D dep_liposome := "liposomal drug carriers (Doxil and family)" :: deployed [ok recommended]
  what = "Phospholipid bilayer vesicles encapsulating a drug payload — the first FDA-approved nanomedicine class."
  landmark = "Doxil (PEGylated liposomal doxorubicin) — first FDA-approved nanomedicine (1995, Kaposi sarcoma; later ovarian, multiple myeloma). PEG ('stealth') coating extends circulation half-life by reducing reticuloendothelial uptake."
  mechanism = "Passive accumulation in leaky tumor/inflammatory vasculature; reduced peak-plasma free-drug exposure shifts the toxicity profile rather than dramatically increasing tumor delivery."
  honesty = "Doxil's benefit is primarily reduced cardiotoxicity vs free doxorubicin and altered toxicity profile (palmar–plantar erythrodysesthesia replaces some of the cardiotox); robust overall-survival superiority over free anthracycline is not a clean class claim. This is a real, useful nanomedicine — but not a 'targeted nanobot'."
  |> "[@x_barenholz_2012]"

@D dep_lnp := "lipid nanoparticles (LNP) for nucleic-acid delivery" :: deployed [ok recommended]
  what = "Multi-component lipid nanoparticles (ionizable lipid + helper lipid + cholesterol + PEG-lipid) encapsulating mRNA / siRNA / DNA."
  landmark = "Onpattro / patisiran (siRNA-LNP, 2018, hereditary transthyretin amyloidosis) — first siRNA drug approved. Then the COVID-19 mRNA vaccines (Pfizer–BioNTech BNT162b2, Moderna mRNA-1273, 2020–2021) — the largest deployment of an LNP medicine in history."
  mechanism = "Ionizable lipid neutral at physiologic pH, protonated in endosome → membrane disruption → cytoplasmic RNA release. LNPs largely deliver to liver hepatocytes on IV (via ApoE-mediated LDLR uptake) and to draining lymph nodes / muscle on IM injection — biodistribution is REAL but largely organ-, not single-cell-targeted."
  significance = "LNPs are the clearest case of nanomedicine enabling a therapeutic modality (mRNA / siRNA) that was impossible without them. They are also the closest thing to 'nanobots saving lives at scale' — and they are explicitly NOT robots, just well-engineered carriers."
  |> "[@x_pardi_2018] · [@x_adams_2018]"

@D dep_adc := "antibody-drug conjugates (ADC)" :: deployed [ok recommended]
  what = "Monoclonal antibody + chemical linker + cytotoxic payload — antibody provides targeting, linker controls release, payload kills."
  landmark = "Brentuximab vedotin (anti-CD30-MMAE, 2011, Hodgkin / ALCL); trastuzumab emtansine / T-DM1 (anti-HER2-DM1, 2013, HER2+ metastatic breast); trastuzumab deruxtecan / T-DXd (2019) extended to HER2-low disease."
  mechanism = "ADCs are receptor-targeted (true molecular targeting via Ab); internalization → lysosomal linker cleavage → payload release intracellularly. Bystander killing occurs via membrane-permeable payloads."
  honesty = "ADCs deliver clear OS / PFS benefit in selected biomarker-positive populations (e.g. T-DM1 in HER2+ breast cancer post-trastuzumab) — the closest deployed approach to 'targeted delivery'. Targeting is by antibody, not by autonomous robotic decision. Significant toxicity (neutropenia, peripheral neuropathy, ILD with some agents) remains."
  |> "[@x_verma_2012]"

@D dep_polymeric_np := "polymeric / albumin-bound nanoparticles" :: deployed [ok recommended]
  what = "Drug formulated with biodegradable polymers (e.g. PLGA) or non-covalent protein binding (albumin)."
  landmark = "Nab-paclitaxel (Abraxane, 2005) — albumin-bound paclitaxel; permits cremophor-free administration, altered pharmacokinetics and approved use in metastatic breast, NSCLC and pancreatic cancer (with gemcitabine)."
  honesty = "Abraxane's clinical advantage is largely cremophor avoidance and dose intensity, not dramatic tumor-targeting. Polymeric NP approvals in 2026 remain a relatively small list; many promising polymeric NP candidates have failed late-stage trials."

@D dep_inorganic_imaging := "iron-oxide / inorganic nanoparticles (imaging + niche therapeutic)" :: deployed [ok recommended]
  imaging = "Superparamagnetic iron-oxide nanoparticles (SPIONs / USPIOs) as MRI contrast agents; some agents withdrawn for commercial reasons rather than safety."
  therapeutic = "Ferumoxytol — approved for iron-deficiency anemia and used off-label as an MRI contrast agent; magnetic-hyperthermia (NanoTherm, glioblastoma) is a niche but real therapeutic deployment in Europe."
  honesty = "Inorganic nanomedicine is the smallest of the deployed classes. Magnetic-guidance and -heating ARE real physics, but clinical use is niche, not mainstream cancer therapy."

@D dep_summary := "deployed-class summary" :: deployed [ok]
  classes = "Liposome (PEGylated) · LNP (mRNA / siRNA) · ADC · polymeric / albumin-bound NP · iron-oxide imaging / hyperthermia."
  shared-feature = "All are passive formulations exploiting size, surface chemistry, and (for ADC) antibody recognition. None senses · decides · actuates."
  shared-limit = "Biodistribution is dominated by hepatic, splenic and renal clearance plus immune handling — see §4 real-limits. Targeting, where claimed, is via molecular recognition (Ab in ADC; ligand-receptor in research formulations), NOT autonomous navigation."

# ── §3 Active vs passive targeting · EPR effect · honest history ──────

@D mech_passive_epr := "EPR effect (passive tumor accumulation)" :: mechanism [ok]
  hypothesis = "Enhanced Permeability and Retention (Matsumura & Maeda 1986): solid tumors have leaky neovasculature + impaired lymphatic drainage → macromolecular / nanoparticulate agents extravasate and accumulate."
  influence = "EPR motivated decades of 'nanoparticle-to-tumor' development and is still cited as the passive-targeting rationale for liposomes, polymeric NP, and many investigational platforms."
  |> "[@x_matsumura_maeda_1986]"

@D mech_active_targeting := "active (ligand) targeting" :: mechanism [ok]
  concept = "Conjugate a targeting ligand (antibody, peptide, aptamer, small molecule) to a nanoparticle surface to bias uptake by antigen-positive cells."
  state = "ADCs are the clearest clinical success of antibody-mediated targeting — but they are NOT nanoparticles (they are antibody+payload conjugates). Nanoparticle + targeting-ligand formulations are largely still investigational."
  honesty = "Many published 'targeted nanoparticles' show only modest biodistribution shifts in preclinical models — protein corona formation, opsonization and clearance can dominate over engineered ligand–receptor binding in vivo."

@D mech_protein_corona := "protein corona & opsonization" :: mechanism [ok]
  what = "Within seconds to minutes of entering blood or serum, a nanoparticle adsorbs a layer of plasma proteins (the 'protein corona') that, more than the engineered surface, determines what cells see."
  consequence = "Opsonins (complement components, immunoglobulins) tag particles for clearance by the mononuclear phagocyte system (MPS) — primarily liver Kupffer cells and splenic macrophages. This is the dominant first-pass biodistribution force for IV nanoparticles."
  remedy-attempt = "PEGylation reduces but does not abolish opsonization; anti-PEG antibodies (pre-existing or induced) erode the stealth benefit on repeat dosing (see [@lim_anti_peg])."

@D mech_epr_honest_critique := "EPR effect — honest 2016 reassessment" :: mechanism [ok required]
  finding = "Wilhelm et al 2016 (Nat Rev Mater) analyzed published nanoparticle biodistribution data and reported that the MEDIAN delivered dose to solid tumors across the nanoparticle literature is approximately 0.7% of the injected dose — far below the optimistic figures EPR was once interpreted to imply."
  consequence = "EPR is real and useful in some tumor models, but it is NOT a robust route to high-fraction targeted delivery in human solid tumors. Inter-patient and inter-tumor heterogeneity in EPR is large; many human tumors have desmoplastic stroma, elevated interstitial fluid pressure and poor perfusion that suppress EPR."
  policy = "Any claim of 'X% tumor delivery via nanoparticle' should be checked against the Wilhelm 2016 distribution. Anchored as [@lim_epr_floor]."
  |> "[@x_wilhelm_2016]"

# ── §4 Research-stage 'nanobots': DNA origami · molecular machines ────

@D res_dna_origami := "DNA origami (Rothemund · Douglas)" :: research [ok]
  origami = "DNA origami (Rothemund 2006 Nature) — a long scaffold strand folded by hundreds of short 'staple' oligonucleotides into programmable 2D shapes; extended to 3D wireframe and solid shapes (Douglas 2009, Andersen 2009 DNA-box with reclosing lid)."
  why-it-matters = "Demonstrates atomic-scale programmable structure — a real, reproducible engineering substrate for nanoscale objects with defined geometry, addressability and stoichiometry."
  honesty = "DNA origami is foundational nanotechnology, not a clinical platform. Production at clinical scale, in-vivo stability, immunogenicity (CpG content, scaffold-strand origin) and cost remain open problems."
  |> "[@x_rothemund_2006] · [@x_douglas_2009] · [@x_andersen_2009]"

@D res_dna_nanorobot := "DNA-origami 'nanorobot' carriers (Douglas / Bachelet / Church 2012)" :: research [ok]
  what = "An aptamer-locked DNA-origami barrel that opens upon binding cell-surface cues, exposing an internal payload (antibody fragments) — published as a logic-gated drug-delivery 'nanorobot' (Douglas, Bachelet, Church 2012 Science)."
  status = "RESEARCH-STAGE. The 2012 paper showed in-vitro cell-line selectivity; later work explored in-vivo behavior in small animals (e.g. tumor-targeting DNA-origami nanorobots in mouse models, 2018). No FDA-approved DNA-origami therapeutic exists as of knowledge cutoff."
  honesty = "Calling this device a 'nanorobot' is a controlled overstatement common in the literature — it is a passively logic-gated cargo-release container, not an autonomous robot. The conflation of these devices with patient-deployable nanobots is the principal hype mechanism this tape pushes back on."
  |> "[@x_douglas_bachelet_church_2012]"

@D res_molecular_motors := "Feringa-style molecular motors & molecular machines" :: research [ok]
  nobel = "2016 Nobel Prize in Chemistry — Sauvage, Stoddart, Feringa — 'for the design and synthesis of molecular machines'. Sauvage: catenanes (interlocked rings); Stoddart: rotaxanes / molecular shuttles; Feringa: light-driven unidirectional rotary motors."
  significance = "Foundational chemistry — proves that single-molecule motion can be unidirectional, addressable and chemically/light-fueled. Inspires the long-term concept of molecular-machine therapeutics."
  status = "ZERO clinical use as of 2026. These molecules are in vitro / preparative chemistry. Operation in physiologic media (with ATP-analog fueling, biocompatibility, control at distance, immunogenicity) is unsolved."
  honesty = "The 2016 Nobel is the right citation for 'molecular machines exist'. It is NOT a citation for 'molecular machines are medicine'. Confusing the two is a category error."
  ref = "Feringa BL et al — unidirectional molecular motors (Nature 1999). Sauvage / Stoddart / Feringa — 2016 Nobel Prize in Chemistry. (Primary-author/era citation; exact volume not asserted.)"

@D res_seeman_dna_nanotech := "Seeman DNA nanotechnology foundations" :: research [ok]
  what = "Nadrian Seeman's structural-DNA-nanotechnology programme (from the early 1980s onward) established branched-DNA junctions and rationally designed DNA crystals as the substrate field on which all later DNA origami, DNA walkers and DNA computing rests."
  status = "Substrate science, not clinical."
  ref = "Seeman NC — structural DNA nanotechnology / DNA junctions (J Theor Biol 1982 and subsequent). Primary-author/era citation; exact volume not asserted."

@D res_motor_proteins := "biological motor proteins (kinesin / myosin / dynein)" :: research [ok]
  what = "Kinesin, myosin and dynein are the cell's actual molecular machines — ATP-fueled, directional, processive motors on cytoskeletal tracks (microtubules / actin)."
  significance = "Proves that high-fidelity nanoscale motion is biophysically possible; sets the inspirational reference for synthetic molecular motors and provides the kT ÷ binding-energy parameters that real-limit analyses (see [@lim_brownian]) must respect."
  honesty = "These are inspiration, not therapy. They cannot be redeployed in vivo as a nanobot platform; the cell has its own use for them."

@D res_swimmers := "magnetic / chemical micro- and nano-swimmers" :: research [draft]
  what = "Helical or Janus-particle microswimmers actuated by rotating magnetic fields, chemical gradients, or acoustic fields; a substantial in-vitro and small-animal literature exists."
  status = "Almost entirely preclinical. A handful of feasibility studies show navigation through ex-vivo vasculature or GI tract; in-human therapeutic deployment is not established."
  honesty = "Listed for completeness, not endorsed as a clinical modality. The energy / control / biocompatibility loop remains open."

# ── §5 Real-limits anchors (LATTICE_POLICY g1 — real-limits-first) ────

@D lim_epr_floor := "EPR / solid-tumor delivery efficiency floor" :: real-limit [ok required]
  wall = "HARD WALL"
  statement = "Median delivered dose of nanoparticles to solid tumors across the published literature is on the order of ~0.7% of injected dose (Wilhelm et al 2016 Nat Rev Mater). EPR is heterogeneous between tumors, patients and time; it cannot be assumed to give high-fraction targeted delivery in human solid tumors."
  consequence = "Designs that rely on EPR alone for high tumor exposure are bounded by this empirical floor. Improvements (active targeting, ADCs, local administration, stimulus-responsive release) work around — they do not categorically break — this distribution."
  |> "[@x_wilhelm_2016]"

@D lim_mps_clearance := "mononuclear phagocyte system (MPS) clearance" :: real-limit [ok required]
  wall = "HARD WALL"
  statement = "IV-administered nanoparticles are primarily cleared by the liver (Kupffer cells), spleen and, depending on size and surface, kidneys. The dominant first-pass biodistribution force is opsonization and MPS uptake, not the engineered targeting ligand."
  consequence = "Most of an injected nanoparticle dose ends up in liver/spleen on a timescale of minutes to hours, regardless of intended target. Surface engineering (PEGylation, zwitterionic coatings) attenuates but does not eliminate this — and PEGylation has its own immunogenicity limit ([@lim_anti_peg])."

@D lim_brownian := "thermal noise / Brownian-motion floor" :: real-limit [ok required]
  wall = "HARD WALL (thermodynamic)"
  statement = "At body temperature (~310 K), the thermal energy scale kT ≈ 4.3 × 10^-21 J (~2.6 kJ/mol). Any nanoscale binding event, gate, or actuation must operate against this stochastic background; binding free energies, gating barriers and motor step energies must each substantially exceed kT to be reliable."
  consequence = "An 'autonomous nanobot' navigating in vivo must reconcile (i) ATP-scale fuel quanta (~30 kJ/mol per ATP hydrolysis · ~12 kT), (ii) viscous drag at low Reynolds number, and (iii) Brownian randomization of position and orientation. This thermodynamic ceiling cannot be designed away."

@D lim_fueling := "in-vivo fueling problem" :: real-limit [ok required]
  wall = "HARD WALL (current chemistry / engineering)"
  statement = "Sustained nanoscale actuation requires an in-vivo fuel source. Natural motor proteins use ATP, supplied by cellular metabolism — not accessible to a free-floating synthetic device. External fields (rotating magnetic, focused ultrasound, light) can substitute energy but constrain depth, geometry and dosing."
  consequence = "No synthetic nanomachine has demonstrated long-duration autonomous in-vivo operation in humans. The fueling problem is one of the principal reasons clinical 'nanobots' do not yet exist; nanocarriers sidestep this by being passive."

@D lim_anti_peg := "anti-PEG / anti-corona immunogenicity" :: real-limit [ok required]
  wall = "SOFT WALL (immunological)"
  statement = "Anti-PEG antibodies are detectable in a substantial fraction of the general population (boosted further by PEGylated drug or PEG-cosmetic exposure) and can cause accelerated blood clearance (ABC) of PEGylated nanoparticles on repeat dosing. Protein corona components can also drive complement activation and infusion reactions."
  consequence = "Repeat dosing of PEGylated nanocarriers — the dominant deployed stealth strategy — can lose efficacy or trigger hypersensitivity in some patients. This is an immunological ceiling on 'just use more PEGylated nanoparticles' as a delivery strategy."

@D lim_regulatory_manufacturing := "regulatory + manufacturing complexity" :: real-limit [ok required]
  wall = "ENGINEERING / REGULATORY LIMIT"
  statement = "Nanomedicines are multicomponent products with critical quality attributes (size distribution, encapsulation efficiency, lipid identity / ratio, lot-to-lot reproducibility) that small-molecule manufacturing methods do not cover. Reviews follow combination-product / device-aware pathways and require characterization at a level few academic prototypes can sustain."
  consequence = "Many compelling preclinical nanocarriers fail to translate not because of biology but because of CMC (chemistry-manufacturing-controls), comparability and cost. This is a real, structural reason the deployed-class list (§2) is short."

@D lim_autonomy_gap := "current biology gap to 'autonomous nanobot in vivo'" :: real-limit [ok required]
  wall = "HARD WALL (current science, ~decades)"
  statement = "No system today combines (i) nanoscale size, (ii) onboard sensing, (iii) onboard decision logic, (iv) onboard actuation, (v) onboard or harvested energy, and (vi) biocompatibility + clearance — all simultaneously, in humans. Each element exists in isolation in research; integration in vivo at clinical scale does not."
  consequence = "'Therapeutic nanobots' as autonomous patient-deployable agents are an aspirational long-horizon goal, not a 2026 product. Honest statements about this field distinguish the deployed nanocarrier reality (§2) from the inspirational nanobot vision."

# ── §6 n=6 lattice stance (HONEST — observation, not derivation) ──────

@F f_lattice_fit := "lattice-fit-on-nanomedicine" :: governance [required deny:write]
  pattern = "Deriving nanomedicine efficacy / delivery fraction / tumor accumulation / dosing / curative ratios FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. the deleted stub's '약물 효율 σ²/φ=72배 증가' or '회복 24시간=J₂' or '비용 1/(σ-φ)=10분의 1'."
  why = "This is exactly the violation the pre-rewrite THERAPEUTIC-NANOBOT.tape committed (lattice-tautology stub, hexa-bio mass-split 153b5a2 — see THERAPEUTIC-NANOBOT.log.tape audit). hexa-bio AGENTS.tape g1/g2/g3/g8 + f1/f2/f3 forbid it; f1 forbids lattice-fit, f2 forbids in-silico→clinical claims, f3 forbids hype-domain shadow claims."
  remedy = "Cite real nanomedicine literature (this tape's @X entries: Wilhelm 2016 · Pardi 2018 · Barenholz 2012 · Verma 2012 · Rothemund 2006 · Douglas 2009 · Douglas/Bachelet/Church 2012). The lattice may only be a coincidental OBSERVATION, never a derivation source for any nanomedicine claim."

@N n6_honest_stance := "nanomedicine has no natural n=6 invariant" :: note [required]
  text = "Stated plainly: therapeutic nanomedicine and 'nanobot' research expose NO natural n=6 invariant. Deployed nanomedicine classes number neither 6 nor any other invariant — they are a small list of accidents-of-translation (liposome, LNP, ADC, polymeric NP, inorganic) that expands and contracts with approvals and withdrawals. EPR delivery fraction (~0.7% median, Wilhelm 2016) is an empirical distribution, not a lattice value. DNA-origami designs (Rothemund 2006) have arbitrary geometry, not lattice-fixed counts. Molecular-machine motor counts (Sauvage/Stoddart/Feringa) are chemistry choices, not invariants. Per LATTICE_POLICY g1/g2 + lattice-as-tool: the lattice is DECLINED here as a derivation tool — coincidence is OBSERVATION, never derivation. This honesty IS the corrective for the audited lattice-tautology stub this file replaced."

# ── §7 Verifiable predictions (real, falsifiable — NOT lattice) ───────

@D tp_1 := "TP-1 EPR / nanoparticle delivery efficiency floor" :: prediction [ok]
  claim = "A meta-analysis of nanoparticle biodistribution to solid tumors across published preclinical and clinical studies will show a median delivered dose on the order of ~1% or less of injected dose — i.e. the Wilhelm 2016 finding persists, possibly with modest improvement for active-targeting / ADC-style approaches, but not by orders of magnitude across the EPR-dominated class."
  falsifier = "If a properly conducted updated meta-analysis showed the median nanoparticle tumor delivery routinely above ~10% of injected dose across the literature, [@lim_epr_floor] is wrong."
  source = "[@x_wilhelm_2016]"

@D tp_2 := "TP-2 deployment lag for autonomous in-vivo nanorobots" :: prediction [ok]
  claim = "No autonomous in-vivo nanorobot (sensing + decision + actuation + energy + biocompatibility, all integrated at <100 nm) will gain regulatory approval in humans on a near-term horizon (~years). Approved 'nanomedicines' will continue to be passive carriers (LNP / liposome / ADC / polymeric / inorganic)."
  falsifier = "If a regulatory body (FDA / EMA / PMDA) approves a device that meets the autonomous-nanobot integration definition above for routine in-vivo therapeutic use within the prediction window, [@lim_autonomy_gap] is wrong."
  source = "[@x_wilhelm_2016] · current-knowledge structural argument"

@D tp_3 := "TP-3 anti-PEG / ABC on repeat nanocarrier dosing" :: prediction [ok]
  claim = "Repeat dosing of PEGylated nanocarriers will, in a measurable fraction of patients, drive anti-PEG antibody titers and accelerated blood clearance / hypersensitivity reactions — i.e. the 'stealth' benefit of PEGylation is not infinite-dose-tolerant."
  falsifier = "If properly powered prospective cohorts on repeat PEGylated-nanocarrier dosing showed no measurable rise in anti-PEG IgG/IgM and no ABC phenomenon, [@lim_anti_peg] is wrong."

# ── §8 Cross-links ────────────────────────────────────────────────────

@X x_cancer_sibling := "CANCER-THERAPY.tape" :: sibling-tape [active]
  scope = "Oncology biology + modality landscape. Cross-link: most clinically deployed nanomedicine (Doxil, T-DM1, T-DXd, nab-paclitaxel) is oncology — the EPR / heterogeneity / metastasis real-limits there compose with §5 here."

@X x_hexa_bio_agents := "hexa-bio AGENTS.tape" :: governance [active]
  scope = "g1 real-limits-first · g2 lattice-is-tool · g3 honesty-obligation-external · g8 in-silico-only-claim-scope · f1 lattice-fit forbidden · f2 wet-lab-clinical claim from in-silico forbidden · f3 shadow-implementation forbidden."

# ── §9 External citations (real, landmark literature) ─────────────────

@X x_rothemund_2006 := "Rothemund PWK 2006" :: literature [active]
  ref = "Rothemund PWK. Folding DNA to create nanoscale shapes and patterns. Nature 2006;440:297–302. (DNA origami foundational paper)"

@X x_douglas_2009 := "Douglas SM et al 2009" :: literature [active]
  ref = "Douglas SM, Dietz H, Liedl T, Högberg B, Graf F, Shih WM. Self-assembly of DNA into nanoscale three-dimensional shapes. Nature 2009;459:414–418. (3D DNA-origami)"

@X x_andersen_2009 := "Andersen ES et al 2009" :: literature [active]
  ref = "Andersen ES et al. Self-assembly of a nanoscale DNA box with a controllable lid. Nature 2009;459:73–76. (DNA-origami box / reclosing lid)"

@X x_douglas_bachelet_church_2012 := "Douglas SM, Bachelet I, Church GM 2012" :: literature [active]
  ref = "Douglas SM, Bachelet I, Church GM. A logic-gated nanorobot for targeted transport of molecular payloads. Science 2012;335:831–834. (DNA-origami 'nanorobot' barrel, in-vitro logic-gated cargo release)"

@X x_wilhelm_2016 := "Wilhelm S et al 2016" :: literature [active]
  ref = "Wilhelm S, Tavares AJ, Dai Q, Ohta S, Audet J, Dvorak HF, Chan WCW. Analysis of nanoparticle delivery to tumours. Nat Rev Mater 2016;1:16014. (~0.7% median delivered dose to solid tumors — the empirical EPR-floor anchor)"

@X x_pardi_2018 := "Pardi N et al 2018" :: literature [active]
  ref = "Pardi N, Hogan MJ, Porter FW, Weissman D. mRNA vaccines — a new era in vaccinology. Nat Rev Drug Discov 2018;17:261–279. (mRNA-LNP modality review)"

@X x_barenholz_2012 := "Barenholz Y 2012" :: literature [active]
  ref = "Barenholz Y. Doxil® — the first FDA-approved nano-drug: lessons learned. J Control Release 2012;160:117–134. (Doxil retrospective)"

@X x_verma_2012 := "Verma S et al 2012" :: literature [active]
  ref = "Verma S et al. Trastuzumab emtansine for HER2-positive advanced breast cancer. N Engl J Med 2012;367:1783–1791. (T-DM1 / Kadcyla — landmark ADC trial)"

@X x_matsumura_maeda_1986 := "Matsumura Y, Maeda H 1986" :: literature [active]
  ref = "Matsumura Y, Maeda H. A new concept for macromolecular therapeutics in cancer chemotherapy: mechanism of tumoritropic accumulation of proteins and the antitumor agent smancs. Cancer Res 1986;46:6387–6392. (EPR effect original description; primary-author/era cited, exact volume per Cancer Res 1986)"

@X x_adams_2018 := "Adams D et al 2018" :: literature [active]
  ref = "Adams D et al. Patisiran, an RNAi therapeutic, for hereditary transthyretin amyloidosis. N Engl J Med 2018;379:11–21. (Onpattro / patisiran — first siRNA-LNP approval landmark; primary-author/era cited)"
