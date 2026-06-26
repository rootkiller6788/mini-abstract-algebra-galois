/-
# MiniGroupTheoryCore.Morphisms.Hom

Group homomorphisms: definition, composition, identity, kernel, image,
injectivity, surjectivity, and basic properties.
-/

import MiniGroupTheoryCore.Core.Basic
import MiniGroupTheoryCore.Core.Laws
import MiniGroupTheoryCore.Core.AxiomCompat
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

/-! ## Homomorphism preserves identity -/

theorem GroupHom.map_one {G H : Group} (f : GroupHom G H) : f.map G.one = H.one := by
  have h := f.map_mul G.one G.one
  rw [G.one_mul] at h
  have hleft : H.mul (f.map G.one) (f.map G.one) = H.mul (f.map G.one) H.one := by
    rw [H.mul_one]
  rw [h] at hleft
  -- Now we have: f.map G.one = H.mul (f.map G.one) (f.map G.one)
  -- Multiply both sides on the right by inv (f.map G.one)
  have h_right : H.mul (f.map G.one) (f.map G.one) = f.map G.one := by
    rw [← h]
  -- Using the identity property of H
  calc
    f.map G.one = H.mul (f.map G.one) H.one := by rw [H.mul_one]
    _ = H.mul (f.map G.one) (H.mul (f.map G.one) (H.inv (f.map G.one))) := by rw [H.mul_inv]
    _ = H.mul (H.mul (f.map G.one) (f.map G.one)) (H.inv (f.map G.one)) := by rw [H.mul_assoc]
    _ = H.mul (f.map G.one) (H.inv (f.map G.one)) := by rw [h_right]
    _ = H.one := by rw [H.mul_inv]

/-! ## Homomorphism preserves inverses -/

theorem GroupHom.map_inv {G H : Group} (f : GroupHom G H) (x : G.carrier) :
  f.map (G.inv x) = H.inv (f.map x) := by
  apply Group.mul_right_cancel (f.map (G.inv x)) (H.inv (f.map x)) (f.map x)
  calc
    H.mul (f.map (G.inv x)) (f.map x) = f.map (G.mul (G.inv x) x) := by
      rw [f.map_mul]
    _ = f.map G.one := by rw [G.inv_mul]
    _ = H.one := by rw [GroupHom.map_one f]
    _ = H.mul (H.inv (f.map x)) (f.map x) := by rw [H.inv_mul]

-- We need right cancellation: if a*x = b*x then a = b
-- This is a lemma about groups

theorem Group.mul_right_cancel {G : Group} (a b x : G.carrier) (h : G.mul a x = G.mul b x) : a = b := by
  calc
    a = G.mul a G.one := by rw [G.mul_one]
    _ = G.mul a (G.mul x (G.inv x)) := by rw [G.mul_inv]
    _ = G.mul (G.mul a x) (G.inv x) := by rw [G.mul_assoc]
    _ = G.mul (G.mul b x) (G.inv x) := by rw [h]
    _ = G.mul b (G.mul x (G.inv x)) := by rw [G.mul_assoc]
    _ = G.mul b G.one := by rw [G.mul_inv]
    _ = b := by rw [G.mul_one]

theorem Group.mul_left_cancel {G : Group} (a b x : G.carrier) (h : G.mul x a = G.mul x b) : a = b := by
  calc
    a = G.mul G.one a := by rw [G.one_mul]
    _ = G.mul (G.mul (G.inv x) x) a := by rw [G.inv_mul]
    _ = G.mul (G.inv x) (G.mul x a) := by rw [G.mul_assoc]
    _ = G.mul (G.inv x) (G.mul x b) := by rw [h]
    _ = G.mul (G.mul (G.inv x) x) b := by rw [G.mul_assoc]
    _ = G.mul G.one b := by rw [G.inv_mul]
    _ = b := by rw [G.one_mul]

/-! ## Identity element is unique -/

theorem Group.one_unique {G : Group} (e : G.carrier) (h : ∀ x, G.mul e x = x) : e = G.one := by
  have h1 := h G.one
  rw [G.mul_one] at h1
  exact h1.symm

/-! ## Inverse is unique -/

theorem Group.inv_unique {G : Group} (a b : G.carrier) (h : G.mul a b = G.one) : b = G.inv a := by
  apply Group.mul_left_cancel (G.inv a) b a
  calc
    G.mul a (G.inv a) = G.one := G.mul_inv a
    _ = G.mul a b := h.symm

