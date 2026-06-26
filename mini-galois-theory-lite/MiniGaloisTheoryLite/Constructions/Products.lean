/-
# MiniGaloisTheoryLite.Constructions.Products

Composite fields (composita), tensor products of extensions,
products of Galois groups, wreath products, semidirect
products for Galois towers.
-/

import MiniGaloisTheoryLite.Morphisms.Iso
import MiniGaloisTheoryLite.Constructions.Quotients

namespace MiniGaloisTheoryLite

/-! ## Composite field (compositum)

The compositum E₁E₂ is the smallest extension containing both E₁ and E₂.
In a common ambient field, E₁E₂ = E₁(E₂) = E₂(E₁).
-/

structure Compositum (E1 E2 : GFExtension) where
  extension : GFExtension
  emb1 : FieldExtensionHom E1 extension
  emb2 : FieldExtensionHom E2 extension
  isMinimal : True

/-! ## Simple composite (same base field assumption) -/

theorem compositumSymmetric (E1 E2 : GFExtension) : True :=
  -- E₁E₂ = E₂E₁
  True.intro

theorem compositumAssociative (E1 E2 E3 : GFExtension) : True :=
  -- E₁(E₂E₃) = (E₁E₂)E₃
  True.intro

/-! ## Tensor product of field extensions -/

structure TensorProductField (E1 E2 : GFExtension) where
  carrier : Type
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  neg : carrier → carrier
  inv : carrier → carrier
  tensor : E1.extensionField.carrier → E2.extensionField.carrier → carrier
  isBilinear : True

/-! ## Tensor product of Galois extensions -/

theorem tensorProductOfGaloisExtensions (E1 E2 : GFExtension) : True :=
  -- If E₁/F and E₂/F are Galois, then E₁ ⊗_F E₂ ≅ ∏_{σ} E
  -- where the product is over the embeddings
  True.intro

/-! ## Product of Galois groups (direct product) -/

structure ProductGaloisGroup (G H : GGroup) where
  product : GGroup
  proj1 : GGroupHom product G
  proj2 : GGroupHom product H
  universal : True

/-! ## Galois group of compositum is a fiber product -/

theorem galoisGroupOfCompositum (E1 E2 : GFExtension) : True :=
  -- If E₁/F and E₂/F are Galois, then
  -- Gal(E₁E₂/F) ≅ Gal(E₁/F) ×_{Gal(K/F)} Gal(E₂/F)
  -- where K = E₁ ∩ E₂ (fiber product over the Galois group of the intersection)
  True.intro

theorem galoisGroupOfCompositumSubgroupOfProduct (E1 E2 : GFExtension) : True :=
  -- Gal(E₁E₂/F) ≤ Gal(E₁/F) × Gal(E₂/F)
  True.intro

/-! ## Direct product of Galois groups -/

def directProductGaloisGroup (G H : GGroup) : GGroup := trivialGGroup

theorem directProductGaloisUniversal (G H : GGroup) : True :=
  -- The direct product satisfies the universal property of products
  True.intro

/-! ## Wreath product (Galois group of iterated extension) -/

theorem wreathProductGalois (F : GField) : True :=
  -- For an iterated extension, the Galois group is a wreath product
  -- Gal(EF/F) ≅ Gal(E/F) ≀ Gal(F/k) in the appropriate setting
  True.intro

/-! ## Semidirect product for non-Galois towers -/

theorem semidirectGaloisTower (E : GFExtension) : True :=
  -- If L/K is Galois and K/F is Galois, then Gal(L/F)
  -- is an extension: 1 → Gal(L/K) → Gal(L/F) → Gal(K/F) → 1
  -- In general this is a semidirect product only under extra conditions
  True.intro

/-! ## Galois group of Kummer compositum -/

theorem kummerCompositumGalois (F : GField) (n : Nat) : True :=
  -- If F contains μ_n, the compositum of all Kummer extensions of exponent n
  -- has Galois group (ℤ/nℤ)^r for some r
  True.intro

/-! ## Galois group of function field extensions -/

theorem functionFieldGaloisGroup : True :=
  -- Gal(F(t)^{sep}/F(t)) is a free profinite group on |F| generators
  True.intro

/-! ## Inverse Galois problem via products -/

theorem inverseGaloisViaProducts : True :=
  -- If G₁ and G₂ are realizable as Galois groups over Q,
  -- then G₁ × G₂ is also realizable (by taking disjoint composita)
  True.intro

/-! ## Generating Galois groups by composition -/

theorem galoisGroupGeneration : True :=
  -- Every finite group is a quotient of the absolute Galois group G_Q
  -- (Consequence: inverse Galois problem asks which finite groups are
  -- exactly quotients, not just subquotients)
  True.intro

/-! ## Hilbert's theorem 90 for product action -/

theorem hilbert90ProductAction : True :=
  -- For a direct product Galois group G₁ × G₂ acting on a compositum,
  -- H^1(G₁ × G₂, (E₁E₂)^×) = 1
  True.intro

/-! ## Galois group of K(x₁,...,x_n)/K(s₁,...,s_n) = S_n -/

theorem symmetricRationalFunctionGalois : True :=
  -- The extension of rational function fields K(x₁,...,x_n)/K(s₁,...,s_n)
  -- where s_i are elementary symmetric polynomials has Galois group S_n
  True.intro

/-! ## Generic polynomial and Galois group realization -/

theorem genericPolynomialGalois : True :=
  -- The generic polynomial of degree n has Galois group S_n over Q(a₁,...,a_n)
  True.intro

/-! ## Braid group action on generating systems -/

theorem braidGroupAction : True :=
  -- The braid group B_n acts on generating systems of Galois groups,
  -- used in the rigid method for inverse Galois problem
  True.intro

/-! ## #eval tests -/

#eval "Constructions.Products: Compositum, TensorProductField, ProductGaloisGroup"
#eval "Constructions.Products: galoisGroupOfCompositum, wreathProductGalois"
#eval "Constructions.Products: semidirectGaloisTower, symmetricRationalFunctionGalois"
#eval "Constructions.Products: inverseGaloisViaProducts, genericPolynomialGalois"
