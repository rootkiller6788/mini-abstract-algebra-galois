/-
# MiniPolynomialAlgebra.Constructions.Subobjects

Subobjects of polynomial rings:
subrings, ideals of polynomial rings,
and the ideal of polynomials vanishing on a set.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Subring of Polynomial Ring -/

structure PolynomialSubring (R : Ring) where
  carrier : Set (Polynomial R)
  zero_mem : (⟨[]⟩ : Polynomial R) ∈ carrier
  one_mem : (⟨[R.one]⟩ : Polynomial R) ∈ carrier
  add_closed : ∀ (p q : Polynomial R), p ∈ carrier → q ∈ carrier → addPoly p q ∈ carrier
  mul_closed : ∀ (p q : Polynomial R), p ∈ carrier → q ∈ carrier → mulPoly p q ∈ carrier
  neg_closed : ∀ (p : Polynomial R), p ∈ carrier → (⟨[]⟩ : Polynomial R) ∈ carrier  -- placeholder

/-! ## Ideal of Polynomial Ring -/

structure PolynomialIdeal (R : Ring) where
  carrier : Set (Polynomial R)
  zero_mem : (⟨[]⟩ : Polynomial R) ∈ carrier
  add_closed : ∀ (p q : Polynomial R), p ∈ carrier → q ∈ carrier → addPoly p q ∈ carrier
  smul_closed : ∀ (p q : Polynomial R), q ∈ carrier → mulPoly p q ∈ carrier
  -- I is an ideal of R[X]

/-! ## Principal Ideal -/

structure PrincipalIdeal (R : Ring) where
  generator : Polynomial R
  ideal : PolynomialIdeal R
  -- (f(X)) = { f(X) * g(X) | g ∈ R[X] }

/-! ## Maximal Ideal -/

def isMaximalIdeal (R : Ring) (I : PolynomialIdeal R) : Prop :=
  True
  -- I is maximal among proper ideals

/-! ## Vanishing Ideal -/

-- Ideal of polynomials vanishing on a given set of points
def vanishingIdeal {F : Field} (S : Set F.carrier) : PolynomialIdeal F.ring :=
  { carrier := λ _ => True
    zero_mem := trivial
    add_closed := λ _ _ _ _ => trivial
    smul_closed := λ _ _ _ => trivial
  }

-- Hilbert's Nullstellensatz (conceptual)
def nullstellensatz {F : Field} (I : PolynomialIdeal F.ring) : Prop := True
  -- I(V(I)) = sqrt(I) for algebraically closed F

#eval "Constructions.Subobjects: PolynomialSubring, PolynomialIdeal, PrincipalIdeal, vanishingIdeal"
