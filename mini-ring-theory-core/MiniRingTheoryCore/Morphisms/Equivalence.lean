/-
# Ring Theory Core: Equality

Equality reasoning infrastructure for ring theory.
-/

import MiniRingTheoryCore.Core.Basic

namespace MiniRingTheoryCore

inductive EqChain (α : Type u) : α → α → Type (u + 1) where
  | refl (a : α) : EqChain α a a
  | step (a b : α) : a = b → EqChain α a b
  | trans (a b c : α) : EqChain α a b → EqChain α b c → EqChain α a c

def EqChain.toEq {α : Type u} {a b : α} : EqChain α a b → a = b
  | .refl _ => rfl
  | .step _ _ h => h
  | .trans _ _ _ c1 c2 => Eq.trans (toEq c1) (toEq c2)

def congr₂ {α β γ : Type u} {a₁ b₁ : α} {a₂ b₂ : β}
    (f : α → β → γ) (h₁ : a₁ = b₁) (h₂ : a₂ = b₂) : f a₁ a₂ = f b₁ b₂ :=
  h₁ ▸ h₂ ▸ rfl

def subst {α : Type u} {a b : α} (h : a = b) (P : α → Prop) (hP : P a) : P b := h ▸ hP

def symm {α : Type u} {a b : α} (h : a = b) : b = a := Eq.symm h

def transEq {α : Type u} {a b c : α} (h₁ : a = b) (h₂ : b = c) : a = c := Eq.trans h₁ h₂

end MiniRingTheoryCore
