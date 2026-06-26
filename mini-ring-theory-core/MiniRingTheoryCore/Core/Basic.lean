/-
# MiniRingTheoryCore.Core.Basic

Ring, RingHom, Ideal, QuotientRing, PrimeIdeal, MaximalIdeal,
IntegralDomain, Unit, ZeroDivisor.
-/

import MiniGroupTheoryCore.Core.Basic

namespace MiniRingTheoryCore

open MiniGroupTheoryCore

/-! ## Ring -/

structure Ring where
  carrier : Type u
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  mul : carrier → carrier → carrier
  one : carrier
  add_assoc : ∀ (x y z : carrier), add (add x y) z = add x (add y z)
  add_comm : ∀ (x y : carrier), add x y = add y x
  add_zero : ∀ (x : carrier), add x zero = x
  add_neg : ∀ (x : carrier), add x (neg x) = zero
  mul_assoc : ∀ (x y z : carrier), mul (mul x y) z = mul x (mul y z)
  mul_one : ∀ (x : carrier), mul x one = x
  one_mul : ∀ (x : carrier), mul one x = x
  mul_add : ∀ (x y z : carrier), mul x (add y z) = add (mul x y) (mul x z)
  add_mul : ∀ (x y z : carrier), mul (add x y) z = add (mul x z) (mul y z)

/-! ## Ring Homomorphism -/

structure RingHom (R S : Ring) where
  map : R.carrier → S.carrier
  map_add : ∀ (x y : R.carrier), map (R.add x y) = S.add (map x) (map y)
  map_mul : ∀ (x y : R.carrier), map (R.mul x y) = S.mul (map x) (map y)
  map_one : map R.one = S.one

def RingHom.id (R : Ring) : RingHom R R where
  map x := x
  map_add _ _ := rfl
  map_mul _ _ := rfl
  map_one := rfl

def RingHom.comp {R S T : Ring} (g : RingHom S T) (f : RingHom R S) : RingHom R T where
  map x := g.map (f.map x)
  map_add x y := by rw [f.map_add, g.map_add]
  map_mul x y := by rw [f.map_mul, g.map_mul]
  map_one := by rw [f.map_one, g.map_one]

/-! ## Ideal -/

structure Ideal (R : Ring) where
  subset : Set R.carrier
  zero_mem : R.zero ∈ subset
  add_closed : ∀ {x y}, x ∈ subset → y ∈ subset → R.add x y ∈ subset
  smul_closed : ∀ {r x}, x ∈ subset → R.mul r x ∈ subset

/-! ## Prime Ideal -/

def Ideal.IsPrime {R : Ring} (I : Ideal R) : Prop :=
  I.subset ≠ Set.univ ∧ ∀ (a b : R.carrier), R.mul a b ∈ I.subset → a ∈ I.subset ∨ b ∈ I.subset

/-! ## Maximal Ideal -/

def Ideal.IsMaximal {R : Ring} (I : Ideal R) : Prop :=
  I.subset ≠ Set.univ ∧ ∀ (J : Ideal R), I.subset ⊆ J.subset → J.subset = I.subset ∨ J.subset = Set.univ

/-! ## Quotient Ring -/

structure QuotientRing (R : Ring) (I : Ideal R) where
  Q : Ring
  proj : RingHom R Q
  universal : ∀ (S : Ring) (f : RingHom R S),
    (∀ (x : R.carrier), x ∈ I.subset → f.map x = S.zero) →
    ∃! (g : RingHom Q S), RingHom.comp g proj = f

/-! ## Integral Domain -/

def isIntegralDomain (R : Ring) : Prop :=
  ∀ (a b : R.carrier), R.mul a b = R.zero → a = R.zero ∨ b = R.zero

/-! ## Unit -/

def isUnit (R : Ring) (x : R.carrier) : Prop :=
  ∃ (y : R.carrier), R.mul x y = R.one ∧ R.mul y x = R.one

/-! ## Zero Divisor -/

def isZeroDivisor (R : Ring) (x : R.carrier) : Prop :=
  x ≠ R.zero ∧ ∃ (y : R.carrier), y ≠ R.zero ∧ R.mul x y = R.zero

#eval "Core.Basic: Ring, RingHom, Ideal, QuotientRing, IntegralDomain, Unit"
