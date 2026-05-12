# RFP — Virocapsid axis wet-lab pilot

**STATUS**: draft-ready, deferred for user send  
**Template version**: 0.1.0 (2026-05-12)

---

## Subject

`Pilot wet-lab engagement RFP — Synthetic icosahedral capsid T-number verification (cryo-EM)`

## Body

Dear [CRO contact],

We are developing synthetic icosahedral viral capsids under the **hexa-weave
invariant-lattice framework** (σ(6)=12 pentamers ∀T per Caspar-Klug; n=6
master identity). In-silico phase complete: T=1/3/4/7/13/21 Zlotnick mean-
field cage assembly ODE (yield 0.67-0.87 across T, mass conservation
machine-precision), VIPERdb v3.0 PDB corpus screen (n=527, log10_BF
876.27, 7/7 C3a + 3/3 C3b PASS), F-VIROCAPSID-1-c/-d in-repo CLOSED. We
seek a cryo-EM pilot to verify T-number assignment + assembly yield for
1-2 chosen T-numbers.

### Pilot scope (Phase 1, ~3 months)

| Item | Detail |
|---|---|
| Construct | Synthetic icosahedral capsid; T=3 (default; alternative T=1 single-protein) |
| Protein | Capsid protein expressed in E. coli (sequence delivered) |
| Assembly | In-vitro buffer-mediated; pH 5.5 → 7.5 sweep; protein conc 0.1-1 mg/mL |
| Read-out | (1) cryo-EM single-particle reconstruction (resolution target ≥ 4 Å); (2) T-number assignment (h, k) verification per Caspar-Klug; (3) assembly yield % (well-formed cages vs aggregates) |
| Required precision | T-number unambiguous (≥ 95% confidence); yield ≥ 60% well-formed |
| Deliverables | Raw cryo-EM micrographs + 3D reconstruction (mrc + EMDB-style metadata) + summary report + retained samples |
| Timeline | M1: protein expression + assembly trials; M2: cryo-EM session + reconstruction; M3: report + EMDB deposition (optional) |
| Budget cap | **$XX K** (placeholder — fill before send) |

### Read-out priorities

1. **σ(6)=12 pentamers confirmed** (universal invariant; 12 pentamers ∀T)
2. **T-number assigned** matches design (T=3: h=1, k=1, →T=h²+hk+k²=3)
3. **Yield ≥ 0.85** for chosen T (matches in-silico Zlotnick prediction)

### What we ask in your reply

- [ ] Cryo-EM resolution capability (in-house Titan Krios ≥ 300 keV preferred; alternative: K3 detector)
- [ ] Single-particle reconstruction pipeline (RELION / cryoSPARC / cisTEM)
- [ ] Capsid assembly screening capacity (96-well + DLS / HPLC monitoring)
- [ ] Estimated timeline + budget; lead time for cryo-EM session
- [ ] NDA + MTA terms (capsid protein sequence is confidential)
- [ ] References to similar synthetic capsid / VLP projects

### Cross-references

- In-silico simulation source: https://github.com/dancinlab/hexa-bio (axis = virocapsid)
- Zlotnick ODE substrate: `virocapsid/module/zlotnick_ode.py`
- VIPERdb corpus snapshot: `virocapsid/spec/virocapsid_pdb_corpus_v0.json` (n=527)
- F-VIROCAPSID-1-c/-d audit: `selftest/virocapsid_f_virocapsid_1c_1d_audit.py`

[user signature]

---

## Vendor candidates (research-stage)

| Region | Facility | Strength |
|---|---|---|
| Korea | **KAIST cryo-EM 센터** | Titan Krios + helium-cooled; trained operators |
| Korea | **포스텍 cryo-EM** | secondary option |
| Japan | **Osaka University Institute for Protein Research** | high-throughput cryo-EM, English-friendly |
| UK | **Diamond Light Source eBIC** | best-in-class; free for collaborators (peer-review gate) |
| US | **NIH cryo-EM facility (Bethesda)** | free for US-collaborators |
| Germany | **EMBL Heidelberg** | best-in-class structural biology |

## Budget reference

Cryo-EM session + reconstruction: **$10K-40K per grid** (1 grid sufficient
for single high-quality reconstruction). Protein expression + assembly
screening upstream: **$10K-50K**. Total Phase 1: **$30K-100K**.
