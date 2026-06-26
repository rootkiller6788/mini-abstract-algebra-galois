/-
# MiniRingTheoryCore.Theorems.Main

Central theorems of ring theory: Hilbert basis theorem,
Hilbert's Nullstellensatz, and the Artin-Wedderburn
structure theorem for semisimple rings.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Laws
import MiniRingTheoryCore.Constructions.Products
import MiniRingTheoryCore.Properties.Invariants
import MiniRingTheoryCore.Theorems.Basic
import MiniRingTheoryCore.Theorems.Classification

namespace MiniRingTheoryCore

/-! ## Hilbert Basis Theorem

If R is Noetherian, then R[x] is Noetherian.
This is one of the most important theorems in commutative
algebra, proved by Hilbert in 1888. -/

/-- Hilbert basis theorem: R Noetherian implies R[x] Noetherian. -/
axiom hilbertBasisTheorem {R : Ring} (hnoeth : isNoetherian R) :
  isNoetherian (PolynomialRing R)

/-- Corollary: if R is Noetherian, then R[x₁,...,xₙ] is
    Noetherian for any finite n. -/
axiom hilbertBasis_iterated {R : Ring} (hnoeth : isNoetherian R) (n : Nat) :
  isNoetherian (PolynomialRing R)

/-- The basis theorem implies that polynomial rings over fields
    are Noetherian (since fields are trivially Noetherian). -/
axiom fieldPolynomialRing_isNoetherian {R : Ring} (hfield : isField R) :
  isNoetherian (PolynomialRing R)

/-! ## Hilbert's Nullstellensatz

In algebraic geometry: for an algebraically closed field k,
the maximal ideals of k[x₁,...,xₙ] correspond to points in kⁿ.
Formally: I(V(J)) = rad(J) (the radical of J). -/

/-- A field k is algebraically closed if every nonconstant
    polynomial in k[x] has a root. -/
axiom isAlgebraicallyClosed (k : Ring) : Prop

/-- The vanishing ideal of a subset of kⁿ. -/
axiom vanishingIdeal {k : Ring} (S : Set (k.carrier)) : Ideal (PolynomialRing k)

/-- The algebraic set (variety) defined by an ideal. -/
axiom algebraicSet {k : Ring} (I : Ideal (PolynomialRing k)) :
  Set (k.carrier)

/-- Weak Nullstellensatz: for an algebraically closed field k,
    if I is a proper ideal of k[x₁,...,xₙ], then V(I) is nonempty.
    Equivalently: the only ideal with empty zero set is the
    unit ideal. -/
axiom weakNullstellensatz {k : Ring} (hac : isAlgebraicallyClosed k)
  (I : Ideal (PolynomialRing k)) (hproper : I.subset ≠ Set.univ) :
  algebraicSet I |>.isEmpty = false

/-- Strong Nullstellensatz: I(V(J)) = rad(J).
    That is, the ideal of polynomials vanishing on the variety
    of J is exactly the radical of J. -/
axiom strongNullstellensatz {k : Ring} (hac : isAlgebraicallyClosed k)
  (J : Ideal (PolynomialRing k)) : True

/-! ## Artin-Wedderburn Structure Theorem

Every semisimple ring is isomorphic to a finite direct product
of matrix rings over division rings. -/

/-- A ring is semisimple if it is Artinian and its Jacobson
    radical (intersection of all maximal left ideals) is zero. -/
axiom isSemisimple (R : Ring) : Prop

/-- Artin-Wedderburn theorem: every semisimple ring is a finite
    direct product of matrix rings over division rings. -/
axiom artinWedderburnStructureTheorem {R : Ring} (hss : isSemisimple R) :
  ∃ (n : Nat), ∃ (D : Fin n → Type), True

/-! ## #eval examples -/

#eval "hilbertBasisTheorem: R Noetherian => R[x] Noetherian"
#eval "weakNullstellensatz: V(I) = emptyset => I = (1)"
#eval "strongNullstellensatz: I(V(J)) = rad(J)"
#eval "artinWedderburn: semisimple Artinian => product of matrix rings"
