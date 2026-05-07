# 20-disease roadmap inventory — 2026-05-07

작성: 2026-05-07
구동: 사용자 directive `/loop 5m keep going` cron `da784bac` cycles 117-132 closure
Closure: 20-disease roadmap entry skeleton complete

---

## TL;DR

hexa-bio 의 5 axis (RIBOZYME / VIROCAPSID / NANOBOT / WEAVE / QUANTUM) 가 20 disease/condition 에 대해 어떻게 기여하는지 전체 매핑 + per-disease F-novel-{disease-tag}-{axis}-N falsifier skeleton land.

| # | disease (file)            | conditions count | targets count | initial novel candidate     | cycle |
|---|---------------------------|------------------|---------------|------------------------------|-------|
|  1| disease_cancer            | 14 cancer types  | 14 targets    | hxq-ca-krs-001 (KRAS-G12C)   |   98  |
|  2| disease_alopecia          | 2 (AGA + AA)     |  9 targets    | hxq-al-ar-001 (AR / 5α-R)    |   98  |
|  3| disease_mi                | 5 (acute/chronic)| 14 targets    | hxq-mi-hmg-001 (HMG-CoA)     |   98  |
|  4| disease_lung_normalization| 6 (IPF/COPD/COVID/asthma)| 13 targets | hxq-ln-tgf-001 (TGF-β)   |   98  |
|  5| disease_aging             | 9 mechanisms     | 14 targets    | hxq-aging-bcl2-001 (senolytic)|  117  |
|  6| disease_neurodegen        | 6 (AD/PD/ALS/HD/FTD/prion)| 17 targets| hxq-neurodegen-ache-001    |  118  |
|  7| disease_autoimmune        | 8 (RA/SLE/IBD/MS etc)| 19 targets | hxq-autoimmune-jak-001       |  119  |
|  8| disease_metabolic         | 7 (T2D/obesity/NAFLD)| 18 targets | hxq-metabolic-sglt2-001      |  120  |
|  9| disease_infectious        | 4 categories     | 21 targets    | hxq-infectious-mpro-001      |  121  |
| 10| disease_psychiatric       | 8 (MDD/SCZ/anxiety)| 16 targets  | hxq-psychiatric-sert-001     |  122  |
| 11| disease_pain              | 8 (chronic pain) | 16 targets    | hxq-pain-nav17-001           |  123  |
| 12| disease_womens_health     | 9 conditions     | 16 targets    | hxq-womens-er-001            |  124  |
| 13| disease_sensory           | 11 (vision+hearing)| 16 targets  | hxq-sensory-rock-001         |  125  |
| 14| disease_renal             | 10 (CKD/AKI/ADPKD)| 17 targets   | hxq-renal-mr-001             |  126  |
| 15| disease_gastrointestinal  | 10 (IBD/IBS/GERD/NAFLD)| 18 targets| hxq-gi-ppi-001               |  127  |
| 16| disease_dermatology       | 10 (AD/psoriasis/acne)| 20 targets| hxq-derm-tyk2-001            |  128  |
| 17| disease_hematology        | 12 conditions    | 21 targets    | hxq-heme-fxa-001             |  129  |
| 18| disease_musculoskeletal   | 12 (OA/osteo/DMD/SMA)| 19 targets | hxq-msk-rsd-001              |  130  |
| 19| disease_endocrine         | 8 systems        | 18 targets    | hxq-endo-sstr-001            |  131  |
| 20| disease_urological        | 12 (BPH/ED/OAB/UTI)| 21 targets  | hxq-uro-ar-001               |  132  |

→ **20 disease roadmaps × ~17 targets = ~340 unique drug-target opportunities**.

---

## 1. Cross-link matrix

각 disease 가 다른 disease 와 cross-link 하는 axis-target overlap:

