# Design View Layout, FormTable & Ruler Crosshair Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Align Design HTML layout with FBO runtime (`view@height` on non-grid tabs, `field@rows` on grid body, FormTable width/padding) and pin PixelRuler + WebView crosshair origin to the main `FormTable`.

**Architecture:** Application builders own layout HTML (`DesignFormHtmlBuilder` height/width/padding; embed `DwfGridBody` height from Dir field `Rows`). UI `DesignWebViewHost` injects a document script that measures main-table origin, posts `designViewport` to WPF for ruler offset `(scroll − origin) × zoom`, and draws crosshair + px readout inside the WebView.

**Tech Stack:** .NET 10, C#, WPF, WebView2, xUnit, existing Design HTML pipeline.

## Global Constraints

- Spec: `docs/superpowers/specs/2026-07-22-design-view-layout-ruler-design.md`
- Parent Design architecture: `docs/superpowers/specs/2026-07-22-design-webview-html-generator-design.md`
- UI never parses XML; Application never references WebView2/WPF
- Local vars / parameters / temps: `snake_case`
- No Left Panel visual/layout changes
- Do not commit unless the user explicitly asks; end each task with tests green + short checkpoint note
- Preserve unrelated uncommitted user work; no `git reset` / `git clean` / destructive checkout

---

## File map

| File | Responsibility |
|------|----------------|
| `DevWorkFlow.Application/Design/DesignFormHtmlBuilder.cs` | Main no height; tab height vs grid detect; FormTable width+padding; wrap Grid embed in `DwfGridBody` |
| `DevWorkFlow.Application/Design/Assets/fbo-design-minimal.css` | Optional `.FormTable { box-sizing }` / `.DwfGridBody` overflow defaults |
| `UI/Views/Design/DesignWebViewHost.xaml.cs` | Replace scroll-only script; handle `designViewport`; set ruler Offset |
| `UI/Views/Controls/PixelRuler.cs` | Update doc comment (origin = main table via Offset formula) |
| `tests/.../DesignFormHtmlBuilderTests.cs` | Update + add layout assertions |
| `tests/.../DesignFormGridBodyHeightTests.cs` (or extend existing) | `rows` → `DwfGridBody` height |

---

### Task 1: FormTable width + padding; move height off main onto non-grid tabs

**Files:**
- Modify: `DevWorkFlow.Application/Design/DesignFormHtmlBuilder.cs`
- Modify: `tests/DevWorkFlow.Application.Tests/Design/DesignFormHtmlBuilderTests.cs`
- Test: same test project

**Interfaces:**
- Consumes: existing `FormViewLayout.HeightPx`, `ColumnWidths`, `FormCategory.Rows`, `FboFormModel.FindField`
- Produces: HTML where main has no `height:{HeightPx}`, non-grid `DwfTabPanel` has it, each `FormTable` has `width:{sum}px;table-layout:fixed;padding:8px` when `widths.Count > 0`

- [ ] **Step 1: Write the failing tests**

Update `Build_RendersMainTableWidthsSpansAndLabels` — remove assertion that main has `style="height:274px"`. Add:

```csharp
[Fact]
public void Build_AppliesViewHeightToNonGridTabPanel_NotMain()
{
    var html = BuildHtml(CustomerDir);

    Assert.DoesNotContain("data-dwf-region=\"main\" style=\"height:274px\"", html);
    Assert.DoesNotContain("data-dwf-region=\"main\"style=\"height:274px\"", html);
    // Tab panel for category 1 (doi_tac is not Grid-style)
    Assert.Contains("data-category-index=\"1\"", html);
    Assert.Contains("height:274px", html);
    Assert.Matches(
        @"DwfTabPanel[^>]*style=""[^""]*height:274px",
        html);
}

[Fact]
public void Build_FormTableHasSumWidthTableLayoutAndPadding()
{
    var html = BuildHtml(CustomerDir);
    // 120+30+45+25 = 220
    Assert.Contains(
        "class=\"FormTable\" style=\"width:220px;table-layout:fixed;padding:8px\"",
        html);
}
```

