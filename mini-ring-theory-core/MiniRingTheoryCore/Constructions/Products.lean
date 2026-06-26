/-
# MiniRingTheoryCore.Constructions.Products

Direct product construction for rings, universal property,
and a conceptual PolynomialRing[R, X] construction.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Morphisms.Hom

namespace MiniRingTheoryCore

/-! ## Direct Product Ring

Given two rings R and S, the direct product R × S is a ring
with componentwise operations. -/

/-- The direct product ring R × S with componentwise operations. -/
def DirectProduct (R S : Ring) : Ring where
  carrier := R.carrier × S.carrier
  add := λ (r1, s1) (r2, s2) => (R.add r1 r2, S.add s1 s2)
  zero := (R.zero, S.zero)
  neg := λ (r, s) => (R.neg r, S.neg s)
  mul := λ (r1, s1) (r2, s2) => (R.mul r1 r2, S.mul s1 s2)
  one := (R.one, S.one)
  add_assoc := λ x y z => Prod.ext (R.add_assoc x.1 y.1 z.1) (S.add_assoc x.2 y.2 z.2)
  add_comm := λ x y => Prod.ext (R.add_comm x.1 y.1) (S.add_comm x.2 y.2)
  add_zero := λ x => Prod.ext (R.add_zero x.1) (S.add_zero x.2)
  add_neg := λ x => Prod.ext (R.add_neg x.1) (S.add_neg x.2)
  mul_assoc := λ x y z => Prod.ext (R.mul_assoc x.1 y.1 z.1) (S.mul_assoc x.2 y.2 z.2)
  mul_one := λ x => Prod.ext (R.mul_one x.1) (S.mul_one x.2)
  one_mul := λ x => Prod.ext (R.one_mul x.1) (S.one_mul x.2)
  mul_add := λ x y z => Prod.ext (R.mul_add x.1 y.1 z.1) (S.mul_add x.2 y.2 z.2)
  add_mul := λ x y z => Prod.ext (R.add_mul x.1 y.1 z.1) (S.add_mul x.2 y.2 z.2)

/-! ## Canonical Projections -/

/-- The projection onto the first factor. -/
def prodProjLeft (R S : Ring) : RingHom (DirectProduct R S) R where
  map := λ p => p.1
  map_add _ _ := rfl
  map_mul _ _ := rfl
  map_one := rfl

/-- The projection onto the second factor. -/
def prodProjRight (R S : Ring) : RingHom (DirectProduct R S) S where
  map := λ p => p.2
  map_add _ _ := rfl
  map_mul _ _ := rfl
  map_one := rfl

/-! ## Diagonal Embedding -/

/-- The diagonal embedding Δ: R → R × R, x ↦ (x, x). -/
def diagonalEmbedding (R : Ring) : RingHom R (DirectProduct R R) where
  map := λ x => (x, x)
  map_add _ _ := rfl
  map_mul _ _ := rfl
  map_one := rfl

/-! ## Universal Property of the Product

For any ring T with homomorphisms f: T → R and g: T → S,
there is a unique h: T → R × S making the diagram commute. -/

/-- The induced map ⟨f, g⟩: T → R × S given by t ↦ (f(t), g(t)). -/
def prodUniversalMap {T R S : Ring} (f : RingHom T R) (g : RingHom T S) :
  RingHom T (DirectProduct R S) where
  map t := (f.map t, g.map t)
  map_add x y := Prod.ext (f.map_add x y) (g.map_add x y)
  map_mul x y := Prod.ext (f.map_mul x y) (g.map_mul x y)
  map_one := Prod.ext f.map_one g.map_one

/-- The universal property: any pair of homomorphisms factors
    uniquely through the product projections. -/
axiom productUniversalProperty {T R S : Ring} (f : RingHom T R) (g : RingHom T S) :
  ∃! (h : RingHom T (DirectProduct R S)),
    RingHom.comp (prodProjLeft R S) h = f ∧
    RingHom.comp (prodProjRight R S) h = g

/-- ProductRing is an alias for DirectProduct, emphasizing the
    categorical product construction. -/
def ProductRing (R S : Ring) : Ring := DirectProduct R S

/-! ## Polynomial Ring R[x] — Conceptual Construction

We define R[x] as the ring of finite sequences (coeffs) with
convolution multiplication. This is a conceptual placeholder
for the full polynomial ring construction. -/

/-- A polynomial is conceptually a finite sequence of coefficients.
    We use Nat → carrier with finite support, but for this conceptual
    model we just take List of coefficients. -/
def PolynomialCoeffs (R : Ring) : Type := List R.carrier

/-- Polynomial ring R[x] defined axiomatically.
    Full construction requires formal power series / finitely
    supported sequences. This axiom asserts its existence. -/
axiom PolynomialRing (R : Ring) : Ring

/-- The variable x ∈ R[x]. -/
axiom polynomialVar {R : Ring} : (PolynomialRing R).carrier

/-- The constant embedding R → R[x]. -/
axiom polynomialEmbedding {R : Ring} : RingHom R (PolynomialRing R)

/-- Evaluation homomorphism at r ∈ R. -/
axiom polynomialEval {R : Ring} (r : R.carrier) :
  RingHom (PolynomialRing R) R

/-! ## #eval examples -/

#eval "DirectProduct: componentwise ring structure"
#eval "prodProjLeft, prodProjRight: canonical projections"
#eval "diagonalEmbedding: Δ: R → R × R"
#eval "PolynomialRing[R, X]: conceptual placeholder"
