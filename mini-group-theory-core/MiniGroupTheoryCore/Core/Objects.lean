/-
# MiniGroupTheoryCore.Core.Objects

Kernel Object instances for group-theoretic structures.
-/

import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Objects
import MiniGroupTheoryCore.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

def groupTheory : Objects.TheoryName := Objects.TheoryName.ofString "GroupTheory"

instance : Objects.Object Group where
  theory := groupTheory
  objName := "Group"
  repr _ := "G"

/-! ## Theory registration -/

def groupTheoryName : TheoryName :=
  TheoryName.ofString "GroupTheory"

/-! ## Dependency nodes -/

def groupTheoryNode : Dependency.TheoryNode :=
  Dependency.node groupTheoryName #[]

/-! ## Helpers -/

def Group.toType (G : Group) : Type u := G.carrier

#eval "Core.Objects: Group Object registered"
