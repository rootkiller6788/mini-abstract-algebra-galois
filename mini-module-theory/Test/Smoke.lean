/-
# Smoke Tests -- MiniModuleTheory

Run: `lake env lean --run Test/Smoke.lean`
-/

import MiniModuleTheory

open MiniModuleTheory

#eval "══ MINI-MODULE-THEORY SMOKE TESTS ══"

/-! ## Core.Basic: Module -/

#eval "── Core.Basic: Module ──"
#check Module

/-! ## Core.Basic: Submodule -/

#eval "── Core.Basic: Submodule ──"
#check Submodule

/-! ## Core.Basic: ModuleHom -/

#eval "── Core.Basic: ModuleHom ──"
#check ModuleHom

#eval "── Core.Basic: ModuleHom.id ──"
#check ModuleHom.id

/-! ## Core.Basic: FreeModule -/

#eval "── Core.Basic: FreeModule ──"
#check FreeModule

/-! ## Core.Basic: Noetherian / Artinian -/

#eval "── Core.Basic: isNoetherian ──"
#check isNoetherian

#eval "── Core.Basic: isArtinian ──"
#check isArtinian

/-! ## Core.Basic: isExact / TensorProduct -/

#eval "── Core.Basic: isExact ──"
#check isExact

#eval "── Core.Basic: TensorProductMod ──"
#check TensorProductMod

/-! ## Core.Objects: SubmoduleSet -/

#eval "── Core.Objects: SubmoduleSet ──"
#check SubmoduleSet

/-! ## Morphisms -/

#eval "── Morphisms: Hom ──"
#check ModuleHom.comp

#eval "── Morphisms: ModuleIso ──"
#check ModuleIso

#eval "── Morphisms: areIsomorphic ──"
#check areIsomorphic

#eval "── Morphisms: moduleEquivalent ──"
#check moduleEquivalent

#eval "── Morphisms: submoduleEquivalent ──"
#check submoduleEquivalent

/-! ## Constructions stubs -/

#eval "── Constructions: DirectSum ──"
#check DirectSum

#eval "── Constructions: QuotientModule ──"
#check QuotientModule

#eval "── Constructions: Subobjects / Universal ──"
#eval "Stubs loaded"

/-! ## Properties stubs -/

#eval "── Properties: moduleRank / moduleLength ──"
#check moduleRank
#check moduleLength

#eval "── Properties: isProjective / isInjective / isFlat ──"
#check isProjective
#check isInjective
#check isFlat

#eval "── Properties: Invariants / Preservation / ClassificationData ──"
#eval "Stubs loaded"

/-! ## Theorems stubs -/

#eval "── Theorems: first/second/thirdIsoTheorem ──"
#check firstIsoTheorem
#check secondIsoTheorem
#check thirdIsoTheorem

#eval "── Theorems: nakayamaLemma / hilbertBasisTheorem / snakeLemma ──"
#check nakayamaLemma
#check hilbertBasisTheorem
#check snakeLemma

#eval "── Theorems: Basic / UniversalProperties / Classification / Main ──"
#eval "Stubs loaded"

/-! ## Bridges stubs -/

#eval "── Bridges: ToAlgebra / ToTopology / ToGeometry / ToComputation ──"
#eval "Stubs loaded"

/-! ## Examples: Standard -/

#eval "── Examples: Counterexamples ──"
#check nonFreeExample
#check nonSplitExactSequence
#check nonNoetherianExample

#eval "══ ALL MINI-MODULE-THEORY SMOKE TESTS PASSED ══"
