# Design WebView HTML Generator Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Thay Design tab đang phụ thuộc skin capture bằng pipeline XML Semantic/Layout → HTML cố định, render Dir, Grid danh sách và Grid Detail trong WebView2 với asset tĩnh lấy từ Program.

**Architecture:** Language Service tiếp tục là cổng duy nhất parse XML. Application bổ sung model/parser metadata, contracts Design, HTML builders và orchestration service; Infrastructure resolve menu → main aspx → MasterPage → static assets; UI chỉ bind active `FormBuilderViewModel`, cấu hình WebView2 và render `DesignDocument`. Skin acquisition vẫn tồn tại cho AI/tooling nhưng không tham gia runtime của Design tab.

**Tech Stack:** .NET 10, C#, WPF, WebView2, xUnit, existing ERP Language Service, `System.Xml.Linq`, existing manual DI composition root.

## Global Constraints

- Tuân thủ `CLAUDE.md`, `.ai/ARCHITECTURE_SUMMARY.md` và spec `docs/superpowers/specs/2026-07-22-design-webview-html-generator-design.md`.
- UI không parse XML, không query database; chỉ Language Service được mở/parse controller XML.
- Serializer là đường duy nhất ghi XML; implementation này chỉ đọc model và sinh HTML.
- DOM identity dùng `SymbolId` / `NodeId`, không dùng line offset.
- WebView2 chỉ nằm ở UI; Application/Domain không reference WebView2 hoặc WPF.
- Local variables, parameters và biến tạm mới dùng `snake_case`; giữ nguyên API/property có sẵn.
- Không thay visual/layout Left Panel.
- Không dùng captured `shell.html`, `HasSkin`, `SkinDirectory` hoặc `IProjectSkinService` để quyết định Design có render được hay không.
- Không load hoặc materialize `.axd`; Design chỉ dùng static Program assets và CSS tối thiểu do IDE sở hữu.
- Placeholder rows của Grid cố định là `5` trong MVP.
- Giữ nguyên mọi thay đổi chưa commit của người dùng; không chạy `git reset`, `git clean`, `git checkout --`.
- Không tạo commit trừ khi người dùng yêu cầu rõ ràng. Sau mỗi task chỉ ghi checkpoint và chạy test.

---

## File map

### Domain / parser source of truth

- Modify `DevWorkFlow.Domain/Models/Fbo/FboControllerDocument.cs`: giữ CSS controller đã resolve.
- Modify `DevWorkFlow.Domain/Models/Fbo/FboGridModel.cs`: giữ `grid/@type`, expose `IsDetail`.
- Modify `DevWorkFlow.Application/Engine/FboXmlParser.cs`: chọn đúng view id, parse CSS/type.
- Modify `DevWorkFlow.Application/Language/ErpSemanticBinder.cs`: dựng LegacyDocument từ ClearText đã expand entity.

### Application Design module

- Create `DevWorkFlow.Application/Design/DesignContracts.cs`: DTOs và interfaces.
- Create `DevWorkFlow.Application/Design/DesignHtmlEncoder.cs`: escape text/attribute an toàn.
- Create `DevWorkFlow.Application/Design/DesignControlHtmlBuilder.cs`: map field/items → control.
- Create `DevWorkFlow.Application/Design/DesignFormHtmlBuilder.cs`: rows/categories/tabs.
- Create `DevWorkFlow.Application/Design/DesignGridHtmlBuilder.cs`: list/detail grid.
- Create `DevWorkFlow.Application/Design/DesignHtmlGenerator.cs`: full HTML shell.
- Create `DevWorkFlow.Application/Design/DesignDocumentService.cs`: options/assets/detail orchestration qua LS.
- Create `DevWorkFlow.Application/Design/Assets/fbo-design-minimal.css`: CSS Form/Grid đóng góp dần.
- Modify `DevWorkFlow.Application/DevWorkFlow.Application.csproj`: embed CSS.

### Infrastructure Design module

- Create `DevWorkFlow.Infrastructure/Design/DesignAssetResolver.cs`: controller → menu/main → master.
- Create `DevWorkFlow.Infrastructure/Design/AspxMasterPageParser.cs`: parse directives/static attributes.
- Modify `DevWorkFlow.Infrastructure/Services/AspxControllerParser.cs`: expose master-page parsing helper only if needed by resolver.

### UI Design module

- Create `UI/Views/Design/DesignWebViewHost.xaml`.
- Create `UI/Views/Design/DesignWebViewHost.xaml.cs`.
- Modify `UI/ViewModels/FormBuilderViewModel.cs`: generated document state + refresh lifecycle.
- Modify `UI/Views/Pages/FormBuilderPage.xaml`: use Design host, update copy/namespace.
- Modify `UI/App.xaml.cs`: compose Design services and inject each FormBuilder VM.
- Delete `UI/Views/Skin/SkinDesignerView.xaml` and `.xaml.cs` only after the new host is wired and no references remain.

### Tests

- Create `tests/DevWorkFlow.Application.Tests/Design/FboXmlDesignMetadataTests.cs`.
- Create `tests/DevWorkFlow.Application.Tests/Design/DesignControlHtmlBuilderTests.cs`.
- Create `tests/DevWorkFlow.Application.Tests/Design/DesignFormHtmlBuilderTests.cs`.
- Create `tests/DevWorkFlow.Application.Tests/Design/DesignGridHtmlBuilderTests.cs`.
- Create `tests/DevWorkFlow.Application.Tests/Design/DesignHtmlGeneratorTests.cs`.
- Create `tests/DevWorkFlow.Application.Tests/Design/DesignDocumentServiceTests.cs`.
- Create `tests/DevWorkFlow.Application.Tests/Design/DesignAssetResolverTests.cs`.

---

### Task 1: Enrich parsed FBO models for Design

**Files:**
- Modify: `DevWorkFlow.Domain/Models/Fbo/FboControllerDocument.cs`
- Modify: `DevWorkFlow.Domain/Models/Fbo/FboGridModel.cs`
- Modify: `DevWorkFlow.Application/Engine/FboXmlParser.cs`
- Modify: `DevWorkFlow.Application/Language/ErpSemanticBinder.cs`
- Test: `tests/DevWorkFlow.Application.Tests/Design/FboXmlDesignMetadataTests.cs`

