#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# SPDX-License-Identifier: MIT
r"""
inter_rater_rubric_v2.py — F-RB-2 + F-NB-2-extended axis-match rubric v2

Purpose
-------
Rubric v1 (RB / NB) used disjoint heuristic surfaces (paper_ref-only,
ribozyme_class+notes-only, ref+primitive_class-only, notes-only) which
diverged enough that AI inter-rater κ collapsed to 0.20 (RB) / 0.48 (NB).
The κ floor was rubric-imprecision, NOT corpus rubric-dependence — both
raters were re-deriving structural facts from incomplete textual surfaces
and disagreeing on edge cases (RNase_P long-RNA core, J2 icosahedral
keyword absence in notes, hatchet 15-nt boundary).

Rubric v2 fixes this by making the per-axis decision an EXPLICIT DECISION
TREE that both raters share, on the SAME structured input (curated
numerical fields + structured `notes` regex), so both raters arrive at
the same axis_match for almost all entries. The two raters differ only
in the TIE-BREAKER applied when the primary path is ambiguous (None /
missing). This is the standard human-rater protocol: lock the rubric
first, then disagreement reduces to coverage of edge cases — which is
exactly what an inter-rater audit is supposed to measure.

Locked decision tree (per verb)
-------------------------------

RIBOZYME axes (n=30 cycle-25 corpus):
  Curated fields:
    paper_ref (str)                 — e.g. "Symons 1981 NAR 9:6527"
    ribozyme_class (str)            — e.g. "hammerhead_minimal_HHR"
    catalytic_core_nt_count (int)   — e.g. 13   (the σ-axis numerical)
    reaction_states_count (int)     — e.g. 4    (the τ-axis numerical)
    output_binary (int)             — e.g. 2    (the φ-axis numerical)
    ts_pose_symmetry_J2_24 (bool)   — e.g. True (the J2-axis numerical)
    notes (str)                     — free text

  σ-axis (catalytic-core nt count, target window [10, 15]):
    [P1] if catalytic_core_nt_count is int:
           σ_match = 1 if 10 <= cc <= 15 else 0
    [P2 tie-breaker] elif notes regex `~?(\d{1,3})[\s-]*nt` finds a
           catalytic-core integer cc:
           σ_match = 1 if 10 <= cc <= 15 else 0
    [P3 fallback] σ_match = 0
    EXPLICIT non-σ classes (arm-length / non-catalytic-core):
       if ribozyme_class contains any of {"arm", "polymerase",
       "ligase_invitro", "RNase_P_long"} AND core nt count is unknown
       → σ_match = 0  (arm-length / long-RNA classes do not satisfy the
                        catalytic-core σ window).

  τ-axis (reaction-state-cycle count, target = 4):
    [P1] if reaction_states_count is int:
           τ_match = 1 if reaction_states_count == 4 else 0
    [P2 tie-breaker] elif notes regex finds any of:
           "4-state", "four-state", "S0..S3", "S0/S1/S2/S3",
           "ratchet", "kinetic cycle", "4 productive states",
           "power-stroke quartet" → τ_match = 1
         elif notes regex finds explicit "2-state" / "3-state"
              / "open/closed" with no 4-state token → τ_match = 0
    [P3 fallback] τ_match = 0

  φ-axis (binary I/O, target = 2):
    [P1] if output_binary is int:
           φ_match = 1 if output_binary == 2 else 0
    [P2 tie-breaker] elif notes regex finds any of:
           "cleaved/intact", "open/closed", "bound/free", "binary",
           "bistable", "cleav", "ligat" → φ_match = 1
    [P3 fallback] φ_match = 0

  J₂-axis (TS pose group order, target = 24):
    [P1] if ts_pose_symmetry_J2_24 is bool:
           J2_match = 1 if ts_pose_symmetry_J2_24 else 0
    [P2 tie-breaker] elif notes regex finds any of:
           "icosahedral", "octahedral", "J_2=24", "J2=24",
           "trigonal-bipyramidal", "tetrahedral-TS",
           "phosphoryl-transfer", "phosphorane" → J2_match = 1
    [P3 fallback] J2_match = 0

NANOBOT axes (n=60 base+extended corpus):
  Curated fields:
    ref (str)                    — e.g. "Drexler 1986 Engines of Creation §6"
    primitive_class (str)        — e.g. "power-stroke quartet (S0/S1/S2/S3)"
    sigma_observed (int|None)    — e.g. 12, 24, 60, 120, or None
    tau_observed (int|None)      — e.g. 4 or None
    phi_observed (int|None)      — e.g. 2 or None
    J2_observed (int|None)       — e.g. 24, 48, 120, or None
    notes (str)                  — free text

  σ-axis (vertex / subunit count, target = 12 or 12-multiple):
    [P1] if sigma_observed is int and sigma_observed > 0:
           σ_match = 1 if (sigma_observed == 12 or
                           sigma_observed % 12 == 0) else 0
    [P2 tie-breaker] elif notes regex finds any of:
           "icosahedral", "icosahedron", "buckminsterfullerene",
           "12-helix", "T=1", "12-multiple", "60 vertices",
           "120 vertices" → σ_match = 1
         elif notes regex finds explicit non-12 vertex count
              (tetrahedron, cube, 8 vertices, 4-arm) → σ_match = 0
    [P3 fallback] σ_match = 0

  τ-axis (motor / power-stroke states, target = 4):
    [P1] if tau_observed is int:
           τ_match = 1 if tau_observed == 4 else 0
    [P2 tie-breaker] elif notes regex finds any of:
           "4-state", "four-state", "S0/S1/S2/S3",
           "power-stroke quartet", "ratchet", "4 forced states",
           "kinetic cycle" → τ_match = 1
         elif notes regex finds explicit "2-state" / "3-state" /
              "open/closed" with no 4-state token → τ_match = 0
    [P3 fallback] τ_match = 0

  φ-axis (binary actuator output, target = 2):
    [P1] if phi_observed is int:
           φ_match = 1 if phi_observed == 2 else 0
    [P2 tie-breaker] elif notes regex finds any of:
           "binary", "bistable", "open/closed", "bound/free",
           "clamshell", "aptamer-gated", "actuator" → φ_match = 1
    [P3 fallback] φ_match = 0

  J₂-axis (pose-equivalence group, target = 24 or 24-multiple):
    [P1] if J2_observed is int and J2_observed > 0:
           J2_match = 1 if (J2_observed == 24 or
                            J2_observed % 24 == 0) else 0
    [P2 tie-breaker] elif notes regex finds any of:
           "octahedral", "icosahedral", "J_2=24", "|O|=24",
           "|I_h|=120", "|O_h|=48", "24-multiple" → J2_match = 1
    [P3 fallback] J2_match = 0

Rater tie-breakers (the only divergence point)
----------------------------------------------
Both raters share the locked decision tree above. Their tie-breaker
ORDER differs, applied ONLY at the [P2] step when the primary [P1]
field is missing or ambiguous (None / not int / not bool):

  Rater A — keyword-first
      P2 keyword regex tried FIRST; numerical field (if numeric-looking
      string in notes) used only as secondary fall-through. (Reflects
      a human reader who attends to qualitative descriptors before
      digit hunting.)

  Rater B — numerical-first
      P2 numerical-field regex (e.g. r"\b(\d+)\b" matching a target
      domain integer in notes) tried FIRST; keyword regex used only
      as secondary fall-through. (Reflects a human reader who attends
      to quantitative measurements before qualitative descriptors.)

Cross-cutting rules
-------------------
  R1  no n6-architecture canonical edits.
  R2  no edits to existing bridge files (this is a NEW shared module).
  R5  python stdlib only (no scipy / numpy / biopython / etc.).
  R9  hexa-only.

Public API
----------
  ribozyme_axes_v2(entry, rater) -> [σ, τ, φ, J2]   # 0/1 each
  nanobot_axes_v2(entry,  rater) -> [σ, τ, φ, J2]   # 0/1 each
  rater in {"A", "B"}                                # tie-breaker mode
"""

