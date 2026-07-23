# Layout Blueprint P1 — Read-only Blueprint Overlay

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Khi bật Design mode, WebView hiển thị lớp Blueprint **read-only**: tint Header/Category/Footer, đường cột nét đứt, nhãn `Npx` (+ `%` đọc), attrs `data-dwf-slot` trên mọi ô — chưa kéo splitter, chưa drop, chưa merge UI.

**Architecture:** `DesignFormHtmlBuilder` gắn `data-dwf-slot` / region metadata trên `<td>` và `<table>`. IDE CSS (`fbo-design-blueprint.css`) + script inject trong `DesignWebViewHost` vẽ overlay đo từ DOM (không sửa DOM business của control). Tắt/ẩn khi không ở Design interaction mode. Phụ thuộc HTML Generator + `designViewport` đã có; **không** gọi Layout Commands trong P1.

**Tech Stack:** .NET 10, C#, WPF, WebView2, xUnit, existing Design pipeline.

## Global Constraints

- Spec: `docs/superpowers/specs/2026-07-23-layout-blueprint-designer-design.md` (§8, roadmap P1)
- Requires P0 types only for slot id **string format** alignment — P1 may land after or parallel to P0; attrs encode `region|row|col|span` without referencing Engine
- Categories = **tabs** (đã có); không accordion
- Widths display: px SoT; `% = round(100 * w / sum)` chỉ label
- UI never parses XML
- Local vars: `snake_case`
- No Left Panel changes
- Do not commit unless user asks; tests green per task
- Preserve unrelated uncommitted work

**Prerequisite:** Design HTML Generator + FormTable + `data-dwf-region` + `designViewport` (đã land). P0 Commands **không** bắt buộc để chạy P1 overlay.

---

## File map

| File | Responsibility |
|------|----------------|
| `DevWorkFlow.Application/Design/DesignFormHtmlBuilder.cs` | Emit `data-dwf-slot`, `data-dwf-col-widths`, region on tables |
| `DevWorkFlow.Application/Design/Assets/fbo-design-blueprint.css` | Tint + dashed guides (IDE-owned; loaded only when blueprint enabled **or** always present but inert without `body.dwf-blueprint`) |
| `DevWorkFlow.Application/Design/DesignHtmlGenerator.cs` | Embed blueprint CSS; optional `class="dwf-blueprint"` on `<body>` via request flag |
| `DevWorkFlow.Application/Design/DesignContracts.cs` | Flag `EnableBlueprint` trên request/document nếu chưa có |
| `UI/Views/Design/DesignWebViewHost.xaml.cs` | Inject blueprint measure script; toggle class; handle `blueprint` ready message |
| `UI/ViewModels/FormBuilderViewModel.cs` | Pass `EnableBlueprint: true` when `ErpEditorMode.Designer` |
| `tests/.../DesignFormHtmlBuilderTests.cs` | Assert `data-dwf-slot` |
| `tests/.../DesignHtmlGeneratorTests.cs` | Assert blueprint CSS / body class when enabled |
| `.ai/CURRENT_STATE.md` | P1 note |

**P1 không làm:** splitter drag, ghost, drop, merge buttons, multi-click selection commands, Property Grid wiring to Slot.

---

### Task 1: `data-dwf-slot` trên mọi Form cell

**Files:**
- Modify: `DevWorkFlow.Application/Design/DesignFormHtmlBuilder.cs`
- Modify: `tests/DevWorkFlow.Application.Tests/Design/DesignFormHtmlBuilderTests.cs`

**Interfaces:**
- Consumes: `FormViewCell.ColumnIndex`, `ColumnSpan`, row index, region kind string
- Produces: attribute `data-dwf-slot="{region}:{row}:{col}:{span}"` where region is `main` | `footer` | `cat:{index}`

- [ ] **Step 1: Write failing tests**

```csharp
[Fact]
public void Build_EmitsDataDwfSlotOnCells()
{
    var html = BuildHtml(CustomerDir);
    // main row0: pattern 1100 → label col0 span2? CustomerDir item "1100: [ma_kh].Label, [ma_kh]"
    Assert.Contains("data-dwf-slot=\"main:0:0:", html);
    Assert.Contains("data-dwf-region=\"main\"", html);
    Assert.Contains("data-dwf-slot=\"footer:", html);
}

[Fact]
public void Build_EmitsColWidthsOnFormTable()
{
    var html = BuildHtml(CustomerDir);
    Assert.Contains("data-dwf-col-widths=\"120,30,45,25\"", html);
}
```

