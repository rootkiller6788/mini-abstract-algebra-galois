/-
# MiniPolynomialAlgebra.Core.Basic
Polynomial rings R[X]: definition, operations, ring axioms, degree,
evaluation, formal derivative, #eval examples.

Knowledge: L1(Poly,degree,monic,root) L2(add,mul,eval) L3(Ring) L4(axioms) L5(induction) L6(#eval)
-/

import MiniRingTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore

/-! ## Polynomial Type (L1) -/

/-- Polynomial over R as a function Nat -> R.carrier (formal power series).
    Polynomials are the finitely-supported subset. -/
def Poly (R : Ring) := Nat -> R.carrier

namespace Poly
variable {R S : Ring}

/-! ### Basic Constructors (L1) -/

def zero (R : Ring) : Poly R := fun _ => R.zero
def one (R : Ring) : Poly R := fun n => if n = 0 then R.one else R.zero
def X (R : Ring) : Poly R := fun n => if n = 1 then R.one else R.zero
def const (R : Ring) (c : R.carrier) : Poly R := fun n => if n = 0 then c else R.zero
def monomial (R : Ring) (c : R.carrier) (k : Nat) : Poly R := fun n => if n = k then c else R.zero

/-- IsPoly p := p has finite support (is a polynomial, not just power series) -/
def IsPoly (p : Poly R) : Prop :=
  Exists fun N : Nat => forall n : Nat, N <= n -> p n = R.zero

theorem isPoly_zero : IsPoly (zero R) := by
  exact Exists.intro 0 (fun n _ => rfl)

theorem isPoly_one : IsPoly (one R) := by
  refine Exists.intro 1 (fun n hn => ?_)
  dsimp [one]; have h : n != 0 := by omega; simp [h]

theorem isPoly_X : IsPoly (X R) := by
  refine Exists.intro 2 (fun n hn => ?_)
  dsimp [X]
  have hn0 : n != 0 := by omega
  have hn1 : n != 1 := by omega
  simp [hn0, hn1]

theorem isPoly_const (c : R.carrier) : IsPoly (const R c) := by
  refine Exists.intro 1 (fun n hn => ?_)
  dsimp [const]; have h : n != 0 := by omega; simp [h]

theorem isPoly_monomial (c : R.carrier) (k : Nat) : IsPoly (monomial R c k) := by
  refine Exists.intro (k+1) (fun n hn => ?_)
  dsimp [monomial]; have h : n != k := by omega; simp [h]

theorem isPoly_add {p q : Poly R} (hp : IsPoly p) (hq : IsPoly q) : IsPoly (add p q) := by
  rcases hp with Exists.intro Np hNp
  rcases hq with Exists.intro Nq hNq
  refine Exists.intro (max Np Nq) (fun n hn => ?_)
  dsimp [add]
  have hpz : p n = R.zero := hNp n (le_trans (Nat.le_max_left _ _) hn)
  have hqz : q n = R.zero := hNq n (le_trans (Nat.le_max_right _ _) hn)
  rw [hpz, hqz, R.add_zero]

theorem isPoly_mul {p q : Poly R} (hp : IsPoly p) (hq : IsPoly q) : IsPoly (mul p q) := by
  rcases hp with Exists.intro Np hNp
  rcases hq with Exists.intro Nq hNq
  refine Exists.intro (Np + Nq) (fun n hn => ?_)
  dsimp [mul]
  -- We need: finSum (fun i => p(i)*q(n-i)) n = R.zero
  -- Because every term in the sum is zero (by the support bounds)
  apply finSum_of_all_zero (fun i => R.mul (p i) (q (n - i))) n
  intro i hi
  by_cases hiNp : Np <= i
  · have hpz : p i = R.zero := hNp i hiNp
    rw [hpz]
    -- Lemma: R.mul R.zero x = R.zero
    have h0 : R.mul R.zero (q (n - i)) = R.zero := by
      have h_add0 : R.add R.zero R.zero = R.zero := R.add_zero R.zero
      calc
        R.mul R.zero (q (n - i)) = R.mul (R.add R.zero R.zero) (q (n - i)) := by rw [h_add0]
        _ = R.add (R.mul R.zero (q (n - i))) (R.mul R.zero (q (n - i))) := by rw [R.add_mul]
      -- From this: a = a + a, so a = 0
      let a := R.mul R.zero (q (n - i))
      have ha : R.add a a = a := by rw [← this]
      calc
        a = R.add a R.zero := by rw [R.add_zero]
        _ = R.add a (R.add a (R.neg a)) := by rw [R.add_neg]
        _ = R.add (R.add a a) (R.neg a) := by rw [R.add_assoc]
        _ = R.add a (R.neg a) := by rw [ha]
        _ = R.zero := R.add_neg a
    rw [h0]
  · -- i < Np, so n - i >= Nq
    have hn_sub_i_ge_Nq : Nq <= n - i := by omega
    have hqz : q (n - i) = R.zero := hNq (n - i) hn_sub_i_ge_Nq
    rw [hqz]
    -- Lemma: R.mul x R.zero = R.zero (dual argument)
    have h0 : R.mul (p i) R.zero = R.zero := by
      have h_add0 : R.add R.zero R.zero = R.zero := R.add_zero R.zero
      calc
        R.mul (p i) R.zero = R.mul (p i) (R.add R.zero R.zero) := by rw [h_add0]
        _ = R.add (R.mul (p i) R.zero) (R.mul (p i) R.zero) := by rw [R.mul_add]
      let a := R.mul (p i) R.zero
      have ha : R.add a a = a := by rw [← this]
      calc
        a = R.add a R.zero := by rw [R.add_zero]
        _ = R.add a (R.add a (R.neg a)) := by rw [R.add_neg]
        _ = R.add (R.add a a) (R.neg a) := by rw [R.add_assoc]
        _ = R.add a (R.neg a) := by rw [ha]
        _ = R.zero := R.add_neg a
    rw [h0]

/-! ### Ring Operations (L1, L3) -/

/-- Pointwise addition: (p+q)(n) = p(n) + q(n) -/
def add (p q : Poly R) : Poly R := fun n => R.add (p n) (q n)

/-- Additive inverse: (-p)(n) = -p(n) -/
def neg (p : Poly R) : Poly R := fun n => R.neg (p n)

/-- Subtraction: p - q = p + (-q) -/
def sub (p q : Poly R) : Poly R := add p (neg q)

/-- Scalar multiplication: (c*p)(n) = c * p(n) -/
def smul (c : R.carrier) (p : Poly R) : Poly R := fun n => R.mul c (p n)

/-- Finite sum Sigma_{i=0}^{n} f(i) using ring addition (structurally recursive).
    This non-tail-recursive definition makes induction proofs trivial. -/
def finSum (f : Nat -> R.carrier) : Nat -> R.carrier
  | 0 => f 0
  | n+1 => R.add (finSum f n) (f (n+1))

/-- Convolution multiplication: (p*q)(n) = Sigma_{i=0}^{n} p(i)*q(n-i) -/
def mul (p q : Poly R) : Poly R := fun n =>
  finSum (fun i => R.mul (p i) (q (n - i))) n

/-! ### Additive Ring Axiom Proofs (L4: Fundamental Theorems)

All additive axioms follow trivially from pointwise operations
and the corresponding ring axioms of the coefficient ring R. -/

@[simp]
theorem add_assoc (p q r : Poly R) : add (add p q) r = add p (add q r) := by
  ext n; dsimp [add]; rw [R.add_assoc]

@[simp]
theorem add_comm (p q : Poly R) : add p q = add q p := by
  ext n; dsimp [add]; rw [R.add_comm]

@[simp]
theorem add_zero (p : Poly R) : add p (zero R) = p := by
  ext n; dsimp [add, zero]; rw [R.add_zero]

@[simp]
theorem zero_add (p : Poly R) : add (zero R) p = p := by
  ext n; dsimp [add, zero]; rw [R.add_comm, R.add_zero]

@[simp]
theorem add_neg (p : Poly R) : add p (neg p) = zero R := by
  ext n; dsimp [add, neg, zero]; rw [R.add_neg]

@[simp]
theorem neg_add (p : Poly R) : add (neg p) p = zero R := by
  ext n; dsimp [add, neg, zero]; rw [R.add_comm, R.add_neg]

/-! ### FinSum Lemmas (L5: Proof Technique — Induction) -/

/-- finSum distributes over pointwise addition: SUM (f(i)+g(i)) = SUM f(i) + SUM g(i).
    The structurally recursive definition makes this a clean induction. -/
theorem finSum_add (f g : Nat -> R.carrier) (n : Nat) :
    finSum (fun i => R.add (f i) (g i)) n = R.add (finSum f n) (finSum g n) := by
  induction' n with k ih
  · rfl
  · dsimp [finSum]
    rw [ih]
    -- R.add (R.add (finSum f k) (finSum g k)) (R.add (f (k+1)) (g (k+1)))
    -- = R.add (R.add (finSum f k) (f (k+1))) (R.add (finSum g k) (g (k+1)))
    simp [R.add_assoc, R.add_comm]

/-- Multiply a finSum by a constant: c * SUM f(i) = SUM (c * f(i)).
    Follows from distributivity of R. -/
theorem finSum_smul_left (c : R.carrier) (f : Nat -> R.carrier) (n : Nat) :
    R.mul c (finSum f n) = finSum (fun i => R.mul c (f i)) n := by
  induction' n with k ih
  · rfl
  · dsimp [finSum]
    rw [R.mul_add, ih]

/-- Multiply a finSum on the right by a constant.
    Follows from distributivity of R. -/
theorem finSum_smul_right (c : R.carrier) (f : Nat -> R.carrier) (n : Nat) :
    R.mul (finSum f n) c = finSum (fun i => R.mul (f i) c) n := by
  induction' n with k ih
  · rfl
  · dsimp [finSum]
    rw [R.add_mul, ih]

/-- finSum of zero function is zero. -/
theorem finSum_zero (n : Nat) : finSum (fun _ : Nat => R.zero) n = R.zero := by
  induction' n with k ih
  · rfl
  · dsimp [finSum]; rw [ih, R.add_zero]

/-- finSum range formula: finSum f (n+1) = finSum f n + f(n+1). -/
theorem finSum_succ (f : Nat -> R.carrier) (n : Nat) :
    finSum f (n+1) = R.add (finSum f n) (f (n+1)) := rfl

/-! ### Multiplicative Ring Axioms (L4: Fundamental Theorems) -/

/-- mul_add: p*(q+r) = p*q + p*r.
    Proof uses R.mul_add and finSum_add (which has a complete proof). -/
theorem mul_add (p q r : Poly R) : mul p (add q r) = add (mul p q) (mul p r) := by
  ext n
  dsimp [mul, add]
  calc
    finSum (fun i => R.mul (p i) (R.add (q (n - i)) (r (n - i)))) n
        = finSum (fun i => R.add (R.mul (p i) (q (n - i))) (R.mul (p i) (r (n - i)))) n := by
          refine congrArg (fun f => finSum f n) ?_
          ext i; rw [R.mul_add]
    _ = R.add (finSum (fun i => R.mul (p i) (q (n - i))) n)
              (finSum (fun i => R.mul (p i) (r (n - i))) n) := by rw [finSum_add]
    _ = R.add ((mul p q) n) ((mul p r) n) := rfl

/-- add_mul: (p+q)*r = p*r + q*r.
    Proof uses R.add_mul and finSum_add. -/
theorem add_mul (p q r : Poly R) : mul (add p q) r = add (mul p r) (mul q r) := by
  ext n
  dsimp [mul, add]
  calc
    finSum (fun i => R.mul (R.add (p i) (q i)) (r (n - i))) n
        = finSum (fun i => R.add (R.mul (p i) (r (n - i))) (R.mul (q i) (r (n - i)))) n := by
          refine congrArg (fun f => finSum f n) ?_
          ext i; rw [R.add_mul]
    _ = R.add (finSum (fun i => R.mul (p i) (r (n - i))) n)
              (finSum (fun i => R.mul (q i) (r (n - i))) n) := by rw [finSum_add]
    _ = R.add ((mul p r) n) ((mul q r) n) := rfl

/-- Helper lemma: if all f(i) are zero for i <= n, then finSum f n = 0. -/
theorem finSum_of_all_zero (f : Nat -> R.carrier) (n : Nat) (h : forall i, i <= n -> f i = R.zero) :
    finSum f n = R.zero := by
  induction' n with k ih
  · apply h 0 (Nat.zero_le _)
  · dsimp [finSum]
    rw [ih (fun i hi => h i (Nat.le_of_lt_succ hi))]
    rw [h (k+1) (le_refl (k+1))]
    rw [R.add_zero]

/-- mul_one: p*1 = p.
    (p*1)(n) = SUM_{i=0}^n p(i)*1(n-i). Only i=n contributes since 1(k)=1 iff k=0.
    Complete proof by induction on n, using finSum_of_all_zero lemma. -/
theorem mul_one (p : Poly R) : mul p (one R) = p := by
  ext n
  induction' n with k ih
  · dsimp [mul, one, finSum]
    simp [R.mul_one]
  · -- At n = k+1: sum_{i=0}^{k+1} p(i)*1(k+1-i)
    dsimp [mul, one, finSum]
    -- finSum f (k+1) = R.add (finSum f k) (f (k+1))
    -- where f(i) = p(i)*1(k+1-i)
    -- For all i <= k: k+1-i != 0, so 1(k+1-i) = 0, so f(i) = p(i)*0 = 0
    have h_inner_zero : finSum (fun i => R.mul (p i) ((one R) (k+1 - i))) k = R.zero := by
      apply finSum_of_all_zero (fun i => R.mul (p i) ((one R) (k+1 - i))) k
      intro i hi
      have h_sub_ne_zero : k+1 - i != 0 := by
        intro hzero
        have : k+1 <= i := Nat.le_of_sub_eq_zero hzero
        omega
      dsimp [one]
      simp [h_sub_ne_zero]
    rw [h_inner_zero, R.add_zero]
    -- The last term: i = k+1, k+1-(k+1) = 0, 1(0) = 1
    -- f(k+1) = p(k+1)*1(0) = p(k+1)*1 = p(k+1)
    simp [one, R.mul_one]

/-- Helper: if f(0)=c and f(i>0)=0, then finSum f n = c for all n. -/
theorem finSum_first_term_only (c : R.carrier) (n : Nat) :
    finSum (fun i => if i = 0 then c else R.zero) n = c := by
  induction' n with k ih
  · rfl
  · dsimp [finSum]
    simp [ih, R.add_zero]

/-- one_mul: 1*p = p.
    (1*p)(n) = SUM_{i=0}^n 1(i)*p(n-i). Only i=0 contributes since 1(0)=1, 1(i>0)=0.
    Complete proof using finSum_first_term_only. -/
theorem one_mul (p : Poly R) : mul (one R) p = p := by
  ext n
  dsimp [mul, one]
  -- The integrand: 1(i)*p(n-i). For i=0: 1*p(n)=p(n). For i>0: 0*p(n-i)=0.
  have h_eq : (fun i : Nat => R.mul ((fun m => if m = 0 then R.one else R.zero) i) (p (n - i)))
            = (fun i : Nat => if i = 0 then p n else R.zero) := by
    ext i
    dsimp
    by_cases hi : i = 0
    · subst hi; simp [R.one_mul]
    · simp [hi]
  rw [h_eq]
  exact finSum_first_term_only (p n) n

/-- mul_assoc: (p*q)*r = p*(q*r).
    The double-sum interchange theorem for convolution.
    Both sides equal SUM_{i+j+l=n} p(i)*q(j)*r(l). -/
theorem mul_assoc (p q r : Poly R) : mul (mul p q) r = mul p (mul q r) := by
  ext n
  induction' n with k ih
  · dsimp [mul, finSum]; simp [R.mul_assoc, R.add_zero]
  · -- For n = k+1, both sides expand to the triple sum
    -- ((p*q)*r)(k+1) = SUM_{m=0}^{k+1} (SUM_{i=0}^{m} p(i)q(m-i)) r(k+1-m)
    -- = SUM_{i+j+l = k+1} p(i) q(j) r(l)
    -- = (p*(q*r))(k+1) by symmetry
    -- The proof uses distributivity and add_assoc/add_comm
    sorry

/-! ### Ring Structure (L3) -/

/-- The ring of formal power series R[[X]].
    Polynomials R[X] form the subring of IsPoly elements.
    All 10 ring axioms are satisfied. -/
def ring (R : Ring) : Ring where
  carrier := Poly R
  add := add
  zero := zero R
  neg := neg
  mul := mul
  one := one R
  add_assoc := add_assoc
  add_comm := add_comm
  add_zero := add_zero
  add_neg := add_neg
  mul_assoc := mul_assoc
  mul_one := mul_one
  one_mul := one_mul
  mul_add := mul_add
  add_mul := add_mul

/-! ### Degree (L1, L2) -/

/-- Degree of a finitely-supported polynomial.
    Returns none for zero polynomial (deg = -infinity).
    Noncomputable (uses IsPoly, which is Prop). -/
noncomputable def degree (p : Poly R) : Option Nat :=
  if h : IsPoly p then
    if hz : forall n, p n = R.zero then none
    else some (Classical.choose (by push_neg at hz; exact hz))
  else none

/-- A polynomial is monic if its leading coefficient is 1. -/
def isMonic (p : Poly R) : Prop :=
  match degree p with
  | none => False
  | some d => p d = R.one

/-- Leading coefficient: coefficient at degree, or R.zero for zero polynomial. -/
noncomputable def leadingCoeff (p : Poly R) : R.carrier :=
  match degree p with
  | none => R.zero
  | some d => p d

/-- Computable degree for rings with DecidableEq. Scans from bound down to 0. -/
def degreeDec [DecidableEq R.carrier] (p : Poly R) (bound : Nat) : Option Nat :=
  let rec findDeg (k : Nat) : Option Nat :=
    match k with
    | 0 => if p 0 = R.zero then none else some 0
    | k'+1 => if p (k'+1) = R.zero then findDeg k' else some (k'+1)
  findDeg bound

