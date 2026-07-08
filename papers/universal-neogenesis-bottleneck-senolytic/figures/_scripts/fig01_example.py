#!/usr/bin/env python3
import os, matplotlib.pyplot as plt, numpy as np
_OUT=os.path.join(os.path.dirname(__file__),"..")
plt.rcParams.update({"font.family":"DejaVu Sans","font.size":9,"axes.spines.top":False,"axes.spines.right":False})
domains=["AGA\n(hair)","periodontal","OA\ncartilage","retinal\nphotorecep."]
current=[0.59,0.52,0.40,0.23]; best=[0.87,0.80,0.68,0.64]; gate=0.90
x=np.arange(len(domains)); w=0.38
fig,ax=plt.subplots(figsize=(6.2,3.4))
ax.bar(x-w/2,current,w,label="current best therapy",color="#C62828",edgecolor="k",lw=0.5)
ax.bar(x+w/2,best,w,label="best achievable (no senolytic)",color="#FB8C00",edgecolor="k",lw=0.5)
ax.axhline(gate,ls="--",color="#1565C0",lw=1.3,label="cure gate (≥90%)")
for i,b in enumerate(best): ax.text(i+w/2,b+0.01,f"{b:.2f}",ha="center",fontsize=7.5,fontweight="bold")
ax.set_xticks(x); ax.set_xticklabels(domains,fontsize=8); ax.set_ylim(0,1.0)
ax.set_ylabel("restoration ceiling (frac of normal)")
ax.set_title("All 4 chronic-degenerative cures BLOCK below the gate\n— same binding axis: lost-tissue neogenesis",fontsize=9.5)
ax.legend(loc="upper right",fontsize=7,frameon=False); plt.tight_layout()
plt.savefig(os.path.join(_OUT,"fig01_example.pdf")); print("fig01 ok")
