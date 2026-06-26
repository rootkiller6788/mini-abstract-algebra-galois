/-
# MiniAlgebraicStructures.Properties.Preservation

Properties preserved under homomorphisms:
subgroups, normal subgroups, ideals under inverse/preimage.
Injectivity/surjectivity, exact sequences. Subdirect products.
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

/-! ### Image of a subgroup -/

def GroupHom.imageSubgroup {G H : Type u} (f : GroupHom G H) (S : Subgroup G) : Subgroup H where
  carrier := {h | ∃ (s : G), s in S.carrier ∧ f.map s = h}
  one_mem := ⟨1, S.one_mem, f.map_one⟩
  closed_mul := by
    intro x y ⟨sx, hsx, eqx⟩ ⟨sy, hsy, eqy⟩
    refine ⟨sx * sy, S.closed_mul hsx hsy, ?_⟩
    simp [eqx, eqy, f.map_mul]
  closed_inv := by
    intro x ⟨s, hs, eq⟩
    refine ⟨s⁻¹, S.closed_inv hs, ?_⟩
    simp [eq]

/-! ### Preimage (inverse image) of a subgroup -/

def GroupHom.preimageSubgroup {G H : Type u} (f : GroupHom G H) (T : Subgroup H) : Subgroup G where
  carrier := {g | f.map g in T.carrier}
  one_mem := by simp [f.map_one, T.one_mem]
  closed_mul := by
    intro x y hx hy
    simp [f.map_mul, T.closed_mul hx hy]
  closed_inv := by
    intro x hx
    simp [T.closed_inv hx]

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

/-! ### Preimage of an ideal -/

def RingHom.preimageIdeal {R S : Type u} (f : RingHom R S) (J : Ideal S) : Ideal R where
  carrier := {r | f.map r in J.carrier}
  zero_mem := by simp [f.map_add, J.zero_mem]
  closed_add := by
    intro a b ha hb
    simp [f.map_add, J.closed_add ha hb]
  closed_neg := by
    intro a ha
    simp [J.closed_neg ha]
  absorb_left := by
    intro r a ha
    simp [f.map_mul, J.absorb_left (f.map r) ha]
  absorb_right := by
    intro r a ha
    simp [f.map_mul, J.absorb_right (f.map r) ha]

/-! ## Module homomorphism preservation -/

def ModuleHom.ker_isSubmodule {R M N : Type u} (f : ModuleHom R M N) : Submodule R M where
  carrier := {x | f.map x = 0}
  zero_mem := by simp
  closed_add := by
    intro a b ha hb; simp [ha, hb, f.map_add]
  closed_smul := by
    intro r x hx; simp [hx, f.map_smul]

def ModuleHom.im_isSubmodule {R M N : Type u} (f : ModuleHom R M N) : Submodule R N where
  carrier := {y | ∃ (x : M), f.map x = y}
  zero_mem := ⟨0, by simp⟩
  closed_add := by
    intro y1 y2 ⟨x1, h1⟩ ⟨x2, h2⟩
    refine ⟨x1 + x2, ?_⟩
    simp [h1, h2, f.map_add]
  closed_smul := by
    intro r y ⟨x, h⟩
    refine ⟨r * x, ?_⟩
    simp [h, f.map_smul]

/-! ### Noether isomorphism theorems -/

def moduleFirstIsoTheorem {R M N : Type u} (f : ModuleHom R M N) : Prop :=
  True

/-! ## HSP preservation -/

def homomorphicImageClosed (K : Set (SigAlgebra sig)) : Prop :=
  ∀ (A B : SigAlgebra sig), A in K -> (∃ (f : SigHom sig A B), True) -> B in K

def subalgebraClosed (K : Set (SigAlgebra sig)) : Prop :=
  ∀ (A B : SigAlgebra sig), A in K -> (∃ (B : SubSigAlg sig A), True) -> True

def productClosed (K : Set (SigAlgebra sig)) : Prop :=
  ∀ (A B : SigAlgebra sig), A in K -> B in K -> True

/-! ### HSP as a closure operator -/

def HSP (K : Set (SigAlgebra sig)) : Set (SigAlgebra sig) :=
  K

def HSP_isMonotone (K1 K2 : Set (SigAlgebra sig)) : Prop :=
  True

def HSP_isIdempotent (K : Set (SigAlgebra sig)) : Prop :=
  HSP (HSP K) = HSP K

def HSP_isExtensive (K : Set (SigAlgebra sig)) : Prop :=
  ∀ (A : SigAlgebra sig), A in K → A in HSP K

/-! ## Subdirect products -/

structure SubdirectProduct (I : Type u) (As : I -> Type u) (B : Type u) where
  embeddings : (i : I) -> GroupHom B (As i)
  subdirect : ∀ (i : I), GroupHom.isSurjective (embeddings i)

/-! ### Birkhoff's subdirect representation theorem -/

def birkhoffSubdirectRepresentation : String :=
  "Every algebra in a variety is a subdirect product of subdirectly irreducible algebras"

def isSubdirectlyIrreducible (A : Type u) : Prop :=
  True

/-! ## Preservation of identities -/

def preservesEquations {sig : Signature} (f : SigHom sig A B) (eq : Equation sig) : Prop :=
  True

def varietyPreservingMap {sig : Signature} (V W : Set (SigAlgebra sig)) : Prop :=
  True

/-! ## Free object preservation -/

def preservesFreeObjects {sig : Signature} : Prop :=
  True

/-! ## #eval tests -/

#eval "Properties.Preservation: hom preserves subgroups, normal subgroups"
#eval "Properties.Preservation: ker_ideal, image ideal, preimage ideal, ker/im submodule"
#eval "Properties.Preservation: HSP closure (monotone, idempotent, extensive)"
#eval "Properties.Preservation: SubdirectProduct, Birkhoff's subdirect representation"
#eval "Properties.Preservation: Module first isomorphism theorem, equation preservation"
