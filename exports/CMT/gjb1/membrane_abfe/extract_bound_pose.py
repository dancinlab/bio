#!/usr/bin/env python3
"""Extract the top Vina pose (MODEL 1) from a docking .pdbqt into an RDKit SDF
with the SMILES-defined bond orders, KEEPING the docked (receptor-frame) coords.

This produces the clash-free *bound* ligand pose used by the membrane ABFE deck
(BOUND_POSE path) — the ideal-conformer-overlaid-by-centroid route clashes in the
tight TM1/TM4 cavity (the ClC-1 NaN lesson). Here the ligand atoms already sit in
the L143P pocket (Vina pose), and the protein is embedded in POPC, so the alchemical
minimize starts clash-free.

Usage: extract_bound_pose.py <in.pdbqt> <smiles> <out.sdf>
"""
import sys
from rdkit import Chem
from rdkit.Chem import AllChem
from rdkit.Geometry import Point3D


def parse_pdbqt_model1(path):
    """Return list of (element, x, y, z) for ATOM/HETATM in MODEL 1, skipping H."""
    coords = []
    in_model = False
    for line in open(path):
        if line.startswith("MODEL"):
            if in_model:
                break  # only MODEL 1
            in_model = True
            continue
        if line.startswith(("ATOM", "HETATM")) and in_model:
            # pdbqt: cols 31-54 are x,y,z (8.3f each); autodock type in last field
            x = float(line[30:38]); y = float(line[38:46]); z = float(line[46:54])
            adtype = line[77:79].strip()
            # heavy atoms only: skip H / HD / polar-H
            if adtype in ("H", "HD"):
                continue
            # element = first letter of pdb atom name / autodock type
            name = line[12:16].strip()
            elem = "".join(c for c in name if c.isalpha())[:2]
            # normalize aromatic carbon "A" autodock type
            if adtype == "A":
                elem = "C"
            coords.append((elem, x, y, z))
    return coords


def main():
    pdbqt, smiles, out_sdf = sys.argv[1], sys.argv[2], sys.argv[3]
    mol = Chem.MolFromSmiles(smiles)
    mol = Chem.AddHs(mol)
    AllChem.EmbedMolecule(mol, AllChem.ETKDGv3())
    AllChem.MMFFOptimizeMolecule(mol)
    mol_noH = Chem.RemoveHs(mol)

    docked = parse_pdbqt_model1(pdbqt)
    n_heavy = mol_noH.GetNumAtoms()
    if len(docked) != n_heavy:
        print(f"[warn] heavy-atom count mismatch: SMILES={n_heavy} pdbqt={len(docked)} "
              f"-> aligning by min(count); pose may be approximate", file=sys.stderr)
    n = min(len(docked), n_heavy)
    conf = mol_noH.GetConformer()
    for i in range(n):
        _, x, y, z = docked[i]
        conf.SetAtomPosition(i, Point3D(x, y, z))

    # re-add Hs at the docked heavy-atom frame (constrained to docked heavies)
    mol_h = Chem.AddHs(mol_noH, addCoords=True)
    w = Chem.SDWriter(out_sdf)
    w.write(mol_h)
    w.close()
    print(f"wrote {out_sdf}  ({mol_h.GetNumAtoms()} atoms, {n} heavy from docked pose)")


if __name__ == "__main__":
    main()
