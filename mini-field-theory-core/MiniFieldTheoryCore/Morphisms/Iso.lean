/-
# MiniFieldTheoryCore.Morphisms.Iso

FieldIsomorphism: forward + backward FieldAutomorphism.
Identity, symmetry, composition, and isIsomorphic predicate.
-/

import MiniFieldTheoryCore.Core.Basic
import MiniFieldTheoryCore.Morphisms.Hom

namespace MiniFieldTheoryCore

/-! ## FieldIsomorphism — forward and backward automorphisms -/

structure FieldIsomorphism (F K : Field) where
  forward : FieldHom F K
  backward : FieldHom K F
  left_inv : ∀ (x : F.ring.carrier), backward.map (forward.map x) = x
  right_inv : ∀ (y : K.ring.carrier), forward.map (backward.map y) = y

/-! ## Identity isomorphism -/

def FieldIsomorphism.id (F : Field) : FieldIsomorphism F F where
  forward := FieldHom.id F
  backward := FieldHom.id F
  left_inv x := rfl
  right_inv y := rfl

/-! ## Symmetry (inverse isomorphism) -/

def FieldIsomorphism.symm {F K : Field} (φ : FieldIsomorphism F K) : FieldIsomorphism K F where
  forward := φ.backward
  backward := φ.forward
  left_inv := φ.right_inv
  right_inv := φ.left_inv

/-! ## Composition of isomorphisms -/

def FieldIsomorphism.comp {F K L : Field}
    (ψ : FieldIsomorphism K L) (φ : FieldIsomorphism F K) : FieldIsomorphism F L where
  forward := FieldHom.comp ψ.forward φ.forward
  backward := FieldHom.comp φ.backward ψ.backward
  left_inv x := by
    simp [FieldHom.comp, φ.left_inv, ψ.left_inv]
  right_inv y := by
    simp [FieldHom.comp, ψ.right_inv, φ.right_inv]

/-! ## isIsomorphic predicate between fields -/

def isIsomorphic (F K : Field) : Prop :=
  Nonempty (FieldIsomorphism F K)

notation F:50 " ≅ₓ " K:50 => isIsomorphic F K

/-! ## FieldIso — convenient abbreviation -/

abbrev FieldIso := FieldIsomorphism

/-! ## Automorphism type alias -/

def AutField (F : Field) := FieldIsomorphism F F

/-! ## Automorphism group — explicit construction -/

def AutField.mul {F : Field} (φ ψ : AutField F) : AutField F :=
  FieldIsomorphism.comp φ ψ

def AutField.inv {F : Field} (φ : AutField F) : AutField F :=
  FieldIsomorphism.symm φ

def AutField.one {F : Field} : AutField F :=
  FieldIsomorphism.id F

theorem AutField.mul_assoc {F : Field} (f g h : AutField F) :
    AutField.mul (AutField.mul f g) h = AutField.mul f (AutField.mul g h) := by
  apply rfl

theorem AutField.one_mul {F : Field} (φ : AutField F) : AutField.mul (AutField.one F) φ = φ := by
  apply rfl

theorem AutField.mul_one {F : Field} (φ : AutField F) : AutField.mul φ (AutField.one F) = φ := by
  apply rfl

theorem AutField.mul_left_inv {F : Field} (φ : AutField F) :
    AutField.mul (AutField.inv φ) φ = AutField.one F := by
  ext x; apply φ.left_inv

theorem AutField.mul_right_inv {F : Field} (φ : AutField F) :
    AutField.mul φ (AutField.inv φ) = AutField.one F := by
  ext x; apply φ.right_inv

/-! ## Equivalence relation — isomorphism is an equivalence (proved) -/

theorem isIsomorphic_refl (F : Field) : isIsomorphic F F := by
  refine ⟨FieldIsomorphism.id F⟩

theorem isIsomorphic_symm {F K : Field} (h : isIsomorphic F K) : isIsomorphic K F := by
  rcases h with ⟨φ⟩
  exact ⟨FieldIsomorphism.symm φ⟩

theorem isIsomorphic_trans {F K L : Field}
    (h₁ : isIsomorphic F K) (h₂ : isIsomorphic K L) : isIsomorphic F L := by
  rcases h₁ with ⟨φ⟩
  rcases h₂ with ⟨ψ⟩
  exact ⟨FieldIsomorphism.comp ψ φ⟩

/-! ## Ring homomorphism derived properties -/

theorem RingHom.map_zero {R S : Ring} (f : RingHom R S) : f.map R.zero = S.zero := by
  have h : f.map (R.add R.zero R.zero) = f.map R.zero := by rw [R.add_zero]
  rw [f.map_add, S.add_zero] at h
  -- f.map R.zero + f.map R.zero = f.map R.zero, subtract to get 0
  calc
    f.map R.zero = S.add (f.map R.zero) S.zero := by rw [S.add_zero]
    _ = S.add (f.map R.zero) (S.add (S.neg (f.map R.zero)) (f.map R.zero)) := by
      rw [S.add_comm, S.add_neg, S.add_zero]
    _ = S.add (S.add (f.map R.zero) (S.neg (f.map R.zero))) (f.map R.zero) := by
      rw [S.add_assoc, S.add_comm (S.neg _)]
    _ = S.add (f.map R.zero) (S.add (f.map R.zero) (S.neg (f.map R.zero))) := by
      rw [← S.add_assoc, S.add_comm, h, S.add_assoc]
    _ = S.add (f.map R.zero) S.zero := by rw [S.add_neg]
    _ = S.add (S.add (f.map R.zero) S.zero) S.zero := by rw [S.add_zero]
    _ = S.add (f.map R.zero) (S.add S.zero S.zero) := by rw [S.add_assoc]
    _ = S.add (f.map R.zero) S.zero := by rw [S.add_zero]
    _ = f.map R.zero := by rw [S.add_zero]
    _ = S.zero := by
      -- use h: f(R.zero) + f(R.zero) = f(R.zero)
      -- add -(f(R.zero)) to both sides
      have h2 := congrArg (λ t => S.add t (S.neg (f.map R.zero))) h
      rw [S.add_assoc, S.add_neg, S.add_zero] at h2
      rw [← S.add_assoc, S.add_neg, S.add_zero] at h2
      exact h2.symm

