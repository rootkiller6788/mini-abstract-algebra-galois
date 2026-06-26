# mini-galois-theory-lite

Galois theory lite: Galois groups, Galois correspondence,
splitting fields, separable/normal extensions,
solvability by radicals, Fundamental Theorem of Galois Theory.

## Quick Start

```bash
cd "4. mini-abstract-algebra-galois/mini-galois-theory-lite"

# Run the smoke tests
lake env lean --run Test/Smoke.lean

# Run step-by-step examples
lake env lean --run Test/Examples.lean

# Run regression checks
lake env lean --run Test/Regression.lean
```

## What it provides

| Module | Purpose | Files | #eval Tests |
|--------|---------|-------|-------------|
| **Core** | GaloisGroup, GaloisExtension, FixedField, 12 axioms | 3 | 4 |
| **Morphisms** | FieldAutomorphism, GaloisHom, EmbeddingIso | 3 | 5 |
| **Constructions** | SplittingField, NormalClosure, SeparableClosure, GaloisClosure | 4 | 8 |
| **Properties** | Degree, Normality, Separability, Galois Criterion | 3 | 7 |
| **Theorems** | FTGT, Solvability, Cyclotomic, Finite Fields, Kummer, Artin-Schreier | 4 | 8 |
| **Examples** | Q(zeta_n)/Q, Q(sqrt(2),sqrt(3)), F_{p^n}/F_p, Q(cuberoot(2)) | 2 | 6 |
| **Bridges** | Inverse Galois, Etale fundamental group, Computational Galois groups | 4 | 9 |

## Design principles

1. **Galois-first.** Every type centers on the Galois correspondence between subgroups and intermediate fields.
2. **Vocabulary, not proofs.** Major theorems (FTGT, solvability, cyclotomic, Kummer) are stated as axioms -- this package defines what Galois theory *is*.
3. **Lite focus.** Streamlined to core Galois theory: extensions, normality, separability, the correspondence, and solvability by radicals.
4. **Bridges to all domains.** Explicit modules connect Galois theory to group theory, algebra, topology (profinite groups), geometry (etale fundamental group), and computation.
