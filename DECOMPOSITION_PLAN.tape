#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# .tape v1.2 — grammar primer (cold-read by any LLM / agent / human)
# ══════════════════════════════════════════════════════════════════════
# Form: each entry is `@<type> <id> := "<subject>" :: <kind> [<grades>]`
#       optionally followed by body lines (2-space indent) — key=value,
#       edges (<- → => …), or quoted prose.
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
# DECOMPOSITION_PLAN.tape — architecture-current (editable per v1.2)
# Event history → DECOMPOSITION_PLAN.log.tape sibling
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@I id001 := "decomposition-plan" :: identity-claim [d=2026-05-16 active]
  kind = "HEXA-Bio family · repo decomposition plan"
  brief = "hexa-medic 24-verb split · hexa-bio squat cleanup · Floréa 🌸 bootstrap — PROPOSAL (no moves pending as of 2026-05-12)"
  parent = "dancinlab/hexa-bio"
  sibling-md = "DECOMPOSITION_PLAN.md"
  sibling-log = "DECOMPOSITION_PLAN.log.tape"
  tape-class = "meta/plan"
  rewritten-from = "DECOMPOSITION_PLAN.tape pre-2026-05-16 (no honesty contract)"
  methodology-cite = "honesty contract applied per AGENTS.tape g_meta_mode_optin (d=2026-05-16) — meta-mode widens grounding to @X :: governance"

# ── §0 Scope disclaimer ──────────────────────────────────────────────

@N scope_disclaimer := "decomposition plan scope — in-repo planning only" :: note [required]
  text = "This tape describes a REPO DECOMPOSITION PLAN: which verbs move where, which repos get created/deleted. It is organizational engineering (git mv, gh repo create/delete) — not molecular science. No wet-lab claim, no efficacy claim, no lattice-derived count. The n=6 family token appears in the plan text as the NAME of the family (hexa-*) and as a branding note for Floréa — these are IDENTIFIERS, not derivations from the lattice. Per LATTICE_POLICY g1/g2: the lattice is a tool, not a constraint; counts in this plan (24 verbs, 35+ sister repos, 5 axes) are sourced from the actual repo inventory, not from any lattice arithmetic."

# ── §1 Plan content — hexa-medic 24-verb decomposition ──────────────

@D d_hexa_medic_decompose := "hexa-medic 24-verb split" :: plan [ok d=2026-05-12]
  status = "COMPLETE 2026-05-12 — all 24 verbs resolved"
  directive = "User 2026-05-12: hexa-medic 분해 — 미용(cosmetic) + hexa-bio 흡수 두 갈래로"
  outcome = "14 verbs DELETED (therapy-class) · 6 verbs MOVED to Floréa · 1 verb MOVED to hexa-bio/medical-device/ · 1 verb MOVED to hexa-matter · hexa-medic itself DELETED"
  moves-florea = [cosmetic-surgery, hair-regeneration, perfumery, tattoo-removal, mens-intimate-cleanser, womens-intimate-cleanser]
  moves-hexa-bio = [medical-device]
  moves-hexa-matter = [microplastics]
  deleted-therapy-class = [cancer-therapy, gastrointestinal-medicine, hiv, hiv-treatment, immunology, pharmacology, radiation-biology, vaccine, virology, therapeutic-nanobot]
  deleted-scope-ambiguous = [herbalism, music-therapy, neuropharmacology, nuclear-medicine, sleep-medicine, tibetan-medicine]
  infra-retained = ["cli/, tests/, state/, papers/, IMPORTED_FROM_CANON.md, hexa.toml, install.hexa, CITATION.cff, LICENSE"]

@D d_hexa_medic_delete := "hexa-medic repo deletion" :: plan [ok d=2026-05-12]
  <- d_hexa_medic_decompose
  decision = "User: (A) 완전 삭제 over (B) meta-index 축소"
  action = "gh repo delete dancinlab/hexa-medic --yes + rm -rf ~/core/hexa-medic (2026-05-12 cycle-30++++++)"
  git-history = "per-file lineage preserved via commit message + frontmatter @canonical annotation in destination repos — intentional clean cut-off"

# ── §2 Plan content — hexa-bio squat cleanup ────────────────────────

@D d_hexa_bio_squat := "hexa-bio 5-axis discipline cleanup" :: plan [ok d=2026-05-12]
  status = "COMPLETE 2026-05-12"
  out-of-axis-removed = [dolphin, dolphin-bioacoustics, hexa-limb, hexa-skin]
  moves = ["dolphin/ + dolphin-bioacoustics/ → hexa-brain/reference/ (cetacean intelligence / bioacoustics)", "hexa-limb/ → hexa-bot/reference/ (의수족 = 로봇 substrate)", "hexa-skin/ → Floréa/skincare/ (cosmetic 측면)"]
  kept-in-hexa-bio = [crispr-cas13-poc-diagnostic, crispr-gene-editing, synbio]
  kept-rationale = "CRISPR-Cas13 = catalytic RNA = ribozyme axis adjacent · gene therapy = ribozyme axis direct link · synbio = 5-axis foundational"
  deleted-rejected-axis-explorations = [".roadmap.axis_bio_evolution_exploration", ".roadmap.axis_consciousness_exploration", ".roadmap.axis_planetary_health_exploration", ".roadmap.axis_quantum_biology_exploration", ".roadmap.disease_planetary_health", ".roadmap.disease_dermatology"]
  boundary-ambiguous-pending = [".roadmap.disease_aesthetic_dermatology", ".roadmap.disease_acne_specific", ".roadmap.disease_aging_specific", ".roadmap.disease_alopecia", ".roadmap.disease_alopecia_areata_specific", ".roadmap.disease_atopic_dermatitis_specific"]
  boundary-note = "cosmetic-adjacent items with therapeutic side — user case-by-case decision needed"

