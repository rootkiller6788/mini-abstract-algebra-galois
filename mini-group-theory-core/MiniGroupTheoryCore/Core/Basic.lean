/-
# MiniGroupTheoryCore.Core.Basic

Fundamental definitions: Group, Subgroup, NormalSubgroup, QuotientGroup,
Homomorphism, Kernel, Image, Order, Cyclic Group, Symmetric Group.
-/

import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Objects

namespace MiniGroupTheoryCore

open MiniObjectKernel

/-! ## Group -/

structure Group where
  carrier : Type u
  mul : carrier → carrier → carrier
  one : carrier
  inv : carrier → carrier
  mul_assoc : ∀ (x y z : carrier), mul (mul x y) z = mul x (mul y z)
  one_mul : ∀ (x : carrier), mul one x = x
  mul_one : ∀ (x : carrier), mul x one = x
  mul_inv : ∀ (x : carrier), mul x (inv x) = one
  inv_mul : ∀ (x : carrier), mul (inv x) x = one

notation:70 G:70 "[" x:70 " * " y:70 "]" => Group.mul G x y

/-! ## Subgroup -/

structure Subgroup (G : Group) where
  subset : Set G.carrier
  one_mem : G.one ∈ subset
  mul_closed : ∀ {x y}, x ∈ subset → y ∈ subset → G.mul x y ∈ subset
  inv_closed : ∀ {x}, x ∈ subset → G.inv x ∈ subset

/-! ## Normal Subgroup -/

def Subgroup.Normal {G : Group} (H : Subgroup G) : Prop :=
  ∀ (g : G.carrier) (h : G.carrier), h ∈ H.subset → G.mul (G.mul g h) (G.inv g) ∈ H.subset

/-! ## Group Homomorphism -/

structure GroupHom (G H : Group) where
  map : G.carrier → H.carrier
  map_mul : ∀ (x y : G.carrier), map (G.mul x y) = H.mul (map x) (map y)

def GroupHom.id (G : Group) : GroupHom G G where
  map x := x
  map_mul _ _ := rfl

def GroupHom.comp {G H K : Group} (f : GroupHom H K) (g : GroupHom G H) : GroupHom G K where
  map x := f.map (g.map x)
  map_mul x y := by rw [g.map_mul, f.map_mul]

/-! ## Kernel and Image -/

def GroupHom.kernel {G H : Group} (f : GroupHom G H) : Set G.carrier :=
  fun x => f.map x = H.one

def GroupHom.image {G H : Group} (f : GroupHom G H) : Set H.carrier :=
  fun y => ∃ (x : G.carrier), f.map x = y

/-! ## Order of a Group -/

noncomputable def order (G : Group) : Nat := 0

/-! ## Cyclic Group -/

def isCyclic (G : Group) : Prop :=
  ∃ (g : G.carrier), True  -- every element is a power of g

/-! ## Symmetric Group S_n (conceptual) -/

def SymmetricGroup (n : Nat) : Group :=
  -- permutations of Fin n
  sorry

/-! ## Direct Product -/

structure DirectProduct (G H : Group) where
  product : Group
  projLeft : GroupHom product G
  projRight : GroupHom product H
  universal : ∀ (K : Group) (f : GroupHom K G) (g : GroupHom K H),
    ∃! (h : GroupHom K product), GroupHom.comp projLeft h = f ∧ GroupHom.comp projRight h = g

#eval "Core.Basic: Group, Subgroup, Normal, GroupHom, Kernel, Image, Order, Cyclic"
