# DECOMPOSITION_PLAN.md

**Created**: 2026-05-12 (cycle-30++++++) · **Status**: PROPOSAL — no moves executed yet

> User directive (2026-05-12):
> 1. `hexa-medic` 분해해야 됨 — 미용 (cosmetic) + hexa-bio 흡수 두 갈래로
> 2. 추가로 더 분리할 것 체크
>
> This document lays out the inventory + proposed mapping. **No git moves
> executed yet** — waiting for explicit "go" per cluster.

---

## §0 Current state — hexa family inventory

`~/core/hexa-*` 에 이미 35+ sister repos 가 존재:
```
hexa-antimatter   hexa-fantasy    hexa-mobility
hexa-apps         hexa-farm       hexa-os
hexa-arts         hexa-finance    hexa-pet
hexa-aura         hexa-forge      hexa-physics
hexa-bio (us)     hexa-fusion     hexa-rtsc
hexa-bot          hexa-grid       hexa-scope
hexa-brain        hexa-lang       hexa-senses
hexa-cern         hexa-matter     hexa-space
hexa-chip         hexa-medic      hexa-sscb
hexa-codex        hexa-meta       hexa-time
hexa-cosmos       hexa-millennium hexa-ufo
hexa-earth        hexa-mind
hexa-energy
```

핵심 관찰: **scope discipline 깨진 곳이 두 군데** — `hexa-bio` 와 `hexa-medic`. 둘 다
"canon@ded52144 domain catalog 에서 직접 import" 한 결과 무관한 verb 들이
한 repo 에 squat 함.

---

## §1 `hexa-medic` 24-verb 분해 mapping

현재 `dancinlab/hexa-medic` 에 있는 verb 들:

| Verb | 제안 destination | 이유 |
|------|------------|------|
| ~~`cancer-therapy`~~ | ✅ **DELETED 2026-05-12** (user "테라피류는 삭제") | not absorbed into hexa-bio |
| ~~`cosmetic-surgery`~~ | ✅ **MOVED to Floréa 🌸** (`dancinlab/florea`) 2026-05-12 | |
| ~~`gastrointestinal-medicine`~~ | ✅ **DELETED 2026-05-12** (테라피류) | |
| ~~`hair-regeneration`~~ | ✅ **MOVED to Floréa 🌸** 2026-05-12 | |
| ~~`herbalism`~~ | ✅ **DELETED 2026-05-12** (user "분류 애매한것들 삭제" decision) | 분류 모호 (farm/bio/alt-medicine 어디에도 안 맞음) |
| ~~`hiv`~~ | ✅ **DELETED 2026-05-12** (테라피류) | |
| ~~`hiv-treatment`~~ | ✅ **DELETED 2026-05-12** (테라피류) | |
| ~~`immunology`~~ | ✅ **DELETED 2026-05-12** (테라피류) | |
| `medical-device` | 🟡 **KEPT** in hexa-medic (1-verb remaining; final destination TBD) | device class (CDRH); user 결정 대기 |
| ~~`mens-intimate-cleanser`~~ | ✅ **MOVED to Floréa 🌸** 2026-05-12 | |
| ~~`microplastics`~~ | ✅ **MOVED to hexa-matter** ⚛️ 2026-05-12 | materials/environmental |
| ~~`music-therapy`~~ | ✅ **DELETED 2026-05-12** (user decision) | scope-creep verb removed entirely; not re-located to hexa-mind |
| ~~`neuropharmacology`~~ | ✅ **DELETED 2026-05-12** (user 분류 애매 결정) | hexa-bio / hexa-mind 경계 모호 |
| ~~`nuclear-medicine`~~ | ✅ **DELETED 2026-05-12** | therapeutic + diagnostic 이중 분류 모호 |
| ~~`perfumery`~~ | ✅ **MOVED to Floréa 🌸** 2026-05-12 | |
| ~~`pharmacology`~~ | ✅ **DELETED 2026-05-12** (테라피류) | |
| ~~`radiation-biology`~~ | ✅ **DELETED 2026-05-12** (테라피류) | |
| ~~`sleep-medicine`~~ | ✅ **DELETED 2026-05-12** | hexa-bio / hexa-mind 경계 모호 |
| ~~`tattoo-removal`~~ | ✅ **MOVED to Floréa 🌸** 2026-05-12 | |
| ~~`therapeutic-nanobot`~~ | ✅ **DELETED 2026-05-12** (테라피류; 5-axis nanobot axis 와 별도로 spec doc 은 삭제) | |
| ~~`tibetan-medicine`~~ | ✅ **DELETED 2026-05-12** | alt-medicine 분류 모호 |
| ~~`vaccine`~~ | ✅ **DELETED 2026-05-12** (테라피류; 5-axis virocapsid axis 와 별도) | |
| ~~`virology`~~ | ✅ **DELETED 2026-05-12** (테라피류) | |
| ~~`womens-intimate-cleanser`~~ | ✅ **MOVED to Floréa 🌸** 2026-05-12 | |

