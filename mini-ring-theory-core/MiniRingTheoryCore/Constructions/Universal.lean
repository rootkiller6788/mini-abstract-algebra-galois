/-
# Ring Theory Core: Universal Properties

Universal property framework for ring constructions.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Morphisms.Hom

namespace MiniRingTheoryCore

structure RingEmbeddingGraph where
  nodes    : List String
  edges    : List (String × String × String)
  deriving Repr, Inhabited

def RingEmbeddingGraph.empty : RingEmbeddingGraph := { nodes := [], edges := [] }

def RingEmbeddingGraph.add (g : RingEmbeddingGraph) (R S : String) (name : String) : RingEmbeddingGraph :=
  { nodes    := dedup (g.nodes ++ [R, S])
    edges    := dedupEdge (g.edges ++ [(R, S, name)])
  }
where
  dedup : List String → List String
    | [] => []
    | x :: xs => x :: dedup (xs.filter (· != x))
  dedupEdge : List (String × String × String) → List (String × String × String)
    | [] => []
    | x :: xs => x :: dedupEdge (xs.filter (· != x))

end MiniRingTheoryCore
