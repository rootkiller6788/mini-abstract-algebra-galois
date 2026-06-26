/-
# MiniModuleTheory: Homomorphisms

Morphisms between module structures.
-/

import MiniModuleTheory.Core.Basic

namespace MiniModuleTheory

/-! ## Module Homomorphisms (R-linear maps)

Already defined in Core.Basic as `ModuleHom`.
Additional homomorphism operations below.
-/

/-! ## Identity and Composition -/

def ModuleHom.id' (R : Ring) (M : Module R) : ModuleHom R M M :=
  ModuleHom.id R M

def ModuleHom.comp {R : Ring} {M N P : Module R}
    (g : ModuleHom R N P) (f : ModuleHom R M N) : ModuleHom R M P where
  map x := g.map (f.map x)
  map_add x y := by rw [f.map_add, g.map_add]
  map_smul a x := by rw [f.map_smul, g.map_smul]

/-! ## Kernel and Image -/

def ModuleHom.kernel {R : Ring} {M N : Module R} (f : ModuleHom R M N) : Submodule R M where
  subset := fun x => f.map x = N.zero
  zero_mem := by
    rw [f.map_add, M.add_zero, M.add_neg]
    exact calc
      f.map (M.add M.zero (M.neg M.zero)) = N.add (f.map M.zero) (f.map (M.neg M.zero)) := f.map_add _ _
      _ = N.zero := sorry
  add_closed hx hy := by
    rw [f.map_add, hx, hy, N.add_zero]
  smul_closed a hx := by
    rw [f.map_smul, hx, N.smul_add]
    sorry

def ModuleHom.image {R : Ring} {M N : Module R} (f : ModuleHom R M N) : Submodule R N where
  subset := fun y => ∃ (x : M.carrier), f.map x = y
  zero_mem := ⟨M.zero, by
    have := f.map_add M.zero M.zero
    sorry⟩
  add_closed := sorry
  smul_closed := sorry

end MiniModuleTheory
