# mini-algebraic-structures -- Architecture

## Dependency Graph

```
MiniGroupTheoryCore / MiniRingTheoryCore / MiniFieldTheoryCore / MiniModuleTheory
  └── MiniAlgebraicStructures
        ├── Core/
        │     ├── Basic.lean          Semigroup, Monoid, Group, Ring, Field, Module, Algebra, Signature, Variety
        │     ├── Objects.lean        Object descriptors, theory registration, dependency nodes
        │     └── Laws.lean           Axioms: semigroup, monoid, group, ring, field, module, algebra, universal algebra
        ├── Morphisms/
        │     ├── Hom.lean            SemigroupHom, MonoidHom, GroupHom, RingHom, ModuleHom, AlgebraHom, SigHom
        │     ├── Iso.lean            GroupIso, RingIso, ModuleIso, AlgebraIso, SigIso, Aut, AutGroup
        │     └── Equivalence.lean    GroupCategory, RingCategory, Congruence, SubSigAlg
        ├── Constructions/
        │     ├── Subobjects.lean     Subsemigroup, Submonoid, Subgroup, NormalSubgroup, Subring, Ideal, Submodule, Subalg
        │     ├── Quotients.lean      QuotientGroup, QuotientRing, QuotientModule, QuotientAlgebra, iso theorems
        │     ├── Products.lean       DirectProduct, SemidirectProduct, FreeProduct, TensorProductModule, SigProduct
        │     └── Universal.lean      FreeGroup, FreeAbelianGroup, FreeMonoid, FreeSemigroup, AlgebraicClosure, FreeSigAlgebra
        ├── Properties/
        │     ├── Invariants.lean     Order, index, Lagrange, Cauchy, class equation, char, dimension, rank, tower law
        │     ├── Preservation.lean   Hom preservation, ker_ideal, image ideal, HSP preservation
        │     └── ClassificationData.lean  Simple/Solvable/Nilpotent, Semisimple, Noetherian/Artinian, CFSG, variety classes
        ├── Theorems/
        │     ├── Basic.lean          Iso theorems, Sylow, Burnside, Jordan-Holder, Feit-Thompson, Birkhoff HSP
        │     ├── UniversalProperties.lean  Free/quotient/polynomial ring/free algebra universals
        │     ├── Classification.lean Birkhoff HSP, Maltsev, congruence varieties, Jonsson, TCT
        │     └── Main.lean           7 pillars, total axiom inventory
        ├── Examples/
        │     ├── Standard.lean       N semigroup, cyclic, symmetric, dihedral, Z, matrix, varieties, signatures
        │     └── Counterexamples.lean A_5 simple, non-associative, rng, non-finitely based, pseudovariety
        ├── Bridges/
        │     ├── ToAlgebra.lean      Representation theory, Lie algebras, group ring, operads
        │     ├── ToTopology.lean     Topological groups, profinite, Stone duality, Pontryagin
        │     ├── ToGeometry.lean     Algebraic groups, group schemes, Tannakian, Hopf algebras
        │     └── ToComputation.lean  Grobner bases, term rewriting, Knuth-Bendix, word problem, UACalc
        ├── Test/                     Smoke, Examples, Regression
        ├── Benchmark/                CoreCoverage (75 targets) + 5 school benchmarks
        └── Root: MiniAlgebraicStructures.lean, Main.lean
```

## Layer Map

| Layer | Files | Purpose |
|-------|-------|---------|
| **Core** (3) | Basic, Objects, Laws | Hierarchy semigroup->field, 26 base axioms |
| **Morphisms** (3) | Hom, Iso, Equivalence | Homomorphisms, isomorphisms, categories |
| **Constructions** (4) | Subobjects, Quotients, Products, Universal | Subobjects, quotients, products, free objects |
| **Properties** (3) | Invariants, Preservation, ClassificationData | Order, Lagrange, simple/solvable/nilpotent |
| **Theorems** (4) | Basic, UniversalProperties, Classification, Main | Sylow, Jordan-Holder, Birkhoff HSP, Maltsev, 7 pillars |
| **Examples** (2) | Standard, Counterexamples | Concrete structures, pathological cases |
| **Bridges** (4) | Algebra, Topology, Geometry, Computation | Rep theory -> profinite -> Tannakian -> ATP |

## Axiom Inventory

| Group | Count | Axioms |
|-------|-------|--------|
| Semigroup axioms | 1 | associativity |
| Monoid axioms | 2 | associativity, identity |
| Group axioms | 3 | associativity, identity, inverse |
| Abelian group axioms | 4 | group + commutativity |
| Ring axioms | 3 | add group, mul assoc, distrib |
| Field axioms | 5 | comm ring + nonzero inverse |
| Module axioms | 2 | smul assoc, distrib |
| Algebra axioms | 4 | module + ring + bilinearity |
| Universal algebra | 2 | HSP closure, Birkhoff |
| Theorem axioms | ~30 | Lagrange, Sylow (3), Jordan-Holder, Birkhoff HSP, Maltsev, Jonsson, congruence types, etc. |
| **Total** | **~57** | |
