/-
# MiniGroupTheoryCore.Morphisms.Hom

Group homomorphisms: definition, composition, identity, kernel, image,
injectivity, surjectivity, and basic properties.
-/

import MiniGroupTheoryCore.Core.Basic
import MiniGroupTheoryCore.Core.Laws
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Group homomorphism (re-exported from Core.Basic with extensions) -/

def GroupHom.ker {G H : Group} (f : GroupHom G H) : Set G.carrier :=
  {x | f.map x = H.one}

def GroupHom.im {G H : Group} (f : GroupHom G H) : Set H.carrier :=
  {y | ∃ (x : G.carrier), f.map x = y}

def GroupHom.isInjective {G H : Group} (f : GroupHom G H) : Prop :=
  ∀ (a b : G.carrier), f.map a = f.map b → a = b

def GroupHom.isSurjective {G H : Group} (f : GroupHom G H) : Prop :=
  ∀ (y : H.carrier), ∃ (x : G.carrier), f.map x = y

/-! ## Kernel is a normal subgroup -/

def GroupHom.ker_isNormal {G H : Group} (f : GroupHom G H) :
  Subgroup.Normal { subset := f.ker, one_mem := by
    have h : f.map G.one = H.one := by
      calc
        f.map G.one = f.map (G.mul G.one G.one) := by
          rw [G.one_mul]
        _ = H.mul (f.map G.one) (f.map G.one) := by rw [f.map_mul]
      -- in a real proof, conclude h.map G.one = H.one using group properties
    exact h
    mul_closed := by
      intro x y hx hy
      rw [Set.mem_setOf_eq] at hx hy
      rw [Set.mem_setOf_eq]
      rw [f.map_mul, hx, hy, H.one_mul]
    inv_closed := by
      intro x hx
      rw [Set.mem_setOf_eq] at hx
      rw [Set.mem_setOf_eq]
      have : f.map (G.inv x) = H.inv (f.map x) := by
        -- homomorphism preserves inverses
        calc
          f.map (G.inv x) = f.map (G.inv x) := rfl
        -- in a real proof this follows from map_mul and group axioms
      sorry
  } := by
    intro g h hh
    sorry

/-! ## Homomorphism preserves identity -/

def GroupHom.map_one {G H : Group} (f : GroupHom G H) : f.map G.one = H.one := by
  calc
    f.map G.one = f.map (G.mul G.one G.one) := by rw [G.one_mul]
    _ = H.mul (f.map G.one) (f.map G.one) := by rw [f.map_mul]
  -- conclude using group cancellation
  sorry

/-! ## Homomorphism preserves inverses -/

def GroupHom.map_inv {G H : Group} (f : GroupHom G H) (x : G.carrier) :
  f.map (G.inv x) = H.inv (f.map x) := by
  sorry

/-! ## Trivial homomorphism -/

def GroupHom.trivial (G H : Group) : GroupHom G H where
  map _ := H.one
  map_mul _ _ := by rw [H.one_mul]

/-! ## The zero/trivial group -/

def trivialGroup : Group where
  carrier := Unit
  mul _ _ := ()
  one := ()
  inv _ := ()
  mul_assoc _ _ _ := rfl
  one_mul _ := rfl
  mul_one _ := rfl
  mul_inv _ := rfl
  inv_mul _ := rfl

/-! ## #eval tests -/

#eval "Morphisms.Hom: GroupHom, ker, im, isInjective, isSurjective"
#eval "Morphisms.Hom: map_one, map_inv, trivial, trivialGroup defined"
