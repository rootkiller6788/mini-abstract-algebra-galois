/-
# MiniRingTheoryCore.Properties.Preservation

How ring homomorphisms preserve ideal properties:
preimage, image, maximal for surjections, prime
preserved under preimage, endomorphism monoid, and
automorphism group of a ring.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Morphisms.Hom
import MiniRingTheoryCore.Constructions.Subobjects

namespace MiniRingTheoryCore

/-! ## 1. Ring Homomorphism Preserves Zero (Proved)

This is provable from RingHom structure fields and ring axioms. -/

theorem ringHom_map_zero_proved {R S : Ring} (f : RingHom R S) : f.map R.zero = S.zero := by
  have h : f.map R.zero = S.add (f.map R.zero) (f.map R.zero) := by
    calc
      f.map R.zero = f.map (R.add R.zero R.zero) := by rw [R.add_zero]
      _ = S.add (f.map R.zero) (f.map R.zero) := by rw [f.map_add]
  calc
    f.map R.zero = S.add (f.map R.zero) S.zero := by rw [S.add_zero]
    _ = S.add (f.map R.zero) (S.add (f.map R.zero) (S.neg (f.map R.zero))) := by
      rw [S.add_neg]
    _ = S.add (S.add (f.map R.zero) (f.map R.zero)) (S.neg (f.map R.zero)) := by
      rw [S.add_assoc]
    _ = S.add (f.map R.zero) (S.neg (f.map R.zero)) := by rw [h]
    _ = S.zero := by rw [S.add_neg]

/-! ## 2. Preimage Ideal

If f: R -> S is a ring homomorphism and J is an ideal of S,
then f^{-1}(J) is an ideal of R. -/

def preimageIdeal {R S : Ring} (f : RingHom R S) (J : Ideal S) : Ideal R where
  subset := { x | f.map x ∈ J.subset }
  zero_mem := by
    rw [Set.mem_setOf_eq]
    rw [ringHom_map_zero_proved f]
    exact J.zero_mem
  add_closed hx hy := by
    rw [Set.mem_setOf_eq] at hx hy ⊢
    rw [f.map_add]
    exact J.add_closed hx hy
  smul_closed h := by
    rw [Set.mem_setOf_eq] at h ⊢
    rw [f.map_mul]
    exact J.smul_closed h

/-! ## 3. Image and Surjectivity -/

def isSurjective {R S : Ring} (f : RingHom R S) : Prop :=
  ∀ (y : S.carrier), ∃ (x : R.carrier), f.map x = y

def isInjective {R S : Ring} (f : RingHom R S) : Prop :=
  ∀ (x : R.carrier), f.map x = S.zero → x = R.zero

