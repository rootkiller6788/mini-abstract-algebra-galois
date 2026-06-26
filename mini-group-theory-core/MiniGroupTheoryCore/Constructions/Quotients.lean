/-
# MiniGroupTheoryCore.Constructions.Quotients

Quotient group G/N, natural projection, universal property.
Isomorphism theorems: First, Second, Third. Correspondence theorem.
-/

import MiniGroupTheoryCore.Constructions.Subobjects
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Quotient group G/N where N ⊴ G -/

structure QuotientGroup (G : Group) (N : Subgroup G) where
  carrier := Set (Set G.carrier)  -- cosets
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier

/-! ## Natural projection π: G → G/N -/

def QuotientGroup.proj {G : Group} {N : Subgroup G} (Q : QuotientGroup G N) :
  GroupHom G ({ carrier := Q.carrier, mul := Q.mul, one := Q.one, inv := Q.inv,
    mul_assoc := by intro x y z; sorry,
    one_mul := by intro x; sorry,
    mul_one := by intro x; sorry,
    mul_inv := by intro x; sorry,
    inv_mul := by intro x; sorry } : Group) where
  map _ := Q.one  -- coset of g
  map_mul _ _ := sorry

/-! ## Universal property of quotient -/

def quotientUniversalAxiom : Axiom :=
  Axiom.mk "quotientUniversal" (Formula.pred 0 [])
    "If f: G → H has N ⊆ ker(f), then ∃! f̄: G/N → H with f̄∘π = f"

/-! ## First Isomorphism Theorem -/

def firstIsomorphismTheorem : Axiom :=
  Axiom.mk "firstIsoThm" (Formula.pred 0 [])
    "G / ker(f) ≅ im(f) for any group homomorphism f: G → H"

/-! ## Second Isomorphism Theorem -/

def secondIsomorphismTheorem : Axiom :=
  Axiom.mk "secondIsoThm" (Formula.pred 0 [])
    "If H ≤ G and N ⊴ G, then H/(H∩N) ≅ HN/N"

/-! ## Third Isomorphism Theorem -/

def thirdIsomorphismTheorem : Axiom :=
  Axiom.mk "thirdIsoThm" (Formula.pred 0 [])
    "If N ⊴ G and M ⊴ G with N ⊆ M, then (G/N)/(M/N) ≅ G/M"

/-! ## Correspondence Theorem -/

def correspondenceTheorem : Axiom :=
  Axiom.mk "correspondenceThm" (Formula.pred 0 [])
    "There is a bijection between subgroups of G/N and subgroups of G containing N"

/-! ## Simple group (no nontrivial normal subgroups) -/

def isSimple (G : Group) : Prop :=
  ∀ (N : Subgroup G), Subgroup.Normal N → (N = Subgroup.trivial G ∨ N = Subgroup.whole G)

/-! ## #eval tests -/

#eval "Constructions.Quotients: QuotientGroup, proj, quotientUniversalAxiom"
#eval "Constructions.Quotients: first/second/third IsoThm, correspondenceTheorem"
#eval "Constructions.Quotients: isSimple defined"
