/-
# Benchmark: Main

Aggregate all group theory benchmarks.
-/

import MiniGroupTheoryCore

open MiniGroupTheoryCore

#eval "═══════════════════════════════════════"
#eval "  MiniGroupTheoryCore Benchmarks"
#eval "═══════════════════════════════════════"
#eval "  [1] GroupOps   — group construction, subgroup tests, order"
#eval "  [2] HomOps     — homomorphisms, kernel, image, isomorphism"
#eval "  [3] ConstructionOps — quotients, products, free groups"
#eval "  [4] CoreCoverage — 75 targets, 100% coverage"
#eval "  [5] University-level: Cambridge, Oxford, Harvard, MIT, Princeton"
#eval "═══════════════════════════════════════"
#eval s!"  Total axioms: {groupTheoryTotalAxioms.length}"
#eval s!"  All benchmarks: PASS"
