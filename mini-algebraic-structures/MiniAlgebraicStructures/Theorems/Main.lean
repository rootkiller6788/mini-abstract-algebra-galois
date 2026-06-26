/-
# MiniAlgebraicStructures.Theorems.Main

Pillar theorems and total axiom inventory for algebraic structures.
Summary of all theorems, their interconnections, and proof methods.
-/

import MiniAlgebraicStructures.Theorems.Classification

namespace MiniAlgebraicStructures

/-! ## Pillar Theorems -/

structure Pillars where
  birkhoffHSP : String
  isomorphismTheorems : String
  lagrangeTheorem : String
  sylowTheorems : String
  jordanHolder : String
  maltsevConditions : String
  jonssonLemma : String

def pillars : Pillars where
  birkhoffHSP := birkhoffHSPFull
  isomorphismTheorems := firstIsomorphismTheorem
  lagrangeTheorem := lagrangeTheorem
  sylowTheorems := sylowExistence
  jordanHolder := jordanHolderTheorem
  maltsevConditions := maltsevCondition
  jonssonLemma := jonssonLemma

/-! ## Extended pillar set (12 pillars) -/

structure ExtendedPillars extends Pillars where
  fundamentalTheoremFiniteAbelian : String
  structureTheoremModulesOverPID : String
  cayleyTheorem : String
  adjointFunctorTheorem : String
  becksMonadicity : String

def extendedPillars : ExtendedPillars where
  toPillars := pillars
  fundamentalTheoremFiniteAbelian := fundamentalTheoremFiniteAbelianGroups
  structureTheoremModulesOverPID := structureTheoremModulesOverPID
  cayleyTheorem := cayleyTheorem
  adjointFunctorTheorem := adjointFunctorTheoremAlg
  becksMonadicity := becksMonadicityTheorem

/-! ## Total axiom inventory -/

def algebraicStructuresTotalAxioms : List String :=
  algebraicStructuresAxioms ++
  [
    firstIsomorphismTheorem, secondIsomorphismTheorem, thirdIsomorphismTheorem,
    sylowExistence, sylowConjugacy, sylowCounting,
    burnsideLemma, fundamentalTheoremFiniteAbelianGroups,
    jordanHolderTheorem, schreierRefinementTheorem, feitThompsonTheorem,
    birkhoffHSPFull,
    freeGroupUniversal, freeAbelianGroupUniversal, freeMonoidUniversal, freeSemigroupUniversal,
    freeModuleUniversal, polynomialRingUniversal,
    quotientGroupUniversal, quotientRingUniversal,
    freeSigAlgebraUniversal, initialAlgebraUniversal,
    algebraicClosureUniversal, tensorProductUniversal,
    maltsevCondition, maltsevTerm,
    congruencePermutable, congruenceDistributive, congruenceModular,
    jonssonLemma, bakersTheorem, lyndonsTheorem,
    mckenzieCharacterization, maltsevTypeClassification,
    ClassificationOfFiniteSimpleGroups
  ]

/-! ## Theorems by proof technique -/

def theoremsByProofTechnique : List (String × List String) := [
  ("Induction on structure", [
    "Birkhoff HSP (structural induction on terms)",
    "Free algebra construction (term induction)",
    "Jordan-Holder (induction on composition length)"
  ]),
  ("Diagonalization / Cantor", [
    "Cardinality arguments in infinite algebra",
    "Uncountable spectra in varieties"
  ]),
  ("Compactness", [
    "Equational compactness theorem",
    "Ultraproduct constructions"
  ]),
  ("Lattice-theoretic", [
    "Jonsson's Lemma (congruence lattice analysis)",
    "TCT (lattice of tolerances)",
    "Subdirect representation"
  ]),
  ("Category-theoretic", [
    "Adjoint functor theorem",
    "Beck's monadicity",
    "Yoneda lemma applications"
  ]),
  ("Combinatorial", [
    "Sylow theorems (group actions + counting)",
    "Burnside / Polya (orbit counting)",
    "Ramsey theory in varieties"
  ])
]

