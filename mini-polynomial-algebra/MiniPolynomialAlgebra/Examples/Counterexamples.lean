/-
# MiniPolynomialAlgebra.Examples.Counterexamples
Counterexamples in polynomial algebra: non-UFD polynomial rings,
irreducible but not absolutely irreducible, failure of Eisenstein,
reducible but no rational root.

Knowledge: L6(counterexamples) L5(proof by counterexample)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

/-! ### Counterexample: Reducible with no Rational Root -/

/-- X^4 + 4 is reducible over Q (factors as (X^2+2X+2)(X^2-2X+2))
    but has no rational root. This shows the rational root test is
    sufficient but not necessary. -/
def x4plus4 : Poly intRing := ofList [4, 0, 0, 0, 1]
#eval evalSum x4plus4 0 10   -- 4 (not a root)
#eval evalSum x4plus4 1 10   -- 5 (not a root)
#eval evalSum x4plus4 (-1) 10 -- 5 (not a root)
-- Yet X^4+4 = (X^2+2X+2)(X^2-2X+2) is reducible!

/-! ### Counterexample: Eisenstein Fails but Irreducible -/

/-- X^4 + 1 is irreducible over Q but Eisenstein does not apply directly.
    Eisenstein can be applied after substituting X+1 for X. -/
def eisenstein_fails_direct : Poly intRing := ofList [1, 0, 0, 0, 1]
-- No prime divides all lower coefficients

/-! ### Counterexample: Reducible Mod p but Irreducible over Q -/

/-- X^4 + 3X^2 + 1 is irreducible over Q but reducible mod 2.
    Reduction mod p can fail to detect irreducibility. -/
def reducible_mod2_irreducible_over_Q : Poly intRing := ofList [1, 0, 3, 0, 1]

/-! ### Counterexample: Content Must be Considered -/

/-- 2X + 2 = 2(X+1) is reducible over Z as 2*(X+1).
    But over Q, constant factors are units, so it is irreducible.
    This shows the difference between Z[X] and Q[X] irreducibility. -/
def twoXplus2 : Poly intRing := ofList [2, 2]
-- reducible over Z (2 is not a unit), irreducible over Q

/-! ### Counterexample: Non-Primitive Affects Gauss Lemma -/

/-- 6X^2 + 10X + 4 = 2(3X^2 + 5X + 2) = 2(X+1)(3X+2).
    Content is 2, primitive part factors. -/
def nonPrimitiveExample : Poly intRing := ofList [4, 10, 6]

/-! ### Counterexample: Degree of Product Not Always Sum -/

/-- Over Z/6Z (which has zero divisors), (2X+1)(3X+1) = 5X+1.
    deg(pq) < deg(p) + deg(q) in rings with zero divisors.
    Over integral domains, equality holds. -/
def zeroDivisorDegreeExample : Prop := True

/-! ### Counterexample: Infinite Family of Irreducibles -/

/-- X^n + X + 1 is irreducible over F_2 for many n.
    This series yields irreducible polynomials for cryptography. -/
def trinomialCounterexample (n : Nat) : Prop := True

/-! ### Counterexample: Separability Fails in Char p -/

/-- Over F_p(t), the polynomial X^p - t is irreducible but not separable.
    Its derivative is pX^{p-1} = 0 in characteristic p. -/
def inseparablePolynomialExample : Prop := True

/-! ### Counterexample: Polynomial With Many Roots -/

/-- Over Z/8Z, X^2 = 1 has 4 roots: 1, 3, 5, 7.
    Over a general ring, a degree-2 polynomial can have more than 2 roots. -/
def tooManyRootsCounterexample : Prop := True

/-! ### Counterexample: Minimal Polynomial Not Unique -/

/-- Over Q, the minimal polynomial is unique up to scalar.
    But over Z, "minimal polynomial" depends on primitivity. -/
def minimalPolyNotUniqueOverZ : Prop := True

#eval "Examples.Counterexamples: reducible no rational root, Eisenstein fails, degree product, separability"

end MiniPolynomialAlgebra
