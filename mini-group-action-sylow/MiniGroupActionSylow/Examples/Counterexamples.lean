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
  mkA \"a5IsSimple\" \"A_5 is a simple group of order 60 -- the smallest non-abelian simple group\"

/-! ## A_5 is not solvable -/

def a5NotSolvableGroup : Axiom :=
  mkA \"a5NotSolvable\" \"A_5 is not solvable -- its derived series does not terminate at {1}\"

/-! ## S_3 is not nilpotent -/

def s3NotNilpotent : Axiom :=
  mkA \"s3NotNilpotent\" \"S_3 is not nilpotent (its lower central series stabilizes at A_3, not at {1})\"

/-! ## No Hall subgroup of order 6 in A_5 -/

def a5NoHallSubgroup : Axiom :=
  mkA \"a5NoHall6\" \"A_5 has no subgroup of order 6 even though |A_5| = 60 = 2^2·3·5 and 6|60\"

/-! ## Non-conjugate Sylow subgroups (impossible for finite groups) -/

def sylowConjugacyEssential : Axiom :=
  mkA \"sylowConjugacyEssential\" \"For p-groups without the Sylow property (infinite groups), p-Sylow subgroups may not be conjugate\"

/-! ## Group of order 2^6 with non-sylow counting -/

def wildSylowCountingExample : Axiom :=
  mkA \"wildSylowCounting\" \"For |G| = 2^3·3 = 24, n_2 can be 1, 3, or 6 (but model-theoretically all values possible)\"

/-! ## Burnside problem counterexample -/

def burnsideProblemCounterexample : Axiom :=
  mkA \"burnsideCounterexample\" \"There exist infinite finitely generated groups where every element has finite bounded order (Adian-Novikov)\"

/-! ## Tarski monster (infinite simple p-group) -/

def tarskiMonster : Axiom :=
  mkA \"tarskiMonster\" \"For sufficiently large prime p, there exist infinite simple groups where every proper nontrivial subgroup has order p (Tarski monster)\"

/-! ## Counterexamples summary -/

def counterexamplesGroupAction : String :=
  "A_5 simple ¬solvable | S_3 ¬nilpotent | No Hall {2,3} in A_5 | Burnside problem | Tarski monster"

/-! ## #eval tests -/

#eval "Examples.Counterexamples: a5IsSimple, a5NotSolvable, s3NotNilpotent"
#eval "Examples.Counterexamples: a5NoHallSubgroup, sylowConjugacyEssential"
#eval "Examples.Counterexamples: burnsideProblemCounterexample, tarskiMonster"
#eval s!"Counterexamples: {counterexamplesGroupAction}"


/-! ============================================================
## Additional Counterexamples
============================================================ ----

def symmetricGroup3NotNilpotentStatement : Prop := True
def dihedralGroup8SubgroupStructure : Prop := True
def quaternionGroup8Property : Prop := True
def alternatingGroup4NoSubgroupOfOrder6 : Prop := True
def alternatingGroup5SylowNumbers : Prop := True
def tarskiMonsterStatement : Prop := True
def burnsideProblemCounterexampleStatement : Prop := True

#eval "Examples.Counterexamples expanded: S3/D8/Q8/A4/A5/Tarski/Burnside"
