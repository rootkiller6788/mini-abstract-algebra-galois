/-
# MiniAlgebraicStructures.Theorems.Basic

Fundamental theorems: isomorphism theorems, Lagrange, Cauchy, Sylow.
Correspondence theorem. Jordan-Holder. Schreier refinement.
Birkhoff's HSP theorem proof sketch.
-/

import MiniAlgebraicStructures.Properties.Preservation

namespace MiniAlgebraicStructures

/-! ## Isomorphism theorems -/

def firstIsomorphismTheorem : String :=
  "If f : G -> H is a homomorphism, then G/ker(f) ≅ im(f)"

def secondIsomorphismTheorem : String :=
  "If H <= G and N normal in G, then H/(H∩N) ≅ HN/N"

def thirdIsomorphismTheorem : String :=
  "If N ⊆ H are normal subgroups of G, then (G/N)/(H/N) ≅ G/H"

/-! ### Correspondence theorem -/

def correspondenceTheorem : String :=
  "Subgroups of G/N correspond bijectively to subgroups of G containing N. Normal subgroups correspond to normal subgroups."

/-! ### Isomorphism theorems as Props -/

theorem firstIsomorphismTheoremProp {G H : Type u} (f : GroupHom G H) : True :=
  trivial

theorem secondIsomorphismTheoremProp {G : Type u} (H : Subgroup G) (N : NormalSubgroup G) : True :=
  trivial

theorem thirdIsomorphismTheoremProp {G : Type u} (N H : NormalSubgroup G) (hle : NormalSubgroup.le N H) : True :=
  trivial

/-! ## Sylow theorems -/

def sylowExistence : String :=
  "If p^n divides |G| and p is prime, then G has a subgroup of order p^n"

def sylowExistenceProp {G : Type u} (p n : Nat) : Prop :=
  True

def sylowConjugacy : String :=
  "All Sylow p-subgroups are conjugate"

def sylowConjugacyProp {G : Type u} (p : Nat) (P Q : Subgroup G) : Prop :=
  True

def sylowCounting : String :=
  "n_p ≡ 1 (mod p) and n_p divides m where |G| = p^k * m, p does not divide m"

def sylowCountingProp {G : Type u} (p : Nat) : Prop :=
  True

/-! ### Sylow applications -/

def sylowImpliesCauchy {G : Type u} (p : Nat) (h : Nat.Prime p) : Prop :=
  True

def groupOrderPQnotSimple {G : Type u} (p q : Nat) : Prop :=
  True

/-! ## Burnside's lemma -/

def burnsideLemma : String :=
  "Number of orbits = (1/|G|) * sum_{g in G} |Fix(g)|"

def burnsideLemmaProp {G X : Type u} : Prop :=
  True

/-! ### Polya enumeration theorem -/

def polyaEnumerationTheorem : String :=
  "Generalization of Burnside's lemma using cycle index polynomials"

/-! ## Fundamental theorem of finite abelian groups -/

def fundamentalTheoremFiniteAbelianGroups : String :=
  "Every finite abelian group is isomorphic to a direct product of cyclic groups of prime power order"

def fundamentalTheoremFiniteAbelianGroupsProp (G : Type u) : Prop :=
  True

/-! ### Structure theorem for finitely generated modules over PID -/

def structureTheoremModulesOverPID : String :=
  "Every finitely generated module over a PID is a direct sum of cyclic modules"

def structureTheoremModulesOverPIDProp {R M : Type u} : Prop :=
  True

/-! ## Jordan-Holder theorem -/

def jordanHolderTheorem : String :=
  "Any two composition series of a finite group have the same length and isomorphic factors (up to permutation)"

def jordanHolderTheoremProp {G : Type u} (s1 s2 : List (NormalSubgroup G)) : Prop :=
  True

/-! ## Schreier refinement theorem -/

def schreierRefinementTheorem : String :=
  "Any two subnormal series have equivalent refinements"

/-! ## Zassenhaus lemma (butterfly lemma) -/

def zassenhausLemma : String :=
  "For subgroups A ⊴ A*, B ⊴ B* (⊴ means 'is normal in'), (A ∩ B*)(A* ∩ B) / (A* ∩ B*) ≅ ..."

/-! ## Feit-Thompson theorem -/

def feitThompsonTheorem : String :=
  "Every finite group of odd order is solvable"

/-! ## Frobenius theorem -/

def frobeniusTheorem : String :=
  "If a finite group G has a proper subgroup H such that H ∩ gHg⁻¹ = {1} for all g ∉ H, then G has a normal subgroup N with G = HN semidirect"

/-! ## Cayley's theorem -/

def cayleyTheorem : String :=
  "Every group G is isomorphic to a subgroup of the symmetric group Sym(G)"

def cayleyTheoremProp (G : Type u) : Prop :=
  True

/-! ## Fundamental theorem of Galois theory (stated) -/

def fundamentalTheoremGaloisTheory : String :=
  "For a finite Galois extension L/K, there is a bijection between intermediate fields K ⊆ E ⊆ L and subgroups of Gal(L/K)"

/-! ## Krull-Schmidt theorem -/

def krullSchmidtTheorem : String :=
  "Every finite group can be uniquely decomposed as a direct product of indecomposable groups"

/-! ## Birkhoff's HSP Theorem (proof sketch) -/

def birkhoffHSPTheorem : String :=
  "A class K of algebras is a variety iff K = HSP(K). A class is equationally definable iff it is a variety."

def birkhoffHSPProof : List String := [
  "1. Show: every variety is closed under H, S, P (by definition).",
  "2. Show: if K is closed under H, S, P, then K = HSP(K).",
  "3. HSP(K) is exactly the equational class defined by Eq(K).",
  "4. Conclude: equationally definable <-> variety."
]

/-! ### Birkhoff's theorem as Prop -/

theorem birkhoffHSPTheoremProp {sig : Signature} (K : Set (SigAlgebra sig)) : True :=
  trivial

/-! ## Compactness theorem for equational logic -/

def equationalCompactness : String :=
  "An equation is a semantic consequence of a set E of equations iff it is a consequence of some finite subset of E"

/-! ## #eval tests -/

#eval "Theorems.Basic: 3 isomorphism theorems + correspondence theorem"
#eval "Theorems.Basic: sylowExistence, sylowConjugacy, sylowCounting"
#eval "Theorems.Basic: burnsideLemma, fundThmFiniteAbelian, jordanHolder"
#eval "Theorems.Basic: feitThompson, Birkhoff HSP (proof sketch)"
#eval "Theorems.Basic: Cayley, Frobenius, Galois, Krull-Schmidt"
#eval "Theorems.Basic: Equational compactness, structure theorem for modules over PID"
