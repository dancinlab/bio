#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
nanobot_bayesian_n6_ablation.py — F-NB-2-n6-decorative ablation runner.

Closes F-NB-2-n6-decorative sub-clause (`.roadmap.nanobot` line 69 / 80;
see also `bayesian_audit_v2.schema.json`). Tests whether the n=30 nano-
machine corpus' fit to the n=6 invariant lattice is **load-bearing**
(genuinely supported by the canonical constants σ=12, τ=4, φ=2, J₂=24)
or **decorative** (would survive equally well under perturbed constants).

PASS gate: |Δlog10_BF| ≥ 0.5 between canonical and perturbed runs.
  PASS  → n6 IS load-bearing (lattice carries Bayes factor weight).
  FAIL  → n6 IS decorative (constants don't matter; structural-approx).

Per cross-cutting Require (R5) raw 9 hexa-only: **Python stdlib only.**
Re-uses `nanobot_bayesian_audit_n30.build_corpus_n30()` corpus and
`log_bayes_factor()` machinery; monkey-patches the four constants.

Witness emission: schema `raw_77_nanobot_bayesian_audit_v2` (per
`nanobot/spec/bayesian_audit_v2.schema.json`).

Usage:

    python3 nanobot_bayesian_n6_ablation.py --summary
    python3 nanobot_bayesian_n6_ablation.py --emit
"""

from __future__ import annotations

import argparse
import json
import os
import sys
from datetime import datetime, timezone

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import nanobot_bayesian_audit_n30 as nba  # noqa: E402

REGISTRY_PATH = os.path.join(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))),
    "state",
    "discovery_absorption",
    "registry.jsonl",
)

# Off-by-one perturbations: shifts each canonical constant by +/- 1 so the
# audit re-evaluates on the same corpus with shifted predictions.
ABLATION_PERTURBATIONS = {
    "off_by_one_low": {"SIGMA_6": 11, "TAU_6": 3, "PHI_6": 3, "J2": 23},
    "off_by_one_high": {"SIGMA_6": 13, "TAU_6": 5, "PHI_6": 1, "J2": 25},
    "shifted_factor": {"SIGMA_6": 10, "TAU_6": 6, "PHI_6": 2, "J2": 30},
}

PASS_DELTA_LOG10_BF = 0.5


def run_audit(constants: dict | None = None) -> dict:
    """Run audit with the given constant overrides (None = canonical)."""
    if constants is not None:
        nba.SIGMA_6 = constants["SIGMA_6"]
        nba.TAU_6 = constants["TAU_6"]
        nba.PHI_6 = constants["PHI_6"]
        nba.J2 = constants["J2"]
    else:
        # Restore canonical values defensively.
        nba.SIGMA_6 = 12
        nba.TAU_6 = 4
        nba.PHI_6 = 2
        nba.J2 = 24

    corpus = nba.build_corpus_n30()
    bayes = nba.log_bayes_factor(corpus)
    n_match = sum(nba.n6_match_per_entry(e) for e in corpus)
    n_total = sum(nba._applicable_axes_per_entry(e) for e in corpus)

    return {
        "constants": {
            "SIGMA_6": nba.SIGMA_6, "TAU_6": nba.TAU_6,
            "PHI_6": nba.PHI_6, "J2": nba.J2,
        },
        "n_match": n_match,
        "n_total": n_total,
        "match_fraction": (n_match / n_total) if n_total else 0.0,
        "log10_bf": bayes["log10_bayes_factor_h1_over_h0"],
        "posterior_h1": bayes["posterior_h1_lattice_loadbearing"],
    }


def _sanitize(run: dict) -> dict:
    """Replace +/- inf with sentinel strings for JSON-strict serialisation."""
    out = dict(run)
    log_bf = out.get("log10_bf")
    if log_bf is None or log_bf != log_bf:  # NaN
        out["log10_bf"] = None
        out["log10_bf_sentinel"] = "nan"
    elif log_bf == float("inf"):
        out["log10_bf"] = None
        out["log10_bf_sentinel"] = "+inf"
    elif log_bf == float("-inf"):
        out["log10_bf"] = None
        out["log10_bf_sentinel"] = "-inf"
    return out


def _delta(canon_bf: float, run_bf: float) -> float:
    """Compute |delta log10 BF| with infinity handling.
    +/-inf delta returned as 1e9 (large finite sentinel — well above any
    PASS threshold, JSON-serialisable)."""
    if run_bf == float("-inf") or run_bf == float("inf"):
        return 1e9
    if canon_bf == float("-inf") or canon_bf == float("inf"):
        return 1e9
    return abs(canon_bf - run_bf)


def build_witness(canonical: dict, ablations: dict, audited_at: str) -> dict:
    deltas = {
        name: _delta(canonical["log10_bf"], run["log10_bf"])
        for name, run in ablations.items()
    }
    max_delta = max(deltas.values()) if deltas else 0.0
    delta_pass = max_delta >= PASS_DELTA_LOG10_BF
    canonical_clean = _sanitize(canonical)
    ablations_clean = {name: _sanitize(run) for name, run in ablations.items()}

    # Witness shape conforms to nanobot/spec/bayesian_audit_v2.schema.json
    # F-NB-2-n6-decorative result block.
    sub = {
        "f_nb_2_n6_decorative": {
            "verdict": "PASS" if delta_pass else "FAIL",
            "delta_log10_bf_max": max_delta,
            "delta_log10_bf_per_perturbation": deltas,
            "pass_threshold": PASS_DELTA_LOG10_BF,
            "canonical_log10_bf": canonical_clean["log10_bf"],
            "canonical_log10_bf_sentinel": canonical_clean.get("log10_bf_sentinel"),
            "ablation_log10_bf": {
                name: run["log10_bf"] for name, run in ablations_clean.items()
            },
            "ablation_log10_bf_sentinel": {
                name: run.get("log10_bf_sentinel")
                for name, run in ablations_clean.items()
            },
            "raw_91_c3_disclose": (
                "Ablation perturbs canonical (sigma=12, tau=4, phi=2, J2=24) "
                "by +/-1 (off-by-one-low/high) and shifted-factor "
                "(10/6/2/30). PASS if |delta log10_BF| >= 0.5 across at "
                "least one perturbation. Tests load-bearing-ness of the "
                "n=6 lattice on the corpus, NOT corpus correctness. "
                "log10_bf=null with sentinel='-inf' means 0 matches (full "
                "ablation collapse); delta sentinel 1e9 (effectively "
                "infinite) used in PASS evaluation."
            ),
        },
    }

    return {
        "schema": "raw_77_nanobot_bayesian_audit_v2",
        "audited_at": audited_at,
        "audit_kind": "n6_decorative_ablation",
        "canonical_run": canonical_clean,
        "ablation_runs": ablations_clean,
        "f_nb_2_subclauses": sub,
        "raw_91_c3_disclose": sub["f_nb_2_n6_decorative"]["raw_91_c3_disclose"],
        "raw_77_append_only": True,
        "witness_ref": "state/discovery_absorption/registry.jsonl#raw_77_nanobot_bayesian_audit_v2",
    }


def main(argv: list[str]) -> int:
    p = argparse.ArgumentParser(description="F-NB-2-n6-decorative ablation runner")
    p.add_argument("--emit", action="store_true", help="Append witness row to registry.")
    p.add_argument("--summary", action="store_true", help="Print witness JSON to stdout.")
    args = p.parse_args(argv)

    canonical = run_audit(constants=None)
    ablations = {name: run_audit(perturb) for name, perturb in ABLATION_PERTURBATIONS.items()}
    audited_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    witness = build_witness(canonical, ablations, audited_at)

    if args.emit:
        with open(REGISTRY_PATH, "a", encoding="utf-8") as fh:
            fh.write(json.dumps(witness, ensure_ascii=False, sort_keys=True) + "\n")
        sys.stderr.write(f"emitted 1 witness row -> {REGISTRY_PATH}\n")

    if args.summary:
        print(json.dumps(witness, sort_keys=True, indent=2))
    else:
        verdict = witness["f_nb_2_subclauses"]["f_nb_2_n6_decorative"]["verdict"]
        max_d = witness["f_nb_2_subclauses"]["f_nb_2_n6_decorative"]["delta_log10_bf_max"]
        sys.stderr.write(
            f"canonical_log10_bf={canonical['log10_bf']:.4f}  "
            f"max_delta={max_d:.4f}  "
            f"verdict={verdict}\n"
        )

    return 0 if witness["f_nb_2_subclauses"]["f_nb_2_n6_decorative"]["verdict"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
