# RFP — Ribozyme axis wet-lab pilot

**STATUS**: draft-ready, deferred for user send  
**Template version**: 0.1.0 (2026-05-12)  
**Customize before send**: subject lines, scope details, budget, NDA reference

---

## Subject

`Pilot wet-lab engagement RFP — Hammerhead ribozyme 12-nt cleavage kinetics`

## Body

Dear [CRO contact],

We are a [Korea-based / US-based] research entity developing a synthetic
hammerhead ribozyme variant under the **hexa-weave invariant-lattice
framework** (σ(6)=12 geometric foundation; n=6 master identity
12 · 2 = 6 · 4 = 24). Our [in-silico phase](https://github.com/dancinlab/hexa-bio)
is complete: 4-state kinetics simulation (Eyring TST, k_cat ≈ 0.6/min),
Nussinov MFE structure verification, and GENCODE v47 off-target screen
(RIsearch2 v2.1 over 106k protein-coding transcripts) all PASS. We seek
an in-vitro pilot to confirm structural-EXACT-CANDIDATE → STRUCTURAL-EXACT
classification.

### Pilot scope (Phase 1, ~3 months)

| Item | Detail |
|---|---|
| Construct | 12-nt hammerhead minimal motif (sequence delivered as plasmid + chemically-synthesized RNA) |
| Substrate | Single-stranded RNA target (sequence delivered) |
| Conditions | 37 °C, pH 7.5, 10 mM MgCl₂, baseline; ± Mg²⁺ titration sweep |
| Read-out | (1) k_cat measurement via real-time fluorescence cleavage assay (e.g., FRET-quench); (2) K_M Michaelis-Menten fit; (3) cleavage product gel electrophoresis confirmation |
| Required precision | k_cat ± 10%; replicate n ≥ 3 |
| Deliverables | Raw data (FCS / spreadsheet) + summary report + retained samples |
| Timeline | Q1: protocol finalization + 1st cleavage run; Q2: replicate sweeps; Q3: report |
| Budget cap | **$XX K** (placeholder — fill before send) |

### Read-out priorities

1. **k_cat = 0.6/min ± 20%** (matches in-silico 4-state kinetics prediction)
2. **Mg²⁺ dependence**: cleavage rate proportional to [Mg²⁺] (mechanism check)
3. **Off-target stability**: no spontaneous self-cleavage at 37 °C / pH 7.5 / 24 h

### What we ask in your reply

- [ ] Capability statement (HW: real-time fluorescence reader, gel imager; chem: oligo synthesis)
- [ ] Estimated timeline + budget for the Phase 1 pilot above
- [ ] Sample SOW / MTA template (we use NIH UBMTA as baseline — see [`wetlab/mta/`](../mta/))
- [ ] References to similar ribozyme kinetic projects (last 5 years preferred)
- [ ] NDA terms (we require NDA before disclosure of sequences)

### Cross-references (open-source background)

- In-silico simulation source: https://github.com/dancinlab/hexa-bio (axis = ribozyme)
- Mathematical framework: σ(6)=12 invariant-lattice [`README.md`](https://github.com/dancinlab/hexa-bio#readme)
- F-RB-4 6/6 falsifier preregister (4-state kinetics): `ribozyme/spec/`

Looking forward to your reply.

[user signature]
[user contact info]

---

## NDA prerequisite checklist (before sending detailed sequences)

- [ ] CRO has signed mutual NDA on file with [user organization]
- [ ] Sequence confidentiality marked in NDA scope
- [ ] CRO is GLP-certified if downstream IND submission expected
- [ ] CRO has no conflict-of-interest with competing ribozyme programs

## Budget reference

Industry-standard ribozyme kinetics pilot (Phase 1): **$25K-100K**
depending on construct count, replicate depth, and CRO geography (Korea
typically 30-40% lower than US/EU).