- [ ] **Step 2: Run tests to verify they fail**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~DesignFormHtmlBuilderTests"
```

Expected: FAIL — height still on main; FormTable lacks width/padding style.

- [ ] **Step 3: Implement `RenderTable` width/padding + tab/main height logic**

In `DesignFormHtmlBuilder.Build`:

1. Main region: remove `main_height` / do **not** set `layout.HeightPx` on main.
2. When emitting each `DwfTabPanel`, compute `has_grid = CategoryHasGrid(cat, form)`. If `!has_grid && layout.HeightPx is > 0`, append ` style="height:{h}px"` on the `<section>`.
3. `CategoryHasGrid`: any cell in `cat.Rows` with `Kind == Input`, field found, `ItemsStyle` equals `"Grid"` (ordinal ignore case).

In `RenderTable`:

```csharp
private string RenderTable(
    IReadOnlyList<FormViewRow> rows,
    IReadOnlyList<int> widths,
    RenderContext ctx)
{
    if (rows.Count == 0) return string.Empty;

    var sb = new StringBuilder();
    if (widths.Count > 0)
    {
        var sum = widths.Sum();
        sb.Append($"<table class=\"FormTable\" style=\"width:{sum}px;table-layout:fixed;padding:8px\">\n");
    }
    else
    {
        sb.Append("<table class=\"FormTable\">\n");
    }
    // ... existing DwfColRow + rows ...
}
```

Add `using System.Linq;` if missing.

Helper:

```csharp
private static bool CategoryHasGrid(FormCategory cat, FboFormModel form)
{
    foreach (var row in cat.Rows)
    foreach (var cell in row.Cells)
    {
        if (cell.Kind != FormViewCellKind.Input || cell.FieldName is null) continue;
        var field = form.FindField(cell.FieldName);
        if (field is not null
            && string.Equals(field.ItemsStyle, "Grid", StringComparison.OrdinalIgnoreCase))
            return true;
    }
    return false;
}
```

- [ ] **Step 4: Run tests — expect PASS**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~DesignFormHtmlBuilderTests"
```

- [ ] **Step 5: Checkpoint**

Note: Task 1 done — FormTable width/padding; height on non-grid tabs only. No commit unless user asks.

---

### Task 2: Grid tab — `field@rows` → `DwfGridBody` height

**Files:**
- Modify: `DevWorkFlow.Application/Design/DesignFormHtmlBuilder.cs` (`RenderInputCell`)
- Create or modify: `tests/DevWorkFlow.Application.Tests/Design/DesignFormHtmlBuilderTests.cs` (add facts)

**Interfaces:**
- Consumes: `FboField.Rows`, `FboField.ItemsStyle`, detail HTML map
- Produces: when embedding Grid-style field, wrap detail in `<div class="DwfGridBody" style="height:{Rows}px;overflow:auto">` when `Rows > 0`; tab with Grid must **not** get `view@height` on panel

- [ ] **Step 1: Write failing tests**

```csharp
private const string DirWithGridTab = """
    <dir xmlns="urn:schemas-fast-com:data-dir">
      <title v="T" e="T"/>
      <fields>
        <field name="ma"><header v="Mã" e="Code"/></field>
        <field name="d_grid" categoryIndex="1" rows="120">
          <header v="Lưới" e="Grid"/>
          <items style="Grid" controller="DetailX"/>
        </field>
      </fields>
      <views>
        <view id="Dir" height="274">
          <item value="100,100"/>
          <item value="10: [ma].Label"/>
          <item value="10: [d_grid]"/>
          <categories>
            <category index="1" columns="200">
              <header v="Chi tiết" e="Detail"/>
            </category>
          </categories>
        </view>
      </views>
    </dir>
    """;

[Fact]
public void Build_GridTab_UsesFieldRowsOnDwfGridBody_NotViewHeightOnPanel()
{
    var document = new FboXmlParser().Parse(DirWithGridTab, "T.xml");
    var detail_html = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
    {
        ["DetailX"] = "<table class=\"GridTable DwfDetailGrid\"></table>"
    };
    var html = new DesignFormHtmlBuilder().Build(
        document.Form!, true, new FboOptionsCatalog(),
        new Dictionary<string, DesignElementIdentity>(), detail_html);

    Assert.Contains("class=\"DwfGridBody\"", html);
    Assert.Contains("height:120px", html);
    Assert.DoesNotContain("data-category-index=\"1\" style=\"height:274px\"", html);
    Assert.DoesNotMatch(@"data-category-index=\"1\"[^>]*height:274px", html);
}
```

Confirm `FboXmlParser` maps `rows` and `items style="Grid" controller=…` — if XML shape differs, match existing field fixtures in the repo (`items` child element). Grep `ItemsStyle` / `rows=` in tests first and mirror that XML.

- [ ] **Step 2: Run test — expect FAIL**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~Build_GridTab_UsesFieldRows"
```

- [ ] **Step 3: Wrap Grid embed in `DwfGridBody`**

In `RenderInputCell` for Grid style:

```csharp
if (string.Equals(field.ItemsStyle, "Grid", StringComparison.OrdinalIgnoreCase))
{
    var controller = field.ItemsController ?? string.Empty;
    var detail = ctx.DetailHtml.TryGetValue(controller, out var html)
        ? html
        : $"<div class=\"DwfDesignWarning\">Không tìm thấy Grid Detail: {DesignHtmlEncoder.Text(controller)}</div>";

    var body_style = field.Rows is > 0
        ? $" style=\"height:{field.Rows.Value}px;overflow:auto\""
        : " style=\"overflow:auto\"";
    detail = $"<div class=\"DwfGridBody\"{body_style}>{detail}</div>";

    return $"<td class=\"FormCell{required}\" colspan=\"{span}\">{detail}</td>";
}
```

Ensure Task 1 `CategoryHasGrid` already skips `view@height` on this tab.

Optional minimal CSS in `fbo-design-minimal.css`:

```css
.DwfGridBody { box-sizing: border-box; width: 100%; }
```

- [ ] **Step 4: Run Design Form tests — expect PASS**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~DesignFormHtmlBuilderTests"
```

