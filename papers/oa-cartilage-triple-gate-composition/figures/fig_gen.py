#!/usr/bin/env python3
"""Generate result figures fig01..fig09 for the OA-cartilage triple-gate paper.
All numbers trace to state/senolyx-oa-cartilage/ verified gates."""
import os
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import FancyArrowPatch, FancyBboxPatch

HERE = os.path.dirname(os.path.abspath(__file__))
STATE = "/Users/mini/dancinlab/demiurge/state/senolyx-oa-cartilage"
plt.rcParams.update({"font.size": 11, "axes.grid": True, "grid.alpha": 0.3,
                     "figure.dpi": 150, "savefig.bbox": "tight"})
def save(fig, name): fig.savefig(os.path.join(HERE, name)); plt.close(fig)


def ceiling(delta, A): return 0.68 + 0.075*delta + 0.21*delta*A

# fig01 — master frontier admissible region
def fig01():
    d = np.linspace(0, 1, 400); a = np.linspace(0, 1, 400)
    D, A = np.meshgrid(d, a)
    ok = (D*(0.075+0.21*A) >= 0.22).astype(float)
    fig, ax = plt.subplots(figsize=(6, 5))
    ax.contourf(D, A, ok, levels=[-.5, .5, 1.5], colors=["#f2f2f2", "#bfe3c0"])
    ax.contour(D, A, D*(0.075+0.21*A), levels=[0.22], colors="#2a7a2f", linewidths=2)
    ax.plot(0.472, 0.0, "rx", ms=11, mew=2.5, label="passive (BLOCK)")
    ax.plot(1.23, 0.706, "o", color="#1f6f1f", ms=11, label="assembled depot (PASS)")
    ax.plot(0.772, 1.0, "s", color="k", ms=7, label=r"$A{=}1$ corner $\delta{=}0.772$")
    ax.set_xlabel(r"delivery fraction  $\delta$"); ax.set_ylabel(r"anabolic competence  $A$")
    ax.set_title(r"Master frontier  $\delta(0.075{+}0.21A)\geq0.22$  (admissible = 3.8%)")
    ax.legend(loc="lower right", fontsize=9); ax.set_xlim(0, 1.3); ax.set_ylim(0, 1)
    save(fig, "fig01_master_frontier.png")

# fig02 — buy-down chain
def fig02():
    labels = ["import all\n(no credit)", "+ our $A_{endo}$\n(0.206)", "+ our cationic\n$\\delta{=}1.23$"]
    vals = [0.690, 0.484, 0.289]
    fig, ax = plt.subplots(figsize=(6, 4.2))
    bars = ax.bar(labels, vals, color=["#c94b4b", "#e0913a", "#2a7a2f"])
    ax.axhline(0.50, ls="--", color="k", label="kartogenin $A_{ext}\\approx0.50$")
    for b, v in zip(bars, vals): ax.text(b.get_x()+b.get_width()/2, v+0.01, f"{v:.3f}", ha="center")
    ax.set_ylabel("external anabolic burden  $A_{ext}$ required")
    ax.set_title("Our assets buy down the borrowed part's job"); ax.legend(); ax.set_ylim(0, 0.8)
    save(fig, "fig02_buydown.png")

# fig03 — delivery delta bars
def fig03():
    labels = ["passive\nneutral", "anionic\n(Donnan)", "cationic\nΦ=3", "KGN free\nanionic", "KGN on\ncarrier"]
    vals = [0.472, 0.081, 1.23, 0.081, 1.44]
    cols = ["#c94b4b", "#c94b4b", "#2a7a2f", "#c94b4b", "#2a7a2f"]
    fig, ax = plt.subplots(figsize=(6.4, 4.2))
    ax.bar(labels, vals, color=cols)
    ax.axhline(0.772, ls="--", color="k", label=r"gate $\delta\geq0.772$")
    for i, v in enumerate(vals): ax.text(i, v+0.02, f"{v:.2f}", ha="center", fontsize=9)
    ax.set_ylabel(r"delivery fraction  $\delta$")
    ax.set_title("Avascular delivery: only cationic GAG-avidity clears the gate"); ax.legend()
    save(fig, "fig03_delivery_delta.png")

