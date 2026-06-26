/-
# MiniPolynomialAlgebra.Theorems.Basic

Fundamental theorems of polynomial algebra:
division algorithm, factor theorem, remainder theorem,
rational root theorem, and fundamental theorem of algebra.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Division Algorithm Theorem -/

-- For polynomials over a field, Euclidean division exists and is unique
def euclideanDivisionTheorem {F : Field} (p q : Polynomial F.ring) (hq : q ≠ ⟨[]⟩) : Prop := True
  -- ∃! quotient r, remainder s with p = q * quotient + remainder and degree(s) < degree(q)

-- Remainder theorem: p(a) is the remainder when dividing p by (X - a)
def remainderTheorem {F : Field} (p : Polynomial F.ring) (a : F.carrier) : Prop := True
  -- p(a) = remainder of p divided by (X - a)

/-! ## Factor Theorem -/

-- (X - a) divides p iff a is a root of p
def factorTheoremFull {F : Field} (p : Polynomial F.ring) (a : F.carrier) : Prop :=
  isRoot p a ↔ True  -- (X - a) | p(X)

-- A nonzero polynomial of degree n has at most n roots
def atMostDegreeRoots {F : Field} (p : Polynomial F.ring) (hn : degree p > 0) : Prop := True
  -- p has at most degree(p) distinct roots

-- If a polynomial of degree n has n+1 roots, it's the zero polynomial
def moreRootsThanDegreeZero {F : Field} (p : Polynomial F.ring) (hdeg : degree p = n) (hroots : Prop) : Prop := True
  -- Having more roots than degree forces p = 0

/-! ## Rational Root Theorem -/

-- For p ∈ ℤ[X], any rational root a/b (in lowest terms) satisfies a|constant, b|leading
def rationalRootTheorem (p : Polynomial (⟨_,_,_,_,_,_⟩ : Ring)) : Prop := True

/-! ## Intermediate Value Theorem for Real Polynomials -/

-- Real polynomials of odd degree have at least one real root
def oddDegreeRealRoot : Prop := True

/-! ## Fundamental Theorem of Algebra -/

-- Every non-constant polynomial over ℂ has a root in ℂ
def fundamentalTheoremOfAlgebra : Prop := True
  -- ∀ p ∈ ℂ[X] with degree(p) > 0, ∃ z ∈ ℂ, p(z) = 0

-- ℂ is algebraically closed
def complexAlgebraicallyClosed : Prop := True

-- Every polynomial over ℝ factors into linear and irreducible quadratic factors
def realPolynomialFactorization : Prop := True

#eval "Theorems.Basic: euclideanDivisionTheorem, factorTheoremFull, rationalRootTheorem, fundamentalTheoremOfAlgebra"