- [ ] **Step 5: Checkpoint** — Task 2 done.

---

### Task 3: WebView bridge — main-table origin → PixelRuler Offset

**Files:**
- Modify: `UI/Views/Design/DesignWebViewHost.xaml.cs`
- Modify: `UI/Views/Controls/PixelRuler.cs` (comment only: origin via Offset)

**Interfaces:**
- Consumes: WebView2 `postMessage` JSON
- Produces: message shape `{ "type":"designViewport", "scrollX":number, "scrollY":number, "originX":number, "originY":number }`; `RulerX.Offset = (scrollX - originX) * zoom`, same for Y

- [ ] **Step 1: Replace `ScrollTrackingScript` with viewport + origin script**

```csharp
private const string DesignViewportScript = """
    (function () {
      function mainTable() {
        return document.querySelector('[data-dwf-region="main"] table.FormTable');
      }
      function originOf(el) {
        if (!el) return { x: 0, y: 0 };
        var r = el.getBoundingClientRect();
        return { x: r.left + window.scrollX, y: r.top + window.scrollY };
      }
      function post() {
        var o = originOf(mainTable());
        if (window.chrome && window.chrome.webview) {
          window.chrome.webview.postMessage(JSON.stringify({
            type: 'designViewport',
            scrollX: window.scrollX,
            scrollY: window.scrollY,
            originX: o.x,
            originY: o.y
          }));
        }
      }
      window.addEventListener('scroll', post, { passive: true });
      window.addEventListener('resize', post, { passive: true });
      document.addEventListener('DOMContentLoaded', post);
      document.addEventListener('click', function (e) {
        if (e.target && e.target.closest && e.target.closest('.DwfTabButton'))
          setTimeout(post, 0);
      }, true);
      setTimeout(post, 0);
    })();
    """;
```

Register via `AddScriptToExecuteOnDocumentCreatedAsync(DesignViewportScript)` (replace old scroll script).

- [ ] **Step 2: Update `OnWebMessageReceived`**

```csharp
if (root.TryGetProperty("type", out var type_prop)
    && type_prop.GetString() is { } msg_type
    && !string.Equals(msg_type, "designViewport", StringComparison.Ordinal))
    return;

if (!root.TryGetProperty("scrollX", out var sx)
    || !root.TryGetProperty("scrollY", out var sy)
    || !root.TryGetProperty("originX", out var ox)
    || !root.TryGetProperty("originY", out var oy))
{
    // backward compat: old {x,y} scroll-only
    if (root.TryGetProperty("x", out var x_prop) && root.TryGetProperty("y", out var y_prop))
    {
        var z0 = DesignWebView.ZoomFactor <= 0.01 ? 1.0 : DesignWebView.ZoomFactor;
        Dispatcher.Invoke(() =>
        {
            RulerX.Offset = x_prop.GetDouble() * z0;
            RulerY.Offset = y_prop.GetDouble() * z0;
        });
    }
    return;
}

var zoom = DesignWebView.ZoomFactor <= 0.01 ? 1.0 : DesignWebView.ZoomFactor;
Dispatcher.Invoke(() =>
{
    RulerX.Offset = (sx.GetDouble() - ox.GetDouble()) * zoom;
    RulerY.Offset = (sy.GetDouble() - oy.GetDouble()) * zoom;
});
```

Update `PixelRuler` class summary: Offset encodes `(scroll − mainTableOrigin) × zoom` so tick 0 aligns with main `FormTable`.

- [ ] **Step 3: Manual check**

Build UI project:

```powershell
dotnet build UI/UI.csproj
```

Expected: compile OK. Manual: open Design on a Dir with main table — ruler `0` near table left/top (after 8px padding edge of table box).

- [ ] **Step 4: Checkpoint** — Task 3 done.

---

### Task 4: Crosshair + px readout in WebView

**Files:**
- Modify: `UI/Views/Design/DesignWebViewHost.xaml.cs` (extend injected script or add second script)

**Interfaces:**
- Same host; no new WPF controls required
- Crosshair lives entirely in document; does not post every mousemove to WPF

- [ ] **Step 1: Append crosshair script** (same `AddScriptToExecuteOnDocumentCreatedAsync` string or concatenate)

