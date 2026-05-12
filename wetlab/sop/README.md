# sop/ — Standard Operating Procedures (CRO protocols)

**STATUS**: Phase 1 placeholder. SOPs populated as CROs respond with
their protocols (or as user / claude drafts axis-specific SOPs from
in-silico simulation parameters).

## Expected files (cycle 31+ as CRO contracts execute)

- `hammerhead-cleavage-protocol.md` — ribozyme kinetics SOP (Eyring TST
  k_cat ≈ 0.6/min reference; CRO-provided detailed protocol)
- `dna-origami-fold-protocol.md` — nanobot folding SOP (M13 + ~200
  staples; thermal annealing 65→25°C / 18h)
- `cage-assembly-protocol.md` — virocapsid in-vitro assembly SOP (T=1/3/4
  pilot; Zlotnick parametrization reference)
- `cas13-trans-cleavage-protocol.md` — Cas13 enzyme + RPA + lateral-flow
  SOP (LbuCas13a default)

## Reference SOPs (open-source starting points)

| Axis | Open-source SOP source | License |
|---|---|---|
| Ribozyme | https://www.bio-protocol.org/ (search "hammerhead ribozyme") | CC-BY |
| DNA-origami | Rothemund 2006 Nature + cadnano.org tutorials | open |
| Virocapsid | VIPERdb v3.0 protocols (https://viperdb.org/) | CC-BY |
| Cas13 | SHERLOCK protocols paper (Kellner et al 2019 Nat Protoc) | publisher gated |

## raw_91 honest C3

These are placeholders for CRO-provided detailed protocols. The user /
claude can DRAFT axis-specific SOPs from in-silico simulation parameters
on request, but actual wet-lab execution SOPs come from the CRO post-
contract.
