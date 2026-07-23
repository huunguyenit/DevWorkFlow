# Phase 5 — SQL Tooling Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Form Source selection→F5/SQL tab (app/Sys), Ctrl+Click `information`→SELECT, Ctrl+Click SQL object→ALTER definition, options snippet Tab (SQL Studio + Form SQL island).

**Architecture:** Application builders (`InformationSqlBuilder`, `OptionsSnippetExpander`, `ControllerDatabaseKindResolver`, SQL island/object hit-test); UI opens `SqlDocumentViewModel` via navigator (optional auto-execute); reuse `DatabaseObjectScripter` + `object_definition.sql` for ALTER; Monaco binds Form `SelectedScript` and options expand.

**Tech Stack:** C# Application/Domain, xUnit, WPF + Monaco/WebView2, `ISqlScriptRunner`, existing SQL Studio

**Spec:** `docs/superpowers/specs/2026-07-23-editor-phase5-sql-tooling-design.md`

## Global Constraints

- UI không chứa SoT parse `information` / options (R1).
- `%l`: luôn đủ cột locale (base + `…2`); comment ghi `%l`.
- `check` chỉ comment, không vào `WHERE`.
- F5 Form: Source + non-empty selection → tab SQL + auto-execute; connection App trừ `@database="Sys"`.
- Nút SQL (có selection): mở tab, không execute.
- Không đổi `OpenSqlFromForm` khi không có selection.
- Locals `snake_case`; Left Panel freeze.
- Phase 4 out of scope.

---

## File map

| File | Role |
|------|------|
| `DevWorkFlow.Domain/Language/ControllerDatabaseKind.cs` | enum App \| Sys |
| `DevWorkFlow.Application/Language/ControllerDatabaseKindResolver.cs` | root `@database` |
| `DevWorkFlow.Application/Language/InformationSqlBuilder.cs` | information+key+check → SQL |
| `DevWorkFlow.Application/Language/OptionsSnippetExpander.cs` | options pattern → SELECT |
| `DevWorkFlow.Application/Language/SqlIslandLocator.cs` | offset ∈ command/query text? |
| `DevWorkFlow.Application/Language/SqlObjectNameAtOffset.cs` | schema.name tại offset |
| `DevWorkFlow.Application/Language/InformationAttributeHit.cs` + resolver | Ctrl+Click information |
| `IErpLanguageService` / impl | optional public wrappers |
| `UI/Services/SqlStudioNavigator.cs` | OpenBuffer + executeAfterOpen |
| `UI/ViewModels/MainViewModel.cs` | OpenSqlDocument flags |
| `UI/ViewModels/SqlDocumentViewModel.cs` | TrySelectTarget by kind; Execute after open |
| `UI/ViewModels/FormBuilderViewModel.cs` | SelectedScript, F5/SQL/selection commands, Ctrl+Click chain |
| `UI/MainWindow.xaml.cs` | F5 CanExecute Form Source+selection |
| `UI/Views/Controls/InsightEditorSurface.*` | bind SelectedScript |
| `UI/Assets/EditorHost/bridge.js` | options Tab / assist (minimal) |
| `UI/Services/DatabaseObjectScripter.cs` | called from Form VM for #16 |
| tests under `tests/DevWorkFlow.Application.Tests/Language/` | unit |

---

### Task 1: ControllerDatabaseKind

**Files:**
- Create: `DevWorkFlow.Domain/Language/ControllerDatabaseKind.cs`
- Create: `DevWorkFlow.Application/Language/ControllerDatabaseKindResolver.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/ControllerDatabaseKindResolverTests.cs`

**Produces:**

```csharp
namespace DevWorkFlow.Domain.Language;

public enum ControllerDatabaseKind
{
    App = 0,
    Sys = 1
}

public static class ControllerDatabaseKindResolver
{
    /// <summary>Đọc @database trên root dir|grid|lookup trong XML source.</summary>
    public static ControllerDatabaseKind ResolveFromXml(string source_xml);

    /// <summary>Từ semantic/document nếu đã có root element name+attrs — optional overload.</summary>
    public static ControllerDatabaseKind ResolveFromDatabaseAttribute(string? database_attribute_value);
}
```

`ResolveFromDatabaseAttribute`: null/empty/other → `App`; `Sys` OrdinalIgnoreCase → `Sys`.  
`ResolveFromXml`: tìm root element `dir|grid|lookup` (regex hoặc XDocument sanitize nhẹ giống extractor) lấy attribute `database`.

- [ ] **Step 1: Failing tests**

