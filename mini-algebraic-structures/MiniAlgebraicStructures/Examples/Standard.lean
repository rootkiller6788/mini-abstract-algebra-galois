/-
# MiniAlgebraicStructures.Examples.Standard

Standard examples of algebraic structures:
semigroups: N under +, strings under concat.
monoids: endomorphism monoids.
groups: Z/nZ, symmetric S_n, dihedral D_n.
rings: Z, Z/nZ, matrix rings.
modules: R^n, polynomial rings.
Varieties: variety of groups, variety of rings, variety of lattices.
-/

import MiniAlgebraicStructures.Theorems.Main

namespace MiniAlgebraicStructures

/-! ## Semigroup examples -/

def naturalNumbersSemigroup : String :=
  "N = {1, 2, 3, ...} under addition; N under multiplication"

def stringSemigroup : String :=
  "Strings over an alphabet under concatenation"

/-! ## Monoid examples -/

def naturalNumbersMonoid : String :=
  "N_0 = {0, 1, 2, ...} under addition with identity 0"

def endomorphismMonoid : String :=
  "End(X) = {f : X -> X} under composition with identity id_X"

/-! ## Group examples -/

def cyclicGroup (n : Nat) : String :=
  s!"Cyclic group Z/{n}Z of order {n}"

def symmetricGroup (n : Nat) : String :=
  s!"Symmetric group S_{n} (permutations of {n} elements)"

def dihedralGroup (n : Nat) : String :=
  s!"Dihedral group D_{2*n} of order {2*n}"

/-! ## Ring examples -/

def integerRing : String :=
  "Z under + and *: the initial ring"

def integerModNRing (n : Nat) : String :=
  s!"Z/{n}Z: quotient ring of integers modulo {n}"

def matrixRing (n : Nat) : String :=
  s!"M_{n}(F): n x n matrices over a field F"

/-! ## Module examples -/

def freeModuleRn (R : Type u) (n : Nat) : String :=
  s!"R^{n}: the free R-module of rank {n}"

def polynomialModule : String :=
  "R[X] as an R-module"

/-! ## Algebra examples -/

def matrixAlgebra : String :=
  "M_n(F) as an F-algebra with matrix multiplication"

def groupAlgebra : String :=
  "F[G]: the group algebra of G over field F"

/-! ## Universal algebra examples -/

def varietyOfGroups : String :=
  "V(Groups) = HSP({groups}) = class of all groups"

def varietyOfRings : String :=
  "V(Rings) = HSP({rings}) = class of all rings"

def varietyOfLattices : String :=
  "V(Lattices) = HSP({lattices}) = class of all lattices"

def varietyOfBooleanAlgebras : String :=
  "V(BA) = HSP({2}) = class of all Boolean algebras"

/-! ## Signature examples -/

def groupSignature : Signature where
  sorts := Unit
  operations := [
    ([], ()),           -- 1 (nullary, identity)
    ([()], ()),         -- ^-1 (unary, inverse)
    ([(), ()], ())      -- * (binary, multiplication)
  ]

def ringSignature : Signature where
  sorts := Unit
  operations := [
    ([], ()),           -- 0
    ([], ()),           -- 1
    ([()], ()),         -- -
    ([(), ()], ()),     -- +
    ([(), ()], ())      -- *
  ]

/-! ## #eval tests -/

#eval "Examples.Standard: N semigroup, string semigroup, endomorphism monoid"
#eval "Examples.Standard: Z/nZ cyclic, S_n symmetric, D_n dihedral"
#eval "Examples.Standard: Z ring, Z/nZ, matrix ring, free module, polynomial module"
#eval "Examples.Standard: variety of groups/rings/lattices/boolean algebras"
#eval "Examples.Standard: groupSignature, ringSignature defined"
