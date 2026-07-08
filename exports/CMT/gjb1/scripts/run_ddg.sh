#!/usr/bin/env bash
# FREE folding-stability ΔΔG for CMT1X Cx32 trafficking-defective mutants.
# Engine: EvoEF2 (BSD, free; Huang et al. Bioinformatics 2020;36(4):1135) —
#   RepairStructure → ComputeStability(WT) → BuildMutant → ComputeStability(mutant).
# ΔΔG_fold = G_mut − G_WT  (EvoEF2 stability ≈ kcal/mol; POSITIVE = destabilizing).
# HONEST (d6): EvoEF2 is an empirical force field, scaffold/estimate-level — NOT FEP.
# EvoEF2 reads its library/ relative to the binary, so we run FROM the EvoEF2 dir
# with absolute --pdb paths and copy result models back to the campaign workdir.
# Mutations = verified CMT1X trafficking-defective LOF set (Vavlitou et al. HMG 2017;
# 26(9):1622, doi:10.1093/hmg/ddx064): ER-retained T55I; Golgi-retained
# R75W(dominant-neg), L143P, N175D(dominant-neg), R183S.
set -euo pipefail
EVODIR=/tmp/EvoEF2
EVO="$EVODIR/EvoEF2"
HERE="$(cd "$(dirname "$0")/.." && pwd)"
WORK="$HERE/ddg"; mkdir -p "$WORK"
cp "$HERE/structures/cx32_monomer_chainA.pdb" "$WORK/cx32.pdb"
cd "$EVODIR"

echo "[1/4] RepairStructure…"
"$EVO" --command=RepairStructure --pdb="$WORK/cx32.pdb" > "$WORK/repair.log" 2>&1 || true
# EvoEF2 writes <stem>_Repair.pdb into CWD
REP="$EVODIR/cx32_Repair.pdb"
[ -f "$REP" ] || { echo "repair failed"; tail "$WORK/repair.log"; exit 1; }
cp "$REP" "$WORK/cx32_Repair.pdb"

echo "[2/4] ComputeStability(WT)…"
"$EVO" --command=ComputeStability --pdb="$REP" > "$WORK/wt_stability.log" 2>&1
GWT=$(grep -E "^Total" "$WORK/wt_stability.log" | tail -1 | awk '{print $NF}')
echo "  G_WT = $GWT"

echo "[3/4] mutant_file…"
cat > "$EVODIR/individual_list.txt" <<EOF
TA55I;
RA75W;
LA143P;
NA175D;
RA183S;
EOF
cp "$EVODIR/individual_list.txt" "$WORK/"
cat "$EVODIR/individual_list.txt"

echo "[4/4] BuildMutant + per-mutant stability…"
"$EVO" --command=BuildMutant --pdb="$REP" --mutant_file="$EVODIR/individual_list.txt" > "$WORK/buildmutant.log" 2>&1 || { echo "buildmutant failed"; tail "$WORK/buildmutant.log"; exit 1; }
ls cx32_Repair_Model_*.pdb 2>/dev/null || { echo "no mutant models"; tail "$WORK/buildmutant.log"; exit 1; }

echo "label,mutation,region,G_WT,G_mut,ddG_fold_kcalmol" > "$WORK/ddg_results.csv"
LABELS=(T55I R75W L143P N175D R183S)
REGIONS=(ER-retained Golgi-DN Golgi Golgi-DN Golgi)
i=1
for idx in "${!LABELS[@]}"; do
  M=$(printf "$EVODIR/cx32_Repair_Model_%04d.pdb" "$i")
  if [ -f "$M" ]; then
    cp "$M" "$WORK/mut_${LABELS[$idx]}.pdb"
    "$EVO" --command=ComputeStability --pdb="$M" > "$WORK/stab_${LABELS[$idx]}.log" 2>&1
    GM=$(grep -E "^Total" "$WORK/stab_${LABELS[$idx]}.log" | tail -1 | awk '{print $NF}')
    DDG=$(/opt/homebrew/bin/python3 -c "print(round(float('$GM')-float('$GWT'),3))")
    echo "${LABELS[$idx]},${LABELS[$idx]},${REGIONS[$idx]},$GWT,$GM,$DDG" >> "$WORK/ddg_results.csv"
    echo "  ${LABELS[$idx]} (${REGIONS[$idx]}): G_mut=$GM  ddG=$DDG"
  else
    echo "  missing model $M for ${LABELS[$idx]}"
  fi
  i=$((i+1))
done
echo "=== DONE → $WORK/ddg_results.csv ==="
cat "$WORK/ddg_results.csv"
# tidy EvoEF2 scratch
rm -f "$EVODIR"/cx32_Repair*.pdb "$EVODIR"/individual_list.txt