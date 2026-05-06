#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
lean4_proof_witness_emit.py — emit raw_77_lean4_proof_witness_v0 rows.

Reads each axis lean4 file in the canonical n6-architecture stub layer
(`~/core/n6-architecture/formal/lean4/`), counts `sorry` occurrences in
the *theorem body region* (skipping comments where possible — see
`count_sorry()` heuristic), and emits one `raw_77_lean4_proof_witness_v0`
row per axis into `state/discovery_absorption/registry.jsonl`.

Stdlib only. No third-party imports. No network. Read-only on canonical
files; write-only (append) on hexa-bio registry.

Usage:
    python3 lean4_proof_witness_emit.py [--dry-run] [--cycle N]

raw_91 honest C3 disclosure: this script reports the literal `sorry` count
in canonical .lean files. It does NOT verify the lean4 source compiles,
nor does it confirm any proof is correct. PASS (sorry_count == 0) is a
*necessary* but not *sufficient* condition for axis closure; full closure
requires a green `lake build` recorded canonically. As of 2026-05-06,
canonical sorry-count = 4 (one per axis), so all four axes report
pass = false.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
from datetime import datetime, timezone


# Canonical canonical-side path. Hard-coded relative to user home — this
# is the cross-repo SSOT location promised in the scaffold spec.
CANONICAL_ROOT = os.path.expanduser("~/core/n6-architecture/formal/lean4")

# Hexa-bio side registry.
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
REGISTRY_PATH = os.path.join(
    ROOT_DIR, "state", "discovery_absorption", "registry.jsonl"
)


# Axis manifest: matches the consumer scaffold spec
# (lean4_mechanical_layer_v0.scaffold.md) one-to-one.
AXIS_MANIFEST = [
    {
        "axis": "F-CL-FORMAL-1",
        "theorem_name": "sigma_lattice_card",
        "module_path": "N6.InvariantLattice.SigmaLatticeCard",
        "rel_path": "N6/InvariantLattice/SigmaLatticeCard.lean",
    },
    {
        "axis": "F-CL-FORMAL-2",
        "theorem_name": "landauer_monotonic",
        "module_path": "N6.Weave.LandauerMonotonic",
        "rel_path": "N6/Weave/LandauerMonotonic.lean",
    },
    {
        "axis": "F-CL-FORMAL-3",
        "theorem_name": "pi_p2_verifier_terminates",
        "module_path": "N6.Weave.PiP2Termination",
        "rel_path": "N6/Weave/PiP2Termination.lean",
    },
    {
        "axis": "F-CL-FORMAL-4",
        "theorem_name": "closure_cert_idempotent",
        "module_path": "N6.Weave.ClosureCert",
        "rel_path": "N6/Weave/ClosureCert.lean",
    },
]


# Heuristic comment stripper. Lean4 single-line comments are `--` to EOL;
# block comments are `/- ... -/`. We strip both before counting `sorry`
# so that disclosure prose (e.g. README-style explanations of stub status)
# does not inflate the count.
_BLOCK_COMMENT_RE = re.compile(r"/-.*?-/", re.DOTALL)


def strip_lean_comments(text: str) -> str:
    """Remove block + single-line comments (heuristic; no string-literal
    awareness, but adequate for stub-layer files which contain none)."""
    text = _BLOCK_COMMENT_RE.sub("", text)
    out_lines = []
    for line in text.splitlines():
        idx = line.find("--")
        if idx >= 0:
            line = line[:idx]
        out_lines.append(line)
    return "\n".join(out_lines)


# Match `sorry` as a whole token (avoids matching e.g. `sorrying`).
_SORRY_RE = re.compile(r"\bsorry\b")


def count_sorry(file_path: str) -> int:
    """Return the count of `sorry` tokens in the lean4 source body
    (after comment stripping)."""
    with open(file_path, "r", encoding="utf-8") as fh:
        body = fh.read()
    body = strip_lean_comments(body)
    return len(_SORRY_RE.findall(body))


def file_sha256_short(file_path: str) -> str:
    """SHA-256 short hash (first 12 hex chars) for canonical_repo_ref.
    Stdlib only (hashlib)."""
    import hashlib
    h = hashlib.sha256()
    with open(file_path, "rb") as fh:
        for chunk in iter(lambda: fh.read(65536), b""):
            h.update(chunk)
    return h.hexdigest()[:12]


def build_row(axis_entry: dict, cycle: int) -> dict:
    abs_path = os.path.join(CANONICAL_ROOT, axis_entry["rel_path"])
    if not os.path.isfile(abs_path):
        # File missing from canonical tree — emit a row with sorry_count
        # set to a sentinel large value so downstream filters can spot it.
        sorry_count = 10**9
        canonical_ref = (
            f"n6-architecture@MISSING:formal/lean4/{axis_entry['rel_path']}"
        )
        notes = (
            "Canonical file missing — placeholder sorry_count=1e9. "
            "Investigate: stub layer expected at "
            + abs_path
        )
    else:
        sorry_count = count_sorry(abs_path)
        sha_short = file_sha256_short(abs_path)
        canonical_ref = (
            f"n6-architecture@sha256-{sha_short}:"
            f"formal/lean4/{axis_entry['rel_path']}"
        )
        notes = (
            "Stub-layer landed 2026-05-06; raw_91 honest C3: structurally-"
            "correct skeleton, no proof body, sorry-count=4 across all "
            "axes; actual proof bodies cycle 30+."
        )

    ts = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    row = {
        "schema": "raw_77_lean4_proof_witness_v0",
        "axis": axis_entry["axis"],
        "theorem_name": axis_entry["theorem_name"],
        "module_path": axis_entry["module_path"],
        "sorry_count": sorry_count,
        "last_modified_cycle": cycle,
        "canonical_repo_ref": canonical_ref,
        "pass": (sorry_count == 0),
        "recorded_at": ts,
        "notes": notes,
    }
    return row


def append_jsonl(rows, registry_path: str) -> int:
    os.makedirs(os.path.dirname(registry_path), exist_ok=True)
    written = 0
    with open(registry_path, "a", encoding="utf-8") as fh:
        for row in rows:
            fh.write(json.dumps(row, ensure_ascii=False) + "\n")
            written += 1
    return written


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(
        description="Emit raw_77_lean4_proof_witness_v0 rows."
    )
    parser.add_argument(
        "--dry-run", action="store_true",
        help="Print rows to stdout, do not append to registry.",
    )
    parser.add_argument(
        "--cycle", type=int, default=25,
        help="last_modified_cycle index (default 25 = cycle of stub landing).",
    )
    args = parser.parse_args(argv)

    rows = [build_row(entry, cycle=args.cycle) for entry in AXIS_MANIFEST]

    if args.dry_run:
        for row in rows:
            print(json.dumps(row, ensure_ascii=False))
        print(
            f"# DRY-RUN: {len(rows)} rows would be appended to "
            f"{REGISTRY_PATH}",
            file=sys.stderr,
        )
        return 0

    written = append_jsonl(rows, REGISTRY_PATH)
    print(
        f"appended {written} raw_77_lean4_proof_witness_v0 rows to "
        f"{REGISTRY_PATH}"
    )
    total_sorry = sum(r["sorry_count"] for r in rows)
    n_pass = sum(1 for r in rows if r["pass"])
    print(
        f"axis summary: total sorry-count = {total_sorry}; "
        f"axes PASS = {n_pass}/{len(rows)}"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