# fig04 — A_endo migration
def fig04():
    mu = np.linspace(0, 1, 100)
    fig, ax = plt.subplots(figsize=(6, 4.2))
    for q, c in [(0.30, "#c94b4b"), (0.60, "#e0913a"), (0.90, "#2a7a2f")]:
        ax.plot(mu, mu*q, color=c, label=f"q={q:.2f} ({'fibro' if q<0.4 else 'hyaline' if q>0.8 else 'mixed'})")
    ax.axhline(0.690, ls="--", color="k", label="gate $A\\geq0.690$")
    ax.axhspan(0, 0.206, color="#bfe3c0", alpha=0.5)
    ax.text(0.05, 0.10, "self-owned floor\n$A_{endo}\\leq0.206$ (fibro)", fontsize=9)
    ax.set_xlabel(r"transport fraction  $\mu_{transport}$"); ax.set_ylabel(r"$A_{endo}=\mu_{transport}\cdot q$")
    ax.set_title("Endogenous progenitor migration caps at 0.206 without a differentiation driver")
    ax.legend(fontsize=9); ax.set_ylim(0, 1)
    save(fig, "fig04_aendo_migration.png")

# fig05 — docking gate
def fig05():
    ids, affs, qs = [], [], []
    p = os.path.join(STATE, "docking", "dock_results.tsv")
    for l in open(p).read().splitlines()[1:]:
        f = l.split("\t")
        if len(f) < 4: continue
        try: a = float(f[2])
        except Exception: continue
        ids.append(f[0]); affs.append(a); qs.append(f[3])
    order = np.argsort(affs)
    ids = [ids[i] for i in order]; affs = [affs[i] for i in order]; qs = [qs[i] for i in order]
    def col(i, q):
        if i.startswith("NC"): return "#c94b4b"
        if "real" in i or i.startswith("W0"): return "#888888"
        return "#2a7a2f"
    fig, ax = plt.subplots(figsize=(6.6, 5.2))
    ax.barh(ids, affs, color=[col(i, q) for i, q in zip(ids, qs)])
    ax.axvline(-8.0, ls="--", color="k", label="gate  aff $\\leq -8$")
    ax.set_xlabel("smina affinity (kcal/mol)")
    ax.set_title("Step-4 docking vs APT2/5SYN: novel series PASS, controls FAIL")
    ax.legend(loc="lower left", fontsize=9)
    save(fig, "fig05_docking_gate.png")

# fig06 — assembly gate closure
def fig06():
    d = np.linspace(0.7, 1.4, 100)
    fig, ax = plt.subplots(figsize=(6, 4.2))
    for Aext, c in [(0.45, "#c94b4b"), (0.50, "#e0913a"), (0.60, "#2a7a2f")]:
        ax.plot(d, ceiling(d, 0.206+Aext), color=c, label=f"$A_{{ext}}$(KGN)={Aext:.2f}")
    ax.axhline(0.90, ls="--", color="k", label="cure gate 0.90")
    ax.axvline(1.23, ls=":", color="#1f6f1f", label="measured carrier $\\delta{=}1.23$")
    ax.axvline(1.0, ls=":", color="#999999")
    ax.set_xlabel(r"delivery fraction  $\delta$"); ax.set_ylabel("ceiling (mass-weighted regen)")
    ax.set_title("Assembled co-therapy closes the gate at the measured operating point")
    ax.legend(fontsize=8, loc="lower right")
    save(fig, "fig06_assembly_gate.png")

