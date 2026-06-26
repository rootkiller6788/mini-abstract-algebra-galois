/-
# MiniGaloisTheoryLite.Bridges.ToGeometry

Bridge: Galois theory -> algebraic geometry.
Grothendieck's Galois theory of schemes.
Inverse Galois problem via geometry.
-/

import MiniGaloisTheoryLite.Theorems.Main
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Grothendieck's Galois theory -/

def grothendieckGaloisTheory : String :=
  "For a connected scheme X with geometric point xbar, the category of finite etale covers of X is equivalent to the category of finite sets with continuous pi_1^et(X, xbar)-action"

def galoisTheoryOfSchemes : String :=
  "Finite etale covers of Spec(K) <-> finite K-algebras (separable) -> finite continuous G_K-sets"

/-! ## Hilbert's irreducibility theorem -/

def hilbertIrreducibility : String :=
  "For a number field K, the set of t in K such that f(X, t) in K[X] is irreducible over K is infinite (Hilbert). Used to realize Galois groups over Q."

/-! ## Inverse Galois problem -/

def inverseGaloisProblemGeo : String :=
  "Is every finite group the Galois group of some Galois extension of Q? Approach: realize groups as Galois groups of extensions of Q(t) (regular inverse Galois), then specialize"

def rigidMethod : String :=
  "The rigidity method (Belyi, Fried, Matzat, Thompson) realizes many simple groups (including the Monster) as Galois groups over Q using braid group actions on generating systems"

/-! ## Moduli spaces and Galois -/

def galoisActionOnModuli : String :=
  "Gal(Qbar/Q) acts on the set of isomorphism classes of algebraic curves defined over Qbar via its action on coefficients"

def dessinsDenfants : String :=
  "Grothendieck's dessins d'enfants: bipartite graphs on surfaces correspond to algebraic curves over Qbar. Gal(Qbar/Q) acts faithfully on dessins d'enfants"

def belyiTheorem : String :=
  "A smooth projective curve X over C is defined over Qbar iff there exists a Belyi map f : X -> P^1 ramified only at 0, 1, infinity"

/-! ## Anabelian geometry -/

def grothendieckAnabelian : String :=
  "For 'anabelian' varieties (hyperbolic curves over number fields), the etale fundamental group determines the isomorphism class of the variety"

def sectionConjecture : String :=
  "Grothendieck's section conjecture: For a smooth projective curve X over a number field K of genus >= 2, sections of pi_1^et(X) -> G_K correspond bijectively to K-rational points of X"

/-! ## #eval tests -/

#eval "Bridges.ToGeometry: grothendieckGalois, galoisSchemes, hilbertIrreducibility"
#eval "Bridges.ToGeometry: inverseGaloisProblemGeo, rigidMethod, galoisActionOnModuli"
#eval "Bridges.ToGeometry: dessinsDenfants, belyiTheorem, grothendieckAnabelian, sectionConjecture"
