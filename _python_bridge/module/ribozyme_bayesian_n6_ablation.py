#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ribozyme_bayesian_n6_ablation.py — F-RB-2-n6-decorative ablation runner.

Mirrors `nanobot_bayesian_n6_ablation.py` for the ribozyme n=30
catalytic-RNA corpus. Tests whether the F-RB-2 cycle-25 30/30
suspicious-perfect match (log_bf=79.74) is **load-bearing on the
canonical thresholds** (sigma in [10,15] / tau=4 / phi=2 / J2=True)
or **decorative** (would survive equally well under perturbed
thresholds).

PASS gate: |Δlog10_BF| ≥ 0.5 between canonical and any perturbed run.
  PASS  → thresholds ARE load-bearing.
  FAIL  → thresholds are decorative; F-RB-2 verdict not threshold-tied.

Per cross-cutting Require (R5) raw 9 hexa-only: **Python stdlib only.**

Usage:

    python3 ribozyme_bayesian_n6_ablation.py --summary
    python3 ribozyme_bayesian_n6_ablation.py --emit
"""

from __future__ import annotations

import argparse
import json
import os
import sys
from datetime import datetime, timezone

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import ribozyme_bayesian_audit_n30 as rba  # noqa: E402

REGISTRY_PATH = os.path.join(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))),
    "state",
    "discovery_absorption",
    "registry.jsonl",
)

# Each perturbation overrides the per-axis match thresholds.
# Default (canonical) thresholds: sigma in [10,15], tau=4, phi=2, J2=True.
ABLATION_PERTURBATIONS = {
    "shrink_sigma_range": {"sigma_range": (4, 8), "tau": 4, "phi": 2, "j2": True},
    "shift_tau_to_5":     {"sigma_range": (10, 15), "tau": 5, "phi": 2, "j2": True},
    "shift_phi_to_3":     {"sigma_range": (10, 15), "tau": 4, "phi": 3, "j2": True},
    "invert_j2":          {"sigma_range": (10, 15), "tau": 4, "phi": 2, "j2": False},
    "all_perturbed":      {"sigma_range": (4, 8), "tau": 5, "phi": 3, "j2": False},
}

PASS_DELTA_LOG10_BF = 0.5


def _match(entry: dict, thresh: dict) -> int:
    sigma_lo, sigma_hi = thresh["sigma_range"]
    sigma_match = 1 if sigma_lo <= entry["catalytic_core_nt_count"] <= sigma_hi else 0
    tau_match = 1 if entry["reaction_states_count"] == thresh["tau"] else 0
    phi_match = 1 if entry["output_binary"] == thresh["phi"] else 0
    j2_match = 1 if entry["ts_pose_symmetry_J2_24"] is thresh["j2"] else 0
    return sigma_match + tau_match + phi_match + j2_match


def _ablated_corpus(corpus: list[dict], thresh: dict) -> list[dict]:
    out = []
    for e in corpus:
        e2 = dict(e)
        e2["n6_match_count"] = _match(e, thresh)
        e2["axes_match"] = None  # invalidate precomputed flag list
        out.append(e2)
    return out


def run_audit(thresh: dict | None = None) -> dict:
    canonical = {"sigma_range": (10, 15), "tau": 4, "phi": 2, "j2": True}
    base_corpus = rba.build_corpus_n30()
    th = thresh if thresh is not None else canonical
    corpus = _ablated_corpus(base_corpus, th)
    bayes = rba.log_bayes_factor(corpus)
    matches_4 = sum(1 for e in corpus if e["n6_match_count"] == 4)
    lbf = bayes.get("log10_bayes_factor_h1_over_h0")
    sentinel = None
    if lbf == float("inf"):
        sentinel = "+inf"
        lbf = None
    elif lbf == float("-inf"):
        sentinel = "-inf"
        lbf = None
    return {
        "thresholds": {k: list(v) if isinstance(v, tuple) else v for k, v in th.items()},
        "n_match_4_of_4": matches_4,
        "match_fraction_4_of_4": matches_4 / len(corpus),
        "log10_bf": lbf,
        "log10_bf_sentinel": sentinel,
    }


def _delta(a_lbf, b_lbf, a_sent, b_sent) -> float:
    if a_sent == "-inf" or b_sent == "-inf" or a_sent == "+inf" or b_sent == "+inf":
        return 1e9
    if a_lbf is None or b_lbf is None:
        return 1e9
    return abs(a_lbf - b_lbf)


def main(argv: list[str]) -> int:
    p = argparse.ArgumentParser(description="F-RB-2-n6-decorative ablation runner")
    p.add_argument("--emit", action="store_true")
    p.add_argument("--summary", action="store_true")
    args = p.parse_args(argv)

    canonical = run_audit(thresh=None)
    ablations = {name: run_audit(perturb) for name, perturb in ABLATION_PERTURBATIONS.items()}

    deltas = {
        name: _delta(
            canonical["log10_bf"], ab["log10_bf"],
            canonical["log10_bf_sentinel"], ab["log10_bf_sentinel"],
        )
        for name, ab in ablations.items()
    }
    max_delta = max(deltas.values())
    delta_pass = max_delta >= PASS_DELTA_LOG10_BF

    audited_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    sub = {
        "f_rb_2_n6_decorative": {
            "verdict": "PASS" if delta_pass else "FAIL",
            "delta_log10_bf_max": max_delta,
            "delta_log10_bf_per_perturbation": deltas,
            "pass_threshold": PASS_DELTA_LOG10_BF,
            "canonical_log10_bf": canonical["log10_bf"],
            "canonical_log10_bf_sentinel": canonical["log10_bf_sentinel"],
            "ablation_log10_bf_sentinel": {
                name: ab["log10_bf_sentinel"] for name, ab in ablations.items()
            },
            "raw_91_c3_disclose": (
                "Ablation perturbs canonical thresholds (sigma in [10,15], "
                "tau=4, phi=2, J2=True) and re-evaluates per-axis matches. "
                "PASS if |delta log10_BF| >= 0.5 across at least one "
                "perturbation. log_bf sentinels (+inf for full match, -inf "
                "for no match) are mapped to delta sentinel 1e9 in PASS "
                "evaluation. F-RB-2 cycle-25 baseline: log_bf=79.74 "
                "(suspicious-perfect 30/30)."
            ),
        },
    }

    witness = {
        "schema": "raw_77_ribozyme_bayesian_audit_v2",
        "audited_at": audited_at,
        "audit_kind": "n6_decorative_ablation",
        "canonical_run": canonical,
        "ablation_runs": ablations,
        "f_rb_2_subclauses": sub,
        "raw_91_c3_disclose": sub["f_rb_2_n6_decorative"]["raw_91_c3_disclose"],
        "raw_77_append_only": True,
        "witness_ref": "state/discovery_absorption/registry.jsonl#raw_77_ribozyme_bayesian_audit_v2",
    }

    if args.emit:
        with open(REGISTRY_PATH, "a", encoding="utf-8") as fh:
            fh.write(json.dumps(witness, ensure_ascii=False, sort_keys=True) + "\n")
        sys.stderr.write(f"emitted 1 witness row -> {REGISTRY_PATH}\n")

    if args.summary:
        print(json.dumps(witness, sort_keys=True, indent=2))
    else:
        verdict = sub["f_rb_2_n6_decorative"]["verdict"]
        sys.stderr.write(
            f"canonical_match4={canonical['n_match_4_of_4']}/30  "
            f"max_delta={max_delta:.4f}  verdict={verdict}\n"
        )

    return 0 if delta_pass else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
