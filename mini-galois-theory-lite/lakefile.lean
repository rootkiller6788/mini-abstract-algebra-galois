import Lake
open Lake DSL

package «mini-galois-theory-lite» where

@[default_target]
lean_lib «MiniGaloisTheoryLite» where
  roots := #[`MiniGaloisTheoryLite]

require «mini-field-theory-core» from "../mini-field-theory-core"
require «mini-group-theory-core» from "../mini-group-theory-core"
require «mini-polynomial-algebra» from "../mini-polynomial-algebra"