**Internal infra** (verb 아님, 그대로 유지):
- `cli/`, `tests/`, `state/`, `papers/`, `IMPORTED_FROM_CANON.md`, `hexa.toml`, `install.hexa`,
  `CITATION.cff`, `LICENSE`

### §1.1 분해 후 hexa-medic 자체는?

3 옵션:
- **(A) 완전 archive** — 24 verb 다 분산 후 `hexa-medic` repo 자체를 archive
- **(B) 메타 인덱스로 축소** — `README.md` 만 남겨서 "어디로 갔는지" pointer 역할
- **(C) 일부 verb 만 남기기** — therapeutic + cosmetic 가 빠지면 무엇이 남는지 보고 결정 (예: `tibetan-medicine`, `herbalism` 같은 alt-medicine 만 남겨 alt-medicine hub 로 재포지셔닝)

**권장**: (B) 메타 인덱스. 24 verb 분해 끝나면 hexa-medic 은 "where did everything go" 인덱스로 변환 + sister repo links + git history preserve.

---

## §2 `hexa-bio` squat candidate 분해 mapping

현재 hexa-bio 안에 5-axis (QUANTUM/WEAVE/VIROCAPSID/RIBOZYME/NANOBOT) discipline 어긋난 항목:

| Path | 제안 destination | 이유 |
|------|------------|------|
| ~~`dolphin/dolphin.md`~~ | ✅ **MOVED to `hexa-brain/reference/`** 2026-05-12 | cetacean intelligence / bioacoustics (user 선택; hexa-pet 아님) |
| ~~`dolphin-bioacoustics/dolphin-bioacoustics.md`~~ | ✅ **MOVED to `hexa-brain/reference/`** 2026-05-12 | |
| ~~`hexa-limb/hexa-limb.md`~~ | ✅ **MOVED to `hexa-bot/reference/`** 2026-05-12 | 의수족 = 로봇 substrate; 참고용 .md (user "참고용문서로") |
| `hexa-skin/hexa-skin.md` | 🟡 **TBD** — user 결정 대기 (sensor 분 → hexa-senses, 화장품 분 → Floréa, 둘 다, 또는 삭제) | electronic skin 은 sensor + cosmetic 양면 |
| `crispr-cas13-poc-diagnostic/` | ✅ **KEEP in hexa-bio** (user 정정) | CRISPR-Cas13 자체가 catalytic RNA = ribozyme axis 인접, bio 본질 맞음 |
| `crispr-gene-editing/` | ✅ **KEEP in hexa-bio** | gene therapy = therapeutic, ribozyme axis 와 직접 연결 |
| `synbio/` | ✅ **KEEP in hexa-bio** | synthetic biology = 5-axis foundational |

`.roadmap.disease_*` 209 개 중 cosmetic-class (hexa-beauty 이동 후보):
- `.roadmap.disease_aesthetic_dermatology`
- `.roadmap.disease_acne_specific` (cosmetic-adjacent — therapeutic 측면도 있음, 경계 모호)
- `.roadmap.disease_aging_specific` (consumer anti-aging — therapeutic 측면도 있음)
- `.roadmap.disease_alopecia` / `.roadmap.disease_alopecia_areata_specific` (areata = therapeutic; 일반 alopecia = cosmetic)
- `.roadmap.disease_atopic_dermatitis_specific` (therapeutic — skincare 인 immunology drug)
- ~~`.roadmap.disease_dermatology`~~ ✅ **DELETED 2026-05-12** (cosmetic + therapeutic 분류 모호)

