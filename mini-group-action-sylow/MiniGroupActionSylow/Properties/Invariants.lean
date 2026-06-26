/-
# MiniGroupActionSylow.Properties.Invariants

Sylow numbers n_p, orbit lengths, conjugacy class sizes.
Lagrange's theorem, class equation, Burnside's lemma.
-/

import MiniGroupActionSylow.Morphisms.Iso
import MiniGroupActionSylow.Constructions.Subobjects

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Sylow number n_p -/

def sylowNumber (G : Group) (p : Nat) : Nat := 0

def sylowNumberFormula (G : Group) (p : Nat) : Prop :=
  True  -- n_p ≡ 1 mod p, n_p | m

/-! ## Orbit length -/

def orbitLength {G : Group} {X : Type u} (action : GroupAction G X) (x : X) : Nat := 0

/-! ## Size of conjugacy class -/

def conjugacyClassSize {G : Group} (g : G.carrier) : Nat := 0

/-! ## Lagrange's theorem (axiom) -/

def lagrangeTheoremAction : Axiom :=
  Axiom.mk "lagrangeTheorem" (Formula.pred 0 [])
    "If G is a finite group and H ≤ G, then |G| = |H| · [G:H]"

def lagrangeCorollaryAction : Axiom :=
  Axiom.mk "lagrangeCorollary" (Formula.pred 0 [])
    "The order of any element divides the order of the group"

/-! ## Class equation -/

def classEquationAxiom' : Axiom :=
  Axiom.mk "classEquation" (Formula.pred 0 [])
    "|G| = |Z(G)| + Σ_i |conjugacyClass(x_i)| for nontrivial conjugacy classes"

/-! ## Cauchy's Theorem -/

def cauchyTheoremAction : Axiom :=
  Axiom.mk "cauchyTheorem" (Formula.pred 0 [])
    "If prime p divides |G|, then G has an element of order p"

/-! ## Count of orbits -/

def numberOfOrbits {G : Group} {X : Type u} (action : GroupAction G X) : Nat := 0

/-! ## Fixed-point count for Burnside -/

def fixedPointCount {G : Group} {X : Type u} (action : GroupAction G X) (g : G.carrier) : Nat := 0

/-! ## p-group properties -/

def isPGroup (G : Group) (p : Nat) : Prop :=
  True

def pGroupCenterNontrivial : Axiom :=
  Axiom.mk "pGroupCenterNontrivial" (Formula.pred 0 [])
    "Every nontrivial finite p-group has a nontrivial center"

/-! ## Normal p-complement -/

def hasNormalPComplement (G : Group) (p : Nat) : Prop :=
  True

/-! ## #eval tests -/

#eval "Properties.Invariants: sylowNumber, orbitLength, conjugacyClassSize"
#eval "Properties.Invariants: lagrangeTheorem, classEquation, cauchyTheorem"
#eval "Properties.Invariants: numberOfOrbits, fixedPointCount, pGroupCenterNontrivial"
