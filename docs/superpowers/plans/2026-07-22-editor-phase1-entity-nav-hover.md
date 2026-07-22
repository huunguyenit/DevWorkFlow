# Phase 1 — Entity Nav + Hover Virtual View Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Source-mode Ctrl+Click + hover virtual view (value/scroll/Copy/dismiss-on-leave-widget); Insight SYSTEM Ctrl+Click mở đúng file.

**Architecture:** LS `ResolveEntityAtSourceOffset` là SoT hit-test; Monaco bridge chỉ gửi offset / hiện Content Widget; `NavigateToEntity` tái sử dụng. Insight giữ Ctrl+Click segment + vá `OpenPath`/resolve nếu cần.

**Tech Stack:** C# LS, Monaco Content Widget, WebView2 bridge, xUnit

**Spec:** `docs/superpowers/specs/2026-07-22-editor-phase1-entity-nav-hover-design.md`  
**Roadmap:** Phase 1 trong `2026-07-22-editor-ux-roadmap-design.md`

## Global Constraints

- UI/bridge **không** parse XML entity; chỉ offset ↔ LS.
- Local vars: `snake_case`.
- Hover dismiss: **chỉ** khi pointer rời widget (không dùng `hoverMessage` làm UI value chính).
- Không đụng Left Panel UX; không làm Phase 2+ nav.
- `dotnet build DevWorkFlow.slnx` + test Application liên quan phải xanh.

---

## File map

| File | Role |
|------|------|
| `DevWorkFlow.Domain/Language/EntityHit.cs` (new) | DTO hit-test |
| `DevWorkFlow.Application/Language/EntityAtOffsetResolver.cs` (new) | Resolve offset → EntityHit |
| `DevWorkFlow.Application/Language/IErpLanguageService.cs` (+ impl) | Public API |
| `tests/.../EntityAtOffsetResolverTests.cs` | Unit tests |
| `tests/.../EntitySymbolSystemTests.cs` (extend) | SYSTEM OpenPath / ResolveSystemPath |
| `DevWorkFlow.Editor/Bridge/EditorHostMessages.cs` | Events/commands mới |
| `UI/Assets/EditorHost/bridge.js` | Source Ctrl+Click + Content Widget |
| `UI/Views/Controls/MonacoEditorHost.xaml.cs` | Relay events/commands |
| `UI/Views/Controls/InsightEditorSurface.xaml.cs` | Wire VM |
| `UI/ViewModels/FormBuilderViewModel.cs` | Hover resolve + Navigate |
| `DevWorkFlow.Application/Language/EntitySymbolBinder.cs` | Vá OpenPath/resolve nếu test fail |

---

### Task 1: Domain DTO + Resolver + unit tests

**Files:**
- Create: `DevWorkFlow.Domain/Language/EntityHit.cs`
- Create: `DevWorkFlow.Application/Language/EntityAtOffsetResolver.cs`
- Create: `tests/DevWorkFlow.Application.Tests/Language/EntityAtOffsetResolverTests.cs`
- Modify: `DevWorkFlow.Application/Language/IErpLanguageService.cs`
- Modify: `DevWorkFlow.Application/Language/ErpLanguageService.cs`

**Interfaces:**
- Consumes: `IErpSemanticModel.GetEntities()`, `EntitySymbol.Definition`, `References`, `DisplayText`, `RawValue`, `ResolvedPath`, `DeclarationKind`
- Produces:
  - `enum EntityHitKind { Reference, Declaration, SystemLiteral }`
  - `sealed class EntityHit` — fields dưới đây
  - `EntityAtOffsetResolver.TryResolve(IErpSemanticModel model, int offset) → EntityHit?`
  - `IErpLanguageService.ResolveEntityAtOffset(ErpDocumentId id, int offset) → EntityHit?`

