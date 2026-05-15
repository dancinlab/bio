#!/usr/bin/env tape
# LVAD scenario ③ · AAV-mediated Bridge-to-Recovery gene therapy
# VIROCAPSID × RIBOZYME · paradigm-shift potential

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §1 Identity ─────────────────────────────────────────────────────

@I id := "lvad.aav-btr" :: identity-claim [d=2026-05-16 active]
  kind = "AAV-delivered cardiac gene therapy co-administered with LVAD · goal = explant"
  axis = "VIROCAPSID × RIBOZYME"
  parent = "./README.md §3"
  tier = "A · paradigm shift potential"
  scope = "in-silico capsid stability + ribozyme guide MFE + off-target screen"

# ─── §2 Target problem ───────────────────────────────────────────────

@N target := "clinical-unmet-need" :: note [active]
  problem = "LVAD-as-destination-therapy default · myocardial-recovery weaning rare (5-15%) and unpredictable"
  mechanism <<~EOF
    underlying genetic dilated cardiomyopathy (LMNA/TTN/MYH7 etc.)
      → LVAD unloads ventricle → partial reverse remodeling
      → but without curing the genetic substrate, recovery plateaus
    BTR hypothesis: LVAD afterload reduction + AAV gene therapy = synergistic recovery → explant
  EOF
  approved-therapy = "none for LVAD-BTR · prior gene-therapy trials (CUPID/AGENT-HF) excluded LVAD cohort"

# ─── §3 Real-limits anchor (g1) ──────────────────────────────────────

@D real-limits := "real-limits-first-anchor" :: governance [required]
  rule = "verification anchors ≥1 real limit (per AGENTS.tape g1)"
  limits = [
    "AAV9 single-stranded cargo capacity ≈ 4.7 kb (hard wall)",
    "cardiac transduction efficiency <30% even with AAV9/MyoAAV",
    "AAV capsid icosahedral T=1 · 60 subunit assembly · Caspar-Klug compatible",
    "ribozyme off-target floor: hammerhead ~10⁻³, cleaner via tertiary contacts",
    "AAV9 hepatic sequestration ~70% of dose unless detargeted",
    "pre-existing anti-AAV9 neutralizing Ab prevalence 30-50% in adults"
  ]
  authority = "[@g1]"

# ─── §4 5-axis contribution ──────────────────────────────────────────

@D contribution := "5-axis-mapping" :: decision [active]
  primary-axes = [VIROCAPSID, RIBOZYME]
  modules = [
    "hexa-virocapsid/ — capsid assembly substrate",
    "_python_bridge/module/virocapsid_pdb_corpus.py",
    "hexa-ribozyme/ — ribozyme catalysis sandbox",
    "_python_bridge/module/ribozyme_mfe_nussinov.py",
    "_python_bridge/module/ribozyme_off_target_screen.py",
    "_python_bridge/module/ribozyme_reaction_coordinate_quotient.py",
    "_python_bridge/module/ribozyme_kinetics_simulation.py"
  ]
  workflow <<~EOF
    [VIROCAPSID]  AAV9 / MyoAAV / AAVMYO capsid variant assembly thermodynamic verification
       ↓
    [VIROCAPSID]  cargo-loaded capsid stability check (4.7 kb fill limit)
       ↓
    [RIBOZYME]   variant-correction guide design (LMNA / TTN / MYH7)
       ↓             · MFE folding (Nussinov)
       ↓             · off-target screen
       ↓             · reaction-coordinate quotient
       ↓
    [coupling]   cardiomyocyte-restricted gating (miR-208a/499 sponging)
       ↓
    [ranking]    candidate cargo+capsid pairs for wet-lab (outside scope)
  EOF

@N candidate-cargo := "cargo-shortlist" :: note
  list = [
    "SERCA2a (ATP2A2) — Ca²⁺ reuptake restoration · prior CUPID trial cargo",
    "MYBPC3 wildtype — for HCM-to-DCM transitioned hearts",
    "β-ARKct — βAR signaling rescue",
    "trans-splicing ribozyme — LMNA/TTN exon correction in-place"
  ]

# ─── §5 Novelty rationale ────────────────────────────────────────────

@N novelty := "why-novel" :: note [active]
  white-space = "LVAD-cohort gene therapy + BTR explant goal = untrodden"
  synergy-hypothesis = "LVAD unloading creates a low-wall-stress window where cardiomyocyte biosynthesis can favor recovery proteins · gene therapy supplies the missing factor in that window"
  competing-approaches = [
    "CUPID (SERCA2a) — non-LVAD cohort · mixed results",
    "AGENT-HF (adenylyl cyclase 6) — non-LVAD · halted",
    "AskBio LION-CS101 LMNA — Phase I · non-LVAD"
  ]
  differentiator = "explicit LVAD co-administration + explant endpoint, not symptom reduction"

# ─── §6 Honest boundaries (g8 / f2) ──────────────────────────────────

@D limits := "honest-boundaries" :: governance [required deny:overclaim]
  scope = "in-silico C2 simulator+metadata consistency only"
  authority = "[@g8] · [@f2]"
  unknowns = [
    "human cardiac transduction efficiency unknown · animal models extrapolate poorly",
    "pre-existing anti-AAV9 immunity excludes ~40% of candidate recipients",
    "synergy hypothesis (LVAD + gene therapy) untested in humans",
    "trans-splicing ribozyme in-vivo efficiency historically low (<10%)",
    "BTR explant criteria not standardized across centers"
  ]

@F overclaim := "no-explant-claim-from-c2-pass" :: governance [required deny:write]
  pattern = "implying in-silico cargo+capsid PASS = LVAD weaning feasibility"
  remedy = "phrase as 'in-silico candidate pair · long path to BTR demonstration'"
  <: limits

# ─── §7 External citations ───────────────────────────────────────────

@X g1 := "AGENTS.tape g1_real_limits_first" :: governance [active]
  path = "../AGENTS.tape"

@X g8 := "AGENTS.tape g8_in_silico_only_claim_scope" :: governance [active]
  path = "../AGENTS.tape"

@X f2 := "AGENTS.tape f2_wet_lab_clinical_claim_from_in_silico" :: governance [active]
  path = "../AGENTS.tape"

@X parent := "LVAD scenario portfolio" :: doc [active]
  path = "./README.md"
  scope = "§3 ③ AAV BTR gene therapy"
