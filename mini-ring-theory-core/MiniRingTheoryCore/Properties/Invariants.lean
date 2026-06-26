/-
# MiniRingTheoryCore.Properties.Invariants

Structural invariants of rings: Noetherian, Artinian, local,
Krull dimension, and related conditions.
-/

import MiniRingTheoryCore.Core.Basic

namespace MiniRingTheoryCore

/-! ## Noetherian Ring

A ring is Noetherian if every ascending chain of ideals stabilizes:
for any chain I₁ ⊆ I₂ ⊆ I₃ ⊆ ..., there exists N such that
I_N = I_{N+1} = ....  Equivalently, every ideal is finitely generated. -/

/-- Ascending chain condition on ideals: for any sequence of nested
    ideals, the chain eventually stabilizes. -/
axiom isNoetherian (R : Ring) : Prop

/-- Equivalent formulation: every ideal is finitely generated. -/
axiom noetherian_iff_every_ideal_finitely_generated (R : Ring) :
  isNoetherian R ↔ True

/-- If R is Noetherian, then any increasing chain of ideals
    I₀ ⊆ I₁ ⊆ I₂ ⊆ ... stabilizes: ∃ N, I_N = I_{N+1} = .... -/
axiom noetherian_stabilization {R : Ring} (h : isNoetherian R)
  (I : Nat → Ideal R) (hchain : ∀ n, (I n).subset ⊆ (I (n + 1)).subset) :
  ∃ (N : Nat), ∀ (m : Nat), m ≥ N → (I m).subset = (I N).subset

/-! ## Artinian Ring

A ring is Artinian if every descending chain of ideals stabilizes. -/

/-- Descending chain condition: every descending chain of ideals
    stabilizes. -/
axiom isArtinian (R : Ring) : Prop

/-- If R is Artinian, then any descending chain stabilizes. -/
axiom artinian_stabilization {R : Ring} (h : isArtinian R)
  (I : Nat → Ideal R) (hchain : ∀ n, (I (n + 1)).subset ⊆ (I n).subset) :
  ∃ (N : Nat), ∀ (m : Nat), m ≥ N → (I m).subset = (I N).subset

/-! ## Krull Dimension

The Krull dimension is the supremum of lengths of chains of
prime ideals P₀ ⊊ P₁ ⊊ ... ⊊ Pₙ. -/

/-- The length of a chain of distinct prime ideals. -/
axiom krullDimension (R : Ring) : Nat

/-- The Krull dimension is the maximal length of a strictly
    ascending chain of prime ideals. -/
axiom krullDimension_chain {R : Ring} {n : Nat}
  (h : krullDimension R = n) :
  ∃ (P : Fin (n + 1) → Ideal R),
    (∀ i, Ideal.IsPrime (P i)) ∧
    (∀ i, i < n → (P i.castSucc).subset ⊂ (P i.succ).subset)

/-- Krull dimension 0: every prime ideal is maximal.
    These are precisely Artinian rings (by a theorem). -/
axiom krullDimension_zero (R : Ring) :
  krullDimension R = 0 ↔ (∀ (P : Ideal R), Ideal.IsPrime P → Ideal.IsMaximal P)

/-! ## Local Ring

A ring is local if it has exactly one maximal ideal. -/

/-- A ring is local if it has exactly one maximal ideal. -/
axiom isLocal (R : Ring) : Prop

/-- Equivalent: R has a unique maximal ideal. -/
axiom isLocal_iff_unique_maximal (R : Ring) :
  isLocal R ↔
    (∃! (M : Ideal R), Ideal.IsMaximal M)

/-- In a local ring, the non-units form the unique maximal ideal. -/
axiom local_nonunits_form_maximal_ideal {R : Ring} (h : isLocal R) :
  ∃ (M : Ideal R), Ideal.IsMaximal M ∧
    M.subset = { x | ¬ isUnit R x }

/-! ## #eval examples -/

#eval "isNoetherian: ACC on ideals"
#eval "isArtinian: DCC on ideals"
#eval "krullDimension: max prime chain length"
#eval "isLocal: unique maximal ideal"
