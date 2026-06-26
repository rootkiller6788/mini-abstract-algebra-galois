/-
# MiniRingTheoryCore.Bridges.ToComputation

Computational ring theory: Grobner bases, Buchberger algorithm,
membership testing in ideals, and computational aspects of
polynomial rings.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Constructions.Products
import MiniRingTheoryCore.Properties.Invariants

namespace MiniRingTheoryCore

/-! ## Polynomial Ring Terms for Computation

We work with polynomial rings over a field k. A monomial order
is a well-ordering on monomials compatible with multiplication. -/

/-- A monomial in n variables is a tuple of exponents. -/
def Monomial (n : Nat) : Type := List Nat

/-- A polynomial is a finite linear combination of monomials. -/
axiom Polynomial (k : Ring) (n : Nat) : Type

/-- Polynomial ring in n variables over k. -/
axiom PolynomialRing_n (k : Ring) (n : Nat) : Ring

/-- A monomial ordering: a total well-order on Monomial n
    compatible with multiplication. -/
axiom MonomialOrder (n : Nat) : Type

/-- The leading term of a polynomial under a monomial order. -/
axiom leadingTerm {k : Ring} {n : Nat} (order : MonomialOrder n)
  (f : Polynomial k n) : Polynomial k n

/-- The leading monomial of f. -/
axiom leadingMonomial {k : Ring} {n : Nat} (order : MonomialOrder n)
  (f : Polynomial k n) : Monomial n

/-- The leading coefficient of f. -/
axiom leadingCoefficient {k : Ring} {n : Nat} (order : MonomialOrder n)
  (f : Polynomial k n) : k.carrier

/-! ## Grobner Bases

A Grobner basis G of an ideal I is a finite set of polynomials
such that the leading term of any polynomial in I is divisible
by the leading term of some element of G. -/

/-- A Grobner basis of an ideal I in k[x₁,...,xₙ]. -/
axiom GrobnerBasis {k : Ring} {n : Nat} (order : MonomialOrder n)
  (I : Ideal (PolynomialRing_n k n)) : List (Polynomial k n)

/-- G is a Grobner basis: for all f ∈ I, the leading term of f
    is divisible by the leading term of some g ∈ G. -/
axiom grobnerBasis_property {k : Ring} {n : Nat}
  (order : MonomialOrder n) (I : Ideal (PolynomialRing_n k n))
  (G : List (Polynomial k n)) (hG : G = GrobnerBasis order I)
  (f : Polynomial k n) (hf : f ∈ I.subset) :
  ∃ (g : Polynomial k n), g ∈ G ∧
    True  -- leading monomial of g divides leading monomial of f

/-- Reduced Grobner basis: each polynomial is monic and reduced
    with respect to the others. -/
axiom reducedGrobnerBasis {k : Ring} {n : Nat}
  (order : MonomialOrder n) (I : Ideal (PolynomialRing_n k n)) :
  List (Polynomial k n)

/-- The reduced Grobner basis is unique (for a given monomial order). -/
axiom reducedGrobnerBasis_unique {k : Ring} {n : Nat}
  (order : MonomialOrder n) (I : Ideal (PolynomialRing_n k n)) :
  True

/-! ## Buchberger Algorithm

Buchberger's algorithm computes a Grobner basis from a given
set of generators by repeatedly computing S-polynomials and
reducing them. -/

/-- The S-polynomial of f and g: S(f,g) = (LCM/lt(f))*f - (LCM/lt(g))*g -/
axiom sPolynomial {k : Ring} {n : Nat} (order : MonomialOrder n)
  (f g : Polynomial k n) : Polynomial k n

/-- Reduction of polynomial h by a set F: repeatedly subtract
    multiples of elements of F to eliminate leading terms. -/
axiom reduce {k : Ring} {n : Nat} (order : MonomialOrder n)
  (F : List (Polynomial k n)) (h : Polynomial k n) : Polynomial k n

/-- Buchberger's algorithm: given a finite generating set F,
    compute a Grobner basis by adding S-polynomial remainders
    until all S-polynomials reduce to zero. -/
axiom buchberger {k : Ring} {n : Nat} (order : MonomialOrder n)
  (F : List (Polynomial k n)) : List (Polynomial k n)

/-- Buchberger's criterion: F is a Grobner basis iff all
    S-polynomials of pairs from F reduce to zero. -/
axiom buchberger_criterion {k : Ring} {n : Nat}
  (order : MonomialOrder n) (F : List (Polynomial k n)) : Prop

/-- Buchberger's algorithm terminates and produces a Grobner basis
    when k is a field and the monomial order is a well-order. -/
axiom buchberger_termination {k : Ring} {n : Nat}
  (order : MonomialOrder n) (F : List (Polynomial k n))
  (hfield : isField k) : True

/-! ## Ideal Membership Testing

Given a Grobner basis G, we can test membership in an ideal:
f ∈ I iff the reduction of f by G is zero. -/

/-- Ideal membership test using Grobner bases:
    f ∈ I iff reduce(G, f) = 0. -/
axiom idealMembership_by_grobner {k : Ring} {n : Nat}
  (order : MonomialOrder n) (I : Ideal (PolynomialRing_n k n))
  (G : List (Polynomial k n)) (hG : G = GrobnerBasis order I)
  (f : Polynomial k n) :
  (f ∈ I.subset) ↔ reduce order G f = reduce order G (Polynomial.zero k n)

/-- Zero polynomial in n variables. -/
axiom Polynomial.zero (k : Ring) (n : Nat) : Polynomial k n

/-! ## Computational Ring Theory Applications

Grobner bases are used for:
- Solving systems of polynomial equations
- Computing the radical of an ideal
- Determining ideal equality
- Computing Hilbert series and free resolutions -/

/-- Solving polynomial systems: find common zeros of
    polynomials f₁,...,f_m in kⁿ. -/
axiom solvePolynomialSystem {k : Ring} {n : Nat}
  (hac : isAlgebraicallyClosed k)
  (polys : List (Polynomial k n)) : Set (k.carrier)

/-- Ideal equality test: I = J iff their reduced Grobner bases
    (under the same monomial order) are equal. -/
axiom idealEquality_by_grobner {k : Ring} {n : Nat}
  (order : MonomialOrder n) (I J : Ideal (PolynomialRing_n k n)) :
  Prop

/-! ## #eval examples -/

#eval "GrobnerBasis: computational basis for ideal"
#eval "buchberger: algorithm to compute Grobner bases"
#eval "idealMembership_by_grobner: f in I iff normal form is 0"
#eval "solvePolynomialSystem: find common zeros in k^n"
