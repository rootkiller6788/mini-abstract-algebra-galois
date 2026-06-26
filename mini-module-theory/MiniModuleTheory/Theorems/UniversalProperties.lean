/-
# MiniModuleTheory: Universal Properties

Universal properties of module constructions.
-/

import MiniModuleTheory.Core.Basic
import MiniModuleTheory.Constructions.Products

namespace MiniModuleTheory

/-! ## Universal Mapping Properties

Placeholder for universal properties:
- Free module is the universal module with given generators
- Tensor product is the universal recipient of bilinear maps
- Direct sum (coproduct) is the universal module receiving maps from each summand
- Direct product is the universal module projecting to each factor
- Quotient module is the universal module trivializing a submodule
- Hom_R(M, -) is the right adjoint to - ⊗ M
-/

/-! ## Universal Property of Tensor Products -/

def tensorProductUniversal (R : Ring) (M N : Module R) : Prop :=
  ∀ (P : Module R) (f : M.carrier → N.carrier → P.carrier),
    (∀ (a : R.carrier) (m : M.carrier) (n : N.carrier),
      f (M.smul a m) n = f m (N.smul a n)) ∧
    True
  → ∃! (h : ModuleHom R (TensorProductMod R M N).T P), True

end MiniModuleTheory
