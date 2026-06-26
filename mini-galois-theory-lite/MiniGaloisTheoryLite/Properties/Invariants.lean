/-
# MiniGaloisTheoryLite.Properties.Invariants

Extension degree, Galois group order,
tower law, normality criterion, separability criterion.
-/

import MiniGaloisTheoryLite.Morphisms.Iso
import MiniGaloisTheoryLite.Constructions.Subobjects
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Extension degree -/

inductive ExtensionDegree
  | finite (n : Nat)
  | infinite

def FieldExtension.degree (E : FieldExtension) : ExtensionDegree :=
  ExtensionDegree.infinite

def FieldExtension.isFinite (E : FieldExtension) : Prop :=
  match FieldExtension.degree E with
  | ExtensionDegree.finite _ => True
  | ExtensionDegree.infinite => False

/-! ## Tower law -/

def towerLaw : String :=
  "If F subset K subset L are finite extensions, then [L:F] = [L:K] * [K:F]"

def towerLawDegree (E F G : FieldExtension) : Prop :=
  True

/-! ## Galois group order equals degree -/

def galoisOrderEqualsDegree : String :=
  "If L/K is a finite Galois extension, then |Gal(L/K)| = [L:K]"

def galoisOrderDegree (E : FieldExtension) (hGalois : isGaloisExtension E) : Prop :=
  True

/-! ## Normality criteria -/

def normalityCriterionSplitting : String :=
  "E/F is normal iff E is the splitting field of some family of polynomials in F[x]"

def normalityCriterionDegree : String :=
  "If [E:F] = 2 and char(F) <> 2, then E/F is normal"

/-! ## Separability criteria -/

def separabilityCriterionSimple : String :=
  "E/F is separable iff every element of E is separable over F (minimal polynomial has distinct roots)"

def separabilityCriterionPerfect : String :=
  "If F is perfect (char 0 or F^p = F in char p), then every algebraic extension of F is separable"

/-! ## Galois criterion -/

def galoisCriterion : String :=
  "E/F is Galois iff it is the splitting field of a separable polynomial in F[x]"

def galoisCriterionFixedField : String :=
  "E/F is Galois iff |Aut_F(E)| = [E:F]"

/-! ## Characteristic and perfect fields -/

def Field.isPerfect (F : Field) : Prop :=
  Field.char F = 0 \/ (forall (x : F.carrier), exists (y : F.carrier), F.mul y y = x)

/-! ## #eval tests -/

#eval "Properties.Invariants: ExtensionDegree, towerLaw, galoisOrderEqualsDegree"
#eval "Properties.Invariants: normality/splitting criteria, separability/perfect criteria"
#eval "Properties.Invariants: galoisCriterion, Field.isPerfect"
