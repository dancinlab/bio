#!/usr/bin/env python3
"""
Drug-like ligand design for the Cx32 (GJB1) L143P TM1/TM4 cryptic pocket.

FREE local (mini, miniforge3 env `fea`): rdkit 2026.3.3.

Pocket coordinates (exports/CMT/gjb1/pockets_L143P.json, pocket #2):
  volume 434 A^3 | center [129.36, 157.79, 171.44] | burial 54.5% | hydrophobic_frac 0.87
  lining (23): ILE20 VAL23 TRP24 SER26 VAL27 ILE28 ILE30 PHE31 MET34
               VAL192 PHE193 ALA196 ALA197 GLY199 ILE200 ILE202 ILE203
               LEU204 VAL206 ALA207 GLU208 VAL210 TYR211

Pharmacophore read of the pocket (honest, d6 -- this is a STRUCTURAL read, not affinity):
  * Dominantly LIPOPHILIC: 14 of 23 lining residues are aliphatic (Ile/Val/Leu/Ala/Met),
    hydrophobic_frac 0.87 -> the bulk of binding energy must come from a flat/branched
    nonpolar aromatic+aliphatic body.
  * AROMATIC CAGE: TRP24, PHE31, PHE193, TYR211 -> a planar/biaryl aromatic core that can
    pi-stack / edge-to-face is favored (this is why the placeholder 2-naphthoate scored best).
  * SINGLE POLAR ANCHOR: GLU208 is the ONLY acidic/polar handle in the lining (SER26 is the
    only other; TYR211 -OH). So a SINGLE H-bond donor or a (de)protonatable basic amine that
    can reach GLU208 gives a directional anchor -- but only ONE; a polar-heavy molecule will
    be desolvation-penalized in this hydrophobic cavity.
  * The cavity is small (434 A^3 ~ a 6-7 heavy-atom-ring + small substituent). MW must stay
    modest (<~350 ideal) or the ligand cannot seat without clashing.

Design constraints (drug-like + peripheral-nerve / CSF delivery aware):
  * Lipinski: MW < 450 (target <380), cLogP < 5 (target 2-4 to seat in the lipophilic cave
    yet stay soluble), HBD <= 3, HBA <= 6.
  * CNS/blood-nerve-barrier heuristics: TPSA < 90 (target < 75), rotatable bonds <= 6,
    aromatic rings <= 3. (Peripheral nerve / CSF intrathecal delivery is the route -- still
    favor low-TPSA lipophilic neutrals or weak bases.)
  * d_novel_only: NOVEL chemotypes -- NOT 2-naphthoate (placeholder), NOT a literal 4-PBA
    analog (anchor), NOT a literal VRT-534 copy (that is the Cx26 prior art). VRT-534's
    *concept* (mutation-selective chaperone) informs us; we deliberately walk into fresh
    chemical space: rigid fused bicyclics, an aza/oxa heteroaromatic biaryl, a benzofuran/
    indazole carboxamide, a fluorinated diaryl ether -- each presents the aromatic-cage +
    single-anchor pharmacophore with a distinct scaffold.

HONEST (d6): docking score (smina/Vina sf) is a RANKING aid, NOT an affinity. Novelty is a
separate gate (agent-2). This step is method progress (placeholder -> real drug-like), NOT
binding validation. No discovery is claimed here.
"""
import sys
from rdkit import Chem
from rdkit.Chem import Descriptors, Crippen, rdMolDescriptors, AllChem

