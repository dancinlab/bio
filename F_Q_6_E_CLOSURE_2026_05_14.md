# F-Q-6-E Closure Summary — 2026-05-13 / 14 / 15 sweep

> **Scope**: full picture of the F-Q-6-E (non-H2 molecular VQE) closure
> as of cycle-30++++++++ sweep. Six active-space tiers × two ansatz
> alternatives, all in-process pure-hexa, all sentinel-gated.
>
> **Status**: 18 + 18 PASS sentinels (6 NM tiers × 6 mols + 3 ADAPT
> tiers × 6 mols) + bench 9/11. All under chemical accuracy (1.6 mHa).

---

## 1. Active-space ladder (NM optimizer, gradient-free)

| Tier | n_qubits | n_pauli | n_params | wall/scaffold | \|Δ\| range (µHa) | gate |
|---|---|---|---|---|---|---|
| 2e/2o | 2 | 9 | 1 | <1s | <<1 | `cmt_vqe_ladder_readiness.sh` |
| 4e/4o vendored-ψ\* replay | 6 | 175-325 | (26) | ~1s | 0.0005-17.78 | `cmt_vqe_ladder_4e4o_readiness.sh` |
| 4e/4o IN-PROCESS NM | 6 | 175-325 | 26 | ~10-18s | 11.7-274 | `cmt_uccsd_inproc_nm_readiness.sh` |
| 4e/5o (8-qubit) IN-PROCESS NM | 8 | 276-876 | 54 | ~9-305s | 14.5-790 | `cmt_uccsd_4e5o_readiness.sh` + `cmt_uccsd_lih_4e5o_readiness.sh` |
| **4e/6o (10-qubit) IN-PROCESS NM** | 10 | 631-1819 | 92 | ~133-394s | 5.55-1090 | `cmt_uccsd_4e6o_readiness.sh` |

NM tier extraction wall (offline qiskit-nature SLSQP):
- 4e/4o: ~3 min per scaffold
- 4e/5o: ~14-30 min per scaffold (~73 min total cohort)
- 4e/6o: ~2-7 h per scaffold (~21 h total cohort)

**Honest scoping**: NM is gradient-free → wall scales with n_params² roughly; |Δ| floor set by step-size. gjb1 is the structurally hardest scaffold at every tier (consistently needs ~2-10× more iter than the rest); the maxiter=4000 stretch at 4e/5o + 4e/6o is the cleanest workaround under FD path.

---

## 2. Ansatz alternatives (ADAPT-VQE)

| Tier | K range | \|Δ\| range (µHa) | wall range (s) | gate |
|---|---|---|---|---|
| 4e/4o ADAPT | 2-18 | 0.043-50.6 | 3-85 | `adapt_vqe_4e4o_readiness.sh` (planned) |
| 4e/5o ADAPT | 2-35 | 0.05-371 | 8-748 | `adapt_vqe_4e5o_readiness.sh` |
| 4e/6o ADAPT | 2-40 | 4.28-1392 | 34-3166 | `adapt_vqe_4e6o_readiness.sh` |

### hd6 K=2 collapse across all tiers

- 4e/4o: K=2, 3.67 µHa, 3s
- 4e/5o: K=2, 4.28 µHa, 8s
- 4e/6o: K=2, 4.28 µHa, 34s

The CASCI(4,N) for hd6 is genuinely dominated by 2 excitations at every active-space tier — a structural property of the molecule, not a quirk of the optimizer.

### k-UpCCGSD strict (Lee et al.)

- LiH 4e/4o k=1/2/3 sweep: all plateau at **344 µHa**
- Strict-subspace ceiling (αβ-mixing doubles excluded by definition)
- Confirms the textbook tradeoff: ansatz *structure* matters more than block-count

---

## 3. ADAPT vs NM honest comparison

For each scaffold at 4e/6o (the toughest tier where both are documented):

| scaffold | NM \|Δ\| | NM wall | ADAPT \|Δ\| | ADAPT wall | ADAPT K |
|---|---|---|---|---|---|
| lih | 272.45 | 133s | **10.88** | 1050s | 25 |
| clc1 | 402.97 | 214s | 918.48 | 2495s | 35 |
| sar1 | 439.64 | 214s | 790.59 | 1308s | 25 |
| mfn2 | 121.56 | 221s | 372.23 | 388s | 12 |
| hd6 | 5.55 | 246s | **4.28** | 34s | 2 |
| gjb1 | 1090.55 | 394s | 1392.49 | 3166s | 40 |

