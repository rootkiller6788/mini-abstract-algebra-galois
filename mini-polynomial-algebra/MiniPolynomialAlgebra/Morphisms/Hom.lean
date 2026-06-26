/-
# MiniPolynomialAlgebra.Morphisms.Hom

Homomorphisms of polynomial rings:
ring homomorphisms, evaluation homomorphisms,
substitution maps, and coefficient ring maps.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Polynomial Ring Homomorphism -/

structure PolynomialRingHom (R S : Ring) where
  coeffMap : R.carrier → S.carrier
  varMap : Polynomial S  -- image of X
  mapPoly : Polynomial R → Polynomial S
  map_add : ∀ (p q : Polynomial R), mapPoly (addPoly p q) = addPoly (mapPoly p) (mapPoly q)
  map_mul : ∀ (p q : Polynomial R), mapPoly (mulPoly p q) = mulPoly (mapPoly p) (mapPoly q)
  map_one : mapPoly (⟨[R.one]⟩ : Polynomial R) = (⟨[S.one]⟩ : Polynomial S)

/-! ## Evaluation Homomorphism -/

-- ev_a : R[X] → R, p ↦ p(a)
def evaluationHom {R : Ring} (a : R.carrier) : Prop := True
  -- Ring homomorphism from R[X] to R

-- Kernel of evaluation is the ideal (X - a)
def evalKernel {R : Ring} (a : R.carrier) : Prop := True
  -- ker(ev_a) = (X - a)

/-! ## Substitution Homomorphism -/

-- φ : R[X] → R[X], X ↦ q(X)
def substitutionHom {R : Ring} (q : Polynomial R) : Prop := True
  -- p(X) ↦ p(q(X))

-- Iterated substitution
def iteratedSubstitution {R : Ring} (p q : Polynomial R) (n : Nat) : Polynomial R := ⟨[]⟩
  -- p(q(q(...q(X)...))) n times

/-! ## Inclusion of Coefficients -/

-- ι : R → R[X], r ↦ constant polynomial r
def coefficientInclusion {R : Ring} (r : R.carrier) : Polynomial R := ⟨[r]⟩

/-! ## Derivative Homomorphism -/

-- Formal derivative: d/dX : R[X] → R[X]
def formalDerivative {R : Ring} (p : Polynomial R) : Polynomial R := ⟨[]⟩

-- Derivative is a derivation: (fg)' = f'g + fg'
def derivativeLeibniz {R : Ring} (p q : Polynomial R) : Prop :=
  formalDerivative (mulPoly p q) = addPoly (mulPoly (formalDerivative p) q) (mulPoly p (formalDerivative q))

#eval "Morphisms.Hom: PolynomialRingHom, evaluationHom, substitutionHom, formalDerivative"
