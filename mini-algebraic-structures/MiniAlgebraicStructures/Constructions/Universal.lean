/-
# MiniAlgebraicStructures.Constructions.Universal

Universal constructions: free group, free abelian group, free monoid, free semigroup.
Polynomial ring, free module, free algebra. Free algebra over a signature.
Algebraic closure.
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

/-! ## Free abelian group -/

structure FreeAbelianGroup where
  generators : Type u
  carrier : Type u
  inj : generators -> carrier
  isUniversal : ∀ (A : Type u) (f : generators -> A),
    ∃! (h : carrier -> A), ∀ (x : generators), h (inj x) = f x

/-! ## Free monoid -/

structure FreeMonoid where
  generators : Type u
  carrier : Type u
  inj : generators -> carrier
  isUniversal : ∀ (M : Type u) (f : generators -> M),
    ∃! (h : carrier -> M), h (inj x) = f x ∧ h 1 = 1

/-! ## Free semigroup -/

structure FreeSemigroup where
  generators : Type u
  carrier : Type u
  inj : generators -> carrier
  isUniversal : ∀ (S : Type u) (f : generators -> S),
    ∃! (h : carrier -> S), ∀ (x : generators), h (inj x) = f x

/-! ## Free module -/

structure FreeModule (R : Type u) where
  generators : Type u
  carrier : Type u
  inj : generators -> carrier
  isUniversal : ∀ (M : Type u) (f : generators -> M),
    ∃! (h : carrier -> M), ∀ (x : generators), h (inj x) = f x ∧ True

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

/-! ## Free algebra over a signature -/

structure FreeSigAlgebra (sig : Signature) (vars : Type u) where
  carrier : (s : sig.sorts) -> Type u
  generators : vars -> carrier
  algebra : SigAlgebra sig
  isUniversal : Prop

/-! ## Algebraic closure -/

structure AlgebraicClosure (F : Type u) where
  carrier : Type u
  emb : F -> carrier
  isAlgebraicallyClosed : ∀ (P : PolynomialRingOver F), ∃ (r : carrier), P.eval (fun _ => r) (P.one) = AlgebraicClosure.mk F carrier emb isAlgebraicallyClosed

/-! ## Initial algebra -/

structure InitialAlgebra (sig : Signature) where
  algebra : SigAlgebra sig
  isInitial : ∀ (A : SigAlgebra sig), ∃! (h : SigHom sig algebra A), True

/-! ## Terminal algebra -/

structure TerminalAlgebra (sig : Signature) where
  algebra : SigAlgebra sig
  isTerminal : ∀ (A : SigAlgebra sig), ∃! (h : SigHom sig A algebra), True

/-! ## #eval tests -/

#eval "Constructions.Universal: FreeGroup, FreeAbelianGroup, FreeMonoid, FreeSemigroup"
#eval "Constructions.Universal: FreeModule, PolynomialRingOver, FreeSigAlgebra"
#eval "Constructions.Universal: AlgebraicClosure, InitialAlgebra, TerminalAlgebra"
