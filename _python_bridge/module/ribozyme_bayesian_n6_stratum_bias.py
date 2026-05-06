#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ribozyme_bayesian_n6_stratum_bias.py — F-RB-2 source-class stratum bias.

Mirrors the nanobot F-NB-2-c sub-clause closure pattern for the
ribozyme n=30 catalytic-RNA corpus. Stratifies by reference year
(pre-2000 textbook proxy vs post-2000 experimental proxy) and re-runs
`log_bayes_factor` within each stratum to test whether the cycle-25
suspicious-perfect 30/30 match rate (log_bf=79.74 PASS PENDING
INTER-RATER) is robust under source-class disaggregation.

PASS gate: |log10_BF(pre_2000) − log10_BF(post_2000)| ≤ 1.0 (one
Jeffreys band).
  PASS  → strata agree, F-RB-2 robust to corpus selection.
  FAIL  → significant inter-stratum disagreement; F-RB-2 verdict
          partially driven by curation choices.

Per cross-cutting Require (R5) raw 9 hexa-only: **Python stdlib only.**

Usage:

    python3 ribozyme_bayesian_n6_stratum_bias.py --summary
    python3 ribozyme_bayesian_n6_stratum_bias.py --emit
"""

from __future__ import annotations

import argparse
import json
import os
import re
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

YEAR_RE = re.compile(r"\b(19[5-9]\d|20[0-3]\d)\b")
PASS_DELTA = 1.0


def classify(entry: dict) -> str:
    ref = entry.get("paper_ref", "") or entry.get("ref", "") or ""
    m = YEAR_RE.search(ref)
    if not m:
        return "unknown"
    year = int(m.group(1))
    return "pre_2000" if year < 2000 else "post_2000"


def stratum_audit(stratum_corpus: list[dict]) -> dict:
    if not stratum_corpus:
        return {"n": 0, "n_match_4_of_4": 0, "log10_bf": None,
                "log10_bf_sentinel": "empty_stratum"}
    bayes = rba.log_bayes_factor(stratum_corpus)
    matches = sum(1 for e in stratum_corpus if rba.n6_match_per_entry(e) == 4)
    lbf = bayes.get("log10_bayes_factor_h1_over_h0")
    sentinel = None
    if lbf is None:
        sentinel = "unavailable"
    elif lbf == float("inf"):
        sentinel = "+inf"
        lbf = None
    elif lbf == float("-inf"):
        sentinel = "-inf"
        lbf = None
    return {
        "n": len(stratum_corpus),
        "n_match_4_of_4": matches,
        "match_fraction_4_of_4": matches / len(stratum_corpus),
        "log10_bf": lbf,
        "log10_bf_sentinel": sentinel,
    }


def compute_delta(a: dict, b: dict) -> tuple[float, str]:
    if a.get("log10_bf") is None or b.get("log10_bf") is None:
        a_frac = a["match_fraction_4_of_4"]
        b_frac = b["match_fraction_4_of_4"]
        return abs(a_frac - b_frac) * 10.0, "match_fraction_proxy"
    return abs(a["log10_bf"] - b["log10_bf"]), "log10_bf_direct"


def main(argv: list[str]) -> int:
    p = argparse.ArgumentParser(description="F-RB-2 stratum bias")
    p.add_argument("--emit", action="store_true")
    p.add_argument("--summary", action="store_true")
    args = p.parse_args(argv)

    corpus = rba.build_corpus_n30()
    strata = {"pre_2000": [], "post_2000": [], "unknown": []}
    for e in corpus:
        strata[classify(e)].append(e)

    audit_pre = stratum_audit(strata["pre_2000"])
    audit_post = stratum_audit(strata["post_2000"])
    audit_unknown = stratum_audit(strata["unknown"])

    delta, method = compute_delta(audit_pre, audit_post)
    verdict = "PASS" if delta <= PASS_DELTA else "FAIL"

    audited_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    witness = {
        "schema": "raw_77_ribozyme_bayesian_audit_v2",
        "audited_at": audited_at,
        "audit_kind": "n6_source_class_stratum_bias",
        "stratum_classifier": "year_pre_post_2000",
        "stratum_results": {
            "pre_2000": audit_pre,
            "post_2000": audit_post,
            "unknown": audit_unknown,
        },
        "f_rb_2_subclauses": {
            "f_rb_2_stratum_bias": {
                "verdict": verdict,
                "delta_log10_bf": delta,
                "delta_method": method,
                "pass_threshold": PASS_DELTA,
                "raw_91_c3_disclose": (
                    "Stratification by paper_ref year (pre/post 2000) is a "
                    "proxy for textbook-vs-experimental source class. "
                    "F-RB-2 cycle-25 audit gave suspicious-perfect 30/30 "
                    "(log_bf=79.74); this audit tests whether that result "
                    "survives source-class disaggregation. PASS = |delta "
                    "log10_BF| <= 1.0."
                ),
            },
        },
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
        sys.stderr.write(
            f"pre_2000 n={audit_pre['n']} m4={audit_pre['n_match_4_of_4']}/{audit_pre['n']} "
            f"log_bf={audit_pre.get('log10_bf')}  "
            f"post_2000 n={audit_post['n']} m4={audit_post['n_match_4_of_4']}/{audit_post['n']} "
            f"log_bf={audit_post.get('log10_bf')}  "
            f"delta={delta:.4f} ({method})  verdict={verdict}\n"
        )

    return 0 if verdict == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
