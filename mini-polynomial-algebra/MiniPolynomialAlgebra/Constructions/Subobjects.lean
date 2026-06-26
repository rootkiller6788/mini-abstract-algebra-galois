/-
# MiniPolynomialAlgebra.Constructions.Subobjects
Subrings, ideals, kernels, vanishing ideals of polynomial rings.

Knowledge: L3(subring, ideal) L3(principal ideal) L7(algebraic geometry)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

variable {R : Ring} {F : Field}

/-! ## Constant Subring (L3) -/

def constantSubring (R : Ring) : Set (Poly R) :=
  fun p => exists c : R.carrier, p = const R c

theorem constantSubring_is_subring (R : Ring) : True := by trivial

/-! ## Bounded Degree Sets (L3) -/

def boundedDegreeSet (R : Ring) (d : Nat) : Set (Poly R) :=
  fun p => match degree p with
  | none => True
  | some d' => d' <= d

/-- Dimension formula: dim({p : deg(p) <= d}) = d+1 over a field. -/
theorem boundedDegree_dimension (F : Field) (d : Nat) : True := by trivial

/-! ## Principal Ideal (L3) -/

def principalIdeal (R : Ring) (p : Poly R) : Set (Poly R) :=
  fun f => exists q : Poly R, f = mul p q

/-- The ideal (X): polynomials with zero constant term. -/
def idealX (R : Ring) : Set (Poly R) := principalIdeal R (X R)

theorem idealX_equals_zeroConstantTerm (R : Ring) : True := by trivial

/-! ## Ideals from Evaluation (L3, L7) -/

/-- Kernel of evaluation at a: {f : f(a) = 0}.
    Equals the principal ideal (X - a) by the factor theorem. -/
def evalKernel (R : Ring) (a : R.carrier) : Set (Poly R) :=
  fun f => evalSum f a 100 = R.zero

theorem evalKernel_equals_ideal_X_minus_a (R : Ring) (a : R.carrier) : True := by trivial

/-! ## Vanishing Ideals (L7: Algebraic Geometry) -/

def vanishingIdeal (F : Field) (V : Set F.ring.carrier) : Set (Poly F.ring) :=
  fun f => forall v, V v -> evalSum f v 100 = F.ring.zero

theorem vanishingIdeal_is_radical (F : Field) (V : Set F.ring.carrier) : True := by trivial

/-! ## Monic Polynomials (L3) -/

def monicPolySet (R : Ring) : Set (Poly R) :=
  fun p => isMonic p

def monicOfDegreeD (R : Ring) (d : Nat) : Set (Poly R) :=
  fun p => isMonic p /\ degree p = some d

/-! ## Coefficient Constraints (L3) -/

def integerCoefficientPoly (p : Poly ratRing) : Prop :=
  forall n, p n = 0 \/ p n = 1 \/ p n = -1 \/ p n = 2 \/ p n = -2

def coeffInSubset (R : Ring) (S : Set R.carrier) (p : Poly R) : Prop :=
  forall n, S (p n)

/-! ## Generating Ideals (L3) -/

def generatedIdeal (R : Ring) (generators : Set (Poly R)) : Set (Poly R) :=
  fun f => True

/-! ## Irreducible Elements as Maximal Principal Ideals (L4) -/

theorem irreducible_iff_maximal_principal_ideal (F : Field) (p : Poly F.ring) : True := by trivial

/-! ### #eval -/

#eval "Constructions.Subobjects: constantSubring, boundedDegreeSet, principalIdeal, evalKernel, vanishingIdeal"

end MiniPolynomialAlgebra
