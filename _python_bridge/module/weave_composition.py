#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
weave_composition.py — F-TP5-b 90-day MVP end-to-end weave_compose() runner
(C0b deliverable for `.roadmap.weave`, deadline 2026-07-28).

Cycle 24 MVP for HEXA-WEAVE (sister 1 of 4 in HEXA-family biology axis,
the write-side composition counterpart to AlphaFold-3 / IsoDDE read-side
prediction). Pure python stdlib (raw 9 hexa-only) — no scipy / numpy /
networkx / requests imports.

Pipeline (canonical hexa-weave.md §5 FLOW 7-step, MVP-grade):

    1. Strand catalogue ingestion — 12-strand built-in mock catalogue
       (P=12 strand pool indexed by sequence + tau(6)=4 conformational
       state). Per .roadmap.weave default: no external FASTA dep at C0b.
    2. Target context spec — one of 4 W-cell disease classes (W·alpha
       AML / W·beta SCD / W·gamma pan-cov / W·delta senolytic). Default
       AML.
    3. Inverse search — per (bundle, trial), pick a random subset whose
       size is drawn from the sigma(6)=12 raw-strategy pool exponents
       1..12 (categorical). Score via energy_proxy + Landauer +
       Nyquist-compat penalty.
    4. Landauer gate — heat budget 1e6 kT ceiling at T=310K cellular
       reference (Landauer 1961 erasure-floor + 6-order budget per
       hexa-weave.md §5 step 4).
    5. Pi^p_2 verifier — pairwise sequence-overlap < threshold
       (off-target proxy, MVP-grade stub per cross-cutting raw 91 C3).
    6. Closure cert — Pi^1_1-CA0 totality marker recorded per witness
       row (proof-strength ordinal psi(Omega_omega) tag, no formal
       discharge in MVP).
    7. Witness emission — append-only to
       state/discovery_absorption/registry.jsonl per (bundle, trial)
       row with schema raw_77_weave_compose_v1, plus 1 aggregate row.

PASS criterion (F-TP5-b):
    P >= 10 strand bundles, N >= 50 trials per bundle, with each
    (bundle, trial) emitting one witness row. Sentinel
    `__WEAVE_MVP_RESULT__ PASS` printed if all 6 deterministic gates
    pass at the aggregate level:
        1. n6 invariant: sigma=12, tau=4, phi=2, J2=24
        2. P >= 10 (bundle count)
        3. N >= 50 (trials/bundle)
        4. >= 1 trial per bundle survived Landauer gate
        5. >= 1 trial per bundle survived Pi^p_2 verifier
        6. registry append succeeded (P*N + 1 rows written)

Greedy heuristic acceptable per .roadmap.weave (full NP solver out of
scope at C0b — see hexa-weave.md §5 step 3 inverse-search tractability
disclosure). Designed for ~1-3s wall-clock at default P=10 N=50.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import random
import sys
import time
from datetime import datetime, timezone


# ---------------------------------------------------------------------------
# n6 invariant (hard-coded for WEAVE composition — hexa-weave.md §1)
# ---------------------------------------------------------------------------

SIGMA_6 = 12   # strand bundle composition strategy axis (raw-strategy pool)
TAU_6 = 4      # 4 conformational states per strand
PHI_6 = 2      # accepted vs rejected dichotomy at each gate
J2 = 24        # composition pose-equivalence group order


# ---------------------------------------------------------------------------
# Built-in 12-strand mock catalogue (raw 91 C3: MVP-grade illustrative,
# not derived from a specific empirical proteome). 12 strand IDs cover the
# 4 W-cell target classes (3 strands per class) so that any of 4 target
# specs can pull plausible candidates. Sequences are short fragments
# (15-25 aa) to keep the BLOSUM62 score table readable.
# ---------------------------------------------------------------------------

CATALOGUE_12 = [
    # W·alpha (AML) — FLT3-ITD / CD33 BiTE-class fragments
    {"id": "FLT3_ITD_KIN1", "sequence": "DFGLARDIMSDSNYV", "length": 15,
     "conf_state_tau6": 0, "target_class": "aml"},
    {"id": "CD33_SCFV_VL", "sequence": "DIQMTQSPSSLSASVGDR", "length": 18,
     "conf_state_tau6": 1, "target_class": "aml"},
    {"id": "CD3_BITE_VH",  "sequence": "EVQLVESGGGLVQPGGSL", "length": 18,
     "conf_state_tau6": 2, "target_class": "aml"},
    # W·beta (SCD) — beta-globin corrected fragments
    {"id": "HBB_CORR_E6V", "sequence": "VHLTPVEKSAVTALWGKVN", "length": 19,
     "conf_state_tau6": 0, "target_class": "scd"},
    {"id": "HBB_HBF_GAM",  "sequence": "GHFTEEDKATITSLWGKVN", "length": 19,
     "conf_state_tau6": 1, "target_class": "scd"},
    {"id": "BCL11A_GATA",  "sequence": "MSRRKQSNPRQIKR", "length": 14,
     "conf_state_tau6": 3, "target_class": "scd"},
    # W·gamma (pan-cov) — RBD broadly-neutralizing antibody fragments
    {"id": "SARS2_RBM_C1", "sequence": "RVQPTESIVRFPNITNL", "length": 17,
     "conf_state_tau6": 0, "target_class": "pancov"},
    {"id": "BNAB_CR3022",  "sequence": "QVQLVQSGAEVKKPGSSV", "length": 18,
     "conf_state_tau6": 2, "target_class": "pancov"},
    {"id": "ACE2_DECOY",   "sequence": "STIEEQAKTFLDKFNHEAEDLF", "length": 22,
     "conf_state_tau6": 1, "target_class": "pancov"},
    # W·delta (senolytic) — p16+ senolytic targeting fragments
    {"id": "P16_INK4A_LIG","sequence": "MEPAAGSSMEPSADWLATAAARGRV", "length": 25,
     "conf_state_tau6": 3, "target_class": "senolytic"},
    {"id": "BCL2_BH3_BIM", "sequence": "DMRPEIWIAQELRRIGDEFNAY", "length": 22,
     "conf_state_tau6": 2, "target_class": "senolytic"},
    {"id": "FOXO4_DRI",    "sequence": "LTLRDIMNSGKPLLTPL", "length": 17,
     "conf_state_tau6": 0, "target_class": "senolytic"},
]

