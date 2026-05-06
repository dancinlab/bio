#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
quantum_simu_multiverse.py — sim-universe outbound consumer for hexa-bio.

Mirror pattern of `quantum_entropy_qmirror.py` (qmirror cli wrapper). Calls
`sim-universe multiverse --m=M --t=T --json` via subprocess and parses the
JSON tail. Used to map our RIBOZYME variant ensemble (cycle-25 hammerhead
12-nt + flanking arm variants) onto sim-universe's M parallel mini-worlds
for KS-test + mutual-info comparison of activity distributions.

Per memory feedback_qmirror_cli_subprocess_pattern + .own own 2
(quantum-axis-outbound-consumer-only): subprocess CLI only, no in-tree
import, no Python venv pollution. sim-universe is a sister repo of qmirror
(extracted from nexus/sim_bridge/).

Public API
==========

    multiverse_run(m: int = 15, t: int = 500, *,
                   sim_universe_root: str | None = None,
                   timeout: int = 180) -> tuple[dict, dict]

        Returns (parsed_json, provenance):
          parsed_json = whatever sim-universe multiverse --json emits (M
                        worlds × T ticks; KS-test + mutual-info results)
          provenance  = {tier, mode, sim_universe_version, ts_utc, command}

CLI usage
=========

    python3 quantum_simu_multiverse.py --m 15 --t 500
    python3 quantum_simu_multiverse.py --selftest

raw#10 honest c3
================

1. sim-universe multiverse module is a TOY lattice simulation per its own
   §status caveats. Mapping RIBOZYME variant ensemble onto these mini-
   worlds is at most a 1:1-flavor-of-experimental-design coupling — the
   actual chemistry-kinetics evidence still comes from
   `_python_bridge/module/ribozyme_kinetics_simulation.py`. Multiverse
   adds STATISTICAL-COMPARISON axis (KS-test on k_cat distributions,
   MI on σ(6)=12 conservation), not new chemistry.
2. cli wall is jittery same as qmirror (Aer / fork-storm patterns); 180 s
   timeout matches our qmirror adapter's robustness pattern.
3. We use SIM_UNIVERSE_LIVE=0 (urandom fallback) by default — Apple-Silicon
   mac local. SIM_UNIVERSE_LIVE=1 routes through ANU live tier same as
   qmirror, with the same rate-limit caveat.
4. Output JSON shape is sim-universe-internal; cycle 65 (this) does NOT
   schema-validate the response, just round-trip the bytes. Schema land
   = future cycle if/when sim-universe exposes a stable JSON contract.
