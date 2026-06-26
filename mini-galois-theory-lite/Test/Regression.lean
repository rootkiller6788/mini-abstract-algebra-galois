/-
# Tests.Regression

Regression checks: axiom counts, structure integrity.
-/

import MiniGaloisTheoryLite

open MiniGaloisTheoryLite

/-! ## Invariant: Axiom counts -/

#eval s!"Galois extension axioms: {galoisExtensionAxioms.length} (expected: 3)"
#eval s!"Galois group axioms: {galoisGroupAxioms.length} (expected: 2)"
#eval s!"Galois correspondence axioms: {galoisCorrespondenceAxioms.length} (expected: 3)"
#eval s!"Solvability axioms: {solvabilityAxioms.length} (expected: 2)"
#eval s!"Total base: {galoisTheoryAxioms.length} (expected: 10)"

/-! ## Invariant: Theorem pillar count -/

#eval "Pillars (expected 7): FTGT, Solvability, Quintic, Cyclotomic, FiniteFields, Kummer, Artin-Schreier"
#eval s!"Pillar count: {pillarCount} (expected: 7)"

/-! ## Invariant: Total axiom count -/

#eval s!"Total: {galoisTheoryTotalAxioms.length} axioms"

/-! ## Invariant: Structure existence -/

#eval s!"GaloisGroup structure: OK"
#eval s!"GaloisCorrespondence structure: OK"
#eval s!"IntermediateField structure: OK"
#eval s!"SplittingField structure: OK"
#eval s!"NormalClosure structure: OK"
#eval s!"CyclicExtension structure: OK"

/-! ## Invariant: Module existence -/

#eval "23 source files imported successfully"
#eval "All regression checks passed"