**Rejected-axis exploration files** (전부 ✅ **DELETED 2026-05-12** — axis_expansion_decision_2026_05_08 에서 reject 됐고 exploration doc 만 dead-end 로 남아있던 것들; 분류 모호):
- ~~`.roadmap.axis_bio_evolution_exploration`~~
- ~~`.roadmap.axis_consciousness_exploration`~~
- ~~`.roadmap.axis_planetary_health_exploration`~~
- ~~`.roadmap.axis_quantum_biology_exploration`~~
- ~~`.roadmap.disease_planetary_health`~~ (rejected-axis byproduct)

(`.roadmap.axis_expansion_decision_2026_05_08` 자체는 RECORD of those rejections — 유지)

⚠️ 경계 모호한 dermatology 항목들은 user 가 case-by-case 결정 필요.

---

## §3 신규 standalone repo: **Floréa** 🌸 (`dancinlab/florea`)

**Name (user-decided 2026-05-12)**: **Floréa** 🌸 — 불어 `flore` (꽃) + diminutive `-éa` suffix.
Standalone brand (hexa-* family 와 별도; Lumière style). 발음: `flo·RAY·ah` / 플로레아.

**GitHub URL**: `dancinlab/florea` (URL 슬러그는 accent 없이; display name 만 Floréa).

**Scope**: 화장품 + 미용 + 성형 + skincare + 모발 + 향수 + 시술 — cosmetic / aesthetic 영역
전체. n=6 invariant lattice 적용 (σ(6)=12 미용 verb 등).

**초기 contents**:

```
florea/                            🌸 Floréa — cosmetic/aesthetic substrate
├── README.md                       # Floréa mission + n=6 family 가입 선언
├── hexa.toml                       # hexa family manifest
├── CITATION.cff, LICENSE
├── cosmetic-surgery/               ← hexa-medic 에서 이동 (성형외과)
├── hair-regeneration/              ← hexa-medic (미용 모발)
├── perfumery/                      ← hexa-medic (향수)
├── tattoo-removal/                 ← hexa-medic (시술)
├── mens-intimate-cleanser/         ← hexa-medic (personal care)
├── womens-intimate-cleanser/       ← hexa-medic (personal care)
├── skincare/                       ← hexa-bio/hexa-skin/ (cosmetic 측면)
├── .roadmap.disease_aesthetic_dermatology   ← hexa-bio (cosmetic dermatology)
├── .roadmap.disease_acne_cosmetic           ← hexa-bio (cosmetic side of acne)
├── .roadmap.disease_aging_cosmetic          ← hexa-bio (consumer anti-aging)
├── .roadmap.disease_alopecia_cosmetic       ← hexa-bio (cosmetic hair)
├── cli/, tests/, state/, papers/   (standard infra; hexa family convention)
└── selftest/                       (Floréa side gates)
```

**Branding angle**:
- Lumière 와 같은 결의 French-rooted standalone brand (hexa-* family 멤버이지만 prefix 없음)
- K-beauty / 글로벌 cosmetic 시장 모두에 친숙한 톤
- 향후 sub-product line 도 자연: Floréa Skincare, Floréa Aesthetic, Floréa Surgery 등

---

## §4 기타 hexa-* repos 와의 관계 정리

스캔 결과 다른 hexa-* repos 에 대해서도 보강이 필요할 수 있음:

| Repo | 현재 mission (README) | hexa-bio/hexa-medic 와의 overlap |
|------|------------|------|
| `hexa-aura` | 측두골 클립 BCI chip | 별개 (medical device) — overlap 적음 |
| `hexa-brain` | Neural Substrate pipeline | hexa-mind 와 overlap 가능 — 별도 분석 필요 |
| `hexa-mind` | 7-verb mental substrate | overlap 적음, music_therapy 흡수 후보 |
| `hexa-senses` | 5-verb sensory substrate | sensor / diagnostic / electronic skin 흡수 후보 |
| `hexa-mobility` | Stage-5 autonomous mobility | hexa-limb / medical-device 흡수 후보 |
| `hexa-pet` | 반려동물 toolkit | dolphin / veterinary 흡수 후보 |
| `hexa-farm` | 18-verb agri / food | herbalism / nutrition / 일부 disease_* 흡수 후보 |
| `hexa-earth` | Earth Substrate | microplastics / .roadmap.disease_planetary_health 흡수 후보 |

**별도 깊게 audit 필요**: `hexa-mind` ↔ `hexa-brain` ↔ `hexa-aura` 세 repo 가 모두 neuro/cognitive 영역 — 통합 또는 명확한 분할이 필요할 가능성. (이 plan 의 scope 바깥)

---

