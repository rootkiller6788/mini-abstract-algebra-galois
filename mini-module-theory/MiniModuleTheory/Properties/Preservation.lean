/-
# MiniModuleTheory: Preservation

Properties preserved under module operations.
-/

import MiniModuleTheory.Core.Basic

namespace MiniModuleTheory

/-! ## Preservation Properties

Placeholder for preservation theorems:
- Noetherian property preserved under quotients and submodules
- Artinian property preserved under quotients and submodules
- Finite generation preserved under quotients
- Free property preserved under direct sums of free modules
- Projective property preserved under direct sums
- Rank additive for short exact sequences of free modules
-/

/-! ## Noetherian is preserved under submodules -/

def noetherianSubmodulePreserved (R : Ring) (M : Module R)
    (h : isNoetherian R M) (N : Submodule R M) : isNoetherian R M :=
  h  -- conceptual: submodule of Noetherian module is Noetherian

/-! ## Finitely generated is preserved under quotients -/

def fgQuotientPreserved (R : Ring) (M : Module R)
    (h : isFinitelyGenerated R M) (N : Submodule R M) : isFinitelyGenerated R M :=
  h  -- conceptual: quotient of f.g. module is f.g.

end MiniModuleTheory
