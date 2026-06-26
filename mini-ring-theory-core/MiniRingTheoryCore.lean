/-
# MiniRingTheoryCore

Ring theory core — rings, ideals, homomorphisms, quotient rings,
integral domains, units, and zero divisors.

## Sub-packages
- `Core`         — Ring, RingHom, Ideal, QuotientRing, IntegralDomain, Unit, ZeroDivisor
- `Morphisms`    — RingEmbedding, RingIso, Equality
- `Constructions` — Subring, QuotientRing constructions, Products, Universal
- `Properties`   — Invariants, Preservation, ClassificationData
- `Theorems`     — Basic, UniversalProperties, Classification, Main
- `Examples`     — Standard, Counterexamples
- `Bridges`      — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Objects
import MiniRingTheoryCore.Core.Laws
import MiniRingTheoryCore.Morphisms.Hom
import MiniRingTheoryCore.Morphisms.Iso
import MiniRingTheoryCore.Morphisms.Equivalence
import MiniRingTheoryCore.Constructions.Subobjects
import MiniRingTheoryCore.Constructions.Quotients
import MiniRingTheoryCore.Constructions.Products
import MiniRingTheoryCore.Constructions.Universal
import MiniRingTheoryCore.Properties.Invariants
import MiniRingTheoryCore.Properties.Preservation
import MiniRingTheoryCore.Properties.ClassificationData
import MiniRingTheoryCore.Theorems.Basic
import MiniRingTheoryCore.Theorems.UniversalProperties
import MiniRingTheoryCore.Theorems.Classification
import MiniRingTheoryCore.Theorems.Main
import MiniRingTheoryCore.Examples.Standard
import MiniRingTheoryCore.Examples.Counterexamples
import MiniRingTheoryCore.Bridges.ToAlgebra
import MiniRingTheoryCore.Bridges.ToTopology
import MiniRingTheoryCore.Bridges.ToGeometry
import MiniRingTheoryCore.Bridges.ToComputation
