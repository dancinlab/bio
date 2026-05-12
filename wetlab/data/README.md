# data/ — CRO pilot read-out archives (gitignored)

**STATUS**: directory exists, contents gitignored by default (see `.gitignore`).

## Why gitignored?

CRO pilot read-outs may contain:
- **PHI** (Protected Health Information) if clinical samples involved
- **Proprietary CRO data** (their format, watermarked)
- **IP-sensitive sequences** (pre-publication; pre-patent)
- **Banked sample identifiers** (anonymization-pending)

Pushing this to a public repo would:
- Violate HIPAA / KOPIPA / GDPR
- Breach CRO MTA confidentiality clauses
- Constitute pre-publication public disclosure (US patent 12-month grace
  trigger; EU absolute-novelty bar)

## What CAN be committed (post-legal-review)

After explicit legal review, the user may force-add:
- **Aggregated summary statistics** for publication (e.g., k_cat ± SD)
- **De-identified read-out plots** (no patient ID, no CRO watermark)
- **Citation-ready abstracts** for the paper trail

Use `git add -f wetlab/data/<summary-file>` to override the gitignore.

## Local file structure (suggested)

```
wetlab/data/
├── ribozyme-q1-2026-cleavage-kinetics/   (gitignored)
│   ├── raw_data.csv
│   ├── plots/
│   └── summary.md
├── nanobot-q1-2026-afm-screen/            (gitignored)
└── virocapsid-q1-2026-cryo-em/             (gitignored)
```