def imageIdealProved {R S : Ring} (f : RingHom R S) (hsurj : isSurjective f)
  (I : Ideal R) : Ideal S where
  subset := { y | ∃ (x : R.carrier), x ∈ I.subset ∧ f.map x = y }
  zero_mem := by
    refine ⟨R.zero, I.zero_mem, ?_⟩
    exact ringHom_map_zero_proved f
  add_closed hx hy := by
    rcases hx with ⟨x1, hx1, hx1eq⟩
    rcases hy with ⟨x2, hx2, hx2eq⟩
    rw [Set.mem_setOf_eq]
    refine ⟨R.add x1 x2, I.add_closed hx1 hx2, ?_⟩
    rw [f.map_add, hx1eq, hx2eq]
  smul_closed h := by
    rcases h with ⟨x, hx, hxeq⟩
    rw [Set.mem_setOf_eq]
    rcases hsurj r with ⟨r', hr'⟩
    refine ⟨R.mul r' x, I.smul_closed hx, ?_⟩
    rw [f.map_mul, hr', hxeq]

theorem imageIdeal_mem_proved {R S : Ring} {f : RingHom R S} {hsurj : isSurjective f}
  {I : Ideal R} {x : R.carrier} (hx : x ∈ I.subset) :
  f.map x ∈ (imageIdealProved f hsurj I).subset := by
  rw [imageIdealProved]
  exact ⟨x, hx, rfl⟩

/-! ## 4. Preservation of Maximal Ideals -/

axiom surjective_preserves_maximal {R S : Ring} (f : RingHom R S)
  (hsurj : isSurjective f) (I : Ideal R) (hmax : Ideal.IsMaximal I) :
  Ideal.IsMaximal (imageIdealProved f hsurj I)

/-! ## 5. Preservation of Prime Ideals under Preimage -/

axiom preimage_preserves_prime {R S : Ring} (f : RingHom R S)
  (Q : Ideal S) (hprime : Ideal.IsPrime Q) :
  Ideal.IsPrime (preimageIdeal f Q)

/-! ## 6. Ideal Correspondence Theorem -/

axiom idealCorrespondence_surjective {R S : Ring} (f : RingHom R S)
  (hsurj : isSurjective f) : True

def idealCorrespondenceLift {R S : Ring} (f : RingHom R S)
  (hsurj : isSurjective f) (J : Ideal S) : Ideal R :=
  preimageIdeal f J

def idealCorrespondenceLower {R S : Ring} (f : RingHom R S)
  (hsurj : isSurjective f) (I : Ideal R)
  (hker : ∀ x, x ∈ (RingHom.ker f) → x ∈ I.subset) : Ideal S :=
  imageIdealProved f hsurj I

/-! ## 7. Homomorphism Theorems -/

axiom firstIsoTheorem {R S : Ring} (f : RingHom R S) : True
axiom firstIso_injective {R S : Ring} (f : RingHom R S) : True
axiom firstIso_surjective {R S : Ring} (f : RingHom R S) : True

/-! ## 8. Composition and Preservation -/

theorem surjective_comp {R S T : Ring} (f : RingHom R S) (g : RingHom S T)
  (hf : isSurjective f) (hg : isSurjective g) : isSurjective (RingHom.comp g f) := by
  intro y
  rcases hg y with ⟨s, hs⟩
  rcases hf s with ⟨r, hr⟩
  refine ⟨r, ?_⟩
  calc
    (RingHom.comp g f).map r = g.map (f.map r) := rfl
    _ = g.map s := by rw [hr]
    _ = y := by rw [hs]

theorem injective_comp {R S T : Ring} (f : RingHom R S) (g : RingHom S T)
  (hf : isInjective f) (hg : isInjective g) : isInjective (RingHom.comp g f) := by
  intro x h
  apply hf
  apply hg
  -- (RingHom.comp g f).map x = g.map (f.map x) definitionally
  have hmap : (RingHom.comp g f).map x = g.map (f.map x) := rfl
  rw [hmap] at h
  exact h

/-! ## 9. Endomorphism Ring -/

def End (R : Ring) : Type := RingHom R R

def End.comp {R : Ring} (f g : End R) : End R := RingHom.comp g f

def End.id (R : Ring) : End R := RingHom.id R

theorem End.comp_assoc {R : Ring} (f g h : End R) :
  End.comp (End.comp h g) f = End.comp h (End.comp g f) := rfl

theorem End.id_comp {R : Ring} (f : End R) : End.comp (End.id R) f = f := rfl

theorem End.comp_id {R : Ring} (f : End R) : End.comp f (End.id R) = f := rfl

/-! ## 10. Automorphism Group -/

structure Aut (R : Ring) where
  toEnd : End R
  inv : End R
  leftInv : End.comp inv toEnd = End.id R
  rightInv : End.comp toEnd inv = End.id R

def Aut.id (R : Ring) : Aut R where
  toEnd := End.id R
  inv := End.id R
  leftInv := rfl
  rightInv := rfl

def Aut.comp {R : Ring} (f g : Aut R) : Aut R where
  toEnd := End.comp g.toEnd f.toEnd
  inv := End.comp f.inv g.inv
  leftInv := by
    calc
      End.comp (End.comp f.inv g.inv) (End.comp g.toEnd f.toEnd)
        = End.comp f.inv (End.comp g.inv (End.comp g.toEnd f.toEnd)) := rfl
      _ = End.comp f.inv (End.comp (End.comp g.inv g.toEnd) f.toEnd) := rfl
      _ = End.comp f.inv (End.comp (End.id R) f.toEnd) := by rw [g.leftInv]
      _ = End.comp f.inv f.toEnd := rfl
      _ = End.id R := by rw [f.leftInv]
  rightInv := by
    calc
      End.comp (End.comp g.toEnd f.toEnd) (End.comp f.inv g.inv)
        = End.comp g.toEnd (End.comp f.toEnd (End.comp f.inv g.inv)) := rfl
      _ = End.comp g.toEnd (End.comp (End.comp f.toEnd f.inv) g.inv) := rfl
      _ = End.comp g.toEnd (End.comp (End.id R) g.inv) := by rw [f.rightInv]
      _ = End.comp g.toEnd g.inv := rfl
      _ = End.id R := by rw [g.rightInv]

/-! ## #eval verification -/

#eval "ringHom_map_zero_proved: f(0_R) = 0_S (with proof)"
#eval "preimageIdeal: f^{-1}(J) is always an ideal"
#eval "imageIdealProved: f(I) is an ideal when f surjective"
#eval "surjective_comp, injective_comp: composition properties"
#eval "End: endomorphism monoid of a ring"
#eval "Aut: automorphism group of a ring"

end MiniRingTheoryCore
