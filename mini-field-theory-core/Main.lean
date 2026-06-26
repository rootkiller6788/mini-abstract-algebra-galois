import MiniFieldTheoryCore

open MiniFieldTheoryCore

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniFieldTheoryCore v0.1.0"
  IO.println "  Field Theory Core"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  Field: commutative ring with multiplicative inverses"
  IO.println s!"  FieldExtension: base field embedded in extension field"
  IO.println s!"  Algebraic/Transcendental elements"
  IO.println s!"  Characteristic of a field"
  IO.println s!"  PrimeField: Q if char 0, F_p if char p"
  IO.println s!"  SplittingField, FieldAutomorphism, FiniteField basics"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
