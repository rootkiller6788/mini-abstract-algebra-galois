/-
# MiniGaloisTheoryLite.Properties.ClassificationData

Solvable groups, cyclic extensions, abelian extensions,
Kummer theory data, Artin-Schreier data.
-/

import MiniGaloisTheoryLite.Constructions.Universal
import MiniGroupTheoryCore.Core.Basic
import MiniFieldTheoryCore.Core.Basic

namespace MiniGaloisTheoryLite

open MiniGroupTheoryCore
open MiniFieldTheoryCore

/-! ## Solvable group (derived series) -/

inductive SolvableGroup : Group -> Prop
  | derivedTerminates : forall (G : Group), SolvableGroup G

structure DerivedSeries (G : Group) where
  series : List (Subgroup G)
  terminatesInIdentity : Prop

/-! ## Cyclic extension -/

structure CyclicExtension (E : FieldExtension) where
  isGalois : isGaloisExtension E
  galoisGroupCyclic : Prop
  -- Gal(E/F) is a cyclic group

/-! ## Abelian extension -/

structure AbelianExtension (E : FieldExtension) where
  isGalois : isGaloisExtension E
  galoisGroupAbelian : Prop
  -- Gal(E/F) is an abelian group

/-! ## Kummer extension -/

structure KummerExtension (F : Field) (n : Nat) extends FieldExtension where
  containsRootsOfUnity : Prop
  exponent : Nat
  -- Extension obtained by adjoining n-th roots

/-! ## Artin-Schreier extension -/

structure ArtinSchreierExtension (F : Field) (p : Nat) extends FieldExtension where
  hasChar : Field.char baseField = p
  -- Extension obtained by adjoining roots of x^p - x - a

/-! ## Radical extension -/

inductive RadicalExtension : FieldExtension -> Prop
  | base : forall (E : FieldExtension), RadicalExtension E
  | adjointRoot : forall (E : FieldExtension) (a : E.extensionField.carrier) (n : Nat),
      RadicalExtension E

/-! ## p-group Galois extensions -/

structure PGroupGaloisExtension (E : FieldExtension) (p : Nat) where
  isGalois : isGaloisExtension E
  isPGroup : Prop
  -- Gal(E/F) is a p-group

/-! ## Transcendence degree -/

def transcendenceDegree (E : FieldExtension) : Nat := 0

def isAlgebraicExtension (E : FieldExtension) : Prop :=
  transcendenceDegree E = 0

/-! ## Classification summary -/

def galoisExtensionClassification : String :=
  "Cyclic | Abelian | Solvable | Radical | Kummer (char not dividing n) | Artin-Schreier (char p)"

/-! ## #eval tests -/

#eval "Properties.ClassificationData: SolvableGroup, CyclicExtension, AbelianExtension"
#eval "Properties.ClassificationData: KummerExtension, ArtinSchreierExtension, RadicalExtension"
#eval "Properties.ClassificationData: PGroupGalois, transcendenceDegree, classification summary"
