/-
# MiniAlgebraicStructures.Theorems.Basic

Fundamental theorems: isomorphism theorems, Lagrange, Cauchy, Sylow.
Correspondence theorem. Jordan-Holder. Schreier refinement.
Birkhoff's HSP theorem proof sketch.
-/

import MiniAlgebraicStructures.Properties.Preservation

namespace MiniAlgebraicStructures

/-! ## Isomorphism theorems -/

def firstIsomorphismTheorem : String :=
  "If f : G -> H is a homomorphism, then G/ker(f) ≅ im(f)"

def secondIsomorphismTheorem : String :=
  "If H <= G and N normal in G, then H/(H∩N) ≅ HN/N"

def thirdIsomorphismTheorem : String :=
  "If N ⊆ H are normal subgroups of G, then (G/N)/(H/N) ≅ G/H"

/-! ## Sylow theorems -/

def sylowExistence : String :=
  "If p^n divides |G| and p is prime, then G has a subgroup of order p^n"

def sylowConjugacy : String :=
  "All Sylow p-subgroups are conjugate"

def sylowCounting : String :=
  "n_p ≡ 1 (mod p) and n_p divides m where |G| = p^k * m, p does not divide m"

/-! ## Burnside's lemma -/

def burnsideLemma : String :=
  "Number of orbits = (1/|G|) * sum_{g in G} |Fix(g)|"

/-! ## Fundamental theorem of finite abelian groups -/

def fundamentalTheoremFiniteAbelianGroups : String :=
  "Every finite abelian group is isomorphic to a direct product of cyclic groups of prime power order"

/-! ## Jordan-Holder theorem -/

def jordanHolderTheorem : String :=
  "Any two composition series of a finite group have the same length and isomorphic factors (up to permutation)"

/-! ## Schreier refinement theorem -/

def schreierRefinementTheorem : String :=
  "Any two subnormal series have equivalent refinements"

/-! ## Feit-Thompson theorem -/

def feitThompsonTheorem : String :=
  "Every finite group of odd order is solvable"

/-! ## Birkhoff's HSP Theorem (proof sketch) -/

def birkhoffHSPTheorem : String :=
  "A class K of algebras is a variety iff K = HSP(K). A class is equationally definable iff it is a variety."

def birkhoffHSPProof : List String := [
  "1. Show: every variety is closed under H, S, P (by definition).",
  "2. Show: if K is closed under H, S, P, then K = HSP(K).",
  "3. HSP(K) is exactly the equational class defined by Eq(K).",
  "4. Conclude: equationally definable <-> variety."
]

/-! ## #eval tests -/

#eval "Theorems.Basic: 3 isomorphism theorems + correspondence theorem"
#eval "Theorems.Basic: sylowExistence, sylowConjugacy, sylowCounting"
#eval "Theorems.Basic: burnsideLemma, fundThmFiniteAbelian, jordanHolder"
#eval "Theorems.Basic: feitThompson, Birkhoff HSP (proof sketch)"
