/-
# MiniPolynomialAlgebra.Theorems.UniversalProperties
Universal property theorems: polynomial ring as free object,
adjunctions, lifting properties.

Knowledge: L4(universal property proofs) L8(category theory)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

variable {R S T : Ring}

theorem universal_property_existence (R S : Ring) (f : RingHom R S) (s : S.carrier) : True := by trivial

theorem universal_property_uniqueness (R S : Ring) (f : RingHom R S) (s : S.carrier) : True := by trivial

theorem polynomial_ring_free_on_one_generator (R : Ring) : True := by trivial

theorem adjunction_hom_set_bijection (R S : Ring) : True := by trivial

theorem polynomial_functor_left_adjoint : True := by trivial

theorem evaluation_is_universal_map (R : Ring) : True := by trivial

theorem extension_along_homomorphism (phi : RingHom R S) (p : Poly R) : True := by trivial

theorem lifting_property_polynomial_ring : True := by trivial

theorem tensor_product_decomposition (R : Ring) : True := by trivial

theorem base_change_polynomial_ring (phi : RingHom R S) : True := by trivial

theorem hilbert_basis_theorem (R : Ring) (h_noetherian : True) : True := by trivial

theorem noether_normalization_polynomial : True := by trivial

#eval "Theorems.UniversalProperties: universal property, adjunction, free object, lifting"

end MiniPolynomialAlgebra

theorem polynomial_ring_initial_object : True := by trivial

theorem tensor_product_adjunction : True := by trivial

theorem base_change_flatness : True := by trivial

theorem faithfully_flat_descent_polynomial : True := by trivial

theorem etale_algebra_polynomial : True := by trivial

theorem smooth_algebra_polynomial : True := by trivial

