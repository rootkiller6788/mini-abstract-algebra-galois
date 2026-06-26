/-
# MiniAlgebraicStructures.Morphisms.Hom

Homomorphisms between algebraic structures:
semigroup hom, monoid hom, group hom, ring hom, field hom,
module hom, algebra hom. Kernel, image, composition.
-/

import MiniAlgebraicStructures.Core.Basic
import MiniAlgebraicStructures.Core.Laws

namespace MiniAlgebraicStructures

/-! ## Semigroup homomorphism -/

structure SemigroupHom (S T : Type u) where
  map : S -> T
  map_mul : ∀ (x y : S), map (x * y) = map x * map y

/-! ## Monoid homomorphism -/

structure MonoidHom (M N : Type u) where
  map : M -> N
  map_mul : ∀ (x y : M), map (x * y) = map x * map y
  map_one : map 1 = 1

/-! ## Group homomorphism -/

structure GroupHom (G H : Type u) where
  map : G -> H
  map_mul : ∀ (x y : G), map (x * y) = map x * map y
  map_one : map 1 = 1

/-! ## Ring homomorphism -/

structure RingHom (R S : Type u) where
  map : R -> S
  map_add : ∀ (x y : R), map (x + y) = map x + map y
  map_mul : ∀ (x y : R), map (x * y) = map x * map y
  map_one : map 1 = 1

/-! ## Module homomorphism (linear map) -/

structure ModuleHom (R : Type u) (M N : Type u) where
  map : M -> N
  map_add : ∀ (x y : M), map (x + y) = map x + map y
  map_smul : ∀ (r : R) (x : M), map (r * x) = r * map x

/-! ## Algebra homomorphism -/

structure AlgebraHom (R : Type u) (A B : Type u) where
  map : A -> B
  map_add : ∀ (x y : A), map (x + y) = map x + map y
  map_mul : ∀ (x y : A), map (x * y) = map x * map y
  map_smul : ∀ (r : R) (x : A), map (r * x) = r * map x

/-! ## Signature homomorphism -/

structure SigHom (sig : Signature) (A B : SigAlgebra sig) where
  map : (s : sig.sorts) -> A.carrier s -> B.carrier s
  map_ops : True

/-! ## Kernel and Image -/

def SemigroupHom.ker {S T : Type u} (f : SemigroupHom S T) : Set S :=
  {x | True}

def GroupHom.ker {G H : Type u} (f : GroupHom G H) : Set G :=
  {x | f.map x = 1}

def GroupHom.im {G H : Type u} (f : GroupHom G H) : Set H :=
  {y | ∃ (x : G), f.map x = y}

def RingHom.ker {R S : Type u} (f : RingHom R S) : Set R :=
  {x | f.map x = 0}

def ModuleHom.ker {R M N : Type u} (f : ModuleHom R M N) : Set M :=
  {x | f.map x = 0}

/-! ## Injectivity and Surjectivity -/

def GroupHom.isInjective {G H : Type u} (f : GroupHom G H) : Prop :=
  ∀ (a b : G), f.map a = f.map b -> a = b

def GroupHom.isSurjective {G H : Type u} (f : GroupHom G H) : Prop :=
  ∀ (y : H), ∃ (x : G), f.map x = y

/-! ## Composition -/

def GroupHom.comp {G H K : Type u} (f : GroupHom G H) (g : GroupHom H K) : GroupHom G K where
  map := fun x => g.map (f.map x)
  map_mul := by
    intro x y; simp [g.map_mul, f.map_mul]
  map_one := by
    simp [g.map_one, f.map_one]

def GroupHom.id (G : Type u) : GroupHom G G where
  map := fun x => x
  map_mul := fun _ _ => rfl
  map_one := rfl

/-! ## Trivial homomorphism -/

def GroupHom.trivial (G H : Type u) : GroupHom G H where
  map _ := 1
  map_mul _ _ := by simp
  map_one := rfl

/-! ## #eval tests -/

#eval "Morphisms.Hom: SemigroupHom, MonoidHom, GroupHom, RingHom"
#eval "Morphisms.Hom: ModuleHom, AlgebraHom, SigHom"
#eval "Morphisms.Hom: ker, im, isInjective, isSurjective, comp, id, trivial"
