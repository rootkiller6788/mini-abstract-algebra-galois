/-
# MiniModuleTheory: Standard Examples

Standard examples of modules over rings.
-/

import MiniModuleTheory.Core.Basic

namespace MiniModuleTheory

/-! ## Standard Module Examples

Conceptual examples:
- Z-modules are abelian groups
- Vector spaces are modules over fields
- Ideals are submodules of R (as an R-module)
- Ring R is an R-module (regular module)
- Quotient ring R/I is an R-module
- Matrix ring M_n(R) is an R-module
- Polynomial ring R[X] is an R-module
-/

/-! ## Z-Module (Abelian Group) -/

def ZModule (G : Group) : Module (Ring.mk sorry sorry sorry sorry sorry sorry sorry sorry sorry sorry sorry sorry sorry sorry) := sorry
  -- Any abelian group is a Z-module

/-! ## R as an R-Module (Regular Module) -/

def regularModule (R : Ring) : Module R where
  carrier := R.carrier
  add := R.add
  zero := R.zero
  neg := R.neg
  smul := R.mul
  add_assoc := R.add_assoc
  add_comm := R.add_comm
  add_zero := R.add_zero
  add_neg := R.add_neg
  smul_one := R.mul_one
  smul_add := R.mul_add
  add_smul := sorry  -- (a+b)r = ar + br needs distributivity
  mul_smul := R.mul_assoc

end MiniModuleTheory
