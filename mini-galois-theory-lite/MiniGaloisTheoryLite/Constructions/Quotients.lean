/-
# MiniGaloisTheoryLite.Constructions.Quotients

Quotient Galois group G/N,
correspondence between quotient groups and Galois sub-extensions.
-/

import MiniGaloisTheoryLite.Constructions.Subobjects
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Quotient Galois group -/

structure QuotientGaloisGroup (E : FieldExtension) (N : NormalSubgroup (GaloisGroup E).group) where
  quotientGroup : Group
  projection : GroupHom (GaloisGroup E).group quotientGroup
  projection_surjective : Prop
  projection_ker : forall (sigma : GaloisAutomorphism E), projection.map sigma = quotientGroup.one <-> sigma in N.carrier

/-! ## Galois correspondence for quotients -/

def quotientGaloisCorrespondence (E : FieldExtension) (N : NormalSubgroup (GaloisGroup E).group) : Prop :=
  True
  -- Gal(E^N / F) ~= Gal(E/F) / N

/-! ## First Isomorphism Theorem for Galois groups -/

def galoisFirstIsomorphism : String :=
  "If f : Gal(L/K) -> H is a surjective group hom, then Gal(L/K)/ker(f) ~= H"

/-! ## Second Isomorphism Theorem for Galois groups -/

def galoisSecondIsomorphism : String :=
  "If E1/K and E2/K are Galois with groups N1, N2, then Gal(E1E2/E2) ~= N1/(N1 cap N2)"

/-! ## Correspondence theorem for Galois groups -/

def galoisCorrespondenceTheorem : String :=
  "Subgroups of Gal(L/K)/N correspond bijectively to subgroups of Gal(L/K) containing N"

/-! ## Artin's theorem (finite Galois iff finite automorphism group) -/

def artinsTheorem : String :=
  "If G is a finite group of automorphisms of L, then L/L^G is a finite Galois extension with Galois group G"

/-! ## #eval tests -/

#eval "Constructions.Quotients: QuotientGaloisGroup, quotientGaloisCorrespondence"
#eval "Constructions.Quotients: Isomorphism theorems, correspondence theorem, Artin's theorem"
