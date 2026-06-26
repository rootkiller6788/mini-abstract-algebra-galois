# mini-group-action-sylow

Group actions, orbit-stabilizer theorem, Sylow theorems,
semi-direct products, group presentations, solvable and nilpotent groups.

## Quick Start

```bash
cd "4. mini-abstract-algebra-galois/mini-group-action-sylow"

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
| **Core** | GroupAction, orbit, stabilizer, Sylow p-subgroup data | 3 | 4 |
| **Morphisms** | Equivariant maps, action isos, conjugacy, action equivalence | 3 | 5 |
| **Constructions** | Normalizer, centralizer, orbit space, semi-direct, wreath, presentations | 4 | 8 |
| **Properties** | Sylow numbers n_p, class equation, simple/solvable/nilpotent | 3 | 7 |
| **Theorems** | Orbit-stabilizer, Sylow I/II/III, Burnside, classification theorems | 4 | 8 |
| **Examples** | S_3 actions, dihedral groups, Frobenius groups, p-groups | 2 | 6 |
| **Bridges** | Rep theory, topology (classifying spaces), geometry, computation | 4 | 9 |

## Design principles

1. **Theory-first.** Every type is a kernel `Object`; axioms use kernel `AxiomSystem`.
2. **Vocabulary, not proofs.** Major theorems (Orbit-Stabilizer, Sylow I/II/III, Class Equation) are stated as axioms -- this package defines what group action theory *is*.
3. **Sylow focus.** The three Sylow theorems are the centerpiece, with full coverage of conjugacy classes, Burnside's lemma, and the class equation.
4. **Bridges to all domains.** Explicit modules connect group actions to representation theory, topology (classifying spaces), geometry, and computation (GAP, permutation groups).
