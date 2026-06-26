/-
# MiniRingTheoryCore Main

Entry point that prints package metadata and key type summaries
for Ring, RingHom, Ideal, QuotientRing, and related concepts.
-/

import MiniRingTheoryCore

open MiniRingTheoryCore

def main : IO Unit := do
  IO.println "══════════════════════════════════════════════"
  IO.println "  MiniRingTheoryCore v0.1.0"
  IO.println "  Ring Theory Core Package"
  IO.println "══════════════════════════════════════════════"
  IO.println ""
  IO.println "  Core definitions:"
  IO.println "    Ring         : carrier + add/zero/neg/mul/one + axioms"
  IO.println "    RingHom      : structure-preserving map between rings"
  IO.println "    RingHom.id   : identity homomorphism"
  IO.println "    RingHom.comp : composition of homomorphisms"
  IO.println "    Ideal        : additive subgroup closed under smul"
  IO.println "    Ideal.IsPrime   : proper nonzero, ab in I => a in I or b in I"
  IO.println "    Ideal.IsMaximal : proper, not contained in any proper ideal"
  IO.println "    QuotientRing : R/I with projection and universal property"
  IO.println "    isIntegralDomain : product zero implies a factor zero"
  IO.println "    isUnit       : element with two-sided inverse"
  IO.println "    isZeroDivisor : nonzero element with nonzero annihilator"
  IO.println ""
  IO.println "  Sub-packages:"
  IO.println "    Core          : Ring, RingHom, Ideal, QuotientRing, Laws"
  IO.println "    Morphisms     : RingEmbedding, RingIso, Equivalence"
  IO.println "    Constructions : Subobjects, Quotients, Products"
  IO.println "    Properties    : Invariants, Preservation, Classification"
  IO.println "    Theorems      : Basic, UniversalProperties,"
  IO.println "                    Classification, Main"
  IO.println "    Examples      : Standard, Counterexamples"
  IO.println "    Bridges       : ToAlgebra, ToTopology,"
  IO.println "                    ToGeometry, ToComputation"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
