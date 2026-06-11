# Implementation Guidelines

> Dieses Dokument wird mit dem Plugin `ai-architect-dev-tools` gepflegt (Skill: `/ai-guidelines`).
> Es ist verbindlich für jede Implementierung — Implementierungspläne (`/ai-implement-use-case`) referenzieren es.

## UI Components

### Component Library

{Which UI library/design system is used (e.g., MUI, shadcn/ui) and where it is configured.}

### Reuse Before Build

New UI is composed from existing components. Building a new component is only allowed when **no existing component covers the need** — neither a project component (see inventory below) nor a library component.

- New shared components live in `{path, e.g., src/components/}`
- {Approval rule if any, e.g., "New shared components require sign-off from …"}

### Existing Component Inventory

| Component | Path  | Purpose / When to use |
| --------- | ----- | --------------------- |
| {Name}    | `{…}` | {…}                   |

## Styling

- **Approach:** {Tailwind / CSS Modules / styled-components / theme-based styling — how styling is done in this project}
- **Design tokens / theme:** {where colors, spacing, typography are defined; e.g., `src/theme.ts`, `tailwind.config.ts`}
- **Design reference:** {Figma / brand guide link, or "None"}

### Forbidden

- {e.g., Inline styles (`style={{…}}`)}
- {e.g., Hardcoded colors, spacing, or font sizes — always use design tokens}
- {e.g., One-off CSS files outside the styling approach above}
- {e.g., Copying library components instead of wrapping/extending them}

## Library-Specific Rules

Rules per key dependency from `package.json`, checked against the official documentation (via Context7).
{If Context7 was unavailable: note that these rules are based on the codebase scan only.}

| Library               | Version | Rule                                                                                   | Source                             |
| --------------------- | ------- | -------------------------------------------------------------------------------------- | ---------------------------------- |
| {e.g., @mui/material} | {x.y.z} | {e.g., extend components via `styled()`/theme overrides — never copy component source} | {Official docs / Project decision} |

{Known deviations from official recommendations and the agreed handling, if any.}

## Project Structure & Architecture

{Folder layout and layers — where new files of each kind belong.}

| Layer / Folder | Contains | New files go here when … |
| -------------- | -------- | ------------------------ |
| `{…}`          | {…}      | {…}                      |

## Naming Conventions

- **Files:** {e.g., PascalCase for components, kebab-case for utilities}
- **Components:** {…}
- **Hooks / services / mappers:** {…}

## State & Data Access

- **State management:** {library and where stores live}
- **Data fetching / API calls:** {pattern and where API code lives}

## Compliance Checklist

Check before completing any implementation task:

- [ ] UI built from existing project or library components — no unnecessary new components
- [ ] No forbidden styling practices (see above); design tokens used throughout
- [ ] New files placed according to the project structure table
- [ ] Naming conventions followed
- [ ] State and data access follow the documented patterns
