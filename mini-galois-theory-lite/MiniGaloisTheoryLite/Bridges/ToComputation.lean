/-
# MiniGaloisTheoryLite.Bridges.ToComputation

Bridge: Galois theory → computational algebra.
Computing Galois groups, resolvent methods,
Stauduhar's algorithm, modular methods (Cebotarev),
discriminant analysis, and practical computation.
-/

import MiniGaloisTheoryLite.Theorems.Main

namespace MiniGaloisTheoryLite

/-! ## Overview of Galois group computation -/

def computingGaloisGroups : String :=
  "Given f ∈ Z[x] of degree n, determine Gal(f). Main approaches:
   1. Resolvent method (Lagrange, Galois)
   2. Stauduhar's algorithm (relative resolvents)
   3. Modular methods (reduce mod p + Cebotarev density)
   4. p-adic methods (Newton polygons)
   5. Absolute resolvents and subfield methods"

/-! ## Resolvent method -/

def resolventMethod : String :=
  "Form a resolvent polynomial whose splitting field is the same, or use linear resolvents to test for specific Galois groups. The general resolvent polynomial has degree n!/d where d is the order of the tested group."

def resolventMethodDetails : String :=
  "To test if Gal(f) ≤ G ≤ S_n:
   1. Form the G-relative resolvent R_G(f)(x) = ∏_{σ∈S_n/G} (x - ∏_{i} ∏_{j} f(σ(r_i), σ(r_j)))
   2. If R_G has a rational root, then Gal(f) ≤ G (up to conjugation)"

def resolventForSymmetricGroups : String :=
  "To check if Gal(f) ≤ A_n: test if discriminant is a perfect square.
   To check if Gal(f) ≤ S_{n-1}: test for rational root.
   To check if Gal(f) is transitive: test irreducibility."

/-! ## Stauduhar's algorithm -/

structure StauduharStep where
  degree : Nat
  maxSubgroups : Nat
  currentGroupOrder : Nat
  resolvedGroup : String

def stauduharAlgorithm : String :=
  "Start with Gal(f) ≤ S_n. Iteratively test if Gal(f) is contained in maximal transitive subgroups of the current candidate using relative resolvents. Complexity: O(n! log n) in worst case, but very effective in practice for n ≤ 23."

def stauduharRelativeResolvent : String :=
  "For H < G ≤ S_n, the relative resolvent distinguishes whether Gal(f) is contained in a conjugate of H. The resolvent has degree [G:H] and its factorization gives the orbit structure."

def stauduharImplementation : String :=
  "GAP (Stauduhar's original), Magma (improved by Geissler, Kluners), PARI/GP (polgalois by Belabas), SageMath (galois_group via PARI). All compute Galois groups of polynomials of degree ≤ 23 reliably."

/-! ## Discriminant and Galois group -/

def discriminantGalois : String :=
  "The discriminant Δ of f is a square in F iff Gal(f) ≤ A_n (i.e., Gal(f) consists of even permutations only)"

def discriminantFormula : String :=
  "Δ = ∏_{i<j} (r_i - r_j)² where r_i are the roots of f. Δ ∈ F and Δ is computable as a polynomial in the coefficients of f."

def discriminantAndCubic : String :=
  "For cubic f(x) = x³ + ax + b: Δ = -4a³ - 27b².
   Δ a square → Gal(f) ≅ A₃ ≅ C₃.
   Δ not a square → Gal(f) ≅ S₃."

def discriminantAndQuartic : String :=
  "For quartic f: Δ alone is insufficient. Need cubic resolvent:
   If cubic resolvent has a root in F, Gal(f) ≤ D₄.
   Otherwise Gal(f) ≅ A₄ or S₄, distinguished by Δ."

/-! ## Modular methods (Cebotarev density) -/

def cebotarevDensityGalois : String :=
  "The Cebotarev density theorem: the Frobenius elements of unramified primes are equidistributed in the conjugacy classes of Gal(f). This allows determining Gal(f) by factoring f mod p."

def modularGaloisGroup : String :=
  "Factor f mod p for many primes p. The cycle types of the factorization give conjugacy classes in Gal(f). Collect enough to uniquely determine the group. By Cebotarev, each conjugacy class appears with density |C|/|G|."