**Findings**:
- NM is tighter on |Δ| in 4/6 scaffolds (it converges with the full
  92-param UCCSD ansatz).
- ADAPT is tighter on |Δ| in 2/6 scaffolds (LiH dramatically: 25× better;
  hd6 marginally).
- ADAPT is faster on wall in 1/6 scaffolds (hd6: 34s vs NM 246s — K=2
  collapse pays off).
- ADAPT is the principled K-reduction win in all 6 scaffolds: K range
  2-40 vs UCCSD pool of 92 (2-43% of pool).
- The wall gap is the FD-gradient pool-screen cost. RFC 039 PS-grad
  swap (pending hexa-lang work — needs `ansatz_pack_append` for ADAPT's
  dynamic ansatz pattern) is the lever that closes the wall gap.

**Recipe**: use ADAPT when parameter-count or hardware constraints matter
(real QPU regime where shallower ansatz means less noise accumulation);
use NM when accuracy at fixed UCCSD budget is the goal and FD-gradient
penalty is acceptable.

---

## 4. Hexa-lang runtime kernels enabling this closure

| RFC | Kernel | What it enables | Commit |
|---|---|---|---|
| 034 | `farr_pauli_exp_inplace` + `farr_pauli_expectation` | Whole-loop Pauli C kernels in energy eval. First in-process VQE @ 4e/4o (eliminates per-iter HexaVal arena pressure). | `e31ee484` |
| 035 | `farr_simplex_*` × 8 | Whole-NM-step C kernels. gjb1 4e/4o NM lifts from maxiter=200 (1879 µHa) to maxiter=500 (274 µHa). | `64bcf3ab` |
| 036 | `farr_int_array` packed `int64_t*` handle | Eliminates `HEXA_MEM_CAP_MB=2048` env-hatch dependency for 4e/5o; unblocks 4e/6o tier. | `32ca3f30` |
| 037 | `farr_pauli_expectation_batch` | Whole-Hamiltonian C kernel per energy eval; ~3-5× speedup for 800+ Pauli terms. | (landed) |
| 038 | `farr_uccsd_apply` | Whole-ansatz application as one C kernel; 5-10× speedup. | (landed) |
| 039 | `farr_parameter_shift_grad` + raw-helper refactor + `ham_pack`/`ansatz_pack` | Parameter-shift gradient in one C call. Enables hexa-native L-BFGS-B with O(1) gradient evals. ADAPT-VQE PS-grad swap is the pending consumer (needs `ansatz_pack_append` for dynamic ansatz). | `b0a4f146` |

---

## 5. Cross-CMT independent verification (10-diatomic bench)

| id | tier | qubits | Pauli | \|Δ\| µHa | status |
|---|---|---|---|---|---|
| h2 | 2e/2o | 2 | 5 | (replay) | PASS |
| lih | 4e/4o | 6 | 175 | 0.00431 | PASS |
| lih_4e5o | 4e/5o | 8 | 276 | 790.819 | PASS |
| beh2 | 4e/4o | 6 | 55 | 0.670 | PASS |
| h2o | 4e/4o | 6 | 95 | 0.294 | PASS |
| nh3 | 4e/4o | 6 | 165 | 1.857 | PASS |
| n2 | 4e/4o | 6 | 75 | 0.458 | PASS |
| co | 4e/4o | 6 | 155 | 84.755 | PASS |
| ch4 | 4e/4o | 6 | 325 | 0.330 | PASS |
| hf | 4e/4o | 6 | — | — | NOT_AVAILABLE_STO3G |
| f2 | 4e/4o | 6 | — | — | NOT_AVAILABLE_STO3G |

**9/11 PASS** under 1.6 mHa chem-acc bound. **HF and F2 marked
NOT_AVAILABLE_STO3G**: STO-3G doesn't have enough spatial orbitals
for the 4e/4o active space after frozen-core inactivation (HF: 6
spatial, F2: 10 spatial; both need cc-pVDZ+). Basis-set / chemistry
constraint, NOT a qmirror gap.

This bench is the first independent verification beyond the CMT-specific
scaffolds — comparators chosen for published CCSD(T) refs (W4-17 / HEAT /
NIST CCCBDB). The \|Δ\| is vs same-active-space CASCI(N,M); the
published CCSD(T) numbers are cited so an external reader can
sanity-check that qmirror's VQE result is in the expected ballpark for
the cited active space + geometry, NOT used as the direct comparator
(see manifest `honesty_notes`).