**Interfaces:**
- Produces: `FboControllerDocument.CssText`
- Produces: `FboGridModel.AppType`, `FboGridModel.IsDetail`
- Guarantees: Form parser selects `view id="Dir"`; Grid parser selects `view id="Grid"` case-insensitively.

- [ ] **Step 1: Write failing parser tests**

```csharp
using DevWorkFlow.Application.Engine;

namespace DevWorkFlow.Application.Tests.Design;

public sealed class FboXmlDesignMetadataTests
{
    private readonly FboXmlParser _parser = new();

    [Fact]
    public void ParseDir_UsesDirViewAndReadsControllerCss()
    {
        const string xml = """
            <dir xmlns="urn:schemas-fast-com:data-dir">
              <title v="Mẫu" e="Sample"/>
              <fields>
                <field name="ma_kh"><header v="Mã khách" e="Customer"/></field>
              </fields>
              <views>
                <view id="Form"><item value="20"/><item value="1: [ma_kh]"/></view>
                <view id="Dir" height="274"><item value="120, 30"/><item value="10: [ma_kh]"/></view>
              </views>
              <css><text><![CDATA[.LabelDescription{color:#73A6DE;}]]></text></css>
            </dir>
            """;

        var document = _parser.Parse(xml, "Customer.xml");

        Assert.Equal("Dir", document.Form!.Layout!.ViewId);
        Assert.Equal(274, document.Form.Layout.HeightPx);
        Assert.Contains(".LabelDescription", document.CssText);
    }

    [Fact]
    public void ParseGrid_UsesGridViewAndReadsDetailType()
    {
        const string xml = """
            <grid type="Detail" xmlns="urn:schemas-fast-com:data-grid">
              <title v="Chi tiết" e="Detail"/>
              <fields>
                <field name="ma_dvcs" width="90"><header v="Đơn vị" e="Unit"/></field>
                <field name="ma_kh" width="100"><header v="Khách" e="Customer"/></field>
              </fields>
              <views>
                <view id="Other"><field name="ma_kh"/></view>
                <view id="Grid"><field name="ma_dvcs"/></view>
              </views>
            </grid>
            """;

        var document = _parser.Parse(xml, "CustomerUnitDetail.xml");

        Assert.True(document.Grid!.IsDetail);
        Assert.Equal(["ma_dvcs"], document.Grid.VisibleFieldNames);
    }

    [Fact]
    public void SemanticBinder_LegacyDocumentUsesExpandedExternalEntity()
    {
        using var fixture = ExternalEntityFixture.Create(
            controller_xml: """
                <!DOCTYPE dir [<!ENTITY Extra SYSTEM "Extra.ent">]>
                <dir xmlns="urn:schemas-fast-com:data-dir">
                  <title v="Mẫu" e="Sample"/>
                  <fields>&Extra;</fields>
                  <views><view id="Dir"><item value="100"/><item value="1: [ma_kh]"/></view></views>
                </dir>
                """,
            entity_name: "Extra.ent",
            entity_text: """<field name="ma_kh"><header v="Mã khách" e="Customer"/></field>""");

        var service = new ErpLanguageService();
        var document = service.OpenDocument(fixture.ControllerPath);
        var legacy = Assert.IsType<ErpSemanticModel>(document.SemanticModel).LegacyDocument;

        Assert.NotNull(legacy);
        Assert.NotNull(legacy.Form!.FindField("ma_kh"));
    }
}
```

Define this helper inside the test file:

```csharp
private sealed class ExternalEntityFixture : IDisposable
{
    private readonly string _directory;
    public string ControllerPath { get; }

    private ExternalEntityFixture(string directory, string controller_path)
    {
        _directory = directory;
        ControllerPath = controller_path;
    }

    public static ExternalEntityFixture Create(
        string controller_xml,
        string entity_name,
        string entity_text)
    {
        var directory = Path.Combine(
            Path.GetTempPath(), $"dwf-design-{Guid.NewGuid():N}");
        Directory.CreateDirectory(directory);
        var controller_path = Path.Combine(directory, "Customer.xml");
        File.WriteAllText(controller_path, controller_xml);
        File.WriteAllText(Path.Combine(directory, entity_name), entity_text);
        return new ExternalEntityFixture(directory, controller_path);
    }

    public void Dispose() =>
        Directory.Delete(_directory, recursive: true);
}
```

- [ ] **Step 2: Run tests and verify RED**

Run:

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~FboXmlDesignMetadataTests
```

Expected: compile/test failure because `CssText`, `AppType` and `IsDetail` do not exist and parser still selects the first view.

- [ ] **Step 3: Add model properties**

Add to `FboControllerDocument`:

```csharp
/// <summary>CSS optional trong controller, đã lấy từ css/text.</summary>
public string CssText { get; set; } = string.Empty;
```

Add to `FboGridModel`:

```csharp
/// <summary>Grid.xsd grid/@type, ví dụ Detail.</summary>
public string? AppType { get; set; }

public bool IsDetail =>
    string.Equals(AppType, "Detail", StringComparison.OrdinalIgnoreCase);
```

- [ ] **Step 4: Parse metadata and explicit view ids**

In `FboXmlParser.Parse`, assign `CssText` after constructing the document:

```csharp
var document = local switch
{
    "dir" => FboControllerDocument.FromForm(ParseForm(root, ControllerFolderKind.Dir, controller_name), file_path ?? "", xml),
    "filter" => FboControllerDocument.FromForm(ParseForm(root, ControllerFolderKind.Filter, controller_name), file_path ?? "", xml),
    "grid" => FboControllerDocument.FromGrid(ParseGrid(root, controller_name), file_path ?? "", xml),
    "lookup" => FboControllerDocument.FromLookup(ParseLookup(root, controller_name), file_path ?? "", xml),
    _ => throw new InvalidOperationException($"Root XML không hỗ trợ: <{local}>.")
};
document.CssText = FindChild(FindChild(root, "css"), "text")?.Value ?? string.Empty;
return document;
```

Change Form view selection:

```csharp
var views = views_el.Elements()
    .Where(e => e.Name.LocalName.Equals("view", StringComparison.OrdinalIgnoreCase))
    .ToList();
var view = views.FirstOrDefault(e =>
        Attr(e, "id").Equals("Dir", StringComparison.OrdinalIgnoreCase))
    ?? views.FirstOrDefault();