def modularMethodAlgorithm : String :=
  "1. Reduce f mod p for primes p (avoiding discriminant primes)
   2. Factor f mod p → cycle type of Frobenius
   3. Accumulate cycle type statistics
   4. Compare with subgroup lattice of S_n
   5. Uniquely identify Gal(f) when all possible conjugacy classes are seen"

def chebotarevPractical : String :=
  "For polynomials over ℚ, examining f mod p for p up to ~1000 usually suffices to determine the Galois group for n ≤ 10. For larger n, Stauduhar's algorithm is more reliable."

/-! ## Computational systems -/

def galoisComputationalSystems : List (String × String) := [
  ("GAP", "Group, Algorithm, Programming — Stauduhar's algorithm, Galois groups up to degree 15"),
  ("Magma", "Computational algebra system — best Galois group implementation (up to deg 23)"),
  ("PARI/GP", "Number theory library — polgalois computes Galois groups up to degree 11"),
  ("SageMath", "Open-source mathematics — wraps PARI and GAP for Galois groups"),
  ("Maple", "galois(f) command — Stauduhar's algorithm up to degree 9"),
  ("Mathematica", "GaloisGroup[poly, x] — resolvent-based, limited to small degrees")
]

def gapGaloisGroup : String :=
  "GAP command: GaloisType(f) computes the transitive group type. GaloisGroup(f) tries to find an explicit polynomial with that group."

def magmaGaloisGroup : String :=
  "Magma: GaloisGroup(f) is the most complete implementation, handling degree ≤ 23 using Stauduhar's algorithm with many improvements."

/-! ## Database of transitive groups -/

def transitiveGroupDatabase : String :=
  "The database of transitive groups of degree n ≤ 31 (Hulpke). Each transitive subgroup of S_n has a label nTk. For n ≤ 15, all transitive groups are known. For n ≤ 31, the primitive groups database is complete."

def galoisGroupDatabase : String :=
  "Klüners-Malle database: for each transitive group, records whether it is known to be realizable as a Galois group over ℚ. Most groups of degree ≤ 15 are classified."

def transitiveGroupCounts : List (Nat × Nat) := [
  (1, 1), (2, 1), (3, 2), (4, 5), (5, 5), (6, 16), (7, 7), (8, 50), (9, 34), (10, 45)
]

/-! ## Practical Galois group computation examples -/

structure ComputedGaloisGroup where
  polynomial : String
  degree : Nat
  galoisGroup : String
  method : String

def computedExamples : List ComputedGaloisGroup := [
  { polynomial := "x³ - 3x + 1", degree := 3, galoisGroup := "A₃ ≅ C₃", method := "discriminant = 81 (square)" },
  { polynomial := "x³ - 2", degree := 3, galoisGroup := "S₃", method := "discriminant = -108 (non-square)" },
  { polynomial := "x⁴ - 2", degree := 4, galoisGroup := "D₄", method := "resolvent method" },
  { polynomial := "x⁵ - 6x + 3", degree := 5, galoisGroup := "S₅", method := "modular (mod 2,3,5,7,11)" },
  { polynomial := "x⁵ - x - 1", degree := 5, galoisGroup := "S₅", method := "modular + discriminant" },
  { polynomial := "x⁶ - 3x⁵ + 6x⁴ - 7x³ + 2x² + x - 1", degree := 6,
    galoisGroup := "PSL(2,5) ≅ A₅", method := "Stauduhar's algorithm" }
]

/-! ## Complexity analysis -/

def computationalComplexity : String :=
  "Stauduhar's algorithm: O(n! · M(n)) in worst case where M(n) is polynomial factorization time. Practically effective for n ≤ 23. Modular method: O(p · M(n)) per prime p. For n ≥ 24, the database of transitive groups is incomplete."

def galoisGroupComputationIsPTimeForFixedDegree : String :=
  "For fixed degree n, there is a polynomial-time algorithm (Landau, 1985) to compute the Galois group. However, the constant depends on n!."

/-! ## #eval tests -/

#eval "Bridges.ToComputation: resolventMethod, Stauduhar's algorithm"
#eval "Bridges.ToComputation: discriminantGalois, modularGaloisGroup, Cebotarev"
#eval "Bridges.ToComputation: GAP, Magma, PARI/GP, SageMath, Maple, Mathematica"
#eval s!"Computational systems: {galoisComputationalSystems.length}"
#eval s!"Transitive group counts computed up to degree 10: {transitiveGroupCounts.length} entries"
#eval s!"Computed examples: {computedExamples.length}"
