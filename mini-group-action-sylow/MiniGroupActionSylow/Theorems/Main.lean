/-
# MiniGroupActionSylow.Theorems.Main

Pillar theorems and total axiom inventory.
-/

import MiniGroupActionSylow.Theorems.Classification

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Pillar Theorems -/

structure Pillars where
  orbitStabilizer : Axiom
  sylowFirst : Axiom
  sylowSecond : Axiom
  sylowThird : Axiom
  classEquation : Axiom
  burnsideLemma : Axiom
  jordanHolder : Axiom
  feitThompson : Axiom
  classificationFiniteSimple : Axiom

def pillars : Pillars where
  orbitStabilizer := orbitStabilizerTheoremAxiom
  sylowFirst := sylowFirstTheoremAxiom
  sylowSecond := sylowSecondTheoremAxiom
  sylowThird := sylowThirdTheoremAxiom
  classEquation := classEquationAxiom''
  burnsideLemma := burnsideLemmaAxiom'
  jordanHolder := jordanHolderTheoremAxiom
  feitThompson := feitThompsonTheoremAxiom
  classificationFiniteSimple := classificationFiniteSimpleGroupsTheorem

/-! ## Total axiom inventory -/

def groupActionSylowTotalAxioms : AxiomSystem :=
  AxiomSystem.empty
    |>.addAxioms groupActionSylowBaseAxioms.axioms
    |>.addAxioms #[lagrangeTheoremAction, lagrangeCorollaryAction, cauchyGroupTheorem]
    |>.addAxioms #[orbitStabilizerTheoremAxiom, orbitBijection]
    |>.addAxioms #[sylowFirstTheoremAxiom, sylowSecondTheoremAxiom, sylowThirdTheoremAxiom]
    |>.addAxioms #[burnsideLemmaAxiom', classEquationAxiom'', conjugacyClassSizeFormula]
    |>.addAxioms #[pGroupCenterTheorem, pGroupCenterNontrivial]
    |>.addAxioms #[semidirectProductUniversal, freeGroupUniversal, groupPresentationUniversal]
    |>.addAxioms #[orbitCategoryUniversal, equivariantYoneda, burnsideRingUniversal, gSetTensorHomAdjunction]
    |>.addAxioms #[jordanHolderTheoremAxiom, schreierRefinementTheoremAxiom]
    |>.addAxioms #[feitThompsonTheoremAxiom, burnsidePaQbTheorem]
    |>.addAxioms #[frobeniusGroupTheorem, schurZassenhausTheoremAxiom]
    |>.addAxioms #[hallsTheorem, wielandtsTheorem, thompsonTransferLemma]
    |>.addAxioms #[classificationFiniteSimpleGroupsTheorem]
    |>.addAxioms #[cayleyTheorem, frobeniusTheorem, burnsideNormalPComplement]
    |>.addAxioms #[burnsidesPaQbTheorem, alperinFusionTheorem]
    |>.addAxioms #[schurZassenhausTheorem]

/-! ## #eval tests -/

#eval "Theorems.Main: 9 pillar theorems"
#eval s!"Total group action + Sylow axioms: {groupActionSylowTotalAxioms.length}"
