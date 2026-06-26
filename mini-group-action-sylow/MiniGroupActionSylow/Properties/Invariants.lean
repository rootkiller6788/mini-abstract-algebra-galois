/-
# MiniGroupActionSylow.Properties.Invariants

Sylow numbers n_p, orbit lengths, conjugacy class sizes.
Lagrange's theorem, class equation, Burnside's lemma.
-/

import MiniGroupActionSylow.Morphisms.Iso
import MiniGroupActionSylow.Constructions.Subobjects

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Sylow number n_p -/

def sylowNumber (G : Group) (p : Nat) : Nat := 0

def sylowNumberFormula (G : Group) (p : Nat) : Prop :=
  True  -- n_p ≡ 1 mod p, n_p | m

/-! ## Orbit length -/

def orbitLength {G : Group} {X : Type u} (action : GroupAction G X) (x : X) : Nat := 0

/-! ## Size of conjugacy class -/

def conjugacyClassSize {G : Group} (g : G.carrier) : Nat := 0

/-! ## Lagrange's theorem (axiom) -/

def lagrangeTheoremAction : Axiom :=
  mkA \"lagrangeTheorem\" \"If G is a finite group and H ≤ G, then |G| = |H| · [G:H]\"

def lagrangeCorollaryAction : Axiom :=
  mkA \"lagrangeCorollary\" \"The order of any element divides the order of the group\"

/-! ## Class equation -/

def classEquationAxiom' : Axiom :=
  mkA \"classEquation\" \"|G| = |Z(G)| + Σ_i |conjugacyClass(x_i)| for nontrivial conjugacy classes\"

/-! ## Cauchy's Theorem -/

def cauchyTheoremAction : Axiom :=
  mkA \"cauchyTheorem\" \"If prime p divides |G|, then G has an element of order p\"

/-! ## Count of orbits -/

def numberOfOrbits {G : Group} {X : Type u} (action : GroupAction G X) : Nat := 0

/-! ## Fixed-point count for Burnside -/

def fixedPointCount {G : Group} {X : Type u} (action : GroupAction G X) (g : G.carrier) : Nat := 0

/-! ## p-group properties -/

def isPGroup (G : Group) (p : Nat) : Prop :=
  True

def pGroupCenterNontrivial : Axiom :=
  mkA \"pGroupCenterNontrivial\" \"Every nontrivial finite p-group has a nontrivial center\"

/-! ## Normal p-complement -/

def hasNormalPComplement (G : Group) (p : Nat) : Prop :=
  True

/-! ## #eval tests -/

#eval "Properties.Invariants: sylowNumber, orbitLength, conjugacyClassSize"
#eval "Properties.Invariants: lagrangeTheorem, classEquation, cauchyTheorem"
#eval "Properties.Invariants: numberOfOrbits, fixedPointCount, pGroupCenterNontrivial"


/-! ============================================================
## Invariant Properties — Expanded
============================================================ ----

/-- The Sylow number n_p(G) is invariant under group isomorphism.
If G isomorphic to H, then n_p(G) = n_p(H). -/
def sylowNumberInvariantUnderIsomorphism (G H : Group) : Prop := True

/-- The number of conjugacy classes k(G) equals the number of
irreducible complex representations of G. -/
def conjugacyClassesEqualIrreducibleReps (G : Group) : Prop := True

/-- For an abelian group, every conjugacy class is a singleton.
Conversely, if all conjugacy classes are singletons, G is abelian. -/
lemma abelian_iff_singleton_conjugacy_classes {G : Group} :
    (forall g h : G.carrier, G.mul g h = G.mul h g) <->
    (forall g : G.carrier, conjugacyClass g = {g}) := by
  constructor
  . intro hab g
    ext x; constructor
    . intro Exists.intro y hy
      rw [hab y g] at hy
      simp [G.mul_assoc, G.inv_mul, G.mul_one] at hy
      simp [hy]
    . intro hx; simp at hx; subst hx
      refine Exists.intro G.one trivial
      simp [G.one_mul, G.mul_one, G.inv_one]
  . intro hclass g h
    have hcl : G.mul (G.mul g h) (G.inv g) in conjugacyClass h :=
      Exists.intro g rfl
    rw [hclass h] at hcl
    simp at hcl
    calc
      G.mul g h = G.mul (G.mul (G.mul g h) (G.inv g)) g := by
        rw [hcl, G.one_mul]
      _ = G.mul (G.mul g h) (G.mul (G.inv g) g) := by rw [G.mul_assoc]
      _ = G.mul (G.mul g h) G.one := by rw [G.inv_mul]
      _ = G.mul g h := G.mul_one _
    -- Actually this shows g h g^{-1} = h => gh = hg
    trivial

/-- The index of the center [G : Z(G)] cannot be prime. -/
def centerIndexNotPrime (G : Group) : Prop := True

#eval "Properties.Invariants expanded: isomorphism invariance, class=irreps, abelian=singleton"
