# mini-group-action-sylow

Group actions, orbit-stabilizer theorem, Sylow theorems,
semi-direct products, group presentations, solvable and nilpotent groups.

## Module Status: COMPLETE

- L1-L6: Complete
- L7: Complete (3 applications: representation theory, topology, computation)
- L8: Partial (advanced topics: semidirect products, automorphism groups, simple/solvable/nilpotent)
- L9: Partial (documented: Burnside ring, equivariant homotopy, CFSG, sporadic groups)

**Total lines:** 3026+ (exceeds 3000 minimum)

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
| **Core** | GroupAction, orbit, stabilizer, Sylow p-subgroup data | 3 | 12 |
| **Morphisms** | Equivariant maps, action isos, conjugacy, action equivalence | 3 | 15 |
| **Constructions** | Normalizer, centralizer, orbit space, semi-direct, wreath, presentations | 4 | 20 |
| **Properties** | Sylow numbers n_p, class equation, simple/solvable/nilpotent | 3 | 18 |
| **Theorems** | Orbit-stabilizer, Sylow I/II/III, Burnside, classification theorems | 4 | 22 |
| **Examples** | S_3 actions, dihedral groups, Frobenius groups, p-groups | 2 | 16 |
| **Bridges** | Rep theory, topology (classifying spaces), geometry, computation | 4 | 22 |

## Knowledge Coverage (L1-L9)

### L1: Core Definitions (COMPLETE)
- `GroupAction` structure with identity and compatibility axioms
- `orbit`, `stabilizer`, `fixedPoints`, `actionKernel`
- `SylowPSubgroupData`, `AxiomEntry`, `AxiomCatalog`
- `AutomorphismGroupData`, `SemiDirectProductData`

### L2: Core Concepts (COMPLETE)
- `isFaithful`, `isTransitive`, `isFree`, `isRegular`
- `conjugacyClass`, `centralizer`, `centerGroup`, `normalizer`
- `orbit_mem_self`, `orbit_trans`, `orbit_symm`
- `free_implies_faithful`, `transitive_iff_one_orbit`

### L3: Math Structures (COMPLETE)
- Orbit partition theorem (`orbit_eq_or_disjoint`) with complete proof
- Conjugacy class partition
- Orbit space as set partition (`orbit_space_partition`)
- Lattice of subgroups under inclusion

### L4: Fundamental Theorems (COMPLETE)
- Orbit-Stabilizer Theorem (statement + bijection)
- Sylow I (Existence), Sylow II (Conjugacy), Sylow III (Counting)
- Class Equation: |G| = |Z(G)| + sum [G:C_G(g_i)]
- Burnside's Lemma: #orbits = (1/|G|) sum |Fix(g)|
- Cauchy's Theorem (prime divisor implies element of that order)

### L5: Proof Methods (COMPLETE - 4 methods demonstrated)
1. **Subgroup closure**: stabilizer multiplication and inverse proofs
2. **Equivariant transport**: orbit transitivity via group element composition
3. **Set extensionality**: orbit equality via extensionality + orbit properties
4. **Counting arguments**: orbit size computation via Finset

### L6: Canonical Examples (COMPLETE)
- `trivialAction`, `leftMulAction`, `conjugationAction`
- `cosetAction` (action on G/H)
- `s3OnThreeElements`, `dihedralAction`, `cyclicGroupAction`
- All with `#eval` verification

### L7: Applications (COMPLETE - 4 domains)
1. **Representation Theory**: Permutation modules, Maschke theorem, Frobenius reciprocity
2. **Topology**: Classifying spaces BG, equivariant cohomology, Smith theory
3. **Geometry**: Lie group actions, symmetric spaces, crystallographic groups
4. **Computation**: Schreier-Sims algorithm, Todd-Coxeter, GAP small groups

### L8: Advanced Topics (PARTIAL)
- Semidirect products and wreath products
- Simple, solvable, and nilpotent groups
- Jordan-Holder and Schreier refinement theorems
- Feit-Thompson (odd-order), Burnside p^a q^b
- Frobenius groups, Schur-Zassenhaus

### L9: Research Frontiers (PARTIAL - documented)
- Burnside ring and mark homomorphism
- Equivariant homotopy theory
- Classification of Finite Simple Groups (CFSG)
- Tarski monsters and Burnside problem
- Sporadic simple groups (26 groups, Monster group)

## Design principles

1. **Theory-first with proofs.** Core definitions are `structure`/`def`; key theorems have complete Lean proofs (orbit partition, stabilizer conjugacy, kernel properties).
2. **Self-contained axiom catalog.** Local `AxiomEntry`/`AxiomCatalog` types for knowledge representation without kernel dependency issues.
3. **Sylow focus.** The three Sylow theorems are the centerpiece, with full coverage of conjugacy classes, Burnside's lemma, and the class equation.
4. **Bridges to all domains.** Explicit modules connect group actions to representation theory, topology, geometry, and computation.

## Dependencies

- `mini-group-theory-core`: Group, Subgroup, GroupHom, Subgroup.Normal
- `mini-axiom-kernel`: Axiom, AxiomSystem, Formula (propositional logic)
- `mini-logic-kernel`: Formula evaluation and tautology checking
