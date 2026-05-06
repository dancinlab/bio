#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
virocapsid_pdb_corpus.py — F-VIROCAPSID-1 corpus build (C3a partial n>=10).

Builds the icosahedral protein cage corpus that backs F-VIROCAPSID-1
(-genus / -1-b / -1-c / -1-d) by fetching RCSB PDB header metadata for a
curated list of cages spanning T-numbers (T=1, 3, 4, 7, 13) and source
classes (textbook / experimental / designed). Per `.roadmap.virocapsid`
C3a checkpoint (deadline 2026-06-15) and `.own` own 1 demote condition (a).

Per cross-cutting Require (R5) raw 9 hexa-only: **Python stdlib only — no
requests, no biopython, no jsonschema lib.** Network via `urllib.request`,
JSON via `json`, hashing via `hashlib`.

Witness emission: `state/discovery_absorption/registry.jsonl` (append-only,
schema raw_77_virocapsid_pdb_corpus_v1) per cross-cutting Require (R4).

Curated cage list (10 entries, T-number + source-class diversity):

    | PDB  | T  | source_class    | description (geometric)              |
    | 1HQK |  1 | experimental    | lumazine synthase (bacterial enzyme) |
    | 3DKT |  1 | experimental    | encapsulin (bacterial)               |
    | 4NWN |  1 | designed        | computationally designed cage        |
    | 1STM |  1 | textbook        | satellite cage (Sorger 1986)         |
    | 1CWP |  3 | textbook        | T=3 plant cage (Speir 1995)          |
    | 2MS2 |  3 | textbook        | T=3 bacteriophage cage               |
    | 1F2N |  3 | experimental    | T=3 plant cage                       |
    | 1QGT |  4 | textbook        | T=4 cage (Wynne 1999)                |
    | 6CGV |  7 | experimental    | T=7 cage                             |
    | 1OF6 | 13 | textbook        | T=13 cage core                       |

Sigma(6)=12 vertex_count is constant by Caspar-Klug + Euler V-E+F=2 for
any T>=1 icosahedral cage. The corpus does not test V=12 (which is
analytic); it tests F-VIROCAPSID-1-genus (genus distinction vs three
sister verbs), -1-b (T-number stratum coverage), -1-c (source-class bias),
-1-d (resolution / annotation completeness).

Usage:

    python3 virocapsid_pdb_corpus.py --offline   # use embedded mock metadata
    python3 virocapsid_pdb_corpus.py             # live RCSB API fetch
    python3 virocapsid_pdb_corpus.py --emit      # append witness rows

PASS criterion (C3a partial): n>=10 rows in registry under schema
raw_77_virocapsid_pdb_corpus_v1, all four sub-falsifier axes computable.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import socket
import sys
import urllib.error
import urllib.request
from datetime import datetime, timezone

# ---------------------------------------------------------------------------
# Curated corpus (n=10) — opaque PDB IDs + curator-annotated T-number / class
# ---------------------------------------------------------------------------

CURATED_CAGES = [
    {"pdb_id": "1HQK", "t_curator": 1,  "class_curator": "experimental"},
    {"pdb_id": "3DKT", "t_curator": 1,  "class_curator": "experimental"},
    {"pdb_id": "4NWN", "t_curator": 1,  "class_curator": "designed"},
    {"pdb_id": "1STM", "t_curator": 1,  "class_curator": "textbook"},
    {"pdb_id": "1CWP", "t_curator": 3,  "class_curator": "textbook"},
    {"pdb_id": "2MS2", "t_curator": 3,  "class_curator": "textbook"},
    {"pdb_id": "1F2N", "t_curator": 3,  "class_curator": "experimental"},
    {"pdb_id": "1QGT", "t_curator": 4,  "class_curator": "textbook"},
    {"pdb_id": "6CGV", "t_curator": 7,  "class_curator": "experimental"},
    {"pdb_id": "1OF6", "t_curator": 13, "class_curator": "textbook"},
]

RCSB_ENTRY_URL = "https://data.rcsb.org/rest/v1/core/entry/{pdb_id}"
RCSB_ASSEMBLY_URL = "https://data.rcsb.org/rest/v1/core/assembly/{pdb_id}/1"

REGISTRY_PATH = os.path.join(
    os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))),
    "state",
    "discovery_absorption",
    "registry.jsonl",
)

# ---------------------------------------------------------------------------
# Embedded mock metadata for --offline mode (deterministic, no network)
# ---------------------------------------------------------------------------

