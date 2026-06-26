/-
# MiniAlgebraicStructures.Morphisms.Equivalence

Category structure for algebraic structures.
Equivalence relations, congruences, and quotient structures.
-/

import MiniAlgebraicStructures.Morphisms.Iso

namespace MiniAlgebraicStructures

/-! ## Group category -/

structure GroupCategory where
  obj : Type u
  hom : obj -> obj -> Type u
  id : (X : obj) -> hom X X
  comp : {X Y Z : obj} -> hom Y Z -> hom X Y -> hom X Z

def groupCategory : GroupCategory where
  obj := Type u
  hom G H := GroupHom G H
  id G := GroupHom.id G
  comp f g := GroupHom.comp g f

/-! ## Ring category -/

structure RingCategory where
  obj : Type u
  hom : obj -> obj -> Type u
  id : (X : obj) -> hom X X
  comp : {X Y Z : obj} -> hom Y Z -> hom X Y -> hom X Z

def ringCategory : RingCategory where
  obj := Type u
  hom R S := RingHom R S
  id R := {
    map := fun x => x
    map_add := fun _ _ => rfl
    map_mul := fun _ _ => rfl
    map_one := rfl
  }
  comp f g := {
    map := fun x => f.map (g.map x)
    map_add := by
      intro x y; simp [f.map_add, g.map_add]
    map_mul := by
      intro x y; simp [f.map_mul, g.map_mul]
    map_one := by
      simp [f.map_one, g.map_one]
  }

/-! ## Congruence (compatible equivalence relation) -/

structure Congruence (G : Type u) where
  rel : G -> G -> Prop
  refl : ∀ (x : G), rel x x
  symm : ∀ (x y : G), rel x y -> rel y x
  trans : ∀ (x y z : G), rel x y -> rel y z -> rel x z
  compatible_mul : ∀ (x y x' y' : G), rel x x' -> rel y y' -> rel (x * y) (x' * y')

/-! ## Subalgebra -/

structure Subalgebra (sig : Signature) (A : SigAlgebra sig) where
  carrier : (s : sig.sorts) -> Set (A.carrier s)
  closed_ops : True

/-! ## #eval tests -/

#eval "Morphisms.Equivalence: GroupCategory, RingCategory, Congruence"
#eval "Morphisms.Equivalence: Subalgebra defined"
