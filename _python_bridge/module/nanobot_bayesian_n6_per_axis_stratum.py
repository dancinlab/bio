#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
nanobot_bayesian_n6_per_axis_stratum.py — F-NB-2-c per-axis stratum decomposition.

Iteration 4 of the /loop session found F-NB-2-c stratum bias FAIL with
delta=3.65 (pre_2000 log_bf=+2.65 vs post_2000 log_bf=-0.99). This audit
decomposes that aggregate finding into per-axis match-rate strata to
identify WHICH axis (sigma_observed / tau_observed / phi_observed /
J2_observed) is responsible for the inter-stratum disagreement.

PASS criterion (auxiliary diagnostic, not a falsifier gate):
  Identify per-axis match-rate by stratum. The axis with largest
  |pre_2000_match_rate − post_2000_match_rate| is the bias-driver.

Per cross-cutting Require (R5) raw 9 hexa-only: **Python stdlib only.**

Usage:

    python3 nanobot_bayesian_n6_per_axis_stratum.py --emit
"""

from __future__ import annotations

import argparse
import json
import os
import re
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

YEAR_RE = re.compile(r"\b(19[5-9]\d|20[0-3]\d)\b")


def classify(entry: dict) -> str:
    ref = entry.get("ref", "") or ""
    m = YEAR_RE.search(ref)
    if not m:
        return "unknown"
    year = int(m.group(1))
    return "pre_2000" if year < 2000 else "post_2000"


def per_axis_match_rates(corpus: list[dict]) -> dict:
    if not corpus:
        return {"sigma": None, "tau": None, "phi": None, "J2": None}
    sigma_match = 0
    tau_match = 0
    phi_match = 0
    j2_match = 0
    sigma_app = 0
    tau_app = 0
    phi_app = 0
    j2_app = 0
    for e in corpus:
        s, t, p, j = nba._axis_match_flags(e)
        if e.get("sigma_observed") is not None:
            sigma_app += 1
            if s:
                sigma_match += 1
        if e.get("tau_observed") is not None:
            tau_app += 1
            if t:
                tau_match += 1
        if e.get("phi_observed") is not None:
            phi_app += 1
            if p:
                phi_match += 1
        if e.get("J2_observed") is not None:
            j2_app += 1
            if j:
                j2_match += 1
    return {
        "sigma": {"applicable": sigma_app, "matches": sigma_match,
                  "rate": (sigma_match / sigma_app) if sigma_app else None},
        "tau": {"applicable": tau_app, "matches": tau_match,
                "rate": (tau_match / tau_app) if tau_app else None},
        "phi": {"applicable": phi_app, "matches": phi_match,
                "rate": (phi_match / phi_app) if phi_app else None},
        "J2": {"applicable": j2_app, "matches": j2_match,
               "rate": (j2_match / j2_app) if j2_app else None},
    }


def main(argv: list[str]) -> int:
    p = argparse.ArgumentParser(description="F-NB-2-c per-axis stratum decomposition")
    p.add_argument("--emit", action="store_true")
    p.add_argument("--summary", action="store_true")
    args = p.parse_args(argv)

    nba.SIGMA_6, nba.TAU_6, nba.PHI_6, nba.J2 = 12, 4, 2, 24
    corpus = nba.build_corpus_n30()
    strata = {"pre_2000": [], "post_2000": [], "unknown": []}
    for e in corpus:
        strata[classify(e)].append(e)

    rates_pre = per_axis_match_rates(strata["pre_2000"])
    rates_post = per_axis_match_rates(strata["post_2000"])
    rates_unknown = per_axis_match_rates(strata["unknown"])

    deltas = {}
    for axis in ["sigma", "tau", "phi", "J2"]:
        a = rates_pre[axis]
        b = rates_post[axis]
        if a["rate"] is None or b["rate"] is None:
            deltas[axis] = None
        else:
            deltas[axis] = abs(a["rate"] - b["rate"])

    valid_deltas = {k: v for k, v in deltas.items() if v is not None}
    bias_driver_axis = max(valid_deltas, key=valid_deltas.get) if valid_deltas else None
    bias_driver_delta = valid_deltas.get(bias_driver_axis) if bias_driver_axis else None

    audited_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    witness = {
        "schema": "raw_77_nanobot_bayesian_audit_v2",
        "audited_at": audited_at,
        "audit_kind": "n6_per_axis_stratum_decomposition",
        "stratum_classifier": "year_pre_post_2000",
        "n_pre_2000": len(strata["pre_2000"]),
        "n_post_2000": len(strata["post_2000"]),
        "n_unknown": len(strata["unknown"]),
        "rates_pre_2000": rates_pre,
        "rates_post_2000": rates_post,
        "rates_unknown": rates_unknown,
        "deltas_per_axis": deltas,
        "bias_driver_axis": bias_driver_axis,
        "bias_driver_delta": bias_driver_delta,
        "raw_91_c3_disclose": (
            "F-NB-2-c follow-up: decomposes the cycle-25 stratum bias FAIL "
            "(aggregate delta=3.65) into per-axis match-rate deltas to "
            "identify the bias-driver axis. Diagnostic, not a gate. "
            "Cycle-27 corpus enlargement should target the bias-driver axis "
            "specifically (expand experimental entries that DO register that "
            "axis)."
        ),
        "raw_77_append_only": True,
        "witness_ref": "state/discovery_absorption/registry.jsonl#raw_77_nanobot_bayesian_audit_v2",
    }

    if args.emit:
        with open(REGISTRY_PATH, "a", encoding="utf-8") as fh:
            fh.write(json.dumps(witness, ensure_ascii=False, sort_keys=True) + "\n")
        sys.stderr.write(f"emitted 1 witness row -> {REGISTRY_PATH}\n")

    if args.summary:
        print(json.dumps(witness, sort_keys=True, indent=2))
    else:
        sys.stderr.write(f"pre_2000 (n={len(strata['pre_2000'])}):\n")
        for axis in ["sigma", "tau", "phi", "J2"]:
            r = rates_pre[axis]
            sys.stderr.write(f"  {axis}: applicable={r['applicable']} match={r['matches']} rate={r['rate']}\n")
        sys.stderr.write(f"post_2000 (n={len(strata['post_2000'])}):\n")
        for axis in ["sigma", "tau", "phi", "J2"]:
            r = rates_post[axis]
            sys.stderr.write(f"  {axis}: applicable={r['applicable']} match={r['matches']} rate={r['rate']}\n")
        sys.stderr.write(f"deltas: {deltas}\n")
        sys.stderr.write(f"bias_driver_axis={bias_driver_axis} (delta={bias_driver_delta})\n")

    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
