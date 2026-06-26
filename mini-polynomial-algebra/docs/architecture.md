# Architecture: mini-polynomial-algebra

## Package Structure

```
mini-polynomial-algebra/
├── lakefile.lean          # Lake build configuration
├── lean-toolchain         # Lean version pinning
├── Main.lean              # Entry point
├── MiniPolynomialAlgebra.lean # Module root (imports all)
├── MiniPolynomialAlgebra/
│   ├── Core/
│   │   ├── Basic.lean     # Polynomial, degree, division, irreducibility
│   │   ├── Laws.lean      # Ring laws for polynomial ring
│   │   └── Objects.lean   # Polynomial objects and special families
│   ├── Constructions/
│   │   ├── Products.lean  # Product polynomial rings, multivariate polynomials
│   │   ├── Quotients.lean # Quotient by ideal, field extensions as quotients
│   │   ├── Subobjects.lean # Subrings, ideals of polynomial rings
│   │   └── Universal.lean # Universal property of polynomial ring
│   ├── Morphisms/
│   │   ├── Hom.lean       # Polynomial ring homomorphisms
│   │   ├── Iso.lean       # Isomorphisms of polynomial rings
│   │   └── Equivalence.lean # Equivalence of polynomial categories
│   ├── Properties/
│   │   ├── Invariants.lean # Degree, content, resultant, discriminant
│   │   ├── Preservation.lean # Properties preserved by operations
│   │   └── ClassificationData.lean # Classification by degree, Galois group
│   ├── Theorems/
│   │   ├── Basic.lean     # Fundamental theorems (division, factor, FTA)
│   │   ├── Main.lean      # Gauss Lemma, Eisenstein, UFD, symmetric poly
│   │   ├── Classification.lean # Irreducible classification, cyclotomic, Abel-Ruffini
│   │   └── UniversalProperties.lean # Hilbert basis, structure theorems
│   ├── Examples/
│   │   ├── Standard.lean  # Standard polynomial examples
│   │   └── Counterexamples.lean # Counterexamples
│   └── Bridges/
│       ├── ToAlgebra.lean   # Galois theory, algebraic integers, Dedekind domains
│       ├── ToGeometry.lean  # Algebraic curves, Bezout, elliptic curves
│       ├── ToTopology.lean  # Zariski topology, Stone-Weierstrass
│       └── ToComputation.lean # FFT, GCD, factorization algorithms, Groebner
├── Test/
│   ├── Smoke.lean         # Import and basic compile check
│   ├── Regression.lean    # Core theorem regression
│   └── Examples.lean      # Example-based tests
├── Benchmark/
│   ├── CoreCoverage.lean  # Core definition/theorem coverage
│   ├── MIT.lean           # MIT 18.702 benchmark
│   ├── Harvard.lean       # Harvard Math 123/221 benchmark
│   ├── Princeton.lean     # Princeton MAT 345 benchmark
│   ├── CambridgePartIII.lean # Cambridge Part III benchmark
│   └── OxfordPartC.lean   # Oxford Part C benchmark
├── Computation/
│   ├── notebooks/         # Jupyter notebooks (placeholder)
│   ├── python/            # Python computation (placeholder)
│   └── sage/              # Sage computation (placeholder)
├── docs/
│   ├── architecture.md    # This file
│   ├── coverage.md        # Coverage tracking
│   └── dependency.md      # Dependency graph
└── scripts/
    ├── check.ps1          # Windows check script
    └── check.sh           # Unix check script
```

## Dependencies

- `mini-ring-theory-core`: Ring, Ideal, CommRing, IntegralDomain definitions
- `mini-field-theory-core`: Field, FieldExtension, FiniteField definitions

## Core Design

1. **Polynomial**: Represented as list of coefficients (constant term first)
2. **Degree**: Integer-valued, with degree(zero) = -1 (or -∞ conceptually)
3. **Division Algorithm**: Euclidean division over fields, existence and uniqueness
4. **Irreducibility**: Defined as degree > 0 and only trivial factorizations
5. **Minimal Polynomial**: For algebraic elements over a base field
6. **Eisenstein Criterion**: Sufficient condition for irreducibility over UFD
7. **Polynomial Ring**: Ring structure on polynomials with pointwise addition and convolution multiplication