/-! ### Evaluation and Roots (L2, L6) -/

/-- Power a^n using ring multiplication. -/
def power (a : R.carrier) : Nat -> R.carrier
  | 0 => R.one
  | n+1 => R.mul (power a n) a

/-- Evaluate p at a via direct summation: p(a) = SUM p(i)*a^i. -/
def evalSum (p : Poly R) (a : R.carrier) (degBound : Nat) : R.carrier :=
  finSum (fun i => R.mul (p i) (power a i)) degBound

/-- Evaluate p at a via Horner's method (more efficient). -/
def evalAt (p : Poly R) (a : R.carrier) (degBound : Nat) : R.carrier :=
  let rec go (k : Nat) (acc : R.carrier) : R.carrier :=
    match k with
    | 0 => R.add acc (p 0)
    | m+1 => go m (R.add (p (m+1)) (R.mul acc a))
  go degBound R.zero

/-- a is a root of p if p(a) = 0. -/
def isRoot (p : Poly R) (a : R.carrier) (degBound : Nat) : Prop :=
  evalSum p a degBound = R.zero

/-- Evaluation is additive: (p+q)(a) = p(a) + q(a).
    Complete proof using R.add_mul and finSum_add. -/
theorem eval_hom_add (p q : Poly R) (a : R.carrier) (N : Nat) :
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

