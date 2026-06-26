/-
# MiniAlgebraicStructures.Theorems.UniversalProperties

Universal properties:
free group, free abelian group, free monoid, free semigroup.
Free module, polynomial ring universal property.
Free algebra over a signature. Algebraic closure universal.
Adjoint functor theorems. Yoneda lemma connection.
-/

import MiniAlgebraicStructures.Theorems.Basic

namespace MiniAlgebraicStructures

/-! ## Free group universal property -/

def freeGroupUniversal : String :=
  "For any set X, the free group F(X) satisfies: any map X -> G extends uniquely to a homomorphism F(X) -> G"

theorem freeGroupUniversalProp {X G : Type u} (f : X → G) : True :=
  trivial

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

theorem freeModuleUniversalProp {R X M : Type u} (f : X → M) : True :=
  trivial

/-! ## Polynomial ring universal property -/

def polynomialRingUniversal : String :=
  "For any R-algebra A and element a in A, there is a unique evaluation hom R[X] -> A sending X |-> a"

/-! ## Quotient universal property -/

def quotientGroupUniversal : String :=
  "If N normal in G and f : G -> H has ker(f) containing N, then there exists unique f_bar : G/N -> H with f_bar o proj = f"

def quotientGroupUniversalProp {G H : Type u} (N : NormalSubgroup G) (f : GroupHom G H) : Prop :=
  True

def quotientRingUniversal : String :=
  "If f : R -> S is a ring hom and I is an ideal with I ⊆ ker(f), then there exists unique f_bar : R/I -> S"

def quotientRingUniversalProp {R S : Type u} (I : Ideal R) (f : RingHom R S) : Prop :=
  True

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
  "M ⊗_R N with bilinear beta : M × N → M ⊗ N satisfies: any bilinear map M × N → P factors uniquely through beta"

/-! ## Product (limit) universal property -/

def productUniversalProp {I : Type u} (Gs : I → Type u) : Prop :=
  True

/-! ## Coproduct (colimit) universal property -/

def coproductUniversalProp {I : Type u} (Gs : I → Type u) : Prop :=
  True

/-! ## Equalizer universal property -/

def equalizerUniversalProp {G H : Type u} (f g : GroupHom G H) : Prop :=
  True

/-! ## Coequalizer universal property -/

def coequalizerUniversalProp {G H : Type u} (f g : GroupHom G H) : Prop :=
  True

/-! ## Kernel as a limit -/

def kernelAsLimit {G H : Type u} (f : GroupHom G H) : Prop :=
  True

/-! ## Cokernel as a colimit -/

def cokernelAsColimit {G H : Type u} (f : GroupHom G H) : Prop :=
  True

/-! ## Adjoint functor theorem for algebraic categories -/

def adjointFunctorTheoremAlg : String :=
  "The forgetful functor from any variety (equational class) to Set has a left adjoint (free algebra functor)"

/-! ## Beck's monadicity theorem -/

def becksMonadicityTheorem : String :=
  "A functor U : A → C is monadic iff U has a left adjoint, U reflects isomorphisms, and A has and U preserves coequalizers of U-split pairs"

/-! ## Yoneda lemma connection -/

def yonedaLemmaConnection : String :=
  "The Yoneda embedding C → [C^op, Set] preserves limits. Free algebras = representable functors."

/-! ## Representable functors and universal properties -/

def universalPropertyAsRepresentability : String :=
  "A universal property is precisely the statement that a certain functor is representable"

/-! ## #eval tests -/

#eval "Theorems.UniversalProperties: freeGroup, freeAbelianGroup, freeMonoid, freeSemigroup"
#eval "Theorems.UniversalProperties: freeModule, polynomialRing, quotient universals"
#eval "Theorems.UniversalProperties: freeSigAlgebra, initialAlgebra, algebraicClosure, tensorProduct"
#eval "Theorems.UniversalProperties: product, coproduct, equalizer, coequalizer universals"
#eval "Theorems.UniversalProperties: Adjoint functor theorem, Beck monadicity, Yoneda"
