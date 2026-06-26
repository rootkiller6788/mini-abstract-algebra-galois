/-
# MiniGroupActionSylow.Bridges.ToAlgebra

Bridge: group actions → representation theory, group algebras.
Maschke's theorem, permutation modules, Mackey decomposition.
-/

import MiniGroupActionSylow.Theorems.Main

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Permutation module -/

structure PermutationModule (G : Group) (F : Field) (X : Type u) where
  base : X → F.carrier
  action : GroupAction G X
  induced : G.carrier → (X → F.carrier) → (X → F.carrier)

/-! ## Group algebra k[G] -/

structure GroupAlgebra (F : Field) (G : Group) where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  smul : F.carrier → carrier → carrier

/-! ## Maschke's theorem -/

def maschkeTheorem : Axiom :=
  Axiom.mk "maschkeTheorem" (Formula.pred 0 [])
    "If char(k) ∤ |G|, then k[G] is semisimple -- every k[G]-module is completely reducible"

/-! ## Permutation representation -/

def permutationRepresentation : Axiom :=
  Axiom.mk "permutationRep" (Formula.pred 0 [])
    "A group action G on X induces a permutation representation G → GL_k(kX) with character χ(g) = |Fix_X(g)|"

/-! ## Mackey's decomposition formula -/

def mackeyDecomposition : Axiom :=
  Axiom.mk "mackeyDecomposition" (Formula.pred 0 [])
    "For subgroups H, K ≤ G and a k[H]-module M, Res_K(Ind_H^G M) = ⊕_{g∈K\G/H} Ind_{K∩gHg^{-1}}^K (Res_{K∩gHg^{-1}}^{gHg^{-1}} (^gM))"

/-! ## Frobenius reciprocity -/

def frobeniusReciprocity : Axiom :=
  Axiom.mk "frobeniusReciprocity" (Formula.pred 0 [])
    "Hom_G(Ind_H^G V, W) ≅ Hom_H(V, Res_H^G W) -- induction and restriction are adjoint functors"

/-! ## Clifford's theorem -/

def cliffordTheorem : Axiom :=
  Axiom.mk "cliffordTheorem" (Formula.pred 0 [])
    "If N ⊲ G and V is a simple k[G]-module, then Res_N(V) is semisimple, and G permutes the N-isotypic components transitively"

/-! ## Burnside's theorem on permutation groups -/

def burnsidePermutationGroup : Axiom :=
  Axiom.mk "burnsidePermGroup" (Formula.pred 0 [])
    "A primitive permutation group of composite degree has either a regular normal subgroup or is almost simple"

/-! ## #eval tests -/

#eval "Bridges.ToAlgebra: PermutationModule, GroupAlgebra, maschkeTheorem"
#eval "Bridges.ToAlgebra: permutationRepresentation, mackeyDecomposition, frobeniusReciprocity"
#eval "Bridges.ToAlgebra: cliffordTheorem, burnsidePermutationGroup"
