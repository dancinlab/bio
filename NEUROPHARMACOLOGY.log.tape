#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════════════
# .tape v1.2 — grammar primer (cold-read by any LLM / agent / human)
# ══════════════════════════════════════════════════════════════════════
# Form: each entry is `@<type> <id> := "<subject>" :: <kind> [<grades>]`
#       optionally followed by body lines (2-space indent) — key=value,
#       edges (<- -> => …), or quoted prose.
#
# ENTRY TYPES (17):
#   Runtime (10): @S session  @U user  @A assistant  @T tool-call  @R result
#                 @H hook  @D decision  @K cost  @P provider  @? anomaly
#   Foundation:   @I identity-claim
#   Declarative:  @X external-citation  @F forbidden-pattern  @N note
#                 @C config  @L layout  @V spec-version
#
# EDGES (12, on body lines, 2-space indent):
#   Causal:     <- caused-by   -> triggers   == continues
#               ~> supersedes  !! aborts     |> verified-by
#   Effect:     => produces (followed by quoted natural-language)
#   Structural: <: specializes  :> generalizes  ?> soft-depends
#               !> conflicts-with  @> projects-to (e.g. @> AGENTS.md)
#
# GRADE TAGS (in [...] on entry header):
#   Delivery:   ok · err · denied · cancelled · partial · superseded
#   Governance: required · recommended · optional · draft · active · deprecated
#   Scoped:     allow:<x> · deny:<x>
#   Time/index: T<n> (turn)  N<n> (wall-sec)  d=<YYYY-MM-DD>
#
# PAYLOAD SYNTAX (body lines):
#   key = "value"           single-line string
#   key = [a, b, c]         array literal
#   key <<~EOF              heredoc (multi-line; ends with EOF on own line)
#     multi-line text
#   EOF
#   "see [@x1] §3"          inline citation by entry id
#   `cmd or path`           backtick code-span (inline only)
#
# Full spec: ~/core/tape/spec/tape.md (or github.com/dancinlab/tape)
# ══════════════════════════════════════════════════════════════════════


