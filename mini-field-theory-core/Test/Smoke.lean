/-
# Smoke Tests -- MiniFieldTheoryCore

Run: `lake env lean --run Test/Smoke.lean`
-/

import MiniFieldTheoryCore

open MiniFieldTheoryCore

#eval "══ MINI-FIELD-THEORY-CORE SMOKE TESTS ══"

/-! ## Core.Basic: Field -/

#eval "── Core.Basic: Field structure ──"
#check Field
#eval "Field type checks"

/-! ## Core.Basic: FieldExtension -/

#eval "── Core.Basic: FieldExtension ──"
#check FieldExtension
#eval "FieldExtension type checks"

/-! ## Core.Basic: Algebraic -/

#eval "── Core.Basic: isAlgebraic ──"
#check isAlgebraic
#eval "isAlgebraic type checks"

/-! ## Core.Basic: Transcendental -/

#eval "── Core.Basic: isTranscendental ──"
#check isTranscendental
#eval "isTranscendental type checks"

/-! ## Core.Basic: Algebraic Extension -/

#eval "── Core.Basic: isAlgebraicExtension ──"
#check isAlgebraicExtension
#eval "isAlgebraicExtension type checks"

/-! ## Core.Basic: Extension Degree -/

#eval "── Core.Basic: extensionDegree ──"
#check extensionDegree
#eval "extensionDegree type checks"

/-! ## Core.Basic: Finite Extension -/

#eval "── Core.Basic: isFiniteExtension ──"
#check isFiniteExtension
#eval "isFiniteExtension type checks"

/-! ## Core.Basic: Characteristic -/

#eval "── Core.Basic: characteristic ──"
#check characteristic
#eval "characteristic type checks"

/-! ## Core.Basic: Prime Field -/

#eval "── Core.Basic: PrimeField ──"
#check PrimeField
#eval "PrimeField type checks"

/-! ## Core.Basic: Splitting Field -/

#eval "── Core.Basic: isSplittingField ──"
#check isSplittingField
#eval "isSplittingField type checks"

/-! ## Core.Basic: Field Automorphism -/

#eval "── Core.Basic: FieldAutomorphism ──"
#check FieldAutomorphism
#eval "FieldAutomorphism type checks"

/-! ## Morphisms: FieldHom -/

#eval "── Morphisms: FieldHom ──"
#check FieldHom
#check FieldHom.id
#check FieldHom.comp
#eval "FieldHom type checks"

/-! ## Morphisms: FieldIso -/

#eval "── Morphisms: FieldIso ──"
#check FieldIso
#eval "FieldIso type checks"

/-! ## Morphisms: FieldEquivalence -/

#eval "── Morphisms: FieldEquivalence/ExtensionEquivalence ──"
#check FieldEquivalence
#check ExtensionEquivalence
#eval "FieldEquivalence type checks"

/-! ## Constructions: Subfield -/

#eval "── Constructions: Subfield/IntermediateField ──"
#check Subfield
#check IntermediateField
#eval "Subfield type checks"

/-! ## Constructions: Algebraic Closure -/

#eval "── Constructions: isAlgebraicallyClosed ──"
#check isAlgebraicallyClosed
#eval "isAlgebraicallyClosed type checks"

/-! ## All submodules imported -/

#eval "── Properties/Theorems/Examples/Bridges: stubs imported ──"
#eval "Properties stubs loaded"
#eval "Theorems stubs loaded"
#eval "Examples stubs loaded"
#eval "Bridges stubs loaded"

#eval "══ ALL MINI-FIELD-THEORY-CORE SMOKE TESTS PASSED ══"
