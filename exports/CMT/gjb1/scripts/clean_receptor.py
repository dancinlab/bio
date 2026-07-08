#!/usr/bin/env python3
# Clean EvoEF2 mutant PDB → standard PDB via pdbfixer (add missing atoms/H, keep
# only protein), so meeko's polymer typer can build the PDBQT. Single chain A.
import sys
from pdbfixer import PDBFixer
from openmm.app import PDBFile
inp, out = sys.argv[1], sys.argv[2]
f = PDBFixer(filename=inp)
f.findMissingResidues(); f.missingResidues = {}   # don't model gaps de novo
f.findNonstandardResidues(); f.replaceNonstandardResidues()
f.removeHeterogens(keepWater=False)
f.findMissingAtoms(); f.addMissingAtoms()
f.addMissingHydrogens(7.0)
PDBFile.writeFile(f.topology, f.positions, open(out,"w"), keepIds=True)
print("CLEANED", out, f.topology.getNumAtoms(), "atoms")
