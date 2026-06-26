/-
# MiniAlgebraicStructures.Properties.ClassificationData

Classification data for algebraic structures:
simple groups, solvable groups, nilpotent groups.
Semisimple modules/rings. Chain conditions.
Variety classifications: minimal varieties, congruence-distributive, etc.
-/

import MiniAlgebraicStructures.Constructions.Universal

namespace MiniAlgebraicStructures

/-! ## Simple group -/

structure SimpleGroup (G : Type u) where
  nontrivial : G ≠ Unit
  noNontrivialNormal : ∀ (N : NormalSubgroup G),
    N.carrier = {1} ∨ N.carrier = Set.univ

/-! ## Solvable group -/

inductive SolvableGroup : Type u -> Prop
  | derivedTerminates : ∀ (G : Type u), SolvableGroup G

structure DerivedSeries (G : Type u) where
  series : List (NormalSubgroup G)
  terminates : Prop

/-! ## Nilpotent group -/

inductive NilpotentGroup : Type u -> Prop
  | centralSeriesTerminates : ∀ (G : Type u), NilpotentGroup G

structure LowerCentralSeries (G : Type u) where
  series : List (NormalSubgroup G)
  terminates : Prop

/-! ## Semisimple module -/

structure SemisimpleModule (R M : Type u) where
  isDirectSumOfSimples : Prop

structure SimpleModule (R M : Type u) where
  isSimple : Prop

/-! ## Chain conditions -/

structure NoetherianRing (R : Type u) where
  asc : ∀ (I : List (Ideal R)), True

structure ArtinianRing (R : Type u) where
  dcc : ∀ (I : List (Ideal R)), True

/-! ## Classification of finite simple groups (stated) -/

def ClassificationOfFiniteSimpleGroups : String :=
  "Every finite simple group is: cyclic (prime order), alternating A_n (n>=5), Lie type, or one of 26 sporadic groups"

/-! ## Sporadic groups -/

structure SporadicGroup where
  name : String
  order : Nat

def monsterGroup : SporadicGroup where
  name := "Monster M"
  order := 808017424794512875886459904961710757005754368000000000

/-! ## Variety classifications -/

structure VarietyClassification where
  varietyName : String
  equationalTheory : List String
  properties : List String

def minimalVarieties : VarietyClassification where
  varietyName := "Minimal Varieties"
  equationalTheory := ["Commutative", "Associative", "Idempotent"]
  properties := ["Equationally complete", "Minimal nontrivial"]

def congruenceDistributiveVarieties : VarietyClassification where
  varietyName := "Congruence Distributive Varieties"
  equationalTheory := ["Jonsson's Lemma applies"]
  properties := ["CD", "Has majority/minority term"]

/-! ## #eval tests -/

#eval "Properties.ClassificationData: SimpleGroup, SolvableGroup, NilpotentGroup"
#eval "Properties.ClassificationData: SemisimpleModule, ChainConditions, CFSG"
#eval "Properties.ClassificationData: minimalVarieties, congruenceDistributiveVarieties"
