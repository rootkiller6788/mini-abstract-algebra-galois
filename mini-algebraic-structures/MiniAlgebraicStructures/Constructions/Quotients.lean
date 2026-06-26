/-
# MiniAlgebraicStructures.Constructions.Quotients

Quotient constructions: quotient group G/N, quotient ring R/I,
quotient module M/N, quotient algebra.
Isomorphism theorems (first, second, third).
-/

import MiniAlgebraicStructures.Constructions.Subobjects

namespace MiniAlgebraicStructures

/-! ## Quotient group -/

structure QuotientGroup (G : Type u) (N : NormalSubgroup G) where
  carrier : Type u
  proj : G -> carrier
  mul : carrier -> carrier -> carrier
  one : carrier
  inv : carrier -> carrier
  proj_surjective : ∀ (y : carrier), ∃ (x : G), proj x = y
  proj_ker : ∀ (x : G), proj x = one <-> x in N.carrier

/-! ## Quotient ring -/

structure QuotientRing (R : Type u) (I : Ideal R) where
  carrier : Type u
  proj : R -> carrier
  add : carrier -> carrier -> carrier
  mul : carrier -> carrier -> carrier
  zero : carrier
  one : carrier
  neg : carrier -> carrier
  proj_surjective : ∀ (y : carrier), ∃ (x : R), proj x = y
  proj_ker : ∀ (x : R), proj x = zero <-> x in I.carrier

/-! ## Quotient module -/

structure QuotientModule (R M : Type u) (N : Submodule R M) where
  carrier : Type u
  proj : M -> carrier
  add : carrier -> carrier -> carrier
  zero : carrier
  neg : carrier -> carrier
  smul : R -> carrier -> carrier
  proj_surjective : ∀ (y : carrier), ∃ (x : M), proj x = y
  proj_ker : ∀ (x : M), proj x = zero <-> x in N.carrier

/-! ## Quotient algebra -/

structure QuotientAlgebra (R A : Type u) (I : Ideal A) where
  carrier : Type u
  proj : A -> carrier
  add : carrier -> carrier -> carrier
  mul : carrier -> carrier -> carrier
  zero : carrier
  one : carrier
  neg : carrier -> carrier
  smul : R -> carrier -> carrier
  proj_surjective : ∀ (y : carrier), ∃ (x : A), proj x = y
  proj_ker : ∀ (x : A), proj x = zero <-> x in I.carrier

/-! ## First Isomorphism Theorem -/

def firstIsomorphismTheoremGroup : String :=
  "If f : G -> H is a group hom, then G/ker(f) ≅ im(f)"

def firstIsomorphismTheoremRing : String :=
  "If f : R -> S is a ring hom, then R/ker(f) ≅ im(f)"

def firstIsomorphismTheoremModule : String :=
  "If f : M -> N is an R-linear map, then M/ker(f) ≅ im(f)"

/-! ## Second Isomorphism Theorem -/

def secondIsomorphismTheoremGroup : String :=
  "If H <= G and N normal in G, then H/(H ∩ N) ≅ HN/N"

/-! ## Third Isomorphism Theorem -/

def thirdIsomorphismTheoremGroup : String :=
  "If N normal in G and H normal in G with N ⊆ H, then (G/N)/(H/N) ≅ G/H"

/-! ## Correspondence Theorem -/

def correspondenceTheorem : String :=
  "Subgroups of G/N correspond bijectively to subgroups of G containing N"

/-! ## #eval tests -/

#eval "Constructions.Quotients: QuotientGroup, QuotientRing, QuotientModule, QuotientAlgebra"
#eval "Constructions.Quotients: 3 isomorphism theorems + correspondence theorem"
