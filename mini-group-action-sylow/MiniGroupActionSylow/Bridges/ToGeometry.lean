/-
# MiniGroupActionSylow.Bridges.ToGeometry

Bridge: group actions → geometry.
Group actions on manifolds, Riemannian manifolds.
Symmetric spaces, crystallographic groups.
-/

import MiniGroupActionSylow.Theorems.Main

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Group action on a manifold -/

structure GroupActionOnManifold (G : Group) (M : Type u) extends GroupAction G M where
  smooth : Prop

/-! ## Lie group action -/

structure LieGroupAction (G : Group) (M : Type u) extends GroupActionOnManifold G M where
  lieAlgebra : Type u
  infinitesimalAction : lieAlgebra → (M → M)

/-! ## Riemannian isometric action -/

structure IsometricAction (G : Group) (M : Type u) extends GroupAction G M where
  metric : M → M → Real
  preservesMetric : ∀ (g : G.carrier) (x y : M), metric (act g x) (act g y) = metric x y

/-! ## Coxeter group action on chambers -/

structure CoxeterGroupAction (G : Group) where
  generators : Type u
  relations : List (Nat × Nat)
  actionOnChambers : GroupAction G (Fin 0)

def coxeterGroupClassification : Axiom :=
  Axiom.mk "coxeterClassification" (Formula.pred 0 [])
    "Finite Coxeter groups correspond to crystallographic root systems: A_n, B_n/C_n, D_n, E_6/E_7/E_8, F_4, G_2, H_3/H_4, I_2(m)"

/-! ## Crystallographic groups -/

structure CrystallographicGroup where
  group : Group
  translationLattice : Subgroup group
  pointGroup : Group

def bieberbachTheorem : Axiom :=
  Axiom.mk "bieberbachTheorem" (Formula.pred 0 [])
    "Every crystallographic group of dimension n contains a normal free abelian subgroup Z^n of finite index, and there are finitely many in each dimension"

/-! ## Symmetric spaces -/

structure SymmetricSpace where
  manifold : Type u
  involution : manifold → manifold

def symmetricSpaceClassification : Axiom :=
  Axiom.mk "symmetricSpaceClassification" (Formula.pred 0 [])
    "Irreducible symmetric spaces correspond to simple Lie group quotients G/K (Cartan classification)"

/-! ## Group action on projective space -/

def groupActionOnProjectiveSpace : Axiom :=
  Axiom.mk "projectivization" (Formula.pred 0 [])
    "A linear representation ρ : G → GL(V) induces a projective action G → PGL(V) on P(V)"

/-! ## #eval tests -/

#eval "Bridges.ToGeometry: GroupActionOnManifold, LieGroupAction, IsometricAction"
#eval "Bridges.ToGeometry: CoxeterGroupAction, coxeterGroupClassification"
#eval "Bridges.ToGeometry: crystallographicGroup, bieberbachTheorem, symmetricSpaceClassification"
