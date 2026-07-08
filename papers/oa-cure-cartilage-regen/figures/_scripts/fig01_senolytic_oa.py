#!/usr/bin/env python3
# fig01 — OA cure-ceiling vs SENOLYX niche senescent-cell clearance.
# Model (single-dispatch axis_collapse, OA manifest):
#   ceiling(phi) = m_rev*eta_rev + m_dorm*eta_dorm(phi) + m_lost*eta_lost(phi)
#   m_rev=0.35 (chondrocyte), m_dorm=0.30 (dormant progenitor), m_lost=0.35 (fibrillated cartilage)
#   eta_rev=0.90 (fixed; chondrocyte reversal saturated)
#   eta_dorm(phi)=0.75 + 0.25*phi   (SASP also suppresses the dormant progenitor pool)
#   eta_lost(phi)=0.40 + 0.60*phi   (senolytic clearance re-opens chondral neogenesis window)
# At phi=0 ceiling=0.68 (best-achievable, gate BLOCK); crosses the >=0.90 gate at phi~78%.
import os, matplotlib.pyplot as plt, numpy as np
_OUT = os.path.join(os.path.dirname(__file__), "..")
plt.rcParams.update({"font.family": "DejaVu Sans", "font.size": 9,
                     "axes.spines.top": False, "axes.spines.right": False})

m_rev, m_dorm, m_lost = 0.35, 0.30, 0.35
eta_rev = 0.90

def ceiling(phi):
    eta_dorm = 0.75 + 0.25 * phi
    eta_lost = 0.40 + 0.60 * phi
    return m_rev * eta_rev + m_dorm * eta_dorm + m_lost * eta_lost

phi = np.linspace(0, 1, 101)
y = ceiling(phi)

# anchor points stated in the campaign (clearance% -> ceiling)
anchor_x = np.array([0, 40, 60, 78, 95])
anchor_y = ceiling(anchor_x / 100.0)

gate = 0.90
base = m_rev * eta_rev + m_dorm * 0.75 + m_lost * 0.40
slope = m_dorm * 0.25 + m_lost * 0.60
phi_star = (gate - base) / slope  # clearance that exactly closes the gate

fig, ax = plt.subplots(figsize=(6.2, 3.6))
ax.plot(phi * 100, y, "-", color="#00695C", lw=2.2, label="OA complete-restoration ceiling")
ax.plot(anchor_x, anchor_y, "o", color="#00695C", ms=6, mec="k", mew=0.6, zorder=5)
for xa, ya in zip(anchor_x, anchor_y):
    ax.annotate(f"{ya:.2f}", (xa, ya), textcoords="offset points", xytext=(0, 7),
                ha="center", fontsize=7.5, fontweight="bold")
ax.axhline(gate, ls="--", color="#C62828", lw=1.3, label="cure gate (>=90% of normal)")
ax.axvline(phi_star * 100, ls=":", color="#1565C0", lw=1.2)
ax.axvspan(phi_star * 100, 100, color="#00695C", alpha=0.08)
ax.text(phi_star * 100 + 1.5, 0.70, f"gate closes\nat clearance ~{phi_star*100:.0f}%",
        fontsize=7.5, color="#1565C0", va="bottom")
ax.set_xlabel("SENOLYX niche senescent-cell clearance phi (%)")
ax.set_ylabel("restoration ceiling (frac of normal cartilage)")
ax.set_title("Osteoarthritic cartilage: senolytic clearance lifts neogenesis efficiency\n"
             "and crosses the >=90% cure gate at ~78% clearance", fontsize=9.5)
ax.set_xlim(0, 100); ax.set_ylim(0.62, 0.98)
ax.legend(loc="lower right", fontsize=7.5, frameon=False)
plt.tight_layout()
plt.savefig(os.path.join(_OUT, "fig01_senolytic_oa.pdf"))
print("fig01 ok  phi_star=%.3f" % phi_star)
