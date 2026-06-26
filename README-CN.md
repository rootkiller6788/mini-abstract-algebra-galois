# Mini Abstract Algebra & Galois Theory（迷你抽象代数与伽罗瓦理论）

一套**从零开始、零依赖的 Lean 4 实现**，涵盖大学层次的抽象代数、群论、环论、域论与伽罗瓦理论。每个子包对应 MIT（及其他顶尖大学）课程，使用 Lean 4 证明助手从第一性原理构建抽象代数基础。

## 子包

| 子包 | 主题 | 核心课程 |
|------|------|----------|
| [mini-group-theory-core](mini-group-theory-core/) | 群、子群、正规子群、商群、同态 | MIT 18.701, Harvard Math 122 |
| [mini-ring-theory-core](mini-ring-theory-core/) | 环、理想、商环、整环、单位 | MIT 18.702, Berkeley Math 113 |
| [mini-field-theory-core](mini-field-theory-core/) | 域、域扩张、代数/超越、特征 | MIT 18.702, Princeton MAT 345 |
| [mini-module-theory](mini-module-theory/) | 模、子模、正合列、结构定理 | MIT 18.705, Cambridge Part II |
| [mini-polynomial-algebra](mini-polynomial-algebra/) | 多项式环、因式分解、不可约判据 | MIT 18.702, Harvard Math 123 |
| [mini-galois-theory-lite](mini-galois-theory-lite/) | 伽罗瓦群、基本定理、根式可解性 | MIT 18.702, Princeton MAT 346 |
| [mini-group-action-sylow](mini-group-action-sylow/) | 群作用、轨道/稳定子、Sylow 定理、p-群 | MIT 18.701, Berkeley Math 114 |
| [mini-algebraic-structures](mini-algebraic-structures/) | 泛代数、簇、Birkhoff HSP 定理、子代数格 | MIT 18.704, Oxford Part C |

## 设计理念

- **零外部依赖** -- 纯 Lean 4，仅导入内核模块
- **自包含子包** -- 每个子包拥有独立的 `lakefile.lean`、Core/、Morphisms/、Constructions/、Properties/、Theorems/
- **理论到代码的映射** -- 每个模块包含内联 `#eval` 示例和定理陈述
- **伽罗瓦聚焦** -- 伽罗瓦理论基本定理为核心，涵盖分圆、Kummer 与 Artin-Schreier 理论

## 构建

每个子包独立构建。使用 Lake 构建：

```bash
cd mini-group-theory-core
lake build
lake env lean --run Test/Smoke.lean
```

需要 **Lean 4** 和 **Lake**。

## 项目结构

```
4. mini-abstract-algebra-galois/
├── mini-group-theory-core/          # 群、子群、正规子群、商群
├── mini-ring-theory-core/           # 环、理想、商环、整环
├── mini-field-theory-core/          # 域、域扩张、代数/超越
├── mini-module-theory/              # 模、子模、正合列
├── mini-polynomial-algebra/         # 多项式环、因式分解、不可约性
├── mini-galois-theory-lite/         # 伽罗瓦群、基本定理、根式可解性
├── mini-group-action-sylow/         # 群作用、轨道/稳定子、Sylow 定理
├── mini-algebraic-structures/       # 泛代数、簇、Birkhoff HSP
└── lakefile.lean
```

## 许可证

MIT
