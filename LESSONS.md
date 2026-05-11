# v7.1 Phase γ pocket VQE loop — 교훈 정리 (lessons learned)
**날짜**: 2026-05-11 ~ 2026-05-12 (iter 0-22)
**범위**: CMT/ALS + cohort 확장 (cancer·alopecia·mi·lung) 신약 후보의 pocket-restricted active-space VQE chain (F-Q-6-D)
**최종 iter**: 22 (M.tb InhA/isoniazid sub-µHa — antimicrobial 트리오 완성) + iter 19 §15.8 closure 선언 — quantum-axis software-closable 100%
**status**: **18 target chem-acc PASS** (CMT 5 + ALS 5 + KRAS-G12C + AR + HMG-CoA + ALK5 + Mpro + HIV-1 PR + hammerhead ribozyme + M.tb InhA), **11 sub-µHa**, **10 systems/mechanisms** (6 disease cohort + 3 antimicrobial + ribozyme 촉매) → §15.8 software-closable closure 선언 (quantum × ribozyme axis bridge 포함)

본 문서 = **재현 가능한 교훈** 정리. 다음 세션 / 다른 disease 적용 시 reference.

---

## 1. methodology — 양자 chemistry pipeline

### 1.1. optimizer selection — universal 없음

이전 가정 ("SLSQP는 항상 좋다") 는 KIF5A iter 7 에서 무너짐. 그 다음 가정 ("L_BFGS_B 가 universal") 도 c9orf72 iter 10 에서 무너짐. 교훈:

| cluster type                | best optimizer | worst optimizer | 함의 |
|------------------------------|----------------|------------------|------|
| 💧 RNA WC + thiophosphate    | L_BFGS_B       | (untested)       | gradient 강력 |
| 🧬 light-atom 다중 H-bond    | L_BFGS_B       | SLSQP (local trap) | KIF5A 7280→0.023 µHa |
| 🔬 ionic/saturated/protein   | SLSQP          | (L_BFGS_B 동등)  | 단순 PES, 어떤 optimizer 도 OK |
| ⚛️ Mg+adenine+S+indole       | SLSQP          | (untested)       | TBK1 sub-µHa |
| 🪨 transition metal d-orbital | L_BFGS_B≈SLSQP | (basis 한계)     | optimizer 무관 |
| 🌐 K⁺ + π-stack              | SLSQP          | **L_BFGS_B (악화 700x)** | c9orf72 1.4→964 µHa |
| 🌀 conjugated heterocycle    | L_BFGS_B (절반 개선) | SLSQP          | SARM1 |
| 🦠 thioether-S + imidazole + imine (21-atom, n_pauli 325) | SLSQP (~403s 수렴) | **L_BFGS_B (600s 미수렴)** | Mpro/nirmatrelvir adduct iter 18 |
| 🧬 phosphate ester + alcohol + amine (23-atom, n_pauli 325) | SLSQP (124s, 0.12 µHa) | (untested) | hammerhead ribozyme core iter 21 — 가장 빠른 n_pauli-325 |
| 💊 dihydropyridine + 공액 carboxamide (23-atom, n_pauli 325) | SLSQP (161s, 0.90 µHa) | (untested) | M.tb InhA/isoniazid iter 22 — NADH hydride-donor core |

→ **production 권장**: 3 optimizer (SLSQP / L_BFGS_B / COBYLA) × 3 seed (7/42/123) = 9-cell grid screen + best 선택. 단일 optimizer 신뢰 금지.

### 1.2. sub-µHa 가능성 predictor

본 loop 의 finding: **n_pauli 만으로는 부족한 predictor** (TBK1 n_pauli 325 임에도 sub-µHa). 더 좋은 predictor 는 chemistry 다양성 + frontier-orbital localization:

- ✅ sub-µHa 가능: light-atom dominant (H/C/N/O/S), 다중 chemical species, frontier 가 well-separated bonding/antibonding
- ❌ sub-µHa 불가: transition metal d-orbital localized, near-degenerate frontier (π-stack), 큰 conjugated system

