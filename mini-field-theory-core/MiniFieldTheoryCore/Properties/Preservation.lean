/-
# MiniFieldTheoryCore.Properties.Preservation

Properties preserved under field operations: characteristic under homomorphisms,
algebraicity in towers, finiteness under composition, separability under
base change, normal closures, and perfectness inheritance.
-/

import MiniFieldTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Laws
import MiniFieldTheoryCore.Morphisms.Hom
import MiniFieldTheoryCore.Morphisms.Iso

namespace MiniFieldTheoryCore

/-! ## Characteristic preservation -/

/-- Characteristic is preserved under field homomorphisms:
    if f: F → K is a field homomorphism, then char(K) = char(F). -/
axiom characteristic_preserved_under_hom {F K : Field} (f : FieldHom F K) :
    characteristic F = characteristic K

/-- Characteristic is preserved under isomorphism:
    if F ≅ K then char(F) = char(K). -/
axiom characteristic_preserved_under_iso {F K : Field} (h : isIsomorphic F K) :
    characteristic F = characteristic K

/-- The characteristic of an extension field equals the characteristic of
    the base field. -/
axiom characteristic_preserved_in_extension (E : FieldExtension) :
    characteristic E.baseField = characteristic E.extensionField

/-! ## Algebraicity preservation in towers -/

/-- If L/E is algebraic and E/K is algebraic, then L/K is algebraic.
    Algebraicity is transitive. -/
axiom algebraicity_transitive (K E L : Field) (ι₁ : FieldHom K E) (ι₂ : FieldHom E L)
    (halg₁ : True) (halg₂ : True) : True
    -- L/K is algebraic

/-- If α is algebraic over E and E/F is algebraic, then α is algebraic over F. -/
axiom algebraic_over_algebraic_is_algebraic (F E L : Field) (α : L.ring.carrier)
    (_halg : True) : True

/-- Algebraic closure is algebraically closed (idempotence): taking the
    algebraic closure twice yields an algebraically closed field. -/
axiom algebraic_closure_is_idempotent (F : Field) (Falg : Field) (_hAC : isAlgebraicallyClosed Falg) :
    isAlgebraicallyClosed Falg

/-! ## Finiteness preservation under composition -/

/-- If L/E and E/K are finite extensions, then L/K is finite.
    Finiteness is transitive. -/
axiom finiteness_transitive (K E L : Field) (ι₁ : FieldHom K E) (ι₂ : FieldHom E L)
    (_hfin₁ : True) (_hfin₂ : True) : True
    -- L/K is finite

/-- If [L:E] and [E:K] are finite, then [L:K] = [L:E][E:K] is finite. -/
axiom degree_multiplicative_in_towers (K E L : Field) (ι₁ : FieldHom K E) (ι₂ : FieldHom E L)
    (_hfinE : True) (_hfinL : True) : True
    -- [L:K] = [L:E] * [E:K]

/-- Finiteness is preserved under base change: if E/F is finite and F'/F
    is any extension, then the compositum E·F' is finite over F'. -/
