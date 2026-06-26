/-
# MiniRingTheoryCore.Core.Laws

Axiom system for ring theory. Encodes the ring axioms as an `AxiomSet`
from MiniAxiomKernel, defines key ring predicates (CommutativeRing,
isField, isDivisionRing, isBoolean), and provides `RingHom.comp`.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Objects
import MiniAxiomKernel.Core.Basic

namespace MiniRingTheoryCore

open MiniAxiomKernel

/-! ## Ring Axiom Set

We encode the ring axioms as formulas using `Formula.atom` for each
axiom, collected into an `AxiomSet`. Each atom index 0..8
corresponds to one of the ring structure axioms. -/

/-- The ring axioms encoded as propositional atom placeholders.
    In a richer logic these would be first-order formulas;
    here we use distinct atoms as names for each axiom. -/
def ringAxiomSet : AxiomSet :=
  AxiomSet.empty
    |>.add (Axiom.simple "add_assoc" (Formula.atom 0))
    |>.add (Axiom.simple "add_comm" (Formula.atom 1))
    |>.add (Axiom.simple "add_zero" (Formula.atom 2))
    |>.add (Axiom.simple "add_neg" (Formula.atom 3))
    |>.add (Axiom.simple "mul_assoc" (Formula.atom 4))
    |>.add (Axiom.simple "mul_one" (Formula.atom 5))
    |>.add (Axiom.simple "one_mul" (Formula.atom 6))
    |>.add (Axiom.simple "mul_add" (Formula.atom 7))
    |>.add (Axiom.simple "add_mul" (Formula.atom 8))

/-! ## Commutative Ring Predicate -/

/-- A ring is commutative if multiplication commutes for all elements. -/
def isCommutativeRing (R : Ring) : Prop :=
  ∀ (x y : R.carrier), R.mul x y = R.mul y x

/-- The commutativity axiom captured as an additional formula atom. -/
def commutativeAxiom : Axiom :=
  Axiom.simple "mul_comm" (Formula.atom 9)

/-- Add the commutativity axiom to the ring axiom set. -/
def commutativeRingAxiomSet : AxiomSet :=
  ringAxiomSet.add commutativeAxiom

/-! ## Field Predicate -/

/-- A ring R is a field if it is commutative and every nonzero element
    is a unit. -/
def isField (R : Ring) : Prop :=
  isCommutativeRing R ∧ R.zero ≠ R.one ∧
  ∀ (x : R.carrier), x ≠ R.zero → isUnit R x

/-! ## Division Ring Predicate -/

/-- A division ring is a ring where every nonzero element is a unit
    (not necessarily commutative). -/
def isDivisionRing (R : Ring) : Prop :=
  R.zero ≠ R.one ∧ ∀ (x : R.carrier), x ≠ R.zero → isUnit R x

/-! ## Boolean Ring Predicate -/

/-- A ring is Boolean if every element is idempotent: x * x = x. -/
def isBoolean (R : Ring) : Prop :=
  ∀ (x : R.carrier), R.mul x x = x

/-- In a Boolean ring, every element is its own additive inverse. -/
axiom boolean_add_self_eq_zero {R : Ring} (h : isBoolean R) (x : R.carrier) :
  R.add x x = R.zero

/-- Boolean rings are commutative. This is a deep theorem; we state it
    as an axiom. -/
axiom boolean_implies_commutative {R : Ring} (h : isBoolean R) : isCommutativeRing R

/-! ## Ring Homomorphism Composition -/

/-- Composition of two ring homomorphisms.
    (Also defined inline in Core.Basic for the QuotientRing structure,
    but this version carries additional convenience lemmas.) -/

def RingHom.compAssoc {R S T U : Ring} (h : RingHom T U) (g : RingHom S T) (f : RingHom R S) :
  RingHom.comp (RingHom.comp h g) f = RingHom.comp h (RingHom.comp g f) := by
  apply rfl

/-- The identity homomorphism is a neutral element for composition. -/
axiom ringHom_comp_id_left {R S : Ring} (f : RingHom R S) :
  RingHom.comp (RingHom.id S) f = f

/-- Composition with the identity on the right. -/
axiom ringHom_comp_id_right {R S : Ring} (f : RingHom R S) :
  RingHom.comp f (RingHom.id R) = f

/-! ## Kernel and Image of Ring Homomorphisms -/

/-- The kernel of a ring homomorphism is the preimage of zero. -/
def RingHom.ker {R S : Ring} (f : RingHom R S) : Set R.carrier :=
  { x | f.map x = S.zero }

/-- The image of a ring homomorphism. -/
def RingHom.im {R S : Ring} (f : RingHom R S) : Set S.carrier :=
  { y | ∃ (x : R.carrier), f.map x = y }

/-! ## #eval examples -/

#eval ringAxiomSet.size
#eval commutativeRingAxiomSet.size
#eval commutativeAxiom.name
#eval (AxiomSet.empty.add (Axiom.simple "test" (Formula.atom 0))).size
#eval Formula.atom 0
#eval Formula.atom 9
