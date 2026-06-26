/-
# MiniGroupTheoryCore.Bridges.ToComputation

Bridge: group theory → computational group theory.
Algorithms: Schreier-Sims, Todd-Coxeter, coset enumeration,
group isomorphism testing, small group database.
-/

import MiniGroupTheoryCore.Bridges.ToGeometry
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Schreier-Sims algorithm -/

def schreierSimsAlgorithm : Axiom :=
  Axiom.mk "schreierSims" (Formula.pred 0 [])
    "Schreier-Sims computes a base and strong generating set for a permutation group, giving |G|, membership testing, and more in O(n⁵) time"

/-! ## Todd-Coxeter coset enumeration -/

def toddCoxeterAlgorithm : Axiom :=
  Axiom.mk "toddCoxeter" (Formula.pred 0 [])
    "Todd-Coxeter algorithm enumerates cosets of a subgroup H ≤ G given a presentation of G"

/-! ## Group order computation -/

def groupOrderComputationAxiom : Axiom :=
  Axiom.mk "groupOrderComputation" (Formula.pred 0 [])
    "|G| can be computed for permutation groups via orbit-stabilizer; for finitely presented groups via coset enumeration (if finite)"

/-! ## Conjugacy class computation -/

def conjugacyClassAlgorithm : Axiom :=
  Axiom.mk "conjugacyClassAlgorithm" (Formula.pred 0 [])
    "Conjugacy classes of permutation groups can be computed via orbit algorithms on the group acting on itself by conjugation"

/-! ## Group isomorphism problem -/

def groupIsomorphismProblem : Axiom :=
  Axiom.mk "groupIsomorphism" (Formula.pred 0 [])
    "The group isomorphism problem (deciding if two groups given by presentations are isomorphic) is undecidable in general, but solvable for many classes"

/-! ## Small groups database -/

def smallGroupDatabase : Axiom :=
  Axiom.mk "smallGroupDatabase" (Formula.pred 0 [])
    "The Small Groups library classifies all groups of order ≤ 2000 (excluding order 1024). GAP contains this database."

def numberOfGroupsOfOrder : Axiom :=
  Axiom.mk "numberOfGroups" (Formula.pred 0 [])
    "Known counts: |order 16| = 14 groups, |order 32| = 51, |order 64| = 267, |order 128| = 2328, |order 256| = 56092, |order 512| = 10494213, |order 1024| = 49487365422"

/-! ## LLL algorithm and group theory -/

def llAlgorithm : Axiom :=
  Axiom.mk "LLL" (Formula.pred 0 [])
    "The LLL lattice reduction algorithm is used in computing with integral group rings, unit groups, and group cohomology"

/-! ## GAP/Computer algebra bridge -/

def gapSystemAxiom : Axiom :=
  Axiom.mk "GAP" (Formula.pred 0 [])
    "GAP (Groups, Algorithms, Programming) is the standard system for computational group theory. It implements Schreier-Sims, coset enumeration, and the Small Groups library."

/-! ## Machine learning in group theory -/

def mlGroupTheoryAxiom : Axiom :=
  Axiom.mk "mlGroupTheory" (Formula.pred 0 [])
    "Machine learning has been applied to: predicting group properties from presentations, solving the group isomorphism problem for certain classes, and discovering new conjectures"

/-! ## #eval tests -/

#eval "Bridges.ToComputation: schreierSims, toddCoxeter, groupOrderComputation"
#eval "Bridges.ToComputation: conjugacyClassAlgorithm, groupIsomorphismProblem"
#eval "Bridges.ToComputation: smallGroupDatabase, LLL, GAP, mlGroupTheory"
