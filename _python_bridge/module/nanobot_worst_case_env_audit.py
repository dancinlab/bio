#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
nanobot_worst_case_env_audit.py — F-NB-3-c worst-case env audit.

Closes F-NB-3-c sub-clause (`.roadmap.nanobot` line 85). Runs nanobot
actuation sim at perturbed environmental conditions:
  T_kelvin = 320 K          (mild fever vs canonical 310 K)
  gamma_drag = canonical * 1.2  (Stokes drag +20%, water ETA proxy)

PASS criterion (relaxed per .roadmap.nanobot):
  work_per_cycle_kT >= 5.0  AND
  brownian_collapse_detected = false for >= 2500 cycles

Per cross-cutting Require (R5) raw 9 hexa-only: **Python stdlib only.**

Usage:

    python3 nanobot_worst_case_env_audit.py --emit
"""

from __future__ import annotations

import argparse
import json
import os
import sys
from datetime import datetime, timezone

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import nanobot_actuation_simulation as nas  # noqa: E402

REGISTRY_PATH = os.path.join(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))),
    "state",
    "discovery_absorption",
    "registry.jsonl",
)

PASS_WORK_KT_RELAXED = 5.0
PASS_MIN_CYCLES = 2500


def main(argv: list[str]) -> int:
    p = argparse.ArgumentParser(description="F-NB-3-c worst-case env audit")
    p.add_argument("--cycles", type=int, default=2500, help="cycles to run (default 2500 = relaxed PASS minimum)")
    p.add_argument("--emit", action="store_true")
    p.add_argument("--summary", action="store_true")
    args = p.parse_args(argv)

    # Monkey-patch ETA to +20% (gamma scales linearly with eta).
    eta_canonical = nas.ETA_WATER_310K
    nas.ETA_WATER_310K = eta_canonical * 1.2

    # T_kelvin = 320K (mild fever)
    result = nas.run_actuation(
        n_cycles=args.cycles,
        T_kelvin=320.0,
        skeleton="truncated_icosahedron",
        seed=42,
        verbose=False,
    )

    # Restore canonical eta for any downstream callers in same process.
    nas.ETA_WATER_310K = eta_canonical

    work_kT = result.get("work_per_cycle_kT_units") or 0.0
    n_cycles = result.get("n_cycles_run") or 0
    collapse = bool(result.get("brownian_collapse_detected", False))
    first_collapse = result.get("first_collapse_cycle")

    work_pass = work_kT >= PASS_WORK_KT_RELAXED
    collapse_pass = (not collapse) or (first_collapse is not None and first_collapse >= PASS_MIN_CYCLES)
    cycles_pass = n_cycles >= PASS_MIN_CYCLES
    overall = work_pass and collapse_pass and cycles_pass

    audited_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    sub = {
        "f_nb_3_c": {
            "verdict": "PASS" if overall else "FAIL",
            "T_kelvin_perturbed": 320.0,
            "gamma_perturbation_factor": 1.2,
            "n_cycles_run": n_cycles,
            "work_per_cycle_kT": work_kT,
            "brownian_collapse_detected": collapse,
            "first_collapse_cycle": first_collapse,
            "criteria": {
                "work_per_cycle_kT_ge_5": work_pass,
                "no_collapse_for_ge_2500_cycles": collapse_pass,
                "n_cycles_ge_2500": cycles_pass,
            },
        },
    }

    witness = {
        "schema": "raw_77_nanobot_subclause_direct_read_v3",
        "audited_at": audited_at,
        "audit_kind": "f_nb_3_c_worst_case_env",
        "perturbation": {
            "T_kelvin_canonical": 310.0,
            "T_kelvin_perturbed": 320.0,
            "eta_canonical_Pa_s": eta_canonical,
            "eta_perturbed_factor": 1.2,
        },
        "f_nb_3_subclauses": sub,
        "raw_91_c3_disclose": (
            "Worst-case environmental perturbation re-runs cycle-24 "
            "nanobot actuation sim with T_kelvin=320K (mild fever) and "
            "ETA_WATER scaled by 1.2 (gamma_drag +20%). Relaxed PASS "
            "criterion (work_per_cycle_kT >= 5 kT) compared to canonical "
            "F-NB-3-floor (>= 10 kT). Single-seed run; ensemble (N>=3 "
            "seeds) deferred to cycle-27 if needed."
        ),
        "raw_77_append_only": True,
        "witness_ref": "state/discovery_absorption/registry.jsonl#raw_77_nanobot_subclause_direct_read_v3",
    }

    if args.emit:
        with open(REGISTRY_PATH, "a", encoding="utf-8") as fh:
            fh.write(json.dumps(witness, ensure_ascii=False, sort_keys=True) + "\n")
        sys.stderr.write(f"emitted 1 witness row -> {REGISTRY_PATH}\n")

    if args.summary:
        print(json.dumps(witness, sort_keys=True, indent=2))
    else:
        sys.stderr.write(
            f"T=320K gamma+20%  cycles_run={n_cycles}  "
            f"work_kT={work_kT:.4f}  collapse={collapse}  "
            f"verdict={sub['f_nb_3_c']['verdict']}\n"
        )

    return 0 if overall else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
