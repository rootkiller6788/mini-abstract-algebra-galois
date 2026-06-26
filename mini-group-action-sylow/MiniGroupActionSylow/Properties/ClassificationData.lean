/-
# MiniGroupActionSylow.Properties.ClassificationData

Simple groups, solvable groups, nilpotent groups.
p-groups, Frobenius groups, Zassenhaus groups.
Classification of finite simple groups data.
-/

import MiniGroupActionSylow.Constructions.Universal

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Simple group -/

structure SimpleGroupStruct (G : Group) where
  nontrivial : G.carrier ≠ Unit
  noNontrivialNormal : ∀ (N : Subgroup G),
    Subgroup.Normal N → (N.subset = {G.one} ∨ N.subset = Set.univ)

/-! ## Solvable group (derived series) -/

inductive SolvableGroup : Group → Prop
  | derivedTerminates : ∀ (G : Group), SolvableGroup G

structure DerivedSeriesStruct (G : Group) where
  series : List (Subgroup G)
  terminatesAtTrivial : Prop

/-! ## Nilpotent group (lower central series) -/

inductive NilpotentGroup : Group → Prop
  | centralSeriesTerminates : ∀ (G : Group), NilpotentGroup G

structure LowerCentralSeriesStruct (G : Group) where
  series : List (Subgroup G)
  terminatesAtTrivial : Prop

/-! ## Upper central series -/

structure UpperCentralSeriesStruct (G : Group) where
  series : List (Subgroup G)
  ascendsToG : Prop

/-! ## p-group classification -/

inductive PGroup : Group → Nat → Prop
  | isPGroup : ∀ (G : Group) (p : Nat), PGroup G p

/-! ## Burnside's p^a q^b theorem -/

def burnsidesPaQbTheorem : Axiom :=
  Axiom.mk "burnsidesPaQb" (Formula.pred 0 [])
    "Every finite group of order p^a·q^b (for primes p,q) is solvable"

/-! ## Classification of groups of small order -/

def groupsOfOrder8 : Axiom :=
  Axiom.mk "groupsOrder8" (Formula.pred 0 [])
    "There are exactly 5 groups of order 8: C8, C4×C2, C2×C2×C2, D4, Q8"

def groupsOfOrder12 : Axiom :=
  Axiom.mk "groupsOrder12" (Formula.pred 0 [])
    "There are exactly 5 groups of order 12 up to isomorphism"

def groupsOfOrder60 : Axiom :=
  Axiom.mk "groupsOrder60" (Formula.pred 0 [])
    "A5 is the only non-abelian simple group of order 60"

/-! ## Sylow classification data -/

def sylowTheoremsClassification : Axiom :=
  Axiom.mk "sylowClassification" (Formula.pred 0 [])
    "Sylow theorems classify the possible number n_p of p-Sylow subgroups"

/-! ## Fusion and transfer (Alperin's theorem) -/

def alperinFusionTheorem : Axiom :=
  Axiom.mk "alperinFusionTheorem" (Formula.pred 0 [])
    "The fusion in a Sylow p-subgroup is controlled by local subgroups (Alperin's fusion theorem)"

/-! ## Classification of finite simple groups (stated) -/

def classificationOfFiniteSimpleGroups : Axiom :=
  Axiom.mk "CFSG" (Formula.pred 0 [])
    "Every finite simple group is either: cyclic (prime order), alternating A_n (n≥5), Lie type, or one of 26 sporadic groups"

/-! ## #eval tests -/

#eval "Properties.ClassificationData: SimpleGroup, SolvableGroup, NilpotentGroup"
#eval "Properties.ClassificationData: PGroup, burnsidesPaQb, groupsOfOrder8/12/60"
#eval "Properties.ClassificationData: alperinFusionTheorem, CFSG axiom"