- [ ] **Step 2: Run — FAIL**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~DesignFormHtmlBuilderTests.Build_Emits"
```

- [ ] **Step 3: Implement**

Thread region id + row index into `RenderTable` / `RenderCell`:

```csharp
private string RenderTable(
    IReadOnlyList<FormViewRow> rows,
    IReadOnlyList<int> widths,
    RenderContext ctx,
    string region_id,
    bool table_padding = true)
{
    // ...
    var widths_attr = widths.Count > 0
        ? $" data-dwf-col-widths=\"{string.Join(",", widths)}\" data-dwf-region-table=\"{region_id}\""
        : $" data-dwf-region-table=\"{region_id}\"";
    sb.Append($"<table class=\"FormTable\" style=\"...\"{widths_attr}>\n");
    for (var row_index = 0; row_index < rows.Count; row_index++)
    {
        sb.Append("<tr class=\"FormRow\">");
        foreach (var cell in rows[row_index].Cells)
            sb.Append(RenderCell(cell, ctx, region_id, row_index));
        sb.Append("</tr>\n");
    }
}

private static string SlotAttr(string region_id, int row_index, FormViewCell cell) =>
    $" data-dwf-slot=\"{region_id}:{row_index}:{cell.ColumnIndex}:{Math.Max(cell.ColumnSpan, 1)}\"";
```

Call sites:
- Main: `region_id = "main"`
- Tab: `region_id = $"cat:{cat.Index}"` (also keep `data-category-index` on section)
- Footer: `region_id = "footer"`

Append `SlotAttr(...)` on every `<td ...>` open tag in `RenderCell` / empty / label / description / input.

- [ ] **Step 4: Tests PASS** (update any brittle full-string HTML asserts if broken)

- [ ] **Step 5: Checkpoint**

---

### Task 2: Blueprint CSS asset + generator flag

**Files:**
- Create: `DevWorkFlow.Application/Design/Assets/fbo-design-blueprint.css`
- Modify: `DevWorkFlow.Application/DevWorkFlow.Application.csproj` — ensure embedded/copy like `fbo-design-minimal.css`
- Modify: `DesignContracts.cs` / `DesignHtmlGenerator.cs` / `DesignDocumentService` as needed for `EnableBlueprint`
- Test: `DesignHtmlGeneratorTests.cs`

**Interfaces:**
- `DesignRenderRequest` or generate API gains `bool EnableBlueprint`
- When true: `<body class="dwf-blueprint">` + inline/link blueprint CSS after ide minimal CSS

- [ ] **Step 1: CSS content (IDE-owned)**

```css
/* fbo-design-blueprint.css — chỉ có hiệu lực khi body.dwf-blueprint */
body.dwf-blueprint [data-dwf-region="main"] {
  outline: 1px dashed rgba(33, 150, 243, 0.55);
  background-color: rgba(33, 150, 243, 0.06);
}
body.dwf-blueprint [data-dwf-region="footer"] {
  outline: 1px dashed rgba(255, 152, 0, 0.55);
  background-color: rgba(255, 152, 0, 0.06);
}
body.dwf-blueprint .DwfTabPanel.DwfActive {
  outline: 1px dashed rgba(156, 39, 176, 0.55);
  background-color: rgba(156, 39, 176, 0.06);
}
body.dwf-blueprint td[data-dwf-slot] {
  position: relative;
  box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.08);
}
```

Column dashed lines + px labels are drawn by **script** (Task 3) into `#dwf-blueprint-layer`, not by rewriting `<td>` borders only — CSS tint is enough for region chrome.

- [ ] **Step 2: Failing generator test**

```csharp
[Fact]
public void Generate_WhenBlueprintEnabled_AddsBodyClassAndCss()
{
    // arrange request EnableBlueprint = true
    var doc = Generate(...);
    Assert.Contains("dwf-blueprint", doc.Html);
    Assert.Contains("fbo-design-blueprint", doc.Html); // or distinctive CSS comment/text
}
```

Match how `IdeCss` / minimal CSS is loaded today (`DesignHtmlGenerator` embedded resource). Copy the same pattern for blueprint CSS; concatenate into ide style block **or** second `<style data-dwf-source="blueprint">`.

- [ ] **Step 3: Implement flag plumbing**
  - Default `EnableBlueprint: false` for non-designer callers
  - `FormBuilderViewModel` design refresh sets `true`

- [ ] **Step 4: PASS + Checkpoint**

---

### Task 3: Blueprint measure script in DesignWebViewHost

**Files:**
- Modify: `UI/Views/Design/DesignWebViewHost.xaml.cs`

**Behavior:**
- After document load / with `AddScriptToExecuteOnDocumentCreatedAsync`, install script that:
  1. Creates `#dwf-blueprint-layer` (`position:absolute; inset:0; pointer-events:none; z-index` below crosshair).
  2. If `!document.body.classList.contains('dwf-blueprint')` → clear layer and return.
  3. For each `table.FormTable[data-dwf-col-widths]`, parse widths, get table `getBoundingClientRect`, draw vertical guides at cumulative px (dashed), and labels `"{w}px"` + `"{pct}%"`.
  4. Re-run on scroll/resize/`designViewport` post; reuse existing scroll listeners.
  5. `postMessage({ type: 'blueprint', phase: 'ready' })` once.

