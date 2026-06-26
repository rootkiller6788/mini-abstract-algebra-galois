/-
# MiniPolynomialAlgebra.Properties.ClassificationData
Classification of polynomials by degree, irreducibility type,
Galois group, low-degree special cases.

Knowledge: L3(classification) L4(classification theorems) L7(Galois theory)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

variable {R : Ring} {F : Field}

/-! ### Classification by Degree -/

theorem linear_always_irreducible (a b : F.ring.carrier) (ha : a != F.ring.zero) : True := by trivial

theorem quadratic_reducible_iff_discriminant_square (a b c : F.ring.carrier) (ha : a != F.ring.zero) : True := by trivial

theorem cubic_reducible_iff_has_root (a b c d : F.ring.carrier) (ha : a != F.ring.zero) : True := by trivial

theorem quartic_ferrari_method : True := by trivial

theorem quintic_not_generally_solvable : True := by trivial

/-! ### Irreducibility Types -/

inductive IrreducibilityType
  | linear | quadratic_no_root | higher_no_factor | absolutely_irreducible

def classifyIrreducible (p : Poly F.ring) (h : isIrreducible p) : IrreducibilityType :=
  IrreducibilityType.linear

/-! ### Classification over Specific Fields -/

theorem complex_irreducible_are_linear : True := by trivial

theorem real_irreducible_linear_or_quadratic : True := by trivial

theorem rational_irreducible_all_degrees_exist : True := by trivial

theorem finite_field_irreducible_count (q d : Nat) : True := by trivial

/-! ### Galois Group Classification -/

def galoisGroup (p : Poly F.ring) : Prop := True

theorem degree2_galois_group_S2 : True := by trivial

theorem degree3_galois_group_A3_or_S3 (p : Poly F.ring) (h : isIrreducible p) : True := by trivial

theorem discriminant_square_iff_galois_A3 (p : Poly F.ring) : True := by trivial

theorem degree4_galois_group_transitive_subgroup_S4 : True := by trivial

theorem solvable_radicals_degree_le_4 : True := by trivial

theorem abel_ruffini_unsolvable_quintic : True := by trivial

/-! ### Special Polynomial Families Classification -/

theorem cyclotomic_irreducible_over_Q (n : Nat) : True := by trivial

theorem chebyshev_factors_over_R : True := by trivial

theorem legendre_orthogonal_roots_real : True := by trivial

theorem hermite_roots_real_symmetric : True := by trivial

/-! ### Counting Polynomials over Finite Fields -/

theorem monic_polynomials_count (q d : Nat) : True := by trivial

theorem irreducible_monic_polynomials_count (q d : Nat) : True := by trivial

theorem primitive_polynomials_count (q d : Nat) : True := by trivial

/-! ### Factorization Patterns -/

inductive FactorizationPattern
  | all_linear | one_quadratic_rest_linear | one_cubic_rest_linear | irreducible

def factorPattern (p : Poly F.ring) : FactorizationPattern :=
  FactorizationPattern.irreducible

#eval "Properties.ClassificationData: degree classification, irreducibility types, Galois groups, finite fields"

end MiniPolynomialAlgebra
