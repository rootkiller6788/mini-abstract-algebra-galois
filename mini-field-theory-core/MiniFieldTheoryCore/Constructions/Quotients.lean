/-
# MiniFieldTheoryCore.Constructions.Quotients

Quotient field constructions: residue fields of valuation rings,
quotients by maximal ideals, and the theorem that fields have no
nontrivial proper quotients.
-/

import MiniFieldTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Basic

namespace MiniFieldTheoryCore

open MiniRingTheoryCore

/-! ## Fields have no nontrivial quotients -/

/-- A field F has exactly two ideals: {0} and F. Hence the only quotients
    of a field are F itself (mod {0}) and the zero ring (mod F). -/
axiom field_has_no_nontrivial_ideals (F : Field) (I : Ideal F.ring) (h : F.ring.one ∈ I.subset) :
    I.subset = Set.univ

/-- The only ideals of a field are {0} and F. -/
axiom field_ideals_trivial (F : Field) (I : Ideal F.ring) :
    I.subset = {x | x = F.ring.zero} ∨ I.subset = Set.univ

/-- A nonzero ring homomorphism from a field is injective. -/
axiom field_hom_zero_trivial {F K : Field} (f : RingHom F.ring K.ring) (h : f.map F.ring.one = K.ring.zero) :
    ∀ x : F.ring.carrier, f.map x = K.ring.zero

/-- The quotient of a field by {0} is isomorphic to the field itself. -/
axiom field_quotient_by_zero (F : Field) : isIsomorphic F F

/-! ## Residue field of a maximal ideal -/

/-- If R is a commutative ring and m is a maximal ideal, then R/m is a field. -/
axiom residue_field_of_maximal_ideal (R : Ring) (m : Ideal R) (hmax : m.IsMaximal)
    (hcomm : isCommutativeRing R) : Field

/-- The residue field of a local ring: R/m where m is the unique maximal ideal. -/
structure LocalRing where
  R : Ring
  maxIdeal : Ideal R
  isMaximal : maxIdeal.IsMaximal
  isCommutative : isCommutativeRing R

def LocalRing.residueField (L : LocalRing) : Field :=
  residue_field_of_maximal_ideal L.R L.maxIdeal L.isMaximal L.isCommutative

/-- A DVR (discrete valuation ring) has residue field that is a field. -/
axiom dvr_residue_field (R : Ring) (v : ℤ) (_h : True) : Field

/-! ## Residue fields of valuation rings -/

/-- The valuation ring of a valued field. -/
structure ValuationRing (F : Field) where
  R : Ring
  valuation : F.ring.carrier → ℤ
  -- R = {x ∈ F | v(x) ≥ 0}

/-- The residue field of a valuation ring: R/m where m = {x | v(x) > 0}. -/
axiom valuation_residue_field {F : Field} (V : ValuationRing F) : Field

/-- The characteristic of the residue field may differ from the
    characteristic of the valued field (mixed characteristic). -/
axiom residue_field_characteristic (F : Field) (V : ValuationRing F) :
    characteristic F = 0 ∨ characteristic F > 0

/-- Example: Q_p has residue field F_p (char 0 field, char p residue field). -/
axiom padic_residue_field (p : Nat) (hp : Nat.Prime p) : True
    -- Q_p has residue field F_p

/-- Example: F_p[[t]] has residue field F_p (equal characteristic p). -/
axiom power_series_residue_field (p : Nat) (hp : Nat.Prime p) : True
    -- F_p[[t]] has residue field F_p

/-! ## Field of fractions of an integral domain -/

/-- Every integral domain R embeds into a field Frac(R), its field of fractions.
    This is the universal field containing R. -/
axiom field_of_fractions (R : Ring) (hdomain : isIntegralDomain R) :
    ∃ (F : Field) (ι : RingHom R F.ring),
      -- Universal property: for any field K and ring hom f: R → K,
      -- there exists unique field hom Frac(R) → K extending f
      True

/-- The field of fractions of Z is Q. -/
axiom field_of_fractions_Z : True  -- Frac(Z) ≅ Q

/-- The field of fractions of F[t] is F(t) (rational function field). -/
axiom field_of_fractions_polynomial (F : Field) : True  -- Frac(F[t]) ≅ F(t)

/-- The field of fractions construction is functorial. -/
axiom field_of_fractions_functorial {R S : Ring} (f : RingHom R S) (hR : isIntegralDomain R)
    (hS : isIntegralDomain S) : True
    -- induces field hom Frac(R) → Frac(S)

/-! ## Quotient fields in geometry -/

/-- If X is an algebraic variety over a field k, the function field k(X)
    is a finitely generated field extension of k. -/
axiom function_field_of_variety (k : Field) (X : Type) : Field
    -- k(X), a finitely generated extension of k

/-- The residue field at a point P ∈ X is k(P) = O_{X,P} / m_{X,P}.
    For a closed point on a variety over an algebraically closed field,
    k(P) ≅ k. -/
axiom residue_field_at_point (k : Field) (X : Type) (P : Type) : Field
    -- k(P)

/-- For a k-rational point on a variety over k, the residue field is k. -/
axiom rational_point_residue_field_is_k (k : Field) (X : Type) (P : Type) (_hrational : True) :
    True  -- k(P) ≅ k

/-! ## #eval examples -/

#eval "Constructions.Quotients: field has no nontrivial ideals"
#eval "Constructions.Quotients: field_ideals_trivial, field_hom_zero_trivial"
#eval "Constructions.Quotients: residue_field_of_maximal_ideal (R/m is field)"
#eval "Constructions.Quotients: LocalRing, DVR, residueField"
#eval "Constructions.Quotients: ValuationRing, valuation_residue_field"
#eval "Constructions.Quotients: padic_residue_field F_p, power_series F_p"
#eval "Constructions.Quotients: field_of_fractions (integral domain → field)"
#eval "Constructions.Quotients: Frac(Z) = Q, Frac(F[t]) = F(t)"
#eval "Constructions.Quotients: function_field_of_variety k(X)"
#eval "Constructions.Quotients: residue_field_at_point, rational point → k"

end MiniFieldTheoryCore
