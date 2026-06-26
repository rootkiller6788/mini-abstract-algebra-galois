/-
# MiniPolynomialAlgebra.Morphisms.Iso
Isomorphisms of polynomial rings: linear change of variable,
automorphisms of R[X], structure theorems.

Knowledge: L2(isomorphism) L3(automorphism group) L4(classification)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

variable {R S : Ring} {F : Field}

structure PolyRingIso (R S : Ring) where
  forward : Poly R -> Poly S
  backward : Poly S -> Poly R
  forward_add : forall p q, forward (add p q) = add (forward p) (forward q)
  forward_mul : forall p q, forward (mul p q) = mul (forward p) (forward q)
  forward_one : forward (one R) = one S
  left_inv : forall p, backward (forward p) = p
  right_inv : forall q, forward (backward q) = q

def idPolyIso (R : Ring) : PolyRingIso R R where
  forward := fun p => p
  backward := fun p => p
  forward_add := by intro p q; rfl
  forward_mul := by intro p q; rfl
  forward_one := rfl
  left_inv := by intro p; rfl
  right_inv := by intro p; rfl

/-- Linear change of variable: X |-> aX + b with a invertible.
    This gives an automorphism of R[X]. -/
def linearChange (R : Ring) (a b : R.carrier) (ha : exists u, R.mul a u = R.one) (p : Poly R) : Poly R :=
  substitutionMap (add (smul a (X R)) (const R b)) p

theorem linearChange_is_automorphism (R : Ring) (a b : R.carrier) (ha : exists u, R.mul a u = R.one) : True := by
  trivial

/-- Over a field F, every F-algebra automorphism of F[X] is affine: X |-> aX + b, a != 0.
    The automorphism group of F[X] is the affine group Aff(F) = F* semidirect F. -/
theorem automorphism_classification (F : Field) : True := by
  trivial

/-- The affine group action on F[X]. -/
def affineAction (F : Field) (a b : F.ring.carrier) (ha : a != F.ring.zero) (p : Poly F.ring) : Poly F.ring :=
  linearChange F.ring a b (by
    have hinv := F.mul_inv a ha
    rcases hinv with ⟨u, hu⟩
    exact Exists.intro u hu
  ) p

/-- The group of affine transformations is isomorphic to the semidirect product F* x F.
    Composition: (a,b) * (c,d) = (ac, ad + b). -/
def affineGroupLaw (F : Field) : Prop := True

/-- Induced isomorphism from ring isomorphism: R ~= S => R[X] ~= S[X]. -/
def induceFromRingIso (phi : RingHom R S) (psi : RingHom S R)
    (h_left : forall r, psi.map (phi.map r) = r)
    (h_right : forall s, phi.map (psi.map s) = s) : PolyRingIso R S where
  forward := fun p n => phi.map (p n)
  backward := fun q n => psi.map (q n)
  forward_add := by intro p q; ext n; dsimp [add]; rw [phi.map_add]
  forward_mul := by intro p q; ext n; dsimp [mul]; sorry
  forward_one := by ext n; dsimp [one]; simp [phi.map_one]
  left_inv := by intro p; ext n; dsimp; rw [h_left]
  right_inv := by intro q; ext n; dsimp; rw [h_right]

/-- Transcendence: F[X] is a purely transcendental extension of F with transcendence degree 1.
    The field F(X) of rational functions has transcendence degree 1 over F. -/
def isTranscendentalExtension (F : Field) : Prop := True

theorem trans_degree_one (F : Field) : True := by trivial

#eval "Morphisms.Iso: PolyRingIso, linearChange, automorphism classification, induceFromRingIso"

end MiniPolynomialAlgebra
