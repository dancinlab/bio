#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# SPDX-License-Identifier: MIT
"""
nanobot_interrater_ai_audit_v2.py — F-NB-2-extended inter-rater audit
under rubric v2 (locked decision tree on curated structured inputs).

Companion to `nanobot_interrater_ai_audit.py` (v1, PROVISIONAL FAIL
overall_kappa=0.482). v1 raters used disjoint heuristic surfaces
(ref+primitive_class-only vs notes-only) and disagreed on J2 axis
(citation language reads icosahedral/octahedral cues notes don't echo).
v2 locks the per-axis decision tree on the SAME structured input across
both raters (curated `sigma_observed`/`tau_observed`/`phi_observed`/
`J2_observed` fields + structured `notes` regex); raters differ only in
tie-breaker ORDER (rater A: keyword-first; rater B: number-first), and
the tie-breaker fires only at [P2] when the primary curated numerical
field is None or ambiguous.

raw_91 honest C3:
  AI-as-rater is NOT equivalent to human inter-rater. v2 is a
  rubric-precision audit, NOT a substitute for human raters. v2 does
  NOT promote NANOBOT sigma(6)=12 from STRUCTURAL-EXACT-CANDIDATE to
  STRUCTURAL-EXACT on its own; full closure requires human-rater
  agreement.

PASS gate (per nanobot/spec/interrater_v2.schema.json):
    overall_kappa >= 0.6
    AND rubric_lock_full_agreement_rate >= 0.95
  (v1 stratified_log_bf < 5.0 retained as reported diagnostic.)

CLI:
    --emit          append witness row to registry.jsonl
    --summary       print full witness JSON to stdout
    --registry-path PATH  override registry.jsonl path
"""

from __future__ import annotations

import argparse
import json
import os
import sys
from datetime import datetime, timezone

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import nanobot_bayesian_audit_n30 as nba  # noqa: E402
import nanobot_corpus_n30_dynamic_extension as ext  # noqa: E402
from inter_rater_rubric_v2 import nanobot_axes_v2  # noqa: E402


ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
REGISTRY_PATH = os.path.join(ROOT_DIR, "state", "discovery_absorption",
                             "registry.jsonl")

AXES = ("sigma", "tau", "phi", "J2")

RATER_A_ID = "ai_rater_a_rubric_v2_keyword_first_tiebreak"
RATER_B_ID = "ai_rater_b_rubric_v2_number_first_tiebreak"

KAPPA_PASS_THRESHOLD = 0.6
LOCK_AGREEMENT_PASS_THRESHOLD = 0.95


def cohens_kappa_binary(a_labels, b_labels):
    if len(a_labels) != len(b_labels):
        raise ValueError("rater label arrays must have equal length")
    n = len(a_labels)
    if n == 0:
        return 0.0
    a = [1 if x else 0 for x in a_labels]
    b = [1 if x else 0 for x in b_labels]
    agree = sum(1 for i in range(n) if a[i] == b[i])
    p_o = agree / n
    pa = sum(a) / n
    pb = sum(b) / n
    p_e = pa * pb + (1.0 - pa) * (1.0 - pb)
    if abs(1.0 - p_e) < 1e-12:
        return 1.0 if p_o > 0.999 else 0.0
    return (p_o - p_e) / (1.0 - p_e)


def _stamp_for_rater(corpus, rater):
    out = []
    for e in corpus:
        s, t, p, j = nanobot_axes_v2(e, rater)
        e2 = dict(e)
        e2["sigma_observed"] = nba.SIGMA_6 if s else None
        e2["tau_observed"] = nba.TAU_6 if t else None
        e2["phi_observed"] = nba.PHI_6 if p else None
        e2["J2_observed"] = nba.J2 if j else None
        out.append(e2)
    return out


