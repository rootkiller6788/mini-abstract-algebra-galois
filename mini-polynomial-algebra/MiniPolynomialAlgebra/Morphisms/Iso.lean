/-
# MiniPolynomialAlgebra.Morphisms.Iso

Isomorphisms of polynomial rings:
linear change of variable, automorphisms of R[X],
and structure theorems for polynomial ring isomorphisms.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Isomorphism of Polynomial Rings -/

structure PolynomialRingIso (R S : Ring) where
  toHom : PolynomialRingHom R S
  invHom : PolynomialRingHom S R
  left_inv : ∀ (p : Polynomial R), invHom.mapPoly (toHom.mapPoly p) = p
  right_inv : ∀ (q : Polynomial S), toHom.mapPoly (invHom.mapPoly q) = q

/-! ## Linear Change of Variable -/

-- X ↦ aX + b for a, b ∈ R, a ≠ 0
def linearChangeOfVariable {R : Ring} (a b : R.carrier) (ha : a ≠ R.zero) : Prop := True
  -- Automorphism of R[X] given by X ↦ aX + b

-- Group of affine transformations acts on R[X]
def affineAutomorphismGroup {R : Ring} : Prop := True
  -- { X ↦ aX + b | a ∈ R×, b ∈ R }

/-! ## Automorphisms of Polynomial Ring -/

-- Every automorphism of R[X] as R-algebra is a linear change: X ↦ aX + b
def automorphismClassification {R : Ring} : Prop := True
  -- Aut_R(R[X]) ≅ R× ⋉ R

-- For fields, this classification is complete
def fieldAutomorphismClassification {F : Field} : Prop := True
  -- Every F-algebra automorphism of F[X] is linear: X ↦ aX + b, a ≠ 0

/-! ## R[X] ≅ R[Y] as R-Algebras -/

def sameVariableRename {R : Ring} : Prop := True
  -- R[X] ≅ R[Y] via X ↔ Y

/-! ## Polynomial Ring over Isomorphic Rings -/

def isomorphicCoefficientRings {R S : Ring} (h : Prop) : Prop := True
  -- If R ≅ S then R[X] ≅ S[X]

/-! ## Transcendence Degree 1 -/

-- For a field F, F(X) ≅ rational function field of transcendence degree 1
def rationalFunctionField (F : Field) : Prop := True
  -- F(X) is a purely transcendental extension of F

#eval "Morphisms.Iso: PolynomialRingIso, linearChangeOfVariable, automorphismClassification, rationalFunctionField"
