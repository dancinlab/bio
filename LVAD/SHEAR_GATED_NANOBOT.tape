#!/usr/bin/env tape
# LVAD scenario ① · shear-gated therapeutic delivery · NANOBOT × QUANTUM
# Tier A · spatial specificity novelty

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §1 Identity ─────────────────────────────────────────────────────

@I id := "lvad.shear-gated-nanobot" :: identity-claim [d=2026-05-16 active]
  kind = "shear-responsive nanobot · LVAD-pump-internal payload release"
  axis = "NANOBOT × QUANTUM"
  parent = "./README.md §3"
  tier = "A · spatial-specificity novelty"
  scope = "in-silico shear-actuator kinematics + payload binding-site VQE"

# ─── §2 Target problem ───────────────────────────────────────────────

@N target := "clinical-unmet-need" :: note [active]
  problem = "pump thrombosis vs systemic bleeding trade-off"
  mechanism <<~EOF
    LVAD requires anticoagulation (warfarin INR 2.0-3.0 + aspirin)
      → systemic effect → intracranial / GI bleeding (top mortality)
      ↔ insufficient anticoagulation → pump thrombosis (catastrophic)
    narrow therapeutic window · no spatial discrimination available today
  EOF
  approved-therapy = "warfarin + aspirin (systemic, non-spatial)"

# ─── §3 Real-limits anchor (g1) ──────────────────────────────────────

@D real-limits := "real-limits-first-anchor" :: governance [required]
  rule = "verification anchors ≥1 real limit (per AGENTS.tape g1)"
  limits = [
    "LVAD impeller shear stress 70-150 dyn/cm² (HeartMate 3 axial zones)",
    "physiological venous/arterial shear 1-10 dyn/cm² (>10× separation)",
    "RBC hemolysis threshold ≈ 400 dyn/cm² × time integral",
    "nanobot residence time in pump <1 s per pass · trigger response must be sub-second",
    "FXI Ki target for narrow-window anticoagulation ~10-100 nM"
  ]
  authority = "[@g1]"

# ─── §4 5-axis contribution ──────────────────────────────────────────

@D contribution := "5-axis-mapping" :: decision [active]
  primary-axes = [NANOBOT, QUANTUM]
  modules = [
    "hexa-nanobot/ — C0b skeleton simulator",
    "_python_bridge/module/nanobot_actuation_simulation.py",
    "_python_bridge/module/nanobot_actuator_v2_reference_emit.py",
    "_python_bridge/module/nanobot_l6_l7_contract_test.py",
    "quantum/pocket_vqe_orchestrator.py (payload binding)"
  ]
  workflow <<~EOF
    [NANOBOT]   shear-sensor actuator kinematics · trigger threshold > 50 dyn/cm²
       ↓
    [NANOBOT]   payload release latch model · sub-second response verification
       ↓
    [QUANTUM]   payload candidate (e.g. FXI inhibitor) active-site VQE
       ↓
    [coupling]  payload-loaded nanobot stability under physiologic shear (no premature release)
  EOF

# ─── §5 Novelty rationale ────────────────────────────────────────────

@N novelty := "why-novel" :: note [active]
  white-space = "shear-responsive nanoparticles exist in literature · LVAD-impeller-zone as explicit trigger ≈ none"
  competing-approaches = [
    "systemic FXI/FXII inhibitors (asundexian, milvexian) — still systemic",
    "surface-coating antithrombotic (see WEAVE_COATING.tape) — passive, not gated"
  ]
  differentiator = "spatial separation of where anticoagulation acts (pump-internal) from where bleeding risk is paid (systemic)"

# ─── §6 Honest boundaries (g8 / f2) ──────────────────────────────────

@D limits := "honest-boundaries" :: governance [required deny:overclaim]
  scope = "in-silico C2 simulator+metadata consistency only"
  authority = "[@g8] · [@f2]"
  unknowns = [
    "<1 s residence time vs trigger response — kinetic feasibility unproven in-silico",
    "biocompatibility · clearance · immunogenicity all wet-lab boundary",
    "payload leakage rate under physiologic shear — must be near-zero"
  ]

@F overclaim := "no-pump-trial-claim-from-c2-pass" :: governance [required deny:write]
  pattern = "implying in-silico actuator-model PASS = device approval / animal-study readiness"
  remedy = "phrase as 'kinetic feasibility shortlist · wet-lab + bench-pump validation required'"
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
  scope = "§3 ① shear-gated nanobot"
