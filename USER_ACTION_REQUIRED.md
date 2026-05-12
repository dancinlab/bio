# USER_ACTION_REQUIRED.md

**Created**: 2026-05-12 (cycle-30++++++) · **Audience**: repo owner (you)

> Items below are **NOT software work** — they require human decision-making,
> outreach, contracts, regulatory engagement, or capital allocation. Software
> side is ready; the gating constraint is the external counterparty.
>
> Tracking: [`CLOSURE_RESIDUAL_BACKLOG.md`](CLOSURE_RESIDUAL_BACKLOG.md) §C.
> Status as of cycle-30++++++: 2 of 11 (c) items LIVE (qmirror); **7 require
> user action below**; 2 permanently external (10-year horizon).

---

## §1 즉시 결정 필요 (Decision-making)

이 결정들은 software 가 대신 할 수 없음. 사용자가 직접 정해야 함.

### 1.1 `dancinlab/hexa-medic` sister repo 생성 여부
**Why this matters**: wet-lab / clinical 작업 (ribozyme in-vitro, nanobot wet-lab, virocapsid cryo-EM, cell-based assembly) 의 destination 이 현재 "none". hexa-bio 가 software-only repo 이므로, wet-lab은 별도 repo 에서 다뤄야 함. `hexa-medic` 이라는 sister repo 가 자연스러운 이름이지만 아직 만들어지지 않음.

**Options**:
- (a) `hexa-medic` 새로 만들기 — 모든 wet-lab handoff schema, CRO contract templates, IRB / IND drafts 등 보관
- (b) 기존 `hexa-bio` 안에 `wetlab/` 디렉토리로 — 단순하지만 software-only 원칙 깨짐
- (c) 결정 미루기 — CRO 선정 후 그 시점에 결정

**Recommended**: (a) hexa-medic 생성. 빈 repo + README 만 만들어두면 됨 (5분).

### 1.2 Wet-lab CRO 후보 선정
**Why**: §C1.1 nanobot, §C2.1 ribozyme, §C3.2 cell-based assembly 셋 다 wet-lab CRO 필요.

**Sourcing options** (조사 시작점):
- **Korea (대한민국)**: KIST 분자세포생물학 그룹, 서울대 / 카이스트 wet-lab core facility, 바이오니아, 마크로젠 (off-target sequencing 강함)
- **US**: Charles River Laboratories, Eurofins (broad CRO), Genscript (oligo synthesis + screening)
- **DNA-origami 전문**: Tilibit Nanosystems (DE), Tecton (US) — nanobot 영역
- **Cryo-EM**: NIH 시설 (free for collaborators), Diamond Light Source (UK), 카이스트 cryo-EM 센터

**Action**: 3-5개 vendor 에게 RFP 보내기. Budget: $50K-200K per axis (wet-lab pilot 기준).

### 1.3 Patent counsel firm 선정
**Why**: §C1.2 nanobot IP — DNA-origami actuation 디자인 + ribozyme 12-nt cleavage geometry 둘 다 patentable subject matter 가능성 있음.

**Korea**: 김앤장 IP, 광장 IP, 율촌 IP — 모두 biotech patent 강함. 1-2 회 consultation $5K-10K.

**US**: Wilson Sonsini, Cooley LLP — biotech VC 출신 회사들 자주 씀.

**Action**: 1차 무료 consultation 미팅 잡기. 비밀유지각서(NDA) 먼저 받고 disclosure.

### 1.4 Quantum HW vendor decision (long-horizon only)
**Why**: §C4.3 fault-tolerant (>30 qubit) — qmirror 가 ≤30 qubit 까지는 sufficient. >30 qubit 워크로드가 필요한 시점에 결정.

**Current state**: qmirror v2.1.0 가 모든 v1.x · v2.0.0 quantum 요구사항 cover. **이 결정은 지금 안 해도 됨** — v3.0.0+ 시점에 재검토.

---

## §2 Outreach / procurement (사용자가 직접 contact)

### 2.1 CRO RFP 보내기 (per axis)
**Template** (각 CRO에 동일하게):
```
Subject: Pilot wet-lab engagement RFP — [ribozyme / nanobot / virocapsid]

We are a [Korea-based / US-based] research entity developing a
[hammerhead ribozyme / DNA-origami nanobot / synthetic capsid]
based on the hexa-weave invariant-lattice framework (sigma(6)=12
geometric foundation).

Pilot scope (Phase 1, ~3 months):
- [axis-specific deliverables, see below]
- Read-out: [specific assays per axis]
- Budget cap: $XXK

Please reply with:
- Capability statement
- Estimated timeline + budget for pilot
- Sample contract / MTA template
```

Per-axis deliverables:
- **Ribozyme** (C2.1): synthesize hammerhead 12-nt variant; in-vitro cleavage kinetics; k_cat / K_m measurement
- **Nanobot** (C1.1): DNA-origami fold + actuation imaging (AFM + cryo-EM); work measurement ~50 kT
- **Virocapsid** (C3.1, C3.2): T=1/T=3 cage assembly in-vitro; yield ≥0.85 verification; cryo-EM structure resolution

**Action time per RFP**: ~2 hours drafting + send. **Total**: 3 axes × 3-5 vendors = 9-15 RFPs.

