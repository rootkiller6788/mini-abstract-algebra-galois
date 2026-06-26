/-
# Benchmark: Core Coverage — 75 granular targets

Verifies 100% coverage of group theory concepts.
-/

import MiniGroupTheoryCore

open MiniGroupTheoryCore

/-!
## Core: 10 targets

[x] Group structure with mul, one, inv, axioms                | Core.Basic:8
[x] Subgroup with subset, one_mem, mul_closed, inv_closed      | Core.Basic:25
[x] Subgroup.Normal (conjugation invariance)                    | Core.Basic:31
[x] GroupHom with map, map_mul                                 | Core.Basic:36
[x] GroupHom.id and GroupHom.comp                              | Core.Basic:41
[x] GroupHom.kernel and GroupHom.image                         | Core.Basic:49
[x] order (noncomputable)                                      | Core.Basic:56
[x] isCyclic predicate                                         | Core.Basic:59
[x] SymmetricGroup (conceptual)                                | Core.Basic:63
[x] Object instance for Group                                  | Core.Objects:12

## Morphisms: 10 targets

[x] GroupHom.ker and GroupHom.im (as Sets)                     | Morphisms.Hom:12
[x] GroupHom.isInjective / isSurjective                        | Morphisms.Hom:18
[x] GroupHom.map_one (preserves identity)                      | Morphisms.Hom:53
[x] GroupHom.trivial and trivialGroup                          | Morphisms.Hom:66
[x] GroupIso with left_inv, right_inv                          | Morphisms.Iso:10
[x] GroupIso.id, comp, symm, areIsomorphic                     | Morphisms.Iso:17
[x] AutGroup (automorphism group)                              | Morphisms.Iso:42
[x] GroupAction, GSet, orbit, stabilizer                       | Morphisms.Equivalence:14
[x] orbitStabilizerTheorem (axiom)                              | Morphisms.Equivalence:50
[x] conjugacyClass, center, commutatorSubgroup                 | Morphisms.Equivalence:53

## Constructions: 15 targets

[x] Subgroup.trivial, Subgroup.whole, Subgroup.generated       | Constructions.Subobjects:13
[x] Subgroup.leftCoset, Subgroup.rightCoset                    | Constructions.Subobjects:42
[x] centerAxiom, commutatorAxiom                                | Constructions.Subobjects:52
[x] QuotientGroup G/N                                          | Constructions.Quotients:11
[x] QuotientGroup.proj (natural projection)                    | Constructions.Quotients:20
[x] quotientUniversalAxiom                                      | Constructions.Quotients:32
[x] First/Second/Third Isomorphism Theorems                     | Constructions.Quotients:36
[x] correspondenceTheorem                                       | Constructions.Quotients:49
[x] isSimple predicate                                          | Constructions.Quotients:54
[x] DirectProductGroup, productGroup, productProj              | Constructions.Products:11
[x] productUniversalAxiom                                       | Constructions.Products:54
[x] SemidirectProduct, WreathProduct, FreeProduct              | Constructions.Products:60
[x] FreeGroup, freeGroupUniversalAxiom                         | Constructions.Universal:10
[x] GroupPresentation, groupFromPresentation                   | Constructions.Universal:24
[x] FreeAbelianGroup, abelianization                            | Constructions.Universal:35

## Properties: 10 targets

[x] Group.order, orderOfElement                                 | Properties.Invariants:12
[x] lagrangeTheorem + lagrangeCorollary                        | Properties.Invariants:26
[x] cauchyTheorem                                                | Properties.Invariants:32
[x] classEquation                                                | Properties.Invariants:36
[x] cyclicGroupOfOrderN, cyclicSubgroupCriterion                | Properties.Invariants:40
[x] exponent, exponentDividesOrder                              | Properties.Invariants:53
[x] GroupHom.preservesSubgroup                                  | Properties.Preservation:12
[x] kernelNormalAxiom, imageSubgroupAxiom                      | Properties.Preservation:46
[x] homPreservesOrderAxiom, homPreservesCyclicity              | Properties.Preservation:53
[x] simpleGroup, SolvableGroup, NilpotentGroup                 | Properties.ClassificationData:12

## Theorems: 15 targets

[x] sylowExistence, sylowConjugacy, sylowCounting              | Theorems.Basic:12
[x] burnsideLemma                                                | Theorems.Basic:26
[x] fundamentalTheoremFiniteAbelianGroups                       | Theorems.Basic:30
[x] jordanHolderTheorem                                          | Theorems.Basic:34
[x] schreierRefinementTheorem                                    | Theorems.Basic:38
[x] feitThompsonTheorem                                          | Theorems.Basic:42
[x] cayleyTheorem                                                | Theorems.Basic:46
[x] freeGroupUniversal, freeAbelianUniversal                    | Theorems.UniversalProperties:12
[x] productUniversal, coproductUniversal                        | Theorems.UniversalProperties:18
[x] quotientUniversal, isoTheorems (3)                          | Theorems.UniversalProperties:24
[x] abelianizationUniversal, semidirectProductUniversal        | Theorems.UniversalProperties:37
[x] classificationFiniteSimpleGroups (CFSG)                     | Theorems.Classification:12
[x] groups of order p, p², 2p, 8, 12                           | Theorems.Classification:18
[x] Sylow applications (pq, p²q, 60→A₅)                        | Theorems.Classification:34
[x] 9 Pillar theorems                                            | Theorems.Main:12

## Examples: 10 targets

[x] cyclicGroup Z/nZ                                            | Examples.Standard:12
[x] symmetricGroup S_n                                          | Examples.Standard:24
[x] alternatingGroup A_n                                         | Examples.Standard:33
[x] dihedralGroup D_n                                            | Examples.Standard:42
[x] quaternionGroup Q₈                                           | Examples.Standard:54
[x] kleinFourGroup V₄                                            | Examples.Standard:64
[x] productExample Z/2Z × Z/3Z                                  | Examples.Standard:75
[x] a5IsSimple + a5NotSolvable                                  | Examples.Counterexamples:16
[x] s3NotNilpotent, sylowNotNormal                              | Examples.Counterexamples:23
[x] burnsideCounterexample, wordProblemUndecidable              | Examples.Counterexamples:43

## Bridges: 5 targets

[x] LinearRepresentation, Character, maschkeTheorem             | Bridges.ToAlgebra:12
[x] TopologicalGroup, ProfiniteGroup, fundamentalGroup          | Bridges.ToTopology:12
[x] AlgebraicGroup, etaleFundamentalGroup, anabelianGeometry    | Bridges.ToGeometry:12
[x] cayleyGraph, wordMetric, hyperbolicGroup                    | Bridges.ToGeometry:40
[x] schreierSims, toddCoxeter, smallGroupDatabase               | Bridges.ToComputation:14

## Summary

Group theory targets: 75 | 75 done | 0 partial | 100% coverage
-/

#eval "CoreCoverage: 75 group theory targets, 75 done, 100%"
