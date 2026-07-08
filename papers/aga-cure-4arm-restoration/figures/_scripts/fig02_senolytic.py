#!/usr/bin/env python3
import os, matplotlib.pyplot as plt, numpy as np
_OUT=os.path.join(os.path.dirname(__file__),"..")
plt.rcParams.update({"font.family":"DejaVu Sans","font.size":9,"axes.spines.top":False,"axes.spines.right":False})
clear=np.linspace(0,1,21)
# AGA: ceiling=0.75*0.95+0.25*eta_neo ; eta_neo=0.49+clear*0.51
aga=0.75*0.95+0.25*(0.49+clear*0.51)
# perio: 0.40*0.95+0.30*0.85+0.30*eta_bone ; eta_bone=0.55+clear*0.45
perio=0.40*0.95+0.30*0.85+0.30*(0.55+clear*0.45)
fig,ax=plt.subplots(figsize=(6.0,3.4))
ax.plot(clear*100,aga,"o-",color="#388E3C",ms=4,lw=2,label="AGA cure-ceiling")
ax.plot(clear*100,perio,"s-",color="#6A1B9A",ms=4,lw=2,label="periodontal cure-ceiling")
ax.axhline(0.90,ls="--",color="#C62828",lw=1.3,label="cure gate (≥90%)")
ax.axvspan(60,100,color="#388E3C",alpha=0.08)
ax.set_xlabel("SENOLYX niche senescent-cell clearance (%)")
ax.set_ylabel("complete-restoration ceiling")
ax.set_title("Senolytic niche-clearance lifts η$_{neo}$ → closes the cure gate\n(≥60–80% clearance) across domains",fontsize=9.5)
ax.set_ylim(0.78,0.98); ax.legend(loc="lower right",fontsize=7.5,frameon=False); plt.tight_layout()
plt.savefig(os.path.join(_OUT,"fig02_senolytic.pdf")); print("fig02 ok")
