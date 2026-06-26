# Mini Abstract Algebra & Galois Theory

A collection of **from-scratch, zero-dependency Lean 4 implementations** of university-level abstract algebra, group theory, ring theory, field theory, and Galois theory. Each sub-package maps to MIT (and other top-tier university) courses, building the foundations of abstract algebra from first principles using the Lean 4 proof assistant.

## Sub-Packages

| Sub-Package | Topics | Key Courses |
|-------------|--------|-------------|
| [mini-group-theory-core](mini-group-theory-core/) | Groups, subgroups, normal subgroups, quotients, homomorphisms | MIT 18.701, Harvard Math 122 |
| [mini-ring-theory-core](mini-ring-theory-core/) | Rings, ideals, quotient rings, integral domains, units | MIT 18.702, Berkeley Math 113 |
| [mini-field-theory-core](mini-field-theory-core/) | Fields, field extensions, algebraic/transcendental, characteristic | MIT 18.702, Princeton MAT 345 |
| [mini-module-theory](mini-module-theory/) | Modules, submodules, exact sequences, structure theorems | MIT 18.705, Cambridge Part II |
| [mini-polynomial-algebra](mini-polynomial-algebra/) | Polynomial rings, factorization, irreducibility criteria | MIT 18.702, Harvard Math 123 |
| [mini-galois-theory-lite](mini-galois-theory-lite/) | Galois groups, fundamental theorem, solvability by radicals | MIT 18.702, Princeton MAT 346 |
| [mini-group-action-sylow](mini-group-action-sylow/) | Group actions, orbits/stabilizers, Sylow theorems, p-groups | MIT 18.701, Berkeley Math 114 |
| [mini-algebraic-structures](mini-algebraic-structures/) | Universal algebra, varieties, Birkhoff HSP theorem, lattice of subalgebras | MIT 18.704, Oxford Part C |

## Design Philosophy

- **Zero external dependencies** -- pure Lean 4, only kernel imports
- **Self-contained sub-packages** -- each has its own `lakefile.lean`, Core/, Morphisms/, Constructions/, Properties/, Theorems/
- **Theory-to-code mapping** -- every module includes inline `#eval` examples and theorem statements
- **Galois focus** -- the Fundamental Theorem of Galois Theory is the centerpiece, with coverage of cyclotomic, Kummer, and Artin-Schreier theory

## Building

Each sub-package is standalone. Build with Lake:

```bash
cd mini-group-theory-core
lake build
lake env lean --run Test/Smoke.lean
```

Requires **Lean 4** and **Lake**.

## Project Structure

```
4. mini-abstract-algebra-galois/
├── mini-group-theory-core/          # Groups, subgroups, normal subgroups, quotients
├── mini-ring-theory-core/           # Rings, ideals, quotient rings, integral domains
├── mini-field-theory-core/          # Fields, field extensions, algebraic/transcendental
├── mini-module-theory/              # Modules, submodules, exact sequences
├── mini-polynomial-algebra/         # Polynomial rings, factorization, irreducibility
├── mini-galois-theory-lite/         # Galois groups, fundamental theorem, solvability
├── mini-group-action-sylow/         # Group actions, orbits/stabilizers, Sylow theorems
├── mini-algebraic-structures/       # Universal algebra, varieties, Birkhoff HSP
└── lakefile.lean
```

## License

MIT
