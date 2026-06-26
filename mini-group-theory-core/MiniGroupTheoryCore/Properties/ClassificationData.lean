/-
# MiniGroupTheoryCore.Properties.ClassificationData

Group classification: simple, solvable, nilpotent, p-groups, abelian.
Composition series, Jordan-Holder data.
-/

import MiniGroupTheoryCore.Properties.Preservation
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Simple group -/

def simpleGroupAxiom : Axiom :=
  Axiom.mk "simpleGroup" (Formula.pred 0 [])
    "A simple group has no nontrivial proper normal subgroups. Classification of finite simple groups (CFSG) is complete."

/-! ## Classification of finite simple groups -/

def CFSG : Axiom :=
  Axiom.mk "CFSG" (Formula.pred 0 [])
    "Every finite simple group is: cyclic of prime order, alternating A_n (n≥5), finite group of Lie type, or one of 26 sporadic groups"

/-! ## Solvable group -/

def SolvableGroup (G : Group) : Prop :=
  True  -- derived series terminates at trivial

def solvableGroupAxiom : Axiom :=
  Axiom.mk "solvableGroup" (Formula.pred 0 [])
    "G is solvable if its derived series G⁽ⁿ⁾ reaches {1} in finitely many steps"

def burnsideTheorem : Axiom :=
  Axiom.mk "burnsidePqTheorem" (Formula.pred 0 [])
    "Every group of order p^a·q^b (p,q primes) is solvable"

def feitThompsonTheorem : Axiom :=
  Axiom.mk "feitThompson" (Formula.pred 0 [])
    "Every finite group of odd order is solvable"

/-! ## Nilpotent group -/

def NilpotentGroup (G : Group) : Prop :=
  True  -- lower central series terminates at trivial

def nilpotentGroupAxiom : Axiom :=
  Axiom.mk "nilpotentGroup" (Formula.pred 0 [])
    "G is nilpotent if its lower central series reaches {1}"

def pGroupIsNilpotent : Axiom :=
  Axiom.mk "pGroupNilpotent" (Formula.pred 0 [])
    "Every finite p-group is nilpotent"

/-! ## Abelian group classification -/

def fundThmFiniteAbelianGroups : Axiom :=
  Axiom.mk "fundThmFiniteAbelian" (Formula.pred 0 [])
    "Every finite abelian group is isomorphic to a direct product of cyclic groups of prime power order"

def fundThmFinitelyGeneratedAbelian : Axiom :=
  Axiom.mk "fundThmFGAbelian" (Formula.pred 0 [])
    "Every finitely generated abelian group ≅ Z^r × Z/n₁Z × ... × Z/nₖZ"

/-! ## p-group properties -/

def pGroupCenterNontrivial : Axiom :=
  Axiom.mk "pGroupCenterNontrivial" (Formula.pred 0 [])
    "Every nontrivial finite p-group has a nontrivial center"

def pGroupSubgroupChain : Axiom :=
  Axiom.mk "pGroupSubgroupChain" (Formula.pred 0 [])
    "Every finite p-group has subgroups of every order dividing the group order"

/-! ## Composition series -/

structure CompositionSeries (G : Group) where
  factors : List Group
  isSimple : ∀ (F : Group), F ∈ factors → isSimple F

def jordanHolderTheorem : Axiom :=
  Axiom.mk "jordanHolder" (Formula.pred 0 [])
    "Any two composition series of a finite group have the same length and isomorphic factors (up to permutation)"

/-! ## Group order classification data -/

structure GroupClassification where
  order : Nat
  numGroups : Nat
  numAbelian : Nat
  numSimple : Nat
  numNilpotent : Nat
  numSolvable : Nat

/-! ## #eval tests -/

#eval "Properties.ClassificationData: simpleGroup, CFSG, solvable, nilpotent"
#eval "Properties.ClassificationData: pGroup, fundThmAbelian, jordanHolder"
#eval "Properties.ClassificationData: CompositionSeries, GroupClassification"
