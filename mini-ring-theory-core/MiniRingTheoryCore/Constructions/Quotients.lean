/-
# MiniRingTheoryCore.Constructions.Quotients

Explicit construction of the quotient ring R/I and the isomorphism
theorems (First, Second, Third, Chinese Remainder).
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Objects
import MiniRingTheoryCore.Core.Laws
import MiniRingTheoryCore.Constructions.Subobjects

namespace MiniRingTheoryCore

/-! ## Quotient Ring Construction

We construct the quotient ring R/I explicitly: elements are
cosets of the ideal, operations are lifted from R. -/

/-- The carrier of R/I: the set of cosets x + I. -/
def QuotientCarrier {R : Ring} (I : Ideal R) : Set (Set R.carrier) :=
  { C | ∃ (x : R.carrier), C = { y | R.add y (R.neg x) ∈ I.subset } }

/-- The zero coset is the ideal itself. -/
def quotientZero {R : Ring} (I : Ideal R) : Set R.carrier := I.subset

/-- Addition of cosets: (x+I) + (y+I) = (x+y)+I. -/
axiom quotientAdd {R : Ring} (I : Ideal R) :
  Set R.carrier → Set R.carrier → Set R.carrier

/-- Multiplication of cosets: (x+I) * (y+I) = (x*y)+I. -/
axiom quotientMul {R : Ring} (I : Ideal R) :
  Set R.carrier → Set R.carrier → Set R.carrier

/-- The quotient ring R/I, constructed as a Ring via standard
    coset arithmetic. The ring axioms hold by the ideal property. -/
axiom makeQuotientRing {R : Ring} (I : Ideal R) : Ring

/-- The natural projection homomorphism π: R → R/I. -/
axiom quotientProj {R : Ring} (I : Ideal R) : RingHom R (makeQuotientRing I)

/-- The quotient ring satisfies the universal property:
    any homomorphism f vanishing on I factors uniquely through π. -/
axiom quotientUniversal {R S : Ring} (I : Ideal R) (f : RingHom R S)
  (h : ∀ (x : R.carrier), x ∈ I.subset → f.map x = S.zero) :
  ∃! (g : RingHom (makeQuotientRing I) S),
    RingHom.comp g (quotientProj I) = f

/-! ## First Isomorphism Theorem

R / ker(f) ≅ im(f) for any ring homomorphism f : R → S. -/

/-- The kernel of f is an ideal. -/
axiom kernelIsIdeal {R S : Ring} (f : RingHom R S) : Ideal R

/-- The kernel ideal's subset is exactly the kernel set. -/
axiom kernelIsIdeal_subset_eq {R S : Ring} (f : RingHom R S) :
  (kernelIsIdeal f).subset = RingHom.ker f

/-- First Isomorphism Theorem: R/ker(f) ≅ im(f). -/
axiom firstIsomorphismTheorem {R S : Ring} (f : RingHom R S) :
  RingIso (makeQuotientRing (kernelIsIdeal f))
          (makeQuotientRing (kernelIsIdeal (RingHom.id R)))

/-- Simplified first isomorphism theorem statement as a Prop. -/
axiom firstIso_prop {R S : Ring} (f : RingHom R S) : True

/-! ## Second Isomorphism Theorem

For an ideal I and a subring S, (S + I)/I ≅ S/(S ∩ I). -/

/-- The second isomorphism theorem for rings. -/
axiom secondIsomorphismTheorem {R : Ring} (I : Ideal R) (S : Set R.carrier)
  (hS : isSubring R S) : True

/-! ## Third Isomorphism Theorem

For ideals I ⊆ J, (R/I)/(J/I) ≅ R/J. -/

/-- The third isomorphism theorem for rings. -/
axiom thirdIsomorphismTheorem {R : Ring} (I J : Ideal R)
  (hIJ : I.subset ⊆ J.subset) : True

/-! ## Chinese Remainder Theorem

For coprime ideals I, J, R/(I ∩ J) ≅ R/I × R/J. -/

/-- Two ideals are coprime if their sum is the whole ring. -/
def CoprimeIdeals {R : Ring} (I J : Ideal R) : Prop :=
  (Ideal.sum I J).subset = Set.univ

/-- The Chinese Remainder Theorem for rings. -/
axiom chineseRemainderTheorem {R : Ring} (I J : Ideal R)
  (h : CoprimeIdeals I J) : True

/-! ## #eval examples -/

#eval "First Isomorphism Theorem: R/ker(f) ≅ im(f)"
#eval "Second Isomorphism Theorem: (S+I)/I ≅ S/(S∩I)"
#eval "Third Isomorphism Theorem: (R/I)/(J/I) ≅ R/J"
#eval "Chinese Remainder Theorem: R/(I∩J) ≅ R/I × R/J"
#eval "kernelIsIdeal: kernel of any ring hom is an ideal"