# (name, SMILES, scaffold-family, design rationale)
CANDIDATES = [
    # --- A. rigid fused-bicyclic aromatic acids/amides (fill aromatic cage; single anchor) ---
    ("CX32L1_benzofuran2carboxamide",
     "O=C(N)c1cc2ccccc2o1",
     "benzofuran-2-carboxamide",
     "Planar benzofuran cage (pi-stack TRP24/PHE31), primary amide = single H-bond donor to "
     "GLU208; O of furan modest HBA. Small, rigid, neutral, low TPSA. Novel vs naphthoate."),

    ("CX32L2_indole3acetamide_Nme",
     "O=C(NC)Cc1c[nH]c2ccccc12",
     "indole-3-acetamide",
     "Indole NH + amide donors anchor GLU208/SER26; indole = strong TRP24 pi-mimic. One "
     "rotatable CH2 keeps it flexible enough to seat. Tryptophan-like recognition motif."),

    ("CX32L3_indazole5carboxamide",
     "O=C(N)c1ccc2[nH]ncc2c1",
     "1H-indazole-5-carboxamide",
     "Indazole = bioisostere-rich aza-indole; carboxamide single anchor; two ring N add modest "
     "HBA without overloading polarity. Rigid, flat, fragment-like, novel chemotype."),

    ("CX32L4_quinoline2carboxylic",
     "OC(=O)c1ccc2ccccc2n1",
     "quinoline-2-carboxylic acid",
     "Aza-analog of the naphthoate placeholder: ring N replaces a CH -> NEW chemotype (not "
     "naphthoate), carboxylate salt-bridge/H-bond to backbone; planar biaromatic for cage."),

    # --- B. heteroaromatic biaryls (extend across the elongated cavity, single polar tail) ---
    ("CX32L5_biphenyl_carboxamide_F",
     "O=C(N)c1ccc(-c2ccc(F)cc2)cc1",
     "4'-fluoro-biphenyl-4-carboxamide",
     "Biaryl spans the long axis of the cave (Phe193..Tyr211); para-F tunes lipophilicity and "
     "blocks metabolic oxidation; amide single anchor. Flat, rigid, drug-like."),

    ("CX32L6_phenyl_pyridine_amide",
     "O=C(N)c1ccc(-c2ccncc2)cc1",
     "4-(pyridin-4-yl)benzamide",
     "Pyridine N = weak base / HBA toward GLU208 carboxylate (charge complementarity), benzamide "
     "anchor; aza-biaryl is a fresh scaffold vs all placeholders. Low TPSA, CNS-friendly."),

    ("CX32L7_benzothiophene_carboxamide",
     "O=C(N)c1cc2ccccc2s1",
     "benzo[b]thiophene-2-carboxamide",
     "Sulfur-rich lipophilic fused aromatic (S contacts MET34); high logP body for the 0.87 "
     "hydrophobic cave, single amide anchor. Distinct heteroatom chemotype."),

    # --- C. fluorinated diaryl ether / sulfone (lipophilic, metabolically robust) ---
    ("CX32L8_diaryl_ether_F",
     "Oc1ccc(Oc2ccc(F)cc2)cc1",
     "4-(4-fluorophenoxy)phenol",
     "Diaryl ether = flexible bent biaryl matching the kinked cavity; phenol -OH single donor to "
     "GLU208; F for lipophilicity/stability. Very low TPSA, neutral, BBB/BNB-permeant heuristic."),

    ("CX32L9_aryl_sulfone_aniline",
     "Nc1ccc(cc1)S(=O)(=O)c1ccccc1",
     "4-(phenylsulfonyl)aniline",
     "Sulfone = rigid tetrahedral linker holding two aryls in the cage; aniline NH2 single anchor; "
     "sulfone O's accept H-bond from SER26. New vs all prior fragments."),

    # --- D. saturated/aromatic hybrid bicyclics (fit small volume, add 3D character) ---
    ("CX32L10_tetrahydronaphthylamine",
     "NC1CCc2ccccc2C1",
     "2-aminotetralin",
     "Aminotetralin = half-saturated naphthalene -> fits the 434 A^3 volume better than flat "
     "naphthalene, basic amine forms a salt bridge to GLU208 (charge anchor). Classic CNS "
     "privileged scaffold; novel here for connexin."),

    ("CX32L11_chromane_carboxamide",
     "O=C(N)C1CCc2ccccc2O1",
     "chromane-2-carboxamide",
     "Chromane (benzopyran) = lipophilic O-heterocycle, amide single anchor, sp3 center adds 3D "
     "complementarity to a non-flat sub-pocket. Drug-like, novel chemotype."),

    ("CX32L12_methylindole_carbonitrile",
     "N#Cc1ccc2[nH]c(C)cc2c1",
     "2-methyl-1H-indole-5-carbonitrile",
     "Indole pi-cage + nitrile (linear, small HBA toward GLU208/backbone, low TPSA), 2-Me fills a "
     "lipophilic notch. Fragment-sized, high LE, novel."),

    # --- E. VRT-534-INSPIRED but deliberately new (concept reuse, scaffold divergence) ---
    ("CX32L13_aminothiazole_benzamide",
     "O=C(Nc1nccs1)c1ccccc1",
     "N-(thiazol-2-yl)benzamide",
     "Aminothiazole-amide = a pharma-privileged H-bond pairing motif (donor+acceptor face to "
     "GLU208), aryl body for the cage. VRT-534 *logic* (one directional anchor + lipophilic body) "
     "in an unrelated scaffold. Drug-like, low MW."),

    ("CX32L14_difluoro_benzimidazole",
     "Fc1ccc2[nH]c(-c3ccccc3)nc2c1",
     "5-fluoro-2-phenyl-1H-benzimidazole",
     "Benzimidazole = robust flat aza-aromatic (NH donor + N acceptor = single bifurcated anchor), "
     "2-phenyl extends into the cage, 5-F lipophilicity/metabolic block. Privileged, novel here."),

    ("CX32L15_naphthyridine_amine",
     "Nc1ccc2ccncc2n1",
     "1,7-naphthyridin-2-amine",
     "Di-aza-naphthalene (vs carbocyclic naphthoate placeholder) -> maximally novel aromatic cage "
     "core, exocyclic NH2 anchor + ring N's for charge complementarity to GLU208. Compact, flat."),
]

