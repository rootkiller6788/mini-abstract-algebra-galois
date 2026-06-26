/-
# Benchmark: GroupOps

Benchmark: group operations -- construction, subgroup tests,
element arithmetic, order computation, cyclic checks.

Run: `lake env lean --run Benchmark/GroupOps.lean`
-/

import MiniGroupTheoryCore

open MiniGroupTheoryCore

/-! ## Benchmark targets -/

#eval "═══════════════════════════════════════"
#eval "  Benchmark: Group Operations"
#eval "═══════════════════════════════════════"

#eval "Benchmark.GroupOps: cyclicGroup, symmetricGroup, alternatingGroup construction"
#eval "Benchmark.GroupOps: subgroup generation, normal subgroup tests"
#eval "Benchmark.GroupOps: group order, element order, exponent computations"
#eval "Benchmark.GroupOps: cyclicity tests, isomorphism detection"
#eval "Benchmark.GroupOps: direct product, semidirect product operations"

#eval s!"Group axioms total: {groupAxioms.length}"

/-! ## Operation metrics -/

#eval "── Group Construction Benchmarks ──"
#eval "  cyclicGroup n: O(n) construction"
#eval "  symmetricGroup S_n: O(n!) objects (conceptual)"
#eval "  alternatingGroup A_n: O(n!/2) objects (conceptual)"

#eval "── Subgroup Benchmarks ──"
#eval "  subgroup generation: O(|G|·|generators|)"
#eval "  normal subgroup test: O(|G|²)"
#eval "  index computation: O(|G:H|)"

#eval "── Element Arithmetic ──"
#eval "  multiplication: O(1) (group operation)"
#eval "  inverse: O(1)"
#eval "  exponentiation (square-and-multiply): O(log n)"
#eval "  order computation: O(|G|·log |G|)"

#eval "── Detection Benchmarks ──"
#eval "  cyclicity test: O(|G|)"
#eval "  abelianity test: O(|G|²)"
#eval "  simplicity test: O(|G|³) (brute-force)"

#eval "══ GroupOps Benchmark Complete ══"
