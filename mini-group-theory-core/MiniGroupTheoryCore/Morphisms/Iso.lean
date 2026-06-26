/-
# MiniGroupTheoryCore.Morphisms.Iso

Group isomorphisms: definition, composition, symmetry.
Automorphism group. Inner automorphisms.
-/

import MiniGroupTheoryCore.Morphisms.Hom
import MiniGroupTheoryCore.Core.AxiomCompat
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Group isomorphism -/

structure GroupIso (G H : Group) where
  toHom : GroupHom G H
  invHom : GroupHom H G
  left_inv : ∀ (x : G.carrier), invHom.map (toHom.map x) = x
  right_inv : ∀ (y : H.carrier), toHom.map (invHom.map y) = y

/-! ## Identity isomorphism -/

def GroupIso.id (G : Group) : GroupIso G G where
  toHom := GroupHom.id G
  invHom := GroupHom.id G
  left_inv _ := rfl
  right_inv _ := rfl

/-! ## Composition of isomorphisms -/

def GroupIso.comp {G H K : Group} (f : GroupIso G H) (g : GroupIso H K) : GroupIso G K where
  toHom := GroupHom.comp g.toHom f.toHom
  invHom := GroupHom.comp f.invHom g.invHom
  left_inv x := by
    simp [GroupHom.comp, f.left_inv, g.left_inv]
  right_inv y := by
    simp [GroupHom.comp, g.right_inv, f.right_inv]

/-! ## Symmetry (inverse isomorphism) -/

def GroupIso.symm {G H : Group} (f : GroupIso G H) : GroupIso H G where
  toHom := f.invHom
  invHom := f.toHom
  left_inv := f.right_inv
  right_inv := f.left_inv

/-! ## Isomorphic groups -/

def areIsomorphic (G H : Group) : Prop :=
  Nonempty (GroupIso G H)

notation G:50 " ≅ " H:50 => areIsomorphic G H

/-! ## Automorphism group -/

structure AutGroup (G : Group) where
  carrier := GroupIso G G
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier

def AutGroup.mk (G : Group) : AutGroup G where
  mul f g := GroupIso.comp f g
  one := GroupIso.id G
  inv f := GroupIso.symm f

/-! ## Inner automorphism (conjugation by g) -/

theorem innerAut_is_bijection {G : Group} (g : G.carrier) :
  Function.Bijective (fun (x : G.carrier) => G.mul (G.mul g x) (G.inv g)) := by
  refine ⟨?_, ?_⟩
  · intro x y h
    apply Group.mul_right_cancel (G.mul g x) (G.mul g y) (G.inv g) at h
    apply Group.mul_left_cancel x y g at h
    exact h
  · intro y
    refine ⟨G.mul (G.mul (G.inv g) y) g, ?_⟩
    calc
      G.mul (G.mul g (G.mul (G.mul (G.inv g) y) g)) (G.inv g)
          = G.mul (G.mul (G.mul g (G.inv g)) y) (G.mul g (G.inv g)) := by
            simp [G.mul_assoc]
      _ = G.mul (G.mul G.one y) G.one := by rw [G.mul_inv, G.mul_inv]
      _ = y := by rw [G.one_mul, G.mul_one]

def innerAut {G : Group} (g : G.carrier) : GroupIso G G where
  toHom := {
    map := fun x => G.mul (G.mul g x) (G.inv g)
    map_mul := by
      intro x y
      simp [G.mul_assoc]
  }
  invHom := {
    map := fun x => G.mul (G.mul (G.inv g) x) g
    map_mul := by
      intro x y
      simp [G.mul_assoc]
  }
  left_inv x := by simp [G.mul_assoc]
  right_inv y := by simp [G.mul_assoc]

/-! ## Conjugacy -/

def isConjugate {G : Group} (a b : G.carrier) : Prop :=
  ∃ (g : G.carrier), G.mul (G.mul g a) (G.inv g) = b

/-! ## #eval tests -/

#eval "Morphisms.Iso: GroupIso, id, comp, symm, areIsomorphic"
#eval "Morphisms.Iso: AutGroup, innerAut, isConjugate defined"
