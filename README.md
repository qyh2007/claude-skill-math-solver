# Claude Code Skill: Math Solver

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-skill-orange)](https://claude.ai/code)

<p align="center"><b>Language / 语言:</b> <a href="README.md">English</a> | <a href="README.zh.md">简体中文</a></p>

A specialized **Claude Code** skill for solving college-level math problems across 20 topics in calculus and advanced algebra. Compact output by default, with on-demand expansion. Supports image transcription, error correction, proofs, concept explanations, and matplotlib graphing.

---

## Scope

| Module | Topics |
|--------|--------|
| **Calculus** | Limits & continuity, derivatives & differentials, mean value theorems, indefinite integrals, definite integrals, multivariable calculus, double/triple integrals, line & surface integrals, infinite series, power & Fourier series, ordinary differential equations |
| **Advanced Algebra** | Polynomials, determinants, matrices, linear systems, vector spaces & linear transformations, eigenvalues & eigenvectors, λ-matrices & Jordan canonical form, quadratic forms, Euclidean & unitary spaces |

## Installation

```bash
git clone https://github.com/qyh2007/claude-skill-math-solver.git \
  ~/.claude/skills/math-solver
```

If using the ECC ecosystem:

```bash
cd ~/.claude/skills/ecc
git clone https://github.com/qyh2007/claude-skill-math-solver.git math-solver
```

Once installed, invoke with `/math-solver` in Claude Code, or simply describe a math problem — the skill auto-matches.

## Output Modes

| Mode | Trigger | Output |
|------|---------|--------|
| **Compact** (default) | Just the problem | `Solution:` → step-by-step derivation → `Answer:` |
| **Detailed** | "explain step by step" / "why?" / "check my work" | Type → Approach → Derivation → Common Pitfalls → Answer |
| **Answer-Only** | "just the answer" / "final answer only" | The answer alone, at most one sentence for conditions/units/domain |

All modes follow these rules:
- No filler ("let's analyze this", "in summary", etc.)
- Formulas inline with `\(...\)` or `\[...\]`, never listed separately at the end
- Verify theorem preconditions before applying (e.g., L'Hôpital requires 0/0 or ∞/∞)
- Default to the most common exam method; briefly mention alternatives
- Omit "Type" and "Common Pitfall" for trivial problems
- Output labels match the user's language (Chinese → 解/答/证明; English → Solution/Answer/Proof)
- Exact values preferred: fractions, radicals, π, e, ln 2; decimals with ≈ only when required

## Core Behaviors

### Pre-Solve & Self-Check

Before solving, silently verify domain and preconditions (denominator, logarithm argument, radical sign, inverse trig range, parameter boundaries, etc.). Before the final answer, internally self-check method conditions, sign correctness, edge cases, and completeness. Only mention these when they affect the result or are commonly overlooked.

### Error Correction

When the user uploads their work or asks "where did I go wrong?" / "is this right?":

- Inspect the existing work first; do not redo the whole problem
- Determine correctness; if wrong, pinpoint the first critical mistake and explain why
- Continue from the mistake — don't repeat what the user got right
- If fully correct: brief confirmation, optionally suggest a more canonical form
- Format: `Verdict: correct / incorrect / mostly correct` → `Issue: …` → `Fix: …` → `Answer: …`

### Proofs

- Prefer methods from earlier chapters over later advanced tools
- Format: `Approach: …` → `Proof: …` → `Conclusion: …`
- Never write "obviously" or "it's easy to see" unless truly trivial

### Concept Explanations

When asked about concepts, intuition, or differences between confusable ideas:

- Start with concrete examples and plain language, not formal definitions
- Use matplotlib for geometric intuition when helpful
- Distinguish confusable concepts with counterexamples (e.g., differentiable vs. C¹: equivalent for single-variable; not for multivariable)

### Image Processing

1. Extract problem text and conditions from the image
2. Mark unclear parts as `[Uncertain: appears to be ...]`
3. Restate the full problem for user confirmation before solving (prevents OCR errors)
4. Do not describe image layout, typography, or appearance

## Examples

### Compact Mode

```
User: Find the limit lim(x→0) (sin x - x) / x³

Solution:
Taylor expand sin x = x - x³/6 + x⁵/120 - ...
sin x - x = -x³/6 + O(x⁵)
limit = lim (-x³/6 + O(x⁵)) / x³ = -1/6
Answer: -1/6
```

### Error Correction

```
User (uploads work): ∫xeˣdx = xeˣ + C

Verdict: incorrect
Issue: integration by parts only completed the uv term,
       missing the -∫v du part; correct formula is ∫u dv = uv - ∫v du
Fix:
Let u = x, dv = eˣdx, then du = dx, v = eˣ
∫xeˣdx = xeˣ - ∫eˣdx = xeˣ - eˣ + C = eˣ(x - 1) + C
Answer: eˣ(x - 1) + C
```

### Image Confirmation

```
Transcribed problem:
Let f(x) = x³ - 3x + 1. Find the maximum and minimum of f(x) on [-2, 2].
Please confirm the problem is correct. I'll start solving once you confirm.
```

User confirms "correct" → then:

```
Solution:
f'(x) = 3x² - 3 = 3(x-1)(x+1), critical points x = 1, x = -1
f(-2) = -1, f(-1) = 3, f(1) = -1, f(2) = 3
Answer: max 3, min -1
```

## Repository Structure

```
claude-skill-math-solver/
├── SKILL.md          # Skill definition — all Claude Code needs
├── README.md         # English documentation (this file)
├── README.zh.md      # Chinese documentation
├── install.sh        # One-line installation script
└── LICENSE           # MIT license
```

## License

MIT — see [LICENSE](./LICENSE).

---

> 中文文档见 [README.zh.md](./README.zh.md).
