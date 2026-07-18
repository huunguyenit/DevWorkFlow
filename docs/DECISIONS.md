# FBO Studio — Architecture Decision Records

> Cập nhật: 2026-07-17

## ADR-001 — Legacy projects ngoài solution, giữ trên disk

**Status:** Accepted  
**Date:** 2026-07-17

### Context

Các project `Core/`, `Infrastructure/` (root), `ViewModels/` là bản scaffold cũ.
Chúng trùng assembly/class với `DevWorkFlow.*` và `UI/ViewModels`, không còn
trên runtime path của `UI`, và đã không còn trong `DevWorkFlow.slnx`.

### Decision

1. Không đưa legacy trở lại solution.
2. Giữ source trên disk để đối chiếu migration.
3. Không xóa ngay trong Phase 0.
4. `_ofd_test/` là scratch orphan — có thể xóa sau; không reference.

### Consequences

- Build/CI chỉ đụng 4 project runtime + tests.
- Docs phải mô tả legacy là “on disk, out of solution”.
- Tránh collision `AssemblyName=DevWorkFlow.Infrastructure`.

---

## ADR-002 — Golden tests đọc SP226 in-place

**Status:** Accepted  
**Date:** 2026-07-17

### Context

Cần baseline parse/entity/SQL/structure cho Phase 0. Copy toàn bộ SP226 (~193MB)
vào fixtures không phù hợp; Web.config Program có thể chứa credential.

### Decision

1. Tests đọc trực tiếp corpus `SP226/` trong repo (relative từ solution root).
2. Cho phép override bằng biến môi trường `FBO_PROGRAM_PATH`.
3. Nếu thiếu SP226: skip rõ ràng (không fail giả).
4. Roundtrip writer chỉ trên string synthetic nhỏ — không ghi đè file SP226.
5. CI phải checkout kèm thư mục `SP226`.

### Consequences

- Repo clone đầy đủ mới chạy đủ golden.
- Không commit thêm bản sao fixtures lớn.
- Document rõ: `.f` readable XML; nhiều command/script là `<encrypted>`.

---

## ADR-003 — CI Windows + .NET 10

**Status:** Accepted  
**Date:** 2026-07-17

### Context

UI dùng `net10.0-windows` + WPF. Không có pin SDK; máy local dùng SDK 10.0.302.

### Decision

1. Pin SDK qua `global.json` (band .NET 10).
2. CI chạy trên `windows-latest`.
3. Lệnh chuẩn: `dotnet restore` / `build` / `test` trên `DevWorkFlow.slnx`.
4. Không chạy Linux agent cho WPF.

### Consequences

- CI phản ánh đúng runtime Desktop.
- Cần GitHub Actions Windows (hoặc Azure Windows pool).

---

## ADR-004 — Không thêm XML parser ngoài Language Service

**Status:** Accepted  
**Date:** 2026-07-17

### Context

Hiện có nhiều parser/scanner XML riêng (`FboXmlParser`, `XmlStructureParser`,
entity scanner/expander, SQL extractor…). Vision yêu cầu Semantic First.

### Decision

1. Parser hiện tại là adapters tạm thời.
2. Không thêm parser/scanner XML mới trong UI hoặc ViewModel.
3. Feature mới (Search semantic, F12 workspace, Rename…) phải bắt đầu từ
   Language Service contracts (Phase 1+).
4. Khi migrate xong từng consumer, xóa parser cũ tương ứng.

### Consequences

- Phase 0 có thể thêm tests quanh adapters hiện có.
- Phase 1+ mới thống nhất Lexer/AST/Semantic.

---

## ADR-005 — Phase 1 Language Service contracts + legacy adapter

**Status:** Accepted  
**Date:** 2026-07-17

### Context

Cần API ổn định để UI không phụ thuộc parser XML trực tiếp, nhưng chưa có
lossless syntax tree (Phase 2) hay semantic binder đầy đủ (Phase 3).

### Decision

1. Contracts (`IErpDocument`, `IErpWorkspace`, `IErpSemanticModel`, symbols,
   diagnostics, locations) nằm trong **`DevWorkFlow.Domain/Language`**
   (cùng project Domain đã có trong solution — không tách project mới).