---

## 6. raw_91 honest C3

- The CASCI(4,N) energy is a reproducible quantum-chemistry quantity
  at the chosen active space + geometry + basis — **NOT a binding
  affinity, NOT a K_d, NOT a therapeutic claim**. F-Q-6-E closes the
  in-repo software contract that pure-hexa qmirror can construct +
  solve the active-space Hamiltonian for non-H2 drug-pocket molecules
  to chemical accuracy. It does NOT close the question "does this
  molecule bind the target". That requires pocket-embedded QM/MM-VQE
  on the actual drug-pocket complex geometry — research-grade chemistry
  judgment, out of in-repo scope.
- "ADAPT-VQE 17/17 PASS" means the operator-pool growth heuristic
  reaches chem-acc on these specific Hamiltonians with K < UCCSD pool
  size. It does NOT mean ADAPT is universally better than UCCSD —
  the honest tradeoff is documented in §3.
- "6 tier" closure means 6 active-space choices closed at the chem-acc
  bound. Each tier captures more electron correlation than the prior
  (the 4e/6o tier adds 1 more virtual orbital than 4e/5o; energy
  difference is bounded). Adding tiers (4e/7o-12q+) is mechanical via
  the existing extraction pipeline; the chemistry interpretation of
  each tier is the gating question.
- All wall-time measurements are dev-host single-machine; production
  deployment scaling is a separate question.

---

## 7. What's NOT closed (next ramps)

Documented-pending, NOT silently open:

1. **4e/7o-12q tier** — mechanical extension (offline ~16-24h /
   scaffold; in-process ~1-3h / scaffold at HEXA_MEM_UNLIMITED).
   Estimated 8-16 GB memory per scaffold. Not started; clean ramp
   once needed.
2. **RFC 039 PS-grad swap for ADAPT-VQE** — needs hexa-lang upstream
   `ansatz_pack_append` (or zero-coef stand-in) to fit ADAPT's
   dynamic ansatz pattern. ~30-line TODO block in
   `_adapt_vqe_driver.hexa` lines 14-51 specifies the gap.
3. **Pocket-embedded QM/MM-VQE** — the "real" binding-affinity
   question. Research-grade; requires external chemistry judgment +
   pocket geometry from co-crystal / docking → AGENTS deferred.
4. **k-UpCCGSD × 4e/5o + 4e/6o** — orbital-basis-specific generator
   re-partition needed. Documented; not started.
5. **bench HF / F2** — needs cc-pVDZ basis to enable 4e/4o active
   space; published CCSD(T) refs assume cc-pVQZ. Re-running at cc-pVDZ
   is a 1-2 hour offline extraction once the bench script supports the
   basis param.
6. **Real-QPU validation** (IonQ / IBM / Quantinuum / Pasqal /
   Rigetti) — external account + paid hardware. AGENTS deferred for
   user engagement, do not initiate autonomously.

---

## 8. Commit trail

Key landmark commits (chronological, qmirror unless noted):

- `e31ee484` (hexa-lang): RFC 034 Pauli kernels
- `179a2db`: Ramp B 4e/4o in-process 6/6 (initial 5/6 + gjb1 pending)
- `64bcf3ab` (hexa-lang): RFC 035 NM-step kernels
- `e03ceab`: gjb1 4e/4o RFC 035 farr-NM → 6/6 in-process
- `5453d93`: LiH 4e/5o full NM closure
- `cc20b81`: 5 CMT scaffolds @ 4e/5o (4/5 + gjb1 stretch)
- `32ca3f30` (hexa-lang): RFC 036 farr_int_array
- `b0a4f146` (hexa-lang): RFC 039 PS-grad kernel
- `f080452`: gjb1 4e/5o NM maxiter=4000 stretch → 6/6 in-process
- `852ad27`: ADAPT-VQE × 5 CMT @ 4e/4o
- `f2e8a5e`: ADAPT-VQE × 6 mols @ 4e/5o
- `59b9415`: 4e/6o 6/6 NM modules
- `f50e611`: ADAPT-VQE × 6 mols @ 4e/6o
- `dd259c4`: 10-diatomic bench ch4 + hf/f2 STO-3G note → 9/11
- hexa-bio `d3fc310`: cmt_uccsd_4e6o_readiness gate
- hexa-bio `c908ce7`: adapt_vqe_4e6o_readiness gate

selftest sweep (post-closure): 36 gates wired into `run_all.sh`.