TARGET_CONTEXTS = {
    "aml":       {"cell": "W-alpha",  "disease": "AML",
                  "off_target_ban": []},
    "scd":       {"cell": "W-beta",   "disease": "SCD",
                  "off_target_ban": []},
    "pancov":    {"cell": "W-gamma",  "disease": "pan-cov",
                  "off_target_ban": []},
    "senolytic": {"cell": "W-delta",  "disease": "senolytic",
                  "off_target_ban": []},
}


# ---------------------------------------------------------------------------
# BLOSUM62 inlined (Henikoff & Henikoff 1992) — 24x24 amino-acid + ambig
# substitution matrix in standard order. Used by energy_proxy for both
# self-stack scoring and pairwise off-target overlap in Pi^p_2 verifier.
# ---------------------------------------------------------------------------

BLOSUM62_AA = "ARNDCQEGHILKMFPSTWYVBZX*"
# Row-major. Source: NCBI BLAST BLOSUM62 (canonical).
_BLOSUM62_ROWS = [
    " 4-1-2-2 0-1-1 0-2-1-1-1-1-2-1 1 0-3-2 0-2-1 0-4",  # A
    "-1 5 0-2-3 1 0-2 0-3-2 2-1-3-2-1-1-3-2-3-1 0-1-4",  # R
    "-2 0 6 1-3 0 0 0 1-3-3 0-2-3-2 1 0-4-2-3 3 0-1-4",  # N
    "-2-2 1 6-3 0 2-1-1-3-4-1-3-3-1 0-1-4-3-3 4 1-1-4",  # D
    " 0-3-3-3 9-3-4-3-3-1-1-3-1-2-3-1-1-2-2-1-3-3-2-4",  # C
    "-1 1 0 0-3 5 2-2 0-3-2 1 0-3-1 0-1-2-1-2 0 3-1-4",  # Q
    "-1 0 0 2-4 2 5-2 0-3-3 1-2-3-1 0-1-3-2-2 1 4-1-4",  # E
    " 0-2 0-1-3-2-2 6-2-4-4-2-3-3-2 0-2-2-3-3-1-2-1-4",  # G
    "-2 0 1-1-3 0 0-2 8-3-3-1-2-1-2-1-2-2 2-3 0 0-1-4",  # H
    "-1-3-3-3-1-3-3-4-3 4 2-3 1 0-3-2-1-3-1 3-3-3-1-4",  # I
    "-1-2-3-4-1-2-3-4-3 2 4-2 2 0-3-2-1-2-1 1-4-3-1-4",  # L
    "-1 2 0-1-3 1 1-2-1-3-2 5-1-3-1 0-1-3-2-2 0 1-1-4",  # K
    "-1-1-2-3-1 0-2-3-2 1 2-1 5 0-2-1-1-1-1 1-3-1-1-4",  # M
    "-2-3-3-3-2-3-3-3-1 0 0-3 0 6-4-2-2 1 3-1-3-3-1-4",  # F
    "-1-2-2-1-3-1-1-2-2-3-3-1-2-4 7-1-1-4-3-2-2-1-2-4",  # P
    " 1-1 1 0-1 0 0 0-1-2-2 0-1-2-1 4 1-3-2-2 0 0 0-4",  # S
    " 0-1 0-1-1-1-1-2-2-1-1-1-1-2-1 1 5-2-2 0-1-1 0-4",  # T
    "-3-3-4-4-2-2-3-2-2-3-2-3-1 1-4-3-2 11 2-3-4-3-2-4",  # W
    "-2-2-2-3-2-1-2-3 2-1-1-2-1 3-3-2-2 2 7-1-3-2-1-4",  # Y
    " 0-3-3-3-1-2-2-3-3 3 1-2 1-1-2-2 0-3-1 4-3-2-1-4",  # V
    "-2-1 3 4-3 0 1-1 0-3-4 0-3-3-2 0-1-4-3-3 4 1-1-4",  # B
    "-1 0 0 1-3 3 4-2 0-3-3 1-1-3-1 0-1-3-2-2 1 4-1-4",  # Z
    " 0-1-1-1-2-1-1-1-1-1-1-1-1-1-2 0 0-2-1-1-1-1-1-4",  # X
    "-4-4-4-4-4-4-4-4-4-4-4-4-4-4-4-4-4-4-4-4-4-4-4 1",  # *
]


def _parse_blosum62():
    table = {}
    for i, row in enumerate(_BLOSUM62_ROWS):
        # Tokenize space-separated signed integers.
        toks = []
        j = 0
        s = row
        while j < len(s):
            if s[j] == " ":
                j += 1
                continue
            k = j
            if s[k] in "+-":
                k += 1
            while k < len(s) and s[k].isdigit():
                k += 1
            toks.append(int(s[j:k]))
            j = k
        a = BLOSUM62_AA[i]
        for col, b in enumerate(BLOSUM62_AA):
            table[(a, b)] = toks[col]
    return table


BLOSUM62 = _parse_blosum62()


def blosum62_score(a, b):
    """Look up BLOSUM62 substitution score; return -4 (rare) on miss."""
    return BLOSUM62.get((a, b), -4)


