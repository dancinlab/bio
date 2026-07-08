#!/usr/bin/env python3
# Trim a co-crystal PDB to a single-chain pocket sphere so the solvated ABFE box stays
# tractable (~tens of k atoms, not 400k). Keeps ATOM records of the pocket-bearing chain
# whose residues have ANY atom within RADIUS of the pocket center, plus catalytic metals
# (ZN/MG/MN/CA-ion) of that chain within the same sphere. Writes <pdb>_trim.pdb.
#   usage: trim_receptor.py <pdb_basename> <chain> <cx> <cy> <cz> [radius_A]
import sys
pdb, chain = sys.argv[1], sys.argv[2]
cx, cy, cz = map(float, sys.argv[3:6])
R = float(sys.argv[6]) if len(sys.argv) > 6 else 18.0
R2 = R * R
METALS = {"ZN", "MG", "MN", "FE", "NI", "CO", "CU"}

def d2(l):
    return (float(l[30:38])-cx)**2 + (float(l[38:46])-cy)**2 + (float(l[46:54])-cz)**2

# pass 1: which (resseq,icode) of the chain have any atom inside the sphere
keep_res = set()
lines = open(pdb + ".pdb").readlines()
for l in lines:
    if l.startswith("ATOM") and l[21] == chain and d2(l) <= R2:
        keep_res.add(l[22:27])
# pass 2: emit all atoms of kept residues (whole residues, no dangling) + nearby metals
out = []
for l in lines:
    if l.startswith("ATOM") and l[21] == chain and l[22:27] in keep_res:
        out.append(l)
    elif l.startswith("HETATM") and l[21] == chain and l[17:20].strip() in METALS and d2(l) <= R2:
        out.append(l)
out.append("END\n")
with open(pdb + "_trim.pdb", "w") as f:
    f.writelines(out)
n_atom = sum(1 for l in out if l.startswith("ATOM"))
n_het = sum(1 for l in out if l.startswith("HETATM"))
print(f"TRIM {pdb} chain {chain} R={R} -> residues={len(keep_res)} atoms={n_atom} metals={n_het}")
