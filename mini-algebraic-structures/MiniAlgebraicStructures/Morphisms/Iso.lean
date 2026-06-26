/-
# MiniAlgebraicStructures.Morphisms.Iso

Isomorphisms between algebraic structures:
group iso, ring iso, field iso, module iso, algebra iso.
Automorphism structures.
-/

import MiniAlgebraicStructures.Morphisms.Hom

namespace MiniAlgebraicStructures

/-! ## Group isomorphism -/

structure GroupIso (G H : Type u) where
  toHom : GroupHom G H
  invHom : GroupHom H G
  left_inv : ∀ (x : G), invHom.map (toHom.map x) = x
  right_inv : ∀ (y : H), toHom.map (invHom.map y) = y

/-! ## Ring isomorphism -/

structure RingIso (R S : Type u) where
  toHom : RingHom R S
  invHom : RingHom S R
  left_inv : ∀ (x : R), invHom.map (toHom.map x) = x
  right_inv : ∀ (y : S), toHom.map (invHom.map y) = y

/-! ## Module isomorphism -/

structure ModuleIso (R M N : Type u) where
  toHom : ModuleHom R M N
  invHom : ModuleHom R N M
  left_inv : ∀ (x : M), invHom.map (toHom.map x) = x
  right_inv : ∀ (y : N), toHom.map (invHom.map y) = y

/-! ## Algebra isomorphism -/

structure AlgebraIso (R A B : Type u) where
  toHom : AlgebraHom R A B
  invHom : AlgebraHom R B A
  left_inv : ∀ (x : A), invHom.map (toHom.map x) = x
  right_inv : ∀ (y : B), toHom.map (invHom.map y) = y

/-! ## Signature algebra isomorphism -/

structure SigIso (sig : Signature) (A B : SigAlgebra sig) where
  toHom : SigHom sig A B
  invHom : SigHom sig B A
  left_inv : True
  right_inv : True

/-! ## Identity isomorphism -/

def GroupIso.id (G : Type u) : GroupIso G G where
  toHom := GroupHom.id G
  invHom := GroupHom.id G
  left_inv _ := rfl
  right_inv _ := rfl

/-! ## Composition of isomorphisms -/

def GroupIso.comp {G H K : Type u} (f : GroupIso G H) (g : GroupIso H K) : GroupIso G K where
  toHom := GroupHom.comp f.toHom g.toHom
  invHom := GroupHom.comp g.invHom f.invHom
  left_inv x := by
    simp [GroupHom.comp, f.left_inv, g.left_inv]
  right_inv y := by
    simp [GroupHom.comp, g.right_inv, f.right_inv]

/-! ## Symmetry (inverse isomorphism) -/

def GroupIso.symm {G H : Type u} (f : GroupIso G H) : GroupIso H G where
  toHom := f.invHom
  invHom := f.toHom
  left_inv := f.right_inv
  right_inv := f.left_inv

/-! ## Isomorphic structures -/

def areIsomorphic (G H : Type u) : Prop :=
  Nonempty (GroupIso G H)

notation G:50 " ≅ " H:50 => areIsomorphic G H

/-! ## Automorphism structure -/

structure Aut (G : Type u) where
  automorphisms : Type u
  comp : automorphisms -> automorphisms -> automorphisms
  id : automorphisms
  inv : automorphisms -> automorphisms

/-! ## Automorphism group -/

def AutGroup (G : Type u) : Aut G where
  automorphisms := GroupIso G G
  comp f g := GroupIso.comp f g
  id := GroupIso.id G
  inv f := GroupIso.symm f

/-! ## #eval tests -/

#eval "Morphisms.Iso: GroupIso, RingIso, ModuleIso, AlgebraIso, SigIso"
#eval "Morphisms.Iso: id, comp, symm, areIsomorphic, Aut, AutGroup"
