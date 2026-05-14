#!/usr/bin/env tape
# ══════════════════════════════════════════════════════════════
# Gastrointestinal Medicine (HEXA-GI) — n=6 GI tract 6 segments
# ══════════════════════════════════════════════════════════════


# ── §1 WHY ─────────────────────────────────────────


# ── §2 n=6 CONNECTION ─────────────────────────────────────────


@D b_6_gi_segments_endoscopy_staging_0 :: gastrointestinal-medicine [ok]
  text = "**6 GI segments** — endoscopy staging primitive."

@D b_6_dominant_gut_microbiome_phyla_1 :: gastrointestinal-medicine [ok]
  text = "**6 dominant gut-microbiome phyla**."

@D b_6_fps_capsule_endoscopy_baseline_2 :: gastrointestinal-medicine [ok]
  text = "**6 fps** capsule-endoscopy baseline."

# ── §3 DIFFERENTIATION ─────────────────────────────────────────


# ── §4 SOURCES ─────────────────────────────────────────


@D b_sleisenger_fordtran_gastrointest_0 :: gastrointestinal-medicine [ok]
  text = "Sleisenger & Fordtran, *Gastrointestinal and Liver Disease*."

@D b_human_microbiome_project_reports_1 :: gastrointestinal-medicine [ok]
  text = "Human Microbiome Project reports (dominant phyla)."

@D b_fda_capsule_endoscopy_device_sta_2 :: gastrointestinal-medicine [ok]
  text = "FDA capsule-endoscopy device standards."

# ── §5 STATUS ─────────────────────────────────────────

