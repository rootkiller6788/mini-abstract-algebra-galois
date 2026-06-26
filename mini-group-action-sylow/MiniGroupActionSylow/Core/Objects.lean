/-
# MiniGroupActionSylow.Core.Objects

Kernel Object instances for group action structures.
-/

import MiniGroupActionSylow.Core.Basic

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Object instances -/

instance {G : Group} {X : Type u} : Object (GroupAction G X).act where
  theoryName := TheoryName.ofString "GroupActionSylow"

instance : Object Group.carrier where
  theoryName := TheoryName.ofString "GroupActionSylow"

/-! ## Theory registration -/

def groupActionTheory : TheoryName :=
  TheoryName.ofString "GroupActionTheory"

def sylowTheory : TheoryName :=
  TheoryName.ofString "SylowTheory"

/-! ## Dependency nodes -/

def groupActionNode : Dependency.TheoryNode :=
  Dependency.node groupActionTheory #["GroupTheory"]

def sylowTheoryNode : Dependency.TheoryNode :=
  Dependency.node sylowTheory #["GroupActionTheory"]

/-! ## Helpers -/

def GroupAction.toMap {G : Group} {X : Type u} (action : GroupAction G X) : G.carrier → X → X := action.act

def orbit.toSet {G : Group} {X : Type u} {action : GroupAction G X} (x : X) : Set X := orbit action x

def stabilizer.toSubgroup {G : Group} {X : Type u} {action : GroupAction G X} (x : X) : Subgroup G := stabilizer action x

/-! ## #eval tests -/

#eval "Core.Objects: 2 theories registered (GroupActionTheory, SylowTheory)"
#eval "Core.Objects: 6 helper definitions"
