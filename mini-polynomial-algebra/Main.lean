import MiniPolynomialAlgebra

/-!
# mini-polynomial-algebra

Comprehensive polynomial algebra library in Lean 4.

## Overview

This package provides formalizations of:
- Polynomial rings R[X] over rings and fields
- Polynomial degree, leading coefficient, monic polynomials
- Division algorithm for polynomials over fields
- Roots and irreducibility criteria
- Minimal polynomials and field extensions
- Eisenstein criterion and factorization
- Polynomial ring as an algebraic structure

## Usage

```lean
import MiniPolynomialAlgebra

open MiniPolynomialAlgebra

-- Construct a polynomial
#check fun (R : Ring) => Polynomial R

-- Check irreducibility
#check fun (F : Field) (p : Polynomial F.ring) => isIrreducible p
```
-/

def main : IO Unit :=
  IO.println "mini-polynomial-algebra: Polynomial, degree, division, irreducible, minimalPolynomial"
