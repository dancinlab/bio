#!/usr/bin/env bash
# FREE LOCAL docking (mini, miniforge3 env `fea`: smina 2020.12.10 [Vina 1.1.2 sf] + obabel
# 3.1.0 + rdkit 2026.3.3). Docks the real drug-like candidate set into the L143P TM1/TM4
# cryptic pocket using the SAME receptor.pdbqt + box as the prior summer Vina run, so scores
# are directly comparable to the placeholder baseline (scores_sorted.csv).
#
# HONEST (d6): smina score = Vina scoring-fn ranking aid, NOT an affinity. summer/aiden GPU
# untouched (this is CPU). No discovery claimed; placeholder->real = method progress only.
set -euo pipefail
PY=/Users/mini/miniforge3/envs/fea/bin/python
SMINA=/Users/mini/miniforge3/envs/fea/bin/smina
OBABEL=/Users/mini/miniforge3/envs/fea/bin/obabel

HERE="$(cd "$(dirname "$0")" && pwd)"
GJB1="$(cd "$HERE/.." && pwd)"
REC="$GJB1/docking/receptor.pdbqt"             # same prepared receptor as summer run (1695 atoms)
SMI="$HERE/ligands_real.smi"
W="$HERE/work"
rm -rf "$W"; mkdir -p "$W/lig"; cd "$W"

# L143P P2 cryptic-pocket centroid + box (RESULT.md / dock.log: center 129.36,157.79,171.44 size 22^3)
CX=129.36; CY=157.79; CZ=171.44; SX=22; SY=22; SZ=22
echo "[box] center=($CX,$CY,$CZ) size=($SX,$SY,$SZ)  receptor=$REC"

echo "name,smiles,best_kcalmol,n_modes" > scores.csv
while read -r LINE; do
  [ -z "$LINE" ] && continue
  SMI_STR="${LINE%% *}"; NAME="${LINE##* }"
  # 1) SMILES -> 3D SDF (rdkit ETKDGv3 + MMFF), deterministic seed
  $PY - "$SMI_STR" "$NAME" "$W/lig/$NAME.sdf" <<'PYEOF'
import sys
from rdkit import Chem
from rdkit.Chem import AllChem
smi,name,out=sys.argv[1],sys.argv[2],sys.argv[3]
m=Chem.MolFromSmiles(smi)
if m is None:
    open(out+".FAIL","w").write("parse"); print("PARSE_FAIL",name); sys.exit(0)
mh=Chem.AddHs(m)
p=AllChem.ETKDGv3(); p.randomSeed=0xC32
if AllChem.EmbedMolecule(mh,p)!=0:
    p.useRandomCoords=True; AllChem.EmbedMolecule(mh,p)
try: AllChem.MMFFOptimizeMolecule(mh,maxIters=2000)
except Exception: pass
mh.SetProp("_Name",name)
Chem.MolToMolFile(mh,out)
print("EMBED_OK",name)
PYEOF
  [ -f "$W/lig/$NAME.sdf" ] || { echo "skip $NAME (no sdf)"; continue; }
  # 2) dock with smina (Vina sf), exhaustiveness 16, 9 modes
  $SMINA --receptor "$REC" --ligand "$W/lig/$NAME.sdf" \
         --center_x $CX --center_y $CY --center_z $CZ \
         --size_x $SX --size_y $SY --size_z $SZ \
         --exhaustiveness 16 --num_modes 9 --seed 42 \
         --out "$W/lig/${NAME}_out.sdf" --log "$W/lig/${NAME}.log" \
         --cpu 4 >/dev/null 2>&1 || { echo "dock fail $NAME"; continue; }
  # 3) parse best affinity + n modes from smina log
  BEST=$(grep -A50 "mode |" "$W/lig/${NAME}.log" | awk '/^ *1 / {print $2; exit}')
  NM=$(grep -cE "^ *[0-9]+ +-?[0-9]" "$W/lig/${NAME}.log" || echo 0)
  [ -z "$BEST" ] && { echo "no score $NAME"; continue; }
  echo "$NAME,\"$SMI_STR\",$BEST,$NM" >> scores.csv
  echo "DOCKED $NAME best=$BEST"
done < "$SMI"

echo "=== SCORES (sorted, most-negative first) ==="
{ head -1 scores.csv; tail -n +2 scores.csv | sort -t, -k3 -n; } | tee "$HERE/scores_real_sorted.csv"
cp scores.csv "$HERE/scores_real.csv"
echo "workdir: $W"
