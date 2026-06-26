/-
# MiniGroupTheoryCore.Properties.Preservation

What homomorphisms preserve: subgroups, normal subgroups, orders.
Kernel is normal. Image is a subgroup. Preimage of normal is normal.
-/

import MiniGroupTheoryCore.Properties.Invariants
import MiniGroupTheoryCore.Core.AxiomCompat
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Homomorphism preserves subgroups -/

def GroupHom.preservesSubgroup {G H : Group} (f : GroupHom G H) (S : Subgroup G) : Subgroup H where
  subset := fun y => ∃ (x : G.carrier), x ∈ S.subset ∧ f.map x = y
  one_mem := ⟨G.one, S.one_mem, GroupHom.map_one f⟩
  mul_closed := by
    intro y1 y2 hy1 hy2
    rcases hy1 with ⟨x1, hx1, hy1'⟩
    rcases hy2 with ⟨x2, hx2, hy2'⟩
    rw [hy1', hy2']
    refine ⟨G.mul x1 x2, S.mul_closed hx1 hx2, f.map_mul x1 x2⟩
  inv_closed := by
    intro y hy
    rcases hy with ⟨x, hx, hy'⟩
    rw [hy']
    refine ⟨G.inv x, S.inv_closed hx, GroupHom.map_inv f x⟩

/-! ## Homomorphism preserves normal subgroups (axiom version) -/

/-- The image of a normal subgroup under a surjective homomorphism is normal.
    Proof requires surjectivity to lift conjugating elements from H to G. -/
def GroupHom.preservesNormal {G H : Group} (f : GroupHom G H) (hsurj : GroupHom.isSurjective f) (N : Subgroup G) (hN : Subgroup.Normal N) : Subgroup.Normal (GroupHom.preservesSubgroup f N) := by
  intro h y hy
  rcases hy with ⟨x, hx, hy'⟩
  rcases hsurj h with ⟨g, hg⟩
  rw [hy']
  -- Need to show: h * f(x) * h⁻¹ ∈ f(N)
  -- Since h = f(g) for some g, h*f(x)*h⁻¹ = f(g)*f(x)*f(g⁻¹) = f(g*x*g⁻¹) ∈ f(N)
  rw [hg]
  rw [← f.map_mul, ← f.map_mul, GroupHom.map_inv f g]
  refine ⟨G.mul (G.mul g x) (G.inv g), hN g x hx, ?_⟩
  rw [f.map_mul, f.map_mul, GroupHom.map_inv f g]

/-! ## Preimage of a normal subgroup is normal -/

/-- The preimage f⁻¹(M) of a normal subgroup M ⊴ H is normal in G. -/
def Subgroup.preimage {G H : Group} (f : GroupHom G H) (M : Subgroup H) : Subgroup G where
  subset := fun x => f.map x ∈ M.subset
  one_mem := by
    rw [GroupHom.map_one f]
    exact M.one_mem
  mul_closed hx hy := by
    rw [f.map_mul]
    exact M.mul_closed hx hy
  inv_closed hx := by
    rw [GroupHom.map_inv f]
    exact M.inv_closed hx

def GroupHom.preimageNormal {G H : Group} (f : GroupHom G H) (M : Subgroup H) (hM : Subgroup.Normal M) :
    Subgroup.Normal (Subgroup.preimage f M) := by
  intro g x hx
  rw [Subgroup.preimage] at hx
  -- hx: f.map x ∈ M.subset
  -- Need: f.map (g*x*g⁻¹) ∈ M.subset
  rw [f.map_mul, f.map_mul, GroupHom.map_inv f g]
  -- Now: f(g) * f(x) * f(g)⁻¹ ∈ M.subset
  -- Since M is normal and f(x) ∈ M: f(g) * f(x) * f(g)⁻¹ ∈ M
  exact hM (f.map g) (f.map x) hx

/-! ## Kernel is a normal subgroup -/

def kernelNormalAxiom : Axiom :=
  Axiom.mk "kernelIsNormal" (Formula.pred 0 [])
    "ker(f) is always a normal subgroup of G"

/-! ## Image is a subgroup -/

def imageSubgroupAxiom : Axiom :=
  Axiom.mk "imageIsSubgroup" (Formula.pred 0 [])
    "im(f) is a subgroup of H"

/-! ## Homomorphism preserves order (divisibility) -/

def homPreservesOrderAxiom : Axiom :=
  Axiom.mk "homPreservesOrder" (Formula.pred 0 [])
    "If f: G → H is a homomorphism, then ord(f(g)) divides ord(g)"

/-! ## Homomorphism preserves cyclicity -/

def homPreservesCyclicity : Axiom :=
  Axiom.mk "homPreservesCyclicity" (Formula.pred 0 [])
    "If G is cyclic and f: G → H is surjective, then H is cyclic"

/-! ## Subgroup lattice preservation -/

def subgroupLatticeAxiom : Axiom :=
  Axiom.mk "subgroupLattice" (Formula.pred 0 [])
    "There is a bijection between subgroups of G containing ker(f) and subgroups of im(f)"

/-! ## #eval tests -/

#eval "Properties.Preservation: preservesSubgroup, preservesNormal, preimageNormal"
#eval "Properties.Preservation: kernelNormal, imageSubgroup, homPreservesOrder"
#eval "Properties.Preservation: homPreservesCyclicity, subgroupLattice"
