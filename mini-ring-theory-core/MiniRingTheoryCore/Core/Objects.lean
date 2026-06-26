/-
# Ring Theory Core: Subrings and Quotients

Subring and quotient constructions for rings.
-/

import MiniRingTheoryCore.Core.Basic

namespace MiniRingTheoryCore

/-! ## Subring -/

structure Subring (R : Ring) where
  carrier : Type u
  [ring : Ring carrier]
  embed : carrier → R.carrier
  injective : ∀ x y, embed x = embed y → x = y
  zero_map : embed carrier.zero = R.zero
  add_map : ∀ x y, embed (carrier.add x y) = R.add (embed x) (embed y)
  mul_map : ∀ x y, embed (carrier.mul x y) = R.mul (embed x) (embed y)

structure SubringPredicate (R : Ring) where
  pred : R.carrier → Prop
  zero_mem : pred R.zero
  one_mem : pred R.one
  add_closed : ∀ {x y}, pred x → pred y → pred (R.add x y)
  mul_closed : ∀ {x y}, pred x → pred y → pred (R.mul x y)
  neg_closed : ∀ {x}, pred x → pred (R.neg x)

end MiniRingTheoryCore
