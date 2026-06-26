/-
# MiniGroupActionSylow.Bridges.ToComputation

Bridge: group actions → computational group theory.
Orbit computation, stabilizer chains, Schreier-Sims.
GAP/Magma/Sage connections for Sylow computations.
-/

import MiniGroupActionSylow.Theorems.Main

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Orbit computation algorithm -/

structure OrbitComputation (G : Group) (X : Type u) (action : GroupAction G X) where
  generators : List G.carrier
  basepoint : X
  computedOrbit : List X

def orbitAlgorithm : Axiom :=
  Axiom.mk "orbitAlgorithm" (Formula.pred 0 [])
    "Given generators g_1,...,g_k ∈ G and basepoint x ∈ X, the orbit can be computed by breadth-first search"

/-! ## Stabilizer chain -/

structure StabilizerChain (G : Group) (X : Type u) (action : GroupAction G X) where
  base : List X
  chain : List (Subgroup G)
  orbitSize : List Nat

def schreierSimsAlgorithmFull : Axiom :=
  Axiom.mk "schreierSimsAlgorithm" (Formula.pred 0 [])
    "Schreier-Sims algorithm computes a base and strong generating set for a permutation group in nearly linear time O(n^3 log |G|)"

/-! ## Sylow subgroup computation -/

structure SylowComputation (G : Group) (p : Nat) where
  sylowSubgroup : Subgroup G
  sylowNumber : Nat

def sylowComputationAlgorithm : Axiom :=
  Axiom.mk "sylowComputation" (Formula.pred 0 [])
    "Cannon-Holt algorithm computes Sylow p-subgroups via extension from chief series factors"

/-! ## Conjugacy class computation -/

def conjugacyClassAlgorithm : Axiom :=
  Axiom.mk "conjugacyClassAlg" (Formula.pred 0 [])
    "Butler's algorithm computes conjugacy classes of permutation groups via cycle structure"

/-! ## Group extension computation (cohomology) -/

structure GroupExtensionComputation (N Q : Group) where
  extension : Group
  normalSubgroup : Subgroup extension
  quotientStructure : GroupHom extension Q

def extensionAlgorithm : Axiom :=
  Axiom.mk "extensionAlgorithm" (Formula.pred 0 [])
    "H^2(Q, Z(N)) classifies group extensions 1→N→G→Q→1. Eick-O'Brien algorithm enumerates all extensions"

/-! ## Small groups database -/

structure SmallGroup where
  order : Nat
  number : Nat
  group : Group

def smallGroupDatabaseAxiom : Axiom :=
  Axiom.mk "smallGroupDatabase" (Formula.pred 0 [])
    "The Small Groups library classifies all groups of order ≤ 2000 (except 1024), identified by (order, number)"

/-! ## Burnside ring computation -/

def burnsideRingComputation : Axiom :=
  Axiom.mk "burnsideRingComp" (Formula.pred 0 [])
    "Ω(G) is a free Z-module with basis the conjugacy classes of subgroups. The mark homomorphism Ω(G)→Z^{subgroups} is injective"

/-! ## #eval tests -/

#eval "Bridges.ToComputation: OrbitComputation, orbitAlgorithm"
#eval "Bridges.ToComputation: StabilizerChain, schreierSimsAlgorithmFull"
#eval "Bridges.ToComputation: sylowComputationAlgorithm, conjugacyClassAlgorithm"
#eval "Bridges.ToComputation: extensionAlgorithm, smallGroupDatabaseAxiom, burnsideRingComputation"
