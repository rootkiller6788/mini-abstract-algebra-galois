import MiniGroupActionSylow

open MiniGroupActionSylow

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniGroupActionSylow v0.1.0"
  IO.println "  Group Actions, Orbit-Stabilizer, Sylow Theorems"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  GroupAction: G × X → X with identity and compatibility axioms"
  IO.println s!"  Orbit: G·x = {g·x | g ∈ G}; Orbit-Stabilizer: |G| = |Orb(x)|·|Stab(x)|"
  IO.println s!"  Stabilizer: Stab(x) = {g ∈ G | g·x = x} (subgroup)"
  IO.println s!"  FixedPoints: X^G = {x ∈ X | ∀g, g·x = x}"
  IO.println s!"  Burnside's Lemma: |X/G| = (1/|G|) Σ_g |Fix(g)|"
  IO.println s!"  ClassEquation: |G| = |Z(G)| + Σ [G : C_G(g_i)]"
  IO.println s!"  Sylow I: existence of Sylow p-subgroups for each prime p dividing |G|"
  IO.println s!"  Sylow II: all Sylow p-subgroups are conjugate"
  IO.println s!"  Sylow III: n_p ≡ 1 mod p, n_p divides |G|/p^k"
  IO.println ""
  IO.println "  Depends on: mini-group-theory-core"
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
