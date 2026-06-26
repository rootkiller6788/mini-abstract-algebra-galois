/-
# MiniGroupTheoryCore.Morphisms.Equivalence

Group actions, G-sets, orbit-stabilizer theorem.
Conjugacy classes, center, and equivalence relations on groups.
-/

import MiniGroupTheoryCore.Morphisms.Iso
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Group action on a set -/

structure GroupAction (G : Group) (X : Type u) where
  act : G.carrier → X → X
  act_id : ∀ (x : X), act G.one x = x
  act_compat : ∀ (g h : G.carrier) (x : X), act g (act h x) = act (G.mul g h) x

/-! ## G-set -/

structure GSet (G : Group) where
  carrier : Type u
  action : GroupAction G carrier

/-! ## Orbit of an element -/

def GroupAction.orbit {G : Group} {X : Type u} (act : GroupAction G X) (x : X) : Set X :=
  fun y => ∃ (g : G.carrier), act.act g x = y

/-! ## Stabilizer of an element -/

def GroupAction.stabilizer {G : Group} {X : Type u} (act : GroupAction G X) (x : X) : Subgroup G where
  subset := fun g => act.act g x = x
  one_mem := act.act_id x
  mul_closed h1 h2 := by
    rw [act.act_compat, h2, h1]
  inv_closed h := by
    have : act.act (G.inv (by
      -- need to find g such that act.act g x = x, but we're in the stabilizer
      sorry)) x = x := by
      sorry
    exact this

/-! ## Orbit-Stabilizer Theorem (axiom) -/

def orbitStabilizerTheorem : Axiom :=
  Axiom.mk "orbitStabilizer" (Formula.pred 0 [])
    "|Orb(x)| = [G : Stab(x)] — orbit size equals index of stabilizer"

/-! ## Conjugacy class of a group element -/

def conjugacyClass {G : Group} (g : G.carrier) : Set G.carrier :=
  fun h => ∃ (x : G.carrier), G.mul (G.mul x g) (G.inv x) = h

/-! ## Center of a group -/

def center (G : Group) : Subgroup G where
  subset := fun z => ∀ (g : G.carrier), G.mul z g = G.mul g z
  one_mem g := by rw [G.one_mul, G.mul_one]
  mul_closed hz₁ hz₂ g := by
    rw [G.mul_assoc, hz₂ g, ← G.mul_assoc, hz₁ g, G.mul_assoc]
  inv_closed hz g := by
    calc
      G.mul (G.inv (by
        -- need z such that hz holds
        sorry)) g = G.inv (G.mul g (by sorry)) := by
        sorry
      _ = G.mul g (G.inv (by sorry)) := by
        sorry

/-! ## Commutator subgroup -/

def commutatorSubgroup (G : Group) : Subgroup G where
  subset := fun c => ∃ (a b : G.carrier),
    c = G.mul (G.mul a b) (G.mul (G.inv a) (G.inv b))
  one_mem := by
    refine ⟨G.one, G.one, ?_⟩
    calc
      G.mul (G.mul G.one G.one) (G.mul (G.inv G.one) (G.inv G.one)) = G.mul G.one (G.mul G.one G.one) := by
        rw [G.mul_inv, G.mul_inv, G.one_mul]
      _ = G.one := by rw [G.one_mul, G.mul_one]
  mul_closed := sorry
  inv_closed := sorry

/-! ## Equivalence relation: isomorphism of groups -/

def groupEquivalence : Equivalence (fun (G H : Group) => areIsomorphic G H) where
  refl G := ⟨GroupIso.id G⟩
  symm h := h.map GroupIso.symm
  trans h₁ h₂ := match h₁, h₂ with
    | ⟨iso₁⟩, ⟨iso₂⟩ => ⟨GroupIso.comp iso₁ iso₂⟩

/-! ## #eval tests -/

#eval "Morphisms.Equivalence: GroupAction, GSet, orbit, stabilizer"
#eval "Morphisms.Equivalence: orbitStabilizerTheorem, conjugacyClass, center, commutatorSubgroup"
#eval "Morphisms.Equivalence: groupEquivalence defined"
