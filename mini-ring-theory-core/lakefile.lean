import Lake
open Lake DSL

package «mini-ring-theory-core» where

@[default_target]
lean_lib «MiniRingTheoryCore» where
  roots := #[`MiniRingTheoryCore]

require «mini-group-theory-core» from "../mini-group-theory-core"
require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
require «mini-axiom-kernel» from "../../0. mini-math-kernel/mini-axiom-kernel"