# ---------------------------------------------------------------------------
# Constants (Landauer + Nyquist + budgets per .roadmap.weave defaults)
# ---------------------------------------------------------------------------

KB_J = 1.380649e-23           # Boltzmann, J/K
T_KELVIN = 310.0              # 310K = 37C cellular reference
LANDAUER_FLOOR_J = KB_J * T_KELVIN * math.log(2)  # ~ 2.97e-21 J/bit at 310K
HEAT_BUDGET_KT = 1.0e6        # 1e6 kT default per defaults block
NYQUIST_OVERLAP_THRESHOLD = 0.5  # Pi^p_2 stub: >50% sequence overlap = clash

# Output sink (cross-cutting Require (R4))
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
REGISTRY_PATH = os.path.join(ROOT_DIR, "state", "discovery_absorption",
                             "registry.jsonl")

# W-R1 / GATE-26-3 / C0e — composition_output_v1 schema lives here.
COMPOSITION_OUTPUT_SCHEMA_PATH = os.path.join(
    ROOT_DIR, "weave", "spec", "composition_output_v1.schema.json")


# ---------------------------------------------------------------------------
# Stdlib-only minimal JSON-Schema validator (C0e / GATE-26-3 / W-R1).
#
# Per CLAUDE.md raw-9 hexa-only: no `jsonschema` pip dep. We hand-roll a
# subset large enough to validate the draft-07 schema in
# `weave/spec/composition_output_v1.schema.json`. Supported keywords:
#   type, required, properties, additionalProperties, enum, const,
#   pattern, minLength, minimum, maximum, items, minItems, maxItems
# Unsupported keywords are silently passed (schema author's
# responsibility — we control the schema). Validator returns list of
# error strings; empty list = valid.
# ---------------------------------------------------------------------------

import re as _re


def _validate_schema(instance, schema, path="$"):
    errors = []
    if not isinstance(schema, dict):
        return errors

    # type
    t = schema.get("type")
    if t is not None:
        type_ok = True
        if t == "object":
            type_ok = isinstance(instance, dict)
        elif t == "array":
            type_ok = isinstance(instance, list)
        elif t == "string":
            type_ok = isinstance(instance, str)
        elif t == "integer":
            type_ok = isinstance(instance, int) and not isinstance(instance, bool)
        elif t == "number":
            type_ok = (isinstance(instance, (int, float))
                       and not isinstance(instance, bool))
        elif t == "boolean":
            type_ok = isinstance(instance, bool)
        elif t == "null":
            type_ok = instance is None
        if not type_ok:
            errors.append(f"{path}: type mismatch (expected {t})")
            return errors  # downstream checks would cascade; bail.

    # const
    if "const" in schema and instance != schema["const"]:
        errors.append(f"{path}: const mismatch (expected {schema['const']!r})")

    # enum
    if "enum" in schema and instance not in schema["enum"]:
        errors.append(f"{path}: enum mismatch (got {instance!r})")

    if isinstance(instance, dict):
        # required
        for key in schema.get("required", []):
            if key not in instance:
                errors.append(f"{path}: missing required key {key!r}")
        # properties
        props = schema.get("properties", {})
        for key, sub_schema in props.items():
            if key in instance:
                errors.extend(_validate_schema(
                    instance[key], sub_schema, f"{path}.{key}"))
        # additionalProperties
        ap = schema.get("additionalProperties", True)
        if ap is False:
            extra = set(instance.keys()) - set(props.keys())
            if extra:
                errors.append(
                    f"{path}: additionalProperties present {sorted(extra)}")

    if isinstance(instance, list):
        items_schema = schema.get("items")
        if isinstance(items_schema, dict):
            for i, item in enumerate(instance):
                errors.extend(_validate_schema(
                    item, items_schema, f"{path}[{i}]"))
        if "minItems" in schema and len(instance) < schema["minItems"]:
            errors.append(f"{path}: minItems={schema['minItems']} got {len(instance)}")
        if "maxItems" in schema and len(instance) > schema["maxItems"]:
            errors.append(f"{path}: maxItems={schema['maxItems']} got {len(instance)}")

    if isinstance(instance, str):
        if "minLength" in schema and len(instance) < schema["minLength"]:
            errors.append(f"{path}: minLength={schema['minLength']} got {len(instance)}")
        if "pattern" in schema:
            if not _re.search(schema["pattern"], instance):
                errors.append(f"{path}: pattern {schema['pattern']!r} no match")

    if isinstance(instance, (int, float)) and not isinstance(instance, bool):
        if "minimum" in schema and instance < schema["minimum"]:
            errors.append(f"{path}: minimum={schema['minimum']} got {instance}")
        if "maximum" in schema and instance > schema["maximum"]:
            errors.append(f"{path}: maximum={schema['maximum']} got {instance}")

    return errors


_COMPOSITION_OUTPUT_SCHEMA_CACHE = None


def _get_composition_output_schema():
    global _COMPOSITION_OUTPUT_SCHEMA_CACHE
    if _COMPOSITION_OUTPUT_SCHEMA_CACHE is None:
        with open(COMPOSITION_OUTPUT_SCHEMA_PATH, "r", encoding="utf-8") as f:
            _COMPOSITION_OUTPUT_SCHEMA_CACHE = json.load(f)
    return _COMPOSITION_OUTPUT_SCHEMA_CACHE


