# 🧬 NOVELTY check — GJB1/Cx32 cryptic-pocket fold-rescue (CMTX1)

**Date:** 2026-06-22 · **Scope:** strict prior-art search (arXiv + bioRxiv + PubMed/PMC + web) for the claim in `exports/CMT/gjb1/RESULT.md`. **Governance:** decides whether the GJB1 axis can move from "coordinates (PENDING)" toward a discovery claim under `d_novel_only`. No compute run; SSOT files (ARCHITECTURE.json/CLAUDE.md/ING) untouched.

> **Honesty (d6):** Real citations only (title/authors/year + DOI/PMID/URL). Items I could not find are marked **NOT-FOUND** explicitly. I did not find the exact RESULT.md claim published, but I DID find a close family precedent that downgrades the framing from NOVEL to PARTIAL — see overall verdict.

## The claim under test
"In Cx32 (GJB1), the CMTX1 missense **L143P** is the most destabilizing fold mutation, and it **opens a ~434 Å³ hydrophobic cryptic pocket at the TM1/TM4 interface essentially absent in WT** — making it a **mutation-selective pharmacological-chaperone (fold-rescue) target**; flat lipophilic aromatics / 4-PBA-class molecules dock there."

---

## Q1 — Exact collision: small-molecule pharmacological chaperone / fold corrector for Cx32 (GJB1) in CMTX1?

**Verdict: NOVEL (no direct collision for Cx32 specifically).**

No published work describes a small molecule that **directly binds Cx32 to refold / re-stabilize / re-traffic a misfolded mutant**. The known CMTX1 therapeutic competitors are mechanistically different:

