# COMPUTE_PORTFOLIO.md — hexa-bio compute substrate portfolio (canonical single source)

> Canonical doc for the compute substrates hexa-bio can route workloads to.
> `AGENTS.md` / `XENO.md` / `README.md` should POINT here, not duplicate the
> substrate × workload × readiness matrix.

**Status (2026-05-14 cycle-30++++++++)**: live substrates expanded to qmirror
state-vector + qmirror chemistry-VQE at SIX tiers (4e/6o landed 2026-05-14) — H2 (cond.14, pure-hexa),
**all 5 CMT scaffolds at 2e/2o (pure-hexa UCCSD)**, **all 6 molecules (LiH+5 CMT)
at 4e/4o (vendored ψ* replay)**, **Ramp B externalized variational closure on
LiH 4e/4o** (pure-hexa physics + stdlib-Python NM driver → Δ=494.8 µHa, 3×
under chem-acc bound, 5.7-min wall @ maxiter=5), **Ramp B IN-PROCESS variational
closure 6/6 at 4e/4o** (LiH + 5 CMT via hexa-lang RFC 034 whole-loop Pauli C
kernels + RFC 035 whole-NM-step C kernels — gjb1 only —, Δ 11.7–274 µHa, ~10–18 s
wall per scaffold), and **Ramp B-2 4e/5o (8-qubit) full NM closure 6/6** (LiH
790 µHa + clc1 457 / sar1 630 / mfn2 311 / hd6 15 µHa @ maxiter=500 + gjb1
40.27 µHa @ maxiter=4000 stretch / 305 s wall — RFC 036 `farr_int_array`
removes the `HEXA_MEM_CAP_MB=2048` env-hatch dependency); +**ADAPT-VQE** (LiH
4e/4o 0.043 µHa, K=10 ops, 62% param-reduction vs UCCSD-26) +**k-UpCCGSD**
(LiH 4e/4o 344 µHa plateau, strict-subspace ceiling); 1 live orchestrator
(xeno status), N substrates inventoried-but-not-workload-wired (xeno's
7-substrate roadmap). The original Tier-2 gap (non-H2 chemistry-VQE) is now
realized at six sub-tiers + 2 ansatz alternatives — see §4. Latest:
**Ramp B-3 4e/6o (10-qubit) 6/6 in-process closed 2026-05-14** (lih 272 /
clc1 403 / sar1 440 / mfn2 122 / hd6 5.55 / gjb1 1090 µHa @
HEXA_MEM_UNLIMITED=1; offline extraction 21 h + in-process gate 24 min).
Open ramps: 4e/7o-12q+ active-space tier / final-molecule geometries /
pocket-embedded QM/MM-VQE.

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
| **qmirror chemistry-VQE — CMT scaffolds, 2e/2o tier** (vendored Hamiltonians) | non-H2 molecular VQE — the 5 CMT candidate scaffolds (hxq-cmt-{clc1,sar1,mfn2,hd6,gjb1}-001) at a STO-3G HOMO/LUMO 2e/2o active space → 2-qubit UCCSD VQE vs CASCI(2,2) | ✅ **live (2e/2o tier) 2026-05-13** | `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_hamiltonians.hexa` — vendored 2e/2o parity-mapped Hamiltonians + CASCI(2,2) refs (offline rdkit+pyscf+qiskit-nature extraction; build-time only, NOT a runtime dep; H2-self-validated to machine precision), solved by the generic 2e/2o UCCSD path in `chemistry_vqe_native.hexa`. Gated by `selftest/cmt_vqe_ladder_readiness.sh` (`__QMIRROR_CHEM_CMT_VQE__ PASS`). This realizes the F-Q-6-E ramp; see §4. |
| **qmirror chemistry-VQE — 4e/4o sub-tier** (vendored Hamiltonian + ψ* replay) | 6-qubit molecular VQE — **all 6 molecules** (LiH validation anchor + 5 CMT scaffolds clc1/sar1/mfn2/hd6/gjb1) at STO-3G frontier-orbital 4e/4o active space (HOMO-1, HOMO, LUMO, LUMO+1) → `ParityMapper((2,2))` + 2-qubit reduction = 6 qubits; 175-325 Pauli terms; UCCSD-converged ψ* (26 variational params, SLSQP offline) → CASCI(4,4) reproduction << 1 µHa | ✅ **live (4e/4o sub-tier) 2026-05-13** | `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_4e4o_<name>.hexa` (per-molecule, ×6) + shared library `chemistry_vqe_cmt_hamiltonians_4e4o_lib.hexa` — vendored 4e/4o Hamiltonians + UCCSD-converged ψ* + CASCI(4,4) refs (offline pipeline = qiskit-nature `UCCSD` + `SLSQP`; variational step is offline, hexa-side is **vendored VQE replay** via the generic n-qubit Pauli-expectation evaluator `cv_pauli_expectation_n_4e4o`). Per-molecule split because the single-file approach exceeded the hexa-interp 768 MB RSS cap. Gated by `selftest/cmt_vqe_ladder_4e4o_readiness.sh` (aggregates per-molecule sentinels `__QMIRROR_CHEM_CMT_VQE_4E4O_<NAME>__ PASS`); tally 6/6 PASS on dev host. Pure-hexa 4e/4o variational optimizer = next sub-ramp. See §4. |
| **qmirror chemistry-VQE — pure-hexa UCCSD ansatz machinery (LiH 4e/4o)** | E(θ) evaluator: HF state init + UCCSD Trotter ansatz (26 generators, 152 Pauli rotations) + masked n-qubit Pauli expectation, all in pure hexa | ✅ **live (Ramp B ansatz-only) 2026-05-13** | `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_uccsd_lih_4e4o.hexa` — validated by E(θ=0) = HF reference to 3.6e-6 µHa (machine precision). Algorithm cross-validated against `scipy.linalg.expm` at machine precision in offline numpy harness. Gated by `selftest/cmt_uccsd_lih_4e4o_ansatz_readiness.sh`. |
| **qmirror chemistry-VQE — Ramp B EXTERNALIZED variational closure (LiH 4e/4o)** | full variational VQE via externalized NM loop — Python-stdlib (NO scipy/numpy) Nelder-Mead drives the qmirror oneshot energy module (fresh hexa subprocess per energy eval, bypasses the in-process boxed-float leak) | ✅ **live (Ramp B Option 2 LANDED) 2026-05-13** | `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_uccsd_lih_4e4o_oneshot.hexa` + `selftest/cmt_uccsd_lih_4e4o_external_nm_driver.py` (pure-stdlib NM) + gate `selftest/cmt_uccsd_lih_4e4o_external_nm_readiness.sh`. Live result @ maxiter=5: **E_VQE = −7.8638 Ha, CASCI = −7.8643 Ha, \|Δ\| = 494.8 µHa (3× UNDER 1.6 mHa chem-acc bound), 58.5% HF→CASCI gap recovery, 5.7-min wall, 36 evals.** Higher maxiter would converge further (numpy harness: 1.06 mHa @ maxiter=200, 0.004 µHa @ maxiter=8000). |
| **qmirror chemistry-VQE — IN-PROCESS pure-hexa NM 6/6 @ 4e/4o (Ramp B closure)** | full variational VQE in-process in pure hexa — RFC 034 (whole-loop Pauli C kernels) eliminates per-iter HexaVal arena pressure in the energy eval; RFC 035 (whole-NM-step C kernels — gjb1 only) eliminates per-iter boxed-`[float]` retention in the optimizer step. All 6 molecules (LiH + 5 CMT) close at chemical accuracy on the standard 768 MB hexa-interp cap. | ✅ **live (Ramp B IN-PROCESS 6/6 LANDED) 2026-05-13** | `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_uccsd_<name>_4e4o.hexa` × 6 + hexa-lang `runtime.c` RFC 034 (`farr_pauli_exp_inplace` + `farr_pauli_expectation`) + RFC 035 (`farr_simplex_centroid` / `vec_reflect` / `vec_blend` / `vertex_copy` / `simplex_sort` / `simplex_shrink`). Live: lih 226 / clc1 226 / sar1 204 / mfn2 277 / hd6 12 / gjb1 274 µHa; ~10–18 s wall per scaffold (vs ~5.7 min in the externalized path = ~20–35× speedup). Gated by `selftest/cmt_uccsd_inproc_nm_readiness.sh` (strict 6/6). |
| **qmirror chemistry-VQE — Ramp B-2 4e/5o (8-qubit) full NM, 6/6 in-process** | full variational VQE on 8-qubit ParityMapper((2,2)) 4e/5o Hamiltonians for LiH + 5 CMT — RFC 034+035 plumbing, n_qubits-generic. The 4e/5o tier extends the active-space ladder by one orbital and bumps Hamiltonian size from ~325 to 876 Pauli terms / 54 UCCSD params. | ✅ **live (Ramp B-2 6/6 LANDED) 2026-05-13** | `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_uccsd_<name>_4e5o.hexa` × 6 + gates `selftest/cmt_uccsd_lih_4e5o_readiness.sh` + `selftest/cmt_uccsd_4e5o_readiness.sh`. Live: LiH 790 µHa @ 9s, clc1 457 / sar1 630 / mfn2 311 / hd6 15 µHa @ ~30-42s @ maxiter=500, **gjb1 40.27 µHa @ maxiter=4000 / 305 s wall stretch**. RFC 036 `farr_int_array` (packed int64_t\* handle) eliminates the `HEXA_MEM_CAP_MB=2048` env-hatch dependency. |
| **qmirror chemistry-VQE — ADAPT-VQE + k-UpCCGSD ansatz alternatives** | (a) ADAPT-VQE: operator-pool adaptive ansatz, FD-grad pool screen + inner L-BFGS-B, greedy max-\|g\| selection, stop on max-\|g\| < 1e-3 Ha. (b) k-UpCCGSD: Lee et al. strict definition (8 gen-singles + 2 same-spin pair doubles per block, k-times replicated; αβ-mixing doubles excluded). | ✅ **live (ADAPT + k-UpCCGSD LANDED) 2026-05-13** | (a) `chemistry_vqe/module/_adapt_vqe_driver.hexa` + `_adapt_vqe_lih_4e4o.hexa` — LiH 4e/4o **K=10 ops, \|Δ\| = 0.043 µHa (37,000× under chem-acc, ~25,000× tighter than UCCSD-26 NM-200), 62% param-reduction, 17s wall**. FD-grad → RFC 039 PS-grad is a 1-line swap. (b) `_kupccgsd_generator.hexa` + `_kupccgsd_lih_4e4o.hexa` — LiH 4e/4o k=1/2/3 sweep all plateau at 344 µHa (clears 1.6 mHa bound but ~8000× looser than ADAPT-VQE at same 10-param budget); the plateau is the strict-k-UpCCGSD subspace ceiling, confirming the textbook tradeoff. |
| **qmirror chemistry-VQE — 4e/6o (10-qubit) / final-molecule / pocket-embedded** | (i) 4e/6o or 6e/6o (10-qubit) tier — biggest natural next active-space step, ~2-3k Pauli, ~95-150 params. (ii) final-molecule geometries (post Phase-β chemotype refinement). (iii) pocket-embedded QM/MM-VQE — the actual K_d/ΔΔG, not the frontier-orbital token. | ⏳ **open ramps** | (i) RFC 036 closes the runtime memory gate; remaining work is extraction-pipeline. (ii) Chemistry judgment. (iii) Research-grade QM/MM, out of in-repo scope. Documented in `~/core/qmirror/QMIRROR.md` §1 + `CHEMISTRY_VQE_PYSCF_BACKEND_PLAN_2026_05_12.md` §4-5; see §4 below. |
| **xeno → AKIDA AKD1000** (BrainChip neuromorphic, 1W spike inference) | edge AI: `ribozyme` G26-RB-3 off-target Hamming scan / `nanobot` sub-mW actuation controller / `medical-device` EEG-EMG-ECG pattern recognition / `crispr-cas13-poc-diagnostic` lateral-flow signal classification | ⏳ **PENDING** | AKD1000 physical chip arrival (ordered 2026-04-29, ETA pending; AKIDA Cloud access live 2026-05-08) + xeno Phase 1.5 `falsifier` subcommand. Readiness probed by `selftest/akida_workload_readiness.sh` (SKIP until both land). |
| **xeno → Loihi3** (Intel neuromorphic) | well-founded-recursion / sequential workloads (no current hexa-bio mapping — speculative) | ⏳ **unexplored** | xeno roadmap (`.roadmap.loihi3`); no hexa-bio workload identified yet |
| **xeno → Northpole** (IBM neuromorphic) | (no current hexa-bio mapping) | ⏳ **unexplored** | xeno roadmap (`.roadmap.northpole`) |
| **xeno → FinalSpark organoid** (biological compute) | (potential: EEG/EMG training-data source for the AKIDA `medical-device` workload — DishBrain-Pong precedent) | ⏳ **unexplored** | xeno roadmap (`.roadmap.finalspark`); 3-layer design (organoid = data source, AKIDA = inference engine, hexa-bio = workload spec) — far-future |
| **xeno → Cortical Labs DishBrain** (biological compute) | (same as FinalSpark) | ⏳ **unexplored** | xeno roadmap (`.roadmap.cortical_labs`) |
| **xeno → IonQ** (trapped-ion quantum-gate) | real-noise gate-model VQE (Tier 4 quantum — when noise modeling needed) | ⏳ **unexplored** | xeno roadmap (`.roadmap.ionq`); needs a vendor account via xeno; distinct from qmirror state-vector (which is noiseless) |
| **xeno → QRNG** (quantum random number) | general entropy — randomized falsifier seeds (Monte Carlo enumeration, etc.) | ✅ **live** (via `xeno status`) | — (overlaps with qmirror's internal ANU QRNG; both usable as free entropy sources by hexa-bio) |

**Live now**: qmirror state-vector + qmirror chemistry-VQE H2 + qmirror chemistry-VQE
2e/2o ladder (5 CMT scaffolds) + qmirror chemistry-VQE 4e/4o ladder (LiH + 5 CMT) +
**Ramp B externalized variational closure on LiH 4e/4o** + xeno status + xeno QRNG.
**Original Tier-2 gap is closed**: qmirror chemistry-VQE for non-H2 molecules is now
realized at three sub-tiers (2e/2o pure-hexa UCCSD; 4e/4o vendored ψ* replay;
Ramp B externalized variational NM with pure-hexa energy + Python-stdlib optimizer).
**Open ramps** (not blockers — research-grade or runtime-dependent):
4e/4o+ active spaces / final-molecule geometries (post Phase-β chemotype refinement) /
pocket-embedded QM/MM-VQE / in-process pure-hexa NM (blocked on hexa-runtime
boxed-float retention).
**Most pending compute items elsewhere**: xeno's neuromorphic/organoid substrates —
workload wiring awaits xeno's own Phase 1.5+ (AKD1000 arrival, `falsifier` subcommand).

---

## §3 qmirror quantum-compute ladder (Tier 0-5)

Where hexa-bio's quantum workloads sit on the substitution ladder:

| Tier | Substrate | Capability | hexa-bio usage |
|---|---|---|---|
| **0** | numpy/scipy classical | ~10-qubit ceiling, slow | not used (qmirror Tier 1 beats it) |
| **1** | **qmirror pure-hexa state-vector** | ≤30 qubit, free, no vendor account, noiseless | ✅ **current** — all quantum workloads (Mpro pocket, 5-warhead library, 11-drug pocket) fit here |
| **2** | **qmirror + offline-vendored active-space Hamiltonians** (PySCF used offline, not at runtime) | named-molecule active-space Hamiltonian (the H2 pattern, generalized), ≤30 qubit | ✅ **2e/2o tier LANDED 2026-05-13** — `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_hamiltonians.hexa`: vendored 2e/2o Hamiltonians + CASCI(2,2) refs for the 5 CMT candidate scaffolds, UCCSD VQE reproduces each << 1 µHa (F-Q-6-E ramp realized at the 2e/2o tier). 4e/4o+ / general-`--with-pyscf` / pocket-embedded = next ramps. See §4. |
| **3** | IBM Quantum (Heron 156q / Kookaburra 1386q / Flamingo 7000q) | real superconducting hardware, real noise, vendor cloud | not selected — no hexa-bio workload needs >30 qubit OR real noise yet |
| **4** | IonQ Forte 36q / Quantinuum H2 56q (**via xeno**) | real trapped-ion hardware, different noise profile | not selected — xeno has the bridge (`.roadmap.ionq`); use when noise modeling matters |
| **5** | fault-tolerant >1000 logical qubit (PsiQuantum / Google Willow) | error-corrected, post-threshold | 10-year horizon — vendor partnership, not procurement |

**Key observation**: hexa-bio's entire current quantum workload (Mpro pocket VQE
sub-µHa, 5-warhead library ranking, 11-drug pocket library, **+ the 5 CMT candidate
scaffolds at 2e/2o**) fits in Tier 1-2 (qmirror pure-hexa solver, ≤30 qubit, free).
The original Tier-2 gap — Hamiltonian CONSTRUCTION for non-H2 molecules — is closed
at the 2e/2o tier via offline-vendored constants (the H2 pattern, generalized; PySCF
used offline, not at runtime). qmirror's "양자컴퓨터 대용" claim is fully true for the
solver step; the construction step is handled either by the pure-hexa kernel's
hardcoded H2 case or by offline-vendored constants for named molecules. What remains
is larger active spaces / a general `--with-pyscf` mode / pocket-embedded VQE — the
next ramp.