```

Change Grid model initialization and selection:

```csharp
AppType = NullIfEmpty(Attr(root, "type")),
```

```csharp
var view_candidates = views?.Elements()
    .Where(e => e.Name.LocalName.Equals("view", StringComparison.OrdinalIgnoreCase))
    .ToList();
var view = view_candidates?.FirstOrDefault(e =>
        Attr(e, "id").Equals("Grid", StringComparison.OrdinalIgnoreCase))
    ?? view_candidates?.FirstOrDefault();
```

- [ ] **Step 5: Build LegacyDocument from expanded ClearText**

In `ErpSemanticBinder.Bind`, replace the raw-only parser input:

```csharp
var parse_text = string.IsNullOrWhiteSpace(entity_result?.ClearText)
    ? raw_text
    : entity_result.ClearText;
legacy = _parser.Parse(parse_text, path);
```

Keep syntax enrichment and source locations based on the original syntax tree; only the transitional `LegacyDocument` consumes expanded text. This is required for fields/layout/CSS contributed through entities.

- [ ] **Step 6: Run focused and parser regression tests**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter "FullyQualifiedName~FboXmlDesignMetadataTests|FullyQualifiedName~Sp226GoldenTests"
```

Expected: PASS.

---

### Task 2: Define Design contracts, identities and embedded stylesheet

**Files:**
- Create: `DevWorkFlow.Application/Design/DesignContracts.cs`
- Create: `DevWorkFlow.Application/Design/DesignHtmlEncoder.cs`
- Create: `DevWorkFlow.Application/Design/Assets/fbo-design-minimal.css`
- Modify: `DevWorkFlow.Application/DevWorkFlow.Application.csproj`
- Test: `tests/DevWorkFlow.Application.Tests/Design/DesignHtmlGeneratorTests.cs`

**Interfaces:**
- Produces:

```csharp
public interface IDesignHtmlGenerator
{
    DesignDocument Generate(DesignRenderRequest request);
}

public interface IDesignAssetResolver
{
    Task<DesignAssetSet> ResolveAsync(
        ProgramContext program,
        string controller_name,
        CancellationToken ct = default);
}

public interface IDesignDocumentService
{
    Task<DesignDocument> BuildAsync(
        DesignBuildRequest request,
        CancellationToken ct = default);
}
```

- [ ] **Step 1: Write failing contract/shell test**

```csharp
[Fact]
public void Generator_EmitsUtf8DocumentAndStaticAssets()
{
    var request = DesignTestData.CreateGridRequest(
        assets: new DesignAssetSet(
            "Main/arkh.aspx",
            "Main/MasterPage.master",
            ["Css/Menu.css"],
            ["ClientScript/j8.js"],
            []));

    var html = new DesignHtmlGenerator().Generate(request).Html;

    Assert.Contains("<meta charset=\"utf-8\">", html);
    Assert.Contains("https://devworkflow.program/Css/Menu.css", html);
    Assert.Contains("https://devworkflow.program/ClientScript/j8.js", html);
}
```

Initially keep `DesignTestData` local to the test file; extract it only when Task 3/4 share it.

- [ ] **Step 2: Run and verify RED**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DesignHtmlGeneratorTests
```

Expected: compile failure because Design contracts/generator do not exist.

- [ ] **Step 3: Add contracts**

Create `DesignContracts.cs`:

```csharp
using DevWorkFlow.Domain.Models;
using DevWorkFlow.Domain.Models.Fbo;

namespace DevWorkFlow.Application.Design;

public sealed record DesignElementIdentity(string SymbolId, string? NodeId);

public sealed record DesignAssetSet(
    string? MainRelativePath,
    string? MasterRelativePath,
    IReadOnlyList<string> Stylesheets,
    IReadOnlyList<string> Scripts,
    IReadOnlyList<string> Images)
{
    public static DesignAssetSet Empty { get; } = new(null, null, [], [], []);
}

public sealed record DesignRenderRequest(
    FboControllerDocument Document,
    bool Vietnamese,
    DesignAssetSet Assets,
    IReadOnlyDictionary<string, DesignElementIdentity> FieldIdentities,
    IReadOnlyDictionary<string, FboControllerDocument> DetailDocuments,
    int GridPlaceholderRows = 5);

public sealed record DesignBuildRequest(
    FboControllerDocument Document,
    bool Vietnamese,
    ProgramContext? Program,
    IReadOnlyDictionary<string, DesignElementIdentity> FieldIdentities);

public sealed record DesignDocument(
    string Html,
    string ControllerName,
    DesignAssetSet Assets,
    IReadOnlyList<string> Warnings);

public interface IDesignHtmlGenerator
{
    DesignDocument Generate(DesignRenderRequest request);
}

public interface IDesignAssetResolver
{
    Task<DesignAssetSet> ResolveAsync(
        ProgramContext program,
        string controller_name,
        CancellationToken ct = default);
}

public interface IDesignDocumentService
{
    Task<DesignDocument> BuildAsync(
        DesignBuildRequest request,
        CancellationToken ct = default);
}
```

- [ ] **Step 4: Add safe HTML encoding helper**

```csharp
using System.Net;

namespace DevWorkFlow.Application.Design;

internal static class DesignHtmlEncoder
{
    public static string Text(string? value) =>
        WebUtility.HtmlEncode(value ?? string.Empty);

    public static string Attribute(string? value) =>
        WebUtility.HtmlEncode(value ?? string.Empty);