- **Gene replacement / gene addition** — the dominant program (AAV-GJB1; also the explicit framing in RESULT.md's axis rationale). E.g. *Vavlitou et al. 2017* (the paper RESULT.md uses for its mutation set) is about Golgi-retained mutants **interfering with gene addition therapy** — confirming gene therapy is the incumbent. PMID 28334782 · doi:10.1093/hmg/ddx064.
- **HSP90 C-terminal inhibitor / heat-shock-response inducer (cemdomespib / KU-596 novologue)** — improves CMTX1 neuromuscular function, but acts via **Hsp70 induction, NOT by binding Cx32**; efficacy is abrogated in Hsp70-KO mice and is independent of mutation type. This is the opposite of a mutation-selective direct chaperone. *Pharmacologic Targeting of the C-Terminus of HSP90 Improves Neuromuscular Function in Animal Models of CMTX1* — PMC9926526. (Verified by fetch: "does not directly bind or refold Cx32.")
- **Anti-Cx32 antibody (abEC1.1-hIgG1)** — blocks hemichannel dysfunction (e.g. Cx32D178Y); a biologic targeting the extracellular domain to **block** aberrant hemichannel activity, not a small-molecule fold corrector. *Cell Commun Signal* 2024, doi:10.1186/s12964-024-01969-0 · PMID 39639332.

**Competing refs:** none that collide directly. The closest "small molecule + Cx32" is the HSP90 indirect route (PMC9926526), which does NOT bind Cx32.

---

## Q2 — Cryptic pocket: L143P (or any CMTX1 mutation) mutation-induced cryptic pocket in Cx32? Any connexin TM1/TM4 druggable cavity?

**Verdict: NOVEL for the specific claim (mutation-induced TM1/TM4 cryptic pocket in Cx32) — NOT-FOUND in the literature.** PARTIAL at the family level (a different, WT pocket in Cx32 is described).

- **NOT-FOUND:** no paper reports an **L143P- (or any CMTX1-mutation-) induced cryptic pocket** in Cx32, nor a **TM1/TM4 inter-helical druggable cavity** in any connexin. Targeted bioRxiv/arXiv search returned only generic cryptic-pocket methodology papers (β-lactamase, AlphaFold cryptic-pocket discovery, class-B GPCR) — none on connexins.
- **PARTIAL (different site, WT not mutant):** a **WT N-terminal hydrophobic sterol/lipid pocket** in Cx32 is described, and the CMT1X **W3S** mutant disrupts *that* sterol site. This is a real connexin druggable-cavity precedent but it is (a) the **N-terminus**, not the TM1/TM4 interface, and (b) a **WT pocket disrupted by mutation**, the inverse of our "mutation *creates* a pocket." *Lipid dependence of connexin-32 gap junction channel conformations*, Nat Commun 2025 (also bioRxiv 2025.03.25.645310), PMC12789061 — and PDB structures 9QN9/9QNF (Cx32 in POPC nanodiscs).

**Competing refs:** Nat Commun 2025 (WT N-terminal sterol pocket; W3S disrupts it) — adjacent, not the same pocket or logic.

---

## Q3 — Mutation-selective chaperone strategy on connexins / membrane channels ("mutation makes a pocket → drug the mutant selectively")?

**Verdict: PARTIAL → this is the decisive prior art. The general concept IS published for a sibling connexin (Cx26).**

- **★ VRT-534 chemical chaperone for Cx26 (the key collision at the *concept* level).** Restores activity of trafficking/folding-defective Cx26 mutants (L90P, F161S; also L90P/R184P in the follow-up), with **microscale-thermophoresis showing HIGHER affinity to mutant than WT** (Cx26K188N EC50 ~5 µM vs WT ~19 µM) — i.e. the explicit "mutation increases binding as a precondition for rescue" logic that underlies our claim. *A Chemical Chaperone Restores Connexin 26 Mutant Activity*, Wang D et al., **ACS Pharmacol Transl Sci** 2023;6(7):997–1005, doi:10.1021/acsptsci.3c00056 · PMID 37470015.
- **VRT-534 docking follow-up (Cx26).** *Harre J, Wang D, Warnecke A, Zeilinger C 2025*, **Front Med** 12:1607598, doi:10.3389/fmed.2025.1607598. Docking finds WT binding "predominantly weak" but **mutants show multiple high-affinity sites** — "mutations may create or expose binding pockets rather than VRT534 exploiting a constitutive pocket." This is essentially our central mechanism, **already published for Cx26.** Caveats that preserve some novelty for us: their site is **allosteric near the pore** ("not adjacent to the mutated residues"), they do **NOT** name a TM1/TM4 interface cavity, and they do **NOT** use defined-volume "cryptic pocket" druggability framing.
- **Cx26 TM4-mutant membrane-translocation rescue in vivo** — *Promotion of Cx26 mutants located in TM4 region for membrane translocation rescued hearing loss*, PMC12068290 — small-molecule promotion of TM4-region mutant trafficking (in-vivo hearing recovery). Reinforces that connexin-mutant small-molecule trafficking rescue is an active, published field (in Cx26).
- **Broader membrane-protein precedent (well-established, makes the *category* non-novel):** pharmacological chaperones that selectively stabilize misfolding mutants — CFTR correctors (lumacaftor/VX-809), rod-opsin chaperone **YC-001** for P23H opsin (PMC5958115). Mature field; our work is a new *target*, not a new *category*.

**Competing refs:** ACS Pharmacol Transl Sci 2023 (10.1021/acsptsci.3c00056) + Front Med 2025 (10.3389/fmed.2025.1607598) — **the two most important refs in this whole check.**

---

## Q4 — The molecules: 4-PBA / 2-naphthoate / aromatic chemical chaperones tested on Cx32 / connexin trafficking?

**Verdict: PARTIAL (4-PBA on connexins — yes, but negative; on Cx32 specifically — NOT-FOUND).**

- **NOT-FOUND:** no report of **2-naphthoate** (our top docking hit) on any connexin, and **NOT-FOUND** any 4-PBA test on **Cx32 specifically**.
- **4-PBA on connexins (negative precedent):** for skin-disease connexin (GJB-family, e.g. EKVP-linked) mutants, chemical chaperones **4-PBA, TUDCA, glycerol failed** to rescue surface trafficking. *GJB4 variants … trafficking deficiency restored by co-expression of select connexins*, Front Cell Dev Biol 2023, doi:10.3389/fcell.2023.1073805. This is relevant prior art: it shows generic 4-PBA on connexin trafficking has been tried and **did not work** for those mutants — supporting our framing that a **specific** pocket-filling molecule (not bulk osmolyte/4-PBA) is what's needed, while also meaning "4-PBA rescues connexins" is NOT a free assumption.
- 4-PBA as a chemical chaperone broadly (ABCB4, myocilin, FVII-Q160R) is extensively published — generic, not connexin-specific.

**Competing refs:** Front Cell Dev Biol 2023 (4-PBA fails on a connexin) — bounds the claim.

---

## Q5 — L143P characterization (real & LOF; separates the known biology from our novel part)

**Verdict: PUBLISHED (known biology — exactly as it should be; this is the *anchor*, not the novel claim).**

L143P is a well-characterized CMT1X loss-of-function trafficking mutant:

- Located in the **third transmembrane domain (TM3)**; when expressed in HeLa cells it is **retained intracellularly in the Golgi**, does **not** form gap junctions, and (unlike some Golgi mutants) shows **no interaction with WT** Cx32. *Vavlitou et al. 2017, Hum Mol Genet* 26(9):1622, doi:10.1093/hmg/ddx064 · PMID 28334782.
- Earlier classic trafficking work: *Deschênes/Fischbeck — Altered Trafficking of Mutant Connexin32*, J Neurosci 1997;17(23):9077, PMID 9364054 (establishes intracellular retention of multiple Cx32 mutants); *Diverse trafficking abnormalities of connexin32 mutants causing CMTX*, PMID 12460545.

**Note (d6) — a factual discrepancy to flag for the main session:** the literature places **L143P in TM3**, while RESULT.md's pocket is described at the **TM1/TM4 interface**. These are not contradictory (a TM3 helix-breaking Pro can perturb packing that manifests as a TM1/TM4 void), but the wording "L143P opens a TM1/TM4 pocket" should be stated carefully: L143 is a **TM3** residue; the *consequent cavity* is reported at TM1/TM4. Don't imply L143 sits in TM1 or TM4.

---

## Per-question summary

| Q | Topic | Verdict | Key competing ref(s) |
|---|---|---|---|
| 1 | Small-molecule chaperone for Cx32/CMTX1 | **NOVEL** | none direct (gene therapy; HSP90/cemdomespib PMC9926526 = indirect; antibody = biologic) |
| 2 | L143P/CMTX1 cryptic pocket; connexin TM1/TM4 druggable cavity | **NOVEL** (TM1/TM4 mutant pocket NOT-FOUND); PARTIAL family (WT N-term sterol pocket) | Nat Commun 2025 (WT sterol pocket, W3S) |
| 3 | Mutation-selective chaperone on connexins (concept) | **PARTIAL** (published for Cx26) | **ACS Pharm Transl Sci 2023 10.1021/acsptsci.3c00056; Front Med 2025 10.3389/fmed.2025.1607598** |
| 4 | 4-PBA / 2-naphthoate / aromatics on Cx32 | **PARTIAL** (4-PBA on connexin = negative; Cx32-specific NOT-FOUND) | Front Cell Dev Biol 2023 10.3389/fcell.2023.1073805 |
| 5 | L143P trafficking/LOF | **PUBLISHED** (intended anchor) | Vavlitou 2017 PMID 28334782; J Neurosci 1997 PMID 9364054 |

---

## ⚖️ Overall verdict

**The *cryptic-pocket-fold-rescue-for-Cx32* idea is PARTIAL — not fully NOVEL, not PUBLISHED.**

- It is **NOT PUBLISHED**: nobody has reported a small-molecule pharmacological chaperone that binds **Cx32**, and nobody has reported the **L143P-induced TM1/TM4 cryptic pocket** (both NOT-FOUND). The specific target + specific pocket are genuinely new.
- It is **NOT fully NOVEL**: the *core mechanism* — "a folding-defective connexin mutant gains a higher-affinity small-molecule site, and a chemical chaperone selectively rescues the mutant" — is **already published for the sibling connexin Cx26** (VRT-534: ACS Pharm Transl Sci 2023 + Front Med 2025 docking, which even reports "mutations may create or expose binding pockets"). Generic mutation-selective pharmacological chaperones (CFTR, opsin YC-001) make the *category* mature.

### Precise defensible novel claim (what we CAN say)
> **First identification of a CMTX1 mutation-induced (L143P), defined-volume hydrophobic cryptic pocket at the Cx32 TM1/TM4 interface as a mutation-selective pharmacological-chaperone target — extending the connexin chemical-chaperone strategy (previously shown only for Cx26 / hearing loss) to Cx32 / CMTX1, at a new structural locus (TM1/TM4 inter-helical cavity, distinct from the published Cx26 near-pore allosteric site and the WT Cx32 N-terminal sterol pocket).**

The genuinely new units are: (1) **Cx32/CMTX1 as the indication** for direct small-molecule chaperoning (vs gene therapy/HSP90/antibody incumbents); (2) the **specific L143P TM1/TM4 cryptic cavity** with computed volume/hydrophobicity; (3) a **defined pharmacophore** (flat lipophilic aromatic acid) for that cavity.

### What's already known — do NOT overclaim (d6)
- ❌ Don't claim "first mutation-selective chemical chaperone for a connexin" — **Cx26/VRT-534 owns that** (cite it).
- ❌ Don't claim "first to show a connexin mutant creates/exposes a druggable pocket" — the Cx26 docking paper already states this.
- ❌ Don't claim "4-PBA rescues Cx32" — 4-PBA has **failed** on other connexins; treat 4-PBA only as a method-anchor (consistent with RESULT.md §5).
- ❌ Don't imply L143 sits in TM1/TM4 — it is a **TM3** residue; the *resulting* cavity is at TM1/TM4 (fix wording).
- ⚠️ The whole result is still **in-silico scaffold-level** (EvoEF2 + heuristic pocket finder + rigid Vina). PARTIAL-novelty status is about the *idea*; a *discovery* claim under d_novel_only still requires the pre-registered falsifier + membrane ABFE in RESULT.md §5, plus mutant-vs-WT binding selectivity, and ideally a cell-trafficking rescue. The novelty gate is satisfied enough to **proceed** (it is not a red-ocean reproduction), but it must be reported as **PARTIAL-novel, mechanism-published-in-Cx26**, not a clean discovery.

### Most important refs (the 2–3 that decide this)
1. **Wang D et al., "A Chemical Chaperone Restores Connexin 26 Mutant Activity," ACS Pharmacol Transl Sci 2023;6(7):997–1005** — doi:10.1021/acsptsci.3c00056, PMID 37470015. *The prior art for the mechanism (Cx26).*
2. **Harre J, Wang D, Warnecke A, Zeilinger C, "Exploring the binding sites of VRT534 at Cx26…," Front Med 2025;12:1607598** — doi:10.3389/fmed.2025.1607598. *Already states mutants "create or expose binding pockets" — directly adjacent to our cryptic-pocket logic.*
3. **Vavlitou et al., "Golgi-retained Cx32 mutants interfere with gene addition therapy for CMT1X," Hum Mol Genet 2017;26(9):1622** — doi:10.1093/hmg/ddx064, PMID 28334782. *L143P known biology (anchor) + confirms gene therapy is the incumbent our small-molecule axis differentiates from.*
