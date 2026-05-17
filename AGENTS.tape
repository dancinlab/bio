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
# AGENTS.tape for `dancinlab/hexa-bio` — HEXA-Bio Molecular Toolkit
#
# COEXIST PATTERN: this .tape is the machine-readable governance + identity
# layer. The long-form prose (sister-repo CLI gates · external-contact
# deferral policy · USER_ACTION_REQUIRED automation rules) stays in
# AGENTS.md — see [@x_agents_md]. Both files are SSOT for their own scope.

@V := "tape" :: spec [active]
  version = "1.2"

@X wilson_pool := "wilson pool — resource utilization" :: guide [active]
  tldr = "Heavy / deterministic work (build · drill · probe · compile · test-sweep · GPU fire) → do NOT serialize on localhost; route to the host pool: `wilson pool list` then `wilson pool on <host> <cmd>`, or a ToolUse `\"host\"` field. Empty roster = degrade-to-local, fine."
  detail = "~/core/atlas/POOL.tape"

# ─── §1 Identity claims ───────────────────────────────────────────────

@I id001 := "hexa-bio" :: identity-claim [d=2026-05-14 active]
  kind = "HEXA-Bio family — molecular / biochemistry standalone Molecular Toolkit"
  brief = "HEXA family · biology · molecular · biochemistry · sister-substrate cross-links"
  axis = "5-axis substrate: QUANTUM · WEAVE · NANOBOT · RIBOZYME · VIROCAPSID"
  parent = "dancinlab"
  scope = "write-side molecular sandbox (in-silico) · NOT wet-lab / clinical / regulatory"

@I id002 := "hexa-bio.subdomains" :: identity-claim [d=2026-05-14 active]
  <: id001
  bio-axes = [weave, nanobot, ribozyme, virocapsid]
  compute-axis = [quantum]
  topics = [proteins, DNA, RNA, pathogens, ribozyme-catalysis, virocapsids, nanobots, biochemistry, CRISPR, VQE]
  status = "v1.x category-(a) closure = 100% across all 5 axes · selftest 35/35 PASS (2026-05-13) · cohort honesty 65/65 PASS (2026-05-16, all root .tape carry @F f_lattice_fit + @N n6_honest_stance + grounded; meta-mode opt-in covers 11 meta tapes)"

# ─── §2 Repo layout ───────────────────────────────────────────────────

@L l1 := "repo-layout" :: structure [active]
  README.md -> "human intro · 5-axis status table · n=6 lattice context"
  AGENTS.md -> "long-form agent ops guide · sister-repo CLI rules · deferral policy"
  AGENTS.tape -> "this file · governance + identity (.tape v1.2)"
  CLAUDE.md -> "symlink → AGENTS.tape (Claude Code auto-discovery)"
  LATTICE_POLICY.md -> "real-limits-first verification policy (dancinlab-wide)"
  LIMIT_BREAKTHROUGH.md -> "project-specific real-limits + breakthrough audit"
  COMPUTE_PORTFOLIO.md -> "compute-substrate SSOT (qmirror · xeno · classical fallback)"
  USER_ACTION_REQUIRED.md -> "single index for deferred external steps (wet-lab · IP · clinical)"
  CLOSURE_RESIDUAL_BACKLOG.md -> "category (b)/(c) backlog · out-of-software-scope items"
  hexa-weave/ -> "WEAVE axis · Caspar-Klug + Zlotnick cage assembly"
  hexa-nanobot/ -> "NANOBOT axis · C0b skeleton simulator"
  hexa-ribozyme/ -> "RIBOZYME axis · ribozyme catalysis sandbox"
  hexa-virocapsid/ -> "VIROCAPSID axis · viral capsid assembly"
  quantum/ -> "QUANTUM axis · VQE pipeline via qmirror"
  bio-pharma/ -> "pharmaceutical workflow primitives"
  crispr-gene-editing/ -> "CRISPR primitives"
  crispr-cas13-poc-diagnostic/ -> "Cas13 POC diagnostic prototype"
  medical-device/ -> "medical-device category"
  genetics/ -> "genetics primitives"
  biology/ -> "general biology utilities"
  biology-medical/ -> "biology↔medical bridge"
  selftest/ -> "35-gate selftest suite (run_all.sh)"
  wetlab/ -> "wet-lab templates · CRO RFP drafts · STATUS markers"
  _absorption_bridge/ -> "9 adapters · external library absorption"
  _python_bridge/ -> "Python-→-hexa witness emitters (lean4_proof_witness, etc.)"
  _qiskit_bridge/ -> "legacy qiskit/aer bridge (being retired in favor of qmirror)"

