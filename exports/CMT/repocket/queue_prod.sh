#!/usr/bin/env bash
# Serial GPU driver for the CORRECTED CMT productions (SARM1, MFN2) on summer's single
# shared GPU. Fires each ONLY when the GPU is free (no live abfe_cmt.py CUDA process) so
# it NEVER contends with the running HDAC6 production or with each other. The ABFE deck is
# resumable (per-rep .nc checkpoints), so a queued job is just a deferred launch.
#
#   run ON summer:  cd ~/cmt-abfe && nohup bash run_MFN2/../queue_prod.sh > queue_prod.log 2>&1 &
#   (this script lives at ~/cmt-abfe/queue_prod.sh after deploy)
set -u
MM=$HOME/bin/micromamba
BASE=$HOME/cmt-abfe
cd "$BASE" || exit 1

gpu_busy() {
  # any python abfe_cmt.py process == GPU occupant (deck pins one CUDA context)
  pgrep -f "python abfe_cmt.py" >/dev/null 2>&1
}

wait_for_free_gpu() {
  echo "[queue $(date +%H:%M:%S)] waiting for GPU to free up..."
  while gpu_busy; do sleep 120; done
  echo "[queue $(date +%H:%M:%S)] GPU free."
}

fire() {
  local target=$1 dir=$2
  wait_for_free_gpu
  echo "[queue $(date +%H:%M:%S)] firing $target production (20-win/1000-iter, rep0) in $dir"
  ( cd "$dir" && rm -f abfe_complex_rep0.nc abfe_solvent_rep0.nc \
        abfe_complex_rep0_checkpoint.nc abfe_solvent_rep0_checkpoint.nc 2>/dev/null
    "$MM" run -n fep env SMOKE=0 PLATFORM=CUDA POCKETS=pockets_repocket.json \
        TARGET="$target" REP=0 python abfe_cmt.py > "prod_repocket_${target}_rep0.log" 2>&1 )
  echo "[queue $(date +%H:%M:%S)] $target production exited (rc=$?)"
}

# 1) SARM1 corrected — runs in the flat ~/cmt-abfe dir (its own .nc names are distinct
#    from HDAC6's only if HDAC6 has finished; the wait_for_free_gpu gate guarantees that,
#    but to be safe SARM1 also uses an isolated dir).
mkdir -p "$BASE/run_SARM1"
for f in pockets_repocket.json 7NAL_trim.pdb lig_SR1.sdf lig_SR1_bound.sdf; do
  ln -sf "../$f" "$BASE/run_SARM1/$f"
done
cp -f "$BASE/abfe_cmt.py" "$BASE/run_SARM1/abfe_cmt.py"
fire SARM1 "$BASE/run_SARM1"

# 2) MFN2 corrected — isolated dir already prepared (run_MFN2/)
cp -f "$BASE/abfe_cmt.py" "$BASE/run_MFN2/abfe_cmt.py"
fire MFN2 "$BASE/run_MFN2"

echo "[queue $(date +%H:%M:%S)] all corrected productions complete."