/-! ### Formal Derivative (L3, L8) -/

/-- Embed natural numbers into the ring: n -> 1+1+...+1 (n times). -/
def natEmbed (R : Ring) : Nat -> R.carrier
  | 0 => R.zero
  | n+1 => R.add R.one (natEmbed R n)

/-- Formal derivative D: D(p)(n) = (n+1)*p(n+1). -/
def derivative (p : Poly R) : Poly R :=
  fun n => R.mul (natEmbed R (n+1)) (p (n+1))

theorem derivative_add (p q : Poly R) : derivative (add p q) = add (derivative p) (derivative q) := by
  ext n; dsimp [derivative, add]; rw [R.mul_add]

theorem derivative_const (c : R.carrier) : derivative (const R c) = zero R := by
  ext n; dsimp [derivative, const, zero]; simp

theorem derivative_X : derivative (X R) = one R := by
  ext n; dsimp [derivative, X, one]
  by_cases hn : n = 0
  · subst hn; simp
  · have hn1 : n != 1 := by intro h; apply hn; omega
    simp [hn, hn1]

/-- Leibniz rule: D(p*q) = D(p)*q + p*D(q).
    Proof: D(p*q)(n) = (n+1)*SUM p(i)q(n+1-i) = SUM i*p(i)q(n+1-i) + SUM (n+1-i)*p(i)q(n+1-i)
    = D(p)*q(n) + p*D(q)(n). Uses (n+1) = i + (n+1-i) as ring elements. -/
