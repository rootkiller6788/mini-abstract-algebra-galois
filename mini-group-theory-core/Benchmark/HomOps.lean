/-
# Benchmark: HomOps

Benchmark: homomorphism operations — kernel, image,
composition, isomorphism detection, automorphism group.
-/

import MiniGroupTheoryCore

open MiniGroupTheoryCore

/-! ## Benchmark targets -/

#eval "Benchmark.HomOps: kernel computation (ker f = {x | f x = 1})"
#eval "Benchmark.HomOps: image computation (im f = f(G))"
#eval "Benchmark.HomOps: injectivity / surjectivity tests"
#eval "Benchmark.HomOps: homomorphism composition associativity"
#eval "Benchmark.HomOps: isomorphism detection and symmetry tests"
#eval "Benchmark.HomOps: automorphism group construction"
#eval s!"Homomorphism axioms: kernelNormal, imageSubgroup, homPreservesOrder"
