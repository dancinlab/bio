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
#
# COMPUTE_PORTFOLIO.tape — architecture-current (editable per v1.2)
# Event history → COMPUTE_PORTFOLIO.log.tape sibling
# Long-form sibling: COMPUTE_PORTFOLIO.md (substrate × workload × readiness matrix)
# Science SSOT for exotic substrates: XENO.tape

@V := "tape" :: spec [active]
  version = "1.2"

# ─── §0 Identity ──────────────────────────────────────────────────────

@I id001 := "compute-portfolio" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · compute-substrate portfolio meta-SSOT"
  brief = "compute-substrate portfolio meta-SSOT (qmirror / xeno routes / classical fallback) · n=6 mentions = artifact-naming NOT derivation · science cross-link XENO.tape"
  parent = "dancinlab/hexa-bio"
  sibling-log = "COMPUTE_PORTFOLIO.log.tape"
  sibling-md = "COMPUTE_PORTFOLIO.md"
  tape-class = "meta/portfolio"
  scope = "in-silico compute-portfolio meta-tape · NOT science derivation · XENO.tape carries the exotic-substrate science"
  rewritten-from = "lattice-tautology stub (hexa-bio mass-split 153b5a2); meta-mode honesty rewrite 2026-05-16 — see COMPUTE_PORTFOLIO.log.tape audit"

# ─── §0.1 Honesty preamble ────────────────────────────────────────────

@F f_lattice_fit := "lattice-fit-in-compute-portfolio" :: governance [required deny:write]
  pattern = "Deriving any count / ratio / routing claim FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) inside a compute-portfolio entry — e.g. using σ·φ to explain why there are N substrates, or treating 'qmirror-chemistry-VQE used as σ-J₂ routing target' as science rather than artifact-naming."
  why = "The compute substrate catalogue (qmirror routes, xeno hardware bridges, classical fallback) is an engineering portfolio. Substrate counts, VQE tier counts, and routing decisions are consequences of software architecture + available hardware + workload requirements — NOT derivations from the n=6 lattice. Lattice tokens that appear as artifact names in past work (e.g. 'σ-J₂ routing target' as a feature name in a prior design) are PROVENANCE of how a feature was named, not derivation evidence."
  remedy = "Cite the real underlying engineering reason (sister-repo CLI architecture, hexa-lang RFC, hardware readiness gate). Lattice coincidences in substrate counts are observation only."
  authority = "[@x_lattice_policy] g1/g2 · hexa-bio AGENTS.tape f1 · [@x_agents_tape] g_meta_mode_optin"

@N n6_honest_stance := "compute-portfolio lattice mentions are artifact-naming, not derivation" :: note [required]
  text = "Stated plainly and honestly: this tape is a compute-portfolio catalogue for hexa-bio. The n=6 tokens (σ τ φ J₂) that may appear in substrate names or legacy design docs are ARTIFACT NAMES — the provenance of how features or routing targets were labelled — never a derivation of any routing choice, substrate count, or capability claim FROM the lattice. The number of live substrates (qmirror, xeno, classical-cpu) is determined by what sister repos (dancinlab/qmirror, dancinlab/xeno) actually provide and what hexa-bio workloads actually need. Per LATTICE_POLICY g1/g2, the lattice is declined here as a derivation tool. This honesty preamble is the meta-mode opt-in corrective (tape-class = meta/portfolio · AGENTS.tape g_meta_mode_optin · d=2026-05-16)."

# ─── §1 Portfolio scope + long-form sibling deferral ─────────────────

@N scope_disclaimer := "compute-portfolio scope honesty" :: note [required]
  text = "This tape is the machine-readable identity + governance layer for the compute-portfolio domain. The detailed substrate × workload × readiness matrix, the quantum-compute ladder (Tier 0-5), and the per-route gating constraint tables live in COMPUTE_PORTFOLIO.md (long-form sibling — see [@x_compute_portfolio_md]). The exotic-substrate science (neuromorphic foundations, quantum hardware physics, organoid intelligence, QRNG) lives in XENO.tape (see [@x_xeno_sibling]). This tape does NOT duplicate either. Agents referencing compute-portfolio details must read the long-form sibling."

# ─── §2 Portfolio inventory (summary — full matrix in COMPUTE_PORTFOLIO.md) ──

@D portfolio_qmirror := "qmirror compute routes — quantum state-vector + chemistry-VQE" :: portfolio [active]
  sister-repo = "dancinlab/qmirror"
  cli-gate = "selftest/qmirror_chemistry_vqe_gate.sh · selftest/cmt_vqe_ladder_readiness.sh"
  routes = [
    "qmirror state-vector (≤30 qubit) — Mpro pocket VQE, 5-warhead library, 11-drug pocket",
    "qmirror chemistry-VQE H2/STO-3G cond.14 — spectroscopic-accuracy gate (pure-hexa)",
    "qmirror chemistry-VQE CMT 2e/2o — 5 scaffolds (clc1/sar1/mfn2/hd6/gjb1) vendored Hamiltonians",
    "qmirror chemistry-VQE 4e/4o — 6 molecules (LiH + 5 CMT) vendored ψ* replay",
    "qmirror chemistry-VQE Ramp B externalized NM — pure-hexa energy + Python-stdlib NM driver",
    "qmirror chemistry-VQE Ramp B in-process 6/6 — RFC 034+035 C kernels, 768 MB cap",
    "qmirror chemistry-VQE Ramp B-2 4e/5o — 8-qubit, 6/6, RFC 036 packed-handle",
    "qmirror chemistry-VQE Ramp B-3 4e/6o — 10-qubit, 6/6, HEXA_MEM_UNLIMITED=1",
    "ADAPT-VQE (LiH 4e/4o K=10 ops |Δ|=0.043 µHa, 62% param-reduction) + k-UpCCGSD alternatives"
  ]
  status = "live — all routes gated by run_all.sh (35/35 selftest suite)"
  open-ramps = "4e/7o-12q+ active-space / final-molecule geometries / pocket-embedded QM/MM-VQE"
  note = "n=6 does NOT determine this route list. Routes reflect qmirror's chemistry-VQE RFC ladder (033-039) + hexa-bio workload requirements. See COMPUTE_PORTFOLIO.md §2/§3/§4 for full detail."
  ?> x_compute_portfolio_md

