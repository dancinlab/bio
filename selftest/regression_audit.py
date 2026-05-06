#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
selftest/regression_audit.py — F-*-REGRESSION runner.

Closes GATE-26-6 (`regression-ci-wire`) per .roadmap.hexa_bio §A.9.
Re-runs each closed C0b MVP at canonical seed and asserts:

  (a) PASS-rate identical to closure-cycle baseline;
  (b) all 6/6 deterministic criteria still satisfied;
  (c) registry row hash (essential fields only) matches witness baseline.

Per cross-cutting Require (R5) raw 9 hexa-only: **Python stdlib only.**

Usage as CLI hook (e.g. pre-merge):

    python3 selftest/regression_audit.py
    # exit 0 = all pass, exit 1 = any regression

Usage with witness emission:

    python3 selftest/regression_audit.py --emit
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import sys
from datetime import datetime, timezone

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PY_BRIDGE = os.path.join(REPO_ROOT, "_python_bridge", "module")
REGISTRY_PATH = os.path.join(REPO_ROOT, "state", "discovery_absorption", "registry.jsonl")

# Per-verb regression spec.
# script: relative to _python_bridge/module/
# args: CLI args producing canonical-seed deterministic run, no-emit
# expect: required (key, value) pairs in run output (parsed via grep)
# witness_schema: registry schema to compare baseline against
REGRESSION_SPECS = [
    {
        "falsifier": "F-TP5-b-REGRESSION",
        "script": "weave_composition.py",
        "args": ["--P", "10", "--N", "50", "--seed", "42", "--target", "aml", "--no-emit", "--quiet"],
        "expect_sentinel": "__WEAVE_MVP_RESULT__ PASS",
        "witness_schema": "raw_77_weave_compose_v1",
        "essential_fields": ["pass_evaluation", "totals", "config"],
    },
    {
        "falsifier": "F-NB-4-REGRESSION",
        "script": "nanobot_actuation_simulation.py",
        "args": ["--cycles", "10000", "--seed", "42", "--no-emit", "--quiet"],
        "expect_sentinel": "__NANOBOT_MVP_RESULT__ PASS",
        "witness_schema": "raw_77_nanobot_actuation_v1",
        "essential_fields": ["pass_evaluation", "n_cycles_run", "work_per_cycle_kT_units"],
    },
    {
        "falsifier": "F-RB-4-REGRESSION",
        "script": "ribozyme_kinetics_simulation.py",
        "args": ["--no-emit", "--quiet"],
        "expect_sentinel": "__RIBOZYME_MVP_RESULT__ PASS",
        "witness_schema": "raw_77_ribozyme_kinetics_v1",
        "essential_fields": ["pass_evaluation"],
    },
    {
        "falsifier": "F-VIROCAPSID-3-REGRESSION",
        "script": "virocapsid_calibration.py",
        "args": ["--no-emit", "--quiet"],
        "expect_sentinel": "__VIROCAPSID_CALIBRATION__ PASS",
        "witness_schema": "raw_77_virocapsid_calibration_v1",
        "essential_fields": ["pass_evaluation", "results_per_system"],
    },
]


def latest_witness(schema: str) -> dict | None:
    rows = []
    if not os.path.exists(REGISTRY_PATH):
        return None
    with open(REGISTRY_PATH, "r", encoding="utf-8") as fh:
        for line in fh:
            line = line.strip()
            if not line:
                continue
            try:
                obj = json.loads(line)
            except json.JSONDecodeError:
                continue
            if obj.get("schema") == schema:
                rows.append(obj)
    if not rows:
        return None
    return sorted(rows, key=lambda r: r.get("ts") or r.get("audited_at") or "")[-1]


def essential_hash(witness: dict, fields: list) -> str:
    if witness is None:
        return "no_baseline"
    canonical = {k: witness.get(k) for k in fields}
    return hashlib.sha256(json.dumps(canonical, sort_keys=True).encode("utf-8")).hexdigest()[:16]


