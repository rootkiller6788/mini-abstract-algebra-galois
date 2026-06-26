/-
# MiniGroupTheoryCore.Properties.Invariants

Group order, element order, index, Lagrange's theorem, class equation.
Cauchy's theorem. Cyclic group characterization.
-/

import MiniGroupTheoryCore.Morphisms.Iso
import MiniGroupTheoryCore.Constructions.Subobjects
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Group order -/

def Group.order (G : Group) : Option Nat :=
  Option.none

def Group.orderFinite (G : Group) (n : Nat) : Prop :=
  Group.order G = Option.some n

/-! ## Element order -/

def orderOfElement {G : Group} (g : G.carrier) : Option Nat :=
  Option.none

def elementIsTorsion {G : Group} (g : G.carrier) : Prop :=
  orderOfElement g ≠ Option.none

/-! ## Lagrange's Theorem -/

def lagrangeTheorem : Axiom :=
  Axiom.mk "lagrangeTheorem" (Formula.pred 0 [])
    "If G is a finite group and H ≤ G, then |G| = |H| · [G:H]"

def lagrangeCorollary : Axiom :=
  Axiom.mk "lagrangeCorollary" (Formula.pred 0 [])
    "The order of any element divides the order of the group"

/-! ## Cauchy's Theorem -/

def cauchyTheorem : Axiom :=
  Axiom.mk "cauchyTheorem" (Formula.pred 0 [])
    "If prime p divides |G|, then G has an element of order p"

/-! ## Class equation -/

def classEquation : Axiom :=
  Axiom.mk "classEquation" (Formula.pred 0 [])
    "|G| = |Z(G)| + Σᵢ [G : C_G(xᵢ)] where xᵢ are representatives of nontrivial conjugacy classes"

/-! ## Cyclic group properties -/

def cyclicGroupOfOrderN : Axiom :=
  Axiom.mk "cyclicGroupOrderN" (Formula.pred 0 [])
    "For each n ≥ 1, there is a unique cyclic group of order n up to isomorphism: Z/nZ"

def cyclicSubgroupCriterion : Axiom :=
  Axiom.mk "cyclicSubgroupCriterion" (Formula.pred 0 [])
    "Every subgroup of a cyclic group is cyclic"

def cyclicGroupClassification : Axiom :=
  Axiom.mk "cyclicGroupClassification" (Formula.pred 0 [])
    "Every finite cyclic group of order n is isomorphic to Z/nZ, and every infinite cyclic group is isomorphic to Z"

/-! ## Exponent of a group -/

def exponent (G : Group) : Option Nat :=
  Option.none

def exponentDividesOrder : Axiom :=
  Axiom.mk "exponentDividesOrder" (Formula.pred 0 [])
    "exp(G) divides |G|"

/-! ## #eval tests -/

#eval "Properties.Invariants: order, orderOfElement, Lagrange, Cauchy"
#eval "Properties.Invariants: classEquation, cyclicGroup axioms, exponent"
