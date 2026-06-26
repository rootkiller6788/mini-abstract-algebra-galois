/-
# MiniFieldTheoryCore.Constructions.Universal

Universal constructions for field objects:
Algebraic closure, Field of Fractions.
-/

import MiniFieldTheoryCore.Core.Basic

namespace MiniFieldTheoryCore

/-! ## Algebraic Closure

Placeholder for algebraic closure construction.
Every field has an algebraic closure that is algebraically closed.
-/

def isAlgebraicallyClosed (F : Field) : Prop :=
  ∀ (α : F.ring.carrier), isAlgebraic (α := α)

/-! ## Field of Fractions

Placeholder for field of fractions construction.
Every integral domain embeds into its field of fractions.
-/

end MiniFieldTheoryCore