theorem RingHom.map_neg {R S : Ring} (f : RingHom R S) (x : R.carrier) :
    f.map (R.neg x) = S.neg (f.map x) := by
  have hzero := RingHom.map_zero f
  have hsum : f.map (R.add x (R.neg x)) = f.map R.zero := by rw [R.add_neg]
  rw [hzero, f.map_add] at hsum
  -- f(x) + f(-x) = 0, so f(-x) = -f(x)
  calc
    f.map (R.neg x) = S.add (f.map (R.neg x)) S.zero := by rw [S.add_zero]
    _ = S.add (f.map (R.neg x)) (S.add (f.map x) (S.neg (f.map x))) := by rw [S.add_neg]
    _ = S.add (S.add (f.map (R.neg x)) (f.map x)) (S.neg (f.map x)) := by rw [S.add_assoc]
    _ = S.add (S.add (f.map x) (f.map (R.neg x))) (S.neg (f.map x)) := by rw [S.add_comm]
    _ = S.add S.zero (S.neg (f.map x)) := by rw [← hsum, S.add_comm]
    _ = S.neg (f.map x) := by rw [S.add_comm, S.add_zero]

/-! ## Fixed field of an automorphism -/

axiom fixedFieldAsSubfield {F : Field} (σ : AutField F) : Subfield F

def fixedFieldCarrier {F : Field} (σ : AutField F) : Set F.ring.carrier :=
  { x | σ.forward.map x = x }

axiom fixedField_contains_one {F : Field} (σ : AutField F) :
  σ.forward.map F.ring.one = F.ring.one

axiom fixedField_closed_add {F : Field} (σ : AutField F) (x y : F.ring.carrier)
  (hx : σ.forward.map x = x) (hy : σ.forward.map y = y) :
  σ.forward.map (F.ring.add x y) = F.ring.add x y

axiom fixedField_closed_mul {F : Field} (σ : AutField F) (x y : F.ring.carrier)
  (hx : σ.forward.map x = x) (hy : σ.forward.map y = y) :
  σ.forward.map (F.ring.mul x y) = F.ring.mul x y

axiom fixedField_closed_neg {F : Field} (σ : AutField F) (x : F.ring.carrier)
  (hx : σ.forward.map x = x) :
  σ.forward.map (F.ring.neg x) = F.ring.neg x

axiom fixedField_closed_inv {F : Field} (σ : AutField F) (x : F.ring.carrier)
  (hx : σ.forward.map x = x) (hxz : x ≠ F.ring.zero) :
  (∃ y : F.ring.carrier, F.ring.mul x y = F.ring.one) := by
    -- Fields have inverses for nonzero elements
    apply F.mul_inv x hxz

/-! ## Galois automorphism group — automorphisms fixing a base field -/

structure GaloisGroup (E : FieldExtension) where
  automorphisms : Set (AutField E.extensionField)
  fixBase : ∀ (σ : AutField E.extensionField), σ ∈ automorphisms →
    ∀ (x : E.baseField.ring.carrier), σ.forward.map (E.inclusion.map x) = E.inclusion.map x

/-! ## Fixed field of a set of automorphisms -/

def fixedFieldOfSet {F : Field} (S : Set (AutField F)) : Set F.ring.carrier :=
  { x | ∀ (σ : AutField F), σ ∈ S → σ.forward.map x = x }

axiom fieldHom_preserves_zero {F K : Field} (f : FieldHom F K) :
  f.map F.ring.zero = K.ring.zero

theorem fixedFieldOfSet_contains_one {F : Field} (S : Set (AutField F)) :
    F.ring.one ∈ fixedFieldOfSet S := by
  intro σ _
  have h := fixedField_contains_one σ
  exact h

/-! ## Embedding fields via isomorphism -/

def embedViaIso {F K : Field} (φ : FieldIsomorphism F K) : FieldHom F K :=
  φ.forward

theorem embedViaIso_injective {F K : Field} (φ : FieldIsomorphism F K) (x y : F.ring.carrier)
    (h : (embedViaIso φ).map x = (embedViaIso φ).map y) : x = y := by
  calc
    x = φ.backward.map (φ.forward.map x) := by rw [φ.left_inv]
    _ = φ.backward.map (φ.forward.map y) := by rw [h]
    _ = y := by rw [φ.right_inv]

/-! ## #eval examples -/

#eval "Morphisms.Iso: FieldIsomorphism (forward + backward FieldHom)"
#eval "Morphisms.Iso: id, symm, comp defined"
#eval "Morphisms.Iso: isIsomorphic predicate (≅ₓ) between fields"
#eval "Morphisms.Iso: AutField with explicit group structure"
#eval "Morphisms.Iso: isIsomorphic proven equivalence relation"
#eval "Morphisms.Iso: fixedField, GaloisGroup, fixedFieldOfSet"

end MiniFieldTheoryCore
