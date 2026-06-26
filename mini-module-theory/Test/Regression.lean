/-
# Regression Tests -- MiniModuleTheory

Regression tests ensuring no breaking changes.
-/

import MiniModuleTheory

open MiniModuleTheory

/-! ## Basic Definitions Exist -/

-- Core definitions
#check Module
#check Submodule
#check ModuleHom
#check ModuleHom.id
#check FreeModule
#check isFinitelyGenerated
#check isNoetherian
#check isArtinian
#check isExact
#check TensorProductMod

-- Objects
#check SubmoduleSet

-- Morphisms
#check ModuleHom.comp
#check ModuleIso
#check ModuleAut
#check areIsomorphic
#check moduleEquivalent
#check submoduleEquivalent
#check chainHomotopic

-- Constructions
#check DirectSum
#check DirectProduct
#check QuotientModule

-- Properties
#check moduleRank
#check moduleLength
#check isProjective
#check isInjective
#check isFlat

-- Theorems
#check firstIsoTheorem
#check secondIsoTheorem
#check thirdIsoTheorem

-- Examples
#check nonFreeExample
#check nonSplitExactSequence
#check nonNoetherianExample

/-! ## All regression checks passed -/

#eval "Regression checks complete."
