# 🧬 GJB1/Cx32 pharmacological-chaperone fold-rescue — FREE in-silico scaffold campaign

**icon** 🧬 · **name** GJB1/Cx32 chaperone-rescue · **alias** "the drug that re-folds broken Connexin-32 in CMTX1"

**Date:** 2026-06-22 · **Scope:** FREE in-silico only (local mini + summer CPU). No paid rent; did NOT touch the HDAC6 ABFE GPU job on summer. **Honesty (d6): scaffold/estimate-level throughout** — empirical force fields + geometric pocket finder + rigid-receptor docking, NOT FEP/ABFE. SMILES marked PLACEHOLDER are not final molecules.

**Axis rationale (d_novel_only):** Per `exports/CMT/research/REPORT.md`, GJB1 is the ONE genuinely-open CMT axis — every competitor (Kleopa AAVrh10-GJB1, Armatus, Elpida) does **gene replacement**; **small-molecule pharmacological-chaperone rescue of misfolded Cx32 is unoccupied.** Goal = a small molecule that re-stabilizes a misfolded/trafficking-defective mutant Cx32 to restore ER→Golgi→membrane trafficking and gap-junction function in CMTX1. **Novelty: PENDING** a mutation-specific rescue mechanism + pre-registered falsifier (this run produces the coordinates, not a verified discovery).

---

## 1 · Structure

