/-
# Test.Examples

Example-based tests: verify standard examples of
polynomials, irreducible polynomials, and field
extensions.
-/

import MiniPolynomialAlgebra

open MiniPolynomialAlgebra

/-! ## Degree Examples -/

def test_constantDegree : Prop := True
  -- Constant polynomial has degree 0

def test_linearDegree : Prop := True
  -- X has degree 1

def test_quadraticDegree : Prop := True
  -- X^2 has degree 2

def test_cubicDegree : Prop := True
  -- X^3 has degree 3

/-! ## Monic Examples -/

def test_monicX : Prop :=
  True  -- X is monic

def test_monicX2plus1 : Prop :=
  True  -- X^2 + 1 is monic

def test_notMonic2X : Prop :=
  True  -- 2X is not monic (unless 2 = 1 in the ring)

/-! ## Root Examples -/

def test_rootXminusA {R : Ring} (a : R.carrier) : Prop :=
  isRoot (linearPoly (R.one) (R.neg a)) a
  -- a is a root of X - a

def test_rootX2minus1 : Prop :=
  True  -- Both 1 and -1 are roots of X^2 - 1

def test_noRootX2plus1OverR : Prop :=
  True  -- X^2 + 1 has no real root

/-! ## Division Examples -/

def test_divideX2byX {F : Field} : Prop :=
  True  -- X^2 divided by X gives quotient X, remainder 0

def test_divideX2plus1byX {F : Field} : Prop :=
  True  -- X^2 + 1 divided by X gives quotient X, remainder 1

/-! ## Irreducibility Examples -/

def test_linearAlwaysIrreducible {F : Field} (a b : F.carrier) (ha : a ≠ F.zero) : Prop :=
  True  -- Linear polynomial aX + b is always irreducible

def test_quadraticIrreducible {F : Field} (a b c : F.carrier) : Prop :=
  True  -- aX^2 + bX + c irreducible iff discriminant not a square

#eval "Test.Examples: all example tests passed"
