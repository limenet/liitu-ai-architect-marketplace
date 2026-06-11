---
name: guidelines
description: >
  Creates a project-level implementation guidelines document at
  docs/guidelines.md by scanning the codebase for the UI component library,
  styling approach, project structure, and naming conventions, then asking the
  user about rules that are not visible in code. The resulting document is the
  binding reference for how UI components and code must be implemented —
  existing components are reused instead of building new ones. Use when the
  user asks to "create coding guidelines", "document UI guidelines", "create
  implementation guidelines", "document our component conventions", asks "how
  should UI components be implemented", or complains that implementations
  ignore existing components or add custom styling.
---

# Implementation Guidelines Document

Create a `docs/guidelines.md` that documents how code — especially UI — must be implemented in this project: which component library and existing project components to reuse, how styling is done, where new files belong, and which conventions apply.

This document is a **binding rule set**, not a tutorial. Other skills (notably `implement-use-case`) read it and carry its rules into implementation plans, so implementations reuse existing components instead of inventing new ones or adding custom styling.

## Output

Write to `docs/guidelines.md`.

## DO NOT

- Invent rules that are neither evident from the codebase scan nor confirmed by the user
- Leave placeholder text unfilled — every `{...}` must be replaced with real project context
- Duplicate testing guidance — that belongs in `TESTING.md` (see the `ai-architect-testing` plugin)
- Write in a language that doesn't match the team's working language

## Workflow

### Step 1: Set up progress tracking

Use TodoWrite to create tasks for each remaining step:

- Scan codebase for conventions
- Ask user about rules not visible in code
- Write guidelines to `docs/guidelines.md`
- Quality check

### Step 2: Scan the codebase

Gather evidence of the project's actual conventions:

1. **UI library & styling approach** — read `package.json` dependencies (e.g., MUI, shadcn/ui, Ant Design; Tailwind, CSS Modules, styled-components, plain CSS)
2. **Theme & design tokens** — look for theme files, token definitions, CSS custom properties, Tailwind config
3. **Existing component inventory** — list the project's shared/reusable components (typically under `src/components/` or similar) with path and purpose
4. **Project structure & layers** — identify the folder layout and architectural layers (e.g., views, components, services, domain, api) and where new files of each kind belong
5. **Naming conventions** — file naming (PascalCase/kebab-case), component naming, hook prefixes, test file suffixes
6. **State & data access** — state management library, data-fetching pattern, where API calls live

Record findings with file paths as evidence. Mark this todo done.

### Step 3: Ask the user about rules not visible in code

Present your scan findings briefly, then ask:

> Based on my scan, the project uses [summary of findings]. Before I write the guidelines, a few questions:
>
> **1. When is it acceptable to build a new component instead of reusing an existing one — and where should new components live?**
>
> **2. Which practices are explicitly forbidden?** (e.g., inline styles, hardcoded colors/spacing, one-off CSS, copying a library component instead of wrapping it)
>
> **3. Is there a design system or design reference (e.g., Figma, brand guide) the implementation must follow?**

Wait for the user's answers before continuing. If the user skips a question, derive a sensible default from the scan and mark it as such in the document.

Mark this todo done.

### Step 4: Write the guidelines

Create `docs/guidelines.md` using [templates/guidelines.md](templates/guidelines.md) as the starting point. Fill every placeholder with project-specific content from Steps 2 and 3. Write in the team's working language.

Mark this todo done.

### Step 5: Quality check

Verify before finishing:

- [ ] Every rule is backed by codebase evidence or explicit user input
- [ ] The component inventory lists real components with correct paths
- [ ] The "reuse before build" rule states where new components belong when one is genuinely needed
- [ ] Forbidden practices are listed concretely (no vague "write clean code" statements)
- [ ] No placeholder text remains
- [ ] Document was written to `docs/guidelines.md`
- [ ] All TodoWrite tasks are marked done

Fix any failing check before finishing.
