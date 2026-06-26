# mini-group-theory-core -- Architecture

## Dependency Graph

```
MiniObjectKernel (Object, TheoryName, Axiom, AxiomSystem, Formula, Dependency)
  └── MiniGroupTheoryCore
        ├── Core/
        │     ├── Basic.lean          Group, Subgroup, NormalSubgroup, GroupHom, kernel, image, order, cyclic
        │     ├── Objects.lean        Object instances, TheoryName registration
        │     └── Laws.lean           10 axioms (3 group + 6 derived + 1 abelian)
        ├── Morphisms/
        │     ├── Hom.lean            GroupHom extensions, ker, im, injectivity, surjectivity
        │     ├── Iso.lean            GroupIso, AutGroup, innerAut, conjugacy
        │     └── Equivalence.lean    GroupAction, GSet, orbit-stabilizer, center, commutator
        ├── Constructions/
        │     ├── Subobjects.lean     Subgroup extensions, cosets, center, commutator, derived series
        │     ├── Quotients.lean      QuotientGroup, projection, iso theorems (I, II, III), correspondence
        │     ├── Products.lean       DirectProduct, SemidirectProduct, WreathProduct, FreeProduct
        │     └── Universal.lean      FreeGroup, FreeAbelianGroup, GroupPresentation, abelianization
        ├── Properties/
        │     ├── Invariants.lean     Order, element order, Lagrange, Cauchy, class equation, cyclic properties
        │     ├── Preservation.lean   Hom preservation, kernel normal, image subgroup, lattice theorems
        │     └── ClassificationData.lean  Simple, solvable, nilpotent, p-groups, composition series, CFSG
        ├── Theorems/
        │     ├── Basic.lean          Sylow (3), Burnside, Jordan-Holder, Feit-Thompson, Cayley
        │     ├── UniversalProperties.lean  Free, product, coproduct, quotient universals
        │     ├── Classification.lean CFSG, groups of small order, Sylow applications
        │     └── Main.lean           9 pillars, total axiom inventory
        ├── Examples/
        │     ├── Standard.lean       Z/nZ, S_n, A_n, D_n, Q_8, V_4, GL(n)
        │     └── Counterexamples.lean A_5 simple, S_3 not nilpotent, Q_8 Hamiltonian, Burnside problem
        ├── Bridges/
        │     ├── ToAlgebra.lean      Rep theory, group ring, cohomology, Lie algebras, category Grp
        │     ├── ToTopology.lean     Topological groups, profinite groups, fundamental group, BG
        │     ├── ToGeometry.lean     Algebraic groups, etale fundamental group, anabelian, geometric group theory
        │     └── ToComputation.lean  Schreier-Sims, Todd-Coxeter, small groups DB, GAP
        ├── Test/                     Smoke, Basic, Main (regression)
        ├── Benchmark/                CoreCoverage (75 targets) + 5 school benchmarks
        └── Root: MiniGroupTheoryCore.lean, Main.lean, lakefile.lean
```

## Layer Map

| Layer | Files | Purpose |
|-------|-------|---------|
| **Core** (3) | Basic, Objects, Laws | Group structure, Object registration, 10 axioms |
| **Morphisms** (3) | Hom, Iso, Equivalence | Homomorphisms, isomorphisms, group actions |
| **Constructions** (4) | Subobjects, Quotients, Products, Universal | Subgroups, quotients, products, free groups |
| **Properties** (3) | Invariants, Preservation, ClassificationData | Order, Lagrange, simple/solvable/nilpotent |
| **Theorems** (4) | Basic, UniversalProperties, Classification, Main | Sylow, universals, classification, 9 pillars |
| **Examples** (2) | Standard, Counterexamples | Concrete groups, counterexamples |
| **Bridges** (4) | Algebra, Topology, Geometry, Computation | Rep theory -> profinite -> etale -> computational |

## Axiom Inventory

| Group | Count | Axioms |
|-------|-------|--------|
| Group axioms | 3 | assoc, identity, inverse |
| Derived laws | 6 | identity unique, inverse unique, cancellation (2), involution, socks-shoes |
| Abelian axiom | 1 | commutativity |
| Theorem axioms | ~27 | Lagrange, Sylow (3), Cauchy, Burnside, Jordan-Holder, Feit-Thompson, Cayley, FundThmAbelian, CFSG, small-order classification (5), nilpotent/solvable, extension, universal properties (7), etc. |
| **Total** | **~37** | |
