/-
# Benchmark: MiniFieldTheoryCore Core Coverage

Tracks every definition/theorem with implementation status.
Format: `-- [x] target | file:line`

Status: [x] done  [~] partial  [ ] planned
-/

/-!
## Core -- 14 targets

-- [x] Field structure                              | Core/Basic.lean
-- [x] Field.mul_comm                               | Core/Basic.lean
-- [x] Field.mul_inv                                | Core/Basic.lean
-- [x] FieldExtension structure                     | Core/Basic.lean
-- [x] isAlgebraic                                  | Core/Basic.lean
-- [x] isTranscendental                             | Core/Basic.lean
-- [x] isAlgebraicExtension                         | Core/Basic.lean
-- [x] extensionDegree                              | Core/Basic.lean
-- [x] isFiniteExtension                            | Core/Basic.lean
-- [x] characteristic                               | Core/Basic.lean
-- [x] PrimeField                                   | Core/Basic.lean
-- [x] isSplittingField                             | Core/Basic.lean
-- [x] FieldAutomorphism structure                  | Core/Basic.lean
-- [~] Core.Objects stub                            | Core/Objects.lean
-- [~] Core.Laws stub                               | Core/Laws.lean

## Morphisms -- 3 targets

-- [x] FieldHom structure                           | Morphisms/Hom.lean
-- [x] FieldHom.id                                  | Morphisms/Hom.lean
-- [x] FieldHom.comp                                | Morphisms/Hom.lean
-- [x] FieldIso structure                           | Morphisms/Iso.lean
-- [x] FieldEquivalence structure                   | Morphisms/Equivalence.lean
-- [x] ExtensionEquivalence structure               | Morphisms/Equivalence.lean

## Constructions -- 4 targets

-- [x] Subfield structure                           | Constructions/Subobjects.lean
-- [x] IntermediateField structure                  | Constructions/Subobjects.lean
-- [x] isAlgebraicallyClosed                        | Constructions/Universal.lean
-- [~] Products stub                                | Constructions/Products.lean
-- [~] Universal stub                               | Constructions/Universal.lean
-- [~] Quotients stub                               | Constructions/Quotients.lean

## Properties -- 3 stubs

-- [~] Invariants stub                              | Properties/Invariants.lean
-- [~] Preservation stub                            | Properties/Preservation.lean
-- [~] ClassificationData stub                      | Properties/ClassificationData.lean

## Theorems -- 4 stubs

-- [~] Basic stub                                   | Theorems/Basic.lean
-- [~] UniversalProperties stub                     | Theorems/UniversalProperties.lean
-- [~] Classification stub                          | Theorems/Classification.lean
-- [~] Main stub                                    | Theorems/Main.lean

## Examples -- 2 targets

-- [~] Standard stub                                | Examples/Standard.lean
-- [~] Counterexamples stub                         | Examples/Counterexamples.lean

## Bridges -- 4 stubs

-- [~] ToAlgebra stub                               | Bridges/ToAlgebra.lean
-- [~] ToTopology stub                              | Bridges/ToTopology.lean
-- [~] ToGeometry stub                              | Bridges/ToGeometry.lean
-- [~] ToComputation stub                           | Bridges/ToComputation.lean

## Summary

Total: 34 targets
Done: 18
Stub: 16
Coverage: 53% (core done, expansions stubbed)
-/

#eval "CoreCoverage: 34 targets, 18 done, 16 stubs"
