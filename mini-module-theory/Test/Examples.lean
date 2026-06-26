/-
# Examples Tests -- MiniModuleTheory

Additional example-based tests.
-/

import MiniModuleTheory

open MiniModuleTheory

/-! ## Module Examples -/

#eval "Module over a ring: carrier, add, zero, neg, smul"

/-! ## Submodule Concept -/

#eval "Submodule: subset closed under addition and scalar multiplication"

/-! ## Module Homomorphism Concept -/

#eval "ModuleHom: map preserving addition and scalar multiplication"

/-! ## Free Module Concept -/

#eval "FreeModule: universal property with basis"

/-! ## Noetherian / Artinian Concepts -/

#eval "isNoetherian: every ascending chain of submodules stabilizes"
#eval "isArtinian: every descending chain of submodules stabilizes"

/-! ## Exact Sequence Concept -/

#eval "isExact: image of f equals kernel of g"
