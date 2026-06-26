/-
# MiniGroupTheoryCore.Core.AxiomCompat

Compatibility layer providing Axiom, Formula, and AxiomSystem types.
Bridges to mini-axiom-kernel and mini-logic-kernel dependencies.

This file defines wrapper types that match the API used throughout
MiniGroupTheoryCore, delegating to the kernel dependencies where possible.
-/

import MiniLogicKernel.Core.Basic
import MiniAxiomKernel.Core.Basic
import MiniAxiomKernel.Core.Laws

namespace MiniGroupTheoryCore

/-! ## Type aliases from kernel dependencies -/

/-- Formula type from mini-logic-kernel. -/
abbrev Formula := MiniLogicKernel.Formula

/-- Axiom type from mini-axiom-kernel. -/
abbrev Axiom := MiniAxiomKernel.Axiom

/-- AxiomSet type from mini-axiom-kernel. -/
abbrev AxiomSet := MiniAxiomKernel.AxiomSet

/-- AxiomSystem type from mini-axiom-kernel. -/
abbrev AxiomSystem := MiniAxiomKernel.AxiomSystem

/-! ## Axiom construction helper

The codebase uses `Axiom.mk "name" (Formula.pred 0 []) "description"`.
We provide helpers that match this calling convention. -/

/-- Construct a Formula that is a predicate applied to no terms (placeholder).
    In the logic kernel, this is just `Formula.atom n` for a chosen n. -/
def Formula.pred (arity : Nat) (args : List Nat) : Formula :=
  Formula.atom 0

/-- The label accessor for Axiom (used in Test/Smoke.lean). -/
def Axiom.label (a : Axiom) : String := a.name

/-- Construct an Axiom with name, formula, and description string.
    Matches the calling convention `Axiom.mk name formula description`. -/
def Axiom.mk (name : String) (statement : Formula) (description : String) : Axiom :=
  MiniAxiomKernel.Axiom.described name statement description

/-- Construct an Axiom with just name and description (no explicit formula).
    Uses Formula.atom 0 as placeholder. -/
def Axiom.mkSimple (name : String) (description : String) : Axiom :=
  Axiom.mk name (Formula.atom 0) description

/-! ## AxiomSystem empty helper

The codebase uses `AxiomSystem.empty.addAxioms #[...]` which assumes
`AxiomSystem.empty` has no parameters. We provide a parameterless version. -/

/-- An empty axiom system without requiring name/version parameters. -/
def AxiomSystem.empty : AxiomSystem :=
  MiniAxiomKernel.AxiomSystem.empty "GroupTheory" "1.0"

/-- Length of an axiom system (number of axioms). -/
def AxiomSystem.length (sys : AxiomSystem) : Nat :=
  sys.axioms.size

/-- Accessor for the `axioms` field of an AxiomSystem. -/
def AxiomSystem.axiomsList (sys : AxiomSystem) : List Axiom :=
  sys.axioms.axioms

/-! ## Equivalence relation

Lean 4's built-in `Equivalence` type is used via:
`Equivalence (fun (G H : Group) => areIsomorphic G H)`

This is a propositional equivalence relation from `Init.Core`.
No wrapper needed — use Lean's native `Equivalence`. -/

/-! ## Dependency module (compatibility stubs)

The original code uses `Dependency.TheoryNode` and `Dependency.node`.
These are provided as stubs since they aren't in the kernel dependency. -/

namespace Dependency

/-- A theory node in the dependency graph. -/
structure TheoryNode where
  name : String
  deps : List String
  deriving Repr, Inhabited

/-- Construct a theory node with a name and list of dependencies. -/
def node (name : String) (deps : List String) : TheoryNode :=
  { name, deps }

end Dependency

/-! ## #eval validation -/

#eval "AxiomCompat: Formula.pred, Axiom.mk, AxiomSystem.empty, TheoryNode, Dependency defined"

end MiniGroupTheoryCore
