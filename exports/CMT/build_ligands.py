#!/usr/bin/env python3
# Build 3D ligand SDFs for the 4 CMT small-molecule candidates from their (PLACEHOLDER
# scaffold) SMILES via rdkit ETKDGv3 embed + MMFF optimize. Writes lig_<RESN>.sdf so
# abfe_cmt.py's ideal-conformer + pocket-centroid fallback path can consume them.
# NOTE: these SMILES are Phase-beta scaffold PLACEHOLDERS, so any downstream affinity
# is SCAFFOLD-LEVEL, not a final-molecule number (governance d6 honesty).
import sys
from rdkit import Chem
from rdkit.Chem import AllChem

# RESN labels mirror the pockets.json "lig" key (synthetic 3-char tags for CMT candidates)
CANDS = {
    "HD6": "OC(=O)c1ccc(NC(=O)CN2C(=S)NN=C2c2ccccc2)cc1",   # HDAC6  hxq-cmt-hd6-001
    "SR1": "Nc1nc2cc(F)c(F)cc2c(=O)n1Cc1ccncc1",            # SARM1  hxq-cmt-sar1-001
    "CL1": "OC(=O)c1ccccc1Nc1ccc(C(F)(F)F)nc1F",            # ClC-1  hxq-cmt-clc1-001
    "MF2": "O=C(NC1CCCCC1NC(=O)c1cccnc1)c1cccnc1",          # MFN2   hxq-cmt-mfn2-001
}

for resn, smi in CANDS.items():
    m = Chem.MolFromSmiles(smi)
    if m is None:
        print(f"PARSE_FAIL {resn} {smi}"); continue
    heavy = m.GetNumAtoms()
    mh = Chem.AddHs(m)
    p = AllChem.ETKDGv3(); p.randomSeed = 0xC47
    if AllChem.EmbedMolecule(mh, p) != 0:
        # retry with random coords if ETKDG fails
        p.useRandomCoords = True
        AllChem.EmbedMolecule(mh, p)
    try:
        AllChem.MMFFOptimizeMolecule(mh, maxIters=2000)
    except Exception as e:
        print(f"MMFF_WARN {resn} {e}")
    mh.SetProp("_Name", f"CMT_{resn}")
    out = f"lig_{resn}.sdf"
    w = Chem.SDWriter(out); w.write(mh); w.close()
    total = mh.GetNumAtoms()
    print(f"BUILT {resn} {out} heavy={heavy} total={total}")