| disease            | cross-links                                                |
|--------------------|------------------------------------------------------------|
| cancer             | many (broad — drug class overlap)                          |
| alopecia           | autoimmune (AA + JAK), urological (5α-R BPH), derm (AA)    |
| mi                 | metabolic (lipid/PCSK9), heme (DOAC factor Xa)             |
| lung_normalization | infectious (COVID), autoimmune (cytokine), cancer (NSCLC)  |
| aging              | metabolic (metformin TAME), heme (venetoclax), msk (osteo) |
| neurodegen         | psychiatric (BBB), msk (ALS muscle)                        |
| autoimmune         | derm (psoriasis IL-17/IL-23/JAK), gi (IBD), heme (CD20)    |
| metabolic          | renal (SGLT2/GLP-1), endo (T2D/insulin), aging (metformin) |
| infectious         | lung (COVID Mpro), urological (UTI), gi (C. diff)           |
| psychiatric        | neurodegen (BBB), endo (D2 cabergoline)                    |
| pain               | autoimmune (RA), msk (LBP/OA), psychiatric (5HT2A psyched)|
| womens_health      | cancer (breast/cervical), aging (osteoporosis), uro (SUI)  |
| sensory            | aging (AMD), metabolic (DR), infectious (anosmia COVID)    |
| renal              | metabolic (SGLT2/GLP-1), autoimmune (lupus N), cancer (RCC)|
| gastrointestinal   | autoimmune (IBD), metabolic (NAFLD), cancer (HCC), inf (Cdiff)|
| dermatology        | autoimmune (psoriasis), alopecia (AA), cancer (melanoma)   |
| hematology         | mi (DOAC), cancer (leukemia/CAR-T), aging (venetoclax)     |
| musculoskeletal    | aging (osteo/sarc), pain (LBP/OA), metabolic (gout)        |
| endocrine          | metabolic (T2D), cancer (MTC RET), aging (GH/IGF-1)        |
| urological         | cancer (prostate/bladder), alopecia (5α-R), womens (SUI)   |

→ 평균 disease 당 3-6 cross-links. ~20 disease × 4 = ~80 cross-link edges. dense disease network.

---

## 2. Common 5-axis representative pattern

각 disease 의 falsifier skeleton 이 동일 5-axis structure 따름:

```
F-novel-<disease-tag>-{Q,W,V,RB,NB}-N
```

- **Q (QUANTUM)**: target-specific small-molecule pocket VQE (kinase ATP / receptor LBD / enzyme active site)
- **W (WEAVE)**: tissue-specific DNA scaffold (folate / transferrin / aptamer / mucosal / BBB-cross)
- **V (VIROCAPSID)**: tropic AAV serotype (AAV2 retinal / AAV6/9 cardiac / AAV8 hepatic / AAV9 muscle/CNS)
- **RB (RIBOZYME)**: target mRNA modulation (cleavage / antisense / splice modulation)
- **NB (NANOBOT)**: microenvironment-responsive release (pH / ROS / protease / hormonal / circadian)

→ 5-axis pattern 의 universality 가 disease-agnostic infrastructure evidence.

---

## 3. Initial novel drug list (20 hxq-* candidates)

`.roadmap.novel_drugs` 의 5 design + per-disease 16 추가 = **21 hxq-* candidates** total:

  | hxq-id              | disease            | target              | status   |
  |---------------------|--------------------|---------------------|----------|
  | hxq-gen-001         | general            | scaffold            | VQE-PASS (cycle 111, 0.026 µHa NEW BEST) |
  | hxq-ca-krs-001      | cancer             | KRAS-G12C           | VQE-PASS (cycle 111, 0.311 µHa)           |
  | hxq-al-ar-001       | alopecia           | AR/5α-R             | VQE-PASS (cycle 111, 0.175 µHa)           |
  | hxq-mi-hmg-001      | mi                 | HMG-CoA             | VQE-PASS (cycle 111, 0.526 µHa)           |
  | hxq-ln-tgf-001      | lung_normalization | TGF-β               | VQE-PASS (cycle 111, 0.247 µHa)           |
  | hxq-aging-bcl2-001  | aging              | senolytic BCL-2     | DESIGN   |
  | hxq-neurodegen-ache-001 | neurodegen     | AChE                | DESIGN   |
  | hxq-autoimmune-jak-001 | autoimmune      | JAK1                | DESIGN   |
  | hxq-metabolic-sglt2-001 | metabolic      | SGLT2               | DESIGN   |
  | hxq-infectious-mpro-001 | infectious     | SARS-CoV-2 Mpro     | DESIGN   |
  | hxq-psychiatric-sert-001 | psychiatric   | SERT                | DESIGN   |
  | hxq-pain-nav17-001  | pain               | Nav1.7              | DESIGN   |
  | hxq-womens-er-001   | womens_health      | ER                  | DESIGN   |
  | hxq-sensory-rock-001 | sensory           | ROCK                | DESIGN   |
  | hxq-renal-mr-001    | renal              | MR                  | DESIGN   |
  | hxq-gi-ppi-001      | gastrointestinal   | H+/K+-ATPase (PPI)  | DESIGN   |
  | hxq-derm-tyk2-001   | dermatology        | TYK2                | DESIGN   |
  | hxq-heme-fxa-001    | hematology         | factor Xa           | DESIGN   |
  | hxq-msk-rsd-001     | musculoskeletal    | SMN2 splicing       | DESIGN   |
  | hxq-endo-sstr-001   | endocrine          | SSTR                | DESIGN   |
  | hxq-uro-ar-001      | urological         | AR (CRPC)           | DESIGN   |