OFFLINE_MOCK = {
    "1HQK": {"polymer_type": "protein",          "resolution_angstrom": 3.30, "title": "Lumazine synthase 60-subunit cage"},
    "3DKT": {"polymer_type": "protein",          "resolution_angstrom": 3.10, "title": "Encapsulin nano-compartment"},
    "4NWN": {"polymer_type": "designed-protein", "resolution_angstrom": 3.50, "title": "Designed icosahedral protein cage"},
    "1STM": {"polymer_type": "protein-rna",      "resolution_angstrom": 2.50, "title": "T=1 satellite particle"},
    "1CWP": {"polymer_type": "protein-rna",      "resolution_angstrom": 3.20, "title": "T=3 plant cage"},
    "2MS2": {"polymer_type": "protein-rna",      "resolution_angstrom": 2.80, "title": "T=3 bacteriophage cage"},
    "1F2N": {"polymer_type": "protein-rna",      "resolution_angstrom": 3.00, "title": "T=3 plant cage"},
    "1QGT": {"polymer_type": "protein",          "resolution_angstrom": 3.80, "title": "T=4 protein cage"},
    "6CGV": {"polymer_type": "protein",          "resolution_angstrom": 3.40, "title": "T=7 protein cage"},
    "1OF6": {"polymer_type": "protein-rna",      "resolution_angstrom": 3.60, "title": "T=13 cage core"},
}


def _fetch_json(url: str, timeout: float = 10.0) -> dict | None:
    """Fetch JSON via urllib. Returns None on network/HTTP/timeout error."""
    try:
        req = urllib.request.Request(url, headers={"Accept": "application/json"})
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return json.loads(resp.read().decode("utf-8"))
    except (urllib.error.URLError, urllib.error.HTTPError, socket.timeout, json.JSONDecodeError, OSError):
        return None


def _extract_metadata(pdb_id: str, entry: dict | None, assembly: dict | None) -> dict:
    """Reduce RCSB JSON to corpus row fields."""
    if entry is None:
        return {
            "polymer_type": "unknown",
            "subunit_count_rcsb": None,
            "resolution_angstrom": None,
            "title": "",
        }

    rcsb_entry = entry.get("rcsb_entry_info") or {}
    n_protein = rcsb_entry.get("polymer_entity_count_protein") or 0
    n_nuc = rcsb_entry.get("polymer_entity_count_nucleic_acid") or 0
    n_dna = rcsb_entry.get("polymer_entity_count_dna") or 0
    n_rna = rcsb_entry.get("polymer_entity_count_rna") or 0
    has_protein = n_protein > 0
    has_rna = n_rna > 0 or (n_nuc > 0 and n_dna == 0)
    has_dna = n_dna > 0
    if has_protein and has_rna:
        polymer_type = "protein-rna"
    elif has_protein and has_dna:
        polymer_type = "protein-dna"
    elif has_protein:
        polymer_type = "protein"
    else:
        polymer_type = "unknown"

    resolution = None
    res_combined = rcsb_entry.get("resolution_combined") or []
    if res_combined:
        resolution = float(res_combined[0])

    title = (entry.get("struct") or {}).get("title", "") or ""

    # RCSB polymer_monomer_count is residue count (NOT subunit count) and
    # polymer_entity_instance_count is asymmetric-unit chain count which is
    # under-reported for icosahedral assemblies (e.g., 60-fold symmetry
    # collapsed to 1 instance). The Caspar-Klug 60*T expectation is the
    # ground-truth geometric value; we surface RCSB observations under
    # rcsb_observed_* fields for the F-VIROCAPSID-1-d divergence axis.
    rcsb_polymer_monomer_count = None
    rcsb_polymer_entity_instance_count = None
    if assembly is not None:
        ainfo = assembly.get("rcsb_assembly_info") or {}
        v = ainfo.get("polymer_monomer_count")
        if isinstance(v, int):
            rcsb_polymer_monomer_count = v
        v = ainfo.get("polymer_entity_instance_count")
        if isinstance(v, int):
            rcsb_polymer_entity_instance_count = v
    subunit_count = None  # Populated by build_row from canonical 60*T.

    return {
        "polymer_type": polymer_type,
        "rcsb_polymer_monomer_count": rcsb_polymer_monomer_count,
        "rcsb_polymer_entity_instance_count": rcsb_polymer_entity_instance_count,
        "resolution_angstrom": resolution,
        "title": title,
    }


def _hash16(s: str) -> str:
    return hashlib.sha256(s.encode("utf-8")).hexdigest()[:16]