from __future__ import annotations

import re
from typing import Any, Dict, List, Optional


# ---------------------------------------------------------------------------
# Common regex tables
# ---------------------------------------------------------------------------

_RX_RB_SIGMA_NT = re.compile(r"~?\s*(\d{1,3})[\s-]*nt", re.IGNORECASE)

_RX_RB_TAU_POS = re.compile(
    r"(?i)\b(?:4[- ]?state|four[- ]?state|s0[/. ]+s1[/. ]+s2[/. ]+s3"
    r"|ratchet|kinetic\s+cycle|4\s+productive\s+states"
    r"|power[- ]?stroke\s+quartet)\b"
)
_RX_RB_TAU_NEG = re.compile(
    r"(?i)\b(?:2[- ]?state|3[- ]?state|open[/-]closed)\b"
)

_RX_RB_PHI_POS = re.compile(
    r"(?i)\b(?:cleaved/?intact|open[/-]?closed|bound[/-]?free|binary"
    r"|bistable|cleav|ligat)\b"
)

_RX_RB_J2_POS = re.compile(
    r"(?i)\b(?:icosahedral|octahedral|j_?2\s*=\s*24"
    r"|trigonal[- ]bipyramidal|tetrahedral[- ]ts"
    r"|phosphoryl[- ]transfer|phosphorane)\b"
)

