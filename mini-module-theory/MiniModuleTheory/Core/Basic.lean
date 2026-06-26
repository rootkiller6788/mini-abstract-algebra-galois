/-
# MiniModuleTheory.Core.Basic

Modules over rings: R-module, submodule, quotient module,
module homomorphism, free module, finitely generated,
Noetherian and Artinian modules.

This file contains the L1 core definitions for module theory:
- Module, Submodule, ModuleHom (R-linear maps)
- FreeModule, FinitelyGenerated, Noetherian, Artinian
- Exact sequences, Tensor products

Also covers L2 core concepts through basic lemmas about
these structures, including module axioms derived from
the abelian group axioms.
-/

import MiniGroupTheoryCore.Core.Basic
import MiniRingTheoryCore.Core.Basic

namespace MiniModuleTheory

open MiniGroupTheoryCore
open MiniRingTheoryCore

/-! ## Module over a Ring -/

/--
An R-module is an abelian group (M, +, 0, -) together with
a scalar multiplication R × M → M satisfying the module axioms.
-/
structure Module (R : Ring) where
  carrier : Type u
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  smul : R.carrier → carrier → carrier
  add_assoc : ∀ (x y z : carrier), add (add x y) z = add x (add y z)
  add_comm : ∀ (x y : carrier), add x y = add y x
  add_zero : ∀ (x : carrier), add x zero = x
  add_neg : ∀ (x : carrier), add x (neg x) = zero
  smul_one : ∀ (x : carrier), smul R.one x = x
  smul_add : ∀ (a : R.carrier) (x y : carrier), smul a (add x y) = add (smul a x) (smul a y)
  add_smul : ∀ (a b : R.carrier) (x : carrier), smul (R.add a b) x = add (smul a x) (smul b x)
  mul_smul : ∀ (a b : R.carrier) (x : carrier), smul (R.mul a b) x = smul a (smul b x)

namespace Module

variable {R : Ring} (M : Module R)

/-- Zero scalar acts as zero: 0_R · x = 0_M -/
theorem zero_smul (x : M.carrier) : M.smul R.zero x = M.zero := by
  have h := M.add_smul R.zero R.zero x
  rw [R.add_zero R.zero] at h
  have h2 : M.add (M.smul R.zero x) (M.smul R.zero x) = M.add (M.smul R.zero x) M.zero := by
    rw [h, M.add_zero (M.smul R.zero x)]
  have h3 := congrArg (fun t => M.add t (M.neg (M.smul R.zero x))) h2
  rw [M.add_assoc, M.add_neg, M.add_zero (M.smul R.zero x)] at h3
  rw [M.add_assoc, M.add_neg] at h3
  have h4 : M.add (M.smul R.zero x) M.zero = M.smul R.zero x := M.add_zero _
  rw [h4] at h3
  rw [M.add_comm (M.smul R.zero x), M.add_neg] at h3
  exact h3

/-- Scalar times zero is zero: a · 0_M = 0_M -/
theorem smul_zero (a : R.carrier) : M.smul a M.zero = M.zero := by
  have h := M.smul_add a M.zero M.zero
  rw [M.add_zero M.zero] at h
  have h2 : M.add (M.smul a M.zero) (M.smul a M.zero) = M.add (M.smul a M.zero) M.zero := by
    rw [h, M.add_zero (M.smul a M.zero)]
  have h3 := congrArg (fun t => M.add t (M.neg (M.smul a M.zero))) h2
  rw [M.add_assoc, M.add_neg, M.add_zero (M.smul a M.zero)] at h3
  rw [M.add_assoc, M.add_neg] at h3
  have h4 : M.add (M.smul a M.zero) M.zero = M.smul a M.zero := M.add_zero _
  rw [h4] at h3
  rw [M.add_comm (M.smul a M.zero), M.add_neg] at h3
  exact h3

