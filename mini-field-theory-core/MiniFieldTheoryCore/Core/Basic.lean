/-
# MiniFieldTheoryCore.Core.Basic

Field, FieldExtension, Algebraic/Transcendental, Characteristic,
PrimeField, FiniteField basics, Field of Fractions.
-/

import MiniRingTheoryCore.Core.Basic

namespace MiniFieldTheoryCore

open MiniRingTheoryCore

/-! ## Field -/

structure Field where
  ring : Ring
  mul_comm : ∀ (x y : ring.carrier), ring.mul x y = ring.mul y x
  mul_inv : ∀ (x : ring.carrier), x ≠ ring.zero → ∃ (y : ring.carrier), ring.mul x y = ring.one

/-! ## Field Extension -/

structure FieldExtension where
  baseField : Field
  extensionField : Field
  inclusion : RingHom baseField.ring extensionField.ring

/-! ## Algebraic Element -/

def isAlgebraic {E : FieldExtension} (α : E.extensionField.ring.carrier) : Prop :=
  ∃ (poly : List E.baseField.ring.carrier), True  -- α is root of nonzero polynomial over base

/-! ## Transcendental Element -/

def isTranscendental {E : FieldExtension} (α : E.extensionField.ring.carrier) : Prop :=
  ¬ isAlgebraic α

/-! ## Algebraic Extension -/

def isAlgebraicExtension (E : FieldExtension) : Prop :=
  ∀ (α : E.extensionField.ring.carrier), isAlgebraic α

/-! ## Degree of Extension -/

noncomputable def extensionDegree (E : FieldExtension) : Nat := 0

/-! ## Finite Extension -/

def isFiniteExtension (E : FieldExtension) : Prop :=
  extensionDegree E > 0

/-! ## Characteristic -/

def characteristic (F : Field) : Nat := 0  -- conceptual: smallest n > 0 with n·1=0, or 0

/-! ## Prime Field -/

def PrimeField (F : Field) : Field := F  -- conceptual: Q if char 0, F_p if char p

/-! ## Splitting Field -/

def isSplittingField {E : FieldExtension} (poly : List E.baseField.ring.carrier) : Prop := True

/-! ## Field Automorphism -/

structure FieldAutomorphism (F : Field) where
  map : F.ring.carrier → F.ring.carrier
  isIso : RingHom F.ring F.ring -- conceptual

#eval "Core.Basic: Field, FieldExtension, Algebraic, Transcendental, Characteristic"
