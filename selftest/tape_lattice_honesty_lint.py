#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
tape_lattice_honesty_lint.py — generic LATTICE_POLICY honesty lint for a single
cohort `.tape` file (HEXA family: hexa-bio, florea, ...).

This is NOT a 5-axis molecular verifier (that is
n6_axis_computational_verification.py). It is the cohort-wide enforcement of
LATTICE_POLICY g1/g2/g3 + the f1 "observation-not-derivation" rule, applied to
any domain `.tape`: a tape must NOT derive efficacy / counts / ratios FROM the
n=6 lattice without citing the real underlying science.

hexa-bio owns LATTICE_POLICY enforcement for the cohort, so this lint lives here
and is invoked by sibling repos via CLI shell-out (e.g. florea
`florea analyze <verb>` → `hexa-bio tape-lint <path>`). Sibling repos do NOT
reimplement it (hexa-bio AGENTS.tape g5_sister_repo_cli; florea AGENTS.tape
g_use_hexa_bio_cli).

Contract a domain `.tape` must satisfy to PASS:
  1. carries an `@F` lattice-fit guard  (id `f_lattice_fit` or pattern
     containing "lattice-fit")
  2. carries an honest n=6 stance        (`@N` note id/text on
     observation-not-derivation, OR an authoritative §0 honesty_framing)
  3. is grounded                         (>= 1 real citation: an `@X ... ::
     literature` entry or a body `ref =` line)
  4. any lattice-derivation-looking line is flagged provenance (WARN, not
     FAIL) only when 1-3 hold; FAIL if the guard/grounding is absent.

Verdict: PASS / FAIL / SKIP.  SKIP = not a domain tape (no `@I id001`) or file
absent (honest, not failure — mirrors the cohort SKIP-is-honest rule).

Pure stdlib. Deterministic. Exit 0 + `__TAPE_LATTICE_HONESTY__ PASS` (or SKIP)
on non-failure; exit 1 + `... FAIL` on a governance violation.

Usage:
    python3 selftest/tape_lattice_honesty_lint.py <path/to/DOMAIN.tape> [--json]
"""
from __future__ import annotations

import json
import re
import sys

# Lattice tokens whose appearance *on the same line as a magnitude* suggests a
# derivation-from-lattice (the anti-pattern). Unicode + ASCII spellings.
_LATTICE_TOKENS = r"(?:σ|τ|φ|J₂|J2|sigma|tau|phi|sopfr|n=6|n/phi|n/φ)"
# A magnitude = a percentage, a "ratio"/"비율", or "= <number>" assignment.
_MAGNITUDE = r"(?:\d+\s*%|비율|ratio|배|×\s*\d|x\s*\d|=\s*\d)"
# Heuristic: a line that ties a magnitude to a lattice token via = / 비율 / ratio.
_DERIV_RE = re.compile(_MAGNITUDE + r".{0,40}?" + _LATTICE_TOKENS
                       + r"|" + _LATTICE_TOKENS + r".{0,40}?" + _MAGNITUDE)


def lint(path: str) -> dict:
    try:
        with open(path, "r", encoding="utf-8") as fh:
            text = fh.read()
    except FileNotFoundError:
        return {"verdict": "SKIP", "reason": f"file not found: {path}"}
    except OSError as e:
        return {"verdict": "SKIP", "reason": f"unreadable: {e}"}

    lines = text.splitlines()

    has_identity = any(l.startswith("@I id001") for l in lines)
    if not has_identity:
        return {"verdict": "SKIP",
                "reason": "no @I id001 — not a domain tape (nothing to lint)"}

    has_guard = False
    has_stance = False
    has_citation = False
    deriv_hits: list[str] = []

    for i, raw in enumerate(lines, 1):
        l = raw.strip()
        if not l or l.startswith("#"):
            continue

        # 1. @F lattice-fit guard
        if l.startswith("@F"):
            if "f_lattice_fit" in l or "lattice-fit" in l:
                has_guard = True
        # 2. honest n=6 stance: an @N note keyed on honesty / n6 stance,
        #    or a §0-style honesty_framing note.
        if l.startswith("@N"):
            if ("honest" in l or "n6_honest" in l or "honesty_framing" in l
                    or "observation" in l):
                has_stance = True
        # 3. grounding: an @X literature entry, or any `ref =` body line.
        if l.startswith("@X") and ":: literature" in l:
            has_citation = True
        if l.startswith("ref =") or l.startswith("ref="):
            has_citation = True
        # also accept an explicit @D ... |> "[@x_...]" verified-by edge as
        # grounding signal (cites a real source entry).
        if l.startswith("|>") and "[@x_" in l:
            has_citation = True

        # 4. derivation-from-lattice heuristic (skip primer/grammar comment
        #    block and the guard/stance entries themselves).
        if (not l.startswith("@") and not l.startswith("|>")
                and _DERIV_RE.search(l)):
            # An authoritative honesty note that *quotes* the bad phrasing to
            # forbid it is allowed; only count lines that look like live claims.
            low = l.lower()
            if ("flagged" in low or "forbid" in low or "anti-pattern" in low
                    or "superseded" in low or "provenance" in low):
                continue
            deriv_hits.append(f"L{i}: {l[:90]}")

    grounded = has_citation
    guarded = has_guard and has_stance

    if not guarded or not grounded:
        missing = []
        if not has_guard:
            missing.append("@F lattice-fit guard")
        if not has_stance:
            missing.append("@N honest n=6 stance")
        if not grounded:
            missing.append(">=1 real citation (@X literature / ref=)")
        return {
            "verdict": "FAIL",
            "reason": "governance contract unmet: missing " + ", ".join(missing),
            "deriv_hits": deriv_hits,
            "has_guard": has_guard,
            "has_stance": has_stance,
            "grounded": grounded,
        }

    # Guarded + grounded: derivation-looking lines are tolerated as flagged
    # provenance (e.g. a migrated body under an authoritative §0). Report as
    # WARN, still PASS.
    return {
        "verdict": "PASS",
        "deriv_warnings": deriv_hits,
        "has_guard": has_guard,
        "has_stance": has_stance,
        "grounded": grounded,
    }


def main(argv: list[str]) -> int:
    args = [a for a in argv[1:] if not a.startswith("--")]
    as_json = "--json" in argv
    if not args:
        sys.stderr.write("usage: tape_lattice_honesty_lint.py "
                         "<DOMAIN.tape> [--json]\n")
        return 2

    path = args[0]
    r = lint(path)
    verdict = r["verdict"]
    sentinel = f"__TAPE_LATTICE_HONESTY__ {verdict}"

    if as_json:
        print(json.dumps({"tape": path, **r}, ensure_ascii=False))
    else:
        print(f"tape-lint: {path}")
        print(f"  verdict: {verdict}")
        if "reason" in r:
            print(f"  reason:  {r['reason']}")
        if r.get("deriv_hits"):
            print("  lattice-derivation lines (governance fail):")
            for h in r["deriv_hits"]:
                print(f"    {h}")
        if r.get("deriv_warnings"):
            print("  lattice-coincidence lines (provenance, tolerated):")
            for h in r["deriv_warnings"][:8]:
                print(f"    {h}")
        print(f"  {sentinel}")

    if as_json:
        print(sentinel)

    return 1 if verdict == "FAIL" else 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