---

## §4 The Tier-2 gap — qmirror chemistry-VQE classical backend (F-Q-6-E ramp) — ✅ REALIZED at the 2e/2o + 4e/4o + Ramp B externalized tiers

> **STATUS 2026-05-13 (third milestone same day): Ramp B externalized closure LANDED.**
> The variational VQE itself now runs end-to-end via `selftest/cmt_uccsd_lih_4e4o_external_nm_driver.py`
> (Python-stdlib NM, no scipy/numpy) driving the qmirror oneshot energy module
> `chemistry_vqe_cmt_uccsd_lih_4e4o_oneshot.hexa` (one fresh hexa subprocess
> per energy eval, bypasses the per-call boxed-float leak that blocked
> in-process NM). Live result @ maxiter=5: **E_VQE − CASCI(4,4) = 494.8 µHa
> (3× UNDER chem-accuracy), 58.5% HF→CASCI gap recovery, 5.7-min wall.**
> Gate `selftest/cmt_uccsd_lih_4e4o_external_nm_readiness.sh` (wired into
> `run_all.sh` → **32/32 PASS**). "Option 2" from the prior commit's
> documented Ramp B sub-ramps. Open: Option 1 (in-process pure-hexa NM)
> blocked on hexa-runtime farr_get boxed-float retention; documented as
> deeper hexa-runtime task. 4 other CMT scaffolds at Ramp B = mechanical
> extension via the same offline UCCSD-decomposition pipeline.

