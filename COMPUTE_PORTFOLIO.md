# COMPUTE_PORTFOLIO.md — hexa-bio compute substrate portfolio (canonical single source)

> Canonical doc for the compute substrates hexa-bio can route workloads to.
> `AGENTS.md` / `XENO.md` / `README.md` should POINT here, not duplicate the
> substrate × workload × readiness matrix.

**Status (2026-05-12 cycle-30+++++++)**: 2 live substrates (qmirror state-vector,
qmirror chemistry-VQE H2), 1 live orchestrator (xeno status), N substrates
inventoried-but-not-workload-wired (xeno's 7-substrate roadmap), 1 documented
capability gap (qmirror chemistry-VQE for arbitrary drug molecules — needs a
classical-chemistry integral backend).

> **🔒 UNIVERSAL FALLBACK PRINCIPLE (load-bearing)**: *Every* compute substrate
> above is **optional**. A user with no qmirror, no xeno, no AKIDA hardware, no
> vendor account — never sees a FAIL. The pattern is always `use <substrate> CLI
> || none(fallback)`:
>   - qmirror absent → live VQE skipped; hexa-bio prints its Phase + falsifier
>     snapshot regardless (pure-hexa, `$0`)
>   - xeno absent → AKIDA / Loihi3 / IonQ workloads route to their CPU fallbacks
>     (RIsearch2 brute-force, standard ML inference, noiseless state-vector, etc.)
>   - AKIDA hardware absent → the 4 AKIDA edge-AI workloads use CPU (the AKIDA
>     path is a 1W accelerator, not a dependency)
>   - vendor quantum absent → qmirror ≤30q covers everything current; >30q is a
>     10-year horizon anyway
>   - the ultimate fallback is `classical_cpu` (numpy/scipy + pure-hexa selftests
>     + deterministic verifiers) — always available, the floor under everything.
>
> The hexa-bio CORE (σ/τ/φ/J₂ deductive verification 42/42, the 5-axis falsifier
> preregisters, the in-repo selftests) requires NONE of these substrates. They
> accelerate / extend; they do not gate. The readiness gates
> (`qmirror_chemistry_vqe_gate.sh`, `xeno_substrate_gate.sh`,
> `cmt_vqe_ladder_readiness.sh`, `akida_workload_readiness.sh`,
> `compute_substrate_routing.py`) all SKIP cleanly on a host with zero substrates
> installed — SKIP is honest, never a regression.

---

## §1 The two compute substrates

hexa-bio has **two** sister-repo compute substrates (CLI-direct, no Python
wrappers — per AGENTS.md sister-repo rules):

| Substrate | What it replaces | Live? | Canonical doc |
|---|---|---|---|
| **qmirror** ⚡ (`dancinlab/qmirror`) | IBM Cloud / IonQ / Quantinuum quantum-computer cloud APIs (≤30-qubit state-vector workloads) + ANU QRNG | ✅ yes (state-vector + chemistry-VQE H2) | [README.md](README.md) "Sister repositories" |
| **xeno** 🛸 (`dancinlab/xeno`) | exotic-compute hardware access (neuromorphic / organoid / quantum-gate / random) | ✅ yes (orchestrator `xeno status`); substrate-level workloads pending | [XENO.md](XENO.md) |

The split: **qmirror = quantum-computer SUBSTITUTE** (does the computation
itself, in pure-hexa state-vector simulation); **xeno = exotic-hardware
ORCHESTRATOR** (multiplexes access to real neuromorphic / organoid / gate
hardware, doesn't simulate them).

---

## §2 Substrate × hexa-bio-workload × readiness matrix

| Substrate | hexa-bio workload | ready? | gating constraint |
|---|---|---|---|
| **qmirror state-vector** (≤30 qubit) | `quantum` axis VQE — Mpro pocket (2e/2o → 2q), 5-warhead library, 11-drug pocket | ✅ **live** | — (all current quantum workloads ≤30 qubit) |
| **qmirror chemistry-VQE (pure-hexa)** | H2/STO-3G/0.74Å cond.14 spectroscopic-accuracy gate | ✅ **live** | — (gated by `selftest/qmirror_chemistry_vqe_gate.sh`) |
| **qmirror chemistry-VQE (+ classical PySCF backend)** | arbitrary drug-pocket VQE — CMT hd6/clc1/sar1/mfn2/gjb1 against HDAC6 / ClC-1 / SARM1 / MFN2 / Cx32 | ⏳ **PENDING** | needs a classical-chemistry integral backend (PySCF) to *build* the active-space Hamiltonian before the quantum solver runs — out of scope for the pure-hexa kernel (qmirror raw#10 caveat 1). Either re-introduce the retired python bridge (qiskit-nature + pyscf, the legacy `tests/mpro_pocket_vqe_v7.py` path) or extend qmirror chemistry_vqe with a `--with-pyscf` mode. Tracked as the F-Q-6-E ramp; see §4. |
| **xeno → AKIDA AKD1000** (BrainChip neuromorphic, 1W spike inference) | edge AI: `ribozyme` G26-RB-3 off-target Hamming scan / `nanobot` sub-mW actuation controller / `medical-device` EEG-EMG-ECG pattern recognition / `crispr-cas13-poc-diagnostic` lateral-flow signal classification | ⏳ **PENDING** | AKD1000 physical chip arrival (ordered 2026-04-29, ETA pending; AKIDA Cloud access live 2026-05-08) + xeno Phase 1.5 `falsifier` subcommand. Readiness probed by `selftest/akida_workload_readiness.sh` (SKIP until both land). |
| **xeno → Loihi3** (Intel neuromorphic) | well-founded-recursion / sequential workloads (no current hexa-bio mapping — speculative) | ⏳ **unexplored** | xeno roadmap (`.roadmap.loihi3`); no hexa-bio workload identified yet |
| **xeno → Northpole** (IBM neuromorphic) | (no current hexa-bio mapping) | ⏳ **unexplored** | xeno roadmap (`.roadmap.northpole`) |
| **xeno → FinalSpark organoid** (biological compute) | (potential: EEG/EMG training-data source for the AKIDA `medical-device` workload — DishBrain-Pong precedent) | ⏳ **unexplored** | xeno roadmap (`.roadmap.finalspark`); 3-layer design (organoid = data source, AKIDA = inference engine, hexa-bio = workload spec) — far-future |
| **xeno → Cortical Labs DishBrain** (biological compute) | (same as FinalSpark) | ⏳ **unexplored** | xeno roadmap (`.roadmap.cortical_labs`) |
| **xeno → IonQ** (trapped-ion quantum-gate) | real-noise gate-model VQE (Tier 4 quantum — when noise modeling needed) | ⏳ **unexplored** | xeno roadmap (`.roadmap.ionq`); needs a vendor account via xeno; distinct from qmirror state-vector (which is noiseless) |
| **xeno → QRNG** (quantum random number) | general entropy — randomized falsifier seeds (Monte Carlo enumeration, etc.) | ✅ **live** (via `xeno status`) | — (overlaps with qmirror's internal ANU QRNG; both usable as free entropy sources by hexa-bio) |

**Live now**: qmirror state-vector + qmirror chemistry-VQE H2 + xeno status + xeno QRNG.
**One key gap**: qmirror chemistry-VQE for arbitrary drug molecules (the CMT pocket VQE
blocker) — this is the highest-leverage compute upgrade for hexa-bio.
**Most pending items**: xeno's neuromorphic/organoid substrates — workload wiring
awaits xeno's own Phase 1.5+ (AKD1000 arrival, `falsifier` subcommand).

---

## §3 qmirror quantum-compute ladder (Tier 0-5)

Where hexa-bio's quantum workloads sit on the substitution ladder:

| Tier | Substrate | Capability | hexa-bio usage |
|---|---|---|---|
| **0** | numpy/scipy classical | ~10-qubit ceiling, slow | not used (qmirror Tier 1 beats it) |
| **1** | **qmirror pure-hexa state-vector** | ≤30 qubit, free, no vendor account, noiseless | ✅ **current** — all quantum workloads (Mpro pocket, 5-warhead library, 11-drug pocket) fit here |
| **2** | **qmirror + classical PySCF backend** | arbitrary-molecule active-space Hamiltonian construction, still ≤30 qubit | ⏳ **the gap** — CMT drug pockets (and any new-molecule pocket VQE) blocked here. F-Q-6-E ramp. See §4. |
| **3** | IBM Quantum (Heron 156q / Kookaburra 1386q / Flamingo 7000q) | real superconducting hardware, real noise, vendor cloud | not selected — no hexa-bio workload needs >30 qubit OR real noise yet |
| **4** | IonQ Forte 36q / Quantinuum H2 56q (**via xeno**) | real trapped-ion hardware, different noise profile | not selected — xeno has the bridge (`.roadmap.ionq`); use when noise modeling matters |
| **5** | fault-tolerant >1000 logical qubit (PsiQuantum / Google Willow) | error-corrected, post-threshold | 10-year horizon — vendor partnership, not procurement |

**Key observation**: hexa-bio's entire current quantum workload (Mpro pocket VQE
sub-µHa, 5-warhead library ranking, 11-drug pocket library) fits in Tier 1 (qmirror
pure-hexa, ≤30 qubit, free). The only gap is **Tier 2** — and it's not a qubit-count
gap, it's a Hamiltonian-CONSTRUCTION gap (the classical-chemistry preprocessing step,
not the quantum-solver step). qmirror's "양자컴퓨터 대용" claim is fully true for the
solver step; the construction step for arbitrary drug molecules needs PySCF.

---

## §4 The Tier-2 gap — qmirror chemistry-VQE classical backend (F-Q-6-E ramp)

**Problem precisely**: `qmirror/chemistry_vqe/module/chemistry_vqe.hexa` is a
pure-hexa kernel hardcoded for H2/STO-3G/0.74Å — a 5-term parity-mapped
Hamiltonian + FCI reference, extracted offline from qiskit-nature 0.7.2 +
pyscf 2.13.0. Per its raw#10 caveat 1: *"the active-space transformer + SMILES
+ drug-class paths require classical chemistry primitives (PySCF integrals,
RDKit geometry, CASCI) that are out of scope for a pure-hexa kernel"*.

**Why this blocks CMT (and any new-molecule pocket VQE)**: to run a VQE on a
drug-pocket Hamiltonian (e.g., HDAC6 catalytic site + hd6-001 ligand), you must
first:
1. Build the molecular geometry (RDKit / xyz)
2. Compute the 1-/2-electron integrals over a basis set (PySCF)
3. Reduce to an active space (CASCI / DMRG)
4. Map fermions → qubits (parity / Jordan-Wigner)
5. *Then* run the quantum solver (VQE — UCCSD ansatz + Pauli expectation + optimizer)

Steps 1-4 are classical chemistry. qmirror's pure-hexa kernel does step 5 (and the
hardcoded H2 case bakes in 1-4). For arbitrary molecules, 1-4 need a classical
backend.

**Resolution options** (qmirror-side work — NOT a hexa-bio change):
- **(a) re-introduce the retired python bridge** — `qiskit-nature + pyscf` via a
  `chemistry_vqe_runner.py` that qmirror's hexa kernel shells out to (the legacy
  `tests/mpro_pocket_vqe_v7.py` used `~/.hexabio_venv` for exactly this). Pro:
  proven path. Con: re-introduces a Python dependency qmirror Phase 10 deliberately
  retired.
