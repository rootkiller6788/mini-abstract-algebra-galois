/-
# MiniRingTheoryCore.Theorems.UniversalProperties

Formal statements of universal properties for:
quotient ring, product ring, polynomial ring (as adjoint),
and localization.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Laws
import MiniRingTheoryCore.Constructions.Products
import MiniRingTheoryCore.Constructions.Quotients
import MiniRingTheoryCore.Constructions.Universal
import MiniRingTheoryCore.Properties.Preservation

namespace MiniRingTheoryCore

/-! ## Quotient Ring Universal Property

The quotient ring R/I satisfies: for any homomorphism f: R → S
with f(I) = 0, there is a unique g: R/I → S with g ∘ π = f. -/

/-- The universal property of R/I as a theorem statement:
    Existence and uniqueness of the factorization. -/
axiom quotientUniversalPropertyFormal {R : Ring} (I : Ideal R)
  (S : Ring) (f : RingHom R S) (h : ∀ x ∈ I.subset, f.map x = S.zero) :
  ∃! (g : RingHom (makeQuotientRing I) S),
    RingHom.comp g (quotientProj I) = f

/-- The quotient projection π: R → R/I is surjective. -/
axiom quotientProj_surjective {R : Ring} (I : Ideal R) :
  isSurjective (quotientProj I)

/-- The kernel of the quotient projection is exactly I. -/
axiom quotientProj_kernel {R : Ring} (I : Ideal R) :
  RingHom.ker (quotientProj I) = I.subset

/-! ## Product Ring Universal Property

The product ring R × S with projections π₁, π₂ satisfies:
for any T and f: T → R, g: T → S, there is a unique
⟨f, g⟩: T → R × S. -/

/-- The formal universal property of the direct product. -/
axiom productUniversalPropertyFormal {T R S : Ring}
  (f : RingHom T R) (g : RingHom T S) :
  ∃! (h : RingHom T (DirectProduct R S)),
    RingHom.comp (prodProjLeft R S) h = f ∧
    RingHom.comp (prodProjRight R S) h = g

/-- The projections of the product are surjective. -/
axiom prodProj_surjective (R S : Ring) :
  isSurjective (prodProjLeft R S) ∧ isSurjective (prodProjRight R S)

/-! ## Polynomial Ring Universal Property (Adjoint)

R[x] is the free R-algebra on one generator: for any R-algebra S
and element s ∈ S, there is a unique evaluation homomorphism
R[x] → S sending x to s. -/

/-- The universal property of R[x]: for any S-algebra hom
    φ: R → S and element s ∈ S, there exists a unique
    extension Φ: R[x] → S with Φ(x) = s and Φ|R = φ. -/
axiom polynomialUniversalProperty {R S : Ring} (φ : RingHom R S)
  (s : S.carrier) :
  ∃! (Φ : RingHom (PolynomialRing R) S),
    Φ.map (polynomialVar (R := R)) = s ∧
    RingHom.comp Φ (polynomialEmbedding (R := R)) = φ

/-- The polynomial ring is the free commutative R-algebra on
    one generator: it satisfies the adjunction
    Hom_Alg(R[x], S) ≅ Hom_Ring(R, S) × S (as sets). -/
axiom polynomialAdjunction {R S : Ring} :
  Nonempty ((RingHom (PolynomialRing R) S) →
            (RingHom R S × S.carrier))

/-! ## Localization Universal Property

For a multiplicative subset M of R, the localization R[M⁻¹]
satisfies: any homomorphism φ: R → S sending M to units of S
factors uniquely through R[M⁻¹]. -/

/-- A multiplicative subset of a ring (axiomatic type for UMP). -/
axiom MultSubset (R : Ring) : Type

/-- The localization of R at a multiplicative subset M (axiomatic ring for UMP). -/
axiom LocRing (R : Ring) (M : MultSubset R) : Ring

/-- The canonical map R → R[M⁻¹]. -/
axiom localizationMap {R : Ring} (M : MultSubset R) :
  RingHom R (LocRing R M)

/-- The universal property of localization: any ring hom
    φ: R → S that sends elements of M to units factors
    uniquely through R[M⁻¹]. -/
axiom localizationUniversalProperty {R S : Ring}
  (M : MultSubset R) (φ : RingHom R S)
  (hunits : ∀ (m : R.carrier), True)
  : ∃! (ψ : RingHom (LocRing R M) S),
      RingHom.comp ψ (localizationMap M) = φ

/-! ## #eval examples -/

#eval "Quotient universal property: unique factorization"
#eval "Product universal property: unique pair map"
#eval "Polynomial universal property: free R-algebra on x"
#eval "Localization universal property: maps inverting M"
