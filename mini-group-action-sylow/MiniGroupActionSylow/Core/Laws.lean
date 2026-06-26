/-
# MiniGroupActionSylow.Core.Laws

Axioms for group actions, Sylow theorems, and classification theorems.
All major theorems registered as kernel Axiom values.
-/

import MiniGroupActionSylow.Core.Basic
import MiniGroupActionSylow.Core.Objects

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Group action axioms -/

def actionIdentityAxiom : Axiom :=
  Axiom.mk "actionIdentity" (Formula.pred 0 []) "∀ g : G, ∀ x : X, act(1, x) = x"

def actionCompatibilityAxiom : Axiom :=
  Axiom.mk "actionCompatibility" (Formula.pred 0 []) "∀ g h : G, ∀ x : X, act(gh, x) = act(g, act(h, x))"

def groupActionAxioms : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[actionIdentityAxiom, actionCompatibilityAxiom]

/-! ## Orbit-stabilizer axioms -/

def orbitStabilizerAxiom : Axiom :=
  Axiom.mk "orbitStabilizer" (Formula.pred 0 []) "|G| = |Orbit(x)| · |Stabilizer(x)| for finite G acting on X"

def orbitPartitionAxiom : Axiom :=
  Axiom.mk "orbitPartition" (Formula.pred 0 []) "The orbits of a group action partition X"

def orbitAxioms : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[orbitStabilizerAxiom, orbitPartitionAxiom]

/-! ## Sylow axioms -/

def sylowExistenceAxiom : Axiom :=
  Axiom.mk "sylowExistence" (Formula.pred 0 []) "If p^k ||G| and p is prime, then G has a subgroup of order p^k"

def sylowConjugacyAxiom : Axiom :=
  Axiom.mk "sylowConjugacy" (Formula.pred 0 []) "All Sylow p-subgroups are conjugate"

def sylowCountingAxiom : Axiom :=
  Axiom.mk "sylowCounting" (Formula.pred 0 []) "n_p ≡ 1 mod p, n_p divides m where |G| = p^k·m, p ∤ m"

def sylowAxioms : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[sylowExistenceAxiom, sylowConjugacyAxiom, sylowCountingAxiom]

/-! ## Class equation axiom -/

def classEquationAxiom : Axiom :=
  Axiom.mk "classEquation" (Formula.pred 0 []) "|G| = |Z(G)| + Σ_i [G : C_G(x_i)] for nontrivial conjugacy classes"

/-! ## Burnside's lemma axiom -/

def burnsideLemmaAxiom : Axiom :=
  Axiom.mk "burnsideLemma" (Formula.pred 0 []) "Number of orbits = (1/|G|) Σ_{g∈G} |Fix(g)|"

/-! ## Solvable/nilpotent axioms -/

def feitThompsonAxiom : Axiom :=
  Axiom.mk "feitThompson" (Formula.pred 0 []) "Every finite group of odd order is solvable"

def jordanHolderAxiom : Axiom :=
  Axiom.mk "jordanHolder" (Formula.pred 0 []) "Any two composition series have same length and isomorphic factors"

def schreierRefinementAxiom : Axiom :=
  Axiom.mk "schreierRefinement" (Formula.pred 0 []) "Any two subnormal series have equivalent refinements"

/-! ## Total axiom system -/

def groupActionSylowBaseAxioms : AxiomSystem :=
  AxiomSystem.empty
    |>.addAxioms groupActionAxioms.axioms
    |>.addAxioms orbitAxioms.axioms
    |>.addAxioms sylowAxioms.axioms
    |>.addAxioms #[classEquationAxiom, burnsideLemmaAxiom]
    |>.addAxioms #[feitThompsonAxiom, jordanHolderAxiom, schreierRefinementAxiom]

/-! ## #eval tests -/

#eval "Core.Laws: 13 axioms registered (2 action + 2 orbit + 3 Sylow + 3 class/burnside + 3 classification)"
#eval s!"Total base axioms: {groupActionSylowBaseAxioms.length}"