2. `IErpLanguageService` + implementation adapter nằm trong
   `DevWorkFlow.Application/Language`.
3. Adapter bọc `FboControllerXmlReader` / `FboXmlParser`; không thay parser.
4. UI mở/đóng document qua Language Service; `FormBuilderViewModel` vẫn
   `LoadControllerXml` (hành vi người dùng không đổi).
5. Semantic Phase 1 = Controller + Field stub; EntitySymbol contract có sẵn,
   binder ở Phase 4.

### Consequences

- Consumer mới phải gọi `IErpLanguageService`, không parse XML trong UI.
- Form Designer migration thật sự bắt đầu Phase 3+.
- Có thể thay adapter bằng implementation mới mà không đổi contracts.

---

## ADR-006 — Phase 2 Lossless syntax tree + Structure projection

**Status:** Accepted  
**Date:** 2026-07-17

### Context

Cần một parser duy nhất giữ trivia/location; Structure Tree và navigation
không được scan XML riêng.

### Decision

1. Syntax types nằm trong `DevWorkFlow.Domain/Language/Syntax`.
2. `FboLexer` + `FboSyntaxParser` trong Application — token phủ 100% source;
   `Serialize()` nối token = round-trip exact.
3. DOCTYPE / ENTITY / ScriptIsland / SqlIsland là syntax nodes.
4. `XmlStructureParser.Parse` trở thành projection (`SyntaxStructureProjector`).
5. `IErpDocument.SyntaxTree` gắn khi open/reload qua Language Service.
6. Error recovery: BadToken + diagnostic ERP1001, không throw.

### Consequences

- Structure Outline không còn lexer riêng.
- F12 identifier helpers vẫn đọc text tạm (Phase 5 → symbol index).
- Semantic binder (Phase 3) bind từ SyntaxTree.

---

## ADR-007 — Phase 3 ERP Semantic Model + Fbo* transitional

**Status:** Accepted  
**Date:** 2026-07-17

### Context

Cần bind syntax thành Controller/Field/View/Command/Query/Script/Response;
Designer và Outline phải dùng Semantic Model, không parse trong ViewModel.

### Decision

1. `ErpSemanticBinder` bind từ `ISyntaxTree` + adapter `FboXmlParser` (chuyển tiếp).
2. `ErpSemanticModel` giữ `LegacyDocument` (`FboControllerDocument`) để
   `FboDesignMapper` render Design — cùng lần bind, UI không gọi parser.
3. Outline đọc `FieldSymbol` từ `IErpSemanticModel.GetFields()`.
4. `ErpMetadataProfile` stub (multi-version ở Phase 8).
5. Diagnostics: ERP2001 duplicate field; Report stub từ syntax root.

### Consequences

- FormBuilder.ParseXml → Language Service → Semantic → Design.
- Phase 4 EntitySymbol; Phase 6 có thể bỏ LegacyDocument.

---

## ADR-008 — EntitySymbol graph thay scanner/expander

**Status:** Accepted  
**Date:** 2026-07-17

### Context

Entity trước Phase 4 được truyền qua `Dictionary<string,string>` và nhiều adapter
(`FboEntityScanner`, `FboEntityExpander`, `FboControllerXmlReader`). UI tự resolve,
đọc/ghi external file và Document Transformer nhận chuỗi expand.

### Decision

1. `EntitySymbolBinder` bind inline/SYSTEM/parameter entity từ lossless source.
2. Nested include tạo definition/reference graph; diagnostics ERP3001..ERP3004.
3. Source/ClearText/Semantic là projections của cùng `IErpDocument`.
4. Navigation và semantic entity edit là APIs của `IErpLanguageService`.
5. Inline edit thay value declaration hoặc resolved external file; không thay
   `&Entity;` trong controller source.
6. UI nhận `EntitySymbol`; related-file discovery nhận ClearText projection.
7. Xóa bốn entity storage adapters cũ sau khi không còn runtime consumer.

### Consequences

- Entity không còn string map trên runtime path.
- Save/edit giữ reference trong source; external file được cập nhật đúng target.
- Full workspace navigation/index vẫn thuộc Phase 5.
- Controller semantic binder vẫn giữ `FboXmlParser` adapter đến Phase 6.

---

