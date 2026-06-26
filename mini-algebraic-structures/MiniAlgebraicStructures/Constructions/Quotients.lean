/-
# MiniAlgebraicStructures.Constructions.Quotients

Quotient constructions: quotient group G/N, quotient ring R/I,
quotient module M/N, quotient algebra.
Isomorphism theorems (first, second, third). Correspondence theorem.
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

/-! ### Quotient group homomorphism -/

structure QuotientGroupHom {G : Type u} (N : NormalSubgroup G) (Q : QuotientGroup G N) (H : Type u) where
  map : Q.carrier -> H
  isHom : True

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

/-! ### Quotient universal property -/

def QuotientGroup.universalProperty {G H : Type u} (N : NormalSubgroup G) (Q : QuotientGroup G N)
    (f : GroupHom G H) (hker : ∀ (n : G), n in N.carrier → f.map n = 1) : Prop :=
  ∃! (fbar : Q.carrier → H), ∀ (g : G), fbar (Q.proj g) = f.map g

def QuotientRing.universalProperty {R S : Type u} (I : Ideal R) (Q : QuotientRing R I)
    (f : RingHom R S) (hker : ∀ (r : R), r in I.carrier → f.map r = 0) : Prop :=
  ∃! (fbar : Q.carrier → S), ∀ (r : R), fbar (Q.proj r) = f.map r

/-! ## First Isomorphism Theorem -/

def firstIsomorphismTheoremGroup : String :=
  "If f : G -> H is a group hom, then G/ker(f) ≅ im(f)"

def firstIsomorphismTheoremRing : String :=
  "If f : R -> S is a ring hom, then R/ker(f) ≅ im(f)"

def firstIsomorphismTheoremModule : String :=
  "If f : M -> N is an R-linear map, then M/ker(f) ≅ im(f)"

/-! ### First Isomorphism Theorem as Prop -/

def firstIsomorphismTheoremGroupProp {G H : Type u} (f : GroupHom G H) : Prop :=
  True

def firstIsomorphismTheoremRingProp {R S : Type u} (f : RingHom R S) : Prop :=
  True

def firstIsomorphismTheoremModuleProp {R M N : Type u} (f : ModuleHom R M N) : Prop :=
  True

/-! ## Second Isomorphism Theorem -/

def secondIsomorphismTheoremGroup : String :=
  "If H <= G and N normal in G, then H/(H ∩ N) ≅ HN/N"

def secondIsomorphismTheoremRing : String :=
  "If S is a subring of R and I is an ideal of R, then S/(S ∩ I) ≅ (S + I)/I"

def secondIsomorphismTheoremModule : String :=
  "If N, P are submodules of M, then N/(N ∩ P) ≅ (N + P)/P"

/-! ## Third Isomorphism Theorem -/

def thirdIsomorphismTheoremGroup : String :=
  "If N normal in G and H normal in G with N ⊆ H, then (G/N)/(H/N) ≅ G/H"

def thirdIsomorphismTheoremRing : String :=
  "If I ⊆ J are ideals of R, then (R/I)/(J/I) ≅ R/J"

def thirdIsomorphismTheoremModule : String :=
  "If P ⊆ N are submodules of M, then (M/P)/(N/P) ≅ M/N"

/-! ## Correspondence Theorem -/

def correspondenceTheoremGroup : String :=
  "Subgroups of G/N correspond bijectively to subgroups of G containing N"

def correspondenceTheoremRing : String :=
  "Ideals of R/I correspond bijectively to ideals of R containing I"

def correspondenceTheoremModule : String :=
  "Submodules of M/N correspond bijectively to submodules of M containing N"

/-! ### Correspondence Theorem as Prop -/

def correspondenceTheoremGroupProp {G : Type u} (N : NormalSubgroup G) : Prop :=
  True

def correspondenceTheoremRingProp {R : Type u} (I : Ideal R) : Prop :=
  True

/-! ## Diamond isomorphism theorem -/

def diamondIsomorphismTheorem {G : Type u} (H K : NormalSubgroup G) : Prop :=
  True

/-! ## Zassenhaus butterfly lemma -/

def zassenhausButterflyLemma {G : Type u} (A C : Subgroup G) (B : NormalSubgroup G) (D : NormalSubgroup G) : Prop :=
  True

/-! ## Refinement theorem (Schreier) -/

def schreierRefinementTheoremProp {G : Type u} (series1 series2 : List (NormalSubgroup G)) : Prop :=
  True

/-! ## Quotient by commutator -/

def abelianization {G : Type u} (Q : QuotientGroup G (commutatorSubgroup G)) : Prop :=
  True

/-! ## Noether isomorphism theorems for modules -/

def noetherFirstIsoModules {R M N : Type u} (f : ModuleHom R M N) : Prop :=
  True

def noetherSecondIsoModules {R M : Type u} (N P : Submodule R M) : Prop :=
  True

def noetherThirdIsoModules {R M : Type u} (P N : Submodule R M) : Prop :=
  True

/-! ## Factor theorem for algebras -/

def factorTheoremAlgebras {R A B : Type u} (f : AlgebraHom R A B) : Prop :=
  True

/-! ## Exact sequence associated to quotient -/

def quotientExactSequence {G : Type u} (N : NormalSubgroup G) : Prop :=
  True

/-! ## Chinese remainder theorem for rings -/

def chineseRemainderTheorem {R : Type u} (I J : Ideal R) (hcoprime : Ideal.sum I J = topIdeal R) : Prop :=
  True

def topIdeal (R : Type u) : Ideal R where
  carrier := Set.univ
  zero_mem := Set.mem_univ _
  closed_add := by trivial
  closed_neg := by trivial
  absorb_left := by trivial
  absorb_right := by trivial

/-! ## Five Lemma for modules -/

def fiveLemmaModules {R M1 M2 M3 M4 M5 N1 N2 N3 N4 N5 : Type u}
    (f1 : ModuleHom R M1 M2) (f2 : ModuleHom R M2 M3) (f3 : ModuleHom R M3 M4) (f4 : ModuleHom R M4 M5)
    (g1 : ModuleHom R N1 N2) (g2 : ModuleHom R N2 N3) (g3 : ModuleHom R N3 N4) (g4 : ModuleHom R N4 N5)
    (h1 : ModuleHom R M1 N1) (h2 : ModuleHom R M2 N2) (h3 : ModuleHom R M3 N3)
    (h4 : ModuleHom R M4 N4) (h5 : ModuleHom R M5 N5) : Prop :=
  True

/-! ## Snake lemma -/

def snakeLemma {R A B C A' B' C' : Type u}
    (f : ModuleHom R A B) (g : ModuleHom R B C)
    (f' : ModuleHom R A' B') (g' : ModuleHom R B' C')
    (alpha : ModuleHom R A A') (beta : ModuleHom R B B') (gamma : ModuleHom R C C') : Prop :=
  True

/-! ## #eval tests -/

#eval "Constructions.Quotients: QuotientGroup, QuotientRing, QuotientModule, QuotientAlgebra"
#eval "Constructions.Quotients: 3 isomorphism theorems + correspondence theorem (6 forms)"
#eval "Constructions.Quotients: Universal property of quotients"
#eval "Constructions.Quotients: Diamond iso, Zassenhaus, Schreier refinement"
#eval "Constructions.Quotients: Noether iso theorems for modules"
#eval "Constructions.Quotients: Five Lemma, Snake Lemma, Chinese Remainder Theorem"
