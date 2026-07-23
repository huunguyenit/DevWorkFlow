# Layout Blueprint P0 — Slot Facade + Commands + Adapter

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Cho phép đổi layout Form (resize cột px, merge/split slot, set anchor/split) qua Design Command API + Layout Engine, ghi XML bằng Adapter → `FboXmlWriter` — chưa cần Blueprint Overlay.

**Architecture:** Facade Slot/Region bọc `FormViewLayout` / `FormViewCell` trong Application. `ILayoutEngine` mutate model in-memory theo quy tắc FBO (tổng width giữ nguyên, pattern `1/0/-`). `IDesignLayoutCommands` là surface ổn định; `FboDesignLayoutWriterAdapter` gọi `FboXmlWriter.ApplyLayout` sau khi Engine thành công. UI/WebView không đụng trong P0.

**Tech Stack:** .NET 10, C#, xUnit, `FormViewLayout` / `FboXmlParser` / `FboXmlWriter` hiện có.

## Global Constraints

- Spec: `docs/superpowers/specs/2026-07-23-layout-blueprint-designer-design.md` (§6–7, §9, roadmap P0)
- Parent: ADR-0009; dual `Fbo*` tạm chấp nhận (Adapter pattern)
- UI never parses XML; Application never references WebView2/WPF
- Local vars / parameters / temps: `snake_case`
- Widths = **px FBO-native**; không persist Min/Max/Resizable/…
- `Anchor` / `Split` đúng nghĩa FBO (1-based column count trong XML attrs)
- No Left Panel changes
- Do not commit unless the user explicitly asks; end each task with tests green + short checkpoint note
- Preserve unrelated uncommitted work; no destructive git

---

## File map

| File | Responsibility |
|------|----------------|
| `DevWorkFlow.Application/Design/Layout/LayoutRegionId.cs` | Id region: `Main`, `Footer`, `Category(index)` |
| `DevWorkFlow.Application/Design/Layout/LayoutSlotId.cs` | Id slot: region + row + columnIndex |
| `DevWorkFlow.Application/Design/Layout/LayoutMutationResult.cs` | Success / Failure + message |
| `DevWorkFlow.Application/Design/Layout/ILayoutEngine.cs` | Resize / Merge / Split / SetAnchor / SetSplit trên `FboFormModel` |
| `DevWorkFlow.Application/Design/Layout/LayoutEngine.cs` | Implement quy tắc §7 |
| `DevWorkFlow.Application/Design/Layout/ViewRowPatternBuilder.cs` | Cells → pattern string + sync `FormViewRow.Pattern` |
| `DevWorkFlow.Application/Design/Layout/IDesignLayoutCommands.cs` | Command surface ổn định |
| `DevWorkFlow.Application/Design/Layout/DesignLayoutCommands.cs` | Ủy quyền Engine |
| `DevWorkFlow.Application/Design/Layout/IDesignLayoutWriterAdapter.cs` | Model → XML string |
| `DevWorkFlow.Application/Design/Layout/FboDesignLayoutWriterAdapter.cs` | `FboXmlWriter.ApplyLayout` |
| `tests/.../Design/Layout/LayoutEngineResizeTests.cs` | Resize |
| `tests/.../Design/Layout/LayoutEngineMergeSplitTests.cs` | Merge/Split |
| `tests/.../Design/Layout/LayoutEngineAnchorSplitTests.cs` | Anchor/Split |
| `tests/.../Design/Layout/FboDesignLayoutWriterAdapterTests.cs` | Round-trip XML |
| `.ai/CURRENT_STATE.md` | Ghi P0 landed (cuối plan) |

**P0 không tạo:** Overlay JS, `data-dwf-slot`, Toolbox DnD, EnsureFooter/AddCategory UI, InsertField (P3+).

**Min column px (IDE clamp, không ghi XML):** `LayoutEngine.MinColumnWidthPx = 1`.

---

### Task 1: Region/Slot ids + LayoutMutationResult

