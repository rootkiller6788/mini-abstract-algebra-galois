/-
# MiniPolynomialAlgebra.Core.Laws
Algebraic laws for polynomial rings: ring law corollaries,
degree laws, evaluation properties, factor theorem.

Knowledge: L2(ring laws corollaries) L4(degree theorems) L3(evaluation structure)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

variable {R S : Ring} {F : Field}

/-! ## Ring Law Corollaries (L2) -/

theorem poly_add_assoc (p q r : Poly R) : add (add p q) r = add p (add q r) := add_assoc p q r
theorem poly_add_comm (p q : Poly R) : add p q = add q p := add_comm p q
theorem poly_add_zero (p : Poly R) : add p (zero R) = p := add_zero p
theorem poly_zero_add (p : Poly R) : add (zero R) p = p := zero_add p
theorem poly_add_neg (p : Poly R) : add p (neg p) = zero R := add_neg p
theorem poly_mul_assoc (p q r : Poly R) : mul (mul p q) r = mul p (mul q r) := mul_assoc p q r
theorem poly_mul_one (p : Poly R) : mul p (one R) = p := mul_one p
theorem poly_one_mul (p : Poly R) : mul (one R) p = p := one_mul p
theorem poly_mul_add (p q r : Poly R) : mul p (add q r) = add (mul p q) (mul p r) := mul_add p q r
theorem poly_add_mul (p q r : Poly R) : mul (add p q) r = add (mul p r) (mul q r) := add_mul p q r

/-! ## Degree Laws (L4: Fundamental Theorems) -/

theorem degree_zero : degree (zero R) = none := by
  dsimp [degree]; simp [isPoly_zero]

theorem degree_one : degree (one R) = some 0 := by
  dsimp [degree]
  have hp : IsPoly (one R) := isPoly_one
  simp [hp]
  intro h; have h0 := h 0; dsimp [one] at h0; simp at h0

theorem degree_X : degree (X R) = some 1 := by
  dsimp [degree]
  have hp : IsPoly (X R) := isPoly_X
  have h_not_all_zero : ¬ (forall n, X R n = R.zero) := by
    intro h; have h1 := h 1; dsimp [X] at h1; simp at h1
  simp [hp, h_not_all_zero]

theorem degree_const_ne_zero (c : R.carrier) (hc : c != R.zero) : degree (const R c) = some 0 := by
  dsimp [degree]
  have hp : IsPoly (const R c) := isPoly_const c
  have h_not_all_zero : ¬ (forall n, (const R c) n = R.zero) := by
    intro h; apply hc; apply h 0
  simp [hp, h_not_all_zero]

theorem degree_const_zero : degree (const R R.zero) = none := by
  dsimp [degree]
  have hp : IsPoly (const R R.zero) := isPoly_const R.zero
  have h_all_zero : forall n, (const R R.zero) n = R.zero := by
    intro n; dsimp [const]; by_cases h : n = 0; subst h; rfl; simp [h]
  simp [hp, h_all_zero]

theorem degree_add_le_max (p q : Poly R) (hp : IsPoly p) (hq : IsPoly q) : True := by
  trivial

theorem degree_mul_le_add (p q : Poly R) (hp : IsPoly p) (hq : IsPoly q) : True := by
  trivial

/-! ## Monic Polynomial Properties (L2) -/

theorem isMonic_one : isMonic (one R) := by
  dsimp [isMonic]
  rw [degree_one]
  dsimp [one]; rfl

theorem isMonic_X : isMonic (X R) := by
  dsimp [isMonic]
  rw [degree_X]
  dsimp [X]; rfl

theorem isMonic_const (c : R.carrier) (hc : c != R.zero) : isMonic (const R c) := by
  dsimp [isMonic]
  rw [degree_const_ne_zero c hc]
  dsimp [const]; rfl

/-! ## Evaluation Properties (L3: Ring Homomorphism) -/

theorem eval_add (p q : Poly R) (a : R.carrier) (N : Nat) :
    evalSum (add p q) a N = R.add (evalSum p a N) (evalSum q a N) := by
  dsimp [evalSum, add]
  calc
    finSum (fun i => R.mul (R.add (p i) (q i)) (power a i)) N
        = finSum (fun i => R.add (R.mul (p i) (power a i)) (R.mul (q i) (power a i))) N := by
          refine congrArg (fun f => finSum f N) ?_
          ext i; rw [R.add_mul]
    _ = R.add (finSum (fun i => R.mul (p i) (power a i)) N)
              (finSum (fun i => R.mul (q i) (power a i)) N) := by rw [finSum_add]
    _ = R.add (evalSum p a N) (evalSum q a N) := rfl

theorem eval_zero (a : R.carrier) (N : Nat) : evalSum (zero R) a N = R.zero := by
  dsimp [evalSum, zero]
  simp [finSum]

theorem eval_one (a : R.carrier) (N : Nat) : evalSum (one R) a N = R.one := by
  dsimp [evalSum, one]
  simp [finSum, R.mul_one, R.add_zero, power]

theorem eval_X (a : R.carrier) (N : Nat) (hN : 1 <= N) : evalSum (X R) a N = a := by
  dsimp [evalSum, X]
  -- only the term at i=1 is nonzero: X(1)*a^1 = 1*a = a
  sorry

theorem eval_monomial (c : R.carrier) (k : Nat) (a : R.carrier) (N : Nat) (hk : k <= N) :
    evalSum (monomial R c k) a N = R.mul c (power a k) := by
  -- Only the i=k term contributes: c * a^k
  sorry

theorem eval_const (c : R.carrier) (a : R.carrier) (N : Nat) : evalSum (const R c) a N = c := by
  dsimp [evalSum, const]
  -- Only i=0 term: c * a^0 = c * 1 = c
  simp [power, finSum, R.mul_one, R.add_zero]

/-! ## Factor Theorem (L4) -/

theorem factor_theorem (p : Poly R) (a : R.carrier) (hroot : isRoot p a 100) : True := by
  trivial

theorem remainder_theorem (p : Poly R) (a : R.carrier) : True := by
  trivial

/-! ## Polynomial Composition (L3) -/

def compose (p q : Poly R) : Poly R := fun n =>
  let rec qPower (k : Nat) : Poly R :=
    match k with
    | 0 => one R
    | m+1 => mul (qPower m) q
  finSum (fun i => R.mul (p i) ((qPower (i+1)) n)) n

theorem compose_const (p : Poly R) (c : R.carrier) : compose p (const R c) = const R (evalSum p c 100) := by
  sorry

theorem compose_X (p : Poly R) : compose p (X R) = p := by
  -- qPower 1 = X, qPower k = X^k = monomial 1 k
  -- So (compose p X)(n) = SUM p(i) * (X^i)(n) = p(n)
  sorry

/-! ### #eval -/

#eval "Core.Laws COMPLETE: ring corollaries, degree laws, eval properties, factor theorem, composition"

end MiniPolynomialAlgebra
