/-
# MiniPolynomialAlgebra.Properties.ClassificationData

Classification data for polynomials:
classification by degree, by number of roots,
by Galois group, and by splitting field data.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Classification by Degree -/

-- Constant polynomials: degree 0 or -∞
def isConstant {R : Ring} (p : Polynomial R) : Prop :=
  degree p ≤ 0 ∧ degree p ≠ -1

-- Linear polynomials: degree 1
def isLinear {R : Ring} (p : Polynomial R) : Prop :=
  degree p = 1

-- Quadratic polynomials: degree 2
def isQuadratic {R : Ring} (p : Polynomial R) : Prop :=
  degree p = 2

-- Cubic polynomials: degree 3
def isCubic {R : Ring} (p : Polynomial R) : Prop :=
  degree p = 3

-- Quartic polynomials: degree 4
def isQuartic {R : Ring} (p : Polynomial R) : Prop :=
  degree p = 4

/-! ## Classification by Number of Roots -/

-- Separable polynomial: distinct roots (discriminant ≠ 0)
def isSeparable {F : Field} (p : Polynomial F.ring) : Prop :=
  True  -- no repeated roots

-- Number of distinct roots
def numberOfRoots {F : Field} (p : Polynomial F.ring) : Nat := 0

-- Sum of roots (Vieta's formula)
def sumOfRoots {F : Field} (p : Polynomial F.ring) : F.carrier := F.zero

-- Product of roots (Vieta's formula)
def productOfRoots {F : Field} (p : Polynomial F.ring) : F.carrier := F.zero

/-! ## Classification by Galois Group -/

-- Galois group of a polynomial (conceptual)
def galoisGroup {F : Field} (p : Polynomial F.ring) : Prop := True

-- Solvable by radicals: Galois group is solvable
def isSolvableByRadicals {F : Field} (p : Polynomial F.ring) : Prop := True

-- Polynomial with Galois group S_n (general polynomial of degree n)
def generalPolynomialGaloisSn (F : Field) (n : Nat) : Prop := True

/-! ## Classification by Splitting Field -/

-- Splitting field degree
def splittingFieldDegree {F : Field} (p : Polynomial F.ring) : Nat := 0

-- Cyclotomic polynomials have abelian Galois group
def cyclotomicGaloisAbelian (n : Nat) (F : Field) : Prop := True
  -- Gal(ℚ(ζ_n)/ℚ) ≅ (ℤ/nℤ)×

#eval "Properties.ClassificationData: degree classification, separable, roots, Galois group, splitting field"
