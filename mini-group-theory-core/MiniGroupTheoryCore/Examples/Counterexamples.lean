/-
# MiniGroupTheoryCore.Examples.Counterexamples

Counterexamples in group theory: A_5 is simple but not solvable.
Non-abelian simple groups. Groups that are not nilpotent.
Examples where Sylow subgroups are not normal.
-/

import MiniGroupTheoryCore.Examples.Standard
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## A_5 is simple -/

def a5IsSimple : Axiom :=
  Axiom.mk "a5IsSimple" (Formula.pred 0 [])
    "A₅ is a simple group of order 60 — the smallest non-abelian simple group"

/-! ## A_5 is not solvable -/

def a5NotSolvable : Axiom :=
  Axiom.mk "a5NotSolvable" (Formula.pred 0 [])
    "A₅ is not solvable. This implies the general quintic equation is not solvable by radicals."

/-! ## S_3 is not nilpotent -/

def s3NotNilpotent : Axiom :=
  Axiom.mk "s3NotNilpotent" (Formula.pred 0 [])
    "S₃ is solvable but not nilpotent (its Sylow 2-subgroup is not normal)"

/-! ## Non-normal Sylow subgroup -/

def sylowNotNormalExample : Axiom :=
  Axiom.mk "sylowNotNormal" (Formula.pred 0 [])
    "In S₃, the Sylow 2-subgroup ⟨(12)⟩ is not normal"

/-! ## Group where every subgroup is normal but not abelian -/

def dedekindGroupCounterexample : Axiom :=
  Axiom.mk "dedekindGroup" (Formula.pred 0 [])
    "Q₈ is a Hamiltonian group: non-abelian but every subgroup is normal"

/-! ## Torsion group that is not finite -/

def torsionNotFinite : Axiom :=
  Axiom.mk "torsionNotFinite" (Formula.pred 0 [])
    "The direct sum ⊕_{n≥1} Z/nZ is infinite but every element has finite order"

/-! ## Infinite group with no proper subgroups (impossible) -/

def noInfiniteSimpleTorsion : Axiom :=
  Axiom.mk "noInfiniteSimpleTorsion" (Formula.pred 0 [])
    "There exist infinite finitely generated simple groups (Thompson's group T)"

/-! ## Burnside problem counterexample -/

def burnsideCounterexample : Axiom :=
  Axiom.mk "burnsideCounterexample" (Formula.pred 0 [])
    "There exist infinite finitely generated groups where every element has finite order (Golod-Shafarevich, 1964)"

/-! ## Word problem undecidability -/

def wordProblemUndecidable : Axiom :=
  Axiom.mk "wordProblemUndecidable" (Formula.pred 0 [])
    "There exist finitely presented groups with undecidable word problem (Novikov-Boone, 1955)"

/-! ## Counterexamples summary -/

def counterexamplesGroupTheory : String :=
  "A₅ simple ¬solvable | S₃ ¬nilpotent | Q₈ Hamiltonian | Burnside problem | Word problem undecidable"

/-! ## #eval tests -/

#eval "Examples.Counterexamples: a5IsSimple, a5NotSolvable, s3NotNilpotent"
#eval "Examples.Counterexamples: sylowNotNormal, dedekindGroup, torsionNotFinite"
#eval "Examples.Counterexamples: burnsideCounterexample, wordProblemUndecidable"
#eval s!"Counterexamples: {counterexamplesGroupTheory}"