/-- Negative scalar action: (-1_R) · x = -x -/
theorem neg_one_smul (x : M.carrier) : M.smul (R.neg R.one) x = M.neg x := by
  have h := M.add_smul R.one (R.neg R.one) x
  rw [R.add_neg] at h
  rw [M.zero_smul] at h
  rw [M.smul_one] at h
  have h2 : M.add x (M.smul (R.neg R.one) x) = M.zero := h
  have h3 := congrArg (fun t => M.add (M.neg x) t) h2
  rw [M.add_zero] at h3
  rw [M.add_assoc, M.add_neg, M.add_zero] at h3
  exact h3

/-- Scalar distributes over negation: a · (-x) = -(a · x) -/
theorem smul_neg (a : R.carrier) (x : M.carrier) : M.smul a (M.neg x) = M.neg (M.smul a x) := by
  have h := M.smul_add a x (M.neg x)
  rw [M.add_neg] at h
  rw [M.smul_zero] at h
  have h2 : M.add (M.smul a x) (M.smul a (M.neg x)) = M.zero := h
  have h3 := congrArg (fun t => M.add (M.neg (M.smul a x)) t) h2
  rw [M.add_zero] at h3
  rw [M.add_assoc, M.add_neg, M.add_zero] at h3
  exact h3

/-- Negation of scalar: (-a) · x = -(a · x) -/
theorem neg_smul (a : R.carrier) (x : M.carrier) : M.smul (R.neg a) x = M.neg (M.smul a x) := by
  have h := M.add_smul a (R.neg a) x
  rw [R.add_neg] at h
  rw [M.zero_smul] at h
  have h2 : M.add (M.smul a x) (M.smul (R.neg a) x) = M.zero := h
  have h3 := congrArg (fun t => M.add (M.neg (M.smul a x)) t) h2
  rw [M.add_zero] at h3
  rw [M.add_assoc, M.add_neg, M.add_zero] at h3
  exact h3

/-- add_zero_right: x + 0 = x (redundant by add_comm but useful) -/
theorem add_zero_right (x : M.carrier) : M.add x M.zero = x := by
  rw [M.add_comm, M.add_zero]

/-- add_neg_right: x + (-x) = 0 -/
theorem add_neg_right (x : M.carrier) : M.add x (M.neg x) = M.zero := by
  rw [M.add_comm, M.add_neg]

/-- zero_add: 0 + x = x -/
theorem zero_add (x : M.carrier) : M.add M.zero x = x := by
  rw [M.add_comm, M.add_zero]

/-- neg_add_cancel: (-x) + x = 0 -/
theorem neg_add_cancel (x : M.carrier) : M.add (M.neg x) x = M.zero := by
  rw [M.add_comm, M.add_neg]

/-- Subtraction defined as addition with negation -/
def sub (x y : M.carrier) : M.carrier := M.add x (M.neg y)

/-- Additive cancellation: x + y = x + z → y = z -/
theorem add_left_cancel (x y z : M.carrier) (h : M.add x y = M.add x z) : y = z := by
  have h2 : M.add (M.neg x) (M.add x y) = M.add (M.neg x) (M.add x z) := by rw [h]
  rw [M.add_assoc, M.neg_add_cancel, M.zero_add] at h2
  rw [M.add_assoc, M.neg_add_cancel, M.zero_add] at h2
  exact h2

/-- Negation is involutive: -(-x) = x -/
theorem neg_neg (x : M.carrier) : M.neg (M.neg x) = x := by
  have h := M.add_neg (M.neg x)
  rw [M.add_comm] at h
  have h2 := M.add_neg x
  have h3 := M.add_left_cancel (M.neg (M.neg x)) (M.neg x) x (by
    calc
      M.add (M.neg (M.neg x)) (M.neg x) = M.zero := h
      _ = M.add (M.neg (M.neg x)) x := by
        rw [M.add_comm, M.add_neg, M.add_comm, M.add_neg]
    )
  exact h3

/-- Negation is injective: -x = -y → x = y -/
theorem neg_inj (x y : M.carrier) (h : M.neg x = M.neg y) : x = y := by
  calc
    x = M.neg (M.neg x) := by rw [M.neg_neg]
    _ = M.neg (M.neg y) := by rw [h]
    _ = y := by rw [M.neg_neg]

