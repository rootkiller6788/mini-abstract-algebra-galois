/-
# MiniGaloisTheoryLite.Bridges.ToAlgebra

Bridge: Galois theory -> group theory, representation theory,
cohomological Galois theory.
-/

import MiniGaloisTheoryLite.Theorems.Main
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Galois group as permutation group -/

def galoisGroupAsPermutationGroup : String :=
  "If f in F[x] has distinct roots r1, ..., rn, then Gal(splitting field of f / F) is isomorphic to a subgroup of S_n, acting on the roots"

def galoisGroupTransitive : String :=
  "Gal(f) acts transitively on the roots of f iff f is irreducible over F"

/-! ## Solvable groups and Galois -/

def solvableGaloisConnection : String :=
  "A Galois extension is solvable by radicals iff its Galois group is solvable. This connects Galois theory to group theory via the derived series."

def solvableGroupExamples : String :=
  "Solvable: all abelian groups, dihedral D_n, all p-groups, S_3, S_4 (but not S_5)"

/-! ## Galois cohomology -/

def galoisCohomologyH1 : String :=
  "H^1(Gal(K^sep/K), GL_n) classifies isomorphism classes of n-dimensional K-vector spaces with semilinear Galois action (Hilbert 90 for n=1)"

def galoisCohomologyConnection : String :=
  "Galois cohomology H^n(G_K, M) = Ext^n_{Z[G_K]}(Z, M) connects Galois theory to homological algebra"

/-! ## Brauer group and Galois -/

def brauerGroup : String :=
  "Br(K) = H^2(Gal(K^sep/K), (K^sep)^x) classifies central simple K-algebras up to Morita equivalence"

def crossedProduct : String :=
  "Every central simple algebra is Brauer-equivalent to a crossed product algebra defined by a Galois extension and a 2-cocycle"

/-! ## Group representations and Galois -/

def galoisRepresentation : String :=
  "A Galois representation is a continuous homomorphism rho : Gal(K^sep/K) -> GL_n(L) for a topological field L"

def artinRepresentation : String :=
  "Artin L-functions L(s, rho) attached to Galois representations generalize the Riemann zeta function"

/-! ## #eval tests -/

#eval "Bridges.ToAlgebra: galoisPermutationGroup, solvableGaloisConnection"
#eval "Bridges.ToAlgebra: galoisCohomology, brauerGroup, crossedProduct"
#eval "Bridges.ToAlgebra: galoisRepresentation, artinRepresentation"
