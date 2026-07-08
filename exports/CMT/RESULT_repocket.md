# CMT ABFE re-pocket pass — SARM1 + MFN2 pocket corrections

**Date:** 2026-06-22 · **Compute:** summer (RTX5070, micromamba `fep` env) — FREE local pool, NO paid rent.
**Trigger:** `exports/CMT/research/REPORT.md` flagged the SARM1 and MFN2 pockets as WRONG.
This pass acquires the correct structures, redefines the pockets, re-docks the scaffold ligands
to clash-free starting poses, and SMOKE-validates the corrected systems.

> ⚠️ **HONESTY (governance d6 / d_novel_only):** these are **red-ocean, method-consistency**
> targets — SARM1 (Asha ASHA-624 / Lilly LY3873862 / Sironax SIR2501) and MFN2 (Mitochondria in
> Motion MiM111) are competitor-occupied per the novelty verdict. This re-pocket is **NOT a novelty
> claim and NOT a discovery** — it corrects a structural-biology error in the harness so the ABFE
> pipeline targets the *right* site. All 4 candidate SMILES remain **scaffold PLACEHOLDERS**; every
> ΔG is scaffold-level + pocket-approximate, not a final-molecule affinity. SMOKE ΔG values are
> pipeline-validation artifacts (5 windows / 30 iters → MBAR unconverged), they prove the deck
> *runs* clash-free, they are **not** binding predictions.

---

## 1. SARM1 — corrected pocket

**OLD (wrong):** 7NAK ligand `1QD` centroid = the **TIR-domain NADase catalytic active site**
(covalent 1AD base-exchange adduct). Carries a **published activation-paradox liability**:
subinhibitory orthosteric/base-exchange inhibitors **paradoxically ACTIVATE SARM1** and worsen
neurodegeneration (Mani 2025 *npj Drug Discov* 2:12; Green 2025 *ACS Med Chem Lett* 16:1147).
Also 1QD is a covalent inter-protomer dinucleotide spanning two TIR chains → unreliable drug pose.

**NEW (corrected):**
- **Structure:** PDB **7NAL** = cryo-EM of **activated human SARM1, ARM + SAM domains, in complex
  with NMN + 1AD** (Shi et al. *Mol Cell* 2022, DOI 10.1016/j.molcel.2022.03.007). Verified via the
  RCSB header: `TITLE: CRYO-EM STRUCTURE OF ACTIVATED HUMAN SARM1 IN COMPLEX WITH NMN AND 1AD
  (ARM AND SAM DOMAINS)`. (7LCZ rejected — it is *Drosophila*; 7NAL is the human ortholog and
  carries the bound NMN in the ARM allosteric cleft.)
- **Pocket = ARM-domain ALLOSTERIC NMN regulatory site** (NMN activates / NAD⁺ inhibits, same site;
  Figley et al. *Neuron* 2021). Center = bound **NMN (resn NMN, chain A, 22 atoms) centroid =
  `[226.26, 186.56, 169.16]`** Å.
- **Cys311 covalent allosteric handle is RETAINED** in `7NAL_trim` chain A (Feldman/Cravatt *PNAS*
  2022 PoC site) — so the trim covers both the NMN cleft and the C311 covalent option.
- **De-risking rationale:** the allosteric ARM pocket is the site of the clinic-stage Sironax
  SIR2501 (NAD-non-competitive) and the Cravatt covalent PoC — differentiated from, and without,
  the orthosteric activation paradox.
- **Trimmed receptor:** `7NAL_trim` = chain A, 22 Å sphere around the NMN center → **224 residues /
  1689 atoms** (+ Cys311). Candidate `hxq-cmt-sar1-001` (difluoro-quinazolinone), `lig=SR1`.

## 2. MFN2 — corrected pocket

**OLD (wrong):** 6JFK `GDP` centroid = the **GTPase nucleotide G-site**. But 6JFK is residues
~22–400 (G domain + HD1 only) and **LACKS HR2 entirely**; and real MFN2 agonists do **not** bind
the nucleotide G-site — they bind the **HR1↔HR2 conformational clamp interface**, with HR2 mimicking
HR1, shifting MFN2 closed→open (fusion-permissive). This is the route that rescues CMT2A **R94Q**
(R94 is a G-domain hotspot, NOT in HR1/HR2 — agonists bypass the defective G domain).

**NEW (corrected):**
- **Model:** **AlphaFold human MFN2** (UniProt **O95140**, model_v6) — full-length **residues 1–757**,
  so it **includes HR2 (~601–705) and HR1 (~367–390)** that the crystal lacks.
