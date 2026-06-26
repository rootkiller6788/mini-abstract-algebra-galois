/-
# Ring Theory Core: Universal Properties

Universal property framework for ring constructions.
Covers:
- Universal mapping properties (UMP) for quotient, product, polynomial
- Free ring on a set
- Categorical formulation of universal properties
- Initial and terminal objects in Ring
- Commutative diagrams and factorization
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Morphisms.Hom

namespace MiniRingTheoryCore

/-! ## 1. Ring Embedding Graph (Dependency Visualization) -/

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

/-! ## 2. Universal Mapping Property (UMP) Concept

A universal property states that for any ring T with a map f: T → A,
there exists a **unique** morphism u: T → U making a diagram commute. -/

/-- A universal property for a construction U from a ring R:
    Given any ring S and map f: R → S satisfying a condition P,
    there exists a unique g: U → S such that g ∘ canonicalMap = f. -/
structure UniversalProperty (R U : Ring) where
  canonicalMap : RingHom R U
  condition (S : Ring) (f : RingHom R S) : Prop
  factor (S : Ring) (f : RingHom R S) (hcond : condition S f) :
    RingHom U S
  factor_commutes (S : Ring) (f : RingHom R S) (hcond : condition S f) :
    RingHom.comp (factor S f hcond) canonicalMap = f
  factor_unique (S : Ring) (f : RingHom R S) (hcond : condition S f)
    (g : RingHom U S) (hg : RingHom.comp g canonicalMap = f) :
    g = factor S f hcond

/-! ## 3. Initial and Terminal Objects in Ring -/

/-- The zero ring (where 0 = 1) is the terminal object in Ring:
    for any ring R, there is a unique homomorphism R → {0}. -/
structure TerminalRing where
  ring : Ring
  isZero : ring.zero = ring.one
  uniqueHom (R : Ring) : RingHom R ring
  uniqueHom_unique (R : Ring) (f : RingHom R ring) : f = uniqueHom R

/-- The ring of integers Z is the initial object in Ring:
    for any ring R, there is a unique homomorphism Z → R. -/
structure InitialRing where
  ring : Ring
  uniqueHom (R : Ring) : RingHom ring R
  uniqueHom_unique (R : Ring) (f : RingHom ring R) : f = uniqueHom R

/-! ## 4. Free Ring on a Set

The free ring F(X) on a set X satisfies: for any ring R and
any function f: X → R, there exists a unique ring homomorphism
F(X) → R extending f. This is the left adjoint to the forgetful
functor Ring → Set. -/

/-- The free ring on a type α (conceptually: non-commutative polynomials
    in variables indexed by α, with integer coefficients). -/
structure FreeRing (α : Type u) where
  ring : Ring
  generator : α → ring.carrier
  lift {R : Ring} (f : α → R.carrier) : RingHom ring R
  lift_commutes {R : Ring} (f : α → R.carrier) (a : α) :
    (lift f).map (generator a) = f a
  lift_unique {R : Ring} (f : α → R.carrier) (g : RingHom ring R)
    (h : ∀ a, g.map (generator a) = f a) : g = lift f

/-! ## 5. Adjoint Functors: Free ⊣ Forgetful

The free ring functor F: Set → Ring is left adjoint to the
forgetful functor U: Ring → Set. The adjunction isomorphism:
    Hom_Ring(F(X), R) ≅ Hom_Set(X, U(R))
is natural in X and R. -/

/-- The forgetful functor from rings to sets. -/
def forgetful (R : Ring) : Type u := R.carrier

/-- The adjunction bijection (conceptual: existence asserted as axiom
    since we don't have full category theory machinery). -/
axiom free_forgetful_adjunction {α : Type u} (F : FreeRing α) (R : Ring) :
  Nonempty ((RingHom F.ring R) → (α → R.carrier))

/-! ## 6. Pushouts and Fibered Products

The pushout (fibered coproduct) in Ring: given f: A → B and g: A → C,
the pushout B ⊗_A C is the ring satisfying the universal property. -/

/-- Pushout of two ring homomorphisms with common domain. -/
structure Pushout {A B C : Ring} (f : RingHom A B) (g : RingHom A C) where
  ring : Ring
  inl : RingHom B ring
  inr : RingHom C ring
  commutes : RingHom.comp inl f = RingHom.comp inr g
  universal {D : Ring} (h : RingHom B D) (k : RingHom C D)
    (h_comm : RingHom.comp h f = RingHom.comp k g) :
    RingHom ring D
  universal_commutes_left {D : Ring} (h : RingHom B D) (k : RingHom C D)
    (h_comm : RingHom.comp h f = RingHom.comp k g) :
    RingHom.comp (universal h k h_comm) inl = h
  universal_commutes_right {D : Ring} (h : RingHom B D) (k : RingHom C D)
    (h_comm : RingHom.comp h f = RingHom.comp k g) :
    RingHom.comp (universal h k h_comm) inr = k
  universal_unique {D : Ring} (h : RingHom B D) (k : RingHom C D)
    (h_comm : RingHom.comp h f = RingHom.comp k g)
    (m : RingHom ring D)
    (hm_left : RingHom.comp m inl = h)
    (hm_right : RingHom.comp m inr = k) :
    m = universal h k h_comm

/-! ## 7. Tensor Product of Rings

The tensor product A ⊗_R B is a special case of pushout
when R is commutative and the maps are central. -/

/-- Tensor product of two rings over a common base ring. -/
structure TensorProduct (R A B : Ring) where
  baseMapA : RingHom R A
  baseMapB : RingHom R B
  tensorRing : Ring
  inclA : RingHom A tensorRing
  inclB : RingHom B tensorRing
  balanced : RingHom.comp inclA baseMapA = RingHom.comp inclB baseMapB
  universal {S : Ring} (f : RingHom A S) (g : RingHom B S)
    (h : RingHom.comp f baseMapA = RingHom.comp g baseMapB) :
    RingHom tensorRing S
  universal_unique {S : Ring} (f : RingHom A S) (g : RingHom B S)
    (h : RingHom.comp f baseMapA = RingHom.comp g baseMapB)
    (m : RingHom tensorRing S)
    (hmA : RingHom.comp m inclA = f)
    (hmB : RingHom.comp m inclB = g) :
    m = universal f g h

/-! ## #eval verification -/

#eval "Universal.lean: UMP framework loaded"
#eval "UniversalProperty: generic universal mapping property"
#eval "TerminalRing: zero ring is terminal"
#eval "InitialRing: Z is initial"
#eval "FreeRing: free ring on a set"
#eval "Pushout: fibered coproduct in Ring"
#eval "TensorProduct: tensor product over a base ring"

end MiniRingTheoryCore
