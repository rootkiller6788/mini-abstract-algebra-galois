# mini-ring-theory-core

Ring theory core — rings, ideals, homomorphisms, quotient rings,
integral domains, units, and zero divisors.

## Modules

| Layer | Files | Description |
|-------|-------|-------------|
| Core | Basic, Objects, Laws | Ring, RingHom, Ideal, QuotientRing, IntegralDomain, Unit, ZeroDivisor |
| Morphisms | Hom, Iso, Equivalence | RingEmbedding, RingIso, EqChain |
| Constructions | Subobjects, Quotients, Products, Universal | Subring, quotient constructions, universal properties |
| Properties | Invariants, Preservation, ClassificationData | Ring invariants and classification |
| Theorems | Basic, UniversalProperties, Classification, Main | Theorems of ring theory |
| Examples | Standard, Counterexamples | Standard ring examples and counterexamples |
| Bridges | ToAlgebra, ToTopology, ToGeometry, ToComputation | Cross-domain connections |

## Quick Start

```bash
cd mini-ring-theory-core
lake build
lake env lean --run Test/Smoke.lean
```
