/-
# MiniFieldTheoryCore.Morphisms.Equivalence

Field equivalence relations and extensions.
-/

import MiniFieldTheoryCore.Core.Basic
import MiniFieldTheoryCore.Morphisms.Iso

namespace MiniFieldTheoryCore

/-! ## FieldEquivalence -/

structure FieldEquivalence (F K : Field) where
  existsIso : Nonempty (FieldIso F K)

/-! ## ExtensionEquivalence -/

structure ExtensionEquivalence (E F : FieldExtension) where
  baseIso : FieldEquivalence E.baseField F.baseField
  extIso : FieldEquivalence E.extensionField F.extensionField

end MiniFieldTheoryCore
