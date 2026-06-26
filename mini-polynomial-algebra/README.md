# mini-polynomial-algebra

Polynomial algebra library for Lean 4.

Part of the `mini-abstract-algebra-galois` ecosystem.

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
│   │   └── Objects.lean   # Polynomial objects and data
│   ├── Constructions/
│   │   ├── Products.lean  # Product of polynomial rings
│   │   ├── Quotients.lean # Quotient by polynomial ideal
│   │   ├── Subobjects.lean # Subrings, ideals of polynomial rings
│   │   └── Universal.lean # Universal property of polynomial ring
│   ├── Morphisms/
│   │   ├── Hom.lean       # Polynomial ring homomorphisms
│   │   ├── Iso.lean       # Isomorphisms of polynomial rings
│   │   └── Equivalence.lean # Equivalence of polynomial categories
│   ├── Properties/
│   │   ├── Invariants.lean # Degree, content, primitive part
│   │   ├── Preservation.lean # Properties preserved by operations
│   │   └── ClassificationData.lean # Classification by degree, irreducibility
│   ├── Theorems/
│   │   ├── Basic.lean     # Fundamental theorems
│   │   ├── Main.lean      # Main theorems: Gauss lemma, Eisenstein
│   │   ├── Classification.lean # Classification of irreducible polynomials
│   │   └── UniversalProperties.lean # Universal property theorems
│   ├── Examples/
│   │   ├── Standard.lean  # Standard examples
│   │   └── Counterexamples.lean # Counterexamples
│   └── Bridges/
│       ├── ToAlgebra.lean   # Connection to abstract algebra
│       ├── ToGeometry.lean  # Connection to algebraic geometry
│       ├── ToTopology.lean  # Connection to topology
│       └── ToComputation.lean # Connection to computational algebra
├── Test/
│   ├── Smoke.lean         # Import and basic compile check
│   ├── Regression.lean    # Core theorem regression
│   └── Examples.lean      # Example-based tests
├── Benchmark/
│   ├── CoreCoverage.lean  # Core definition/theorem coverage
│   ├── MIT.lean           # MIT 18.700 benchmark
│   ├── Harvard.lean       # Harvard Math 123 benchmark
│   ├── Princeton.lean     # Princeton MAT 345 benchmark
│   ├── CambridgePartIII.lean # Cambridge Part III benchmark
│   └── OxfordPartC.lean   # Oxford Part C benchmark
├── Computation/
│   ├── notebooks/         # Jupyter notebooks (placeholder)
│   ├── python/            # Python computation (placeholder)
│   └── sage/              # Sage computation (placeholder)
├── docs/
│   ├── architecture.md    # Architecture documentation
│   ├── coverage.md        # Coverage tracking
│   └── dependency.md      # Dependency graph
└── scripts/
    ├── check.ps1          # Windows check script
    └── check.sh           # Unix check script
```

## Dependencies

- `mini-ring-theory-core`: Ring, Ideal definitions
- `mini-field-theory-core`: Field, FieldExtension definitions

## Core Design

1. **Polynomial**: Represented as list of coefficients from constant term up
2. **Degree**: Nonnegative integer degree of polynomial
3. **Division Algorithm**: Euclidean division for polynomials over fields
4. **Irreducibility**: Definition and criteria (Eisenstein, rational root)
5. **Minimal Polynomial**: Minimal polynomial of an algebraic element
