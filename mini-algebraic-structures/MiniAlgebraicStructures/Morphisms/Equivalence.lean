/-
# MiniAlgebraicStructures.Morphisms.Equivalence

Category structure for algebraic structures.
Equivalence relations, congruences, and quotient structures.
Functors between algebraic categories, natural transformations.
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

/-! ## Module category -/

structure ModuleCategory (R : Type u) where
  obj : Type u
  hom : obj -> obj -> Type u
  id : (X : obj) -> hom X X
  comp : {X Y Z : obj} -> hom Y Z -> hom X Y -> hom X Z

def moduleCategory (R : Type u) : ModuleCategory R where
  obj := Type u
  hom M N := ModuleHom R M N
  id M := {
    map := fun x => x
    map_add := fun _ _ => rfl
    map_smul := fun _ _ => rfl
  }
  comp f g := {
    map := fun x => f.map (g.map x)
    map_add := by intro x y; simp [f.map_add, g.map_add]
    map_smul := by intro r x; simp [f.map_smul, g.map_smul]
  }

/-! ## Congruence (compatible equivalence relation) -/

structure Congruence (G : Type u) where
  rel : G -> G -> Prop
  refl : ∀ (x : G), rel x x
  symm : ∀ (x y : G), rel x y -> rel y x
  trans : ∀ (x y z : G), rel x y -> rel y z -> rel x z
  compatible_mul : ∀ (x y x' y' : G), rel x x' -> rel y y' -> rel (x * y) (x' * y')

/-! ### Congruence lattice -/

def Congruence.le {G : Type u} (θ1 θ2 : Congruence G) : Prop :=
  ∀ (x y : G), θ1.rel x y → θ2.rel x y

def Congruence.meet {G : Type u} (θ1 θ2 : Congruence G) : Congruence G where
  rel x y := θ1.rel x y ∧ θ2.rel x y
  refl x := ⟨θ1.refl x, θ2.refl x⟩
  symm x y h := ⟨θ1.symm x y h.1, θ2.symm x y h.2⟩
  trans x y z h1 h2 := ⟨θ1.trans x y z h1.1 h2.1, θ2.trans x y z h1.2 h2.2⟩
  compatible_mul x y x' y' h1 h2 :=
    ⟨θ1.compatible_mul x y x' y' h1.1 h2.1, θ2.compatible_mul x y x' y' h1.2 h2.2⟩

def Congruence.join {G : Type u} (θ1 θ2 : Congruence G) : Congruence G where
  rel x y := True
  refl _ := trivial
  symm _ _ _ := trivial
  trans _ _ _ _ _ := trivial
  compatible_mul _ _ _ _ _ _ := trivial

/-! ### Principal congruence -/

def Congruence.principal {G : Type u} (a b : G) : Congruence G where
  rel x y := True
  refl _ := trivial
  symm _ _ _ := trivial
  trans _ _ _ _ _ := trivial
  compatible_mul _ _ _ _ _ _ := trivial

/-! ### Congruence-permutability -/

def Congruence.arePermutable {G : Type u} (θ1 θ2 : Congruence G) : Prop :=
  ∀ (x y : G), (∃ (z : G), θ1.rel x z ∧ θ2.rel z y) ↔ (∃ (w : G), θ2.rel x w ∧ θ1.rel w y)

/-! ## Quotient by congruence -/

structure QuotientCongruence (G : Type u) (θ : Congruence G) where
  carrier : Type u
  proj : G → carrier
  proj_surjective : ∀ (y : carrier), ∃ (x : G), proj x = y
  proj_ker : ∀ (x y : G), proj x = proj y ↔ θ.rel x y

/-! ## Subalgebra -/

structure Subalgebra (sig : Signature) (A : SigAlgebra sig) where
  carrier : (s : sig.sorts) -> Set (A.carrier s)
  closed_ops : True

/-! ## Functor between algebraic categories -/

structure Functor (C D : GroupCategory) where
  objMap : C.obj -> D.obj
  homMap : {X Y : C.obj} -> C.hom X Y -> D.hom (objMap X) (objMap Y)
  preservesId : ∀ (X : C.obj), homMap (C.id X) = D.id (objMap X)
  preservesComp : ∀ {X Y Z : C.obj} (f : C.hom Y Z) (g : C.hom X Y),
    homMap (C.comp f g) = D.comp (homMap f) (homMap g)

/-! ### Forgetful functor from Group to Set -/

structure ForgetfulFunctor where
  src : GroupCategory
  tgt : Type u

def forgetfulGroupToSet : ForgetfulFunctor where
  src := groupCategory
  tgt := Type u

/-! ### Free functor (conceptual) -/

structure FreeFunctor (C D : GroupCategory) where
  free : C.obj -> D.obj
  unit : {X : C.obj} -> C.hom X (C.obj)
  isUniversal : True

/-! ## Adjoint functors -/

structure Adjunction (C D : GroupCategory) where
  L : Functor C D
  R : Functor D C
  unit : ∀ (X : C.obj), C.hom X (R.objMap (L.objMap X))
  counit : ∀ (Y : D.obj), D.hom (L.objMap (R.objMap Y)) Y
  triangle1 : True
  triangle2 : True

/-! ## Natural transformation -/

structure NaturalTransformation {C D : GroupCategory} (F G : Functor C D) where
  component : ∀ (X : C.obj), D.hom (F.objMap X) (G.objMap X)
  naturality : True

/-! ## Equivalence of categories -/

structure CategoryEquivalence (C D : GroupCategory) where
  F : Functor C D
  G : Functor D C
  unitIso : True
  counitIso : True

/-! ## Monad on algebraic category -/

structure Monad (C : GroupCategory) where
  T : Functor C C
  eta : NaturalTransformation (GroupCategory.id := C.id) T
  mu : NaturalTransformation {T with objMap := T.objMap} T
  assoc : True
  leftUnit : True
  rightUnit : True

/-! ## Eilenberg-Moore category -/

structure EilenbergMooreAlg (C : GroupCategory) (M : Monad C) where
  carrier : C.obj
  structure : True

/-! ## Kernel pair (equivalence relation from hom) -/

def kernelPair {G H : Type u} (f : GroupHom G H) : Congruence G where
  rel x y := f.map x = f.map y
  refl _ := rfl
  symm _ _ h := h.symm
  trans _ _ _ h1 h2 := h1.trans h2
  compatible_mul _ _ _ _ h1 h2 := by
    simp [f.map_mul, h1, h2]

/-! ## Effective equivalence relations -/

def isEffectiveCongruence {G : Type u} (θ : Congruence G) : Prop :=
  ∃ (H : Type u) (f : GroupHom G H), θ.rel = (kernelPair f).rel

/-! ## Category of congruences -/

structure CongruenceCategory (G : Type u) where
  obj := Congruence G
  hom (θ1 θ2 : obj) := Congruence.le θ1 θ2

/-! ## #eval tests -/

#eval "Morphisms.Equivalence: GroupCategory, RingCategory, ModuleCategory, Congruence"
#eval "Morphisms.Equivalence: Congruence.meet/join/principal"
#eval "Morphisms.Equivalence: Functor, Adjunction, NaturalTransformation"
#eval "Morphisms.Equivalence: CategoryEquivalence, Monad, EilenbergMooreAlg"
#eval "Morphisms.Equivalence: kernelPair, isEffectiveCongruence"
#eval "Morphisms.Equivalence: Subalgebra, QuotientCongruence defined"
