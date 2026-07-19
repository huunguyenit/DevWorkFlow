# Task 1 Report: Domain — InsightErrorKind on InsightItem

## Status

**DONE**

## Summary

Added `InsightErrorKind` enum and error surface properties on `InsightItem` in Domain only. No Application, UI, AvalonEdit, or bridge changes. `AnnotatedValue` retained for AvalonEdit; XML doc notes Monaco Approach A ignores pipe layout.

## Changes

### File: `DevWorkFlow.Domain/Language/Insights.cs`

1. **`InsightErrorKind` enum** (after `InsightLayer`):
   - `None = 0`
   - `Unresolved = 1`
   - `Circular = 2`
   - XML summary: `Lỗi Entity Insight (ADR-0004 / entity-insight-rendering).`

2. **`InsightItem` properties** (after `CanEditResolvedValue`):
   - `public InsightErrorKind ErrorKind { get; init; }`
   - `public string? ErrorMessage { get; init; }`

3. **`AnnotatedValue` XML doc** updated:
   - Clarifies AvalonEdit still uses `|` + annotated text.
   - Notes Monaco Approach A ignores pipe layout (children-driven ViewZone).

## Build

```text
dotnet build DevWorkFlow.Domain/DevWorkFlow.Domain.csproj
```

Result: **PASS** — 0 Warning(s), 0 Error(s)

## Commit

- **SHA:** `b9b225fc`
- **Subject:** `feat(language): add InsightErrorKind for entity insight errors`
- **Scope:** only `DevWorkFlow.Domain/Language/Insights.cs` (1 file, +19 lines)

## Self-review

| Check | Result |
| --- | --- |
| Enum values match brief verbatim | Yes |
| Properties on `InsightItem` after `CanEditResolvedValue` | Yes |
| `AnnotatedValue` kept (not removed) | Yes |
| Doc notes Monaco Approach A / children-driven ViewZone | Yes |
| No Application / UI / AvalonEdit / bridge.js touches | Yes |
| Domain build succeeds | Yes |
| Commit message matches brief | Yes |

## Concerns

None for Task 1 scope. Default `ErrorKind` is `None` (0); producers in Task 2+ must set `Unresolved` / `Circular` and `ErrorMessage` when applicable.

## Out of scope (deferred)

- Provider population of `ErrorKind` / `ErrorMessage` (Task 2+)
- Tests in `InsightProviderPipelineTests.cs` (Task 2)
- Monaco decorations / InjectedText / ViewZone rendering
