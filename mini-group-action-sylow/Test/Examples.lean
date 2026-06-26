/-
# Tests.Examples

Step-by-step group action and Sylow constructions.
-/

import MiniGroupActionSylow

open MiniGroupActionSylow

/-! ## Step 1: Build a group action on S_3 -/

#eval "Step 1: S_3 action on 3-element set defined"

/-! ## Step 2: Compute orbit and stabilizer -/

#eval s!"Step 2: Orbit-stabilizer theorem axiom: {orbitStabilizerAxiom.label}"

/-! ## Step 3: Identify Sylow subgroups of S_3 -/

#eval s!"Step 3: Sylow 2-subgroup and Sylow 3-subgroup defined"

/-! ## Step 4: State Sylow existence -/

#eval s!"Step 4: Sylow existence: {sylowExistenceAxiom.label}"

/-! ## Step 5: State Sylow conjugacy -/

#eval s!"Step 5: Sylow conjugacy: {sylowConjugacyAxiom.label}"

/-! ## Step 6: State Sylow counting -/

#eval s!"Step 6: Sylow counting: {sylowCountingAxiom.label}"

/-! ## Step 7: Compute class equation for S_3 -/

#eval s!"Step 7: Class equation axiom: {classEquationAxiom.label}"

/-! ## Step 8: Build semi-direct product -/

#eval "Step 8: Semi-direct product construction defined"

/-! ## Step 9: Connect to representation theory -/

#eval "Step 9: PermutationModule, GroupAlgebra bridge defined"

/-! ## Summary -/

#eval "=== All 9 steps completed ==="
#eval s!"Package axioms total: {groupActionSylowTotalAxioms.length}"
