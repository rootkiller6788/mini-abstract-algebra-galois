# mini-group-theory-core -- Dependencies

## External Dependencies

| Package | Path | Role |
|---------|------|------|
| `mini-object-kernel` | `../../0. mini-math-kernel/mini-object-kernel` | Object, TheoryName, Axiom, AxiomSystem, Formula, Dependency |

## Internal Dependency Graph (import order)

```
Core.Basic ← Core.Objects ← Core.Laws
    ↓
Morphisms.Hom ← Morphisms.Iso ← Morphisms.Equivalence
    ↓
Constructions.Subobjects ← Constructions.Quotients
    ↓                         ↓
Constructions.Products ← Constructions.Universal
    ↓
Properties.Invariants ← Properties.Preservation ← Properties.ClassificationData
    ↓
Theorems.Basic ← Theorems.UniversalProperties ← Theorems.Classification ← Theorems.Main
    ↓
Examples.Standard ← Examples.Counterexamples
    ↓
Bridges.ToAlgebra ← Bridges.ToTopology ← Bridges.ToGeometry ← Bridges.ToComputation
```

## File Count Summary

| Category | Count |
|----------|-------|
| Source (.lean in MiniGroupTheoryCore/) | 23 |
| Test (.lean) | 3 |
| Benchmark (.lean) | 6 |
| Documentation (.md) | 3 |
| Scripts (.ps1) | 2 |
| Computation (.lean) | 3 |
| Root files | 5 |
| **Total** | **45** |
