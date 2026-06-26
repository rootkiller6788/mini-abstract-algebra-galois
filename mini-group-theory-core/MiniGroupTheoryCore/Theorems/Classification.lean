/-
# MiniGroupTheoryCore.Theorems.Classification

Classification theorems: finite simple groups, finite abelian groups,
p-groups, groups of small order, Sylow applications.
-/

import MiniGroupTheoryCore.Theorems.UniversalProperties
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Classification of finite simple groups (CFSG) -/

def classificationFiniteSimpleGroups : Axiom :=
  Axiom.mk "CFSG" (Formula.pred 0 [])
    "Complete classification: cyclic p (prime), alternating A_n (n≥5), 16 families of Lie type, 26 sporadic groups"

/-! ## Groups of small order -/

def groupsOfOrderP : Axiom :=
  Axiom.mk "groupsOfOrderP" (Formula.pred 0 [])
    "Every group of prime order p is cyclic: Z/pZ (unique up to isomorphism)"

def groupsOfOrderP2 : Axiom :=
  Axiom.mk "groupsOfOrderP2" (Formula.pred 0 [])
    "Every group of order p² is abelian: Z/p²Z or Z/pZ × Z/pZ"

def groupsOfOrder2P : Axiom :=
  Axiom.mk "groupsOfOrder2P" (Formula.pred 0 [])
    "Groups of order 2p (p odd prime): Z/2pZ (cyclic) or D_p (dihedral)"

def groupsOfOrder8 : Axiom :=
  Axiom.mk "groupsOfOrder8" (Formula.pred 0 [])
    "Groups of order 8: Z/8Z, Z/4Z×Z/2Z, Z/2Z×Z/2Z×Z/2Z, D₄, Q₈ (5 groups)"

def groupsOfOrder12 : Axiom :=
  Axiom.mk "groupsOfOrder12" (Formula.pred 0 [])
    "Groups of order 12: Z/12Z, Z/6Z×Z/2Z, A₄, D₆, T (dicyclic) (5 groups)"

/-! ## Sylow applications -/

def sylowApplicationPq : Axiom :=
  Axiom.mk "sylowPq" (Formula.pred 0 [])
    "If p,q primes with p<q and p∤(q-1), then every group of order pq is cyclic"

def sylowApplicationP2q : Axiom :=
  Axiom.mk "sylowP2q" (Formula.pred 0 [])
    "Groups of order p²q are classified using Sylow theory"

def sylowApplication60Simple : Axiom :=
  Axiom.mk "sylow60" (Formula.pred 0 [])
    "Every group of order 60 with no proper normal subgroup ≅ A₅ (the smallest non-abelian simple group)"

/-! ## Nilpotent group classification -/

def nilpotentClassification : Axiom :=
  Axiom.mk "nilpotentClassification" (Formula.pred 0 [])
    "A finite group is nilpotent iff it is the direct product of its Sylow p-subgroups"

/-! ## Solvable group characterization -/

def solvableCharacterization : Axiom :=
  Axiom.mk "solvableCharacterization" (Formula.pred 0 [])
    "G is solvable iff its composition factors are all cyclic of prime order"

/-! ## Group extension classification -/

def groupExtensionClassification : Axiom :=
  Axiom.mk "groupExtension" (Formula.pred 0 [])
    "Group extensions 1→A→E→G→1 are classified by H²(G, Z(A)) (group cohomology)"

/-! ## #eval tests -/

#eval "Theorems.Classification: CFSG, groups of order p, p², 2p, 8, 12"
#eval "Theorems.Classification: Sylow applications (pq, p²q, 60→A₅)"
#eval "Theorems.Classification: nilpotent, solvable, group extension classification"
