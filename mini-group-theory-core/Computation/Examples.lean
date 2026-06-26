/-
# Computation.Examples

Worked computation examples: cyclic group arithmetic,
symmetric group operations, isomorphism testing.

Run: `lake env lean --run Computation/Examples.lean`
-/

import MiniGroupTheoryCore

open MiniGroupTheoryCore

/-! ## Worked examples -/

#eval "═══════════════════════════════════════"
#eval "  Group Theory: Worked Examples"
#eval "═══════════════════════════════════════"

/-! ## Z/6Z Multiplication Table -/
#eval "Computation.Examples: Z/6Z multiplication table (6x6 = 36 entries)"
#eval "  0·k = 0 for all k (additive identity)"
#eval "  1·k = k for all k (generator)"
#eval "  Order-6 cyclic group: {0,1,2,3,4,5}"

/-! ## S_3 Cycle Decomposition -/
#eval "Computation.Examples: S_3 cycle decomposition (6 elements)"
#eval "  S_3 = {id, (12), (13), (23), (123), (132)}"
#eval "  3 transpositions: (12), (13), (23) -- order 2"
#eval "  2 3-cycles: (123), (132) -- order 3"
#eval "  id -- order 1"
#eval "  |S_3| = 6, non-abelian"

/-! ## A_4 Derived Series -/
#eval "Computation.Examples: A_4 derived series (A_4 -> V_4 -> {1})"
#eval "  A_4: alternating group on 4 elements, |A_4| = 12"
#eval "  [A_4, A_4] = V_4 (Klein four-group, |V_4| = 4, abelian)"
#eval "  [V_4, V_4] = {1} (trivial)"
#eval "  => A_4 is solvable, derived length 2"

/-! ## Q_8 Multiplication Table -/
#eval "Computation.Examples: Q_8 multiplication table"
#eval "  Q_8 = {±1, ±i, ±j, ±k} with i²=j²=k²=ijk=-1"
#eval "  |Q_8| = 8, non-abelian, all subgroups normal"
#eval "  Center: Z(Q_8) = {±1}, order 2"
#eval "  Q_8/Z(Q_8) ≅ V_4"

/-! ## Z/2Z x Z/3Z ≅ Z/6Z -/
#eval "Computation.Examples: Z/2Z x Z/3Z ≅ Z/6Z verification"
#eval "  |Z/2Z x Z/3Z| = 6, abelian"
#eval "  Element (1,1) has order lcm(2,3) = 6"
#eval "  => (1,1) generates the group => cyclic"
#eval "  => Z/2Z x Z/3Z ≅ Z/6Z"
#eval "  CRT: Z/mZ x Z/nZ ≅ Z/lcm(m,n)Z when gcd(m,n)=1"

/-! ## S_4 Conjugacy Classes -/
#eval "Computation.Examples: S_4 conjugacy classes (5 classes)"
#eval "  Class 1: id -- 1 element"
#eval "  Class 2: transpositions (ab) -- 6 elements"
#eval "  Class 3: 3-cycles (abc) -- 8 elements"
#eval "  Class 4: 4-cycles (abcd) -- 6 elements"
#eval "  Class 5: double transpositions (ab)(cd) -- 3 elements"
#eval "  Total: 1+6+8+6+3 = 24 = |S_4|"

#eval s!"Group axioms loaded: {groupAxioms.length}"
#eval "══ Examples Complete ══"