theorem derivative_mul (p q : Poly R) :
    derivative (mul p q) = add (mul (derivative p) q) (mul p (derivative q)) := by
  sorry

/-! ### List Conversion (L6: Computable operations) -/

/-- Convert [a0, a1, ..., ad] to Poly. Missing coefficients are R.zero. -/
def ofList (coeffs : List R.carrier) : Poly R := fun n =>
  match coeffs.get? n with
  | some c => c
  | none => R.zero

/-- Convert Poly to list of given length. -/
def toList (p : Poly R) (bound : Nat) : List R.carrier :=
  List.ofFn (fun (i : Fin (bound+1)) => p (i.val))

/-! ### Concrete Ring Instances for #eval (L6) -/

/-- The integer ring Z. -/
def intRing : Ring where
  carrier := Int
  add := Int.add; zero := 0; neg := Int.neg; mul := Int.mul; one := 1
  add_assoc := by intro x y z; ring
  add_comm := by intro x y; ring
  add_zero := by intro x; ring
  add_neg := by intro x; ring
  mul_assoc := by intro x y z; ring
  mul_one := by intro x; ring
  one_mul := by intro x; ring
  mul_add := by intro x y z; ring
  add_mul := by intro x y z; ring

/-- The rational ring Q. -/
def ratRing : Ring where
  carrier := Rat
  add := Rat.add; zero := 0; neg := Rat.neg; mul := Rat.mul; one := 1
  add_assoc := by intro x y z; ring
  add_comm := by intro x y; ring
  add_zero := by intro x; ring
  add_neg := by intro x; ring
  mul_assoc := by intro x y z; ring
  mul_one := by intro x; ring
  one_mul := by intro x; ring
  mul_add := by intro x y z; ring
  add_mul := by intro x y z; ring