> **STATUS 2026-05-13 (later same day): option (c) extended to the 4e/4o sub-tier.**
> `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_hamiltonians_4e4o.hexa` ships
> vendored 4e/4o-frontier-orbital Hamiltonians (6-qubit, 175-325 Pauli terms)
> + UCCSD-converged statevector ψ* (64 complex amplitudes; 26-parameter UCCSD
> + SLSQP offline) + CASCI(4,4) references for 2 molecules: LiH validation
> anchor + hxq-cmt-hd6-001 (HDAC6 candidate). The pure-hexa runtime is a
> "vendored VQE replay" — reads ψ* + H, computes ⟨ψ*|H|ψ*⟩ via a generic
> n-qubit Pauli-expectation evaluator, verdicts vs CASCI(4,4) at the 1.6 mHa
> bound. Both molecules clear by 6 orders of magnitude. Sentinel
> `__QMIRROR_CHEM_CMT_VQE_4E4O__ PASS`; hexa-bio gate
> `selftest/cmt_vqe_ladder_4e4o_readiness.sh`; `run_all.sh` now **32/32 PASS** (after the Ramp B externalized closure landed).
> Open sub-ramps: (i) pure-hexa 4e/4o variational optimizer (replacing
> "vendored ψ*" with "pure-hexa-found ψ*" — port qiskit-nature UCCSD + SLSQP
> into hexa primitives); (ii) the other 4 CMT scaffolds at 4e/4o (clc1/sar1/
> mfn2/gjb1 — mechanical extension via the same offline recipe); (iii) 4e/4o+
> AS / final-molecule / pocket-embedded VQE = chemistry judgment + QM/MM,
> not in-repo-closeable.