```csharp
// EntityHit.cs
namespace DevWorkFlow.Domain.Language;

public enum EntityHitKind
{
    Reference = 0,
    Declaration = 1,
    SystemLiteral = 2
}

public sealed class EntityHit
{
    public required string EntityName { get; init; }
    public required string SymbolId { get; init; }
    public EntityHitKind HitKind { get; init; }
    public string DefinitionPath { get; init; } = string.Empty;
    public int DefinitionOffset { get; init; } = -1;
    public string OpenPath { get; init; } = string.Empty;
    public string DisplayText { get; init; } = string.Empty;
    public bool IsError { get; init; }
}
```

- [ ] **Step 1: Failing tests** (dùng pattern open document qua LS giống `EntitySymbolSystemTests`)

```csharp
[Fact]
public void Resolve_hits_reference_amp_entity()
{
    // XML: DOCTYPE Entity Hello "hi" + body &Hello;
    // offset giữa &Hello; → HitKind.Reference, DisplayText chứa "hi"
}

[Fact]
public void Resolve_hits_declaration_name()
{
    // offset trên tên trong <!ENTITY Hello ...> → Declaration
}

[Fact]
public void Resolve_miss_returns_null()
{
    // offset trong text thường → null
}

[Fact]
public void Resolve_system_entity_sets_open_path()
{
    // SYSTEM file fixture tồn tại → OpenPath = full path, File.Exists
}
```

Viết XML fixture inline (temp file cho SYSTEM path) giống tests entity hiện có.

- [ ] **Step 2: Run — expect FAIL**

```bash
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~EntityAtOffsetResolverTests"
```

- [ ] **Step 3: Implement resolver**

```csharp
public static class EntityAtOffsetResolver
{
    public static EntityHit? TryResolve(IErpSemanticModel model, int offset)
    {
        if (offset < 0) return null;
        EntityHit? best = null;
        var best_len = int.MaxValue;

        foreach (var entity in model.GetEntities())
        {
            // Definition span
            var def = entity.Definition.Span;
            if (Contains(def, offset))
                Consider(ref best, ref best_len, ToHit(entity, EntityHitKind.Declaration, def.Length));

            foreach (var reference in entity.References)
            {
                var span = reference.Location.Span;
                if (!Contains(span, offset)) continue;
                Consider(ref best, ref best_len, ToHit(entity, EntityHitKind.Reference, span.Length));
            }
        }

        return best;
    }

    private static bool Contains(SourceSpan span, int offset)
        => span.Length > 0 && offset >= span.StartOffset && offset < span.StartOffset + span.Length;

    private static EntityHit ToHit(EntitySymbol entity, EntityHitKind kind, int span_len) => new()
    {
        EntityName = entity.Name,
        SymbolId = entity.Id,
        HitKind = kind,
        DefinitionPath = entity.Definition.Path ?? string.Empty,
        DefinitionOffset = entity.Definition.Span.StartOffset,
        OpenPath = entity.DeclarationKind == EntityDeclarationKind.ExternalSystem
            ? entity.ResolvedPath ?? string.Empty
            : string.Empty,
        DisplayText = !string.IsNullOrEmpty(entity.DisplayText)
            ? entity.DisplayText
            : entity.RawValue ?? string.Empty,
        IsError = !entity.IsResolved && entity.DeclarationKind == EntityDeclarationKind.ExternalSystem
    };

    private static void Consider(ref EntityHit? best, ref int best_len, EntityHit hit)
    {
        // Prefer smaller span (nested / tighter match)
        var len = /* pass span length into hit or compare separately */;
        ...
    }
}
```

Gắn `ResolveEntityAtOffset` trên `ErpLanguageService` → lấy document → `TryResolve(semantic, offset)`.

**SystemLiteral:** nếu chưa có span riêng cho path string, Phase 1 chấp nhận Declaration hit trên cả `<!ENTITY … SYSTEM "…">` span định nghĩa (Ctrl+Click trong thẻ ENTITY vẫn navigate). Nếu definition span **không** phủ SYSTEM path, mở rộng binder trong Task 1b (cùng PR): gắn span system_id — chỉ khi test SYSTEM click path fail.

