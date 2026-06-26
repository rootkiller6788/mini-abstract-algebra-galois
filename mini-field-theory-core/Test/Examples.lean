/-
# Examples Tests -- MiniFieldTheoryCore

Additional example-based tests.
-/

import MiniFieldTheoryCore

open MiniFieldTheoryCore

/-! ## Field Construction -/

-- Verify Field structure can be used
#check Field.mk

/-! ## FieldExtension Construction -/

-- Verify FieldExtension structure can be used
#check FieldExtension.mk

/-! ## Algebraic and Transcendental -/

-- Verify predicates are well-typed
def trivialIsAlgebraic {E : FieldExtension} (α : E.extensionField.ring.carrier) : Prop :=
  isAlgebraic α

def trivialIsTranscendental {E : FieldExtension} (α : E.extensionField.ring.carrier) : Prop :=
  isTranscendental α

/-! ## Characteristic -/

-- Verify characteristic is a function
def trivialChar (F : Field) : Nat := characteristic F

/-! ## PrimeField -/

-- Verify PrimeField is a function
def trivialPrime (F : Field) : Field := PrimeField F

/-! ## FieldHom Identity -/

-- Verify identity field homomorphism is well-typed
#check fun (F : Field) => FieldHom.id F

/-! ## All examples type-checked successfully -/

#eval "Examples tests complete."
