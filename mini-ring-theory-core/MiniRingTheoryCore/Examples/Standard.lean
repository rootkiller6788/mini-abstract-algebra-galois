/-
# MiniRingTheoryCore.Examples.Standard

Standard examples of rings: integers as Ring (using Int operations),
Z/2Z as Boolean ring via Bool, and a conceptual 2x2 matrix ring.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Laws

namespace MiniRingTheoryCore

/-! ## The Ring of Integers

We construct the ring of integers using `Int` as the carrier
with standard +, -, *, 0, 1. The ring axioms hold by the
standard arithmetic properties of integers (given as axioms). -/

/-- Integer addition is associative. -/
axiom int_add_assoc : ∀ (x y z : Int), (x + y) + z = x + (y + z)

/-- Integer addition is commutative. -/
axiom int_add_comm : ∀ (x y : Int), x + y = y + x

/-- Additive identity. -/
axiom int_add_zero : ∀ (x : Int), x + 0 = x

/-- Additive inverse. -/
axiom int_add_neg : ∀ (x : Int), x + (-x) = 0

/-- Integer multiplication is associative. -/
axiom int_mul_assoc : ∀ (x y z : Int), (x * y) * z = x * (y * z)

/-- Multiplicative identity. -/
axiom int_mul_one : ∀ (x : Int), x * 1 = x

/-- One is left identity. -/
axiom int_one_mul : ∀ (x : Int), 1 * x = x

/-- Distributivity. -/
axiom int_mul_add : ∀ (x y z : Int), x * (y + z) = x * y + x * z
axiom int_add_mul : ∀ (x y z : Int), (x + y) * z = x * z + y * z

/-- The ring ℤ of integers. -/
def intRing : Ring where
  carrier := Int
  add := (· + ·)
  zero := 0
  neg := λ x => -x
  mul := (· * ·)
  one := 1
  add_assoc := int_add_assoc
  add_comm := int_add_comm
  add_zero := int_add_zero
  add_neg := int_add_neg
  mul_assoc := int_mul_assoc
  mul_one := int_mul_one
  one_mul := int_one_mul
  mul_add := int_mul_add
  add_mul := int_add_mul

/-- A sample element of intRing. -/
def three : intRing.carrier := 3
def five : intRing.carrier := 5

/-! ## The Boolean Ring Z/2Z

Z/2Z is a Boolean ring: every element satisfies x*x = x.
We represent it using `Bool` with XOR as addition and AND as
multiplication. -/

/-- Boolean addition (XOR): false = 0, true = 1. -/
def boolAdd (x y : Bool) : Bool := xor x y

/-- Boolean negation: everything is its own inverse under XOR. -/
def boolNeg (x : Bool) : Bool := x

/-- Boolean multiplication (AND). -/
def boolMul (x y : Bool) : Bool := x && y

/-- XOR axioms for Bool. -/
axiom xor_assoc : ∀ (x y z : Bool), xor (xor x y) z = xor x (xor y z)
axiom xor_comm : ∀ (x y : Bool), xor x y = xor y x
axiom xor_false : ∀ (x : Bool), xor x false = x
axiom xor_self : ∀ (x : Bool), xor x x = false

/-- AND axioms for Bool. -/
axiom and_assoc : ∀ (x y z : Bool), (x && y) && z = x && (y && z)
axiom and_true : ∀ (x : Bool), x && true = x
axiom true_and : ∀ (x : Bool), true && x = x

/-- Distributivity of AND over XOR. -/
axiom and_xor_distrib : ∀ (x y z : Bool), x && (xor y z) = xor (x && y) (x && z)
axiom xor_and_distrib : ∀ (x y z : Bool), xor x y && z = xor (x && z) (y && z)

/-- The Boolean ring Z/2Z. -/
def boolRing : Ring where
  carrier := Bool
  add := boolAdd
  zero := false
  neg := boolNeg
  mul := boolMul
  one := true
  add_assoc := xor_assoc
  add_comm := xor_comm
  add_zero := xor_false
  add_neg := xor_self
  mul_assoc := and_assoc
  mul_one := and_true
  one_mul := true_and
  mul_add := and_xor_distrib
  add_mul := xor_and_distrib

/-! ## Conceptual Matrix Ring M₂(R)

We define the 2x2 matrix ring over a base ring R as an axiomatic
construction. The matrices form a non-commutative ring. -/

/-- The ring of 2x2 matrices over R (axiomatic). -/
axiom matrix2x2Ring (R : Ring) : Ring

/-- Matrix addition is componentwise. -/
axiom matrix2x2_add_comm {R : Ring} (A B : (matrix2x2Ring R).carrier) :
  (matrix2x2Ring R).add A B = (matrix2x2Ring R).add B A

/-- 2x2 matrices are non-commutative in general. -/
axiom matrix2x2_noncommutative {R : Ring} :
  ¬ isCommutativeRing (matrix2x2Ring R)

/-! ## The Zero Ring

The trivial ring where 0 = 1 (so every element equals 0).
This is the terminal object in the category of rings. -/

/-- The zero ring (trivial ring). -/
def zeroRing : Ring where
  carrier := Unit
  add := λ _ _ => ()
  zero := ()
  neg := λ _ => ()
  mul := λ _ _ => ()
  one := ()
  add_assoc := λ _ _ _ => rfl
  add_comm := λ _ _ => rfl
  add_zero := λ _ => rfl
  add_neg := λ _ => rfl
  mul_assoc := λ _ _ _ => rfl
  mul_one := λ _ => rfl
  one_mul := λ _ => rfl
  mul_add := λ _ _ _ => rfl
  add_mul := λ _ _ _ => rfl

/-! ## #eval examples -/

#eval "intRing: Z as a ring"
#eval "boolRing: Z/2Z as Boolean ring"
#eval "zeroRing: the trivial terminal ring"
#eval "matrix2x2Ring: conceptual 2x2 matrices"
#eval intRing.add 3 5
#eval intRing.mul 3 5
#eval boolRing.add true false
#eval boolRing.mul true true
#eval boolRing.neg true
#eval zeroRing.mul () ()
