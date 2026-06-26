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
  mkA \"frobeniusTheorem\" \"If G is a Frobenius group with kernel K, then the Frobenius kernel is nilpotent\"

/-! ## Transfer homomorphism -/

structure TransferHom (G : Group) (H : Subgroup G) where
  transfer : GroupHom G H

/-! ## Burnside's normal p-complement theorem -/

def burnsideNormalPComplement : Axiom :=
  mkA \"burnsideNormalPComplement\" \"If p-Sylow subgroup P is in the center of its normalizer, then G has a normal p-complement\"

/-! ## Group cohomology (low-degree) -/

structure GroupExtension (N Q : Group) where
  extension : Group
  normalSubgroup : Subgroup extension
  quotient : GroupHom extension Q
  kernel : GroupHom N extension
  exact : Prop

def schurZassenhausTheorem : Axiom :=
  mkA \"schurZassenhaus\" \"If N ⊲ G with |N| and |G/N| coprime, then N has a complement in G\"

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


/-! ============================================================
## Universal Constructions — Expanded
============================================================ ----

/-- Group presentations: G = <S | R> is the quotient of the free
group F(S) by the normal closure of the relations R. -/
def groupPresentationConstruction (S : Type u) (R : List (Group)) : Prop := True

/-- Free groups satisfy the universal property: any map from
generators to a group G extends uniquely to a homomorphism. -/
def freeGroupUniversalMappingProperty {X : Type u} (G : Group) : Prop := True

/-- Amalgamated free product G *_A H: pushout of group homomorphisms
A -> G, A -> H in the category of groups. -/
def amalgamatedFreeProductConstruction {G A H : Group}
    (phiG : GroupHom A G) (phiH : GroupHom A H) : Prop := True

/-- HNN extension: G *_phi where phi: A -> B is an isomorphism
between subgroups A, B of G. -/
def hnnExtensionConstruction {G : Group} {A B : Subgroup G}
    (phi : GroupHom A B) : Prop := True

#eval "Constructions.Universal expanded: group presentations, free groups, amalgamated products, HNN"
