# ERP Navigation Service — Hiện trạng

> Cập nhật: 2026-07-17  
> Thuộc ERP Language Service. Editor chỉ là Rendering Engine.
> Mô hình theo **LSP** (DocumentSymbol / definition / references), driven bởi **XSD schema**.

## Nguyên tắc

- Consumer (Outline / Designer / Validation / AI) **không** search XML, line, offset, regex.
- Mọi điều hướng: **NodeId** hoặc **Symbol** → `IErpNavigationService` → `NavigationTarget` → Editor.ScrollTo.
- Tên API: `IErpNavigationService` / `ErpNavigationService` (tránh trùng UI page `INavigationService`).
- **Generic theo schema**: cấu trúc XML FBO cố định → Outline ánh xạ 1-1 cây element,
  không hard-code từng loại. Một builder dùng cho mọi controller (Dir/Grid/Lookup/Report/Notify).
- **Ngoại lệ duy nhất**: `<script>` chứa JavaScript → tách `function` thành node con.

## Luồng

```text
XML → Parser → AST ── (XSD schema: xs:key) ──▶ Navigation Map (DocumentSymbol) → Editor
                    └─ Semantic Model (offset-match: gắn Symbol) ─┘
```

## Schema-driven (XSD)

- `XsdSchemaCatalog` đọc `Schemas/*.xsd`, lấy attribute định danh từ `xs:key` / `xs:unique`:
  `field`→`@name`, `command`→`@event`, `view`→`@id`, `action`→`@id`, `category`→`@index`.
- Fallback nếu element không có key: `name, id, event, index, value, key`.
- Tên hiển thị node = giá trị attribute định danh (đọc trực tiếp từ start-tag trong AST).

## Gắn Symbol (offset-match)

- Với mỗi element node, tra Semantic Model theo **StartOffset** → gắn `SymbolId` + `Symbol`.
- Không hard-code per-kind: `field:*`, `command:*`, `view:*`, `script:*`, `response:*`, `entity:*`
  đều khớp tự động → `GoToDefinition` / `FindReferences` / Designer field-sync hoạt động.

## Types (Domain)

| Type | Vai trò |
|------|---------|
| `NodeId` | Guid ổn định (deterministic từ document + symbol key) |
| `DocumentNode` | Id, ParentId, NodeType, offsets/lines, Children, SymbolId |
| `DocumentModel` | Cây document + DocumentUri |
| `TextRange` | Start/End offset cho Editor (do Map cung cấp) |
| `NavigationTarget` | NodeId, DocumentUri, TextRange, NodeType, Symbol |
| `INavigationMap` | Lookup node / symbol → target |
| `IErpNavigationService` | GoToNode, GoToDefinition, FindReferences, PeekDefinition, FindChildren/Parent, FindSymbol |

## Implementation (Application)

| Type | Vai trò |
|------|---------|
| `XsdSchemaCatalog` | Đọc XSD → attribute định danh mỗi element |
| `NavigationMapBuilder` | AST + schema → DocumentModel + Map (generic) |
| `NavigationMap` | Index NodeId / SymbolId |
| `ErpNavigationService` | API; rebuild khi Open/Reload document |
| `IErpLanguageService.Navigation` | Entry point |

Outline = cây element thật (NodeType = tên element), ví dụ Dir:

```text
dir (Customer)
├─ title
├─ fields ── field[ma_kh], field[ten_kh], …      (name theo @name)
├─ views  ── view[Dir], view[Form]               (name theo @id)
├─ commands ── command[Showing], command[Loading] (name theo @event)
├─ script ── function active$FormCustomer, …      (JS — PreferCaretOnly)
├─ response ── action[Suggestion]                 (resolve từ &XMLSuggestion;)
├─ css
└─ entities ── entity[…]                          (từ DTD)
```

- **Views**: mọi `<view id="…">` đều là node, có TextRange.
- **Script**: `PreferCaretOnly`; Editor không Select trên dòng dài (>512) — tránh treo CDATA.
- **Response**: `&Entity;` resolve thành fragment (`action` …), navigate về thẻ `<response>`.
- **text / header / footer / label**: ẩn (chỉ là body/caption) — navigate qua node cha.

## Entity resolve (INCLUDE / IGNORE)

- `EntitySymbolBinder` dùng **XmlDocument** làm authoritative resolver (conditional sections `<![%Cond;[...]]>`).
- Regex chỉ thu thập declaration + offset (kể cả trong IGNORE); **giá trị active** lấy theo XmlDocument:
  - SYSTEM bị IGNORE ghi đè → Inline `""` (không giữ file SYSTEM sai).
  - RawValue **không** lấy từ `XmlEntity.Value` (đã expand nested) — giữ text khai báo trong source.
- Parameter `%Name;` giữ `DeclarationKind.Parameter` (không ép ExternalSystem).
- Insight chỉ render `&entity;` general trong **body** document; bỏ `%parameter;` / DOCTYPE.
- Đọc `Navigation.GetOutlineRoots(documentId)`.
- Click → `GoToNode(NodeId)` → `FormBuilderViewModel.NavigateToTarget`.

## Editor

- `NavigateToTarget(NavigationTarget)` — Scroll theo `TextRange`.
- Designer: nếu Symbol là Field → sync selection (không JumpCode riêng).

## API nhanh

```csharp
var target = language.Navigation.GoToNode(doc.Id, nodeId);
form.NavigateToTarget(target);

var def = language.Navigation.GoToDefinition(doc.Id, "field:ma_kh");
var refs = language.Navigation.FindReferences(doc.Id, "entity:ClientDefault");
```