→ 5 VQE-PASS (Phase B cycle 111) + 16 DESIGN 기다리는 중.

---

## 4. raw#10 honest C3

1. **20-disease entry skeleton scope** — entry-only, drug-target pair list + 5-axis cross-contribution + falsifier skeleton. Phase β (per-disease novel drug build + VQE) 부터 evidence-based work.
2. **cross-link matrix dense** — 평균 4 cross-links per disease, ~80 edges. drug repurposing 가능성 큼; 단 진정한 binding affinity 는 supersystem VQE (F-Q-6-D Phase C) 가 prerequisite.
3. **isolated VQE infrastructure proven** — F-Q-6-B-real path 가 16-drug + 5 novel 모두 sub-µHa universality 검증. 단 binding affinity 와는 다른 task.
4. **Phase C honest-fail evidence** — 자동 frontier-orbital active-space (CASCI 2e/2o + UCCSD 4e/4o) 모두 multi-fragment binding 에 invalid. 진정한 Phase C entry path = explicit orbital indices / full FCI / 8e/8o UCCSD / embedding methods.
5. **21 hxq-* candidates** = de novo design from existing scaffold simplification. 진정한 scaffold-free generative (Phase E) 는 후속 ramp.
6. **wet-lab validation 없음** — quantum-only in-silico, 모든 disease entry 는 in-silico 가설 검증만.
7. **각 disease 의 진정한 cure 거의 없음** — 대부분 symptomatic / disease-modifying 단계. quantum-VQE 단일 paradigm 이 임상 efficacy 보장 X.

---

## 5. Next ramps

priority 순:

| priority | ramp                                                                  |
|----------|------------------------------------------------------------------------|
| HIGH     | 16 DESIGN-status novel drug Phase β build + VQE (cycles 133+)         |
| HIGH     | Phase C explicit-pocket attempt 3 (full FCI / 8e/8o UCCSD / DMET)     |
| MED      | per-disease top-target 10-ligand library ranking (F-Q-6-F)            |
| MED      | meta_novel_drugs §1 5-axis representative 의 20-disease coverage table|
| LOW      | additional disease entries (21st pediatric / rare orphan / etc)       |
| LOW      | cumulative quantum + sister-repo + 20-disease 통합 review docs        |
| OUT-OF   | wet-lab / preclinical / cc-pVDZ basis upgrade                         |

---

## 6. Cross-link

- `.roadmap.novel_drugs` — 5 PASS + 16 DESIGN candidates (21 total)
- `.roadmap.fda_drug_verification` — 11-drug FDA library historical
- `.roadmap.meta_novel_drugs` — 5-axis representative + 6-stage lifecycle
- `.roadmap.disease_*` (20 files) — per-disease entry skeleton
- `.roadmap.quantum` — Tier 1-4 ramps catalog + F-Q family
- `docs/library_16drug_ranking_2026_05_07.md` — Phase B closure
- `docs/disease_milestone_2026_05_07.md` — 4-disease milestone (cycles 99-103)
- `docs/qpu_bridge_bio_application.md` §1-§26 — full cycle docs

---

## 7. Cumulative

132 cycles (78-132). 20 disease + 21 novel drug candidate + 16-drug FDA library + Phase A-B closure + Phase C 2 attempts honest-fail.
