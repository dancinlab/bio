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
# NEUROSCIENCE.log.tape — append-only event history (v1.2 split)
# Sibling: NEUROSCIENCE.tape (architecture-current, editable)
# ══════════════════════════════════════════════════════════════

@V := "tape" :: spec [active]
  version = "1.2"

# §Log — entries chronological, oldest first.

@A rewrite_real_science := "NEUROSCIENCE.tape rewritten — lattice-tautology stub replaced with real-science SSOT" :: rewrite [ok d=2026-05-16]
  origin = "NEUROSCIENCE.tape was a lattice-tautology stub (~330 lines of Korean-language @D entries deriving neuroscience claims from n=6 arithmetic: σ²=144 brain-map areas, μ=1 resolution, σ=12 neuroimaging metrics, J₂=24 audit monitors, etc.) with zero real citations — a direct AGENTS.tape f1/f2/g1/g2/g8 violation. Source: hexa-bio mass-split commit 153b5a2."
  action = "Full real-science rewrite 2026-05-16. All stub entries deleted. Replaced with ~400 lines of citation-grounded foundational neuroscience: cellular neuroscience (neuron doctrine · action potential · synaptic transmission · plasticity), sensory systems (visual cortex · cochlea · olfaction), brain mapping (fMRI BOLD · diffusion MRI · PET), cognitive neuroscience (place cells · grid cells · PFC executive function), neurological disease mechanisms (stroke · Alzheimer's · Parkinson's · Huntington's), and enabling technologies (optogenetics · CLARITY · single-cell atlases · adult neurogenesis controversy)."
  citations-asserted = [
    "Hodgkin & Huxley 1952 J Physiol 117:500-544 (action potential)",
    "Hubel & Wiesel 1962 J Physiol 160:106-154 (visual cortex)",
    "Bliss & Lømo 1973 J Physiol 232:331-356 (LTP)",
    "Buck & Axel 1991 Cell 65:175-187 (odorant receptors)",
    "Ogawa et al 1990 PNAS 87:9868-9872 (fMRI BOLD)",
    "Hafting/Moser et al 2005 Nature 436:801-806 (grid cells)",
    "Boyden et al 2005 Nat Neurosci 8:1263-1268 (optogenetics)",
    "Chung et al 2013 Nature 497:332-337 (CLARITY)",
    "HD Collaborative Research Group 1993 Cell 72:971-983",
    "Hardy & Selkoe 2002 Science 297:353-356 (amyloid hypothesis)",
    "Sorrells et al 2018 Nature 555:377-381 (adult neurogenesis challenge)",
    "Button et al 2013 Nat Rev Neurosci 14:365-376 (power failure)",
    "O'Keefe & Dostrovsky 1971 Brain Res 34:171-175 (place cells)",
    "Eriksson et al 1998 Nat Med 4:1313-1317 (adult neurogenesis BrdU)",
    "Herculano-Houzel 2009 Front Hum Neurosci 3:31 (86 billion neurons)"
  ]
  citations-author-era = [
    "Cajal 1906 Nobel + Golgi — neuron doctrine (primary-author/era; volumes paraphrased)",
    "Eccles 1963 Nobel — synaptic inhibition (primary-author/era)",
    "Katz 1970 Nobel — quantal release (primary-author/era)",
    "Kandel 2000 Nobel — Aplysia molecular learning (primary-author/era)",
    "von Békésy 1961 Nobel — cochlear travelling wave (primary-author/era)",
    "O'Keefe + Moser 2014 Nobel — place/grid cells (Nobel asserted)"
  ]
  n6-stance = "Declined as a derivation tool. @F f_lattice_fit + @N n6_honest_stance state plainly: foundational neuroscience exposes NO natural n=6 invariant. Neocortex has 6 layers — this coincides with n=6 but is an independent anatomical evolutionary fact (not a derivation). Grid-cell hexagonal tiling is Euclidean 2D efficient packing, not a hexa-lattice product. Cranial nerve count (12) coincidentally matches σ(6)=12 — observation only. All other neuroscience counts (86 billion neurons, ~52 Brodmann areas, 7 serotonin receptor families, etc.) differ from n=6 lattice values. This honesty IS the corrective for the audited stub."
  sibling-scope = "NEURO.tape = BCI / neurotechnology SSOT (cross-linked, not duplicated). NEUROPHARMACOLOGY.tape = CNS pharmacology SSOT (cross-linked, not duplicated). NEUROSCIENCE.tape = foundational cellular/systems/cognitive neuroscience. Three distinct tapes with explicit cross-links and no content overlap."
  real-limits = "4 real-limits anchors: (1) connectomics scale HARD WALL (~86B neurons, ~100-150T synapses — engineering scale); (2) fMRI BOLD temporal/spatial resolution HARD (HRF physics); (3) neuroimaging reproducibility methodological limit (Button 2013); (4) adult human neurogenesis methodological uncertainty; (5) consciousness hard problem (philosophical/empirical HARD WALL)."
  lint = "python3 selftest/tape_lattice_honesty_lint.py NEUROSCIENCE.tape --json → expected __TAPE_LATTICE_HONESTY__ PASS (has_guard=true · has_stance=true · grounded=true; zero live derivation lines — all lattice-token mentions are inside @F/@N provenance bodies or explicit observation-not-derivation disclaimers)."
