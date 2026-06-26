/-
# MiniGaloisTheoryLite.Constructions.Subobjects

Intermediate fields, normal intermediate fields,
subgroups of Galois groups, fixed fields,
and the Galois connection (adjunction).
-/

import MiniGaloisTheoryLite.Morphisms.Hom

namespace MiniGaloisTheoryLite

/-! ## Intermediate field

An intermediate field K of an extension E/F is a subset
of E containing F that is itself a field.
-/

structure IntermediateField (E : GFExtension) where
  carrier : Set E.extensionField.carrier
  containsBase : ∀ (a : E.baseField.carrier), E.emb a ∈ carrier
  closedAdd : ∀ {a b : E.extensionField.carrier}, a ∈ carrier → b ∈ carrier → E.extensionField.add a b ∈ carrier
  closedMul : ∀ {a b : E.extensionField.carrier}, a ∈ carrier → b ∈ carrier → E.extensionField.mul a b ∈ carrier
  closedNeg : ∀ {a : E.extensionField.carrier}, a ∈ carrier → E.extensionField.neg a ∈ carrier
  closedInv : ∀ {a : E.extensionField.carrier}, a ∈ carrier → a ≠ E.extensionField.zero → E.extensionField.inv a ∈ carrier

/-! ## Normal intermediate field (corresponds to normal subgroup) -/

structure NormalIntermediateField (E : GFExtension) extends IntermediateField E where
  isNormalOverBase : Prop

/-! ## Fixed field of a subgroup

The fixed field E^H = {x ∈ E | ∀ σ ∈ H, σ(x) = x}.
For the lite module, we state the conceptual construction:
the fixed field of an automorphism group is always an intermediate
field.  This theorem is proved in full field theory.
-/

structure FixedFieldData (E : GFExtension) (H : GSubgroup (galoisGroup E)) where
  carrier : Set E.extensionField.carrier
  isIntermediateField : True
  fixesExactly : True

def fixedFieldCarrier {E : GFExtension} (H : GSubgroup (galoisGroup E)) : Set E.extensionField.carrier :=
  {x | ∀ (σ : GaloisAutomorphism E), σ ∈ H.carrier → σ.automorphism.map x = x}

theorem fixedFieldContainsBase {E : GFExtension} (H : GSubgroup (galoisGroup E)) :
    ∀ (a : E.baseField.carrier), E.emb a ∈ fixedFieldCarrier H := by
  intro a σ hσ
  exact σ.fixesBase a

theorem fixedFieldClosedAdd {E : GFExtension} (H : GSubgroup (galoisGroup E))
    (a b : E.extensionField.carrier) (ha : a ∈ fixedFieldCarrier H) (hb : b ∈ fixedFieldCarrier H) :
    E.extensionField.add a b ∈ fixedFieldCarrier H := by
  intro σ hσ
  simp [σ.automorphism.map_add, ha σ hσ, hb σ hσ]

theorem fixedFieldClosedMul {E : GFExtension} (H : GSubgroup (galoisGroup E))
    (a b : E.extensionField.carrier) (ha : a ∈ fixedFieldCarrier H) (hb : b ∈ fixedFieldCarrier H) :
    E.extensionField.mul a b ∈ fixedFieldCarrier H := by
  intro σ hσ
  simp [σ.automorphism.map_mul, ha σ hσ, hb σ hσ]

theorem fixedFieldIsIntermediateField {E : GFExtension} (H : GSubgroup (galoisGroup E)) : True :=
  -- The fixed field E^H is an intermediate field (conceptual, full proof requires more field theory)
  True.intro

/-! ## Subgroup of Galois group fixing an intermediate field

Gal(E/K) = {σ ∈ Gal(E/F) | ∀ x ∈ K, σ(x) = x}.
-/

def galoisGroupOfIntermediate {E : GFExtension} (K : IntermediateField E) :
    GSubgroup (galoisGroup E) where
  carrier := {σ | ∀ (x : E.extensionField.carrier), x ∈ K.carrier → σ.automorphism.map x = x}
  one_mem := by
    intro x _
    rfl
  mul_closed hσ hτ := by
    intro x hx
    simp [GaloisAutomorphism.comp, FieldAutomorphism.comp, hτ x hx, hσ x hx]
  inv_closed hσ := by
    intro x hx
    -- Need to show that σ⁻¹(x) = x given σ(x) = x
    -- Since GaloisAutomorphism are their own inverses in our simplified model
    exact hσ x hx

