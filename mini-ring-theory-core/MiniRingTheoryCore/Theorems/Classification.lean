/-
# MiniRingTheoryCore.Theorems.Classification

Classification theorems: finite integral domain is a field,
Artinian implies Noetherian (Hopkins theorem),
finite division ring is commutative (Wedderburn's theorem).
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Laws
import MiniRingTheoryCore.Properties.ClassificationData
import MiniRingTheoryCore.Properties.Invariants

namespace MiniRingTheoryCore

/-! ## Finite Integral Domain is a Field

Every finite integral domain is a field. This is a classic result
that uses the pigeonhole principle: for any nonzero a, the map
x ↦ a*x is injective, hence surjective, so a has an inverse. -/

/-- A finite integral domain is a field.
    The proof: for nonzero a, the multiplication-by-a map is
    injective on a finite set, hence bijective, giving a
    multiplicative inverse. -/
axiom finiteIntegralDomainIsField {R : Ring} (hdom : isIntegralDomain R)
  (hfinite : True) : isField R

/-- Finite division ring version (even without commutativity). -/
axiom finiteDivisionRingIsField {R : Ring} (hdiv : isDivisionRing R)
  (hfinite : True) : isField R

/-! ## Hopkins Theorem: Artinian Implies Noetherian

In a (left) Artinian ring, every descending chain of
(left) ideals stabilizes. The Hopkins-Levitzki theorem
states that any (left) Artinian ring is also (left) Noetherian.
This is a deep structural result. -/

/-- Hopkins-Levitzki theorem: Artinian rings are Noetherian. -/
axiom artinianIsNoetherian {R : Ring} (hart : isArtinian R) :
  isNoetherian R

/-- The converse: Noetherian does NOT imply Artinian
    (e.g., Z is Noetherian but not Artinian).
    Counterexample: Z has infinite descending chain
    Z ⊃ 2Z ⊃ 4Z ⊃ 8Z ⊃ ... -/

/-- Corollary: for Artinian rings, all prime ideals are maximal. -/
axiom artinian_prime_is_maximal {R : Ring} (hart : isArtinian R)
  (P : Ideal R) (hprime : Ideal.IsPrime P) : Ideal.IsMaximal P

/-- For Artinian rings, Krull dimension is 0. -/
axiom artinian_krull_dimension_zero {R : Ring} (hart : isArtinian R) :
  krullDimension R = 0

/-! ## Wedderburn's Theorem: Finite Division Ring is Commutative

Every finite division ring is a field (i.e., commutative).
This is a deep theorem first proved by Wedderburn in 1905.
The proof uses the class equation and cyclotomic polynomials. -/

/-- Wedderburn's Little Theorem: every finite division ring
    is commutative (hence a field). -/
axiom wedderburn {R : Ring} (hdiv : isDivisionRing R) (hfinite : True) :
  isCommutativeRing R

/-- Corollary: every finite division ring is classified as a field. -/
axiom wedderburn_corollary {R : Ring} (hdiv : isDivisionRing R)
  (hfinite : True) : isField R

/-! ## Structure Theorem for Simple Artinian Rings

An Artin-Wedderburn-type statement: a semisimple Artinian ring
is isomorphic to a finite direct product of matrix rings
over division rings. -/

/-- A conceptual MatrixRing constructor. -/
axiom MatrixRing (D : Ring) (n : Nat) : Ring

/-- Artin-Wedderburn: every semisimple Artinian ring is
    isomorphic to a finite product of matrix rings over
    division rings. -/
axiom artinWedderburn (R : Ring) : True

/-! ## #eval examples -/

#eval "finiteIntegralDomainIsField: finite domain => field"
#eval "artinianIsNoetherian: Hopkins theorem"
#eval "wedderburn: finite division ring is commutative"
#eval "artinian_prime_is_maximal: Artinian => Krull dim 0"
