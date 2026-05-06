# External Systems Synthesis — Summary (2026-05-07)

5-batch review (cycles 39-45) 의 1-page synthesis. Detailed per-system review = `docs/external_systems_review_2026_05_07.md` §1-§31.

---

## TL;DR

22 ML/simulation systems reviewed. **All 5 hexa-bio axes have commercial-OK fullstack absorption pathways identified.** Drug-discovery pipeline compressed to 4 stages via Boltz-2 + DiffSBDD. RNA-FM ecosystem fills the RIBOZYME-side gap (was the lone axis without a protein-side ML equivalent until cycle 45).

---

## hexa-bio axis × external pipeline (final mapping)

| Axis | Fullstack pipeline | License path |
|------|--------------------|--------------|
| RIBOZYME | scGPT/GeneFormer (target) → RhoDesign / RiboDiffusion (design) → RhoFold+ (3D) → RNA-FM (embedding) → hexa-bio kinetics | **MIT** |
| VIROCAPSID | RFdiffusion (sym backbone) → ProteinMPNN (seq) → OpenFold/ESMFold (validate) → hexa-bio cage_assembly | **BSD + MIT + Apache** |
| NANOBOT | same protein-design pipeline + OpenMM (MD validation) | **MIT/BSD/Apache** |
| WEAVE (DNA) | caDNAno (Python API) → oxDNA (subprocess) → hexa-bio | **BSD-3 + GPL subprocess avoidance** |
| QUANTUM (drug-target VQE) | scGPT/GeneFormer (target) → Boltz-2 (structure+affinity) → DiffSBDD (ligand gen) → hexa-bio Q (active-site VQE) → hexa-bio ribozyme (silencing arm) | **MIT** |

**Universal constant**: `hexa-bio` is the **terminal validation + kinetics + falsifier** stage in every pipeline. ML systems do design / structure / affinity; hexa-bio closes the loop via raw_77 registry rows + n6 invariant + Eigen-Hammes margin / chemical-accuracy / sub-µHa metrics.

---

## License-path tightness

- **All 5 pipelines pass through MIT/Apache/BSD-only** if AlphaFold 3 (CC BY-NC) and Chroma weights (academic-only) are skipped.
- WEAVE's GPL contamination is dodged by **subprocess-only** consumption of oxDNA (the rest of the WEAVE path is BSD-3).
- This means the entire hexa-bio + external-systems layer is commercially deployable end-to-end.

---

## Three findings that mattered most

1. **RNA-FM ecosystem (cycle 45)** — single 99M-param BERT trained on 23M ncRNA + 45M mRNA powers 4 RNA-side tools (RhoFold+ structure / RiboDiffusion inverse-fold / RhoDesign geometric / mRNA-FM). Until this batch, RIBOZYME had no protein-side equivalent; now the equivalent is identified as a single MIT-licensed ecosystem.

2. **Boltz-2 (cycle 44)** — MIT-licensed AlphaFold 3-class general biomolecule prediction PLUS binding affinity at 1000× the speed of physics-based FEP. Replaces ESMFold + DiffDock + standalone FEP with one stage. hexa-bio quantum's 1.6 mHa chemical-accuracy band matches Boltz-2's affinity error band → natural cross-validation pair.

3. **AlphaFold 2 weights are CC BY 4.0** (cycle 44) — meaning original AF2 itself is commercial-OK at the parameter level (since 2022-01). Earlier review docs §13 framed OpenFold as the path to commercial-grade AF2; the truer story is OpenFold is the **trainable** version, not the **license-clean** one.

---

## Outbound-consumer pattern

For every external system: **hexa-bio is a downstream consumer**, never an in-tree integrator.

```
hexa-bio module (.py)
   │ subprocess.run([external_cli, ...])  or  HTTP API to user-managed service
   │
   └─ JSON in → JSON out → schema validation → registry row → falsifier check
```

This pattern preserves:

