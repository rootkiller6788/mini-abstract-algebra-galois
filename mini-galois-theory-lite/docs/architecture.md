# mini-galois-theory-lite -- Architecture

## Dependency Graph

```
MiniGroupTheoryCore / MiniFieldTheoryCore / MiniPolynomialAlgebra
  └── MiniGaloisTheoryLite
        ├── Core/
        │     ├── Basic.lean          GaloisGroup, GaloisCorrespondence, solvability
        │     ├── Objects.lean        GaloisData, Object instances
        │     └── Laws.lean           10 axioms (extension, group, correspondence, solvability)
        ├── Morphisms/
        │     ├── Hom.lean            FieldAutomorphism, GaloisAutomorphism, FieldExtensionHom
        │     ├── Iso.lean            FieldIso, GaloisGroupIso, AutGroup, galoisGroup
        │     └── Equivalence.lean    GaloisExtCat, GaloisAction, GaloisEquivalence
        ├── Constructions/
        │     ├── Subobjects.lean     IntermediateField, fixedFieldOfSubgroup, galoisConnection
        │     ├── Quotients.lean      QuotientGaloisGroup, isomorphism theorems, Artin
        │     ├── Products.lean       Compositum, TensorProductField, productGaloisGroup
        │     └── Universal.lean      SplittingField, NormalClosure, GaloisClosure, AlgebraicClosure
        ├── Properties/
        │     ├── Invariants.lean     ExtensionDegree, towerLaw, normality/separability criteria
        │     ├── Preservation.lean   Normality/separability in towers, lifting automorphisms
        │     └── ClassificationData.lean  SolvableGroup, CyclicExtension, Kummer, Artin-Schreier
        ├── Theorems/
        │     ├── Basic.lean          Artin, Dedekind, PrimitiveElement, FTA, Hilbert90
        │     ├── UniversalProperties.lean  SplittingField, NormalClosure, AlgebraicClosure universals
        │     ├── Classification.lean Fundamental Theorem of Galois, solvability, finite fields
        │     └── Main.lean           7 pillars, total axiom inventory
        ├── Examples/
        │     ├── Standard.lean       Quadratic, Cyclotomic, Cubic, FiniteField, Kummer
        │     └── Counterexamples.lean  Non-Galois Q(2^(1/3)), S5 insolvable, inseparable
        ├── Bridges/
        │     ├── ToAlgebra.lean      Permutation group, cohomology, Brauer group
        │     ├── ToTopology.lean     Profinite groups, Galois=covering, Etale fundamental
        │     ├── ToGeometry.lean     Grothendieck Galois, Inverse Galois, Dessins d'enfants
        │     └── ToComputation.lean  Stauduhar, Discriminant, Cebotarev, GAP
        ├── Test/                     Smoke, Examples, Regression
        ├── Benchmark/                CoreCoverage (75 targets) + 5 university benchmarks
        └── Root: MiniGaloisTheoryLite.lean, Main.lean, README.md
```

## Layer Map

| Layer | Files | Purpose |
|-------|-------|---------|
| **Core** (3) | Basic, Objects, Laws | GaloisGroup, 10 axioms |
| **Morphisms** (3) | Hom, Iso, Equivalence | Automorphisms, category structure |
| **Constructions** (4) | Subobjects, Quotients, Products, Universal | Splitting fields, closures, intermediate fields |
| **Properties** (3) | Invariants, Preservation, ClassificationData | Degree, normality, solvability types |
| **Theorems** (4) | Basic, UniversalProperties, Classification, Main | FTGT, solvability, 7 pillars |
| **Examples** (2) | Standard, Counterexamples | Concrete Galois extensions |
| **Bridges** (4) | Algebra, Topology, Geometry, Computation | Cohomology, profinite, etale, algorithms |

## Axiom Inventory

| Group | Count | Statements |
|-------|-------|------------|
| Extension axioms | 3 | normality, separability, Galois |
| Group axioms | 2 | definition, order=degree |
| Correspondence axioms | 3 | bijection, inclusion-reversing, normal |
| Solvability axioms | 2 | by radicals, quintic insolvability |
| Theorem statements | ~30 | Artin, Dedekind, FTA, Hilbert90, FTGT (3), Kummer, Artin-Schreier, etc. |
| **Total** | **~40** | |
