/-
# MiniAlgebraicStructures.Theorems.Main

Pillar theorems and total axiom inventory for algebraic structures.
-/

import MiniAlgebraicStructures.Theorems.Classification

namespace MiniAlgebraicStructures

/-! ## Pillar Theorems -/

structure Pillars where
  birkhoffHSP : String
  isomorphismTheorems : String
  lagrangeTheorem : String
  sylowTheorems : String
  jordanHolder : String
  maltsevConditions : String
  jonssonLemma : String

def pillars : Pillars where
  birkhoffHSP := birkhoffHSPFull
  isomorphismTheorems := firstIsomorphismTheorem
  lagrangeTheorem := lagrangeTheorem
  sylowTheorems := sylowExistence
  jordanHolder := jordanHolderTheorem
  maltsevConditions := maltsevCondition
  jonssonLemma := jonssonLemma

/-! ## Total axiom inventory -/

def algebraicStructuresTotalAxioms : List String :=
  algebraicStructuresAxioms ++
  [
    firstIsomorphismTheorem, secondIsomorphismTheorem, thirdIsomorphismTheorem,
    sylowExistence, sylowConjugacy, sylowCounting,
    burnsideLemma, fundamentalTheoremFiniteAbelianGroups,
    jordanHolderTheorem, schreierRefinementTheorem, feitThompsonTheorem,
    birkhoffHSPFull,
    freeGroupUniversal, freeAbelianGroupUniversal, freeMonoidUniversal, freeSemigroupUniversal,
    freeModuleUniversal, polynomialRingUniversal,
    quotientGroupUniversal, quotientRingUniversal,
    freeSigAlgebraUniversal, initialAlgebraUniversal,
    algebraicClosureUniversal, tensorProductUniversal,
    maltsevCondition, maltsevTerm,
    congruencePermutable, congruenceDistributive, congruenceModular,
    jonssonLemma, bakersTheorem, lyndonsTheorem,
    mckenzieCharacterization, maltsevTypeClassification,
    ClassificationOfFiniteSimpleGroups
  ]

/-! ## #eval tests -/

#eval "Theorems.Main: 7 pillar theorems"
#eval s!"Total algebraic structures axioms: {algebraicStructuresTotalAxioms.length}"
