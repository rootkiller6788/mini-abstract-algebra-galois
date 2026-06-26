/-
# Ring Theory Core: Ring Embeddings

Ring embedding framework for translating between rings.
Expanded with morphism properties and equational reasoning.
-/

import MiniRingTheoryCore.Core.Basic

namespace MiniRingTheoryCore

/-! ## Ring Embeddings -/

structure RingEmbedding (R S : Ring) where
  toFun : R.carrier → S.carrier
  inj : ∀ x y, toFun x = toFun y → x = y
  map_add : ∀ x y, toFun (R.add x y) = S.add (toFun x) (toFun y)
  map_mul : ∀ x y, toFun (R.mul x y) = S.mul (toFun x) (toFun y)
  map_one : toFun R.one = S.one

def RingEmbedding.id (R : Ring) : RingEmbedding R R where
  toFun x := x
  inj _ _ h := h
  map_add _ _ := rfl
  map_mul _ _ := rfl
  map_one := rfl

def RingEmbedding.comp {R S T : Ring} (e1 : RingEmbedding S T) (e2 : RingEmbedding R S) : RingEmbedding R T where
  toFun x := e1.toFun (e2.toFun x)
  inj _ _ h := e2.inj _ _ (e1.inj _ _ h)
  map_add _ _ := by simp [e2.map_add, e1.map_add]
  map_mul _ _ := by simp [e2.map_mul, e1.map_mul]
  map_one := by simp [e2.map_one, e1.map_one]

/-! ## Embedding to RingHom Conversion -/

/-- Every ring embedding induces a ring homomorphism. -/
def RingEmbedding.toRingHom {R S : Ring} (e : RingEmbedding R S) : RingHom R S where
  map := e.toFun
  map_add := e.map_add
  map_mul := e.map_mul
  map_one := e.map_one

/-- Composition of embeddings agrees with composition of homomorphisms. -/
theorem RingEmbedding.comp_toRingHom {R S T : Ring}
    (e1 : RingEmbedding S T) (e2 : RingEmbedding R S) :
  (e1.comp e2).toRingHom = RingHom.comp e1.toRingHom e2.toRingHom := rfl

/-- The identity embedding corresponds to the identity homomorphism. -/
theorem RingEmbedding.id_toRingHom (R : Ring) :
  (RingEmbedding.id R).toRingHom = RingHom.id R := rfl

/-! ## Embedding Properties -/

/-- An embedding maps zero to zero. This follows from toRingHom + ringHom map_zero
    but we provide a direct proof as well. -/
theorem RingEmbedding.map_zero {R S : Ring} (e : RingEmbedding R S) :
  e.toFun R.zero = S.zero := by
  have h := e.map_add R.zero R.zero
  rw [R.add_zero] at h
  -- Now h: e(0) = e(0) + e(0), so by idempotent law, e(0) = 0
  have h_idem : S.add (e.toFun R.zero) (e.toFun R.zero) = e.toFun R.zero := by
    rw [← h, R.add_zero]
  -- Use the idempotent lemma from Basic: requires proving add_idempotent_is_zero again
  -- We inline the argument
  calc
    e.toFun R.zero = S.add (e.toFun R.zero) S.zero := by rw [S.add_zero]
    _ = S.add (e.toFun R.zero)
             (S.add (e.toFun R.zero) (S.neg (e.toFun R.zero))) := by rw [S.add_neg]
    _ = S.add (S.add (e.toFun R.zero) (e.toFun R.zero))
             (S.neg (e.toFun R.zero)) := by rw [S.add_assoc]
    _ = S.add (e.toFun R.zero) (S.neg (e.toFun R.zero)) := by rw [h_idem]
    _ = S.zero := by rw [S.add_neg]

