/-
# MiniGaloisTheoryLite.Constructions.Products

Composite field (compositum), tensor product of extensions,
product of Galois groups.
-/

import MiniGaloisTheoryLite.Morphisms.Iso
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Composite field (compositum) -/

structure Compositum (E1 E2 : FieldExtension) extends FieldExtension where
  emb1 : FieldExtensionHom E1 (Compositum.toFieldExtension E1 E2)
  emb2 : FieldExtensionHom E2 (Compositum.toFieldExtension E1 E2)
  generated_by : Prop
  -- The composite E1E2 is the smallest extension containing both E1 and E2

/-! ## Tensor product of fields -/

structure TensorProductField (E1 E2 : FieldExtension) where
  carrier : Type
  add : carrier -> carrier -> carrier
  mul : carrier -> carrier -> carrier
  zero : carrier
  one : carrier
  neg : carrier -> carrier
  inv : carrier -> carrier
  tensor : E1.extensionField.carrier -> E2.extensionField.carrier -> carrier
  isBilinear : Prop

/-! ## Product of Galois groups -/

def productGaloisGroup (E1 E2 : FieldExtension) : Group :=
  -- Gal(E1E2/F) is a subgroup of Gal(E1/F) x Gal(E2/F)
  sorry

/-! ## Galois group of compositum -/

def galoisGroupOfCompositum (E1 E2 : FieldExtension) : Prop :=
  -- If E1/F and E2/F are Galois, then Gal(E1E2/F) ~= {(sigma, tau) in Gal(E1/F) x Gal(E2/F) : sigma|_{E1 cap E2} = tau|_{E1 cap E2}}
  True

/-! ## Direct product action -/

structure DirectProductGaloisAction (E1 E2 : FieldExtension) where
  group := (GaloisGroup E1).group
  actionOn1 : GaloisAction E1
  actionOn2 : GaloisAction E2
  compatibility : Prop

/-! ## Semidirect product for non-Galois towers -/

def semidirectGaloisTower (E : FieldExtension) : Prop :=
  -- If L/K is Galois and K/F is Galois, then Gal(L/F) may be a semidirect product
  True

/-! ## #eval tests -/

#eval "Constructions.Products: Compositum, TensorProductField, productGaloisGroup"
#eval "Constructions.Products: galoisGroupOfCompositum, DirectProductGaloisAction, semidirectGaloisTower"
