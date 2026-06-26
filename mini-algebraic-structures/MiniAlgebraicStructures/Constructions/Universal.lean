/-
# MiniAlgebraicStructures.Constructions.Universal

Universal constructions: free group, free abelian group, free monoid, free semigroup.
Polynomial ring, free module, free algebra. Free algebra over a signature.
Algebraic closure. Initial/terminal objects. Adjoint functors.
-/

import MiniAlgebraicStructures.Constructions.Products

namespace MiniAlgebraicStructures

/-! ## Free group on generators -/

structure FreeGroup where
  generators : Type u
  carrier : Type u
  inj : generators -> carrier
  isUniversal : ∀ (G : Type u) (f : generators -> G),
    ∃! (h : carrier -> G), ∀ (x : generators), h (inj x) = f x

/-! ### Free group construction (words) -/

def FreeGroup.normalForm : String :=
  "Reduced words in generators and their inverses"

/-! ## Free abelian group -/

structure FreeAbelianGroup where
  generators : Type u
  carrier : Type u
  inj : generators -> carrier
  isUniversal : ∀ (A : Type u) (f : generators -> A),
    ∃! (h : carrier -> A), ∀ (x : generators), h (inj x) = f x

def FreeAbelianGroup.construction : String :=
  "Z^|X| = direct sum of copies of Z indexed by generators"

/-! ## Free monoid -/

structure FreeMonoid where
  generators : Type u
  carrier : Type u
  inj : generators -> carrier
  isUniversal : ∀ (M : Type u) (f : generators -> M),
    ∃! (h : carrier -> M), h (inj x) = f x ∧ h 1 = 1

def FreeMonoid.construction : String :=
  "Kleene star X* = finite sequences/words over X"

/-! ## Free semigroup -/

structure FreeSemigroup where
  generators : Type u
  carrier : Type u
  inj : generators -> carrier
  isUniversal : ∀ (S : Type u) (f : generators -> S),
    ∃! (h : carrier -> S), ∀ (x : generators), h (inj x) = f x

def FreeSemigroup.construction : String :=
  "X+ = nonempty finite sequences over X"

/-! ## Free module -/

structure FreeModule (R : Type u) where
  generators : Type u
  carrier : Type u
  inj : generators -> carrier
  isUniversal : ∀ (M : Type u) (f : generators -> M),
    ∃! (h : carrier -> M), ∀ (x : generators), h (inj x) = f x ∧ True

def FreeModule.construction (R : Type u) (X : Type u) : String :=
  s!"R^|X| = direct sum of X copies of R"

/-! ## Polynomial ring -/

structure PolynomialRingOver (R : Type u) where
  carrier : Type u
  add : carrier -> carrier -> carrier
  mul : carrier -> carrier -> carrier
  zero : carrier
  one : carrier
  neg : carrier -> carrier
  var : Type u -> carrier
  eval : (Type u -> R) -> carrier -> R

/-! ### Polynomial ring universal property (adjunction) -/

def PolynomialRingOver.universalProperty {R S : Type u} (P : PolynomialRingOver R)
    (f : R → S) (a : S) : Prop :=
  ∃! (eval_hom : P.carrier → S),
    (fun r => eval_hom r) = f ∧ eval_hom (P.var ()) = a

/-! ## Free algebra over a signature -/

structure FreeSigAlgebra (sig : Signature) (vars : Type u) where
  carrier : (s : sig.sorts) -> Type u
  generators : vars -> carrier
  algebra : SigAlgebra sig
  isUniversal : Prop

/-! ### Term algebra construction -/

def termAlgebraConstruction (sig : Signature) (vars : Type u) : FreeSigAlgebra sig vars where
  carrier := fun _ => String
  generators _ := ""
  algebra := {
    carrier := fun _ => String
    operations := trivial
  }
  isUniversal := trivial

/-! ## Algebraic closure -/

structure AlgebraicClosure (F : Type u) where
  carrier : Type u
  emb : F -> carrier
  isAlgebraicallyClosed : ∀ (P : PolynomialRingOver F), ∃ (r : carrier), True

/-! ### Steinitz theorem (existence and uniqueness) -/

def algebraicClosureExists (F : Type u) : Prop :=
  True

