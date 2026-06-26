/-
# MiniGroupActionSylow.Morphisms.Hom

Equivariant maps between group actions.
Action homomorphisms, fixed-point functor, intertwiners.
-/

import MiniGroupActionSylow.Core.Basic
import MiniGroupActionSylow.Core.Laws

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Equivariant map -/

structure EquivariantMap {G : Group} {X Y : Type u} (actionX : GroupAction G X) (actionY : GroupAction G Y) where
  map : X → Y
  equivariance : ∀ (g : G.carrier) (x : X), map (actionX.act g x) = actionY.act g (map x)

/-! ## Intertwiner (same as equivariant map) -/

def intertwiners {G : Group} {X Y : Type u} (actionX : GroupAction G X) (actionY : GroupAction G Y) : Set (X → Y) :=
  {f | ∀ (g : G.carrier) (x : X), f (actionX.act g x) = actionY.act g (f x)}

/-! ## Fixed-point functor -/

def fixedPoints {G : Group} {X : Type u} (action : GroupAction G X) : Set X :=
  {x | ∀ (g : G.carrier), action.act g x = x}

def isFixed {G : Group} {X : Type u} (action : GroupAction G X) (x : X) : Prop :=
  x ∈ fixedPoints action

/-! ## Kernel of an action -/

def actionKernel {G : Group} {X : Type u} (action : GroupAction G X) : Set G.carrier :=
  {g | ∀ (x : X), action.act g x = x}

/-! ## Faithful action -/

def isFaithful {G : Group} {X : Type u} (action : GroupAction G X) : Prop :=
  ∀ (g : G.carrier), (∀ (x : X), action.act g x = x) → g = G.one

/-! ## Transitive action -/

def isTransitive {G : Group} {X : Type u} (action : GroupAction G X) : Prop :=
  ∀ (x y : X), ∃ (g : G.carrier), action.act g x = y

/-! ## Regular action -/

def isRegular {G : Group} {X : Type u} (action : GroupAction G X) : Prop :=
  isTransitive action ∧ isFaithful action

/-! ## Composition of equivariant maps -/

def EquivariantMap.comp {G : Group} {X Y Z : Type u}
    {actionX : GroupAction G X} {actionY : GroupAction G Y} {actionZ : GroupAction G Z}
    (f : EquivariantMap actionX actionY) (g : EquivariantMap actionY actionZ) :
    EquivariantMap actionX actionZ where
  map := fun x => g.map (f.map x)
  equivariance := fun g' x => by
    simp [g.equivariance, f.equivariance]

def EquivariantMap.id {G : Group} {X : Type u} (action : GroupAction G X) : EquivariantMap action action where
  map := fun x => x
  equivariance := fun _ _ => rfl

/-! ## #eval tests -/

#eval "Morphisms.Hom: EquivariantMap, intertwiners, fixedPoints, actionKernel"
#eval "Morphisms.Hom: isFaithful, isTransitive, isRegular, comp, id"


/-! ============================================================
## Equivariant Map Properties — Expanded
============================================================ ----

/-- Equivariant maps form a category: identity and composition
satisfy the category axioms. -/
lemma equivariant_map_category_left_id {G : Group} {X Y : Type u}
    {alphaX : GroupAction G X} {alphaY : GroupAction G Y}
    (f : EquivariantMap alphaX alphaY) :
    EquivariantMap.comp (EquivariantMap.id alphaX) f = f := rfl

lemma equivariant_map_category_right_id {G : Group} {X Y : Type u}
    {alphaX : GroupAction G X} {alphaY : GroupAction G Y}
    (f : EquivariantMap alphaX alphaY) :
    EquivariantMap.comp f (EquivariantMap.id alphaY) = f := rfl

lemma equivariant_map_category_assoc {G : Group} {W X Y Z : Type u}
    {alphaW : GroupAction G W} {alphaX : GroupAction G X}
    {alphaY : GroupAction G Y} {alphaZ : GroupAction G Z}
    (f : EquivariantMap alphaW alphaX) (g : EquivariantMap alphaX alphaY)
    (h : EquivariantMap alphaY alphaZ) :
    EquivariantMap.comp (EquivariantMap.comp f g) h =
    EquivariantMap.comp f (EquivariantMap.comp g h) := rfl

#eval "Morphisms.Hom expanded: category axioms for equivariant maps"
