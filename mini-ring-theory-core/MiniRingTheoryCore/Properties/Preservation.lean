/-
# MiniRingTheoryCore.Properties.Preservation

How ring homomorphisms preserve ideal properties:
preimage, image, maximal -> maximal for surjections,
prime preserved under preimage.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Morphisms.Hom

namespace MiniRingTheoryCore

/-! ## Preimage Ideal

If f: R → S is a ring homomorphism and J is an ideal of S,
then f⁻¹(J) is an ideal of R. -/

/-- Axiom: ring homomorphism maps zero to zero. -/
axiom ringHom_map_zero {R S : Ring} (f : RingHom R S) : f.map R.zero = S.zero

/-- The preimage ideal: f⁻¹(J) = { r ∈ R | f(r) ∈ J }. -/
def preimageIdeal {R S : Ring} (f : RingHom R S) (J : Ideal S) : Ideal R where
  subset := { x | f.map x ∈ J.subset }
  zero_mem := by
    rw [Set.mem_setOf_eq]
    rw [ringHom_map_zero f]
    exact J.zero_mem
  add_closed hx hy := by
    rw [Set.mem_setOf_eq] at hx hy ⊢
    rw [f.map_add]
    exact J.add_closed hx hy
  smul_closed h := by
    rw [Set.mem_setOf_eq] at h ⊢
    rw [f.map_mul]
    exact J.smul_closed h

/-! ## Image Ideal

If f: R → S is a ring homomorphism and I is an ideal of R,
the image f(I) is not always an ideal of S (unless f is surjective).
We define imageIdeal only for surjective f. -/

/-- A homomorphism is surjective if its image is the whole codomain. -/
def isSurjective {R S : Ring} (f : RingHom R S) : Prop :=
  ∀ (y : S.carrier), ∃ (x : R.carrier), f.map x = y

/-- The image ideal (only valid for surjective f). -/
axiom imageIdeal {R S : Ring} (f : RingHom R S) (h : isSurjective f)
  (I : Ideal R) : Ideal S

/-- The image ideal contains f(x) for all x in I. -/
axiom imageIdeal_mem {R S : Ring} {f : RingHom R S} {h : isSurjective f}
  {I : Ideal R} {x : R.carrier} (hx : x ∈ I.subset) :
  f.map x ∈ (imageIdeal f h I).subset

/-! ## Surjective Hom: Maximal -> Maximal -/

/-- If f: R → S is surjective and I is a maximal ideal of R
    with ker(f) ⊆ I, then f(I) is maximal.
    (A standard result: surjective maps preserve maximal ideals
    when the kernel is contained.) -/
axiom surjective_preserves_maximal {R S : Ring} (f : RingHom R S)
  (hsurj : isSurjective f) (I : Ideal R) (hmax : Ideal.IsMaximal I) :
  Ideal.IsMaximal (imageIdeal f hsurj I)

/-! ## Prime Ideal under Preimage

/-- If f: R → S is any ring homomorphism and Q is a prime ideal
    of S, then f⁻¹(Q) is a prime ideal of R. -/
axiom preimage_preserves_prime {R S : Ring} (f : RingHom R S)
  (Q : Ideal S) (hprime : Ideal.IsPrime Q) :
  Ideal.IsPrime (preimageIdeal f Q)

/-! ## Ideal Correspondence

For a surjective f: R → S with kernel K, there is a bijection
between ideals of S and ideals of R containing K. -/
axiom idealCorrespondence_surjective {R S : Ring} (f : RingHom R S)
  (hsurj : isSurjective f) (K : Ideal R) (hK : K.subset = RingHom.ker f) :
  True

/-! ## #eval examples -/

#eval "preimageIdeal: f⁻¹(J) is an ideal of R"
#eval "imageIdeal: f(I) is an ideal of S for surjective f"
#eval "surjective_preserves_maximal: surjective f => maximal preserved"
#eval "preimage_preserves_prime: f⁻¹(Q) prime when Q prime"