- **(b) add a `--with-pyscf` mode to qmirror chemistry_vqe** — keep the pure-hexa
  kernel as default (H2 cond.14 gate), add an optional classical-backend mode that
  requires PySCF when invoked with `--molecule <SMILES>`. Pro: pure-hexa default
  stays; classical backend opt-in. Con: qmirror carries two code paths.
- **(c) precompute Hamiltonians offline + vendor them** — like the H2 case, extract
  the CMT drug-pocket active-space Hamiltonians offline (PySCF on a dev machine),
  vendor the constants into qmirror, run VQE on them with the pure-hexa kernel. Pro:
  no runtime Python. Con: only works for the specific pre-computed molecules; not
  general; CMT has ~10 candidates → ~10 vendored Hamiltonian files.

**Recommendation** (for qmirror's roadmap, not hexa-bio's): **(c) for the CMT
candidates specifically** (precompute ~10 active-space Hamiltonians offline, vendor
them — analogous to the H2 case), **and (b) as the general-purpose path** (`--with-pyscf`
mode for ad-hoc new molecules). hexa-bio's `cmt_vqe_ladder_readiness.sh` already
documents this gap; when qmirror lands (c), the readiness gate can flip from SKIP
to a real CMT-pocket-VQE PASS, and `.roadmap.disease_cmt_specific` §6 Tier 3 moves
from "DESIGN-AUDIT proxy" to "live VQE binding".

