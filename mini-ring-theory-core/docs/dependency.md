# mini-ring-theory-core — Dependency Graph

## Internal Dependencies

```
Core/Basic.lean              (depends on MiniGroupTheoryCore.Core.Basic)
Core/Objects.lean            → Core/Basic
Core/Laws.lean               → Core/Basic, Core/Objects

Morphisms/Hom.lean           → Core/Basic
Morphisms/Iso.lean           → Core/Basic
Morphisms/Equivalence.lean   → Core/Basic

Constructions/Subobjects.lean → Core/Basic, Core/Objects
Constructions/Quotients.lean  → Core/Basic, Core/Objects
Constructions/Products.lean   → Core/Basic
Constructions/Universal.lean  → Core/Basic, Morphisms/Hom

Properties/Invariants.lean       → Core/Basic
Properties/Preservation.lean     → Core/Basic, Morphisms/Hom
Properties/ClassificationData.lean → Core/Basic

Theorems/Basic.lean               → Core/Basic
Theorems/UniversalProperties.lean → Constructions/Universal
Theorems/Classification.lean      → Properties/ClassificationData
Theorems/Main.lean                → Theorems/Basic, Theorems/Classification

Examples/Standard.lean        → Core/Basic
Examples/Counterexamples.lean → Core/Basic

Bridges/*.lean → Core/Basic
```

## External Dependencies

- `mini-group-theory-core` — group theory base structures
- `mini-object-kernel` — object typeclass for cross-domain compatibility
