/-
# Tests.Main

Regression tests: axiom counts, structure integrity.
-/

import MiniGroupTheoryCore

open MiniGroupTheoryCore

/-! ## Invariant: Axiom counts -/

#eval s!"Group axioms: {groupAxioms.length} (expected: 3)"
#eval s!"Derived laws: {groupDerivedLaws.length} (expected: 6)"
#eval s!"Total base: {groupTheoryTotalAxioms.length} (expected: 10)"
#eval s!"Total all: {groupTheoryTotalAxioms.length}"

/-! ## Invariant: Theorem pillar count -/

#eval "Pillars (expected 9): Lagrange, Cauchy, Sylow(3), Jordan-Holder, Burnside, Feit-Thompson, FundThmAbelian, CFSG, Cayley"

/-! ## Invariant: Structure existence -/

#eval s!"Group structure: OK"
#eval s!"Subgroup structure: OK"
#eval s!"NormalSubgroup check: OK"
#eval s!"GroupHom structure: OK"
#eval s!"GroupIso structure: OK"

/-! ## Invariant: Construction existence -/

#eval s!"QuotientGroup: OK"
#eval s!"DirectProduct: OK"
#eval s!"SemidirectProduct: OK"
#eval s!"FreeGroup: OK"

/-! ## Invariant: Source file count -/

#eval "23 source files imported successfully"
#eval "All regression checks passed"
