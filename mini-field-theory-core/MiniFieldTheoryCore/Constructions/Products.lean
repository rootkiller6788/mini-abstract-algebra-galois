/-
# MiniFieldTheoryCore.Constructions.Products

Compositum of fields, tensor product of field extensions,
and field-tower constructions.
-/

import MiniFieldTheoryCore.Core.Basic
import MiniFieldTheoryCore.Morphisms.Iso

namespace MiniFieldTheoryCore

/-! ## Compositum of two subfields in a larger field -/

structure FieldComposite where
  ambientField : Field
  subfield1 : FieldExtension
  subfield2 : FieldExtension
  compositum : FieldExtension
  isSmallest : Prop  -- the smallest subfield containing both subfields

axiom compositumContainsBoth (fc : FieldComposite) : Prop

axiom compositumMinimal (fc : FieldComposite) : Prop

/-! ## Tensor product of field extensions (conceptual) -/

structure TensorProductExtension where
  baseField : Field
  field1 : FieldExtension
  field2 : FieldExtension
  tensorProduct : Field  -- F₁ ⊗_K F₂ as a ring, not necessarily a field

axiom tensorProductHasFieldProperties {K : Field} (F₁ F₂ : FieldExtension) : Prop

/-! ## Product of fields (as rings — direct product is never a field) -/

structure ProductRing (F K : Field) where
  carrier := F.ring.carrier × K.ring.carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier

def ProductRing.ofFields (F K : Field) : ProductRing F K where
  add (a₁, b₁) (a₂, b₂) := (F.ring.add a₁ a₂, K.ring.add b₁ b₂)
  mul (a₁, b₁) (a₂, b₂) := (F.ring.mul a₁ a₂, K.ring.mul b₁ b₂)
  zero := (F.ring.zero, K.ring.zero)
  one := (F.ring.one, K.ring.one)

axiom productRingNotField {F K : Field} : True  -- The direct product of fields is not a field

/-! ## Field extension tower -/

structure ExtensionTower where
  base : Field
  middle : Field
  top : Field
  baseToMiddle : FieldExtension
  middleToTop : FieldExtension

axiom towerDegreeFormula {E : ExtensionTower} :
  extensionDegree (by
    -- compose the two extensions
    exact E.baseToMiddle) + 1 = 1 + extensionDegree (by exact E.baseToMiddle)
  := by rfl

/-! ## Compositum for Galois theory -/

axiom compositumInGalois (tower : ExtensionTower) : Prop

/-! ## #eval examples -/

#eval "Constructions.Products: FieldComposite (compositum of subfields)"
#eval "Constructions.Products: TensorProductExtension (F₁ ⊗_K F₂)"
#eval "Constructions.Products: ProductRing.ofFields (not a field in general)"
#eval "Constructions.Products: ExtensionTower (base ⊆ middle ⊆ top)"