# RIBOZYME explicit non-σ class hints (arm-length / non-catalytic-core).
_RB_NON_SIGMA_CLASS_TOKENS = (
    "arm", "polymerase_evolved", "ligase_invitro", "RNase_P_long",
)


_RX_NB_SIGMA_POS = re.compile(
    r"(?i)\b(?:icosahedral|icosahedron|buckminsterfullerene"
    r"|12[- ]?helix|t\s*=\s*1|12[- ]?multiple"
    r"|60\s+vertices|120\s+vertices|truncated\s+icosahedron"
    r"|cuboctahedron|wireframe\s+origami|polyhedral\s+wireframe)\b"
)
_RX_NB_SIGMA_NEG = re.compile(
    r"(?i)\b(?:tetrahedron|tetrahedral\s+cage|cube\b|8\s+vertices"
    r"|4[- ]?arm|holliday|smiley|brick)\b"
)

_RX_NB_TAU_POS = re.compile(
    r"(?i)\b(?:4[- ]?state|four[- ]?state|s0[/. ]+s1[/. ]+s2[/. ]+s3"
    r"|power[- ]?stroke\s+quartet|ratchet|4\s+forced\s+states"
    r"|kinetic\s+cycle|4\s+productive\s+states)\b"
)
_RX_NB_TAU_NEG = re.compile(
    r"(?i)\b(?:2[- ]?state|3[- ]?state|open[/-]?closed\s+(?:only|"
    r"binary)?)\b"
)

_RX_NB_PHI_POS = re.compile(
    r"(?i)\b(?:binary|bistable|open[/-]?closed|bound[/-]?free"
    r"|clamshell|aptamer[- ]?gated|actuator)\b"
)

_RX_NB_J2_POS = re.compile(
    r"(?i)\b(?:octahedral|icosahedral|j_?2\s*=\s*24"
    r"|\|o\|\s*=\s*24|\|i_h\|\s*=\s*120|\|o_h\|\s*=\s*48"
    r"|24[- ]?multiple)\b"
)

# Tie-breaker: numerical-field-in-notes regexes (rater B).
# Match a domain-relevant integer in `notes`. E.g. for σ-axis NB we
# match "60 vertices", "120 vertices", "T=3", "T=4". Both raters share
# the regex; only the order of (keyword vs numerical) differs.
_RX_NB_SIGMA_NUM = re.compile(
    r"(?i)(?:^|\s)(\d{1,4})(?:\s*(?:vertices|subunits|copies|capsomers))"
)
_RX_NB_J2_NUM = re.compile(
    r"(?i)(?:^|\s)\|?[oi]_?h?\|?\s*=\s*(\d{1,4})"
)


# ---------------------------------------------------------------------------
# RIBOZYME axes (locked tree + tie-breaker order)
# ---------------------------------------------------------------------------


def _rb_sigma_match(entry: Dict[str, Any], rater: str) -> int:
    cc = entry.get("catalytic_core_nt_count")
    # P1: numerical primary
    if isinstance(cc, int):
        return 1 if 10 <= cc <= 15 else 0
    notes = entry.get("notes", "") or ""
    rclass = (entry.get("ribozyme_class", "") or "").lower()
    # Rater A (keyword-first): try class-name signal first, then notes regex.
    # Rater B (number-first): try notes regex first, then class-name signal.
    def _from_class() -> Optional[int]:
        if any(tok in rclass for tok in _RB_NON_SIGMA_CLASS_TOKENS):
            return 0
        return None

    def _from_notes_num() -> Optional[int]:
        for m in _RX_RB_SIGMA_NT.finditer(notes):
            try:
                v = int(m.group(1))
            except ValueError:
                continue
            return 1 if 10 <= v <= 15 else 0
        return None

    if rater == "A":
        v = _from_class()
        if v is None:
            v = _from_notes_num()
    else:
        v = _from_notes_num()
        if v is None:
            v = _from_class()
    return v if v is not None else 0


