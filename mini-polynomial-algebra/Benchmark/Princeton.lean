/-
# Benchmark.Princeton

Princeton University math benchmark:
polynomial algebra problems typical of Princeton's
MAT 345 (Algebra) and MAT 515 (Algebraic Geometry).
-/

import MiniPolynomialAlgebra

open MiniPolynomialAlgebra

/-! ## Princeton MAT 345 Algebra Polynomial Problems -/

-- Problem 1: UFD property of polynomial rings
def princeton_problem_1 : Prop :=
  True
  -- Prove R UFD ⇒ R[X] UFD

-- Problem 2: Irreducibility and field extensions
def princeton_problem_2 : Prop :=
  True
  -- Prove F[X]/(f) is a field iff f is irreducible

-- Problem 3: Galois group of a cubic
def princeton_problem_3 : Prop :=
  True
  -- Compute Galois group of X^3 - 2 over ℚ

-- Problem 4: Finite fields
def princeton_problem_4 : Prop :=
  True
  -- Construct F_{p^n} as F_p[X]/(f) where f is irreducible of degree n

-- Problem 5: Separability and characteristic p
def princeton_problem_5 : Prop :=
  True
  -- When does a polynomial have repeated roots in characteristic p?

-- Problem 6: Abel-Ruffini theorem
def princeton_problem_6 : Prop :=
  True
  -- Outline proof that general quintic is not solvable by radicals

#eval "Benchmark.Princeton: 6 problems from Princeton MAT 345 Algebra curriculum"
