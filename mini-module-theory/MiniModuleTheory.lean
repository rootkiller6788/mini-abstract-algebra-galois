/-
# MiniModuleTheory

The module theory sub-package -- defines modules over rings,
submodules, module homomorphisms, free modules, finitely generated
modules, Noetherian and Artinian modules, tensor products, and
exact sequences.

## Sub-packages
- `Core`         -- Module, Submodule, ModuleHom, FreeModule, Noetherian, Artinian
- `Morphisms`    -- ModuleHom, ModuleIso, ModuleEquivalence
- `Constructions` -- Products, Direct sums, Subobjects, Quotients, Universal
- `Properties`   -- Invariants, Preservation, ClassificationData
- `Theorems`     -- Basic, UniversalProperties, Classification, Main
- `Examples`     -- Standard, Counterexamples
- `Bridges`      -- ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniModuleTheory.Core.Basic
import MiniModuleTheory.Core.Objects
import MiniModuleTheory.Core.Laws
import MiniModuleTheory.Morphisms.Hom
import MiniModuleTheory.Morphisms.Iso
import MiniModuleTheory.Morphisms.Equivalence
import MiniModuleTheory.Constructions.Products
import MiniModuleTheory.Constructions.Universal
import MiniModuleTheory.Constructions.Subobjects
import MiniModuleTheory.Constructions.Quotients
import MiniModuleTheory.Properties.Invariants
import MiniModuleTheory.Properties.Preservation
import MiniModuleTheory.Properties.ClassificationData
import MiniModuleTheory.Theorems.Basic
import MiniModuleTheory.Theorems.UniversalProperties
import MiniModuleTheory.Theorems.Classification
import MiniModuleTheory.Theorems.Main
import MiniModuleTheory.Examples.Standard
import MiniModuleTheory.Examples.Counterexamples
import MiniModuleTheory.Bridges.ToAlgebra
import MiniModuleTheory.Bridges.ToTopology
import MiniModuleTheory.Bridges.ToGeometry
import MiniModuleTheory.Bridges.ToComputation
