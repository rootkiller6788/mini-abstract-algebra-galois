# mini-group-action-sylow — Dependency Graph

## Internal Dependencies

```
Core/Basic.lean       (imports MiniGroupTheoryCore)
Core/Objects.lean     → Core/Basic
Core/Laws.lean        → Core/Basic, Core/Objects

Morphisms/Hom.lean    → Core/Basic, Core/Laws
Morphisms/Iso.lean    → Morphisms/Hom
Morphisms/Equivalence → Morphisms/Iso

Constructions/Subobjects  → Morphisms/Hom
Constructions/Quotients   → Constructions/Subobjects
Constructions/Products    → Morphisms/Iso
Constructions/Universal   → Constructions/Products

Properties/Invariants       → Morphisms/Iso, Constructions/Subobjects
Properties/Preservation     → Properties/Invariants
Properties/ClassificationData → Constructions/Universal

Theorems/Basic               → Properties/Preservation
Theorems/UniversalProperties → Theorems/Basic
Theorems/Classification      → Theorems/UniversalProperties
Theorems/Main                → Theorems/Classification

Examples/Standard       → Theorems/Main
Examples/Counterexamples → Examples/Standard

Bridges/ToAlgebra       → Theorems/Main
Bridges/ToTopology      → Theorems/Main
Bridges/ToGeometry      → Theorems/Main
Bridges/ToComputation   → Theorems/Main
```

## External Dependencies

All modules import `MiniGroupTheoryCore` (the mini-group-theory-core sub-package),
which in turn depends on `MiniObjectKernel` (the kernel package from 0. mini-math-kernel).

## Import Graph (condensed)

```
MiniObjectKernel ← MiniGroupTheoryCore ← MiniGroupActionSylow/Core/Basic
   ↑                                          ↓
   |         ← Core/Objects ← Core/Laws
   |                 ↓
   |         ← Morphisms/Hom ← Morphisms/Iso ← Morphisms/Equivalence
   |                 ↓                ↓                ↓
   |         ← Constructions/*  ←  Properties/*
   |                 ↓                ↓
   |         ← Theorems/*  ←  Examples/*  ←  Bridges/*
MiniGroupTheoryCore (Group, Subgroup, GroupHom, etc.)
```