- [ ] **Step 4: Tests PASS**

- [ ] **Step 5: Commit** (khi user yêu cầu)

---

### Task 2: Insight SYSTEM OpenPath — verify + fix

**Files:**
- Modify/extend: `tests/DevWorkFlow.Application.Tests/EntitySymbolSystemTests.cs`
- Possibly: `EntitySymbolBinder.cs` (`Segment`, `ResolveSystemPath`)

- [ ] **Step 1: Add test** — entity SYSTEM relative `..\Include\...` từ file Dir; assert `ClearTextSegments` có segment `Kind=System`, `OpenPath` = `Path.GetFullPath(...)`, `File.Exists`.

- [ ] **Step 2: Run — fix binder nếu fail** (base directory = thư mục file chứa `<!ENTITY>`, normalize `/` và `\`).

- [ ] **Step 3: Manual note trong PR** — Insight Ctrl+Click vùng SYSTEM trên form thật.

---

### Task 3: Bridge Source Ctrl+Click + host relay

**Files:**
- Modify: `DevWorkFlow.Editor/Bridge/EditorHostMessages.cs`
- Modify: `UI/Assets/EditorHost/bridge.js`
- Modify: `UI/Views/Controls/MonacoEditorHost.xaml.cs`
- Modify: `UI/Views/Controls/InsightEditorSurface.xaml.cs`
- Modify: `UI/ViewModels/FormBuilderViewModel.cs`

**Interfaces:**
- Event: `EditorHostEvents.EntityOffsetActivated = "entityOffsetActivated"` payload `{ offset: number }`
- Host: `event Action<int>? EntityOffsetActivated`
- VM: `OnEntityOffsetActivated(int offset)` → `ResolveEntityAtOffset` → map `EntityNavigationRequest` → `NavigateToEntity`

- [ ] **Step 1: Constants**

```csharp
// EditorHostEvents
public const string EntityOffsetActivated = "entityOffsetActivated";
```

- [ ] **Step 2: bridge.js — mở rộng onMouseDown**

```javascript
editor.onMouseDown(function (e) {
    if (!e.event || !(e.event.ctrlKey || e.event.metaKey)) return;
    if (!e.target || !e.target.position) return;
    var model = editor.getModel();
    if (!model) return;
    var offset = model.getOffsetAt(e.target.position);

    if (lastShowInsights) {
        // giữ hành vi segment hiện có
        var segment = segmentAt(offset);
        if (!segment || segment.isError) return;
        post({ event: 'openEntityRequested', payload: { ... } });
        return;
    }

    // Source mode
    post({ event: 'entityOffsetActivated', payload: { offset: offset } });
});
```

- [ ] **Step 3: MonacoEditorHost HandleEvent** — parse offset, raise `EntityOffsetActivated`.

- [ ] **Step 4: InsightEditorSurface** wire → `FormBuilderViewModel.OnEntityOffsetActivated`.

```csharp
public void OnEntityOffsetActivated(int offset)
{
    if (ErpDocument is null || _language_service is null) return;
    var hit = _language_service.ResolveEntityAtOffset(ErpDocument.Id, offset);
    if (hit is null)
    {
        StatusMessage = "Không có entity tại vị trí này.";
        return;
    }
    NavigateToEntity(new EntityNavigationRequest
    {
        EntityName = hit.EntityName,
        SymbolId = hit.SymbolId,
        DefinitionPath = hit.DefinitionPath,
        DefinitionOffset = hit.DefinitionOffset,
        OpenPath = hit.OpenPath
    });
}
```

Đảm bảo `EntityNavigationRequest` đã có các property này (đang dùng cho Insight).

- [ ] **Step 5: Build + manual Source Ctrl+Click**

```bash
dotnet build UI/UI.csproj
```

---

### Task 4: Hover virtual view (Content Widget)

**Files:**
- Modify: `EditorHostMessages.cs` — commands/events hover
- Modify: `bridge.js` — widget DOM + mouse tracking
- Modify: `MonacoEditorHost.xaml.cs`, `InsightEditorSurface`, `FormBuilderViewModel`

**Interfaces:**
- Event JS→C#: `entityHoverRequested` `{ offset, insight: bool }`
- Command C#→JS: `showEntityHover` `{ name, value, isError }` + position from last mouse (JS giữ client coords)
- Command: `hideEntityHover`
- Optional: `entityHoverCopyResult` status

**UX rules:**
1. Debounce mousemove ~120ms → `entityHoverRequested`.
2. C#: resolve hit (Source: offset API; Insight: segmentAt tương đương — gửi offset, host map ClearText→source **hoặc** resolve bằng symbol từ segment nếu host cache segments; đơn giản nhất Insight: dùng cùng Source map qua `ClearTextOffsetMap.ToSource` nếu có, else resolve DisplayText by entity name from deepest segment via post payload `entityName` từ JS).
3. **Insight hover value:** bridge đã có `segmentAt`; post `{ entityName, symbolId, offset }` → C# `FindEntity` → `DisplayText`.
4. JS `showEntityHover`: Content Widget dưới caret/mouse; HTML:

```html
<div class="dwf-entity-hover">
  <div class="hdr"><span class="name"></span><button type="button" class="copy">Copy</button></div>
  <pre class="body"></pre>
</div>
```

CSS: `max-height: 280px; overflow: auto; min-width: 220px; max-width: 480px; z-index high`.

5. `mouseenter` trên widget → `hoverPinned = true`; `mouseleave` widget → hide + `hoverPinned = false`.
6. Khi move sang token khác: nếu `hoverPinned` (pointer đang trên widget) **không** hide; nếu không pinned, cập nhật nội dung / hide nếu miss.
7. Tắt hoặc rút ngắn `hoverMessage` decoration (chỉ tên 1 dòng hoặc null) để không đè widget.

**Copy:**

```javascript
copyBtn.onclick = function () {
  var text = bodyEl.textContent || '';
  if (navigator.clipboard && navigator.clipboard.writeText)
    navigator.clipboard.writeText(text);
};
```

- [ ] **Step 1: Wire messages + stub show/hide in bridge**

- [ ] **Step 2: VM handlers** `OnEntityHoverRequested` → `SendCommand showEntityHover`

- [ ] **Step 3: Manual matrix**

| Action | Expected |
|--------|----------|
| Hover `&X;` Source | Widget hiện value |
| Scroll value dài | Scroll trong widget |
| Copy | Clipboard đúng |
| Move token → widget | Không đóng |
| Leave widget | Đóng |
| Insight hover SYSTEM expand | Hiện value (nội dung file) |

- [ ] **Step 4: Build + tests regression EntityAtOffset**

```bash
dotnet test tests/DevWorkFlow.Application.Tests/DevWorkFlow.Application.Tests.csproj --filter "FullyQualifiedName~Entity"
dotnet build DevWorkFlow.slnx
```

---

### Task 5: Phase 1 verify + roadmap note

- [ ] Checklist spec §8 tất cả `[x]`
- [ ] Cập nhật roadmap Phase 1:

```markdown
**Progress:** Done — Source Ctrl+Click/hover widget; Insight SYSTEM nav verified.
```

- [ ] Link artifacts trên roadmap (giống Phase 0)
- [ ] Handoff: Phase 2 tiếp theo (field→view, controller Lookup, clientScript→fn)

---

## Spec coverage

| Spec | Task |
|------|------|
| Source Ctrl+Click reference/declaration | 1 + 3 |
| Source hover virtual view + Copy + dismiss | 4 |
| Insight SYSTEM Ctrl+Click | 2 (+ 3 giữ segment) |
| No UI XML parse | 1–4 |
| Tests ResolveSystem / OpenPath | 1–2 |

## Placeholder scan

SystemLiteral span riêng chỉ mở nếu Declaration không đủ — điều kiện rõ trong Task 1. Không TBD khác.
