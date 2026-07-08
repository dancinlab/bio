#!/usr/bin/env python3
# FREE druggable-cavity detection for Cx32 (fpocket unavailable locally).
# Method: grid-based alpha-sphere-style cavity finder —
#   1. Voxelize a padded bounding box around the protein (1.0 A grid).
#   2. Mark grid points that are SOLVENT (no protein heavy atom within vdW+probe)
#      but BURIED (≥ N protein atoms within an outer shell, in ≥ K directions) →
#      enclosed cavity points, not bulk solvent / convex surface.
#   3. Cluster adjacent cavity points (6-connectivity) into pockets.
#   4. Score each pocket:  volume (n_points), burial (mean neighbor count),
#      hydrophobicity fraction of lining residues, and a composite
#      "druggability" heuristic ∝ volume·burial·(0.4+0.6·hydrophobic_frac),
#      normalized 0..1 across pockets. (Heuristic — labelled estimate, d6.)
#   5. Report lining residues + distance of pocket centroid to a target residue
#      (the destabilized mutation site) so we can favor near-defect cavities.
# Dependencies: numpy only (stdlib PDB parse). Pure-CPU, seconds.
import sys, numpy as np
from collections import defaultdict

VDW = {"C":1.70,"N":1.55,"O":1.52,"S":1.80,"H":1.20,"P":1.80}
HYDROPHOBIC = {"ALA","VAL","LEU","ILE","MET","PHE","TRP","PRO","GLY","CYS"}

def parse(pdb, chain=None):
    atoms=[]  # (x,y,z,elem,resn,resi,chain,name)
    for ln in open(pdb):
        if not ln.startswith("ATOM"): continue
        if chain and ln[21]!=chain: continue
        elem=ln[76:78].strip() or ln[12:16].strip()[0]
        elem=elem[0].upper() if elem else "C"
        if elem=="H": continue
        atoms.append((float(ln[30:38]),float(ln[38:46]),float(ln[46:54]),
                      elem, ln[17:20].strip(), int(ln[22:26]), ln[21], ln[12:16].strip()))
    return atoms

def find(pdb, chain="A", target_resi=None, grid=1.0, probe=1.4):
    atoms=parse(pdb, chain)
    xyz=np.array([(a[0],a[1],a[2]) for a in atoms])
    rad=np.array([VDW.get(a[3],1.7) for a in atoms])
    lo=xyz.min(0)-5; hi=xyz.max(0)+5
    gx=np.arange(lo[0],hi[0],grid); gy=np.arange(lo[1],hi[1],grid); gz=np.arange(lo[2],hi[2],grid)
    # candidate solvent points: not inside any vdW+probe sphere
    cav=[]
    # spatial hash for speed
    cell=4.0
    hsh=defaultdict(list)
    for i,(x,y,z) in enumerate(xyz):
        hsh[(int(x//cell),int(y//cell),int(z//cell))].append(i)
    def near(p, r):
        cx,cy,cz=int(p[0]//cell),int(p[1]//cell),int(p[2]//cell)
        out=[]
        rr=int(r//cell)+1
        for dx in range(-rr,rr+1):
            for dy in range(-rr,rr+1):
                for dz in range(-rr,rr+1):
                    out+=hsh.get((cx+dx,cy+dy,cz+dz),[])
        return out
    pts=[]
    for x in gx:
        for y in gy:
            for z in gz:
                p=np.array([x,y,z]); cand=near(p,6.0)
                if not cand: continue
                d=np.linalg.norm(xyz[cand]-p,axis=1)
                # solvent point: no atom within vdW+probe
                if np.any(d < rad[np.array(cand)]+probe): continue
                # buriedness: count atoms in shell 2..8 A across directions
                shell=np.array(cand)[(d>2)&(d<9)]
                if len(shell)<8: continue
                # directional coverage: project onto 14 directions, need >=10 covered
                vecs=(xyz[shell]-p); vecs/=np.linalg.norm(vecs,axis=1,keepdims=True)
                dirs=np.array([[1,0,0],[-1,0,0],[0,1,0],[0,-1,0],[0,0,1],[0,0,-1],
                               [1,1,1],[-1,-1,-1],[1,-1,1],[-1,1,-1],[1,1,-1],[-1,-1,1],[1,-1,-1],[-1,1,1]],float)
                dirs/=np.linalg.norm(dirs,axis=1,keepdims=True)
                cov=np.sum((vecs@dirs.T).max(0)>0.5)
                if cov<11: continue  # enclosed in most directions = real cavity
                pts.append((x,y,z,len(shell)))
    if not pts:
        return {"pdb":pdb,"chain":chain,"pockets":[]}
    P=np.array([(p[0],p[1],p[2]) for p in pts]); bur=np.array([p[3] for p in pts])
    # cluster by 6-connectivity (grid step)
    idx={tuple(np.round((p-lo)/grid).astype(int)):i for i,p in enumerate(P)}
    seen=set(); clusters=[]
    for key,i in idx.items():
        if i in seen: continue
        stack=[key]; comp=[]
        while stack:
            k=stack.pop()
            if k not in idx: continue
            j=idx[k]
            if j in seen: continue
            seen.add(j); comp.append(j)
            kx,ky,kz=k
            for dk in [(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)]:
                nk=(kx+dk[0],ky+dk[1],kz+dk[2])
                if nk in idx and idx[nk] not in seen: stack.append(nk)
        if len(comp)>=10: clusters.append(comp)
    pockets=[]
    for comp in clusters:
        cp=P[comp]; cb=bur[comp]
        cen=cp.mean(0)
        # lining residues: protein residues within 5A of any cavity pt
        lining=set()
        for pt in cp:
            cand=near(pt,6.0)
            for ci in cand:
                if np.linalg.norm(xyz[ci]-pt)<5.0:
                    lining.add((atoms[ci][4],atoms[ci][5]))
        hyd=sum(1 for rn,_ in lining if rn in HYDROPHOBIC)/max(1,len(lining))
        vol=len(comp)*grid**3
        burial=float(cb.mean())
        drug = vol*burial*(0.4+0.6*hyd)
        d_target=None
        if target_resi is not None:
            tca=[a for a in atoms if a[5]==target_resi and a[7]=="CA" ]
            if tca:
                d_target=float(np.linalg.norm(np.array(tca[0][:3])-cen))
        pockets.append(dict(volume_A3=round(vol,1), n_points=len(comp),
                            burial=round(burial,2), hydrophobic_frac=round(hyd,2),
                            drug_raw=drug, center=[round(float(c),2) for c in cen],
                            n_lining=len(lining),
                            lining=sorted([f"{rn}{ri}" for rn,ri in lining], key=lambda s:int(''.join(filter(str.isdigit,s)))),
                            dist_to_target=None if d_target is None else round(d_target,1)))
    if pockets:
        mx=max(p["drug_raw"] for p in pockets)
        for p in pockets:
            p["druggability"]=round(p["drug_raw"]/mx,3); del p["drug_raw"]
        pockets.sort(key=lambda p:-p["druggability"])
    return {"pdb":pdb,"chain":chain,"target_resi":target_resi,"pockets":pockets}

if __name__=="__main__":
    import json
    pdb=sys.argv[1]; chain=sys.argv[2] if len(sys.argv)>2 else "A"
    tgt=int(sys.argv[3]) if len(sys.argv)>3 else None
    r=find(pdb, chain, tgt)
    print(json.dumps(r, indent=2))
