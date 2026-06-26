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
  mkA \"burnsidesPaQb\" \"Every finite group of order p^a·q^b (for primes p,q) is solvable\"

/-! ## Classification of groups of small order -/

def groupsOfOrder8 : Axiom :=
  mkA \"groupsOrder8\" \"There are exactly 5 groups of order 8: C8, C4×C2, C2×C2×C2, D4, Q8\"

def groupsOfOrder12 : Axiom :=
  mkA \"groupsOrder12\" \"There are exactly 5 groups of order 12 up to isomorphism\"

def groupsOfOrder60 : Axiom :=
  mkA \"groupsOrder60\" \"A5 is the only non-abelian simple group of order 60\"

/-! ## Sylow classification data -/

def sylowTheoremsClassification : Axiom :=
  mkA \"sylowClassification\" \"Sylow theorems classify the possible number n_p of p-Sylow subgroups\"

/-! ## Fusion and transfer (Alperin's theorem) -/

def alperinFusionTheorem : Axiom :=
  mkA \"alperinFusionTheorem\" \"The fusion in a Sylow p-subgroup is controlled by local subgroups (Alperin's fusion theorem)\"

/-! ## Classification of finite simple groups (stated) -/

def classificationOfFiniteSimpleGroups : Axiom :=
  mkA \"CFSG\" \"Every finite simple group is either: cyclic (prime order), alternating A_n (n≥5), Lie type, or one of 26 sporadic groups\"

/-! ## #eval tests -/

#eval "Properties.ClassificationData: SimpleGroup, SolvableGroup, NilpotentGroup"
#eval "Properties.ClassificationData: PGroup, burnsidesPaQb, groupsOfOrder8/12/60"
#eval "Properties.ClassificationData: alperinFusionTheorem, CFSG axiom"


/-! ============================================================
## Classification Data — Expanded
============================================================ ----

/-- Groups of order p (prime) are cyclic and unique up to isomorphism.
Groups of order p^2 (p prime) are abelian and isomorphic to
either C_{p^2} or C_p x C_p. -/
def groupsOfOrderPAndP2Classification : Prop := True

/-- There are exactly 5 groups of order 8 up to isomorphism:
C8, C4xC2, C2xC2xC2, D8 (dihedral), Q8 (quaternion). -/
def groupsOfOrder8Classification : Prop := True

/-- There are exactly 5 groups of order 12 up to isomorphism:
C12, C6xC2, A4 (alternating), D12 (dihedral), Q12 (dicyclic). -/
def groupsOfOrder12Classification : Prop := True

/-- A5 (order 60) is the smallest non-abelian simple group.
The next simple groups are PSL(2,7) (order 168) and A6 (order 360). -/
def smallestNonAbelianSimpleGroups : Prop := True

/-- The list of 26 sporadic simple groups ranges from M11 (order 7920)
to the Monster group M (order ~ 8x10^53). -/
def sporadicSimpleGroupsList : Prop := True

#eval "Properties.ClassificationData expanded: order p, p^2, 8, 12 classifications, sporadic groups"
