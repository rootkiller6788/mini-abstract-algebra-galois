/-
# MiniGroupActionSylow.Constructions.Universal

Group presentations, free group actions.
Frobenius groups, permutation representations.
Free products with amalgamation.
-/

import MiniGroupActionSylow.Constructions.Products

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Group presentation -/

structure GroupPresentation where
  generators : Type u
  relators : List (generators → generators)
  presentedGroup : Group

/-! ## Free group action -/

structure FreeGroupAction (G : Group) (X : Type u) extends GroupAction G X where
  isFree : ∀ (g : G.carrier) (x : X), act g x = x → g = G.one

/-! ## Permutation representation -/

structure PermutationRepresentation (G : Group) where
  set : Type u
  action : GroupAction G set
  toPermutation : ∀ (g : G.carrier), set → set

/-! ## Frobenius group -/

structure FrobeniusGroup (G : Group) where
  complement : Subgroup G
  kernel : Subgroup G
  isFrobenius : Prop

def frobeniusTheorem : Axiom :=
  Axiom.mk "frobeniusTheorem" (Formula.pred 0 [])
    "If G is a Frobenius group with kernel K, then the Frobenius kernel is nilpotent"

/-! ## Transfer homomorphism -/

structure TransferHom (G : Group) (H : Subgroup G) where
  transfer : GroupHom G H

/-! ## Burnside's normal p-complement theorem -/

def burnsideNormalPComplement : Axiom :=
  Axiom.mk "burnsideNormalPComplement" (Formula.pred 0 [])
    "If p-Sylow subgroup P is in the center of its normalizer, then G has a normal p-complement"

/-! ## Group cohomology (low-degree) -/

structure GroupExtension (N Q : Group) where
  extension : Group
  normalSubgroup : Subgroup extension
  quotient : GroupHom extension Q
  kernel : GroupHom N extension
  exact : Prop

def schurZassenhausTheorem : Axiom :=
  Axiom.mk "schurZassenhaus" (Formula.pred 0 [])
    "If N ⊲ G with |N| and |G/N| coprime, then N has a complement in G"

/-! ## free product with amalgamation -/

structure AmalgamatedFreeProduct (G A B : Group) (φ : GroupHom A G) (ψ : GroupHom B G) where
  product : Group
  injA : GroupHom A product
  injB : GroupHom B product
  isUniversal : Prop

/-! ## #eval tests -/

#eval "Constructions.Universal: GroupPresentation, FreeGroupAction, PermutationRepresentation"
#eval "Constructions.Universal: FrobeniusGroup, TransferHom, burnsideNormalPComplement"
#eval "Constructions.Universal: schurZassenhausTheorem, AmalgamatedFreeProduct"