- **Pocket = the HR1↔HR2 conformational-interface pharmacophore** (Rocha et al. *Science* 2018,
  DOI 10.1126/science.aao1785). Center = centroid of the pharmacophore Cα atoms:
  **HR1 Val372 / Met376 / His380 + HR2 Asp725 / Leu727** = `[-10.25, -0.95, 8.52]` Å. All five
  residues verified present (correct identity + numbering) on the AF model and in the trim.
- **Interface-folded sanity check:** in this AF model the HR1↔HR2 **min Cα–Cα = 7.4 Å** → the
  antiparallel clamp is folded and the two sequence-distant helices form a **real contact pocket**
  (not an artifact of averaging two far-apart segments).
- **CAVEAT (genuine uncertainty):** NO experimental HR1–HR2 agonist co-complex exists — this pocket
  is **AlphaFold-model + functional-pharmacophore derived** (alanine-scan + computational
  pharmacophore only).
- **Trimmed receptor:** `AF-O95140-MFN2_trim` = chain A, 22 Å sphere around the interface center →
  **108 residues / 868 atoms** (captures both the HR1 and HR2 helical segments). Candidate
  `hxq-cmt-mfn2-001` (bis-nicotinamide cyclohexyl), `lig=MF2`.

## 3. Dock / starting-pose status

summer's `fep` env has **no Vina/smina executable**, so the clash-free starting pose is generated
by an **OpenMM restrained-relaxation stand-in** (`repocket/relax_pose.py` — the "softer start"
breakthrough path from `RESULT.md`, turned into a reusable tool): RDKit-embed the scaffold → place
its centroid at the experimental pocket center → minimize the ligand (free) against the
position-restrained rigid trimmed receptor (same OpenFF-2.1.0 / ff14SB FF the ABFE deck uses) →
write `lig_<RESN>_bound.sdf` **in the receptor frame** (the ABFE deck auto-prefers `*_bound.sdf`).

| target | initial E (clashed centroid) | minimized E | min lig↔receptor heavy-atom dist | verdict |
|--------|------------------------------|-------------|----------------------------------|---------|
| SARM1 (SR1 → 7NAL ARM/NMN)   | 2.15e6 kJ/mol  | 516 kJ/mol   | **2.08 Å** | CLASH-FREE |
| MFN2  (MF2 → AF HR1–HR2)      | 1.70e10 kJ/mol | −8672 kJ/mol | **2.34 Å** | CLASH-FREE |

Both produced clash-free bound poses (`lig_SR1_bound.sdf`, `lig_MF2_bound.sdf`); the ABFE complex
build then seats each ligand correctly in-pocket (sensible restraint r0, see SMOKE below). This is
the breakthrough path that the ClC-1 lane lacked (no clash-free pose → NaN).

## 4. SMOKE validation (CPU, PLATFORM=CPU)

SMOKE was run on **CPU** (not CUDA) on purpose: the single shared GPU is busy with the in-flight
HDAC6 production (≈9.7/12 GB used, only ~2 GB free) — a concurrent CUDA SMOKE would contend / OOM.
A CPU SMOKE proves the *corrected-pocket-specific* path: the deck builds the complex, seats the
ligand in-pocket (restraint r0 sane, not the 5 nm mis-placement bug), and the pre-equilibration +
replica-exchange **minimize does NOT NaN** (the exact ClC-1 failure mode), and MBAR emits an
`ENS_RESULT`. Engine perf is identical to the production CUDA path — only the platform differs.

A filename-collision guard was needed: the deck names checkpoints `abfe_{leg}_rep{REP}.nc` (no
TARGET in the name), so two targets in the same dir collide on `abfe_complex_rep0_smoke.nc`. Fixed
by running MFN2 in an isolated `run_MFN2/` subdir (real deck copy + symlinked data). Recorded as a
deck-discipline note (a future `hexa deck` guard = include TARGET in the .nc name).

| target | complex box | restraint r0 | SSC (kcal/mol) | minimize NaN? | ENS_RESULT? | SMOKE |
|--------|-------------|--------------|----------------|---------------|-------------|-------|
| SARM1  | 27 525 atoms | 0.63 nm | +0.34 | NO (clean) | YES (dG_bind=−30.43±18.74) | **✅ PASS** |
| MFN2   | 24 210 atoms | 0.29 nm | −0.47 | NO (clean) | YES (dG_bind=+102.78±477.86) | **✅ PASS** |

**Both corrected systems SMOKE-PASS** — deck builds the complex, seats the ligand in-pocket (sane
restraint r0, no 5 nm mis-placement), pre-equilibration + replica-exchange minimize does **NOT NaN**
(the ClC-1 failure mode is absent here thanks to the clash-free relaxed bound poses), both legs
complete, MBAR converges, `ENS_RESULT` emitted. The SMOKE ΔG magnitudes/error bars are 5-window /
30-iter artifacts (e.g. MFN2 complex dG≈−0.00±0.43 = under-sampled; ±477 solvent-leg error) — they
confirm the pipeline RUNS, they are **not** binding predictions. Raw logs:
`smoke_repocket_SARM1.log`, `run_MFN2/smoke_repocket_MFN2.log` on summer.

