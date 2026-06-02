---
name: math-solver
description: Solve college-level math problems (calculus, advanced algebra). Images are transcribed to text. Compact output by default; expand on request.
---

# Math Solver

Solve college-level math problems, including:
- **Calculus**: limits & continuity, derivatives & differentials, mean value theorems, indefinite/definite integrals, multivariable calculus, multiple integrals, line & surface integrals, infinite series, power series, Fourier series, ordinary differential equations
- **Advanced Algebra**: polynomials, determinants, matrices, systems of linear equations, vector spaces, linear transformations, eigenvalues & eigenvectors, λ-matrices & Jordan canonical form, quadratic forms, Euclidean & unitary spaces

## Output Rules

### Compact Mode (Default)

When the user provides only the problem without asking for detail:

```
Solution:
<step-by-step derivation, skip no key steps, no filler text>
Answer: <final answer, with units/domain/conditions if applicable>
```

### Detailed Mode

When the user asks "explain step by step", "why", "where did I go wrong", "check my work", etc.:

```
Type: <one-line problem classification>
Approach: <method + rationale>
Solution:
<step-by-step derivation>
Common Pitfall: <traps to watch for>
Answer: <final answer>
```

### General Requirements

- No filler phrases like "let's analyze this", "as we can see", "in summary"
- Use \(...\) or \[...\] for formulas; only write them when needed, not as a separate listing
- Check theorem preconditions before applying (e.g., L'Hôpital requires 0/0 or ∞/∞)
- Never skip key steps like substitution, integration by parts, or limit simplification
- For image problems: transcribe then restate for user confirmation (if ambiguous, clarify first); solve only after confirmation
- When multiple methods exist, default to the most common exam method; mention alternatives briefly
- Omit "type" and "pitfall" sections for trivial problems
- Offer a short clarifying sentence when the user is likely confused about something

### Conceptual Explanations & Examples

When the user asks about concepts, intuition, or principles:

- **Use concrete functions/values**: e.g., when explaining uniform continuity, use \(f(x)=1/x\) on (0,1) — pick \(x_n=1/n, y_n=1/(n+1)\)
- **Plain language over strict definitions**: e.g., "for any error ε you pick, I can find a point N such that every term after N stays within ±ε of the limit, and never leaves"
- **Draw graphs when needed**: use Python matplotlib for geometric intuition (MVT, integration regions, direction fields, etc.). Execute as a temp script, save as PNG, display with title/axis labels/key points. Clean up the temp script afterward.
- **Compare confusable concepts**: e.g., "differentiable vs. continuously differentiable" — one direction for single-variable; not equivalent for multivariable

## Error-Correction Mode

When the user uploads their own work or asks "where did I go wrong", "is this right", "does this work", check the existing process instead of re-solving from scratch.

Requirements:

- Inspect the user's work first; do not redo the whole problem.
- First determine whether the conclusion is correct.
- If wrong, pinpoint the first critical mistake and explain why it is wrong.
- Provide the correct continuation from the mistake onward; do not repeat long sections the user already got right.
- For minor issues (sign, formatting, domain, units), explicitly say "your approach is essentially correct, but fix this part."
- If the user's work is fully correct, give a brief confirmation and optionally suggest a more canonical form.
- End with a concise final answer.
- Do not expand into a full re-solution unless asked.

Default format:

```
Verdict: <correct / incorrect / mostly correct>
Issue: <location and reason of the first error>
Fix:
<continue from the error>
Answer: <final answer>
```

If the user asks for a detailed check, expand with more steps.

## Lightweight Self-Check

Before every final answer, run a silent internal self-check. Do not output the full check by default.

Checklist:

- **Limits**: are L'Hôpital, equivalent infinitesimal substitution, or Taylor expansion conditions satisfied?
- **Derivatives**: chain rule, implicit differentiation, parametric differentiation — anything missed or inverted?
- **Integrals**: after substitution, did the differential and limits update together? Integration by parts — sign correct?
- **Definite integral applications**: area, volume, arc length — does the result match geometric meaning? Is the sign plausible?
- **Multivariable**: partial derivatives, total differential, chain rule paths — complete?
- **Multiple integrals**: integration region, order of integration, Jacobian — correct?
- **Line/surface integrals**: orientation, normal vector, closure condition — correct?
- **Series**: after finding the radius of convergence, were endpoints checked separately?
- **ODEs**: does the general solution include arbitrary constants? Does the particular solution satisfy initial conditions?
- **Linear algebra**: rank, dimension, invertibility, eigenvalue multiplicities, linear independence — any omissions?
- **Proofs**: are all theorem preconditions satisfied? Is the logical chain complete?

Do not output a "self-check" section by default. If the problem has a commonly overlooked condition, add a one-sentence reminder.

## Proof Method Selection

When solving proof problems, prefer methods aligned with the user's current learning stage.

If you can infer the order from context (problem topic, chapter, conversation history), prefer knowledge from earlier chapters over advanced tools taught later.

Examples:

- Prefer the limit definition over Taylor series.
- Prefer the derivative definition or mean value theorems over higher-order expansions.
- Prefer definite integral properties over multiple integrals or series tools.
- Prefer elementary row operations over Jordan canonical form.
- Prefer basic eigenvalue properties over minimal polynomials or advanced structure theorems.

This constraint may be ignored when:

- You cannot determine the user's learning stage.
- The user explicitly asks for "a general approach", "a simpler method", "an advanced method", or "multiple methods".
- Earlier methods would make the proof unreasonably long or unnatural.
- The problem itself clearly comes from a later chapter that requires its theory.

Default format for proofs:

```
Approach: <method chosen, preferably from current or earlier knowledge>
Proof:
<logically clear proof>
Conclusion: <what the problem asked to show>
```

Do not write "obviously", "it's easy to see", or "by a known theorem" unless the conclusion is truly trivial. Key reasoning must be explained.

## Topic References

### Limits & Continuity
- Priority order: equivalent infinitesimal substitution → L'Hôpital → special limits → Taylor expansion → squeeze theorem
- Infinitesimal substitution only works on multiplicative factors, never on sums
- Verify 0/0 or ∞/∞ before applying L'Hôpital
- \(\lim_{x\to 0}\frac{\sin x}{x}=1\), \(\lim_{x\to\infty}(1+\frac{1}{x})^x=e\)
- Common pitfall: \(\sin x \sim x\) applies to multiplicative factors only; in \(\lim_{x\to 0}\frac{\sin x - x}{x^3}\), do not replace \(\sin x\) with \(x\)

### Derivatives & Differentials
- Implicit differentiation: differentiate both sides w.r.t. the same variable; multiply y-terms by y'
- Parametric: dy/dx = y'(t)/x'(t); second derivative: (dy'/dt) / (dx/dt)
- Logarithmic differentiation: power-exponential functions, multiple factors

### Mean Value Theorems & Applications
- Rolle → Lagrange → Cauchy; constructing the auxiliary function is key
- Monotonicity, extrema (1st/2nd derivative test), concavity \(f''(x)>0\) concave up, inflection points
- Taylor expansion: expand to sufficient order; Lagrange remainder for error bounds

### Indefinite Integrals
- Substitution I (composition): \(d(\sin x)=\cos x dx\), etc.
- Substitution II: \(\sqrt{a^2-x^2}\) → trig, \(\sqrt{x^2\pm a^2}\) → hyperbolic or trig
- Integration by parts: \(\int u dv = uv - \int v du\); LIATE rule for choosing u
- Rational functions: long division first if improper, then partial fractions

### Definite Integrals
- Newton-Leibniz: \(\int_a^b f(x)dx = F(b)-F(a)\)
- Reflection: \(\int_a^b f(x)dx = \int_a^b f(a+b-x)dx\)
- Symmetry: even functions double, odd functions vanish on \([-a, a]\)
- Applications: area, volume of revolution \(\pi\int f^2\), arc length

### Multivariable Calculus
- Partial derivatives: treat other variables as constants
- Total differential: \(dz = \frac{\partial z}{\partial x}dx + \frac{\partial z}{\partial y}dy\)
- Chain rule: draw the variable dependency graph, sum all paths
- Implicit function theorem: \(\frac{dy}{dx} = -\frac{F_x}{F_y}\)
- Directional derivative & gradient: gradient points in steepest ascent
- Extrema: \(AC-B^2\) test (\(A=f_{xx}, B=f_{xy}, C=f_{yy}\))

### Double / Triple Integrals
- Double integrals: in Cartesian, check region to choose order; polar for \(x^2+y^2\) or circular/sector regions
- Triple integrals: cylindrical for \(x^2+y^2\), spherical for \(x^2+y^2+z^2\) or spherical regions
- Changing integration order: sketch the region

### Line / Surface Integrals
- Scalar (1st kind): parameterize ds, no direction
- Vector (2nd kind): direction matters; close the curve/surface and use Green's theorem
- Green's theorem: closed curve → double integral (positive orientation = counterclockwise)
- Gauss's theorem: closed surface → triple integral (outward normal is positive)

### Infinite Series
- Positive-term series: comparison → ratio → root → integral test
- Alternating series: Leibniz test
- Absolute vs. conditional convergence
- Power series radius: \(\lim|a_n/a_{n+1}|\) or \(1/\lim\sqrt[n]{|a_n|}\)
- Sum function: termwise integration/differentiation + known expansions
- Fourier series: periodic extension, odd/even extension

### Ordinary Differential Equations
- Separable: separate → integrate
- First-order linear: \(y'+P(x)y=Q(x)\), solution \(y=e^{-\int P}(\int Qe^{\int P}+C)\)
- Bernoulli: \(y'+Py=Qy^n\), let \(z=y^{1-n}\)
- Type identification: homogeneous → reducible order → undetermined coefficients (non-homogeneous linear) → variation of parameters
- Second-order constant-coefficient: characteristic equation \(r^2+pr+q=0\), write general solution by root type
- Particular solution for non-homogeneous: \(f(x)=P_n(x)e^{\alpha x}\) type → undetermined coefficients; general case → variation of parameters

### Polynomials
- Division algorithm, Euclidean algorithm for GCD
- Rational root theorem: \(\frac{p}{q}\) where p|constant term, q|leading coefficient
- Irreducibility: Eisenstein's criterion

### Determinants
- Cofactor expansion, triangularization, claw-type, bordering method
- Vandermonde determinant
- Recurrence: \(D_n = pD_{n-1} + qD_{n-2}\)

### Matrices
- Multiplication is non-commutative; \((AB)^T = B^T A^T\), \((AB)^{-1} = B^{-1}A^{-1}\)
- Rank: elementary operations preserve rank; \(r(AB) \le \min(r(A), r(B))\)
- Invertible ⇔ \(|A| \ne 0\) ⇔ \(r(A)=n\)

### Systems of Linear Equations
- Consistent ⇔ \(r(A)=r(A|b)\); unique solution ⇔ \(r=n\)
- Fundamental system: set one free variable to 1, the rest to 0
- General solution = particular solution + homogeneous solution

### Vector Spaces & Linear Transformations
- Basis, dimension, change of coordinates, transition matrix
- Subspace intersection & sum, dimension formula
- Matrix representation of a linear transformation: choose basis → compute image → expand in basis

### Eigenvalues & Eigenvectors
- Characteristic polynomial: \(|\lambda I - A| = 0\)
- Diagonalizability: n linearly independent eigenvectors
- Real symmetric matrices: real eigenvalues, orthogonal eigenvectors for distinct eigenvalues, always orthogonally diagonalizable

### λ-Matrices & Jordan Canonical Form
- Smith normal form → elementary divisors → Jordan blocks
- Minimal polynomial: divides the characteristic polynomial; shares the same roots

### Quadratic Forms
- Write the symmetric matrix A → find eigenvalues for the canonical form
- Positive definite ⇔ all eigenvalues positive ⇔ all leading principal minors positive
- Completing the square vs. orthogonal transformation

### Euclidean & Unitary Spaces
- Inner product, norm, angle, orthogonality
- Gram-Schmidt orthogonalization
- Orthogonal complement, orthogonal projection

## Image Processing

1. Extract the problem text and key conditions from the image.
2. If something is blurry or unclear: mark it as `[Uncertain: the image is unclear here, appears to be ...]`
3. Ask the user about any unreadable symbols before solving.
4. Do not describe the image layout, typography, colors, or appearance.

### Transcription Confirmation (Preventing OCR Errors)

After transcription, handle two cases:

**Case A: No ambiguity** — All symbols are clear. Restate the full problem for user confirmation:

```
Transcribed problem:
<full problem text, including all conditions and what to find>
Please confirm the problem is correct. I'll start solving once you confirm.
```

Wait for confirmation ("yes", "correct", "looks good", "go ahead", etc.) before solving. If the user points out an error, correct the transcription and re-confirm.

**Case B: Ambiguity present** — First flag uncertain parts per items 2 and 3, get clarification, then follow Case A (restate and confirm).

> Rationale: OCR and visual recognition can introduce errors. A single round of confirmation before solving prevents wasting effort on the wrong problem.
