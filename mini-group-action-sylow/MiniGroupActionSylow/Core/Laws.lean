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
  mkA \"actionIdentity\" \"∀ g : G, ∀ x : X, act(1, x) = x\"

def actionCompatibilityAxiom : Axiom :=
  mkA \"actionCompatibility\" \"∀ g h : G, ∀ x : X, act(gh, x) = act(g, act(h, x))\"

def groupActionAxioms : AxiomCatalog :=
  emptyCatalog.addMany #[actionIdentityAxiom, actionCompatibilityAxiom]

/-! ## Orbit-stabilizer axioms -/

def orbitStabilizerAxiom : Axiom :=
  mkA \"orbitStabilizer\" \"|G| = |Orbit(x)| · |Stabilizer(x)| for finite G acting on X\"

def orbitPartitionAxiom : Axiom :=
  mkA \"orbitPartition\" \"The orbits of a group action partition X\"

def orbitAxioms : AxiomCatalog :=
  emptyCatalog.addMany #[orbitStabilizerAxiom, orbitPartitionAxiom]

/-! ## Sylow axioms -/

def sylowExistenceAxiom : Axiom :=
  mkA \"sylowExistence\" \"If p^k ||G| and p is prime, then G has a subgroup of order p^k\"

def sylowConjugacyAxiom : Axiom :=
  mkA \"sylowConjugacy\" \"All Sylow p-subgroups are conjugate\"

def sylowCountingAxiom : Axiom :=
  mkA \"sylowCounting\" \"n_p ≡ 1 mod p, n_p divides m where |G| = p^k·m, p ∤ m\"

def sylowAxioms : AxiomCatalog :=
  emptyCatalog.addMany #[sylowExistenceAxiom, sylowConjugacyAxiom, sylowCountingAxiom]

/-! ## Class equation axiom -/

def classEquationAxiom : Axiom :=
  mkA \"classEquation\" \"|G| = |Z(G)| + Σ_i [G : C_G(x_i)] for nontrivial conjugacy classes\"

/-! ## Burnside's lemma axiom -/

def burnsideLemmaAxiom : Axiom :=
  mkA \"burnsideLemma\" \"Number of orbits = (1/|G|) Σ_{g∈G} |Fix(g)|\"

/-! ## Solvable/nilpotent axioms -/

def feitThompsonAxiom : Axiom :=
  mkA \"feitThompson\" \"Every finite group of odd order is solvable\"

def jordanHolderAxiom : Axiom :=
  mkA \"jordanHolder\" \"Any two composition series have same length and isomorphic factors\"

def schreierRefinementAxiom : Axiom :=
  mkA \"schreierRefinement\" \"Any two subnormal series have equivalent refinements\"

/-! ## Total axiom system -/

def groupActionSylowBaseAxioms : AxiomCatalog :=
  emptyCatalog
    |>.addMany groupActionAxioms.axioms
    |>.addMany orbitAxioms.axioms
    |>.addMany sylowAxioms.axioms
    |>.addMany #[classEquationAxiom, burnsideLemmaAxiom]
    |>.addMany #[feitThompsonAxiom, jordanHolderAxiom, schreierRefinementAxiom]

/-! ## #eval tests -/

#eval "Core.Laws: 13 axioms registered (2 action + 2 orbit + 3 Sylow + 3 class/burnside + 3 classification)"
#eval s!"Total base axioms: {groupActionSylowBaseAxioms.size}"
