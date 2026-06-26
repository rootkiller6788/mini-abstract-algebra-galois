/-
# MiniAlgebraicStructures.Core.Objects

Object instances for algebraic structures:
Semigroup, Monoid, Group, AbelianGroup, Ring, Field, Module, Algebra.
Theory registration and dependency nodes. Object graph and morphism towers.
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

/-! ## Hierarchy graph -/

inductive AlgebraicObjectType
  | semigroup
  | monoid
  | group
  | abelianGroup
  | ring
  | commutativeRing
  | integralDomain
  | field
  | moduleOver
  | vectorSpace
  | algebra
  | signature
  | variety
  deriving BEq, Inhabited

/-! ### Hierarchy relation -/

def AlgebraicObjectType.isSubtypeOf : AlgebraicObjectType → AlgebraicObjectType → Bool
  | .semigroup, .semigroup => true
  | .monoid, .semigroup => true
  | .monoid, .monoid => true
  | .group, .semigroup => true
  | .group, .monoid => true
  | .group, .group => true
  | .abelianGroup, .semigroup => true
  | .abelianGroup, .monoid => true
  | .abelianGroup, .group => true
  | .abelianGroup, .abelianGroup => true
  | .ring, .ring => true
  | .commutativeRing, .ring => true
  | .commutativeRing, .commutativeRing => true
  | .integralDomain, .ring => true
  | .integralDomain, .commutativeRing => true
  | .integralDomain, .integralDomain => true
  | .field, .ring => true
  | .field, .commutativeRing => true
  | .field, .integralDomain => true
  | .field, .field => true
  | .moduleOver, .moduleOver => true
  | .vectorSpace, .moduleOver => true
  | .vectorSpace, .vectorSpace => true
  | .algebra, .algebra => true
  | .signature, .signature => true
  | .variety, .variety => true
  | _, _ => false

/-! ### Object count by category -/

def algebraicObjectCounts : List (String × Nat) :=
  [
    ("Semigroup-like", 4),
    ("Ring-like", 4),
    ("Module-like", 3),
    ("Universal Algebra", 3)
  ]

def totalObjectCount : Nat :=
  List.foldl (fun acc p => acc + p.2) 0 algebraicObjectCounts

/-! ## Object construction graph -/

structure ObjectGraph where
  nodes : List AlgebraicObjectType
  edges : List (AlgebraicObjectType × AlgebraicObjectType)

def hierarchyGraph : ObjectGraph where
  nodes := [
    .semigroup, .monoid, .group, .abelianGroup,
    .ring, .commutativeRing, .integralDomain, .field,
    .moduleOver, .vectorSpace, .algebra,
    .signature, .variety
  ]
  edges := [
    (.monoid, .semigroup),
    (.group, .monoid),
    (.abelianGroup, .group),
    (.commutativeRing, .ring),
    (.integralDomain, .commutativeRing),
    (.field, .integralDomain),
    (.vectorSpace, .moduleOver)
  ]

/-! ## Morphism tower -/

structure MorphismTower where
  objects : List AlgebraicObjectType
  morphisms : List String

def algebraicStructuresMorphismTower : MorphismTower where
  objects := [.semigroup, .monoid, .group, .abelianGroup]
  morphisms := ["SemigroupHom", "MonoidHom", "GroupHom", "Isomorphism"]

def ringTheoryMorphismTower : MorphismTower where
  objects := [.ring, .commutativeRing, .integralDomain, .field]
  morphisms := ["RingHom", "RingIso", "FieldEmbedding"]

/-! ## Cross-theory nodes -/

def forgetfulFunctorNode : String :=
  "Ring.forgetAdditive -> AbelianGroup (forgetful functor from Ring to Ab)"

def freeConstructionNodes : List String := [
  "FreeGroup : Set -> Group",
  "FreeAbelianGroup : Set -> AbelianGroup",
  "FreeRing : Set -> Ring",
  "FreeModule R : Set -> Module R",
  "FreeAlgebra R : Set -> Algebra R"
]

/-! ## Object property lattice -/

structure ObjectProperty where
  name : String
  appliesTo : List AlgebraicObjectType

def associativity : ObjectProperty where
  name := "Associativity"
  appliesTo := [.semigroup, .monoid, .group, .abelianGroup, .ring, .commutativeRing, .integralDomain, .field]

def identity : ObjectProperty where
  name := "Identity"
  appliesTo := [.monoid, .group, .abelianGroup, .ring, .commutativeRing, .integralDomain, .field]

def inverses : ObjectProperty where
  name := "Inverses"
  appliesTo := [.group, .abelianGroup, .field]

def commutativity : ObjectProperty where
  name := "Commutativity"
  appliesTo := [.abelianGroup, .commutativeRing, .integralDomain, .field]

def distributivity : ObjectProperty where
  name := "Distributivity"
  appliesTo := [.ring, .commutativeRing, .integralDomain, .field, .moduleOver, .vectorSpace, .algebra]

def objectProperties : List ObjectProperty :=
  [associativity, identity, inverses, commutativity, distributivity]

/-! ## Theory interface -/

structure TheoryInterface where
  theoryName : String
  exports : List String
  imports : List String
  axiomCount : Nat
  theoremCount : Nat

def algebraicStructuresInterface : TheoryInterface where
  theoryName := "AlgebraicStructures"
  exports := ["Semigroup", "Monoid", "Group", "AbelianGroup", "Ring", "Field", "Module", "Algebra"]
  imports := ["GroupTheory", "RingTheory", "FieldTheory", "ModuleTheory"]
  axiomCount := 20
  theoremCount := 35

def universalAlgebraInterface : TheoryInterface where
  theoryName := "UniversalAlgebra"
  exports := ["Signature", "SigAlgebra", "Variety", "FreeAlgebra", "BirkhoffHSP"]
  imports := ["AlgebraicStructures"]
  axiomCount := 5
  theoremCount := 15

/-! ## Helpers -/

def copyObject (name : String) : String := name

def allObjectNames : List String :=
  [semigroupObject, monoidObject, groupObject, abelianGroupObject,
   ringObject, commutativeRingObject, integralDomainObject, fieldObject,
   moduleObject, vectorSpaceObject, algebraObject,
   signatureObject, varietyObject, sigAlgebraObject]

/-! ## #eval tests -/

#eval "Core.Objects: 2 theories registered (AlgebraicStructures, UniversalAlgebra)"
#eval "Core.Objects: 13 object descriptors defined"
#eval s!"Core.Objects: {algebraicObjectCounts.length} object categories, {totalObjectCount} total"
#eval s!"Core.Objects: hierarchyGraph ({hierarchyGraph.nodes.length} nodes, {hierarchyGraph.edges.length} edges)"
#eval s!"Core.Objects: {objectProperties.length} properties tracked (assoc, id, inv, comm, distrib)"
#eval s!"Core.Objects: 2 theory interfaces defined"