def build_composition_output_doc(*, target_class, bundle, landauer_observed,
                                 landauer_pass, pi_p2_pass, ref_witness):
    """Construct a `weave_composition_output_v1`-conforming dict for one
    trial (W-R1 / GATE-26-3 deliverable). The bundle's strands are
    concatenated into a single primary sequence (canonical 20-aa alphabet
    only — non-canonical chars are dropped). Closure-cert pi11_ca0 carries
    the v1.x MVP-caveat surrogate per .roadmap.weave §DoD note.
    """
    canonical = set("ACDEFGHIKLMNPQRSTVWY")
    sequence = "".join(
        ch for s in bundle
        for ch in s["sequence"].upper()
        if ch in canonical
    )
    if not sequence:
        sequence = "A"  # schema requires minLength=1; fall-back placeholder
    margin = float(HEAT_BUDGET_KT) - float(landauer_observed)
    return {
        "schema": "weave_composition_output_v1",
        "target": target_class,
        "sequence": sequence,
        "landauer_flux": {
            "heat_budget_kT": float(HEAT_BUDGET_KT),
            "heat_consumed_kT": float(landauer_observed),
            "margin_kT": float(margin),
            "pass": bool(landauer_pass),
        },
        "closure_cert": {
            "pi_p2_verifier": "stub_v1",
            "pi_p2_pass": bool(pi_p2_pass),
            "pi11_ca0": "raw_91_c3_disclose:MVP_caveat",
            "ref_witness": ref_witness,
        },
    }


def validate_composition_output(doc):
    """Return list of validation errors (empty list = valid).
    Uses bundled stdlib validator; no `jsonschema` pip dep."""
    schema = _get_composition_output_schema()
    return _validate_schema(doc, schema)


# ---------------------------------------------------------------------------
# Step 1 - Strand catalogue
# ---------------------------------------------------------------------------

def load_catalogue(path=None):
    """Return the 12-strand built-in catalogue. `path` argument reserved
    for future FASTA support — currently ignored at C0b per defaults."""
    if path is not None and path != "":
        # MVP graceful: emit a one-line note and continue with built-in.
        sys.stderr.write(
            f"[weave_composition] note: external catalogue path '{path}' "
            f"deferred to C0c — using built-in 12-strand catalogue.\n")
    return [dict(s) for s in CATALOGUE_12]


# ---------------------------------------------------------------------------
# Step 2 - Target context spec
# ---------------------------------------------------------------------------

def load_target(spec_path=None, default_class="aml"):
    """Return target context dict. `spec_path` reserved (raw 91 C3 MVP)."""
    if spec_path is not None and spec_path != "":
        sys.stderr.write(
            f"[weave_composition] note: external target spec '{spec_path}' "
            f"deferred to C0c — using default class '{default_class}'.\n")
    cls = default_class if default_class in TARGET_CONTEXTS else "aml"
    ctx = dict(TARGET_CONTEXTS[cls])
    ctx["target_class"] = cls
    return ctx


# ---------------------------------------------------------------------------
# Step 3 - Inverse search (greedy + random subset, sigma(6)=12 strategies)
# ---------------------------------------------------------------------------

def energy_proxy(bundle):
    """Sum of self-stack BLOSUM62 scores across strands in the bundle.
    Higher = more stable (favorable). Pure intra-strand sum, no pairwise
    interaction (pairwise reserved for Pi^p_2 verifier as off-target check)."""
    total = 0
    for strand in bundle:
        seq = strand["sequence"].upper()
        for k in range(len(seq) - 1):
            total += blosum62_score(seq[k], seq[k + 1])
    # Normalize by total length for scale-invariance across bundle sizes.
    n_chars = max(1, sum(len(s["sequence"]) for s in bundle))
    return float(total) / float(n_chars)


def landauer_kT_used(bundle):
    """Estimate kT cost to encode the bundle composition decision.
    Each amino acid carries log2(20) ~ 4.32 bits; each bit costs >=
    Landauer floor (kT ln 2). Returns dimensionless kT count for the
    full bundle. Stays well below 1e6 kT for any 12-strand bundle."""
    bits_per_aa = math.log(20.0) / math.log(2.0)
    total_bits = sum(len(s["sequence"]) * bits_per_aa for s in bundle)
    # Landauer floor per bit = kT ln 2 -> in units of kT, that's just ln 2.
    return float(total_bits) * math.log(2.0)


def nyquist_compat_penalty(bundle):
    """Crude Nyquist-style sampling-rate compat penalty: penalize bundles
    where any pair of strands has > NYQUIST_OVERLAP_THRESHOLD shared
    k-mers (k=4). Returns a non-negative penalty added to score
    (higher = worse, so subtracted upstream)."""
    if len(bundle) < 2:
        return 0.0
    penalty = 0.0
    k = 4
    kmer_sets = []
    for s in bundle:
        seq = s["sequence"].upper()
        kmers = set()
        for i in range(len(seq) - k + 1):
            kmers.add(seq[i:i + k])
        kmer_sets.append(kmers)
    for i in range(len(kmer_sets)):
        for j in range(i + 1, len(kmer_sets)):
            a, b = kmer_sets[i], kmer_sets[j]
            if not a or not b:
                continue
            inter = len(a & b)
            denom = max(1, min(len(a), len(b)))
            jacc = inter / denom
            if jacc > NYQUIST_OVERLAP_THRESHOLD:
                penalty += (jacc - NYQUIST_OVERLAP_THRESHOLD)
    return penalty