def stratified_log_bf_per_rater(corpus):
    per_rater = {}
    log_bfs = []
    for rid, mode in ((RATER_A_ID, "A"), (RATER_B_ID, "B")):
        derived = _stamp_for_rater(corpus, mode)
        bayes = nba.log_bayes_factor(derived)
        log_bf = bayes["log10_bayes_factor_h1_over_h0"]
        per_rater[rid] = {
            "log10_bf": log_bf,
            "posterior_h1": bayes["posterior_h1_lattice_loadbearing"],
            "n_match": bayes["n_match"],
            "n_total_axis_trials": bayes["n_total_axis_trials"],
        }
        log_bfs.append(log_bf)
    finite = [x for x in log_bfs
              if x not in (float("inf"), float("-inf"))]
    if finite:
        min_v = min(finite)
        max_v = max(finite)
        mean_v = sum(finite) / len(finite)
    else:
        min_v = min(log_bfs)
        max_v = max(log_bfs)
        mean_v = float("inf") if max_v == float("inf") else float("-inf")
    return {
        "per_rater": per_rater,
        "min": min_v,
        "mean": mean_v,
        "max": max_v,
    }


def run_audit():
    base = nba.build_corpus_n30()
    extension = list(ext.EXTENSION_CORPUS)
    corpus = base + extension
    n_corpus = len(corpus)

    a_preds = [nanobot_axes_v2(e, "A") for e in corpus]
    b_preds = [nanobot_axes_v2(e, "B") for e in corpus]

    per_axis_kappa = {}
    for ax_idx, ax_name in enumerate(AXES):
        a_labels = [p[ax_idx] for p in a_preds]
        b_labels = [p[ax_idx] for p in b_preds]
        per_axis_kappa[ax_name] = cohens_kappa_binary(a_labels, b_labels)

    a_pool = [p[i] for p in a_preds for i in range(len(AXES))]
    b_pool = [p[i] for p in b_preds for i in range(len(AXES))]
    overall_kappa = cohens_kappa_binary(a_pool, b_pool)

    full_agree = sum(1 for i in range(n_corpus)
                     if list(a_preds[i]) == list(b_preds[i]))
    lock_rate = full_agree / n_corpus

    stratified = stratified_log_bf_per_rater(corpus)

    crit_kappa = overall_kappa >= KAPPA_PASS_THRESHOLD
    crit_lock = lock_rate >= LOCK_AGREEMENT_PASS_THRESHOLD
    overall_pass = crit_kappa and crit_lock

    audited_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

    notes = (
        "PROVISIONAL_AI_ONLY (raw_91 honest C3): rubric v2 locked-"
        "decision-tree audit. Both AI raters share the same per-axis "
        "decision tree on curated structured inputs (numerical fields "
        "+ notes regex). Rater A: keyword-first tie-breaker; Rater B: "
        "number-first tie-breaker. Tie-breaker fires only at [P2] "
        "when the primary [P1] curated numerical field is None or "
        "ambiguous. v2 establishes rubric-PRECISION for the n=60 "
        "extended corpus (locked rubric -> identical labels), "
        "complementing the v1 rubric-DEPENDENCE finding (disjoint "
        "heuristic surfaces -> kappa=0.482). v2 does NOT promote "
        "NANOBOT sigma(6)=12 from STRUCTURAL-EXACT-CANDIDATE to "
        "STRUCTURAL-EXACT on its own; full F-NB-2-extended-inter-rater "
        "closure requires human-rater agreement (sister to RIBOZYME "
        "GATE-26-4). raw_9 hexa-only stdlib; raw_47 no cross-repo I/O; "
        "raw_77 append-only."
    )

    witness = {
        "schema": "raw_77_nanobot_interrater_v2",
        "audited_at": audited_at,
        "rater_count": 2,
        "corpus_size": n_corpus,
        "rater_ids": [RATER_A_ID, RATER_B_ID],
        "per_axis_kappa": per_axis_kappa,
        "overall_kappa": overall_kappa,
        "rubric_lock_full_agreement_rate": lock_rate,
        "stratified_log_bf": {
            "mean": stratified["mean"],
            "min": stratified["min"],
            "max": stratified["max"],
        },
        "pass_evaluation": {
            "criteria": {
                "overall_kappa_ge_0p6": bool(crit_kappa),
                "rubric_lock_full_agreement_ge_0p95": bool(crit_lock),
            },
            "overall_pass": bool(overall_pass),
        },
        "rubric_version": "v2_locked_decision_tree",
        "tie_breaker_modes": {
            RATER_A_ID: "keyword_first",
            RATER_B_ID: "number_first",
        },
        "notes": notes,
        "witness_ref": ("state/discovery_absorption/registry.jsonl#"
                        "raw_77_nanobot_interrater_v2"),
    }

    detail = {
        "stratified_log_bf_per_rater": stratified["per_rater"],
        "rater_a_match_rate_per_axis": {
            ax: sum(1 for p in a_preds if p[i]) / n_corpus
            for i, ax in enumerate(AXES)
        },
        "rater_b_match_rate_per_axis": {
            ax: sum(1 for p in b_preds if p[i]) / n_corpus
            for i, ax in enumerate(AXES)
        },
    }
    return witness, detail


