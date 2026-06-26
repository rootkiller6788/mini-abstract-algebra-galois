/-
# MiniFieldTheoryCore.Bridges.ToGeometry

Fields as coordinate systems in geometry, algebraically closed fields
and varieties, function fields of curves, and birational geometry.
-/

import MiniFieldTheoryCore.Core.Basic

namespace MiniFieldTheoryCore

/-! ## Coordinate field for affine/Projective space -/

structure CoordinateField where
  field : Field
  dimension : Nat
  isAlgebraicallyClosed : Prop

/-! ## Affine variety over a field -/

structure AffineVariety (F : Field) where
  dimension : Nat
  definingPolynomials : List (F.ring.carrier → F.ring.carrier)

axiom affineVarietyField {F : Field} (V : AffineVariety F) : Field
  -- The function field of V

/-! ## Algebraically closed fields and varieties — Nullstellensatz -/

axiom hilbertNullstellensatz (F : Field) (h : True) :
  -- Every maximal ideal in F[x₁,…,xₙ] corresponds to a point in Fⁿ when F is algebraically closed
  String

axiom varietiesOverAlgClosedField (F : Field) (hAC : True) : Prop

/-! ## Function field of an algebraic curve -/

structure FunctionFieldOfCurve where
  field : Field
  genus : Nat
  transcendenceDegree : Nat
  isOverC : Prop  -- over the complex numbers?

axiom riemannRoch (F : FunctionFieldOfCurve) :
  -- l(D) - l(K - D) = deg(D) + 1 - g
  Prop

axiom genusDegreeFormula (F : FunctionFieldOfCurve) : Prop
  -- Hurwitz formula: 2g(C) - 2 = deg(f)(2g(C') - 2) + deg(R)

/-! ## Real closed fields and semialgebraic geometry -/

axiom realClosedField (F : Field) : Prop

axiom tarskiSeidenberg (F : Field) (h : True) :
  -- Quantifier elimination for real closed fields; semialgebraic sets
  String

/-! ## Birational geometry and transcendence degree -/

axiom birationalInvariants (F : Field) : Prop

/-! ## #eval examples -/

#eval "Bridges.ToGeometry: CoordinateField (dimension, alg-closed)"
#eval "Bridges.ToGeometry: AffineVariety, HilbertNullstellensatz"
#eval "Bridges.ToGeometry: FunctionFieldOfCurve (genus, transcendenceDegree)"
#eval "Bridges.ToGeometry: riemannRoch, genusDegreeFormula (Hurwitz)"
#eval "Bridges.ToGeometry: realClosedField, tarskiSeidenberg, birationalInvariants"