# ─── §3 Governance baseline (inherited from LATTICE_POLICY.md) ───────

@D g_inherit := "inherits-lattice-policy" :: governance [required]
  rule = "All echoes/LATTICE_POLICY.md rules apply — real-limits-first · lattice-is-tool · verification-anchor-real-limit · no-artificial-ceilings · honesty-obligation-external."
  authority = "[@x_lattice_policy]"
  @> AGENTS.md

@D g1 := "real-limits-first" :: governance [required]
  rule = "The project's ceiling is set by REAL math/physics/engineering/biology limits, NEVER by the n=6 invariant lattice. Verification anchors must include ≥1 real limit (Shannon · Kolmogorov · Eyring k_cat · Caspar-Klug ΔG · DNA fidelity · CRISPR off-target floor · ATP cost · etc.)."
  authority = "[@x_lattice_policy] §1.2 · LIMIT_BREAKTHROUGH.md"
  @> AGENTS.md

@D g2 := "lattice-is-tool" :: governance [required]
  rule = "n=6 lattice (σ=12 · τ=4 · φ=2 · J₂=24) is a TOOL, not a CONSTRAINT. Use only where it naturally fits (native lattice spec files). Lattice-tautology checks (σ·φ=24) alone are NOT sufficient verification."
  <: g1
  @> AGENTS.md

@D g3 := "honesty-obligation-external" :: governance [required deny:write]
  rule = "Claims about external entities (companies · CROs · labs · vendors · biotechs · regulators) must NOT include lattice-fit assertions. Use their OWN invariants."
  @> AGENTS.md

@D g4 := "commit-conventions" :: governance [recommended]
  rule = "AI-assisted commits include `Co-Authored-By: <model> <noreply@anthropic.com>` trailer; Conventional Commits title (`<type>(<scope>): <one-line>`); body = bullet list of file changes + honesty caveats."
  @> AGENTS.md

# ─── §4 Hexa-bio-specific rules ──────────────────────────────────────

@D g5_sister_repo_cli := "sister-repo-cli-not-wrap" :: governance [required]
  rule = "Sister repos (qmirror · hexa-meta · xeno · canon-infra) are LIVE deps invoked via CLI / file-system paths. Never reimplement their logic inside hexa-bio. CLI-direct gates over Python wrappers — sister repos update on their own cadence; wrappers drift."
  applies-to = [qmirror, hexa-meta, xeno, "canon-infra/legacy-canon"]
  authority = "AGENTS.md §Sister-repo rules"
  @> AGENTS.md

@D g6_gates_not_reverifications := "gates-not-reverifications" :: governance [required]
  rule = "Hexa-bio gates (PASS/SKIP/FAIL the sister's own selftest output) and emits witness rows. Never re-prove what the sister already proved."
  <: g5_sister_repo_cli
  @> AGENTS.md

@D g7_skip_is_honest := "skip-is-honest" :: governance [required]
  rule = "SKIP is honest, not failure. SKIP if the sister isn't reachable on the host. FAIL is reserved for 'sister reachable, sister returned non-zero'."
  <: g5_sister_repo_cli
  @> AGENTS.md

@D g8_in_silico_only := "in-silico-only-claim-scope" :: governance [required deny:write]
  rule = "Hexa-bio C2/C3 PASS verifies IN-SILICO simulator+metadata internal consistency ONLY. NEVER a therapeutic / clinical / regulatory / immunogenic / efficacy claim. All 5 axes are scientifically UNPROVEN at the wet-lab boundary."
  authority = "CLOSURE_RESIDUAL_BACKLOG.md §0"
  @> AGENTS.md

