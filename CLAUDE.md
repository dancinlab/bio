<!-- SPECKIT START -->
For additional context about technologies to be used, project structure,
shell commands, and other important information, read the current plan
<!-- SPECKIT END -->

## Project

🧬 **dancinlab/bio** — open drug-discovery lab. An in-silico therapeutic-design
repository built around a locked 5-axis quantum drug-discovery framework
(QUANTUM / WEAVE / VIROCAPSID / RIBOZYME / NANOBOT), a Molecular Toolkit, and a
207-entry disease portfolio. **Everything is in-silico; wet-lab / clinical
validation is pending.** Design SSOT lives in `ARCHITECTURE.json` (HTML viewer
for humans); history lives in `CHANGELOG.md` + git.

## Tree

```
bio/
├─ ARCHITECTURE.json  — design SSOT (5-axis · toolkit · platform · 207-disease portfolio tree)
├─ CHANGELOG.md       — session history (append-only)
├─ README.md          — current-state overview
├─ AXIS/              — per-axis closure tapes · hierarchy SSOT
├─ weave/ nanobot/ ribozyme/ virocapsid/  — 4 bio-axis modules (module/ · spec/)
├─ quantum/           — qpu_bridge VQE (5th axis · compute substrate)
├─ papers/            — n6-* scientific paper drafts
├─ design/            — kick/omega design-cycle artifacts
├─ state/             — single root for work outputs (discovery_absorption · exports)
├─ exports/           — ABFE · pdb · sdf · pocket compute exports
├─ selftest/ tests/   — verification · self-test
└─ _*_bridge/         — hexa · python · qiskit · absorption bridges
```
