# MiniFieldTheoryCore

The field theory sub-package of mini-everything-math.

Defines Field, FieldExtension, Algebraic/Transcendental elements,
Characteristic, PrimeField, FiniteField basics, Field of Fractions,
Splitting Fields, and bridges to algebra, topology, geometry, and computation.

## Structure

- `Core/` -- Field, FieldExtension, Algebraic, Transcendental, Characteristic
- `Morphisms/` -- FieldHom, FieldIso, FieldEquivalence
- `Constructions/` -- FieldOfFractions, SplittingField, AlgebraicClosure, Universal
- `Properties/` -- Invariants, Preservation, ClassificationData
- `Theorems/` -- Basic, UniversalProperties, Classification, Main
- `Examples/` -- Standard fields, Counterexamples
- `Bridges/` -- ToAlgebra, ToTopology, ToGeometry, ToComputation

## Dependencies

- `mini-ring-theory-core` -- Ring structure
- `mini-group-theory-core` -- Group structure

## Usage

```bash
lake build
lake env lean --run Main.lean
```
