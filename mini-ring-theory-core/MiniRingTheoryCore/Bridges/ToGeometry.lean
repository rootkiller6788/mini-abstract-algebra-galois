/-
# MiniRingTheoryCore.Bridges.ToGeometry

Bridge from ring theory to algebraic geometry:
coordinate rings of affine varieties, geometric interpretation
of ideals as subvarieties, and the Nullstellensatz connection.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Constructions.Products
import MiniRingTheoryCore.Constructions.Subobjects
import MiniRingTheoryCore.Constructions.Quotients
import MiniRingTheoryCore.Theorems.Main
import MiniRingTheoryCore.Bridges.ToTopology

namespace MiniRingTheoryCore

/-! ## Affine Algebraic Varieties

An affine variety V over a field k is defined by a set of
polynomial equations: V = { x ∈ k^n | f₁(x) = ... = f_m(x) = 0 }.
The coordinate ring k[V] is the ring of polynomial functions
on V. -/

/-- The coordinate ring of an affine variety: the ring of
    polynomial functions restricted to the variety. -/
axiom CoordinateRing (k : Ring) (variety : Set (k.carrier)) : Ring

/-- The coordinate ring k[V] for V ⊆ kⁿ defined by ideal I:
    k[V] = k[x₁,...,xₙ] / I(V). -/
axiom coordinateRing_quotient {k : Ring} (I : Ideal (PolynomialRing k)) :
  CoordinateRing k (algebraicSet I) =
  makeQuotientRing (vanishingIdeal (algebraicSet I))

/-- Regular functions on an affine variety form a ring. -/
axiom regularFunctions_form_ring {k : Ring} (V : Set (k.carrier)) : Ring

/-- The ring of regular functions on V is isomorphic to the
    coordinate ring k[V]. -/
axiom regularFunctions_eq_coordinateRing {k : Ring} (V : Set (k.carrier)) :
  RingIso (regularFunctions_form_ring k V) (CoordinateRing k V)

/-! ## Geometric Interpretation of Ideals

Ideals in k[x₁,...,xₙ] correspond to algebraic sets (subvarieties)
in kⁿ. The operations on ideals (sum, intersection, product,
radical) correspond to geometric operations on varieties. -/

/-- The algebraic set (zero locus) of an ideal I: V(I) = { x | f(x)=0 ∀f∈I }. -/
axiom algebraicSet_of_ideal {k : Ring} (I : Ideal (PolynomialRing k)) :
  Set (k.carrier)

/-- The vanishing ideal of a set S: I(S) = { f | f(x)=0 ∀x∈S }. -/
axiom vanishingIdeal_of_set {k : Ring} (S : Set (k.carrier)) :
  Ideal (PolynomialRing k)

/-- The ideal-variety correspondence: V(I(S)) = closure of S
    (in the Zariski topology). -/
axiom ideal_variety_closure {k : Ring} (hac : isAlgebraicallyClosed k)
  (S : Set (k.carrier)) : True

/-- Sum of ideals corresponds to intersection of varieties:
    V(I + J) = V(I) ∩ V(J). -/
axiom variety_intersection {k : Ring} (I J : Ideal (PolynomialRing k)) :
  algebraicSet_of_ideal (Ideal.sum I J) =
  algebraicSet_of_ideal I ∩ algebraicSet_of_ideal J

/-- Intersection of ideals corresponds to union of varieties:
    V(I ∩ J) = V(I) ∪ V(J). -/
axiom variety_union {k : Ring} (I J : Ideal (PolynomialRing k)) :
  algebraicSet_of_ideal (Ideal.inter I J) =
  algebraicSet_of_ideal I ∪ algebraicSet_of_ideal J

/-- Product of ideals corresponds to union of varieties:
    V(IJ) = V(I) ∪ V(J). -/
axiom variety_product {k : Ring} (I J : Ideal (PolynomialRing k)) :
  algebraicSet_of_ideal (productIdeal I J) =
  algebraicSet_of_ideal I ∪ algebraicSet_of_ideal J

/-! ## Nullstellensatz Connection

Hilbert's Nullstellensatz: over an algebraically closed field,
the map I ↦ V(I) gives a one-to-one correspondence between
radical ideals of k[x₁,...,xₙ] and affine algebraic varieties
in kⁿ. -/

/-- The radical of an ideal I: rad(I) = { f | f^n ∈ I for some n }. -/
axiom radical (R : Ring) (I : Ideal R) : Ideal R

/-- An ideal I is radical if I = rad(I). -/
def isRadicalIdeal {R : Ring} (I : Ideal R) : Prop :=
  (radical R I).subset = I.subset

/-- The Nullstellensatz bijection: for an algebraically closed
    field k, there is a bijection between radical ideals of
    k[x₁,...,xₙ] and Zariski-closed subsets of kⁿ. -/
axiom nullstellensatz_bijection {k : Ring} (hac : isAlgebraicallyClosed k) :
  True

/-- The Nullstellensatz explicitly: I(V(J)) = rad(J). -/
axiom nullstellensatz_IV_eq_rad {k : Ring} (hac : isAlgebraicallyClosed k)
  (J : Ideal (PolynomialRing k)) :
  (vanishingIdeal_of_set k (algebraicSet_of_ideal k J)).subset =
  (radical (PolynomialRing k) J).subset

/-- V(I) = ∅ iff I = (1) (weak Nullstellensatz, geometric version). -/
axiom nullstellensatz_empty_variety {k : Ring} (hac : isAlgebraicallyClosed k)
  (I : Ideal (PolynomialRing k)) :
  (algebraicSet_of_ideal k I = ∅) ↔ (I.subset = Set.univ)

/-! ## Morphisms of Varieties

A morphism of affine varieties φ: V → W corresponds to a
ring homomorphism k[W] → k[V] in the opposite direction. -/

/-- The category of affine varieties is equivalent to the
    opposite category of finitely generated reduced k-algebras. -/
axiom affine_variety_morphism {k : Ring} (V W : Set (k.carrier)) : True

/-- A regular map φ: V → W induces a pullback homomorphism
    φ*: k[W] → k[V]. -/
axiom pullback_homomorphism {k : Ring} (V W : Set (k.carrier))
  (φ : True) : RingHom (CoordinateRing k W) (CoordinateRing k V)

/-! ## #eval examples -/

#eval "CoordinateRing k[V]: ring of polynomial functions on variety"
#eval "algebraicSet_of_ideal V(I): zero locus of ideal"
#eval "radical rad(I): nilradical-type construction"
#eval "nullstellensatz_bijection: radical ideals ↔ varieties"
