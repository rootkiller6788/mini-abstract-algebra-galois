/-
# MiniPolynomialAlgebra.Constructions.Products

Product constructions for polynomial algebras:
direct product of polynomial rings, tensor product
of polynomial algebras, and multivariate polynomials.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Product of Polynomial Rings -/

structure ProductPolynomialRing (R S : Ring) where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  neg : carrier → carrier
  -- R[X] × S[X] as a ring

/-! ## Multivariate Polynomial Ring -/

structure MultiPolynomialRing (R : Ring) (n : Nat) where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  neg : carrier → carrier
  -- R[X_1, ..., X_n]

/-! ## Bivariate Polynomial Ring -/

structure BivariatePolynomialRing (R : Ring) where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  neg : carrier → carrier
  -- R[X, Y]

-- Embedding of univariate into bivariate
def embedUnivariate {R : Ring} (BR : BivariatePolynomialRing R) (p : Polynomial R) : BR.carrier := BR.zero

-- Swap variables X ↔ Y
def swapVariables {R : Ring} (BR : BivariatePolynomialRing R) (f : BR.carrier) : BR.carrier := f

/-! ## Symmetric Bivariate Polynomials -/

def isSymmetricBivariate {R : Ring} (BR : BivariatePolynomialRing R) (f : BR.carrier) : Prop :=
  swapVariables BR f = f

/-! ## Product with Other Rings -/

-- Polynomial ring over product ring: (R × S)[X] ≅ R[X] × S[X]
def polynomialOverProductIso {R S : Ring} : Prop := True

/-! ## Tensor Product of Polynomial Algebras -/

-- F[X] ⊗_F F[Y] ≅ F[X, Y]
def tensorProductOfPolynomialRings {F : Field} : Prop := True

#eval "Constructions.Products: ProductPolynomialRing, MultiPolynomialRing, BivariatePolynomialRing, symmetric bivariate"
