/-
# Computation.Basic

Computational group theory helpers: order computation,
subgroup enumeration, group element arithmetic.

Run: `lake env lean --run Computation/Basic.lean`
-/

import MiniGroupTheoryCore

open MiniGroupTheoryCore

/-! ## Computation stubs for group theory -/

#eval "═══════════════════════════════════════"
#eval "  Group Theory: Basic Computations"
#eval "═══════════════════════════════════════"

#eval "Computation.Basic: Group order computation stub"
#eval "Computation.Basic: Subgroup lattice enumeration stub"
#eval "Computation.Basic: Element exponentiation fast algorithm stub"
#eval "Computation.Basic: Group element comparison / equality testing"
#eval "Computation.Basic: Coset enumeration (Todd-Coxeter) interface"

/-! ## Algorithm descriptions -/

#eval "── Order Computation ──"
#eval "  Brute-force: multiply element by itself until identity (O(|G|))"
#eval "  Optimized: baby-step giant-step (O(√|G|))"
#eval "  Shanks' algorithm: O(√n) for order in cyclic group"

#eval "── Subgroup Lattice ──"
#eval "  All subgroups via closure under multiplication (O(2^|G|) worst case)"
#eval "  Conjugacy classes of subgroups: O(|G|²·s) where s = #subgroups"
#eval "  Normal subgroups: filter by conjugacy invariance"

#eval "── Element Arithmetic ──"
#eval "  Square-and-multiply exponentiation: O(log exponent)"
#eval "  Discrete log (generic): O(√|G|) with baby-step giant-step"
#eval "  Conjugacy test: g ~ h? iff ∃k: kgk⁻¹ = h"

#eval "── Coset Enumeration ──"
#eval "  Todd-Coxeter algorithm: O(|G:H|²) for finite index"
#eval "  Coset table construction: O(|G|·|rels|·|gens|)"
#eval "  Standardization: O(|cosets|·|generators|)"

#eval s!"Group axioms loaded: {groupAxioms.length}"
#eval "══ Basic Computations Defined ══"