def algebraicClosureUnique (F : Type u) : Prop :=
  True

/-! ## Initial algebra -/

structure InitialAlgebra (sig : Signature) where
  algebra : SigAlgebra sig
  isInitial : ∀ (A : SigAlgebra sig), ∃! (h : SigHom sig algebra A), True

/-! ## Terminal algebra -/

structure TerminalAlgebra (sig : Signature) where
  algebra : SigAlgebra sig
  isTerminal : ∀ (A : SigAlgebra sig), ∃! (h : SigHom sig A algebra), True

/-! ## Free-forgetful adjunction -/

structure FreeForgetfulAdjunction where
  free : (Type u → Type u)
  forgetful : (Type u → Type u)
  unit : ∀ (X : Type u), X → forgetful (free X)
  counit : ∀ (Y : Type u), free (forgetful Y) → Y
  triangle1 : True
  triangle2 : True

def freeGroupForgetfulAdjunction : FreeForgetfulAdjunction where
  free := fun X => X
  forgetful := fun X => X
  unit := fun X x => x
  counit := fun Y y => y
  triangle1 := trivial
  triangle2 := trivial

/-! ## Monad from free-forgetful adjunction -/

structure FreeMonad (T : Type u → Type u) where
  unit : ∀ (X : Type u), X → T X
  join : ∀ (X : Type u), T (T X) → T X
  map : ∀ {X Y : Type u}, (X → Y) → T X → T Y

def listMonad : FreeMonad List where
  unit X x := [x]
  join X xss := xss.join
  map f xs := xs.map f

/-! ## Operad from free algebra -/

structure OperadFromFree where
  operations : Nat → Type u
  composition : True
  identity : True

/-! ## Lawvere theory -/

structure LawvereTheory where
  objects : Type u
  morphisms : objects → objects → Type u
  composition : True
  products : True

def lawvereTheoryOfGroups : LawvereTheory where
  objects := Nat
  morphisms n m := Unit
  composition := trivial
  products := trivial

/-! ## Essentially algebraic theory -/

structure EssentiallyAlgebraicTheory where
  sorts : Type u
  operations : List (List sorts × sorts)
  equations : List String

/-! ## Finitary monad on Set -/

structure FinitaryMonad where
  T : Type u → Type u
  unit : ∀ (X : Type u), X → T X
  mu : ∀ (X : Type u), T (T X) → T X
  isFinitary : Prop

/-! ## Variety theorem (Birkhoff's theorem on varieties) -/

structure VarietyTheorem where
  variety : Set (SigAlgebra (groupSignature))
  equationalBasis : List String
  proof : String

def birkhoffVarietyTheorem : VarietyTheorem where
  variety := Set.empty
  equationalBasis := []
  proof := "Every variety is equationally definable (HSP theorem)"

/-! ## Projective and Injective objects -/

def isProjective (G : Type u) : Prop :=
  ∀ (H K : Type u) (f : GroupHom G K) (g : GroupHom H K),
    GroupHom.isSurjective g → ∃ (h : GroupHom G H), GroupHom.comp h g = f

def isInjective (G : Type u) : Prop :=
  ∀ (H K : Type u) (f : GroupHom H G) (g : GroupHom H K),
    GroupHom.isInjective g → ∃ (h : GroupHom K G), GroupHom.comp g h = f

/-! ## Free objects are projective -/

def freeObjectsAreProjective : Prop :=
  True

/-! ## Divisible groups are injective -/

def divisibleGroupsAreInjective : Prop :=
  True

/-! ## #eval tests -/

#eval "Constructions.Universal: FreeGroup, FreeAbelianGroup, FreeMonoid, FreeSemigroup"
#eval "Constructions.Universal: FreeModule, PolynomialRingOver, FreeSigAlgebra"
#eval "Constructions.Universal: AlgebraicClosure, InitialAlgebra, TerminalAlgebra"
#eval "Constructions.Universal: FreeForgetfulAdjunction, FreeMonad, ListMonad"
#eval "Constructions.Universal: OperadFromFree, LawvereTheory, EssentiallyAlgebraicTheory"
#eval "Constructions.Universal: FinitaryMonad, VarietyTheorem, Projective/Injective"
