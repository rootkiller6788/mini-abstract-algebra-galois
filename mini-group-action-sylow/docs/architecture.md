# mini-group-action-sylow — Architecture

## Dependency Graph

```
MiniGroupTheoryCore (Group, Subgroup, GroupHom, etc.)
  └── MiniGroupActionSylow
        ├── Core/
        │     ├── Basic.lean          GroupAction, orbit, stabilizer, Sylow, SemiDirectProduct
        │     ├── Objects.lean        Object instances, TheoryName
        │     └── Laws.lean           13 axioms (action, orbit, Sylow, class, burnside, classification)
        ├── Morphisms/
        │     ├── Hom.lean            EquivariantMap, fixedPoints, faithfulness, transitivity
        │     ├── Iso.lean            ActionIso, automorphism group, conjugation action
        │     └── Equivalence.lean    Conjugacy classes, centralizer, normalizer, center
        ├── Constructions/
        │     ├── Subobjects.lean     SylowPSubgroup, commutator, frattini, fitting, core
        │     ├── Quotients.lean      Orbit space, action on cosets, Cayley's theorem
        │     ├── Products.lean       Semi-direct, wreath, direct product actions, induced actions
        │     └── Universal.lean      Group presentations, Frobenius groups, transfer, amalgams
        ├── Properties/
        │     ├── Invariants.lean     Sylow numbers n_p, orbit lengths, Lagrange, class eq, Cauchy
        │     ├── Preservation.lean   Transitivity/sylow/orbits under equivariant maps
        │     └── ClassificationData.lean  Simple/Solvable/Nilpotent, p-groups, Burnside p^a q^b
        ├── Theorems/
        │     ├── Basic.lean          Orbit-stabilizer, Sylow I/II/III, Burnside, class eq
        │     ├── UniversalProperties.lean  Semi-direct, free group, orbit category, Yoneda
        │     ├── Classification.lean Jordan-Holder, Feit-Thompson, Hall, Wielandt, CFSG
        │     └── Main.lean           9 pillars, total axiom inventory
        ├── Examples/
        │     ├── Standard.lean       S_3, D_n, cyclic actions, Sylow subgroups of S_3/S_4/A_4
        │     └── Counterexamples.lean A_5 simple/not solvable, S_3 not nilpotent, Tarski monster
        ├── Bridges/
        │     ├── ToAlgebra.lean      Permutation modules, Maschke, Mackey, Clifford
        │     ├── ToTopology.lean     Classifying spaces, Borel construction, equivariant cohomology
        │     ├── ToGeometry.lean     Group actions on manifolds, Coxeter, symmetric spaces
        │     └── ToComputation.lean  Orbit algorithm, Schreier-Sims, Sylow computation, GAP
        ├── Test/                     Smoke, Examples, Regression
        ├── Benchmark/                CoreCoverage (105 targets) + 5 school benchmarks
        └── Root: MiniGroupActionSylow.lean, Main.lean, README.md
```

## Layer Map

| Layer | Files | Purpose |
|-------|-------|---------|
| **Core** (3) | Basic, Objects, Laws | GroupAction→orbit→Sylow, 13 axioms |
| **Morphisms** (3) | Hom, Iso, Equivalence | Equivariant maps, action isos, conjugacy |
| **Constructions** (4) | Subobjects, Quotients, Products, Universal | Sylow subgroups, orbit space, semi-direct, presentations |
| **Properties** (3) | Invariants, Preservation, ClassificationData | n_p, class eq, simple/solvable/nilpotent |
| **Theorems** (4) | Basic, UniversalProperties, Classification, Main | Orbit-stabilizer, Sylow I/II/III, CFSG, 9 pillars |
| **Examples** (2) | Standard, Counterexamples | S_3/D_n/cyclic actions, A_5 counterexamples |
| **Bridges** (4) | Algebra, Topology, Geometry, Computation | Rep theory → classifying spaces → manifolds → GAP |

## Axiom Inventory

| Group | Count | Axioms |
|-------|-------|--------|
| Action axioms | 2 | identity, compatibility |
| Orbit axioms | 2 | orbit-stabilizer, orbit partition |
| Sylow axioms | 3 | existence, conjugacy, counting |
| Class/Burnside | 2 | class equation, Burnside's lemma |
| Classification | 3 | Feit-Thompson, Jordan-Holder, Schreier |
| Theorem axioms | ~30 | Orbit-stabilizer, Sylow I/II/III, Lagrange, Cauchy, Burnside, Jordan-Holder, Feit-Thompson, Burnside p^a q^b, Hall, Wielandt, CFSG, universal properties (7), etc. |
| **Total** | **~48** | |
