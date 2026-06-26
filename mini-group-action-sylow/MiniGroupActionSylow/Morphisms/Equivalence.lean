/-
# MiniGroupActionSylow.Morphisms.Equivalence

Equivalence of group actions, conjugacy classes,
the orbit-stabilizer theorem in axiom form.
-/

import MiniGroupActionSylow.Morphisms.Iso

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Equivalence of group actions -/

def areEquivalentActions {G : Group} {X Y : Type u} (actionX : GroupAction G X) (actionY : GroupAction G Y) : Prop :=
  Nonempty (ActionIso actionX actionY)

/-! ## Conjugacy class of an element -/

def conjugacyClassElem {G : Group} (g : G.carrier) : Set G.carrier :=
  fun h => ∃ (x : G.carrier), G.mul (G.mul x g) (G.inv x) = h

def isConjugate {G : Group} (a b : G.carrier) : Prop :=
  b ∈ conjugacyClassElem a

/-! ## Centralizer -/

def centralizer {G : Group} (g : G.carrier) : Subgroup G where
  subset := fun h => G.mul h g = G.mul g h
  one_mem := by simp [G.one_mul, G.mul_one]
  mul_closed h1 h2 := by
    intro a b ha hb
    calc
      G.mul (G.mul a b) g = G.mul a (G.mul b g) := by rw [G.mul_assoc]
      _ = G.mul a (G.mul g b) := by rw [hb]
      _ = G.mul (G.mul a g) b := by rw [G.mul_assoc]
      _ = G.mul (G.mul g a) b := by rw [ha]
      _ = G.mul g (G.mul a b) := by rw [G.mul_assoc]
  inv_closed h := by
    intro a ha
    apply ha

/-! ## Center -/

def centerGroup {G : Group} : Subgroup G where
  subset := fun z => ∀ (g : G.carrier), G.mul z g = G.mul g z
  one_mem := by intro g; simp [G.one_mul, G.mul_one]
  mul_closed h1 h2 := by
    intro a b ha hb g
    calc
      G.mul (G.mul a b) g = G.mul a (G.mul b g) := by rw [G.mul_assoc]
      _ = G.mul a (G.mul g b) := by rw [hb g]
      _ = G.mul (G.mul a g) b := by rw [G.mul_assoc]
      _ = G.mul (G.mul g a) b := by rw [ha g]
      _ = G.mul g (G.mul a b) := by rw [G.mul_assoc]
  inv_closed h := by
    intro a ha g
    apply ha g

/-! ## Normalizer -/

def normalizer {G : Group} (H : Subgroup G) : Subgroup G where
  subset := fun g => ∀ (h : G.carrier), h ∈ H.subset → G.mul (G.mul g h) (G.inv g) ∈ H.subset
  one_mem := by
    intro h hh
    simp [G.one_mul, G.mul_one, G.inv_mul, hh]
  mul_closed h1 h2 := by
    intro a b ha hb h hh
    apply ha
    apply hb _ hh
  inv_closed h := by
    intro a ha h hh
    apply ha

/-! ## Conjugacy action of G on its subgroups -/

def conjugationOnSubgroups (G : Group) : GroupAction G (Subgroup G) where
  act g H := {
    subset := fun x => G.mul (G.mul g x) (G.inv g) ∈ H.subset
    one_mem := by
      simp [G.mul_one, G.inv_mul, H.one_mem]
    mul_closed hx hy := by
      simp [G.mul_assoc, G.inv_mul, hx, hy]
    inv_closed hx := by
      simp [hx]
  }
  identity H := by
    ext x; simp [G.one_mul, G.mul_one, G.inv_one]
  compatibility g h H := by
    ext x; simp [G.mul_assoc, G.inv_mul]

/-! ## #eval tests -/

#eval "Morphisms.Equivalence: areEquivalentActions, conjugacyClassElem, isConjugate"
#eval "Morphisms.Equivalence: centralizer, centerGroup, normalizer"
#eval "Morphisms.Equivalence: conjugationOnSubgroups"