### 2.2 Patent counsel meeting
- 1차 미팅: invention disclosure 문서 (claim 5-10개) 준비. ~4 hours.
- 후속: provisional patent application drafting (counsel에게 위임 가능). ~$5K-15K.

### 2.3 Regulatory consultant 컨택
**Why**: §C5.1-C5.3 clinical pipeline 의 Stage 6-8 (IND/Phase 1-3) 진입 시점이 멀지만, regulatory pathway 를 미리 알아두면 wet-lab pilot 의 protocol design 도 정교해짐.

**Korea**: 식약처(MFDS) pre-IND meeting 신청 가능. 무료. 6-12 개월 lead time.
**US**: FDA pre-IND meeting (Type B). 무료. 60-90 일 lead time.

**Action**: 1차 미팅 — phase / class 결정 (advanced therapy? gene therapy? medical device?). Wet-lab 진행 1-2 년 후 시점.

---

## §3 Funding / budgeting (사용자가 직접 결정)

| Item | Estimated cost | Timeline |
|------|---------------|----------|
| Wet-lab CRO pilots (3 axes × Phase 1) | $150K-600K total | 3-6 개월 |
| IP filing (3 provisionals + 2 PCT) | $15K-50K total | 6-18 개월 |
| Cryo-EM session (1-2 grids) | $10K-30K | 1-3 개월 |
| Clinical regulatory consulting (pre-IND) | $20K-50K | 6-12 개월 |
| Quantum vendor credits (when needed) | $5K-50K/yr | as needed |

**총 Phase 1 추정 budget**: ~$200K-800K (3 wet-lab pilots + IP + cryo-EM).

**Funding sources** (조사 시작점):
- Korea: KIAT bio-grant, 산업통상자원부 R&D, KAIST internal, 한국연구재단(NRF)
- US: NIH SBIR/STTR, NSF I-Corps
- Private: bio VC (Lightspeed, ARCH Venture, IndieBio)

---

## §4 Documentation / legal (사용자 직접 또는 위임)

### 4.1 Invention disclosure documents
**For**: §1.3 patent counsel meetings
**What**: 각 axis 별 1-2 page disclosure — novelty claim, prior art, drawing.
**Source**: hexa-bio `.roadmap.{ribozyme,nanobot,virocapsid}` files + `docs/closure_100_research_2026_05_12.md` 에서 reverse-engineer 가능.

### 4.2 CRO contracts / MTAs
**What**: Material Transfer Agreement + scope-of-work + IP-ownership clause.
**Standard**: BIO MTA template (https://www.bio.org/) 또는 NIH UBMTA 사용.
**Action**: legal review 필요 — §1.3 patent counsel 에게 위임 가능.

### 4.3 hexa-medic repo seed (if §1.1 = yes)
**What**: 새 repo 만들 때 첫 contents:
- `README.md` — sister-repo role 설명
- `wetlab/protocols/` — CRO 별 SOP 보관 디렉토리
- `wetlab/data/` — read-out 결과 (anonymized) 보관 디렉토리
- `ip/` — provisional patent drafts (private branch 권장)
- `regulatory/` — pre-IND drafts

**Action**: 사용자가 결정 후 `gh repo create dancinlab/hexa-medic --private` 한 줄로 생성. 디렉토리 구조 seed 는 software (claude/agent) 가 할 수 있음.

---

## §5 우선순위 권장

**Cycle 30 끝 ~ Cycle 31 초** (1-2 주):
1. ✅ §1.1 — `hexa-medic` repo 생성 결정 + 생성 (15분)
2. ✅ §1.3 — Patent counsel 1차 무료 consultation 1건 (2-4 시간)
3. ✅ §1.2 → §2.1 — wet-lab CRO 3-5 곳 RFP draft + send (8-16 시간)

**Cycle 31 - 32** (1-2 개월):
4. CRO replies 평가 + 1개 선택 (per axis)
5. §2.3 — regulatory consultant 1차 미팅 잡기
6. §4.1 — invention disclosure 3건 작성

**Cycle 33+** (3-6 개월):
7. Wet-lab pilot 시작 (선정한 CRO와)
8. IP filing
9. Cryo-EM session

**미루기 가능 (12+ 개월)**:
- §1.4 quantum HW vendor (qmirror 충분)
- §2.3 regulatory pre-IND meeting (wet-lab 진행 1-2년 후)

---

## §6 Software side 가 추가로 도와줄 수 있는 것

만약 §1-§5 어느 항목이든 software 가 도울 수 있는 부분이 있으면 (e.g. RFP template 자동 채우기, invention disclosure 1차 draft, hexa-medic seed 구조 생성) — request 만 주시면 됩니다. 외부 카운터파티와의 contact / decision / 계약 / 자금만이 software 가 못 하는 부분.

---

## §7 raw_91 honest C3

- 위 estimate (cost, timeline) 는 industry standard 기준. 실제 quote 는 각 CRO/firm 마다 다름.
- Korea 기준이 fast-cheap 이지만 cryo-EM facility / DNA-origami 전문 vendor 는 US/EU 가 더 강함.
- 모든 CRO RFP 는 NDA 우선 — disclosure 전에 confidentiality 보장 받기.
- Patent filing 은 disclosure 후 12 개월 deadline (provisional + 1 yr PCT). Wet-lab 결과 나오기 전에 일정 부분 filing 하는 게 적절.
