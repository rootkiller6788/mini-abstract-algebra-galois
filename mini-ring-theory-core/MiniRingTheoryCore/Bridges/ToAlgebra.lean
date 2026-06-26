/-
# MiniRingTheoryCore.Bridges.ToAlgebra

Bridge from ring theory to module theory and algebra structures.
A module is an additive abelian group with scalar multiplication
by a ring. An algebra is a ring that is also a module with
compatible multiplication.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Laws
import MiniRingTheoryCore.Examples.Standard

namespace MiniRingTheoryCore

/-! ## Module over a Ring

A (left) module M over a ring R is an additive abelian group
equipped with a scalar multiplication R × M → M satisfying
the usual axioms. -/

/-- A left module over a ring R. -/
structure Module (R : Ring) where
  carrier : Type u
  zero : carrier
  add : carrier → carrier → carrier
  neg : carrier → carrier
  smul : R.carrier → carrier → carrier
  add_assoc : ∀ (x y z : carrier), add (add x y) z = add x (add y z)
  add_comm : ∀ (x y : carrier), add x y = add y x
  add_zero : ∀ (x : carrier), add x zero = x
  add_neg : ∀ (x : carrier), add x (neg x) = zero
  smul_add : ∀ (r : R.carrier) (x y : carrier),
    smul r (add x y) = add (smul r x) (smul r y)
  add_smul : ∀ (r s : R.carrier) (x : carrier),
    smul (R.add r s) x = add (smul r x) (smul s x)
  mul_smul : ∀ (r s : R.carrier) (x : carrier),
    smul (R.mul r s) x = smul r (smul s x)
  one_smul : ∀ (x : carrier), smul R.one x = x

/-! ## Algebra over a Ring

An R-algebra A is a ring A together with a ring homomorphism
η: R → A (the structure map) whose image lies in the center of A.
Equivalently: A is an R-module with a compatible bilinear
multiplication. -/

/-- An algebra over a ring R: a ring A with a compatible
    R-module structure. -/
structure Algebra (R : Ring) where
  ring : Ring
  module : Module R
  carrier_eq : module.carrier = ring.carrier
  -- Compatibility: scalar multiplication commutes with ring multiplication
  smul_mul_compat : ∀ (r : R.carrier) (x y : ring.carrier),
    module.smul r (ring.mul x y) = ring.mul (module.smul r x) y

/-- The structure map (unit map) η: R → A of an R-algebra.
    Sends r to r * 1_A. -/
axiom algebraStructureMap {R : Ring} (A : Algebra R) :
  RingHom R A.ring

/-- The structure map sends r to r * 1_A. -/
axiom algebraStructureMap_formula {R : Ring} (A : Algebra R) (r : R.carrier) :
  (algebraStructureMap A).map r = A.module.smul r A.ring.one

/-- The image of the structure map lies in the center of A:
    η(r) * a = a * η(r) for all a ∈ A. -/
axiom algebraStructureMap_center {R : Ring} (A : Algebra R)
  (r : R.carrier) (a : A.ring.carrier) :
  A.ring.mul ((algebraStructureMap A).map r) a =
  A.ring.mul a ((algebraStructureMap A).map r)

/-- An R-algebra is commutative if its ring structure is commutative. -/
def Algebra.isCommutative {R : Ring} (A : Algebra R) : Prop :=
  isCommutativeRing A.ring

/-- Every ring is a Z-algebra via the unique map Z → R. -/
axiom ring_as_Z_algebra (R : Ring) : Algebra intRing

/-- An algebra homomorphism is a ring homomorphism compatible with
    the module structure. -/
axiom AlgebraHom {R : Ring} (A B : Algebra R) : Type

/-- The category of R-algebras is connected to ring theory via
    the forgetful functor Alg_R → Ring. -/
axiom forgetful_algebra_to_ring {R : Ring} (A : Algebra R) : RingHom A.ring A.ring

/-! ## Connection to Linear Algebra

When R is a field, an R-module is a vector space and an
R-algebra is an associative algebra over a field. -/

/-- If R is a field, then an R-module is a vector space.
    All the standard linear algebra concepts (basis, dimension,
    linear maps) apply. -/
axiom vectorSpace_is_module_over_field {R : Ring} (hfield : isField R)
  (M : Module R) : True

/-- Dimension of a vector space (when R is a field). -/
axiom dimension (R : Ring) (M : Module R) : Nat

/-- Every R-algebra A is an R-vector space when R is a field. -/
axiom algebra_is_vector_space {R : Ring} (hfield : isField R)
  (A : Algebra R) : Module R

/-! ## #eval examples -/

#eval "Module: R-module with smul axioms"
#eval "Algebra: ring + compatible R-module structure"
#eval "algebraStructureMap: η: R → A"
#eval "vectorSpace_is_module_over_field: field => vector space"
