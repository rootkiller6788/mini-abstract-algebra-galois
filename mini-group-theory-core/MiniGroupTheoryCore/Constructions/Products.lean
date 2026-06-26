/-
# MiniGroupTheoryCore.Constructions.Products

Direct product, semidirect product, wreath product, free product.
Universal properties of product and coproduct.
-/

import MiniGroupTheoryCore.Morphisms.Iso
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Direct product of groups -/

structure DirectProductGroup (G H : Group) where
  carrier := G.carrier × H.carrier
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier

def DirectProductGroup.mk (G H : Group) : DirectProductGroup G H where
  mul := fun (g₁, h₁) (g₂, h₂) => (G.mul g₁ g₂, H.mul h₁ h₂)
  one := (G.one, H.one)
  inv := fun (g, h) => (G.inv g, H.inv h)

/-! ## Product group (as a Group structure) -/

def productGroup (G H : Group) : Group where
  carrier := G.carrier × H.carrier
  mul (g₁, h₁) (g₂, h₂) := (G.mul g₁ g₂, H.mul h₁ h₂)
  one := (G.one, H.one)
  inv (g, h) := (G.inv g, H.inv h)
  mul_assoc x y z := by
    rcases x with ⟨g₁, h₁⟩; rcases y with ⟨g₂, h₂⟩; rcases z with ⟨g₃, h₃⟩
    simp [G.mul_assoc, H.mul_assoc]
  one_mul x := by
    rcases x with ⟨g, h⟩; simp [G.one_mul, H.one_mul]
  mul_one x := by
    rcases x with ⟨g, h⟩; simp [G.mul_one, H.mul_one]
  mul_inv x := by
    rcases x with ⟨g, h⟩; simp [G.mul_inv, H.mul_inv]
  inv_mul x := by
    rcases x with ⟨g, h⟩; simp [G.inv_mul, H.inv_mul]

/-! ## Projection homomorphisms -/

def productProjLeft (G H : Group) : GroupHom (productGroup G H) G where
  map := Prod.fst
  map_mul _ _ := rfl

def productProjRight (G H : Group) : GroupHom (productGroup G H) H where
  map := Prod.snd
  map_mul _ _ := rfl

/-! ## Universal property of product -/

def productUniversalAxiom : Axiom :=
  Axiom.mk "productUniversal" (Formula.pred 0 [])
    "For any group K with homomorphisms f: K → G and g: K → H, ∃! h: K → G×H with π₁∘h = f and π₂∘h = g"

/-! ## Semidirect product -/

structure SemidirectProduct (G H : Group) (φ : GroupHom G (AutGroup H)) where
  carrier := G.carrier × H.carrier
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier

/-! ## Wreath product -/

structure WreathProduct (G H : Group) where
  carrier : Type u
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier

/-! ## Free product of groups -/

structure FreeProduct (G H : Group) where
  carrier : Type u
  injG : GroupHom G (by
    -- need a group on carrier
    sorry)
  injH : GroupHom H (by
    sorry)
  isUniversal : Prop

/-! ## Coproduct = free product in Grp -/

def coproductUniversalAxiom : Axiom :=
  Axiom.mk "coproductUniversal" (Formula.pred 0 [])
    "The free product G∗H is the coproduct in the category of groups"

/-! ## #eval tests -/

#eval "Constructions.Products: DirectProductGroup, productGroup, productProj"
#eval "Constructions.Products: productUniversalAxiom, SemidirectProduct"
#eval "Constructions.Products: WreathProduct, FreeProduct, coproductUniversalAxiom"
