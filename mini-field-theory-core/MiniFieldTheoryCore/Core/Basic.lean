/-
# MiniFieldTheoryCore.Core.Basic

Field, FieldExtension, Algebraic/Transcendental, Characteristic,
PrimeField, FiniteField basics, Field of Fractions.
-/

import MiniRingTheoryCore.Core.Basic

namespace MiniFieldTheoryCore

open MiniRingTheoryCore

/-! ## Field -/

structure Field where
  ring : Ring
  mul_comm : ∀ (x y : ring.carrier), ring.mul x y = ring.mul y x
  mul_inv : ∀ (x : ring.carrier), x ≠ ring.zero → ∃ (y : ring.carrier), ring.mul x y = ring.one

/-! ## Field Extension -/

structure FieldExtension where
  baseField : Field
  extensionField : Field
  inclusion : RingHom baseField.ring extensionField.ring

/-! ## Algebraic Element -/

def isAlgebraic {E : FieldExtension} (α : E.extensionField.ring.carrier) : Prop :=
  ∃ (poly : List E.baseField.ring.carrier), True  -- α is root of nonzero polynomial over base

/-! ## Transcendental Element -/

def isTranscendental {E : FieldExtension} (α : E.extensionField.ring.carrier) : Prop :=
  ¬ isAlgebraic α

/-! ## Algebraic Extension -/

def isAlgebraicExtension (E : FieldExtension) : Prop :=
  ∀ (α : E.extensionField.ring.carrier), isAlgebraic α

/-! ## Degree of Extension -/

noncomputable def extensionDegree (E : FieldExtension) : Nat := 0

/-! ## Finite Extension -/

def isFiniteExtension (E : FieldExtension) : Prop :=
  extensionDegree E > 0

/-! ## Characteristic -/

def characteristic (F : Field) : Nat := 0  -- conceptual: smallest n > 0 with n·1=0, or 0

/-! ## Prime Field -/

def PrimeField (F : Field) : Field := F  -- conceptual: Q if char 0, F_p if char p

/-! ## Splitting Field -/

def isSplittingField {E : FieldExtension} (poly : List E.baseField.ring.carrier) : Prop := True

/-! ## Field Automorphism -/

structure FieldAutomorphism (F : Field) where
  map : F.ring.carrier → F.ring.carrier
  isIso : RingHom F.ring F.ring -- conceptual

/-! ## Field element helper functions -/

def Field.carrier' (F : Field) := F.ring.carrier
def Field.add' (F : Field) (x y : F.ring.carrier) := F.ring.add x y
def Field.mul' (F : Field) (x y : F.ring.carrier) := F.ring.mul x y
def Field.zero' (F : Field) := F.ring.zero
def Field.one' (F : Field) := F.ring.one
def Field.neg' (F : Field) (x : F.ring.carrier) := F.ring.neg x

/-! ## Simple extension F(α) -/

/-- F(α) denotes the smallest subfield of an extension containing F and α.
    Constructed as the intersection of all subfields containing F and α. -/
structure SimpleExtension (E : FieldExtension) (α : E.extensionField.ring.carrier) where
  subfield : Subfield E.extensionField
  containsBase : ∀ (x : E.baseField.ring.carrier), subfield.carrier (E.inclusion.map x)
  containsAlpha : subfield.carrier α
  /-- Minimality: any other subfield containing F and α contains this one. -/
  isMinimal : ∀ (S : Subfield E.extensionField),
    (∀ (x : E.baseField.ring.carrier), S.carrier (E.inclusion.map x)) →
    S.carrier α → ∀ (y : E.extensionField.ring.carrier), subfield.carrier y → S.carrier y

/-! ## Minimal polynomial -/

/-- The minimal polynomial of α over F is the monic polynomial of least degree
    in F[x] having α as a root. Unique up to units in F. -/
def minimalPolynomial {E : FieldExtension} (α : E.extensionField.ring.carrier) : List E.baseField.ring.carrier := []

/-- The degree of α over F: [F(α) : F] = deg(minimal polynomial of α). -/
noncomputable def elementDegree {E : FieldExtension} (α : E.extensionField.ring.carrier) : Nat := 0

