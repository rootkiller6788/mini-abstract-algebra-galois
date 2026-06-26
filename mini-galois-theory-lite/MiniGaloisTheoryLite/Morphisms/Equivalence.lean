/-
# MiniGaloisTheoryLite.Morphisms.Equivalence

Category structure for Galois extensions.
Action of Galois group on field elements.
Orbit-stabilizer analogy for Galois theory.
-/

import MiniGaloisTheoryLite.Morphisms.Iso
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Category of Galois extensions -/

structure GaloisExtCat where
  obj : Type
  hom : obj -> obj -> Type
  id : (E : obj) -> hom E E
  comp : {E F G : obj} -> hom F G -> hom E F -> hom E G

def galoisExtensionCategory : GaloisExtCat where
  obj := FieldExtension
  hom E F := FieldExtensionHom E F
  id E := {
    map := fun x => x
    map_add := fun _ _ => rfl
    map_mul := fun _ _ => rfl
    fixesBase := fun _ => rfl
  }
  comp f g := FieldExtensionHom.comp g f

/-! ## Galois group action on field elements -/

structure GaloisAction (E : FieldExtension) where
  act : (GaloisGroup E).group.carrier -> E.extensionField.carrier -> E.extensionField.carrier
  act_id : forall (x : E.extensionField.carrier), act (GaloisGroup E).group.one x = x
  act_compat : forall (g h : (GaloisGroup E).group.carrier) (x : E.extensionField.carrier),
    act ((GaloisGroup E).group.mul g h) x = act g (act h x)

/-! ## Orbit under Galois group -/

def galoisOrbit {E : FieldExtension} (a : E.extensionField.carrier) : Set E.extensionField.carrier :=
  {x | exists (sigma : GaloisAutomorphism E), sigma.automorphism.map a = x}

/-! ## Stabilizer subgroup -/

def galoisStabilizer {E : FieldExtension} (a : E.extensionField.carrier) :
  Subgroup (GaloisGroup E).group :=
  sorry

/-! ## Conjugacy of Galois automorphisms -/

def isConjugateGalois {E : FieldExtension} (sigma tau : GaloisAutomorphism E) : Prop :=
  exists (rho : GaloisAutomorphism E),
    forall (x : E.extensionField.carrier),
      sigma.automorphism.map x = rho.automorphism.map (tau.automorphism.map (Function.invFun rho.automorphism.map x))

/-! ## Equivalence of Galois extensions -/

structure GaloisEquivalence (E F : FieldExtension) where
  fieldIso : FieldIso E.extensionField F.extensionField
  groupIso : GroupIso (GaloisGroup E).group (GaloisGroup F).group
  equivariant : forall (sigma : GaloisAutomorphism E) (x : E.extensionField.carrier),
    fieldIso.toHom.map (sigma.automorphism.map x) = groupIso.toHom.map sigma |>.automorphism.map (fieldIso.toHom.map x)

/-! ## #eval tests -/

#eval "Morphisms.Equivalence: GaloisExtCat, GaloisAction, galoisOrbit, galoisStabilizer"
#eval "Morphisms.Equivalence: isConjugateGalois, GaloisEquivalence"
