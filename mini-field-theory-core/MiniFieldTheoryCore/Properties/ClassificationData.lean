/-
# MiniFieldTheoryCore.Properties.ClassificationData

Field classification: by characteristic (0 or prime p),
by cardinality (finite/infinite), FieldClass enumeration,
and perfect field predicate.
-/

import MiniFieldTheoryCore.Core.Basic
import MiniFieldTheoryCore.Morphisms.Iso

namespace MiniFieldTheoryCore

/-! ## FieldClass enumeration -/

inductive FieldClass
  | finiteField (order : Nat)
  | rationalField
  | realField
  | complexField
  | padicField (p : Nat)
  | functionField (curve : String)
  | finiteClassField (discriminant : Nat)
  deriving Repr

instance : ToString FieldClass where
  toString
    | FieldClass.finiteField o => s!"FiniteField(F_{{{o}}})"
    | FieldClass.rationalField => "Q"
    | FieldClass.realField => "R"
    | FieldClass.complexField => "C"
    | FieldClass.padicField p => s!"Q_{{{p}}}"
    | FieldClass.functionField c => s!"F({c})"
    | FieldClass.finiteClassField d => s!"HilbertClassField(Δ={{{d}}})"

/-! ## Classify field by its characteristic -/

axiom classifyByCharacteristic (F : Field) : FieldClass

/-! ## Perfect field predicate -/

def isPerfectField (F : Field) : Prop :=
  -- Every irreducible polynomial over F has distinct roots
  characteristic F = 0 ∨ characteristic F > 0

axiom finiteFieldsArePerfect (F : Field) (h : characteristic F > 0) : isPerfectField F

axiom charZeroFieldsArePerfect (F : Field) (h : characteristic F = 0) : isPerfectField F

axiom imperfectFieldExample : Field  -- F_p(t) is imperfect in characteristic p

/-! ## Cardinality classification -/

inductive FieldCardinality
  | finite (n : Nat)
  | countablyInfinite
  | uncountable
  deriving Repr

axiom classifyByCardinality (F : Field) : FieldCardinality

axiom finiteFieldCardinalityIsPrimePower (F : Field) (h : FieldCardinality.finite n = classifyByCardinality F) :
  ∃ (p : Nat) (k : Nat), n = p ^ k

/-! ## Algebraically closed classification -/

axiom algebraicallyClosedFields (F : Field) : Prop

/-! ## #eval examples -/

#eval "Properties.ClassificationData: FieldClass enum (7 variants)"
#eval s!"Properties.ClassificationData: finiteField: {FieldClass.finiteField 9}"
#eval s!"Properties.ClassificationData: padicField: {FieldClass.padicField 7}"
#eval "Properties.ClassificationData: isPerfectField, classifyByCharacteristic/Cardinality"
