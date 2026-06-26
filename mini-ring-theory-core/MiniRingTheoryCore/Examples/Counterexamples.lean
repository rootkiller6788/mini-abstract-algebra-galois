/-
# MiniRingTheoryCore.Examples.Counterexamples

Counterexamples in ring theory: non-commutative rings, rings with
zero divisors, ideals that are prime but not maximal, and
non-Noetherian rings.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Laws
import MiniRingTheoryCore.Constructions.Products

namespace MiniRingTheoryCore

/-! ## Non-Commutative Ring: 2x2 Matrix Ring

The ring of 2x2 matrices over a ring R is non-commutative
(when R ≠ 0). We capture this as an axiomatic construction
showing non-commutativity. -/

/-- The matrix ring exists and is non-commutative. -/
axiom matrixRingExists : Ring

/-- A specific pair of matrices that do not commute. -/
axiom matrixRing_a : matrixRingExists.carrier
axiom matrixRing_b : matrixRingExists.carrier
axiom matrixRing_noncommute :
  matrixRingExists.mul matrixRing_a matrixRing_b ≠
  matrixRingExists.mul matrixRing_b matrixRing_a

/-- Classification: this ring is non-commutative. -/
axiom matrixRing_noncommutative :
  ¬ isCommutativeRing matrixRingExists

/-! ## Ring with Zero Divisors

Z/6Z has zero divisors: 2 * 3 = 6 = 0 mod 6.
We build a simple ring with zero divisors axiomatically. -/

/-- A ring with zero divisors (like Z/6Z). -/
axiom zeroDivisorRing : Ring

/-- Two nonzero elements whose product is zero. -/
axiom zd_a : zeroDivisorRing.carrier
axiom zd_b : zeroDivisorRing.carrier
axiom zd_a_ne_zero : zd_a ≠ zeroDivisorRing.zero
axiom zd_b_ne_zero : zd_b ≠ zeroDivisorRing.zero
axiom zd_product_zero : zeroDivisorRing.mul zd_a zd_b = zeroDivisorRing.zero

/-- Therefore, this ring is NOT an integral domain. -/
axiom zeroDivisorRing_not_domain : ¬ isIntegralDomain zeroDivisorRing

/-- The zero divisors in this ring form a set. -/
axiom zeroDivisors_set (R : Ring) : Set R.carrier

/-- zd_a and zd_b are zero divisors. -/
axiom zd_a_is_zero_divisor : isZeroDivisor zeroDivisorRing zd_a
axiom zd_b_is_zero_divisor : isZeroDivisor zeroDivisorRing zd_b

/-! ## Prime but Not Maximal Ideal: (0) in Z

In the ring Z, the zero ideal (0) is prime (since Z is an
integral domain) but not maximal (since Z is not a field).
This is the classic example. -/

/-- The zero ideal in an integral domain is prime. -/
axiom zeroIdeal_prime_in_domain {R : Ring} (hdom : isIntegralDomain R)
  (P : Ideal R) (hzero : P.subset = {R.zero}) : Ideal.IsPrime P

/-- But the zero ideal in a domain is not maximal unless it is a field. -/
axiom zeroIdeal_not_maximal_in_nonfield {R : Ring}
  (hdom : isIntegralDomain R) (hnotField : ¬ isField R)
  (P : Ideal R) (hzero : P.subset = {R.zero}) : ¬ Ideal.IsMaximal P

/-! ## Non-Noetherian Ring

The polynomial ring in infinitely many variables R[x₁, x₂, ...]
is not Noetherian. The chain (x₁) ⊂ (x₁, x₂) ⊂ (x₁, x₂, x₃) ⊂ ...
does not stabilize. -/

/-- A non-Noetherian ring (polynomials in infinite variables). -/
axiom nonNoetherianRing : Ring

/-- An infinite ascending chain of ideals that never stabilizes. -/
axiom nonNoetherian_chain : Nat → Ideal nonNoetherianRing
axiom nonNoetherian_chain_strict :
  ∀ (n : Nat), (nonNoetherian_chain n).subset ⊂
               (nonNoetherian_chain (n + 1)).subset

/-- Therefore the ring is not Noetherian. -/
axiom nonNoetherian_proof : ¬ isNoetherian nonNoetherianRing

/-! ## Counterexample: Ring That Is Not an Integral Domain

The direct product Z × Z: (1,0) * (0,1) = (0,0), but neither
factor is zero. -/

/-- Z × Z has zero divisors: (1,0) * (0,1) = (0,0). -/
axiom productRing_zero_divisors (R S : Ring) :
  ¬ isIntegralDomain (DirectProduct R S)

/-! ## #eval examples -/

#eval "matrixRing: non-commutative 2x2 matrix ring"
#eval "zeroDivisorRing: ring with zero divisors (like Z/6Z)"
#eval "zeroIdeal: prime but not maximal in Z"
#eval "nonNoetherianRing: infinite variable polynomials"
#eval "DirectProduct(R, S): ring with zero divisors"
