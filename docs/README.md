# hexa-bio docs

## canon sister-domain specs (canonical)

hexa-bio is a **5-axis** toolkit (count locked): the 4 bio "verbs"
(WEAVE / NANOBOT / RIBOZYME / VIROCAPSID) form the n=6 τ-quartet
tetrahedron, and `quantum` is the 5th axis (qpu_bridge VQE compute layer —
see [`.roadmap.quantum`](../.roadmap.quantum) and
[`qpu_bridge_bio_application.md`](./qpu_bridge_bio_application.md)).

The 4 bio-verb specifications live in
the `canon` project under `domains/biology/`. The files in
[`n6/`](./n6/) are **symlinks** to those canonical sources — edits made on
either side propagate immediately, so this directory tracks live spec state.

| Verb        | Local link                                 | Canonical source                                                   |
|-------------|--------------------------------------------|--------------------------------------------------------------------|
| WEAVE       | [`n6/hexa-weave.md`](./n6/hexa-weave.md)           | `~/core/canon/domains/biology/hexa-weave/hexa-weave.md`         |
| NANOBOT     | [`n6/hexa-nanobot.md`](./n6/hexa-nanobot.md)       | `~/core/canon/domains/biology/hexa-nanobot/hexa-nanobot.md`     |
| RIBOZYME    | [`n6/hexa-ribozyme.md`](./n6/hexa-ribozyme.md)     | `~/core/canon/domains/biology/hexa-ribozyme/hexa-ribozyme.md`   |
| VIROCAPSID  | [`n6/hexa-virocapsid.md`](./n6/hexa-virocapsid.md) | `~/core/canon/domains/biology/hexa-virocapsid/hexa-virocapsid.md` |

`hexa-bio` is the empirical companion to `canon/domains/biology/`
— specs (theoretical, n=6 invariant projection, falsifier preregister)
stay in `canon`; numerical sandbox + CLI implementation lives
here. Both must agree at MVP gate 2026-07-28.
