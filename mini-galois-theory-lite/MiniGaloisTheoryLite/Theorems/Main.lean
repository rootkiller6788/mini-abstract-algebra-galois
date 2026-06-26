/-
# MiniGaloisTheoryLite.Theorems.Main

Pillar theorems and total axiom inventory for Galois Theory Lite.
-/

import MiniGaloisTheoryLite.Theorems.Classification
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Pillar Theorems -/

structure Pillars where
  fundamentalTheoremGalois : String
  solvabilityByRadicals : String
  insolvabilityOfQuintic : String
  cyclotomicGaloisGroup : String
  finiteFieldsClassification : String
  kummerTheory : String
  artinSchreierTheorem : String

def pillars : Pillars where
  fundamentalTheoremGalois := fundamentalTheoremGalois
  solvabilityByRadicals := solvabilityByRadicals
  insolvabilityOfQuintic := insolvabilityOfQuintic
  cyclotomicGaloisGroup := cyclotomicGaloisGroup
  finiteFieldsClassification := finiteFieldsClassification
  kummerTheory := kummerTheory
  artinSchreierTheorem := artinSchreierTheorem

/-! ## Total axiom inventory -/

def galoisTheoryTotalAxioms : List String :=
  galoisTheoryAxioms
  ++ [towerLaw]
  ++ [galoisOrderEqualsDegree]
  ++ [normalityCriterionSplitting]
  ++ [separabilityCriterionSimple]
  ++ [galoisCriterion]
  ++ [galoisCriterionFixedField]
  ++ [artinsTheoremStatement]
  ++ [dedekindIndependence]
  ++ [primitiveElementTheorem]
  ++ [fundamentalTheoremOfAlgebra]
  ++ [normalBasisTheorem]
  ++ [hilbertTheorem90]
  ++ [splittingFieldUniversal]
  ++ [normalClosureUniversal]
  ++ [galoisClosureUniversal]
  ++ [algebraicClosureUniversal]
  ++ [embeddingExtensionUniversal]
  ++ [irreducibleSplitsUniversal]
  ++ [fundamentalTheoremGalois]
  ++ [galoisInclusionReversing]
  ++ [galoisNormalCorrespondence]
  ++ [solvabilityByRadicals]
  ++ [insolvabilityOfQuintic]
  ++ [cyclotomicGaloisGroup]
  ++ [finiteFieldsClassification]
  ++ [finiteFieldGalois]
  ++ [kummerTheory]
  ++ [artinSchreierTheorem]
  ++ [inverseGaloisProblem]
  ++ [knownGaloisGroupsOverQ]

/-! ## Pillar count -/

def pillarCount : Nat := 7

def totalAxiomCount : Nat :=
  galoisTheoryTotalAxioms.length

/-! ## #eval tests -/

#eval "Theorems.Main: 7 pillar theorems"
#eval s!"Pillars: FTGT, Solvability, Quintic, Cyclotomic, FiniteFields, Kummer, Artin-Schreier"
#eval s!"Total Galois theory axioms: {galoisTheoryTotalAxioms.length}"
