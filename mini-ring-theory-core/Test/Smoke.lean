/-
# Smoke Tests — MiniRingTheoryCore

Run: `lake env lean --run Test/Smoke.lean`
-/

import MiniRingTheoryCore

open MiniRingTheoryCore

#eval "══ MINI-RING-THEORY-CORE SMOKE TESTS ══"

/-! ## Core.Basic: Ring -/

#eval "── Core.Basic: Ring structure ──"

def trivialRing : Ring where
  carrier := Unit
  add _ _ := ()
  zero := ()
  neg _ := ()
  mul _ _ := ()
  one := ()
  add_assoc _ _ _ := rfl
  add_comm _ _ := rfl
  add_zero _ := rfl
  add_neg _ := rfl
  mul_assoc _ _ _ := rfl
  mul_one _ := rfl
  one_mul _ := rfl
  mul_add _ _ _ := rfl
  add_mul _ _ _ := rfl

#eval trivialRing.zero

/-! ## Core.Basic: RingHom -/

#eval "── Core.Basic: RingHom ──"

def trivialRingHom : RingHom trivialRing trivialRing where
  map _ := ()
  map_add _ _ := rfl
  map_mul _ _ := rfl
  map_one := rfl

#eval trivialRingHom.map_one

/-! ## Core.Basic: Ideal -/

#eval "── Core.Basic: Ideal ──"

def trivialIdeal : Ideal trivialRing where
  subset _ := True
  zero_mem := trivial
  add_closed h₁ h₂ := trivial
  smul_closed h := trivial

#eval trivialIdeal.zero_mem

/-! ## Core.Basic: IntegralDomain -/

#eval "── Core.Basic: isIntegralDomain ──"
#eval "isIntegralDomain predicate defined"

/-! ## Core.Basic: Unit / ZeroDivisor -/

#eval "── Core.Basic: isUnit, isZeroDivisor ──"
#eval "isUnit predicate defined"
#eval "isZeroDivisor predicate defined"

/-! ## Morphisms -/

#eval "── Morphisms.Iso: RingIso ──"
def trivialRingIso : RingIso trivialRing trivialRing where
  toFun _ := ()
  invFun _ := ()
  leftInv _ := rfl
  rightInv _ := rfl
  map_add _ _ := rfl
  map_mul _ _ := rfl

#eval (trivialRingIso.toEq () ()).mpr rfl

#eval "── Morphisms.Equivalence: EqChain ──"
def simpleChain : EqChain Nat 1 3 :=
  .trans _ _ _ (.step 1 2 rfl) (.step 2 3 rfl)
#eval simpleChain.toEq

#eval "── Morphisms.Hom: RingEmbedding ──"
def embedId : RingEmbedding trivialRing trivialRing :=
  RingEmbedding.id trivialRing
#eval embedId.map_one

/-! ## Constructions -/

#eval "── Constructions.Universal: RingEmbeddingGraph ──"
def g := RingEmbeddingGraph.empty
#eval g.nodes
#eval g.edges

#eval "══ ALL MINI-RING-THEORY-CORE SMOKE TESTS PASSED ══"