**Chosen:** **PDB 7ZXM** — cryo-EM human Cx32 (GJB1) gap-junction channel, **2.14 Å** (highest-resolution WT entry; Qi/Unger et al., *Sci Adv* 2023, [doi:10.1126/sciadv.adh4890](https://www.science.org/doi/10.1126/sciadv.adh4890)). **No homology model needed** — a real, high-resolution *human* Cx32 structure exists (the prompt's fallback to Cx26/Cx46 homology was not required).

Companion entries downloaded for cross-reference (all `structures/`): 7ZXN (GJC 3.06 Å), 7ZXO (GJC 2.50 Å), **7ZXP** (R22G GJC 2.39 Å), **7ZXQ** (R22G hemichannel), **7ZXT** (W3S hemichannel) — i.e. experimental CMT1X-mutant structures also exist for W3S and R22G.

**Working receptor:** chain A monomer extracted from 7ZXM (`structures/cx32_monomer_chainA.pdb`, 177 residues). **Modeled range = 16–217** with an internal **chain break 103→129** (the unmodeled intracellular loop) — so W3 and R220 are NOT in the structure and were excluded; all 5 chosen mutation sites ARE modeled with correct WT identity.

---

## 2 · Destabilizing CMT1X mutations + folding ΔΔG

**Tool:** **EvoEF2** (free, BSD; Huang et al., *Bioinformatics* 2020;36(4):1135) — `RepairStructure → ComputeStability(WT) → BuildMutant → ComputeStability`. ΔΔG_fold = G_mut − G_WT (EvoEF2 stability units ≈ kcal/mol; **positive = destabilizing**). Built/run locally on mini. *Honest caveat: empirical force field, single-conformer, monomer-context — estimate-level, not FEP.*

**Mutation set** = literature-verified CMT1X trafficking-defective loss-of-function missenses from **Vavlitou et al., "Golgi-retained Cx32 mutants interfere with gene addition therapy for CMT1X," *Hum Mol Genet* 2017;26(9):1622** ([doi:10.1093/hmg/ddx064](https://dx.doi.org/10.1093/hmg/ddx064)) — each is a published ER- or Golgi-retained mutant (NOT surface-trafficked), i.e. genuine misfolding/trafficking LOF.

| mutation | region (Vavlitou 2017) | G_WT | G_mut | **ΔΔG_fold (kcal/mol)** | rank |
|---|---|---|---|---|---|
| **L143P** | Golgi-retained | −890.42 | −863.21 | **+27.21** | **1 (top)** |
| R183S | Golgi-retained | −890.42 | −885.29 | +5.13 | 2 |
| T55I | ER-retained | −890.42 | −887.62 | +2.80 | 3 |
| N175D | Golgi-retained, dominant-neg | −890.42 | −889.88 | +0.54 | 4 |
| R75W | Golgi-retained, dominant-neg | −890.42 | −890.52 | −0.10 | 5 |

**Top destabilizer = L143P (+27.2 kcal/mol)** — physically sensible: a Pro substitution in a transmembrane α-helix is a classic helix/packing breaker, consistent with its Golgi-retention LOF phenotype. R75W/N175D (the dominant-negative Golgi mutants) score near-neutral *for monomer folding* — consistent with the literature view that their defect is at the **oligomerization/trafficking-signal** level (they impair WT co-trafficking) rather than monomer thermodynamic stability, so a monomer ΔΔG appropriately does not flag them. **L143P is the cleanest fold-stability target for a chaperone.**

---

## 3 · Druggable cavity

**Tool:** custom FREE geometric alpha-sphere-style cavity finder (`scripts/find_pockets.py`, numpy-only; fpocket unavailable locally). Detects enclosed (buried, multi-direction-covered) solvent voxels, clusters them, scores volume·burial·hydrophobicity (composite druggability normalized 0–1). *Heuristic, estimate-level.*

Run on **WT monomer** and **L143P mutant monomer**, targeting residue 143:

- **WT:** dominant cavity P1 = the central **connexon pore lumen** (6698 Å³) — too large to be a discrete drug site (artifact of pore axis); near residue 143 the WT has only a vestigial 12 Å³ void.
- **L143P mutant — KEY RESULT:** a **new discrete druggable pocket opens (P2)** that is essentially absent in WT:
  - **Volume 434 Å³ · hydrophobicity 0.87 · only 14.6 Å from residue 143 · 23 lining residues · center [129.36, 157.79, 171.44]**
  - **Lining = TM1 + TM4 inter-helix interface:** TM1 {I20, V23, W24, V27, I28, I30, F31, M34} + TM4 {V192, F193, A196, A197, I200, I202, I203, L204, V206, A207, V210, Y211}.
  - In WT the nearest cavity to this center is only 12 Å³ → **the L143P mutation creates a TM1/TM4 packing defect = a hydrophobic inter-helical cavity.**

This is the textbook target for a pharmacological chaperone: a **mutation-induced hydrophobic cavity adjacent to the destabilized site** that a drug-like molecule can fill to restore helix packing and re-stabilize the fold. (`pockets_L143P.json`, `pockets_wt_monomer.json`)

---

## 4 · Docking candidates

**Tool:** **AutoDock Vina 1.2.7** (free) on summer CPU (rbfe micromamba env), exhaustiveness 16, 9 poses, 4 CPU/ligand, `nice -15` — GPU untouched. Receptor = L143P mutant monomer (pdbfixer-cleaned → `prepare_receptor4`); ligands = RDKit ETKDGv3+MMFF 3D → meeko PDBQT. **Box = the L143P P2 pocket** (center [129.36,157.79,171.44], 22³ Å). (`docking/scores_sorted.csv`)

| candidate | class | Vina best (kcal/mol) |
|---|---|---|
| **2-naphthoate** | aromatic acid · PLACEHOLDER | **−5.98 (best)** |
| halo-benzamide (4-Cl-N-(4-F-phenyl)benzamide) | drug-like · PLACEHOLDER | −5.67 |
| benzanilide | hydrophobic frag · PLACEHOLDER | −5.55 |
| benzotrifluoride | lipophilic probe · PLACEHOLDER | −5.53 |
| **4-phenylbutyrate (4-PBA)** | **REAL clinical chem-chaperone** | **−5.49** |
| phenylacetate | REAL (4-PBA metabolite) | −5.35 |
| 1-naphthol | aromatic frag · PLACEHOLDER | −5.18 |
| tolylsulfonamide | drug-like frag · PLACEHOLDER | −4.99 |
| 4-hydroxybenzoate | frag · PLACEHOLDER | −4.83 |
| glucose | osmolyte · POS-CTRL | −4.66 |
| sorbitol | osmolyte · POS-CTRL | −4.48 |
| 4-hydroxybutyrate | PBA-analog · PLACEHOLDER | −3.99 |
| glycerol | osmolyte · POS-CTRL | −3.62 |
| TMAO | osmolyte · POS-CTRL | −2.70 |

**Best = 2-naphthoate (−5.98).** **Control behavior validates the pocket:** flat lipophilic aromatics rank top; the real chemical chaperone **4-PBA (−5.49)** scores well; and the small polar osmolyte positive controls (glycerol/TMAO/sorbitol, −2.7 to −4.5) rank **weakest** — exactly as expected, since osmolytes act by bulk crowding, not specific binding to a hydrophobic cavity. The score ladder discriminating aromatics > 4-PBA > osmolytes is a sanity signal the hydrophobic TM1/TM4 pocket is real and druggable.

---

## 5 · Honest caveats & next step

**Caveats (d6):**
- **All affinities are scaffold-level.** EvoEF2 ΔΔG = empirical, single-conformer, monomer-context. Pocket finder = geometric heuristic. Vina = rigid receptor, no membrane. Numbers rank/coordinate, they do not measure.
- **No membrane.** Cx32 is a 4-TM membrane protein; the TM1/TM4 pocket is lipid-adjacent. A real campaign must embed in a POPC bilayer (CHARMM-GUI) before any free-energy claim — same lesson as the ClC-1 lane in `research/REPORT.md`.
- **Monomer context.** Pocket/ΔΔG computed on a single subunit; the connexon is hexameric — oligomerization effects (esp. for the dominant-negative R75W/N175D) are not captured.
- **Top placeholder ligands are not drug candidates** — they coordinate the pharmacophore (flat lipophilic aromatic that fills the TM1/TM4 cavity), not a molecule to synthesize.
- **Novelty PENDING** — the *axis* is open, but no mutation-specific rescue mechanism is yet verified; needs a pre-registered falsifier (d_novel_only / d_paper_significance).

**Recommended next step (single, concrete):**
> **Take mutant = L143P, pocket = the TM1/TM4 hydrophobic cavity (center [129.36,157.79,171.44]), lead pharmacophore = flat lipophilic aromatic acid (2-naphthoate-like) / 4-PBA-class, to a membrane ABFE.**
> 1. Embed L143P Cx32 (full hexamer or a TM1–TM4 helix bundle) in a **POPC bilayer** (CHARMM-GUI), equilibrate apo.
> 2. Dock a clash-free pose of 2-naphthoate / 4-PBA into the TM1/TM4 cavity (flexible F31/F193/Y211 sidechains), write `*_bound.sdf`.
> 3. **ABFE (FREE on summer GPU when the HDAC6 job clears)** with the existing `exports/CMT/abfe_cmt.py` engine; **method-anchor with 4-PBA** (a real chemical chaperone) for pipeline-validation only — not as the claimed result (d_novel_only).
> 4. **Falsifier to pre-register:** "a small molecule occupying the L143P TM1/TM4 cavity lowers the mutant's destabilization (ΔΔG_bind that offsets the +27 kcal/mol fold penalty) and rescues surface trafficking in a Cx32-L143P cell assay." If ABFE shows no selective binding to the mutant cavity vs WT, the axis closes negative for this pocket.

---

## Provenance / files (commons c5)

- `structures/` — 7ZXM (WT, used) + 7ZXN/7ZXO/7ZXP/7ZXQ/7ZXT companions + extracted monomer.
- `scripts/run_ddg.sh` (EvoEF2 ΔΔG driver) · `scripts/find_pockets.py` (cavity finder) · `scripts/clean_receptor.py` (pdbfixer) · `scripts/dock_summer.sh` (Vina) · `scripts/ligands.smi` · `scripts/EvoEF2_LICENSE`.
- `ddg/` — repaired WT + 5 mutant models + stability logs + `ddg_results.csv`.
- `pockets_wt_monomer.json` · `pockets_L143P.json`.
- `docking/` — `scores_sorted.csv` + best/4-PBA/halo-benzamide pose pdbqt + receptor.pdbqt + dock.log.

**Engines:** EvoEF2 (mini, free) · Vina 1.2.7 + meeko + prepare_receptor4 + rdkit + pdbfixer (summer rbfe env, FREE CPU). **GPU ABFE on summer untouched. No paid rent.**
