# XENO.md — xeno 🛸 dependency (canonical single source)

> Canonical doc for hexa-bio's xeno integration. All other docs
> (`AGENTS.md`, `README.md`, etc.) should POINT here, not duplicate.

**Status (2026-05-12 cycle-30++++++)**: gate landed (PASS on this host);
no workload wiring yet (Phase 1.5 xeno-side `falsifier` subcommand
pending).

---

## §1 What xeno is

`dancinlab/xeno` (locally `~/core/xeno`, https://github.com/dancinlab/xeno)
is the **exotic compute substrate orchestrator** for the HEXA family.
Tier C scope — non-GPU substrates that don't fit qmirror's
quantum-computer substitute role.

**NOT a single-substrate driver**: xeno multiplexes 7 substrate
roadmaps:

| Substrate | Vendor / source | Type |
|---|---|---|
| **AKIDA AKD1000** | BrainChip | silicon neuromorphic (1W spike inference) |
| **Loihi3** | Intel | silicon neuromorphic |
| **Northpole** | IBM | silicon neuromorphic |
| **FinalSpark** | FinalSpark | biological organoid compute |
| **Cortical Labs DishBrain** | Cortical Labs | biological substrate |
| **IonQ** | IonQ | quantum-gate (distinct from qmirror state-vector sim) |
| **QRNG** | (various) | quantum random number (distinct from ANU QRNG in qmirror) |

xeno is at Phase 1+ (AKIDA Cloud access live 2026-05-08; AKD1000
physical chip ordered 2026-04-29 ETA pending). Other substrates have
their own roadmap status — see `~/core/xeno/roadmaps/.roadmap.<substrate>`.

---

## §2 Architectural pattern (parallels qmirror)

```
hexa-bio (workload definition — which biology problem)
   ↓ CLI invocation
xeno (compute substrate orchestration — which exotic substrate)
   ↓ AKIDA Cloud SSH / AKD1000 physical / Loihi3 / etc.
exotic hardware
```

**Separation of concerns**:
- hexa-bio defines **WHICH biology problem** needs neuromorphic /
  organoid / quantum-gate compute
- xeno picks **WHICH substrate** is appropriate + manages access
- exotic hardware does the actual computation

This parallels the qmirror pattern (qmirror = ≤30-qubit quantum-computer
substitute; xeno = exotic-compute orchestrator for non-quantum substrates).

---

## §3 Gate integration

**File**: [`selftest/xeno_substrate_gate.sh`](selftest/xeno_substrate_gate.sh)
**Wired in**: [`selftest/run_all.sh`](selftest/run_all.sh) as `xeno_substrate_gate`
**Sentinel**: `__XENO_SUBSTRATE__ PASS|SKIP|FAIL`

### Semantics

| Exit code | Sentinel | Meaning |
|---|---|---|
| 0 | PASS | `xeno status` returned 0 (reachable + sister bridges healthy) |
| 91 → 0 | SKIP | xeno's raw_91 honest C3 fail-loud (a sister bridge failed); not a hexa-bio regression |
| 124 → 0 | SKIP | `xeno status` timeout (30s) — hung process |
| (binary missing) → 0 | SKIP | xeno CLI not installed on this host |
| other | FAIL | xeno reachable but `status` non-zero (real regression) |

### Env

- `XENO_ROOT` — override repo root (default `$HOME/core/xeno`)
- `XENO_BIN` — override binary (default `$XENO_ROOT/bin/xeno`)

### What the gate does NOT do

- Does NOT run substrate selftests (AKIDA spike fidelity, Loihi3 spike
  rate, etc.) — that's xeno's job; Phase 1.5 `xeno falsifier` subcommand
  will expose substrate-level verification, and the gate can switch
  to call that.
- Does NOT verify physical hardware presence — AKIDA Cloud access is
  sufficient for pre-arrival pipeline validation; physical chip ETA is
  a separate xeno-side milestone.

---

## §4 Potential hexa-bio workloads (not currently wired)

Identified neuromorphic / spike-based / edge-AI fits — none wired yet;
they are deferred per `AGENTS.md` external-contact deferral policy
(workload wiring requires xeno-side `falsifier` Phase 1.5 + AKIDA
hardware in hand).

| Axis | Workload | Why AKIDA fits |
|---|---|---|
| **crispr-cas13-poc-diagnostic** | lateral-flow Au-NP capture-line signal classification on-device | 1W edge AI on POC device (designed niche) |
| **medical-device** | EEG seizure / EMG / ECG arrhythmia / glucose pattern recognition | 1W continuous wear; spike-based biosignal processing |
| **ribozyme** (G26-RB-3) | off-target Hamming pattern matching across GENCODE v47 (~106k transcripts × 28nt) | spike pattern-matching accelerates current CPU brute-force RIsearch2 |
| **nanobot** | sub-mW in-vivo actuation pose controller | 4-state actuation real-time inference, sub-mW class |

Other axes:
- **quantum** — N/A (qmirror handles this niche)
- **weave** — N/A (formal/mathematical; no compute substrate)
- **virocapsid** — borderline (cryo-EM micrograph T-number classification
  is typical CPU/GPU territory; spike inference adds limited value)

---

## §5 Why CLI-direct, not Python wrapper

xeno is **continuously updated** (its own Phase 1..N landing track). A
Python adapter inside hexa-bio would:
- Freeze the xeno surface at the moment of writing
- Drift as xeno evolves
- Require hexa-bio re-edits for every xeno API change

CLI invocation picks up upstream changes automatically without hexa-bio
re-edit (mirrors the qmirror pattern + AGENTS.md sister-repo rule #2:
"CLI integration over Python wrappers").

---

## §6 Cross-refs

- Gate: [`selftest/xeno_substrate_gate.sh`](selftest/xeno_substrate_gate.sh)
- Wiring: [`selftest/run_all.sh`](selftest/run_all.sh) line ~53
- Sister-repo policy: [`AGENTS.md`](AGENTS.md) §"Sister repositories"
  + §"External-contact deferral policy"
- xeno repo: https://github.com/dancinlab/xeno
- xeno local: `~/core/xeno`
- xeno entry: `~/core/xeno/bin/xeno` (bash) + `~/core/xeno/cli/run.hexa`
- xeno roadmaps: `~/core/xeno/roadmaps/.roadmap.{akida,loihi3,northpole,finalspark,cortical_labs,ionq,qrng}`
- AKIDA Cloud signup guide: `~/core/xeno/docs/anima_physics_origin/akida_cloud_signup_guide.md`
- Sister of xeno (related): `dancinlab/qmirror` — quantum-computer
  substitute (≤30 qubits); see [`README.md`](README.md) "Sister repositories"
  for qmirror dependency.

---

## §7 raw_91 honest C3

- xeno is xeno's responsibility, not hexa-bio's. hexa-bio's role is the
  workload (which biology problem), the gate (PASS/SKIP/FAIL on
  reachability), and the witness emission ("xeno OK @ this commit").
- Substrate-level verification (AKIDA spike fidelity, Loihi3 spike-rate
  accuracy, organoid biological state, etc.) is xeno's job.
- Workload wiring (point a specific hexa-bio axis at AKIDA via xeno) is
  deferred — requires xeno Phase 1.5 `falsifier` subcommand + AKIDA
  hardware in hand. Not in scope for this doc.
