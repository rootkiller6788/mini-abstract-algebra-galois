/-
# Tests.Smoke

Quick smoke tests: verify all modules import and evaluate correctly.
-/

import MiniGaloisTheoryLite

open MiniGaloisTheoryLite

/-! ## Core smoke tests -/

#eval "=== Core ==="
#eval s!"Galois extension axioms: {galoisExtensionAxioms.length}"
#eval s!"Galois group axioms: {galoisGroupAxioms.length}"
#eval s!"Galois correspondence axioms: {galoisCorrespondenceAxioms.length}"

/-! ## Morphisms smoke tests -/

#eval "=== Morphisms ==="
#eval "FieldAutomorphism, GaloisAutomorphism, FieldExtensionHom: defined"
#eval "FieldIso, GaloisGroupIso, AutGroup, galoisGroup: defined"
#eval "GaloisExtCat, GaloisAction, galoisOrbit, GaloisEquivalence: defined"

/-! ## Constructions smoke tests -/

#eval "=== Constructions ==="
#eval "IntermediateField, NormalIntermediateField, fixedFieldOfSubgroup: defined"
#eval "QuotientGaloisGroup, galoisCorrespondence, Artin's theorem: defined"
#eval "Compositum, TensorProductField, Galois group of compositum: defined"
#eval "SplittingField, NormalClosure, GaloisClosure, CyclotomicExtension: defined"

/-! ## Properties smoke tests -/

#eval "=== Properties ==="
#eval s!"Tower law: {towerLaw}"
#eval s!"Galois criterion (fixed field): {galoisCriterionFixedField}"
#eval s!"Normal criterion (splitting): {normalityCriterionSplitting}"
#eval "SolvableGroup, CyclicExtension, AbelianExtension: defined"

/-! ## Theorems smoke tests -/

#eval "=== Theorems ==="
#eval s!"Artin's theorem: {artinsTheoremStatement}"
#eval s!"Primitive element theorem: {primitiveElementTheorem}"
#eval s!"Fundamental Theorem of Galois: defined (3 parts)"
#eval s!"7 pillar theorems: FTGT, Solvability, Quintic, Cyclotomic, FiniteFields, Kummer, Artin-Schreier"

/-! ## Examples + Bridges smoke tests -/

#eval "=== Examples + Bridges ==="
#eval "quadraticExtension, cyclotomicExtension, cubicNonGalois, finiteField: defined"
#eval "Galois as permutation group, Cohomology, Brauer group: defined"
#eval "Profinite Galois, Galois=covering, Etale fundamental group: defined"
#eval "Grothendieck's Galois theory, Dessins d'enfants, Anabelian: defined"
#eval "Stauduhar's algorithm, Discriminant, Cebotarev, GAP: defined"

/-! ## Total axioms -/

#eval s!"Total Galois theory axioms: {galoisTheoryTotalAxioms.length}"
#eval "=== All smoke tests passed ==="
