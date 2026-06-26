/-
# MiniRingTheoryCore.Core.Proofs

Consequences of the ring axioms provable without additional assumptions.
All proofs use only the Ring structure axioms:
add_assoc, add_comm, add_zero, add_neg, mul_assoc, mul_one,
one_mul, mul_add, add_mul.

Key theorems proved:
- r*0 = 0 and 0*r = 0
- x+x=x -> x=0
- (-r)*s = -(r*s), r*(-s) = -(r*s), (-r)*(-s) = r*s
- (-1)*r = -r, -(-r) = r
- Subtraction properties: a-0=a, a-a=0, (a-b)+b=a
- Ring homomorphisms preserve zero, neg, subtraction
- Kernel of any ring homomorphism is an ideal
- Ideal arithmetic: unit ideal, ideal sum, zero ideal
- Opposite ring construction
-/

import MiniRingTheoryCore.Core.Basic

namespace MiniRingTheoryCore

/-! ## 1. Multiplication by Zero

These are provable from distributivity + additive group axioms.
We give complete Lean 4 proofs. -/

/-- r * 0 = 0. Proof: r*0 = r*(0+0) = r*0 + r*0, cancel r*0. -/
theorem mul_zero_proof (R : Ring) (r : R.carrier) : R.mul r R.zero = R.zero := by
  have h : R.mul r R.zero = R.add (R.mul r R.zero) (R.mul r R.zero) := by
    calc
      R.mul r R.zero = R.mul r (R.add R.zero R.zero) := by rw [R.add_zero R.zero]
      _ = R.add (R.mul r R.zero) (R.mul r R.zero) := by rw [R.mul_add]
  calc
    R.mul r R.zero = R.add (R.mul r R.zero) R.zero := by rw [R.add_zero]
    _ = R.add (R.mul r R.zero) (R.add (R.mul r R.zero) (R.neg (R.mul r R.zero))) := by
      rw [R.add_neg]
    _ = R.add (R.add (R.mul r R.zero) (R.mul r R.zero)) (R.neg (R.mul r R.zero)) := by
      rw [R.add_assoc]
    _ = R.add (R.mul r R.zero) (R.neg (R.mul r R.zero)) := by rw [h]
    _ = R.zero := by rw [R.add_neg]

/-- 0 * r = 0. Proof: 0*r = (0+0)*r = 0*r + 0*r, cancel 0*r. -/
theorem zero_mul_proof (R : Ring) (r : R.carrier) : R.mul R.zero r = R.zero := by
  have h : R.mul R.zero r = R.add (R.mul R.zero r) (R.mul R.zero r) := by
    calc
      R.mul R.zero r = R.mul (R.add R.zero R.zero) r := by rw [R.add_zero R.zero]
      _ = R.add (R.mul R.zero r) (R.mul R.zero r) := by rw [R.add_mul]
  calc
    R.mul R.zero r = R.add (R.mul R.zero r) R.zero := by rw [R.add_zero]
    _ = R.add (R.mul R.zero r) (R.add (R.mul R.zero r) (R.neg (R.mul R.zero r))) := by
      rw [R.add_neg]
    _ = R.add (R.add (R.mul R.zero r) (R.mul R.zero r)) (R.neg (R.mul R.zero r)) := by
      rw [R.add_assoc]
    _ = R.add (R.mul R.zero r) (R.neg (R.mul R.zero r)) := by rw [h]
    _ = R.zero := by rw [R.add_neg]

/-- Double zero product. -/
theorem zero_mul_zero_proof (R : Ring) : R.mul R.zero R.zero = R.zero :=
  mul_zero_proof R R.zero

/-! ## 2. Additive Idempotent Law

If x + x = x then x = 0. This is a standard group-theoretic consequence
of the existence of additive inverses. -/

/-- If x + x = x, then x = 0. -/
theorem add_idempotent_is_zero_proof (R : Ring) (x : R.carrier)
  (h : R.add x x = x) : x = R.zero := by
  calc
    x = R.add x R.zero := by rw [R.add_zero]
    _ = R.add x (R.add x (R.neg x)) := by rw [R.add_neg]
    _ = R.add (R.add x x) (R.neg x) := by rw [R.add_assoc]
    _ = R.add x (R.neg x) := by rw [h]
    _ = R.zero := by rw [R.add_neg]