```csharp
[Theory]
[InlineData(null, ControllerDatabaseKind.App)]
[InlineData("", ControllerDatabaseKind.App)]
[InlineData("App", ControllerDatabaseKind.App)]
[InlineData("Sys", ControllerDatabaseKind.Sys)]
[InlineData("sys", ControllerDatabaseKind.Sys)]
public void Attribute_maps(string? value, ControllerDatabaseKind expected)
    => Assert.Equal(expected, ControllerDatabaseKindResolver.ResolveFromDatabaseAttribute(value));

[Fact]
public void Xml_grid_database_Sys()
{
    var xml = """<grid database="Sys"><commands/></grid>""";
    Assert.Equal(ControllerDatabaseKind.Sys, ControllerDatabaseKindResolver.ResolveFromXml(xml));
}
```

- [ ] **Step 2: Run — expect FAIL**

`dotnet test tests/DevWorkFlow.Application.Tests --filter ControllerDatabaseKindResolverTests`

- [ ] **Step 3: Implement + PASS + commit**

```bash
git add DevWorkFlow.Domain/Language/ControllerDatabaseKind.cs DevWorkFlow.Application/Language/ControllerDatabaseKindResolver.cs tests/DevWorkFlow.Application.Tests/Language/ControllerDatabaseKindResolverTests.cs
git commit -m "feat: resolve controller database App vs Sys"
```

---

### Task 2: InformationSqlBuilder

**Files:**
- Create: `DevWorkFlow.Application/Language/InformationSqlBuilder.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/InformationSqlBuilderTests.cs`

**Produces:**

```csharp
public sealed class InformationSqlRequest
{
    public required string Information { get; init; }
    public string? Key { get; init; }
    public string? Check { get; init; }
}

public static class InformationSqlBuilder
{
    /// <summary>null nếu information không parse được.</summary>
    public static string? Build(InformationSqlRequest request);
}
```

Algorithm đúng spec §5.4. Output example:

```sql
-- information=tk$dmtk.ten_tk%l
-- check: 1 = 1
SELECT tk, ten_tk, ten_tk2
FROM dmtk
WHERE status = '1'
```

(omit `-- check` line if Check null/whitespace; omit WHERE if Key empty)

- [ ] **Step 1: Failing tests** — `%l` 3 columns; no `%l` 2 columns; `ten_tk2%l` không thành `ten_tk22`; bad format null; key/check present

- [ ] **Step 2: Implement + PASS + commit**

```bash
git add DevWorkFlow.Application/Language/InformationSqlBuilder.cs tests/DevWorkFlow.Application.Tests/Language/InformationSqlBuilderTests.cs
git commit -m "feat: build SELECT from FBO information attribute"
```

---

### Task 3: OptionsSnippetExpander

**Files:**
- Create: `DevWorkFlow.Application/Language/OptionsSnippetExpander.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/OptionsSnippetExpanderTests.cs`

**Produces:**

```csharp
public static class OptionsSnippetExpander
{
    /// <summary>
    /// Nếu <paramref name="text"/> (một dòng hoặc trimmed selection) khớp
    /// options.name = '…' and val = '…' → SELECT *; ngược lại null.
    /// </summary>
    public static string? TryExpand(string text);
}
```

Regex (chốt):

```csharp
// IgnoreCase, ExplicitCapture
^\s*options\s*\.\s*name\s*=\s*(?<q1>['"])(?<name>.*?)\k<q1>\s+and\s+val\s*=\s*(?<q2>['"])(?<val>.*?)\k<q2>\s*$
```

Replace:

```sql
SELECT * FROM options WHERE name = '{name}' and val = '{val}'
```

Dùng đúng quote captured (`q1`/`q2`) khi emit.

- [ ] **Step 1–3: TDD + commit**

```bash
git commit -m "feat: expand options.name/val snippet to SELECT"
```

---

### Task 4: Sql island locator + object name at offset

**Files:**
- Create: `DevWorkFlow.Application/Language/SqlIslandLocator.cs`
- Create: `DevWorkFlow.Application/Language/SqlObjectNameAtOffset.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/SqlIslandAndObjectNameTests.cs`

**Produces:**

```csharp
public readonly record struct SqlIslandSpan(int StartOffset, int Length);

public static class SqlIslandLocator
{
    /// <summary>Các span nội dung text của &lt;command&gt;/&lt;query&gt; (kể cả CDATA) trên source XML.</summary>
    public static IReadOnlyList<SqlIslandSpan> FindIslands(string source_xml);
    public static bool IsInside(string source_xml, int offset);
}

public sealed record SqlObjectName(string Schema, string Name);

public static class SqlObjectNameAtOffset
{
    /// <summary>null nếu không trong island hoặc không có identifier.</summary>
    public static SqlObjectName? TryResolve(string source_xml, int offset);
}
```