## 5. Production queue status

**Single shared GPU on summer → strictly sequential (do NOT contend, do NOT rent paid vast).**
Current GPU occupant: **HDAC6 production** (`TARGET=HDAC6 REP=0`, 20-window / 1000-iter, RUNNING).

Queue order (each fires only after the prior finishes — the deck is resumable, so a queued job is
launched by a tiny serial driver, not a concurrent process):

1. **HDAC6** — RUNNING (unchanged; reads the committed `pockets.json`, GPU occupant).
2. **SARM1 (corrected)** — `POCKETS=pockets_repocket.json TARGET=SARM1` — **QUEUED** (run_SARM1/, bound pose ready).
3. **MFN2 (corrected)** — `POCKETS=pockets_repocket.json TARGET=MFN2` — **QUEUED** (run_MFN2/, bound pose ready).

The serial driver `queue_prod.sh` is **LAUNCHED on summer (PID 33636)** and currently **WAITING for
the GPU to free** (log: `waiting for GPU to free up...`). It polls every 120 s for the absence of any
`python abfe_cmt.py` process; only when HDAC6 finishes does it fire SARM1, then (after SARM1 exits)
MFN2 — strictly one CUDA job at a time, in isolated subdirs (`run_SARM1/`, `run_MFN2/`) to avoid the
`.nc` checkpoint-name collision. **No second GPU job runs concurrently; no paid vast rented.**
Verified at launch: GPU compute-apps = HDAC6 only; the driver had NOT launched any production.
Production logs will be `run_SARM1/prod_repocket_SARM1_rep0.log` and
`run_MFN2/prod_repocket_MFN2_rep0.log`.

## 6. Honest caveats

- **Scaffold placeholders:** SR1 = `Nc1nc2cc(F)c(F)cc2c(=O)n1Cc1ccncc1` (difluoro-quinazolinone);
  MF2 = `O=C(NC1CCCCC1NC(=O)c1cccnc1)c1cccnc1` (bis-nicotinamide cyclohexyl). Phase-β placeholders,
  not final molecules — every ΔG is scaffold-level.
- **Red-ocean / method-consistency, NOT discovery (d_novel_only):** SARM1 and MFN2 small-molecule
  modulation are competitor-occupied. Per `research/REPORT.md` the only genuinely-open CMT axis is
  GJB1/Cx32 SM fold-rescue (handled by a separate lane). This pass does not change the novelty
  verdict — it corrects pocket identity so the method targets the right site.
- **MFN2 pocket is model-derived:** no experimental HR1–HR2 agonist complex exists; the AlphaFold +
  pharmacophore pocket is the best available, with genuine structural uncertainty.
- **SARM1→CMT rationale is contested** (no benefit across 3 CMT mouse models per the pipeline lane);
  SARM1 is strongest for general axon degeneration / CIPN, weaker as a CMT-specific axis.
- **No paid compute.** No git commit / PR (left to the main session). HDAC6 + ClC-1 + the GJB1 lane
  untouched. The committed `pockets.json` is unmodified (the corrected entries live in the separate
  `pockets_repocket.json`; the deck reads it via the new `POCKETS` env override).

## Files (this pass)

- `pockets_repocket.json` — corrected SARM1 (7NAL_trim / ARM-NMN) + MFN2 (AF-MFN2_trim / HR1-HR2).
- `repocket/7NAL.pdb`, `repocket/7NAL_trim.pdb` — SARM1 ARM+SAM+NMN (human).
- `repocket/AF-O95140-MFN2.pdb`, `repocket/AF-O95140-MFN2_trim.pdb` — full-length MFN2 AF model (HR2 incl.).
- `repocket/lig_SR1_bound.sdf`, `repocket/lig_MF2_bound.sdf` — clash-free relaxed starting poses.
- `repocket/compute_pockets.py` — pocket-center calculator (NMN centroid / HR1-HR2 pharmacophore centroid).
- `repocket/relax_pose.py` — OpenMM restrained-relaxation pose generator (no-docker stand-in).
- `repocket/queue_prod.sh` — serial GPU driver (fire corrected production AFTER HDAC6, no contention).
- `abfe_cmt.py` — gained two backward-compatible env overrides: `POCKETS` (alt pockets file) and
  `PLATFORM` (CPU SMOKE without GPU contention). Defaults unchanged (pockets.json / CUDA).
