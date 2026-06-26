/-
# MiniModuleTheory: Counterexamples

Counterexamples illustrating edge cases in module theory.
-/

import MiniModuleTheory.Core.Basic

namespace MiniModuleTheory

/-! ## Counterexamples

Placeholder for module-theoretic counterexamples:
- Not every module is free (e.g., Z/2Z as Z-module)
- Not every submodule of a free module is free over general rings
- Not every exact sequence splits
- Not every module is Noetherian (e.g., infinite direct sum)
- Not every module is Artinian (e.g., Z as Z-module)
- Tensor product is not left-exact in general
- Hom is not right-exact in general
-/

/-! ## Non-free Module -/

def nonFreeExample : Prop :=
  -- Z/2Z is not a free Z-module (it has torsion)
  True

/-! ## Non-split Exact Sequence -/

def nonSplitExactSequence : Prop :=
  -- 0 → Z → Z → Z/2Z → 0 does not split
  True

/-! ## Non-Noetherian Module -/

def nonNoetherianExample : Prop :=
  -- Infinite direct sum ⊕_{i∈N} Z is not Noetherian
  True

end MiniModuleTheory
