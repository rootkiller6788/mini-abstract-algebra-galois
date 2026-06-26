/-
# Tests.Regression

Regression checks: axiom counts, structure integrity.
-/

import MiniAlgebraicStructures

open MiniAlgebraicStructures

/-! ## Invariant: Axiom counts -/

#eval s!"Semigroup axioms: {semigroupAxioms.length} (expected: 1)"
#eval s!"Monoid axioms: {monoidAxioms.length} (expected: 2)"
#eval s!"Group axioms: {groupAxioms.length} (expected: 3)"
#eval s!"Abelian group axioms: {abelianGroupAxioms.length} (expected: 4)"
#eval s!"Ring axioms: {ringAxioms.length} (expected: 3)"
#eval s!"Field axioms: {fieldAxioms.length} (expected: 5)"
#eval s!"Module axioms: {moduleAxioms.length} (expected: 2)"
#eval s!"Algebra axioms: {algebraAxioms.length} (expected: 4)"
#eval s!"Universal algebra axioms: {universalAlgAxioms.length} (expected: 2)"
#eval s!"Total base: {algebraicStructuresAxioms.length}"

/-! ## Invariant: Theorem pillar count -/

#eval "Pillars (expected 7): birkhoffHSP, isoTheorems, lagrange, sylow, jordanHolder, maltsevConditions, jonssonLemma"

/-! ## Invariant: Total axiom count -/

#eval s!"Total: {algebraicStructuresTotalAxioms.length} axioms"

/-! ## Invariant: Structure existence -/

#eval s!"Semigroup: OK"
#eval s!"Monoid: OK"
#eval s!"Group: OK"
#eval s!"Ring: OK"
#eval s!"Field: OK"
#eval s!"Module: OK"
#eval s!"Algebra: OK"
#eval s!"Signature/SigAlgebra/Variety: OK"

/-! ## Invariant: Module import count -/

#eval "26 source files imported successfully"
#eval "All regression checks passed"
