#!/usr/bin/env bash
# FREE AutoDock-Vina docking of candidate pharmacological chaperones into the
# L143P-induced TM1/TM4 hydrophobic cavity of Cx32. Runs entirely on summer CPU
# (rbfe env: Vina 1.2.7 + meeko 0.7.1 + rdkit + reduce). Does NOT touch GPU.
# HONEST (d6): scaffold-level — most ligand SMILES are PLACEHOLDER fragments;
#   docking score is a guide, not an affinity. Receptor = L143P mutant monomer.
set -euo pipefail
PY=~/micromamba/envs/rbfe/bin/python
MKLIG=~/micromamba/envs/rbfe/bin/mk_prepare_ligand.py
PREPREC=~/micromamba/envs/rbfe/bin/prepare_receptor4
STAGE=~/cmt_gjb1_stage      # inputs: receptor.pdb, ligands.smi, box.txt
W=~/cmt_gjb1_work
rm -rf "$W"; mkdir -p "$W/lig"; cd "$W"
cp "$STAGE/receptor.pdb" "$STAGE/ligands.smi" "$STAGE/box.txt" .
read CX CY CZ SX SY SZ < box.txt
echo "box center=($CX,$CY,$CZ) size=($SX,$SY,$SZ)"

echo "[1] receptor → pdbqt (AutoDockTools prepare_receptor4, robust w/ chain gap)…"
# receptor.pdb is pdbfixer-cleaned (H added, protein-only, single chain A; gap 103-129)
$PREPREC -r receptor.pdb -o receptor.pdbqt -A None -U nphs_lps 2>rec_prep.log
REC="$W/receptor.pdbqt"
[ -f "$REC" ] || { echo "NO RECEPTOR PDBQT"; tail -15 rec_prep.log; exit 1; }
echo "  receptor = $REC ($(grep -c ^ATOM "$REC") atoms)"

echo "[2] ligands → pdbqt (rdkit 3D embed + meeko)…"
echo "name,smiles,best_kcalmol,n_modes" > scores.csv
while read SMI NAME; do
  [ -z "$SMI" ] && continue
  $PY - "$SMI" "$NAME" <<'PYEOF'
import sys
from rdkit import Chem
from rdkit.Chem import AllChem
smi,name=sys.argv[1],sys.argv[2]
m=Chem.MolFromSmiles(smi)
if m is None:
    open("lig/%s.FAIL"%name,"w").write("parse"); print("PARSE_FAIL",name); sys.exit(0)
mh=Chem.AddHs(m)
p=AllChem.ETKDGv3(); p.randomSeed=0xC32
if AllChem.EmbedMolecule(mh,p)!=0:
    p.useRandomCoords=True; AllChem.EmbedMolecule(mh,p)
try: AllChem.MMFFOptimizeMolecule(mh,maxIters=2000)
except Exception: pass
mh.SetProp("_Name",name)
Chem.MolToMolFile(mh,"lig/%s.sdf"%name)
print("EMBED_OK",name)
PYEOF
  [ -f "lig/$NAME.sdf" ] || { echo "skip $NAME (no sdf)"; continue; }
  $MKLIG -i "lig/$NAME.sdf" -o "lig/$NAME.pdbqt" >/dev/null 2>"lig/$NAME.mk.log" || { echo "ligprep fail $NAME"; continue; }
  # dock
  $PY - "$REC" "lig/$NAME.pdbqt" "$NAME" "$CX" "$CY" "$CZ" "$SX" "$SY" "$SZ" <<'PYEOF'
import sys
from vina import Vina
rec,lig,name,cx,cy,cz,sx,sy,sz=sys.argv[1],sys.argv[2],sys.argv[3],*map(float,sys.argv[4:10])
v=Vina(sf_name='vina',cpu=4,seed=42)
v.set_receptor(rec)
v.set_ligand_from_file(lig)
v.compute_vina_maps(center=[cx,cy,cz],box_size=[sx,sy,sz])
v.dock(exhaustiveness=16,n_poses=9)
e=v.energies(n_poses=9)
best=float(e[0][0]); n=len(e)
v.write_poses("lig/%s_out.pdbqt"%name,n_poses=9,overwrite=True)
open("lig/%s.score"%name,"w").write("%s,%.2f,%d\n"%(name,best,n))
print("DOCKED",name,"best=%.2f"%best)
PYEOF
  if [ -f "lig/$NAME.score" ]; then
    read -r line < "lig/$NAME.score"
    echo "$NAME,\"$SMI\",${line#*,}" >> scores.csv
  fi
done < ligands.smi

echo "=== SCORES (sorted) ==="
{ head -1 scores.csv; tail -n +2 scores.csv | sort -t, -k3 -n; } | tee scores_sorted.csv
echo "workdir: $W"