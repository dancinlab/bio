# aga-cure-insilico-axis-collapse — paper status

@title: 📄 AGA-CURE in-silico axis-collapse (negative result)
@goal: Show that the in-silico complete-restoration AGA cure design space collapses to a single measurable axis (E_max ≥ 0.96 ⇒ ≥90% gate), and falsify three candidate mechanisms (AAV-episomal permanence, high-potency Wnt, fidelity-naive epigenetic lock).

- [x] draft v1 — 10pp, §hypothesis(falsifiers)/method/measurement/finding (d_paper_format)
- [x] figures complete — fig01 E_max collapse (DC9), fig02 ruled-out axes (DC3/4/5/7)
- [x] references ≥10 — 10 landmark DOIs (Turing·Gierer·Schnakenberg·Ito·Hawkshaw·Garza·Wu·Clevers·Cotsarelis·Kaufman)
- [x] lint pass — /paper lint . → 10/10 ✓ (pages·figure·sections·tables·figures·bib·emoji-guard)
- [x] compile clean — tectonic (XeTeX), 0 errors, 0 undefined refs, 10 pages
- [ ] arxiv submit ready (`/paper arxiv-prep .`) — pending user go

## frame (d_paper_negative_ok)
Negative result. Pre-registered falsifiers met:
- F1 🔴 AAV-episomal permanence FALSIFIED (cure-fit 0.14, dilutes ~8yr ≪ 50yr) — DC3
- F2 🟢 potency NOT the binding axis (GSK3β/Wnt-agonist ruled out on onco-safety) — DC4
- F3 🟢 epigenetic lock fidelity-sensitive (fails f<0.97, holds f≥0.98) — DC12
- COLLAPSE 🟢 ≥90% cure gate ⇔ E_max ≥ 0.96; all orthogonal axes settled — DC9
- ANCHOR 🟡 E_max NOT wet-lab-only — clinical dose-response pins current 2-arm ceiling
  E_max≈0.59 (biological plateau = 25% fibrosed fraction); residual = arm④ neogenesis
  efficiency, in-vitro organoid-bracketable (Van Neste 2020 · Sci Rep 2023) — DC13

## honest tiers (g63)
- 🔵 DC1 Turing onset (analytic)
- 🟢 DC3-10/12 mechanism+timing+safety (numerical, within model assumptions)
- 🟠 DC11 specificity (order-of-magnitude → GUIDE-seq) · absolute E_max≥0.96 (wet-lab)

## source
exports/AGA-CURE/round2-deep · round3-deep · round4-deep (DC1-12 *.py + *_RESULTS.md)