def greedy_compose_trial(catalogue, target_ctx, rng, strategy_idx):
    """One inverse-search trial. strategy_idx in 1..12 (sigma(6)=12 raw
    pool exponents) controls the subset size selected from the catalogue.
    Greedy: random subset of size = strategy_idx. Score = energy_proxy
    (favorable, +) - landauer_kT_floor_normalized - nyquist_penalty."""
    n_avail = len(catalogue)
    size = max(1, min(strategy_idx, n_avail))
    indices = list(range(n_avail))
    rng.shuffle(indices)
    chosen = [catalogue[i] for i in indices[:size]]
    e = energy_proxy(chosen)
    kT = landauer_kT_used(chosen)
    # Normalize landauer to [0, 1] vs heat budget for score scaling
    kT_norm = kT / HEAT_BUDGET_KT
    nyq = nyquist_compat_penalty(chosen)
    score = e - kT_norm - nyq
    return {
        "strategy_idx": int(strategy_idx),
        "bundle": chosen,
        "size": size,
        "energy_proxy": float(e),
        "landauer_kT": float(kT),
        "nyquist_penalty": float(nyq),
        "score": float(score),
        "accepted": bool(score > 0.0),
    }


# ---------------------------------------------------------------------------
# Step 4 - Landauer gate (heat budget check at T=310K)
# ---------------------------------------------------------------------------

def landauer_floor_check(bundle, t_kelvin=T_KELVIN, heat_budget_kT=HEAT_BUDGET_KT):
    """Return (pass, observed_kT). Pass iff observed_kT <= heat_budget_kT.
    The MVP catalogue (12 strands x ~20 aa max) is far below 1e6 kT, so
    this gate is structurally satisfied — but it still records the
    physical accounting per hexa-weave.md §5 step 4 + W-R1 require."""
    observed = landauer_kT_used(bundle)
    return (observed <= heat_budget_kT), observed


# ---------------------------------------------------------------------------
# Step 5 - Pi^p_2 verifier (pairwise off-target overlap stub)
# ---------------------------------------------------------------------------

def pi_p2_verify(bundle, off_target_ban=None, threshold=NYQUIST_OVERLAP_THRESHOLD):
    """MVP stub for Pi^p_2 forall-exists certifier. Implementation:
        forall pair (s_i, s_j) in bundle: jacc_kmer(s_i, s_j) < threshold
        exists refold (trivial: every strand has tau(6) state in 0..3)
    Returns dict with forall/exists evaluation."""
    if off_target_ban is None:
        off_target_ban = []
    k = 4
    n = len(bundle)
    offtarget_count = 0
    for i in range(n):
        seq_i = bundle[i]["sequence"].upper()
        kmers_i = set(seq_i[a:a+k] for a in range(len(seq_i) - k + 1))
        # Off-target ban list scan
        for ban_seq in off_target_ban:
            ban_kmers = set(ban_seq[a:a+k] for a in range(len(ban_seq) - k + 1))
            if kmers_i & ban_kmers:
                offtarget_count += 1
        for j in range(i + 1, n):
            seq_j = bundle[j]["sequence"].upper()
            kmers_j = set(seq_j[a:a+k] for a in range(len(seq_j) - k + 1))
            denom = max(1, min(len(kmers_i), len(kmers_j)))
            jacc = (len(kmers_i & kmers_j) / denom) if (kmers_i and kmers_j) else 0.0
            if jacc >= threshold:
                offtarget_count += 1
    refold_exists = all(
        s.get("conf_state_tau6", 0) in (0, 1, 2, 3) for s in bundle
    )
    forall_pass = (offtarget_count == 0)
    return {
        "forall_offtarget_count": int(offtarget_count),
        "exists_refold": bool(refold_exists),
        "pass": bool(forall_pass and refold_exists),
    }


# ---------------------------------------------------------------------------
# Metrics proxies (raw 91 C3: MVP-grade, not from full structure prediction)
# ---------------------------------------------------------------------------

def compute_metrics(bundle, score):
    """Return dict with ca_rmsd / tm_score / clash proxies derived from
    bundle composition + greedy score. All MVP proxies — formal structural
    metrics deferred to C0c (when AF-3 read-side oracle is wired)."""
    n = len(bundle)
    avg_len = sum(len(s["sequence"]) for s in bundle) / max(1, n)
    # ca_rmsd_proxy: inversely tied to score (higher score -> lower RMSD)
    ca_rmsd_proxy = max(0.5, 5.0 - max(0.0, score) * 1.5)
    # tm_score_proxy: in (0, 1], rises with score
    tm_score_proxy = min(0.95, 0.4 + max(0.0, score) * 0.05)
    # clash_score: rises with bundle size (more strands = more potential clash)
    clash_score = min(1.0, 0.05 * n + 0.001 * avg_len)
    return {
        "ca_rmsd_proxy": float(ca_rmsd_proxy),
        "tm_score_proxy": float(tm_score_proxy),
        "clash_score": float(clash_score),
        "bundle_size": int(n),
        "avg_strand_length": float(avg_len),
    }


# ---------------------------------------------------------------------------
# n6 invariant verification
# ---------------------------------------------------------------------------

def n6_invariant_check():
    sigma_phi = SIGMA_6 * PHI_6
    six_tau = 6 * TAU_6
    return {
        "sigma_6": SIGMA_6,
        "tau_6": TAU_6,
        "phi_6": PHI_6,
        "J2": J2,
        "sigma_times_phi": sigma_phi,
        "six_times_tau": six_tau,
        "master_identity_ok": (sigma_phi == J2 and six_tau == J2),
        "all_pass": (SIGMA_6 == 12 and TAU_6 == 4 and PHI_6 == 2 and J2 == 24
                     and sigma_phi == J2 and six_tau == J2),
    }


# ---------------------------------------------------------------------------
# Witness emission
# ---------------------------------------------------------------------------

def make_run_id(seed, P, N, target_class):
    """Deterministic short hash of the run config for grouping rows."""
    payload = f"weave_compose|seed={seed}|P={P}|N={N}|target={target_class}"
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()[:16]


