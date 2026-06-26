/-
# MiniModuleTheory: Isomorphisms

Isomorphism structures for modules.
-/

import MiniObjectKernel.Core.Basic
import MiniModuleTheory.Core.Basic

namespace MiniModuleTheory

open MiniObjectKernel

/-! ## Module Isomorphism -/

structure ModuleIso (R : Ring) (M N : Module R) where
  hom : ModuleHom R M N
  inv : ModuleHom R N M
  hom_inv_id : ∀ (y : N.carrier), hom.map (inv.map y) = y
  inv_hom_id : ∀ (x : M.carrier), inv.map (hom.map x) = x

/-! ## Module Automorphism -/

def ModuleAut (R : Ring) (M : Module R) := ModuleIso R M M

/-! ## Isomorphic Modules -/

def areIsomorphic (R : Ring) (M N : Module R) : Prop :=
  Nonempty (ModuleIso R M N)

/-! Properties:
  - Isomorphic modules have isomorphic submodule lattices
  - Free modules of same rank are isomorphic
  - Finitely generated modules over a PID have invariant factor decomposition
-/

end MiniModuleTheory
