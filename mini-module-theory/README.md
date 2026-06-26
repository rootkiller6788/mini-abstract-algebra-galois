# MiniModuleTheory

The module theory sub-package of mini-everything-math.

Defines R-modules over rings, submodules, quotient modules,
module homomorphisms, free modules, finitely generated modules,
tensor products of modules, and exact sequences.

## Structure

- `Core/` -- Module, Submodule, ModuleHom, FreeModule, Noetherian, Artinian
- `Morphisms/` -- ModuleHom, ModuleIso, ModuleEquivalence
- `Constructions/` -- Products/direct sums, Subobjects, Quotients, Universal
- `Properties/` -- Invariants, Preservation, ClassificationData
- `Theorems/` -- Basic, UniversalProperties, Classification, Main
- `Examples/` -- Standard, Counterexamples
- `Bridges/` -- ToAlgebra, ToTopology, ToGeometry, ToComputation

## Dependencies

- `mini-ring-theory-core` -- Ring and Ideal definitions
- `mini-group-theory-core` -- Group and Subgroup definitions

## Usage

```bash
lake build
lake env lean --run Main.lean
```
