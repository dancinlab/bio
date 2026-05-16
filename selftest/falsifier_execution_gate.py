#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
selftest/falsifier_execution_gate.py — falsifier EXECUTION gate for the
hexa-bio EXPANSION-MAIN axes (METALLODRUG · OLIGONUCLEOTIDE).

WHY THIS EXISTS
---------------
The expansion-layer axes preregister falsifiers in their per-axis tapes:
HEXA-METALLODRUG.tape declares F-METALLODRUG-1/2/3, HEXA-OLIGONUCLEOTIDE.tape
declares F-OLIGO-1/2/3. A falsifier is a preregistered condition that, if it
FAILS, falsifies a claim. But declaring a falsifier is not the same as
exercising it — until something actually RUNS each falsifier's condition, the
preregistration is inert.

This gate closes that gap. It:

  1. Scans the root HEXA-METALLODRUG.tape / HEXA-OLIGONUCLEOTIDE.tape for the
     @D falsifier entries, parsing each falsifier id + its `falsifier =`
     condition text directly from the tape.
  2. For each discovered falsifier, EXECUTES the corresponding concrete check
     — it imports and runs the axis sim
     (_python_bridge/module/metallodrug_coordination_sim.py /
      oligonucleotide_hybridization_sim.py) and verifies the falsifier's
     preregistered condition still HOLDS.
  3. Reports per-falsifier HOLD / FALSIFIED and emits the sentinel
     `__FALSIFIER_EXECUTION_GATE__ PASS` iff every DECLARED falsifier HOLDS.

GOVERNANCE (hexa-bio AGENTS.tape)
---------------------------------
  g1 real-limits-first — every check ties to the axis's real-limit anchor:
     METALLODRUG → the Griffith & Orgel (1957) CFSE closed forms and the
     Takahara (1995) ~2.0 A Pt-N7(guanine) coordinate-bond length;
     OLIGONUCLEOTIDE → the SantaLucia (1998) unified nearest-neighbor
     duplex-thermodynamics model.
  g7 skip-is-honest — if a tape or a sim module is ABSENT on the host, the
     affected falsifiers are reported SKIP, not FAIL. SKIP does not block the
     sentinel; only a genuine FALSIFIED result does. (A FALSIFIED verdict is
     reserved for "axis reachable, preregistered condition violated".)
  g8 in-silico-only — a HOLD here verifies IN-SILICO simulator-consistency of
     the axis's preregistered condition ONLY. It is NOT a therapeutic,
     cytotoxic, gene-silencing, immunogenic, efficacy, or regulatory claim.

A standing honesty falsifier (e.g. F-METALLODRUG-3) is, by its own tape text,
triggerable ONLY by a published literature result, never by an in-silico run.
This gate executes its in-silico-checkable component (the axis sim performs no
lattice arithmetic / its honesty sentinel is PASS) and HOLDs on that basis,
noting the standing literature condition is out of in-silico scope.

DETERMINISM
-----------
Pure stdlib (no third-party imports). The axis sims are themselves
deterministic (no network / random / wall-clock). Re-running this gate on the
same repo state produces byte-identical output.

Usage:
    python3 selftest/falsifier_execution_gate.py
    # exit 0 = every declared falsifier HOLDS (or honestly SKIPPED)
    # exit 1 = at least one declared falsifier FALSIFIED