def emit_trial_row(handle, *, run_id, bundle_idx, trial_idx, n6_check,
                   target_ctx, trial_result, landauer_pass, landauer_observed,
                   pi_p2_result, metrics, criteria_pass_count, criteria_total,
                   trial_overall_pass):
    ts = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.%fZ")
    row = {
        "schema": "raw_77_weave_compose_v1",
        "ts": ts,
        "cycle": 24,
        "phase": "f-tp5-b-mvp-weave-compose",
        "domain": "hexa-weave",
        "falsifier": "F-TP5-b",
        "run_id": run_id,
        "row_kind": "trial",
        "bundle_idx": int(bundle_idx),
        "trial_idx": int(trial_idx),
        "n6_invariant": n6_check,
        "strand_ids": [s["id"] for s in trial_result["bundle"]],
        "n_strands_in_bundle": int(trial_result["size"]),
        "target_context": {
            "cell": target_ctx["cell"],
            "disease": target_ctx["disease"],
            "target_class": target_ctx["target_class"],
            "off_target_ban_count": len(target_ctx.get("off_target_ban", [])),
        },
        "inverse_search": {
            "strategy_idx": int(trial_result["strategy_idx"]),
            "accepted": bool(trial_result["accepted"]),
            "energy_proxy": float(trial_result["energy_proxy"]),
            "score": float(trial_result["score"]),
            "nyquist_penalty": float(trial_result["nyquist_penalty"]),
        },
        "landauer_gate": {
            "T_kelvin": T_KELVIN,
            "heat_budget_kT": HEAT_BUDGET_KT,
            "observed_kT": float(landauer_observed),
            "pass": bool(landauer_pass),
        },
        "pi_p2_verifier": pi_p2_result,
        "metrics": metrics,
        "pass_evaluation": {
            "criteria": {
                "n6_invariant": n6_check["all_pass"],
                "landauer_floor": bool(landauer_pass),
                "pi_p2_verifier": bool(pi_p2_result["pass"]),
                "inverse_search_accepted": bool(trial_result["accepted"]),
            },
            "pass_count": int(criteria_pass_count),
            "total_count": int(criteria_total),
            "overall_pass": bool(trial_overall_pass),
        },
        "raw_138_sentinel": (
            "__WEAVE_TRIAL__ "
            + ("PASS" if trial_overall_pass else "FAIL")
        ),
        "raw_91_c3_disclose": (
            "(1) 12-strand built-in catalogue is illustrative MVP — not "
            "derived from a specific empirical proteome. (2) energy_proxy "
            "= mean per-residue BLOSUM62 self-stack (Henikoff & Henikoff "
            "1992 inlined) — substitute for full Turner-NN / Rosetta "
            "score; structural-approximate per hexa-weave.md §5 step 3. "
            "(3) Landauer gate at 1e6 kT default budget structurally "
            "satisfied for any reasonable bundle (real-world constraint "
            "binds at proteome scale P=10^4); MVP records the accounting "
            "per W-R1. (4) Pi^p_2 verifier is a pairwise k-mer "
            "Jaccard-overlap stub (k=4, threshold 0.5) — full forall-"
            "exists certifier deferred to C0c. (5) ca_rmsd / tm_score / "
            "clash are score-derived proxies; AF-3 differentiation case "
            "is OUT OF SCOPE for C0b per defaults block. (6) Greedy "
            "heuristic acceptable per .roadmap.weave (NP-hard full solver "
            "out of scope at C0b)."
        ),
        "raw_47_cross_repo": (
            "Self-contained stdlib pipeline; no shared state with "
            "cage_assembly_simulation.py or ribozyme_kinetics_simulation.py. "
            "BLOSUM62 inlined; no external bioinformatics deps."
        ),
        "raw_9_hexa_only": (
            "python stdlib only — no scipy / numpy / networkx / requests / "
            "ViennaRNA / biopython"
        ),
        "raw_77_append_only": True,
    }

    # C0e / GATE-26-3 / W-R1 — build & validate composition_output_v1 doc
    # before append. Each trial row carries its own validated output doc;
    # validation errors raise (fail-fast) so invalid rows never reach the
    # registry.
    ref_witness = (
        f"raw_77_weave_compose_v1#row="
        f"{int(bundle_idx) * 10000 + int(trial_idx)}"
    )
    output_doc = build_composition_output_doc(
        target_class=target_ctx["target_class"],
        bundle=trial_result["bundle"],
        landauer_observed=landauer_observed,
        landauer_pass=landauer_pass,
        pi_p2_pass=pi_p2_result["pass"],
        ref_witness=ref_witness,
    )
    errs = validate_composition_output(output_doc)
    if errs:
        raise ValueError(
            "weave_composition: composition_output_v1 schema validation "
            "failed for bundle_idx={} trial_idx={}: {}".format(
                bundle_idx, trial_idx, "; ".join(errs)))
    row["composition_output"] = output_doc
    row["composition_output_schema_validated"] = True

    handle.write(json.dumps(row, ensure_ascii=False) + "\n")
    return row


