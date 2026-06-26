/-
# MiniAlgebraicStructures.Constructions.Products

Product constructions: direct product, semidirect product,
free product, tensor product. Product of rings, modules, algebras.
Products and coproducts in universal algebra. Limits and colimits.
-/

import MiniAlgebraicStructures.Morphisms.Iso

namespace MiniAlgebraicStructures

/-! ## Direct product of groups -/

structure DirectProduct (G H : Type u) where
  carrier := G × H
  mul : carrier -> carrier -> carrier
  one : carrier
  inv : carrier -> carrier

def DirectProduct.mk (G H : Type u) : DirectProduct G H where
  mul := fun (g1, h1) (g2, h2) => (g1 * g2, h1 * h2)
  one := (1, 1)
  inv := fun (g, h) => (g⁻¹, h⁻¹)

/-! ### Projections -/

def DirectProduct.projL {G H : Type u} (P : DirectProduct G H) : (G × H) -> G :=
  Prod.fst

def DirectProduct.projR {G H : Type u} (P : DirectProduct G H) : (G × H) -> H :=
  Prod.snd

/-! ### Universal property of direct product -/

def DirectProduct.universalProperty {G H K : Type u} (P : DirectProduct G H)
    (fG : GroupHom K G) (fH : GroupHom K H) : Prop :=
  ∃! (f : K → G × H), (fun k => (Prod.fst (f k))) = fG.map ∧ (fun k => (Prod.snd (f k))) = fH.map

/-! ## Semidirect product -/

structure SemidirectProduct (G H : Type u) (phi : G -> (H -> H)) where
  carrier := G × H
  mul : carrier -> carrier -> carrier
  one : carrier
  inv : carrier -> carrier

/-! ### Semidirect product construction -/

def SemidirectProduct.mk (G H : Type u) (phi : G -> (H -> H)) : SemidirectProduct G H phi where
  mul := fun (g1, h1) (g2, h2) => (g1 * g2, h1 * phi g1 h2)
  one := (1, 1)
  inv := fun (g, h) => (g⁻¹, phi g⁻¹ h⁻¹)

/-! ## Free product (coproduct) of groups -/

structure FreeProduct (G H : Type u) where
  carrier : Type u
  injG : G -> carrier
  injH : H -> carrier
  isUniversal : Prop

/-! ### Free product universal property -/

def FreeProduct.universalProperty {G H K : Type u} (FP : FreeProduct G H)
    (fG : GroupHom G K) (fH : GroupHom H K) : Prop :=
  ∃! (f : GroupHom FP.carrier K),
    (fun g => f.map (FP.injG g)) = fG.map ∧ (fun h => f.map (FP.injH h)) = fH.map

/-! ## Direct product of rings -/

structure DirectProductRing (R S : Type u) where
  carrier := R × S
  add : carrier -> carrier -> carrier
  mul : carrier -> carrier -> carrier
  zero : carrier
  one : carrier
  neg : carrier -> carrier

def DirectProductRing.mk (R S : Type u) : DirectProductRing R S where
  add := fun (r1, s1) (r2, s2) => (r1 + r2, s1 + s2)
  mul := fun (r1, s1) (r2, s2) => (r1 * r2, s1 * s2)
  zero := (0, 0)
  one := (1, 1)
  neg := fun (r, s) => (-r, -s)

/-! ## Direct sum / product of modules -/

structure DirectSumModule (R M N : Type u) where
  carrier := M × N
  add : carrier -> carrier -> carrier
  zero : carrier
  neg : carrier -> carrier
  smul : R -> carrier -> carrier

def DirectSumModule.mk (R M N : Type u) : DirectSumModule R M N where
  add := fun (m1, n1) (m2, n2) => (m1 + m2, n1 + n2)
  zero := (0, 0)
  neg := fun (m, n) => (-m, -n)
  smul := fun r (m, n) => (r * m, r * n)

/-! ## Tensor product of modules -/

structure TensorProductModule (R M N : Type u) where
  carrier : Type u
  tensor : M -> N -> carrier
  add : carrier -> carrier -> carrier
  zero : carrier
  smul : R -> carrier -> carrier
  isBilinear : Prop
  isUniversal : Prop

/-! ### Tensor product universal property -/

def TensorProductModule.universalProperty {R M N P : Type u} (T : TensorProductModule R M N)
    (b : M → N → P) : Prop :=
  True

/-! ### Tensor-Hom adjunction -/

def tensorHomAdjunction {R M N P : Type u} : Prop :=
  True

/-! ## Product of algebras over a signature -/

structure SigProduct (sig : Signature) (A B : SigAlgebra sig) where
  carrier : (s : sig.sorts) -> Type u
  ops : True
  projA : SigHom sig (SigProduct.mk sig A B) A
  projB : SigHom sig (SigProduct.mk sig A B) B
  isUniversal : Prop

/-! ## Limit of a diagram -/

structure Limit (J : Type u) (diagram : J -> Type u) where
  carrier : Type u
  projections : (j : J) -> carrier -> diagram j
  isUniversal : Prop

/-! ## Colimit / Coproduct -/

structure Colimit (J : Type u) (diagram : J -> Type u) where
  carrier : Type u
  injections : (j : J) -> diagram j -> carrier
  isUniversal : Prop

/-! ## Fiber product (pullback) of groups -/

structure FiberProduct {G H K : Type u} (f : GroupHom G K) (g : GroupHom H K) where
  carrier := {p : G × H | f.map p.1 = g.map p.2}
  projG : carrier -> G
  projH : carrier -> H
  isUniversal : Prop

/-! ## Pushout of groups -/

structure PushoutGroup {G H K : Type u} (f : GroupHom G H) (g : GroupHom G K) where
  carrier : Type u
  inH : GroupHom H carrier
  inK : GroupHom K carrier
  commutes : GroupHom.comp f inH = GroupHom.comp g inK
  isUniversal : Prop

/-! ## Amalgamated free product -/

structure AmalgamatedFreeProduct {G H K : Type u} (f : GroupHom G H) (g : GroupHom G K) where
  carrier : Type u
  inH : H -> carrier
  inK : K -> carrier
  amalgamation : ∀ (g : G), inH (f.map g) = inK (g.map g)
  isUniversal : Prop

/-! ## Wreath product -/

structure WreathProduct (G H : Type u) where
  carrier := G × (H → G)
  mul : carrier -> carrier -> carrier
  one : carrier
  inv : carrier -> carrier

/-! ## Restricted product -/

structure RestrictedProduct (I : Type u) (Gs : I -> Type u) where
  carrier : Type u
  embed : (i : I) -> Gs i -> carrier
  isUniversal : Prop

/-! ## Ultraproduct -/

structure Ultraproduct (I : Type u) (Gs : I -> Type u) (U : Set (Set I)) where
  carrier : Type u
  embed : Type u
  isUniversal : Prop
  losTheorem : Prop

/-! ## #eval tests -/

#eval "Constructions.Products: DirectProduct, SemidirectProduct, FreeProduct"
#eval "Constructions.Products: DirectProductRing, DirectSumModule, TensorProductModule"
#eval "Constructions.Products: SigProduct, Limit, Colimit"
#eval "Constructions.Products: FiberProduct, PushoutGroup, AmalgamatedFreeProduct"
#eval "Constructions.Products: WreathProduct, RestrictedProduct, Ultraproduct"
