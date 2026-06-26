/-
# MiniFieldTheoryCore.Constructions.Subobjects

Subfields and intermediate field extensions.
-/

import MiniFieldTheoryCore.Core.Basic

namespace MiniFieldTheoryCore

/-! ## Subfield

A subfield is a subset of a field that is itself a field
under the restricted operations.
-/

structure Subfield (F : Field) where
  carrier : F.ring.carrier → Prop
  containsOne : carrier F.ring.one
  closedAdd : ∀ x y, carrier x → carrier y → carrier (F.ring.add x y)
  closedMul : ∀ x y, carrier x → carrier y → carrier (F.ring.mul x y)
  closedNeg : ∀ x, carrier x → carrier (F.ring.neg x)
  closedInv : ∀ x, carrier x → x ≠ F.ring.zero → carrier (∃ y, F.ring.mul x y = F.ring.one)

/-! ## Intermediate Field

An intermediate field sits between the base field and the extension field.
-/

structure IntermediateField (E : FieldExtension) where
  subfield : Subfield E.extensionField
  containsBase : ∀ x, subfield.carrier (E.inclusion.map x)

end MiniFieldTheoryCore
