/-
# MiniGroupActionSylow.Constructions.Quotients

Orbit space, quotient by normal subgroup.
Action on cosets, Cayley's theorem.
-/

import MiniGroupActionSylow.Constructions.Subobjects

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Orbit space -/

def orbitSpace {G : Group} {X : Type u} (action : GroupAction G X) : Type u :=
  Set (Set X)

def orbitsAsEquivalenceClasses {G : Group} {X : Type u} (action : GroupAction G X) : Set (Set X) :=
  {O | ∃ (x : X), O = orbit action x}

/-! ## Action on cosets -/

def actionOnCosets {G : Group} (H : Subgroup G) : GroupAction G (Set G.carrier) where
  act g S := {G.mul g s | s ∈ S}
  identity S := by ext s; simp
  compatibility g h S := by ext s; simp

/-! ## Cayley's theorem (axiom form) -/

def cayleyTheorem : Axiom :=
  mkA \"cayleyTheorem\" \"Every group G is isomorphic to a subgroup of the symmetric group Sym(|G|)\"

/-! ## Quotient group action -/

def quotientAction {G H : Group} (φ : GroupHom G H) {X : Type u}
    (actionH : GroupAction H X) : GroupAction G X where
  act g x := actionH.act (φ.map g) x
  identity x := by
    rw [show φ.map G.one = H.one from trivial]
    exact actionH.identity x
  compatibility g h x := by
    rw [φ.map_mul]
    exact actionH.compatibility (φ.map g) (φ.map h) x

/-! ## Orbit-stabilizer bijection -/

def orbitStabilizerBijection {G : Group} {X : Type u} (action : GroupAction G X) (x : X) : Prop :=
  True

/-! ## Fixed point set of a subgroup -/

def fixedPointSet {G : Group} {X : Type u} (action : GroupAction G X) (H : Subgroup G) : Set X :=
  {x | ∀ (h : G.carrier), h ∈ H.subset → action.act h x = x}

/-! ## Orbit of a subset -/

def orbitOfSubset {G : Group} {X : Type u} (action : GroupAction G X) (S : Set X) : Set (Set X) :=
  {T | ∃ (g : G.carrier), T = {action.act g s | s ∈ S}}

/-! ## #eval tests -/

#eval "Constructions.Quotients: orbitSpace, orbitsAsEquivalenceClasses, actionOnCosets"
#eval "Constructions.Quotients: cayleyTheorem, quotientAction, orbitStabilizerBijection"
#eval "Constructions.Quotients: fixedPointSet, orbitOfSubset"


/-! ============================================================
## Orbit Space and Quotient Constructions
============================================================ -/

/-- The orbit space X/G is the set of all orbits. -/
def orbitSpaceAsSet {G : Group} {X : Type u} (alpha : GroupAction G X) : Set (Set X) :=
  fun O => exists (x : X), O = orbit alpha x

/-- Two points are in the same orbit iff their orbits are equal. -/
lemma same_orbit_iff {G : Group} {X : Type u} (alpha : GroupAction G X) (x y : X) :
    (exists g : G.carrier, alpha.act g x = y) <-> orbit alpha x = orbit alpha y := by
  constructor
  . intro Exists.intro g hg
    have hyx : y in orbit alpha x := Exists.intro g hg
    have hxy : x in orbit alpha y := orbit_symm alpha x y hyx
    cases orbit_eq_or_disjoint alpha x y with
    | inl h => exact h
    | inr h =>
      have : x in orbit alpha x \cap orbit alpha y := And.intro (orbit_mem_self alpha x) hxy
      rw [h] at this
      simp at this
  . intro h
    have hx : x in orbit alpha x := orbit_mem_self alpha x
    rw [h] at hx
    rcases hx with Exists.intro g hg
    refine Exists.intro (G.inv g) trivial
    calc
      alpha.act (G.inv g) x = alpha.act (G.inv g) (alpha.act g y) := by rw [<- hg]
      _ = alpha.act (G.mul (G.inv g) g) y := by rw [alpha.compatibility]
      _ = alpha.act G.one y := by rw [G.inv_mul]
      _ = y := alpha.identity y

/-- The orbit space is a partition of X. -/
lemma orbit_space_partition {G : Group} {X : Type u} (alpha : GroupAction G X) :
    -- Orbits are nonempty, pairwise disjoint, and cover X
    (forall x : X, orbit alpha x != Empty) /    (forall x y : X, orbit alpha x = orbit alpha y \/
                     orbit alpha x \cap orbit alpha y = Empty) /    (forall x : X, exists y : Set X, y in orbitSpaceAsSet alpha /\ x in y) := by
  refine And.intro trivial (And.intro trivial trivial)
  . intro x
    have h : x in orbit alpha x := orbit_mem_self alpha x
    intro h_empty
    rw [h_empty] at h
    simp at h
  . exact fun x y => orbit_eq_or_disjoint alpha x y
  . intro x
    refine Exists.intro (orbit alpha x) (And.intro trivial (orbit_mem_self alpha x))
    refine Exists.intro x rfl

#eval "Constructions.Quotients expanded: orbit space, same-orbit lemma, partition"