# ══════════════════════════════════════════════════════════════
# NEUROPHARMACOLOGY.log.tape — append-only event history (v1.2 split)
# Sibling: NEUROPHARMACOLOGY.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite := "NEUROPHARMACOLOGY.tape rewritten from lattice-tautology stub to real-science SSOT" :: rewrite [ok d=2026-05-16]
  origin = "NEUROPHARMACOLOGY.tape was a fabricated lattice-tautology stub (created in the hexa-bio mass-split, commit 153b5a2). It 'derived' CNS-pharmacology facts (SSRI 반응률 50~60% + 'n/φ=3 모노아민 동시 표적', BZD 의존성 + 'φ=2 수용체 유형', L-DOPA 운동합병증 + 'sopfr=5 도파민 D1~D5', AChE inhibitor 한계 + 'σ=12 신경전달물질 네트워크', circadian + 'J₂=24시간 일주기', 오피오이드 + 'σ-φ=10 mg + σ-τ=8h', ADME + 'τ=4', 신약 개발 + 'σ/φ=6배 단축') from n=6 lattice tokens (σ=12 / τ=4 / φ=2 / J₂=24 / sopfr=5) — a direct LATTICE_POLICY g1/g2 + f1 violation. Every row_x_* / row_materials_* / row_life_* stub entry deleted along with the entirety of the original 'n=6 매핑' / ASCII-graph / 진화-체크포인트 / 'σ=12 신경전달물질 τ=4 동태 φ=2 수용체' scaffolding."
  authored = "Hand-written with real CNS-pharmacology biology + landmark psychopharmacology citations. Replaces ZERO biology with: neurotransmitter system inventories (dopamine D1-D5 with mesolimbic/mesocortical/nigrostriatal/tuberoinfundibular pathways; serotonin 5-HT1A-5-HT7; glutamate ionotropic NMDA/AMPA/kainate + metabotropic mGluR1-8; GABA-A ionotropic + GABA-B metabotropic; nicotinic + muscarinic M1-M5; α/β adrenergic; H1-H4; μ/δ/κ opioid; CB1/CB2 cannabinoid) and the real drug-class landscape — TCAs (Kuhn 1957 era), MAOIs, SSRIs (Wong/Lilly 1974 era), SNRIs, atypicals, STAR*D (Rush 2006 Am J Psychiatry 163:1905-1917), typical antipsychotics (Delay & Deniker 1952 era; Carlsson dopamine 2000 Nobel context), atypicals (Kane et al 1988 Arch Gen Psychiatry 45:789-796 clozapine TRS landmark), LAIs, BZDs, buspirone, lithium (Cade 1949 Med J Aust 2:349-352 landmark), valproate/carbamazepine/lamotrigine, AChE inhibitors (donepezil/rivastigmine/galantamine — symptomatic-only, not disease-modifying), memantine, anti-amyloid mAbs (lecanemab/donanemab era 2022-2024 — modest effect-size honestly framed), opioids (μ-agonists, naloxone/naltrexone, buprenorphine), L-DOPA (Cotzias 1967/1969 era → wearing-off/dyskinesias), MAO-B inhibitors / dopamine agonists, AEDs, investigational psychedelics (Carhart-Harris/Griffiths era). BBB pharmacology (lipophilicity, P-gp efflux). 7 real-limit anchors: BBB delivery HARD wall on hydrophilic/large molecules; CNS therapeutic index narrower than peripheral; addiction risk on reward-system-acting drugs (opioid crisis context); CNS clinical-trial attrition (cross-link BIO-PHARMA Eroom); polypharmacy DDI in psychiatric populations; CYP2D6/3A4 pharmacogenomic variability (cross-link PHARMACOLOGY); non-adherence in CNS conditions; dosing/regimen out of scope (g8/f2 governance limit). 3 falsifiable predictions with falsifiers + sources (clozapine TRS superiority · STAR*D step-wise diminishing returns · anti-amyloid mAb modest-effect-size honesty including ARIA risk)."
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: CNS pharmacology exposes NO natural n=6 invariant. Dopamine has 5 subtypes (≠6); muscarinic ACh has 5 (≠6); serotonin has 7 receptor families (≠6); glutamate has 3 ionotropic + 8 metabotropic (neither 6); histamine has 4; opioid has 3 classical (or 4 with NOP); cannabinoid has 2 cloned; GABA splits into ionotropic vs metabotropic CLASSES with multiple subunits — none of these counts is 6, and where coincidence does occur (e.g. 12 dominant CNS neurotransmitter species in textbook tabulations coincidentally matches σ(6)=12) it is observation only and not a derivation source. Pharmacokinetic phases (LADME=5 or ADME=4) are organisational shorthand, not lattice values — 'τ=4 ADME 단계' is exactly the lattice-fit error of the deleted stub. Coincidence is observation-only, never derivation. This honesty IS the corrective for the audited lattice-tautology stub."
  governance = "Complies with hexa-bio AGENTS.tape g1 (real-limits-first — 7 real-limit anchors anchor every section), g2 (lattice-is-tool — declined as derivation), g3 (honesty-obligation-external — STAR*D, FDA labelling era, Cade/Kane/Carlsson landmark trials cited from their OWN invariants, not lattice-fit), g8 (in-silico-only-claim-scope — comprehensive @N scope_disclaimer; lim_dosing_out_of_scope real-limit), f1 (no lattice-fit), f2 (no in-silico→clinical/efficacy claim — drug classes and mechanisms paraphrased from published peer-reviewed psychopharmacology literature for modeling context only; NO dosing, NO regimens, NO individualized treatment recommendations; real prescribing requires a licensed prescriber). Provenance recorded in @I id001 rewritten-from key."
  honesty-caveats = "No fabricated numbers/citations — exact efficacy magnitudes kept qualitative (direction + landmark trial); precise percentages avoided where not directly tied to a named primary trial. Confident peer-reviewed citations with volume/page: Kane et al 1988 (Arch Gen Psychiatry 45:789-796 — clozapine TRS landmark), Rush et al 2006 STAR*D (Am J Psychiatry 163:1905-1917), Cade 1949 (Med J Aust 2:349-352 — lithium in mania, canonical landmark reference). Author/era-flagged (explicitly paraphrased, exact volume/page not asserted): Delay & Deniker 1952 chlorpromazine era; Kuhn 1957 imipramine era; Wong/Lilly 1974 fluoxetine discovery era; Carlsson Nobel 2000 context; Cotzias 1967/1969 L-DOPA NEJM era; lecanemab/donanemab clinical-trial era 2022-2024 (multiple registration-trial publications across the era — clinical-meaningfulness of effect size actively debated, NOT overclaimed); Carhart-Harris/Griffiths psychedelic-research era (multiple primary publications, investigational status); Stahl 'Essential Psychopharmacology' textbook era (didactic synthesis, not a single primary trial). Anti-amyloid mAb (lecanemab/donanemab) effect-size framing explicitly honest: 'modest slowing of cognitive decline on continuous endpoints in early symptomatic Alzheimer's, NOT halt/reverse/cure; measurable ARIA-E / ARIA-H risk especially in APOE ε4 homozygotes; clinical-meaningfulness actively debated' — mirrors the regulatory-era characterisation, does not endorse the cure framing."
  lint = "python3 selftest/tape_lattice_honesty_lint.py NEUROPHARMACOLOGY.tape --json → __TAPE_LATTICE_HONESTY__ PASS (has_guard=true, has_stance=true, grounded=true; deriv_warnings=3 — all are HONESTY NOTES that quote the forbidden phrasing to forbid/observe it, NOT live derivation claims: 'GABA pharmacology is not a 2-receptor system' / 'Two cloned receptors is a count, not a φ=2' / 'P-gp ... broad range of substrates' near-miss. Zero live lattice-derivation lines remain; all row_x_* / row_materials_* / row_life_* lattice-tautology garbage deleted)."