> **STATUS 2026-05-13: option (c) realized for the 5 CMT candidate scaffolds.**
> `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_hamiltonians.hexa` ships vendored
> 2e/2o-active-space parity-mapped Hamiltonians + CASCI(2,2) references for
> hxq-cmt-{clc1,sar1,mfn2,hd6,gjb1}-001 (the gjb1 entry a pyridyl-thiazole stand-in,
> since the committed gjb1-001 has "scaffold class TBD"); the new generic 2e/2o UCCSD
> path in `chemistry_vqe_native.hexa` reproduces each CASCI(2,2) ref to << 1 µHa
> (`__QMIRROR_CHEM_CMT_VQE__ PASS`). Extracted offline (rdkit 2026.03.1 + pyscf 2.13.0
> + qiskit-nature 0.7.2 + qiskit 2.4.1) — build-time one-shot extraction, NOT a
> runtime dependency (per qmirror's hexa-strict rule); H2-self-validated (the same
> pipeline reproduces the hardcoded H2 constants to machine precision). hexa-bio's
> `selftest/cmt_vqe_ladder_readiness.sh` now invokes it (SKIP→PASS); `.roadmap.disease_cmt_specific`
> §6 Tier 3 moved from "DESIGN-AUDIT proxy" to "live VQE (2e/2o) binding"; `.roadmap.quantum`
> F-Q-6-E from "BLOCKED" to "LANDED (2e/2o tier)". Plan: `~/core/qmirror/CHEMISTRY_VQE_PYSCF_BACKEND_PLAN_2026_05_12.md`
> (option (c) realized; (b) general `--with-pyscf` and 4e/4o+ remain the next ramps).