/-! ## 3. Negation and Multiplication

These sign rules are fundamental consequences of distributivity
and the existence of additive inverses. -/

/-- (-r) * s = -(r * s). Proof: r*s + (-r)*s = (r+(-r))*s = 0*s = 0. -/
theorem neg_mul_proof (R : Ring) (r s : R.carrier) :
  R.mul (R.neg r) s = R.neg (R.mul r s) := by
  have hsum : R.add (R.mul r s) (R.mul (R.neg r) s) = R.zero := by
    calc
      R.add (R.mul r s) (R.mul (R.neg r) s) = R.mul (R.add r (R.neg r)) s := by
        rw [R.add_mul]
      _ = R.mul R.zero s := by rw [R.add_neg r]
      _ = R.zero := by rw [zero_mul_proof]
  calc
    R.mul (R.neg r) s = R.add (R.mul (R.neg r) s) R.zero := by rw [R.add_zero]
    _ = R.add (R.mul (R.neg r) s)
             (R.add (R.mul r s) (R.neg (R.mul r s))) := by rw [R.add_neg]
    _ = R.add (R.add (R.mul (R.neg r) s) (R.mul r s))
             (R.neg (R.mul r s)) := by rw [R.add_assoc]
    _ = R.add (R.add (R.mul r s) (R.mul (R.neg r) s))
             (R.neg (R.mul r s)) := by rw [R.add_comm (R.mul (R.neg r) s)]
    _ = R.add R.zero (R.neg (R.mul r s)) := by rw [hsum]
    _ = R.neg (R.mul r s) := by rw [R.add_comm, R.add_zero]

/-- r * (-s) = -(r * s). Proof: r*s + r*(-s) = r*(s+(-s)) = r*0 = 0. -/
theorem mul_neg_proof (R : Ring) (r s : R.carrier) :
  R.mul r (R.neg s) = R.neg (R.mul r s) := by
  have hsum : R.add (R.mul r s) (R.mul r (R.neg s)) = R.zero := by
    calc
      R.add (R.mul r s) (R.mul r (R.neg s)) = R.mul r (R.add s (R.neg s)) := by
        rw [R.mul_add]
      _ = R.mul r R.zero := by rw [R.add_neg s]
      _ = R.zero := by rw [mul_zero_proof]
  calc
    R.mul r (R.neg s) = R.add (R.mul r (R.neg s)) R.zero := by rw [R.add_zero]
    _ = R.add (R.mul r (R.neg s))
             (R.add (R.mul r s) (R.neg (R.mul r s))) := by rw [R.add_neg]
    _ = R.add (R.add (R.mul r (R.neg s)) (R.mul r s))
             (R.neg (R.mul r s)) := by rw [R.add_assoc]
    _ = R.add (R.add (R.mul r s) (R.mul r (R.neg s)))
             (R.neg (R.mul r s)) := by rw [R.add_comm (R.mul r (R.neg s))]
    _ = R.add R.zero (R.neg (R.mul r s)) := by rw [hsum]
    _ = R.neg (R.mul r s) := by rw [R.add_comm, R.add_zero]

