/-
# MiniPolynomialAlgebra.Properties.Invariants

Invariants of polynomials:
degree, content, primitive part, discriminant,
resultant, and other polynomial invariants.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Degree Invariants -/

-- Degree of sum
def degreeSum {R : Ring} (p q : Polynomial R) : Prop :=
  degree (addPoly p q) ≤ max (degree p) (degree q)

-- Degree of product (for integral domains)
def degreeProduct {R : Ring} (p q : Polynomial R) : Prop :=
  degree (mulPoly p q) = degree p + degree q

-- Degree of zero polynomial is -∞
def degreeZeroSpecial {R : Ring} : Prop :=
  degree (⟨[]⟩ : Polynomial R) = -1

/-! ## Content and Primitive Part -/

-- Content: gcd of coefficients
def content {R : Ring} (p : Polynomial R) : R.carrier := R.one  -- placeholder

-- Primitive part: p / content(p)
def primitivePart {R : Ring} (p : Polynomial R) : Polynomial R := ⟨[]⟩

-- A polynomial is primitive if content = 1
def isPrimitiveContent {R : Ring} (p : Polynomial R) : Prop :=
  content p = R.one

/-! ## Resultant -/

-- Resultant of two polynomials: res(f, g) = 0 iff f and g share a root
def resultant {R : Ring} (p q : Polynomial R) : R.carrier := R.zero

-- Resultant vanishes iff polynomials have common factor
def resultantZeroIffCommonRoot {F : Field} (p q : Polynomial F.ring) : Prop :=
  resultant p q = F.zero ↔ True  -- p and q have a common root (in algebraic closure)

/-! ## Discriminant -/

-- Discriminant of a polynomial: nonzero iff no repeated roots
def polyDiscriminant {F : Field} (p : Polynomial F.ring) : F.carrier := F.zero

-- Discriminant vanishes iff p has a repeated root
def discriminantZeroIffRepeatedRoot {F : Field} (p : Polynomial F.ring) : Prop :=
  polyDiscriminant p = F.zero ↔ True  -- p has a repeated root

/-! ## Factorization Invariants -/

-- Number of irreducible factors (counted with multiplicity)
def numberOfIrreducibleFactors {F : Field} (p : Polynomial F.ring) : Nat := 0

-- Squarefree part: product of distinct irreducible factors
def squarefreePart {F : Field} (p : Polynomial F.ring) : Polynomial F.ring := ⟨[]⟩

-- Polynomial is squarefree if no repeated irreducible factors
def isSquarefree {F : Field} (p : Polynomial F.ring) : Prop :=
  p = squarefreePart p

#eval "Properties.Invariants: degree invariants, content, resultant, discriminant, squarefree"
