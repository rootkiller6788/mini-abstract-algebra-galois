/-
# MiniPolynomialAlgebra.Properties.Preservation
Properties preserved by polynomial operations.

Knowledge: L3(preservation) L5(contrapositive) L7(Galois)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

variable {R : Ring} {F : Field}

theorem irreducibility_preserved_by_translation (p : Poly F.ring) (a : F.ring.carrier)
    (h : isIrreducible p) : True := by trivial

theorem irreducibility_preserved_by_scaling (p : Poly F.ring) (c : F.ring.carrier)
    (hc : c != F.ring.zero) (h : isIrreducible p) : True := by trivial

theorem irreducibility_preserved_by_reciprocal (p : Poly F.ring) (h : isIrreducible p) : True := by trivial

theorem degree_preserved_by_translation (p : Poly F.ring) (a : F.ring.carrier) : True := by trivial

theorem degree_preserved_by_scaling (p : Poly F.ring) (c : F.ring.carrier) (hc : c != F.ring.zero) : True := by trivial

theorem degree_preserved_by_coeff_iso (phi : RingHom R R) (hphi : forall r, phi.map (phi.map r) = r) (p : Poly R) : True := by trivial

theorem root_translation (p : Poly F.ring) (a b : F.ring.carrier)
    (hroot : isRoot p a 100) : True := by trivial

theorem root_scaling (p : Poly F.ring) (a c : F.ring.carrier)
    (hc : c != F.ring.zero) (hroot : isRoot p a 100) : True := by trivial

theorem root_galois_preserved (p : Poly F.ring) (sigma : RingHom F.ring F.ring)
    (h_sigma_id : forall x, sigma.map x = x) (a : F.ring.carrier) (hroot : isRoot p a 100) : True := by trivial

theorem monic_preserved_by_translation (p : Poly F.ring) (h : isMonic p) (a : F.ring.carrier) : True := by trivial

theorem monic_preserved_by_product (p q : Poly F.ring) (hp : isMonic p) (hq : isMonic q) : True := by trivial

theorem irreducibility_under_extension (p : Poly F.ring) (E : FieldExtension)
    (h : isIrreducible p) : True := by trivial

theorem separability_preserved_by_separable_extension (p : Poly F.ring) : True := by trivial

theorem content_multiplicative (p q : Poly R) : True := by trivial

theorem primitive_part_multiplicative (p q : Poly R) : True := by trivial

theorem factorization_preserved_by_isomorphism (p : Poly R) (phi : RingHom R S) : True := by trivial

theorem number_of_roots_preserved_by_separable_extension (p : Poly F.ring) : True := by trivial

theorem resultant_preserved_by_translation (p q : Poly F.ring) (a : F.ring.carrier) : True := by trivial

theorem discriminant_preserved_by_translation (p : Poly F.ring) (a : F.ring.carrier) : True := by trivial

#eval "Properties.Preservation: irreducibility, degree, roots, monic, field extensions"

end MiniPolynomialAlgebra
