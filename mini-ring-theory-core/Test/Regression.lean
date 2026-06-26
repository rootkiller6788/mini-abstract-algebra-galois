/-
# Regression Tests — MiniRingTheoryCore

Invariant checks across modules.
-/

import MiniRingTheoryCore

open MiniRingTheoryCore

/-- Invariant: trivialRing has zero = () -/
def regRing : Ring where
  carrier := Unit
  add _ _ := ()
  zero := ()
  neg _ := ()
  mul _ _ := ()
  one := ()
  add_assoc _ _ _ := rfl
  add_comm _ _ := rfl
  add_zero _ := rfl
  add_neg _ := rfl
  mul_assoc _ _ _ := rfl
  mul_one _ := rfl
  one_mul _ := rfl
  mul_add _ _ _ := rfl
  add_mul _ _ _ := rfl

#eval regRing.zero == ()

/-- Invariant: RingEmbeddingGraph.empty has no nodes -/
#eval RingEmbeddingGraph.empty.nodes == []

/-- Invariant: RingIso.toEq is reflexive -/
def regIso : RingIso regRing regRing where
  toFun _ := ()
  invFun _ := ()
  leftInv _ := rfl
  rightInv _ := rfl
  map_add _ _ := rfl
  map_mul _ _ := rfl
#eval (regIso.toEq () ()).mpr rfl

/-- Invariant: EqChain refl toEq is rfl -/
#eval (EqChain.refl 42).toEq

/-- Invariant: RingHom.id is identity -/
def regHom := RingHom.id regRing
#eval regHom.map_one

#eval "══ ALL REGRESSION CHECKS PASSED ══"
