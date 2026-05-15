#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# DECOMPOSITION_PLAN.log.tape — append-only event history
# Architecture (editable) → DECOMPOSITION_PLAN.tape sibling
# ══════════════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@A rewrite_2026_05_16 := "DECOMPOSITION_PLAN.tape honesty-lint rewrite" :: rewrite [ok d=2026-05-16]
  => "Rewrote DECOMPOSITION_PLAN.tape into honesty-lint compliance under meta-mode opt-in (AGENTS.tape g_meta_mode_optin d=2026-05-16). Added tape-class = 'meta/plan', @F f_lattice_fit guard, @N n6_honest_stance, @X x_lattice_policy :: governance, @X x_agents_tape :: governance, @X x_decomposition_plan_md :: doc. Preserved all plan content (hexa-medic 24-verb split, hexa-bio squat cleanup, Floréa bootstrap, other-repo overlap audit). Linter: PASS is_meta=true."
  methodology = "CHANGELOG.tape meta-mode precedent (commit 72d4b8d) · AGENTS.tape g_meta_mode_optin (commit bb141ca)"
  linter = "python3 selftest/tape_lattice_honesty_lint.py DECOMPOSITION_PLAN.tape --json → PASS is_meta=true"
