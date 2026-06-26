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

def groupActionSylowTotalAxioms : AxiomCatalog :=
  emptyCatalog
    |>.addMany groupActionSylowBaseAxioms.axioms
    |>.addMany #[lagrangeTheoremAction, lagrangeCorollaryAction, cauchyGroupTheorem]
    |>.addMany #[orbitStabilizerTheoremAxiom, orbitBijection]
    |>.addMany #[sylowFirstTheoremAxiom, sylowSecondTheoremAxiom, sylowThirdTheoremAxiom]
    |>.addMany #[burnsideLemmaAxiom', classEquationAxiom'', conjugacyClassSizeFormula]
    |>.addMany #[pGroupCenterTheorem, pGroupCenterNontrivial]
    |>.addMany #[semidirectProductUniversal, freeGroupUniversal, groupPresentationUniversal]
    |>.addMany #[orbitCategoryUniversal, equivariantYoneda, burnsideRingUniversal, gSetTensorHomAdjunction]
    |>.addMany #[jordanHolderTheoremAxiom, schreierRefinementTheoremAxiom]
    |>.addMany #[feitThompsonTheoremAxiom, burnsidePaQbTheorem]
    |>.addMany #[frobeniusGroupTheorem, schurZassenhausTheoremAxiom]
    |>.addMany #[hallsTheorem, wielandtsTheorem, thompsonTransferLemma]
    |>.addMany #[classificationFiniteSimpleGroupsTheorem]
    |>.addMany #[cayleyTheorem, frobeniusTheorem, burnsideNormalPComplement]
    |>.addMany #[burnsidesPaQbTheorem, alperinFusionTheorem]
    |>.addMany #[schurZassenhausTheorem]

/-! ## #eval tests -/

#eval "Theorems.Main: 9 pillar theorems"
#eval s!"Total group action + Sylow axioms: {groupActionSylowTotalAxioms.size}"


/-! ============================================================
## Main Theorem Catalog and Summary
============================================================ -/

/-- Structure collecting all pillar theorems. -/
structure PillarTheorems where
  orbitStabilizerTheorem : AxiomEntry
  sylowFirstTheorem : AxiomEntry
  sylowSecondTheorem : AxiomEntry
  sylowThirdTheorem : AxiomEntry
  classEquationTheorem : AxiomEntry
  burnsideLemmaTheorem : AxiomEntry
  jordanHolderTheorem : AxiomEntry
  feitThompsonTheorem : AxiomEntry
  classificationFiniteSimple : AxiomEntry
  deriving Repr

/-- The full set of pillar theorems as axiom entries. -/
def pillarTheoremsCatalog : PillarTheorems where
  orbitStabilizerTheorem := mkA "orbitStabilizer" "|G| = |Orbit(x)| * |Stab(x)|"
  sylowFirstTheorem := mkA "sylowFirst" "Existence of Sylow p-subgroups"
  sylowSecondTheorem := mkA "sylowSecond" "Conjugacy of Sylow p-subgroups"
  sylowThirdTheorem := mkA "sylowThird" "n_p = 1 mod p, n_p divides |G|/p^a"
  classEquationTheorem := mkA "classEquation" "|G| = |Z(G)| + sum [G:C_G(g_i)]"
  burnsideLemmaTheorem := mkA "burnsideLemma" "#orbits = (1/|G|) * sum |Fix(g)|"
  jordanHolderTheorem := mkA "jordanHolder" "Composition series unique up to permutation"
  feitThompsonTheorem := mkA "feitThompson" "Odd-order groups are solvable"
  classificationFiniteSimple := mkA "CFSG" "Classification of finite simple groups"

/-- Count total number of pillar theorems. -/
def pillarCount : Nat := 9

/-- Main theorem inventory: all axioms collected. -/
def mainTheoremInventory : AxiomCatalog :=
  emptyCatalog
    |>.addMany groupActionAxioms.entries
    |>.addMany orbitAxioms.entries
    |>.addMany sylowAxioms.entries
    |>.addMany [classEquationAxiom, burnsideLemmaAxiom]
    |>.addMany [feitThompsonAxiom, jordanHolderAxiom, schreierRefinementAxiom]

#eval "Theorems.Main expanded: PillarTheorems catalog, main inventory"
#eval s!"Pillar count: {pillarCount}"
#eval s!"Main inventory size: {mainTheoremInventory.size}"
