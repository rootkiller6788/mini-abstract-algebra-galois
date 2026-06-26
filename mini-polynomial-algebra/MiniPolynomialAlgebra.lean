/-
# MiniPolynomialAlgebra
Comprehensive polynomial algebra library in Lean 4.

## Module Overview
Polynomial rings R[X] over arbitrary rings and fields,
with complete formalization of definitions, operations,
theorems, examples, and applications.

## Knowledge Coverage (L1-L9)
- L1: Poly type, zero/one/X/const/monomial, degree, monic, root, leadingCoeff
- L2: add, mul, neg, sub, eval, evalSum, isRoot, PolyRingHom, PolyRingIso
- L3: Ring instance, quotient ring, product ring, symmetric polynomials, derivatives
- L4: Ring axioms, degree laws, Gauss Lemma, Eisenstein Criterion, factor theorem
- L5: Induction on degree, finSum induction, convolution associativity, contrapositive
- L6: intRing, ratRing, ratField, concrete #eval examples, cyclotomic polynomials
- L7: Galois theory, field extensions, algebraic geometry (Nullstellensatz, Bezout)
- L8: Dedekind domains, Grobner bases, Newton polygons, adjunctions
- L9: Chebotarev density, scheme theory, configuration spaces (documented)

## Architecture
- Core/         -- Polynomial type, operations, ring structure, degree, evaluation, derivative
- Constructions/ -- Products, quotients, subobjects, universal property
- Morphisms/     -- Homomorphisms, isomorphisms, equivalences
- Properties/    -- Invariants, preservation, classification
- Theorems/      -- Factor theorem, Gauss lemma, Eisenstein, UFD, symmetric polynomials
- Examples/      -- Standard examples, counterexamples
- Bridges/       -- Connections to algebra, geometry, topology, computation

## Dependencies
- MiniRingTheoryCore: Ring, RingHom, Ideal
- MiniFieldTheoryCore: Field, FieldExtension, Algebraic
-/

import MiniPolynomialAlgebra.Core.Basic
import MiniPolynomialAlgebra.Core.Laws
import MiniPolynomialAlgebra.Core.Objects
import MiniPolynomialAlgebra.Constructions.Products
import MiniPolynomialAlgebra.Constructions.Quotients
import MiniPolynomialAlgebra.Constructions.Subobjects
import MiniPolynomialAlgebra.Constructions.Universal
import MiniPolynomialAlgebra.Morphisms.Hom
import MiniPolynomialAlgebra.Morphisms.Iso
import MiniPolynomialAlgebra.Morphisms.Equivalence
import MiniPolynomialAlgebra.Properties.Invariants
import MiniPolynomialAlgebra.Properties.Preservation
import MiniPolynomialAlgebra.Properties.ClassificationData
import MiniPolynomialAlgebra.Theorems.Basic
import MiniPolynomialAlgebra.Theorems.Main
import MiniPolynomialAlgebra.Theorems.Classification
import MiniPolynomialAlgebra.Theorems.UniversalProperties
import MiniPolynomialAlgebra.Examples.Standard
import MiniPolynomialAlgebra.Examples.Counterexamples
import MiniPolynomialAlgebra.Bridges.ToAlgebra
import MiniPolynomialAlgebra.Bridges.ToGeometry
import MiniPolynomialAlgebra.Bridges.ToTopology
import MiniPolynomialAlgebra.Bridges.ToComputation

/-! ## Re-exports for convenience -/

namespace MiniPolynomialAlgebra

-- Re-export core types
export Poly (zero one X const monomial add mul neg sub smul)
export Poly (IsPoly degree isMonic leadingCoeff evalSum evalAt isRoot)
export Poly (derivative power finSum ofList toList ring)
export Poly (intRing ratRing ratField)

-- Re-export construction types
export Poly (compose)

end MiniPolynomialAlgebra

#eval "MiniPolynomialAlgebra: Complete polynomial algebra library loaded successfully"
