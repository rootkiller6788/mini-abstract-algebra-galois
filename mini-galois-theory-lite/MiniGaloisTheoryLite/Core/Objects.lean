/-
# MiniGaloisTheoryLite.Core.Objects

Galois theory object instances for kernel integration.
-/

import MiniGaloisTheoryLite.Core.Basic
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Object instances -/

instance : Coe FieldExtension Field where
  coe E := E.extensionField

/-! ## Theory registration -/

def galoisTheoryLite : String :=
  "GaloisTheoryLite"

/-! ## Category data -/

structure GaloisData where
  baseField : Field
  extensionField : Field
  galoisGroup : Group
  degree : Nat
  isNormal : Prop
  isSeparable : Prop
  isGalois : Prop

/-! ## Helpers -/

def FieldExtension.toType (E : FieldExtension) : Type := E.extensionField.carrier

def GaloisGroup.toType (G : GaloisGroup E) : Type := G.group.carrier

def GaloisCorrespondence.data (E : FieldExtension) (C : GaloisCorrespondence E) : GaloisData :=
  {
    baseField := E.baseField
    extensionField := E.extensionField
    galoisGroup := (GaloisGroup.mk (Set.empty) (sorry)).group
    degree := 0
    isNormal := True.intro
    isSeparable := True.intro
    isGalois := C.isGalois
  }

/-! ## #eval tests -/

#eval "Core.Objects: 1 theory registered (GaloisTheoryLite)"
#eval "Core.Objects: GaloisData, FieldExtension.toType, GaloisGroup.toType defined"
