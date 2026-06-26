/-
# MiniGaloisTheoryLite.Morphisms.Hom

Field automorphisms, Galois group homomorphisms,
field embeddings, and restriction maps.
-/

import MiniGaloisTheoryLite.Core.Basic
import MiniGaloisTheoryLite.Core.Laws
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Field automorphism -/

structure FieldAutomorphism (F : Field) where
  map : F.carrier -> F.carrier
  map_add : forall (a b : F.carrier), map (F.add a b) = F.add (map a) (map b)
  map_mul : forall (a b : F.carrier), map (F.mul a b) = F.mul (map a) (map b)
  map_one : map F.one = F.one
  bijective : Prop

/-! ## Galois automorphism (fixes base field) -/

structure GaloisAutomorphism (E : FieldExtension) where
  automorphism : FieldAutomorphism E.extensionField
  fixesBase : forall (a : E.baseField.carrier), automorphism.map (E.emb a) = E.emb a

/-! ## Homomorphism of field extensions -/

structure FieldExtensionHom (E F : FieldExtension) where
  map : E.extensionField.carrier -> F.extensionField.carrier
  map_add : forall (a b : E.extensionField.carrier), map (E.extensionField.add a b) = F.extensionField.add (map a) (map b)
  map_mul : forall (a b : E.extensionField.carrier), map (E.extensionField.mul a b) = F.extensionField.mul (map a) (map b)
  fixesBase : forall (a : E.baseField.carrier), map (E.emb a) = F.emb a

/-! ## Restriction map -/

def restrictionMap {E : FieldExtension} (H : Subgroup (GaloisGroup E).group) (K : Subgroup (GaloisGroup E).group)
  (h : forall (x : (GaloisGroup E).group.carrier), x in H.carrier -> x in K.carrier) : GroupHom H.actGroup K.actGroup :=
  sorry

/-! ## Composition -/

def FieldExtensionHom.comp {E F G : FieldExtension} (f : FieldExtensionHom E F) (g : FieldExtensionHom F G) :
  FieldExtensionHom E G where
  map := fun x => g.map (f.map x)
  map_add := fun a b => by
    simp [g.map_add, f.map_add]
  map_mul := fun a b => by
    simp [g.map_mul, f.map_mul]
  fixesBase := fun a => by
    simp [g.fixesBase, f.fixesBase]

/-! ## Embedding of Galois groups -/

structure GaloisEmbedding (E F : FieldExtension) where
  fieldEmbedding : FieldExtensionHom E F
  inducedHom : GroupHom (GaloisGroup F).group (GaloisGroup E).group
  naturality : Prop

/-! ## #eval tests -/

#eval "Morphisms.Hom: FieldAutomorphism, GaloisAutomorphism, FieldExtensionHom"
#eval "Morphisms.Hom: restrictionMap, FieldExtensionHom.comp, GaloisEmbedding"
