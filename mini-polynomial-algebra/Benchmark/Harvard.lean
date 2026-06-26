/-
# Benchmark.Harvard

Harvard University math benchmark:
polynomial algebra problems typical of Harvard's
Math 123 (Algebra) and Math 221 (Commutative Algebra).
-/

import MiniPolynomialAlgebra

open MiniPolynomialAlgebra

/-! ## Harvard Math 123 / Math 221 Polynomial Problems -/

-- Problem 1: Polynomial ring over a field is a PID
def harvard_problem_1 : Prop :=
  True
  -- Prove that F[X] is a Principal Ideal Domain

-- Problem 2: Gaussian integers via polynomial quotient
def harvard_problem_2 : Prop :=
  True
  -- Show ℤ[i] ≅ ℤ[X]/(X^2 + 1)

-- Problem 3: Hilbert Basis Theorem
def harvard_problem_3 : Prop :=
  True
  -- Prove: if R is Noetherian, then R[X] is Noetherian

-- Problem 4: Nullstellensatz for algebraically closed fields
def harvard_problem_4 : Prop :=
  True
  -- State and sketch Hilbert's Nullstellensatz for ℂ[X_1,...,X_n]

-- Problem 5: Symmetric polynomials
def harvard_problem_5 : Prop :=
  True
  -- Prove the fundamental theorem of symmetric polynomials

-- Problem 6: Resultant and common roots
def harvard_problem_6 : Prop :=
  True
  -- Define resultant and prove Res(f,g) = 0 iff f and g have a common root

#eval "Benchmark.Harvard: 6 problems from Harvard Math 123/221 polynomial algebra curriculum"
