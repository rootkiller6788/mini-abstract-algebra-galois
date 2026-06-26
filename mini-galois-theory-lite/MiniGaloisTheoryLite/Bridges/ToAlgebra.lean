/-
# MiniGaloisTheoryLite.Bridges.ToAlgebra

Bridge: Galois theory → group theory, representation theory,
Galois cohomology, Brauer groups, and Artin L-functions.
-/

import MiniGaloisTheoryLite.Theorems.Main

namespace MiniGaloisTheoryLite

/-! ## Galois group as permutation group -/

def galoisGroupAsPermutationGroup : String :=
  "If f ∈ F[x] has distinct roots r₁,...,r_n, then Gal(splitting field of f/F) ≤ S_n, acting faithfully on the roots"

def galoisGroupTransitiveIffIrreducible : String :=
  "Gal(f) acts transitively on the roots ⇔ f is irreducible over F"

def galoisGroupPrimitiveAction : String :=
  "Gal(f) acts primitively on the roots ⇔ f has no proper intermediate fields (i.e., f is 'primitive')"

def permutationRepresentationDegree : String :=
  "The permutation representation gives Gal(f) ↪ S_n, so |Gal(f)| divides n!"

/-! ## Solvable groups and Galois -/

def solvableGaloisConnection : String :=
  "A Galois extension is solvable by radicals ⇔ its Galois group is solvable. This connects Galois theory to group theory via the derived series."

def solvableGroupExamples : String :=
  "Solvable: all abelian groups, D_n, all p-groups, S₃, S₄, A₄, Frobenius groups. Non-solvable: S_n (n≥5), A_n (n≥5), PSL(2,q) (q≥4), all non-abelian simple groups."

def derivedSeriesGaloisCorrespondence : String :=
  "The derived series of Gal(E/F) corresponds to a tower of fields where each step is abelian. This is the key to proving solvability by radicals."

/-! ## Galois cohomology -/

def galoisCohomologyH1 : String :=
  "H^1(Gal(K^sep/K), GL_n) classifies n-dim K-vector spaces with semilinear Galois action (Hilbert 90 for n=1: H^1(G, K^×) = 1)"

def galoisCohomologyH2 : String :=
  "H^2(Gal(K^sep/K), (K^sep)^×) = Br(K) classifies central simple K-algebras"

def galoisCohomologyConnection : String :=
  "Galois cohomology H^n(G_K, M) = Ext^n_{ℤ[G_K]}(ℤ, M) connects Galois theory to homological algebra and derived functors"

def inflationRestrictionSequence : String :=
  "0 → H^1(G/H, A^H) → H^1(G, A) → H^1(H, A)^{G/H} → H^2(G/H, A^H) → ..."

/-! ## Brauer group and Galois -/

def brauerGroup : String :=
  "Br(K) = H^2(Gal(K^sep/K), (K^sep)^×) classifies central simple K-algebras up to Morita equivalence"

def crossedProduct : String :=
  "Every CSA is Brauer-equivalent to a crossed product (L/K, G, c) where L/K is Galois with group G and c ∈ H^2(G, L^×) is a 2-cocycle"

def brauerGroupOfLocalFields : String :=
  "Br(ℚ_p) ≅ ℚ/ℤ (Hasse invariant). Br(ℝ) ≅ ℤ/2ℤ. Br(ℂ) = 1."

def brauerGroupOfQ : String :=
  "Br(ℚ) is described by the exact sequence 0 → Br(ℚ) → ⊕_v Br(ℚ_v) → ℚ/ℤ → 0 (Albert-Brauer-Hasse-Noether)"

/-! ## Group representations and Galois -/

def galoisRepresentation : String :=
  "A Galois representation is a continuous homomorphism ρ : Gal(K^sep/K) → GL_n(L) for a topological field L (typically ℚ_l or ℂ)"

def artinRepresentation : String :=
  "Artin L-functions L(s, ρ) attached to Galois representations generalize the Riemann zeta function. They satisfy a functional equation."

def deligneSerreModularity : String :=
  "Every odd irreducible 2-dimensional Galois representation of G_ℚ with Artin conductor is modular (Deligne-Serre, 1974)"

def langlandsReciprocity : String :=
  "The Langlands program predicts a bijection between n-dimensional Galois representations and automorphic representations of GL_n"

/-! ## Embedding Galois theory → Group theory dictionary -/

structure GaloisGroupTheoryDictionary where
  galoisConcept : String
  groupTheoryConcept : String

def galoisGroupDictionary : List GaloisGroupTheoryDictionary := [
  { galoisConcept := "Fixed field", groupTheoryConcept := "Centralizer / Stabilizer" },
  { galoisConcept := "Galois correspondence", groupTheoryConcept := "Jordan-Hölder / Composition series" },
  { galoisConcept := "Normal extension", groupTheoryConcept := "Normal subgroup" },
  { galoisConcept := "Tower of extensions", groupTheoryConcept := "Subnormal series" },
  { galoisConcept := "Solvable by radicals", groupTheoryConcept := "Solvable group (derived series)" },
  { galoisConcept := "Galois group order = degree", groupTheoryConcept := "|G| = [G:H] · |H| (Lagrange)" },
  { galoisConcept := "Kummer theory", groupTheoryConcept := "Pontryagin duality" },
  { galoisConcept := "Class field theory", groupTheoryConcept := "Reciprocity laws for abelian extensions" }
]

/-! ## #eval tests -/

#eval "Bridges.ToAlgebra: galoisAsPermGroup, solvableGalois, cohomology"
#eval "Bridges.ToAlgebra: Brauer group, crossed product, Hasse principle"
#eval "Bridges.ToAlgebra: Galois representations, Artin L-functions, Langlands"
#eval s!"Galois→Group dictionary: {galoisGroupDictionary.length} entries"
