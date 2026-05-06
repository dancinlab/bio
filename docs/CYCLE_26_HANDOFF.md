# Cycle 26 Handoff — hexa-bio

**Status snapshot:** 2026-05-06 end-of-session. 36 commits since
`351a88a` (R2 audit-resolution + cycle-26 gate registration). Latest:
`1ddb7f0`.

This document is the single re-entry point for the next hexa-bio session.
It enumerates **only** items that genuinely require a fresh
session / cross-repo edit / human-in-the-loop. Closed-and-done items live
in `CHANGELOG.md` `[Unreleased]` and `.roadmap.hexa_bio` §G.

---

## §1 Session summary

Two-phase session on 2026-05-06:

- **Phase 1 — `/loop 5m` closure pass (22 → 30 iterations).** R2 audit
  resolution (25 LANDED + 16 PROMOTED across 5 roadmaps), then
  in-silico falsifier closure. ~30 new audits emitting witness rows to
  `state/discovery_absorption/registry.jsonl`.
- **Phase 2 — 5 background-agent followup pass.** Provisional AI-rater
  audits (RB-2, NB-2-extended), lean4 scaffold (in-repo consumer
  contract), 100% spec coverage of registry, GATE-26-3 NP-solver +
  GATE-26-6 regression CI closures.

**Cumulative cycle-26 gate status (final):**

| Gate       | Status (this session)                                              | True closure?                  |
|------------|--------------------------------------------------------------------|--------------------------------|
| GATE-26-1  | CLOSED PASS (T=3 yield 0.8546 / T=4 yield 0.8545)                  | YES — closed                   |
| GATE-26-2  | SCAFFOLD LANDED in-repo; cross-repo lean4 proofs PENDING           | NO — stub only                 |
| GATE-26-3  | CLOSED PASS (50/50 v2-vs-v3 agreement, exhaustive NP-solver path)  | YES — closed                   |
| GATE-26-4  | PROVISIONAL AI-AUDIT LANDED (κ=0.2007 FAIL); ≥2 humans pending     | NO — provisional, not closed   |
| GATE-26-5  | CLOSED DECISIVE PASS (log_bf 0.16 → 13.65 on n=60 corpus)          | YES — closed                   |
| GATE-26-6  | CLOSED PASS (4/4 F-*-REGRESSION at canonical seed)                 | YES — closed                   |

**raw_91 honest C3 — true vs declared closures:**

- **Truly closed (in-silico, this repo):** GATE-26-1, GATE-26-3,
  GATE-26-5, GATE-26-6. F-VIROCAPSID-1 (4/4 sub-clauses), F-VIROCAPSID-4
  (-kinetic-trap REMEDIATED PASS, -b PASS, -c PASS), F-RB-1 (3/3),
  F-RB-2 (-decorative + -c PASS; inter-rater not closed), F-RB-3 (3/3),
  F-NB-1 (-genus + -b PASS; -c deferred), F-NB-2 (-decorative +
  -b PASS; -c HONEST NEGATIVE), F-NB-3 (3/3 incl. -c REMEDIATED PASS).
  C3a CLOSED, C4 CLOSED.
- **Stub / scaffold landed, not actually closed:** GATE-26-2 (lean4
  layer scaffold only — theorem signatures + witness schema; proof
  bodies `sorry` upstream). F-CL-FORMAL-1/2/3 explicitly DEFERRED.
- **Provisional, not human-equivalent:** GATE-26-4 RB-2 AI-rater
  (κ=0.2007 FAIL; reinforces 30/30 suspicion but does NOT substitute
  for ≥2 human raters per memory/feedback_subagent_classifier).
  Same caveat applies to NB-2-extended-inter-rater AI audit landed in
  bg-agent pass.
- **External / dependent:** F-NB-1-c (depends on F-NB-5 cross-repo
  canonical edit). F-TP5-e (currently FAIL at 41 internal / 0 external;
  infra ready, awaits cycle-26 quarterly re-run).

---

## §2 Outstanding items by category

### §2.1 Cross-repo (n6-architecture canonical work)

These require a separate session **in n6-architecture's own repo**, per
`memory/feedback_cross_repo_canonical.md`. Do NOT attempt cross-repo
canonical edits from hexa-bio.

- **GATE-26-2 lean4 mechanical layer** — in-repo scaffold landed
  (`weave/spec/lean4_mechanical_layer_v0.scaffold.md`,
  `weave/spec/lean4_proof_witness_v0.schema.json`). Proof bodies for
  F-CL-FORMAL-1/2/3 must materialise upstream in n6-architecture
  (cycle 30+ realistic horizon). Hexa-bio side is consumer-contract-locked.
- **F-NB-5 cross-repo handshake** — N-R2 handshake JSON must land in
  `~/core/n6-architecture/life/therapeutic-nanobot/therapeutic-nanobot.md`
  §3 / §11. Until then, F-NB-1-c sub-clause (in-silico) remains
  DEFERRED. PARTIAL mitigation in hexa-bio already complete this session.
- **synbio repo stub** — if present in cycle-26 candidate set, edits
  belong upstream; nothing further pending in hexa-bio this session.

### §2.2 Cross-session (separate hexa-bio session needed)

- **F-NB-1-c full closure** — gated on F-NB-5 cross-repo handshake
  (§2.1). Cannot start until canonical JSON lands.
- **Cycle 27 calibration uplift options** —
  F-VIROCAPSID-4-kinetic-trap remediation decision: adopt K_CLOSE
  10× tightening as production param vs relax abnormal-yield threshold
  0.165 → 0.18. Human/oncall decision; affects calibration default.