**Original problem (now closed at 2e/2o)**: `qmirror/chemistry_vqe/module/chemistry_vqe.hexa`
active-space transformer + SMILES + drug-class paths require classical chemistry
primitives (PySCF integrals, RDKit geometry, CASCI) that are out of scope for a
pure-hexa kernel"* — true at RUNTIME. To run a VQE on a drug-pocket Hamiltonian you
must first (1) build the geometry, (2) compute integrals over a basis set, (3) reduce
to an active space, (4) map fermions → qubits, then (5) run the quantum solver. Steps
1-4 are classical chemistry; the pure-hexa kernel does step 5 (the hardcoded H2 case
bakes in 1-4). **Resolution adopted: (c) — do 1-4 OFFLINE, vendor the constants.**

**Resolution options** (qmirror-side):
- **(a) re-introduce the retired python bridge** — `qiskit-nature + pyscf` runner
  qmirror shells out to. ❌ NOT adopted as the runtime path — re-introduces a Python
  dependency qmirror Phase 10 deliberately retired (and violates qmirror's hexa-strict
  rule). (Used internally, offline, to *generate* the (c) vendored constants — that's
  fine: build-time one-shot extraction is a separate category.)
- **(b) `--with-pyscf` opt-in mode** — keep the pure-hexa kernel as default, add an
  optional classical-backend mode. Still adds `.py` runtime code + a pyscf dep → also
  conflicts with qmirror's hexa-strict rule as a runtime path. Deferred; it's the
  general-purpose ramp for ad-hoc molecules but needs a hexa-strict-compatible design.