Do **not** remove crosshair script; keep z-index crosshair above blueprint.

- [ ] **Step 1: Add script constant `DesignBlueprintScript`** (separate from viewport script or appended)

Sketch (JS):

```javascript
(function () {
  function ensureLayer() {
    var layer = document.getElementById('dwf-blueprint-layer');
    if (!layer) {
      layer = document.createElement('div');
      layer.id = 'dwf-blueprint-layer';
      layer.style.cssText = 'position:absolute;left:0;top:0;right:0;bottom:0;pointer-events:none;z-index:2147483640;';
      document.documentElement.appendChild(layer);
    }
    return layer;
  }
  function paint() {
    var layer = ensureLayer();
    layer.innerHTML = '';
    if (!document.body || !document.body.classList.contains('dwf-blueprint')) return;
    document.querySelectorAll('table.FormTable[data-dwf-col-widths]').forEach(function (table) {
      var widths = table.getAttribute('data-dwf-col-widths').split(',').map(function (s) { return parseInt(s, 10) || 0; });
      var sum = widths.reduce(function (a, b) { return a + b; }, 0) || 1;
      var rect = table.getBoundingClientRect();
      var x0 = rect.left + window.scrollX;
      var y0 = rect.top + window.scrollY;
      var x = 0;
      for (var i = 0; i < widths.length; i++) {
        x += widths[i];
        if (i < widths.length - 1) {
          var guide = document.createElement('div');
          guide.style.cssText = 'position:absolute;border-left:1px dashed rgba(0,0,0,.35);width:0;top:' + y0 + 'px;left:' + (x0 + x) + 'px;height:' + rect.height + 'px;';
          layer.appendChild(guide);
        }
        var lab = document.createElement('div');
        var pct = Math.round(widths[i] * 100 / sum);
        lab.textContent = widths[i] + 'px (' + pct + '%)';
        lab.style.cssText = 'position:absolute;top:' + (y0 - 14) + 'px;left:' + (x0 + x - widths[i]) + 'px;font:10px Consolas,monospace;color:#1565c0;background:rgba(255,255,255,.75);white-space:nowrap;';
        layer.appendChild(lab);
      }
    });
  }
  window.addEventListener('scroll', paint, true);
  window.addEventListener('resize', paint);
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', paint);
  else paint();
  if (window.chrome && window.chrome.webview) {
    window.chrome.webview.postMessage(JSON.stringify({ type: 'blueprint', phase: 'ready' }));
  }
})();
```

- [ ] **Step 2: Register script alongside `DesignViewportScript`**

- [ ] **Step 3: In `OnWebMessageReceived`, ignore unknown or optionally log `blueprint` ready (no crash)**

- [ ] **Step 4: Manual checkpoint** — run app, open Dir in Design mode, confirm tint + guides + labels; Source/other mode without flag = no blueprint class.

Automated UI test optional; Application tests cover attrs/CSS.

---

### Task 4: FormBuilderViewModel enables blueprint in Designer mode

**Files:**
- Modify: `UI/ViewModels/FormBuilderViewModel.cs` (design render request path)

- [ ] **Step 1: Find where `DesignDocumentService` / generator is invoked; set `EnableBlueprint = (mode == Designer)` or always true for design tab refresh**

- [ ] **Step 2: Build UI project**

```powershell
dotnet build UI/UI.csproj
```

- [ ] **Step 3: Checkpoint**

---

### Task 5: CURRENT_STATE + regression

**Files:**
- Modify: `.ai/CURRENT_STATE.md`

- [ ] **Step 1: Note P1 Blueprint read-only overlay landed; DnD/resize interaction = P2+**

- [ ] **Step 2: Run tests**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~Design"
```

Expected: PASS

- [ ] **Step 3: P1 exit checklist**
  - [x] `data-dwf-slot` + `data-dwf-col-widths` on Form tables/cells
  - [x] Region tint (main blue / category purple / footer orange)
  - [x] Column guides + px/% labels via blueprint layer
  - [x] Only when Design blueprint enabled
  - [x] No resize/drop/merge interaction

---

## Spec coverage (P1)

| Spec item | Task |
|-----------|------|
| `data-dwf-slot` | T1 |
| Tint Header/Category/Footer | T2 CSS |
| Dashed columns + px/% labels | T3 |
| Design-only overlay | T2–T4 |
| Tabs unchanged | (existing HTML) |
| No Commands required | — |

## Depends / next

- **P2:** splitter drag → `ResizeColumns` + multi-click selection  
- **P3:** Toolbox ghost + drop  
- Use P0 `LayoutRegionId` / `LayoutSlotId` string format compatible with `data-dwf-slot` (`main` / `footer` / `cat:N`).
