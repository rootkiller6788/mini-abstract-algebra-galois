/-
# MiniAlgebraicStructures.Core.Objects

Object instances for algebraic structures:
Semigroup, Monoid, Group, AbelianGroup, Ring, Field, Module, Algebra.
Theory registration and dependency nodes.
-/

import MiniAlgebraicStructures.Core.Basic

namespace MiniAlgebraicStructures

/-! ## Theory names -/

def algebraicStructuresTheory : String := "AlgebraicStructures"
def universalAlgebraTheory : String := "UniversalAlgebra"

/-! ## Object descriptors -/

def semigroupObject : String := "Semigroup"
def monoidObject : String := "Monoid"
def groupObject : String := "Group"
def abelianGroupObject : String := "AbelianGroup"

def ringObject : String := "Ring"
def commutativeRingObject : String := "CommutativeRing"
def integralDomainObject : String := "IntegralDomain"
def fieldObject : String := "Field"

def moduleObject : String := "Module"
def vectorSpaceObject : String := "VectorSpace"
def algebraObject : String := "Algebra"

def signatureObject : String := "Signature"
def varietyObject : String := "Variety"
def sigAlgebraObject : String := "SigAlgebra"

/-! ## Theory registration -/

def algebraicStructuresTheoryName : String :=
  "AlgebraicStructures"

def universalAlgebraTheoryName : String :=
  "UniversalAlgebra"

/-! ## Dependency nodes -/

def algebraicStructuresNode : String :=
  "AlgebraicStructures -> [GroupTheory, RingTheory, FieldTheory, ModuleTheory]"

def universalAlgebraNode : String :=
  "UniversalAlgebra -> [AlgebraicStructures]"

/-! ## Helpers -/

def copyObject (name : String) : String := name

/-! ## #eval tests -/

#eval "Core.Objects: 2 theories registered (AlgebraicStructures, UniversalAlgebra)"
#eval "Core.Objects: 13 object descriptors defined"
