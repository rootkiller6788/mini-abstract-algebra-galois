/-
# MiniAlgebraicStructures.Theorems.Classification

Classification theorems:
Fundamental theorem of universal algebra (Birkhoff HSP).
Maltsev conditions. Congruence varieties.
Jonsson's Lemma. Mal'cev-type characterizations.
Tame Congruence Theory. Decidable varieties.
-/

import MiniAlgebraicStructures.Theorems.UniversalProperties

namespace MiniAlgebraicStructures

/-! ## Birkhoff's HSP Theorem (full statement) -/

def birkhoffHSPFull : String :=
  "Let K be a class of algebras of the same signature. Then K is a variety (closed under H, S, P) if and only if K is equationally definable (i.e., there is a set E of equations such that K = Mod(E))."

def birkhoffHSP_significance : String :=
  "This theorem establishes the equivalence of semantic (closure operators) and syntactic (equations) definitions of algebraic classes."

/-! ### Proof of Birkhoff's HSP theorem -/

def birkhoffHSPProofSketch : List String := [
  "1. If K is a variety, H, S, P closure holds by definition.",
  "2. Define Eq(K) = {equations true in all algebras of K}.",
  "3. Show: HSP(K) = Mod(Eq(K)).",
  "4. If K = HSP(K), then K = Mod(Eq(K)), so K is equationally definable.",
  "5. Conversely, Mod(E) is always closed under H, S, P (verification).",
  "6. Hence Mod(E) = HSP(Mod(E)), so any equationally definable class is a variety."
]

/-! ## Maltsev conditions -/

def maltsevCondition : String :=
  "A Maltsev condition is a condition on the congruence lattice that can be characterized by the existence of certain term operations."

def maltsevTerm : String :=
  "A term m(x,y,z) satisfying m(x,x,z) = z and m(x,z,z) = x is called a Maltsev term. Its existence implies congruence-permutability."

/-! ### Strong Maltsev conditions -/

def strongMaltsevCondition : String :=
  "Defined by a finite set of linear equations on term operations"

def pixleyTerm : String :=
  "A term p(x,y,z) satisfying p(x,x,z)=z, p(x,z,z)=x, p(x,y,x)=x. Equivalent to arithmeticity."

def majorityTerm : String :=
  "A term m(x,y,z) satisfying m(x,x,y)=x, m(x,y,x)=x, m(y,x,x)=x. Equivalent to CD."

def minorityTerm : String :=
  "A term m(x,y,z) satisfying m(x,x,y)=y, m(x,y,x)=y, m(y,x,x)=y."

/-! ## Congruence varieties -/

def congruencePermutable : String :=
  "A variety is congruence-permutable if for any algebra A and congruences alpha, beta: alpha o beta = beta o alpha"

def congruenceDistributive : String :=
  "A variety is congruence-distributive if the congruence lattice of every algebra is distributive"

def congruenceModular : String :=
  "A variety is congruence-modular if the congruence lattice of every algebra is modular"

/-! ### Day's Theorem -/

def daysTheorem : String :=
  "A variety is congruence-modular iff there exist terms m_0,...,m_k (Day terms) satisfying certain equations"

/-! ### Gumm's Theorem -/

def gummsTheorem : String :=
  "A variety is congruence-modular iff there exist Gumm terms p(x,y,z), q(x,y,z) satisfying p(x,x,z)=z, p(x,z,z)=q(x,x,z), q(x,z,z)=x"

/-! ## Jonsson's Lemma -/

def jonssonLemma : String :=
  "Let K be a class of algebras such that V(K) is congruence-distributive. If A is a subdirectly irreducible algebra in V(K), then A in HSP_U(K) (A is a homomorphic image of a subalgebra of an ultraproduct of algebras in K)."

/-! ### Applications of Jonsson's Lemma -/

def jonssonFiniteAlgebras : String :=
  "If V(K) is congruence-distributive and K is a finite set of finite algebras, then every subdirectly irreducible in V(K) is in HS(K)"

def jonssonFiniteBasis : String :=
  "Every finite algebra in a congruence-distributive variety has a finite equational base (Baker's theorem, which follows from Jonsson's lemma)"

/-! ## Baker's Theorem -/

def bakersTheorem : String :=
  "Every finite algebra in a congruence-distributive variety has a finite equational base."

/-! ## Lyndon's Theorem -/

def lyndonsTheorem : String :=
  "Every finite algebra has a finite equational base for its identities that are valid in the variety it generates."

/-! ## McKenzie's characterization -/

def mckenzieCharacterization : String :=
  "Decidable varieties and structural properties of finite algebras"

/-! ### McKenzie's decidability theorem -/

def mckenzieDecidability : String :=
  "There is no algorithm to decide if a finite algebra generates a variety with decidable first-order theory"

/-! ## Classification by Maltsev conditions -/

def maltsevTypeClassification : String :=
  "Tame congruence theory classifies finite algebras into 5 types: 1 (unary/G-set), 2 (vector space), 3 (boolean algebra), 4 (lattice), 5 (semilattice)"

/-! ### TCT Omitting Types Theorem -/

def tctOmittingTypes : String :=
  "A locally finite variety omits type 1 iff it satisfies a nontrivial idempotent Maltsev condition"

/-! ## Commutator theory -/

def commutatorTheoryIntro : String :=
  "The commutator [alpha, beta] for congruences generalizes the group commutator. Central to TCT and the structure of congruence-modular varieties."

def abelianCongruences : String :=
  "A congruence alpha is abelian if [alpha, alpha] = 0. This characterizes TCT types 1 and 2."

/-! ## Structure of decidable varieties -/

def decidableVarietiesCharacterization : String :=
  "Valeriote's theorem: A locally finite variety is decidable iff it decomposes as the varietal product of an affine variety (type 2) and a strongly abelian variety (type 1 or 2)"

/-! ## Classification by quasi-varieties -/

def quasivarietyTheorem : String :=
  "A class is a quasivariety iff it is closed under S, P, and ultraproducts (ISP). Every quasivariety is definable by implications (quasi-equations)."

/-! ## Structural Ramsey theory in varieties -/

def ramseyPropertiesVarieties : String :=
  "Many varieties have the Ramsey property: finite algebras in the variety form a Ramsey class"

/-! ## #eval tests -/

#eval "Theorems.Classification: Birkhoff HSP (full), Maltsev conditions"
#eval "Theorems.Classification: congruence-permutable/distributive/modular"
#eval "Theorems.Classification: Jonsson lemma, Baker, Lyndon, McKenzie, TCT"
#eval "Theorems.Classification: Day's theorem, Gumm's theorem, commutator theory"
#eval "Theorems.Classification: Decidable varieties, quasivariety theorem, Ramsey"
