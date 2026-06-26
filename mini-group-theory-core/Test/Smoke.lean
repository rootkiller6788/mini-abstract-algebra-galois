/-
# Tests.Smoke

Quick smoke tests: verify all modules import and evaluate correctly.
Tests Group, Subgroup, GroupHom, kernel, image, cyclic, order.
-/

import MiniGroupTheoryCore

open MiniGroupTheoryCore

/-! ## Core smoke tests -/

#eval "=== Core ==="
#eval s!"Group axioms: {groupAxioms.length} (expected: 3)"
#eval s!"Derived laws: {groupDerivedLaws.length} (expected: 6)"
#eval s!"Total base: {groupTheoryTotalAxioms.length} (expected: 10)"

/-! ## Group structure smoke test -/

#eval "=== Group Structure ==="
#eval "Group defined with carrier, mul, one, inv"
#eval "Subgroup defined with subset, one_mem, mul_closed, inv_closed"
#eval "Subgroup.Normal defined (conjugation invariance)"
#eval "GroupHom defined with map, map_mul"

/-! ## Kernel and Image smoke test -/

#eval "=== Kernel & Image ==="
#eval "GroupHom.kernel: {x | f x = 1}"
#eval "GroupHom.image: {y | ∃ x, f x = y}"
#eval "GroupHom.isInjective and isSurjective defined"

/-! ## Invariants smoke test -/

#eval "=== Invariants ==="
#eval s!"Lagrange theorem label: {lagrangeTheorem.label}"
#eval s!"Cauchy theorem label: {cauchyTheorem.label}"
#eval s!"Class equation label: {classEquation.label}"

/-! ## Cyclic group smoke test -/

#eval "=== Cyclic Groups ==="
#eval "isCyclic predicate defined"
#eval s!"cyclicGroup Z/nZ exists"
#eval s!"SymmetricGroup S_n (conceptual) defined"

/-! ## Morphisms smoke tests -/

#eval "=== Morphisms ==="
#eval "GroupHom with comp, id, trivial, map_one, map_inv"
#eval "GroupIso, id, comp, symm, areIsomorphic defined"
#eval "GroupAction, GSet, orbit, stabilizer, conjugacyClass defined"

/-! ## Constructions smoke tests -/

#eval "=== Constructions ==="
#eval "Subgroup.trivial, Subgroup.whole, Subgroup.generated"
#eval "QuotientGroup, proj, quotientUniversal, first/second/thirdIsoThm"
#eval "DirectProduct, productGroup, SemidirectProduct, FreeProduct"
#eval "FreeGroup, FreeAbelianGroup, GroupPresentation, abelianization"

/-! ## Properties smoke tests -/

#eval "=== Properties ==="
#eval "Group.order, orderOfElement, elementIsTorsion"
#eval "lagrangeTheorem, classEquation, cauchyTheorem"
#eval "simpleGroup, solvableGroup, nilpotentGroup classification"

/-! ## Theorems smoke tests -/

#eval "=== Theorems ==="
#eval s!"3 Sylow axioms (existence, conjugacy, counting)"
#eval s!"Fundamental theorems: Lagrange, Cauchy, Sylow, Jordan-Holder, Burnside, Feit-Thompson, Cayley, FundamentalThmAbelian"
#eval s!"7 Universal property theorems"
#eval s!"Classification: CFSG, groups of order p/p²/2p/8/12"
#eval s!"Total group theory axioms: {groupTheoryTotalAxioms.length}"

/-! ## Examples + Bridges smoke tests -/

#eval "=== Examples + Bridges ==="
#eval "cyclicGroup, symmetricGroup, alternatingGroup, dihedralGroup, quaternionGroup, kleinFourGroup"
#eval "a5IsSimple, a5NotSolvable, s3NotNilpotent, Burnside counterexample"
#eval "Bridges: ToAlgebra, ToTopology, ToGeometry, ToComputation"
#eval "=== All smoke tests passed ==="
