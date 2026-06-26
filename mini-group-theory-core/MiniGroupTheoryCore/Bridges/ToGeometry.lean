/-
# MiniGroupTheoryCore.Bridges.ToGeometry

Bridge: group theory → algebraic groups, Galois theory of coverings,
étale fundamental group, anabelian geometry, geometric group theory.
-/

import MiniGroupTheoryCore.Bridges.ToTopology
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Algebraic group -/

structure AlgebraicGroup where
  group : Group
  isAlgebraic : Prop  -- group is an algebraic variety

/-! ## Linear algebraic group -/

def linearAlgebraicGroupAxiom : Axiom :=
  Axiom.mk "linearAlgebraicGroup" (Formula.pred 0 [])
    "GL_n, SL_n, Sp_{2n}, SO_n are linear algebraic groups. Every affine algebraic group is a closed subgroup of GL_n."

/-! ## Galois theory of coverings (Riemann surfaces) -/

def riemannExistenceTheorem : Axiom :=
  Axiom.mk "riemannExistence" (Formula.pred 0 [])
    "Every compact Riemann surface is an algebraic curve over C. Finite covering spaces ↔ finite field extensions of C(z)."

/-! ## Etale fundamental group -/

def etaleFundamentalGroup : Axiom :=
  Axiom.mk "etaleFundamentalGroup" (Formula.pred 0 [])
    "π₁^ét(X) classifies finite étale covers of X. It is a profinite group (the profinite completion of the topological π₁ for X/C)."

/-! ## Anabelian geometry -/

def anabelianGeometry : Axiom :=
  Axiom.mk "anabelianGeometry" (Formula.pred 0 [])
    "Grothendieck's anabelian conjecture: For hyperbolic curves over number fields, the étale fundamental group determines the curve completely."

/-! ## Geometric group theory -/

def cayleyGraph : Axiom :=
  Axiom.mk "cayleyGraph" (Formula.pred 0 [])
    "The Cayley graph Γ(G,S) of a group G with generating set S is a metric space on which G acts freely by isometries"

def wordMetric : Axiom :=
  Axiom.mk "wordMetric" (Formula.pred 0 [])
    "The word metric d_S(g,h) on G is the length of the shortest word in S representing g⁻¹h"

def gromovHyperbolicGroup : Axiom :=
  Axiom.mk "hyperbolicGroup" (Formula.pred 0 [])
    "A finitely generated group is hyperbolic (in the sense of Gromov) if its Cayley graph is δ-hyperbolic"

/-! ## Transformation groups and Klein's Erlangen program -/

def erlangenProgram : Axiom :=
  Axiom.mk "erlangenProgram" (Formula.pred 0 [])
    "A geometry is the study of invariants under a group of transformations (Klein, 1872). Euclidean geometry = invariants of Isom(Eⁿ)."

/-! ## Reflection groups and Coxeter groups -/

def coxeterGroup : Axiom :=
  Axiom.mk "coxeterGroup" (Formula.pred 0 [])
    "Finite Coxeter groups classify regular polytopes. The symmetry group of a regular polytope is a finite Coxeter group."

/-! ## #eval tests -/

#eval "Bridges.ToGeometry: AlgebraicGroup, linearAlgebraicGroup, riemannExistence"
#eval "Bridges.ToGeometry: etaleFundamentalGroup, anabelianGeometry"
#eval "Bridges.ToGeometry: cayleyGraph, wordMetric, hyperbolicGroup, erlangenProgram, coxeterGroup"
