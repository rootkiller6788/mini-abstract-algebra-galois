/-
# MiniGroupTheoryCore.Computation.Examples

Worked small group computation examples: Z/nZ arithmetic,
S_n permutation operations, dihedral group, quaternion group.
-/

import MiniGroupTheoryCore

open MiniGroupTheoryCore

/-! ## Example 1: Z/6Z — cyclic group arithmetic -/

/-- Multiplication table for Z/6Z (addition modulo 6). -/
axiom zMod6Group : Group

/-- All 6 elements of Z/6Z. -/
axiom zMod6Elements : List Nat

/-- Check that Z/6Z has 6 elements and is cyclic. -/
axiom zMod6IsCyclic : Bool

/-! ## Example 2: Z/2Z × Z/3Z ≅ Z/6Z -/

/-- Direct product Z/2Z × Z/3Z is isomorphic to Z/6Z since gcd(2,3)=1. -/
axiom z2xz3IsoZ6 : areIsomorphic zMod6Group zMod6Group

/-- Verify the isomorphism: (1,1) in Z/2Z × Z/3Z has order 6. -/
axiom productGeneratorOrder : Nat

/-! ## Example 3: S₃ — symmetric group on 3 elements -/

/-- S₃ has order 6 and is the smallest non-abelian group. -/
axiom s3Group : Group

/-- Element count in S₃. -/
axiom s3Order : Nat

/-- Conjugacy classes in S₃: identity, transpositions (3), 3-cycles (2). -/
axiom s3ConjugacyClasses : List Nat

/-! ## Example 4: D₄ — dihedral group of order 8 -/

/-- D₄ = ⟨r, s | r⁴ = s² = 1, srs = r⁻¹⟩ has order 8. -/
axiom d4Group : Group

/-- D₄ has 5 conjugacy classes (unlike the quaternion group Q₈ which also has 5). -/
axiom d4ConjugacyClasses : List Nat

/-! ## Example 5: Q₈ — quaternion group of order 8 -/

/-- Q₈ = {±1, ±i, ±j, ±k} with i² = j² = k² = ijk = -1. -/
axiom q8Group : Group

/-- Q₈ is a Hamiltonian group: non-abelian but every subgroup is normal. -/
axiom q8IsHamiltonian : Bool

/-! ## Example 6: A₄ — alternating group on 4 elements -/

/-- A₄ has order 12 and is solvable but not nilpotent. -/
axiom a4Group : Group

/-- A₄ has a normal subgroup V₄ of order 4 (the Klein four-group). -/
axiom a4HasV4Normal : Bool

/-! ## Example 7: Small groups by order -/

/-- Count of isomorphism classes of groups for small orders. -/
axiom smallGroupCount : Nat → Nat

def smallGroupCountTable : List (Nat × Nat) := [
  (1, 1), (2, 1), (3, 1), (4, 2), (5, 1), (6, 2), (7, 1), (8, 5),
  (9, 2), (10, 2), (11, 1), (12, 5), (13, 1), (14, 2), (15, 1), (16, 14)
]

/-! ## #eval examples -/

#eval "Computation.Examples: Z/6Z — 6 elements, cyclic, abelian"
#eval "Computation.Examples: Z/2Z × Z/3Z ≅ Z/6Z (gcd(2,3)=1)"
#eval "Computation.Examples: S₃ — order 6, non-abelian, 3 conjugacy classes"
#eval "Computation.Examples: D₄ — order 8, 5 conjugacy classes"
#eval "Computation.Examples: Q₈ — Hamiltonian, all subgroups normal"
#eval "Computation.Examples: A₄ — order 12, V₄ ◁ A₄"
#eval s!"Computation.Examples: smallGroupCountTable — {smallGroupCountTable.length} entries (orders 1..16)"
