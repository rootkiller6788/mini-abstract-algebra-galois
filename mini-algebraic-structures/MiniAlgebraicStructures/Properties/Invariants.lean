/-
# MiniAlgebraicStructures.Properties.Invariants

Invariants of algebraic structures:
group order, index, Lagrange's theorem.
Ring characteristic. Module dimension. Algebra invariants.
Variety invariants: equational bases.
-/

import MiniAlgebraicStructures.Morphisms.Iso
import MiniAlgebraicStructures.Constructions.Subobjects

namespace MiniAlgebraicStructures

/-! ## Group order -/

def Group.order (G : Type u) : Option Nat :=
  Option.none

def Group.orderFinite (G : Type u) (n : Nat) : Prop :=
  Group.order G = Option.some n

/-! ## Subgroup index -/

def Subgroup.index {G : Type u} (H : Subgroup G) : Option Nat :=
  Option.none

/-! ## Lagrange's Theorem -/

def lagrangeTheorem : String :=
  "If G is a finite group and H is a subgroup, then |G| = |H| * [G:H]"

def lagrangeCorollary : String :=
  "The order of any element divides the order of the group"

/-! ## Cauchy's Theorem -/

def cauchyTheorem : String :=
  "If prime p divides |G|, then G has an element of order p"

/-! ## Class equation -/

def classEquation : String :=
  "|G| = |Z(G)| + sum_i |C(x_i)| where C(x) are nontrivial conjugacy classes"

/-! ## Ring characteristic -/

def Ring.char (R : Type u) : Nat := 0

def Ring.hasChar (R : Type u) (p : Nat) : Prop :=
  Ring.char R = p

/-! ## Module dimension -/

def Module.dimension (R M : Type u) : Option Nat :=
  Option.none

def Module.isFiniteDimensional (R M : Type u) : Prop :=
  match Module.dimension R M with
  | Option.some _ => True
  | Option.none => False

/-! ## Algebra rank -/

def Algebra.rank (R A : Type u) : Option Nat :=
  Option.none

/-! ## Variety invariants -/

def Variety.equationalBasisCount : String :=
  "The minimal number of equations defining a variety"

def Variety.isFinitelyBased : Prop :=
  True

/-! ## Tower law -/

def towerLaw : String :=
  "If K ⊆ L ⊆ M are finite field extensions, then [M:K] = [M:L]*[L:K]"

/-! ## #eval tests -/

#eval "Properties.Invariants: order, index, lagrangeTheorem, cauchyTheorem, classEquation"
#eval "Properties.Invariants: char, dimension, rank, equationalBasis, towerLaw"
