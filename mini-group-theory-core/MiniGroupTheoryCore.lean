/-
# MiniGroupTheoryCore

Group theory: groups, subgroups, normal subgroups, quotient groups,
homomorphisms, isomorphisms, group actions, Sylow theorems,
classification theorems, and bridges to algebra/topology/geometry/computation.

This is a sub-package of mini-abstract-algebra-galois in the mini-everything-math ecosystem.
It imports all submodules.
-/

import MiniGroupTheoryCore.Core.Basic
import MiniGroupTheoryCore.Core.Objects
import MiniGroupTheoryCore.Core.Laws
import MiniGroupTheoryCore.Core.AxiomCompat
import MiniGroupTheoryCore.Morphisms.Hom
import MiniGroupTheoryCore.Morphisms.Iso
import MiniGroupTheoryCore.Morphisms.Equivalence
import MiniGroupTheoryCore.Constructions.Subobjects
import MiniGroupTheoryCore.Constructions.Quotients
import MiniGroupTheoryCore.Constructions.Products
import MiniGroupTheoryCore.Constructions.Universal
import MiniGroupTheoryCore.Properties.Invariants
import MiniGroupTheoryCore.Properties.Preservation
import MiniGroupTheoryCore.Properties.ClassificationData
import MiniGroupTheoryCore.Theorems.Basic
import MiniGroupTheoryCore.Theorems.UniversalProperties
import MiniGroupTheoryCore.Theorems.Classification
import MiniGroupTheoryCore.Theorems.Main
import MiniGroupTheoryCore.Examples.Standard
import MiniGroupTheoryCore.Examples.Counterexamples
import MiniGroupTheoryCore.Bridges.ToAlgebra
import MiniGroupTheoryCore.Bridges.ToTopology
import MiniGroupTheoryCore.Bridges.ToGeometry
import MiniGroupTheoryCore.Bridges.ToComputation
