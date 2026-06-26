import Lake
open Lake DSL

package «mini-polynomial-algebra» where

@[default_target]
lean_lib «MiniPolynomialAlgebra» where
  roots := #[`MiniPolynomialAlgebra]

require «mini-ring-theory-core» from "../mini-ring-theory-core"
require «mini-field-theory-core» from "../mini-field-theory-core"