**Files:**
- Create: `DevWorkFlow.Application/Design/Layout/LayoutRegionId.cs`
- Create: `DevWorkFlow.Application/Design/Layout/LayoutSlotId.cs`
- Create: `DevWorkFlow.Application/Design/Layout/LayoutMutationResult.cs`

**Interfaces:**
- Produces: `LayoutRegionId`, `LayoutSlotId`, `LayoutMutationResult` dùng suốt P0

- [ ] **Step 1: Add types**

```csharp
namespace DevWorkFlow.Application.Design.Layout;

public enum LayoutRegionKind
{
    Main,
    Category,
    Footer
}

public readonly record struct LayoutRegionId(LayoutRegionKind Kind, int CategoryIndex = 0)
{
    public static LayoutRegionId Main { get; } = new(LayoutRegionKind.Main);
    public static LayoutRegionId Footer { get; } = new(LayoutRegionKind.Footer);
    public static LayoutRegionId Category(int index) => new(LayoutRegionKind.Category, index);
}

/// <summary>ColumnIndex = chỉ số cột bắt đầu của slot (0-based), khớp FormViewCell.ColumnIndex.</summary>
public readonly record struct LayoutSlotId(LayoutRegionId Region, int RowIndex, int ColumnIndex);

public sealed class LayoutMutationResult
{
    public bool Ok { get; init; }
    public string? Error { get; init; }

    public static LayoutMutationResult Success() => new() { Ok = true };
    public static LayoutMutationResult Fail(string error) => new() { Ok = false, Error = error };
}
```

- [ ] **Step 2: Build Application project**

```powershell
dotnet build DevWorkFlow.Application/DevWorkFlow.Application.csproj --no-restore
```

Expected: build succeeded (restore once if needed).

- [ ] **Step 3: Checkpoint** — types compile; no tests yet.

---

### Task 2: ViewRowPatternBuilder (Cells → pattern)

**Files:**
- Create: `DevWorkFlow.Application/Design/Layout/ViewRowPatternBuilder.cs`
- Test: `tests/DevWorkFlow.Application.Tests/Design/Layout/ViewRowPatternBuilderTests.cs`

**Interfaces:**
- Consumes: `FormViewRow`, `FormViewCell`, column_count
- Produces: `ViewRowPatternBuilder.Rebuild(FormViewRow row, int column_count)` → updates `row.Pattern` and cell ColumnIndex/Span consistency

- [ ] **Step 1: Write failing tests**

```csharp
using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class ViewRowPatternBuilderTests
{
    [Fact]
    public void Rebuild_WritesOneAndZerosForSpan()
    {
        var row = new FormViewRow
        {
            Cells =
            [
                new FormViewCell
                {
                    Kind = FormViewCellKind.Label,
                    FieldName = "ma_kh",
                    Suffix = ".Label",
                    ColumnIndex = 0,
                    ColumnSpan = 2
                },
                new FormViewCell
                {
                    Kind = FormViewCellKind.Input,
                    FieldName = "ma_kh",
                    Suffix = "",
                    ColumnIndex = 2,
                    ColumnSpan = 1
                },
                new FormViewCell
                {
                    Kind = FormViewCellKind.Empty,
                    ColumnIndex = 3,
                    ColumnSpan = 1
                }
            ]
        };

        ViewRowPatternBuilder.Rebuild(row, column_count: 4);

        // Label span2 → 10; Input → 1; Empty span1 → -
        Assert.Equal("101-", row.Pattern);
    }
}
```

- [ ] **Step 2: Run test — expect FAIL (type missing)**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~ViewRowPatternBuilderTests" --no-restore
```

- [ ] **Step 3: Implement builder**

Rule: non-Empty or Empty with `span > 1` → `1` + `0…`; Empty `span == 1` → `-`; columns not covered stay `-`.

```csharp
namespace DevWorkFlow.Application.Design.Layout;

using DevWorkFlow.Domain.Models.Fbo;

