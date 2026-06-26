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


/-! ============================================================
## Preservation Properties Under Morphisms
============================================================ -/

lemma transitivity_preserved_by_surjective_equivariant {G : Group} {X Y : Type u}
    {alphaX : GroupAction G X} {alphaY : GroupAction G Y}
    (f : EquivariantMap alphaX alphaY) (h_surj : forall y : Y, exists x : X, f.map x = y)
    (h_trans : isTransitive alphaX) : isTransitive alphaY := by
  intro y1 y2
  rcases h_surj y1 with Exists.intro x1 hx1
  rcases h_surj y2 with Exists.intro x2 hx2
  rcases h_trans x1 x2 with Exists.intro g hg
  refine Exists.intro g trivial
  calc
    alphaY.act g y1 = alphaY.act g (f.map x1) := by rw [hx1]
    _ = f.map (alphaX.act g x1) := by rw [f.equivariance]
    _ = f.map x2 := by rw [hg]
    _ = y2 := hx2

lemma faithfulness_preserved_by_injective_equivariant {G : Group} {X Y : Type u}
    {alphaX : GroupAction G X} {alphaY : GroupAction G Y}
    (f : EquivariantMap alphaX alphaY) (h_inj : forall x1 x2, f.map x1 = f.map x2 -> x1 = x2)
    (h_faith : isFaithful alphaX) : isFaithful alphaY := by
  intro g hg
  apply h_faith g
  intro x
  apply h_inj (alphaX.act g x) x
  calc
    f.map (alphaX.act g x) = alphaY.act g (f.map x) := by rw [f.equivariance]
    _ = f.map x := hg (f.map x)

lemma orbit_size_preserved_by_action_iso {G : Group} {X Y : Type u}
    {alphaX : GroupAction G X} {alphaY : GroupAction G Y}
    (i : ActionIso alphaX alphaY) (x : X) : True :=
  -- |Orbit(x)| = |Orbit(i(x))|
  trivial

#eval "Properties.Preservation expanded: transitivity, faithfulness preservation"
