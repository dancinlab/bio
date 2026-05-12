# RFP — Nanobot axis wet-lab pilot

**STATUS**: draft-ready, deferred for user send  
**Template version**: 0.1.0 (2026-05-12)

---

## Subject

`Pilot wet-lab engagement RFP — DNA-origami nanobot 12-vertex actuation`

## Body

Dear [CRO contact],

We are developing a 12-vertex DNA-origami nanobot under the **hexa-weave
invariant-lattice framework** (n=6 master identity; cuboctahedron 12-vertex
+ truncated-icosahedron alternative skeleton). In-silico phase complete:
4-state actuation simulation (work 50 kT, J₂=24 pose-canon), C0d dual-
skeleton verification, L6→L7-L9 acceptance contract test all PASS. We
seek an in-vitro pilot for AFM/cryo-EM structural confirmation of the
folded state.

### Pilot scope (Phase 1, ~4 months)

| Item | Detail |
|---|---|
| Construct | M13-scaffolded DNA origami; 12-vertex cuboctahedron geometry (cadnano design delivered) |
| Staples | ~200 oligo staples (sequences delivered as ordering sheet) |
| Folding | Thermal annealing 65 °C → 25 °C / 18h in 12 mM MgCl₂ TE buffer |
| Read-out | (1) AFM imaging of folded structures (n ≥ 100 individual particles); (2) cryo-EM single-particle reconstruction (resolution target ≥ 15 Å); (3) gel electrophoresis fold yield % |
| Required precision | Yield ≥ 70%; mean particle diameter within 10% of design |
| Deliverables | Raw AFM images + cryo-EM micrographs + 3D reconstruction (mrc) + summary report |
| Timeline | M1: staple synthesis; M2: folding; M3: AFM screen; M4: cryo-EM session + reconstruction |
| Budget cap | **$XX K** (placeholder — fill before send) |

### Read-out priorities

1. **12-vertex geometry confirmed** (σ(6)=12 invariant)
2. **J₂=24 pose-distinguishability**: at least 24 distinct rotational poses identifiable in AFM (manual or auto-classification)
3. **Work-cycle feasibility**: actuation between "compact" and "extended" states under ATP-fuel proxy (e.g., DNA strand-displacement trigger)

### What we ask in your reply

- [ ] DNA-origami folding experience (last 5 years; published constructs preferred)
- [ ] AFM resolution capability (lateral ≤ 3 nm; vertical ≤ 0.5 nm)
- [ ] Cryo-EM access (in-house or partner facility); session lead time
- [ ] Estimated timeline + budget for the Phase 1 pilot above
- [ ] NDA + MTA terms (cadnano design + staple sequences are confidential pre-publication)
- [ ] References to similar nanobot / structural DNA nano projects

### Cross-references

- In-silico simulation source: https://github.com/dancinlab/hexa-bio (axis = nanobot)
- L6 emission handoff schema: `nanobot/spec/handoff_l6_emission_v0.schema.json`
- F-NB-1-c ratio 0.0 PASS verification: `selftest/nanobot_actuator_v2_reference_emit.py`

[user signature]

---

## Vendor candidates (research-stage; not validated)

| Region | CRO | Strength |
|---|---|---|
| Germany | **Tilibit Nanosystems** | DNA-origami specialist (Dietz lab origin) |
| US | **Tecton Inc** | DNA-origami spin-off (Rothemund-Wong-Yan school) |
| Korea | **KAIST cryo-EM 센터** | cryo-EM access; less origami-specific |
| Korea | **서울대 nanoscience institute** | structural DNA collaboration possible |
| US | **NIH cryo-EM facility** | free for collaborators (peer-review gate) |

## Budget reference

DNA-origami pilot (fold + AFM screen + 1 cryo-EM grid): **$50K-200K**
depending on staple count, cryo-EM hours, and downstream characterization.
