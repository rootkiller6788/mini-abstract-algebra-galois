/-
# MiniFieldTheoryCore.Bridges.ToComputation

Finite field arithmetic, factoring polynomials over finite fields,
and applications to coding theory and cryptography.
-/

import MiniFieldTheoryCore.Core.Basic
import MiniFieldTheoryCore.Properties.ClassificationData

namespace MiniFieldTheoryCore

/-! ## Finite field element representation -/

structure FqElement where
  fieldOrder : Nat
  representative : Nat  -- value mod p^n
  deriving Repr

axiom fqAdd (a b : FqElement) : FqElement
axiom fqMul (a b : FqElement) : FqElement
axiom fqInv (a : FqElement) : Option FqElement

/-! ## Construct finite field GF(p^n) conceptually -/

axiom constructFq (p n : Nat) (hprime : True) : Field

/-! ## Discrete logarithm in finite fields -/

axiom discreteLogarithm {F : Field} (g x : F.ring.carrier) (h : True) : Option Nat

axiom diffieHellmanFiniteField (p g : Nat) (a b : Nat) : Prop

/-! ## Polynomial factoring over finite fields (Berlekamp, Cantor-Zassenhaus) -/

axiom berlekampAlgorithm {F : Field} (poly : List F.ring.carrier) : List (List F.ring.carrier)
  -- Given a polynomial over F_q, return its irreducible factors

axiom cantorZassenhaus {F : Field} (p : Nat) (poly : List F.ring.carrier) : List Nat

/-! ## Factoring polynomials over Z (Zassenhaus, LLL) -/

axiom factorOverZ (coeffs : List ℤ) : List (List ℤ)

axiom kroneckerMethod (coeffs : List ℤ) : List (List ℤ)
  -- Historical: Kronecker's method for factoring in Z[x]

/-! ## Applications to coding theory -/

structure LinearCode (F : Field) where
  n : Nat      -- block length
  k : Nat      -- dimension
  generatorMatrix : Fin k → Fin n → F.ring.carrier

axiom reedSolomonCode (q : Nat) (n k : Nat) : LinearCode (by
  exact constructFq q 1 (by trivial))

axiom bchCode (q : Nat) (n k : Nat) (d : Nat) : LinearCode (by
  exact constructFq q 1 (by trivial))

axiom goppaCode (q m : Nat) (t : Nat) : LinearCode (by
  exact constructFq q m (by trivial))

/-! ## Applications to cryptography -/

axiom ellipticCurveOverFq (p : Nat) (a b : Nat) : Prop
  -- y² = x³ + ax + b over F_p with 4a³ + 27b² ≠ 0

axiom ecdhKeyExchange (curve : Prop) (privA privB : Nat) : Nat

/-! ## #eval examples -/

#eval "Bridges.ToComputation: FqElement (fieldOrder, representative)"
#eval "Bridges.ToComputation: constructFq, discreteLogarithm, diffieHellman"
#eval "Bridges.ToComputation: Berlekamp, Cantor-Zassenhaus polynomial factoring"
#eval "Bridges.ToComputation: factorOverZ, kroneckerMethod"
#eval "Bridges.ToComputation: ReedSolomon, BCH, Goppa codes over finite fields"
#eval "Bridges.ToComputation: ellipticCurve over F_p, ECDH key exchange"