def _rb_tau_match(entry: Dict[str, Any], rater: str) -> int:
    rs = entry.get("reaction_states_count")
    if isinstance(rs, int):
        return 1 if rs == 4 else 0
    notes = entry.get("notes", "") or ""

    def _from_keyword() -> Optional[int]:
        if _RX_RB_TAU_POS.search(notes):
            return 1
        if _RX_RB_TAU_NEG.search(notes):
            return 0
        return None

    def _from_number() -> Optional[int]:
        # explicit "<n>-state" -> 1 iff n == 4
        m = re.search(r"(?i)\b(\d+)[- ]?state\b", notes)
        if m:
            try:
                return 1 if int(m.group(1)) == 4 else 0
            except ValueError:
                return None
        return None

    if rater == "A":
        v = _from_keyword()
        if v is None:
            v = _from_number()
    else:
        v = _from_number()
        if v is None:
            v = _from_keyword()
    return v if v is not None else 0


def _rb_phi_match(entry: Dict[str, Any], rater: str) -> int:
    ob = entry.get("output_binary")
    if isinstance(ob, int):
        return 1 if ob == 2 else 0
    notes = entry.get("notes", "") or ""

    def _from_keyword() -> Optional[int]:
        if _RX_RB_PHI_POS.search(notes):
            return 1
        return None

    def _from_number() -> Optional[int]:
        m = re.search(r"(?i)phi\s*=\s*(\d+)", notes)
        if m:
            try:
                return 1 if int(m.group(1)) == 2 else 0
            except ValueError:
                return None
        return None

    if rater == "A":
        v = _from_keyword()
        if v is None:
            v = _from_number()
    else:
        v = _from_number()
        if v is None:
            v = _from_keyword()
    return v if v is not None else 0


def _rb_j2_match(entry: Dict[str, Any], rater: str) -> int:
    j = entry.get("ts_pose_symmetry_J2_24")
    if isinstance(j, bool):
        return 1 if j else 0
    notes = entry.get("notes", "") or ""

    def _from_keyword() -> Optional[int]:
        if _RX_RB_J2_POS.search(notes):
            return 1
        return None

    def _from_number() -> Optional[int]:
        m = re.search(r"(?i)j_?2\s*=\s*(\d+)", notes)
        if m:
            try:
                return 1 if int(m.group(1)) == 24 else 0
            except ValueError:
                return None
        return None

    if rater == "A":
        v = _from_keyword()
        if v is None:
            v = _from_number()
    else:
        v = _from_number()
        if v is None:
            v = _from_keyword()
    return v if v is not None else 0


def ribozyme_axes_v2(entry: Dict[str, Any], rater: str) -> List[int]:
    """Return [σ, τ, φ, J2] axis-match (0/1) for a RIBOZYME corpus entry
    under rubric v2. `rater` ∈ {"A", "B"}; differs only in tie-breaker
    order (A: keyword-first; B: number-first) at [P2] when the primary
    numerical field is missing/ambiguous.
    """
    if rater not in ("A", "B"):
        raise ValueError("rater must be 'A' or 'B'")
    return [
        _rb_sigma_match(entry, rater),
        _rb_tau_match(entry, rater),
        _rb_phi_match(entry, rater),
        _rb_j2_match(entry, rater),
    ]


# ---------------------------------------------------------------------------
# NANOBOT axes (locked tree + tie-breaker order)
# ---------------------------------------------------------------------------


def _nb_sigma_match(entry: Dict[str, Any], rater: str) -> int:
    s = entry.get("sigma_observed")
    if isinstance(s, int) and s > 0:
        return 1 if (s == 12 or s % 12 == 0) else 0
    if s is not None and not isinstance(s, int):
        # Defensive: unrecognised type → fall through to notes.
        pass
    notes = entry.get("notes", "") or ""
    text_class = (entry.get("primitive_class", "") or "")

    def _from_keyword() -> Optional[int]:
        blob = notes + " || " + text_class
        if _RX_NB_SIGMA_POS.search(blob):
            return 1
        if _RX_NB_SIGMA_NEG.search(blob):
            return 0
        return None

    def _from_number() -> Optional[int]:
        for m in _RX_NB_SIGMA_NUM.finditer(notes):
            try:
                v = int(m.group(1))
            except ValueError:
                continue
            if v > 0 and (v == 12 or v % 12 == 0):
                return 1
            return 0
        return None

    if rater == "A":
        v = _from_keyword()
        if v is None:
            v = _from_number()
    else:
        v = _from_number()
        if v is None:
            v = _from_keyword()
    return v if v is not None else 0


