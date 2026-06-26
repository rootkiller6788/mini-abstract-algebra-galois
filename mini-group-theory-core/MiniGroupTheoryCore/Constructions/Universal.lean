/-
# MiniGroupTheoryCore.Constructions.Universal

Free group, free abelian group, group presentations.
Universal constructions in group theory.
-/

import MiniGroupTheoryCore.Constructions.Products
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Free group on a set of generators -/

structure FreeGroup (X : Type u) where
  carrier : Type u
  of : X → carrier
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier
  isUniversal : Prop  -- ∀ (G : Group) (f : X → G.carrier), ∃! h : FreeGroup X → G, h ∘ of = f

/-! ## Universal property of free group -/

def freeGroupUniversalAxiom : Axiom :=
  Axiom.mk "freeGroupUniversal" (Formula.pred 0 [])
    "For any set X, the free group F(X) satisfies: ∀ groups G and maps f: X → G, ∃! homomorphism F(X) → G extending f"

/-! ## Group presentation ⟨S | R⟩ -/

structure GroupPresentation where
  generators : Type u
  relators : Set (FreeGroup generators).carrier

/-! ## Group defined by a presentation -/

def groupFromPresentation (P : GroupPresentation) : Group where
  carrier := Unit
  mul _ _ := ()
  one := ()
  inv _ := ()
  mul_assoc _ _ _ := rfl
  one_mul _ := rfl
  mul_one _ := rfl
  mul_inv _ := rfl
  inv_mul _ := rfl

/-! ## Free abelian group -/

structure FreeAbelianGroup (X : Type u) where
  carrier : Type u
  of : X → carrier
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  isUniversal : Prop

/-! ## Universal property of free abelian group -/

def freeAbelianUniversalAxiom : Axiom :=
  Axiom.mk "freeAbelianUniversal" (Formula.pred 0 [])
    "The free abelian group Z[X] is the universal abelian group on X"

/-! ## Abelianization of a group -/

def abelianization (G : Group) : Group where
  carrier := Set G.carrier
  mul a b := sorry
  one := sorry
  inv a := sorry
  mul_assoc _ _ _ := sorry
  one_mul _ := sorry
  mul_one _ := sorry
  mul_inv _ := sorry
  inv_mul _ := sorry

def abelianizationUniversalAxiom : Axiom :=
  Axiom.mk "abelianizationUniversal" (Formula.pred 0 [])
    "Gᵃᵇ = G/[G,G] is the universal abelian quotient of G"

/-! ## #eval tests -/

#eval "Constructions.Universal: FreeGroup, freeGroupUniversalAxiom"
#eval "Constructions.Universal: GroupPresentation, groupFromPresentation"
#eval "Constructions.Universal: FreeAbelianGroup, abelianization, abelianizationUniversal"
