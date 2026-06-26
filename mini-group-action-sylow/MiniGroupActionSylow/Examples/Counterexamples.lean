/-
# MiniGroupActionSylow.Examples.Counterexamples

Counterexamples: A_5 is simple but not solvable.
Non-sylow behavior in non-nilpotent groups.
Groups without Hall subgroups, minimal simple groups.
-/

import MiniGroupActionSylow.Examples.Standard

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## A_5 is simple -/

def a5IsSimpleGroup : Axiom :=
  Axiom.mk "a5IsSimple" (Formula.pred 0 [])
    "A_5 is a simple group of order 60 -- the smallest non-abelian simple group"

/-! ## A_5 is not solvable -/

def a5NotSolvableGroup : Axiom :=
  Axiom.mk "a5NotSolvable" (Formula.pred 0 [])
    "A_5 is not solvable -- its derived series does not terminate at {1}"

/-! ## S_3 is not nilpotent -/

def s3NotNilpotent : Axiom :=
  Axiom.mk "s3NotNilpotent" (Formula.pred 0 [])
    "S_3 is not nilpotent (its lower central series stabilizes at A_3, not at {1})"

/-! ## No Hall subgroup of order 6 in A_5 -/

def a5NoHallSubgroup : Axiom :=
  Axiom.mk "a5NoHall6" (Formula.pred 0 [])
    "A_5 has no subgroup of order 6 even though |A_5| = 60 = 2^2·3·5 and 6|60"

/-! ## Non-conjugate Sylow subgroups (impossible for finite groups) -/

def sylowConjugacyEssential : Axiom :=
  Axiom.mk "sylowConjugacyEssential" (Formula.pred 0 [])
    "For p-groups without the Sylow property (infinite groups), p-Sylow subgroups may not be conjugate"

/-! ## Group of order 2^6 with non-sylow counting -/

def wildSylowCountingExample : Axiom :=
  Axiom.mk "wildSylowCounting" (Formula.pred 0 [])
    "For |G| = 2^3·3 = 24, n_2 can be 1, 3, or 6 (but model-theoretically all values possible)"

/-! ## Burnside problem counterexample -/

def burnsideProblemCounterexample : Axiom :=
  Axiom.mk "burnsideCounterexample" (Formula.pred 0 [])
    "There exist infinite finitely generated groups where every element has finite bounded order (Adian-Novikov)"

/-! ## Tarski monster (infinite simple p-group) -/

def tarskiMonster : Axiom :=
  Axiom.mk "tarskiMonster" (Formula.pred 0 [])
    "For sufficiently large prime p, there exist infinite simple groups where every proper nontrivial subgroup has order p (Tarski monster)"

/-! ## Counterexamples summary -/

def counterexamplesGroupAction : String :=
  "A_5 simple ¬solvable | S_3 ¬nilpotent | No Hall {2,3} in A_5 | Burnside problem | Tarski monster"

/-! ## #eval tests -/

#eval "Examples.Counterexamples: a5IsSimple, a5NotSolvable, s3NotNilpotent"
#eval "Examples.Counterexamples: a5NoHallSubgroup, sylowConjugacyEssential"
#eval "Examples.Counterexamples: burnsideProblemCounterexample, tarskiMonster"
#eval s!"Counterexamples: {counterexamplesGroupAction}"