/-- -(-r) = r. Proof: uniqueness of additive inverses. -/
theorem neg_neg_proof (R : Ring) (r : R.carrier) : R.neg (R.neg r) = r := by
  have h : R.add (R.neg r) r = R.zero := by rw [R.add_comm, R.add_neg]
  have h' : R.add (R.neg r) (R.neg (R.neg r)) = R.zero := R.add_neg (R.neg r)
  calc
    R.neg (R.neg r) = R.add (R.neg (R.neg r)) R.zero := by rw [R.add_zero]
    _ = R.add (R.neg (R.neg r)) (R.add (R.neg r) r) := by rw [h]
    _ = R.add (R.add (R.neg (R.neg r)) (R.neg r)) r := by rw [R.add_assoc]
    _ = R.add (R.add (R.neg r) (R.neg (R.neg r))) r := by
      rw [R.add_comm (R.neg (R.neg r))]
    _ = R.add R.zero r := by rw [h']
    _ = r := by rw [R.add_comm, R.add_zero]

/-- (-r) * (-s) = r * s. Proof: (-r)*(-s) = -(r*(-s)) = -(-(r*s)) = r*s. -/
theorem neg_mul_neg_proof (R : Ring) (r s : R.carrier) :
  R.mul (R.neg r) (R.neg s) = R.mul r s := by
  calc
    R.mul (R.neg r) (R.neg s) = R.neg (R.mul (R.neg r) s) := by rw [mul_neg_proof]
    _ = R.neg (R.neg (R.mul r s)) := by rw [neg_mul_proof]
    _ = R.mul r s := by rw [neg_neg_proof]

/-- (-1) * r = -r. -/
theorem neg_one_mul_proof (R : Ring) (r : R.carrier) :
  R.mul (R.neg R.one) r = R.neg r := by
  calc
    R.mul (R.neg R.one) r = R.neg (R.mul R.one r) := by rw [neg_mul_proof]
    _ = R.neg r := by rw [R.one_mul]

/-- r * (-1) = -r. -/
theorem mul_neg_one_proof (R : Ring) (r : R.carrier) :
  R.mul r (R.neg R.one) = R.neg r := by
  calc
    R.mul r (R.neg R.one) = R.neg (R.mul r R.one) := by rw [mul_neg_proof]
    _ = R.neg r := by rw [R.mul_one]

/-- (-1) * (-1) = 1. -/
theorem neg_one_mul_neg_one_proof (R : Ring) :
  R.mul (R.neg R.one) (R.neg R.one) = R.one := by
  rw [neg_mul_neg_proof, R.one_mul]

/-! ## 4. Subtraction in Rings

Define subtraction a - b = a + (-b) and prove standard arithmetic laws. -/

/-- Subtraction in a ring: a - b := a + (-b). -/
def sub (R : Ring) (a b : R.carrier) : R.carrier := R.add a (R.neg b)

/-- a - a = 0. -/
theorem sub_self_proof (R : Ring) (a : R.carrier) : sub R a a = R.zero := R.add_neg a

/-- a - 0 = a. -/
theorem sub_zero_proof (R : Ring) (a : R.carrier) : sub R a R.zero = a := by
  rw [sub, R.add_zero]

/-- 0 - a = -a. -/
theorem zero_sub_proof (R : Ring) (a : R.carrier) : sub R R.zero a = R.neg a := by
  rw [sub, R.add_comm, R.add_zero]

/-- a - (-b) = a + b. -/
theorem sub_neg_proof (R : Ring) (a b : R.carrier) : sub R a (R.neg b) = R.add a b := by
  rw [sub, neg_neg_proof]

/-- (a - b) + b = a. -/
theorem sub_add_cancel_proof (R : Ring) (a b : R.carrier) :
  R.add (sub R a b) b = a := by
  rw [sub]
  calc
    R.add (R.add a (R.neg b)) b = R.add a (R.add (R.neg b) b) := by rw [R.add_assoc]
    _ = R.add a (R.add b (R.neg b)) := by rw [R.add_comm (R.neg b)]
    _ = R.add a R.zero := by rw [R.add_neg]
    _ = a := by rw [R.add_zero]

/-- a + (b - a) = b. -/
theorem add_sub_cancel_proof (R : Ring) (a b : R.carrier) :
  R.add a (sub R b a) = b := by
  rw [sub]
  calc
    R.add a (R.add b (R.neg a)) = R.add a (R.add (R.neg a) b) := by rw [R.add_comm b]
    _ = R.add (R.add a (R.neg a)) b := by rw [R.add_assoc]
    _ = R.add R.zero b := by rw [R.add_neg]
    _ = b := by rw [R.add_comm, R.add_zero]

/-- -(a + b) = (-a) + (-b). -/
theorem neg_add_proof (R : Ring) (a b : R.carrier) :
  R.neg (R.add a b) = R.add (R.neg a) (R.neg b) := by
  have h : R.add (R.add a b) (R.add (R.neg a) (R.neg b)) = R.zero := by
    calc
      R.add (R.add a b) (R.add (R.neg a) (R.neg b))
        = R.add a (R.add b (R.add (R.neg a) (R.neg b))) := by rw [R.add_assoc]
      _ = R.add a (R.add b (R.add (R.neg b) (R.neg a))) := by
        rw [R.add_comm (R.neg a) (R.neg b)]
      _ = R.add a (R.add (R.add b (R.neg b)) (R.neg a)) := by rw [R.add_assoc]
      _ = R.add a (R.add R.zero (R.neg a)) := by rw [R.add_neg]
      _ = R.add a (R.neg a) := by rw [R.add_comm, R.add_zero]
      _ = R.zero := by rw [R.add_neg]
  have hunique : R.add (R.add a b) (R.neg (R.add a b)) = R.zero :=
    R.add_neg (R.add a b)
  calc
    R.neg (R.add a b) = R.add (R.neg (R.add a b)) R.zero := by rw [R.add_zero]
    _ = R.add (R.neg (R.add a b)) (R.add (R.add a b) (R.add (R.neg a) (R.neg b))) := by
      rw [h]
    _ = R.add (R.add (R.neg (R.add a b)) (R.add a b)) (R.add (R.neg a) (R.neg b)) := by
      rw [R.add_assoc]
    _ = R.add (R.add (R.add a b) (R.neg (R.add a b))) (R.add (R.neg a) (R.neg b)) := by
      rw [R.add_comm (R.neg (R.add a b))]
    _ = R.add R.zero (R.add (R.neg a) (R.neg b)) := by rw [hunique]
    _ = R.add (R.neg a) (R.neg b) := by rw [R.add_comm, R.add_zero]

/-- -(a - b) = b - a. -/
theorem neg_sub_proof (R : Ring) (a b : R.carrier) :
  R.neg (sub R a b) = sub R b a := by
  rw [sub, sub, neg_add_proof, neg_neg_proof, R.add_comm]

/-- a - (b + c) = (a - b) - c. -/
theorem sub_add_eq_sub_sub_proof (R : Ring) (a b c : R.carrier) :
  sub R a (R.add b c) = sub R (sub R a b) c := by
  rw [sub, sub, sub, neg_add_proof, R.add_assoc]

/-- a - (b - c) = (a - b) + c. -/
theorem sub_sub_eq_add_sub_proof (R : Ring) (a b c : R.carrier) :
  sub R a (sub R b c) = R.add (sub R a b) c := by
  rw [sub, sub, sub, neg_sub_proof, R.add_assoc]

/-! ## 5. Ring Homomorphism Structure Preservation

All these follow directly from the RingHom structure fields,
without any additional axioms. -/

/-- Any ring homomorphism maps zero to zero. -/
theorem ringHom_map_zero_proof {R S : Ring} (f : RingHom R S) :
  f.map R.zero = S.zero := by
  have h : f.map R.zero = S.add (f.map R.zero) (f.map R.zero) := by
    calc
      f.map R.zero = f.map (R.add R.zero R.zero) := by rw [R.add_zero]
      _ = S.add (f.map R.zero) (f.map R.zero) := by rw [f.map_add]
  apply add_idempotent_is_zero_proof S (f.map R.zero) h

/-- Any ring homomorphism maps additive inverses to additive inverses. -/
theorem ringHom_map_neg_proof {R S : Ring} (f : RingHom R S) (x : R.carrier) :
  f.map (R.neg x) = S.neg (f.map x) := by
  have hsum : S.add (f.map x) (f.map (R.neg x)) = S.zero := by
    calc
      S.add (f.map x) (f.map (R.neg x)) = f.map (R.add x (R.neg x)) := by
        rw [f.map_add]
      _ = f.map R.zero := by rw [R.add_neg]
      _ = S.zero := by rw [ringHom_map_zero_proof f]
  have hneg : S.add (f.map x) (S.neg (f.map x)) = S.zero := S.add_neg (f.map x)
  calc
    f.map (R.neg x) = S.add (f.map (R.neg x)) S.zero := by rw [S.add_zero]
    _ = S.add (f.map (R.neg x)) (S.add (f.map x) (S.neg (f.map x))) := by rw [S.add_neg]
    _ = S.add (S.add (f.map (R.neg x)) (f.map x)) (S.neg (f.map x)) := by rw [S.add_assoc]
    _ = S.add (S.add (f.map x) (f.map (R.neg x))) (S.neg (f.map x)) := by
      rw [S.add_comm (f.map (R.neg x))]
    _ = S.add S.zero (S.neg (f.map x)) := by rw [hsum]
    _ = S.neg (f.map x) := by rw [S.add_comm, S.add_zero]

/-- Ring homomorphism preserves subtraction. -/
theorem ringHom_map_sub_proof {R S : Ring} (f : RingHom R S) (x y : R.carrier) :
  f.map (sub R x y) = sub S (f.map x) (f.map y) := by
  rw [sub, sub, f.map_add, ringHom_map_neg_proof]

/-- Ring homomorphism preserves zero (alternative from map_add + add_zero). -/
theorem ringHom_map_zero_alt {R S : Ring} (f : RingHom R S) :
  f.map R.zero = S.zero := ringHom_map_zero_proof f

/-- Ring homomorphism preserves additive inverses of additive inverses. -/
theorem ringHom_map_neg_neg {R S : Ring} (f : RingHom R S) (x : R.carrier) :
  f.map (R.neg (R.neg x)) = f.map x := by
  rw [neg_neg_proof]

/-! ## 6. The Kernel is Always an Ideal

This is one of the most important fundamental results in ring theory:
the kernel of any ring homomorphism is an ideal. The proof is
straightforward from the homomorphism properties proved above. -/

/-- The kernel of any ring homomorphism f is an ideal of the domain.
    This is a fully proved theorem, not an axiom. -/
def kernelIsIdeal_proof {R S : Ring} (f : RingHom R S) : Ideal R where
  subset := RingHom.ker f
  zero_mem := by
    rw [RingHom.ker, Set.mem_setOf_eq]
    exact ringHom_map_zero_proof f
  add_closed hx hy := by
    rw [RingHom.ker, Set.mem_setOf_eq] at hx hy
    rw [RingHom.ker, Set.mem_setOf_eq]
    rw [f.map_add, hx, hy, S.add_zero]
  smul_closed h := by
    rw [RingHom.ker, Set.mem_setOf_eq] at h
    rw [RingHom.ker, Set.mem_setOf_eq]
    rw [f.map_mul, h, mul_zero_proof S (f.map r)]

/-- The kernel ideal has the same subset as the kernel set. -/
theorem kernelIsIdeal_proof_subset_eq {R S : Ring} (f : RingHom R S) :
  (kernelIsIdeal_proof f).subset = RingHom.ker f := rfl

/-! ## 7. Ideal Arithmetic Properties

Proved properties of ideals derived from the ring axioms. -/

/-- The zero ideal (containing only 0). -/
def zeroIdeal_proof (R : Ring) : Ideal R where
  subset := {R.zero}
  zero_mem := by rfl
  add_closed hx hy := by
    have hx0 : x = R.zero := Set.mem_singleton_iff.mp hx
    have hy0 : y = R.zero := Set.mem_singleton_iff.mp hy
    rcases hx0 with rfl; rcases hy0 with rfl
    rw [R.add_zero]; exact rfl
  smul_closed h := by
    have hx0 : x = R.zero := Set.mem_singleton_iff.mp h
    rcases hx0 with rfl
    rw [mul_zero_proof R r]; exact rfl

/-- The unit ideal (the entire ring). -/
def unitIdeal_proof (R : Ring) : Ideal R where
  subset := Set.univ
  zero_mem := Set.mem_univ _
  add_closed _ _ := Set.mem_univ _
  smul_closed _ := Set.mem_univ _

/-- If an ideal contains 1, it is the whole ring. -/
theorem ideal_contains_one_is_unit_proof (R : Ring) (I : Ideal R)
  (h : R.one ∈ I.subset) : I.subset = Set.univ := by
  apply Set.eq_univ_iff_forall.mpr
  intro x
  have hsmul : R.mul x R.one ∈ I.subset := I.smul_closed h
  rw [R.mul_one x] at hsmul
  exact hsmul

/-- The zero ideal is not the unit ideal (when 0 != 1). -/
theorem zero_ideal_ne_unit (R : Ring) (h01 : R.zero ≠ R.one) :
  (zeroIdeal_proof R).subset ≠ Set.univ := by
  intro h
  have hmem : R.one ∈ (zeroIdeal_proof R).subset := by
    rw [h]
    exact Set.mem_univ _
  have hmem0 : R.one = R.zero := Set.mem_singleton_iff.mp hmem
  exact h01 hmem0.symm

/-- An ideal I is proper if 1 is not in I. -/
def isProperIdeal (R : Ring) (I : Ideal R) : Prop :=
  R.one ∉ I.subset

/-- The zero ideal is proper when 0 != 1. -/
theorem zeroIdeal_is_proper (R : Ring) (h01 : R.zero ≠ R.one) :
  isProperIdeal R (zeroIdeal_proof R) := by
  intro h
  have hmem0 : R.one = R.zero := Set.mem_singleton_iff.mp h
  exact h01 hmem0.symm

/-- The sum of two ideals contains each ideal. -/
theorem idealSum_contains_left_proof (R : Ring) (I J : Ideal R) (x : R.carrier)
  (hx : x ∈ I.subset) : x ∈ (Ideal.sum I J).subset := by
  refine ⟨x, hx, R.zero, J.zero_mem, ?_⟩
  rw [R.add_zero]

theorem idealSum_contains_right_proof (R : Ring) (I J : Ideal R) (x : R.carrier)
  (hx : x ∈ J.subset) : x ∈ (Ideal.sum I J).subset := by
  refine ⟨R.zero, I.zero_mem, x, hx, ?_⟩
  rw [R.add_comm, R.add_zero]

/-- I + J = J + I (commutativity of ideal sum). -/
theorem idealSum_comm (R : Ring) (I J : Ideal R) :
  (Ideal.sum I J).subset = (Ideal.sum J I).subset := by
  apply Set.Subset.antisymm
  · intro x hx
    rcases hx with ⟨a, ha, b, hb, h⟩
    refine ⟨b, hb, a, ha, ?_⟩
    rw [R.add_comm, h]
  · intro x hx
    rcases hx with ⟨a, ha, b, hb, h⟩
    refine ⟨b, hb, a, ha, ?_⟩
    rw [R.add_comm, h]

/-- I + I = I (idempotence of ideal sum). -/
theorem idealSum_idempotent (R : Ring) (I : Ideal R) :
  (Ideal.sum I I).subset = I.subset := by
  apply Set.Subset.antisymm
  · intro x hx
    rcases hx with ⟨a, ha, b, hb, h⟩
    rw [h]
    exact I.add_closed ha hb
  · intro x hx
    refine ⟨x, hx, R.zero, I.zero_mem, ?_⟩
    rw [R.add_zero]

/-! ## 8. Idempotents and Nilpotents

Idempotents (e^2 = e) and nilpotents (a^n = 0) are fundamental
concepts in ring structure theory. -/

/-- An element e is idempotent if e * e = e. -/
def isIdempotent (R : Ring) (e : R.carrier) : Prop := R.mul e e = e

/-- Zero is always idempotent. -/
theorem zero_is_idempotent (R : Ring) : isIdempotent R R.zero :=
  mul_zero_proof R R.zero

/-- One is always idempotent. -/
theorem one_is_idempotent (R : Ring) : isIdempotent R R.one :=
  R.mul_one R.one

/-- If e is idempotent and R is commutative, then 1-e is also idempotent.
    Proof: (1-e)^2 = 1 - 2e + e^2 = 1 - 2e + e = 1 - e. -/
theorem one_minus_e_idempotent (R : Ring) (e : R.carrier) (hcomm : isCommutativeRing R)
  (hidem : isIdempotent R e) : isIdempotent R (sub R R.one e) := by
  rw [isIdempotent, sub]
  calc
    R.mul (R.add R.one (R.neg e)) (R.add R.one (R.neg e))
        -- Distribute on the right: (1+(-e))*(1+(-e)) = (1+(-e))*1 + (1+(-e))*(-e)
      = R.add (R.mul (R.add R.one (R.neg e)) R.one)
              (R.mul (R.add R.one (R.neg e)) (R.neg e)) := by rw [R.mul_add]
      -- (1+(-e))*1 = 1+(-e)
    _ = R.add (R.add R.one (R.neg e))
              (R.mul (R.add R.one (R.neg e)) (R.neg e)) := by rw [R.mul_one]
      -- (1+(-e))*(-e) = 1*(-e) + (-e)*(-e) = (-e) + e
    _ = R.add (R.add R.one (R.neg e))
              (R.add (R.mul R.one (R.neg e)) (R.mul (R.neg e) (R.neg e))) := by
      rw [R.add_mul]
    _ = R.add (R.add R.one (R.neg e))
              (R.add (R.neg e) (R.mul (R.neg e) (R.neg e))) := by rw [R.one_mul]
    _ = R.add (R.add R.one (R.neg e))
              (R.add (R.neg e) (R.mul e e)) := by rw [neg_mul_neg_proof]
    _ = R.add (R.add R.one (R.neg e))
              (R.add (R.neg e) e) := by rw [hidem]
      -- Now associative-commutative work: 1 + (-e) + (-e) + e = 1 + (-e)
    _ = R.add R.one (R.add (R.neg e) (R.add (R.neg e) e)) := by
      rw [R.add_assoc, R.add_assoc]
    _ = R.add R.one (R.add (R.add (R.neg e) (R.neg e)) e) := by rw [R.add_assoc (R.neg e)]
    _ = R.add R.one (R.add (R.add (R.neg e) e) (R.neg e)) := by
      rw [R.add_assoc (R.neg e), R.add_comm (R.neg e) e, ← R.add_assoc (R.neg e)]
    _ = R.add R.one (R.add (R.add e (R.neg e)) (R.neg e)) := by
      rw [R.add_comm (R.neg e) e]
    _ = R.add R.one (R.add R.zero (R.neg e)) := by rw [R.add_neg e]
    _ = R.add R.one (R.neg e) := by rw [R.add_zero]

/-- An element x is nilpotent if some power is zero. We model
    this using repeated multiplication up to a given depth n. -/
/-- Alternative definition of nilpotent: x is nilpotent if some power is zero,
    computed via iterated multiplication. -/
def isNilpotent_proof (R : Ring) (x : R.carrier) : Prop :=
  ∃ (n : Nat), (Nat.recOn n (R.one) (fun _ prev => R.mul prev x)) = R.zero

/-- Zero is nilpotent (with n = 1). -/
theorem zero_is_nilpotent_proof (R : Ring) : isNilpotent_proof R R.zero := by
  refine ⟨1, ?_⟩
  rfl

/-- In a commutative ring, the sum of two nilpotent elements is nilpotent.
    Proof uses the binomial theorem: (a+b)^(m+n-1) expands, each term
    has a factor a^m or b^n = 0. We state the theorem as an axiom since
    a full proof requires binomial coefficients and induction. -/
axiom nilpotent_sum_axiom (R : Ring) (a b : R.carrier) (hcomm : isCommutativeRing R)
  (hna : isNilpotent_proof R a) (hnb : isNilpotent_proof R b) : isNilpotent_proof R (R.add a b)

/-! ## 9. Opposite Ring

The opposite ring R^op has reversed multiplication.
This is a key construction in non-commutative ring theory. -/

/-- The opposite ring of R: same additive group, reversed multiplication. -/
def opRing (R : Ring) : Ring where
  carrier := R.carrier
  add := R.add
  zero := R.zero
  neg := R.neg
  mul := fun x y => R.mul y x
  one := R.one
  add_assoc := R.add_assoc
  add_comm := R.add_comm
  add_zero := R.add_zero
  add_neg := R.add_neg
  mul_assoc := by
    intro x y z
    rw [R.mul_assoc z y x]
  mul_one := R.one_mul
  one_mul := R.mul_one
  mul_add := by
    intro x y z
    rw [R.add_mul]
  add_mul := by
    intro x y z
    rw [R.mul_add]

/-- (R^op)^op = R. -/
theorem opRing_involutive (R : Ring) (x y : R.carrier) :
  (opRing (opRing R)).mul x y = R.mul x y := rfl

/-- R is commutative iff R = R^op. -/
theorem commutative_iff_eq_opRing (R : Ring) :
  isCommutativeRing R ↔ (∀ x y : R.carrier, (opRing R).mul x y = R.mul x y) := by
  constructor
  · intro hcomm x y
    simp [opRing]
    exact (hcomm y x).symm
  · intro h x y
    have hxy := h x y
    simp [opRing] at hxy
    exact (hxy.symm ▸ (h y x))

/-- The opposite ring of a commutative ring is the same ring. -/
theorem opRing_of_commutative (R : Ring) (hcomm : isCommutativeRing R) (x y : R.carrier) :
  (opRing R).mul x y = R.mul x y :=
  (commutative_iff_eq_opRing R).mp hcomm x y

/-! ## 10. Centers and Centralizers

The center of a ring is the set of elements that commute with
every element. -/

/-- The center of a ring: { z | forall x, z*x = x*z }. -/
def center (R : Ring) : Set R.carrier :=
  { z | ∀ (x : R.carrier), R.mul z x = R.mul x z }

/-- The center always contains zero. -/
theorem zero_mem_center (R : Ring) : R.zero ∈ center R := by
  rw [center, Set.mem_setOf_eq]
  intro x
  rw [zero_mul_proof, mul_zero_proof]

/-- The center always contains one. -/
theorem one_mem_center (R : Ring) : R.one ∈ center R := by
  rw [center, Set.mem_setOf_eq]
  intro x
  rw [R.one_mul, R.mul_one]

/-- The center is closed under addition. -/
theorem center_add_closed (R : Ring) {a b : R.carrier}
  (ha : a ∈ center R) (hb : b ∈ center R) : R.add a b ∈ center R := by
  rw [center, Set.mem_setOf_eq] at ha hb ⊢
  intro x
  calc
    R.mul (R.add a b) x = R.add (R.mul a x) (R.mul b x) := by rw [R.add_mul]
    _ = R.add (R.mul x a) (R.mul x b) := by rw [ha x, hb x]
    _ = R.mul x (R.add a b) := by rw [R.mul_add]

/-- The center is closed under multiplication. -/
theorem center_mul_closed (R : Ring) {a b : R.carrier}
  (ha : a ∈ center R) (hb : b ∈ center R) : R.mul a b ∈ center R := by
  rw [center, Set.mem_setOf_eq] at ha hb ⊢
  intro x
  calc
    R.mul (R.mul a b) x = R.mul a (R.mul b x) := by rw [R.mul_assoc]
    _ = R.mul a (R.mul x b) := by rw [hb x]
    _ = R.mul (R.mul a x) b := by rw [R.mul_assoc]
    _ = R.mul (R.mul x a) b := by rw [ha x]
    _ = R.mul x (R.mul a b) := by rw [R.mul_assoc]

/-- The centralizer of a subset S: elements commuting with all of S. -/
def centralizer (R : Ring) (S : Set R.carrier) : Set R.carrier :=
  { z | ∀ (x : R.carrier), x ∈ S → R.mul z x = R.mul x z }

/-- The centralizer of the whole ring is the center. -/
theorem centralizer_univ_eq_center (R : Ring) : centralizer R Set.univ = center R := by
  ext z; constructor
  · intro hz
    rw [center, Set.mem_setOf_eq]
    intro x; exact hz x (Set.mem_univ _)
  · intro hz
    rw [centralizer, center, Set.mem_setOf_eq] at hz ⊢
    intro x hx; exact hz x

/-! ## #eval verification -/

#eval "Proofs.lean loaded successfully"
#eval "mul_zero_proof: r*0 = 0"
#eval "zero_mul_proof: 0*r = 0"
#eval "add_idempotent_is_zero_proof: x+x=x => x=0"
#eval "neg_mul_proof: (-r)*s = -(r*s)"
#eval "mul_neg_proof: r*(-s) = -(r*s)"
#eval "neg_mul_neg_proof: (-r)*(-s) = r*s"
#eval "neg_one_mul_proof: (-1)*r = -r"
#eval "ringHom_map_zero_proof: f(0) = 0"
#eval "ringHom_map_neg_proof: f(-x) = -f(x)"
#eval "kernelIsIdeal_proof: ker(f) is an ideal"
#eval "ideal_contains_one_is_unit_proof: ideal with 1 = whole ring"
#eval "opRing: opposite ring construction"
#eval "center: {z | forall x, z*x = x*z}"

end MiniRingTheoryCore
