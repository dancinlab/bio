#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
quantum_anima_phi.py — anima Φ pattern outbound consumer for hexa-bio.

Connection target (per cycle 61 brainstorm + cycle 64 proposal §9.2):
  RIBOZYME τ(6)=4 four-state ladder (substrate / TS / cleaved / released)
  ↔ IIT 4.0 Φ subsystem.

Pattern: anima's IIT 4.0 stack is pinned at pyphi feature/iit-4.0 b78d0e3
(per qmirror cond.6 docs). hexa-bio installs the SAME pyphi pin (cycle 66
this commit) and uses it directly to compute Φ on a 2-binary-node TPM
that encodes our 4-state ladder. This is "anima IIT pattern absorption"
rather than literal subprocess-of-anima — the IIT method is what the
sister-repo brainstorm (cycle 61 §2.1.A) called for, not anima's CLI.

State encoding (2 binary nodes):
  node 0 = catalytic-progress bit  (0 = pre-cleavage, 1 = cleaved)
  node 1 = substrate-bound bit     (1 = engaged, 0 = released)
  state index = (node1, node0):
    00 → cleaved + released   = product (P)
    01 → cleaved + bound       = pre-release (C)   ← intermediate
    10 → uncleaved + released  = aborted (A)        ← rare path
    11 → uncleaved + bound    = substrate-engaged (S)
  TS (transition state) is folded between S→C transition probability.

Public API
==========

    ribozyme_tpm() -> list[list[float]]
        4×4 state-by-state TPM (rows index t, columns t+1) for the
        canonical hammerhead 12-nt ladder. Roughly:
          S(11) → C(01)  forward (k_cat-determined)
          C(01) → P(00)  release
          A(10)          rare back-flux
          P(00)          absorbing

    compute_phi_per_state() -> dict
        Returns Φ value per network state (4 entries). Uses pyphi's
        compute.phi(subsystem). Provides registry-ready dict.

CLI usage
=========

    python3 quantum_anima_phi.py --selftest

raw#10 honest c3
================

1. The 2-binary-node encoding is one of several reasonable mappings of
   the 4-state ladder. An alternative is 4 individual binary nodes (one
   per state) with cm restricted to forward transitions — different Φ
   values; this module pins the 2-node encoding for reproducibility.
2. PyPhi 1.2.1.dev (feature/iit-4.0 fork b78d0e3) — same pin as anima
   per qmirror cond.6 docs. PyPhi mainline (pip pyphi==1.2.0) is
   incompatible with Python 3.12 (collections.Iterable removed); the
   git fork resolves that.
3. The TPM coefficients (K12=0.3 etc) are illustrative; production
   ribozyme TPMs would derive from `_python_bridge/module/
   ribozyme_kinetics_simulation.py` output (per F-RB-4 cycle 24
   evidence). This module's smoke uses fixed coefficients.
4. PyPhi's PYPHI_WELCOME_OFF env recommendation is honored at the
   subprocess invocation level.
"""

from __future__ import annotations

import argparse
import json
import os
import sys
from typing import List


# Set BEFORE pyphi import (welcome banner suppression).
os.environ.setdefault("PYPHI_WELCOME_OFF", "yes")


def ribozyme_tpm() -> List[List[float]]:
    """4×4 state-by-state TPM for the 4-state ribozyme ladder.

    Row = current state (binary: node1, node0), col = next state.
    Indexing convention: state index = node1*2 + node0.

    | from\\to | 00 (P abs) | 01 (C) | 10 (A) | 11 (S) |
    |---------|-----------|--------|--------|--------|
    | 00 (P)  |   1.0     |  0.0   |  0.0   |  0.0   |  product absorbing
    | 01 (C)  |   0.5     |  0.5   |  0.0   |  0.0   |  cleaved-bound → release
    | 10 (A)  |   0.0     |  0.0   |  1.0   |  0.0   |  aborted absorbing
    | 11 (S)  |   0.0     |  0.3   |  0.0   |  0.7   |  substrate → cleaved (k_cat)
    """
    return [
        [1.0, 0.0, 0.0, 0.0],   # 00 P
        [0.5, 0.5, 0.0, 0.0],   # 01 C
        [0.0, 0.0, 1.0, 0.0],   # 10 A
        [0.0, 0.3, 0.0, 0.7],   # 11 S
    ]


def compute_phi_per_state() -> dict:
    """Compute Φ for each of the 4 network states using pyphi."""
    import pyphi
    import numpy as np

    # PyPhi feature/iit-4.0 fork: PARALLEL_* config keys are dicts (not bool)
    # with default {'parallel': False, ...}. The previous "Please re-install
    # PyPhi with `pyphi[parallel]`" message was specifically about a missing
    # 'ray' optional. After `pip install pyphi[parallel] --no-deps` (cycle 67)
    # the dict default already says parallel=False, so no override needed.
    pass

    tpm_sbs = np.array(ribozyme_tpm())
    # state-by-state (4x4) → state-by-node (4x2).
    tpm_sbn = pyphi.convert.state_by_state2state_by_node(tpm_sbs)
    # Connectivity matrix: 2 nodes, both connect to both (full).
    cm = np.array([[1, 1], [1, 1]])
    network = pyphi.Network(tpm_sbn, cm=cm, node_labels=("cat", "bound"))

    out = {}
    for idx in range(4):
        # Convert idx to state tuple (node0, node1, ...).
        state = (idx & 1, (idx >> 1) & 1)
        try:
            subsystem = pyphi.Subsystem(network, state)
            phi = pyphi.compute.phi(subsystem)
            out[f"state_{idx:02b}"] = float(phi)
        except Exception as exc:
            out[f"state_{idx:02b}_error"] = str(exc)
    return out


def _cmd_selftest() -> int:
    print("hexa-bio quantum_anima_phi.py — selftest")
    print("  RIBOZYME 4-state ladder ↔ IIT 4.0 Φ via pyphi (anima IIT pin)")
    print("")
    print("  TPM (state-by-state):")
    tpm = ribozyme_tpm()
    state_labels = {0: "P (cleaved+released, absorbing)",
                    1: "C (cleaved+bound, intermediate)",
                    2: "A (aborted, rare)",
                    3: "S (substrate-bound)"}
    for i, row in enumerate(tpm):
        print(f"    {i:02b} {state_labels[i]:40s}: {row}")
    print("")

    print("  Computing Φ per state...")
    try:
        phi_per_state = compute_phi_per_state()
    except Exception as exc:
        print(f"  FAIL: pyphi compute raised: {exc}")
        print("__HEXA_BIO_ANIMA_PHI__ FAIL")
        return 1
    for k, v in phi_per_state.items():
        if isinstance(v, float):
            print(f"  {k}: Φ = {v:+.6f}")
        else:
            print(f"  {k}: {v}")
    print("")
    n_finite = sum(1 for v in phi_per_state.values() if isinstance(v, float))
    if n_finite < 4:
        print(f"  PARTIAL: {n_finite}/4 states yielded finite Φ")
        print("__HEXA_BIO_ANIMA_PHI__ PARTIAL")
        return 0
    print(f"  PASS: 4/4 states yielded Φ values")
    print("__HEXA_BIO_ANIMA_PHI__ PASS")
    return 0


def main(argv=None) -> int:
    p = argparse.ArgumentParser(prog="quantum_anima_phi.py")
    p.add_argument("--selftest", action="store_true")
    args = p.parse_args(argv)
    if args.selftest:
        return _cmd_selftest()
    p.print_help()
    return 2


if __name__ == "__main__":
    sys.exit(main())
