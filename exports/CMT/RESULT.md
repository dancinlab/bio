# CMT FREE in-silico binding-validation campaign — ABFE results

**Date:** 2026-06-22 · **Compute:** summer (RTX5070, micromamba `fep` env) — FREE local pool, NO paid rent.
**Harness:** reused `exports/SENOLYX/round13-abfe-allcand/abfe_cand.py` (double-decoupling ABFE
+ MBAR, 20-window λ-schedule, multi-replica seeds) verbatim as `abfe_cmt.py`; only `pockets.json`
+ per-target ligand SDFs + trimmed receptors are CMT-specific.

> ⚠️ **SCAFFOLD-LEVEL honesty (governance d6):** all 4 CMT candidate SMILES are Phase-β
> **scaffold PLACEHOLDERS** (per `hexa-bio .roadmap.disease_cmt_specific`). Every ΔG below is a
> **scaffold-level**, pocket-approximate number — NOT a final-molecule affinity. SMOKE ΔG values
> are pipeline-validation artifacts (5 windows / 30 iters → MBAR not converged, error bars `nan`/huge);
> they prove the deck **runs**, they are **not** binding predictions. Only the production 20-window /
> 1000-iter run yields an interpretable (still scaffold-level) ΔG.

## Result table

| TARGET | candidate | structure (PDB) | pocket defined? | SMOKE pass? | ABFE ΔG | honest caveat |
|--------|-----------|-----------------|-----------------|-------------|---------|---------------|
| **HDAC6** | hxq-cmt-hd6-001 | 5EDU (CD2 + co-crystal Trichostatin A `TSN`/A904 + catalytic Zn A901) | ✅ TSN centroid = Zn catalytic pocket | ✅ PASS (ENS_RESULT emitted) | **production RUNNING** on summer (rep0, 20-win/1000-iter) — SMOKE artifact dG_bind=44.40 (uninterpretable) | scaffold placeholder; rep0 only (need K≥3 ensemble for stderr ÷√K) |
| **SARM1** | hxq-cmt-sar1-001 | 7NAK (+ co-crystal ligand `1QD`/A801, 54 atoms) | ✅ 1QD centroid (ARM/NAD-related site) | ✅ PASS (ENS_RESULT emitted) | production-queued — SMOKE artifact dG_bind=6.93 (uninterpretable) | scaffold placeholder; pocket = 1QD site (confirm vs ARM allosteric vs TIR NADase) |
| **MFN2** | hxq-cmt-mfn2-001 | 6JFK (MFN1 + co-crystal `GDP`/A801) | ✅ GDP centroid (G-site / nucleotide pocket) | ✅ PASS (ENS_RESULT emitted) | production-queued — SMOKE artifact dG_bind=-12.96 (uninterpretable) | scaffold placeholder; G-site approximation — true MFN2 modulators may bind HR1/HR2 conformational sites, not the G-pocket |
| **ClC-1** | hxq-cmt-clc1-001 | 6COY (human ClC-1 TM domain; **no** co-crystal inhibitor — only Cl⁻ ions) | ⚠️ pore-axis pocket defined (S_cen↔S_int midpoint) but BLOCKED | ❌ FAIL — NaN at minimize | **BLOCKED** | see below |

## ClC-1 — BLOCKED (specific reason + breakthrough paths, d2)

**Reason:** SMOKE failed with `openmm.OpenMMException: Particle coordinate is NaN` at
`sampler.minimize()`. Two compounding causes:
1. **No clash-free bound pose.** 6COY contains only Cl⁻ ions (S_cen A/1001, S_int A/1002) — no
   co-crystal small-molecule blocker — so `extract_pose.py` has no template. The ideal-conformer
   placed at the pore-axis centroid (r0=0.14 nm, jammed in the narrow permeation constriction)
   clashes hard with the pore-lining residues; the pre-equilibration minimizer cannot resolve it →
   NaN coordinates → replica-exchange minimize blows up. (This is SENOLYX failure-mode #1: tight/
   buried pocket needs a clash-free pose.)
2. **No membrane.** ClC-1 is a transmembrane channel; the harness solvates in **bulk water with no
   lipid bilayer**, so even a resolved pose would be physically misleading for a TM-pore site.

**Breakthrough paths (do NOT concede):** (a) **dock first** — generate a clash-free protopore pose
with AutoDock Vina / smina into the 6COY pore, write `lig_CL1_bound.sdf`, then ABFE consumes it
(abfe deck auto-prefers `*_bound.sdf`); (b) **membrane-embedded FEP** — rebuild in a POPC bilayer
(membrane-builder) so the TM pocket is physical — outside the bulk-water ABFE deck's scope;
(c) **softer start** — add restrained-minimize / position-restraint warm-up + larger maxIterations
before the alchemical minimize to absorb the initial clash. Pocket geometry IS definable (pore-axis
center captured in `pockets.json`); the blocker is pose+membrane physics, not pocket identification.

## What was solved (structures)

- **HDAC6 / 5EDU**: catalytic CD2 domain co-crystal with Trichostatin A (`TSN`) + 2× catalytic Zn.
  Pocket = TSN centroid `[17.16,-44.56,102.76]`; trimmed Zn retained in receptor sphere.
- **SARM1 / 7NAK**: co-crystal ligand `1QD` (8 copies; chain A used). Pocket = 1QD centroid.
- **MFN2 / 6JFK**: MFN1 GTPase + `GDP`. Pocket = GDP centroid (G-site).
- **ClC-1 / 6COY**: human ClC-1 TM domain; pore-axis pocket from the two Cl⁻ binding sites (no inhibitor).