Identifier: `[A-Za-z_#][\w@#$]*` optionally `schema.object` (brackets `[dbo].[name]` optional — support plain `dbo.proc` và `proc`). Default schema `dbo`.

Implement island: regex trên source cho `<command` / `<query` … `</command>` / `</query>` lấy inner text offsets (đủ Phase 5; không cần full XDocument line map nếu offset dựa trên raw source). **Test với fixture** có CDATA SQL chứa `EXEC dbo.my_proc`.

- [ ] **Step 1–3: TDD + commit**

```bash
git commit -m "feat: locate SQL islands and object names at offset"
```

---

### Task 5: Information attribute hit at offset

**Files:**
- Create: `DevWorkFlow.Application/Language/InformationAttributeAtOffset.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/InformationAttributeAtOffsetTests.cs`
- Modify: `IErpLanguageService` / `ErpLanguageService` — method optional:

```csharp
InformationSqlRequest? ResolveInformationAtOffset(ErpDocumentId id, int offset);
string? BuildInformationSqlAtOffset(ErpDocumentId id, int offset);
```

**Produces:**

```csharp
public static class InformationAttributeAtOffset
{
    /// <summary>
    /// Nếu offset nằm trong value attribute information="…" của tag mở,
    /// trả request kèm key/check trên cùng start-tag nếu có.
    /// </summary>
    public static InformationSqlRequest? TryResolve(string source_xml, int offset);
}
```

Scan: tìm `information\s*=\s*(['"])...\1` chứa offset; parse cùng start-tag cho `key=` / `check=`.

- [ ] **Step 1–3: TDD với snippet Item.xml-like + commit**

```bash
git commit -m "feat: resolve information attribute at source offset"
```

---

### Task 6: OpenSql API — preferred kind + executeAfterOpen

**Files:**
- Modify: `UI/Services/SqlStudioNavigator.cs`
- Modify: `UI/ViewModels/MainViewModel.cs` (`OpenSqlDocument`, Attach lambda)
- Modify: `UI/ViewModels/SqlDocumentViewModel.cs`

**Produces:**

Extend navigator:

```csharp
public void OpenBuffer(
    string id,
    string title,
    string text,
    string? preferred_target_id = null,
    bool execute_after_open = false,
    ControllerDatabaseKind? preferred_kind = null);
```

`MainViewModel.OpenSqlDocument` thêm params tương ứng. Sau `TrySelectTarget`:
- nếu `preferred_kind` set: chọn target Sys vs App theo `SqlConnectionTargetVm` flags/id convention hiện có (inspect `RebuildConnectionTargets` — Sys target id/name chứa "Sys").
- nếu `execute_after_open`: `ExecuteCommand.Execute(null)` (fire-and-forget async) **sau** Activate.

Thêm trên `SqlDocumentViewModel`:

```csharp
public void TrySelectTargetKind(ControllerDatabaseKind kind);
public async Task ExecuteAfterOpenAsync() // hoặc gọi ExecuteCommand
```

- [ ] **Step 1: Implement + manual compile**

`dotnet build UI/UI.csproj` (or slnx)

- [ ] **Step 2: Commit**

```bash
git commit -m "feat: SQL open buffer with target kind and auto-execute"
```

---

### Task 7: Form Source SelectedScript + F5 / nút SQL (#5)

**Files:**
- Modify: `UI/ViewModels/FormBuilderViewModel.cs` — property `SelectedScript`, commands
- Modify: `UI/Views/Controls/InsightEditorSurface.xaml` (+ code-behind if needed) — TwoWay bind Monaco `SelectedScript`
- Modify: `UI/MainWindow.xaml.cs` — `CanExecute` / `OnExecuteSql` cho Form
- Modify: ribbon/toolbar nếu có nút Thực thi / SQL (tìm `OpenSqlFromForm` / Execute bindings)

**Behavior:**

```csharp
public string SelectedScript { get; set; } // from Monaco

public bool CanExecuteSelectedSql =>
    IsSourceMode && !string.IsNullOrWhiteSpace(SelectedScript);

public void ExecuteSelectedSql() // F5
{
    var kind = ControllerDatabaseKindResolver.ResolveFromXml(XmlSource);
    var id = $"sql://selection/{Guid.NewGuid():N}";
    _sql_navigator.OpenBuffer(id, $"SQL: selection", SelectedScript.Trim(),
        preferred_target_id: null,
        execute_after_open: true,
        preferred_kind: kind);
}

public void OpenSelectedSql() // nút SQL khi có selection
{
    // same OpenBuffer execute_after_open: false
}

// OpenSqlFromForm: if CanExecuteSelectedSql → OpenSelectedSql(); else existing extract-all
```

