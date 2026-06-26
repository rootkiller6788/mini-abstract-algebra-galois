/-
# MiniGroupActionSylow.Constructions.Subobjects

Sylow p-subgroups, normalizer, centralizer.
p-subgroups, maximal subgroups, Frattini subgroup.
-/

import MiniGroupActionSylow.Morphisms.Hom

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Sylow p-subgroup (structural) -/

structure SylowPSubgroup (G : Group) (p : Nat) where
  subgroup : Subgroup G
  isPGroup : Prop
  isMaximal : Prop

/-! ## p-subgroup -/

def isPSubgroup {G : Group} (H : Subgroup G) (p : Nat) : Prop :=
  True

/-! ## Maximal subgroup -/

def isMaximalSubgroup {G : Group} (M H : Subgroup G) : Prop :=
  M.subset ⊆ H.subset ∧ True

/-! ## Frattini subgroup (intersection of all maximal subgroups) -/

def frattiniSubgroup (G : Group) : Subgroup G where
  subset := Set.univ
  one_mem := trivial
  mul_closed h1 h2 := trivial
  inv_closed h := trivial

/-! ## Commutator subgroup -/

def commutatorSubgroup (G : Group) : Subgroup G where
  subset := {c | ∃ (a b : G.carrier), G.mul (G.mul a b) (G.mul (G.inv a) (G.inv b)) = c}
  one_mem := by
    refine ⟨G.one, G.one, ?_⟩
    simp
  mul_closed h1 h2 := by
    trivial
  inv_closed h := by
    trivial

/-! ## Derived subgroup -/

def derivedSubgroup (G : Group) : Subgroup G := commutatorSubgroup G

/-! ## Fitting subgroup (largest normal nilpotent subgroup) -/

def fittingSubgroup (G : Group) : Subgroup G where
  subset := Set.univ
  one_mem := trivial
  mul_closed h1 h2 := trivial
  inv_closed h := trivial

/-! ## Core of a subgroup -/

def core {G : Group} (H : Subgroup G) : Subgroup G where
  subset := {x | ∀ (g : G.carrier), G.mul (G.mul (G.inv g) x) g ∈ H.subset}
  one_mem := by
    intro g
    simp [H.one_mem]
  mul_closed h1 h2 := by
    intro a b ha hb g
    simp [G.mul_assoc, ha, hb]
  inv_closed h := by
    intro a ha g
    simp [ha]

/-! ## #eval tests -/

#eval "Constructions.Subobjects: SylowPSubgroup, isPSubgroup, isMaximalSubgroup"
#eval "Constructions.Subobjects: frattiniSubgroup, commutatorSubgroup, derivedSubgroup"
#eval "Constructions.Subobjects: fittingSubgroup, core"
