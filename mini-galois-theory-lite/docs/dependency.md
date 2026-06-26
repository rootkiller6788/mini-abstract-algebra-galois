# mini-galois-theory-lite -- Dependency Graph

## Internal Dependencies

```
Core/Basic.lean       (no internal deps -- imports MiniGroupTheoryCore, MiniFieldTheoryCore, MiniPolynomialAlgebra)
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

- **MiniGroupTheoryCore** -- Group, Subgroup, GroupHom, GroupIso (from `mini-group-theory-core`)
- **MiniFieldTheoryCore** -- Field, FieldExtension, FieldHom, FieldAutomorphism (from `mini-field-theory-core`)
- **MiniPolynomialAlgebra** -- Polynomial, splitting fields, algebraic closures (from `mini-polynomial-algebra`)

## Import Graph (condensed)

```
MiniGroupTheoryCore + MiniFieldTheoryCore + MiniPolynomialAlgebra
    |
    v
Core/Basic -> Core/Objects -> Core/Laws
    |              |              |
    v              v              v
Morphisms/Hom -> Morphisms/Iso -> Morphisms/Equivalence
    |              |              |
    v              v              v
Constructions/*  <--  Properties/*
    |              |
    v              v
Theorems/*  -->  Examples/*  -->  Bridges/*
```

## Package Dependency

```
mini-galois-theory-lite
  requires:
    mini-field-theory-core   (from "../mini-field-theory-core")
    mini-group-theory-core   (from "../mini-group-theory-core")
    mini-polynomial-algebra  (from "../mini-polynomial-algebra")
```
