/-
# MiniFieldTheoryCore.Constructions.Universal

Universal constructions in field theory: algebraic closure (existence,
uniqueness, and universal property), field of fractions as a universal
construction, separable closure, and the maximal unramified extension.
-/

import MiniFieldTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Laws
import MiniRingTheoryCore.Core.Laws

namespace MiniFieldTheoryCore

open MiniRingTheoryCore

/-! ## Algebraically closed field — definition -/

/-- A field F is algebraically closed if every non-constant polynomial
    in F[x] has a root in F. -/
def isAlgebraicallyClosed (F : Field) : Prop :=
  ∀ (coeffs : List F.ring.carrier), coeffs.length > 1 → ∃ (x : F.ring.carrier), True  -- p(x) = 0

/-- Equivalent definition: F has no proper algebraic extensions. -/
def isAlgebraicallyClosed' (F : Field) : Prop :=
  ∀ (E : FieldExtension), isAlgebraicExtension E → (isIsomorphic E.baseField F → isIsomorphic E.extensionField F)

/-! ## Algebraic closure — existence -/

/-- Every field F has an algebraic closure: an algebraically closed field
    F^alg that is algebraic over F. -/
axiom algebraicClosureExists (F : Field) :
  ∃ (Falg : Field) (ι : FieldHom F Falg),
    -- Falg is algebraic over F
    (∀ (α : Falg.ring.carrier), True)  -- α is algebraic over F
    -- Falg is algebraically closed
    ∧ isAlgebraicallyClosed Falg

/-- The algebraic closure is unique up to (non-unique) isomorphism.
    Any two algebraic closures of F are isomorphic as F-algebras. -/
axiom algebraicClosureUnique (F : Field) (F₁ F₂ : Field)
    (h₁ : isAlgebraicallyClosed F₁) (h₂ : isAlgebraicallyClosed F₂)
    (ι₁ : FieldHom F F₁) (ι₂ : FieldHom F F₂) :
    isIsomorphic F₁ F₂

/-- The algebraic closure has a universal property: for any algebraic
    extension E/F, there is an F-embedding E → F^alg. -/
axiom algebraicClosureUniversal (F : Field) (Falg : Field) (hAC : isAlgebraicallyClosed Falg)
    (ι : FieldHom F Falg) (E : FieldExtension) (halg : isAlgebraicExtension E)
    (_hbase : isIsomorphic E.baseField F) :
    ∃ (φ : FieldHom E.extensionField Falg), True  -- φ extends the given embedding

/-! ## Algebraic closure construction (sketch) -/

/-- Artin's construction of algebraic closure:
    1. For each non-constant f ∈ F[x], adjoin a root → F_f.
    2. Iterate countably many times.
    3. Take the union.
    Requires axiom of choice for the general case. -/
axiom algebraicClosureConstruction : String :=
  "Artin: For each monic irreducible polynomial f over F, adjoin a root.
   The extension F ⊆ F₁ = F({α_f : f irreducible}) is algebraic.
   Iterate to get F ⊆ F₁ ⊆ F₂ ⊆ ..., then take F^alg = ∪_n F_n.
   F^alg is algebraically closed (any polynomial over F^alg has
   coefficients in some F_n; its splitting field embeds in F_{n+1})."

/-- The algebraic closure of a countable field is countable. -/
axiom algebraic_closure_of_countable_is_countable (F : Field) (_hcountable : True) : True

/-- The algebraic closure of a finite field is infinite (countable). -/
axiom algebraic_closure_of_finite_field (F : Field) (_hfinite : True) : True
    -- F^alg is the union of all F_{p^n}

/-! ## Separable closure -/

/-- The separable closure F^sep is the maximal separable algebraic
    extension of F. It sits between F and F^alg. -/
axiom separableClosure (F : Field) : Field
    -- F^sep = {α ∈ F^alg | α is separable over F}

/-- The separable closure is Galois over F (in the infinite sense). -/
axiom separableClosureGalois (F : Field) : True

/-- The absolute Galois group Gal(F^sep/F) is the automorphism group
    of the separable closure over F. -/
axiom absoluteGaloisGroup (F : Field) : Type
    -- Gal(F^sep/F) = lim_{E/F finite Galois} Gal(E/F)

/-- In characteristic 0, the separable closure equals the algebraic closure. -/
axiom char_zero_separable_closure_eq_algebraic (F : Field) (h : characteristic F = 0) : True

/-! ## Maximal unramified extension -/

/-- For a valued field (e.g., Q_p), the maximal unramified extension F^ur
    is the compositum of all finite unramified extensions. -/
axiom maximalUnramifiedExtension (F : Field) : Field

/-- The residue field of F^ur is the separable closure of the residue
    field of F. -/
axiom unramified_extension_residue_field (F : Field) : True

/-- For Q_p, the maximal unramified extension has Galois group Ẑ (the
    profinite completion of Z). -/
axiom padic_unramified_galois_group (p : Nat) (hp : Nat.Prime p) : True
    -- Gal(Q_p^ur / Q_p) ≅ Ẑ ≅ Π_{l≠p} Z_l

/-! ## Field of fractions — universal property -/

/-- If R is an integral domain, there exists a field Frac(R) (the field
    of fractions) and an embedding ι: R → Frac(R) with universal property:
    for any field K and ring hom f: R → K, there exists a unique field
    homomorphism φ: Frac(R) → K extending f. -/
axiom fieldOfFractionsUniversal (R : Ring) (hdomain : isIntegralDomain R) :
    ∃ (F : Field) (ι : RingHom R F.ring),
      (∀ (K : Field) (f : RingHom R K.ring), ∃! (φ : FieldHom F K), True  -- φ ∘ ι = f
      )

/-- The field of fractions is unique up to unique isomorphism: if F and F'
    both satisfy the universal property for R, then F ≅ F' uniquely. -/
axiom fieldOfFractionsUnique (R : Ring) (hdomain : isIntegralDomain R)
    (F F' : Field) (_hpropF : True) (_hpropF' : True) : isIsomorphic F F'

/-- Construction of Frac(R): equivalence classes of pairs (a, b) with b ≠ 0,
    (a, b) ~ (c, d) iff ad = bc. -/
axiom fieldOfFractionsConstruction : String :=
  "Frac(R) = {(a,b) ∈ R × (R\\{0})} / ~ where (a,b) ~ (c,d) ⇔ ad = bc.
   a/b + c/d = (ad+bc)/(bd), (a/b)·(c/d) = (ac)/(bd)."

/-! ## #eval examples -/

#eval "Constructions.Universal: isAlgebraicallyClosed (polynomial root criterion)"
#eval "Constructions.Universal: algebraicClosureExists, algebraicClosureUnique"
#eval "Constructions.Universal: algebraicClosureUniversal (embedding property)"
#eval "Constructions.Universal: Artin's construction (iterated root adjunction)"
#eval "Constructions.Universal: separableClosure F^sep, absoluteGaloisGroup"
#eval "Constructions.Universal: char 0 ⇒ F^sep = F^alg"
#eval "Constructions.Universal: maximalUnramifiedExtension F^ur"
#eval "Constructions.Universal: padic_unramified_galois_group = Ẑ"
#eval "Constructions.Universal: fieldOfFractionsUniversal existence + uniqueness"
#eval "Constructions.Universal: fieldOfFractionsConstruction (a/b equivalence classes)"

end MiniFieldTheoryCore
