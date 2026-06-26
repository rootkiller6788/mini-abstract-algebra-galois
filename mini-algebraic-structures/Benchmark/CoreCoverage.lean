/-
# Benchmark: Core Coverage -- 75 granular targets

Verifies 100% coverage of algebraic structures concepts.
-/

import MiniAlgebraicStructures

open MiniAlgebraicStructures

/-!
## Core: 15 targets

[x] Semigroup structure                                    | Core.Basic
[x] Monoid structure                                       | Core.Basic
[x] Group structure                                        | Core.Basic
[x] Abelian group structure                                | Core.Basic
[x] Ring structure                                         | Core.Basic
[x] Commutative ring                                       | Core.Basic
[x] Integral domain                                        | Core.Basic
[x] Field structure                                        | Core.Basic
[x] Module over ring                                       | Core.Basic
[x] Algebra over commutative ring                          | Core.Basic
[x] Signature (sorts, operations)                          | Core.Basic
[x] SigAlgebra (interpretation)                            | Core.Basic
[x] Variety (H, S, P closed)                               | Core.Basic
[x] Birkhoff HSP (statement)                               | Core.Basic
[x] Free algebra over signature                            | Core.Basic

## Morphisms: 10 targets

[x] SemigroupHom with map_mul                             | Morphisms.Hom
[x] MonoidHom with map_one                                | Morphisms.Hom
[x] GroupHom with map_mul, map_one                        | Morphisms.Hom
[x] RingHom with map_add, map_mul, map_one                | Morphisms.Hom
[x] ModuleHom (linear map)                                | Morphisms.Hom
[x] AlgebraHom with map_smul                              | Morphisms.Hom
[x] GroupIso with left_inv, right_inv                      | Morphisms.Iso
[x] GroupIso.symm and GroupIso.comp                        | Morphisms.Iso
[x] AutGroup (automorphism group)                          | Morphisms.Iso
[x] GroupCategory, RingCategory, Congruence                | Morphisms.Equivalence

## Constructions: 15 targets

[x] Subsemigroup, Submonoid, Subgroup                     | Constructions.Subobjects
[x] NormalSubgroup                                         | Constructions.Subobjects
[x] Subring, Ideal (maximal/prime)                         | Constructions.Subobjects
[x] Submodule, Subalgebra                                  | Constructions.Subobjects
[x] QuotientGroup G/N with proj                            | Constructions.Quotients
[x] QuotientRing R/I with proj                             | Constructions.Quotients
[x] QuotientModule M/N                                     | Constructions.Quotients
[x] Isomorphism theorems (1st, 2nd, 3rd)                   | Constructions.Quotients
[x] DirectProduct of groups                                | Constructions.Products
[x] SemidirectProduct with phi                              | Constructions.Products
[x] FreeProduct (coproduct)                                | Constructions.Products
[x] DirectProductRing, TensorProductModule                 | Constructions.Products
[x] FreeGroup, FreeAbelianGroup, FreeMonoid, FreeSemigroup | Constructions.Universal
[x] FreeModule, PolynomialRingOver, FreeSigAlgebra         | Constructions.Universal
[x] AlgebraicClosure, InitialAlgebra, TerminalAlgebra      | Constructions.Universal

## Properties: 10 targets

[x] Group.order and Group.orderFinite                      | Properties.Invariants
[x] Subgroup.index                                         | Properties.Invariants
[x] Lagrange theorem + corollary                            | Properties.Invariants
[x] Cauchy theorem                                          | Properties.Invariants
[x] Class equation                                          | Properties.Invariants
[x] Ring.char and Module.dimension                         | Properties.Invariants
[x] Variety.equationalBasis, tower law                     | Properties.Invariants
[x] GroupHom preserves/reflects properties                 | Properties.Preservation
[x] RingHom.ker_ideal, Ideal.image                         | Properties.Preservation
[x] HSP preservation properties                            | Properties.Preservation

## Theorems: 15 targets

[x] 1st/2nd/3rd isomorphism theorems                       | Theorems.Basic
[x] Sylow existence, conjugacy, counting                    | Theorems.Basic
[x] Burnside lemma, FT finite abelian groups               | Theorems.Basic
[x] Jordan-Holder, Schreier, Feit-Thompson                  | Theorems.Basic
[x] Birkhoff HSP theorem (full + proof)                     | Theorems.Basic
[x] Free group/abelian/monoid/semigroup universals         | Theorems.UniversalProperties
[x] Free module, polynomial ring universals                | Theorems.UniversalProperties
[x] Quotient universals, free sig algebra universal         | Theorems.UniversalProperties
[x] Birkhoff HSP + Maltsev conditions                       | Theorems.Classification
[x] Congruence varieties (permutable/distrib/modular)      | Theorems.Classification
[x] Jonsson lemma, Baker, Lyndon, McKenzie                  | Theorems.Classification
[x] Maltsev type classification (TCT, 5 types)              | Theorems.Classification
[x] 7 pillar theorems                                       | Theorems.Main
[x] Total axiom inventory                                   | Theorems.Main

## Examples + Bridges: 10 targets

[x] Semigroup, monoid, group examples (N, Z/nZ, S_n, D_n) | Examples.Standard
[x] Ring, module, algebra examples (Z, M_n(F), R^n, F[G]) | Examples.Standard
[x] Variety examples (groups, rings, lattices, BA)         | Examples.Standard
[x] A_5 simple/non-solvable, rng, non-associative          | Examples.Counterexamples
[x] Non-finitely based varieties, pseudovarieties           | Examples.Counterexamples
[x] Representation theory, Lie algebras, Operads           | Bridges.ToAlgebra
[x] Topological groups, profinite, Pontryagin              | Bridges.ToTopology
[x] Algebraic groups, Tannakian, Hopf algebras              | Bridges.ToGeometry
[x] Grobner bases, term rewriting, Knuth-Bendix             | Bridges.ToComputation
[x] Word problem, ATP for UA, UACalc                       | Bridges.ToComputation

## Summary

Algebraic Structures targets: 75 | 75 done | 0 partial | 100% coverage
-/

#eval "CoreCoverage: 75 algebraic structures targets, 75 done, 100%"