- raw#9 stdlib-only spirit on the hexa-bio side (numpy/scipy/torch stay in the external system's env)
- license isolation (GPL subprocess can't infect; CC-BY weights stay in user's environment)
- reproducibility (registry row records the call's request_id / version / timestamps)
- falsifier discipline (boundary schema like `raw_77_external_evidence_v1` — to be drafted)

---

## Two pipelines that emerged

### Pipeline A — Protein design (commercial OK)

```
[user spec / motif]
   ↓
RFdiffusion           — backbone (motif scaffolding / symmetric)
   ↓
ProteinMPNN           — sequence (inverse fold)
   ↓
OpenFold / ESMFold    — fold validate (RMSD vs target)
   ↓
hexa-bio              — cage_assembly_simulation / nanobot_actuation_simulation /
                        virocapsid_calibration / falsifier check
```

### Pipeline B — Drug discovery (commercial OK, Boltz-2 + DiffSBDD compressed)

```
[disease / cell context]
   ↓
scGPT + GeneFormer    — ensemble target identification
   ↓
ESMFold or Boltz-2    — pocket structure
   ↓
DiffSBDD              — pocket-aware ligand de-novo generation
   ↓
Boltz-2               — binding affinity prediction (~FEP-level, 1000× faster)
   ↓
hexa-bio quantum      — top-k candidate active-site VQE refinement (chem-acc / sub-µHa)
   ↓
hexa-bio ribozyme     — orthogonal mRNA silencing arm (target validation alt path)
```

---

## raw#10 honest C3

1. Review is **surface-level** per system — README + abstract level. Each pipeline stage's actual integration requires a per-system smoke run (deferred per user decision; review cycle is deliberately read-only).
2. **2026-quoted accuracy numbers** (scGPT 91.4% / Boltz-2 1000× FEP / RNA-FM 20-30% F1 / VQE 0.4 µHa) come from each project's own benchmarks. Cross-project standardized comparison is a separate research cycle.
3. **Pipeline composition is conjectural** until a pilot smoke. The 5-axis fullstack mapping says the pieces exist and license-fit; it does not say they integrate without boundary-schema work.
4. **License snapshots are 2026-05-07** — Boltz, Chroma, RFdiffusion, etc. release new versions; license can change (OpenFold weights changed CC-BY-NC → CC-BY in 2022-01). Reverify before commercial deployment.
5. **WEAVE GPL subprocess** assumes oxDNA's CLI is invoked, never linked. If a future cycle calls oxDNA via Python bindings (`oxpy`), the contamination calculus changes.

---

## Suggested next-cycle path (user-decision)

### A. Pilot smoke runs (1 axis × 1 system, ~1-3 cycles each)

1. **RIBOZYME × RhoFold+** — predict tertiary structure for cycle-25 hammerhead 12-nt catalytic core. Output PDB → fill `structure_3d_ref` field in `raw_77_ribozyme_design_v1` rows.
2. **VIROCAPSID × RFdiffusion** — generate T=1 (STNV-class) icosahedral 60-mer subunit backbone. Compare RMSD vs literature reference (Sorger 1986).
3. **QUANTUM × Boltz-2** — predict binding affinity for a known inhibitor (e.g. HIV protease + KNI-272). Cross-validate with hexa-bio Q VQE active-site refinement.

Each pilot = standalone cycle, results pasted into `docs/`, smoke-test registry row.

### B. Boundary schema land (1 cycle)

`raw_77_external_evidence_v1` — schema for ML-system-derived rows entering the registry: required fields = (system_name, version, license_at_recording, predicted_artifact_path, confidence_metric, hexa_bio_consumer_module, ts_utc).

### C. Continued review (incremental)

AlphaFold 3 paper deep-dive, ARES, ProtT5, Pocket2Mol — each adds detail but the 5-axis fullstack mapping is unchanged. Diminishing return.

---

## Cycle accounting

- Review cycles: 39-45 (7 batches, 22 systems, single docs file at `external_systems_review_2026_05_07.md`)
- This synthesis: cycle 46 (single-page summary, intended audience = future agent reading cold)
- All under cron `67cceec6` `/loop 5m keep going to closure to goal`
- External cost: $0 (WebFetch only, no installs, no API calls)
- Cross-repo edits: 0 (all in hexa-bio)
- raw#9 conformance: this docs file is markdown, no Python; review docs all markdown. Pilot smoke runs in §A would re-engage the existing `_python_bridge/module/quantum_*.py` outbound-consumer pattern.
