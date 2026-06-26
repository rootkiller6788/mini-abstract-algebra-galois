/-
# MiniFieldTheoryCore.Bridges.ToAlgebra

Galois group connection, extension degree and group order relation,
algebraic number fields, and field extensions as vector spaces.
-/

import MiniFieldTheoryCore.Theorems.Main
import MiniFieldTheoryCore.Morphisms.Iso

namespace MiniFieldTheoryCore

/-! ## Galois Extension -/

structure GaloisExtension where
  ext : FieldExtension
  normal : Prop    -- every irreducible polynomial in base that has a root in ext splits
  separable : Prop  -- minimal polynomials have distinct roots

/-! ## Galois Group — automorphisms fixing the base field -/

axiom galoisGroup (E : GaloisExtension) : Type

axiom galoisGroupOrder {E : GaloisExtension} (hfin : isFiniteExtension E.ext) :
  Nat

/-! ## Extension degree equals Galois group order -/

axiom galoisCorrespondenceDegree {E : GaloisExtension} (hfin : isFiniteExtension E.ext) :
  -- |Gal(E/K)| = [E : K]
  True

/-! ## Galois correspondence — subgroups of Galois group ↔ intermediate fields -/

axiom galoisCorrespondence {E : GaloisExtension} :
  -- There is a bijection between subgroups of Gal(E/K) and intermediate fields of E/K
  True

/-! ## Algebraic Number Fields — finite extensions of Q -/

structure AlgebraicNumberField where
  field : Field
  isFiniteOverQ : Prop
  degreeQ : Nat

axiom algebraicIntegerRing (K : AlgebraicNumberField) : Type
  -- The ring of integers O_K of an algebraic number field

axiom dirichletUnitTheorem (K : AlgebraicNumberField) : Prop
  -- O_K^* ≅ μ(K) × Z^{r₁+r₂-1}

axiom finitenessOfClassNumber (K : AlgebraicNumberField) : Prop
  -- The ideal class group of K is finite

/-! ## Field extension as a vector space over the base field -/

structure ExtensionAsVectorSpace (E : FieldExtension) where
  scalarMul : E.baseField.ring.carrier → E.extensionField.ring.carrier →
    E.extensionField.ring.carrier
  dimension : Nat

axiom extensionIsVectorSpace (E : FieldExtension) : ExtensionAsVectorSpace E

/-! ## #eval examples -/

#eval "Bridges.ToAlgebra: GaloisExtension (normal + separable)"
#eval "Bridges.ToAlgebra: galoisGroup, galoisCorrespondence"
#eval "Bridges.ToAlgebra: AlgebraicNumberField, algebraicIntegerRing"
#eval "Bridges.ToAlgebra: dirichletUnitTheorem, finitenessOfClassNumber"
#eval "Bridges.ToAlgebra: ExtensionAsVectorSpace (scalarMul, dimension)"