@D portfolio_xeno := "xeno compute routes — exotic hardware orchestration" :: portfolio [active]
  sister-repo = "dancinlab/xeno"
  cli-gate = "selftest/xeno_substrate_gate.sh · selftest/akida_workload_readiness.sh"
  routes = [
    "xeno → AKIDA AKD1000 (BrainChip neuromorphic, 1W) — ribozyme off-target scan / nanobot actuation / medical-device EEG-EMG-ECG / cas13 lateral-flow [PENDING: AKD1000 chip arrival]",
    "xeno → Loihi3 (Intel neuromorphic) — no hexa-bio workload mapped yet [unexplored]",
    "xeno → IonQ (trapped-ion quantum-gate) — real-noise VQE Tier 4, needs vendor account [unexplored]",
    "xeno → FinalSpark organoid (biological compute) — far-future EEG training-data source [unexplored]",
    "xeno → Cortical Labs DishBrain (biological compute) — same scope as FinalSpark [unexplored]",
    "xeno → QRNG (quantum random number entropy) — live via xeno status, also overlaps qmirror ANU QRNG"
  ]
  status = "xeno orchestrator live (xeno status); substrate-level workloads gated on Phase 1.5+ (AKD1000 arrival + falsifier subcommand)"
  science-ssot = "XENO.tape carries the neuromorphic / organoid / quantum-hardware scientific grounding. This entry is portfolio routing only — see [@x_xeno_sibling]."
  ?> x_xeno_sibling

@D portfolio_classical := "classical CPU fallback — universal floor" :: portfolio [active]
  routes = ["numpy/scipy classical CPU — always available, ≤10-qubit ceiling, 35/35 selftest floor"]
  status = "live — unconditional fallback; no sister-repo dependency"
  fallback-principle = "Every compute substrate (qmirror, xeno, AKIDA, IonQ) is OPTIONAL. A host with zero substrates still gets full hexa-bio CORE function: 5-axis falsifier preregisters, in-repo selftests, deductive verification — all on classical CPU. SKIP is honest, never a regression."
  note = "The classical-cpu fallback is not a lattice derivation — it is the unconditional floor guaranteed by the AGENTS.md sister-repo SKIP-is-honest rule ([@x_agents_tape] g7_skip_is_honest)."

# ─── §3 Sister-repo CLI architecture (anti-duplication contract) ──────

@D portfolio_cli_contract := "sister-repo CLI architecture for compute routes" :: governance [required]
  rule = "hexa-bio gates (PASS/SKIP/FAIL) the sister repo's own selftest output and emits witness rows. It does NOT reimplement chemistry-VQE / neuromorphic routing / organoid logic. CLI-direct, no Python wrappers — sister repos update on their own cadence."
  authority = "[@x_agents_tape] g5_sister_repo_cli · g6_gates_not_reverifications · g7_skip_is_honest"
  applies-to = [qmirror, xeno]
  note = "Shadow-implementation of sister-repo routing inside hexa-bio is the forbidden pattern — see AGENTS.tape f3."

# ─── §4 Grounding (meta-mode: governance citations) ──────────────────

@X x_lattice_policy := "echoes/LATTICE_POLICY.md" :: governance [active]
  url = "https://github.com/dancinlab/echoes/blob/main/LATTICE_POLICY.md"
  scope = "real-limits-first · lattice-is-tool · observation-not-derivation — the governance authority this preamble enforces"

@X x_agents_tape := "hexa-bio AGENTS.tape" :: governance [active]
  path = "./AGENTS.tape"
  scope = "g1 real-limits-first · g2 lattice-is-tool · g5_sister_repo_cli · g6 gates-not-reverifications · g7 skip-is-honest · g_meta_mode_optin · f1 lattice-fit-on-external-entity · f3 shadow-implementation"

@X x_compute_portfolio_md := "COMPUTE_PORTFOLIO.md" :: doc [active]
  path = "./COMPUTE_PORTFOLIO.md"
  scope = "long-form sibling SSOT — substrate × workload × readiness matrix · quantum-compute ladder (Tier 0-5) · Tier-2 gap realization detail (F-Q-6-E ramp) · per-route gating constraints"
  note = "All detailed substrate/workload/readiness content deferred to this long-form sibling per the COEXIST pattern (AGENTS.tape h1)"

@X x_xeno_sibling := "XENO.tape" :: sibling-tape [active d=2026-05-16]
  path = "./XENO.tape"
  scope = "exotic-compute-substrate science SSOT — neuromorphic (Loihi/Akida/SpiNNaker), quantum hardware (IonQ trapped-ion), organoid intelligence (FinalSpark/DishBrain), QRNG — scientific grounding for the xeno routes catalogued in this portfolio tape"
  committed = "9328878"
  division-of-labour = "XENO.tape = science knowledge SSOT; COMPUTE_PORTFOLIO.tape = portfolio routing catalogue; neither duplicates the other (AGENTS.tape f3 anti-duplication)"
