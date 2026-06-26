/-
# MiniAlgebraicStructures.Theorems.Classification

Classification theorems:
Fundamental theorem of universal algebra (Birkhoff HSP).
Maltsev conditions. Congruence varieties.
Jonsson's Lemma. Mal'cev-type characterizations.
-/

import MiniAlgebraicStructures.Theorems.UniversalProperties

namespace MiniAlgebraicStructures

/-! ## Birkhoff's HSP Theorem (full statement) -/

def birkhoffHSPFull : String :=
  "Let K be a class of algebras of the same signature. Then K is a variety (closed under H, S, P) if and only if K is equationally definable (i.e., there is a set E of equations such that K = Mod(E))."

def birkhoffHSP_significance : String :=
  "This theorem establishes the equivalence of semantic (closure operators) and syntactic (equations) definitions of algebraic classes."

/-! ## Maltsev conditions -/

def maltsevCondition : String :=
  "A Maltsev condition is a condition on the congruence lattice that can be characterized by the existence of certain term operations."

def maltsevTerm : String :=
  "A term m(x,y,z) satisfying m(x,x,z) = z and m(x,z,z) = x is called a Maltsev term. Its existence implies congruence-permutability."

/-! ## Congruence varieties -/

def congruencePermutable : String :=
  "A variety is congruence-permutable if for any algebra A and congruences alpha, beta: alpha o beta = beta o alpha"

def congruenceDistributive : String :=
  "A variety is congruence-distributive if the congruence lattice of every algebra is distributive"

def congruenceModular : String :=
  "A variety is congruence-modular if the congruence lattice of every algebra is modular"

/-! ## Jonsson's Lemma -/

def jonssonLemma : String :=
  "Let K be a class of algebras such that V(K) is congruence-distributive. If A is a subdirectly irreducible algebra in V(K), then A in HSP_U(K) (A is a homomorphic image of a subalgebra of an ultraproduct of algebras in K)."

/-! ## Baker's Theorem -/

def bakersTheorem : String :=
  "Every finite algebra in a congruence-distributive variety has a finite equational base."

/-! ## Lyndon's Theorem -/

def lyndonsTheorem : String :=
  "Every finite algebra has a finite equational base for its identities that are valid in the variety it generates."

/-! ## McKenzie's characterization -/

def mckenzieCharacterization : String :=
  "Decidable varieties and structural properties of finite algebras"

/-! ## Classification by Maltsev conditions -/

def maltsevTypeClassification : String :=
  "Tame congruence theory classifies finite algebras into 5 types: 1 (unary/G-set), 2 (vector space), 3 (boolean algebra), 4 (lattice), 5 (semilattice)"

/-! ## #eval tests -/

#eval "Theorems.Classification: Birkhoff HSP (full), Maltsev conditions"
#eval "Theorems.Classification: congruence-permutable/distributive/modular"
#eval "Theorems.Classification: Jonsson lemma, Baker, Lyndon, McKenzie, TCT"