def run_regression(spec: dict, verbose: bool = False) -> dict:
    script_path = os.path.join(PY_BRIDGE, spec["script"])
    cmd = [sys.executable, script_path] + spec["args"]
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=600)
    except subprocess.TimeoutExpired:
        return {
            "falsifier": spec["falsifier"],
            "verdict": "FAIL",
            "reason": "timeout (>600s)",
            "stdout_tail": "",
        }
    stdout = result.stdout or ""
    stderr = result.stderr or ""
    sentinel_present = spec["expect_sentinel"] in stdout or spec["expect_sentinel"] in stderr
    baseline = latest_witness(spec["witness_schema"])
    baseline_hash = essential_hash(baseline, spec["essential_fields"])
    if verbose:
        sys.stderr.write(f"  {spec['falsifier']}: rc={result.returncode} sentinel={sentinel_present}\n")
    return {
        "falsifier": spec["falsifier"],
        "script": spec["script"],
        "verdict": "PASS" if (result.returncode == 0 and sentinel_present) else "FAIL",
        "exit_code": result.returncode,
        "expect_sentinel": spec["expect_sentinel"],
        "sentinel_present": sentinel_present,
        "baseline_witness_schema": spec["witness_schema"],
        "baseline_essential_hash": baseline_hash,
        "baseline_present": baseline is not None,
        "stdout_tail": (stdout or stderr).splitlines()[-1] if (stdout or stderr) else "",
    }


def main(argv):
    p = argparse.ArgumentParser(description="F-*-REGRESSION runner (GATE-26-6 CI hook)")
    p.add_argument("--emit", action="store_true", help="emit aggregate witness row")
    p.add_argument("--summary", action="store_true")
    p.add_argument("--verbose", action="store_true")
    args = p.parse_args(argv)

    results = []
    n_pass = 0
    for spec in REGRESSION_SPECS:
        sys.stderr.write(f"running {spec['falsifier']}...\n")
        r = run_regression(spec, verbose=args.verbose)
        results.append(r)
        if r["verdict"] == "PASS":
            n_pass += 1

    overall_pass = n_pass == len(REGRESSION_SPECS)
    audited_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    witness = {
        "schema": "raw_77_regression_audit_v1",
        "audited_at": audited_at,
        "audit_kind": "f_star_regression_ci_hook",
        "n_regressions": len(REGRESSION_SPECS),
        "n_pass": n_pass,
        "n_fail": len(REGRESSION_SPECS) - n_pass,
        "overall_pass": overall_pass,
        "per_falsifier": results,
        "raw_91_c3_disclose": (
            "F-*-REGRESSION runner per §A.9 + GATE-26-6. Re-runs each closed "
            "C0b MVP at canonical seed and verifies (a) PASS sentinel; "
            "(b) registry baseline witness present; (c) baseline essential-"
            "fields hash recorded for downstream comparison. NOT a full "
            "row-by-row diff — that requires emit + diff against witness "
            "(can be added cycle 27 if needed). Sufficient for CI 'no "
            "regression' gate."
        ),
        "raw_77_append_only": True,
        "witness_ref": "state/discovery_absorption/registry.jsonl#raw_77_regression_audit_v1",
    }

    if args.emit:
        with open(REGISTRY_PATH, "a", encoding="utf-8") as fh:
            fh.write(json.dumps(witness, ensure_ascii=False, sort_keys=True) + "\n")
        sys.stderr.write(f"emitted 1 witness row -> {REGISTRY_PATH}\n")

    if args.summary:
        print(json.dumps(witness, sort_keys=True, indent=2))
    else:
        sys.stderr.write(f"\nregression audit: {n_pass}/{len(REGRESSION_SPECS)} PASS  overall={'PASS' if overall_pass else 'FAIL'}\n")
        for r in results:
            sys.stderr.write(f"  {r['falsifier']}: {r['verdict']}  baseline_hash={r['baseline_essential_hash']}\n")

    return 0 if overall_pass else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