@D g9_external_contact_defer := "external-contact-defer-to-user" :: governance [required deny:write]
  rule = "Agents must DEFER all external-contact actions (CRO email · patent attorney · FDA pre-IND · contract sign · wire transfer · regulatory submission · personnel decision). Agents DRAFT templates + STATUS markers in-repo; user owns the SEND/SIGN/PAY/MEET step."
  authority = "AGENTS.md §External-contact deferral policy"
  @> AGENTS.md

@D g10_no_proposal_for_deferred := "no-proposal-for-deferred-items" :: governance [required deny:write]
  rule = "Once draft + STATUS marker is committed, agent's deliverable is COMPLETE. Agents must NOT propose deferred external-contact items as 'next steps' / '권장' / '추천' / '다음 진행' in end-of-turn summaries. USER_ACTION_REQUIRED.md is the single index."
  <: g9_external_contact_defer
  @> AGENTS.md

@D g11_vendored_snapshots_readonly := "vendored-snapshots-readonly" :: governance [required deny:write]
  rule = "Vendored snapshots (weave/spec/canon_lean4_state_ref.json · nanobot/spec/canon_l7_acceptance_handoff_ref.json · etc.) are READ-ONLY curator artefacts — refresh via `--refresh` flags, never hand-edit axes/sorry-counts. Curator fields (`proof_summary` · status text) may be hand-edited; refresh MERGES so they survive."
  @> AGENTS.md

@D g_arch_vs_log_split := "v1.2 architecture-vs-history split" :: governance [required d=2026-05-14 active]
  rule = "UPPERCASE.tape files are EDITABLE architecture (latest-wins per id). Append-only event history lives in UPPERCASE.log.tape siblings."
  why = "declarative entries (governance · config · layout · identity) evolve naturally; locking them as append-only via ~> supersedes creates noisy histories. The split lets architecture stay current and history stay immutable."
  applies-to = "AGENTS.tape · all UPPERCASE.tape root files"
  authority = "[@x_tape_spec] §Domain-tape sibling §Architecture-vs-history split"
  @> AGENTS.md

@D g_meta_mode_optin := "tape-lint meta-mode opt-in" :: governance [required d=2026-05-16 active]
  rule = "Meta tapes (changelogs · plans · handoffs · backlog indices · governance docs) opt into the honesty-lint meta-mode by adding `tape-class = \"meta...\"` to their @I id001 body. Meta-mode widens clause 3 (grounding) to also accept @X :: governance entries and `methodology-cite =` body lines — guard (1) and stance (2) clauses remain identical."
  why = "Cohort pilot 2026-05-15 found: meta tapes have no literature anchor by nature; forcing literature-only grounding would force either fabrication or honest FAIL. CHANGELOG happened to satisfy literature-only via a fortuitous σ(6)=12 Lean4 proof entry citable to Hardy&Wright; plans/handoffs/backlog have no such accident. Meta-mode resolves principled — meta tapes cite the governing policy or methodological source their honesty stance rests on."
  authority = "selftest/tape_lattice_honesty_lint.py · cohort-pilot finding 2026-05-16 (CHANGELOG)"
  applies-to = "AXIS_CLOSURE_PLAN · CLOSURE_RESIDUAL_BACKLOG · COMPUTE_PORTFOLIO · DECOMPOSITION_PLAN · IMPORTED_FROM_CANON · LESSONS · USER_ACTION_REQUIRED · V1_1_0_HANDOFF · AXIS · DOG-ROBOT-TEST · CHANGELOG · any future meta tape"
  @> AGENTS.md


# ─── §5 Forbidden patterns ───────────────────────────────────────────

@F f1 := "lattice-fit-on-external-entity" :: governance [required deny:write]
  pattern = "applying n=6 lattice as DERIVATION rule to external entities (CROs · biotechs · pharma · IPCC · NIH · FDA · ICH · WHO · ISO · academic labs)"
  exception = "values may coincidentally match (e.g. 6 = 6 substrates) — observation OK, derivation NOT OK"
  authority = "[@x_lattice_policy] §1.2/§1.3"