public static class ViewRowPatternBuilder
{
    public static void Rebuild(FormViewRow row, int column_count)
    {
        if (column_count <= 0)
        {
            row.Pattern = string.Empty;
            return;
        }

        var chars = new char[column_count];
        Array.Fill(chars, '-');

        foreach (var cell in row.Cells)
        {
            var start = cell.ColumnIndex;
            var span = Math.Max(cell.ColumnSpan, 1);
            if (start < 0 || start >= column_count) continue;

            if (cell.Kind == FormViewCellKind.Empty && span == 1)
            {
                chars[start] = '-';
                continue;
            }

            chars[start] = '1';
            for (var i = 1; i < span && start + i < column_count; i++)
                chars[start + i] = '0';
        }

        row.Pattern = new string(chars);
    }
}
```

- [ ] **Step 4: Run tests — PASS**

- [ ] **Step 5: Checkpoint**

---

### Task 3: LayoutEngine.ResizeColumns (TDD)

**Files:**
- Create: `DevWorkFlow.Application/Design/Layout/ILayoutEngine.cs`
- Create: `DevWorkFlow.Application/Design/Layout/LayoutEngine.cs`
- Test: `tests/DevWorkFlow.Application.Tests/Design/Layout/LayoutEngineResizeTests.cs`

**Interfaces:**
- Consumes: `FboFormModel`, `LayoutRegionId`, splitter index (biên giữa cột `i` và `i+1`, 0-based `i`)
- Produces: `LayoutMutationResult ResizeColumns(FboFormModel form, LayoutRegionId region, int splitter_index, int delta_px)`

Rules:
- `w[i] += delta`, `w[i+1] -= delta`; total unchanged
- Reject if either column would be `< MinColumnWidthPx` (1)
- Main → `layout.ColumnWidths`; Category(n) → that category’s `ColumnWidths` (fallback copy from view if empty — mutate category list); Footer → `FooterCategory.ColumnWidths` or create widths on footer category

- [ ] **Step 1: Failing tests**

```csharp
using DevWorkFlow.Application.Design.Layout;
using DevWorkFlow.Application.Engine;
using DevWorkFlow.Domain.Models.Fbo;
using Xunit;

namespace DevWorkFlow.Application.Tests.Design.Layout;

public sealed class LayoutEngineResizeTests
{
    private static FboFormModel ParseForm(string xml) =>
        new FboXmlParser().Parse(xml, "t.xml").Form!;

    private const string SimpleDir = """
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields><field name="a"><header v="A" e="A"/></field></fields>
          <views>
            <view id="Dir">
              <item value="100, 100, 100, 100"/>
              <item value="1111: [a].Label, [a], [a].Description, [a]."/>
            </view>
          </views>
        </dir>
        """;

    [Fact]
    public void ResizeColumns_MovesPxBetweenNeighbors_KeepsTotal()
    {
        var form = ParseForm(SimpleDir);
        var engine = new LayoutEngine();
        var result = engine.ResizeColumns(form, LayoutRegionId.Main, splitter_index: 0, delta_px: -25);

        Assert.True(result.Ok);
        Assert.Equal(new[] { 75, 125, 100, 100 }, form.Layout!.ColumnWidths);
        Assert.Equal(400, form.Layout.TotalWidthPx);
    }

    [Fact]
    public void ResizeColumns_RejectsWhenBelowMin()
    {
        var form = ParseForm(SimpleDir);
        var engine = new LayoutEngine();
        var result = engine.ResizeColumns(form, LayoutRegionId.Main, splitter_index: 0, delta_px: -100);

        Assert.False(result.Ok);
        Assert.Equal(new[] { 100, 100, 100, 100 }, form.Layout!.ColumnWidths);
    }
}
```

- [ ] **Step 2: Run — FAIL**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~LayoutEngineResizeTests"
```

- [ ] **Step 3: Implement `ILayoutEngine` + `LayoutEngine` (resize only first)**