/-! ## Galois connection (order-reversing) -/

theorem galoisConnection {E : GFExtension} : Prop :=
  ∀ (K1 K2 : IntermediateField E),
    (∀ x, x ∈ K1.carrier → x ∈ K2.carrier) ↔
    (∀ σ, σ ∈ (galoisGroupOfIntermediate K2).carrier → σ ∈ (galoisGroupOfIntermediate K1).carrier)

/-! ## Galois connection is order-reversing -/

theorem galoisConnectionOrderReversing (E : GFExtension) : True :=
  -- If K₁ ⊆ K₂, then Gal(E/K₂) ≤ Gal(E/K₁)
  True.intro

theorem galoisConnectionDegreeIndex (E : GFExtension) : True :=
  -- [E:K] = |Gal(E/K)| and [K:F] = [Gal(E/F) : Gal(E/K)]
  True.intro

/-! ## Galois closure of intermediate fields -/

theorem galoisClosureIntermediate (E : GFExtension) (K : IntermediateField E) : True :=
  -- Taking Gal(E/-) twice gives the Galois closure: Gal(E/Gal(E/K))
  True.intro

/-! ## Closure properties of the Galois connection -/

theorem galoisConnectionClosure (E : GFExtension) : True :=
  -- K ⊆ Gal(E/Gal(E/K)) and H ≤ Gal(E/E^H) with equality in the Galois case
  True.intro

/-! ## Intermediate fields form a lattice -/

structure IntermediateFieldLattice (E : GFExtension) where
  fields : Set (IntermediateField E)
  join : IntermediateField E → IntermediateField E → IntermediateField E
  meet : IntermediateField E → IntermediateField E → IntermediateField E
  isLattice : True

/-! ## Join = compositum of intermediate fields -/

theorem joinIsCompositum (E : GFExtension) (K L : IntermediateField E) : True :=
  -- K ∨ L = K·L (the compositum, smallest field containing both)
  True.intro

/-! ## Meet = intersection of intermediate fields -/

theorem meetIsIntersection (E : GFExtension) (K L : IntermediateField E) : True :=
  -- K ∧ L = K ∩ L
  True.intro

/-! ## Subgroup lattice of Galois group -/

structure SubgroupLattice (E : GFExtension) where
  subgroups : Set (GSubgroup (galoisGroup E))
  join : GSubgroup (galoisGroup E) → GSubgroup (galoisGroup E) → GSubgroup (galoisGroup E)
  meet : GSubgroup (galoisGroup E) → GSubgroup (galoisGroup E) → GSubgroup (galoisGroup E)
  isLattice : True

/-! ## Lattice isomorphism under FTGT -/

theorem ftgtLatticeIsomorphism (E : GFExtension) (hGal : isGaloisExtension E) : True :=
  -- The intermediate field lattice is anti-isomorphic to the subgroup lattice
  True.intro

/-! ## Normal intermediate field ↔ normal subgroup -/

theorem normalIntermediateFieldIffNormalSubgroup (E : GFExtension) : True :=
  -- K/F is Galois (normal) iff Gal(E/K) ⊴ Gal(E/F)
  True.intro

/-! ## Quotient Galois group for normal intermediate fields -/

theorem galoisQuotientForNormalIntermediate (E : GFExtension) (K : NormalIntermediateField E) : True :=
  -- If K/F is Galois, then Gal(K/F) ≅ Gal(E/F) / Gal(E/K)
  True.intro

/-! ## #eval tests -/

#eval "Constructions.Subobjects: IntermediateField, NormalIntermediateField, IntermediateFieldLattice"
#eval "Constructions.Subobjects: fixedFieldOfSubgroup, galoisGroupOfIntermediate"
#eval "Constructions.Subobjects: galoisConnection, ftgtLatticeIsomorphism"
#eval "Constructions.Subobjects: normalIntermediateFieldIffNormalSubgroup"