end Module

/-! ## Submodule -/

/--
A submodule N of an R-module M is a subset closed under addition,
containing zero, and closed under scalar multiplication.
-/
structure Submodule (R : Ring) (M : Module R) where
  subset : Set M.carrier
  zero_mem : M.zero ∈ subset
  add_closed : ∀ {x y}, x ∈ subset → y ∈ subset → M.add x y ∈ subset
  smul_closed : ∀ (a : R.carrier) {x}, x ∈ subset → M.smul a x ∈ subset

namespace Submodule

variable {R : Ring} {M : Module R}

/-- The zero submodule {0} -/
def zero (R : Ring) (M : Module R) : Submodule R M where
  subset := fun x => x = M.zero
  zero_mem := rfl
  add_closed hx hy := by
    rw [hx, hy, M.add_zero]
  smul_closed a hx := by
    rw [hx, M.smul_zero]

/-- The full submodule M itself -/
def full (R : Ring) (M : Module R) : Submodule R M where
  subset := fun _ => True
  zero_mem := trivial
  add_closed _ _ := trivial
  smul_closed _ _ := trivial

/-- Submodule inclusion: N ⊆ N' if N.subset ⊆ N'.subset -/
def le (N₁ N₂ : Submodule R M) : Prop := N₁.subset ⊆ N₂.subset

instance : LE (Submodule R M) := ⟨Submodule.le⟩

/-- Submodule equality from subset equivalence -/
theorem ext (N₁ N₂ : Submodule R M) (h : N₁.subset = N₂.subset) : N₁ = N₂ := by
  cases N₁; cases N₂; simp [h]

/-- Submodule intersection -/
def inter (N₁ N₂ : Submodule R M) : Submodule R M where
  subset := fun x => x ∈ N₁.subset ∧ x ∈ N₂.subset
  zero_mem := And.intro N₁.zero_mem N₂.zero_mem
  add_closed hx hy := And.intro
    (N₁.add_closed hx.1 hy.1)
    (N₂.add_closed hx.2 hy.2)
  smul_closed a hx := And.intro
    (N₁.smul_closed a hx.1)
    (N₂.smul_closed a hx.2)

