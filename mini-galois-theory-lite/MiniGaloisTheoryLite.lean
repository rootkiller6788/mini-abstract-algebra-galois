/-
# MiniGaloisTheoryLite

Galois theory lite: Galois groups, Galois correspondence,
splitting fields, separable/normal extensions,
solvability by radicals, Fundamental Theorem of Galois Theory.

This is a sub-package of mini-abstract-algebra-galois.
It imports all submodules.

All types are self-contained (GField, GGroup, GFExtension, GSubgroup, etc.)
to avoid dependency chain issues while maintaining compatibility with
upstream MiniFieldTheoryCore and MiniGroupTheoryCore packages.
-/

import MiniGaloisTheoryLite.Core.Basic
import MiniGaloisTheoryLite.Core.Objects
import MiniGaloisTheoryLite.Core.Laws
import MiniGaloisTheoryLite.Morphisms.Hom
import MiniGaloisTheoryLite.Morphisms.Iso
import MiniGaloisTheoryLite.Morphisms.Equivalence
import MiniGaloisTheoryLite.Constructions.Subobjects
import MiniGaloisTheoryLite.Constructions.Quotients
import MiniGaloisTheoryLite.Constructions.Products
import MiniGaloisTheoryLite.Constructions.Universal
import MiniGaloisTheoryLite.Properties.Invariants
import MiniGaloisTheoryLite.Properties.Preservation
import MiniGaloisTheoryLite.Properties.ClassificationData
import MiniGaloisTheoryLite.Theorems.Basic
import MiniGaloisTheoryLite.Theorems.UniversalProperties
import MiniGaloisTheoryLite.Theorems.Classification
import MiniGaloisTheoryLite.Theorems.Main
import MiniGaloisTheoryLite.Examples.Standard
import MiniGaloisTheoryLite.Examples.Counterexamples
import MiniGaloisTheoryLite.Bridges.ToAlgebra
import MiniGaloisTheoryLite.Bridges.ToTopology
import MiniGaloisTheoryLite.Bridges.ToGeometry
import MiniGaloisTheoryLite.Bridges.ToComputation