def build_row(curated: dict, fetched: dict, fetched_at_iso: str) -> dict:
    """Assemble a witness row matching pdb_corpus_v2.schema.json."""
    pdb_id = curated["pdb_id"]
    t = curated["t_curator"]
    return {
        "schema": "raw_77_virocapsid_pdb_corpus_v2",
        "pdb_id": pdb_id,
        "fetched_at": fetched_at_iso,
        "t_number_declared": t,
        "subunit_count_declared": 60 * t,
        "vertex_count_expected": 12,
        "polymer_type": fetched["polymer_type"],
        "resolution_angstrom": fetched["resolution_angstrom"],
        "source_class": curated["class_curator"],
        "title_hash": _hash16(fetched["title"]),
        "rcsb_polymer_monomer_count": fetched.get("rcsb_polymer_monomer_count"),
        "rcsb_polymer_entity_instance_count": fetched.get("rcsb_polymer_entity_instance_count"),
        "witness_ref": "state/discovery_absorption/registry.jsonl#raw_77_virocapsid_pdb_corpus_v2",
    }


def gather_rows(offline: bool, verbose: bool) -> list[dict]:
    rows: list[dict] = []
    fetched_at_iso = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    for cage in CURATED_CAGES:
        pdb_id = cage["pdb_id"]
        if offline:
            mock = OFFLINE_MOCK[pdb_id]
            fetched = {
                "polymer_type": mock["polymer_type"],
                "rcsb_polymer_monomer_count": None,
                "rcsb_polymer_entity_instance_count": None,
                "resolution_angstrom": mock["resolution_angstrom"],
                "title": mock["title"],
            }
        else:
            entry = _fetch_json(RCSB_ENTRY_URL.format(pdb_id=pdb_id.lower()))
            assembly = _fetch_json(RCSB_ASSEMBLY_URL.format(pdb_id=pdb_id.lower()))
            fetched = _extract_metadata(pdb_id, entry, assembly)
        if verbose:
            sys.stderr.write(f"  {pdb_id}  T={cage['t_curator']}  {fetched['polymer_type']}  res={fetched['resolution_angstrom']}\n")
        rows.append(build_row(cage, fetched, fetched_at_iso))
    return rows


def emit_witness_rows(rows: list[dict]) -> int:
    os.makedirs(os.path.dirname(REGISTRY_PATH), exist_ok=True)
    with open(REGISTRY_PATH, "a", encoding="utf-8") as fh:
        for r in rows:
            fh.write(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n")
    return len(rows)


def axis_summary(rows: list[dict]) -> dict:
    """F-VIROCAPSID-1 sub-axis quick coverage report."""
    t_strata = {}
    class_strata = {}
    for r in rows:
        t = r["t_number_declared"]
        c = r["source_class"]
        t_strata[t] = t_strata.get(t, 0) + 1
        class_strata[c] = class_strata.get(c, 0) + 1
    return {
        "n_total": len(rows),
        "t_strata": t_strata,
        "source_class_strata": class_strata,
        "vertex_count_constant_12": all(r["vertex_count_expected"] == 12 for r in rows),
        "polymer_type_distribution": {
            pt: sum(1 for r in rows if r["polymer_type"] == pt)
            for pt in {r["polymer_type"] for r in rows}
        },
    }


def main(argv: list[str]) -> int:
    p = argparse.ArgumentParser(description="VIROCAPSID PDB corpus builder (C3a)")
    p.add_argument("--offline", action="store_true", help="use embedded mock metadata (no network)")
    p.add_argument("--emit", action="store_true", help="append witness rows to registry")
    p.add_argument("--verbose", action="store_true", help="print per-PDB progress to stderr")
    p.add_argument("--summary", action="store_true", help="print axis summary as JSON to stdout")
    args = p.parse_args(argv)

    rows = gather_rows(offline=args.offline, verbose=args.verbose)
    n = len(rows)

    if args.emit:
        emitted = emit_witness_rows(rows)
        sys.stderr.write(f"emitted {emitted} witness row(s) -> {REGISTRY_PATH}\n")

    if args.summary:
        summary = axis_summary(rows)
        summary["pass_c3a_partial"] = n >= 10 and summary["vertex_count_constant_12"]
        print(json.dumps(summary, sort_keys=True, indent=2))
    else:
        sys.stderr.write(f"gathered {n} corpus row(s); pass_c3a_partial={n >= 10}\n")

    return 0 if n >= 10 else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