- **(c) precompute + vendor named-molecule Hamiltonians** — ✅ **ADOPTED & LANDED for
  the 5 CMT scaffolds (2e/2o tier)**. Like the H2 case: extract the active-space
  Hamiltonians offline (rdkit+pyscf+qiskit-nature on a dev machine), vendor the
  parity-mapped constants + CASCI references into `chemistry_vqe_cmt_hamiltonians.hexa`,
  solve with the pure-hexa UCCSD solver. No runtime Python. Limitation: only the
  pre-computed molecules; CMT's 5 small-mol scaffolds → 5 vendored Hamiltonians.

**What remains (the next ramps — NOT failures, scope)**:
- **4e/4o+ active spaces** — the 2e/2o HOMO/LUMO space is a drastic reduction; a larger
  active space gives a different (still valid) Hamiltonian and needs a >2-qubit ansatz
  in qmirror (the H2/2e2o ansatz is hardcoded for 2 qubits).
- **Final-molecule geometries** — the CMT placeholders precede Phase-β chemotype
  refinement; a clinically-meaningful calc uses the refined molecule.
- **Pocket-embedded VQE** — the actual binding-affinity calc (the enzyme active site
  + ligand, QM/MM) is research-grade and beyond any of the above.
- **(b) general `--with-pyscf`** — for ad-hoc new molecules, once a hexa-strict-compatible
  design lands (e.g. an offline `hx` build-step that vendors the Hamiltonian, rather
  than a runtime python shell-out).

