#!/usr/bin/env python3
# fig02 — the ruled-out axes. Each panel = a design axis that this work
# deterministically SETTLES (closed-negative): the winner is fixed, so the axis
# cannot be the determinant of cure success. Data = DC3 / DC4 / DC5 / DC7 geo-mean fits.
import os,matplotlib.pyplot as plt
_OUT=os.path.join(os.path.dirname(__file__),"..")

plt.rcParams.update({"font.family":"DejaVu Sans","font.size":9,
                     "axes.spines.top":False,"axes.spines.right":False})

panels = [
 ("arm③ permanence (DC3)", [("AAV episomal\n(FALSIFIED)",0.14),("CRISPR KO",0.45),("epigenetic edit",0.77)]),
 ("arm② reversal (DC4)",   [("GSK3β\n(onco RULED-OUT)",0.501),("Wnt-agonist",0.535),("SFRP1+Dkk1",0.762)]),
 ("arm① wake (DC5)",       [("JAK-STAT\n(off-axis)",0.486),("SCUBE3",0.637),("MPC/LDH",0.798)]),
 ("arm③ delivery (DC7)",   [("single-AAV dCas9\n(cargo FAIL)",0.483),("dual-AAV",0.709),("Cas12f",0.766)]),
]
fig, axes = plt.subplots(1,4, figsize=(10.5,3.0))
for ax,(title,rows) in zip(axes,panels):
    labs=[r[0] for r in rows]; vals=[r[1] for r in rows]
    cols=["#C62828","#FB8C00","#388E3C"]
    ax.barh(range(len(rows)), vals, color=cols, edgecolor="black", lw=0.5, height=0.6)
    ax.set_yticks(range(len(rows))); ax.set_yticklabels(labs, fontsize=7.2)
    for i,v in enumerate(vals): ax.text(v+0.01,i,f"{v:.2f}",va="center",fontsize=7.5,fontweight="bold")
    ax.set_xlim(0,1.0); ax.set_title(title, fontsize=8.5); ax.grid(axis="x",ls=":",alpha=0.3)
fig.suptitle("Settled (closed-negative) design axes — winner fixed, axis cannot be the cure determinant",
             fontsize=10, y=1.02)
plt.tight_layout()
plt.savefig(os.path.join(_OUT,"fig02_axes.pdf"), bbox_inches="tight"); print("wrote fig02_axes.pdf")
