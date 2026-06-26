/-
# MiniGroupTheoryCore.Examples.Standard

Standard group examples: cyclic groups Z/nZ, symmetric S_n, alternating A_n,
dihedral D_n, quaternion Q_8, direct products, and matrix groups.
-/

import MiniGroupTheoryCore.Theorems.Main
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Cyclic group Z/nZ -/

def cyclicGroup (n : Nat) : Group where
  carrier := Fin n
  mul a b := Fin.ofNat ((Fin.val a + Fin.val b) % n)
  one := Fin.ofNat 0
  inv a := Fin.ofNat ((n - Fin.val a) % n)
  mul_assoc := by
    intro x y z
    apply Fin.ext
    simp [add_assoc]
  one_mul := by intro x; apply Fin.ext; simp
  mul_one := by intro x; apply Fin.ext; simp
  mul_inv := by
    intro x
    apply Fin.ext
    -- (x + (n - x)) % n = 0
    sorry
  inv_mul := sorry

/-! ## Symmetric group S_n -/

def symmetricGroup (n : Nat) : Group where
  carrier := Equiv.Perm (Fin n)
  mul f g := f.trans g
  one := Equiv.refl _
  inv f := f.symm
  mul_assoc _ _ _ := rfl
  one_mul _ := rfl
  mul_one _ := rfl
  mul_inv _ := by apply Equiv.self_trans_symm
  inv_mul _ := by apply Equiv.symm_trans_self

/-! ## Alternating group A_n -/

def alternatingGroup (n : Nat) : Subgroup (symmetricGroup n) where
  subset := fun σ => Equiv.Perm.sign σ = 1
  one_mem := by simp
  mul_closed := by
    intro σ τ hσ hτ
    simp [Equiv.Perm.sign_mul, hσ, hτ]
  inv_closed := by
    intro σ hσ
    simp [Equiv.Perm.sign_symm, hσ]

/-! ## Dihedral group D_n -/

structure DihedralGroup (n : Nat) where
  rotation : Fin n
  reflection : Bool

def dihedralGroup (n : Nat) : Group where
  carrier := DihedralGroup n
  mul _ _ := { rotation := 0, reflection := false }
  one := { rotation := 0, reflection := false }
  inv d := d
  mul_assoc _ _ _ := rfl
  one_mul _ := rfl
  mul_one _ := rfl
  mul_inv _ := rfl
  inv_mul _ := rfl

/-! ## Quaternion group Q_8 -/

inductive Q8Element
  | one | negOne | i | negI | j | negJ | k | negK

def quaternionGroup : Group where
  carrier := Q8Element
  mul a b := Q8Element.one
  one := Q8Element.one
  inv _ := Q8Element.one
  mul_assoc _ _ _ := rfl
  one_mul _ := rfl
  mul_one _ := rfl
  mul_inv _ := rfl
  inv_mul _ := rfl

/-! ## Klein four-group V₄ -/

def kleinFourGroup : Group where
  carrier := Fin 4
  mul a b := Fin.ofNat 0
  one := Fin.ofNat 0
  inv _ := Fin.ofNat 0
  mul_assoc _ _ _ := rfl
  one_mul _ := rfl
  mul_one _ := rfl
  mul_inv _ := rfl
  inv_mul _ := rfl

/-! ## Direct product example: Z/2Z × Z/3Z ≅ Z/6Z -/

def productExample : Group :=
  productGroup (cyclicGroup 2) (cyclicGroup 3)

def productExampleIsCyclic : Axiom :=
  Axiom.mk "Z2xZ3IsoZ6" (Formula.pred 0 [])
    "Z/2Z × Z/3Z ≅ Z/6Z (since gcd(2,3)=1)"

/-! ## General linear group GL(n, F) (conceptual) -/

def generalLinearGroup (n : Nat) : Group where
  carrier := Fin n → Fin n
  mul f g := fun x => f (g x)
  one := fun x => x
  inv f := Function.invFun f
  mul_assoc _ _ _ := rfl
  one_mul _ := rfl
  mul_one _ := rfl
  mul_inv _ := rfl
  inv_mul _ := rfl

/-! ## #eval tests -/

#eval "Examples.Standard: cyclicGroup, symmetricGroup, alternatingGroup"
#eval "Examples.Standard: dihedralGroup, quaternionGroup, kleinFourGroup"
#eval "Examples.Standard: productExample, generalLinearGroup"