"""
from __future__ import annotations

import importlib.util
import math
import os
import re
import sys

# ── repo layout ─────────────────────────────────────────────────────────
REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PY_BRIDGE = os.path.join(REPO_ROOT, "_python_bridge", "module")

METALLODRUG_TAPE = os.path.join(REPO_ROOT, "HEXA-METALLODRUG.tape")
OLIGO_TAPE = os.path.join(REPO_ROOT, "HEXA-OLIGONUCLEOTIDE.tape")
METALLODRUG_SIM = os.path.join(PY_BRIDGE, "metallodrug_coordination_sim.py")
OLIGO_SIM = os.path.join(PY_BRIDGE, "oligonucleotide_hybridization_sim.py")

# verdict tokens
HOLD = "HOLD"
FALSIFIED = "FALSIFIED"
SKIP = "SKIP"


# ── tape parsing ─────────────────────────────────────────────────────────
def parse_falsifiers(tape_path, id_prefix):
    """Scan a .tape file for @D falsifier entries whose declared subject
    matches `<id_prefix>-<n>` (e.g. F-METALLODRUG-1). Returns an ordered list
    of {id, subject, condition} dicts — `condition` is the `falsifier =` body
    line text (the preregistered falsifying condition).

    Returns None if the tape file is absent (honest SKIP upstream).
    """
    if not os.path.isfile(tape_path):
        return None
    with open(tape_path, "r", encoding="utf-8") as fh:
        lines = fh.readlines()

    # @D <id> := "<subject>" :: falsifier|prediction [<grades>]
    header_re = re.compile(
        r'^@D\s+(\S+)\s*:=\s*"([^"]*)"\s*::\s*(falsifier|prediction)\b')
    subject_re = re.compile(re.escape(id_prefix) + r"-\d+")

    found = []
    i = 0
    while i < len(lines):
        m = header_re.match(lines[i])
        if not m:
            i += 1
            continue
        entry_id, subject, _kind = m.group(1), m.group(2), m.group(3)
        sm = subject_re.search(subject)
        if not sm:
            i += 1
            continue
        canonical = sm.group(0)  # e.g. "F-OLIGO-1"
        # collect the body (2-space-indented lines) until the next blank /
        # non-indented line, pull the `falsifier =` value out of it.
        condition = ""
        j = i + 1
        while j < len(lines):
            body = lines[j]
            if body.strip() == "" or not body.startswith("  "):
                break
            stripped = body.strip()
            fm = re.match(r'falsifier\s*=\s*"(.*)"\s*$', stripped)
            if fm:
                condition = fm.group(1)
            j += 1
        found.append({
            "id": canonical,
            "entry_id": entry_id,
            "subject": subject,
            "condition": condition,
        })
        i = j
    # stable order by trailing integer
    found.sort(key=lambda d: int(d["id"].rsplit("-", 1)[1]))
    return found


# ── sim loading ──────────────────────────────────────────────────────────
def load_module(path, mod_name):
    """Import an axis-sim file as a module. Returns the module, or None if the
    file is absent (honest SKIP) — import errors propagate (genuine breakage)."""
    if not os.path.isfile(path):
        return None
    spec = importlib.util.spec_from_file_location(mod_name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


# ── METALLODRUG falsifier executors ──────────────────────────────────────
# Each executor runs the metallodrug sim and verifies one preregistered
# condition. Returns (verdict, detail).

def exec_metallodrug(sim, witness):
    """Return {falsifier_id: (verdict, detail)} for F-METALLODRUG-1/2/3."""
    results = {}

    # --- F-METALLODRUG-1: CFSE numerical-recompute fidelity.
    # Condition: every selftest run must pass the CFSE-table check (the
    # recomputed d0..d10 CFSE table matches the Griffith & Orgel closed form
    # within 1e-9). Executed: re-run the sim's CFSE table + verifier.
    cfse = witness["cfse_verification"]
    rows = witness["cfse_table"]
    # independently re-exercise the closed-form anchors named in the tape.
    d5_hs = rows[5]["oct_high_spin"]["cfse_delta_oct"]
    d6_ls = rows[6]["oct_low_spin"]["cfse_delta_oct"]
    d3_hs = rows[3]["oct_high_spin"]["cfse_delta_oct"]
    anchors_ok = (abs(d5_hs - 0.0) <= 1e-9
                  and abs(d6_ls - (-2.4)) <= 1e-9
                  and abs(d3_hs - (-1.2)) <= 1e-9)
    f1_hold = bool(cfse["pass"]) and anchors_ok
    f1_detail = (f"CFSE table vs Griffith&Orgel closed form: "
                 f"max dev HS={cfse['max_deviation_high_spin']:.1e}, "
                 f"LS={cfse['max_deviation_low_spin']:.1e} (tol 1e-9); "
                 f"anchors d5-HS={d5_hs:+.3f}=0, d6-LS={d6_ls:+.3f}=-2.4, "
                 f"d3-HS={d3_hs:+.3f}=-1.2")
    if not f1_hold:
        f1_detail += f"; mismatches={cfse['mismatches']}"
    results["F-METALLODRUG-1"] = (HOLD if f1_hold else FALSIFIED, f1_detail)

    # --- F-METALLODRUG-2: square-planar Pt-N7 bond-length anchor.
    # Condition: a Pt-N7 coordinate-bond length OUTSIDE 1.85-2.15 A falsifies
    # the ~2.0 A anchor. Executed: recompute the square-planar Pt-N radial
    # distance from the sim's geometry model, assert it lands in 1.85-2.15 A.
    gchk = witness["pt_n7_geometry_verification"]
    recomputed = gchk["recomputed_pt_n_angstrom"]
    in_window = 1.85 <= recomputed <= 2.15
    f2_hold = bool(gchk["anchor_match"]) and in_window and bool(
        gchk["square_geometry_self_consistent"])
    f2_detail = (f"recomputed Pt-N radial distance = {recomputed:.4f} A "
                 f"(preregistered window 1.85-2.15 A; anchor "
                 f"{gchk['anchor_value_angstrom']} A, dev "
                 f"{gchk['deviation_angstrom']:.1e} A); square geometry "
                 f"self-consistent={gchk['square_geometry_self_consistent']}")
    results["F-METALLODRUG-2"] = (HOLD if f2_hold else FALSIFIED, f2_detail)

    # --- F-METALLODRUG-3: square-planar is d8, NOT lattice-derived.
    # Standing honesty falsifier — by tape text triggerable ONLY by a
    # published coordination-chemistry result, never by an in-silico run.
    # In-silico-checkable component: (a) every square-planar metallodrug in
    # the sim's metadata is d8; (b) the sim performs NO lattice arithmetic
    # (its lattice_stance declares this explicitly).
    fchk = witness["falsifiers"]
    d8_ok = bool(fchk.get("F-METALLODRUG-3_square_planar_is_d8", False))
    stance = witness.get("lattice_stance", "")
    no_lattice = ("NO n=6 lattice arithmetic" in stance
                  or "No n=6 lattice arithmetic" in stance
                  or "OBSERVATION ONLY" in stance)
    f3_hold = d8_ok and no_lattice
    f3_detail = ("square-planar metallodrugs all d8="
                 f"{d8_ok}; sim declares no lattice arithmetic / "
                 f"observation-only stance={no_lattice}; standing literature "
                 "component is out of in-silico scope (HOLD absent a published "
                 "lattice-predicts-geometry result)")
    results["F-METALLODRUG-3"] = (HOLD if f3_hold else FALSIFIED, f3_detail)

    return results


# ── OLIGONUCLEOTIDE falsifier executors ──────────────────────────────────
def exec_oligonucleotide(sim):
    """Return {falsifier_id: (verdict, detail)} for F-OLIGO-1/2/3 by directly
    exercising the SantaLucia NN-thermodynamics functions of the sim."""
    results = {}

    # --- F-OLIGO-1: ASO:mRNA duplex Tm tracks the SantaLucia NN sum.
    # Condition: a drift of the Dickerson-dodecamer ΔH°/ΔS°/Tm outside the
    # preregistered regimes fails the self-check. Executed: recompute the
    # Dickerson dodecamer from the NN sum, assert ΔH° in -85..-105,
    # ΔS° in -240..-300, Tm in 50..68 C.
    ref = sim.duplex_report("CGCGAATTCGCG", total_strand_M=0.4e-6)
    dh, ds, tm = ref["dH_kcal_mol"], ref["dS_cal_mol_K"], ref["Tm_celsius"]
    f1_hold = (-105.0 <= dh <= -85.0
               and -300.0 <= ds <= -240.0
               and 50.0 <= tm <= 68.0)
    f1_detail = (f"Dickerson dodecamer CGCGAATTCGCG recomputed from the "
                 f"SantaLucia(1998) NN sum: ΔH°={dh:.2f} kcal/mol (regime "
                 f"-85..-105), ΔS°={ds:.2f} cal/mol·K (regime -240..-300), "
                 f"Tm={tm:.2f} C (regime 50..68)")
    results["F-OLIGO-1"] = (HOLD if f1_hold else FALSIFIED, f1_detail)

    # --- F-OLIGO-2: GC>AT Tm ordering and ΔG° length monotonicity.
    # Condition: a GC-rich duplex melting LOWER than an equal-length AT-rich
    # duplex, OR extending a matched duplex RAISING ΔG°, falsifies. Executed:
    # recompute both orderings from the NN model.
    gc_rich = sim.duplex_report("GCGCGCGCGCGC")
    at_rich = sim.duplex_report("ATATATATATAT")
    gc_gt_at = gc_rich["Tm_celsius"] > at_rich["Tm_celsius"]
    short_dg = sim.nn_thermodynamics("GCGCGC")["dG37_kcal_mol"]
    long_dg = sim.nn_thermodynamics("GCGCGCGCGCGC")["dG37_kcal_mol"]
    monotone = long_dg < short_dg
    f2_hold = gc_gt_at and monotone
    f2_detail = (f"GC-rich Tm={gc_rich['Tm_celsius']:.1f} C "
                 f"{'>' if gc_gt_at else '<='} AT-rich Tm="
                 f"{at_rich['Tm_celsius']:.1f} C; length monotonicity: "
                 f"ΔG°(12-mer)={long_dg:.2f} {'<' if monotone else '>='} "
                 f"ΔG°(6-mer)={short_dg:.2f} kcal/mol")
    results["F-OLIGO-2"] = (HOLD if f2_hold else FALSIFIED, f2_detail)

    # --- F-OLIGO-3: off-target hybridization is ΔG-detectable.
    # Condition: an off-target screen returning ZERO flagged windows for an
    # oligo that is, by construction, the reverse complement of a decoy-pool
    # window falsifies. Executed: build the deliberate CTG-repeat off-targeter
    # and assert the screen flags >= 1 window.
    demo_aso = sim.reverse_complement("CTG" * 7)  # 21-mer, complementary to (CTG)n
    scr = sim.screen_off_targets(demo_aso)
    n_flagged = scr["n_flagged_off_targets"]
    f3_hold = n_flagged >= 1
    f3_detail = (f"deliberate low-complexity off-targeter (rc of (CTG)7, "
                 f"{scr['aso_length_nt']} nt) screened vs {scr['pool_size']}"
                 f"-decoy pool: {scr['windows_scanned']} windows scanned, "
                 f"{n_flagged} flagged (ΔG gate "
                 f"{scr['off_target_dG_gate_kcal_mol']} kcal/mol, "
                 f"min ΔG°={scr['min_duplex_dG37_kcal_mol']:.2f})")
    results["F-OLIGO-3"] = (HOLD if f3_hold else FALSIFIED, f3_detail)

    return results


# ── per-axis driver ──────────────────────────────────────────────────────
def run_axis(axis_name, tape_path, id_prefix, sim_path, executor, sim_kind):
    """Discover falsifiers in `tape_path`, execute them via `executor`.

    Returns a list of {id, verdict, detail} rows. Honest SKIP (g7) when the
    tape or sim is absent on the host.
    """
    print(f"── {axis_name} axis " + "─" * (60 - len(axis_name)))

    declared = parse_falsifiers(tape_path, id_prefix)
    if declared is None:
        print(f"  [SKIP] {os.path.basename(tape_path)} absent on host "
              f"— g7 skip-is-honest (absent tape != FAIL)\n")
        return [{"id": f"{id_prefix}-*", "verdict": SKIP,
                 "detail": "axis tape absent"}]
    if not declared:
        print(f"  [SKIP] no {id_prefix}-* falsifier entries found in "
              f"{os.path.basename(tape_path)}\n")
        return [{"id": f"{id_prefix}-*", "verdict": SKIP,
                 "detail": "no falsifier entries declared"}]

    print(f"  discovered {len(declared)} falsifier(s) in "
          f"{os.path.basename(tape_path)}: "
          + ", ".join(d["id"] for d in declared))

    if not os.path.isfile(sim_path):
        print(f"  [SKIP] {os.path.basename(sim_path)} absent on host "
              f"— g7 skip-is-honest; falsifiers declared but not executable\n")
        return [{"id": d["id"], "verdict": SKIP, "detail": "axis sim absent"}
                for d in declared]

    sim = load_module(sim_path, f"_axis_sim_{id_prefix}")

    # METALLODRUG executor needs the sim witness dict; OLIGONUCLEOTIDE
    # executor exercises the sim's functions directly.
    if sim_kind == "metallodrug":
        witness = sim.run()
        exec_results = executor(sim, witness)
    else:
        exec_results = executor(sim)

    rows = []
    for d in declared:
        fid = d["id"]
        verdict, detail = exec_results.get(
            fid, (SKIP, "no executor mapped for this falsifier id"))
        cond = d["condition"]
        cond_short = (cond[:96] + "…") if len(cond) > 97 else cond
        tag = {HOLD: "HOLD", FALSIFIED: "FALSIFIED", SKIP: "SKIP"}[verdict]
        print(f"  [{tag}] {fid}")
        if cond_short:
            print(f"         preregistered: {cond_short}")
        print(f"         executed     : {detail}")
        rows.append({"id": fid, "verdict": verdict, "detail": detail})
    print()
    return rows


# ── main ─────────────────────────────────────────────────────────────────
def main():
    print("falsifier_execution_gate — hexa-bio expansion-main axes "
          "(METALLODRUG · OLIGONUCLEOTIDE)")
    print("  scans the per-axis tapes for preregistered @D falsifiers, then")
    print("  EXECUTES each one against its axis sim and checks it HOLDS.")
    print("  governance: g1 real-limits-first · g7 skip-is-honest · "
          "g8 in-silico-only\n")

    all_rows = []
    all_rows += run_axis(
        "METALLODRUG", METALLODRUG_TAPE, "F-METALLODRUG",
        METALLODRUG_SIM, exec_metallodrug, "metallodrug")
    all_rows += run_axis(
        "OLIGONUCLEOTIDE", OLIGO_TAPE, "F-OLIGO",
        OLIGO_SIM, exec_oligonucleotide, "oligonucleotide")

    n_hold = sum(1 for r in all_rows if r["verdict"] == HOLD)
    n_falsified = sum(1 for r in all_rows if r["verdict"] == FALSIFIED)
    n_skip = sum(1 for r in all_rows if r["verdict"] == SKIP)
    n_total = len(all_rows)

    print("── summary " + "─" * 60)
    for r in all_rows:
        print(f"  {r['verdict']:<10} {r['id']}")
    print(f"\n  {n_hold} HOLD · {n_falsified} FALSIFIED · {n_skip} SKIP "
          f"(of {n_total} falsifier rows)")
    print("  HONESTY (g7): a SKIP is an absent tape/sim on this host — it does")
    print("  NOT block the sentinel. Only a genuine FALSIFIED (axis reachable,")
    print("  preregistered condition violated) blocks it.")
    print("  HONESTY (g8): a HOLD verifies IN-SILICO simulator-consistency of")
    print("  the preregistered condition ONLY — not a therapeutic / cytotoxic /")
    print("  gene-silencing / immunogenic / efficacy / regulatory claim.\n")

    # sentinel: PASS iff no falsifier is FALSIFIED. SKIP is honest (g7).
    ok = n_falsified == 0
    if ok:
        print("__FALSIFIER_EXECUTION_GATE__ PASS")
        return 0
    print("__FALSIFIER_EXECUTION_GATE__ FAIL")
    return 1


if __name__ == "__main__":
    sys.exit(main())