# ── §3 Plan content — Floréa bootstrap ──────────────────────────────

@D d_florea_bootstrap := "Floréa 🌸 dancinlab/florea creation" :: plan [ok d=2026-05-12]
  name = "Floréa"
  slug = "dancinlab/florea"
  pronunciation = "flo·RAY·ah / 플로레아"
  scope = "화장품 + 미용 + 성형 + skincare + 모발 + 향수 + 시술 — cosmetic / aesthetic 영역 전체"
  branding = "French-rooted standalone brand (Lumière style) — NOT hexa-* prefixed; K-beauty / 글로벌 cosmetic 양쪽 친화"
  initial-contents = ["cosmetic-surgery/ ← hexa-medic", "hair-regeneration/ ← hexa-medic", "perfumery/ ← hexa-medic", "tattoo-removal/ ← hexa-medic", "mens-intimate-cleanser/ ← hexa-medic", "womens-intimate-cleanser/ ← hexa-medic", "skincare/ ← hexa-bio/hexa-skin/", ".roadmap.disease_aesthetic_dermatology ← hexa-bio", ".roadmap.disease_acne_cosmetic ← hexa-bio (cosmetic side)", ".roadmap.disease_aging_cosmetic ← hexa-bio (consumer anti-aging)", ".roadmap.disease_alopecia_cosmetic ← hexa-bio (cosmetic hair)"]
  infra = ["cli/, tests/, state/, papers/", "README.md · hexa.toml · CITATION.cff · LICENSE · selftest/"]
  status = "CREATED 2026-05-12"

# ── §4 Plan content — other hexa-* repo overlap audit ───────────────

@D d_other_repos_audit := "other hexa-* repos overlap scan" :: plan [draft d=2026-05-12]
  status = "SCAN COMPLETE — deep audit deferred"
  overlaps-flagged = ["hexa-aura (BCI chip) — minimal overlap with hexa-bio medical-device", "hexa-brain vs hexa-mind — neuro/cognitive overlap; separate audit needed", "hexa-senses — sensor/diagnostic/electronic-skin absorption candidate", "hexa-mobility — hexa-limb/medical-device absorption candidate", "hexa-pet — dolphin/veterinary absorption candidate", "hexa-farm — herbalism/nutrition/.roadmap.disease_* absorption candidate", "hexa-earth — microplastics/.roadmap.disease_planetary_health absorption candidate"]
  priority-audit = "hexa-mind ↔ hexa-brain ↔ hexa-aura (three-way neuro/cognitive overlap — out of this plan's scope)"

# ── §5 Honesty contract (LATTICE_POLICY g1/g2/f1 — META tape) ───────

@F f_lattice_fit := "lattice-fit-in-decomposition-plan" :: governance [required deny:write]
  pattern = "Deriving any repo count, verb count, move decision, or decomposition ratio FROM the n=6 lattice (σ=12, τ=4, φ=2, J₂=24) — e.g. 'we split into 6 repos because σ·φ/2', or '24 verbs because J₂=24'."
  why = "The 24 verb count, 35+ sister repos, 5 axes, and 6 Floréa initial verbs are INVENTORY FACTS sourced from the actual repo state at 2026-05-12 — NOT derived from any lattice formula. The lattice token 'n=6 family' in this plan is the NAME of the repo family, coincidental observation only."
  remedy = "All counts cite the real inventory (gh repo list · ls · hexa.toml manifests). No future decomposition decision may cite the lattice as a derivation tool."
  authority = "[@x_lattice_policy] g1/g2 · [@x_agents_tape] f1 g_meta_mode_optin"

@N n6_honest_stance := "decomposition plan lattice mentions are identifiers, not derivations" :: note [required]
  text = "Stated plainly: this is a REPO DECOMPOSITION PLAN. The n=6 family token appears in this document as the NAME of the hexa-* repo family — an identifier, not an arithmetic derivation. Counts in this plan (24 verbs in hexa-medic, 35+ sister repos in the hexa-* ecosystem, 5 molecular axes in hexa-bio, 6 initial Floréa verbs) are sourced from the actual repository state as inventoried on 2026-05-12. None of these counts are derived FROM the n=6 lattice. The coincidence that Floréa received 6 verbs from hexa-medic is a consequence of the scope-split decision (cosmetic vs. therapeutic), not lattice arithmetic. Per LATTICE_POLICY g1/g2 and AGENTS.tape g_meta_mode_optin: meta tapes carry the same guard and stance obligations as science tapes; grounding is satisfied by @X :: governance citations. This tape opts into meta-mode via tape-class = 'meta/plan'."

# ── §6 External citations ─────────────────────────────────────────────

@X x_lattice_policy := "echoes/LATTICE_POLICY.md" :: governance [active]
  url = "https://github.com/dancinlab/echoes/blob/main/LATTICE_POLICY.md"
  scope = "real-limits-first · lattice-is-tool · observation-not-derivation — the governing authority this tape's honesty contract rests on"

@X x_agents_tape := "hexa-bio AGENTS.tape" :: governance [active]
  path = "./AGENTS.tape"
  scope = "g_meta_mode_optin (meta-mode opt-in · d=2026-05-16) · g1 real-limits-first · g2 lattice-is-tool · f1 lattice-fit-on-external-entity · g8 in-silico-only"

@X x_decomposition_plan_md := "DECOMPOSITION_PLAN.md (this repo)" :: doc [active]
  path = "./DECOMPOSITION_PLAN.md"
  scope = "long-form sibling — full inventory table · §1 hexa-medic 24-verb mapping · §2 hexa-bio squat candidates · §3 Floréa branding · §4 other-repo overlap table"
