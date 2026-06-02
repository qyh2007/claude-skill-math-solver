# Claude Code Skill: Math Solver

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-skill-orange)](https://claude.ai/code)

<p align="center"><b>Language / 语言:</b> <a href="README.md">English</a> | <a href="README.zh.md">简体中文</a></p>

A specialized skill for **Claude Code** that solves college-level math problems — rigorously, with surgical output modes and no fluff.

---

## Scope

| Module | Topics |
|--------|--------|
| **Calculus** | Limits & continuity, derivatives & differentials, mean value theorems, indefinite/definite integrals, multivariable calculus, multiple integrals, line & surface integrals, infinite series, power series, Fourier series, ordinary differential equations |
| **Advanced Algebra** | Polynomials, determinants, matrices, systems of linear equations, vector spaces & linear transformations, eigenvalues & eigenvectors, λ-matrices & Jordan canonical form, quadratic forms, Euclidean & unitary spaces |

## Installation

```bash
git clone https://github.com/qyh2007/claude-skill-math-solver.git \
  ~/.claude/skills/math-solver
```

If you use the ECC ecosystem:

```bash
cd ~/.claude/skills/ecc
git clone https://github.com/qyh2007/claude-skill-math-solver.git math-solver
```

Once installed, invoke it in Claude Code with:

```
/math-solver
```

Or just describe a math problem — the skill is auto-detected when relevant.

## Output Modes

| Mode | Trigger | What you get |
|------|---------|--------------|
| **Compact** (default) | Just the problem | `Solution:` + step-by-step derivation + `Answer:` |
| **Detailed** | "explain step by step" / "why?" / "check my work" | Problem type → approach → derivation → common pitfalls → answer |
| **Conceptual** | "explain intuitively" / "give an example" | Plain-language analogy + concrete numerical example + optional matplotlib graph |

## Key Behaviors

- **No boilerplate** — skips filler phrases like "let's analyze this" or "in summary"
- **Verifies preconditions** — checks L'Hôpital conditions (0/0 or ∞/∞) before applying, etc.
- **Surgical output** — never writes more than the mode calls for
- **Image transcription + confirmation** — extracts problem text from images, flags ambiguous symbols, then restates the full problem for user confirmation before solving (prevents OCR errors from producing wrong answers)
- **Error-correction mode** — when the user shares their own work ("where did I go wrong?"), checks the existing process, pinpoints the first critical mistake, and continues from there — never redoes what's already correct
- **Lightweight self-check** — before every final answer, the skill silently verifies method preconditions, sign correctness, edge cases, and completeness; only speaks up if something is worth flagging
- **Proof method selection** — matches proof technique to the user's current learning stage, preferring earlier-chapter knowledge over later advanced tools (e.g., limit definition before Taylor series, elementary row operations before Jordan form)
- **Exam-optimized** — defaults to the most common exam method; mentions alternatives briefly

## Example

```
User: Find the limit lim(x→0) (sin x - x) / x³

Solution:
Taylor expand sin x = x - x³/6 + x⁵/120 - ...
sin x - x = -x³/6 + O(x⁵)
lim = lim (-x³/6 + O(x⁵)) / x³ = -1/6
Answer: -1/6
```

### Image Confirmation Example

User uploads a photo. The skill transcribes, then restates for confirmation **before solving**:

```
Transcribed problem:
Let f(x) = x³ - 3x + 1. Find the maximum and minimum of f(x) on [-2, 2].
Please confirm the problem is correct. I'll start solving once you confirm.
```

User confirms → then the solution proceeds:

```
Solution:
f'(x) = 3x² - 3 = 3(x-1)(x+1), critical points x = 1, x = -1
Evaluate: f(-2) = -1, f(-1) = 3, f(1) = -1, f(2) = 3
Max = 3, Min = -1
Answer: max 3, min -1
```

## Repository Structure

```
claude-skill-math-solver/
├── SKILL.md          # Skill definition — all Claude Code needs
├── README.md         # English documentation
├── README.zh.md      # 中文文档
├── install.sh        # One-line installation script
└── LICENSE           # MIT license
```

## License

MIT — see [LICENSE](./LICENSE).

---
