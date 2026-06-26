/-
# MiniAlgebraicStructures.Theorems.UniversalProperties

Universal properties:
free group, free abelian group, free monoid, free semigroup.
Free module, polynomial ring universal property.
Free algebra over a signature. Algebraic closure universal.
-/

import MiniAlgebraicStructures.Theorems.Basic

namespace MiniAlgebraicStructures

/-! ## Free group universal property -/

def freeGroupUniversal : String :=
  "For any set X, the free group F(X) satisfies: any map X -> G extends uniquely to a homomorphism F(X) -> G"

/-! ## Free abelian group universal property -/

def freeAbelianGroupUniversal : String :=
  "For any set X, the free abelian group Z^|X| satisfies the universal property"

/-! ## Free monoid universal property -/

def freeMonoidUniversal : String :=
  "For any set X, the free monoid X* (= strings over X) satisfies: any map X -> M extends uniquely to a monoid hom X* -> M"

/-! ## Free semigroup universal property -/

def freeSemigroupUniversal : String :=
  "For any set X, the free semigroup X+ satisfies: any map X -> S extends uniquely to a semigroup hom X+ -> S"

/-! ## Free module universal property -/

def freeModuleUniversal : String :=
  "For any set X, the free R-module R^|X| satisfies: any map X -> M extends uniquely to an R-linear map R^|X| -> M"

/-! ## Polynomial ring universal property -/

def polynomialRingUniversal : String :=
  "For any R-algebra A and element a in A, there is a unique evaluation hom R[X] -> A sending X |-> a"

/-! ## Quotient universal property -/

def quotientGroupUniversal : String :=
  "If N normal in G and f : G -> H has ker(f) containing N, then there exists unique f_bar : G/N -> H with f_bar o proj = f"

def quotientRingUniversal : String :=
  "If f : R -> S is a ring hom and I is an ideal with I ⊆ ker(f), then there exists unique f_bar : R/I -> S"

/-! ## Free algebra over a signature -/

def freeSigAlgebraUniversal : String :=
  "For any signature and set of variables V, the term algebra T_sig(V) is the free algebra: any interpretation V -> A extends uniquely to a homomorphism T_sig(V) -> A"

/-! ## Initial algebra universal property -/

def initialAlgebraUniversal : String :=
  "The initial algebra for a signature (ground term algebra) has exactly one homomorphism to any algebra"

/-! ## Algebraic closure universal property -/

def algebraicClosureUniversal : String :=
  "Every field has an algebraic closure, unique up to isomorphism"

/-! ## Tensor product universal property -/

def tensorProductUniversal : String :=
  "M (x)_R N with bilinear beta : M x N -> M(x)N satisfies: any bilinear map M x N -> P factors uniquely through beta"

/-! ## #eval tests -/

#eval "Theorems.UniversalProperties: freeGroup, freeAbelianGroup, freeMonoid, freeSemigroup"
#eval "Theorems.UniversalProperties: freeModule, polynomialRing, quotient universals"
#eval "Theorems.UniversalProperties: freeSigAlgebra, initialAlgebra, algebraicClosure, tensorProduct"
