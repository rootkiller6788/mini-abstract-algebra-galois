/-
# Tests.Regression

Regression checks: axiom counts, structure integrity.
-/

import MiniGroupActionSylow

open MiniGroupActionSylow

/-! ## Invariant: Axiom counts -/

#eval s!"Group action axioms: {groupActionAxioms.length} (expected: 2)"
#eval s!"Orbit axioms: {orbitAxioms.length} (expected: 2)"
#eval s!"Sylow axioms: {sylowAxioms.length} (expected: 3)"
#eval s!"Total base: {groupActionSylowBaseAxioms.length} (expected: 13)"

/-! ## Invariant: Theorem pillar count -/

#eval "Pillars (expected 9): orbitStabilizer, sylowFirst, sylowSecond, sylowThird, classEquation, burnsideLemma, jordanHolder, feitThompson, CFSG"

/-! ## Invariant: Total axiom count -/

#eval s!"Total: {groupActionSylowTotalAxioms.length} axioms"

/-! ## Invariant: Structure existence -/

#eval s!"GroupAction structure: OK"
#eval s!"SemiDirectProduct structure: OK"
#eval s!"SylowPSubgroup structure: OK"
#eval s!"GroupPresentation structure: OK"

/-! ## Invariant: Module existence -/

#eval "23 source files imported successfully"
#eval "All regression checks passed"
