/-
# MiniPolynomialAlgebra.Examples.Standard
Standard examples of polynomial rings, irreducible polynomials,
field extensions via polynomials, special polynomial computations.

Knowledge: L6(canonical examples with #eval verification)
-/

import MiniPolynomialAlgebra.Core.Basic

namespace MiniPolynomialAlgebra
open MiniRingTheoryCore
open MiniFieldTheoryCore
open Poly

/-! ### Polynomial Rings over Common Fields -/

def realPolynomialExample : Poly intRing := ofList [1, 0, -2]  -- X^2 - 2

def rationalPolynomialExample : Poly ratRing := ofList [1, 2, 1]  -- X^2 + 2X + 1 = (X+1)^2

def integerPolynomialExample : Poly intRing := ofList [6, -5, 1]  -- X^2 - 5X + 6 = (X-2)(X-3)

/-! ### Irreducible Polynomial Examples -/

def x2plus1 : Poly intRing := ofList [1, 0, 1]  -- X^2 + 1, irreducible over R, reducible over C

def x2minus2 : Poly intRing := ofList [-2, 0, 1]  -- X^2 - 2, irreducible over Q

def x3minus2 : Poly intRing := ofList [-2, 0, 0, 1]  -- X^3 - 2, irreducible over Q (Eisenstein p=2)

def x4plus1 : Poly intRing := ofList [1, 0, 0, 0, 1]  -- X^4 + 1, irreducible over Q

def cyclotomic5Example : Poly intRing := ofList [1, 1, 1, 1, 1]  -- Phi_5, irreducible over Q

def eisensteinExample : Poly intRing := ofList [2, 3, 0, 0, 1]  -- X^4 + 3X + 2, Eisenstein with p=?

/-! ### Reducible Polynomial Examples -/

def x2minus1 : Poly intRing := ofList [-1, 0, 1]  -- (X-1)(X+1)

def x2minus4 : Poly intRing := ofList [-4, 0, 1]  -- (X-2)(X+2)

def x3minus1 : Poly intRing := ofList [-1, 0, 0, 1]  -- (X-1)(X^2+X+1)

def x4minus1 : Poly intRing := ofList [-1, 0, 0, 0, 1]  -- (X-1)(X+1)(X^2+1)

def perfectSquare : Poly intRing := ofList [1, -2, 1]  -- (X-1)^2

def perfectCube : Poly intRing := ofList [-1, 3, -3, 1]  -- (X-1)^3

/-! ### Field Extension Examples -/

def complexAsQuotient : Poly intRing := x2plus1  -- R[X]/(X^2+1) ~= C

def rationalAdjoinSqrt2 : Poly ratRing := ofList [-2, 0, 1]  -- Q[X]/(X^2-2) ~= Q(sqrt(2))

def rationalAdjoinCubeRoot2 : Poly ratRing := ofList [-2, 0, 0, 1]  -- Q[X]/(X^3-2) ~= Q(cbrt(2))

/-! ### Polynomial Operations Examples -/

def p_add_example : Poly intRing := add x2plus1 x2minus2  -- (X^2+1)+(X^2-2) = 2X^2-1

def p_mul_example : Poly intRing := mul x2minus1 x2plus1  -- (X^2-1)(X^2+1) = X^4-1

def derivative_example : Poly intRing := derivative x3minus2  -- D(X^3-2) = 3X^2

/-! ### Root Verification Examples -/

#eval evalSum x2plus1 0 10      -- 1
#eval evalSum x2plus1 1 10      -- 2
#eval evalSum x2minus2 1 10     -- -1
#eval evalSum x2minus2 2 10     -- 2
#eval evalSum x3minus2 1 10     -- -1
#eval evalSum x3minus2 2 10     -- 6

-- Verify factorizations
#eval evalSum perfectSquare 1 10   -- 0 (root at X=1)
#eval evalSum perfectSquare 2 10   -- 1

-- Verify irreducibility examples
#eval evalSum x4plus1 1 10       -- 2 (no integer root)
#eval evalSum x4plus1 2 10       -- 17 (no integer root)

-- Derivative examples
#eval evalSum derivative_example 0 10   -- 0
#eval evalSum derivative_example 1 10   -- 3 (derivative at 1)
#eval evalSum derivative_example 2 10   -- 12 (derivative at 2)

/-! ### Special Polynomial Evaluations -/

def chebyshev_T5 : Poly intRing := chebyshevT 5
#eval evalSum chebyshev_T5 1 10    -- T_5(1) = 1
#eval evalSum chebyshev_T5 0 10    -- T_5(0) = 0 (odd)
#eval evalSum chebyshev_T5 (-1) 10 -- T_5(-1) = -1 (odd)

def legendre_P4 : Poly intRing := legendreP 4
#eval evalSum legendre_P4 1 10     -- P_4(1) = 1
#eval evalSum legendre_P4 (-1) 10  -- P_4(-1) = 1 (even)

def hermite_H3 : Poly intRing := hermiteH 3
#eval evalSum hermite_H3 0 10      -- H_3(0) = 0 (odd)

/-! ### Cyclotomic Polynomials -/

def phi3 : Poly intRing := cyclotomic 3  -- X^2 + X + 1
#eval evalSum phi3 1 10             -- 3

def phi4 : Poly intRing := cyclotomic 4  -- X^2 + 1
#eval evalSum phi4 0 10             -- 1
#eval evalSum phi4 1 10             -- 2

/-! ### Quadratic Formula Examples -/

-- For X^2 - 5X + 6 = 0: discriminant = 25 - 24 = 1, roots = (5 +/- 1)/2 = 3, 2
#eval evalSum integerPolynomialExample 2 10   -- 0 (root)
#eval evalSum integerPolynomialExample 3 10   -- 0 (root)

/-! ### Polynomial Composition Examples -/

def composed_poly : Poly intRing := compose x2plus1 (ofList [0, 1])  -- (X)^2 + 1 = X^2 + 1
#eval evalSum composed_poly 3 10    -- 10

/-! ### Vieta Verification -/

-- X^2 - 5X + 6: sum of roots = 5, product = 6
-- roots are 2 and 3: 2+3=5, 2*3=6 -- verified

#eval "Examples.Standard: polynomial rings, irreducible examples, field extensions, #eval verification"

end MiniPolynomialAlgebra
