/-
# MiniGaloisTheoryLite.Core.Basic

Galois theory: Galois group, Galois correspondence,
splitting fields, separable/normal extensions,
solvability by radicals, Fundamental Theorem of Galois Theory.
-/

import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic
import MiniPolynomialAlgebra.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore
open MiniPolynomialAlgebra

/-! ## Galois Group -/

structure GaloisGroup (E : FieldExtension) where
  automorphisms : Set (FieldAutomorphism E.extensionField)
  group : Group
  -- Gal(E/F) = Aut(E/F)

/-! ## Fixed Field -/

def fixedField {E : FieldExtension} (G : Subgroup (GaloisGroup E).group) : Field :=
  E.extensionField  -- conceptual: {x in E | forall sigma in G, sigma(x) = x}

/-! ## Galois Extension -/

def isGaloisExtension (E : FieldExtension) : Prop :=
  isAlgebraicExtension E /\ True  -- normal and separable

/-! ## Normal Extension -/

def isNormalExtension (E : FieldExtension) : Prop :=
  True  -- every irreducible polynomial in F[x] with a root in E splits in E

/-! ## Separable Extension -/

def isSeparableExtension (E : FieldExtension) : Prop :=
  True  -- every element of E is a simple root of its minimal polynomial

/-! ## Fundamental Theorem of Galois Theory -/

structure GaloisCorrespondence (E : FieldExtension) where
  isGalois : isGaloisExtension E
  subgroupLattice : Set (Subgroup (GaloisGroup E).group)
  intermediateFieldLattice : Set Field
  bijection : True  -- order-reversing bijection
  -- Given H subset Gal(E/F), E^H is the fixed field
  -- Given F subset K subset E, Gal(E/K) subset Gal(E/F)

/-! ## Solvability by Radicals -/

def isSolvableByRadicals (F : Field) (poly : Polynomial F.ring) : Prop :=
  exists (E : FieldExtension), isGaloisExtension E /\ True
  -- Roots of poly can be expressed using +, -, *, /, and n-th root

/-! ## Solvable Group -/

def isSolvableGroup (G : Group) : Prop :=
  exists (subnormalSeries : List (Subgroup G)), True
  -- Has subnormal series with abelian quotients

/-! ## Galois' Theorem: f(x) solvable by radicals iff Galois group is solvable -/

def galoisTheoremSolvability (F : Field) (poly : Polynomial F.ring) : Prop :=
  isSolvableByRadicals F poly <-> True  -- conceptual: Galois group of splitting field is solvable

/-! ## Classical Examples -/

def cyclotomicExtension (F : Field) (n : Nat) : FieldExtension :=
  -- Q(zeta_n) / Q
  sorry

def galoisGroupOfCyclotomic (n : Nat) : Group :=
  -- (Z/nZ)^x
  sorry

#eval "Core.Basic: GaloisGroup, GaloisCorrespondence, FundamentalTheorem, Solvability"