**This is the highest-leverage compute upgrade for hexa-bio** — it unblocks the
VQE-binding layer for CMT (and every future disease roadmap's small-molecule
candidates). It's a qmirror-repo task; hexa-bio's role is to keep the readiness
gate honest until it lands.

---

## §5 Routing logic (see `selftest/compute_substrate_routing.py`)

hexa-bio routes a workload to a substrate based on its characteristics:

```
workload-spec → substrate decision:
  qubit ≤ 30, gate-model, noiseless              → qmirror state-vector       [ready]
  chemistry VQE, H2/STO-3G canonical              → qmirror chemistry_vqe      [ready]
  chemistry VQE, arbitrary molecule               → qmirror chemistry_vqe+PySCF [PENDING — F-Q-6-E]
  spike pattern matching / edge AI                → xeno → AKIDA               [PENDING — AKD1000 + xeno P1.5]
  well-founded recursion / sequential             → xeno → Loihi3              [unexplored]
  random entropy                                  → qmirror QRNG | xeno QRNG   [ready]
  real-noise gate-model                           → xeno → IonQ                [unexplored — needs vendor account]
  qubit > 30, fault-tolerant                       → vendor partnership          [10-year horizon]
```

`selftest/compute_substrate_routing.py` encodes this as a deterministic table,
takes a workload spec (kind + qubit count + noise requirement + molecule type),
and emits both the substrate decision AND whether that substrate is `ready` /
`pending` / `unexplored` — so a future agent (or human) routing a new workload
knows immediately what they can run vs what's blocked on which dependency.

