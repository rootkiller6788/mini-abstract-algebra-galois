/-
# Benchmark: ConstructionOps

Benchmark: quotient groups, direct/semidirect products,
free groups, group presentations, abelianization.
-/

import MiniGroupTheoryCore

open MiniGroupTheoryCore

/-! ## Benchmark targets -/

#eval "Benchmark.ConstructionOps: quotient group G/N with projection"
#eval "Benchmark.ConstructionOps: first/second/third isomorphism theorem applications"
#eval "Benchmark.ConstructionOps: direct product G×H, projection maps"
#eval "Benchmark.ConstructionOps: semidirect product G ⋉ H"
#eval "Benchmark.ConstructionOps: free group on n generators"
#eval "Benchmark.ConstructionOps: group presentation ⟨S | R⟩ decoding"
#eval "Benchmark.ConstructionOps: abelianization G/[G,G]"
#eval s!"Construction axioms: freeGroup, freeAbelian, product, coproduct universals"
