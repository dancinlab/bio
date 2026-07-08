#!/usr/bin/env python3
# fig01 — the headline negative result: once every in-silico design axis is
# resolved (DC3-8), the >=90% complete-restoration cure gate collapses to a
# single wet-lab-measurable parameter E_max. Data = DC9 integrated re-gate.
import os,matplotlib.pyplot as plt
_OUT=os.path.join(os.path.dirname(__file__),"..")
import numpy as np

plt.rcParams.update({"font.family":"DejaVu Sans","font.size":10,
                     "axes.spines.top":False,"axes.spines.right":False})

emax = np.array([0.70,0.80,0.85,0.90,0.95,1.00])
restored = np.array([0.657,0.750,0.797,0.844,0.891,0.938])  # DC9 5yr restored
gate = 0.90
thr = 0.959  # gate closes iff E_max >= 0.959

fig, ax = plt.subplots(figsize=(5.6,3.4))
ax.plot(emax, restored, "o-", color="#1565C0", lw=2, ms=6, label="integrated 5yr restored")
ax.axhline(gate, ls="--", color="#C62828", lw=1.3, label="cure gate (≥90%)")
ax.axvline(thr, ls=":", color="#388E3C", lw=1.3)
ax.text(thr+0.003, 0.66, f"E$_{{max}}\\geq${thr:.2f}\n⇒ gate CLOSE", color="#388E3C",
        fontsize=9, va="bottom")
ax.fill_between(emax, gate, restored, where=(restored>=gate), color="#388E3C", alpha=0.12)
ax.set_xlabel("E$_{max}$  (anagen efficacy ceiling — the one wet-lab determinant)")
ax.set_ylabel("complete-restoration fraction (5 yr)")
ax.set_ylim(0.6,1.0); ax.set_xlim(0.69,1.01)
ax.grid(axis="both", ls=":", alpha=0.35)
ax.legend(loc="lower right", fontsize=8.5, frameon=False)
ax.set_title("Cure-design space collapses to a single axis (E$_{max}$)", fontsize=10.5, pad=8)
plt.tight_layout()
plt.savefig(os.path.join(_OUT,"fig01_example.pdf")); print("wrote fig01_example.pdf")