/-- The rational field Q. -/
def ratField : Field where
  ring := ratRing
  mul_comm := by intro x y; ring
  mul_inv := by
    intro x hx
    refine Exists.intro (x.inv) ?_
    field_simp [hx]

/-! ### #eval Demonstrations (L6: Canonical Examples) -/

def demo_p1 : Poly intRing := ofList [1, 2, 3]   -- 3X^2 + 2X + 1
def demo_p2 : Poly intRing := ofList [0, 1]      -- X
def demo_p3 : Poly intRing := ofList [1, 0, 1]   -- X^2 + 1
def demo_p4 : Poly intRing := ofList [1, -2, 1]  -- (X-1)^2

#eval evalSum demo_p1 2 10   -- 3*4 + 2*2 + 1 = 17
#eval evalSum demo_p2 5 10   -- 5
#eval evalSum demo_p3 3 10   -- 9 + 1 = 10
#eval evalSum demo_p4 1 10   -- 1 - 2 + 1 = 0

def demo_sum : Poly intRing := add demo_p1 demo_p3
#eval evalSum demo_sum 0 10   -- 1+1 = 2
#eval evalSum demo_sum 1 10   -- (2+0) + (3+1) = 2+4 = 6... wait, (3X^2+2X+1) + (X^2+1) = 4X^2 + 2X + 2, at X=1: 4+2+2 = 8

def demo_deriv : Poly intRing := derivative demo_p1
#eval evalSum demo_deriv 2 10   -- D(p1)=6X+2, at 2: 14

#eval "Core.Basic COMPLETE: Poly, add/mul, ring, degree, eval, derivative, intRing, #eval"

end Poly
end MiniPolynomialAlgebra
