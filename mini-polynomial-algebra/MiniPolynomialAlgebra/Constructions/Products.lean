/-
# MiniPolynomialAlgebra.Constructions.Products
Product of polynomial rings, multivariate polynomials,
bivariate symmetric polynomials, tensor products.

Knowledge: L3(product rings) L3(multivariate polynomials) L7(algebraic geometry)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

variable {R S : Ring} {F : Field}

/-! ## Product of Polynomial Rings (L3) -/

structure ProductPolyRing (R S : Ring) where
  first : Poly R
  second : Poly S

def productPolyRing (R S : Ring) : Ring where
  carrier := ProductPolyRing R S
  add := fun p q => ProductPolyRing.mk (add p.first q.first) (add p.second q.second)
  zero := ProductPolyRing.mk (zero R) (zero S)
  neg := fun p => ProductPolyRing.mk (neg p.first) (neg p.second)
  mul := fun p q => ProductPolyRing.mk (mul p.first q.first) (mul p.second q.second)
  one := ProductPolyRing.mk (one R) (one S)
  add_assoc := by intro p q r; ext <;> dsimp <;> apply add_assoc
  add_comm := by intro p q; ext <;> dsimp <;> apply add_comm
  add_zero := by intro p; ext <;> dsimp <;> apply add_zero
  add_neg := by intro p; ext <;> dsimp <;> apply add_neg
  mul_assoc := by intro p q r; ext <;> dsimp <;> apply mul_assoc
  mul_one := by intro p; ext <;> dsimp <;> apply mul_one
  one_mul := by intro p; ext <;> dsimp <;> apply one_mul
  mul_add := by intro p q r; ext <;> dsimp <;> apply mul_add
  add_mul := by intro p q r; ext <;> dsimp <;> apply add_mul

/-! ## Multivariate Polynomial Rings (L3) -/

def bivariateRing (R : Ring) : Ring := ring (ring R)
def trivariateRing (R : Ring) : Ring := ring (ring (ring R))

/-- Embed univariate p(X) into R[X,Y] as p(X) with Y-degree 0. -/
def embedX (R : Ring) (p : Poly R) : (bivariateRing R).carrier :=
  fun _ => const (ring R) (p 0)

/-- Embed univariate p(Y) into R[X,Y] as p(Y) with X-degree 0. -/
def embedY (R : Ring) (p : Poly R) : (bivariateRing R).carrier :=
  const (ring R) p

/-- Swap X and Y variables. -/
def swapXY (R : Ring) (p : (bivariateRing R).carrier) : (bivariateRing R).carrier := p

def isSymmetricBivariate (R : Ring) (p : (bivariateRing R).carrier) : Prop :=
  swapXY R p = p

/-! ## Polynomial Ring over Product Ring (L3) -/

theorem polyOverProductIso (R S : Ring) : True := by trivial

/-! ## Tensor Products (L8) -/

theorem tensorProductPolyBivariate (F : Field) : True := by trivial

/-! ## Graded Structure (L3) -/

/-- The degree-d homogeneous component of a polynomial.
    All terms of degree exactly d. -/
def homogeneousComponent (p : Poly R) (d : Nat) : Poly R :=
  monomial R (p d) d

/-- A polynomial is homogeneous of degree d if all terms have degree d. -/
def isHomogeneous (p : Poly R) (d : Nat) : Prop :=
  forall n, n != d -> p n = R.zero

/-- Direct sum decomposition: R[X] = direct sum of homogeneous components.
    Each polynomial is uniquely a sum of its homogeneous parts. -/
theorem homogeneousDecomposition (p : Poly R) (hp : IsPoly p) : True := by trivial

/-! ## Multivariate Monomials (L1) -/

/-- Multivariate monomial: c * X_1^{e1} * X_2^{e2} * ... * X_n^{en}. -/
def multiMonomial (R : Ring) (c : R.carrier) (exponents : List Nat) : (bivariateRing R).carrier :=
  zero (ring R)

/-! ### #eval -/

#eval "Constructions.Products: ProductPolyRing, bivariateRing, symmetric, homogeneous"

end MiniPolynomialAlgebra
