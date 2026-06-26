/-
# MiniGroupTheoryCore.Theorems.Main

Pillar theorems and total axiom inventory for group theory.
9 pillar theorems spanning structure, classification, and universal properties.
-/

import MiniGroupTheoryCore.Theorems.Classification
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## 9 Pillar Theorems -/

def pillarLagrange : Axiom := lagrangeTheorem
def pillarCauchy : Axiom := cauchyTheorem
def pillarSylow : AxiomSystem := sylowGroupAxioms
def pillarJordanHolder : Axiom := jordanHolderTheorem
def pillarBurnside : Axiom := burnsideLemma
def pillarFeitThompson : Axiom := feitThompsonTheorem
def pillarFundThmAbelian : Axiom := fundamentalTheoremFiniteAbelianGroups
def pillarCFSG : Axiom := classificationFiniteSimpleGroups
def pillarCayley : Axiom := cayleyTheorem

def pillarTheorems : List (String × Axiom) := [
  ("Lagrange", pillarLagrange),
  ("Cauchy", pillarCauchy),
  ("Sylow Existence", sylowExistence),
  ("Sylow Conjugacy", sylowConjugacy),
  ("Sylow Counting", sylowCounting),
  ("Jordan-Holder", pillarJordanHolder),
  ("Burnside", pillarBurnside),
  ("Feit-Thompson", pillarFeitThompson),
  ("Fund Thm Finite Abelian", pillarFundThmAbelian),
  ("CFSG", pillarCFSG),
  ("Cayley", pillarCayley)
]

/-! ## Total axiom inventory -/

def groupTheoryTotalAxioms : AxiomSystem :=
  AxiomSystem.empty
    |>.addAxioms groupAxioms.axioms
    |>.addAxioms groupDerivedLaws.axioms
    |>.addAxioms sylowGroupAxioms.axioms
    |>.addAxioms #[lagrangeCorollary, classEquation, burnsideLemma,
      fundamentalTheoremFiniteAbelianGroups, jordanHolderTheorem, schreierRefinementTheorem,
      feitThompsonTheorem, cayleyTheorem, structureThmFGAbelian,
      classificationFiniteSimpleGroups, groupsOfOrderP, groupsOfOrderP2, groupsOfOrder2P,
      groupsOfOrder8, groupsOfOrder12, nilpotentClassification, solvableCharacterization,
      groupExtensionClassification]

/-! ## #eval tests -/

#eval "Theorems.Main: 9 pillar theorems (Lagrange, Cauchy, Sylow, Jordan-Holder, Burnside, Feit-Thompson, FundThmAbelian, CFSG, Cayley)"
#eval s!"Total group theory axioms: {groupTheoryTotalAxioms.length}"
#eval s!"Pillar count: {pillarTheorems.length}"