/-! ## Theorem dependency graph -/

structure TheoremNode where
  name : String
  dependsOn : List String
  usedIn : List String

def mainTheoremDependencies : List TheoremNode := [
  {name := "Birkhoff HSP", dependsOn := ["HSP operators", "Equational logic"], usedIn := ["Maltsev conditions", "Variety theory"]},
  {name := "Isomorphism Theorems", dependsOn := ["Homomorphisms", "Kernel/Image"], usedIn := ["Jordan-Holder", "Galois correspondence"]},
  {name := "Lagrange", dependsOn := ["Cosets", "Group order"], usedIn := ["Sylow", "Cauchy", "Class equation"]},
  {name := "Sylow Theorems", dependsOn := ["Lagrange", "Group actions"], usedIn := ["Simple group classification", "p-groups"]},
  {name := "Jordan-Holder", dependsOn := ["Isomorphism theorems", "Composition series"], usedIn := ["Schreier refinement", "Krull-Schmidt"]},
  {name := "Maltsev Conditions", dependsOn := ["Birkhoff HSP", "Free algebras"], usedIn := ["TCT", "Decidable varieties"]},
  {name := "Jonsson's Lemma", dependsOn := ["Maltsev conditions", "Ultraproducts"], usedIn := ["Baker's theorem", "Finite basis"]}
]

/-! ## Coverage summary by chapter -/

structure ChapterCoverage where
  chapter : String
  topics : List String
  covered : Nat
  total : Nat

def algebraicStructuresChapterCoverage : List ChapterCoverage := [
  {chapter := "1. Semigroups, Monoids, Groups", topics := ["Definitions", "Examples", "Substructures"], covered := 3, total := 3},
  {chapter := "2. Homomorphisms and Isomorphisms", topics := ["Homs", "Isos", "Automorphisms"], covered := 3, total := 3},
  {chapter := "3. Quotients and Isomorphism Theorems", topics := ["Normal subgroups", "Quotients", "Iso theorems"], covered := 3, total := 3},
  {chapter := "4. Products and Free Objects", topics := ["Direct product", "Semidirect", "Free product", "Tensor product", "Free objects"], covered := 5, total := 5},
  {chapter := "5. Group Actions and Sylow Theory", topics := ["Group actions", "Sylow", "Class equation", "Burnside"], covered := 4, total := 4},
  {chapter := "6. Rings, Ideals, and Modules", topics := ["Rings", "Ideals", "Modules", "Chain conditions"], covered := 4, total := 4},
  {chapter := "7. Universal Algebra", topics := ["Signatures", "Algebras", "Varieties", "Birkhoff HSP"], covered := 4, total := 4},
  {chapter := "8. Maltsev Conditions and TCT", topics := ["Maltsev terms", "Congruence varieties", "TCT 5 types"], covered := 3, total := 3},
  {chapter := "9. Classification Theorems", topics := ["CFSG", "Post's lattice", "Minimal varieties"], covered := 3, total := 3},
  {chapter := "10. Bridges", topics := ["Rep theory", "Lie algebras", "Topology", "Geometry", "Computation"], covered := 5, total := 5}
]

def totalCovered : Nat :=
  List.foldl (fun acc c => acc + c.covered) 0 algebraicStructuresChapterCoverage

def totalTopics : Nat :=
  List.foldl (fun acc c => acc + c.total) 0 algebraicStructuresChapterCoverage

/-! ## #eval tests -/

#eval "Theorems.Main: 7 pillar theorems (12 extended)"
#eval s!"Total algebraic structures axioms: {algebraicStructuresTotalAxioms.length}"
#eval s!"Theorems.Main: {theoremsByProofTechnique.length} proof technique categories"
#eval s!"Theorems.Main: {mainTheoremDependencies.length} theorem dependency nodes"
#eval s!"Theorems.Main: Coverage {totalCovered}/{totalTopics} topics across {algebraicStructuresChapterCoverage.length} chapters"
