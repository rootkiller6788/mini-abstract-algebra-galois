# mini-ring-theory-core — Architecture

## Overview

The ring theory core defines the `Ring` structure — the fundamental algebraic
structure for the mini-abstract-algebra-galois package.

## Dependency Graph

```
mini-ring-theory-core
├── mini-group-theory-core (for group theory base)
└── mini-object-kernel (for object typeclass)
```

## Module Map

```
MiniRingTheoryCore/
├── Core/
│   ├── Basic.lean              — Ring, RingHom, Ideal, QuotientRing, PrimeIdeal, MaximalIdeal, IntegralDomain, Unit, ZeroDivisor
│   ├── Objects.lean            — Subring, SubringPredicate
│   └── Laws.lean               — Ring laws (stub)
├── Morphisms/
│   ├── Hom.lean                — RingEmbedding, RingEmbedding.id/comp
│   ├── Iso.lean                — RingIso structure, RingIso.toEq
│   └── Equivalence.lean        — EqChain, equality infrastructure
├── Constructions/
│   ├── Subobjects.lean         — Subring constructions (stub)
│   ├── Quotients.lean          — Quotient ring constructions (stub)
│   ├── Products.lean           — Product/tensor constructions (stub)
│   └── Universal.lean          — RingEmbeddingGraph
├── Properties/
│   ├── Invariants.lean         — Ring invariants (stub)
│   ├── Preservation.lean       — Preservation properties (stub)
│   └── ClassificationData.lean — Classification data (stub)
├── Theorems/
│   ├── Basic.lean              — Basic theorems (stub)
│   ├── UniversalProperties.lean — Universal property theorems (stub)
│   ├── Classification.lean     — Classification theorems (stub)
│   └── Main.lean               — Main theorems (stub)
├── Examples/
│   ├── Standard.lean           — Standard examples (stub)
│   └── Counterexamples.lean    — Counterexamples (stub)
└── Bridges/
    ├── ToAlgebra.lean          — Bridge to algebra (stub)
    ├── ToTopology.lean         — Bridge to topology (stub)
    ├── ToGeometry.lean         — Bridge to geometry (stub)
    └── ToComputation.lean      — Bridge to computation (stub)
```
