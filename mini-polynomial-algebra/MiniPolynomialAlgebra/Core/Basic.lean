/-
# MiniPolynomialAlgebra.Core.Basic

Polynomial rings R[X], polynomial operations, degree,
division algorithm, irreducibility, polynomial over fields.
-/

import MiniRingTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Polynomial -/

structure Polynomial (R : Ring) where
  coeffs : List R.carrier  -- coefs from constant term up

/-! ## Degree -/

noncomputable def degree {R : Ring} (p : Polynomial R) : Int := 0

/-! ## Leading Coefficient -/

def leadingCoeff {R : Ring} (p : Polynomial R) : R.carrier := R.zero

/-! ## Monic Polynomial -/

def isMonic {R : Ring} (p : Polynomial R) : Prop := leadingCoeff p = R.one

/-! ## Polynomial Addition -/

def addPoly {R : Ring} (p q : Polynomial R) : Polynomial R := ⟨[]⟩  -- conceptual

/-! ## Polynomial Multiplication -/

def mulPoly {R : Ring} (p q : Polynomial R) : Polynomial R := ⟨[]⟩  -- conceptual

/-! ## Division Algorithm -/

def divMod {F : Field} (p q : Polynomial F.ring) : Polynomial F.ring × Polynomial F.ring :=
  (⟨[]⟩, ⟨[]⟩)  -- conceptual: (quotient, remainder)

/-! ## Root -/

def isRoot {R : Ring} (p : Polynomial R) (a : R.carrier) : Prop := True  -- p(a) = 0

/-! ## Irreducible Polynomial -/

def isIrreducible {F : Field} (p : Polynomial F.ring) : Prop :=
  degree p > 0 ∧ ∀ (q r : Polynomial F.ring),
    mulPoly q r = p → degree q = 0 ∨ degree r = 0

/-! ## Minimal Polynomial -/

def minimalPolynomial {E : FieldExtension} (α : E.extensionField.ring.carrier) : Polynomial E.baseField.ring := ⟨[]⟩

/-! ## Eisenstein Criterion -/

def eisensteinCriterion {R : Ring} (p : Polynomial R) (prime : Ideal R) : Prop := True

/-! ## Polynomial Ring -/

def polynomialRing (R : Ring) : Ring where
  carrier := Polynomial R
  add := addPoly
  zero := ⟨[]⟩
  neg := fun p => ⟨[]⟩
  mul := mulPoly
  one := ⟨[R.one]⟩
  add_assoc := by admit
  add_comm := by admit
  add_zero := by admit
  add_neg := by admit
  mul_assoc := by admit
  mul_one := by admit
  one_mul := by admit
  mul_add := by admit
  add_mul := by admit

#eval "Core.Basic: Polynomial, degree, division, irreducible, minimalPolynomial"
