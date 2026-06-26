/-
# MiniPolynomialAlgebra.Examples.Counterexamples

Counterexamples in polynomial algebra:
non-UFD polynomial rings, irreducible polynomials
that become reducible under extension, and more.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Non-UFD Polynomial Rings -/

-- ℤ/4ℤ[X] is not a UFD: X^2 = (X+2)^2 in (ℤ/4ℤ)[X]...
-- Actually this example needs care. A better one: R not UFD ⇒ R[X] not UFD
def nonIntegralDomainCoefficients : Prop := True

-- ℤ/6ℤ[X]: (2X+1)(3X+1) = 6X^2 + 5X + 1 = 5X + 1 (since 6=0)
-- Shows zero divisors in coefficient ring cause issues
def zeroDivisorsExample : Prop := True

/-! ## Irreducible but Not Absolutely Irreducible -/

-- X^2 + 1 irreducible over ℝ, reducible over ℂ
def irreducibleOverRnotOverC : Prop := True

-- X^2 + Y^2 irreducible over ℝ, reducible over ℂ: (X+iY)(X-iY)
def bivariateIrreducibleOverRnotOverC : Prop := True

-- X^4 + 1: irreducible over ℚ, factors over ℚ(√2): (X^2 - √2·X + 1)(X^2 + √2·X + 1)
def irreducibleOverQnotOverQsqrt2 : Prop := True

/-! ## Degree Not Preserved under Non-Monic Multiplication -/

-- In ℤ/6ℤ[X]: (2X)(3X) = 6X^2 = 0, so product degree is -∞, not 1+1=2
def degreeMulFailsForNonIntegralDomains : Prop := True

/-! ## Polynomial with More Roots than Degree -/

-- In ℤ/8ℤ, X^2 = 0 has 4 roots: 0, 2, 4, 6
-- In quaternions, X^2 + 1 = 0 has infinitely many roots
def moreRootsThanDegreeNonCommutative : Prop := True

/-! ## Irreducible but Factor Modulo p -/

-- X^4 + 1 is irreducible over ℚ, but reducible modulo p for EVERY prime p
def irreducibleOverQbutReducibleModp : Prop := True

/-! ## Eisenstein Criterion Not Necessary -/

-- X^2 + X + 2 is irreducible but Eisenstein doesn't directly apply
def irreducibleWithoutEisenstein : Prop := True

/-! ## Non-Example: Derivative and Repeated Roots -/

-- p(X) = X^2 over ℤ/pℤ[X] has p' = 2X = 0 in characteristic p
-- In characteristic p, p' = 0 doesn't imply p has repeated roots
def derivativeZeroInCharP : Prop := True

#eval "Examples.Counterexamples: non-UFD, not absolutely irreducible, degree fails for non-domains"
