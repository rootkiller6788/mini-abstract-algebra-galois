/-
# MiniFieldTheoryCore.Morphisms.Hom

Field homomorphisms (morphisms between fields).
-/

import MiniFieldTheoryCore.Core.Basic

namespace MiniFieldTheoryCore

/-! ## FieldHom -/

structure FieldHom (F K : Field) where
  map : F.ring.carrier → K.ring.carrier
  isRingHom : RingHom F.ring K.ring
  preservesOne : map F.ring.one = K.ring.one

/-! ## Identity and Composition -/

def FieldHom.id (F : Field) : FieldHom F F where
  map := id
  isRingHom := RingHom.id F.ring
  preservesOne := rfl

def FieldHom.comp {F K L : Field} (g : FieldHom K L) (f : FieldHom F K) : FieldHom F L where
  map := g.map ∘ f.map
  isRingHom := RingHom.comp g.isRingHom f.isRingHom
  preservesOne := by
    simp [f.preservesOne, g.preservesOne]

end MiniFieldTheoryCore