---

## §6 Cross-refs

- `XENO.md` — xeno (exotic compute orchestrator) detail; 7-substrate inventory
- `README.md` "Sister repositories" — qmirror + xeno + Floréa + hexa-brain + hexa-bot + hexa-matter
- `AGENTS.md` "Sister repositories" — operating rules (CLI-direct, no wrappers, gates not re-verifications)
- `selftest/qmirror_chemistry_vqe_gate.sh` — qmirror H2 cond.14 gate
- `selftest/xeno_substrate_gate.sh` — xeno status reachability gate
- `selftest/cmt_vqe_ladder_readiness.sh` — CMT pocket VQE readiness (the Tier-2 gap for CMT specifically)
- `selftest/akida_workload_readiness.sh` — AKIDA workload readiness probe
- `selftest/compute_substrate_routing.py` — the routing decision table
- `.roadmap.quantum` — quantum axis F-Q-* falsifier inventory + F-Q-6-E ramp
- `.roadmap.disease_cmt_specific` §6 — CMT Tier 3 (VQE binding) status
- qmirror repo: https://github.com/dancinlab/qmirror
- xeno repo: https://github.com/dancinlab/xeno

---

## §7 raw_91 honest C3

- "qmirror = 양자컴퓨터 대용" is true for the **quantum-solver** step (state-vector
  simulation of the VQE circuit) and for the canonical H2 chemistry-VQE case. It is
  NOT true for the **Hamiltonian-construction** step that precedes the solver for
  arbitrary drug molecules — that step needs classical chemistry (PySCF). The Tier-2
  gap (§4) is exactly this distinction.
- "xeno = exotic-compute orchestrator" is true at the **orchestration** level
  (`xeno status` works, 7 substrates inventoried, AKIDA Cloud access live). It is NOT
  yet true at the **workload-execution** level — hexa-bio has no AKIDA/Loihi3/organoid
  workload actually running; that awaits xeno's Phase 1.5+ (AKD1000 arrival,
  `falsifier` subcommand). The readiness gates (`akida_workload_readiness.sh`) are
  honest SKIPs, not pretend-PASSes.
- The substrate × workload × readiness matrix (§2) is the current snapshot. It will
  change as: (i) qmirror lands the PySCF backend (Tier 2), (ii) xeno's AKD1000 chip
  arrives + Phase 1.5 lands, (iii) new disease roadmaps add new molecule VQE workloads.
  This doc is the SSOT for "what compute can hexa-bio actually use right now".
