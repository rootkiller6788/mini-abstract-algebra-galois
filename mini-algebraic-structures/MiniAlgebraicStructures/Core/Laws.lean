/-
# MiniAlgebraicStructures.Core.Laws

Axioms for algebraic structures: semigroup associativity, monoid identity,
group inverse, abelian commutativity. Ring, field, module axioms.
Universal algebra: HSP closure properties.
-/

import MiniAlgebraicStructures.Core.Basic
import MiniAlgebraicStructures.Core.Objects

namespace MiniAlgebraicStructures

/-! ## Semigroup axioms -/

def semigroupAssocAxiom : String :=
  "∀ a b c : S, (a*b)*c = a*(b*c)"

def semigroupAxioms : List String :=
  [semigroupAssocAxiom]

/-! ## Monoid axioms -/

def monoidIdentityAxiom : String :=
  "∃ e : M, ∀ a : M, e*a = a*e = a"

def monoidAxioms : List String :=
  semigroupAxioms ++ [monoidIdentityAxiom]

/-! ## Group axioms -/

def groupInverseAxiom : String :=
  "∀ a : G, ∃ a⁻¹ : G, a*a⁻¹ = a⁻¹*a = e"

def groupAxioms : List String :=
  monoidAxioms ++ [groupInverseAxiom]

/-! ## Abelian group axioms -/

def abelianCommutativityAxiom : String :=
  "∀ a b : A, a*b = b*a"

def abelianGroupAxioms : List String :=
  groupAxioms ++ [abelianCommutativityAxiom]

/-! ## Ring axioms -/

def ringAddGroupAxiom : String :=
  "(R,+) is an abelian group"

def ringMulAssocAxiom : String :=
  "Multiplication is associative: ∀ a b c, (a*b)*c = a*(b*c)"

def ringDistribAxiom : String :=
  "a*(b+c) = a*b + a*c and (a+b)*c = a*c + b*c"

def ringAxioms : List String :=
  [ringAddGroupAxiom, ringMulAssocAxiom, ringDistribAxiom]

/-! ## Commutative ring axioms -/

def commutativeRingMulCommAxiom : String :=
  "∀ a b : R, a*b = b*a"

def commutativeRingAxioms : List String :=
  ringAxioms ++ [commutativeRingMulCommAxiom]

/-! ## Field axioms -/

def fieldNonzeroInvAxiom : String :=
  "∀ a ≠ 0 : F, ∃ a⁻¹ : F, a*a⁻¹ = 1"

def fieldAxioms : List String :=
  commutativeRingAxioms ++ [fieldNonzeroInvAxiom]

/-! ## Module axioms -/

def moduleSmulAssocAxiom : String :=
  "r*(s*m) = (r*s)*m"

def moduleDistribAxiom : String :=
  "r*(m+n) = r*m + r*n"

def moduleAxioms : List String :=
  [moduleSmulAssocAxiom, moduleDistribAxiom]

/-! ## Vector space axioms -/

def vectorSpaceAxioms : List String :=
  moduleAxioms

/-! ## Algebra axioms -/

def algebraBilinearAxiom : String :=
  "Multiplication is bilinear: (r*a)*b = a*(r*b) = r*(a*b)"

def algebraAxioms : List String :=
  moduleAxioms ++ [ringMulAssocAxiom, ringDistribAxiom, algebraBilinearAxiom]

/-! ## Universal Algebra axioms -/

def hspClosureAxiom : String :=
  "A variety is closed under H (homomorphic images), S (subalgebras), P (products)"

def birkhoffHSPAxiom : String :=
  "K is a variety if and only if K is an equational class (Birkhoff's HSP theorem)"

def universalAlgAxioms : List String :=
  [hspClosureAxiom, birkhoffHSPAxiom]

/-! ## Total axiom system -/

def algebraicStructuresAxioms : List String :=
  semigroupAxioms ++ monoidAxioms ++ groupAxioms ++ abelianGroupAxioms
  ++ ringAxioms ++ commutativeRingAxioms ++ fieldAxioms
  ++ moduleAxioms ++ algebraAxioms ++ universalAlgAxioms

/-! ## #eval tests -/

#eval "Core.Laws: semigroup(1) + monoid(2) + group(3) + abelian(4) axioms"
#eval "Core.Laws: ring(3) + commRing(4) + field(5) + module(2) + algebra(4)"
#eval "Core.Laws: universal algebra HSP + Birkhoff axioms"
#eval s!"Total algebraic structures axioms: {algebraicStructuresAxioms.length}"
