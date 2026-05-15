# drylab/ — in-silico simulator bench (the dry-lab)

> **Pair**: `wetlab/` = paper templates for a *real* biological wet-lab
> (doesn't run). `drylab/` = the *actual in-silico simulators we build*
> (runs). Wet-lab boundary not crossed/contacted — we build the dry-lab
> instead.

**Created**: 2026-05-16 · **Status**: scaffolding (build in progress)
**Scope**: stdlib-only, in-silico, no external data, no fabrication.
**Governance**: `g1` real-limits-first · `g8` in-silico-only-claim-scope ·
`g3` honesty-obligation-external · `f2` no clinical claim from C2 PASS.

---

## §0 Why drylab/ exists — the honest reclassification

Across the LVAD scenario work, several items were recorded as "external /
repo-out / needs wet-lab / needs external SMD". **Audit finding: a subset of
those were a *false boundary*** — not wet-lab-blocked, not external-data-
blocked, just **no program was written**. drylab/ is the ledger + home for
those: experiments closeable in software, mislabeled as out-of-scope.

This is the mirror image of `CLOSURE_RESIDUAL_BACKLOG.tape`:
- that = "what we *cannot* close in software" (genuine wet-lab/IP/hardware)
- drylab/ = "what we *can* close in software but hadn't built yet"

Honesty rule: every simulator here anchors ≥1 **real, cited** limit (`g1`),
labels its approximation level explicitly (e.g. "CG model — refine with
all-atom MD"), and makes **no therapeutic/clinical claim** (`g8`/`f2`).
A coarse approximation honestly labeled is valid; a fit-to-hope is not.

---

## §1 Buildable-program catalog (brainstorm — exhausted)

Ranked. "RE" = needs literature/SOTA reverse-engineering (research/ agents);
"now" = buildable from already-cited limits with no further research.

| # | Simulator | Dissolves which false boundary | Anchors (real limit) | stdlib | RE? |
|---|---|---|---|---|---|
| 1 | **② CG A2 forced-unfolding** (`sim/a2_cg_unfolding.py`) | tape said 3× "A2 intermediate ensemble = external SMD". Gō/ENM forced-unfolding is buildable. | A2 ΔG 3.9±0.9 kcal/mol · contour 57 nm · measured rupture ~11 pN · scissile Tyr1605-Met1606 (Zhang 2009) | ✅ | RE |
| 2 | **① Brownian/Langevin shear stress-test** (`sim/shear_langevin_bd.py`) | §8 negative is *analytic* Bell only — never checked dynamically. | overdamped Langevin · Bell k(F) · LVAD shear 70-150 | ✅ | RE |
| 3 | **③ AAV vector-design optimizer** (`sim/aav_vector_optimizer.py`) | cargo check only *judges*; no *optimizer*. | AAV9 ssDNA cap 4.7 kb · CAI · ITR 145bp | ✅ | RE |
| 4 | **①↔② shear-mechano phase-diagram** (`sim/shear_phase_diagram.py`) | duality is ad-hoc embedded, not a reusable tool. | F_mid ∝ L² · Bell · cited ΔG | ✅ | now |
| 5 | **vWF multimer-size distribution** (`sim/vwf_multimer_kinetics.py`) | §3 #4 (MW 500kDa-20MDa) dismissed as "descriptive constant" — a cleavage-kinetics steady-state is dynamical & buildable. | ADAMTS13 k_cat 0.14/s (Zhang 2009) · shear-dependent scission | ✅ | RE |
| 6 | **Dudko-Hummer-Szabo force-spectroscopy kit** (`sim/dhs_force_spectroscopy.py`) | Bell anchor uses simplest model; DHS (2006) is the cited rigorous upgrade. | DHS 2006 · ΔG‡ · Δx‡ | ✅ | RE |
| 7 | **AAV9 capsid assembly thermodynamics** (`sim/aav_capsid_assembly.py`) | virocapsid module only *audits* a corpus; no AAV9 T=1 60-mer nucleation-elongation sim. | Zlotnick ΔG window · Caspar-Klug T=1 | ✅ | RE |
| 8 | **A2↔ADAMTS13 geometric pose screen** (`sim/a2_adamts13_pose.py`) | mock selector has no exosite-accessibility model; grid/geometric (not QM) is buildable. | exosite spacing · scissile accessibility vs unfold state | ✅ | RE |
| 9 | **Reduced-order LVAD impeller shear estimator** (`sim/lvad_shear_reduced_order.py`) | shear 70-150 is asserted; a reduced-order (NOT full CFD) estimator is buildable & honest-labeled. | HeartMate3 rpm/gap geometry · annular Couette | ✅ | RE |
| 10 | **Eyring-TST ribozyme k_cat predictor** (`sim/ribozyme_eyring_kcat.py`) | kinetics module exists but no sequence→k_cat TST predictor. | Eyring TST · hammerhead ΔG‡ | ✅ | RE |

| 11 | **ML-capsid-fitness independent proxy scorer** (`sim/ml_capsid_fitness.py`) | proprietary ML-capsid tools (Dyno/Form Bio/Affinia/Voyager) state a FUNCTION but undisclosed METHOD — an independent transparent public-proxy scorer is buildable & honest. | AAV9 VP3 PDB 3UX1 frame · VR-VIII 7-mer site · HS R585/R588 · AAV9 gal pocket · NAb epitope · ssDNA 4.7kb cap | ✅ | RE |

Excluded (genuinely NOT buildable in-silico here — stay external):
real LMNA/TTN/MYH7 transcripts (need real sequences) · QM-accurate VQE
(qiskit_nature env gap) · cage→hemocompatibility (no literature bridge, H0).

---

## §2 Reverse-engineering plan (SOTA → stdlib)

We do NOT clone proprietary code. We read **published algorithms** (arxiv,
journals, open docs) and implement stdlib approximations, honestly labeled.
This is the established repo pattern (`_absorption_bridge/` = "external
library absorption"; Wilson principle: absorbed stdlib over hand-rolling).

SOTA landscape per simulator (to be filled by `research/` agents):

| Sim | Proprietary SOTA (described by their own claims, g3) | Open/academic SOTA | RE source target |
|---|---|---|---|
| 1,2,6 | Schrödinger Desmond · OpenEye | GROMACS · LAMMPS · OpenMM · HOOMD-blue | Gō-model (Karanicolas-Brooks 2002) · ENM (Tirion 1996 · Bahar ANM/GNM) · overdamped Langevin · Bell 1978 · Dudko-Hummer-Szabo 2006 |
| 3 | Benchling · Geneious · SnapGene · Dyno (ML capsid) | ViennaRNA · CAI (Sharp-Li 1987) | codon-opt algorithms · promoter-minimization literature |
| 5 | — | — | ADAMTS13 mechanoenzymatic kinetics (Zhang 2009 · Crawley 2011) |
| 7 | — | — | Zlotnick nucleation-elongation · Caspar-Klug 1962 |
| 9 | ANSYS Fluent CFD (proprietary) | OpenFOAM | reduced-order annular-Couette / pump-affinity-law literature |

`research/<sim>.md` files (agent output): SOTA tool + its own stated method
+ the public-literature algorithm we will stdlib-implement + cited refs.

---

## §3 Layout

```
drylab/
├── README.md          # this file — catalog + RE plan + status
├── research/          # per-sim SOTA + reverse-engineered algorithm spec (cited)
│   └── <sim>.md
└── sim/               # the stdlib in-silico simulators (the runnable dry-lab)
    └── <sim>.py       # each: __DRYLAB_<NAME>__ PASS/FAIL token + honest scope
```

Each `sim/*.py`: stdlib-only · deterministic · `__DRYLAB_<NAME>__` sentinel ·
real-limit anchor in docstring · approximation level explicitly labeled ·
g8/f2 honesty caveat · cross-ref to its `research/<sim>.md`.

---

## §4 Build status

| # | Sim | research/ | sim/ | verified |
|---|---|---|---|---|
| 1 | a2_cg_unfolding | ✅ spec (research/) | ⏳ | — |
| 2 | shear_langevin_bd | ✅ spec (research/) | ⏳ | — |
| 3 | aav_vector_optimizer | ✅ spec (research/) | ⏳ | — |
| 4 | shear_phase_diagram | (now — no RE) | ✅ | ✅ `__DRYLAB_SHEAR_PHASE_DIAGRAM__ PASS` |
| 5-10 | (see §1) | queued | — | — |
| 11 | ml_capsid_fitness | ✅ spec (research/) | ⏳ | — |

**#4 result (Zhang-2009-corrected)**: ① nanobot(0.1µm)@70 = INERT (ROBUST
negative, §8-consistent) · ② vWF(5µm)@70 = **MARGINAL** (8.75 pN < Zhang-2009
MEASURED rupture ~11 pN) — NOT a robust positive. L²=2500× scale gap holds
but the duality is ASYMMETRIC (① robust neg / ② loading-rate-marginal).
Mirrors corrected `../_python_bridge/module/a2_shear_unfolding_anchor.py`.
Honest finding: at LVAD 70 the vWF point sits in the MARGINAL band, not
robust UNFOLD. The rigorous DHS force-clamp verdict (#6, built 9aec5ee) =
**PARAMETER_BAND_DEPENDENT**: τ(8.75 pN) spans 1.9-190 s across the 10-60 s
circulatory dwell → unfolds within dwell ONLY for higher-k0 cells; the
②-marginal flag is UPHELD as parameter-sensitive (needs an independent k0),
NOT resolved either way (computed across explicit bands, not tuned — g1).

Legend: ⏳ research agent dispatched · ✅ done · — not started.

---

## §5 Cross-refs

- Mirror ledger: `../CLOSURE_RESIDUAL_BACKLOG.tape` §C (genuine out-of-scope)
- Scenario SSOTs: `../LVAD/{A2_STABILIZER,SHEAR_GATED_NANOBOT,AAV_BTR_GENE_THERAPY}.tape`
- Existing anchors reused: `../_python_bridge/module/a2_shear_unfolding_anchor.py`,
  `nanobot_actuation_simulation.py` (Bell C8/C9)
- Governance: `../AGENTS.tape` g1/g3/g8/f2 · `../CLAUDE.md`

## §6 Log

- 2026-05-16 — drylab/ scaffolded. README = catalog (10-program brainstorm,
  exhausted) + reverse-engineering plan. research/ agents dispatched for
  SOTA→stdlib algorithm specs. sim/ build starts with #1 (② CG A2
  forced-unfolding). "완성" is driven across this turn + research returns;
  honest multi-step, not a single-message claim.
- 2026-05-16 — 3 RE specs landed (research/{a2_cg_unfolding,shear_langevin_bd,
  aav_vector_optimizer}.md). #4 shear_phase_diagram built + verified.
- 2026-05-16 — **#11 ML-capsid-fitness RE spec landed**
  (`research/ml_capsid_fitness.md`). Independent transparent public-proxy
  scorer for an AAV capsid variant — explicitly NOT a reproduction of the
  proprietary ML tools (Dyno CapsidMap / Form Bio FORMsightAI / Affinia ART /
  Voyager TRACER), each described by its OWN public claims with method flagged
  undisclosed (g3). Scorer uses only primary-source-cited open proxies:
  AAV9 VP3 PDB 3UX1 frame · VR-VIII 7-mer site (Chan 2017) · AAVMYO/MyoAAV
  RGD anchor (Weinmann 2020 / Tabebordbar 2021) · AAV2 HS R585/R588
  (Kern/Opie 2003) · AAV9 gal-pocket (Shen 2011 / Bell 2012) · anti-AAV9
  NAb epitope (Giles 2018 / Emmanuel 2022) · ssDNA 4.7 kb cap (Wu 2010).
  Weights = documented heuristic, NOT-fitted / NOT-validated (g1). No
  tropism/efficacy claim (g8/f2). Dropped unfindable cardiac-optimal pI band.
  Spec only — sim/.py is a later wave.
- 2026-05-16 — **Zhang-2009 g1/g3 correction + reset-recovery.** RE agent
  (a2_cg_unfolding) verified verbatim from the scenario's OWN cited primary
  (Zhang X 2009 Science 324:1330, PMC2753189) that prior A2 numbers were
  wrong (ΔG 7-10→3.9 kcal/mol, k_cat 2.5→0.14/s, relevant force = MEASURED
  ~11 pN). §1 catalog + #4 phase-diagram corrected: ② is MARGINAL not robust
  UNFOLD at LVAD 70. A working-tree reset wiped uncommitted drylab/ ≥2× —
  now COMMITTED to persist (root cause: prior no-commit self-constraint).
