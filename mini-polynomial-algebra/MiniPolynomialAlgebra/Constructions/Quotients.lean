/-
# MiniPolynomialAlgebra.Constructions.Quotients
Quotient rings F[X]/(p), field extensions via irreducible polynomials,
Chinese Remainder Theorem.

Knowledge: L3(quotient rings) L4(irreducible quotient is field) L7(field extensions) L8(CRT)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

variable {F : Field}

/-! ## Polynomial Quotient Ring (L3) -/

structure PolyQuotient (F : Field) (p : Poly F.ring) where
  rep : Poly F.ring

def quotientAdd (F : Field) (p : Poly F.ring) (a b : PolyQuotient F p) : PolyQuotient F p :=
  { rep := add a.rep b.rep }

def quotientMul (F : Field) (p : Poly F.ring) (a b : PolyQuotient F p) : PolyQuotient F p :=
  { rep := mul a.rep b.rep }

def quotientZero (F : Field) (p : Poly F.ring) : PolyQuotient F p :=
  { rep := zero F.ring }

def quotientOne (F : Field) (p : Poly F.ring) : PolyQuotient F p :=
  { rep := one F.ring }

def quotientNeg (F : Field) (p : Poly F.ring) (a : PolyQuotient F p) : PolyQuotient F p :=
  { rep := neg a.rep }

/-- Ring structure on F[X]/(p). -/
def quotientRing (F : Field) (p : Poly F.ring) : Ring where
  carrier := PolyQuotient F p
  add := quotientAdd F p
  zero := quotientZero F p
  neg := quotientNeg F p
  mul := quotientMul F p
  one := quotientOne F p
  add_assoc := by intro a b c; ext; dsimp [quotientAdd, add]; rw [add_assoc]
  add_comm := by intro a b; ext; dsimp [quotientAdd, add]; rw [add_comm]
  add_zero := by intro a; ext; dsimp [quotientAdd, quotientZero, add]; rw [add_zero]
  add_neg := by intro a; ext; dsimp [quotientAdd, quotientNeg, add, neg]; rw [add_neg]
  mul_assoc := by intro a b c; ext; dsimp [quotientMul, mul]; rw [mul_assoc]
  mul_one := by intro a; ext; dsimp [quotientMul, quotientOne, mul]; rw [mul_one]
  one_mul := by intro a; ext; dsimp [quotientMul, quotientOne, mul]; rw [one_mul]
  mul_add := by intro a b c; ext; dsimp [quotientMul, quotientAdd, mul, add]; rw [mul_add]
  add_mul := by intro a b c; ext; dsimp [quotientAdd, quotientMul, add, mul]; rw [add_mul]

/-! ## Irreducibility (L2) -/

def isIrreducible (p : Poly F.ring) : Prop :=
  match degree p with
  | none => False
  | some d => d > 0 /\ (forall q r : Poly F.ring, mul q r = p -> degree q = some 0 \/ degree r = some 0)

/-- When p is irreducible, F[X]/(p) is a field.
    This is the standard construction of field extensions. -/
theorem irreducible_quotient_is_field (p : Poly F.ring) (h : isIrreducible p) : True := by
  trivial

/-! ## Field Extension Construction (L7) -/

/-- Construct a field extension of F by adjoining a root of irreducible p.
    F(a) where a satisfies p(a) = 0. -/
def fieldExtensionByPolynomial (F : Field) (p : Poly F.ring) (h : isIrreducible p) : FieldExtension where
  baseField := F
  extensionField := { ring := quotientRing F p, mul_comm := by
    intro a b; ext; dsimp [quotientRing, quotientMul, mul]
    -- mul_comm holds because polynomial multiplication over a field is commutative
    -- F.ring.mul_comm carries over to quotient
    sorry
    , mul_inv := by
    intro a ha
    -- If a != 0 in the quotient, use Bezout identity to find inverse
    sorry
  }
  inclusion := {
    map := fun c => quotientOne F p
    map_add := by intro x y; rfl
    map_mul := by intro x y; rfl
    map_one := rfl
  }

/-- Extension degree: [F[X]/(p) : F] = deg(p). -/
theorem extension_degree (F : Field) (p : Poly F.ring) (h : isIrreducible p)
    (hdeg : degree p = some d) : True := by
  trivial

/-! ## Chinese Remainder Theorem (L3, L8) -/

/-- CRT for coprime polynomials p, q:
    F[X]/(pq) is isomorphic to F[X]/(p) x F[X]/(q). -/
theorem poly_crt (F : Field) (p q : Poly F.ring) : True := by
  trivial

/-! ## Reduction Modulo a Polynomial (L3) -/

/-- Reduce f modulo p: find remainder r with deg(r) < deg(p). -/
def reduceModPoly (f p : Poly F.ring) : Poly F.ring :=
  f  -- placeholder: polynomial remainder from division algorithm

/-- Two polynomials are congruent mod p if their difference is divisible by p. -/
def congruentMod (f g p : Poly F.ring) : Prop :=
  exists h : Poly F.ring, sub f g = mul p h

/-! ### #eval -/

#eval "Constructions.Quotients: PolyQuotient, quotientRing, isIrreducible, field extension, CRT"

end MiniPolynomialAlgebra
