/-
# Benchmark: MiniModuleTheory Core Coverage

Tracks every definition/theorem with implementation status.
Format: `-- [x] target | file:line`

Status: [x] done  [~] partial  [ ] planned
-/

/-!
## Core -- 13 targets

-- [x] Module structure                                 | Core/Basic.lean
-- [x] Submodule structure                              | Core/Basic.lean
-- [x] ModuleHom structure                              | Core/Basic.lean
-- [x] ModuleHom.id                                     | Core/Basic.lean
-- [x] FreeModule structure                             | Core/Basic.lean
-- [x] isFinitelyGenerated                              | Core/Basic.lean
-- [x] isNoetherian                                     | Core/Basic.lean
-- [x] isArtinian                                       | Core/Basic.lean
-- [x] isExact                                          | Core/Basic.lean
-- [x] TensorProductMod structure                       | Core/Basic.lean
-- [~] Core.Laws stub                                   | Core/Laws.lean
-- [x] SubmoduleSet structure                           | Core/Objects.lean
-- [x] registerModuleTheory                             | Core/Objects.lean

## Morphisms -- 6 targets

-- [x] ModuleHom.comp                                   | Morphisms/Hom.lean
-- [x] ModuleIso structure                              | Morphisms/Iso.lean
-- [x] ModuleAut / areIsomorphic                        | Morphisms/Iso.lean
-- [x] moduleEquivalent                                 | Morphisms/Equivalence.lean
-- [x] submoduleEquivalent                              | Morphisms/Equivalence.lean
-- [x] chainHomotopic                                   | Morphisms/Equivalence.lean

## Constructions -- 4 targets

-- [x] DirectSum / DirectProduct                        | Constructions/Products.lean
-- [x] QuotientModule / quotientByZero                  | Constructions/Quotients.lean
-- [x] submoduleGeneratedBy / annihilator               | Constructions/Subobjects.lean
-- [~] Universal stubs                                  | Constructions/Universal.lean

## Properties -- 3 stubs

-- [~] Invariants stub                                  | Properties/Invariants.lean
-- [~] Preservation stub                                | Properties/Preservation.lean
-- [~] ClassificationData stub                          | Properties/ClassificationData.lean

## Theorems -- 4 stubs

-- [~] Basic stub                                       | Theorems/Basic.lean
-- [~] UniversalProperties stub                         | Theorems/UniversalProperties.lean
-- [~] Classification stub                              | Theorems/Classification.lean
-- [~] Main stub                                        | Theorems/Main.lean

## Examples -- 2 targets

-- [x] regularModule                                    | Examples/Standard.lean
-- [x] Counterexamples stubs                            | Examples/Counterexamples.lean

## Bridges -- 4 stubs

-- [~] ToAlgebra stub                                   | Bridges/ToAlgebra.lean
-- [~] ToTopology stub                                  | Bridges/ToTopology.lean
-- [~] ToGeometry stub                                  | Bridges/ToGeometry.lean
-- [~] ToComputation stub                               | Bridges/ToComputation.lean

## Summary

Total: 36 targets
Done: 20
Stub: 16
Coverage: 56% (core done, expansions stubbed)
-/

#eval "CoreCoverage: 36 targets, 20 done, 16 stubs"
