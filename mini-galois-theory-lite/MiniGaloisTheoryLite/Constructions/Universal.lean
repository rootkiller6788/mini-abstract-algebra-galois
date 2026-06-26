/-
# MiniGaloisTheoryLite.Constructions.Universal

Splitting field, normal closure, separable closure, Galois closure.
Universal constructions in Galois theory.
-/

import MiniGaloisTheoryLite.Constructions.Products
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic
import MiniPolynomialAlgebra.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore
open MiniPolynomialAlgebra

/-! ## Splitting field -/

structure SplittingField (F : Field) (poly : Polynomial F.ring) extends FieldExtension where
  roots : List extensionField.carrier
  splits : Prop
  generatedByRoots : Prop
  isUniversal : Prop

/-! ## Normal closure -/

structure NormalClosure (E : FieldExtension) extends FieldExtension where
  emb : FieldExtensionHom E (NormalClosure.toFieldExtension E)
  isNormal : isNormalExtension (NormalClosure.toFieldExtension E)
  isMinimal : Prop
  -- Smallest normal extension containing E

/-! ## Separable closure -/

structure SeparableClosure (E : FieldExtension) extends FieldExtension where
  emb : FieldExtensionHom E (SeparableClosure.toFieldExtension E)
  isSeparable : isSeparableExtension (SeparableClosure.toFieldExtension E)
  isMinimal : Prop

/-! ## Galois closure -/

structure GaloisClosure (E : FieldExtension) extends FieldExtension where
  emb : FieldExtensionHom E (GaloisClosure.toFieldExtension E)
  isGalois : isGaloisExtension (GaloisClosure.toFieldExtension E)
  isMinimal : Prop
  -- Smallest Galois extension containing E

/-! ## Algebraic closure (universal property) -/

structure AlgebraicClosureGalois (F : Field) where
  algClosed : Field
  emb : FieldHom F algClosed
  isAlgebraicallyClosed : Prop
  isUnique : Prop

/-! ## Primitive element construction -/

def primitiveElement (E : FieldExtension) (hSeparable : isSeparableExtension E) (hFinite : Prop) :
  exists (alpha : E.extensionField.carrier), True :=
  sorry
  -- Every finite separable extension is simple: E = F(alpha)

/-! ## Cyclotomic extension (universal) -/

structure CyclotomicExtension (F : Field) (n : Nat) extends FieldExtension where
  primitiveRoot : extensionField.carrier
  minimalPoly : Polynomial F.ring
  degree : Nat
  -- phi(n) when char(F) does not divide n

/-! ## #eval tests -/

#eval "Constructions.Universal: SplittingField, NormalClosure, SeparableClosure, GaloisClosure"
#eval "Constructions.Universal: AlgebraicClosure, primitiveElement, CyclotomicExtension"
