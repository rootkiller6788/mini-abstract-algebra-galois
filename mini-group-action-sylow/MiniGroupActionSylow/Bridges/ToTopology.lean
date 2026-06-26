/-
# MiniGroupActionSylow.Bridges.ToTopology

Bridge: group actions → topology.
Classifying spaces, Borel construction, equivariant cohomology.
Group actions on topological spaces.
-/

import MiniGroupActionSylow.Theorems.Main

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Topological group action -/

structure TopologicalGroupAction (G : Group) (X : Type u) extends GroupAction G X where
  isContinuous : Prop

/-! ## Classifying space BG -/

structure ClassifyingSpace (G : Group) where
  totalSpace : Type u
  baseSpace : Type u
  projection : totalSpace → baseSpace
  isUniversal : Prop
  fiber : baseSpace → Set totalSpace

def classifyingSpaceUniversal : Axiom :=
  Axiom.mk "classifyingSpace" (Formula.pred 0 [])
    "For a topological group G, BG classifies principal G-bundles: [X, BG] ≅ Prin_G(X)"

/-! ## Borel construction -/

structure BorelConstruction (G : Group) (X : Type u) (action : GroupAction G X) where
  totalSpace : Type u
  baseSpace : Type u
  projection : totalSpace → baseSpace

def borelConstruction : Axiom :=
  Axiom.mk "borelConstruction" (Formula.pred 0 [])
    "X_G = EG ×_G X → BG is the Borel fibration. H^*_G(X) = H^*(X_G)"

/-! ## Equivariant cohomology -/

def equivariantCohomology : Axiom :=
  Axiom.mk "equivariantCohomology" (Formula.pred 0 [])
    "H^*_G(X) = H^*(EG ×_G X) classifies equivariant characteristic classes"

/-! ## Group cohomology as equivariant cohomology -/

def groupCohomologyEquivariant : Axiom :=
  Axiom.mk "groupCohomology" (Formula.pred 0 [])
    "H^*(G, M) = H^*_G(pt, M) = H^*(BG, M) -- group cohomology is equivariant cohomology of a point"

/-! ## Finite group actions on spheres -/

def finiteGroupActionsOnSpheres : Axiom :=
  Axiom.mk "groupsOnSpheres" (Formula.pred 0 [])
    "If a finite group G acts freely on S^{2n-1}, then every abelian subgroup of G is cyclic (Smith theory)"

/-! ## G-CW complex -/

structure GCWComplex (G : Group) where
  skeleton : Nat → Type u
  cells : Nat → G.carrier → Type u
  attachingMaps : ∀ (n : Nat), skeleton n → skeleton (n+1)

def gCWApproximation : Axiom :=
  Axiom.mk "gCWApproximation" (Formula.pred 0 [])
    "Every G-space has a G-CW approximation, and G-CW complexes are cofibrant in the model category of G-spaces"

/-! ## #eval tests -/

#eval "Bridges.ToTopology: TopologicalGroupAction, ClassifyingSpace, BorelConstruction"
#eval "Bridges.ToTopology: equivariantCohomology, groupCohomologyEquivariant"
#eval "Bridges.ToTopology: finiteGroupActionsOnSpheres, gCWApproximation"
