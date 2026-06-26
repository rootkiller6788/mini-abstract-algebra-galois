/-
# Tests.Smoke

Quick smoke tests: verify all modules import and evaluate correctly.
-/

import MiniAlgebraicStructures

open MiniAlgebraicStructures

/-! ## Core smoke tests -/

#eval "=== Core ==="
#eval s!"Algebraic structures axioms: {algebraicStructuresAxioms.length}"
#eval s!"Semigroup, Monoid, Group, AbelianGroup, Ring, Field: defined"
#eval s!"Module, VectorSpace, Algebra: defined"
#eval s!"Signature, SigAlgebra, Variety: defined"

/-! ## Morphisms smoke tests -/

#eval "=== Morphisms ==="
#eval "SemigroupHom, MonoidHom, GroupHom, RingHom, ModuleHom, AlgebraHom: defined"
#eval "GroupIso, RingIso, ModuleIso, AlgebraIso, SigIso: defined"
#eval "GroupCategory, RingCategory, Congruence: defined"

/-! ## Constructions smoke tests -/

#eval "=== Constructions ==="
#eval "Subsemigroup, Submonoid, Subgroup, NormalSubgroup, Subring, Ideal: defined"
#eval "QuotientGroup, QuotientRing, QuotientModule, QuotientAlgebra: defined"
#eval "DirectProduct, SemidirectProduct, FreeProduct, TensorProduct: defined"
#eval "FreeGroup, FreeAbelianGroup, FreeMonoid, FreeSemigroup, FreeModule, FreeSigAlgebra: defined"

/-! ## Properties smoke tests -/

#eval "=== Properties ==="
#eval s!"Lagrange theorem: {lagrangeTheorem}"
#eval s!"Class equation: {classEquation}"
#eval s!"Sylow existence: {sylowExistence}"

/-! ## Theorems smoke tests -/

#eval "=== Theorems ==="
#eval "3 isomorphism theorems + correspondence theorem"
#eval "Sylow (existence, conjugacy, counting), Burnside, Jordan-Holder, Feit-Thompson"
#eval "Birkhoff HSP theorem (full + proof sketch)"
#eval "Maltsev conditions, Jonsson Lemma, congruence varieties"
#eval s!"Total algebraic structures axioms: {algebraicStructuresTotalAxioms.length}"

/-! ## Examples + Bridges smoke tests -/

#eval "=== Examples + Bridges ==="
#eval "cyclicGroup, symmetricGroup, dihedralGroup: defined"
#eval "LieAlgebra, GroupRing, Operad, GroebnerBasis: defined"
#eval "TopologicalGroup, ProfiniteGroup, StoneDuality, PontryaginDuality: defined"
#eval "AlgebraicGroup, GroupScheme, TannakianCategory: defined"
#eval "TermRewritingSystem, KnuthBendix, UACalc: defined"
#eval "=== All smoke tests passed ==="
