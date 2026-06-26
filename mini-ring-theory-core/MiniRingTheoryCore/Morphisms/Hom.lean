/-
# Ring Theory Core: Ring Embeddings

Ring embedding framework for translating between rings.
-/

import MiniRingTheoryCore.Core.Basic

namespace MiniRingTheoryCore

structure RingEmbedding (R S : Ring) where
  toFun : R.carrier → S.carrier
  inj : ∀ x y, toFun x = toFun y → x = y
  map_add : ∀ x y, toFun (R.add x y) = S.add (toFun x) (toFun y)
  map_mul : ∀ x y, toFun (R.mul x y) = S.mul (toFun x) (toFun y)
  map_one : toFun R.one = S.one

def RingEmbedding.id (R : Ring) : RingEmbedding R R where
  toFun x := x
  inj _ _ h := h
  map_add _ _ := rfl
  map_mul _ _ := rfl
  map_one := rfl

def RingEmbedding.comp {R S T : Ring} (e1 : RingEmbedding S T) (e2 : RingEmbedding R S) : RingEmbedding R T where
  toFun x := e1.toFun (e2.toFun x)
  inj _ _ h := e2.inj _ _ (e1.inj _ _ h)
  map_add _ _ := by simp [e2.map_add, e1.map_add]
  map_mul _ _ := by simp [e2.map_mul, e1.map_mul]
  map_one := by simp [e2.map_one, e1.map_one]

end MiniRingTheoryCore