```csharp
public interface ILayoutEngine
{
    LayoutMutationResult ResizeColumns(FboFormModel form, LayoutRegionId region, int splitter_index, int delta_px);
    LayoutMutationResult MergeSlots(FboFormModel form, LayoutSlotId left, LayoutSlotId right);
    LayoutMutationResult SplitSlot(FboFormModel form, LayoutSlotId slot);
    LayoutMutationResult SetAnchor(FboFormModel form, LayoutRegionId region, int? anchor_1_based);
    LayoutMutationResult SetSplit(FboFormModel form, LayoutRegionId region, int? split_1_based);
}

public sealed class LayoutEngine : ILayoutEngine
{
    public const int MinColumnWidthPx = 1;

    public LayoutMutationResult ResizeColumns(
        FboFormModel form, LayoutRegionId region, int splitter_index, int delta_px)
    {
        var widths = ResolveWidths(form, region);
        if (widths is null)
            return LayoutMutationResult.Fail("Region has no column widths.");
        if (splitter_index < 0 || splitter_index + 1 >= widths.Count)
            return LayoutMutationResult.Fail("Invalid splitter index.");

        var left = widths[splitter_index] + delta_px;
        var right = widths[splitter_index + 1] - delta_px;
        if (left < MinColumnWidthPx || right < MinColumnWidthPx)
            return LayoutMutationResult.Fail("Column would be below minimum width.");

        widths[splitter_index] = left;
        widths[splitter_index + 1] = right;
        // Recompute cell WidthPx on rows of that region (optional but good)
        RecalcRowWidths(form, region, widths);
        return LayoutMutationResult.Success();
    }

    // stubs throw NotImplementedException until later tasks — OR return Fail("Not implemented")
}
```

Implement `ResolveWidths` to return the live `List<int>` on the model (Main / Category / Footer). For Footer without category -1, Fail.

`RecalcRowWidths`: for each cell, `WidthPx = sum(widths[col..col+span))`.

- [ ] **Step 4: Tests PASS**

- [ ] **Step 5: Checkpoint**

---

### Task 4: MergeSlots + SplitSlot

**Files:**
- Modify: `LayoutEngine.cs`
- Test: `tests/DevWorkFlow.Application.Tests/Design/Layout/LayoutEngineMergeSplitTests.cs`

**Rules (spec §7.2):**
- Merge: same region, same `RowIndex`, slots adjacent (`left.ColumnIndex + left.Span == right.ColumnIndex`), both exist; after merge keep **left** cell content, `ColumnSpan += right.Span`, remove right cell; if right is non-Empty and left is non-Empty with **different** field/kind → Fail (cannot merge two different controls). Allowed: Empty+Empty, Control+Empty, Empty+Control (content moves to start), same-field parts only if product later needs — **P0 rule:** only merge when **at least one is Empty** OR both Empty; merging two occupied different controls = Fail. Merging two occupied same span group already one slot — N/A.
- Actually user vision: merge two **columns** (pattern), often combining empty or extending span of one control. Spec: "Merge hai cột liền kề". Prefer: merge adjacent slots → one slot with span sum; **keep non-Empty content if exactly one side has content**; if both non-Empty → Fail.
- Split: `span > 1` → keep control at start with span 1; insert Empty cells for remaining columns (each span 1); Rebuild pattern.

- [ ] **Step 1: Failing tests**

```csharp
[Fact]
public void MergeSlots_ExtendsSpan_WhenRightEmpty()
{
    // pattern 101- : label@0 span1, input@2 span1, empty@3
    // Better fixture: 1100 with label span2 and two empties — merge last two empties
    var form = ParseForm("""
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields><field name="a"><header v="A" e="A"/></field></fields>
          <views>
            <view id="Dir">
              <item value="50,50,50,50"/>
              <item value="1---: [a].Label"/>
            </view>
          </views>
        </dir>
        """);
    // cells: Label@0, Empty@1, Empty@2, Empty@3
    var engine = new LayoutEngine();
    var left = new LayoutSlotId(LayoutRegionId.Main, 0, 1);
    var right = new LayoutSlotId(LayoutRegionId.Main, 0, 2);
    var result = engine.MergeSlots(form, left, right);
    Assert.True(result.Ok);
    var row = form.Layout!.TopRows[0];
    var merged = row.Cells.Single(c => c.ColumnIndex == 1);
    Assert.Equal(2, merged.ColumnSpan);
    Assert.Equal(FormViewCellKind.Empty, merged.Kind);
    ViewRowPatternBuilder.Rebuild(row, 4); // engine should already rebuild
    Assert.Equal("1-0-", row.Pattern); // Label, Empty span2 = 10? Empty span2 at col1 → chars[1]=1 chars[2]=0 — but Empty uses '-' in builder for span1 only

}
```

