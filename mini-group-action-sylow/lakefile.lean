import Lake
open Lake DSL

package «mini-group-action-sylow» where

@[default_target]
lean_lib «MiniGroupActionSylow» where
  roots := #[`MiniGroupActionSylow]

require «mini-group-theory-core» from "../mini-group-theory-core"
