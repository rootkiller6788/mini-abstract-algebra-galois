/-
# MiniGaloisTheoryLite.Bridges.ToComputation

Bridge: Galois theory -> computational algebra.
Computing Galois groups, resolvent methods,
Stauduhar's algorithm, discriminant analysis.
-/

import MiniGaloisTheoryLite.Theorems.Main
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Computing Galois groups -/

def computingGaloisGroups : String :=
  "Given f in Z[x] of degree n, determine Gal(f). Approaches: resolvent method, Stauduhar's algorithm, modular methods (reduce mod p and use Frobenius/Cebotarev)"

def resolventMethod : String :=
  "Form a resolvent polynomial whose splitting field is the same, or use linear resolvents to test for specific Galois groups"

/-! ## Stauduhar's algorithm -/

structure StauduharData where
  polynomial : List Int
  degree : Nat
  candidates : List Group
  currentGroup : Group

def stauduharAlgorithm : String :=
  "Start with Gal(f) <= S_n. Iteratively test if Gal(f) is contained in maximal subgroups of the current candidate using relative resolvents"

def stauduharRelativeResolvent : String :=
  "For H < G <= S_n, the relative resolvent distinguishes whether Gal(f) is contained in a conjugate of H"

/-! ## Discriminant and Galois group -/

def discriminantGalois : String :=
  "The discriminant Delta of f is a square in F iff Gal(f) <= A_n (i.e., Gal(f) consists of even permutations only)"

def discriminantFormula : String :=
  "Delta = product_{i<j} (r_i - r_j)^2 where r_i are the roots of f"

/-! ## Modular methods (Cebotarev density) -/

def cebotarevDensityGalois : String :=
  "The Cebotarev density theorem: the Frobenius elements of unramified primes are equidistributed in the conjugacy classes of Gal(f). This allows determining Gal(f) by factoring f mod p"

def modularGaloisGroup : String :=
  "Factor f mod p for many primes p. The cycle types of the factorization give conjugacy classes in Gal(f). Collect enough to uniquely determine the group."

/-! ## Computational systems -/

def galoisComputationalSystems : String :=
  "GAP (Group, Algorithm, Programming), Magma (computational algebra), PARI/GP (number theory), SageMath (open-source)"

def gapGaloisGroup : String :=
  "GAP command: GaloisGroup(f) computes the Galois group of a rational polynomial using Stauduhar's algorithm"

/-! ## Small Galois groups database -/

def transitiveGroupDatabase : String :=
  "The database of transitive groups of degree n <= 31 (Hulpke). Each transitive subgroup of S_n has a label nTk."

def galoisGroupDatabase : String :=
  "For each transitive group, known realizable as Galois group over Q or not (Kluners-Malle database)"

/-! ## #eval tests -/

#eval "Bridges.ToComputation: resolventMethod, Stauduhar algorithm"
#eval "Bridges.ToComputation: discriminantGalois, modularGaloisGroup, Cebotarev"
#eval "Bridges.ToComputation: GAP/Magma/Sage, transitiveGroupDatabase"
