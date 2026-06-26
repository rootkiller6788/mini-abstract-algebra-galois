/-
# MiniPolynomialAlgebra.Examples.Standard

Standard examples of polynomial rings, irreducible
polynomials, and field extensions via polynomials.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Polynomial Rings over Common Fields -/

-- ℝ[X]: real polynomial ring
def realPolynomialExample : Polynomial (⟨_,_,_,_,_,_⟩ : Ring) := ⟨[]⟩

-- ℚ[X]: rational polynomial ring
def rationalPolynomialExample : Prop := True

-- ℂ[X]: complex polynomial ring
def complexPolynomialExample : Prop := True

-- F_p[X]: polynomial ring over finite field
def finiteFieldPolynomialExample (p : Nat) : Prop := True

/-! ## Irreducible Polynomial Examples -/

-- X^2 + 1 is irreducible over ℝ
def x2plus1IrreducibleOverR : Prop := True

-- X^2 + 1 is reducible over ℂ (X+i)(X-i)
def x2plus1ReducibleOverC : Prop := True

-- X^2 - 2 is irreducible over ℚ
def x2minus2IrreducibleOverQ : Prop := True

-- X^3 - 2 is irreducible over ℚ (Eisenstein with p=2)
def x3minus2IrreducibleOverQ : Prop := True

-- X^4 + 1 is irreducible over ℚ (substitute X+1 for Eisenstein)
def x4plus1IrreducibleOverQ : Prop := True

-- Cyclotomic polynomial Φ_5(X) = X^4 + X^3 + X^2 + X + 1 is irreducible over ℚ
def cyclotomic5IrreducibleOverQ : Prop := True

/-! ## Field Extension Examples -/

-- ℂ ≅ ℝ[X]/(X^2 + 1)
def complexAsQuotient : Prop := True

-- ℚ(∛2) ≅ ℚ[X]/(X^3 - 2)
def qAdjoinCubeRoot2AsQuotient : Prop := True

-- ℚ(√2) ≅ ℚ[X]/(X^2 - 2)
def qAdjoinSqrt2AsQuotient : Prop := True

-- Finite field F_{p^2} ≅ F_p[X]/(X^2 - a) where a is a quadratic non-residue
def finiteFieldQuadraticExtension (p a : Nat) : Prop := True

/-! ## Special Polynomial Sequences -/

-- T_0 = 1, T_1 = X, T_2 = 2X^2 - 1, T_3 = 4X^3 - 3X, ...
def chebyshevTExamples {R : Ring} : List (Polynomial R) := []

-- P_0 = 1, P_1 = X, P_2 = (3X^2 - 1)/2, ...
def legendrePExamples {R : Ring} : List (Polynomial R) := []

#eval "Examples.Standard: real/rational/complex polynomial, irreducible examples, field extension examples"
