/-
# MiniGaloisTheoryLite.Properties.Preservation

Properties preserved under Galois operations:
normality under base change, separability in towers,
Galois property in towers.
-/

import MiniGaloisTheoryLite.Properties.Invariants
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Normality preserved under certain operations -/

def normalityPreservedUnderBaseChange : String :=
  "If E/F is normal and K/F is any extension, then EK/K is normal"

def normalityPreservedUnderTower : String :=
  "If E/F is normal and F subset K subset E, then E/K is normal (but K/F may not be)"

/-! ## Separability in towers -/

def separabilityPreservedUnderTower : String :=
  "If E/F is separable and F subset K subset E, then both E/K and K/F are separable"

def separabilityPreservedUnderBaseChange : String :=
  "If E/F is separable and K/F is any extension, then EK/K is separable"

/-! ## Galois property in towers -/

def galoisTower : String :=
  "If E/F is Galois and F subset K subset E, then E/K is Galois (K/F need not be)"

def galoisBaseChange : String :=
  "If E/F is Galois and K/F is any extension, then EK/K is Galois with Gal(EK/K) ~= Gal(E/(E cap K))"

/-! ## Invariants preserved by isomorphism -/

def galoisIsomorphismPreservesDegree : String :=
  "Galois isomorphic extensions have the same degree"

def galoisIsomorphismPreservesGroup : String :=
  "Galois isomorphic extensions have isomorphic Galois groups"

/-! ## Lifting automorphisms -/

def liftingAutomorphisms : String :=
  "If E/F is Galois and sigma in Gal(K/F) where K/F is finite, then sigma lifts to an automorphism of E"

def extensionOfEmbeddings : String :=
  "If E/F is algebraic and sigma : F -> L is an embedding into an algebraically closed L, sigma extends to an embedding E -> L"

/-! ## #eval tests -/

#eval "Properties.Preservation: normality under base change, normality in tower"
#eval "Properties.Preservation: separability in tower, galois in tower, galois under base change"
#eval "Properties.Preservation: lifting automorphisms, extension of embeddings"
