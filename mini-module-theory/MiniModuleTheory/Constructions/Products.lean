/-
# MiniModuleTheory: Products

Product and direct sum constructions for modules.
-/

import MiniModuleTheory.Core.Basic

namespace MiniModuleTheory

/-! ## Direct Sum of Two Modules -/

structure DirectSum (R : Ring) (M N : Module R) where
  carrier : Type u
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  smul : R.carrier → carrier → carrier
  add_assoc : ∀ (x y z : carrier), add (add x y) z = add x (add y z)
  add_comm : ∀ (x y : carrier), add x y = add y x
  add_zero : ∀ (x : carrier), add x zero = x
  add_neg : ∀ (x : carrier), add x (neg x) = zero
  smul_one : ∀ (x : carrier), smul R.one x = x
  smul_add : ∀ (a : R.carrier) (x y : carrier), smul a (add x y) = add (smul a x) (smul a y)
  add_smul : ∀ (a b : R.carrier) (x : carrier), smul (R.add a b) x = add (smul a x) (smul b x)
  mul_smul : ∀ (a b : R.carrier) (x : carrier), smul (R.mul a b) x = smul a (smul b x)
  incl_left : ModuleHom R M M  -- conceptual projection
  incl_right : ModuleHom R N N  -- conceptual projection

/-! ## Direct Product of Modules (conceptual) -/

structure DirectProduct (R : Ring) (M N : Module R) where
  Prod : Module R
  proj: ModuleHom R Prod M
  proj: ModuleHom R Prod N

/-! ## Infinite Direct Sum (conceptual) -/

def infiniteDirectSum (R : Ring) (I : Type u) (M : I → Module R) : Module R :=
  -- conceptual: ⊕_{i∈I} M_i
  sorry

end MiniModuleTheory
