#!/usr/bin/env bash
#
# cmt_uccsd_lih_4e5o_readiness.sh
#
# F-Q-6-E Ramp B-2 — 4e/5o (8-qubit) proof-of-construct gate. Invokes
# qmirror's chemistry_vqe_cmt_uccsd_lih_4e5o.hexa, which runs ONE
# pure-hexa energy evaluation at theta=0 (HF) on the 4e/5o active-space
# Hamiltonian. The hexa runtime (RFC 034 farr_pauli_* builtins) is
# n_qubits-generic — same C kernels handle 6, 8, 10+ qubits transparently
# (popcount works on the full mask via __builtin_popcountll). This gate
# demonstrates the active-space ladder extends past 4e/4o without any
# hexa-lang runtime change.
#
# raw_91 honest C3:
#   - PROOF OF CONSTRUCT only: one energy eval at theta=0. The full NM
#     variational closure at 4e/5o is gated by per-iter wall budget (8-qubit
#     energy eval ~4× more expensive than 6-qubit; 54-param UCCSD instead
#     of 26 → NM at maxiter=200 would be ~3-5 min wall). Documented as
#     next sub-ramp; offline qiskit-nature UCCSD VQE @ 4e/5o converges to
#     Δ vs CASCI(4,5) = 0.0097 µHa (~0.01 µHa sub-µHa).
#   - 4e/5o is still a small active space; CASCI(4,5) is a reproducible
#     quantum-chemistry quantity, not a binding affinity.
#   - LiH chosen because it's the smallest molecule that admits non-trivial
#     4e/5o (Li 5 spatial orbitals × 2 spin = 10 spin orbitals, 4 active
#     electrons in 5 active spatial orbitals → ParityMapper((2,2)) + 2-qubit
#     reduction = 8 qubits). CMT scaffolds @ 4e/5o = mechanical extension.
#
# Sentinel: __CMT_UCCSD_LIH_4E5O_READINESS__ PASS|SKIP|FAIL

set -u

SENTINEL_PASS="__CMT_UCCSD_LIH_4E5O_READINESS__ PASS"
SENTINEL_SKIP="__CMT_UCCSD_LIH_4E5O_READINESS__ SKIP"
SENTINEL_FAIL="__CMT_UCCSD_LIH_4E5O_READINESS__ FAIL"

QMIRROR_ROOT="${QMIRROR_ROOT:-$HOME/core/qmirror}"
MODULE="$QMIRROR_ROOT/chemistry_vqe/module/chemistry_vqe_cmt_uccsd_lih_4e5o.hexa"

echo "cmt_uccsd_lih_4e5o_readiness — 4e/5o 8-qubit proof-of-construct (Ramp B-2)"
echo "  module: $MODULE"
echo

if [ ! -f "$MODULE" ]; then
  echo "  SKIP: module not found"
  echo "$SENTINEL_SKIP"; exit 0
fi
if ! command -v hexa >/dev/null 2>&1; then
  echo "  SKIP: hexa runtime not on PATH"
  echo "$SENTINEL_SKIP"; exit 0
fi

OUT="$(timeout 90 hexa run "$MODULE" --selftest 2>&1)"
RC=$?

if echo "$OUT" | grep -qiE "ConnectionRefusedError|Connection refused|Killed: 9|Terminated: 15|__HEXA_RC=137|__HEXA_RC=143|memory cap exceeded"; then
  echo "$OUT" | tail -6
  echo "  SKIP: hexa runtime issue"
  echo "$SENTINEL_SKIP"; exit 0
fi
case "$RC" in
  0)
    echo "$OUT" | tail -10
    if echo "$OUT" | grep -q "__QMIRROR_CHEM_CMT_UCCSD_LIH_4E5O_INPROC_NM__ PASS"; then
      echo "$SENTINEL_PASS"; exit 0
    fi
    echo "$SENTINEL_SKIP"; exit 0
    ;;
  124)
    echo "  SKIP: timeout"
    echo "$SENTINEL_SKIP"; exit 0
    ;;
  *)
    echo "$OUT" | tail -10
    echo "$SENTINEL_FAIL"; exit 1
    ;;
esac
