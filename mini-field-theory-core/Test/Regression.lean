/-
# Regression Tests -- MiniFieldTheoryCore

Regression tests ensuring no breaking changes.
-/

import MiniFieldTheoryCore

open MiniFieldTheoryCore

/-! ## Basic Definitions Exist -/

-- Verify Field type is usable
#check Field
#check FieldExtension

-- Verify algebraic/transcendental
#check isAlgebraic
#check isTranscendental
#check isAlgebraicExtension

-- Verify degree
#check extensionDegree
#check isFiniteExtension

-- Verify characteristic
#check characteristic
#check PrimeField

-- Verify splitting field
#check isSplittingField

-- Verify field automorphism
#check FieldAutomorphism

-- Verify FieldHom
#check FieldHom
#check FieldHom.id
#check FieldHom.comp

-- Verify FieldIso
#check FieldIso

-- Verify FieldEquivalence and ExtensionEquivalence
#check FieldEquivalence
#check ExtensionEquivalence

-- Verify Subfield / IntermediateField
#check Subfield
#check IntermediateField

-- Verify algebraically closed
#check isAlgebraicallyClosed

/-! ## All regression checks passed -/

#eval "Regression checks complete."