## ADR-009 — Architecture Freeze 1.0: Insight Provider Pipeline

**Status:** Accepted  
**Date:** 2026-07-17

### Context

Chính sách ERP Language Service 1.0 thay mô hình UI
Source/ClearText/Semantic bằng Source/Insight/Designer. Editor không được tự
resolve Entity hoặc chứa business logic; mọi virtual information phải đi qua
Provider Pipeline và model chung `InsightItem`.

### Decision

1. `InsightItem` là contract chung gồm Type, Range, Priority, Layer,
   DisplayContent, Actions, Metadata và Children.
2. Provider chỉ đọc `IErpSemanticModel`/diagnostics và sinh insights; không render,
   sửa XML hoặc thao tác UI.
3. `InsightProviderPipeline` merge/sort providers; vertical slice đầu gồm Entity
   và Validation.
4. `IErpDocument.Insights` là collection đã merge của cùng document.
5. AvalonEdit dùng generic `InsightElementGenerator`; renderer dispatch theo
   InsightType.
6. Entity render hai phần: reference read-only + resolved value editable.
   Nested entity dùng `InsightItem.Children`, không flatten.
7. Insight Mode là mặc định; bật/tắt chỉ redraw, không parse/reload/clone source.
8. Loại bỏ Entity Picture-in-Picture và entity-specific generator khỏi active UI.

### Consequences

- Feature mới thêm Provider thay vì sửa editor.
- ClearText projection còn tồn tại tạm cho SQL/related adapters, không còn là
  editor mode.
- Designer, SQL, Structure và F12 tiếp tục migrate sang Semantic/Insight APIs.
- Full serializer transaction/undo-redo vẫn thuộc Phase 6.

---

## ADR-012 — ERP Navigation Service (NodeId / Symbol)

**Status:** Accepted  
**Date:** 2026-07-17

### Context

Outline/F12/Designer từng điều hướng bằng offset, line và text search — trái
spec ERP Language Service (Navigation Map).

### Decision

1. Thêm Domain contracts: `NodeId`, `DocumentNode`, `DocumentModel`, `TextRange`,
   `NavigationTarget`, `INavigationMap`, `IErpNavigationService`.
2. Application: `NavigationMapBuilder`, `NavigationMap`, `ErpNavigationService`
   gắn vào `IErpLanguageService.Navigation`.
3. Outline đọc Semantic/Document Model; click chỉ dùng `GoToNode(NodeId)`.
4. Editor chỉ `NavigateToTarget` (Scroll theo TextRange) — không search XML.
5. Tên `IErpNavigationService` để không đụng page-routing `INavigationService`.

### Consequences

- Validation/AI/Workflow/Breadcrumb/Rename mở rộng qua cùng service.
- F12 và Problems panel tiếp tục migrate sang `NavigationTarget`.
- Docs: [`NAVIGATION_SERVICE.md`](NAVIGATION_SERVICE.md).

---

## ADR-011 — Left dock TreePanel chung (Explorer / Menu / Database)

**Status:** Accepted  
**Date:** 2026-07-17

### Context

Ba tab left dock (filesystem Program, menu `wcommand`, database objects) cần
cùng UX filter/tree/activation nhưng khác nguồn dữ liệu và hành vi click.

### Decision

1. UI chung: `ExplorerTreePanel` + node `ExplorerTreeNodeVm` + contract
   `IExplorerTreeSource`.
2. Host VM riêng: `ProjectExplorerViewModel`, `NavigationViewModel` (Menu),
   `DatabaseExplorerViewModel`.
3. Program đổi → `LeftExplorerLoadCoordinator` rebuild Explorer + Database;
   Menu do `NavigationViewModel` load. Restore Program sau khi coordinator gắn.
4. Virtualization bật; Database mặc định App; script object reuse tab SQL active.
5. **Giữ nguyên logic hiện tại** — mô tả as-is trong
   [`EXPLORER_TREE_PANEL.md`](EXPLORER_TREE_PANEL.md).

### Consequences

- Đổi UX tree một chỗ ảnh hưởng cả ba tab.
- Không tách lại TreeView riêng từng tab trừ khi có lý do nghiệp vụ rõ.
- Config động qua `UI/Config/json` + SQL/XML scripts.
