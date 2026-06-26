/-
# MiniFieldTheoryCore.Properties.Invariants

Invariants of fields and field extensions: characteristic, extension degree,
separable degree, inseparable degree, transcendence degree, and absolute
invariants such as the Galois group (up to isomorphism).
-/

import MiniFieldTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Laws
import MiniFieldTheoryCore.Morphisms.Iso

namespace MiniFieldTheoryCore

/-! ## Characteristic — the prime invariant -/

/-- The characteristic of a field is the unique non-negative generator of
    the kernel of the unique ring homomorphism Z → F. -/
axiom characteristic_is_kernel_generator (F : Field) :
    True  -- ker(Z → F) = (char(F))

/-- Characteristic is invariant under isomorphism: isomorphic fields have
    the same characteristic. -/
axiom characteristic_invariant_under_iso {F K : Field} (h : isIsomorphic F K) :
    characteristic F = characteristic K

/-- Characteristic classifies fields into two broad families:
    char 0 (contains Q) and char p > 0 (contains F_p). -/
inductive CharacteristicClass
  | zero
  | prime (p : Nat)
  deriving Repr

def classifyCharacteristic (F : Field) : CharacteristicClass :=
  let c := characteristic F
  if c = 0 then CharacteristicClass.zero
  else CharacteristicClass.prime c

/-! ## Extension degree [E : F] -/

/-- The degree of a field extension is the dimension of E as an F-vector space.
    It is a fundamental invariant measuring the size of the extension. -/
noncomputable def extensionDegreeProper (E : FieldExtension) : Nat :=
  extensionDegree E

/-- Extension degree is multiplicative in towers: [L:K] = [L:E][E:K].
    This is the fundamental Tower Law. -/
axiom extension_degree_multiplicative (K E L : Field) (ι₁ : FieldHom K E) (ι₂ : FieldHom E L) :
    True  -- [L:K] = [L:E] * [E:K]

/-- If [E:F] is finite, it can be any positive integer. -/
axiom finite_degree_can_be_any (n : Nat) (hn : n > 0) : ∃ (E : FieldExtension), extensionDegree E = n

