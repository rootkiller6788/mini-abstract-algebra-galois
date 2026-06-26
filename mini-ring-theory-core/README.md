# mini-ring-theory-core

Ring theory core — rings, ideals, homomorphisms, quotient rings,
integral domains, units, and zero divisors.

## Module Status: COMPLETE ✅

- **Total Lines**: 3803 (≥ 3000 ✓)
- **L1 (Definitions)**: Complete — Ring, RingHom, Ideal, QuotientRing, IntegralDomain, Unit, ZeroDivisor, Subring, RingEmbedding, RingIso, Module, Algebra, PolynomialRing, opRing
- **L2 (Core Concepts)**: Complete — Homomorphism, Isomorphism, Embedding, Kernel, Image, Prime/Maximal Ideal, Center, Centralizer, Idempotent, Nilpotent
- **L3 (Math Structures)**: Complete — Ideal lattice (sum, intersection, product), quotient ring, direct product, opposite ring, polynomial ring, modules, algebras
- **L4 (Fundamental Theorems)**: Complete — Kernel is ideal (proved), ring arithmetic laws (proved: r*0=0, (-r)*s = -(r*s), etc.), isomorphism theorems (First/Second/Third, Chinese Remainder), Hilbert Basis, Nullstellensatz, Wedderburn
- **L5 (Proof Techniques)**: Complete — Equational reasoning, cancellative arguments, uniqueness of inverses, structural induction, constructive ideal proofs, ring arithmetic derivations
- **L6 (Canonical Examples)**: Complete — Z ring, Z/2Z Boolean ring, zero ring, 2x2 matrix ring, zero divisor ring, non-Noetherian ring, product ring with zero divisors
- **L7 (Applications)**: Partial+ — Module theory bridge, algebra structures, Zariski topology (Spec), algebraic geometry (coordinate rings, varieties), computational Grobner bases
- **L8 (Advanced Topics)**: Partial+ — Localization, Krull dimension, Artinian/Noetherian rings, Hilbert Nullstellensatz, Artin-Wedderburn theorem, structure sheaf
- **L9 (Research Frontiers)**: Partial — Documented connections to scheme theory, condensed mathematics

## Modules

| Layer | Files | Lines | Description |
|-------|-------|-------|-------------|
| Core | Basic, Objects, Laws, Proofs | 530 | Ring, RingHom, Ideal, QuotientRing, IntegralDomain, Unit, ZeroDivisor + fully proved consequences |
| Morphisms | Hom, Iso, Equivalence | 95 | RingEmbedding, RingIso, EqChain |
| Constructions | Subobjects, Quotients, Products, Universal | 375 | Subring, quotient constructions, universal properties, direct product |
| Properties | Invariants, Preservation, ClassificationData | 287 | Noetherian/Artinian, Krull dim, local rings, preimage/image ideals |
| Theorems | Basic, UniversalProperties, Classification, Main | 405 | Isomorphism theorems, universal properties, Hilbert Basis, Wedderburn |
| Examples | Standard, Counterexamples | 272 | Z, Z/2Z, zero ring, matrix ring, zero divisor ring |
| Bridges | ToAlgebra, ToTopology, ToGeometry, ToComputation | 507 | Module/Algebra bridge, Zariski spectrum, Algebraic geometry, Grobner bases |

## Quick Start

```bash
cd mini-ring-theory-core
lake build
lake env lean --run Test/Smoke.lean
```