**n_pauli (175 vs 325) ≈ frontier active space 의 *character* proxy — sub-µHa 는 frontier *localization/separation* 이 결정**:
- iter 16 (`hxq-mi-hmg-001`): sp3-heavy backbone (3-OH-3-Me-butanoate + NH3, 21 atom) 으로 짰는데도 n_pauli **325** — carboxylate 의 delocalized O–C–O π/π* 가 4e/4o frontier 에 들어가서. carbonyl/carboxylate/aromatic 이 분자 안에 있으면 active space 가 자주 거기 걸린다 → delta 27.4 µHa, chem-acc only.
- 반대로 KRAS-tiny adduct (`hxq-ca-kras-001`) 는 thioether **S lone-pair** 가 frontier → n_pauli ~175 → sub-µHa + 빠른 VQE.
- **단, n_pauli 큰 게 곧 sub-µHa 불가 아님**: TBK1 (n_pauli 325), ALK5 iter 17 (imidazole+formamide, n_pauli 317, **0.30 µHa**·443s), HIV-1 PR iter 20 (carboxyl-dyad + alcohol, n_pauli 325, **0.15 µHa**·246s), hammerhead ribozyme iter 21 (phosphate ester, n_pauli 325, nbas 67, CASCI -879 Ha, **0.12 µHa**·124s!), M.tb InhA iter 22 (dihydropyridine + 공액 carboxamide, n_pauli 325, **0.90 µHa**·161s) — aromatic/conjugated/phosphate/dihydropyridine **5 클러스터가 전부 sub-µHa + 빠름**. "aromatic/carboxylate/phosphate/conjugated = chem-acc only / 느림" 은 틀린 진술. 느린·chem-acc-only 케이스 (iter 16 HMG carboxylate-π 단독 frontier 27.4 µHa·516s, iter 18 Mpro thioimidate C=N near-degenerate 1.10 µHa·403s) 는 전부 frontier near-degeneracy 가 원인. **유일한 sub-µHa·속도 결정 인자 = frontier 4-orbital 의 near-degeneracy 유무. n_pauli·atom 수·nbas·총 에너지·conjugation 전부 무관.**
- → loop-cheap (175, ~2min) 원하면: aromatic ring·conjugated carbonyl chain·carboxylate 배제, frontier 를 S/N lone-pair·σ-bond 영역으로. 그게 안 되는 chemistry (mevalonate carboxylate, kinase ATP-hinge imidazole 등) 는 n_pauli ~317-325 를 받아들이고 dedicated 600s run (SLSQP/150, 1 optimizer) — chem-acc 는 항상, sub-µHa 는 frontier 운이 좋으면 (§3, §4.1).

### 1.3. UCCSD reps=1 충분 — reps=2 는 악화 위험

§12.2.i finding (v7 round 5): UCCSD reps=2 (52 params) 가 reps=1 (26 params) 대비 sub-µHa **개선 없음**, 일부 cluster 에서 악화. 26-param landscape 가 frontier 4e/4o 의 capacity 한계 — 더 큰 ansatz 는 local trap 만 늘림.

→ **production 권장**: UCCSD reps=1 default, 활성공간 6e/6o+ 으로 ramp 시 reps 재평가.

---

## 2. infrastructure — sshfs + Python + qiskit

### 2.1. sshfs FUSE 한계

mac_home 이 sshfs로 mount 된 환경에서 다음 known issues:

| issue                            | symptom                                          | 우회                               |
|-----------------------------------|--------------------------------------------------|------------------------------------|
| nested `.so` dlopen 불안정       | `libRDKitForceFieldHelpers.so.1` not-found 간헐 | venv를 local SSD 복사 (`/home/<user>/.venv-*`) |
| 새 `.py` 파일 PermissionError    | Write tool 직후 python 실행 시 "Operation not permitted" | local SSD 복사 후 실행 (`cp` 후 python) |
| Write tool 의 .md 파일 EPERM    | sshfs uid 매핑 (501→aiden/summer) 충돌            | local SSD `cat << EOF` heredoc 후 `cp` |
| `mmap()` block (read() 와 분기)  | numpy/qiskit large array 처리 시 hang           | local SSD 작업 후 결과만 sshfs 에 commit |

### 2.2. venv 재구축 (host 이동 시)

다른 host 에서 동일 환경 재구축:
```bash
python3 -m venv /home/<user>/.venv-hexa-bio
/home/<user>/.venv-hexa-bio/bin/pip install rdkit qiskit qiskit-nature pyscf qiskit-algorithms
```
~2GB, ~5-10분. 동일 stack: rdkit 2026.3.1 / qiskit 2.4.1 / qiskit-nature 0.7.2 / pyscf 2.13.0 / qiskit-algorithms 0.4.0.

---

## 3. compute boundary — loop-feasible vs 외부 ramp

5분 cron cadence 안에서 가능 / 불가능 경계:

| approach                           | basis    | active space | nbas / n_qubits | loop-feasible? | note |
|------------------------------------|----------|---------------|------------------|----------------|------|
| sto-3g 4e/4o, n_pauli ~175 (sat/ionic)  | sto-3g | 4e/4o     | ~140 / 6         | ✅ ~1-3 min    | ClC-1·KRAS-tiny; 5분 loop 안에 2-3개 가능 |
| sto-3g 4e/4o, n_pauli ~325 (conj/aromat) | sto-3g | 4e/4o     | ~140-320 / 6     | ⚠️ ~5-9 min VQE | AR·HMG·TBK1; **480s timeout 부족** → `timeout 600` (cron-shell max) + maxiter ↓ 150 = chem-acc PASS (iter 16: HMG 27.4 µHa @ wall 516s). 1 iter = 1 cluster 전용. |
| sto-3g 6e/6o (larger AS)           | sto-3g   | 6e/6o         | ~140 / 10        | ❌ 8+ min      | n_params 117, n_pauli 1819, VQE timeout |
| lanl2dz ECP 4e/4o                  | lanl2dz  | 4e/4o         | 168 / 6          | ❌ OOM         | integral tensor 5+ GB |
| 6-31g 4e/4o                        | 6-31g    | 4e/4o         | ~200 / 6         | ❌ 8+ min RHF  | SCF DIIS 미수렴 |
| def2-svp 4e/4o (27-atom Zn cluster) | def2-svp | 4e/4o         | ~320 / 6         | ❌ 60+ min RHF | killed |

→ **외부 ramp** (loop-out, multi-hour HPC/GPU): def2-svp pocket VQE / 6e/6o full convergence / 실 PDB co-crystal + QM/MM.

---

## 4. workflow — background task 운영

### 4.1. detached + waiter 패턴

```bash
# 무거운 계산은 nohup detached + timeout 으로
nohup timeout 360 python tests/foo.py > /tmp/foo.log 2>&1 &
PID=$!

# waiter (검증된 패턴): /proc/<pid> 디렉터리 사라질 때까지 대기
until [ ! -d /proc/$PID ]; do sleep 15; done
```

피해야 할 anti-pattern:
- ❌ `until ! pgrep -f "lanl2dz"; do sleep...` — pgrep 가 자기 자신 매치 (bash command string 안에 "lanl2dz") 로 무한 loop
- ❌ `python foo.py | tail -N` — stdout block-buffered, progress 못 봄. full log 직접 redirect 필수
- ❌ `print(...)` without `flush=True` — long-running script 의 progress 안 보임
- ❌ `timeout 480` 으로 n_pauli-325 VQE 돌리기 — ~30-60s 부족해서 미수렴으로 보임 (실제론 알고리즘 OK). iter 15→16 의 교훈: timeout 부족 ≠ 알고리즘 실패. 무거운 conjugated cluster 는 `timeout 600` (cron-shell 최대) + maxiter=150 (300 불필요) + optimizer 1개만 (L_BFGS_B 추가 X) = chem-acc 안에 닫힘.

### 4.2. PySCFDriver "Failed to build" 디버깅

전자수 mismatch 는 cryptic error 로 나옴:
```
qiskit_nature.QiskitNatureError: 'Failed to build the PySCF Molecule object.'
```

해결: PySCFDriver 호출 전에 pyscf gto.M 으로 charge/spin scan:
```python
from pyscf import gto
for ch, sp in [(0, 0), (-1, 0), (1, 0), (-2, 0), (2, 0)]:
    try:
        m = gto.M(atom=GEOM, basis='sto3g', charge=ch, spin=sp, verbose=0)
        if m.spin == 0:
            print(f'charge={ch} nelec={m.nelectron}')
            break
    except:
        continue
```

---

## 5. paradigm — closure 의 두 층위

### 5.1. paradigm-level vs physical-level

| 층위                       | 본 v7.1 status | 의미                                         |
|----------------------------|----------------|----------------------------------------------|
| 🧪 paradigm-level closure  | ✅ CMT 100%, ALS Q+RB-axis 100% | 양자 pipeline + drug-likeness + IP heuristic + modality spec + falsifier 분기 |
| ⚛️ F-Q-6-D pocket VQE entry |  ✅ 14 target chem-acc, 8 sub-µHa | pocket-restricted active-space pipeline 입증 (CMT 5 + ALS 5 + KRAS-G12C + AR + HMG-CoA + ALK5; 6 cohort 전부 ≥1 chem-acc) |
| 🪨 transition-metal sub-µHa | ❌ 외부 ramp 확정 | HPC/GPU multi-hour 필요 |
| 🧫 wet-lab selectivity     | ❌ 0건         | $50-200K × 화합물 × 3-6 month |
| 🏥 임상 1-3상              | ❌ ~7-12년 전  | $100-300M, 성공률 9% |
| 💊 환자 도달 (NDA)         | ❌ ~12-15년 후 | 본 software repo 의 범위 밖 |

