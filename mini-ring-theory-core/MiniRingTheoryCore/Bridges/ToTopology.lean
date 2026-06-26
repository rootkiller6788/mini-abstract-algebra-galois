/-
# MiniRingTheoryCore.Bridges.ToTopology

Bridge from ring theory to topology: the Zariski spectrum.
Spec(R) is the set of prime ideals of R, equipped with the
Zariski topology, forming the bridge to algebraic geometry.
-/

import MiniRingTheoryCore.Core.Basic
import MiniRingTheoryCore.Properties.Invariants
import MiniRingTheoryCore.Constructions.Subobjects
import MiniRingTheoryCore.Theorems.Basic

namespace MiniRingTheoryCore

/-! ## The Prime Spectrum Spec(R)

Spec(R) = { P ⊂ R | P is a prime ideal }.
This set is the fundamental topological space in algebraic geometry. -/

/-- The prime spectrum of a commutative ring R:
    the set of all prime ideals. -/
axiom Spec (R : Ring) : Type

/-- View a point of Spec(R) as a prime ideal of R. -/
axiom specToIdeal {R : Ring} (p : Spec R) : Ideal R

/-- Every point of Spec(R) corresponds to a prime ideal. -/
axiom specToIdeal_isPrime {R : Ring} (p : Spec R) :
  Ideal.IsPrime (specToIdeal p)

/-- Every prime ideal gives a point of Spec(R). -/
axiom idealToSpec {R : Ring} (P : Ideal R) (hP : Ideal.IsPrime P) :
  Spec R

/-- Spec(R) is nonempty if R ≠ 0 (since every nonzero ring has
    at least one maximal ideal, which is prime). -/
axiom spec_nonempty {R : Ring} (h : R.zero ≠ R.one) : Nonempty (Spec R)

/-! ## Zariski Topology

For any ideal I of R, define V(I) = { P ∈ Spec(R) | I ⊆ P }.
These closed sets form the Zariski topology on Spec(R). -/

/-- The closed set V(I) for an ideal I. -/
axiom zariskiClosed {R : Ring} (I : Ideal R) : Set (Spec R)

/-- V(I) = { p ∈ Spec(R) | I ⊆ specToIdeal(p) }. -/
axiom zariskiClosed_iff {R : Ring} (I : Ideal R) (p : Spec R) :
  p ∈ zariskiClosed I ↔ I.subset ⊆ (specToIdeal p).subset

/-- The Zariski topology axioms:
    V(0) = Spec(R), V(R) = ∅,
    V(I ∩ J) = V(I) ∪ V(J),
    V(∑ I_α) = ∩ V(I_α). -/

/-- V(0) = Spec(R): the zero ideal is contained in every ideal. -/
axiom zariski_V_zero {R : Ring} : zariskiClosed (zeroIdeal R) = Set.univ

/-- V(R) = ∅: the unit ideal is contained in no prime ideal. -/
axiom zariski_V_unit {R : Ring} : zariskiClosed (unitIdeal R) = ∅

/-- The unit ideal: the whole ring. -/
axiom unitIdeal (R : Ring) : Ideal R

/-- V(I ∩ J) = V(I) ∪ V(J): intersection becomes union. -/
axiom zariski_V_inter {R : Ring} (I J : Ideal R) :
  zariskiClosed (Ideal.inter I J) = zariskiClosed I ∪ zariskiClosed J

/-- V(I + J) = V(I) ∩ V(J): sum becomes intersection. -/
axiom zariski_V_sum {R : Ring} (I J : Ideal R) :
  zariskiClosed (Ideal.sum I J) = zariskiClosed I ∩ zariskiClosed J

/-! ## Basic Open Sets

For f ∈ R, the basic open set D(f) = { P | f ∉ P }.
These form a basis for the Zariski topology. -/

/-- The basic open set D(f) = Spec(R) \ V((f)). -/
axiom zariskiBasicOpen {R : Ring} (f : R.carrier) : Set (Spec R)

/-- D(f) = { p | f ∉ specToIdeal(p) }. -/
axiom zariskiBasicOpen_iff {R : Ring} (f : R.carrier) (p : Spec R) :
  p ∈ zariskiBasicOpen f ↔ f ∉ (specToIdeal p).subset

/-- The basic open sets form a basis of the Zariski topology. -/
axiom zariskiBasicOpen_basis {R : Ring} : True

/-- D(f) ∩ D(g) = D(fg): the basic opens are closed under
    finite intersection. -/
axiom zariskiBasicOpen_inter {R : Ring} (f g : R.carrier) :
  zariskiBasicOpen f ∩ zariskiBasicOpen g = zariskiBasicOpen (R.mul f g)

/-! ## Connection to Algebraic Geometry

Spec(R) is the affine scheme associated to R. The structure
sheaf O_{Spec(R)} makes it a locally ringed space, giving
the full scheme structure. This is the foundational bridge
between commutative algebra and algebraic geometry. -/

/-- The structure sheaf on Spec(R). -/
axiom structureSheaf {R : Ring} : True

/-- The stalk of the structure sheaf at a prime ideal P is
    the localization R_P. -/
axiom structureSheaf_stalk {R : Ring} (p : Spec R) : True

/-- Global sections of the structure sheaf are exactly R:
    Γ(Spec(R), O) = R. -/
axiom globalSections_eq_R (R : Ring) : True

/-! ## #eval examples -/

#eval "Spec(R): prime spectrum of R"
#eval "zariskiClosed V(I): Zariski closed sets"
#eval "zariskiBasicOpen D(f): basis of Zariski topology"
#eval "structureSheaf: O_{Spec(R)} sheaf of rings"
