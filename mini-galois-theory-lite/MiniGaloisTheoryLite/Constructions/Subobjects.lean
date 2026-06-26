/-
# MiniGaloisTheoryLite.Constructions.Subobjects

Intermediate field, normal intermediate field,
subgroup of Galois group, fixed field.
-/

import MiniGaloisTheoryLite.Morphisms.Hom
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Intermediate field -/

structure IntermediateField (E : FieldExtension) where
  carrier : Set E.extensionField.carrier
  containsBase : forall (a : E.baseField.carrier), E.emb a in carrier
  closedAdd : forall {a b : E.extensionField.carrier}, a in carrier -> b in carrier -> E.extensionField.add a b in carrier
  closedMul : forall {a b : E.extensionField.carrier}, a in carrier -> b in carrier -> E.extensionField.mul a b in carrier
  closedNeg : forall {a : E.extensionField.carrier}, a in carrier -> E.extensionField.neg a in carrier
  closedInv : forall {a : E.extensionField.carrier}, a in carrier -> a <> E.extensionField.zero -> E.extensionField.inv a in carrier

/-! ## Normal intermediate field (corresponds to normal subgroup) -/

structure NormalIntermediateField (E : FieldExtension) extends IntermediateField E where
  isNormalOverBase : Prop
  -- The corresponding extension E.carrier / baseField is normal

/-! ## Fixed field of a subgroup -/

def fixedFieldOfSubgroup {E : FieldExtension} (H : Subgroup (GaloisGroup E).group) : IntermediateField E where
  carrier := {x | forall (sigma : GaloisAutomorphism E), sigma.automorphism.map x = x}
  containsBase := fun a sigma => sigma.fixesBase a
  closedAdd := by
    intro a b ha hb sigma
    simp [sigma.automorphism.map_add, ha sigma, hb sigma]
  closedMul := by
    intro a b ha hb sigma
    simp [sigma.automorphism.map_mul, ha sigma, hb sigma]
  closedNeg := by
    intro a ha sigma
    have h := ha sigma
    sorry
  closedInv := by
    intro a ha hne sigma
    sorry

/-! ## Subgroup of Galois group fixing an intermediate field -/

def galoisGroupOfIntermediate {E : FieldExtension} (K : IntermediateField E) : Subgroup (GaloisGroup E).group where
  carrier := {sigma | forall (x : E.extensionField.carrier), x in K.carrier -> sigma.automorphism.map x = x}
  containsOne := by
    intro x hx; rfl
  closedMul := by
    intro sigma tau hs ht x hx
    simp [hs x hx, ht x hx]
  closedInv := by
    intro sigma hs x hx
    sorry

/-! ## Galois connection (order-reversing) -/

def galoisConnection {E : FieldExtension} : Prop :=
  forall (K1 K2 : IntermediateField E),
    (forall x, x in K1.carrier -> x in K2.carrier) <->
    (forall sigma, sigma in (galoisGroupOfIntermediate K2).carrier -> sigma in (galoisGroupOfIntermediate K1).carrier)

/-! ## #eval tests -/

#eval "Constructions.Subobjects: IntermediateField, NormalIntermediateField"
#eval "Constructions.Subobjects: fixedFieldOfSubgroup, galoisGroupOfIntermediate, galoisConnection"
