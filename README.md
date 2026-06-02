# Claude Code Skill: Math Solver / 高等数学解题技能

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-skill-orange)](https://claude.ai/code)

A specialized skill for **Claude Code** that solves college-level math problems — rigorously, with surgical output modes and no fluff.

面向 **Claude Code** 的高等数学解题技能，覆盖微积分与高等代数核心专题，输出简洁严谨。

---

## English

### Scope

This skill handles:

| Module | Topics |
|--------|--------|
| **Calculus** | Limits & continuity, derivatives & differentials, mean value theorems, indefinite/definite integrals, multivariable calculus, multiple integrals, line & surface integrals, infinite series, power series, Fourier series, ordinary differential equations |
| **Advanced Algebra** | Polynomials, determinants, matrices, systems of linear equations, vector spaces & linear transformations, eigenvalues & eigenvectors, λ-matrices & Jordan canonical form, quadratic forms, Euclidean & unitary spaces |

### Installation

```bash
git clone https://github.com/qyh2007/claude-skill-math-solver.git \
  ~/.claude/skills/math-solver
```

Once installed, invoke it in Claude Code with:

```
/math-solver
```

Or just describe a math problem — the skill is auto-detected when relevant.

### Output Modes

| Mode | Trigger | What you get |
|------|---------|--------------|
| **Compact** (default) | Just the problem | `Solution:` + step-by-step derivation + `Answer:` |
| **Detailed** | "详细解释" / "why?" / "check my work" | Problem type → approach → derivation → common pitfalls → answer |
| **Conceptual** | "通俗解释" / "是什么意思" / "举个例子" | Plain-language analogy + concrete numerical example + optional matplotlib graph |

### Key Behaviors

- **No boilerplate** — skips filler phrases like "let's analyze this" or "in summary"
- **Verifies preconditions** — checks L'Hôpital conditions (0/0 or ∞/∞) before applying, etc.
- **Surgical output** — never writes more than the mode calls for
- **Image support** — transcribes problem text from images; flags ambiguous symbols explicitly
- **Exam-optimized** — defaults to the most common exam method; mentions alternatives briefly

### Example

```
用户: 求极限 lim(x→0) (sin x - x) / x³

解:
用泰勒展开 sin x = x - x³/6 + x⁵/120 - ...
sin x - x = -x³/6 + O(x⁵)
lim = lim (-x³/6 + O(x⁵)) / x³ = -1/6
答: -1/6
```

### License

MIT — see [LICENSE](./LICENSE).

---

## 中文

### 覆盖范围

| 模块 | 专题 |
|------|------|
| **微积分** | 极限与连续、导数与微分、中值定理、不定/定积分、多元函数微分、二重/三重积分、曲线/曲面积分、无穷级数、幂级数、傅里叶级数、常微分方程 |
| **高等代数** | 多项式、行列式、矩阵、线性方程组、线性空间与线性变换、特征值与特征向量、λ-矩阵与Jordan标准型、二次型、欧氏空间与酉空间 |

### 安装

```bash
git clone https://github.com/qyh2007/claude-skill-math-solver.git \
  ~/.claude/skills/math-solver
```

安装后在 Claude Code 中通过 `/math-solver` 调用，或直接提数学问题——技能会自动匹配。

### 输出模式

| 模式 | 触发条件 | 输出内容 |
|------|----------|----------|
| **简洁模式**（默认） | 仅给出题目 | `解:` → 分步推导 → `答:` |
| **详细模式** | "详细解释""为什么""错在哪""检查我的过程" | 题型 → 思路 → 推导 → 易错点 → 答案 |
| **通俗模式** | "通俗解释""是什么意思""举个例子" | 口语化比喻 + 具体数值例子 + 可选 matplotlib 画图 |

### 核心行为

- **无废话** — 不说"我们来分析""综上所述"等过渡句
- **检查前提条件** — 洛必达前验证 0/0 或 ∞/∞，引定理先验条件
- **输出克制** — 默认极简，追问才展开
- **图片转写** — 从图片提取题目，模糊处标 `[不确定: ...]`
- **考试导向** — 默认给最常用的考试方法，可简短提替代思路

### 示例

```
用户: 求极限 lim(x→0) (sin x - x) / x³

解:
泰勒展开 sin x = x - x³/6 + x⁵/120 - ...
sin x - x = -x³/6 + O(x⁵)
lim = lim (-x³/6 + O(x⁵)) / x³ = -1/6
答: -1/6
```

### 许可证

MIT — 详见 [LICENSE](./LICENSE)。

---

## Repository Structure / 仓库结构

```
claude-skill-math-solver/
├── SKILL.md          # The skill definition — this is all Claude Code needs
├── README.md         # This file
└── LICENSE           # MIT license
```

> `SKILL.md` is the only file Claude Code requires. The rest is for humans.
>
> `SKILL.md` 是 Claude Code 唯一需要的文件，其余是对人类的说明。

---

## FAQ

**Q: 为什么只有 SKILL.md?**
A: 技能是纯文本指令，不需要依赖、不需要构建、不需要运行环境。SKILL.md 就是全部。

**Q: 能解数学分析/概率论吗?**
A: 当前版本覆盖微积分和高等代数。数学分析、概率论可以在后续版本扩展。

**Q: 怎么更新?**
A: `git pull` 即可。
