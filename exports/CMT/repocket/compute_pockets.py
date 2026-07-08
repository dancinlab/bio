#!/usr/bin/env python3
# Compute corrected pocket centers for SARM1 + MFN2 (CMT re-pocket pass).
#
#  SARM1 -> 7NAL chain A, ARM-domain ALLOSTERIC NMN regulatory pocket.
#           center = bound NMN (resn NMN, chain A) centroid. (replaces 7NAK 1QD TIR
#           catalytic site, which carries the published activation-paradox liability.)
#  MFN2  -> AlphaFold human MFN2 (UniProt O95140, full 1-757 incl. HR2).
#           center = centroid of the HR1<->HR2 conformational-interface pharmacophore
#           CA atoms (Rocha 2018 Science): HR1 Val372/Met376/His380 + HR2 Asp725/Leu727.
#           (replaces 6JFK GDP G-site, which LACKS HR2 entirely.)
import sys
import numpy as np

def coords(pdb, pred):
    out = []
    for l in open(pdb):
        if (l.startswith("ATOM") or l.startswith("HETATM")) and pred(l):
            out.append([float(l[30:38]), float(l[38:46]), float(l[46:54])])
    return np.array(out)

# ---- SARM1: NMN centroid on 7NAL chain A ----
sarm = coords("7NAL.pdb",
              lambda l: l.startswith("HETATM") and l[17:20].strip() == "NMN" and l[21] == "A")
sarm_c = sarm.mean(axis=0)
print(f"SARM1 7NAL/A NMN: {len(sarm)} atoms  center = "
      f"[{sarm_c[0]:.2f}, {sarm_c[1]:.2f}, {sarm_c[2]:.2f}]")

# ---- MFN2: HR1-HR2 pharmacophore CA centroid on AlphaFold model ----
PHARM = {372, 376, 380, 725, 727}
mfn_ca = coords("AF-O95140-MFN2.pdb",
                lambda l: l.startswith("ATOM") and l[12:16].strip() == "CA"
                and (int(l[22:26]) in PHARM))
mfn_c = mfn_ca.mean(axis=0)
print(f"MFN2 AF/HR1-HR2 pharmacophore: {len(mfn_ca)} CA  center = "
      f"[{mfn_c[0]:.2f}, {mfn_c[1]:.2f}, {mfn_c[2]:.2f}]")

# print HR1<->HR2 separation sanity (the interface must be a real contact, not far apart)
hr1 = coords("AF-O95140-MFN2.pdb",
             lambda l: l.startswith("ATOM") and l[12:16].strip() == "CA"
             and int(l[22:26]) in {372, 376, 380})
hr2 = coords("AF-O95140-MFN2.pdb",
             lambda l: l.startswith("ATOM") and l[12:16].strip() == "CA"
             and int(l[22:26]) in {725, 727})
dmin = min(np.linalg.norm(a - b) for a in hr1 for b in hr2)
print(f"MFN2 HR1<->HR2 min CA-CA distance = {dmin:.1f} A "
      f"({'CONTACT (interface formed)' if dmin < 15 else 'FAR — interface not folded in this model'})")

import json
print("JSON_SARM1", json.dumps([round(x, 2) for x in sarm_c.tolist()]))
print("JSON_MFN2", json.dumps([round(x, 2) for x in mfn_c.tolist()]))
