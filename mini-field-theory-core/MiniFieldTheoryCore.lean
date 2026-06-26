/-
# MiniFieldTheoryCore

The field theory sub-package -- defines Field, FieldExtension,
Algebraic/Transcendental elements, Characteristic, PrimeField,
FiniteField basics, Field of Fractions, Splitting Fields,
and bridges to algebra, topology, geometry, and computation.

## Sub-packages
- `Core`         -- Field, FieldExtension, Algebraic, Transcendental, Characteristic
- `Morphisms`    -- FieldHom, FieldIso, FieldEquivalence
- `Constructions` -- FieldOfFractions, SplittingField, AlgebraicClosure, Universal
- `Properties`   -- Invariants, Preservation, ClassificationData
- `Theorems`     -- Basic, UniversalProperties, Classification, Main
- `Examples`     -- Standard fields, Counterexamples
- `Bridges`      -- ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniFieldTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Objects
import MiniFieldTheoryCore.Core.Laws
import MiniFieldTheoryCore.Morphisms.Hom
import MiniFieldTheoryCore.Morphisms.Iso
import MiniFieldTheoryCore.Morphisms.Equivalence
import MiniFieldTheoryCore.Constructions.Products
import MiniFieldTheoryCore.Constructions.Universal
import MiniFieldTheoryCore.Constructions.Subobjects
import MiniFieldTheoryCore.Constructions.Quotients
import MiniFieldTheoryCore.Properties.Invariants
import MiniFieldTheoryCore.Properties.Preservation
import MiniFieldTheoryCore.Properties.ClassificationData
import MiniFieldTheoryCore.Theorems.Basic
import MiniFieldTheoryCore.Theorems.UniversalProperties
import MiniFieldTheoryCore.Theorems.Classification
import MiniFieldTheoryCore.Theorems.Main
import MiniFieldTheoryCore.Examples.Standard
import MiniFieldTheoryCore.Examples.Counterexamples
import MiniFieldTheoryCore.Bridges.ToAlgebra
import MiniFieldTheoryCore.Bridges.ToTopology
import MiniFieldTheoryCore.Bridges.ToGeometry
import MiniFieldTheoryCore.Bridges.ToComputation
