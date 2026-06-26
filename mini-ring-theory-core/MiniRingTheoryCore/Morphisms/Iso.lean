/-
# Ring Theory Core: Ring Isomorphisms

Ring isomorphism structure and reasoning.
-/

import MiniRingTheoryCore.Core.Basic

namespace MiniRingTheoryCore

abbrev RingEq (R : Ring) (x y : R.carrier) : Prop := x = y

structure RingIso (R S : Ring) where
  toFun    : R.carrier → S.carrier
  invFun   : S.carrier → R.carrier
  leftInv  : ∀ x, invFun (toFun x) = x
  rightInv : ∀ y, toFun (invFun y) = y
  map_add  : ∀ x y, toFun (R.add x y) = S.add (toFun x) (toFun y)
  map_mul  : ∀ x y, toFun (R.mul x y) = S.mul (toFun x) (toFun y)

def congrArg {α β : Type u} {a b : α} (f : α → β) (h : a = b) : f a = f b := h ▸ rfl

def RingIso.toEq {R S : Ring} (i : RingIso R S) (x y : R.carrier) :
    x = y ↔ i.toFun x = i.toFun y :=
  ⟨congrArg i.toFun, fun h =>
    calc
      x = i.invFun (i.toFun x) := (i.leftInv x).symm
      _ = i.invFun (i.toFun y) := congrArg i.invFun h
      _ = y := i.leftInv y
  ⟩

end MiniRingTheoryCore
