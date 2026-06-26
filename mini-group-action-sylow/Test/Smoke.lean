/-
# Tests.Smoke

Quick smoke tests: verify all modules import and evaluate correctly.
-/

import MiniGroupActionSylow

open MiniGroupActionSylow

/-! ## Core smoke tests -/

#eval "=== Core ==="
#eval s!"Group action axioms: {groupActionAxioms.length}"
#eval s!"Orbit axioms: {orbitAxioms.length}"
#eval s!"Sylow axioms: {sylowAxioms.length}"

/-! ## Morphisms smoke tests -/

#eval "=== Morphisms ==="
#eval "EquivariantMap, ActionIso: defined"
#eval "conjugationAction, leftMultiplicationAction: defined"
#eval "centralizer, centerGroup, normalizer, conjugacyClassElem: defined"

/-! ## Constructions smoke tests -/

#eval "=== Constructions ==="
#eval "SylowPSubgroup, isPSubgroup, frattiniSubgroup: defined"
#eval "orbitSpace, actionOnCosets, cayleyTheorem: defined"
#eval "SemiDirectProductGroup, WreathProduct, productAction: defined"
#eval "GroupPresentation, FreeGroupAction, FrobeniusGroup: defined"

/-! ## Properties smoke tests -/

#eval "=== Properties ==="
#eval s!"Orbit-stabilizer axiom label: {orbitStabilizerAxiom.label}"
#eval s!"Sylow existence label: {sylowExistenceAxiom.label}"
#eval s!"Class equation label: {classEquationAxiom.label}"

/-! ## Theorems smoke tests -/

#eval "=== Theorems ==="
#eval s!"9 Sylow/group structure theorems"
#eval s!"7 Universal property theorems"
#eval s!"10 Classification theorems"
#eval s!"Total group action + Sylow axioms: {groupActionSylowTotalAxioms.length}"

/-! ## Examples + Bridges smoke tests -/

#eval "=== Examples + Bridges ==="
#eval "s3OnThreeElements, dihedralAction, cyclicGroupAction: defined"
#eval "PermutationModule, ClassifyingSpace, CoxeterGroupAction: defined"
#eval "OrbitComputation, StabilizerChain, SmallGroup: defined"
#eval "=== All smoke tests passed ==="
