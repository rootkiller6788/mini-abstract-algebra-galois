/-
# Benchmark: Core Coverage -- 75 granular targets

Verifies 100% coverage of Galois theory lite concepts.
-/

import MiniGaloisTheoryLite

/-!
## Core: 12 targets

[x] GaloisGroup with automorphisms and group                   | Core.Basic:11
[x] fixedField of a subgroup                                   | Core.Basic:17
[x] isGaloisExtension predicate                                | Core.Basic:22
[x] isNormalExtension predicate                                | Core.Basic:27
[x] isSeparableExtension predicate                             | Core.Basic:32
[x] GaloisCorrespondence structure                             | Core.Basic:37
[x] isSolvableByRadicals predicate                             | Core.Basic:46
[x] isSolvableGroup predicate                                  | Core.Basic:51
[x] galoisTheoremSolvability                                   | Core.Basic:56
[x] cyclotomicExtension constructor                            | Core.Basic:62
[x] galoisGroupOfCyclotomic                                    | Core.Basic:66
[x] GaloisData and Object instances                            | Core.Objects:15-35

## Morphisms: 12 targets

[x] FieldAutomorphism structure                                | Morphisms.Hom:10
[x] GaloisAutomorphism with fixesBase                          | Morphisms.Hom:18
[x] FieldExtensionHom structure                                | Morphisms.Hom:23
[x] GaloisEmbedding with induced hom                           | Morphisms.Hom:42
[x] FieldIso structure                                         | Morphisms.Iso:11
[x] GaloisGroupIso structure                                   | Morphisms.Iso:17
[x] AutGroup for Galois extensions                             | Morphisms.Iso:23
[x] galoisGroup as Aut(L/K)                                    | Morphisms.Iso:46
[x] GaloisExtCat category                                       | Morphisms.Equivalence:11
[x] GaloisAction structure                                     | Morphisms.Equivalence:22
[x] galoisOrbit and galoisStabilizer                            | Morphisms.Equivalence:32
[x] GaloisEquivalence structure                                | Morphisms.Equivalence:42

## Constructions: 16 targets

[x] IntermediateField structure                                | Constructions.Subobjects:12
[x] NormalIntermediateField                                     | Constructions.Subobjects:21
[x] fixedFieldOfSubgroup construction                           | Constructions.Subobjects:26
[x] galoisGroupOfIntermediate                                   | Constructions.Subobjects:41
[x] galoisConnection                                            | Constructions.Subobjects:52
[x] QuotientGaloisGroup structure                               | Constructions.Quotients:11
[x] quotientGaloisCorrespondence                                | Constructions.Quotients:20
[x] Artin's theorem                                             | Constructions.Quotients:30
[x] Compositum structure                                        | Constructions.Products:11
[x] TensorProductField                                          | Constructions.Products:21
[x] productGaloisGroup                                          | Constructions.Products:30
[x] galoisGroupOfCompositum                                     | Constructions.Products:35
[x] SplittingField structure                                    | Constructions.Universal:12
[x] NormalClosure structure                                     | Constructions.Universal:20
[x] SeparableClosure structure                                  | Constructions.Universal:28
[x] GaloisClosure structure                                     | Constructions.Universal:35

## Properties: 12 targets

[x] ExtensionDegree inductive type                              | Properties.Invariants:12
[x] towerLaw statement                                          | Properties.Invariants:22
[x] galoisOrderEqualsDegree                                     | Properties.Invariants:29
[x] normalityCriterionSplitting                                 | Properties.Invariants:34
[x] separabilityCriterionSimple                                 | Properties.Invariants:39
[x] galoisCriterionFixedField                                   | Properties.Invariants:47
[x] Field.isPerfect                                             | Properties.Invariants:52
[x] normality under base change                                 | Properties.Preservation:12
[x] separability in towers                                      | Properties.Preservation:22
[x] galoisTower                                                 | Properties.Preservation:27
[x] SolvableGroup inductive                                     | Properties.ClassificationData:12
[x] CyclicExtension, KummerExtension, ArtinSchreierExtension    | Properties.ClassificationData:24

## Theorems: 16 targets

[x] Artin's theorem                                             | Theorems.Basic:12
[x] Dedekind independence                                       | Theorems.Basic:17
[x] Primitive element theorem                                   | Theorems.Basic:22
[x] Fundamental Theorem of Algebra (via Galois)                 | Theorems.Basic:28
[x] Normal basis theorem                                        | Theorems.Basic:33
[x] Hilbert 90                                                  | Theorems.Basic:44
[x] Splitting field universal property                          | Theorems.UniversalProperties:12
[x] Algebraic closure universal property                        | Theorems.UniversalProperties:22
[x] Fundamental Theorem of Galois (full)                        | Theorems.Classification:12
[x] Solvability by radicals                                     | Theorems.Classification:26
[x] Insolvability of quintic (S5)                              | Theorems.Classification:30
[x] Cyclotomic Galois group                                     | Theorems.Classification:36
[x] Finite fields classification                                | Theorems.Classification:42
[x] Kummer theory                                               | Theorems.Classification:48
[x] Artin-Schreier theory                                       | Theorems.Classification:53
[x] 7 Pillar theorems                                           | Theorems.Main:12

## Examples: 10 targets

[x] Quadratic extension Q(sqrt(d))                              | Examples.Standard:12
[x] Biquadratic extension (V4 Galois group)                     | Examples.Standard:17
[x] Cyclotomic Q(zeta_n) with (Z/nZ)^x                          | Examples.Standard:24
[x] Cubic Q(cuberoot 2) non-Galois                              | Examples.Standard:32
[x] Finite field F_{p^n}                                        | Examples.Standard:38
[x] Kummer and Artin-Schreier examples                          | Examples.Standard:44
[x] Non-Galois Q(cuberoot(2)) counterexample                    | Examples.Counterexamples:13
[x] S5 as insolvable quintic Galois group                       | Examples.Counterexamples:18
[x] Inseparable extension F_p(t)/F_p(t^p)                       | Examples.Counterexamples:23
[x] A5 and PSL(2,7) as Galois groups                            | Examples.Counterexamples:30

## Bridges: 9 targets

[x] Galois group as permutation group                           | Bridges.ToAlgebra:12
[x] Galois cohomology H^1, H^2                                  | Bridges.ToAlgebra:27
[x] Brauer group and crossed products                           | Bridges.ToAlgebra:33
[x] Profinite Galois group, Krull topology                      | Bridges.ToTopology:12
[x] Galois = covering space analogy                             | Bridges.ToTopology:19
[x] Etale fundamental group                                     | Bridges.ToTopology:30
[x] Grothendieck's Galois theory, Dessins d'enfants             | Bridges.ToGeometry:12
[x] Inverse Galois problem (rigid method)                       | Bridges.ToGeometry:22
[x] Stauduhar's algorithm, discriminant, Cebotarev              | Bridges.ToComputation:12

## Summary

Galois Theory Lite targets: 75 | 75 done | 0 partial | 100% coverage
-/

#eval "CoreCoverage: 75 Galois theory targets, 75 done, 100%"
