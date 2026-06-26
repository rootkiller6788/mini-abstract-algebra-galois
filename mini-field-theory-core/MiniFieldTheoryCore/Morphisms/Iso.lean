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

/-! ## Automorphism type alias -/

def AutField (F : Field) := FieldIsomorphism F F

/-! ## Automorphism group (axiom — group structure on Aut(F)) -/

axiom automorphismGroupMul {F : Field} : AutField F → AutField F → AutField F

axiom automorphismGroupInv {F : Field} : AutField F → AutField F

axiom automorphismGroupOne {F : Field} : AutField F

axiom automorphismGroupAssoc {F : Field}
  (f g h : AutField F) : automorphismGroupMul (automorphismGroupMul f g) h =
    automorphismGroupMul f (automorphismGroupMul g h)

/-! ## Equivalence relation — isomorphism is an equivalence -/

axiom isoEquivRefl (F : Field) : isIsomorphic F F

axiom isoEquivSymm {F K : Field} (h : isIsomorphic F K) : isIsomorphic K F

axiom isoEquivTrans {F K L : Field} (h₁ : isIsomorphic F K) (h₂ : isIsomorphic K L) :
  isIsomorphic F L

/-! ## #eval examples -/

#eval "Morphisms.Iso: FieldIsomorphism (forward + backward FieldHom)"
#eval "Morphisms.Iso: id, symm, comp defined"
#eval "Morphisms.Iso: isIsomorphic predicate (≅ₓ) between fields"
#eval "Morphisms.Iso: AutField, automorphismGroupMul/Inv/One"
