/-
# MiniFieldTheoryCore.Core.Objects

Object instances for Field, FieldExtension, and related structures.
FieldBundle bundling base + extension fields, and helper toString functions.
-/

import MiniFieldTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Laws

namespace MiniFieldTheoryCore

/-! ## Object instance for Field -/

instance : MiniObjectKernel.Object Field where
  theory := MiniObjectKernel.TheoryName.ofString "FieldTheory"
  objName := "Field"
  repr F := s!"Field(char={characteristic F})"

/-! ## Object instance for FieldExtension -/

instance : MiniObjectKernel.Object FieldExtension where
  theory := MiniObjectKernel.TheoryName.ofString "FieldTheory"
  objName := "FieldExtension"
  repr E := s!"FieldExtension(deg={extensionDegree E})"

/-! ## FieldBundle — bundling base and extension fields -/

structure FieldBundle where
  base : Field
  extension : Field
  emb : FieldExtension

def FieldBundle.degree (fb : FieldBundle) : Nat :=
  extensionDegree fb.emb

def FieldBundle.isAlgebraic (fb : FieldBundle) : Prop :=
  isAlgebraicExtension fb.emb

/-! ## Helper toString functions -/

def fieldToString (F : Field) : String :=
  s!"Field(char={characteristic F})"

def extensionToString (E : FieldExtension) : String :=
  s!"{fieldToString E.baseField} ⊆ {fieldToString E.extensionField} (deg={extensionDegree E})"

def bundleToString (fb : FieldBundle) : String :=
  s!"FieldBundle: {fieldToString fb.base} → {fieldToString fb.extension}"

/-! ## Construct field bundle from base + extension + inclusion -/

def FieldBundle.mk (base extension : Field) (incl : RingHom base.ring extension.ring) : FieldBundle where
  base := base
  extension := extension
  emb := {
    baseField := base
    extensionField := extension
    inclusion := incl
  }

axiom exampleField : Field

axiom exampleRingHom : RingHom exampleField.ring exampleField.ring

def exampleBundle : FieldBundle :=
  FieldBundle.mk exampleField exampleField exampleRingHom

#eval "Core.Objects: Field Object instance registered under FieldTheory"
#eval s!"Core.Objects: Field char repr: {fieldToString exampleField}"
#eval "Core.Objects: FieldBundle with base, extension, embedding"
#eval s!"Core.Objects: bundleToString: {bundleToString exampleBundle}"

end MiniFieldTheoryCore
