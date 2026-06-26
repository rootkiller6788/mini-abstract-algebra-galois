import MiniGroupTheoryCore

open MiniGroupTheoryCore

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniGroupTheoryCore v0.1.0"
  IO.println "  Group Theory Core"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  Group: carrier, mul, inv, one with associativity, identity, inverse axioms"
  IO.println s!"  Subgroup: subset closed under multiplication and inverses"
  IO.println s!"  NormalSubgroup: gHg⁻¹ = H for all g"
  IO.println s!"  QuotientGroup: G/N for normal subgroup N"
  IO.println s!"  DirectProduct: G × H with componentwise operations"
  IO.println s!"  SemidirectProduct: G ⋊ H via homomorphism φ : H → Aut(G)"
  IO.println s!"  FreeProduct: G ∗ H (coproduct in Grp)"
  IO.println "  Pillar theorems: Lagrange, Cauchy, Sylow, Jordan-Holder, Burnside, Feit-Thompson"
  IO.println s!"  Group order |G|, element order, exponent of a group"
  IO.println s!"  Homomorphisms, kernels, images, isomorphism theorems (1st/2nd/3rd)"
  IO.println ""
  IO.println "  Depends on: mini-object-kernel"
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
