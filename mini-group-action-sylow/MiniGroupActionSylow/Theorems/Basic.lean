/-
# MiniGroupActionSylow.Theorems.Basic

Orbit-stabilizer theorem, Sylow theorems I/II/III.
Burnside's lemma, class equation, fundamental counting lemma.
-/

import MiniGroupActionSylow.Properties.Preservation

namespace MiniGroupActionSylow

open MiniGroupTheoryCore

/-! ## Orbit-stabilizer theorem (axiom) -/

def orbitStabilizerTheoremAxiom : Axiom :=
  Axiom.mk "orbitStabilizer" (Formula.pred 0 [])
    "|G| = |Orbit(x)| · |Stabilizer(x)| for finite G acting on X"

def orbitBijection : Axiom :=
  Axiom.mk "orbitBijection" (Formula.pred 0 [])
    "There is a bijection G/Stab(x) ≅ Orbit(x) given by g·Stab(x) ↦ g·x"

/-! ## Sylow's First Theorem (existence) -/

def sylowFirstTheoremAxiom : Axiom :=
  Axiom.mk "sylowFirst" (Formula.pred 0 [])
    "If p^k divides |G|, then G contains a subgroup of order p^k. In particular, G has a Sylow p-subgroup"

/-! ## Sylow's Second Theorem (conjugacy) -/

def sylowSecondTheoremAxiom : Axiom :=
  Axiom.mk "sylowSecond" (Formula.pred 0 [])
    "All Sylow p-subgroups of G are conjugate. Any p-subgroup of G is contained in some Sylow p-subgroup"

/-! ## Sylow's Third Theorem (counting) -/

def sylowThirdTheoremAxiom : Axiom :=
  Axiom.mk "sylowThird" (Formula.pred 0 [])
    "n_p ≡ 1 (mod p) and n_p · |Sylow_p| = |G|·k where gcd(k,p)=1. So n_p divides m = |G|/p^a"

/-! ## Burnside's Lemma -/

def burnsideLemmaAxiom' : Axiom :=
  Axiom.mk "burnsideLemma" (Formula.pred 0 [])
    "Number of orbits = (1/|G|) · Σ_{g∈G} |Fix(g)|"

/-! ## Class equation -/

def classEquationAxiom'' : Axiom :=
  Axiom.mk "classEquation" (Formula.pred 0 [])
    "|G| = |Z(G)| + Σ_{i=1}^{r} [G : C_G(x_i)] where x_i are non-central conjugacy class representatives"

/-! ## Conjugacy class size formula -/

def conjugacyClassSizeFormula : Axiom :=
  Axiom.mk "conjugacyClassSize" (Formula.pred 0 [])
    "|Cl(g)| = [G : C_G(g)]"

/-! ## p-group center theorem -/

def pGroupCenterTheorem : Axiom :=
  Axiom.mk "pGroupCenter" (Formula.pred 0 [])
    "Every nontrivial finite p-group has a nontrivial center"

/-! ## Cauchy's theorem (group theory) -/

def cauchyGroupTheorem : Axiom :=
  Axiom.mk "cauchyGroup" (Formula.pred 0 [])
    "If a prime p divides |G|, then G contains an element of order p"

/-! ## #eval tests -/

#eval "Theorems.Basic: orbitStabilizer, sylowFirst, sylowSecond, sylowThird"
#eval "Theorems.Basic: burnsideLemma, classEquation, conjugacyClassSize"
#eval "Theorems.Basic: pGroupCenter, cauchyGroup"