## Engineering note — receptor trimming (deck-discipline guard baked in)

The raw multi-chain crystals solvated to **436k atoms** (HDAC6) with a **5.05 nm** mis-placed
restraint (ligand landing outside the closest retained CA) — intractable on a 7 GB GPU. Fix:
`trim_receptor.py` carves a **single-chain 22 Å pocket sphere** (+ catalytic metals) before ABFE,
collapsing the box to **15.9k–32.9k atoms** and seating the ligand correctly in-pocket
(restraint r0 = 0.14–0.76 nm across all 4). This is the d12 cluster-model spirit applied to ABFE.
`pockets.json` points at the `*_trim.pdb` receptors. (Stale `*.nc` checkpoints from a killed run
also caused a `NetCDF: Write to read only` error — cleared before each fresh run.)

## Non-ABFE modalities (ABFE physically wrong — not run; correct free in-silico validation each needs)

These 5 candidates are **not** small-molecule binding events; ABFE does not apply. Correct FREE
in-silico validations:

| candidate | modality | correct free in-silico validation |
|-----------|----------|-----------------------------------|
| **hxq-cmt-pmp22-001** | PMP22 3′UTR allele-selective **siRNA** (CMT1A dup) | (1) seed-region (positions 2–8) complementarity to the PMP22 transcript; (2) **off-target transcriptome scan** — BLAST/`miRanda`/`RNAhybrid` the 21-mer guide+seed against the full human mRNA set, flag seed matches in 3′UTRs (HNPP-overshoot + paralog safety); (3) thermodynamic asymmetry (guide-strand selection, ΔG 5′-end); (4) 2′-OMe/2′-F/PS + GU-rich motif avoidance for TLR7/8 (sequence rule check). All sequence/thermodynamics — no MD. |
| **hxq-cmt-pmp22-002** | PMP22 pre-mRNA splice-modulating **ASO** (gapmer) | Same seed-complementarity + off-target transcriptome scan as siRNA, plus splice-site / ESE-ESS motif targeting check (e.g. `SpliceAI`/`Human Splicing Finder`) and MOE-gapmer RNase-H window placement; 5-10-5 PS+MOE chemistry rule audit. |
| **hxq-cmt-gjb1-001** | Cx32/GJB1 mutant-selective **fold-rescue** | NOT a binding ΔG — a **connexin cryo-EM interface ΔΔG**: model the CMT1X mutant Cx32 hemichannel (vs Cx26 deafness paralog), compute folding/stability ΔΔG of mutant vs WT (FoldX / Rosetta ddG / `ThermoMPNN`), and confirm the chaperone selectively rescues the mutant fold without engaging WT Cx32 or Cx26. |
| **hxq-cmt-nrg1-001** | NRG1-III/ErbB **Fc-fusion** partial agonist | NOT ABFE — **ErbB2/ErbB3 interface modeling**: dock/score the NRG1-III EGF domain at the ErbB3 ectodomain interface (HADDOCK / AlphaFold-Multimer + interface ΔΔG), tune for **partial** agonism + Schwann-restricted display, and check off-target ErbB1/ErbB4 (cardiotoxicity) interface engagement. |
| **hxq-cmt-nano-001** | PLGA-PEG **nanocarrier** (modular cargo) | Not a single binding event — formulation/delivery in-silico: cargo-loading & PEG-shedding physico-chemical modeling, Schwann-targeting ligand–receptor docking, size/zeta estimation; ABFE only applies to its small-molecule cargo (e.g. the hd6 payload, already covered above). |

## Files in this directory

- `abfe_cmt.py` — ABFE deck (SENOLYX harness, reused verbatim; TARGET-driven via pockets.json)
- `pockets.json` — 4 CMT targets → {pdb (trimmed), lig RESN, chain, pocket center, natoms, _note}
- `build_ligands.py` — rdkit ETKDGv3 3D embed of the 4 CMT SMILES → `lig_<RESN>.sdf`
- `trim_receptor.py` — single-chain 22 Å pocket-sphere carver (box-tractability guard)
- `lig_{HD6,SR1,CL1,MF2}.sdf` — 3D ligand conformers (heavy atoms 25/21/21/24)
- `{5EDU,7NAK,6JFK,6COY}.pdb` — raw RCSB downloads · `*_trim.pdb` — trimmed receptors
- `logs/smoke_{HDAC6,SARM1,MFN2,CLC1}.log` — raw SMOKE run logs (real captured output)
- on summer `~/cmt-abfe/prod_HDAC6_rep0.log` — HDAC6 production run (RUNNING)

## Honest status summary

- **3/4 small-molecule targets SMOKE-PASSED** (HDAC6, SARM1, MFN2) — deck builds + runs + emits ENS_RESULT.
- **HDAC6 production launched** on summer (rep0, full 20-window schedule, RUNNING) — interpretable
  (scaffold-level) ΔG pending completion (many hours on a shared single GPU; not waited-on here).
- **SARM1, MFN2 production-queued** — SMOKE-validated, ready to fire sequentially (one GPU, run one at a time).
- **ClC-1 BLOCKED** — NaN at minimize (no clash-free pore pose + no membrane); breakthrough paths named above.
- **5 non-ABFE modalities** documented with the correct free in-silico validation each needs (NOT run — ABFE physically wrong).
- No paid compute used. No git commit / PR (left to main session).
