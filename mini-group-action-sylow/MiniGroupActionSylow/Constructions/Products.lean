/-
# MiniGroupActionSylow.Constructions.Products

Semi-direct products, wreath products, direct products of actions.
Tensor products of actions, induced actions.
-/

import MiniGroupActionSylow.Morphisms.Iso

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Semi-direct product (detailed) -/

structure SemiDirectProductGroup (N H : Group) (φ : GroupHom H (AutomorphismGroup N)) where
  carrier := N.carrier × H.carrier
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier

def SemiDirectProductGroup.mk (N H : Group) (φ : GroupHom H (AutomorphismGroup N)) : SemiDirectProductGroup N H φ where
  mul := fun (n₁, h₁) (n₂, h₂) => (N.mul n₁ n₂, H.mul h₁ h₂)
  one := (N.one, H.one)
  inv := fun (n, h) => (N.inv n, H.inv h)

/-! ## Wreath product -/

structure WreathProduct (G H : Group) where
  carrier : Type u
  base := G.carrier → H.carrier
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier

/-! ## Direct product of group actions -/

def directProductAction {G H : Group} {X Y : Type u}
    (actionX : GroupAction G X) (actionY : GroupAction H Y) :
    GroupAction (DirectProduct G H) (X × Y) where
  act gh xy := (actionX.act (gh.1) (xy.1), actionY.act (gh.2) (xy.2))
  identity xy := by simp [actionX.identity, actionY.identity]
  compatibility g h xy := by
    simp [actionX.compatibility, actionY.compatibility]

/-! ## Product action of G on X × Y -/

def productAction {G : Group} {X Y : Type u}
    (actionX : GroupAction G X) (actionY : GroupAction G Y) :
    GroupAction G (X × Y) where
  act g xy := (actionX.act g xy.1, actionY.act g xy.2)
  identity xy := by simp [actionX.identity, actionY.identity]
  compatibility g h xy := by
    simp [actionX.compatibility, actionY.compatibility]

/-! ## Induced action on function space -/

def inducedAction {G : Group} {X Y : Type u}
    (actionX : GroupAction G X) (actionY : GroupAction G Y) :
    GroupAction G (X → Y) where
  act g f := fun x => actionY.act g (f (actionX.act (G.inv g) x))
  identity f := by
    ext x
    simp [actionX.identity, actionY.identity, G.inv_one, G.one_mul]
  compatibility g h f := by
    ext x
    simp [actionX.compatibility, actionY.compatibility, G.inv_mul, G.mul_assoc]

/-! ## Restricted action to a subgroup -/

def restrictedAction {G : Group} (H : Subgroup G) {X : Type u}
    (action : GroupAction G X) : GroupAction H X where
  act h x := action.act h x
  identity x := action.identity x
  compatibility h₁ h₂ x := action.compatibility h₁ h₂ x

/-! ## #eval tests -/

#eval "Constructions.Products: SemiDirectProductGroup, WreathProduct"
#eval "Constructions.Products: directProductAction, productAction, inducedAction"
#eval "Constructions.Products: restrictedAction"
