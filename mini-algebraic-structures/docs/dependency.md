# mini-algebraic-structures -- Dependency Graph

## Internal Dependencies

```
Core/Basic.lean       (imports external: MiniGroupTheoryCore, MiniRingTheoryCore, MiniFieldTheoryCore, MiniModuleTheory)
Core/Objects.lean     -> Core/Basic
Core/Laws.lean        -> Core/Basic, Core/Objects

Morphisms/Hom.lean    -> Core/Basic, Core/Laws
Morphisms/Iso.lean    -> Morphisms/Hom
Morphisms/Equivalence -> Morphisms/Iso

Constructions/Subobjects  -> Morphisms/Hom
Constructions/Quotients   -> Constructions/Subobjects
Constructions/Products    -> Morphisms/Iso
Constructions/Universal   -> Constructions/Products

Properties/Invariants       -> Morphisms/Iso, Constructions/Subobjects
Properties/Preservation     -> Properties/Invariants
Properties/ClassificationData -> Constructions/Universal

Theorems/Basic               -> Properties/Preservation
Theorems/UniversalProperties -> Theorems/Basic
Theorems/Classification      -> Theorems/UniversalProperties
Theorems/Main                -> Theorems/Classification

Examples/Standard       -> Theorems/Main
Examples/Counterexamples -> Examples/Standard

Bridges/ToAlgebra       -> Theorems/Main
Bridges/ToTopology      -> Theorems/Main
Bridges/ToGeometry      -> Theorems/Main
Bridges/ToComputation   -> Theorems/Main
```

## External Dependencies

This package requires (via lakefile.lean):
- `mini-group-theory-core` from `../mini-group-theory-core`
- `mini-ring-theory-core` from `../mini-ring-theory-core`
- `mini-field-theory-core` from `../mini-field-theory-core`
- `mini-module-theory` from `../mini-module-theory`

## Import Graph (condensed)

```
MiniGroupTheoryCore ───┐
MiniRingTheoryCore ────┤
MiniFieldTheoryCore ───┼── Core/Basic -> Core/Objects -> Core/Laws
MiniModuleTheory ──────┘       │
                                ├── Morphisms/Hom -> Morphisms/Iso -> Morphisms/Equivalence
                                │        │
                                ├── Constructions/Subobjects -> Constructions/Quotients
                                ├── Constructions/Products -> Constructions/Universal
                                │        │                │
                                ├── Properties/Invariants -> Properties/Preservation
                                ├── Properties/ClassificationData
                                │        │
                                ├── Theorems/Basic -> Theorems/UniversalProperties
                                │                          │
                                ├── Theorems/Classification -> Theorems/Main
                                │        │
                                ├── Examples/Standard -> Examples/Counterexamples
                                │        │
                                └── Bridges/ToAlgebra, ToTopology, ToGeometry, ToComputation
```
