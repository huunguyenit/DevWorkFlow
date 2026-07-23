# Phase 2 — XML Structure Navigation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ctrl+Click `field@name` → view chứa field; `items@controller` → mở Lookup XML; `clientScript` → function (kể cả tên bị entity cắt).

**Architecture:** LS `ResolveStructuralAtSourceOffset` sau entity miss; VM mở rộng `OnEntityOffsetActivated` thành chuỗi entity → structural → Status. Lookup path reuse `FindLookupFile`. clientScript: expand entity 1 lớp trên slice rồi extract identifier.

**Tech Stack:** C# LS, Monaco bridge (offset only), xUnit, Program ControllersPath

**Spec:** `docs/superpowers/specs/2026-07-22-editor-phase2-xml-structure-nav-design.md`  
**Roadmap:** Phase 2  
**Prerequisite:** Phase 1 `ResolveEntityAtOffset` + `OnEntityOffsetActivated` (đã có trên tree)

## Global Constraints

- UI/bridge không parse XML cấu trúc — chỉ gửi offset.
- R7: SymbolId / file path SoT, không line-as-key.
- Entity hit Phase 1 **luôn ưu tiên** trước structural.
- `snake_case` locals; Left Panel UX freeze.
- `dotnet build DevWorkFlow.slnx` + Application tests xanh.

---

## File map

| File | Role |
|------|------|
| `DevWorkFlow.Domain/Language/StructuralNavHit.cs` | DTO |
| `DevWorkFlow.Application/Language/StructuralAtOffsetResolver.cs` | Hit-test |
| `DevWorkFlow.Application/Language/ClientScriptFunctionName.cs` | Expand+extract tên hàm |
| `DevWorkFlow.Application/Engine/LookupPathResolver.cs` | Extract `FindLookupFile` public |
| `IErpLanguageService` / `ErpLanguageService` | `ResolveStructuralAtOffset` |
| `tests/.../StructuralAtOffsetResolverTests.cs` | Unit |
| `tests/.../ClientScriptFunctionNameTests.cs` | Unit entity-split |
| `UI/ViewModels/FormBuilderViewModel.cs` | Chuỗi nav + open Lookup |
| Roadmap Phase 2 progress note | Living doc |

---

### Task 1: DTO + LookupPathResolver + tests path

**Files:**
- Create: `DevWorkFlow.Domain/Language/StructuralNavHit.cs`
- Create: `DevWorkFlow.Application/Engine/LookupPathResolver.cs`
- Modify: `LookupReferenceResolver.cs` — gọi `LookupPathResolver`
- Create: `tests/DevWorkFlow.Application.Tests/Engine/LookupPathResolverTests.cs`

**Produces:**

```csharp
public enum StructuralNavKind
{
    FieldToView = 0,
    ItemsController = 1,
    ClientScriptFunction = 2
}

public sealed class StructuralNavHit
{
    public StructuralNavKind Kind { get; init; }
    public string SymbolId { get; init; } = string.Empty;
    public string TargetPath { get; init; } = string.Empty;
    public string DisplayLabel { get; init; } = string.Empty;
    public int TargetOffset { get; init; } = -1; // optional in-doc reveal
}
```

```csharp
public static class LookupPathResolver
{
    public static string? FindLookupFile(string controllers_path, string controller_name)
    {
        // move body from LookupReferenceResolver.FindLookupFile
    }
}
```

- [x] **Step 1: Failing test** — temp dir `Lookup/Account.xml` → FindLookupFile returns path; missing → null.

- [x] **Step 2: Implement + PASS**

- [ ] **Step 3: Commit** (khi user yêu cầu)

---

### Task 2: ClientScriptFunctionName (entity-split) + tests

**Files:**
- Create: `DevWorkFlow.Application/Language/ClientScriptFunctionName.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/ClientScriptFunctionNameTests.cs`

**Produces:**

```csharp
public static class ClientScriptFunctionName
{
    /// <summary>
    /// Từ source XML toàn document + offset trong clientScript value:
    /// tìm slice clientScript, expand &Entity; 1 lớp bằng dictionary name→DisplayText/RawValue,
    /// map offset → logical, ExtractIdentifierAt trên logical → tên hàm.
    /// </summary>
    public static string? TryExtract(
        string source_xml,
        int offset,
        IReadOnlyDictionary<string, string> entity_values);
}
```

