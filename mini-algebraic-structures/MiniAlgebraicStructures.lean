/-
# MiniAlgebraicStructures

Algebraic structures overview: semigroup, monoid, group, ring, field,
module, vector space, algebra. Universal algebra: signatures, varieties,
Birkhoff's HSP theorem. This is a sub-package of mini-abstract-algebra-galois
in the mini-everything-math ecosystem. It imports all submodules.
-/

import MiniAlgebraicStructures.Core.Basic
import MiniAlgebraicStructures.Core.Objects
import MiniAlgebraicStructures.Core.Laws
import MiniAlgebraicStructures.Morphisms.Hom
import MiniAlgebraicStructures.Morphisms.Iso
import MiniAlgebraicStructures.Morphisms.Equivalence
import MiniAlgebraicStructures.Constructions.Subobjects
import MiniAlgebraicStructures.Constructions.Quotients
import MiniAlgebraicStructures.Constructions.Products
import MiniAlgebraicStructures.Constructions.Universal
import MiniAlgebraicStructures.Properties.Invariants
import MiniAlgebraicStructures.Properties.Preservation
import MiniAlgebraicStructures.Properties.ClassificationData
import MiniAlgebraicStructures.Theorems.Basic
import MiniAlgebraicStructures.Theorems.UniversalProperties
import MiniAlgebraicStructures.Theorems.Classification
import MiniAlgebraicStructures.Theorems.Main
import MiniAlgebraicStructures.Examples.Standard
import MiniAlgebraicStructures.Examples.Counterexamples
import MiniAlgebraicStructures.Bridges.ToAlgebra
import MiniAlgebraicStructures.Bridges.ToTopology
import MiniAlgebraicStructures.Bridges.ToGeometry
import MiniAlgebraicStructures.Bridges.ToComputation
