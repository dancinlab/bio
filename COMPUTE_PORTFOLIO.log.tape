#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# COMPUTE_PORTFOLIO.log.tape — append-only event history
# Architecture-current editable layer → COMPUTE_PORTFOLIO.tape sibling
# ══════════════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

@A rewrite_2026_05_16 := "compute-portfolio meta-mode honesty rewrite" :: rewrite [ok d=2026-05-16]
  <- "lattice-tautology stub (hexa-bio mass-split 153b5a2)"
  => "COMPUTE_PORTFOLIO.tape rewritten to meta-mode honesty-lint compliance"
  changes <<~EOF
    - @I id001: tape-class = "meta/portfolio" opt-in for linter meta-mode (AGENTS.tape g_meta_mode_optin)
    - rewritten-from provenance recorded in @I id001
    - added @F f_lattice_fit (lattice-fit-in-compute-portfolio) — guard clause (1)
    - added @N n6_honest_stance — honest n=6 stance clause (2)
    - added @N scope_disclaimer — scope honesty note
    - added @X x_lattice_policy :: governance — meta-mode grounding clause (3a)
    - added @X x_agents_tape :: governance — meta-mode grounding clause (3b)
    - added @X x_compute_portfolio_md :: doc — long-form sibling cross-link
    - added @X x_xeno_sibling :: sibling-tape — XENO.tape science cross-link (commit 9328878)
    - portfolio inventory (@D portfolio_qmirror / portfolio_xeno / portfolio_classical) — genuine route list preserved from COMPUTE_PORTFOLIO.md long-form sibling
    - @D portfolio_cli_contract — anti-duplication sister-repo contract (AGENTS.tape f3/g5)
    - original stub (brief with lattice-tautology markers "cycle-30++++++++") replaced with clean meta identity
    - COMPUTE_PORTFOLIO.log.tape created as append-only history sibling
  EOF
  lint-verdict = "PASS (is_meta=true · has_guard=true · has_stance=true · grounded=true)"
  linter = "selftest/tape_lattice_honesty_lint.py"