- [x] **Step 1: Tests**

```csharp
[Fact]
public void Plain_onchange_handler_name()
{
    var xml = """<field name="x"><clientScript><![CDATA[onchange="onChange$Voucher$x(this);"]]></clientScript></field>""";
    var offset = xml.IndexOf("onChange$Voucher$x", StringComparison.Ordinal) + 3;
    Assert.Equal("onChange$Voucher$x", ClientScriptFunctionName.TryExtract(xml, offset, new Dictionary<string, string>()));
}

[Fact]
public void Entity_split_joins_name()
{
    // onChangeCurrency + &Account; + (this) → onChangeCurrencyAccount khi Account→"Account"
    var xml = """
      <!DOCTYPE dir [<!ENTITY Account "Account">]>
      <dir><fields><field name="a">
        <clientScript><![CDATA[onchange="onChangeCurrency]]>Account<![CDATA[(this);"]]></clientScript>
      </field></fields><script><![CDATA[
      function onChangeCurrencyAccount(sender) {}
      ]]></script></dir>
      """;
    // NOTE: CDATA split by entity ref — adjust fixture to match real FBO serialize if needed
    var offset = xml.IndexOf("onChangeCurrency", StringComparison.Ordinal) + 2;
    var values = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase) { ["Account"] = "Account" };
    Assert.Equal("onChangeCurrencyAccount", ClientScriptFunctionName.TryExtract(xml, offset, values));
}
```

Chỉnh fixture cho khớp parser thật (CDATA/entity xen) — đọc 1 file mẫu hoặc synthesize lossless.

- [x] **Step 2: Implement** — locate enclosing `clientScript` element text range via regex or syntax tree; build logical string; map offsets; reuse `XmlStructureParser.ExtractIdentifierAt`.

- [x] **Step 3: PASS**

---

### Task 3: StructuralAtOffsetResolver + LS API + tests

**Files:**
- Create: `DevWorkFlow.Application/Language/StructuralAtOffsetResolver.cs`
- Modify: `IErpLanguageService.cs`, `ErpLanguageService.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/StructuralAtOffsetResolverTests.cs`

**Signature:**

```csharp
public static StructuralNavHit? TryResolve(
    IErpSemanticModel model,
    ISyntaxTree? syntax,   // hoặc string source từ document
    string source_xml,
    int offset,
    string? controllers_path);
```

**Algorithm sketch:**

1. **ItemsController:** tìm element `items` có span chứa offset; trong `GetFullText()`/source slice match `controller\s*=\s*"([^"]+)"` với span value chứa offset → `LookupPathResolver.FindLookupFile` → hit Kind=ItemsController, TargetPath=...

2. **FieldToView:** tìm element `field` có Qualifier/name, span chứa offset; tổ tiên không phải `view` (định nghĩa dưới `fields`); lấy `field_name`; tìm `view` element có child field cùng tên → SymbolId=`view:{viewQualifier}` từ `model.GetSymbolsOfKind<ViewSymbol>` / GoTo target offset = view.Definition.Span.StartOffset.

3. **ClientScriptFunction:** nếu offset trong `clientScript` (element name); `TryExtract` tên; tìm `ScriptFunctionSymbol` hoặc `FindFunctionDefinition` → SymbolId=`script:{name}`, TargetOffset=def.

Priority khi nhiều kind khớp: **ItemsController > ClientScriptFunction > FieldToView** (attribute cụ thể hơn element rộng), hoặc chọn span value hẹp nhất — document trong code.

- [x] **Step 1: Fixture XML**

```xml
<!DOCTYPE dir [<!ENTITY Account "Account">]>
<dir>
  <fields>
    <field name="ma_kh">
      <items controller="Account"/>
      <clientScript><![CDATA[onchange="onChangeCurrency]]>Account<![CDATA[(this);"]]></clientScript>
    </field>
  </fields>
  <views>
    <view id="Dir"><field name="ma_kh"/></view>
  </views>
  <script><![CDATA[
    function onChangeCurrencyAccount(sender) {}
  ]]></script>
</dir>
```

Open via `language_service.OpenDocumentFromText`.

- [x] **Step 2: Tests** — 3 asserts cho 3 kind; entity offset trên `&Account;` trong clientScript vẫn để Phase 1 thắng (test riêng chuỗi VM).

