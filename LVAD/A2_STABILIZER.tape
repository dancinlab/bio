#!/usr/bin/env tape
# LVAD scenario ② · vWF A2 shear-unfolding stabilizer · QUANTUM-driven
# Tier A · white-space (approved drugs = 0)

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §1 Identity ─────────────────────────────────────────────────────

@I id := "lvad.a2-stabilizer" :: identity-claim [d=2026-05-16 active]
  kind = "vWF A2-domain shear-unfolding stabilizer · small-molecule chaperone"
  axis = "QUANTUM"
  parent = "./README.md §3"
  tier = "A · highest novelty"
  scope = "in-silico chaperone candidate VQE binding-energy screen"

# ─── §2 Target problem ───────────────────────────────────────────────

@N target := "clinical-unmet-need" :: note [active]
  problem = "acquired von Willebrand syndrome (aVWS)"
  mechanism <<~EOF
    LVAD pump shear (70-150 dyn/cm²) → vWF A2 domain elongation
      → ADAMTS13 cleavage at Tyr1605-Met1606
      → high-molecular-weight multimer loss
      → impaired primary hemostasis + GI angiodysplastic bleeding
  EOF
  prevalence = ">75% of LVAD recipients · also ECMO · also aortic stenosis (Heyde syndrome)"
  approved-therapy = "none — recombinant vWF (Vonvendi) replaces, does not fix mechanism"

# ─── §3 Real-limits anchor (g1) ──────────────────────────────────────

@D real-limits := "real-limits-first-anchor" :: governance [required]
  rule = "verification anchors ≥1 real limit (per AGENTS.tape g1)"
  limits = [
    "ADAMTS13 k_cat ≈ 2.5/s on stretched A2",
    "A2 unfolding ΔG ≈ 7-10 kcal/mol (low-force regime)",
    "shear threshold for A2 cleavage exposure ≈ 30 dyn/cm² (well below LVAD 70-150)",
    "vWF multimer MW range 500 kDa - 20 MDa · HMW = >10 MDa lost first"
  ]
  authority = "[@g1]"

# ─── §4 5-axis contribution ──────────────────────────────────────────

@D contribution := "5-axis-mapping" :: decision [active]
  primary-axis = "QUANTUM"
  modules = [
    "quantum/pocket_active_space.py",
    "quantum/pocket_vqe_orchestrator.py",
    "_qiskit_bridge/module/pocket_vqe_orchestrator.py"
  ]
  workflow <<~EOF
    [classical MD]  shear-induced A2 unfolding intermediate ensemble
       ↓
    [QM carve-out]  active-space around exposed Tyr1605-Met1606 cleavage site
       ↓
    [VQE]           binding-energy estimate for chaperone candidates vs intermediate
       ↓
    [ranking]       shortlist for wet-lab (outside hexa-bio scope)
  EOF

# ─── §5 Novelty rationale ────────────────────────────────────────────

@N novelty := "why-novel" :: note [active]
  white-space = "target mechanism well-characterized · approved drugs = 0"
  competing-approaches = [
    "recombinant vWF replacement — replaces factor, not mechanism",
    "ADAMTS13 inhibitors — risk of acquired TTP"
  ]
  differentiator = "small-molecule chaperone stabilizes A2 cleavage-resistant fold without systemic ADAMTS13 block"

# ─── §6 Honest boundaries (g8 / f2) ──────────────────────────────────

@D limits := "honest-boundaries" :: governance [required deny:overclaim]
  scope = "in-silico C2 simulator+metadata consistency only · NOT a therapeutic claim"
  authority = "[@g8] · [@f2]"
  unknowns = [
    "A2 unfolding intermediate not crystallographically resolved — model-dependent",
    "shear-induced ensemble correctness depends on classical MD sampling",
    "selectivity vs A1/A3 domains unverified in-silico"
  ]

@F overclaim := "no-clinical-claim-from-c2-pass" :: governance [required deny:write]
  pattern = "any phrasing that implies in-silico VQE binding rank = clinical efficacy"
  remedy = "use 'in-silico candidate ranking · wet-lab validation required' phrasing"
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
  scope = "§3 ② A2 stabilizer"
