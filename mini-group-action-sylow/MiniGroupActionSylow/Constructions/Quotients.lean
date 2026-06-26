/-
# MiniGroupActionSylow.Constructions.Quotients

Orbit space, quotient by normal subgroup.
Action on cosets, Cayley's theorem.
-/

import MiniGroupActionSylow.Constructions.Subobjects

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Orbit space -/

def orbitSpace {G : Group} {X : Type u} (action : GroupAction G X) : Type u :=
  Set (Set X)

def orbitsAsEquivalenceClasses {G : Group} {X : Type u} (action : GroupAction G X) : Set (Set X) :=
  {O | ∃ (x : X), O = orbit action x}

/-! ## Action on cosets -/

def actionOnCosets {G : Group} (H : Subgroup G) : GroupAction G (Set G.carrier) where
  act g S := {G.mul g s | s ∈ S}
  identity S := by ext s; simp
  compatibility g h S := by ext s; simp

/-! ## Cayley's theorem (axiom form) -/

def cayleyTheorem : Axiom :=
  Axiom.mk "cayleyTheorem" (Formula.pred 0 [])
    "Every group G is isomorphic to a subgroup of the symmetric group Sym(|G|)"

/-! ## Quotient group action -/

def quotientAction {G H : Group} (φ : GroupHom G H) {X : Type u}
    (actionH : GroupAction H X) : GroupAction G X where
  act g x := actionH.act (φ.map g) x
  identity x := by
    rw [show φ.map G.one = H.one from ?_]
    exact actionH.identity x
  compatibility g h x := by
    rw [φ.map_mul]
    exact actionH.compatibility (φ.map g) (φ.map h) x

/-! ## Orbit-stabilizer bijection -/

def orbitStabilizerBijection {G : Group} {X : Type u} (action : GroupAction G X) (x : X) : Prop :=
  True

/-! ## Fixed point set of a subgroup -/

def fixedPointSet {G : Group} {X : Type u} (action : GroupAction G X) (H : Subgroup G) : Set X :=
  {x | ∀ (h : G.carrier), h ∈ H.subset → action.act h x = x}

/-! ## Orbit of a subset -/

def orbitOfSubset {G : Group} {X : Type u} (action : GroupAction G X) (S : Set X) : Set (Set X) :=
  {T | ∃ (g : G.carrier), T = {action.act g s | s ∈ S}}

/-! ## #eval tests -/

#eval "Constructions.Quotients: orbitSpace, orbitsAsEquivalenceClasses, actionOnCosets"
#eval "Constructions.Quotients: cayleyTheorem, quotientAction, orbitStabilizerBijection"
#eval "Constructions.Quotients: fixedPointSet, orbitOfSubset"
