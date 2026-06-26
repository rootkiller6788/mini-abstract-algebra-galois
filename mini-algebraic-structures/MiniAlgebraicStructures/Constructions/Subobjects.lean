/-
# MiniAlgebraicStructures.Constructions.Subobjects

Subobjects of algebraic structures:
subsemigroup, submonoid, subgroup, normal subgroup,
subring, ideal, submodule, subalgebra.
-/

import MiniAlgebraicStructures.Morphisms.Hom

namespace MiniAlgebraicStructures

/-! ## Subsemigroup -/

structure Subsemigroup (S : Type u) where
  carrier : Set S
  closed_mul : ∀ {x y : S}, x in carrier -> y in carrier -> (x * y) in carrier

/-! ## Submonoid -/

structure Submonoid (M : Type u) where
  carrier : Set M
  one_mem : (1 : M) in carrier
  closed_mul : ∀ {x y : M}, x in carrier -> y in carrier -> (x * y) in carrier

/-! ## Subgroup -/

structure Subgroup (G : Type u) where
  carrier : Set G
  one_mem : (1 : G) in carrier
  closed_mul : ∀ {x y : G}, x in carrier -> y in carrier -> (x * y) in carrier
  closed_inv : ∀ {x : G}, x in carrier -> (x⁻¹ : G) in carrier

/-! ## Normal subgroup -/

structure NormalSubgroup (G : Type u) extends Subgroup G where
  isNormal : ∀ (n g : G), n in carrier -> (g * n * g⁻¹) in carrier

/-! ## Subring -/

structure Subring (R : Type u) where
  carrier : Set R
  zero_mem : (0 : R) in carrier
  one_mem : (1 : R) in carrier
  closed_add : ∀ {x y : R}, x in carrier -> y in carrier -> (x + y) in carrier
  closed_neg : ∀ {x : R}, x in carrier -> (-x) in carrier
  closed_mul : ∀ {x y : R}, x in carrier -> y in carrier -> (x * y) in carrier

/-! ## Ideal -/

structure Ideal (R : Type u) where
  carrier : Set R
  zero_mem : (0 : R) in carrier
  closed_add : ∀ {x y : R}, x in carrier -> y in carrier -> (x + y) in carrier
  closed_neg : ∀ {x : R}, x in carrier -> (-x) in carrier
  absorb_left : ∀ (r : R) {x : R}, x in carrier -> (r * x) in carrier
  absorb_right : ∀ (r : R) {x : R}, x in carrier -> (x * r) in carrier

def Ideal.isMaximal {R : Type u} (I : Ideal R) : Prop :=
  ∀ (J : Ideal R), (∀ x, x in I.carrier -> x in J.carrier) -> J.carrier = I.carrier ∨ J.carrier = Set.univ

def Ideal.isPrime {R : Type u} (I : Ideal R) : Prop :=
  ∀ (a b : R), (a * b) in I.carrier -> a in I.carrier ∨ b in I.carrier

/-! ## Submodule -/

structure Submodule (R M : Type u) where
  carrier : Set M
  zero_mem : (0 : M) in carrier
  closed_add : ∀ {x y : M}, x in carrier -> y in carrier -> (x + y) in carrier
  closed_smul : ∀ (r : R) {x : M}, x in carrier -> (r * x) in carrier

/-! ## Subalgebra -/

structure Subalg (R A : Type u) where
  carrier : Set A
  isSubmodule : Submodule R A
  closed_mul : ∀ {x y : A}, x in carrier -> y in carrier -> (x * y) in carrier

/-! ## Subalgebra of a signature algebra -/

structure SubSigAlg (sig : Signature) (A : SigAlgebra sig) where
  carrier : (s : sig.sorts) -> Set (A.carrier s)
  closed_ops : True

/-! ## #eval tests -/

#eval "Constructions.Subobjects: Subsemigroup, Submonoid, Subgroup, NormalSubgroup"
#eval "Constructions.Subobjects: Subring, Ideal (maximal/prime), Submodule, Subalg, SubSigAlg"
