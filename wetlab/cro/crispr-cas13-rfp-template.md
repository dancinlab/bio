# RFP — CRISPR-Cas13 POC diagnostic axis wet-lab pilot

**STATUS**: draft-ready, deferred for user send  
**Template version**: 0.1.0 (2026-05-12)

---

## Subject

`Pilot wet-lab engagement RFP — CRISPR-Cas13 lateral-flow POC diagnostic`
`(TB IS6110 + HIV-1 RNA detection)`

## Body

Dear [CRO contact],

We are developing a point-of-care lateral-flow diagnostic using
CRISPR-Cas13 trans-cleavage activity for **TB Mycobacterium tuberculosis
IS6110** + **HIV-1 RNA** detection. In-silico design phase complete:
crRNA spacer 28 nt, LbuCas13a/LwaCas13a/Cas13b enzyme variants modeled,
RPA isothermal amplification + nitrocellulose lateral-flow geometry
designed. We seek an in-vitro + on-strip pilot to confirm detection
sensitivity matching WHO end-TB / UNAIDS 95-95-95 thresholds.

### Pilot scope (Phase 1, ~4 months)

| Item | Detail |
|---|---|
| Cas13 variant | LbuCas13a (primary); LwaCas13a / Cas13b (alternates) |
| Substrates | TB IS6110 dsDNA-amplified target; HIV-1 RNA viral-load |
| Amplification | RPA isothermal at 37-42 °C |
| Reporter | Cleavable RNA reporter (FAM-poly-rU-Biotin) for lateral-flow |
| Format | Whatman FF120HP nitrocellulose strip + Au-NP capture line |
| Read-out | (1) Limit-of-detection (LOD); (2) specificity vs negative controls; (3) clinical-sample compatibility (sputum + plasma); (4) shelf-life (lyophilized stability) |
| Required precision | LOD ≤ 100 copies/mL plasma (HIV-1); LOD ≤ 10 CFU/mL (TB); 95% specificity |
| Deliverables | Performance characterization report + retained strips + WHO/FDA submission-ready data summary |
| Timeline | M1: Cas13 + crRNA validation; M2: lateral-flow optimization; M3: clinical-sample pilot (anonymized banked samples); M4: report |
| Budget cap | **$XX K** (placeholder — fill before send) |

### Read-out priorities

1. **LOD ≤ WHO 2021 thresholds**: HIV-1 ≤ 1000 copies/mL plasma (virological-failure threshold); TB ≤ 10 CFU/mL (rule-out sensitivity)
2. **Lyophilization-compatible**: cold-chain-free strip viable
3. **Multi-target**: same strip distinguishes TB vs HIV (different capture lines)
4. **24-h shelf-life on bench** (POC field-deployment requirement)

### What we ask in your reply

- [ ] CRISPR-Cas13 enzymology experience (last 3 years; published Cas13 work preferred)
- [ ] Lateral-flow assay development capacity (Au-NP conjugation, nitrocellulose optimization)
- [ ] CLIA-certified clinical sample handling (for TB / HIV banked samples)
- [ ] BSL-2 / BSL-3 lab access (TB samples → BSL-3 required)
- [ ] Estimated timeline + budget for Phase 1 pilot above
- [ ] NDA + MTA terms (crRNA spacer sequences are pre-publication; IP-sensitive)
- [ ] References to similar SHERLOCK / DETECTR / SHINE-class diagnostic projects

### Cross-references

- In-silico design + spec: https://github.com/dancinlab/hexa-bio (axis = ribozyme + crispr-cas13)
- POC diagnostic spec: `crispr-cas13-poc-diagnostic/crispr-cas13-poc-diagnostic.md`
- Future AKIDA edge-AI integration: lateral-flow signal classification on-device (see `wetlab/cro/akida-integration-notes.md` — TODO)

[user signature]

---

## Vendor candidates (research-stage)

| Region | Type | Notes |
|---|---|---|
| Korea | **마크로젠** (Macrogen) | sequencing + Cas9/Cas13 service; clinical-sample access |
| Korea | **바이오니아** (Bioneer) | oligo synthesis + Cas enzyme expression |
| Korea | **연세대 의과대학** | CLIA-equivalent clinical pilot capacity (academic collaboration) |
| US | **Sherlock Biosciences** (commercial) | direct Cas13 lateral-flow expertise; license-dependent |
| US | **Mammoth Biosciences** (DETECTR) | Cas12 specialist; Cas13 less native |
| Switzerland | **Roche Diagnostics** | enterprise CRO; high cost; regulatory-grade |

## Budget reference

Cas13 + lateral-flow pilot: **$50K-200K** (lab work + clinical samples).
Clinical-sample pilot (banked anonymized): adds $20K-50K depending on
sample count. Regulatory-grade (CLIA / WHO PQ submission): $100K-500K +.

## Regulatory pathway considerations

- US: **FDA EUA** (Emergency Use Authorization) precedent for COVID Cas
  tests (SHERLOCK got EUA 2020). TB / HIV LDT (Lab-Developed Test) path
  possible.
- Korea: **식약처 IVD class** (체외진단의료기기). HIV / TB are usually
  **Class III** (high-risk infectious disease diagnostics).
- WHO: **PQ (prequalification)** pathway for global TB / HIV diagnostics —
  preferred for Global South market.
