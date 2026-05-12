#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
compute_substrate_routing.py — hexa-bio compute-substrate routing decision table

Deterministic, stdlib-only. Given a workload spec, decides which compute
substrate (qmirror / xeno→AKIDA / xeno→Loihi3 / xeno→IonQ / vendor / classical)
it should route to, AND whether that substrate is `ready` / `pending` /
`unexplored` on this host right now.

The CRITICAL design principle (per user 2026-05-12): **every substrate is
optional**. A user without qmirror, without xeno, without AKIDA, without a
vendor account — should never see a FAIL. The routing decision says "this
workload WANTS substrate X"; the readiness check says "X is/isn't available
here"; if X isn't available, the verdict is `pending` (with a documented
gating constraint), never `unavailable→FAIL`. The hexa-bio core (pure-hexa
in-repo selftests, σ/τ/φ/J₂ deductive verification) needs none of these
substrates — they are accelerators / external compute, not dependencies.

This selftest itself always PASSes — it's a self-consistency check on the
routing table, not a substrate-availability check (those are the dedicated
gates: qmirror_chemistry_vqe_gate.sh, xeno_substrate_gate.sh,
cmt_vqe_ladder_readiness.sh, akida_workload_readiness.sh — each of which
SKIPs cleanly when its substrate is absent).

