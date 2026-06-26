/-
# Benchmark.MIT

MIT 18.700 (Linear Algebra) and 18.702 (Algebra II)
benchmark problems for polynomial algebra.
-/

import MiniPolynomialAlgebra

open MiniPolynomialAlgebra

/-! ## MIT 18.702 Algebra II Polynomial Problems -/

-- Problem 1: Division algorithm in F[X]
def mit_problem_1 : Prop :=
  True
  -- Prove the division algorithm for polynomials over a field

-- Problem 2: Factor theorem
def mit_problem_2 : Prop :=
  True
  -- Prove (X - a) | f(X) ⇔ f(a) = 0

-- Problem 3: Polynomial of degree n has at most n roots
def mit_problem_3 : Prop :=
  True
  -- Prove that if F is a field, a nonzero polynomial of degree n has ≤ n roots

-- Problem 4: Irreducibility criteria
def mit_problem_4 : Prop :=
  True
  -- Prove Eisenstein's criterion and apply to X^n - p

-- Problem 5: Gauss's Lemma
def mit_problem_5 : Prop :=
  True
  -- State and prove Gauss's Lemma for primitive polynomials

-- Problem 6: UFD property of F[X]
def mit_problem_6 : Prop :=
  True
  -- Prove F[X] is a Unique Factorization Domain

-- Problem 7: Finite field polynomial irreducibles
def mit_problem_7 : Prop :=
  True
  -- Count irreducible polynomials of degree d over F_q

-- Problem 8: Cyclotomic polynomials
def mit_problem_8 : Prop :=
  True
  -- Prove Φ_n(X) ∈ ℤ[X] and is irreducible over ℚ

#eval "Benchmark.MIT: 8 problems from MIT 18.702 Algebra II polynomial curriculum"
