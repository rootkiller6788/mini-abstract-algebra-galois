/-
# MiniGaloisTheoryLite.Bridges.ToGeometry

Bridge: Galois theory → algebraic geometry.
Grothendieck's Galois theory of schemes, inverse Galois
problem via geometry, dessins d'enfants, Belyi's theorem,
and anabelian geometry.
-/

import MiniGaloisTheoryLite.Theorems.Main

namespace MiniGaloisTheoryLite

/-! ## Grothendieck's Galois theory -/

def grothendieckGaloisTheory : String :=
  "For a connected scheme X with geometric point x̅, the category of finite étale covers of X is equivalent to the category of finite sets with continuous π₁^et(X, x̅)-action"

def galoisTheoryOfSchemes : String :=
  "Finite étale covers of Spec(K) ↔ finite K-algebras (separable algebras) ↔ finite continuous G_K-sets"

def grothendieckGaloisCategories : String :=
  "A Galois category is a category C with a fiber functor F: C → FinSet such that:
   1. C has finite limits and colimits
   2. Every object is a coproduct of connected objects
   3. F is exact and conservative
   Then Aut(F) is a profinite group and C ≅ FinSet^{cont}(Aut(F))"

/-! ## Hilbert's irreducibility theorem -/

def hilbertIrreducibility : String :=
  "For a number field K, the set of t ∈ K such that f(X, t) ∈ K[X] is irreducible over K is infinite (Hilbert). Used to realize Galois groups over ℚ."

def hilbertIrreducibilityApplication : String :=
  "If G is the Galois group of a regular extension of ℚ(t), then G is also a Galois group over ℚ (by Hilbert's irreducibility)."

def hilbertIrreducibilitySets : String :=
  "Hilbertian fields include ℚ, number fields, function fields over finite fields (but NOT ℂ, ℝ, ℚ_p, finite fields)"

/-! ## Inverse Galois problem via geometry -/

def inverseGaloisProblemGeo : String :=
  "Approach: realize groups as Galois groups of extensions of ℚ(t) (regular inverse Galois), then specialize via Hilbert's irreducibility theorem."

def rigidMethod : String :=
  "The rigidity method (Belyi, Fried, Matzat, Thompson) realizes many simple groups (including the Monster) as Galois groups over ℚ using braid group actions on generating systems."

def rigidTriple : String :=
  "A rigid triple (C₁, C₂, C₃) of conjugacy classes in G is one where there is exactly one orbit of generating triples (g₁,g₂,g₃) with g_i ∈ C_i and g₁g₂g₃ = 1 under Aut(G)."

def thompsonMonsterRealization : String :=
  "Thompson (1984) realized the Monster simple group as a Galois group over ℚ using the rigidity method and explicit braid group computations."

/-! ## Moduli spaces and Galois -/

def galoisActionOnModuli : String :=
  "Gal(ℚ̅/ℚ) acts on the set of isomorphism classes of algebraic curves defined over ℚ̅ via its action on coefficients. The orbits are ℚ-rational families."

def dessinsDenfants : String :=
  "Grothendieck's dessins d'enfants: bipartite graphs on surfaces correspond to algebraic curves over ℚ̅. Gal(ℚ̅/ℚ) acts faithfully on dessins d'enfants."

def belyiTheorem : String :=
  "A smooth projective curve X over ℂ is defined over ℚ̅ iff there exists a Belyi map f: X → ℙ^1 ramified only at 0, 1, ∞"

def belyiPairs : String :=
  "A Belyi pair (X, f) gives a dessin d'enfant. Two curves X and X' are Galois conjugate iff their dessins are related by the action of G_ℚ."

/-! ## Anabelian geometry -/

def grothendieckAnabelian : String :=
  "For 'anabelian' varieties (hyperbolic curves over number fields/p-adic fields), the étale fundamental group determines the isomorphism class of the variety."

def sectionConjecture : String :=
  "Grothendieck's section conjecture: For a smooth projective curve X over a number field K of genus ≥ 2, sections of π₁^et(X) → G_K correspond bijectively to K-rational points of X."

def anabelianReconstruction : String :=
  "Mochizuki's work: for hyperbolic curves over sub-p-adic fields, the absolute Galois group of the function field can be reconstructed from a sufficiently large collection of open subgroups."

/-! ## Etale fundamental groups of curves -/

def etalePi1OfCurves : String :=
  "For a smooth projective curve X of genus g over an algebraically closed field, π₁^et(X) ≅ Π_g (profinite completion of the surface group with 2g generators and one relation)."

def etalePi1OfPuncturedCurves : String :=
  "For P^1\\{0,1,∞} over ℚ, π₁^et is the profinite completion of the free group F₂. Belyi's theorem connects this to Gal(ℚ̅/ℚ)."

/-! ## Connections to arithmetic geometry -/

def faltingTheoremAndGalois : String :=
  "Faltings' theorem (Mordell conjecture): a curve of genus ≥ 2 over a number field has finitely many rational points. The proof uses Galois representations on Tate modules of abelian varieties."

def mazurMerelTheoremGalois : String :=
  "Mazur's torsion theorem and Merel's theorem on torsion points of elliptic curves over number fields rely on Galois representations and modular curves."

/-! ## #eval tests -/

#eval "Bridges.ToGeometry: grothendieckGalois, galoisSchemes, hilbertIrreducibility"
#eval "Bridges.ToGeometry: inverseGaloisProblemGeo, rigidMethod, thompsonMonster"
#eval "Bridges.ToGeometry: dessinsDenfants, belyiTheorem, grothendieckAnabelian"
#eval "Bridges.ToGeometry: sectionConjecture, etalePi1OfCurves, faltingTheorem"
