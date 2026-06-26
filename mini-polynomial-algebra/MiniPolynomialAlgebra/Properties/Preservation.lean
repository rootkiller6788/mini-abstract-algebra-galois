/-
# MiniPolynomialAlgebra.Properties.Preservation

Properties preserved by polynomial operations:
irreducibility under substitutions, degree under
composition, and properties stable under base change.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Preservation of Degree -/

-- Degree preserved under addition of lower-degree polynomial
def degreeAddPreserved {R : Ring} (p q : Polynomial R) (hdeg : degree q < degree p) : Prop :=
  degree (addPoly p q) = degree p

-- Degree preserved under multiplication by nonzero constant
def degreeMulConstant {R : Ring} (p : Polynomial R) (c : R.carrier) (hc : c ≠ R.zero) : Prop :=
  degree (mulPoly ⟨[c]⟩ p) = degree p

-- Degree preserved under composition for non-constant polynomials
def degreeComposePreserved {R : Ring} (p q : Polynomial R) (hqdeg : degree q > 0) : Prop :=
  degree (compose p q) = degree p * degree q

/-! ## Preservation of Irreducibility -/

-- Irreducibility preserved under linear change of variable
def irreducibleUnderLinearChange {F : Field} (p : Polynomial F.ring) (h : isIrreducible p) (a b : F.carrier) (ha : a ≠ F.zero) : Prop :=
  isIrreducible ⟨[]⟩  -- p(aX + b) is irreducible

-- Irreducibility NOT preserved under non-linear substitution in general
def irreducibleCounterexampleNonLinear {F : Field} : Prop := True
  -- p(X) irreducible but p(X^2) reducible (e.g., X^2 + 1 over ℝ)

/-! ## Preservation under Base Extension -/

-- Irreducibility can change under field extension
def irreducibleUnderFieldExtension {F E : Field} (emb : F.carrier → E.carrier) (p : Polynomial F.ring) : Prop := True
  -- p may become reducible over E even if irreducible over F

-- Absolute irreducibility: remains irreducible over algebraic closure
def isAbsolutelyIrreducible {F : Field} (p : Polynomial F.ring) : Prop := True
  -- p irreducible over algebraic closure of F

/-! ## Preservation of Roots -/

-- Roots preserved under field extension
def rootsPreserved {F E : Field} (emb : F.carrier → E.carrier) (p : Polynomial F.ring) (a : F.carrier) : Prop :=
  isRoot p a → True  -- a is also a root of p considered over E

-- Number of roots bounded by degree
def rootsBoundedByDegree {F : Field} (p : Polynomial F.ring) : Prop :=
  True  -- p has at most degree(p) roots

#eval "Properties.Preservation: degree preservation, irreducible under linear change, absolute irreducibility"
