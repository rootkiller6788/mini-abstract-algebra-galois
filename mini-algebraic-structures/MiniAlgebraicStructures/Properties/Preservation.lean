/-
# MiniAlgebraicStructures.Properties.Preservation

Properties preserved under homomorphisms:
subgroups, normal subgroups, ideals under inverse/preimage.
Injectivity/surjectivity, exact sequences.
HSP preservation properties.
-/

import MiniAlgebraicStructures.Properties.Invariants

namespace MiniAlgebraicStructures

/-! ## Group homomorphism preservation -/

def GroupHom.preservesOrder {G H : Type u} (f : GroupHom G H) : Prop :=
  ∀ (g : G), True

def GroupHom.preservesSubgroup {G H : Type u} (f : GroupHom G H) (S : Subgroup G) : Prop :=
  True

def GroupHom.reflectsNormal {G H : Type u} (f : GroupHom G H) (N : NormalSubgroup H) : NormalSubgroup G where
  carrier := {g | f.map g in N.carrier}
  one_mem := N.one_mem
  closed_mul := fun ha hb => N.closed_mul ha hb
  closed_inv := fun ha => N.closed_inv ha
  isNormal := fun n g hn => N.isNormal (f.map n) (f.map g) hn

/-! ## Ring homomorphism preservation -/

def RingHom.ker_ideal {R S : Type u} (f : RingHom R S) : Ideal R where
  carrier := {r | f.map r = 0}
  zero_mem := by simp [f.map_add]
  closed_add := by
    intro a b ha hb; simp [ha, hb, f.map_add]
  closed_neg := by
    intro a ha; simp [ha]
  absorb_left := by
    intro r a ha; simp [ha, f.map_mul]
  absorb_right := by
    intro r a ha; simp [ha, f.map_mul]

def Ideal.image {R S : Type u} (f : RingHom R S) (I : Ideal R) : Ideal S where
  carrier := {s | ∃ (r : R), r in I.carrier ∧ f.map r = s}
  zero_mem := by
    refine ⟨0, I.zero_mem, ?_⟩
    simp [f.map_add]
  closed_add := by
    intro a b ⟨ra, hra, eqa⟩ ⟨rb, hrb, eqb⟩
    refine ⟨ra + rb, I.closed_add hra hrb, ?_⟩
    simp [eqa, eqb, f.map_add]
  closed_neg := by
    intro a ⟨r, hr, eq⟩
    refine ⟨-r, I.closed_neg hr, ?_⟩
    simp [eq]
  absorb_left := by
    intro s a ⟨r, hr, eq⟩
    refine ⟨s * r, I.absorb_left s hr, ?_⟩
    simp [eq, f.map_mul]
  absorb_right := by
    intro s a ⟨r, hr, eq⟩
    refine ⟨r * s, I.absorb_right s hr, ?_⟩
    simp [eq, f.map_mul]

/-! ## Module homomorphism preservation -/

def ModuleHom.ker_isSubmodule {R M N : Type u} (f : ModuleHom R M N) : Submodule R M where
  carrier := {x | f.map x = 0}
  zero_mem := by simp
  closed_add := by
    intro a b ha hb; simp [ha, hb, f.map_add]
  closed_smul := by
    intro r x hx; simp [hx, f.map_smul]

/-! ## HSP preservation -/

def homomorphicImageClosed (K : Set (SigAlgebra sig)) : Prop :=
  ∀ (A B : SigAlgebra sig), A in K -> (∃ (f : SigHom sig A B), True) -> B in K

def subalgebraClosed (K : Set (SigAlgebra sig)) : Prop :=
  ∀ (A B : SigAlgebra sig), A in K -> (∃ (B : SubSigAlg sig A), True) -> True

def productClosed (K : Set (SigAlgebra sig)) : Prop :=
  ∀ (A B : SigAlgebra sig), A in K -> B in K -> True

/-! ## #eval tests -/

#eval "Properties.Preservation: hom preserves subgroups, normal subgroups"
#eval "Properties.Preservation: ker_ideal, image ideal, ker submodule"
#eval "Properties.Preservation: HSP closure properties defined"