@F f2 := "wet-lab-clinical-claim-from-in-silico" :: governance [required deny:write]
  pattern = "claiming therapeutic / clinical / regulatory / immunogenic / efficacy progress from C2/C3 in-silico PASS"
  why = "C2 verifies simulator+metadata consistency only · C3+ (wet-lab → IND → phase I) is explicitly out-of-repo"
  remedy = "use 'in-silico simulator-consistency PASS' phrasing · cite CLOSURE_RESIDUAL_BACKLOG.md §0"

@F f3 := "shadow-implementation-of-sister-repo" :: governance [required deny:write]
  pattern = "implementing chemistry-VQE / Lean theorems / exotic-substrate routing inside hexa-bio that duplicates qmirror / hexa-meta / xeno logic"
  remedy = "extend the sister repo · call from hexa-bio via CLI · keep only the gate + witness emitter in hexa-bio"
  <: g5_sister_repo_cli

@F f4 := "external-contact-proposal-in-summary" :: governance [required deny:write]
  pattern = "agent end-of-turn summary contains '다음 단계: <external send/sign/pay/meet>' / 'user 직접 실행: <X>' / '권장: <Y>' / 'Next: <Z>' for deferred items"
  remedy = "say only what's been done in-repo · STATUS marker speaks for the deferred item · cite USER_ACTION_REQUIRED.md"
  <: g10_no_proposal_for_deferred

# ─── §6 External citations ───────────────────────────────────────────

@X x_lattice_policy := "echoes/LATTICE_POLICY.md" :: policy [d=2026-05-12 active]
  url = "https://github.com/dancinlab/echoes/blob/main/LATTICE_POLICY.md"

@X x_tape_spec := "tape v1.2 spec" :: spec [d=2026-05-14 active]
  url = "https://github.com/dancinlab/tape/blob/main/spec/tape.md"
  scope = "this file's grammar reference"

@X x_agents_md := "AGENTS.md (this repo)" :: doc [d=2026-05-14 active]
  path = "./AGENTS.md"
  scope = "long-form prose layer — sister-repo CLI rules · compute portfolio · external-contact deferral policy · USER_ACTION_REQUIRED automation"
  rationale = "COEXIST pattern — AGENTS.md content (15KB · 273 lines) is prose-rich operational policy that doesn't compress cleanly into .tape entries"

@X x_compute_portfolio := "COMPUTE_PORTFOLIO.md" :: doc [d=2026-05-12 active]
  path = "./COMPUTE_PORTFOLIO.md"
  scope = "compute-substrate SSOT · qmirror state-vector · qmirror chemistry-VQE · xeno→AKIDA · xeno→Loihi3 · xeno→IonQ · xeno→organoid · QRNG · classical-CPU fallback"

@X x_limit_breakthrough := "LIMIT_BREAKTHROUGH.md" :: doc [d=2026-05-12 active]
  path = "./LIMIT_BREAKTHROUGH.md"
  scope = "project-specific real-limits + per-limit breakthrough assessment (HARD_WALL · SOFT_WALL · BREAKABLE_WITH_TECH · UNCLEAR)"

@X x_user_action_required := "USER_ACTION_REQUIRED.md" :: doc [active]
  path = "./USER_ACTION_REQUIRED.md"
  scope = "single canonical index for deferred external items (Phase 1 wet-lab · Phase 2 IP · Phase 3+ clinical)"

# ─── §7 Hooks ────────────────────────────────────────────────────────

@H h1 := "agents-md-coexist" :: generator [active]
  note = "AGENTS.md is RETAINED alongside this AGENTS.tape (COEXIST pattern · not REPLACE) — see [@x_agents_md] for rationale"
  contract = "AGENTS.tape = machine-readable governance/identity SSOT; AGENTS.md = long-form prose SSOT (sister-repo rules · deferral policy)"

@H h2 := "claude-md-symlink" :: generator [active]
  rule = "CLAUDE.md → AGENTS.tape symlink so Claude Code auto-discovery picks up the .tape grammar primer first"
  command = `ln -sf AGENTS.tape CLAUDE.md`