# fig07 — four cures lost-class
def fig07():
    cures = ["OA\ncartilage", "retinal", "alopecia", "periodontal"]
    eta = [0.40, 0.45, 0.49, 0.55]
    fig, ax = plt.subplots(figsize=(5.6, 4))
    bars = ax.bar(cures, eta, color=["#c94b4b", "#7a9ac9", "#7a9ac9", "#7a9ac9"])
    for b, v in zip(bars, eta): ax.text(b.get_x()+b.get_width()/2, v+0.005, f"{v:.2f}", ha="center")
    ax.set_ylabel(r"lost-class $\eta_{max}$ (no senolytic)")
    ax.set_title("OA is the hardest of the four senolytic-closable cures")
    save(fig, "fig07_four_cures.png")

# fig08 — novelty map A vs delta
def fig08():
    pts = [("sprifermin/FGF-18", 0.9, 0.02, "#7a9ac9"), ("GDF-5/BMP-7", 0.75, 0.02, "#7a9ac9"),
           ("lorecivivint", 0.4, 0.6, "#7a9ac9"), ("KGN (free)", 0.5, 0.08, "#e0913a"),
           ("KGN on cationic\ncarrier = OUR A_ext", 0.5, 1.23, "#2a7a2f")]
    fig, ax = plt.subplots(figsize=(6.2, 5))
    for n, A, dd, c in pts:
        ax.scatter(dd, A, s=130, color=c, edgecolor="k", zorder=3)
        ax.annotate(n, (dd, A), textcoords="offset points", xytext=(8, 6), fontsize=8.5)
    ax.axvline(0.772, ls="--", color="k"); ax.text(0.79, 0.05, r"$\delta$ gate", fontsize=9)
    ax.axhspan(0, 1, xmin=0.772/1.4, color="#bfe3c0", alpha=0.25)
    ax.set_xlabel(r"matrix penetration  $\delta$"); ax.set_ylabel("anabolic strength  $A$")
    ax.set_title("Why proteins fail: high $A$ but $\\delta\\approx0$ (surface-only)")
    ax.set_xlim(-0.05, 1.4); ax.set_ylim(0, 1.05)
    save(fig, "fig08_novelty_map.png")

# fig09 — composition schematic
def fig09():
    fig, ax = plt.subplots(figsize=(7, 4.6)); ax.axis("off")
    ax.add_patch(FancyBboxPatch((0.02, 0.05), 0.96, 0.9, boxstyle="round,pad=0.02",
                 fc="#eef6ee", ec="#2a7a2f", lw=2))
    ax.text(0.5, 0.9, "ONE intra-articular depot — cationic GAG-avid carrier ($\\delta$, ours)",
            ha="center", fontsize=11, weight="bold")
    boxes = [(0.14, "SENOLYTIC\n($\\phi$, ours)\nBCL-xL/MCL1", "#c9d8ef"),
             (0.5, "KARTOGENIN\n($A_{ext}$, borrowed)\nhyaline driver", "#f2ddc0"),
             (0.86, "$A_{endo}{=}0.206$\n(ours)\nprogenitor migration", "#dfeedd")]
    for x, t, c in boxes:
        ax.add_patch(FancyBboxPatch((x-0.14, 0.32), 0.28, 0.34, boxstyle="round,pad=0.02", fc=c, ec="k"))
        ax.text(x, 0.49, t, ha="center", va="center", fontsize=9)
    ax.annotate("", (0.42, 0.49), (0.28, 0.49), arrowprops=dict(arrowstyle="->", lw=2))
    ax.text(0.35, 0.53, "clears\nfirst", ha="center", fontsize=7.5)
    ax.annotate("", (0.72, 0.40), (0.64, 0.40), arrowprops=dict(arrowstyle="->", lw=2))
    ax.text(0.5, 0.16, "3 layers ours + 1 borrowed  →  triple gate $\\delta\\times\\phi\\times A$ closes (ceiling 0.94–0.98)",
            ha="center", fontsize=10, style="italic")
    save(fig, "fig09_composition.png")


if __name__ == "__main__":
    for f in [fig01, fig02, fig03, fig04, fig05, fig06, fig07, fig08, fig09]:
        f(); print("ok", f.__name__)