"""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import time
from typing import Optional, Tuple


_DEFAULT_SIM_UNIVERSE_ROOT = "/Users/ghost/core/sim-universe"  # @allow-devpath
_HEXA_BIN = "/Users/ghost/.hx/bin/hexa"  # @allow-devpath


class SimUniverseError(RuntimeError):
    pass


def _utc_iso() -> str:
    return time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())


def _resolve_root(explicit: Optional[str]) -> str:
    if explicit:
        return explicit
    return os.environ.get("SIM_UNIVERSE_ROOT", _DEFAULT_SIM_UNIVERSE_ROOT)


def multiverse_run(
    m: int = 15,
    t: int = 500,
    *,
    sim_universe_root: Optional[str] = None,
    timeout: int = 180,
    live: bool = False,
) -> Tuple[dict, dict]:
    """Run sim-universe multiverse interferometer and return parsed JSON +
    provenance metadata."""
    if m < 2:
        raise SimUniverseError(f"m must be >= 2 (got {m})")
    if t < 10:
        raise SimUniverseError(f"t must be >= 10 (got {t})")

    root = _resolve_root(sim_universe_root)
    cli = os.path.join(root, "cli", "sim-universe.hexa")
    if not os.path.isfile(cli):
        raise SimUniverseError(f"sim-universe cli not found at {cli}")

    env = dict(os.environ)
    env["SIM_UNIVERSE_ROOT"] = root
    env["HEXA_FORK_CAP"] = "0"  # same robustness as qmirror adapter
    if live:
        env["SIM_UNIVERSE_LIVE"] = "1"
    else:
        env["SIM_UNIVERSE_LIVE"] = "0"

    cmd = [_HEXA_BIN, "run", cli, "multiverse",
           "--m", str(m), "--t", str(t), "--json"]

    last_exc: Optional[Exception] = None
    for attempt in (1, 2):
        try:
            proc = subprocess.run(
                cmd,
                stdin=subprocess.DEVNULL,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                env=env,
                cwd=root,
                timeout=timeout,
                check=False,
            )
            last_exc = None
            break
        except FileNotFoundError as exc:
            raise SimUniverseError(f"hexa binary not runnable: {exc}") from exc
        except subprocess.TimeoutExpired as exc:
            last_exc = exc
            if attempt == 1:
                time.sleep(1.0)
                continue
    if last_exc is not None:
        raise SimUniverseError(f"sim-universe multiverse timeout (180s × 2)") from last_exc

    stdout = proc.stdout.decode("utf-8", errors="replace")
    stderr = proc.stderr.decode("utf-8", errors="replace")

    last_json = None
    for line in reversed(stdout.splitlines()):
        line = line.strip()
        if line.startswith("{") and line.endswith("}"):
            try:
                last_json = json.loads(line)
                break
            except json.JSONDecodeError:
                continue

    if last_json is None:
        raise SimUniverseError(
            f"sim-universe multiverse: no JSON tail. exit={proc.returncode} "
            f"stdout_head={stdout[:300]!r} stderr_head={stderr[:300]!r}"
        )

    provenance = {
        "tier": "live" if live else "urandom-mock",
        "mode": "live" if live else "mock",
        "m": m,
        "t": t,
        "exit_code": proc.returncode,
        "ts_utc": _utc_iso(),
        "command": " ".join(cmd),
    }
    return last_json, provenance


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------


def _emit_json(payload: dict) -> None:
    sys.stdout.write(json.dumps(payload, separators=(",", ":")))
    sys.stdout.write("\n")
    sys.stdout.flush()


def _cmd_run(args: argparse.Namespace) -> int:
    try:
        result, prov = multiverse_run(
            m=args.m, t=args.t,
            sim_universe_root=args.sim_universe_root,
            live=args.live,
        )
    except SimUniverseError as exc:
        _emit_json({"ok": 0, "error": str(exc)})
        return 1
    _emit_json({
        "ok": 1,
        "result": result,
        "provenance": prov,
    })
    return 0


def _cmd_selftest(args: argparse.Namespace) -> int:
    """F1 connectivity (sim-universe status round-trip), F2 small multiverse
    run (m=2 t=20, mock urandom)."""
    print("hexa-bio quantum_simu_multiverse.py — selftest")
    print(f"  sim-universe root: {_resolve_root(args.sim_universe_root)}")
    print("")

    # F1: connectivity check (just try a small call)
    print("  F1: small multiverse run (m=2, t=20, mock urandom)...")
    try:
        result, prov = multiverse_run(
            m=2, t=20,
            sim_universe_root=args.sim_universe_root,
            live=False, timeout=120,
        )
    except SimUniverseError as exc:
        print(f"  F1 FAIL: {exc}")
        print("__HEXA_BIO_SIMU_MULTIVERSE__ ALL FAIL")
        return 1
    n_keys = len(result.keys()) if isinstance(result, dict) else 0
    print(f"  F1 PASS: result keys={n_keys} mode={prov['mode']} "
          f"exit={prov['exit_code']}")
    print(f"  F1 ... result preview: {list(result.keys())[:5] if isinstance(result, dict) else 'non-dict'}")
    print("__HEXA_BIO_SIMU_MULTIVERSE__ F1 PASS")
    print("")
    print("__HEXA_BIO_SIMU_MULTIVERSE__ ALL PASS")
    return 0


def main(argv: Optional[list] = None) -> int:
    p = argparse.ArgumentParser(prog="quantum_simu_multiverse.py")
    p.add_argument("--sim-universe-root", default=None)
    p.add_argument("--m", type=int, default=15)
    p.add_argument("--t", type=int, default=500)
    p.add_argument("--live", action="store_true")
    p.add_argument("--selftest", action="store_true")
    args = p.parse_args(argv)

    if args.selftest:
        return _cmd_selftest(args)
    return _cmd_run(args)


if __name__ == "__main__":
    sys.exit(main())