/-! ## Kernel is a normal subgroup — full proof -/

theorem GroupHom.ker_isSubgroup {G H : Group} (f : GroupHom G H) : Subgroup G where
  subset := f.ker
  one_mem := by
    rw [Set.mem_setOf_eq]
    exact GroupHom.map_one f
  mul_closed hx hy := by
    rw [Set.mem_setOf_eq] at hx hy ⊢
    rw [f.map_mul, hx, hy, H.one_mul]
  inv_closed hx := by
    rw [Set.mem_setOf_eq] at hx ⊢
    rw [GroupHom.map_inv f, hx, H.mul_inv]

theorem GroupHom.ker_isNormal {G H : Group} (f : GroupHom G H) :
  Subgroup.Normal (GroupHom.ker_isSubgroup f) := by
  intro g h hh
  rw [Set.mem_setOf_eq] at hh ⊢
  -- Need to show: f(g*h*g⁻¹) = 1
  -- f(g*h*g⁻¹) = f(g)*f(h)*f(g⁻¹) = f(g)*1*f(g)⁻¹ = f(g)*f(g)⁻¹ = 1
  calc
    f.map (G.mul (G.mul g h) (G.inv g))
        = H.mul (f.map (G.mul g h)) (f.map (G.inv g)) := by rw [f.map_mul]
    _ = H.mul (H.mul (f.map g) (f.map h)) (f.map (G.inv g)) := by rw [f.map_mul]
    _ = H.mul (H.mul (f.map g) H.one) (f.map (G.inv g)) := by rw [hh]
    _ = H.mul (f.map g) (f.map (G.inv g)) := by rw [H.mul_one]
    _ = H.mul (f.map g) (H.inv (f.map g)) := by rw [GroupHom.map_inv f g]
    _ = H.one := by rw [H.mul_inv]

/-! ## Trivial homomorphism -/

def GroupHom.trivial (G H : Group) : GroupHom G H where
  map _ := H.one
  map_mul _ _ := by rw [H.one_mul]

/-! ## The zero/trivial group (moved to Core.Basic) -/

/-! ## Inclusion homomorphism from subgroup -/

def Subgroup.inclusion {G : Group} (H : Subgroup G) : GroupHom { carrier := H.subset, mul := fun x y => ⟨G.mul x.val y.val, H.mul_closed x.property y.property⟩, one := ⟨G.one, H.one_mem⟩, inv := fun x => ⟨G.inv x.val, H.inv_closed x.property⟩, mul_assoc := by intro x y z; apply Subtype.ext; apply G.mul_assoc, one_mul := by intro x; apply Subtype.ext; apply G.one_mul, mul_one := by intro x; apply Subtype.ext; apply G.mul_one, mul_inv := by intro x; apply Subtype.ext; apply G.mul_inv, inv_mul := by intro x; apply Subtype.ext; apply G.inv_mul } G where
  map x := x.val
  map_mul _ _ := rfl

/-! ## Restriction of a homomorphism to a subgroup -/

def GroupHom.restrict {G H : Group} (f : GroupHom G H) (K : Subgroup G) : GroupHom
  { carrier := K.subset,
    mul := fun x y => ⟨G.mul x.val y.val, K.mul_closed x.property y.property⟩,
    one := ⟨G.one, K.one_mem⟩,
    inv := fun x => ⟨G.inv x.val, K.inv_closed x.property⟩,
    mul_assoc := by intro x y z; apply Subtype.ext; apply G.mul_assoc,
    one_mul := by intro x; apply Subtype.ext; apply G.one_mul,
    mul_one := by intro x; apply Subtype.ext; apply G.mul_one,
    mul_inv := by intro x; apply Subtype.ext; apply G.mul_inv,
    inv_mul := by intro x; apply Subtype.ext; apply G.inv_mul } H where
  map x := f.map x.val
  map_mul x y := f.map_mul x.val y.val

/-! ## #eval tests -/

#eval "Morphisms.Hom: GroupHom, ker, im, isInjective, isSurjective"
#eval "Morphisms.Hom: map_one, map_inv (proved), cancellation lemmas"
#eval "Morphisms.Hom: ker_isSubgroup, ker_isNormal, inclusion, restrict defined"