    public static string SafeId(string value)
    {
        var chars = value.Select(c =>
            char.IsLetterOrDigit(c) || c is '-' or '_' ? c : '-').ToArray();
        return new string(chars);
    }
}
```

- [ ] **Step 5: Add the first IDE-owned CSS**

Create `Assets/fbo-design-minimal.css` with no skin dependency:

```css
:root { color-scheme: light; font-family: "Microsoft Sans Serif", sans-serif; font-size: 11px; }
html, body { margin: 0; min-height: 100%; background: #ededE2; color: #202020; }
.DwfDesignRoot { box-sizing: border-box; padding: 12px; min-width: max-content; }
.FormTable, .GridTable { border-collapse: collapse; table-layout: fixed; background: #fff; }
.FormRow { height: 24px; }
.FormCell { box-sizing: border-box; overflow: hidden; padding: 4px !important; vertical-align: middle; }
.FormContainer { box-sizing: border-box; width: 100%; overflow: hidden; vertical-align: middle; }
.FormContainerInput { position: relative; }
.FormInput, .FormInputDisabled { box-sizing: border-box; width: 100%; height: 20px; border: 1px solid #9ba7b4; }
.FormInputDisabled { background: #ececec; color: #666; }
.FormCheckInput { width: auto; height: auto; }
.Required .FormInput { border-left: 3px solid #d35400; }
.DwfTabs { margin-top: 8px; }
.DwfTabList { display: flex; gap: 2px; border-bottom: 1px solid #9ba7b4; }
.DwfTabButton { border: 1px solid #9ba7b4; border-bottom: 0; padding: 5px 10px; background: #e8edf2; }
.DwfTabButton[aria-selected="true"] { background: #fff; font-weight: 600; }
.DwfTabPanel { display: none; padding-top: 8px; }
.DwfTabPanel.DwfActive { display: block; }
.GridTable { width: 100%; border: 1px solid #9ba7b4; }
.GridHeader { background: #dbe5ef; }
.GridTable th, .GridTable td { box-sizing: border-box; border: 1px solid #b8c2cc; height: 24px; padding: 4px; overflow: hidden; white-space: nowrap; }
.GridTable tbody tr:nth-child(even) { background: #f5f7f9; }
.DwfDetailGrid { margin-top: 8px; }
.DwfDesignWarning { margin: 8px 0; color: #8a5700; }
```

Add to `DevWorkFlow.Application.csproj`:

```xml
<ItemGroup>
  <EmbeddedResource Include="Design\Assets\fbo-design-minimal.css" />
</ItemGroup>
```

- [ ] **Step 6: Run test**

At this task the generator shell may be a minimal implementation returning a full document and an empty body; Task 3/4 will fill the body:

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DesignHtmlGeneratorTests
```

Expected: PASS for metadata/static asset emission.

---

### Task 3: Implement field/items control mapping

**Files:**
- Create: `DevWorkFlow.Application/Design/DesignControlHtmlBuilder.cs`
- Test: `tests/DevWorkFlow.Application.Tests/Design/DesignControlHtmlBuilderTests.cs`

**Interfaces:**
- Consumes: `FboField`, `FboOptionsCatalog`, optional `DesignElementIdentity`
- Produces:

```csharp
internal sealed class DesignControlHtmlBuilder
{
    public string Build(
        FboField field,
        bool vietnamese,
        FboOptionsCatalog options,
        DesignElementIdentity? identity);
}
```

- [ ] **Step 1: Write failing control mapping tests**

Cover at least:

```csharp
[Theory]
[InlineData("X", "text-transform:uppercase")]
[InlineData("x", "text-transform:lowercase")]
public void Mask_UsesCaseFormat(string format, string expected_style) { /* assert input HTML */ }

[Fact]
public void Mask_LiteralValues_EmitsAllowedValuesMetadata()
{
    var field = Field("status", items_style: "Mask", data_format: "1, 0, *");
    var html = Build(field);
    Assert.Contains("data-allowed-values=\"1,0,*\"", html);
}

[Fact]
public void Numeric_ResolvesOptionsAndAlignsRight()
{
    var field = Field("so_luong", items_style: "Numeric", data_format: "@quantityInputFormat");
    var html = Build(field);
    Assert.Contains("data-format=\"# ### ### ##0.00\"", html);
    Assert.Contains("text-align:right", html);
}

[Fact]
public void DropDownList_EmitsSelectOptions() { /* two FboDropDownItem values */ }

[Fact]
public void Boolean_EmitsCheckbox() { /* type Boolean */ }

[Theory]
[InlineData("AutoComplete")]
[InlineData("Lookup")]
public void LookupStyles_EmitLookupButton(string style) { /* assert input + CellImgLookup */ }

[Fact]
public void ReadOnlyReference_StripsPercentSuffixFromDomId()
{
    var html = Build(Field("ten_tk%l", read_only: true));
    Assert.Contains("id=\"dwf-field-ten_tk\"", html);
    Assert.Contains("readonly", html);
}

[Fact]
public void Control_EmitsSymbolAndNodeIdentity()
{
    var html = Build(Field("ma_kh"), new("field:ma_kh", "node-123"));
    Assert.Contains("data-symbol-id=\"field:ma_kh\"", html);
    Assert.Contains("data-node-id=\"node-123\"", html);
}
```

- [ ] **Step 2: Run and verify RED**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DesignControlHtmlBuilderTests
```

- [ ] **Step 3: Implement exact mapping**

Rules:

- `Boolean` or `CheckBox` → checkbox.
- `DropDownList` → `<select>`.
- `ListBox` → `<select multiple>`.
- `RadioButtonList` → radio inputs grouped by field.
- `AutoComplete` / `Lookup` → text input plus non-functional lookup button/icon.
- `Numeric` → text input with resolved format and right align.
- `Mask` → text input; `X`/`x`; literal comma list stored as normalized `data-allowed-values`.
- `Rows > 1` → `<textarea>`.
- `ReadOnly` / `Disabled` / `External` → readonly/disabled classes.
- Never attach live FBO `$df` handlers; Design is render-only.

Representative implementation shape:

```csharp
var field_name = field.Name.Split('%')[0];
var dom_id = $"dwf-field-{DesignHtmlEncoder.SafeId(field_name)}";
var identity_attrs = identity is null
    ? $" data-symbol-id=\"field:{DesignHtmlEncoder.Attribute(field.Name)}\""
    : $" data-symbol-id=\"{DesignHtmlEncoder.Attribute(identity.SymbolId)}\"" +
      (identity.NodeId is null ? "" : $" data-node-id=\"{DesignHtmlEncoder.Attribute(identity.NodeId)}\"");
```

Use `options.ResolveFormat(field.DataFormatString)` and HTML-encode all values.

- [ ] **Step 4: Run focused tests**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DesignControlHtmlBuilderTests
```

Expected: PASS.

---

### Task 4: Render Dir form rows, categories and status/footer

**Files:**
- Create: `DevWorkFlow.Application/Design/DesignFormHtmlBuilder.cs`
- Test: `tests/DevWorkFlow.Application.Tests/Design/DesignFormHtmlBuilderTests.cs`

**Interfaces:**
- Consumes: `FboFormModel`, `CssText`, `DetailDocuments`, identities, options.
- Produces: form body HTML for `DesignHtmlGenerator`.

- [ ] **Step 1: Write failing Customer-like form tests**

Test fixture must contain:

```xml
<view id="Dir" height="274">
  <item value="120, 30, 45, 25"/>
  <item value="1100: [ma_kh].Label, [ma_kh]"/>
  <item value="1010: [doi_tac].Description, [doi_tac]"/>
  <item value="-110: [status], [status].Description"/>
  <categories>
    <category index="1" columns="120,30,45,25">
      <header v="Thông tin chính" e="General"/>
    </category>
  </categories>
</view>
```

Assertions:

```csharp
Assert.Contains("class=\"FormTable\"", html);
Assert.Contains("<th style=\"width:120px\"", html);
Assert.Contains("colspan=\"3\"", html);                 // ma_kh input
Assert.Contains("Mã khách", html);                     // .Label
Assert.Contains("data-dwf-region=\"main\"", html);
Assert.Contains("role=\"tablist\"", html);
Assert.Contains("Thông tin chính", html);
Assert.Contains("data-category-index=\"1\"", html);
Assert.Contains("data-dwf-region=\"footer\"", html);   // categoryIndex=-1
Assert.Contains("<div class=\"Break\"", html);         // Description/Footer HTML
Assert.Contains("style=\"height:274px\"", html);
```

Also test `.Description` fallback to header when footer is absent.

- [ ] **Step 2: Run and verify RED**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DesignFormHtmlBuilderTests
```

- [ ] **Step 3: Implement table/row rendering**

Use the already parsed `FormViewRow.Cells`; do not parse mask strings again.

For each table:

```html
<table class="FormTable" style="table-layout:fixed">
  <colgroup><col style="width:120px">...</colgroup>
  <tbody>...</tbody>
</table>
```

For each cell:

- Empty → `<td class="FormCell DwfEmptyCell" colspan="..."></td>`.
- Label → encoded `field.Header.Get(vietnamese)`.
- Description → footer raw fragment decoded by parser, but sanitize to the allowlist below.
- Input → delegate to `DesignControlHtmlBuilder`.

Footer/Description sanitization allowlist:

- Keep only `u`, `span`, `div`, `br`.
- Keep `class` only.
- Encode all other tags/attributes as text.
- This avoids injecting controller script/event handlers into WebView.

Tab behavior is IDE-owned:

```html
<button type="button" class="DwfTabButton" role="tab" data-target="dwf-tab-1">...</button>
<section id="dwf-tab-1" class="DwfTabPanel DwfActive" role="tabpanel">...</section>
```

The shell script switches `DwfActive`; it must not depend on FBO runtime JS.

- [ ] **Step 4: Add Detail placeholders at input cells**

When `field.ItemsStyle == "Grid"` and `DetailDocuments` contains `field.ItemsController`, call `DesignGridHtmlBuilder.Build(..., detail_mode: true)`. If missing, render:

```html
<div class="DwfDesignWarning">Không tìm thấy Grid Detail: {controller}</div>
```

- [ ] **Step 5: Run focused tests**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DesignFormHtmlBuilderTests
```

Expected: PASS.

---

### Task 5: Render Grid list and Grid Detail

**Files:**
- Create: `DevWorkFlow.Application/Design/DesignGridHtmlBuilder.cs`
- Test: `tests/DevWorkFlow.Application.Tests/Design/DesignGridHtmlBuilderTests.cs`

**Interfaces:**
- Produces:

```csharp
internal sealed class DesignGridHtmlBuilder
{
    public string Build(
        FboGridModel grid,
        bool vietnamese,
        int placeholder_rows,
        bool detail_mode = false);
}
```

- [ ] **Step 1: Write failing Grid tests**

For a Customer grid with `ma_kh` width 100 and `ten_kh%l` width 300:

```csharp
Assert.Contains("class=\"GridTable\"", html);
Assert.Contains("Mã khách", html);
Assert.Contains("Tên khách hàng", html);
Assert.Contains("style=\"width:100px\"", html);
Assert.Equal(5, CountDataRows(html));
Assert.Contains("data-field-name=\"ma_kh\"", html);
```

For `type="Detail"`:

```csharp
Assert.Contains("DwfDetailGrid", html);
Assert.DoesNotContain("DwfGridToolbar", html);
```

Add one test proving `VisibleFieldNames` determines order and hidden fields are not emitted.

- [ ] **Step 2: Run and verify RED**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DesignGridHtmlBuilderTests
```

- [ ] **Step 3: Implement Grid HTML**

Rules:

- First index column width 24px.
- Columns = `grid.VisibleColumns`.
- Width fallback = 120px.
- Header text = `field.Header.Get(vietnamese)`.
- Exactly `placeholder_rows` rows; cells contain `…`.
- Preserve `align`.
- Emit `data-field-name` and `data-symbol-id="field:{name}"` on header and body cells.
- Toolbar uses declared `grid.Toolbar`, but buttons are inert.
- Detail mode adds class `DwfDetailGrid` and omits list toolbar/subtitle.

- [ ] **Step 4: Run focused tests**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DesignGridHtmlBuilderTests
```

Expected: PASS.

---

### Task 6: Compose full HTML and load Detail documents through Language Service

**Files:**
- Create: `DevWorkFlow.Application/Design/DesignHtmlGenerator.cs`
- Create: `DevWorkFlow.Application/Design/DesignDocumentService.cs`
- Modify: `DevWorkFlow.Application/Design/DesignContracts.cs`
- Test: `tests/DevWorkFlow.Application.Tests/Design/DesignHtmlGeneratorTests.cs`
- Test: `tests/DevWorkFlow.Application.Tests/Design/DesignDocumentServiceTests.cs`

**Interfaces:**
- Consumes: `IErpLanguageService`, `IDesignAssetResolver`, `FboOptionsCatalog`, builders.
- Produces: complete self-contained `DesignDocument`.

- [ ] **Step 1: Complete full-document generator tests**

Add assertions:

```csharp
Assert.Contains("<!doctype html>", html, StringComparison.OrdinalIgnoreCase);
Assert.Contains("<style data-dwf-source=\"ide\">", html);
Assert.Contains("<style data-dwf-source=\"controller\">", html);
Assert.Contains(".LabelDescription", html);
Assert.Contains("data-dwf-controller=\"Customer\"", html);
Assert.Contains("class=\"FormTable\"", dir_html);
Assert.Contains("class=\"GridTable\"", grid_html);
Assert.DoesNotContain("WebResource.axd", html);
Assert.DoesNotContain("ScriptResource.axd", html);
```

- [ ] **Step 2: Implement `DesignHtmlGenerator`**

Responsibilities:

1. Load embedded `fbo-design-minimal.css`.
2. Emit UTF-8/full shell.
3. Emit absolute static URLs:
   - `https://devworkflow.program/{escaped relative path}`
4. Emit controller CSS as `<style data-dwf-source="controller">`.
5. Choose Form/Grid builder from `Document.DisplayKind`.
6. Add small tab script only:

```javascript
document.addEventListener('click', function (event) {
  const button = event.target.closest('.DwfTabButton');
  if (!button) return;
  const root = button.closest('.DwfTabs');
  root.querySelectorAll('.DwfTabButton').forEach(x => x.setAttribute('aria-selected', 'false'));
  root.querySelectorAll('.DwfTabPanel').forEach(x => x.classList.remove('DwfActive'));
  button.setAttribute('aria-selected', 'true');
  document.getElementById(button.dataset.target)?.classList.add('DwfActive');
});
```

Never inject controller `<script>` or FBO event handlers.

- [ ] **Step 3: Write failing service tests with fakes**

Cases:

1. No Program → assets empty, still returns Form/Grid HTML, warning `Chưa chọn Program`.
2. Asset resolver throws `IOException` → HTML still returns with warning.
3. Dir has `items style="Grid" controller="CustomerUnitDetail"` → service finds `Grid/CustomerUnitDetail.xml`, opens via `IErpLanguageService`, and embeds Detail.
4. Missing detail file → warning, no crash.

Use a fake `IDesignAssetResolver`; use real `ErpLanguageService` against a temp directory for Detail to prove only LS parses XML.

- [ ] **Step 4: Implement `DesignDocumentService`**

Constructor:

```csharp
public DesignDocumentService(
    IErpLanguageService language_service,
    IDesignAssetResolver asset_resolver,
    IDesignRelatedDocumentLocator related_document_locator,
    IDesignHtmlGenerator html_generator)
```

Build flow:

```csharp
var assets = request.Program is null
    ? DesignAssetSet.Empty
    : await _asset_resolver.ResolveAsync(
        request.Program, request.Document.ControllerName, ct);

var detail_documents = ResolveDetailDocuments(
    request.Document, request.Program, warnings);

return _html_generator.Generate(new DesignRenderRequest(
    request.Document,
    request.Vietnamese,
    assets,
    request.FieldIdentities,
    detail_documents,
    GridPlaceholderRows: 5)) with { Warnings = warnings };
```

Detail resolution:

- Only for Dir Form.
- Find fields whose `ItemsStyle` equals `Grid`.
- Controller name = `ItemsController`.
- Path = `MenuService.FindControllerFile(program.ControllersPath, "Grid", controller_name)` must not be called directly from Application because it is Infrastructure. Add an Application abstraction:

```csharp
public interface IDesignRelatedDocumentLocator
{
    string? FindGridPath(ProgramContext program, string controller_name);
}
```

Implement in Infrastructure in Task 7 alongside asset resolver.
- For path found: use `language_service.Workspace.FindByPath(path) ?? language_service.OpenDocument(path)`.
- Get `(semantic as ErpSemanticModel)?.LegacyDocument`; require Grid.
- Do not call `FboXmlParser` from UI or Infrastructure.

- [ ] **Step 5: Run Application Design tests**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DevWorkFlow.Application.Tests.Design
```

Expected: all Task 1–6 tests pass except Infrastructure resolver tests introduced next.

---

### Task 7: Resolve menu/main/MasterPage static assets

**Files:**
- Create: `DevWorkFlow.Infrastructure/Design/AspxMasterPageParser.cs`
- Create: `DevWorkFlow.Infrastructure/Design/DesignAssetResolver.cs`
- Create: `DevWorkFlow.Infrastructure/Design/DesignRelatedDocumentLocator.cs`
- Test: `tests/DevWorkFlow.Application.Tests/Design/DesignAssetResolverTests.cs`

**Interfaces:**
- Implements: `IDesignAssetResolver`
- Implements: `IDesignRelatedDocumentLocator`
- Uses: `IMenuService.LoadMenuTreeAsync`, `AspxControllerParser`, Program filesystem.

- [ ] **Step 1: Write failing resolver tests with temp Program**

Fixture files:

`Main/arkh.aspx`

```aspx
<%@ Page MasterPageFile="~/Main/MasterPage.master" %>
<FastBusiness:ReportExtender Controller="Customer" />
```

`Main/MasterPage.master`

```aspx
<%@ Master Language="VB" %>
<link href="~/Css/Menu.css?v=1" rel="stylesheet" />
<CompositeScript Path="~/ClientScript/j8.js"></CompositeScript>
<script src="~/ClientScript/custom.js"></script>
<link href="~/WebResource.axd?x=1" rel="stylesheet" />
```

Fake menu tree contains `SysId=Customer`, `Link=arkh.aspx`.

Assertions:

```csharp
Assert.Equal("Main/arkh.aspx", assets.MainRelativePath);
Assert.Equal("Main/MasterPage.master", assets.MasterRelativePath);
Assert.Equal(["Css/Menu.css"], assets.Stylesheets);
Assert.Equal(["ClientScript/j8.js", "ClientScript/custom.js"], assets.Scripts);
Assert.DoesNotContain(assets.Stylesheets, x => x.Contains(".axd"));
```

Add:

- Missing menu row → fallback scan `Main/*.aspx` by `Controller`.
- Multiple matches → prefer menu `SysId`/link; otherwise lexical first path.
- Missing master → return empty asset lists without throwing.
- `DesignRelatedDocumentLocator` finds `App_Data/Controllers/Grid/{name}.xml`.

- [ ] **Step 2: Run and verify RED**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DesignAssetResolverTests
```

- [ ] **Step 3: Implement targeted parser**

`AspxMasterPageParser` signatures:

```csharp
internal static string? ParseMasterPageFile(string content);
internal static IReadOnlyList<string> CollectStaticAssetPaths(string content);
```

Use compiled regex for:

- `MasterPageFile="..."`.
- `href`, `src`, `Path` attributes.

Normalize:

- HTML decode.
- Remove query/fragment.
- Convert `~/`, `../`, `/` into Program-relative static path.
- Accept only first segment `Css`, `ClientScript`, `Images`, or `favicon.ico`.
- Reject `.axd`, `http:`, `https:`, `data:`, `javascript:`.
- Deduplicate case-insensitively and preserve document order.

- [ ] **Step 4: Implement menu-first resolver with fallback**

Constructor:

```csharp
public DesignAssetResolver(IMenuService menu_service)
```

Algorithm:

1. Load menu tree once per `ProgramPath`; cache flattened `(SysId, Link)` entries.
2. Prefer row where `SysId == controller_name`.
3. Resolve `Link` under `ProgramPath/Main`; reject path traversal via `Path.GetFullPath` root check.
4. Verify aspx has controller using `AspxControllerParser.ParseControllersFromFile`.
5. Fallback scan `Main/*.aspx` ordered by filename and choose first declaring controller.
6. Parse `MasterPageFile`; resolve under Program root with traversal check.
7. Collect assets from page and master; master order first, page second.
8. Categorize extension/path into stylesheet/script/image.
9. Soft-fail to empty lists; only cancellation propagates.

- [ ] **Step 5: Implement related Grid locator**

```csharp
public sealed class DesignRelatedDocumentLocator : IDesignRelatedDocumentLocator
{
    public string? FindGridPath(ProgramContext program, string controller_name)
    {
        var controllers_root = MenuService.ResolveControllersRoot(program.ProgramPath);
        return controllers_root is null
            ? null
            : MenuService.FindControllerFile(controllers_root, "Grid", controller_name);
    }
}
```

- [ ] **Step 6: Run resolver and all Design tests**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests --filter FullyQualifiedName~DevWorkFlow.Application.Tests.Design
```

Expected: PASS.

---

### Task 8: Add generated Design state to each active FormBuilder document

**Files:**
- Modify: `UI/ViewModels/FormBuilderViewModel.cs`
- Modify: `UI/App.xaml.cs`
- Test: add focused tests to `tests/DevWorkFlow.Application.Tests/Design/DesignDocumentServiceTests.cs`; no WPF UI test required.

**Interfaces:**
- Consumes: `IDesignDocumentService`.
- Produces ViewModel properties:

```csharp
public DesignDocument? GeneratedDesignDocument { get; private set; }
public bool IsDesignRendering { get; private set; }
public string? DesignRenderError { get; private set; }
```

- [ ] **Step 1: Extend constructor without breaking current tests**

Append optional parameter:

```csharp
IDesignDocumentService? design_document_service = null
```

Store it in `_design_document_service`; add `_design_render_cts`.

- [ ] **Step 2: Build stable DOM identity map**

Add private helper:

```csharp
private IReadOnlyDictionary<string, DesignElementIdentity> BuildFieldIdentities()
{
    if (ErpDocument is null) return new Dictionary<string, DesignElementIdentity>();

    var map = ErpDocument.NavigationMap;
    return SemanticModel.GetFields().ToDictionary(
        field => field.Name,
        field =>
        {
            var symbol_id = field.Id;
            var node_id = map?.GetNodeBySymbolId(symbol_id)?.Id.ToString();
            return new DesignElementIdentity(symbol_id, node_id);
        },
        StringComparer.OrdinalIgnoreCase);
}
```

Use `field.Id` from semantic binder (`field:{name}`); NavigationMap is source of NodeId.

- [ ] **Step 3: Add cancellation-safe refresh**

```csharp
private async Task RefreshGeneratedDesignAsync()
{
    _design_render_cts?.Cancel();
    _design_render_cts?.Dispose();
    _design_render_cts = new CancellationTokenSource();
    var ct = _design_render_cts.Token;

    if (_design_document_service is null || Document is null)
    {
        GeneratedDesignDocument = null;
        return;
    }

    IsDesignRendering = true;
    DesignRenderError = null;
    try
    {
        var build_request = new DesignBuildRequest(
            Document,
            IsVietnamese,
            _program_session?.Current,
            BuildFieldIdentities());
        var generated = await _design_document_service.BuildAsync(build_request, ct);
        if (!ct.IsCancellationRequested)
            GeneratedDesignDocument = generated;
    }
    catch (OperationCanceledException) when (ct.IsCancellationRequested) { }
    catch (Exception ex)
    {
        if (!ct.IsCancellationRequested)
            DesignRenderError = ex.Message;
    }
    finally
    {
        if (!ct.IsCancellationRequested)
            IsDesignRendering = false;
    }
}
```

Use normal backing fields and `SetProperty`/`OnPropertyChanged` convention already in the VM.

Trigger after:

- successful `ParseXml` (`Document` set);
- `ApplyLanguageDocument`;
- language toggle;
- Program changed;
- entry into Designer mode if no generated document exists.

Do not block parsing/UI thread; assign fire-and-observe via `_ = RefreshGeneratedDesignAsync()` and catch inside method.

- [ ] **Step 4: Compose services in `App.xaml.cs`**

Create once:

```csharp
var design_asset_resolver = new DesignAssetResolver(menu_service);
var design_related_locator = new DesignRelatedDocumentLocator();
var design_html_generator = new DesignHtmlGenerator();
var design_document_service = new DesignDocumentService(
    language_service,
    design_asset_resolver,
    design_related_locator,
    design_html_generator);
```

Change factory:

```csharp
FormBuilderViewModel CreateForm() =>
    new(program_session, sql_navigator, language_service, form_navigator,
        design_document_service);
```

- [ ] **Step 5: Build UI project**

```powershell
dotnet build UI/UI.csproj
```

Expected: PASS; existing constructor call sites remain valid because the parameter is optional.

---

### Task 9: Replace Skin viewer with independent Design WebView host

**Files:**
- Create: `UI/Views/Design/DesignWebViewHost.xaml`
- Create: `UI/Views/Design/DesignWebViewHost.xaml.cs`
- Modify: `UI/Views/Pages/FormBuilderPage.xaml`
- Delete after migration: `UI/Views/Skin/SkinDesignerView.xaml`
- Delete after migration: `UI/Views/Skin/SkinDesignerView.xaml.cs`

**Interfaces:**
- Consumes inherited `FormBuilderViewModel.DataContext`.
- Watches `GeneratedDesignDocument`, `IsDesignRendering`, `DesignRenderError`.
- Keeps existing `PixelRuler`, zoom and scroll postMessage bridge.

- [ ] **Step 1: Create XAML host with no ProjectSkinVm binding**

Use namespace `UI.Views.Design`. Root inherits `FormBuilderViewModel`.

```xml
<Grid x:Name="Root" Background="{StaticResource WorkspaceBgBrush}">
  <!-- Same ruler row/column structure as old SkinDesignerView -->
  <ctrl:PixelRuler x:Name="RulerX" Grid.Row="0" Grid.Column="1" Orientation="Horizontal"/>
  <ctrl:PixelRuler x:Name="RulerY" Grid.Row="1" Grid.Column="0" Orientation="Vertical"/>
  <Grid Grid.Row="1" Grid.Column="1">
    <wv2:WebView2 x:Name="DesignWebView"/>
    <TextBlock Text="Đang dựng Design…"
               Visibility="{Binding IsDesignRendering, Converter={StaticResource BoolToVisibilityConverter}}"/>
    <TextBlock Text="{Binding DesignRenderError}"
               Visibility="{Binding DesignRenderError, Converter={StaticResource NullOrEmptyToVisibilityConverter}}"/>
  </Grid>
</Grid>
```

There must be no `AncestorType=Window`, `ProjectSkinVm`, `HasSkin`, or Capture Skin command.

- [ ] **Step 2: Implement WebView lifecycle**

Port unchanged:

- `ScrollTrackingScript`
- `PixelRuler` zoom/offset logic
- Web message handling

Change:

- User-data folder: `%LocalAppData%/DevWorkFlow/WebView2Design`
- Map only:

```csharp
const string ProgramVirtualHost = "devworkflow.program";
core.SetVirtualHostNameToFolderMapping(
    ProgramVirtualHost,
    program_root,
    CoreWebView2HostResourceAccessKind.Allow);
```

- Render:

```csharp
DesignWebView.NavigateToString(document.Html);
```

- On `Loaded`, subscribe to current `FormBuilderViewModel.PropertyChanged`.
- Re-render only when `GeneratedDesignDocument` changes.
- Remap Program host when Program path changes; clear old mapping using `ClearVirtualHostNameToFolderMapping` before remap.
- On `Unloaded`, unsubscribe all VM/CoreWebView events owned by the control.
- Keep a `_last_document_html` hash/reference to avoid duplicate navigation.

- [ ] **Step 3: Switch `FormBuilderPage`**

Change XML namespace:

```xml
xmlns:design="clr-namespace:UI.Views.Design"
```

Change host:

```xml
<design:DesignWebViewHost
    Visibility="{Binding ShowDesignerModeSurface, Converter={StaticResource BoolToVis}}"/>
```

Update tooltip/comment from “skin trống” to “XML → HTML WebView”.

- [ ] **Step 4: Remove old Skin viewer files**

Before deletion:

```powershell
rg "SkinDesignerView" .
```

Expected: only old files. Delete them, but keep:

- `SkinCaptureWindow`
- `ProjectSkinViewModel`
- Skin commands/menu for AI/tooling
- `LocalSkinStore` and capture services

- [ ] **Step 5: Build and inspect diagnostics**

```powershell
dotnet build UI/UI.csproj
```

Expected: PASS.

Then run IDE diagnostics on:

- `UI/Views/Design/DesignWebViewHost.xaml.cs`
- `UI/ViewModels/FormBuilderViewModel.cs`
- `UI/Views/Pages/FormBuilderPage.xaml`

No new warnings/errors.

---

### Task 10: End-to-end verification, regressions and documentation alignment

**Files:**
- Modify: `.ai/CURRENT_STATE.md`
- Modify: `docs/04-DESIGNER_PLATFORM.md` only if its wording still says Design uses skin shell.
- Modify: comments in `UI/MainWindow.xaml.cs` / menu copy only where they incorrectly describe Design runtime.

**Interfaces:**
- Delivers an independently testable Design module; Skin remains optional.

- [ ] **Step 1: Run all touched tests**

```powershell
dotnet test tests/DevWorkFlow.Application.Tests
dotnet test tests/DevWorkFlow.Domain.Tests
```

Expected: PASS.

- [ ] **Step 2: Build solution**

```powershell
dotnet build DevWorkFlow.slnx
```

Expected: `Build succeeded`, zero compile errors.

- [ ] **Step 3: Manual smoke test with SP226**

1. Open Program `SP226`.
2. Open `App_Data/Controllers/Dir/Customer.xml`.
3. Enter Design:
   - Form renders without using “Lấy skin”.
   - Main fields, tabs 1/2/9 and footer/status appear.
   - `<css>` rules `.Break` / `.LabelDescription` apply.
   - WebView Network has no `.axd` request and no `ERR_FILE_NOT_FOUND` from skin host.
4. Open `Grid/Customer.xml`:
   - Header order/width matches XML.
   - Exactly five placeholder rows.
5. Open a `Grid type="Detail"` file:
   - Detail table renders without list toolbar.
6. Edit `header v` in source, parse/switch Design:
   - Generated label changes.
7. Verify rulers track zoom/scroll.

- [ ] **Step 4: Update current-state wording**

Record:

- Design tab now consumes active controller `FboControllerDocument`.
- Runtime no longer depends on Project Web Skin.
- Implemented Dir/Grid/Detail HTML Generator and static asset resolver.
- Skin capture is retained only for AI/reference.
- Overlay drag/drop and DOM→Command remain next phase.

Do not rewrite unrelated roadmap sections.

- [ ] **Step 5: Final diff review**

```powershell
git status --short
git diff --check
git diff --stat
```

Review specifically:

- no XML parsing in UI;
- no WebView2 reference outside UI;
- no `HasSkin` gate in Design;
- no `.axd` in generated HTML;
- no accidental changes to Left Panel;
- no user files under `.temp` or `.vs` added;
- no secrets/config files added.

Do not commit unless the user explicitly requests it.

---

## Execution order and review gates

Claude should execute strictly in order:

1. Task 1 establishes parser/model truth.
2. Tasks 2–5 build pure, testable HTML generation.
3. Tasks 6–7 add orchestration and Program asset/detail resolution.
4. Task 8 connects active document state.
5. Task 9 replaces the WebView runtime.
6. Task 10 performs integration verification and docs alignment.

After each task:

- show changed files;
- show exact test command/result;
- stop if the task’s focused tests fail;
- do not stack additional fixes over an unconfirmed hypothesis;
- preserve unrelated uncommitted changes.
