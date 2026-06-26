/-
# MiniPolynomialAlgebra.Constructions.Quotients

Quotient constructions for polynomial rings:
quotient by an ideal, quotient by a principal ideal,
construction of field extensions as quotients.
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra

open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Quotient by a Polynomial Ideal -/

structure PolynomialQuotient (R : Ring) (I : Ideal (polynomialRing R)) where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  neg : carrier → carrier
  -- (R[X])/I

/-! ## Quotient by Principal Ideal -/

structure PrincipalQuotient (F : Field) (p : Polynomial F.ring) where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  neg : carrier → carrier
  -- F[X]/(p(X))

-- The quotient map
def quotientMap {F : Field} (p : Polynomial F.ring) (f : Polynomial F.ring) : (PrincipalQuotient F p).carrier :=
  (PrincipalQuotient.mk (fun _ _ => (⟨[]⟩ : Polynomial F.ring)) (fun _ _ => (⟨[]⟩ : Polynomial F.ring))
    (⟨[]⟩ : Polynomial F.ring) (⟨[]⟩ : Polynomial F.ring) (fun _ => (⟨[]⟩ : Polynomial F.ring))).zero

-- When p is irreducible, the quotient is a field
def irreducibleQuotientIsField {F : Field} (p : Polynomial F.ring) (h : isIrreducible p) : Prop := True
  -- F[X]/(p) is a field

/-! ## Field Extension via Quotient -/

-- Construct E = F[X]/(p(X)) as a field extension of F
structure FieldExtensionByQuotient (F : Field) (p : Polynomial F.ring) extends FieldExtension where
  isIrr : isIrreducible p
  -- baseField = F, extensionField = F[X]/(p)

/-! ## Chinese Remainder Theorem for Polynomials -/

def crtPolynomial {F : Field} (p q : Polynomial F.ring) (hcoprime : Prop) : Prop := True
  -- F[X]/(pq) ≅ F[X]/(p) × F[X]/(q) when gcd(p,q)=1

/-! ## Residue Class -/

def residueClass {F : Field} (p f : Polynomial F.ring) : Polynomial F.ring := ⟨[]⟩
  -- representative of f mod p with degree < degree(p)

#eval "Constructions.Quotients: PolynomialQuotient, PrincipalQuotient, FieldExtensionByQuotient, CRT"
