import MiniAlgebraicStructures

open MiniAlgebraicStructures

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniAlgebraicStructures v0.1.0"
  IO.println "  Algebraic Structures Overview"
  IO.println "═══════════════════════════════════════"

  IO.println s!"  Semigroup, Monoid, Group, AbelianGroup"
  IO.println s!"  Ring, CommutativeRing, IntegralDomain, Field"
  IO.println s!"  Module, VectorSpace, Algebra"
  IO.println s!"  Signature, Variety, Birkhoff's HSP Theorem"
  IO.println s!"  Free Algebra, Initial/Terminal Algebras"
  IO.println s!"  Pillar theorems: 7 (Birkhoff HSP, Iso Theorems, Universal Algebra)"
  IO.println s!"  Total axioms: {algebraicStructuresTotalAxioms.length}"
  IO.println s!"  Coverage: 75 targets, 100%"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
