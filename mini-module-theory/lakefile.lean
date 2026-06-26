import Lake
open Lake DSL

package «mini-module-theory» where

@[default_target]
lean_lib «MiniModuleTheory» where
  roots := #[`MiniModuleTheory]

require «mini-ring-theory-core» from "../mini-ring-theory-core"
require «mini-group-theory-core» from "../mini-group-theory-core"
