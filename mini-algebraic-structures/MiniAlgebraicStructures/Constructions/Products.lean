/-
# MiniAlgebraicStructures.Constructions.Products

Product constructions: direct product, semidirect product,
free product, tensor product. Product of rings, modules, algebras.
Product in universal algebra.
-/

import MiniAlgebraicStructures.Morphisms.Iso

namespace MiniAlgebraicStructures

/-! ## Direct product of groups -/

structure DirectProduct (G H : Type u) where
  carrier := G x H
  mul : carrier -> carrier -> carrier
  one : carrier
  inv : carrier -> carrier

def DirectProduct.mk (G H : Type u) : DirectProduct G H where
  mul := fun (g1, h1) (g2, h2) => (g1 * g2, h1 * h2)
  one := (1, 1)
  inv := fun (g, h) => (g⁻¹, h⁻¹)

/-! ## Semidirect product -/

structure SemidirectProduct (G H : Type u) (phi : G -> (H -> H)) where
  carrier := G x H
  mul : carrier -> carrier -> carrier
  one : carrier
  inv : carrier -> carrier

/-! ## Free product (coproduct) of groups -/

structure FreeProduct (G H : Type u) where
  carrier : Type u
  injG : G -> carrier
  injH : H -> carrier
  isUniversal : Prop

/-! ## Direct product of rings -/

structure DirectProductRing (R S : Type u) where
  carrier := R x S
  add : carrier -> carrier -> carrier
  mul : carrier -> carrier -> carrier
  zero : carrier
  one : carrier
  neg : carrier -> carrier

/-! ## Tensor product of modules -/

structure TensorProductModule (R M N : Type u) where
  carrier : Type u
  tensor : M -> N -> carrier
  add : carrier -> carrier -> carrier
  zero : carrier
  smul : R -> carrier -> carrier
  isBilinear : Prop
  isUniversal : Prop

/-! ## Product of algebras over a signature -/

structure SigProduct (sig : Signature) (A B : SigAlgebra sig) where
  carrier : (s : sig.sorts) -> Type u
  ops : True
  projA : SigHom sig (SigProduct.mk sig A B) A
  projB : SigHom sig (SigProduct.mk sig A B) B
  isUniversal : Prop

/-! ## #eval tests -/

#eval "Constructions.Products: DirectProduct, SemidirectProduct, FreeProduct"
#eval "Constructions.Products: DirectProductRing, TensorProductModule, SigProduct"
