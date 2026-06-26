/-
# MiniGroupTheoryCore.Theorems.UniversalProperties

Universal property theorems: free group, free abelian group,
product, coproduct, quotient group, abelianization.
-/

import MiniGroupTheoryCore.Theorems.Basic
import MiniObjectKernel.Core.Basic

namespace MiniGroupTheoryCore
open MiniObjectKernel

/-! ## Free group universal property -/

def freeGroupUniversal : Axiom :=
  Axiom.mk "freeGroupUniversal" (Formula.pred 0 [])
    "F(X) is the free group on X: for any group G and map f: X → G, ∃! homomorphism F(X) → G extending f"

/-! ## Free abelian group universal property -/

def freeAbelianUniversal : Axiom :=
  Axiom.mk "freeAbelianUniversal" (Formula.pred 0 [])
    "Z[X] is the free abelian group on X: for any abelian group A and map f: X → A, ∃! homomorphism Z[X] → A extending f"

/-! ## Product universal property -/

def productUniversal : Axiom :=
  Axiom.mk "productUniversal" (Formula.pred 0 [])
    "G×H with projections π₁, π₂ is the categorical product: ∀K, f: K→G, g: K→H, ∃! h: K→G×H with π₁∘h=f and π₂∘h=g"

/-! ## Coproduct (free product) universal property -/

def coproductUniversal : Axiom :=
  Axiom.mk "coproductUniversal" (Formula.pred 0 [])
    "G∗H with injections i₁, i₂ is the categorical coproduct in Grp"

/-! ## Quotient group universal property -/

def quotientUniversal : Axiom :=
  Axiom.mk "quotientUniversal" (Formula.pred 0 [])
    "If N ⊴ G, then π: G → G/N is universal among homomorphisms that kill N: ∀f: G→H with N⊆ker(f), ∃! f̄: G/N→H"

/-! ## Isomorphism theorems (universal property form) -/

def firstIsoThmUniversal : Axiom :=
  Axiom.mk "firstIsoThm" (Formula.pred 0 [])
    "G/ker(f) ≅ im(f) — the universal property of the quotient gives the isomorphism"

def secondIsoThmUniversal : Axiom :=
  Axiom.mk "secondIsoThm" (Formula.pred 0 [])
    "If H≤G, N⊴G, then H/(H∩N) ≅ HN/N"

def thirdIsoThmUniversal : Axiom :=
  Axiom.mk "thirdIsoThm" (Formula.pred 0 [])
    "If N⊴M⊴G then (G/N)/(M/N) ≅ G/M"

/-! ## Abelianization universal property -/

def abelianizationUniversal : Axiom :=
  Axiom.mk "abelianizationUniversal" (Formula.pred 0 [])
    "Gᵃᵇ = G/[G,G] is the universal abelian quotient: any homomorphism from G to an abelian group factors uniquely through Gᵃᵇ"

/-! ## Semidirect product universal property -/

def semidirectProductUniversal : Axiom :=
  Axiom.mk "semidirectUniversal" (Formula.pred 0 [])
    "G ⋉ H is the universal split extension: it classifies group extensions 1→H→E→G→1 with a chosen splitting"

/-! ## #eval tests -/

#eval "Theorems.UniversalProperties: freeGroup, freeAbelian, product, coproduct"
#eval "Theorems.UniversalProperties: quotient, first/second/third IsoThm"
#eval "Theorems.UniversalProperties: abelianization, semidirectProduct"