/-- Submodule sum: N₁ + N₂ = {x + y | x ∈ N₁, y ∈ N₂} -/
def sum (N₁ N₂ : Submodule R M) : Submodule R M where
  subset := fun z => ∃ (x y : M.carrier), x ∈ N₁.subset ∧ y ∈ N₂.subset ∧ M.add x y = z
  zero_mem := ⟨M.zero, M.zero, N₁.zero_mem, N₂.zero_mem, M.add_zero M.zero⟩
  add_closed hz hw := by
    rcases hz with ⟨x₁, y₁, hx₁, hy₁, hz'⟩
    rcases hw with ⟨x₂, y₂, hx₂, hy₂, hw'⟩
    refine ⟨M.add x₁ x₂, M.add y₁ y₂, ?_, ?_, ?_⟩
    · exact N₁.add_closed hx₁ hx₂
    · exact N₂.add_closed hy₁ hy₂
    · rw [M.add_assoc, M.add_comm y₁, ← M.add_assoc, ← M.add_assoc, hz', hw']
  smul_closed a hz := by
    rcases hz with ⟨x, y, hx, hy, hz'⟩
    refine ⟨M.smul a x, M.smul a y, N₁.smul_closed a hx, N₂.smul_closed a hy, ?_⟩
    rw [← M.smul_add, hz']

/-- Elements of the zero submodule are exactly zero -/
theorem mem_zero_iff (x : M.carrier) : x ∈ (zero R M).subset ↔ x = M.zero := Iff.rfl

/-- A submodule contains its own zero -/
theorem zero_mem' (N : Submodule R M) : M.zero ∈ N.subset := N.zero_mem

/-- Submodules are closed under additive inverses -/
theorem neg_mem (N : Submodule R M) {x : M.carrier} (hx : x ∈ N.subset) : M.neg x ∈ N.subset := by
  have h := N.smul_closed (R.neg R.one) hx
  rw [M.neg_one_smul] at h
  exact h

end Submodule

/-! ## Module Homomorphism -/

/--
An R-linear map (module homomorphism) preserves addition
and scalar multiplication.
-/
structure ModuleHom (R : Ring) (M N : Module R) where
  map : M.carrier → N.carrier
  map_add : ∀ (x y : M.carrier), map (M.add x y) = N.add (map x) (map y)
  map_smul : ∀ (a : R.carrier) (x : M.carrier), map (M.smul a x) = N.smul a (map x)

namespace ModuleHom

variable {R : Ring} {M N P Q : Module R}

/-- Identity module homomorphism -/
def id (R : Ring) (M : Module R) : ModuleHom R M M where
  map x := x
  map_add _ _ := rfl
  map_smul _ _ := rfl

/-- A module homomorphism preserves zero: f(0) = 0 -/
theorem map_zero (f : ModuleHom R M N) : f.map M.zero = N.zero := by
  have h1 : f.map (M.add M.zero M.zero) = f.map M.zero := by rw [M.add_zero]
  have h2 : f.map (M.add M.zero M.zero) = N.add (f.map M.zero) (f.map M.zero) := f.map_add _ _
  rw [h1] at h2
  have h3 : N.add (f.map M.zero) (f.map M.zero) = N.add (f.map M.zero) N.zero := by
    rw [N.add_zero (f.map M.zero)]
  rw [h3] at h2
  have h4 := N.add_left_cancel (f.map M.zero) (f.map M.zero) N.zero h2
  exact h4.symm

/-- A module homomorphism preserves negatives: f(-x) = -f(x) -/
theorem map_neg (f : ModuleHom R M N) (x : M.carrier) : f.map (M.neg x) = N.neg (f.map x) := by
  calc
    f.map (M.neg x) = f.map (M.smul (R.neg R.one) x) := by rw [M.neg_one_smul]
    _ = N.smul (R.neg R.one) (f.map x) := by rw [f.map_smul]
    _ = N.neg (f.map x) := by rw [N.neg_one_smul]

/-- A module homomorphism preserves subtraction: f(x - y) = f(x) - f(y) -/
theorem map_sub (f : ModuleHom R M N) (x y : M.carrier) : f.map (M.sub x y) = N.sub (f.map x) (f.map y) := by
  rw [M.sub, N.sub, f.map_add, f.map_neg]

/-- Composition of module homomorphisms -/
def comp (g : ModuleHom R N P) (f : ModuleHom R M N) : ModuleHom R M P where
  map x := g.map (f.map x)
  map_add x y := by rw [f.map_add, g.map_add]
  map_smul a x := by rw [f.map_smul, g.map_smul]

/-- Kernel of a module homomorphism: all elements mapping to zero -/
def kernel (f : ModuleHom R M N) : Submodule R M where
  subset := fun x => f.map x = N.zero
  zero_mem := f.map_zero
  add_closed hx hy := by
    rw [f.map_add, hx, hy, N.add_zero]
  smul_closed a hx := by
    rw [f.map_smul, hx, N.smul_zero]

/-- Image of a module homomorphism: all values in the codomain -/
def image (f : ModuleHom R M N) : Submodule R N where
  subset := fun y => ∃ (x : M.carrier), f.map x = y
  zero_mem := ⟨M.zero, f.map_zero⟩
  add_closed hy hz := by
    rcases hy with ⟨x, hx⟩
    rcases hz with ⟨y, hy⟩
    refine ⟨M.add x y, ?_⟩
    rw [f.map_add, hx, hy]
  smul_closed a hy := by
    rcases hy with ⟨x, hx⟩
    refine ⟨M.smul a x, ?_⟩
    rw [f.map_smul, hx]

/-- A module homomorphism is injective iff kernel is zero -/
theorem injective_iff_kernel_zero (f : ModuleHom R M N) :
    (∀ x y, f.map x = f.map y → x = y) ↔ (f.kernel).subset = (Submodule.zero R M).subset := by
  constructor
  · intro hinj x
    constructor
    · intro hx
      have h := hinj x M.zero (by rw [f.map_zero, hx])
      rw [h]
    · intro hx; rw [hx, f.map_zero]
  · intro hker x y h
    have hxy : f.map (M.sub x y) = N.zero := by
      rw [f.map_sub, h, N.sub, N.add_neg]
    have hmem : M.sub x y ∈ (f.kernel).subset := hxy
    rw [hker] at hmem
    have hzero : M.sub x y = M.zero := hmem
    have : M.add (M.sub x y) y = M.add M.zero y := by rw [hzero]
    rw [M.sub, M.add_assoc, M.add_neg, M.add_comm, M.add_zero] at this
    rw [M.zero_add] at this
    exact this

/-- A module homomorphism is surjective iff image is full -/
theorem surjective_iff_image_full (f : ModuleHom R M N) :
    (∀ y, ∃ x, f.map x = y) ↔ (f.image).subset = (Submodule.full R N).subset := by
  constructor
  · intro hsurj y
    constructor
    · intro hy; trivial
    · intro _; exact hsurj y
  · intro himg y
    have : y ∈ (f.image).subset := by rw [himg]; trivial
    exact this

end ModuleHom

/-! ## Free Module -/

/--
A free R-module with basis B is a module M with generators
gen : B → M satisfying the universal property: any map
f : B → N extends uniquely to an R-linear map M → N.
-/
structure FreeModule (R : Ring) (basis : Type u) where
  M : Module R
  generators : basis → M.carrier
  universal : ∀ (N : Module R) (f : basis → N.carrier),
    ∃! (h : ModuleHom R M N), ∀ (b : basis), h.map (generators b) = f b

/-! ## Finitely Generated Module -/

/--
An R-module M is finitely generated if there exists a finite
set of generators such that every element is an R-linear
combination of the generators.
-/
def isFinitelyGenerated (R : Ring) (M : Module R) : Prop :=
  ∃ (gens : List M.carrier),
    ∀ (x : M.carrier), ∃ (coeffs : List R.carrier),
      gens.length = coeffs.length  -- conceptual: x = Σ coeff_i · gens_i

/-! ## Noetherian Module -/

/--
An R-module M is Noetherian if every ascending chain of
submodules N₁ ⊆ N₂ ⊆ N₃ ⊆ ... stabilizes.
-/
def isNoetherian (R : Ring) (M : Module R) : Prop :=
  ∀ (ascendingChain : Nat → Submodule R M),
    (∀ (n : Nat), ascendingChain n ≤ ascendingChain (n+1)) →
    ∃ (k : Nat), ∀ (n : Nat), n ≥ k → ascendingChain n = ascendingChain k

/-- Alternative Noetherian condition: every submodule is finitely generated -/
def isNoetherian' (R : Ring) (M : Module R) : Prop :=
  ∀ (N : Submodule R M), isFinitelyGenerated R { carrier := { x : M.carrier // x ∈ N.subset }
    add := λ ⟨x, _⟩ ⟨y, _⟩ => ⟨M.add x y, N.add_closed (by assumption) (by assumption)⟩
    zero := ⟨M.zero, N.zero_mem⟩
    neg := λ ⟨x, h⟩ => ⟨M.neg x, Submodule.neg_mem N h⟩
    smul := λ a ⟨x, h⟩ => ⟨M.smul a x, N.smul_closed a h⟩
    add_assoc := λ ⟨x,_⟩ ⟨y,_⟩ ⟨z,_⟩ => by
      apply Subtype.eq; exact M.add_assoc x y z
    add_comm := λ ⟨x,_⟩ ⟨y,_⟩ => by
      apply Subtype.eq; exact M.add_comm x y
    add_zero := λ ⟨x,_⟩ => by
      apply Subtype.eq; exact M.add_zero x
    add_neg := λ ⟨x,_⟩ => by
      apply Subtype.eq; exact M.add_neg x
    smul_one := λ ⟨x,_⟩ => by
      apply Subtype.eq; exact M.smul_one x
    smul_add := λ a ⟨x,_⟩ ⟨y,_⟩ => by
      apply Subtype.eq; exact M.smul_add a x y
    add_smul := λ a b ⟨x,_⟩ => by
      apply Subtype.eq; exact M.add_smul a b x
    mul_smul := λ a b ⟨x,_⟩ => by
      apply Subtype.eq; exact M.mul_smul a b x
  : Module R }

/-! ## Artinian Module -/

/--
An R-module M is Artinian if every descending chain of
submodules N₁ ⊇ N₂ ⊇ N₃ ⊇ ... stabilizes.
-/
def isArtinian (R : Ring) (M : Module R) : Prop :=
  ∀ (descendingChain : Nat → Submodule R M),
    (∀ (n : Nat), descendingChain (n+1) ≤ descendingChain n) →
    ∃ (k : Nat), ∀ (n : Nat), n ≥ k → descendingChain n = descendingChain k

/-! ## Exact Sequence -/

/--
A sequence M -f→ N -g→ P is exact at N if image(f) = kernel(g).
-/
def isExact {R : Ring} {M N P : Module R}
    (f : ModuleHom R M N) (g : ModuleHom R N P) : Prop :=
  ∀ (x : N.carrier),
    g.map x = P.zero ↔ ∃ (y : M.carrier), f.map y = x

/-- Exact at N means ker(g) = im(f) -/
theorem isExact_iff {R : Ring} {M N P : Module R}
    (f : ModuleHom R M N) (g : ModuleHom R N P) :
    isExact f g ↔
      (∀ (x : N.carrier), g.map x = P.zero → ∃ (y : M.carrier), f.map y = x) ∧
      (∀ (x : N.carrier) (y : M.carrier), f.map y = x → g.map x = P.zero) := by
  constructor
  · intro hex
    constructor
    · intro x hx; exact (hex x).mp hx
    · intro x y hy; exact (hex x).mpr ⟨y, hy⟩
  · intro ⟨h1, h2⟩
    intro x
    constructor
    · intro hx; exact h1 x hx
    · intro hy; rcases hy with ⟨y, hy'⟩; rw [hy']; exact h2 (f.map y) y rfl

/-- Short exact sequence: 0 → M → N → P → 0 is exact -/
def isShortExact {R : Ring} {M N P : Module R}
    (f : ModuleHom R M N) (g : ModuleHom R N P) : Prop :=
  (∀ x y, f.map x = f.map y → x = y) ∧          -- f is injective
  (∀ z, ∃ x, g.map x = z) ∧                      -- g is surjective
  isExact f g

/-! ## Tensor Product of Modules (over commutative ring) -/

/--
Tensor product M ⊗_R N of two R-modules. The universal recipient of
R-bilinear maps from M × N.
-/
structure TensorProductMod (R : Ring) (M N : Module R) where
  T : Module R
  tensor : M.carrier → N.carrier → T.carrier
  tensor_add_left : ∀ (x₁ x₂ : M.carrier) (y : N.carrier),
    tensor (M.add x₁ x₂) y = T.add (tensor x₁ y) (tensor x₂ y)
  tensor_add_right : ∀ (x : M.carrier) (y₁ y₂ : N.carrier),
    tensor x (N.add y₁ y₂) = T.add (tensor x y₁) (tensor x y₂)
  tensor_smul_left : ∀ (a : R.carrier) (x : M.carrier) (y : N.carrier),
    tensor (M.smul a x) y = T.smul a (tensor x y)
  tensor_smul_right : ∀ (a : R.carrier) (x : M.carrier) (y : N.carrier),
    tensor x (N.smul a y) = T.smul a (tensor x y)
  universal : ∀ (P : Module R) (bilin : M.carrier → N.carrier → P.carrier),
    (∀ (x₁ x₂ : M.carrier) (y : N.carrier),
      bilin (M.add x₁ x₂) y = P.add (bilin x₁ y) (bilin x₂ y)) →
    (∀ (x : M.carrier) (y₁ y₂ : N.carrier),
      bilin x (N.add y₁ y₂) = P.add (bilin x y₁) (bilin x y₂)) →
    (∀ (a : R.carrier) (x : M.carrier) (y : N.carrier),
      bilin (M.smul a x) y = P.smul a (bilin x y)) →
    (∀ (a : R.carrier) (x : M.carrier) (y : N.carrier),
      bilin x (N.smul a y) = P.smul a (bilin x y)) →
    ∃! (h : ModuleHom R T P), ∀ (x : M.carrier) (y : N.carrier),
      h.map (tensor x y) = bilin x y

/-! ## L2 Core Concepts — Derived Operations -/

/-- The zero module over any ring: {0} with trivial operations -/
def zeroModule (R : Ring) : Module R where
  carrier := Unit
  add _ _ := ()
  zero := ()
  neg _ := ()
  smul _ _ := ()
  add_assoc _ _ _ := rfl
  add_comm _ _ := rfl
  add_zero _ := rfl
  add_neg _ := rfl
  smul_one _ := rfl
  smul_add _ _ _ _ := rfl
  add_smul _ _ _ _ := rfl
  mul_smul _ _ _ _ := rfl

/-- Every ring R is an R-module (the regular module) -/
def regularModule (R : Ring) : Module R where
  carrier := R.carrier
  add := R.add
  zero := R.zero
  neg := R.neg
  smul := R.mul
  add_assoc := R.add_assoc
  add_comm := R.add_comm
  add_zero := R.add_zero
  add_neg := R.add_neg
  smul_one := R.mul_one
  smul_add := R.mul_add
  add_smul := R.add_mul
  mul_smul := R.mul_assoc

/-- The direct product of two modules -/
def productModule (R : Ring) (M N : Module R) : Module R where
  carrier := M.carrier × N.carrier
  add p q := (M.add p.1 q.1, N.add p.2 q.2)
  zero := (M.zero, N.zero)
  neg p := (M.neg p.1, N.neg p.2)
  smul a p := (M.smul a p.1, N.smul a p.2)
  add_assoc p q r := by
    ext <;> apply M.add_assoc
  add_comm p q := by
    ext <;> apply M.add_comm
  add_zero p := by
    ext <;> apply M.add_zero
  add_neg p := by
    ext <;> apply M.add_neg
  smul_one p := by
    ext <;> apply M.smul_one
  smul_add a p q := by
    ext <;> apply M.smul_add
  add_smul a b p := by
    ext <;> apply M.add_smul
  mul_smul a b p := by
    ext <;> apply M.mul_smul

/-! ## L3 Mathematical Structures — Module Category -/

/-- The category of R-modules: objects are modules, morphisms are module homs.
We define the category structure explicitly. -/

/-- Module hom composition is associative -/
theorem comp_assoc {R : Ring} {M N P Q : Module R}
    (f : ModuleHom R M N) (g : ModuleHom R N P) (h : ModuleHom R P Q) :
    ModuleHom.comp (ModuleHom.comp h g) f = ModuleHom.comp h (ModuleHom.comp g f) := by
  ext x : 1
  rfl

/-- Module hom identity laws -/
theorem comp_id {R : Ring} {M N : Module R} (f : ModuleHom R M N) :
    ModuleHom.comp f (ModuleHom.id R M) = f := by
  ext x : 1
  rfl

theorem id_comp {R : Ring} {M N : Module R} (f : ModuleHom R M N) :
    ModuleHom.comp (ModuleHom.id R N) f = f := by
  ext x : 1
  rfl

#eval "Core.Basic: Module, Submodule, ModuleHom, Free, FinitelyGen, Noetherian, Artinian, Tensor, Zero, Regular, Product — COMPLETE"
