/-
# MiniGaloisTheoryLite.Bridges.ToTopology

Bridge: Galois theory -> topology.
Profinite groups, Galois = covering space analogy.
Etale fundamental group connection.
-/

import MiniGaloisTheoryLite.Theorems.Main
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Profinite groups and Galois -/

def profiniteGaloisGroup : String :=
  "The absolute Galois group G_K = Gal(K^sep/K) is a profinite group: the inverse limit of finite Galois groups Gal(L/K) over finite Galois extensions L/K"

def krullTopology : String :=
  "The Krull topology on Gal(L/K): neighborhood basis at identity given by subgroups Gal(L/E) for finite intermediate extensions E/K"

/-! ## Galois = covering space analogy -/

def galoisCoveringAnalogy : String :=
  "Galois correspondence L/K <-> Gal(L/K) is analogous to covering spaces Xtilde/X <-> Deck(Xtilde/X).
   Subgroups <-> intermediate covers.
   Normal subgroups <-> Galois (regular) covers.
   The absolute Galois group ~= fundamental group of Spec(K)"

def coveringSpaceDictionary : String :=
  "| Galois Theory | Covering Spaces |
   |---------------|------------------|
   | Field K       | Base space X     |
   | Sep. closure K^sep | Universal cover Xtilde |
   | Finite Galois L/K | Finite cover Y/X  |
   | Gal(L/K)      | Deck(Y/X)        |
   | Absolute Galois G_K | pi_1(X)      |"

/-! ## Etale fundamental group -/

def etaleFundamentalGroup : String :=
  "For a scheme X, pi_1^et(X) is the profinite completion of the topological fundamental group (for smooth complex varieties)"

def galoisEtaleConnection : String :=
  "pi_1^et(Spec(k)) ~= Gal(k^sep/k) -- Grothendieck's interpretation: Galois groups are etale fundamental groups of spectra of fields"

/-! ## Riemann existence theorem -/

def riemannExistenceTheorem : String :=
  "For a smooth projective complex curve X, the category of finite etale covers of X is equivalent to the category of finite topological covers of X(C)"

/-! ## Infinite Galois theory -/

def infiniteGaloisCorrespondence : String :=
  "For an infinite Galois extension L/K with Krull topology on G = Gal(L/K), there is a bijection between closed subgroups H <= G and intermediate fields K subset E subset L"

/-! ## #eval tests -/

#eval "Bridges.ToTopology: profiniteGaloisGroup, krullTopology"
#eval "Bridges.ToTopology: galoisCoveringAnalogy, coveringSpaceDictionary"
#eval "Bridges.ToTopology: etaleFundamentalGroup, riemannExistence, infiniteGalois"