# anchors / references (kept for comparison, labeled)
REFERENCES = [
    ("REF_2naphthoate_PLACEHOLDER", "O=C(O)c1ccc2ccccc2c1", "placeholder", "prior best placeholder"),
    ("REF_4PBA_anchor",            "OC(=O)CCCc1ccccc1",     "anchor",      "4-PBA method anchor"),
]

LIPINSKI = "MW<450 cLogP<5 HBD<=5 HBA<=10 (drug-likeness); CNS: TPSA<90 RotB<=8 ArRings<=3"


def props(smi):
    m = Chem.MolFromSmiles(smi)
    if m is None:
        return None
    return {
        "mol": m,
        "MW": round(Descriptors.MolWt(m), 1),
        "cLogP": round(Crippen.MolLogP(m), 2),
        "HBD": rdMolDescriptors.CalcNumHBD(m),
        "HBA": rdMolDescriptors.CalcNumHBA(m),
        "TPSA": round(rdMolDescriptors.CalcTPSA(m), 1),
        "RotB": rdMolDescriptors.CalcNumRotatableBonds(m),
        "ArRings": rdMolDescriptors.CalcNumAromaticRings(m),
        "HeavyAt": m.GetNumHeavyAtoms(),
        "Fsp3": round(rdMolDescriptors.CalcFractionCSP3(m), 2),
    }


def lipinski_ok(p):
    # classic Ro5 + our pocket/CNS targets
    viol = []
    if p["MW"] >= 450:  viol.append("MW")
    if p["cLogP"] >= 5: viol.append("cLogP")
    if p["HBD"] > 5:    viol.append("HBD")
    if p["HBA"] > 10:   viol.append("HBA")
    cns = []
    if p["TPSA"] >= 90:  cns.append("TPSA")
    if p["RotB"] > 8:    cns.append("RotB")
    if p["ArRings"] > 3: cns.append("ArRings")
    return viol, cns


def main():
    out_smi = sys.argv[1] if len(sys.argv) > 1 else None
    rows = []
    print(f"{'name':38s} {'MW':>6} {'cLogP':>6} {'HBD':>4} {'HBA':>4} {'TPSA':>6} "
          f"{'RotB':>5} {'ArR':>4} {'Fsp3':>5} {'Ro5':>5} {'CNS':>5}")
    print("-" * 120)
    all_sets = [("CAND", CANDIDATES), ("REF", REFERENCES)]
    smi_lines = []
    for tag, cset in all_sets:
        for name, smi, fam, why in cset:
            p = props(smi)
            if p is None:
                print(f"{name:38s}  PARSE_FAIL  {smi}")
                continue
            viol, cns = lipinski_ok(p)
            ro5 = "PASS" if not viol else "/".join(viol)
            cnsv = "PASS" if not cns else "/".join(cns)
            print(f"{name:38s} {p['MW']:6.1f} {p['cLogP']:6.2f} {p['HBD']:4d} {p['HBA']:4d} "
                  f"{p['TPSA']:6.1f} {p['RotB']:5d} {p['ArRings']:4d} {p['Fsp3']:5.2f} "
                  f"{ro5:>5} {cnsv:>5}")
            rows.append((tag, name, smi, fam, why, p, ro5, cnsv))
            smi_lines.append(f"{smi} {name}")
    if out_smi:
        with open(out_smi, "w") as fh:
            fh.write("\n".join(smi_lines) + "\n")
        print(f"\n[wrote] {out_smi} ({len(smi_lines)} mols)")
    return rows


if __name__ == "__main__":
    main()