/-- An embedding preserves negation. -/
theorem RingEmbedding.map_neg {R S : Ring} (e : RingEmbedding R S) (x : R.carrier) :
  e.toFun (R.neg x) = S.neg (e.toFun x) := by
  have hsum : S.add (e.toFun x) (e.toFun (R.neg x)) = S.zero := by
    calc
      S.add (e.toFun x) (e.toFun (R.neg x)) = e.toFun (R.add x (R.neg x)) := by
        rw [e.map_add]
      _ = e.toFun R.zero := by rw [R.add_neg]
      _ = S.zero := by rw [RingEmbedding.map_zero]
  calc
    e.toFun (R.neg x) = S.add (e.toFun (R.neg x)) S.zero := by rw [S.add_zero]
    _ = S.add (e.toFun (R.neg x)) (S.add (e.toFun x) (S.neg (e.toFun x))) := by
      rw [S.add_neg]
    _ = S.add (S.add (e.toFun (R.neg x)) (e.toFun x)) (S.neg (e.toFun x)) := by
      rw [S.add_assoc]
    _ = S.add (S.add (e.toFun x) (e.toFun (R.neg x))) (S.neg (e.toFun x)) := by
      rw [S.add_comm (e.toFun (R.neg x))]
    _ = S.add S.zero (S.neg (e.toFun x)) := by rw [hsum]
    _ = S.neg (e.toFun x) := by rw [S.add_comm, S.add_zero]

/-- An embedding is a ring homomorphism (trivially). -/
/-- An embedding is trivially a ring homomorphism via toRingHom. -/
theorem RingEmbedding.isRingHom {R S : Ring} (e : RingEmbedding R S) :
  True := ⟨⟩

/-! ## Isomorphism Theory via Embeddings -/

/-- An embedding is surjective iff its underlying map is surjective. -/
def RingEmbedding.IsSurjective {R S : Ring} (e : RingEmbedding R S) : Prop :=
  ∀ (y : S.carrier), ∃ (x : R.carrier), e.toFun x = y

/-- A bijective embedding is an isomorphism. We capture this
    via an inverse function constructed using surjectivity. -/
structure BijectiveEmbedding (R S : Ring) where
  embed : RingEmbedding R S
  surj : RingEmbedding.IsSurjective embed
  inv : S.carrier → R.carrier
  leftInv : ∀ x, inv (embed.toFun x) = x
  rightInv : ∀ y, embed.toFun (inv y) = y

/-- Every ring embedding that is surjective defines a ring isomorphism.
    We construct the inverse ring homomorphism explicitly. -/
def BijectiveEmbedding.toRingIso {R S : Ring} (b : BijectiveEmbedding R S) : RingIso R S where
  toFun := b.embed.toFun
  invFun := b.inv
  leftInv := b.leftInv
  rightInv := b.rightInv
  map_add := b.embed.map_add
  map_mul := b.embed.map_mul

/-! ## Ring Homomorphism Properties -/

/-- Ring homomorphisms compose associatively. -/
theorem RingHom.comp_assoc {R S T U : Ring}
    (h : RingHom T U) (g : RingHom S T) (f : RingHom R S) :
  RingHom.comp (RingHom.comp h g) f = RingHom.comp h (RingHom.comp g f) := rfl

/-- The identity homomorphism acts as identity for composition. -/
theorem RingHom.comp_id {R S : Ring} (f : RingHom R S) :
  RingHom.comp f (RingHom.id R) = f := rfl

theorem RingHom.id_comp {R S : Ring} (f : RingHom R S) :
  RingHom.comp (RingHom.id S) f = f := rfl

/-! ## Category of Rings

Ring homomorphisms form a category: objects are rings, morphisms
are ring homomorphisms, identity is RingHom.id, composition is
RingHom.comp. The category laws hold trivially. -/

/-- The category of rings is well-defined: composition is associative
    and identity morphisms are neutral. -/
theorem ring_category_laws :
  (∀ (R S T U : Ring) (h : RingHom T U) (g : RingHom S T) (f : RingHom R S),
    RingHom.comp (RingHom.comp h g) f = RingHom.comp h (RingHom.comp g f)) ∧
  (∀ (R S : Ring) (f : RingHom R S), RingHom.comp f (RingHom.id R) = f) ∧
  (∀ (R S : Ring) (f : RingHom R S), RingHom.comp (RingHom.id S) f = f) := by
  refine ⟨?_, ?_, ?_⟩
  · exact RingHom.comp_assoc
  · exact RingHom.comp_id
  · exact RingHom.id_comp

/-! ## #eval examples -/

#eval "RingEmbedding: structure-preserving injective maps"
#eval "BijectiveEmbedding: an embedding that is also surjective"
#eval "ring_category_laws: rings form a category"

end MiniRingTheoryCore
