import MiniModuleTheory

open MiniModuleTheory

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniModuleTheory v0.1.0"
  IO.println "  Module Theory Sub-Package"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  Module: R-module structure over a ring"
  IO.println s!"  Submodule / QuotientModule"
  IO.println s!"  ModuleHom: module homomorphisms"
  IO.println s!"  FreeModule / FinitelyGenerated"
  IO.println s!"  Noetherian / Artinian modules"
  IO.println s!"  Tensor product / Exact sequences"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
