#!/usr/bin/env python3
"""fig02 -- arm-3 permanence lock-timing saturation curve. Data from
exports/AGA-CURE/round4-deep/dc6_locktiming_out.txt (DC6): 5-year final restoration
vs the month the epigenetic lock is fired, arms 1/2/4 concurrent from t=0,
5%/yr relapse on unlocked gains. Knee ~month 18 (0.946 = 99.6% of the month-36
asymptote 0.950)."""
import os
import matplotlib.pyplot as plt
import numpy as np

_OUT = os.path.join(os.path.dirname(__file__), "..")
plt.rcParams.update({"font.family": "DejaVu Sans", "font.size": 9,
                     "axes.spines.top": False, "axes.spines.right": False})

# DC6 measured sweep (lock month -> 5yr final restored fraction)
month = np.array([0, 3, 6, 9, 12, 18, 24, 30, 36])
final = np.array([0.550, 0.817, 0.891, 0.921, 0.935, 0.946, 0.949, 0.949, 0.950])
asymptote = 0.950
knee = 18

fig, ax = plt.subplots(figsize=(6.2, 3.6))
ax.plot(month, final, "o-", color="#6A1B9A", ms=5, lw=2.2,
        label="5-yr final restoration (DC6)")
ax.axhline(asymptote, ls=":", color="#9E9E9E", lw=1.2,
           label=f"month-36 asymptote ({asymptote:.3f})")

# knee marker
ax.scatter([knee], [0.946], s=140, facecolor="none", edgecolor="#C62828",
           lw=2.0, zorder=5)
ax.annotate(f"knee ~month {knee}\n(0.946 = 99.6% of asymptote)",
            xy=(knee, 0.946), xytext=(knee + 1.0, 0.78),
            fontsize=8, color="#C62828",
            arrowprops=dict(arrowstyle="->", color="#C62828", lw=1.3))

# shade the "lock too early" exposed-loss region
ax.axvspan(0, 9, color="#C62828", alpha=0.06)
ax.text(4.5, 0.585, "lock too early\n(gains unprotected)",
        fontsize=7, color="#C62828", ha="center")

ax.set_xlabel("arm-3 epigenetic lock fired @ month")
ax.set_ylabel("5-year final restoration (frac of gains)")
ax.set_title("Permanence lock-timing is a saturating function\n"
             "(arms 1/2/4 concurrent from t=0, 5%/yr relapse)", fontsize=9.5)
ax.set_xlim(-1, 37)
ax.set_ylim(0.50, 0.99)
ax.legend(loc="lower right", fontsize=7.5, frameon=False)

plt.tight_layout()
plt.savefig(os.path.join(_OUT, "fig02_locktiming.pdf"))
print("fig02 ok")
