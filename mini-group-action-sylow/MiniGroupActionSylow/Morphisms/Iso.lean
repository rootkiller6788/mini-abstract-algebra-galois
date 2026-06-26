/-
# MiniGroupActionSylow.Morphisms.Iso

Isomorphisms of group actions (equivariant bijections).
Automorphism group of an action.
-/

import MiniGroupActionSylow.Morphisms.Hom

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Action isomorphism -/

structure ActionIso {G : Group} {X Y : Type u} (actionX : GroupAction G X) (actionY : GroupAction G Y) where
  toEquivariant : EquivariantMap actionX actionY
  inv : EquivariantMap actionY actionX
  left_inv : ∀ (x : X), inv.map (toEquivariant.map x) = x
  right_inv : ∀ (y : Y), toEquivariant.map (inv.map y) = y

def ActionIso.symm {G : Group} {X Y : Type u} {actionX : GroupAction G X} {actionY : GroupAction G Y}
    (i : ActionIso actionX actionY) : ActionIso actionY actionX where
  toEquivariant := i.inv
  inv := i.toEquivariant
  left_inv := i.right_inv
  right_inv := i.left_inv

def ActionIso.comp {G : Group} {X Y Z : Type u}
    {actionX : GroupAction G X} {actionY : GroupAction G Y} {actionZ : GroupAction G Z}
    (f : ActionIso actionX actionY) (g : ActionIso actionY actionZ) : ActionIso actionX actionZ where
  toEquivariant := EquivariantMap.comp f.toEquivariant g.toEquivariant
  inv := EquivariantMap.comp g.inv f.inv
  left_inv := by
    intro x; simp [EquivariantMap.comp, g.left_inv, f.left_inv]
  right_inv := by
    intro y; simp [EquivariantMap.comp, f.right_inv, g.right_inv]

/-! ## Automorphism group of an action -/

structure AutomorphismGroup (G : Group) where
  carrier : Type u
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier

def actionAutomorphismGroup {G : Group} {X : Type u} (action : GroupAction G X) : AutomorphismGroup G where
  carrier := ActionIso action action
  mul f g := ActionIso.comp f g
  one := ActionIso.mk (EquivariantMap.id action) (EquivariantMap.id action) (fun _ => rfl) (fun _ => rfl)
  inv f := f.symm

/-! ## Conjugation action of G on itself -/

def conjugationAction (G : Group) : GroupAction G G.carrier where
  act g x := G.mul (G.mul g x) (G.inv g)
  identity x := by
    simp [G.one_mul, G.mul_one, G.inv_mul]
  compatibility g h x := by
    simp [G.mul_assoc, G.inv_mul, G.mul_one]

/-! ## Left multiplication action -/

def leftMultiplicationAction (G : Group) : GroupAction G G.carrier where
  act g x := G.mul g x
  identity x := G.one_mul x
  compatibility g h x := by
    rw [G.mul_assoc]

/-! ## #eval tests -/

#eval "Morphisms.Iso: ActionIso, symm, comp, actionAutomorphismGroup"
#eval "Morphisms.Iso: conjugationAction, leftMultiplicationAction"