def emit_aggregate_row(handle, *, run_id, n6_check, target_ctx, P, N, seed,
                       n_landauer_pass, n_pi_p2_pass, n_inverse_accepted,
                       bundles_with_landauer_pass, bundles_with_pi_p2_pass,
                       criteria, pass_count, total_count, overall_pass,
                       elapsed_seconds, registry_rows_written):
    ts = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.%fZ")
    row = {
        "schema": "raw_77_weave_compose_v1",
        "ts": ts,
        "cycle": 24,
        "phase": "f-tp5-b-mvp-weave-compose",
        "domain": "hexa-weave",
        "falsifier": "F-TP5-b",
        "run_id": run_id,
        "row_kind": "aggregate",
        "n6_invariant": n6_check,
        "config": {
            "P": int(P),
            "N": int(N),
            "seed": int(seed),
            "T_kelvin": T_KELVIN,
            "heat_budget_kT": HEAT_BUDGET_KT,
            "nyquist_overlap_threshold": NYQUIST_OVERLAP_THRESHOLD,
            "catalogue_size": len(CATALOGUE_12),
            "target_class": target_ctx["target_class"],
            "target_cell": target_ctx["cell"],
            "target_disease": target_ctx["disease"],
        },
        "totals": {
            "trials_total": int(P * N),
            "trials_landauer_pass": int(n_landauer_pass),
            "trials_pi_p2_pass": int(n_pi_p2_pass),
            "trials_inverse_search_accepted": int(n_inverse_accepted),
            "bundles_with_landauer_pass": int(bundles_with_landauer_pass),
            "bundles_with_pi_p2_pass": int(bundles_with_pi_p2_pass),
            "registry_rows_written": int(registry_rows_written),
        },
        "pass_evaluation": {
            "criteria": criteria,
            "pass_count": int(pass_count),
            "total_count": int(total_count),
            "overall_pass": bool(overall_pass),
        },
        "elapsed_seconds": float(elapsed_seconds),
        "raw_138_sentinel": (
            "__WEAVE_MVP_RESULT__ "
            + ("PASS" if overall_pass else "FAIL")
        ),
        "raw_91_c3_disclose": (
            "F-TP5-b PASS criterion is the 6-of-6 deterministic gate: "
            "(1) n6 invariant master-identity, (2) P >= 10, (3) N >= 50, "
            "(4) >= 1 trial per bundle survives Landauer floor, "
            "(5) >= 1 trial per bundle survives Pi^p_2 verifier, "
            "(6) registry append rows == P*N + 1 aggregate. The MVP "
            "catalogue is far below the 1e6 kT heat budget so Landauer "
            "is structurally satisfied; the gating constraint at "
            "proteome-scale P=10^4 (closure witness binding) is not "
            "exercised at C0b. AF-3 differentiation case OUT OF SCOPE "
            "(deferred to C0c per defaults block)."
        ),
        "raw_9_hexa_only": (
            "python stdlib only — no scipy / numpy / networkx / requests"
        ),
        "raw_77_append_only": True,
    }
    handle.write(json.dumps(row, ensure_ascii=False) + "\n")
    return row


# ---------------------------------------------------------------------------
# Main entry — weave_compose() public API
# ---------------------------------------------------------------------------

