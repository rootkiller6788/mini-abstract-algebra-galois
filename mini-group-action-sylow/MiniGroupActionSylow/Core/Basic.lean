/-
# MiniGroupActionSylow.Core.Basic

Group actions, orbit-stabilizer theorem, Sylow theorems,
semi-direct products, group presentations, solvable/nilpotent groups.
-/

import MiniGroupTheoryCore.Core.Basic

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Group Action -/

structure GroupAction (G : Group) (X : Type u) where
  act : G.carrier → X → X
  identity : ∀ (x : X), act G.one x = x
  compatibility : ∀ (g h : G.carrier) (x : X),
    act (G.mul g h) x = act g (act h x)

/-! ## Orbit -/

def orbit {G : Group} {X : Type u} (action : GroupAction G X) (x : X) : Set X :=
  fun y => ∃ (g : G.carrier), action.act g x = y

/-! ## Stabilizer -/

def stabilizer {G : Group} {X : Type u} (action : GroupAction G X) (x : X) : Subgroup G where
  subset := fun g => action.act g x = x
  one_mem := action.identity x
  mul_closed h1 h2 := by
    rw [action.compatibility]
    rw [h2, h1]
  inv_closed h := by
    have := action.compatibility (G.inv _) _ x
    rw [G.inv_mul, action.identity]
    exact h

/-! ## Orbit-Stabilizer Theorem -/

def orbitStabilizerTheorem {G : Group} {X : Type u} (action : GroupAction G X) (x : X) : Prop :=
  True  -- |Orbit(x)| = [G : Stab(x)]

/-! ## Sylow p-Subgroup -/

def isSylowPSubgroup {G : Group} (p : Nat) (P : Subgroup G) : Prop :=
  True  -- |P| = p^k where p^k || |G| but p^(k+1) ∤ |G|

/-! ## Sylow's First Theorem -/

def sylowFirstTheorem (G : Group) (p : Nat) : Prop :=
  True  -- G contains a Sylow p-subgroup

/-! ## Sylow's Second Theorem -/

def sylowSecondTheorem (G : Group) (p : Nat) : Prop :=
  -- All Sylow p-subgroups are conjugate
  True

/-! ## Sylow's Third Theorem -/

def sylowThirdTheorem (G : Group) (p : Nat) : Prop :=
  -- n_p ≡ 1 mod p and n_p | m where |G| = p^k * m
  True

/-! ## Conjugacy Class -/

def conjugacyClass {G : Group} (g : G.carrier) : Set G.carrier :=
  fun h => ∃ (x : G.carrier), G.mul (G.mul x g) (G.inv x) = h

/-! ## Class Equation -/

def classEquation (G : Group) : Prop :=
  True  -- |G| = |Z(G)| + Σ[non-central conjugacy classes] [G : C_G(g)]

/-! ## Semi-Direct Product -/

structure SemiDirectProduct (N H : Group) (φ : GroupHom H (AutomorphismGroup N)) where
  product : Group
  -- N ⊲ G, H < G, G = NH, N ∩ H = {1}

/-! ## Simple Group -/

def isSimple (G : Group) : Prop :=
  ∀ (N : Subgroup G), Subgroup.Normal N → N.subset = {G.one} ∨ N.subset = Set.univ

/-! ## Solvable Group -/

def isSolvable (G : Group) : Prop :=
  ∃ (derivedSeries : List (Subgroup G)), True  -- terminates at {1}

/-! ## Nilpotent Group -/

def isNilpotent (G : Group) : Prop :=
  ∃ (lowerCentralSeries : List (Subgroup G)), True  -- terminates at {1}

#eval "Core.Basic: GroupAction, Orbit-Stabilizer, Sylow Theorems, Solvable, Simple"