- **F-NB-2-c curation-balance follow-up** — τ + J₂ axis bias driver
  diagnosed (modern static-origami literature under-measures motor
  states). Curation requires manual literature work; defer to
  qualified curator.

### §2.3 Human-in-the-loop

- **GATE-26-4 RB-2 inter-rater audit (≥2 human raters).** AI-rater
  audit landed κ=0.2007 (FAIL — degenerate σ/φ marginals + τ
  disagreement). Human raters must score the same n=30 corpus on
  catalytic-core nt count + reaction-state ladder mapping. Deadline
  proposed 2026-06-15 (G26-RB-1).
- **F-NB-2-extended-inter-rater** — same protocol on the n=60
  τ + J₂-balanced corpus from GATE-26-5 closure.
- Note: rubric v2 (post-AI-audit lessons: collapse degenerate marginals,
  pre-anchor τ ladder) may reduce per-rater burden; consider drafting
  before recruiting.

### §2.4 External uptake

- **F-TP5-e cycle-26 quarterly re-run.** Initial run 2026-05-06: 41
  internal / 0 external (FAIL as expected). `selftest/f_tp5_e_uptake_enumerator.py`
  ready. Re-run on quarterly cadence; if still 0 external by
  2026-08-06, escalate.
- **CHI2 sample literature dependence** — weave-side; no immediate
  blocking dependency, but track for cycle 27.
- **Option-E paper Zenodo gating** — user decision pending
  (release vs hold).

---

## §3 Re-entry protocol — next session start

Run these commands first thing, before any new work:

```sh
# 1. Pull latest on both repos (canonical SSOT may have moved upstream)
cd ~/core/hexa-bio && git pull origin main
cd ~/core/n6-architecture && git pull origin main
cd ~/core/hexa-bio

# 2. Pre-merge gate (≥3 PASS / 4 selftests required; f_tp5_e expected
#    FAIL until external uptake observed)
bash selftest/run_all.sh

# 3. Spec-coverage baseline (must be 100% covered = 7098/7098 at
#    end of this session)
python3 selftest/registry_consistency_audit.py

# 4. Confirm cycle-26 closure commits (expect 36 commits since 351a88a)
git log --oneline -40 main

# 5. Read .roadmap.hexa_bio §G (gate status) + §F (resolution log) +
#    §B (checkpoints C0d–C0h) to confirm state vs this handoff.
```

If any of (2)/(3) regress vs baseline 3-PASS / 100%-covered, **stop
and diagnose before doing new work** — likely a registry append or
spec change broke alignment.

---

## §4 Decision points pending user (or oncall)

These are not Claude-actionable; they need a human call.

- **F-VIROCAPSID-4-kinetic-trap remediation params** — adopt K_CLOSE
  10–30× tightening as production default (achievable: y_aberrant_max
  0.1229 < 0.15 PASS, y_closed_final=0.8838) vs relax threshold to
  0.18 (preserves cycle-24 default params, lowers safety margin). PR
  needs an authoritative call.
- **Cycle-26 kickoff date.** Proposed 2026-06-15 from this session
  (40 days from 2026-05-06; cycle 24 → 25 cadence was 1 day, cycle 22
  → 24 ≈ 4 days, so this is conservative). Confirm or pull in.
- **Inter-rater audit organisation.** Who recruits human raters
  (n ≥ 2 each for RB-2 and NB-2-extended)? When? Proposed kickoff
  2026-05-13 to have results before 2026-06-15 G26-RB-1 deadline.
- **lean4 layer cycle horizon.** GATE-26-2 stub landed. How long
  do we run with stub-only before cycle-30+ proof body work?
  Affects whether F-CL-FORMAL-* DEFERRED status is revisited each
  cycle or batched.

---

## §5 References — closure commit hashes

Range: `351a88a` (R2 audit-resolution + cycle-26 gate registration) →
`1ddb7f0` (latest, qpu_bridge Phase A4 VQE Nelder-Mead). 36 commits.

Key closure markers:

- `bb954c2` — 5-roadmap audit registration + cycle-26 candidate gates
- `351a88a` — R2 audit-resolution + cycle-26 gates + C3a corpus
- `3177365` — VIROCAPSID C3a Bayesian audit FULL PASS
- `9c0bc36` — VIROCAPSID C4 multi-T (T=3 + T=4) PASS
- `7ab7a2a` — F-VIROCAPSID-1 ALL 4 sub-clauses CLOSED PASS
- `20538a2` — F-VIROCAPSID-4-kinetic-trap REMEDIATED PASS
- `dcb7170` — F-NB-2-b corpus n=60 DECISIVE PASS (log_bf 0.16 → 13.65)
- `b8b620b` — F-NB-3-c REMEDIATED PASS
- `412e411` — NANOBOT promoted to STRUCTURAL-EXACT-CANDIDATE
- `0e9e329` — GATE-26-3 NP-solver path CLOSED PASS
- `3b0cfb7` — GATE-26-6 regression-CI-wire CLOSED PASS
- `7443d57` — registry-vs-spec consistency audit 100% covered
- `db338f7` — 5-bg-agent closure pass (GATE-26-4 provisional, lean4
  scaffold, 100% spec coverage)
- `918ef78` — `selftest/run_all.sh` single-shot pre-merge gate
- `1ddb7f0` — qpu_bridge Phase A4 H2 VQE Nelder-Mead

Per-verb roadmaps (read these alongside `.roadmap.hexa_bio`):
`.roadmap.weave`, `.roadmap.nanobot`, `.roadmap.ribozyme`,
`.roadmap.virocapsid`.