def weave_compose(catalogue_path=None, target_spec_path=None,
                  P=10, N=50, seed=42, target_class="aml",
                  emit=True, quiet=False):
    """Run the full WEAVE compose pipeline. Returns aggregate result dict.

    P: number of strand bundles (>= 10 for F-TP5-b PASS)
    N: trials per bundle (>= 50 for F-TP5-b PASS)
    seed: RNG seed for reproducibility (default 42)
    target_class: one of {aml, scd, pancov, senolytic} (default aml)
    emit: write witness rows to registry.jsonl (default True)
    """
    t0 = time.time()
    n6_check = n6_invariant_check()
    if not n6_check["all_pass"]:
        raise RuntimeError(f"n6 invariant precondition failed: {n6_check}")

    catalogue = load_catalogue(catalogue_path)
    target_ctx = load_target(target_spec_path, default_class=target_class)
    run_id = make_run_id(seed, P, N, target_ctx["target_class"])
    rng = random.Random(seed)

    if not quiet:
        print(f"[weave_composition] F-TP5-b C0b weave_compose() — "
              f"P={P} N={N} seed={seed} target={target_ctx['target_class']}")
        print(f"  catalogue={len(catalogue)} strands; run_id={run_id}")
        print(f"  T={T_KELVIN} K, heat_budget={HEAT_BUDGET_KT:.1e} kT, "
              f"nyquist_threshold={NYQUIST_OVERLAP_THRESHOLD}")
        print(f"  registry: {REGISTRY_PATH}")

    if emit:
        os.makedirs(os.path.dirname(REGISTRY_PATH), exist_ok=True)
        out = open(REGISTRY_PATH, "a", encoding="utf-8")
    else:
        out = None

    n_landauer_pass = 0
    n_pi_p2_pass = 0
    n_inverse_accepted = 0
    bundles_with_landauer_pass = 0
    bundles_with_pi_p2_pass = 0
    registry_rows_written = 0

    try:
        for bundle_idx in range(P):
            bundle_landauer_count = 0
            bundle_pi_p2_count = 0

            for trial_idx in range(N):
                # sigma(6)=12 raw-strategy pool; pick exponent 1..12
                strategy_idx = (rng.randrange(12)) + 1
                trial_result = greedy_compose_trial(
                    catalogue, target_ctx, rng, strategy_idx)

                landauer_pass, landauer_observed = landauer_floor_check(
                    trial_result["bundle"])
                pi_p2_result = pi_p2_verify(
                    trial_result["bundle"],
                    off_target_ban=target_ctx.get("off_target_ban", []))
                metrics = compute_metrics(
                    trial_result["bundle"], trial_result["score"])

                if trial_result["accepted"]:
                    n_inverse_accepted += 1
                if landauer_pass:
                    n_landauer_pass += 1
                    bundle_landauer_count += 1
                if pi_p2_result["pass"]:
                    n_pi_p2_pass += 1
                    bundle_pi_p2_count += 1

                criteria = {
                    "n6_invariant": n6_check["all_pass"],
                    "landauer_floor": bool(landauer_pass),
                    "pi_p2_verifier": bool(pi_p2_result["pass"]),
                    "inverse_search_accepted": bool(trial_result["accepted"]),
                }
                pass_count = sum(1 for v in criteria.values() if v)
                trial_overall_pass = (pass_count >= 3)  # n6 + landauer + pi_p2

                if out is not None:
                    emit_trial_row(
                        out, run_id=run_id, bundle_idx=bundle_idx,
                        trial_idx=trial_idx, n6_check=n6_check,
                        target_ctx=target_ctx, trial_result=trial_result,
                        landauer_pass=landauer_pass,
                        landauer_observed=landauer_observed,
                        pi_p2_result=pi_p2_result, metrics=metrics,
                        criteria_pass_count=pass_count,
                        criteria_total=len(criteria),
                        trial_overall_pass=trial_overall_pass,
                    )
                    registry_rows_written += 1

            if bundle_landauer_count > 0:
                bundles_with_landauer_pass += 1
            if bundle_pi_p2_count > 0:
                bundles_with_pi_p2_pass += 1

        elapsed = time.time() - t0

        criteria = {
            "1_n6_invariant_master_identity": n6_check["all_pass"],
            "2_P_at_least_10": (P >= 10),
            "3_N_at_least_50": (N >= 50),
            "4_each_bundle_has_landauer_pass":
                (bundles_with_landauer_pass == P),
            "5_each_bundle_has_pi_p2_pass":
                (bundles_with_pi_p2_pass == P),
            "6_registry_rows_written_match":
                (registry_rows_written == P * N) if emit else True,
        }
        pass_count = sum(1 for v in criteria.values() if v)
        total_count = len(criteria)
        overall_pass = (pass_count == total_count)

        if out is not None:
            emit_aggregate_row(
                out, run_id=run_id, n6_check=n6_check, target_ctx=target_ctx,
                P=P, N=N, seed=seed,
                n_landauer_pass=n_landauer_pass, n_pi_p2_pass=n_pi_p2_pass,
                n_inverse_accepted=n_inverse_accepted,
                bundles_with_landauer_pass=bundles_with_landauer_pass,
                bundles_with_pi_p2_pass=bundles_with_pi_p2_pass,
                criteria=criteria, pass_count=pass_count,
                total_count=total_count, overall_pass=overall_pass,
                elapsed_seconds=elapsed,
                registry_rows_written=registry_rows_written,
            )
            registry_rows_written += 1
    finally:
        if out is not None:
            out.close()

    if not quiet:
        print(f"  trials run = {P*N} ({P} bundles x {N} trials)")
        print(f"  inverse_search accepted: {n_inverse_accepted}/{P*N}")
        print(f"  landauer pass:           {n_landauer_pass}/{P*N}")
        print(f"  pi_p2 pass:              {n_pi_p2_pass}/{P*N}")
        print(f"  bundles with >=1 landauer pass: {bundles_with_landauer_pass}/{P}")
        print(f"  bundles with >=1 pi_p2 pass:    {bundles_with_pi_p2_pass}/{P}")
        print(f"  registry rows written:   {registry_rows_written}")
        print(f"  PASS evaluation (6 of 6 deterministic):")
        for name, ok in criteria.items():
            mark = "PASS" if ok else "FAIL"
            print(f"    [{mark}] {name}")
        print(f"  TOTAL: {pass_count}/{total_count} -> overall = "
              f"{'PASS' if overall_pass else 'FAIL'}")
        print(f"  elapsed: {elapsed:.2f}s")

    return {
        "run_id": run_id,
        "P": P,
        "N": N,
        "seed": seed,
        "target_class": target_ctx["target_class"],
        "trials_total": P * N,
        "n_inverse_accepted": n_inverse_accepted,
        "n_landauer_pass": n_landauer_pass,
        "n_pi_p2_pass": n_pi_p2_pass,
        "bundles_with_landauer_pass": bundles_with_landauer_pass,
        "bundles_with_pi_p2_pass": bundles_with_pi_p2_pass,
        "registry_rows_written": registry_rows_written,
        "pass_evaluation": {
            "criteria": criteria,
            "pass_count": pass_count,
            "total_count": total_count,
            "overall_pass": overall_pass,
        },
        "elapsed_seconds": elapsed,
    }


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(
        description="HEXA-WEAVE F-TP5-b 90d MVP: end-to-end weave_compose() "
                    "runner. P bundles x N trials greedy inverse-search + "
                    "Landauer floor gate + Pi^p_2 verifier + raw_77 witness. "
                    "Pure stdlib (raw 9 hexa-only)."
    )
    ap.add_argument("--P", type=int, default=10,
                    help="strand bundles to compose (>=10 for PASS)")
    ap.add_argument("--N", type=int, default=50,
                    help="trials per bundle (>=50 for PASS)")
    ap.add_argument("--seed", type=int, default=42,
                    help="RNG seed (default 42)")
    ap.add_argument("--target", choices=list(TARGET_CONTEXTS.keys()),
                    default="aml",
                    help="target W-cell disease class (default aml)")
    ap.add_argument("--catalogue", type=str, default=None,
                    help="(reserved, C0c) external strand catalogue path")
    ap.add_argument("--target-spec", type=str, default=None,
                    help="(reserved, C0c) external target spec path")
    ap.add_argument("--no-emit", action="store_true",
                    help="skip writing witness rows to registry")
    ap.add_argument("--quiet", action="store_true")
    args = ap.parse_args()

    result = weave_compose(
        catalogue_path=args.catalogue,
        target_spec_path=args.target_spec,
        P=args.P, N=args.N, seed=args.seed,
        target_class=args.target,
        emit=(not args.no_emit), quiet=args.quiet,
    )

    overall_pass = result["pass_evaluation"]["overall_pass"]
    sentinel = ("__WEAVE_MVP_RESULT__ "
                + ("PASS" if overall_pass else "FAIL"))
    print(sentinel)
    sys.exit(0 if overall_pass else 1)


if __name__ == "__main__":
    main()