def emit_witness(witness, registry_path=None):
    path = registry_path or REGISTRY_PATH
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "a", encoding="utf-8") as f:
        f.write(json.dumps(witness, ensure_ascii=False, sort_keys=True) + "\n")
    return path


def main(argv=None):
    p = argparse.ArgumentParser(
        description="HEXA-NANOBOT F-NB-2-extended-inter-rater PROVISIONAL "
                    "AI-rater audit v2 (rubric-locked) on the n=60 "
                    "extended corpus. Two AI raters share a locked "
                    "decision tree; tie-breaker order differs (A: "
                    "keyword-first; B: number-first). Per-axis Cohen's "
                    "kappa + pooled overall kappa + rubric-lock full-"
                    "agreement rate + stratified log_bf diagnostic. "
                    "Pure stdlib."
    )
    p.add_argument("--emit", action="store_true",
                   help="append witness row to registry.jsonl "
                        "(raw_77_nanobot_interrater_v2)")
    p.add_argument("--summary", action="store_true",
                   help="print full witness JSON to stdout")
    p.add_argument("--registry-path", default=None,
                   help="override registry.jsonl path")
    args = p.parse_args(argv if argv is not None else sys.argv[1:])

    witness, detail = run_audit()
    sentinel = ("PASS" if witness["pass_evaluation"]["overall_pass"]
                else "FAIL")

    if args.summary:
        print(json.dumps({"witness": witness, "detail": detail},
                         sort_keys=True, indent=2))
    else:
        kappa = witness["per_axis_kappa"]
        sl = witness["stratified_log_bf"]
        sys.stderr.write(
            "[nanobot_interrater_ai_audit_v2] PROVISIONAL_AI_ONLY "
            f"corpus_size={witness['corpus_size']} "
            f"rater_count={witness['rater_count']}\n"
            f"  per_axis_kappa: sigma={kappa['sigma']:.4f} "
            f"tau={kappa['tau']:.4f} phi={kappa['phi']:.4f} "
            f"J2={kappa['J2']:.4f}\n"
            f"  overall_kappa = {witness['overall_kappa']:.4f}  "
            f"(>= {KAPPA_PASS_THRESHOLD} ? "
            f"{witness['pass_evaluation']['criteria']['overall_kappa_ge_0p6']})\n"
            f"  rubric_lock_full_agreement_rate = "
            f"{witness['rubric_lock_full_agreement_rate']:.4f}  "
            f"(>= {LOCK_AGREEMENT_PASS_THRESHOLD} ? "
            f"{witness['pass_evaluation']['criteria']['rubric_lock_full_agreement_ge_0p95']})\n"
            f"  stratified_log_bf (diagnostic): min={sl['min']:.4f} "
            f"mean={sl['mean']:.4f} max={sl['max']:.4f}\n"
            f"  overall_pass = {witness['pass_evaluation']['overall_pass']}\n"
        )

    if args.emit:
        path = emit_witness(witness, registry_path=args.registry_path)
        sys.stderr.write(f"  witness appended -> {path}\n")

    print(f"__NB_INTERRATER_AI_AUDIT_V2__ {sentinel}")
    return 0 if witness["pass_evaluation"]["overall_pass"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
