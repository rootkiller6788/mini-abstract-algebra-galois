import Lake
open Lake DSL

package «mini-group-theory-core» where

@[default_target]
lean_lib «MiniGroupTheoryCore» where
  roots := #[`MiniGroupTheoryCore]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
