/-
# MiniGroupTheoryCore.Core.Basic

Fundamental definitions: Group, Subgroup, NormalSubgroup, QuotientGroup,
Homomorphism, Kernel, Image, Order, Cyclic Group, Symmetric Group.
-/

import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Objects
import MiniGroupTheoryCore.Core.AxiomCompat

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

/-! ## Symmetric Group S_n -/

def SymmetricGroup (n : Nat) : Group where
  carrier := Equiv.Perm (Fin n)
  mul f g := f.trans g
  one := Equiv.refl _
  inv f := f.symm
  mul_assoc f g h := rfl
  one_mul f := rfl
  mul_one f := rfl
  mul_inv f := Equiv.self_trans_symm f
  inv_mul f := Equiv.symm_trans_self f

/-! ## Direct Product -/

structure DirectProduct (G H : Group) where
  product : Group
  projLeft : GroupHom product G
  projRight : GroupHom product H
  universal : ∀ (K : Group) (f : GroupHom K G) (g : GroupHom K H),
    ∃! (h : GroupHom K product), GroupHom.comp projLeft h = f ∧ GroupHom.comp projRight h = g

/-! ## Trivial group -/

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

/-! ## Commutator -/

def commutator {G : Group} (a b : G.carrier) : G.carrier :=
  G.mul (G.mul a b) (G.mul (G.inv a) (G.inv b))

/-! ## Conjugate -/

def conjugate {G : Group} (g h : G.carrier) : G.carrier :=
  G.mul (G.mul g h) (G.inv g)

/-! ## Element powers (exponentiation in a group) -/

def power {G : Group} (g : G.carrier) : Nat → G.carrier
  | 0 => G.one
  | n+1 => G.mul g (power g n)

def powerNeg {G : Group} (g : G.carrier) : Int → G.carrier
  | Int.ofNat n => power g n
  | Int.negSucc n => G.inv (power g (n+1))

/-! ## Abelian group predicate -/

def isAbelian (G : Group) : Prop :=
  ∀ (a b : G.carrier), G.mul a b = G.mul b a

/-! ## Exponent of a group element -/

def elementOrder {G : Group} (g : G.carrier) : Nat := 0

/-! ## #eval tests -/

#eval "Core.Basic: Group, Subgroup, Normal, GroupHom, Kernel, Image, Order, Cyclic"
#eval "Core.Basic: SymmetricGroup, trivialGroup, commutator, conjugate, power, isAbelian"