Behavior:

1. Inject once into `document.documentElement`:
   - `#dwf-crosshair-x` horizontal line, `#dwf-crosshair-y` vertical line
   - `#dwf-crosshair-label` showing `x, y`
   - CSS: `position:fixed; pointer-events:none; z-index:2147483647;` lines 1px; label small monospace near cursor offset
2. On `mousemove`: set line positions from `clientX/clientY`; compute document coords `clientX+scrollX`, `clientY+scrollY`; subtract cached `originX/Y` from Task 3’s `post()` (store on `window.__dwfOrigin`); show label `Math.round(x) + ', ' + Math.round(y)`
3. On `mouseleave` of `document.documentElement`: hide overlay
4. Keep `post()` origin updates on scroll/resize/tab

Sketch (embed in script):

```javascript
var origin = { x: 0, y: 0 };
function ensureOverlay() {
  if (document.getElementById('dwf-crosshair-x')) return;
  var css = document.createElement('style');
  css.textContent = [
    '#dwf-crosshair-x,#dwf-crosshair-y{position:fixed;pointer-events:none;z-index:2147483647;background:#c62828;opacity:.85;}',
    '#dwf-crosshair-x{left:0;right:0;height:1px;}',
    '#dwf-crosshair-y{top:0;bottom:0;width:1px;}',
    '#dwf-crosshair-label{position:fixed;pointer-events:none;z-index:2147483647;background:rgba(255,255,255,.9);border:1px solid #c62828;color:#202020;font:11px Consolas,monospace;padding:1px 4px;}'
  ].join('');
  document.documentElement.appendChild(css);
  ['dwf-crosshair-x','dwf-crosshair-y','dwf-crosshair-label'].forEach(function (id) {
    var el = document.createElement('div');
    el.id = id;
    el.style.display = 'none';
    document.documentElement.appendChild(el);
  });
}
function onMove(e) {
  ensureOverlay();
  var hx = document.getElementById('dwf-crosshair-x');
  var hy = document.getElementById('dwf-crosshair-y');
  var lab = document.getElementById('dwf-crosshair-label');
  hx.style.display = hy.style.display = lab.style.display = 'block';
  hx.style.top = e.clientY + 'px';
  hy.style.left = e.clientX + 'px';
  var x = e.clientX + window.scrollX - origin.x;
  var y = e.clientY + window.scrollY - origin.y;
  lab.style.left = (e.clientX + 12) + 'px';
  lab.style.top = (e.clientY + 12) + 'px';
  lab.textContent = Math.round(x) + ', ' + Math.round(y);
}
```

Wire `origin` update inside `post()` before `postMessage`.

- [ ] **Step 2: Build**

```powershell
dotnet build UI/UI.csproj
```

Expected: OK.

- [ ] **Step 3: Manual acceptance**

1. Dir with tabs, no Grid: tab panel height = `view@height`; main auto; FormTable width+padding.
2. Tab with Grid + `rows`: `DwfGridBody` height; panel without view height.
3. Move mouse in Design: two intersecting lines + `x, y` px relative to main table; ruler 0 at main table edge.

- [ ] **Step 4: Checkpoint** — Task 4 done; all acceptance criteria in spec §7.

---

### Task 5: Spec status + CURRENT_STATE note

**Files:**
- Modify: `docs/superpowers/specs/2026-07-22-design-view-layout-ruler-design.md` — Status → Implemented
- Modify: `.ai/CURRENT_STATE.md` — one bullet under Design: height/tabs/FormTable/ruler/crosshair

- [ ] **Step 1: Edit docs** (no code)
- [ ] **Step 2: Run full Design test filter once**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~Design"
```

Expected: all PASS.

- [ ] **Step 3: Checkpoint** — plan complete; commit only if user asks.

---

## Spec coverage checklist

| Spec § | Task |
|--------|------|
| 3.1 Main/footer no height | 1 |
| 3.2 Non-grid tab height | 1 |
| 3.3 Grid tab + rows on body | 2 |
| 3.4 FormTable width + padding 8px | 1 |
| 3.5 No categories → height unused | 1 (main never gets height) |
| 4.1–4.2 Origin + PixelRuler | 3 |
| 4.3–4.4 Crosshair + bridge | 3–4 |
| Acceptance §7 | 2–4 manual + tests |

## Self-review notes

- No placeholders left; Grid `rows` applied at embed time (Dir field), not via `DesignGridHtmlBuilder` API — avoids threading Rows through `DetailDocuments`.
- `CategoryHasGrid` must run before applying tab height (Task 1 + 2).
- Existing test asserting `height:274px` on main **must** be updated in Task 1 or CI stays red.
- Ruler Offset formula `(scroll − origin) × zoom` matches current tick math `x = page_px * zoom − Offset` with `page_px` relative to table origin.
