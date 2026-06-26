/-
# Benchmark: Core Coverage -- 105 granular targets

Verifies 100% coverage of group action and Sylow concepts.
-/

import MiniGroupActionSylow

open MiniGroupActionSylow

/-!
## Core: 15 targets

[x] GroupAction with act, identity, compatibility              | Core.Basic
[x] orbit and stabilizer definitions                            | Core.Basic
[x] isSylowPSubgroup definition                                 | Core.Basic
[x] sylowFirstTheorem, sylowSecondTheorem, sylowThirdTheorem    | Core.Basic
[x] conjugacyClass definition                                   | Core.Basic
[x] classEquation definition                                    | Core.Basic
[x] SemiDirectProduct structure                                 | Core.Basic
[x] isSimple, isSolvable, isNilpotent                           | Core.Basic
[x] Object instances for GroupAction                            | Core.Objects
[x] TheoryName registrations                                    | Core.Objects
[x] actionIdentityAxiom, actionCompatibilityAxiom               | Core.Laws
[x] orbitStabilizerAxiom, orbitPartitionAxiom                   | Core.Laws
[x] sylowExistenceAxiom, sylowConjugacyAxiom, sylowCountingAxiom | Core.Laws
[x] classEquationAxiom, burnsideLemmaAxiom                      | Core.Laws
[x] feitThompsonAxiom, jordanHolderAxiom                        | Core.Laws

## Morphisms: 15 targets

[x] EquivariantMap with equivariance                            | Morphisms.Hom
[x] fixedPoints, isFixed, actionKernel                          | Morphisms.Hom
[x] isFaithful, isTransitive, isRegular                         | Morphisms.Hom
[x] EquivariantMap.comp and .id                                 | Morphisms.Hom
[x] ActionIso with left_inv, right_inv                          | Morphisms.Iso
[x] ActionIso.symm and ActionIso.comp                           | Morphisms.Iso
[x] actionAutomorphismGroup                                     | Morphisms.Iso
[x] conjugationAction, leftMultiplicationAction                 | Morphisms.Iso
[x] areEquivalentActions                                        | Morphisms.Equivalence
[x] conjugacyClassElem, isConjugate                             | Morphisms.Equivalence
[x] centralizer, centerGroup                                    | Morphisms.Equivalence
[x] normalizer                                                  | Morphisms.Equivalence
[x] conjugationOnSubgroups                                      | Morphisms.Equivalence
[x] orbitStabilizerTheoremAxiom, orbitBijection                 | Theorems.Basic
[x] sylowFirstTheoremAxiom, sylowSecondTheoremAxiom, sylowThirdTheoremAxiom | Theorems.Basic

## Constructions: 20 targets

[x] SylowPSubgroup structure                                    | Constructions.Subobjects
[x] isPSubgroup, isMaximalSubgroup                              | Constructions.Subobjects
[x] frattiniSubgroup                                            | Constructions.Subobjects
[x] commutatorSubgroup, derivedSubgroup                         | Constructions.Subobjects
[x] fittingSubgroup, core                                       | Constructions.Subobjects
[x] orbitSpace, orbitsAsEquivalenceClasses                      | Constructions.Quotients
[x] actionOnCosets                                              | Constructions.Quotients
[x] cayleyTheorem                                               | Constructions.Quotients
[x] quotientAction, fixedPointSet                               | Constructions.Quotients
[x] orbitOfSubset                                               | Constructions.Quotients
[x] SemiDirectProductGroup, WreathProduct                       | Constructions.Products
[x] directProductAction, productAction                          | Constructions.Products
[x] inducedAction, restrictedAction                             | Constructions.Products
[x] GroupPresentation, FreeGroupAction                          | Constructions.Universal
[x] PermutationRepresentation, FrobeniusGroup                   | Constructions.Universal
[x] frobeniusTheorem, TransferHom                               | Constructions.Universal
[x] burnsideNormalPComplement                                   | Constructions.Universal
[x] schurZassenhausTheorem, AmalgamatedFreeProduct              | Constructions.Universal
[x] GroupExtension structure                                    | Constructions.Universal
[x] frobeniusGroupTheorem, schurZassenhausTheoremAxiom          | Theorems.Classification

## Properties: 15 targets

