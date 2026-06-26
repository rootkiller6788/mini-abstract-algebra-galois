# Dependency Graph: mini-polynomial-algebra

## Upstream Dependencies

```
mini-ring-theory-core
  └── Core.Basic (Ring, Ideal, CommRing, IntegralDomain)

mini-field-theory-core
  └── Core.Basic (Field, FieldExtension, FiniteField)
```

## Internal Dependency Graph

```
Core/Basic.lean
  ├── Core/Laws.lean
  ├── Core/Objects.lean
  ├── Constructions/Products.lean
  ├── Constructions/Quotients.lean
  ├── Constructions/Subobjects.lean
  ├── Constructions/Universal.lean
  ├── Morphisms/Hom.lean
  ├── Morphisms/Iso.lean
  ├── Morphisms/Equivalence.lean
  ├── Properties/Invariants.lean
  ├── Properties/Preservation.lean
  ├── Properties/ClassificationData.lean
  ├── Theorems/Basic.lean
  ├── Theorems/Main.lean
  ├── Theorems/Classification.lean
  ├── Theorems/UniversalProperties.lean
  ├── Examples/Standard.lean
  ├── Examples/Counterexamples.lean
  ├── Bridges/ToComputation.lean
  ├── Bridges/ToGeometry.lean
  └── Bridges/ToTopology.lean

Theorems/Main.lean
  └── Bridges/ToAlgebra.lean (and any file importing Theorems/Main)

MiniPolynomialAlgebra.lean
  ├── Test/Smoke.lean
  ├── Test/Regression.lean
  ├── Test/Examples.lean
  ├── Benchmark/CoreCoverage.lean
  ├── Benchmark/MIT.lean
  ├── Benchmark/Harvard.lean
  ├── Benchmark/Princeton.lean
  ├── Benchmark/CambridgePartIII.lean
  └── Benchmark/OxfordPartC.lean
```

## Downstream Consumers (planned)

```
mini-abstract-algebra-galois (uses polynomial rings for Galois theory)
mini-commutative-homological-algebra (Groebner bases, syzygies)
mini-algebraic-geometry-schemes (affine schemes, projective schemes)
mini-number-theory-arithmetic-geometry (polynomials over ℤ, ℚ, finite fields)
```
