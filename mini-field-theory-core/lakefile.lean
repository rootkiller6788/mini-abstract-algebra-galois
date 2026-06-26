import Lake
open Lake DSL

package «mini-field-theory-core» where

@[default_target]
lean_lib «MiniFieldTheoryCore» where
  roots := #[`MiniFieldTheoryCore]

require «mini-ring-theory-core» from "../mini-ring-theory-core"
require «mini-group-theory-core» from "../mini-group-theory-core"