The 2e/2o CASCI(2,2) energy is a reproducible quantum-chemistry quantity, not "the
K_d" — so the in-repo gate (`cmt_vqe_ladder_readiness.sh`) verifies "a non-H2
molecular VQE runs against these scaffolds and reproduces CASCI(2,2)", not "the
binding affinity is X". The DESIGN-AUDIT layer (`cmt_*_audit.py`) remains the
in-repo-verifiable closure for the *design*.

---

## §5 Routing logic (see `selftest/compute_substrate_routing.py`)

hexa-bio routes a workload to a substrate based on its characteristics:

```
workload-spec → substrate decision:
  qubit ≤ 30, gate-model, noiseless              → qmirror state-vector       [ready]
  chemistry VQE, H2/STO-3G canonical              → qmirror chemistry_vqe      [ready]
  chemistry VQE, named molecule, 2e/2o (vendored) → qmirror chemistry_vqe_cmt  [ready — F-Q-6-E, the 5 CMT scaffolds]
  chemistry VQE, arbitrary molecule / 4e/4o+      → qmirror chemistry_vqe+offline-vendor [next ramp — bigger active space needs >2-qubit ansatz]
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
- `selftest/cmt_vqe_ladder_readiness.sh` — CMT 2e/2o pocket-VQE gate (invokes qmirror's vendored CMT Hamiltonians; F-Q-6-E realized at the 2e/2o tier)
- `selftest/cmt_vqe_ladder_4e4o_readiness.sh` — CMT 4e/4o vendored-VQE-replay gate (F-Q-6-E 4e/4o sub-tier)
- `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_4e4o_<name>.hexa` (×6 per-molecule) + `chemistry_vqe_cmt_hamiltonians_4e4o_lib.hexa` (shared) — vendored 4e/4o Hamiltonians + UCCSD-converged ψ* + CASCI(4,4) refs + generic n-qubit Pauli-expectation evaluator
- `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_uccsd_lih_4e4o.hexa` — pure-hexa UCCSD ansatz machinery (Ramp B ansatz-only, validated by E(θ=0) = HF to machine precision)
- `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_uccsd_lih_4e4o_oneshot.hexa` — single-shot energy evaluator (driven by the externalized NM)
- `selftest/cmt_uccsd_lih_4e4o_ansatz_readiness.sh` — Ramp B ansatz-machinery gate
- `selftest/cmt_uccsd_lih_4e4o_external_nm_driver.py` + `..._readiness.sh` — Ramp B EXTERNALIZED variational VQE gate (Δ=494.8 µHa, 3× under chem-acc)
- `qmirror/chemistry_vqe/module/chemistry_vqe_cmt_hamiltonians.hexa` — the vendored 2e/2o Hamiltonians + the offline extraction recipe + H2 self-validation anchor
- `qmirror/CHEMISTRY_VQE_PYSCF_BACKEND_PLAN_2026_05_12.md` — the option (a/b/c) analysis; option (c) realized 2026-05-13
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
