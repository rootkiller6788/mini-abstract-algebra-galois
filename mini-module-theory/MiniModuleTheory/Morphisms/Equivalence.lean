/-
# MiniModuleTheory: Equivalence

Equivalence relations for module-related objects.
-/

import MiniModuleTheory.Core.Basic

namespace MiniModuleTheory

/-! ## Module Equivalence

Two modules are equivalent if there exists a module isomorphism
between them.
-/

def moduleEquivalent (R : Ring) (M N : Module R) : Prop :=
  ∃ (f : ModuleHom R M N) (g : ModuleHom R N M),
    (∀ (x : M.carrier), g.map (f.map x) = x) ∧
    (∀ (y : N.carrier), f.map (g.map y) = y)

/-! ## Submodule Equivalence -/

def submoduleEquivalent (R : Ring) (M : Module R) (N₁ N₂ : Submodule R M) : Prop :=
  N₁.subset = N₂.subset

/-! ## Homotopy Equivalence (conceptual)

For chain complexes of modules, two maps are chain homotopic
if they differ by a boundary.
-/

def chainHomotopic {R : Ring} {M N : Module R} (f g : ModuleHom R M N) : Prop :=
  True  -- conceptual: ∃ h, f - g = dh + hd

end MiniModuleTheory