**Clarify Empty multi-span pattern:** For merged Empty span 2, pattern should be `10` for those columns (FBO uses `1`/`0` for control runs; unused is `-`). An empty “slot” spanning 2 columns in FBO is typically still `1`+`0` with no control assigned → parser creates Empty with span 2. So Rebuild should write `1`/`0` for Empty when `ColumnSpan > 1`, and `-` only for span-1 unused holes **or** always `1`/`0` for any cell in Cells list.

**Update ViewRowPatternBuilder rule (fix Task 2 if needed):** every cell in `Cells` emits `1` + `(span-1)*0` at ColumnIndex; do **not** special-case Empty to `-`. How do lone `-` holes appear? Only when a column is not covered by any cell — after Rebuild from Cells, fill uncovered columns with `-`.

Revise builder:

```csharp
Array.Fill(chars, '-');
foreach (var cell in row.Cells)
{
    var start = cell.ColumnIndex;
    var span = Math.Max(cell.ColumnSpan, 1);
    if (start < 0 || start >= column_count) continue;
    chars[start] = '1';
    for (var i = 1; i < span && start + i < column_count; i++)
        chars[start + i] = '0';
}
```

Then Empty span1 → `1` in pattern (parser would create Empty). FBO often uses `-` for unused. Prefer: Empty span1 → `-`; Empty span>1 → `1`+`0`s; non-Empty → `1`+`0`s.

```csharp
if (cell.Kind == FormViewCellKind.Empty && span == 1)
{
    chars[start] = '-';
    continue;
}
```

Merge two Empty span1 → one Empty span2 → pattern `10` for those cols. Good.

SplitSlot test:

```csharp
[Fact]
public void SplitSlot_BreaksSpan_ControlStaysAtStart()
{
    var form = ParseForm("""
        <dir xmlns="urn:schemas-fast-com:data-dir">
          <title v="T" e="T"/>
          <fields><field name="a"><header v="A" e="A"/></field></fields>
          <views>
            <view id="Dir">
              <item value="50,50,50,50"/>
              <item value="1000: [a].Label"/>
            </view>
          </views>
        </dir>
        """);
    var engine = new LayoutEngine();
    var result = engine.SplitSlot(form, new LayoutSlotId(LayoutRegionId.Main, 0, 0));
    Assert.True(result.Ok);
    var row = form.Layout!.TopRows[0];
    Assert.Equal(1, row.Cells[0].ColumnSpan);
    Assert.Equal(FormViewCellKind.Label, row.Cells[0].Kind);
    Assert.Equal(3, row.Cells.Count(c => c.Kind == FormViewCellKind.Empty));
    Assert.Equal("1---", row.Pattern);
}
```

- [ ] **Step 2: Run FAIL → implement Merge/Split → PASS**

- [ ] **Step 3: Checkpoint**

---

### Task 5: SetAnchor + SetSplit

**Files:**
- Modify: `LayoutEngine.cs`
- Modify: `FboXmlWriter.cs` — persist `anchor` / `split` on `<view>` (and category if set on category)
- Test: `LayoutEngineAnchorSplitTests.cs` + writer test

**Semantics:** values are **1-based** column counts as in XML. `null` or `0` clears attribute.

```csharp
public LayoutMutationResult SetAnchor(FboFormModel form, LayoutRegionId region, int? anchor_1_based)
{
    if (region.Kind != LayoutRegionKind.Main)
        return LayoutMutationResult.Fail("Anchor is only supported on main view in P0.");
    if (anchor_1_based is { } a && (a < 1 || a > form.Layout!.ColumnCount))
        return LayoutMutationResult.Fail("Anchor out of range.");
    form.Layout!.Anchor = anchor_1_based is 0 or null ? null : anchor_1_based;
    return LayoutMutationResult.Success();
}
```

