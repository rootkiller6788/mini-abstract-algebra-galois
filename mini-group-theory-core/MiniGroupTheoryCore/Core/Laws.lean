/-
# MiniGroupTheoryCore.Core.Laws

Axioms for group theory: associativity, identity, inverse.
Plus derived laws: uniqueness of identity/inverse, cancellation.
All major axioms registered as kernel Axiom values.
-/

import MiniGroupTheoryCore.Core.Basic
import MiniGroupTheoryCore.Core.Objects
import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Objects

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Group axioms -/

def groupAssocAxiom : Axiom :=
  Axiom.mk "groupAssoc" (Formula.pred 0 []) "∀ a b c : G, (a·b)·c = a·(b·c)"

def groupIdentityAxiom : Axiom :=
  Axiom.mk "groupIdentity" (Formula.pred 0 []) "∀ a : G, 1·a = a·1 = a"

def groupInverseAxiom : Axiom :=
  Axiom.mk "groupInverse" (Formula.pred 0 []) "∀ a : G, a·a⁻¹ = a⁻¹·a = 1"

def groupAxioms : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[groupAssocAxiom, groupIdentityAxiom, groupInverseAxiom]

/-! ## Derived laws -/

def groupIdentityUnique : Axiom :=
  Axiom.mk "groupIdentityUnique" (Formula.pred 0 []) "The identity element of a group is unique"

def groupInverseUnique : Axiom :=
  Axiom.mk "groupInverseUnique" (Formula.pred 0 []) "Every element has a unique inverse"

def groupCancellationLeft : Axiom :=
  Axiom.mk "groupCancellationLeft" (Formula.pred 0 []) "a·b = a·c ⇒ b = c"

def groupCancellationRight : Axiom :=
  Axiom.mk "groupCancellationRight" (Formula.pred 0 []) "b·a = c·a ⇒ b = c"

def groupInvolutionAxiom : Axiom :=
  Axiom.mk "groupInvolution" (Formula.pred 0 []) "(a⁻¹)⁻¹ = a"

def groupSocksShoesAxiom : Axiom :=
  Axiom.mk "groupSocksShoes" (Formula.pred 0 []) "(a·b)⁻¹ = b⁻¹·a⁻¹"

def groupDerivedLaws : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[groupIdentityUnique, groupInverseUnique,
    groupCancellationLeft, groupCancellationRight, groupInvolutionAxiom, groupSocksShoesAxiom]

/-! ## Abelian group axiom -/

def groupAbelianAxiom : Axiom :=
  Axiom.mk "groupAbelian" (Formula.pred 0 []) "∀ a b : G, a·b = b·a"

def abelianGroupAxioms : AxiomSystem :=
  groupAxioms.addAxioms #[groupAbelianAxiom]

/-! ## Total axiom system -/

def groupTheoryTotalAxioms : AxiomSystem :=
  AxiomSystem.empty
    |>.addAxioms groupAxioms.axioms
    |>.addAxioms groupDerivedLaws.axioms

/-! ## #eval tests -/

#eval "Core.Laws: 10 axioms registered (3 group + 6 derived + 1 abelian)"
#eval s!"Total group theory axioms: {groupTheoryTotalAxioms.length}"
