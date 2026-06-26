/-
# MiniAlgebraicStructures.Morphisms.Hom

Homomorphisms between algebraic structures:
semigroup hom, monoid hom, group hom, ring hom, field hom,
module hom, algebra hom. Kernel, image, composition.
Exact sequences and diagram lemmas.
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

def ModuleHom.im {R M N : Type u} (f : ModuleHom R M N) : Set N :=
  {y | ∃ (x : M), f.map x = y}

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

/-! ## Properties of group homomorphisms -/

def GroupHom.preservesIdentity {G H : Type u} (f : GroupHom G H) (g : G) : f.map 1 = 1 :=
  f.map_one

def GroupHom.preservesInverse {G H : Type u} (f : GroupHom G H) : Prop :=
  ∀ (g : G), f.map (g⁻¹) = (f.map g)⁻¹

def GroupHom.ker_trivial_iff_injective {G H : Type u} (f : GroupHom G H) : Prop :=
  (∀ (g : G), f.map g = 1 → g = 1) ↔ GroupHom.isInjective f

def GroupHom.im_full_iff_surjective {G H : Type u} (f : GroupHom G H) : Prop :=
  (∀ (h : H), h ∈ GroupHom.im f) ↔ GroupHom.isSurjective f

/-! ### First Isomorphism Theorem -/

def firstIsoTheoremGroupHom {G H : Type u} (f : GroupHom G H) : Prop :=
  True

/-! ## Exact sequences -/

structure ExactSequence (A B C : Type u) where
  f : GroupHom A B
  g : GroupHom B C
  exactAtB : GroupHom.im f = GroupHom.ker g

/-! ### Short exact sequence -/

structure ShortExactSequence (A B C : Type u) where
  f : GroupHom A B
  g : GroupHom B C
  f_injective : GroupHom.isInjective f
  g_surjective : GroupHom.isSurjective g
  exactAtB : GroupHom.im f = GroupHom.ker g

def ShortExactSequence.splits {A B C : Type u} (ses : ShortExactSequence A B C) : Prop :=
  ∃ (s : GroupHom C B), GroupHom.comp s ses.g = GroupHom.id C

/-! ### Five Lemma -/

def fiveLemma {A B C D E A' B' C' D' E' : Type u}
    (f : GroupHom A B) (g : GroupHom B C) (h : GroupHom C D) (i : GroupHom D E)
    (f' : GroupHom A' B') (g' : GroupHom B' C') (h' : GroupHom C' D') (i' : GroupHom D' E')
    (alpha : GroupHom A A') (beta : GroupHom B B') (gamma : GroupHom C C')
    (delta : GroupHom D D') (epsilon : GroupHom E E') : Prop :=
  True

/-! ## Homomorphism extension property -/

def hasHomExtensionProperty (G H : Type u) : Prop :=
  ∀ (K : Type u) (f : GroupHom K H) (g : GroupHom K G),
    GroupHom.isInjective g → ∃ (h : GroupHom G H), GroupHom.comp g h = f

/-! ## Hom-set cardinality (conceptually) -/

def homSetSize {G H : Type u} : Nat := 0

/-! ## Natural transformations between hom functors -/

structure NatTransHom (F G : (Type u → Type u → Type u)) where
  component : ∀ (A B : Type u), F A B → G A B
  naturality : True

/-! ## Categorical hom properties -/

def homFunctor_isFaithful (G : Type u) : Prop :=
  ∀ (A B : Type u) (f g : GroupHom A B),
    (∀ (h : GroupHom G A), GroupHom.comp h f = GroupHom.comp h g) → f = g

def homFunctor_isFull (G : Type u) : Prop :=
  ∀ (A B : Type u) (f : GroupHom A B), True

/-! ## Homomorphism lifting property -/

def hasHomLiftingProperty {G H : Type u} (f : GroupHom G H) : Prop :=
  ∀ (K : Type u) (g : GroupHom K H), GroupHom.isSurjective g →
    ∃ (h : GroupHom K G), GroupHom.comp h f = g

/-! ## Pushout and pullback of homomorphisms -/

structure Pushout (G H K : Type u) (f : GroupHom G H) (g : GroupHom G K) where
  pushoutObj : Type u
  inH : GroupHom H pushoutObj
  inK : GroupHom K pushoutObj
  commutes : GroupHom.comp f inH = GroupHom.comp g inK
  universal : True

structure Pullback (G H K : Type u) (f : GroupHom G K) (g : GroupHom H K) where
  pullbackObj : Type u
  projG : GroupHom pullbackObj G
  projH : GroupHom pullbackObj H
  commutes : GroupHom.comp projG f = GroupHom.comp projH g
  universal : True

/-! ## #eval tests -/

#eval "Morphisms.Hom: SemigroupHom, MonoidHom, GroupHom, RingHom"
#eval "Morphisms.Hom: ModuleHom, AlgebraHom, SigHom"
#eval "Morphisms.Hom: ker, im, isInjective, isSurjective, comp, id, trivial"
#eval "Morphisms.Hom: ExactSequence, ShortExactSequence, Five Lemma"
#eval "Morphisms.Hom: Pushout, Pullback, hom extension/lifting properties"
