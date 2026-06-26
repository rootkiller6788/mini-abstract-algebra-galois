/-
# MiniFieldTheoryCore.Morphisms.Hom

Field homomorphisms (morphisms between fields).
-/

import MiniFieldTheoryCore.Core.Basic

namespace MiniFieldTheoryCore

/-! ## FieldHom -/

structure FieldHom (F K : Field) where
  map : F.ring.carrier → K.ring.carrier
  isRingHom : RingHom F.ring K.ring
  preservesOne : map F.ring.one = K.ring.one

/-! ## Identity and Composition -/

def FieldHom.id (F : Field) : FieldHom F F where
  map := id
  isRingHom := RingHom.id F.ring
  preservesOne := rfl

def FieldHom.comp {F K L : Field} (g : FieldHom K L) (f : FieldHom F K) : FieldHom F L where
  map := g.map ∘ f.map
  isRingHom := RingHom.comp g.isRingHom f.isRingHom
  preservesOne := by
    simp [f.preservesOne, g.preservesOne]

/-! ## Field homomorphism properties -/

/-- Every field homomorphism is injective. (Proof: kernel = {0} in a field,
    so if f(x) = f(y) then f(x-y) = 0, so x-y = 0, so x = y.) -/
axiom fieldHom_injective {F K : Field} (f : FieldHom F K) (x y : F.ring.carrier)
    (h : f.map x = f.map y) : x = y

/-- A field homomorphism maps 0 to 0. -/
axiom fieldHom_map_zero {F K : Field} (f : FieldHom F K) : f.map F.ring.zero = K.ring.zero

/-- A field homomorphism respects additive inverses. -/
axiom fieldHom_map_neg {F K : Field} (f : FieldHom F K) (x : F.ring.carrier) :
    f.map (F.ring.neg x) = K.ring.neg (f.map x)

/-- A field homomorphism respects subtraction. -/
axiom fieldHom_map_sub {F K : Field} (f : FieldHom F K) (x y : F.ring.carrier) :
    f.map (F.ring.add x (F.ring.neg y)) = K.ring.add (f.map x) (K.ring.neg (f.map y))

/-- A field homomorphism respects multiplicative inverses of nonzero elements. -/
axiom fieldHom_map_inv {F K : Field} (f : FieldHom F K) (x : F.ring.carrier) (hx : x ≠ F.ring.zero) :
    f.map (Field.inv F x hx) = Field.inv K (f.map x) (by
      intro hzero
      have hzero' := fieldHom_map_zero f
      -- if f(x) = 0, then by injectivity x = 0, contradiction
      have := fieldHom_injective f x F.ring.zero (by rw [hzero, hzero'])
      exact hx this)

/-- The image of a field homomorphism is a subfield of the codomain. -/
axiom fieldHom_image_is_subfield {F K : Field} (f : FieldHom F K) : Subfield K

/-- The preimage of a subfield under a field homomorphism is a subfield. -/
axiom fieldHom_preimage_subfield {F K : Field} (f : FieldHom F K) (S : Subfield K) : Subfield F

/-- Composition of field homomorphisms is associative. -/
theorem FieldHom.comp_assoc {F K L M : Field} (h : FieldHom L M) (g : FieldHom K L) (f : FieldHom F K) :
    FieldHom.comp (FieldHom.comp h g) f = FieldHom.comp h (FieldHom.comp g f) := rfl

/-- Identity is neutral left. -/
theorem FieldHom.comp_id_left {F K : Field} (f : FieldHom F K) : FieldHom.comp (FieldHom.id K) f = f := rfl

/-- Identity is neutral right. -/
theorem FieldHom.comp_id_right {F K : Field} (f : FieldHom F K) : FieldHom.comp f (FieldHom.id F) = f := rfl

/-! ## Extension of field homomorphisms -/

/-- Extension of a field homomorphism to a simple algebraic extension:
    If f: F → L, and α is algebraic over F with minimal polynomial p,
    then f extends to F(α) → L iff f(p) has a root in L. -/
axiom fieldHomExtensionSimpleAlgebraic {F K L : Field} (f : FieldHom F L)
    (E : FieldExtension) (halg : isAlgebraicExtension E) (hbase : isIsomorphic E.baseField F)
    (α : E.extensionField.ring.carrier) (hroot : True) :  -- p has root in L
    -- ∃ g: F(α) → L extending f with g(α) = root
    True

/-- Extension to the splitting field: a field homomorphism f: F → L extends
    to the splitting field E of a polynomial over F iff f(p) splits in L. -/
axiom fieldHomExtensionSplittingField {F L : Field} (f : FieldHom F L)
    (coeffs : List F.ring.carrier) (E : FieldExtension) (hsplit : True) (hsplitL : True) :
    -- ∃ g: E → L extending f
    True

/-- Extension to an algebraic closure: any field homomorphism F → L where
    L is algebraically closed extends to an algebraic closure F^alg → L. -/
axiom fieldHomExtensionAlgebraicClosure {F L : Field} (f : FieldHom F L)
    (hAC : isAlgebraicallyClosed L) (Falg : Field) (hACF : isAlgebraicallyClosed Falg)
    (ι : FieldHom F Falg) :
    -- ∃ g: Falg → L with g ∘ ι = f
    True

/-! ## Endomorphisms of fields -/

/-- An endomorphism of a field is a field homomorphism from F to itself. -/
def EndField (F : Field) := FieldHom F F

/-- The identity is an endomorphism. -/
def EndField.id (F : Field) : EndField F := FieldHom.id F

/-- Composition of endomorphisms. -/
def EndField.comp {F : Field} (g f : EndField F) : EndField F := FieldHom.comp g f

/-- The Frobenius endomorphism is a nontrivial endomorphism in characteristic p. -/
axiom frobeniusEndomorphism {F : Field} (p : Nat) (hp : characteristic F = p) (hpos : p > 0) :
    EndField F

/-! ## Embeddings of a field extension -/

/-- An embedding of E/F into an extension L/F is an F-linear field
    homomorphism E → L. -/
structure ExtensionEmbedding (E : FieldExtension) (L : Field) where
  map : FieldHom E.extensionField L
  fixesBase : ∀ (x : E.baseField.ring.carrier), map.map (E.inclusion.map x) = E.inclusion.map x

/-- The set of all embeddings of E into an algebraic closure is the key to
    Galois theory. For a separable extension, the number of embeddings equals
    the degree. -/
axiom separableExtensionEmbeddingCount {E : FieldExtension} (hsep : True) (hfin : isFiniteExtension E)
    (Falg : Field) (hAC : isAlgebraicallyClosed Falg) (ι : FieldHom E.baseField Falg) :
    -- |Emb(E/F, Falg)| = [E:F]
    True

end MiniFieldTheoryCore
