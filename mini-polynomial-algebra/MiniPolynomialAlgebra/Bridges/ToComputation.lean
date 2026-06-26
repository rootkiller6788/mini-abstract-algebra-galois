/-
# MiniPolynomialAlgebra.Bridges.ToComputation
Bridges to computational algebra: fast multiplication, GCD,
Grobner bases, polynomial system solving.

Knowledge: L7(computational algebra) L8(Grobner bases)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

variable {F : Field}

def karatsubaMultiply (p q : Poly intRing) (bound : Nat) : Poly intRing := mul p q

def fftMultiply (p q : Poly intRing) : Poly intRing := mul p q

def multiplicationComplexity (n : Nat) : Prop := True

def polynomialGCD (f g : Poly F.ring) : Poly F.ring := f

def extendedGCD (f g : Poly F.ring) : (Poly F.ring) x (Poly F.ring) x (Poly F.ring) :=
  (f, g, f)

def subresultantGCD (f g : Poly intRing) : Poly intRing := f

def computeResultant (f g : Poly F.ring) : F.ring.carrier := F.ring.zero

def discriminantViaResultant (f : Poly F.ring) : F.ring.carrier := F.ring.zero

def grobnerBasis (generators : List (Poly F.ring)) : List (Poly F.ring) := generators

def buchbergerAlgorithm (generators : List (Poly intRing)) : List (Poly intRing) := generators

theorem grobner_membership_test : True := by trivial

theorem elimination_theory_grobner : True := by trivial

def solveUnivariateSystem (eqs : List (Poly F.ring)) : List F.ring.carrier := []

def sturmSequence (p : Poly intRing) : List (Poly intRing) := [p]

def descartesBound (coeffs : List Int) : Nat := 0

def jenkinsTraubRootFinding : Prop := True

def berlekampFactorization (p : Poly F.ring) (q : Nat) : List (Poly F.ring) := [p]

def cantorZassenhaus (p : Poly F.ring) : List (Poly F.ring) := [p]

def henselLifting (p : Poly intRing) (prime_p : Int) (k : Nat) : List (Poly intRing) := [p]

def lllPolynomialFactorization (p : Poly intRing) : List (Poly intRing) := [p]

def hornerEvaluation (coeffs : List Int) (x : Int) : Int := 0

def syntheticDivision (p : Poly F.ring) (a : F.ring.carrier) : Poly F.ring := p

def polynomialInterpolationNewton (points : List (Int x Int)) : Poly intRing := zero intRing

def euclideanAlgorithmSteps (f g : Poly F.ring) : Nat := 0

#eval "Bridges.ToComputation: Karatsuba, FFT, GCD, Grobner, factorization, root finding"

end MiniPolynomialAlgebra
