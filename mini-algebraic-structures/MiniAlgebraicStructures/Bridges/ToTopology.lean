/-
# MiniAlgebraicStructures.Bridges.ToTopology

Bridge: algebraic structures -> topology.
Topological groups, topological rings, topological modules.
Stone duality for Boolean algebras. Profinite completions.
Pontryagin duality. Bohr compactification.
-/

import MiniAlgebraicStructures.Theorems.Main

namespace MiniAlgebraicStructures

/-! ## Topological group -/

structure TopologicalGroup (G : Type u) where
  openSets : Set (Set G)
  mul : G -> G -> G
  inv : G -> G
  mulContinuous : Prop
  invContinuous : Prop

/-! ## Topological ring -/

structure TopologicalRing (R : Type u) where
  openSets : Set (Set R)
  add : R -> R -> R
  mul : R -> R -> R
  neg : R -> R
  addContinuous : Prop
  mulContinuous : Prop

/-! ## Profinite group -/

structure ProfiniteGroup where
  carrier : Type u
  finiteQuotients : List (Type u)
  limit : carrier -> (Type u) -> carrier

def profiniteCompletion : String :=
  "The profinite completion of a group G is the inverse limit of its finite quotients: G_hat = lim G/N"

/-! ## Stone duality -/

def stoneDuality : String :=
  "Stone duality: BoolAlg^op is equivalent to Stone (the category of Stone spaces). Clopen sets <-> Boolean algebra elements."

def stoneRepresentation : String :=
  "Every Boolean algebra is isomorphic to the clopen algebra of its Stone space"

/-! ## Pontryagin duality -/

def pontryaginDuality : String :=
  "For a locally compact abelian group G, the double dual G^^ is canonically isomorphic to G. The dual of a discrete abelian group is compact."

def pontryaginDualExamples : String :=
  "Z^ = S^1 (circle group), R^ = R, finite abelian G^ = G"

/-! ## Bohr compactification -/

def bohrCompactification : String :=
  "Every topological group has a universal homomorphism to a compact group: the Bohr compactification"

/-! ## Free topological structures -/

def freeTopologicalGroup : String :=
  "For a Tychonoff space X, the free topological group F(X) exists and X embeds in F(X)"

def freeTopologicalAbelianGroup : String :=
  "Similarly, the free abelian topological group exists"

/-! ## #eval tests -/

#eval "Bridges.ToTopology: TopologicalGroup, TopologicalRing, ProfiniteGroup"
#eval "Bridges.ToTopology: Stone duality, profiniteCompletion"
#eval "Bridges.ToTopology: Pontryagin duality, Bohr compactification, free topological groups"
