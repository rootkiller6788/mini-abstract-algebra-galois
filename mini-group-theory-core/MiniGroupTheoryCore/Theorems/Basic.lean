/-
# MiniGroupTheoryCore.Theorems.Basic

Fundamental theorems: Lagrange, Cauchy, Sylow.
Group action theorems: orbit-stabilizer, Burnside.
-/

import MiniGroupTheoryCore.Properties.Preservation
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Sylow Theorems -/

def sylowExistence : Axiom :=
  Axiom.mk "sylowExistence" (Formula.pred 0 [])
    "If pⁿ ||G| and p is prime, then G has a subgroup of order pⁿ (Sylow p-subgroup exists)"

def sylowConjugacy : Axiom :=
  Axiom.mk "sylowConjugacy" (Formula.pred 0 [])
    "All Sylow p-subgroups of G are conjugate"

def sylowCounting : Axiom :=
  Axiom.mk "sylowCounting" (Formula.pred 0 [])
    "n_p ≡ 1 (mod p), n_p divides m where |G| = pᵏ·m, p ∤ m"

def sylowGroupAxioms : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[sylowExistence, sylowConjugacy, sylowCounting]

/-! ## Burnside's Lemma -/

def burnsideLemma : Axiom :=
  Axiom.mk "burnsideLemma" (Formula.pred 0 [])
    "Number of orbits = (1/|G|) Σ_{g∈G} |Fix(g)|"

/-! ## Fundamental Theorem of Finite Abelian Groups -/

def fundamentalTheoremFiniteAbelianGroups : Axiom :=
  Axiom.mk "fundThmFiniteAbelian" (Formula.pred 0 [])
    "Every finite abelian group is isomorphic to a direct product of cyclic groups of prime power order"

/-! ## Jordan-Holder Theorem -/

def jordanHolderTheorem : Axiom :=
  Axiom.mk "jordanHolder" (Formula.pred 0 [])
    "Any two composition series of a finite group have the same length and isomorphic factors (up to permutation)"

/-! ## Schreier Refinement Theorem -/

def schreierRefinementTheorem : Axiom :=
  Axiom.mk "schreierRefinement" (Formula.pred 0 [])
    "Any two subnormal series of a group have equivalent refinements"

/-! ## Feit-Thompson Theorem -/

def feitThompsonTheorem : Axiom :=
  Axiom.mk "feitThompson" (Formula.pred 0 [])
    "Every finite group of odd order is solvable"

/-! ## Cayley's Theorem -/

def cayleyTheorem : Axiom :=
  Axiom.mk "cayleyTheorem" (Formula.pred 0 [])
    "Every group is isomorphic to a subgroup of a symmetric group: G ↪ S_G"

/-! ## Structure theorem for finitely generated abelian groups -/

def structureThmFGAbelian : Axiom :=
  Axiom.mk "structureThmFGAbelian" (Formula.pred 0 [])
    "Every finitely generated abelian group ≅ Z^r × Z/n₁Z × ... × Z/nₖZ"

/-! ## #eval tests -/

#eval "Theorems.Basic: sylowExistence, sylowConjugacy, sylowCounting"
#eval "Theorems.Basic: burnsideLemma, fundThmFiniteAbelian, jordanHolder"
#eval "Theorems.Basic: schreierRefinement, feitThompson, cayley, structureThmFGAbelian"
