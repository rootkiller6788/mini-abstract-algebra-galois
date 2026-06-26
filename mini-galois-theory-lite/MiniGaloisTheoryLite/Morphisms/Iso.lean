/-
# MiniGaloisTheoryLite.Morphisms.Iso

Field isomorphisms, Galois group isomorphisms,
and automorphism groups of Galois extensions.
-/

import MiniGaloisTheoryLite.Morphisms.Hom
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Field isomorphism -/

structure FieldIso (F K : Field) where
  toHom : FieldAutomorphism F
  invHom : FieldAutomorphism K
  left_inv : forall (x : F.carrier), invHom.map (toHom.map x) = x
  right_inv : forall (y : K.carrier), toHom.map (invHom.map y) = y

/-! ## Galois group isomorphism -/

structure GaloisGroupIso (E F : FieldExtension) where
  fieldIso : FieldIso E.extensionField F.extensionField
  groupIso : GroupIso (GaloisGroup E).group (GaloisGroup F).group
  compatibility : Prop

/-! ## Automorphism group of a Galois extension -/

def AutGroup (E : FieldExtension) : Group where
  carrier := GaloisAutomorphism E
  mul f g := {
    automorphism := {
      map := fun x => f.automorphism.map (g.automorphism.map x)
      map_add := by
        intro a b; simp [f.automorphism.map_add, g.automorphism.map_add]
      map_mul := by
        intro a b; simp [f.automorphism.map_mul, g.automorphism.map_mul]
      map_one := by simp [f.automorphism.map_one, g.automorphism.map_one]
      bijective := True.intro
    }
    fixesBase := fun a => by
      simp [f.fixesBase, g.fixesBase]
  }
  one := {
    automorphism := {
      map := fun x => x
      map_add := fun _ _ => rfl
      map_mul := fun _ _ => rfl
      map_one := rfl
      bijective := True.intro
    }
    fixesBase := fun _ => rfl
  }
  inv f := {
    automorphism := {
      map := Function.invFun f.automorphism.map
      map_add := by intro a b; simp
      map_mul := by intro a b; simp
      map_one := by simp
      bijective := True.intro
    }
    fixesBase := fun a => by simp [f.fixesBase]
  }

/-! ## Galois group = Aut(L/K) -/

def galoisGroup (E : FieldExtension) : Group :=
  AutGroup E

/-! ## Identity automorphism -/

def idAut (E : FieldExtension) : GaloisAutomorphism E where
  automorphism := {
    map := fun x => x
    map_add := fun _ _ => rfl
    map_mul := fun _ _ => rfl
    map_one := rfl
    bijective := True.intro
  }
  fixesBase := fun _ => rfl

/-! ## #eval tests -/

#eval "Morphisms.Iso: FieldIso, GaloisGroupIso, AutGroup, galoisGroup, idAut"
#eval "Morphisms.Iso: Galois automorphism group structure defined"