**MainWindow F5:**

```csharp
private void CanWhenSqlDocument(...) {
  e.CanExecute = ActiveContent is SqlDocumentViewModel sql && sql can run
    || ActiveContent is FormBuilderViewModel fb && fb.CanExecuteSelectedSql;
}
private void OnExecuteSql(...) {
  if (sql) sql.ExecuteCommand...
  else if (fb) fb.ExecuteSelectedSql();
}
```

- [ ] **Step 1: Bind SelectedScript Form ← Monaco**

- [ ] **Step 2: Commands + F5 routing**

- [ ] **Step 3: Manual smoke Source selection F5 / SQL button**

- [ ] **Step 4: Commit**

```bash
git commit -m "feat: Form Source selection F5 execute and SQL tab"
```

---

### Task 8: Ctrl+Click information + SQL object (#9 #16)

**Files:**
- Modify: `UI/ViewModels/FormBuilderViewModel.cs` — `OnEntityOffsetActivated` chain
- Use: `InformationAttributeAtOffset` + `InformationSqlBuilder`
- Use: `SqlIslandLocator` + `SqlObjectNameAtOffset` + `DatabaseObjectScripter`

**Chain order (after entity / structural / js-runtime miss, or before js if attribute hit clearer):**

1. `TryResolve information` → Build SQL → `OpenBuffer(..., execute: false)`
2. Else if inside SQL island → object name →  
   `await scripter.BuildAsync(cs, schema, name, Procedure, click:1)` then Function if null/empty → OpenBuffer ALTER text  
3. Else existing chain

FormBuilder needs access to `DatabaseObjectScripter` + connection string for kind — inject via ctor **or** resolve from `IProgramSession` + existing helpers like DatabaseExplorer (prefer inject scripter + session already partially available). Check ctor: hôm nay có `program_session`, `sql_navigator`. Add optional `DatabaseObjectScripter` + connection resolve helper.

Connection string: mirror `SqlDocumentViewModel` target pick for App/Sys.

- [ ] **Step 1: Wire information click (no DB)**

- [ ] **Step 2: Wire ALTER object (needs Program+DB)**

- [ ] **Step 3: Commit**

```bash
git commit -m "feat: Ctrl+Click information and SQL object to SQL Studio"
```

---

### Task 9: Options snippet UI (#17)

**Files:**
- Modify: SQL Studio path — AvalonEdit/`BindableSqlEditor` Tab handler **or** Monaco if SQL uses Monaco
- Modify: Form Source `bridge.js` — khi Tab và selection/line match, post host → expand → replace

**Chốt theo editor thật:**
- SQL Studio page hiện `BindableSqlEditor` (AvalonEdit): PreviewKeyDown Tab → `OptionsSnippetExpander.TryExpand(SelectedScript or current line)` → replace.
- Form Source Monaco: bridge Tab key → event `optionsSnippetRequested` { offset, lineText } → host expand → command `replaceRange`.

Không hard-code SQL string trong JS — chỉ forward text.

- [ ] **Step 1: SQL Studio Tab expand**

- [ ] **Step 2: Form Source SQL island Tab expand** (gate: `SqlIslandLocator.IsInside`)

- [ ] **Step 3: Manual both contexts + commit**

```bash
git commit -m "feat: options.name snippet expand on Tab"
```

---

### Task 10: Docs + verification

**Files:**
- Modify: `docs/superpowers/specs/2026-07-23-editor-phase5-sql-tooling-design.md` — Status: Ready for implementation / Done when checkboxes
- Modify: `docs/superpowers/specs/2026-07-22-editor-ux-roadmap-design.md` — link plan

- [ ] **Step 1:** `dotnet test tests/DevWorkFlow.Application.Tests --filter "FullyQualifiedName~InformationSql|OptionsSnippet|ControllerDatabase|SqlIsland|InformationAttribute"`

- [ ] **Step 2:** `dotnet build DevWorkFlow.slnx`

- [ ] **Step 3: Commit docs**

```bash
git commit -m "docs: Phase 5 plan linked; mark implementation handoff"
```

---

## Self-review (plan vs spec)

| Spec | Task |
|------|------|
| #5 F5 + SQL button + App/Sys | 1, 6, 7 |
| #9 information SELECT + `%l` | 2, 5, 8 |
| #16 ALTER via DB | 4, 6, 8 |
| #17 options both contexts | 3, 9 |
| No UI SoT parse | builders in Application |
| OpenSqlFromForm no-selection unchanged | 7 only branch when selection |
| Tests + build | 10 |

---

## Execution handoff

Plan saved to `docs/superpowers/plans/2026-07-23-editor-phase5-sql-tooling.md`.
