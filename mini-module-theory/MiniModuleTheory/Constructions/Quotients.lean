/-
# MiniModuleTheory: Quotients

Quotient module constructions.
-/

import MiniModuleTheory.Core.Basic

namespace MiniModuleTheory

/-! ## Quotient Module -/

structure QuotientModule (R : Ring) (M : Module R) (N : Submodule R M) where
  Quotient : Module R
  proj : ModuleHom R M Quotient
  universal : ∀ (P : Module R) (f : ModuleHom R M P),
    (∀ (x : M.carrier), x ∈ N.subset → f.map x = P.zero) →
    ∃! (h : ModuleHom R Quotient P), ModuleHom.comp h proj = f

/-! ## Quotient by Zero Submodule -/

def quotientByZero (R : Ring) (M : Module R) : QuotientModule R M
    ({subset := fun _ => False, zero_mem := False.elim, add_closed := λ h _ => False.elim h, smul_closed := λ _ h => False.elim h} : Submodule R M) :=
  sorry

end MiniModuleTheory