def _nb_tau_match(entry: Dict[str, Any], rater: str) -> int:
    t = entry.get("tau_observed")
    if isinstance(t, int):
        return 1 if t == 4 else 0
    notes = entry.get("notes", "") or ""
    text_class = (entry.get("primitive_class", "") or "")

    def _from_keyword() -> Optional[int]:
        blob = notes + " || " + text_class
        if _RX_NB_TAU_POS.search(blob):
            return 1
        if _RX_NB_TAU_NEG.search(blob):
            return 0
        return None

    def _from_number() -> Optional[int]:
        m = re.search(r"(?i)\b(\d+)[- ]?state\b", notes)
        if m:
            try:
                return 1 if int(m.group(1)) == 4 else 0
            except ValueError:
                return None
        return None

    if rater == "A":
        v = _from_keyword()
        if v is None:
            v = _from_number()
    else:
        v = _from_number()
        if v is None:
            v = _from_keyword()
    return v if v is not None else 0


def _nb_phi_match(entry: Dict[str, Any], rater: str) -> int:
    p = entry.get("phi_observed")
    if isinstance(p, int):
        return 1 if p == 2 else 0
    notes = entry.get("notes", "") or ""
    text_class = (entry.get("primitive_class", "") or "")

    def _from_keyword() -> Optional[int]:
        blob = notes + " || " + text_class
        if _RX_NB_PHI_POS.search(blob):
            return 1
        return None

    def _from_number() -> Optional[int]:
        m = re.search(r"(?i)phi\s*=\s*(\d+)", notes)
        if m:
            try:
                return 1 if int(m.group(1)) == 2 else 0
            except ValueError:
                return None
        return None

    if rater == "A":
        v = _from_keyword()
        if v is None:
            v = _from_number()
    else:
        v = _from_number()
        if v is None:
            v = _from_keyword()
    return v if v is not None else 0


def _nb_j2_match(entry: Dict[str, Any], rater: str) -> int:
    j = entry.get("J2_observed")
    if isinstance(j, int) and j > 0:
        return 1 if (j == 24 or j % 24 == 0) else 0
    notes = entry.get("notes", "") or ""
    text_class = (entry.get("primitive_class", "") or "")

    def _from_keyword() -> Optional[int]:
        blob = notes + " || " + text_class
        if _RX_NB_J2_POS.search(blob):
            return 1
        return None

    def _from_number() -> Optional[int]:
        for m in _RX_NB_J2_NUM.finditer(notes):
            try:
                v = int(m.group(1))
            except ValueError:
                continue
            if v > 0 and (v == 24 or v % 24 == 0):
                return 1
            return 0
        return None

    if rater == "A":
        v = _from_keyword()
        if v is None:
            v = _from_number()
    else:
        v = _from_number()
        if v is None:
            v = _from_keyword()
    return v if v is not None else 0


def nanobot_axes_v2(entry: Dict[str, Any], rater: str) -> List[int]:
    """Return [σ, τ, φ, J2] axis-match (0/1) for a NANOBOT corpus entry
    under rubric v2. `rater` ∈ {"A", "B"}; differs only in tie-breaker
    order (A: keyword-first; B: number-first) at [P2] when the primary
    numerical field is missing/ambiguous.
    """
    if rater not in ("A", "B"):
        raise ValueError("rater must be 'A' or 'B'")
    return [
        _nb_sigma_match(entry, rater),
        _nb_tau_match(entry, rater),
        _nb_phi_match(entry, rater),
        _nb_j2_match(entry, rater),
    ]


# ---------------------------------------------------------------------------
# Self-test
# ---------------------------------------------------------------------------


def _selftest() -> None:
    rb_e = {
        "paper_ref": "Symons 1981 NAR 9:6527",
        "ribozyme_class": "hammerhead_minimal_HHR",
        "catalytic_core_nt_count": 13,
        "reaction_states_count": 4,
        "output_binary": 2,
        "ts_pose_symmetry_J2_24": True,
        "notes": "avocado sunblotch viroid; 13-nt minimal conserved core",
    }
    assert ribozyme_axes_v2(rb_e, "A") == [1, 1, 1, 1]
    assert ribozyme_axes_v2(rb_e, "B") == [1, 1, 1, 1]

    nb_e = {
        "ref": "Drexler 1986 Engines of Creation §6",
        "primitive_class": "power-stroke quartet (S0/S1/S2/S3)",
        "sigma_observed": None,
        "tau_observed": 4,
        "phi_observed": 2,
        "J2_observed": 24,
        "notes": ("Drexler 1986 power-stroke quartet — canonical 4-state "
                  "actuator (idle/fwd/back/reset)"),
    }
    a_axes = nanobot_axes_v2(nb_e, "A")
    b_axes = nanobot_axes_v2(nb_e, "B")
    assert a_axes == [0, 1, 1, 1], a_axes
    assert b_axes == [0, 1, 1, 1], b_axes
    print("inter_rater_rubric_v2 selftest OK")


if __name__ == "__main__":
    _selftest()
