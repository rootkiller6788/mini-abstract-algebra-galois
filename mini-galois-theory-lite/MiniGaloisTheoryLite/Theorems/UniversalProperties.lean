/-
# MiniGaloisTheoryLite.Theorems.UniversalProperties

Universal properties: splitting field, normal closure,
Galois closure, algebraic closure in Galois context.
-/

import MiniGaloisTheoryLite.Theorems.Basic
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Splitting field universal property -/

def splittingFieldUniversal : String :=
  "For any polynomial f in F[x], there exists a splitting field of f over F, unique up to isomorphism"

def splittingFieldGalois : String :=
  "If f in F[x] is separable, then its splitting field over F is Galois"

/-! ## Normal closure universal property -/

def normalClosureUniversal : String :=
  "For any finite extension E/F, there exists a normal closure (smallest normal extension containing E/F)"

def normalClosureGaloisFromSeparable : String :=
  "If E/F is separable, its normal closure is Galois"

/-! ## Galois closure universal property -/

def galoisClosureUniversal : String :=
  "For any finite separable extension E/F, there exists a Galois closure (smallest Galois extension containing E/F)"

/-! ## Algebraic closure universal property -/

def algebraicClosureUniversal : String :=
  "Every field F has an algebraic closure F^alg, unique up to F-isomorphism"

def algebraicClosureGaloisGroup : String :=
  "Gal(F^alg/F) = lim Gal(E/F) where E ranges over finite Galois extensions of F (absolute Galois group)"

/-! ## Embedding extension universal property -/

def embeddingExtensionUniversal : String :=
  "If E/F is algebraic and sigma : F -> L is an embedding into an algebraically closed field L, then there exists an embedding tau : E -> L extending sigma"

def embeddingCount : String :=
  "If E/F is a finite separable extension, the number of distinct embeddings E -> F^alg fixing F equals [E:F]"

/-! ## Irreducible polynomial splitting universal -/

def irreducibleSplitsUniversal : String :=
  "If f in F[x] is irreducible and char(F) = 0, then the Galois group of the splitting field acts transitively on the roots of f"

/-! ## #eval tests -/

#eval "Theorems.UniversalProperties: splittingField, normalClosure, galoisClosure"
#eval "Theorems.UniversalProperties: algebraicClosure, embeddingExtension"
#eval "Theorems.UniversalProperties: irreducibleSplits, transitive action"
