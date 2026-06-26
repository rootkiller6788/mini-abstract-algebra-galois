/-
# MiniAlgebraicStructures.Bridges.ToAlgebra

Bridge: algebraic structures -> deeper algebraic domains.
Representation theory, Lie algebras, homological algebra,
category theory, operads.
-/

import MiniAlgebraicStructures.Theorems.Main

namespace MiniAlgebraicStructures

/-! ## Representation theory -/

structure LinearRepresentation (G : Type u) (F V : Type u) where
  rho : G -> (V -> V)
  isHomomorphism : Prop

/-! ## Character of a representation -/

structure Character (G F : Type u) where
  rep : LinearRepresentation G F Unit
  chi : G -> F
  trace : chi = fun _ => 0

/-! ## Lie algebra -/

structure LieAlgebra (F : Type u) where
  carrier : Type u
  add : carrier -> carrier -> carrier
  zero : carrier
  neg : carrier -> carrier
  smul : F -> carrier -> carrier
  bracket : carrier -> carrier -> carrier
  alternating : ∀ (x : carrier), bracket x x = zero
  jacobi : ∀ (x y z : carrier), bracket x (bracket y z) = add (bracket (bracket x y) z) (bracket y (bracket x z))

/-! ## Universal enveloping algebra -/

def universalEnvelopingAlgebra : String :=
  "Every Lie algebra g has a universal enveloping algebra U(g) -- representations of g <-> modules over U(g)"

/-! ## Group ring -/

structure GroupRing (R G : Type u) where
  carrier := G -> R
  add : carrier -> carrier -> carrier
  mul : carrier -> carrier -> carrier
  zero : carrier
  one : carrier
  neg : carrier -> carrier

/-! ## Homological algebra connections -/

def derivedFunctors : String :=
  "Ext^n_R(M,N) and Tor_n^R(M,N) derived from projective/injective resolutions"

def groupCohomology : String :=
  "H^n(G, M) = Ext^n_{ZG}(Z, M) classifies extensions and obstructions"

/-! ## Category theory connections -/

def algebraicCategory : String :=
  "The categories Grp, Ab, Ring, R-Mod, Alg_R are all algebraic in the sense of monadic over Set"

def algebraicTheoryMonad : String :=
  "Every Lawvere theory / finitary monad on Set corresponds to a variety of algebras"

/-! ## Operad theory -/

structure Operad where
  colors : Type u
  operations : (List colors x colors) -> Type u
  composition : Prop
  identity : Prop

def operadOfAlgebras : String :=
  "The operad encoding a variety: each n-ary operation is a tree with n leaves"

/-! ## #eval tests -/

#eval "Bridges.ToAlgebra: LinearRepresentation, Character, LieAlgebra, UEA"
#eval "Bridges.ToAlgebra: GroupRing, derivedFunctors, groupCohomology"
#eval "Bridges.ToAlgebra: algebraicCategory, algebraicTheoryMonad, Operad"