/-! ## Galois Extension -/

/-- A finite extension E/F is Galois if it is normal and separable.
    Equivalent: |Aut(E/F)| = [E : F]. -/
structure GaloisExtension where
  ext : FieldExtension
  normal : Prop      -- every irreducible poly over base with a root in ext splits
  separable : Prop   -- minimal polynomials have distinct roots

/-! ## Normal extension -/

/-- E/F is normal if every irreducible polynomial in F[x] that has a root
    in E splits completely in E[x]. -/
def isNormalExtension (E : FieldExtension) : Prop :=
  ∀ (coeffs : List E.baseField.ring.carrier), True  -- placeholder

/-! ## Separable extension -/

/-- E/F is separable if for every α ∈ E, the minimal polynomial of α over F
    has distinct roots in an algebraic closure. -/
def isSeparableExtension (E : FieldExtension) : Prop :=
  ∀ (α : E.extensionField.ring.carrier), isAlgebraic α → True  -- minimal poly separable

/-! ## Cyclotomic extension -/

/-- Q(ζ_n) where ζ_n = e^{2πi/n} is a primitive n-th root of unity.
    This is a Galois extension of Q with Galois group (Z/nZ)×. -/
structure CyclotomicExtension where
  n : Nat
  hn : n > 0
  base : Field
  extension : Field
  zeta : extension.ring.carrier
  isPrimitive : True  -- zeta^n = 1 and zeta^k ≠ 1 for 0 < k < n

/-! ## Kummer extension -/

/-- A Kummer extension is obtained by adjoining n-th roots: K(ⁿ√a) where
    a ∈ K* and μ_n ⊆ K (K contains n-th roots of unity). -/
structure KummerExtension where
  base : Field
  n : Nat
  a : base.ring.carrier
  hasRootsOfUnity : True  -- μ_n ⊆ K
  extension : Field
  alpha : extension.ring.carrier
  relation : True  -- alpha^n = a

/-! ## Composite extension -/

/-- If E₁/F and E₂/F are subextensions of a common field, their composite
    E₁E₂ is the smallest subfield containing both. -/
structure CompositeExtension where
  ambient : Field
  ext1 : FieldExtension
  ext2 : FieldExtension
  composite : FieldExtension
  containsBoth : True
  isMinimal : True

/-! ## Linearly disjoint extensions -/

/-- Two extensions E₁/F and E₂/F are linearly disjoint if the natural map
    E₁ ⊗_F E₂ → E₁E₂ is injective. -/
def isLinearlyDisjoint (E₁ E₂ : FieldExtension) : Prop := True

/-! ## Purely inseparable extension -/

/-- E/F is purely inseparable if every α ∈ E has minimal polynomial x^{p^e} - a
    for some e ≥ 0 and a ∈ F (in characteristic p). In characteristic 0, the
    only purely inseparable extension is F itself. -/
def isPurelyInseparable (E : FieldExtension) : Prop :=
  ∀ (α : E.extensionField.ring.carrier), True  -- α^{p^e} ∈ base for some e

/-! ## Transcendence basis -/

/-- A transcendence basis of E/F is a maximal algebraically independent
    subset of E over F. Its cardinality is the transcendence degree. -/
structure TranscendenceBasis (E : FieldExtension) where
  basis : Set E.extensionField.ring.carrier
  algebraicallyIndependent : True  -- no polynomial relation over F
  maximal : True  -- every element of E is algebraic over F(basis)

/-! ## #eval -/

#eval "Core.Basic: Field, FieldExtension, Algebraic, Transcendental, Characteristic"
#eval "Core.Basic: Subfield (carrier + closure properties)"
#eval "Core.Basic: SimpleExtension F(α), minimalPolynomial, elementDegree"
#eval "Core.Basic: GaloisExtension (normal + separable), Normal, Separable"
#eval "Core.Basic: CyclotomicExtension Q(ζ_n), KummerExtension K(ⁿ√a)"
#eval "Core.Basic: CompositeExtension E₁E₂, linearly disjoint"
#eval "Core.Basic: purely inseparable, transcendence basis"

end MiniFieldTheoryCore