- [x] **Step 3: Implement resolver + `ResolveStructuralAtOffset` on LS** (cần ControllersPath param hoặc overload với path).

```csharp
// IErpLanguageService
StructuralNavHit? ResolveStructuralAtOffset(
    ErpDocumentId document_id,
    int offset,
    string? controllers_path);
```

- [x] **Step 4: PASS**

---

### Task 4: Wire FormBuilderViewModel Ctrl+Click chain

**Files:**
- Modify: `UI/ViewModels/FormBuilderViewModel.cs` — `OnEntityOffsetActivated`
- Possibly: inject/read `_program_session.Current?.ControllersPath`

**Replace miss branch:**

```csharp
public void OnEntityOffsetActivated(int offset)
{
    if (ErpDocument is null || _language_service is null) return;

    var entity = _language_service.ResolveEntityAtOffset(ErpDocument.Id, offset);
    if (entity is not null)
    {
        NavigateToEntity(...);
        return;
    }

    var controllers_path = _program_session?.Current?.ControllersPath;
    var structural = _language_service.ResolveStructuralAtOffset(
        ErpDocument.Id, offset, controllers_path);
    if (structural is null)
    {
        StatusMessage = "Không có mục tiêu điều hướng tại vị trí này.";
        return;
    }

    switch (structural.Kind)
    {
        case StructuralNavKind.ItemsController:
            if (string.IsNullOrWhiteSpace(structural.TargetPath) || !File.Exists(structural.TargetPath))
            {
                StatusMessage = $"Không tìm thấy Lookup: {structural.DisplayLabel}";
                return;
            }
            OpenEntityFile(structural.TargetPath); // hoặc Form navigator — Lookup.xml OK
            StatusMessage = structural.TargetPath;
            break;

        case StructuralNavKind.FieldToView:
        case StructuralNavKind.ClientScriptFunction:
            if (!string.IsNullOrWhiteSpace(structural.SymbolId))
            {
                var target = _language_service.Navigation.GoToDefinition(
                    ErpDocument.Id, structural.SymbolId);
                if (target?.TextRange is { } range && !range.IsEmpty)
                {
                    NavigateToOffset(range.StartOffset, line_hint: target.Line);
                    StatusMessage = structural.DisplayLabel;
                    return;
                }
            }
            if (structural.TargetOffset >= 0)
            {
                NavigateToOffset(structural.TargetOffset, line_hint: 0);
                StatusMessage = structural.DisplayLabel;
                return;
            }
            StatusMessage = $"Không resolve được: {structural.DisplayLabel}";
            break;
    }
}
```

Đảm bảo `_program_session` đã có trên VM (grep — nếu chưa, dùng cách ControllersPath hiện có từ Design mapper).

- [x] **Step 1: Implement + build UI**

```bash
dotnet build UI/UI.csproj
```

- [ ] **Step 2: Manual**

1. Ctrl+Click `name="ma_kh"` trong `<fields>` → nhảy `<view id="Dir">`.
2. Ctrl+Click `Account` trong `controller="Account"` → mở Lookup/Account.xml (Program có file).
3. Ctrl+Click phần tên trong clientScript (entity-split) → function.
4. Ctrl+Click `&Entity;` vẫn mở entity (Phase 1).

- [ ] **Step 3: Commit** (khi user yêu cầu)

---

### Task 5: Verify + roadmap

- [x] `dotnet test tests/DevWorkFlow.Application.Tests --filter "FullyQualifiedName~Structural|ClientScript|LookupPath"`
- [x] `dotnet build DevWorkFlow.slnx`
- [x] Checklist spec §8
- [x] Roadmap Phase 2:

```markdown
**Artifacts:** mini-spec […] · plan […]
**Progress:** Done — field→view, items@controller→Lookup, clientScript→fn (+ entity-split). Needs human runtime pass.
```

- [x] Handoff Phase 3 (request / FindRefs / `$a` / showForm)

---

## Spec coverage

| Spec | Task |
|------|------|
| #7 field→view | 3 + 4 |
| #8 items@controller | 1 + 3 + 4 |
| #10 clientScript→fn + entity-split | 2 + 3 + 4 |
| Entity priority | 4 |
| R7 SymbolId | 3 + 4 |

## Placeholder scan

Fixture CDATA+entity phải khớp serializer thật — Task 2 ghi chú chỉnh fixture, không để TBD mở. ControllersPath null → Status, đã cover.
