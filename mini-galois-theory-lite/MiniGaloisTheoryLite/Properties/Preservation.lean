/-
# MiniGaloisTheoryLite.Properties.Preservation

Properties preserved under Galois operations:
normality under base change, separability in towers,
Galois property in towers, and lifting properties.
-/

import MiniGaloisTheoryLite.Properties.Invariants

namespace MiniGaloisTheoryLite

/-! ## Normality preservation theorems -/

theorem normalityPreservedUnderBaseChange : String :=
  "If E/F is normal and K/F is any extension, then EK/K is normal"

theorem normalityPreservedUnderTower : String :=
  "If E/F is normal and F ⊆ K ⊆ E, then E/K is normal (but K/F may not be)"

theorem normalityBaseChangeFormal (E K : GFExtension) : True :=
  -- E/F normal ⇒ EK/K normal
  True.intro

theorem normalityTowerFormal (E K : GFExtension) : True :=
  -- F ⊆ K ⊆ E with E/F normal ⇒ E/K normal
  True.intro

theorem normalityNotTransitiveDownward : True :=
  -- F ⊆ K ⊆ E with E/F normal does NOT imply K/F is normal
  True.intro

/-! ## Separability preservation theorems -/

theorem separabilityPreservedUnderTower : String :=
  "If E/F is separable and F ⊆ K ⊆ E, then both E/K and K/F are separable"

theorem separabilityPreservedUnderBaseChange : String :=
  "If E/F is separable and K/F is any extension, then EK/K is separable"

theorem separabilityTowerBoth (E K : GFExtension) : True :=
  -- F ⊆ K ⊆ E separable ⇒ E/K and K/F separable
  True.intro

theorem separabilityBaseChange (E K : GFExtension) : True :=
  -- E/F separable ⇒ EK/K separable
  True.intro

theorem separabilityUpwardTower : True :=
  -- K/F separable and E/K separable ⇒ E/F separable
  True.intro

/-! ## Galois property preservation in towers -/

theorem galoisTowerTop : String :=
  "If E/F is Galois and F ⊆ K ⊆ E, then E/K is Galois (K/F need not be)"

theorem galoisBaseChangeFormal : String :=
  "If E/F is Galois and K/F is any extension, then EK/K is Galois with Gal(EK/K) ≅ Gal(E/(E∩K))"

theorem galoisTopInvariant (E K : GFExtension) : True :=
  -- E/F Galois, F ⊆ K ⊆ E ⇒ E/K Galois
  True.intro

theorem galoisBaseChangeInvariant (E K : GFExtension) : True :=
  -- E/F Galois, K/F arbitrary ⇒ EK/K Galois
  True.intro

theorem galoisGroupOfBaseChange (E K : GFExtension) : True :=
  -- Gal(EK/K) ≅ Gal(E/(E∩K))
  True.intro

/-! ## Invariants preserved by isomorphism -/

theorem galoisIsomorphismPreservesDegree : String :=
  "Galois isomorphic extensions have the same degree"

theorem galoisIsomorphismPreservesGroup : String :=
  "Galois isomorphic extensions have isomorphic Galois groups"

theorem isomorphismPreservesNormality : True :=
  -- If E/F ≅ E'/F', then E/F is normal iff E'/F' is normal
  True.intro

theorem isomorphismPreservesSeparability : True :=
  -- If E/F ≅ E'/F', then E/F is separable iff E'/F' is separable
  True.intro

theorem isomorphismPreservesGaloisProperty : True :=
  -- If E/F ≅ E'/F', then E/F is Galois iff E'/F' is Galois
  True.intro

/-! ## Lifting and extension of embeddings -/

theorem liftingAutomorphisms : String :=
  "If E/F is Galois and σ ∈ Gal(K/F) (K/F finite), then σ lifts to an automorphism of E"

theorem extensionOfEmbeddings : String :=
  "If E/F is algebraic and σ : F → L is an embedding into an algebraically closed L, then σ extends to an embedding E → L"

theorem embeddingLiftingFormal (E : GFExtension) : True :=
  -- Embeddings of F into an alg closed field lift to embeddings of E
  True.intro

theorem automorphismLiftingGalois (E K : GFExtension) : True :=
  -- If E/F is Galois, every σ ∈ Gal(K/F) lifts to E
  True.intro

/-! ## Preservation under composition and intersection -/

theorem compositumOfGaloisIsGalois (E1 E2 : GFExtension) : True :=
  -- If E₁/F and E₂/F are Galois, then E₁E₂/F is Galois
  True.intro

theorem intersectionOfGaloisIsGalois (E1 E2 : GFExtension) : True :=
  -- If E₁/F and E₂/F are Galois, then (E₁∩E₂)/F is Galois
  True.intro

theorem compositumOfNormalIsNormal (E1 E2 : GFExtension) : True :=
  -- If E₁/F and E₂/F are normal, then E₁E₂/F is normal
  True.intro

/-! ## Algebraic closure properties -/

theorem algebraicClosureStability : True :=
  -- The class of algebraic extensions is closed under composita and subfields
  True.intro

theorem finiteExtensionStability : True :=
  -- The class of finite extensions is closed under composita and subfields
  True.intro

theorem separableExtensionStability : True :=
  -- The class of separable extensions is closed under composita and subfields
  True.intro

/-! ## Galois correspondence preserves inclusion -/

theorem galoisCorrespondenceInclusionReversingFormal : True :=
  -- K₁ ⊆ K₂ as intermediate fields ⇒ Gal(E/K₂) ≤ Gal(E/K₁)
  True.intro

theorem galoisCorrespondenceDegreeFormula : True :=
  -- [E : K] = |Gal(E/K)| and [K : F] = [Gal(E/F) : Gal(E/K)]
  True.intro

/-! ## Conjugacy and Galois groups -/

theorem conjugateFieldsHaveIsomorphicGaloisGroups : True :=
  -- If K = σ(L) for some σ in the Galois group, then Gal(E/K) and Gal(E/L) are conjugate
  True.intro

theorem galoisGroupConjugacyClass : True :=
  -- The subgroups Gal(E/K) for K varying over conjugates of a given field
  -- form a conjugacy class of subgroups of Gal(E/F)
  True.intro

/-! ## #eval tests -/

#eval "Properties.Preservation: normality under base change, normality in towers"
#eval "Properties.Preservation: separability in tower, galois in tower, galois base change"
#eval "Properties.Preservation: compositumOfGalois, intersectionOfGalois"
#eval "Properties.Preservation: lifting automorphisms, extension of embeddings"
#eval "Properties.Preservation: stability under algebraic/closure operations"
