/-
# MiniGaloisTheoryLite.Core.Laws

Axioms for Galois theory: Galois extensions,
normality, separability, and the Galois correspondence.
-/

import MiniGaloisTheoryLite.Core.Basic
import MiniGaloisTheoryLite.Core.Objects
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Galois extension axioms -/

def galoisNormalityAxiom : String :=
  "L/K is normal if every irreducible polynomial in K[x] with a root in L splits in L"

def galoisSeparabilityAxiom : String :=
  "L/K is separable if minimal polynomials have distinct roots"

def galoisExtensionAxiom : String :=
  "L/K is Galois iff it is normal and separable"

def galoisExtensionAxioms : List String :=
  [galoisNormalityAxiom, galoisSeparabilityAxiom, galoisExtensionAxiom]

/-! ## Galois group axioms -/

def galoisGroupDefinitionAxiom : String :=
  "Gal(L/K) = Aut_K(L) = {field automorphisms of L fixing K pointwise}"

def galoisGroupOrderAxiom : String :=
  "|Gal(L/K)| = [L:K] for a finite Galois extension"

def galoisGroupAxioms : List String :=
  [galoisGroupDefinitionAxiom, galoisGroupOrderAxiom]

/-! ## Galois correspondence axioms -/

def galoisCorrespondenceBijectionAxiom : String :=
  "There is a bijection: {intermediate fields K subset E subset L} <-> {subgroups H <= Gal(L/K)}"

def galoisInclusionReversingAxiom : String :=
  "E1 subset E2 iff Gal(L/E2) <= Gal(L/E1). Degrees correspond to indices."

def galoisNormalSubgroupAxiom : String :=
  "E/K is Galois iff Gal(L/E) is normal in Gal(L/K). Then Gal(E/K) ~= Gal(L/K)/Gal(L/E)"

def galoisCorrespondenceAxioms : List String :=
  [galoisCorrespondenceBijectionAxiom, galoisInclusionReversingAxiom, galoisNormalSubgroupAxiom]

/-! ## Solvability axioms -/

def solvabilityByRadicalsAxiom : String :=
  "A polynomial f in K[x] is solvable by radicals iff its Galois group is solvable"

def insolvabilityOfQuinticAxiom : String :=
  "The general quintic is not solvable by radicals because S5 is not solvable"

def solvabilityAxioms : List String :=
  [solvabilityByRadicalsAxiom, insolvabilityOfQuinticAxiom]

/-! ## Total axiom system -/

def galoisTheoryAxioms : List String :=
  galoisExtensionAxioms ++ galoisGroupAxioms ++ galoisCorrespondenceAxioms ++ solvabilityAxioms

def galoisTheoryTotalAxioms : List String :=
  galoisTheoryAxioms

/-! ## #eval tests -/

#eval "Core.Laws: 10 axioms registered (3 extension + 2 group + 3 correspondence + 2 solvability)"
#eval s!"Total Galois axioms: {galoisTheoryTotalAxioms.length}"
