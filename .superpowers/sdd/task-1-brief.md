### Task 1: Domain â€” InsightErrorKind on InsightItem

**Files:**
- Modify: `DevWorkFlow.Domain/Language/Insights.cs`
- Test: `tests/DevWorkFlow.Application.Tests/InsightProviderPipelineTests.cs` (extended in Task 2; Task 1 is type + compile)

**Interfaces:**
- Produces: `enum InsightErrorKind { None = 0, Unresolved = 1, Circular = 2 }` and properties on `InsightItem`:
  - `InsightErrorKind ErrorKind { get; init; }`
  - `string? ErrorMessage { get; init; }`
- Keep `AnnotatedValue` for now (AvalonEdit may still read it); Monaco renderer must not depend on pipe format.

- [ ] **Step 1: Add enum + properties**

In `Insights.cs`, after `InsightLayer` enum, add:

```csharp
/// <summary>Lá»—i Entity Insight (ADR-0004 / entity-insight-rendering).</summary>
public enum InsightErrorKind
{
    None = 0,
    Unresolved = 1,
    Circular = 2
}
```

On `InsightItem`, after `CanEditResolvedValue`, add:

```csharp
public InsightErrorKind ErrorKind { get; init; }

public string? ErrorMessage { get; init; }
```

Update `AnnotatedValue` XML doc to note Monaco Approach A ignores pipe layout (children-driven ViewZone).

- [ ] **Step 2: Build Domain project**

Run: `dotnet build DevWorkFlow.Domain/DevWorkFlow.Domain.csproj`
Expected: PASS

- [ ] **Step 3: Commit**

```bash
git add DevWorkFlow.Domain/Language/Insights.cs
git commit -m "feat(language): add InsightErrorKind for entity insight errors"
```

---