Sentinel: __COMPUTE_SUBSTRATE_ROUTING__ PASS|FAIL
Cross-ref: COMPUTE_PORTFOLIO.md §5 (routing logic) + §2 (substrate × workload matrix)
"""
from __future__ import annotations
import os
import sys

# ── Substrate registry ─────────────────────────────────────────────────────
# readiness ∈ {"ready", "pending", "unexplored"}; gating = why it's not ready (if not ready).
SUBSTRATES = {
    "qmirror_state_vector": {
        "desc": "qmirror ≤30-qubit pure-hexa state-vector (IBM/IonQ/Quantinuum cloud-API substitute)",
        "probe": lambda: _path_exists("~/core/qmirror/cli/qmirror.hexa") or _path_exists("~/core/qmirror"),
        "readiness_if_present": "ready",
        "gating": "—",
        "fallback": "classical numpy/scipy state-vector (~10-qubit ceiling, slow) — or just skip the live VQE; hexa-bio prints its Phase + falsifier snapshot regardless",
    },
    "qmirror_chemistry_vqe_h2": {
        "desc": "qmirror chemistry-VQE pure-hexa kernel — H2/STO-3G/0.74Å cond.14 spectroscopic-accuracy gate",
        "probe": lambda: _path_exists("~/core/qmirror/chemistry_vqe/module/chemistry_vqe.hexa"),
        "readiness_if_present": "ready",
        "gating": "—",
        "fallback": "skip the live H2 VQE; the cond.14 verdict is then 'not exercised on this host', not FAIL",
    },
    "qmirror_chemistry_vqe_pyscf": {
        "desc": "qmirror chemistry-VQE + classical PySCF backend — arbitrary drug-pocket Hamiltonian construction",
        "probe": lambda: False,  # not implemented anywhere yet (the Tier-2 gap)
        "readiness_if_present": "ready",
        "gating": "F-Q-6-E ramp — needs a classical-chemistry integral backend (PySCF) to build the active-space Hamiltonian before the quantum solver runs; pure-hexa kernel can't (qmirror raw#10 caveat 1). See COMPUTE_PORTFOLIO.md §4.",
        "fallback": "DESIGN-AUDIT proxy (selftest/cmt_side_effect_avoidance_audit.py + cmt_library_ranking.py for CMT) — the in-repo-verifiable closure that substitutes for the VQE-binding closure until the backend lands",
    },
    "xeno_akida": {
        "desc": "xeno → AKIDA AKD1000 (BrainChip neuromorphic, 1W spike inference)",
        "probe": lambda: _xeno_present() and _path_exists("~/core/xeno/roadmaps/.roadmap.akida"),
        "readiness_if_present": "pending",  # xeno present ≠ AKIDA workloads wired; need AKD1000 + xeno Phase 1.5 falsifier
        "gating": "AKD1000 physical chip arrival (ordered 2026-04-29, ETA pending; AKIDA Cloud live 2026-05-08) + xeno Phase 1.5 `falsifier` subcommand. Probed by selftest/akida_workload_readiness.sh.",
        "fallback": "CPU brute-force (ribozyme off-target: RIsearch2 on commodity CPU; medical-device: standard ML inference; nanobot: standard pose estimation) — slower but no AKIDA needed. The AKIDA path is an accelerator, not a dependency.",
    },
    "xeno_loihi3": {
        "desc": "xeno → Loihi3 (Intel neuromorphic)",
        "probe": lambda: _xeno_present() and _path_exists("~/core/xeno/roadmaps/.roadmap.loihi3"),
        "readiness_if_present": "unexplored",  # no hexa-bio workload mapped yet
        "gating": "no hexa-bio workload identified; xeno roadmap (.roadmap.loihi3) tracks substrate-side readiness",
        "fallback": "n/a — no workload routed here yet",
    },
    "xeno_ionq": {
        "desc": "xeno → IonQ Forte (trapped-ion quantum-gate, real noise — distinct from qmirror's noiseless state-vector)",
        "probe": lambda: _xeno_present() and _path_exists("~/core/xeno/roadmaps/.roadmap.ionq"),
        "readiness_if_present": "unexplored",  # needs a vendor account via xeno
        "gating": "needs an IonQ vendor account configured via xeno; no hexa-bio workload currently needs real-noise gate-model (all quantum workloads are fine on qmirror's noiseless ≤30q state-vector)",
        "fallback": "qmirror noiseless state-vector — sufficient for all current hexa-bio quantum workloads (real-noise modeling is a future need, not a current one)",
    },
    "xeno_organoid": {
        "desc": "xeno → FinalSpark / Cortical Labs DishBrain (biological compute)",
        "probe": lambda: _xeno_present() and (_path_exists("~/core/xeno/roadmaps/.roadmap.finalspark") or _path_exists("~/core/xeno/roadmaps/.roadmap.cortical_labs")),
        "readiness_if_present": "unexplored",
        "gating": "potential 3-layer use (organoid = EEG/EMG training-data source, AKIDA = inference engine, hexa-bio = workload spec — DishBrain-Pong precedent) — far-future, xeno Phase ramp dependent",
        "fallback": "n/a — speculative, no workload routed here",
    },
    "qrng": {
        "desc": "quantum random number — qmirror's internal ANU QRNG OR xeno's QRNG substrate (both free, both usable as entropy sources)",
        "probe": lambda: _path_exists("~/core/qmirror") or _xeno_present(),
        "readiness_if_present": "ready",
        "gating": "—",
        "fallback": "Python `secrets` module / `os.urandom` — cryptographically-secure-enough for falsifier seeds (Monte Carlo enumeration etc.); quantum entropy is a 'nice to have', not required",
    },
    "vendor_quantum": {
        "desc": "vendor cloud quantum (IBM Heron 156q+ / >30-qubit fault-tolerant PsiQuantum / Google Willow)",
        "probe": lambda: False,  # not configured; 10-year horizon
        "readiness_if_present": "ready",
        "gating": "no hexa-bio workload needs >30 qubit OR real superconducting noise; fault-tolerant is a 10-year horizon (vendor partnership, not procurement)",
        "fallback": "qmirror ≤30q state-vector covers all current workloads; xeno→IonQ bridges real-noise gate-model when needed; >30q fault-tolerant is genuinely far future",
    },
    "classical_cpu": {
        "desc": "commodity CPU (numpy/scipy, pure-hexa selftests, deterministic verifiers)",
        "probe": lambda: True,  # always available
        "readiness_if_present": "ready",
        "gating": "—",
        "fallback": "(this IS the universal fallback — every substrate above degrades to here)",
    },
}

# ── Routing rules: (predicate on workload spec) → substrate ─────────────────
# Evaluated in order; first match wins. Workload spec = dict with keys:
#   kind: "quantum_vqe" | "chemistry_vqe" | "edge_ai" | "wf_recursion" | "random" | "deductive"
#   qubits: int (for quantum_vqe / chemistry_vqe)
#   molecule: "H2_canonical" | "arbitrary" (for chemistry_vqe)
#   noise: "noiseless" | "real" (for quantum_vqe)
ROUTING_RULES = [
    (lambda w: w["kind"] == "deductive",                                              "classical_cpu"),
    (lambda w: w["kind"] == "random",                                                 "qrng"),
    (lambda w: w["kind"] == "chemistry_vqe" and w.get("molecule") == "H2_canonical",  "qmirror_chemistry_vqe_h2"),
    (lambda w: w["kind"] == "chemistry_vqe" and w.get("molecule") == "arbitrary",      "qmirror_chemistry_vqe_pyscf"),
    (lambda w: w["kind"] == "quantum_vqe" and w.get("noise") == "real",                "xeno_ionq"),
    (lambda w: w["kind"] == "quantum_vqe" and w.get("qubits", 0) > 30,                 "vendor_quantum"),
    (lambda w: w["kind"] == "quantum_vqe",                                             "qmirror_state_vector"),
    (lambda w: w["kind"] == "edge_ai",                                                 "xeno_akida"),
    (lambda w: w["kind"] == "wf_recursion",                                            "xeno_loihi3"),
]

# ── Representative hexa-bio workloads (the routing table self-test) ─────────
WORKLOADS = [
    {"id": "n6_axis_deductive",         "kind": "deductive",     "note": "σ/τ/φ/J₂ + master identity (42/42 deductive)"},
    {"id": "falsifier_mc_seed",         "kind": "random",        "note": "Monte Carlo enumeration seeds for randomized falsifiers"},
    {"id": "qmirror_cond14_h2",         "kind": "chemistry_vqe", "molecule": "H2_canonical",  "note": "qmirror cond.14 spectroscopic-accuracy gate"},
    {"id": "mpro_pocket_vqe",           "kind": "quantum_vqe",   "qubits": 2,  "noise": "noiseless", "note": "Mpro pocket cluster 2e/2o → 2 qubit VQE (F-Q-6-D)"},
    {"id": "warhead_library_vqe",       "kind": "quantum_vqe",   "qubits": 4,  "noise": "noiseless", "note": "5-warhead covalent-Mpro-inhibitor library ranking (F-Q-6-F)"},
    {"id": "cmt_hd6_pocket_vqe",        "kind": "chemistry_vqe", "molecule": "arbitrary", "note": "CMT hxq-cmt-hd6-001 vs HDAC6 catalytic pocket (F-disease-cmt-Q-2) — BLOCKED on PySCF backend"},
    {"id": "cmt_sar1_pocket_vqe",       "kind": "chemistry_vqe", "molecule": "arbitrary", "note": "CMT hxq-cmt-sar1-001 vs SARM1 TIR pocket (F-disease-cmt-Q-6) — BLOCKED on PySCF backend"},
    {"id": "ribozyme_offtarget_scan",   "kind": "edge_ai",       "note": "G26-RB-3 GENCODE v47 off-target Hamming scan (~106k transcripts × 28nt) — AKIDA spike pattern matching candidate"},
    {"id": "medical_device_eeg_seizure","kind": "edge_ai",       "note": "EEG seizure detection (1W continuous wear) — AKIDA flagship use case"},
    {"id": "nanobot_pose_controller",   "kind": "edge_ai",       "note": "in-vivo actuation 4-state pose inference (sub-mW implant) — AKIDA niche"},
    {"id": "real_noise_vqe_future",     "kind": "quantum_vqe",   "qubits": 4,  "noise": "real",      "note": "(future) real-noise gate-model VQE — would route to IonQ via xeno"},
    {"id": "ft_quantum_future",         "kind": "quantum_vqe",   "qubits": 100,"noise": "noiseless", "note": "(future) >30-qubit fault-tolerant — vendor partnership, 10-year horizon"},
]


def _expand(p: str) -> str:
    return os.path.expanduser(p)


def _path_exists(p: str) -> bool:
    return os.path.exists(_expand(p))


def _xeno_present() -> bool:
    return _path_exists("~/core/xeno/bin/xeno") or _path_exists("~/core/xeno")


def route(workload: dict) -> str:
    for pred, sub in ROUTING_RULES:
        try:
            if pred(workload):
                return sub
        except KeyError:
            continue
    return "classical_cpu"  # ultimate fallback — nothing is ever un-routable


def readiness(sub: str) -> tuple[str, str, str]:
    """Returns (status, gating, fallback). status ∈ {ready, pending, unexplored, absent}."""
    info = SUBSTRATES[sub]
    present = info["probe"]()
    if not present:
        # substrate not present on this host → status reflects WHY (gating), fallback documented.
        # For substrates that are "ready if present", absence → "absent" (use fallback).
        # For "pending"/"unexplored" ones, absence is consistent with their non-ready status.
        base = info["readiness_if_present"]
        status = "absent" if base == "ready" else base
        return status, info["gating"] if base != "ready" else "(substrate not installed on this host — use fallback)", info["fallback"]
    return info["readiness_if_present"], info["gating"], info["fallback"]


def main() -> int:
    print("compute_substrate_routing — workload → substrate routing table + readiness check")
    print(f"  substrates: {len(SUBSTRATES)} ({', '.join(SUBSTRATES.keys())})")
    print(f"  routing rules: {len(ROUTING_RULES)} (first-match-wins, ultimate fallback = classical_cpu)")
    print(f"  representative workloads: {len(WORKLOADS)}")
    print()
    print("  ── routing decisions ──")

    issues = []
    for w in WORKLOADS:
        sub = route(w)
        status, gating, fallback = readiness(sub)
        # status icon
        icon = {"ready": "✅", "pending": "⏳", "unexplored": "🔬", "absent": "○"}[status]
        print(f"  {icon} {w['id']:<28} → {sub:<32} [{status}]")
        print(f"       {w['note']}")
        if status in ("pending", "unexplored", "absent"):
            print(f"       gating:   {gating}")
            print(f"       fallback: {fallback}")
        # (a) every workload must route to a known substrate
        if sub not in SUBSTRATES:
            issues.append(f"{w['id']}: routed to unknown substrate {sub!r}")
        # (b) every workload must have a non-empty fallback (the "|| none(fallback)" guarantee)
        if not fallback or fallback.strip() == "":
            issues.append(f"{w['id']} → {sub}: empty fallback (every substrate must degrade to *something*; even 'n/a — no workload routed here' is acceptable, but not empty)")
    print()

    # (c) self-consistency: classical_cpu must always be reachable + ready (the universal fallback)
    cpu_status, _, _ = readiness("classical_cpu")
    if cpu_status != "ready":
        issues.append(f"classical_cpu (universal fallback) is {cpu_status}, must be 'ready' — without it nothing is safe")

    # (d) every substrate must have all 4 fields
    for sub, info in SUBSTRATES.items():
        for field in ("desc", "probe", "readiness_if_present", "gating", "fallback"):
            if field not in info:
                issues.append(f"substrate {sub}: missing field {field!r}")
        if info["readiness_if_present"] not in ("ready", "pending", "unexplored"):
            issues.append(f"substrate {sub}: readiness_if_present = {info['readiness_if_present']!r} (not ready/pending/unexplored)")

    # (e) the "|| none(fallback)" invariant restated: no substrate absence ever produces a FAIL.
    #     This selftest itself is a routing-table consistency check, NOT a substrate-availability
    #     check — so it PASSes on a host with zero substrates installed.
    print("  ── readiness summary (this host) ──")
    from collections import Counter
    status_counts = Counter()
    for w in WORKLOADS:
        sub = route(w)
        s, _, _ = readiness(sub)
        status_counts[s] += 1
    for s in ("ready", "pending", "unexplored", "absent"):
        print(f"    {s:<11}: {status_counts.get(s, 0)} workload(s)")
    print(f"    → no substrate absence produces a FAIL; absent/pending workloads degrade to their documented fallback.")

    ok = (len(issues) == 0)
    print()
    if ok:
        print("__COMPUTE_SUBSTRATE_ROUTING__ PASS")
        return 0
    print("__COMPUTE_SUBSTRATE_ROUTING__ FAIL")
    for issue in issues:
        print(f"  issue: {issue}")
    return 1


if __name__ == "__main__":
    sys.exit(main())
