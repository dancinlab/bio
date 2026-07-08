#!/usr/bin/env python3
# fig02 — OA cartilage cell-class decomposition: mass-weighted contribution
# to the restoration ceiling, at current therapy vs best-achievable (no senolytic).
# Classes (mass): reversible chondrocyte 0.35 / dormant progenitor 0.30 / fibrillated cartilage 0.35.
# eta_now      = [0.70, 0.45, 0.05]   (current intra-articular / microfracture ceiling)
# eta_achieve  = [0.90, 0.75, 0.40]   (best-achievable, no senolytic) -> ceiling 0.68, gate BLOCK
# The fibrillated (lost) class has the LOWEST eta_achievable (0.40) among the 4 senolytic-closable
# cures -> it is the single binding axis; chondral neogenesis is what is gone.
import os, matplotlib.pyplot as plt, numpy as np
_OUT = os.path.join(os.path.dirname(__file__), "..")
plt.rcParams.update({"font.family": "DejaVu Sans", "font.size": 9,
                     "axes.spines.top": False, "axes.spines.right": False})

classes = ["reversible\nchondrocyte", "dormant\nprogenitor", "fibrillated\ncartilage (lost)"]
mass = np.array([0.35, 0.30, 0.35])
eta_now = np.array([0.70, 0.45, 0.05])
eta_ach = np.array([0.90, 0.75, 0.40])
contrib_now = mass * eta_now
contrib_ach = mass * eta_ach
colors_ach = ["#26A69A", "#26A69A", "#FB8C00"]  # highlight the binding (lost) class

x = np.arange(len(classes)); w = 0.38
fig, ax = plt.subplots(figsize=(6.4, 3.7))
ax.bar(x - w / 2, contrib_now, w, label="current therapy (eta_now)",
       color="#B0BEC5", edgecolor="k", lw=0.5)
ax.bar(x + w / 2, contrib_ach, w, label="best achievable (eta_max, no senolytic)",
       color=colors_ach, edgecolor="k", lw=0.5)
for xi, c, e in zip(x, contrib_ach, eta_ach):
    ax.text(xi + w / 2, c + 0.005, f"eta={e:.2f}", ha="center", fontsize=7.5, fontweight="bold")
ax.annotate("BINDING AXIS\nlost-class eta=0.40\n(lowest of the 4 cures)",
            xy=(2 + w / 2, contrib_ach[2]), xytext=(1.4, 0.30),
            fontsize=7.5, color="#E65100", ha="center",
            arrowprops=dict(arrowstyle="->", color="#E65100", lw=1.1))
ax.set_xticks(x); ax.set_xticklabels(classes, fontsize=8)
ax.set_ylabel("mass-weighted contribution to ceiling")
ax.set_ylim(0, 0.40)
sum_ach = contrib_ach.sum()
ax.set_title("OA cartilage class decomposition: ceiling = sum(mass*eta) = "
             f"{sum_ach:.2f}\n(BLOCK; lost fibrillated class is the residual)", fontsize=9.5)
ax.legend(loc="upper right", fontsize=7.5, frameon=False)
plt.tight_layout()
plt.savefig(os.path.join(_OUT, "fig02_classdecomp.pdf"))
print("fig02 ok  ceiling_now=%.3f ceiling_ach=%.3f" % (contrib_now.sum(), contrib_ach.sum()))