## §5 우선순위 실행 sequence

**Phase 1** (1-2일, repo 결정만):
1. `dancinlab/hexa-beauty` 생성 여부 결정 (user)
2. `hexa-medic` 분해 → archive vs meta-index vs partial 선택 (user)
3. 경계 모호 항목 (`herbalism`, `tibetan-medicine`, `nuclear-medicine`, dermatology roadmaps) case-by-case 결정 (user)

**Phase 2** (1주, file moves + history preservation):
4. `git mv` + `git filter-repo` 또는 `git subtree split` 으로 history 보존하며 이동
5. 각 sister repo 에 imports / cross-link 업데이트
6. README / .roadmap.* 파일에 destination pointer 추가

**Phase 3** (1주, post-move 정합성 검증):
7. 모든 inter-repo CLI gate / state-ref refresh 작동 확인
8. hexa-bio selftest 통과 확인 (5-axis discipline 유지)
9. 각 sister repo selftest 통과 확인
10. AGENTS.md "Sister repositories" 섹션 업데이트

**Phase 4** (decommission):
11. `hexa-medic` archive 또는 meta-index 변환
12. `README.md` 와 `CLOSURE_RESIDUAL_BACKLOG.md` 최종 정리

---

## §6 위험 / caveats

1. **Git history 보존** — 단순 `git mv` 는 history 깨짐. `git filter-repo --path` 또는
   `git subtree split` 사용 필요. AI agent 가 자동화 어려움 — user 검토 권장.

2. **canon@ded52144 import chain** — hexa-medic 의 모든 verb 가
   `@canonical: canon@ded52144:domains/...` annotation 보유. 이동 후에도 canon
   pointer 유지해야 traceability 유지. (canon 자체는 retired 됐지만 legacy-canon
   참조는 살아있음.)

3. **Cross-repo dependencies** — hexa-bio 가 hexa-medic 의 어떤 verb 를 import 하는지
   먼저 grep 필요. 의존성 깨면 hexa-bio selftest fail.

4. **regulatory split 명확화** — cosmetic vs therapeutic 가 borderline 인 경우
   (anti-aging, atopic dermatitis 등) regulatory classification 이 unclear 할 수
   있음. 각 항목 명시적 결정 필요.

5. **Naming conflict** — `hexa-beauty` 가 적절한 이름인지? alt 후보:
   `hexa-cosmetic`, `hexa-aesthetic`, `hexa-skincare`, `hexa-mi-yong` (미용 romanise).
   user 결정 필요.

---

## §7 결정 필요 question 요약 (user 직접)

1. **`hexa-beauty` repo 신규 생성?** (Y/N — 권장 Y)
2. **`hexa-medic` 분해 후 잔여 처리**?
   - (A) 완전 archive
   - (B) meta-index 로 축소 ← 권장
   - (C) alt-medicine hub 로 재포지셔닝 (herbalism, tibetan-medicine 만 남기기)
3. **경계 모호 항목 결정**:
   - `herbalism` → hexa-farm? alt-medicine hub? hexa-bio?
   - `tibetan-medicine` → 같은 질문
   - `nuclear-medicine` → hexa-bio 단일? hexa-bio + hexa-senses 분할?
   - `neuropharmacology` → hexa-bio? hexa-mind?
   - `sleep-medicine` → hexa-bio? hexa-mind?
   - `.roadmap.disease_dermatology` → 분할 (cosmetic 부분 + therapeutic 부분)?
4. **별도 audit 필요**: `hexa-mind` ↔ `hexa-brain` ↔ `hexa-aura` 통합/분할?
5. **Phase 2 file move** — software (claude) 가 git filter-repo 자동화 시도? user 직접?

---

## §8 raw_91 honest C3

- 이 plan 은 **proposal only** — 실제 git move 는 user 결정 후 진행
- canon@ded52144 lineage 가 hexa-medic 모든 verb 에 박혀있음. 이동 시 lineage pointer 유지 필요
- 일부 항목 (특히 dermatology, neuropharmacology, sleep-medicine) 은 cosmetic/therapeutic
  경계가 본질적으로 모호. 깔끔한 분할 불가능할 수 있음 — user 의 product / regulatory
  strategy 결정에 따름
- 35+ hexa-* repo 의 전체 family 정합성은 이 plan 의 scope 바깥. 다른 repo 들도
  squat issue 가 있을 가능성 — 별도 audit 권장