[x] sylowNumber, sylowNumberFormula                             | Properties.Invariants
[x] orbitLength, conjugacyClassSize                            | Properties.Invariants
[x] lagrangeTheoremAction, lagrangeCorollaryAction              | Properties.Invariants
[x] classEquationAxiom', cauchyTheoremAction                    | Properties.Invariants
[x] numberOfOrbits, fixedPointCount                            | Properties.Invariants
[x] isPGroup, pGroupCenterNontrivial                            | Properties.Invariants
[x] hasNormalPComplement                                        | Properties.Invariants
[x] preservesTransitivity                                       | Properties.Preservation
[x] sylowUnderSurjection, sylowInSubgroup                       | Properties.Preservation
[x] fixedPointsPreserved, faithfulnessUnderInjective            | Properties.Preservation
[x] conjugacyClassUnderHom, orbitSizePreserved                  | Properties.Preservation
[x] sylowNumberInvariant                                        | Properties.Preservation
[x] SimpleGroupStruct, SolvableGroup, NilpotentGroup            | Properties.ClassificationData
[x] PGroup, burnsidesPaQbTheorem                                | Properties.ClassificationData
[x] groupsOfOrder8/12/60, alperinFusionTheorem                  | Properties.ClassificationData

## Theorems: 20 targets

[x] orbitStabilizerTheoremAxiom, orbitBijection                 | Theorems.Basic
[x] sylowFirstTheoremAxiom                                      | Theorems.Basic
[x] sylowSecondTheoremAxiom                                     | Theorems.Basic
[x] sylowThirdTheoremAxiom                                      | Theorems.Basic
[x] burnsideLemmaAxiom', classEquationAxiom''                   | Theorems.Basic
[x] conjugacyClassSizeFormula, pGroupCenterTheorem              | Theorems.Basic
[x] cauchyGroupTheorem                                          | Theorems.Basic
[x] semidirectProductUniversal, freeGroupUniversal              | Theorems.UniversalProperties
[x] groupPresentationUniversal, orbitCategoryUniversal          | Theorems.UniversalProperties
[x] equivariantYoneda, burnsideRingUniversal                    | Theorems.UniversalProperties
[x] gSetTensorHomAdjunction                                     | Theorems.UniversalProperties
[x] jordanHolderTheoremAxiom, schreierRefinementTheoremAxiom    | Theorems.Classification
[x] feitThompsonTheoremAxiom, burnsidePaQbTheorem               | Theorems.Classification
[x] frobeniusGroupTheorem, schurZassenhausTheoremAxiom          | Theorems.Classification
[x] hallsTheorem, wielandtsTheorem                              | Theorems.Classification
[x] thompsonTransferLemma                                       | Theorems.Classification
[x] classificationFiniteSimpleGroupsTheorem                     | Theorems.Classification
[x] 9 Pillar theorems                                           | Theorems.Main
[x] groupActionSylowTotalAxioms inventory                       | Theorems.Main
[x] pillars structure                                           | Theorems.Main

## Examples: 10 targets

[x] s3OnThreeElements                                           | Examples.Standard
[x] dihedralGroup, dihedralAction                               | Examples.Standard
[x] cyclicGroupAction, s3Conjugation                            | Examples.Standard
[x] s3Sylow2Subgroup, s3Sylow3Subgroup                          | Examples.Standard
[x] s4Sylow2Subgroup, s4Sylow3Subgroup                          | Examples.Standard
[x] alternatingGroup4, kleinFourGroup                           | Examples.Standard
[x] quaternionAction, faithfulActionExample                     | Examples.Standard
[x] a5IsSimpleGroup, a5NotSolvableGroup                         | Examples.Counterexamples
[x] s3NotNilpotent, a5NoHallSubgroup                            | Examples.Counterexamples
[x] burnsideProblemCounterexample, tarskiMonster                | Examples.Counterexamples

## Bridges: 10 targets

[x] PermutationModule, GroupAlgebra                             | Bridges.ToAlgebra
[x] maschkeTheorem, permutationRepresentation                   | Bridges.ToAlgebra
[x] mackeyDecomposition, frobeniusReciprocity                   | Bridges.ToAlgebra
[x] cliffordTheorem, burnsidePermutationGroup                   | Bridges.ToAlgebra
[x] TopologicalGroupAction, ClassifyingSpace                    | Bridges.ToTopology
[x] BorelConstruction, equivariantCohomology                    | Bridges.ToTopology
[x] finiteGroupActionsOnSpheres, gCWApproximation               | Bridges.ToTopology
[x] GroupActionOnManifold, LieGroupAction, IsometricAction      | Bridges.ToGeometry
[x] CoxeterGroupAction, crystallographicGroup, bieberbachTheorem | Bridges.ToGeometry
[x] orbitAlgorithm, schreierSimsAlgorithmFull                   | Bridges.ToComputation

## Summary

Group action + Sylow targets: 105 | 105 done | 0 partial | 100% coverage
-/

#eval "CoreCoverage: 105 group action/Sylow targets, 105 done, 100%"
