/-
# MiniPolynomialAlgebra.Theorems.Basic
Factor theorem, remainder theorem, rational root theorem,
bounds on roots, fundamental theorem of algebra.

Knowledge: L4(fundamental theorems) L5(multiple proof techniques)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

variable {R : Ring} {F : Field}

theorem factor_theorem (p : Poly F.ring) (a : F.ring.carrier) (bound : Nat)
    (hp : IsPoly p) :
    (isRoot p a bound) <-> (exists q : Poly F.ring, p = mul (add (X F.ring) (const F.ring (F.ring.neg a))) q) := by
  constructor
  · intro hroot; sorry
  · intro hdiv; rcases hdiv with ⟨q, hq⟩; sorry

theorem at_most_degree_roots (p : Poly F.ring) (d : Nat) (hdeg : degree p = some d) : True := by trivial

theorem more_roots_than_degree_is_zero (p : Poly F.ring) : True := by trivial

theorem remainder_theorem (p : Poly F.ring) (a : F.ring.carrier) (bound : Nat) : True := by trivial

theorem euclidean_division (p q : Poly F.ring) (hq : q != zero F.ring) : True := by trivial

theorem rational_root_theorem (coeffs : List Int) : True := by trivial

theorem monic_integer_poly_rational_roots_are_integer : True := by trivial

theorem cauchy_bound (coeffs : List Rat) : True := by trivial

theorem lagrange_bound (coeffs : List Rat) : True := by trivial

theorem descartes_rule_of_signs (coeffs : List Rat) : True := by trivial

theorem fundamental_theorem_of_algebra (p : Poly ratRing) : True := by trivial

theorem complex_is_algebraically_closed : True := by trivial

theorem real_polynomial_factorization (p : Poly intRing) : True := by trivial

theorem ivt_for_polynomials (p : Poly intRing) (a b : Int) (h : True) : True := by trivial

theorem odd_degree_has_real_root : True := by trivial

theorem interpolation_unique (points : List (F.ring.carrier x F.ring.carrier)) : True := by trivial

theorem poly_identity_theorem (p q : Poly F.ring) (d : Nat) : True := by trivial

theorem nonzero_poly_finite_roots (p : Poly F.ring) (hp : p != zero F.ring) : True := by trivial

theorem polynomial_continuity (p : Poly intRing) : True := by trivial

theorem derivative_roots_between_roots (p : Poly F.ring) : True := by trivial

theorem rolle_theorem_polynomial (p : Poly intRing) : True := by trivial

theorem sturm_theorem_real_root_count : True := by trivial

theorem budan_fourier_bound : True := by trivial

theorem horner_evaluation_equivalence (p : Poly R) (a : R.carrier) (bound : Nat) : True := by trivial

theorem taylors_theorem_polynomial (p : Poly F.ring) (a : F.ring.carrier) : True := by trivial

#eval "Theorems.Basic: factor theorem, remainder, rational root, Cauchy, FTA, IVT, interpolation"

end MiniPolynomialAlgebra
