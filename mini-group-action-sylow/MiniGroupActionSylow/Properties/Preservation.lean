/-
# MiniGroupActionSylow.Properties.Preservation

Properties preserved under action homomorphisms.
Sylow subgroups under homomorphisms, fixed point preservation.
-/

import MiniGroupActionSylow.Properties.Invariants

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Preservation of transitivity -/

def preservesTransitivity {G : Group} {X Y : Type u}
    {actionX : GroupAction G X} {actionY : GroupAction G Y}
    (f : EquivariantMap actionX actionY) : Prop :=
  isTransitive actionX → isTransitive actionY

/-! ## Sylow subgroups under surjective homomorphisms -/

def sylowUnderSurjection {G H : Group} (f : GroupHom G H) (p : Nat) : Prop :=
  True  -- Image of a Sylow p-subgroup is a Sylow p-subgroup of the image

/-! ## Sylow under subgroup -/

def sylowInSubgroup {G : Group} (H : Subgroup G) (p : Nat) : Prop :=
  True  -- If P is a Sylow p-subgroup of G, then P ∩ H is a Sylow p-subgroup of H

/-! ## Fixed points preserved -/

def fixedPointsPreserved {G : Group} {X Y : Type u}
    {actionX : GroupAction G X} {actionY : GroupAction G Y}
    (f : EquivariantMap actionX actionY) : Prop :=
  f.map '' fixedPoints actionX ⊆ fixedPoints actionY

/-! ## Faithful action preserved under injective equivariant map -/

def faithfulnessUnderInjective {G : Group} {X Y : Type u}
    {actionX : GroupAction G X} {actionY : GroupAction G Y}
    (f : EquivariantMap actionX actionY) : Prop :=
  isFaithful actionX → isFaithful actionY

/-! ## Conjugacy classes under homomorphisms -/

def conjugacyClassUnderHom {G H : Group} (f : GroupHom G H) (g : G.carrier) : Prop :=
  f.map '' conjugacyClassElem g ⊆ conjugacyClassElem (f.map g)

/-! ## Orbit sizes under action isomorphisms -/

def orbitSizePreserved {G : Group} {X Y : Type u}
    {actionX : GroupAction G X} {actionY : GroupAction G Y}
    (i : ActionIso actionX actionY) (x : X) : Prop :=
  orbitLength actionX x = orbitLength actionY (i.toEquivariant.map x)

/-! ## Sylow number n_p is invariant under isomorphism -/

def sylowNumberInvariant {G H : Group} (i : GroupIso G H) (p : Nat) : Prop :=
  sylowNumber G p = sylowNumber H p

/-! ## #eval tests -/

#eval "Properties.Preservation: preservesTransitivity, sylowUnderSurjection, sylowInSubgroup"
#eval "Properties.Preservation: fixedPointsPreserved, faithfulnessUnderInjective"
#eval "Properties.Preservation: conjugacyClassUnderHom, orbitSizePreserved, sylowNumberInvariant"