Same for Split.

- [ ] **Step 1: Extend `FboXmlWriter.ApplyLayout`** after finding view:

```csharp
SetOrRemoveAttr(view, "anchor", layout.Anchor?.ToString());
SetOrRemoveAttr(view, "split", layout.Split?.ToString());
```

(`SetOrRemoveAttr` is private instance-related — make a private static already exists.)

- [ ] **Step 2: Tests** assert model + ApplyLayout XML contains `anchor="2"` etc.

- [ ] **Step 3: Checkpoint**

---

### Task 6: DesignLayoutCommands + Writer Adapter

**Files:**
- Create: `IDesignLayoutCommands.cs`, `DesignLayoutCommands.cs`
- Create: `IDesignLayoutWriterAdapter.cs`, `FboDesignLayoutWriterAdapter.cs`
- Test: `FboDesignLayoutWriterAdapterTests.cs`

**Interfaces:**

```csharp
public interface IDesignLayoutCommands
{
    LayoutMutationResult ResizeColumns(FboFormModel form, LayoutRegionId region, int splitter_index, int delta_px);
    LayoutMutationResult MergeSlots(FboFormModel form, LayoutSlotId left, LayoutSlotId right);
    LayoutMutationResult SplitSlot(FboFormModel form, LayoutSlotId slot);
    LayoutMutationResult SetAnchor(FboFormModel form, LayoutRegionId region, int? anchor_1_based);
    LayoutMutationResult SetSplit(FboFormModel form, LayoutRegionId region, int? split_1_based);
}

public sealed class DesignLayoutCommands(ILayoutEngine engine) : IDesignLayoutCommands
{
    // forward all to engine
}

public interface IDesignLayoutWriterAdapter
{
    /// <summary>Apply in-memory form.Layout back onto xml source.</summary>
    string WriteLayout(string xml, FboFormModel form);
}

public sealed class FboDesignLayoutWriterAdapter : IDesignLayoutWriterAdapter
{
    private readonly FboXmlWriter _writer = new();
    public string WriteLayout(string xml, FboFormModel form) => _writer.ApplyLayout(xml, form);
}
```

- [ ] **Step 1: Test round-trip**

```csharp
[Fact]
public void WriteLayout_PersistsResizedWidths()
{
    var xml = SimpleDir;
    var form = ParseForm(xml);
    new LayoutEngine().ResizeColumns(form, LayoutRegionId.Main, 0, -20);
    var out_xml = new FboDesignLayoutWriterAdapter().WriteLayout(xml, form);
    Assert.Contains("80, 120, 100, 100", out_xml); // or without spaces — match FboXmlWriter Join ", "
}
```

`string.Join(", ", …)` → `"80, 120, 100, 100"`.

- [ ] **Step 2: Implement → PASS**

- [ ] **Step 3: Checkpoint**

---

### Task 7: Wire nothing in UI; document CURRENT_STATE P0

**Files:**
- Modify: `.ai/CURRENT_STATE.md` — short note under Design: P0 Layout Commands landed (Engine + Adapter; Overlay chưa)

- [ ] **Step 1: Update CURRENT_STATE** one paragraph

- [ ] **Step 2: Run full Design + Layout tests**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~Design|FullyQualifiedName~Layout"
```

Expected: all PASS

- [ ] **Step 3: P0 exit checklist**
  - [x] Resize / Merge / Split / SetAnchor / SetSplit via Commands
  - [x] Writer Adapter persists widths + patterns + anchor/split
  - [x] No WebView Overlay code
  - [x] Tests green

---

## Spec coverage (P0)

| Spec item | Task |
|-----------|------|
| Slot/Region facade ids | T1 |
| Pattern rebuild | T2 |
| ResizeColumns px, total fixed, min clamp | T3 |
| Merge/Split | T4 |
| Anchor/Split semantics + persist | T5 |
| Command API + FboXmlWriter Adapter | T6 |
| No Overlay / no UI | T7 |

## Out of P0 (next plans)

InsertField, MoveField, EnsureFooter, AddCategory, Blueprint overlay → P1–P4 plans.
