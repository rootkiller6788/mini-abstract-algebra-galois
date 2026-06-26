import Lake
open Lake DSL

package «mini-group-action-sylow» where

@[default_target]
lean_lib «MiniGroupActionSylow» where
  roots := #[`MiniGroupActionSylow]

require «mini-group-theory-core» from "../mini-group-theory-core"
require «mini-axiom-kernel» from "../../0. mini-math-kernel/mini-axiom-kernel"
require «mini-logic-kernel» from "../../0. mini-math-kernel/mini-logic-kernel"