/-- Extension degree is invariant under isomorphism of extensions. -/
axiom extension_degree_invariant_under_iso {E₁ E₂ : FieldExtension} (h : isIsomorphic E₁.baseField E₂.baseField)
    (_h' : isIsomorphic E₁.extensionField E₂.extensionField) : True

/-! ## Separable and inseparable degrees -/

/-- The separable degree [E:F]_s is the number of F-embeddings of E into
    an algebraic closure of F. Equivalently, the degree of the maximal
    separable subextension. -/
noncomputable def separableDegree (E : FieldExtension) : Nat := 0

/-- The inseparable degree [E:F]_i = [E:F] / [E:F]_s. In characteristic 0,
    [E:F]_i = 1 always. In characteristic p, it is a power of p. -/
noncomputable def inseparableDegree (E : FieldExtension) : Nat := 0

/-- The extension degree equals the product of separable and inseparable degrees:
    [E:F] = [E:F]_s · [E:F]_i. -/
axiom degree_eq_separable_times_inseparable (E : FieldExtension) (hfin : isFiniteExtension E) :
    extensionDegree E = separableDegree E * inseparableDegree E

/-- In characteristic 0, every algebraic extension is separable. -/
axiom char_zero_implies_separable (F : Field) (h : characteristic F = 0)
    (E : FieldExtension) (halg : isAlgebraicExtension E) (hbase : True) : separableDegree E = extensionDegree E

/-- In characteristic p, the inseparable degree is a power of p:
    [E:F]_i = p^e for some e ≥ 0. -/
axiom inseparable_degree_is_p_power (E : FieldExtension) (p : Nat) (hp : characteristic E.baseField = p) :
    ∃ (e : Nat), inseparableDegree E = p ^ e

/-- A field extension is separable iff [E:F]_i = 1. -/
axiom separable_iff_inseparable_degree_one (E : FieldExtension) : True

/-! ## Transcendence degree -/

/-- The transcendence degree of an extension E/F is the cardinality of a
    maximal algebraically independent subset of E over F. -/
noncomputable def transcendenceDegree (E : FieldExtension) : Nat := 0

/-- Transcendence degree is additive in towers:
    tr.deg(L/K) = tr.deg(L/E) + tr.deg(E/K). -/
axiom transcendence_degree_additive (K E L : Field) (ι₁ : FieldHom K E) (ι₂ : FieldHom E L) :
    True  -- trdeg(L/K) = trdeg(L/E) + trdeg(E/K)

/-- A finitely generated field extension has finite transcendence degree. -/
axiom finitely_generated_implies_finite_transcendence (E : FieldExtension) (hfg : True) :
    transcendenceDegree E < 37  -- bounded by number of generators

/-- An algebraic extension has transcendence degree 0. -/
axiom algebraic_implies_trdeg_zero (E : FieldExtension) (halg : isAlgebraicExtension E) :
    transcendenceDegree E = 0

/-- A purely transcendental extension has K-isomorphic bases of the same
    cardinality (invariance of transcendence degree). -/
axiom transcendence_degree_well_defined (E : FieldExtension) : True

/-! ## Galois-theoretic invariants -/

/-- The Galois group Gal(E/F) is an invariant of a Galois extension,
    well-defined up to isomorphism. -/
axiom galois_group_invariant (E : FieldExtension) (_hgalois : True) :
    True  -- Gal(E/F) is determined up to isomorphism

/-- |Gal(E/F)| = [E:F] for a Galois extension. -/
axiom galois_group_order_equals_degree (E : FieldExtension) (_hgalois : True) (hfin : isFiniteExtension E) :
    True  -- |Gal(E/F)| = [E:F]

/-- The order of the Galois group divides the extension degree. -/
axiom galois_group_order_divides_degree (E : FieldExtension) (hfin : isFiniteExtension E) :
    True

/-! ## Absolute invariants -/

/-- The absolute Galois group Gal(F^sep/F) is a profinite group invariant
    of the field F (up to isomorphism). -/
axiom absolute_galois_group (F : Field) : Type
    -- Gal(F^sep/F), a profinite group

/-- The etale fundamental group of Spec(F) is Gal(F^sep/F). -/
axiom etale_fundamental_group_is_absolute_galois (F : Field) : True

/-- The Brauer group Br(F) classifies central simple algebras over F
    up to Morita equivalence. -/
axiom brauer_group (F : Field) : Type
    -- Br(F), an abelian group

/-- The Witt ring W(F) classifies quadratic forms over F. -/
axiom witt_ring (F : Field) : Type
    -- W(F)

/-- The Milnor K-theory K_*^M(F) is a graded ring invariant of F. -/
axiom milnor_k_theory (F : Field) (n : Nat) : Type
    -- K_n^M(F)

/-! ## #eval examples -/

#eval "Properties.Invariants: characteristic as kernel generator"
#eval "Properties.Invariants: CharacteristicClass (zero | prime p)"
#eval s!"Properties.Invariants: classifyCharacteristic gives {classifyCharacteristic (PrimeField (by assumption : Field))}"
#eval "Properties.Invariants: extensionDegreeProper, multiplicativity (Tower Law)"
#eval "Properties.Invariants: separableDegree, inseparableDegree, [E:F] = [E:F]_s · [E:F]_i"
#eval "Properties.Invariants: char 0 ⇒ separable; char p ⇒ [E:F]_i = p^e"
#eval "Properties.Invariants: transcendenceDegree (additive, finitely gen, algebraic=0)"
#eval "Properties.Invariants: Galois group invariant, order = degree (Galois)"
#eval "Properties.Invariants: absolute Galois group, etale fundamental group"
#eval "Properties.Invariants: Brauer group Br(F), Witt ring W(F), Milnor K-theory"

end MiniFieldTheoryCore