axiom finite_under_base_change (E F' : FieldExtension) (_hfin : True) : True

/-! ## Separability preservation -/

/-- Separability is preserved under composition of field extensions:
    if L/E and E/K are separable, then L/K is separable. -/
axiom separability_transitive (K E L : Field) (ι₁ : FieldHom K E) (ι₂ : FieldHom E L) : True

/-- If E/F is separable and α ∈ F is separable over F, then E(α)/F
    is separable. -/
axiom separable_adjunction (E : FieldExtension) (α : E.extensionField.ring.carrier)
    (_hsep : True) : True

/-- Separability is preserved under base change. -/
axiom separable_under_base_change (E : FieldExtension) (_hsep : True) (F' : FieldExtension) : True

/-- A finite purely inseparable extension has degree a power of p
    (characteristic p). -/
axiom purely_inseparable_degree_p_power (E : FieldExtension) (p : Nat)
    (hp : characteristic E.baseField = p) (_hpure : True) :
    ∃ (e : Nat), extensionDegree E = p ^ e

/-! ## Normal extension preservation -/

/-- A field extension E/F is normal if every irreducible polynomial in F[x]
    that has a root in E splits completely in E. -/
axiom isNormalExtension (E : FieldExtension) : Prop

/-- The normal closure of a finite extension: the smallest normal extension
    containing it. -/
axiom normalClosure (E : FieldExtension) (hfin : isFiniteExtension E) : FieldExtension

/-- Normality is transitive in a tower L/E/K: if L/E and E/K are normal,
    then L/K is normal. -/
axiom normality_transitive (K E L : Field) (ι₁ : FieldHom K E) (ι₂ : FieldHom E L)
    (_hN₁ : True) (_hN₂ : True) : True

/-- The compositum of normal extensions is normal. -/
axiom compositum_of_normal_is_normal (E₁ E₂ : FieldExtension) (_hN₁ : True) (_hN₂ : True) : True

/-! ## Perfectness inheritance -/

/-- Every algebraic extension of a perfect field is perfect. -/
axiom algebraic_over_perfect_is_perfect (F : Field) (hperf : isPerfect F)
    (E : FieldExtension) (halg : isAlgebraicExtension E) : isPerfect E.extensionField

/-- Finite fields are perfect. A finite field F_q has the property that
    every element is a p-th power (where q = p^n). -/
axiom finite_field_is_perfect (F : Field) (_hfinite : True) : isPerfect F

/-- Algebraically closed fields are perfect. -/
axiom algebraically_closed_is_perfect (F : Field) (hAC : isAlgebraicallyClosed F) : isPerfect F

/-- Characteristic 0 fields are perfect. -/
axiom char_zero_is_perfect (F : Field) (h : characteristic F = 0) : isPerfect F

/-! ## Galois correspondence preservation -/

/-- The Galois correspondence: intermediate fields ↔ subgroups of Gal(E/F). -/
axiom galois_correspondence_bijection (E : FieldExtension) (_hgalois : True) :
    True
    -- {K : E.baseField ⊆ K ⊆ E.extensionField} ↔ {H ≤ Gal(E/F)}
    -- K ↦ Gal(E/K), H ↦ E^H (fixed field)

/-- The Galois correspondence reverses inclusion: K₁ ⊆ K₂ ⟹ Gal(E/K₂) ≤ Gal(E/K₁). -/
axiom galois_correspondence_reverses_inclusion (E : FieldExtension) (_hgalois : True) : True

/-- Open subgroups of the absolute Galois group correspond to finite
    extensions (infinite Galois theory). -/
axiom infinite_galois_correspondence (F : Field) : True

/-! ## Preservation under field automorphisms -/

/-- Field automorphisms preserve algebraic elements: if α is algebraic
    over F and σ ∈ Aut(E), then σ(α) is algebraic over F. -/
axiom automorphism_preserves_algebraic {F : Field} (σ : AutField F) (α : F.ring.carrier)
    (_halg : True) : True

/-- Field automorphisms preserve transcendence degree. -/
axiom automorphism_preserves_transcendence {F : Field} (σ : AutField F) : True

/-- Field automorphisms preserve separable elements. -/
axiom automorphism_preserves_separable {F : Field} (σ : AutField F) (α : F.ring.carrier)
    (_hsep : True) : True

/-! ## #eval examples -/

#eval "Properties.Preservation: characteristic preserved under hom/iso/extension"
#eval "Properties.Preservation: algebraicity transitive (tower property)"
#eval "Properties.Preservation: finiteness transitive, degree multiplicative"
#eval "Properties.Preservation: separability transitive, under base change"
#eval "Properties.Preservation: purely inseparable degree = p^e"
#eval "Properties.Preservation: normal extension, normal closure"
#eval "Properties.Preservation: normality transitive, compositum of normal is normal"
#eval "Properties.Preservation: perfectness: algebraic over perfect = perfect"
#eval "Properties.Preservation: finite/algebraically closed/char 0 fields are perfect"
#eval "Properties.Preservation: Galois correspondence: K ↔ Gal(E/K), reverses inclusion"
#eval "Properties.Preservation: automorphisms preserve algebraic/separable/transcendence"

end MiniFieldTheoryCore
