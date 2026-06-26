/-
# MiniAlgebraicStructures.Bridges.ToGeometry

Bridge: algebraic structures -> geometry.
Algebraic groups, group schemes, group objects in categories.
Algebraic varieties as equational classes (connection to universal algebra).
Tannakian formalism. Affine group schemes.
-/

import MiniAlgebraicStructures.Theorems.Main

namespace MiniAlgebraicStructures

/-! ## Algebraic group -/

structure AlgebraicGroup (F : Type u) where
  carrier : Type u
  group : Type u
  variety : Prop
  groupOpsAreMorphisms : Prop

/-! ## Group scheme -/

structure GroupScheme where
  scheme : Type u
  multiplication : Prop
  identity : Prop
  inverse : Prop

/-! ## Affine group scheme -/

structure AffineGroupScheme (R : Type u) where
  hopfAlgebra : Type u
  comultiplication : True
  counit : True
  antipode : True

def affineGroupSchemeCategory : String :=
  "Affine group schemes over R are equivalent to commutative Hopf algebras over R"

/-! ## Algebraic varieties as equational classes -/

def varietiesAsEquationalClasses : String :=
  "The connection: just as algebraic varieties are zero sets of polynomials, universal algebra varieties are model classes of equations"

def zariskiTopologyAlg : String :=
  "The Zariski topology on Spec(R) has basic closed sets V(I) = {p | I ⊆ p}; analogous to equational classes Mod(E) = {A | A satisfies E}"

/-! ## Tannakian formalism -/

def tannakianFormalism : String :=
  "An algebraic group G can be recovered from its category of representations Rep(G) together with the forgetful functor to Vec"

def neutralTannakianCategory : String :=
  "A neutral Tannakian category over F is equivalent to Rep(G) for some affine group scheme G over F"

/-! ## Group objects in categories -/

structure GroupObject (C : Type u) where
  carrier : Type u
  mul : True
  id : True
  inv : True

def groupObjectInCategory : String :=
  "A group object in a category C with finite products is an object G with morphisms m:GxG->G, e:1->G, i:G->G satisfying group axioms"

/-! ## Hopf algebras -/

def hopfAlgebraConnection : String :=
  "Group objects in the opposite category of commutative algebras = commutative Hopf algebras = affine group schemes"

/-! ## #eval tests -/

#eval "Bridges.ToGeometry: AlgebraicGroup, GroupScheme, AffineGroupScheme"
#eval "Bridges.ToGeometry: varietiesAsEquationalClasses, Zariski connection"
#eval "Bridges.ToGeometry: Tannakian formalism, group objects, Hopf algebras"
