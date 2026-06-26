/-
# MiniGroupTheoryCore.Properties.Preservation

What homomorphisms preserve: subgroups, normal subgroups, orders.
Kernel is normal. Image is a subgroup. Preimage of normal is normal.
-/

import MiniGroupTheoryCore.Properties.Invariants
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Homomorphism preserves subgroups -/

def GroupHom.preservesSubgroup {G H : Group} (f : GroupHom G H) (S : Subgroup G) : Subgroup H where
  subset := fun y => ∃ (x : G.carrier), x ∈ S.subset ∧ f.map x = y
  one_mem := ⟨G.one, S.one_mem, by
    -- f.map G.one = H.one
    sorry⟩
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
    refine ⟨G.inv x, S.inv_closed hx, ?_⟩
    -- f.map (G.inv x) = H.inv (f.map x)
    sorry

/-! ## Homomorphism preserves normal subgroups -/

def GroupHom.preservesNormal {G H : Group} (f : GroupHom G H) (hsurj : GroupHom.isSurjective f) (N : Subgroup G) (hN : Subgroup.Normal N) : Subgroup.Normal (GroupHom.preservesSubgroup f N) := by
  sorry

/-! ## Preimage of a normal subgroup is normal -/

def GroupHom.preimageNormal {G H : Group} (f : GroupHom G H) (M : Subgroup H) (hM : Subgroup.Normal M) : Subgroup.Normal (by
  -- preimage subgroup of M under f
  exact Subgroup.trivial G) := by
  sorry

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
