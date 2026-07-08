#!/usr/bin/env python3
"""fig01 -- AGA 4-arm regimen: per-arm marginal restoration value (left) and the
composed restoration vs the two cure gates (right). Data from exports/AGA-CURE
round1-design (REGIMEN.md MC: mean 78.7%, CI [65.6,89.6]) + round4 marginals."""
import os
import matplotlib.pyplot as plt
import numpy as np

_OUT = os.path.join(os.path.dirname(__file__), "..")
plt.rcParams.update({"font.family": "DejaVu Sans", "font.size": 9,
                     "axes.spines.top": False, "axes.spines.right": False})

# --- left: per-arm marginal value (percentage-point restoration loss on removal) ---
arms = ["3 permanence\n(epigenetic lock)", "2 reversal\n(SFRP1/Dkk1)",
        "1 reactivation\n(MPC/LDH)", "4 neogenesis\n(Turing)"]
loss = [37.3, 17.4, 11.4, 11.4]
colors = ["#6A1B9A", "#1565C0", "#388E3C", "#FB8C00"]

# --- right: composed restoration distribution vs gates ---
mean, lo, hi = 78.7, 65.6, 89.6          # MC mean + 90% CI (REGIMEN.md)
p70, p90 = 0.872, 0.043                   # gate-hit probabilities

fig, (axL, axR) = plt.subplots(1, 2, figsize=(8.4, 3.5),
                               gridspec_kw={"width_ratios": [1.05, 1.0]})

# LEFT bar chart
y = np.arange(len(arms))
axL.barh(y, loss, color=colors, edgecolor="k", lw=0.5)
for i, v in enumerate(loss):
    axL.text(v + 0.6, i, f"-{v:.1f}", va="center", fontsize=8, fontweight="bold")
axL.set_yticks(y)
axL.set_yticklabels(arms, fontsize=7.5)
axL.invert_yaxis()
axL.set_xlim(0, 44)
axL.set_xlabel("restoration loss if arm removed (pct points)")
axL.set_title("Per-arm marginal value\n(permanence dominates)", fontsize=9.5)

# RIGHT: composed restoration mean+CI vs the two gates
axR.errorbar([0], [mean], yerr=[[mean - lo], [hi - mean]], fmt="o", ms=8,
             color="#2E7D32", ecolor="#2E7D32", elinewidth=2.4, capsize=7,
             capthick=2.4, label="composed restoration (MC mean + 90% CI)")
axR.axhline(70, ls="--", color="#F9A825", lw=1.4,
            label=f"strong-cosmetic gate (>=70%): P={p70:.3f}")
axR.axhline(90, ls="--", color="#C62828", lw=1.4,
            label=f"strict cure gate (>=90%): P={p90:.3f}")
axR.text(0.12, mean, f"{mean:.1f}%", va="center", fontsize=9, fontweight="bold")
axR.set_xlim(-0.6, 1.4)
axR.set_ylim(55, 95)
axR.set_xticks([])
axR.set_ylabel("restoration (% of never-bald density)")
axR.set_title("Composed regimen vs cure gates\n(Norwood V-VI scalp)", fontsize=9.5)
axR.legend(loc="lower right", fontsize=6.6, frameon=False)

plt.tight_layout()
plt.savefig(os.path.join(_OUT, "fig01_arms.pdf"))
print("fig01 ok")
