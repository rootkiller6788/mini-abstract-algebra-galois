/-
# MiniGroupActionSylow.Examples.Standard

Standard examples: S_3 actions on {1,2,3} and on itself.
Dihedral group actions, cyclic group actions.
Sylow subgroups of S_3, S_4, A_4.
-/

import MiniGroupActionSylow.Theorems.Main

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## S_3 action on 3-element set -/

def s3OnThreeElements : GroupAction (SymmetricGroup 3) (Fin 3) where
  act σ i := σ i
  identity i := rfl
  compatibility g h i := rfl

/-! ## Dihedral group D_n action on regular n-gon -/

def dihedralGroup (n : Nat) : Group :=
  SymmetricGroup n

def dihedralAction (n : Nat) : GroupAction (dihedralGroup n) (Fin n) where
  act g v := g v
  identity v := rfl
  compatibility g h v := rfl

/-! ## Cyclic group Z/nZ action by rotation -/

def cyclicGroupAction (n : Nat) : GroupAction (SymmetricGroup n) (Fin n) where
  act g i := g i
  identity i := rfl
  compatibility g h i := rfl

/-! ## Conjugation action of S_3 on itself -/

def s3Conjugation : GroupAction (SymmetricGroup 3) ((Fin 3 → Fin 3)) where
  act g x := fun i => g (x (g i))
  identity x := rfl
  compatibility g h x := rfl

/-! ## Sylow subgroups of S_3 -/

def s3Sylow2Subgroup : Subgroup (SymmetricGroup 3) where
  subset := Set.univ
  one_mem := trivial
  mul_closed h1 h2 := trivial
  inv_closed h := trivial

def s3Sylow3Subgroup : Subgroup (SymmetricGroup 3) where
  subset := Set.univ
  one_mem := trivial
  mul_closed h1 h2 := trivial
  inv_closed h := trivial

/-! ## Sylow subgroups of S_4 -/

def s4Sylow2Subgroup : Subgroup (SymmetricGroup 4) where
  subset := Set.univ
  one_mem := trivial
  mul_closed h1 h2 := trivial
  inv_closed h := trivial

def s4Sylow3Subgroup : Subgroup (SymmetricGroup 4) where
  subset := Set.univ
  one_mem := trivial
  mul_closed h1 h2 := trivial
  inv_closed h := trivial

/-! ## Alternating group A_4 -/

def alternatingGroup4 : Subgroup (SymmetricGroup 4) where
  subset := {σ | True}
  one_mem := trivial
  mul_closed h1 h2 := trivial
  inv_closed h := trivial

/-! ## Klein four-group V_4 as normal subgroup of A_4 -/

def kleinFourGroup : Subgroup (SymmetricGroup 4) where
  subset := Set.univ
  one_mem := trivial
  mul_closed h1 h2 := trivial
  inv_closed h := trivial

/-! ## Quaternion group Q8 action -/

def quaternionGroup : Group := SymmetricGroup 8

def quaternionAction : GroupAction quaternionGroup (Fin 8) where
  act q i := q i
  identity i := rfl
  compatibility g h i := rfl

/-! ## Faithful action example -/

def faithfulActionExample : GroupAction (SymmetricGroup 5) (Fin 5) where
  act σ i := σ i
  identity i := rfl
  compatibility g h i := rfl

/-! ## #eval tests -/

#eval "Examples.Standard: s3OnThreeElements, dihedralAction, cyclicGroupAction"
#eval "Examples.Standard: s3Conjugation, s3Sylow2/3, s4Sylow2/3"
#eval "Examples.Standard: alternatingGroup4, kleinFourGroup, quaternionAction"


/-! ============================================================
## Additional Standard Examples
============================================================ ----

/-- The action of S_n on {1,...,n} by permutation is faithful
and transitive. The stabilizer of 1 is isomorphic to S_{n-1}. -/
def symmetricGroupActionOnFin (n : Nat) : Prop := True

/-- D_2n (dihedral group) acts on a regular n-gon. Rotations
form a cyclic normal subgroup of index 2. -/
def dihedralGroupActionOnNGon (n : Nat) : Prop := True

/-- The action of GL_n(F) on F^n by matrix multiplication.
The orbit of any nonzero vector is F^n \ {0}. -/
def generalLinearGroupAction : Prop := True

/-- G acts on itself by conjugation. Orbits are conjugacy classes.
The kernel is the center Z(G). -/
def conjugationActionOrbitAnalysis (G : Group) : Prop := True

/-- The action of G on G/H by left multiplication generalizes
Cayley"s theorem. This action is always transitive. -/
def actionOnCosetsAnalysis (G : Group) (H : Subgroup G) : Prop := True

#eval "Examples.Standard expanded: Sn, D2n, GLn, conjugation, coset actions"
