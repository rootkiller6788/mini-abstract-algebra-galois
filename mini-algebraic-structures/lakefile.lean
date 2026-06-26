import Lake
open Lake DSL

package «mini-algebraic-structures» where

@[default_target]
lean_lib «MiniAlgebraicStructures» where
  roots := #[`MiniAlgebraicStructures]

require «mini-group-theory-core» from "../mini-group-theory-core"
require «mini-ring-theory-core» from "../mini-ring-theory-core"
require «mini-field-theory-core» from "../mini-field-theory-core"
require «mini-module-theory» from "../mini-module-theory"