### 5.2. negative finding 의 closure 의미

§12.2.i (UCCSD reps=2 negative) + §15.2.n (def2-svp infeasibility) + §15.2.o (lanl2dz/6e6o infeasibility) + §15.2.q→r→s (480s→600s timeout 경계, sp3+carboxylate=n_pauli 325, aromatic≠항상 chem-acc-only) — 이들은 **실패** 가 아닌 **paradigm boundary 확정**:

- ✅ "software-closable 끝점" 명시 → 무한 폴링 회피
- ✅ "외부 ramp 경로" 명시 → 다음 세션 진입점 명확
- ✅ honest scope → 과대선전 회피

---

## 6. own preference (own 등록 사항)

본 작업으로 등록된 own preference:
- 📊 `memory/feedback_report_table_format.md` — multi-iter 진행 / paradigm 보고 시 ASCII box 또는 markdown 표 포함
- 📑 `docs/report_table_sample.md` — sample 1 (iteration matrix) + sample 2 (chem environment × delta paradigm)

리포트 작성 시 본 표 형식 자동 적용 (sample 1 양식 우선, paradigm 발견 시 sample 2 양식).

---

## 7. 다음 세션 진입점 (handoff)

### 7.1. 즉시 가능 (software-closable)
1. ✅ **iter 17 완료**: lung TGF-β `hxq-ln-tgf-001` (ALK5, imidazole+formamide) → delta 0.30 µHa sub-µHa, 6/6 cohort quantum-axis ≥1 chem-acc 완성. 다음 software-closable = pmp22 ASO seed precision / SwissADME / SureChEMBL 자동화 (아래).
2. pmp22 ASO seed sequence precision (UNAFold + RNAhybrid integration)
3. SwissADME 자동화 (rdkit-only ADMET → online web tool 추가 정밀도)
4. SureChEMBL bulk download + chemotype 자동 검색 (IP query map 자동화)

### 7.2. 외부 ramp (loop-out)
1. HDAC6 / MFN2 / SARM1 / c9orf72 sub-µHa = HPC/GPU + def2-svp + larger AS
2. F-Q-6-D 실 PDB pipeline = biopython + 5W5K + pocket truncation + QM/MM
3. wet-lab selectivity panel = $50-200K + 3-6 month
4. IP clearance 5소 cross-check = 변리사 retainer $25-50K

### 7.3. paradigm-level 종합
- v7 commit graph: 6a876b9 → e12f469 → b605414 → d5a0cb2 → 0b5bf22 → d6f258f (CMT closure) → afb5561 → ... → b24613a (iter 13) → 91a8550 (iter 14 KRAS) → 3eb20d4 (iter 15 AR/HMG cadence) → 592b2e3 (iter 16) → 97030ad (iter 17 ALK5) → aa04780 (iter 18 Mpro) → edc0e0d (iter 19 §15.8 closure) → 7aea20c (cross-host quantum F-Q-6/L3) → a84e6a8 (iter 20 HIV-1 PR) → f6ebdda (iter 21 hammerhead ribozyme) → iter 22 (M.tb InhA)
- tags: `v7.0-cmt-closure` · `v7.1-cmt-phase-gamma-push` · `v7.2-cmt-pocket-vqe-complete` · `v7.3-cmt-als-pocket-vqe-complete`

---

## 8. 한 줄 요약

> 5분 cron loop + sto-3g 4e/4o + 3-optimizer screen + sshfs-아닌-local-SSD venv = **18-target pocket VQE chem-acc PASS · 11 sub-µHa · 10 systems/mechanisms (6 disease cohort + 3 antimicrobial + ribozyme 촉매) · F-Q-6 leaf in-repo PASS · quantum×ribozyme axis bridge** · CMT 100% + ALS Q+RB-axis 100% + §15.8 software-closable closure 선언. n_pauli 317-325 conjugated cluster 도 frontier near-degeneracy 없으면 sub-µHa + 빠름 (~120-440s); 있으면 chem-acc only (HMG·Mpro). transition-metal 정밀 sub-µHa·larger-AS·실 PDB QM/MM·wet-lab·임상 = 외부 ramp.
