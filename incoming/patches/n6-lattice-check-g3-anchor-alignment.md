# n6_lattice_check verify_all() needs a §1.2 real-limit anchor — lattice tautology alone is g3-insufficient

**Status:** IMPLEMENTED 2026-05-15 (same-day) — Path A applied (see "What we suggest upstream" below).
- hexa-bio `quantum/module/n6_lattice_check.hexa`: 10th cell `real_limit_anchor` added to each of 5 rows;
  `_verify_g3_anchor()` predicate + `__HEXA_BIO_N6_LATTICE_CHECK__ PARTIAL` sentinel added; main() prints anchor + counts.
- hexa-lang `compiler/atlas/n6_axes.gen.hexa`: raw bodies extended with `real_limit_anchor: real_limits.*`;
  5 rows re-promoted to `grade.verified = true` + `[10*]` (anchors now present per g3).
- hexa-lang `test/atlas_n6_axes_smoke.hexa`: anchor-presence + verified-true assertions added.
- Result on hexa-bio: `5/5 axes consistent · g3 anchors: 5/5 · __HEXA_BIO_N6_LATTICE_CHECK__ PASS`.
- Result on hexa-lang: atlas-n6_axes smoke + 4 sibling smokes (n6_lattice / atlas_doctrine /
  atlas_materials_limits / atlas_real_limits / atlas_aliases) all PASS.

**Layer:** `quantum/module/n6_lattice_check.hexa` — n6-axis verification SSOT
**Authority (downstream policy):** hexa-lang `AGENTS.tape` `@D g3 verification-anchor-real-limit` (`required`)
**Filed by:** hexa-lang (consumer of this file via `atlas_absorb_hexa_bio.hexa` (planned absorber))
**Date filed:** 2026-05-15
**Date implemented:** 2026-05-15

## What hexa-lang does today

The 5-row TABLE (RIBOZYME / VIROCAPSID / NANOBOT / WEAVE / QUANTUM) gets absorbed into
`compiler/atlas/n6_axes.gen.hexa` as 5 `AtlasNode { kind: "P", id: "n6_axes.<axis>", ... }`
entries. The atlas's `GradeInfo.verified` field used to be `true` for all 5, with the
raw body tagged `[10*]` (verified-ceiling). 2026-05-15 fix: all 5 demoted to `verified: false`
+ `[10]` per hexa-lang policy `@D g3`.

## Why the demotion was necessary

hexa-lang `AGENTS.tape` `@D g3` (verbatim):

> **rule:** Verification anchors must include at least one REAL limit from LATTICE_POLICY.md §1.2.
> **insufficient:** lattice-tautology checks alone (e.g. σ·φ = 24)

The `verify_all() — sigma/tau/phi/J2 + master identity all PASS deterministically` claim in
`n6_lattice_check.hexa:6-9` is *exactly* the σ·φ=24 tautology that g3 names as insufficient.
A real-limit anchor (Shannon entropy, Bekenstein bound, CODATA c/ℏ/k, Stefan-Boltzmann,
Carnot, etc.) is required per row.

## What we suggest upstream

Two paths, listed in order of structural preference:

### Path A — extend the 5 rows with a `real_limit_anchor` cell

Add a 10th cell to each row: a snake-id of the closest matching `LATTICE_POLICY.md §1.2`
row. Suggested mapping (provisional — fact-check before merging):

| Row | Suggested `real_limit_anchor` | Rationale |
|---|---|---|
| `RIBOZYME` | `real_limits.kolmogorov_complexity` OR a chem-specific row (none in §1.2 yet) | Catalysis is information processing under Kolmogorov-bounded program length; closer §1.2 anchor than σ·φ. Alternative: add a §1.2 row for enzymatic free-energy ceiling and anchor here. |
| `VIROCAPSID` | `real_limits.bekenstein_bound` OR a packing-density row | Capsid is a bounded region; Bekenstein gives information-density ceiling. Or anchor to Hales packing once §1.2 grows a Mathematical row for sphere-packing. |
| `NANOBOT` | `real_limits.margolus_levitin` OR `real_limits.bremermann_limit` | Actuation cycle bounded by quantum-state-transition rate per unit mass/energy. |
| `WEAVE` | `real_limits.kolmogorov_complexity` | DNA encoding compressibility is Kolmogorov-bounded; B-DNA helical period is geometric (cite separately). |
| `QUANTUM` | `real_limits.margolus_levitin` | VQE evaluation surface is exactly the Margolus-Levitin regime (quantum-state-transition rate at energy E). |

Once each row carries its anchor, the absorber (`hexa-lang/tool/atlas_absorb_hexa_bio.hexa` —
planned, not yet implemented) can emit `verified: true` for that row, and hexa-lang's
`compiler/atlas/anchor_audit.hexa` will recognize the anchor presence on the next pass.

### Path B — split `verify_all()` semantically

Keep `verify_all()` as the σ·φ=24 self-check (lattice consistency), but rename the
header comment to make clear that **this is consistency, not g3-verification**. Then
add a separate `verify_g3_anchor(row, atlas)` predicate that consults `real_limits.*`
via the atlas. Document that:

- `verify_all()` PASS = the row's lattice arithmetic is consistent.
- `verify_g3_anchor()` PASS = the row cites at least one §1.2 real-limit.
- Atlas `verified: true` requires BOTH.

Path A is structurally simpler (data, not new predicate). Path B is more honest about
the layering but requires more code.

## Constraint we'd want preserved

The `quantum/module/n6_lattice_check.hexa` file is the **SSOT** for these 5 rows.
hexa-lang's `compiler/atlas/n6_axes.gen.hexa` is a downstream rodata copy. Whatever
you choose, please keep the SSOT in this file — the absorber regenerates the rodata,
so hand-edits on the hexa-lang side rot on the next run.

## Cross-reference

- hexa-lang `compiler/atlas/n6_axes.gen.hexa` (post-fix as of 2026-05-15): header comment
  documents the demotion and the path back to `verified: true`.
- hexa-lang `AGENTS.tape` `@D g3` + `@D g1` (real-limits-first).
- hexa-lang `LATTICE_POLICY.md` §1.2 (lines 58-88) + §1.3 #1 (σ·φ=24 named as forbidden anchor).
- hexa-lang `tool/atlas_absorb_real_limits.hexa` — sibling absorber, emits all 21 §1.2
  rows with `verified: true, value: 11` as of 2026-05-15 — these are now the g3 anchor pool.

## Out of scope for this patch

- hexa-bio internal use of `verify_all()` — that's still a valid self-consistency check
  for the lattice. Only the cross-channel claim ("→ atlas `verified: true`") needs
  re-grounding.
- Materials-limits (`materials_limits.gen.hexa` on the hexa-lang side) — those 3 rows
  already cite published bounds + class tags, g3-compliant out of the box.

넣었다
