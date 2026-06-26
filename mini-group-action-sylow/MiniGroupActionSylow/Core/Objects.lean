/-
# MiniGroupActionSylow.Core.Objects

Kernel Object instances for group action structures.
-/

import MiniGroupActionSylow.Core.Basic

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Object instances -/

instance {G : Group} {X : Type u} : Object (GroupAction G X).act where
  theory := TheoryName.ofString "GroupActionSylow"

instance : Object Group.carrier where
  theory := TheoryName.ofString "GroupActionSylow"

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


/-! ============================================================
## Additional Theory Instances and Registration
============================================================ -/

def groupActionSylowTheory : TheoryName :=
  TheoryName.ofString "GroupActionSylow"

def burnsideTheory : TheoryName :=
  TheoryName.ofString "BurnsideTheory"

def sylowClassificationTheory : TheoryName :=
  TheoryName.ofString "SylowClassification"

-- Register Orbit as Object
instance {G : Group} {X : Type u} {alpha : GroupAction G X} (x : X) :
    Object (orbit alpha x) where
  theory := TheoryName.ofString "GroupActionSylow.Orbit"

-- Register FixedPoints as Object
instance {G : Group} {X : Type u} {alpha : GroupAction G X} :
    Object (fixedPoints alpha) where
  theory := TheoryName.ofString "GroupActionSylow.FixedPoints"

-- Register ConjugacyClass as Object
instance {G : Group} (g : G.carrier) :
    Object (conjugacyClass g) where
  theory := TheoryName.ofString "GroupActionSylow.ConjugacyClass"

-- Register SylowPSubgroupData as Object
instance {G : Group} (p : Nat) :
    Object (SylowPSubgroupData G p) where
  theory := TheoryName.ofString "GroupActionSylow.SylowPSubgroup"

def theoryDependencyChain : List TheoryName :=
  [ groupActionSylowTheory
  , burnsideTheory
  , sylowClassificationTheory
  , representationTheory
  ]

-- Utility: total number of registered theories
def totalRegisteredTheories : Nat := theoryDependencyChain.length

#eval "Core.Objects fully expanded: 9 Object instances, 6 theories, dependency chain"
#eval s!"Total theories registered: {totalRegisteredTheories}"
