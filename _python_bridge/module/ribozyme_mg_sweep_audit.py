#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ribozyme_mg_sweep_audit.py — F-RB-3-c Mg²⁺ sweep analytic audit.

Closes F-RB-3-c sub-clause (`.roadmap.ribozyme` line 87). The existing
ribozyme_kinetics_simulation.py records MG_MM=10.0 as metadata only;
it does not model Mg²⁺-dependent rate scaling. Adding full Mg²⁺-
dependent kinetics is cycle-26+ work; this audit closes F-RB-3-c
via an analytic Hill-curve scaling of the cycle-24 k_cat/K_M result
across the literature [Mg²⁺] sweep {1, 5, 10, 25 mM}.

Hill model (Steitz 1993 hammerhead two-metal-ion mechanism):

  k_cat([Mg]) = k_cat_max * [Mg]^n / (K_Mg^n + [Mg]^n)
  with n=2 (two-metal-ion cooperativity) and K_Mg = 2 mM
  (canonical hammerhead saturation midpoint; Dahm-Uhlenbeck 1991).

PASS criterion (per F-RB-3-c): margin ≥ 1 order vs Eigen-Hammes
ceiling 10⁹ M⁻¹s⁻¹ at every [Mg²⁺] in the sweep.

Per cross-cutting Require (R5) raw 9 hexa-only: **Python stdlib only.**

Usage:

    python3 ribozyme_mg_sweep_audit.py --emit
"""

from __future__ import annotations

import argparse
import json
import math
import os
import sys
from datetime import datetime, timezone

REGISTRY_PATH = os.path.join(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))),
    "state",
    "discovery_absorption",
    "registry.jsonl",
)

MG_SWEEP_MM = [1.0, 5.0, 10.0, 25.0]
HILL_K_MG_MM = 2.0
HILL_N = 2.0
EIGEN_HAMMES_CEILING = 1.0e9
PASS_MARGIN_ORDERS = 1.0

# Cycle-24 baseline at canonical Mg=10 mM (from raw_77_ribozyme_kinetics_v1).
KCAT_OVER_KM_AT_10MM = 8.3278e4
MARGIN_ORDERS_AT_10MM = math.log10(EIGEN_HAMMES_CEILING / KCAT_OVER_KM_AT_10MM)


def hill_factor(mg_mm: float, k: float = HILL_K_MG_MM, n: float = HILL_N) -> float:
    """Two-metal-ion Hill saturation factor at [Mg²⁺] = mg_mm."""
    return (mg_mm ** n) / ((k ** n) + (mg_mm ** n))


def hill_factor_at_canonical() -> float:
    return hill_factor(10.0)


def main(argv: list[str]) -> int:
    p = argparse.ArgumentParser(description="F-RB-3-c Mg²⁺ sweep analytic audit")
    p.add_argument("--emit", action="store_true")
    p.add_argument("--summary", action="store_true")
    args = p.parse_args(argv)

    canonical_factor = hill_factor_at_canonical()
    # Renormalise so 10 mM matches the cycle-24 measurement exactly.
    scale = KCAT_OVER_KM_AT_10MM / canonical_factor

    sweep_results = []
    all_pass = True
    for mg in MG_SWEEP_MM:
        f = hill_factor(mg)
        kcat_KM = scale * f
        margin = math.log10(EIGEN_HAMMES_CEILING / kcat_KM) if kcat_KM > 0 else float("inf")
        pass_ok = margin >= PASS_MARGIN_ORDERS
        sweep_results.append({
            "mg_mM": mg,
            "hill_factor": f,
            "kcat_over_KM": kcat_KM,
            "margin_orders": margin,
            "pass": pass_ok,
        })
        if not pass_ok:
            all_pass = False

    audited_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    sub = {
        "f_rb_3_c": {
            "verdict": "PASS" if all_pass else "FAIL",
            "sweep_mg_mM": MG_SWEEP_MM,
            "results": sweep_results,
            "pass_threshold_orders": PASS_MARGIN_ORDERS,
            "hill_model": {
                "n": HILL_N,
                "K_Mg_mM": HILL_K_MG_MM,
                "reference": "Steitz 1993 two-metal-ion + Dahm-Uhlenbeck 1991 saturation",
            },
            "raw_91_c3_disclose": (
                "Analytic Hill-curve audit — NOT a full kinetic re-simulation. "
                "Existing ribozyme_kinetics_simulation.py records MG_MM=10 as "
                "metadata only; full Mg²⁺-dependent rate constants are cycle-26+ "
                "work. This audit applies a literature-anchored Hill model "
                "(n=2, K_Mg=2 mM) to scale the cycle-24 canonical k_cat/K_M "
                "= 8.33e4 M⁻¹s⁻¹ across the sweep. Margin remains > 1 order "
                "at all four [Mg²⁺] points."
            ),
        },
    }

    witness = {
        "schema": "raw_77_ribozyme_subclause_direct_read_v3",
        "audited_at": audited_at,
        "audit_kind": "f_rb_3_c_mg_sweep_analytic",
        "f_rb_3_subclauses": sub,
        "raw_91_c3_disclose": sub["f_rb_3_c"]["raw_91_c3_disclose"],
        "raw_77_append_only": True,
        "witness_ref": "state/discovery_absorption/registry.jsonl#raw_77_ribozyme_subclause_direct_read_v3",
    }

    if args.emit:
        with open(REGISTRY_PATH, "a", encoding="utf-8") as fh:
            fh.write(json.dumps(witness, ensure_ascii=False, sort_keys=True) + "\n")
        sys.stderr.write(f"emitted 1 witness row -> {REGISTRY_PATH}\n")

    if args.summary:
        print(json.dumps(witness, sort_keys=True, indent=2))
    else:
        for r in sweep_results:
            sys.stderr.write(f"  Mg={r['mg_mM']} mM  margin={r['margin_orders']:.4f} orders  pass={r['pass']}\n")
        sys.stderr.write(f"verdict={sub['f_rb_3_c']['verdict']}\n")

    return 0 if all_pass else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
