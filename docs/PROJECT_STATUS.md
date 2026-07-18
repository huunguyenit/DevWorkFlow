# FBO Studio — Project Status

> Cập nhật: 2026-07-17  
> Giai đoạn: Pre-alpha / Architecture Transition  
> Roadmap hiện hành: [`ROADMAP.md`](ROADMAP.md)

## 1. Tóm tắt

FBO Studio đã vượt khỏi phạm vi Include Manager ban đầu và hiện có nền tảng
của một IDE chuyên biệt cho FBO ERP:

- IDE shell với dock, tabs, ribbon, menu và status bar.
- Navigation theo `wcommand` và Project Explorer.
- Form Designer cho Dir, Filter, Grid và Lookup.
- Entity preview/editing ở mức prototype.
- SQL Studio với Sys/App target và execution theo selection.
- XML/code tooling dựa trên AvalonEdit.

Nền Language Service hiện có lossless syntax, ERP Semantic Model, EntitySymbol
graph, workspace symbol index và Insight Provider Pipeline cơ bản.

Trạng thái roadmap hiện tại: **Phase 5 đang triển khai** — Workspace Symbol Index và IDE navigation.

---

## 2. Build health

Kiểm tra gần nhất ngày 2026-07-17:

```text
dotnet build DevWorkFlow.slnx
Build succeeded. 0 Warning(s) 0 Error(s)

dotnet test DevWorkFlow.slnx
Passed: Domain.Tests 7, Application.Tests 44
(golden + LS + syntax + semantic/entity/index/insight)
```

Lệnh chuẩn (pin SDK qua `global.json`):

```text
dotnet restore DevWorkFlow.slnx
dotnet build DevWorkFlow.slnx --no-restore
dotnet test DevWorkFlow.slnx --no-build
```

CI: [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) (Windows + .NET 10).
Golden tests đọc `SP226/` in-place (hoặc `FBO_PROGRAM_PATH`); thiếu corpus thì skip.

---

## 3. Kiến trúc solution hiện tại

```text
DevWorkFlow.slnx
├── docs/
├── DevWorkFlow.Domain
├── DevWorkFlow.Application
├── DevWorkFlow.Infrastructure
├── UI
└── tests/
    ├── DevWorkFlow.Domain.Tests
    └── DevWorkFlow.Application.Tests
```

Dependency path chính:

```text
UI
├── DevWorkFlow.Application
├── DevWorkFlow.Domain
└── DevWorkFlow.Infrastructure

DevWorkFlow.Infrastructure
├── DevWorkFlow.Application
└── DevWorkFlow.Domain

DevWorkFlow.Application
└── DevWorkFlow.Domain
```

Ứng dụng sử dụng WPF, MVVM và manual composition tại `UI/App.xaml.cs`.

Các folder `Core/`, `Infrastructure/` (root), `ViewModels/` còn trên disk nhưng
**không** nằm trong solution (ADR-001). Chi tiết: [`ARCHITECTURE.md`](ARCHITECTURE.md),
[`DECISIONS.md`](DECISIONS.md).

---

## 4. Trạng thái module

### 4.1 IDE Shell — Hoạt động

Đã có:

- Main window, menu bar, ribbon và status bar.
- Dock trái/phải/dưới.
- Splitter thay đổi kích thước pane.
- Multi-document tabs.
- Mỗi Form document có `FormBuilderViewModel` riêng.
- Active tab đồng bộ Design, Outline, Properties và XML pane.
- Output, Error List và Log panes.

Giới hạn:

- Docking là implementation nội bộ tối giản.
- Chưa có layout persistence hoàn chỉnh.
- Composition root vẫn là manual DI.

### 4.2 Program và Navigation — Hoạt động

Đã có:

- Chọn và nhớ Program gần nhất (`%AppData%/DevWorkFlow/settings.json`).
- Startup khôi phục Program **sau** khi `LeftExplorerLoadCoordinator` gắn (Explorer không bị trống).
- Đọc connection string từ `Web.config`.
- Đọc menu từ `sys.wcommand`.
- Hiển thị `bar="-"` thành separator.
- Filter theo `bar`, `sysid`, `wmenu_id`.
- Filter chạy background, có cancellation và cập nhật TreeView theo batch.
- Resolve một sys với nhiều app database từ `sys.entity`.
- Resolve menu → ASPX → Controller resources.
- Icon và sort theo loại file.
- UI cây Menu dùng chung `ExplorerTreePanel` (xem [`EXPLORER_TREE_PANEL.md`](EXPLORER_TREE_PANEL.md)).
- File menu: mở khi **double-click**; resource load async theo nhánh (không rebuild cả cây).
- `RefreshMenu` chỉ reload menu — không refresh Explorer/Database.

Các loại resource đang hỗ trợ:

```text
Dir
Filter
Grid
Lookup
Report
Templates/Upload
Templates/Excel
Templates/Rpt
Main
```

Giới hạn:

- Related-file discovery vẫn có phần scan storage trực tiếp.
- Chưa dựa trên workspace symbol/reference index.
- Menu giữ hai graph (`MenuRoots` + clone `TreeRoots`).

### 4.3 Left Explorer TreePanel — Hoạt động

Ba tab **Explorer / Menu / Database** dùng chung `ExplorerTreePanel` + `ExplorerTreeNodeVm`.
Chi tiết as-is: [`EXPLORER_TREE_PANEL.md`](EXPLORER_TREE_PANEL.md).

#### Project Explorer (filesystem)

Đã có:

- Duyệt cấu trúc Program; lazy-load async; icon Folder/File.
- Search theo tên file + cache index; giới hạn `searchMaxHits`.
- File mở bằng double-click; folder click → expand.
- Rebuild qua coordinator khi Program đổi; nhớ Program lần cuối.

Giới hạn:

- Chưa có file watcher / index workspace thống nhất.
- Chưa lưu trạng thái expand từng folder giữa các lần mở app.
- Chưa tích hợp semantic search.

#### Database Explorer

Đã có:

- Catalog SQL từ Config; target mặc định **App**.
- Click 1 / 2 sinh script theo `database.object-actions.xml` → SQL Studio.
- Nếu đã có tab SQL active: **cập nhật nội dung**, không mở thêm tab.
- Folder object không expand sẵn; `singleClickDelayMs: 0`.

Giới hạn:

- Chưa có refresh incremental / file watcher phía DB.
- Sort / filter theo config; chưa semantic search object.

### 4.4 Form Designer — Prototype sử dụng được

Đã có:

- Parse và render Dir, Filter, Grid, Lookup.
- Form layout, categories, fields và views.
- Ruler, zoom, grid và selection marker.
- Chọn field/cell và hiển thị Property Grid.
- Thay đổi một số field/layout properties.
- Code-only mode cho Report, Include, Template và Main.
- Outline theo fields.

Giới hạn:

- Designer đang dựa trên các model `Fbo*` parse từ XML.
- Một số edit path cập nhật XML qua `FboXmlWriter`.
- Chưa có semantic transaction và lossless serializer.
- Undo/redo semantic chưa có.

### 4.5 Entity — Phase 4 hoàn thành

Đã có:

- `EntitySymbol` cho inline, SYSTEM và parameter entity.
- Nested include graph, cycle/missing/unresolved/duplicate diagnostics.
- Definition/reference locations xuyên external include.
- Source/Insight/Designer modes dùng cùng `ErpDocument`.
- Semantic inline edit cho inline/external entity.
- `EntityInsightProvider` render reference read-only + resolved value editable.
- Nested entity render dạng tree, không flatten.
- SQL/related discovery tạm dùng ClearText projection.

Giới hạn quan trọng:

- Navigation UI xuyên workspace sẽ hoàn thiện ở Phase 5.
- Transaction/undo/redo serializer đầy đủ thuộc Phase 6.

### 4.6 XML/code tooling — Prototype tạm thời

Đã có:

- AvalonEdit và XML syntax highlighting.
- Search/Replace.
- Structure tree theo toàn bộ tags.
- Nhận diện JavaScript functions trong `script`.
- Line/offset navigation.
- F12 tới function definition trong cùng document.

Giới hạn quan trọng:

- Structure, Search và F12 hiện còn dựa trên source text/regex.
- Chưa có syntax tree và workspace symbol index.
- Các chức năng này phải được migrate sang Language Service, không tiếp tục mở
  rộng bằng parser/editor logic riêng.

### 4.7 SQL Studio — Prototype sử dụng được

Đã có:

- Mở `.sql` và SQL buffer từ controller.
- Multi-document SQL tabs.
- Chọn target Sys hoặc đúng App database.
- Một sys hỗ trợ nhiều app.
- Execute toàn script hoặc vùng selection.
- Chia batch theo `GO`.
- Messages, cancellation và nhiều result sets.

Giới hạn:

- Command/query chưa phải semantic symbols.
- SQL extraction vẫn phụ thuộc storage adapter hiện tại.
- Chưa có parameter inference, diagnostics hoặc schema intelligence.

### 4.8 Template Manager — Stub

Đã có:

- Các page/VM khung cho Catalog, Document, Report và Stored.
- In-memory services phục vụ prototype UI.

Chưa có:

- Persistence thật.
- Template semantic model.
- Generator/validation thực tế.

### 4.9 Workflow — Engine code tồn tại, chưa tích hợp sản phẩm

Đã có model và engine cơ bản trong source.

Chưa có:

- Workflow Designer hoàn chỉnh.
- Integration vào shell/runtime chính.
- Semantic integration.

### 4.10 Include Manager — Chưa triển khai theo vision ban đầu

`PROJECT_STATUS.md` cũ mô tả Include Manager đọc các file `INCLUDE/IGNORE`,
nhưng module này chưa tồn tại như một feature hoàn chỉnh trong runtime hiện tại.

Include Manager chỉ nên được triển khai sau nền tảng Language Service và
`EntitySymbol`, để tránh tạo thêm một luồng xử lý file/entity riêng.

### 4.11 Deployment, Plugin và AI — Chưa triển khai

Các module này thuộc roadmap dài hạn và chưa được ưu tiên trước Phase 1–5.

---

## 5. Thành phần kỹ thuật hiện có

### Domain

Đã có:

- Models FBO cho controller/form/grid/lookup/field/layout.
- Models SQL, menu, Program và app database.
- XSD schemas.
- Một số models workflow/template cũ.

Chưa có (Phase 5+):

- Persistent workspace index/cache và file watcher

Đã có (Phase 1–4):

- Domain Language + Syntax contracts
- Lossless `ISyntaxTree` + `ErpSemanticBinder`
- FormBuilder/Outline qua Semantic Model (LegacyDocument chuyển tiếp)
- `EntitySymbolBinder` + projections + semantic entity edit
- `InsightItem`, Provider contracts và nested entity children

### Application

Đã có:

- Service abstractions.
- FBO parser/writer.
- Entity binder/projections/navigation APIs.
- Workspace symbol index + Entity/Validation Insight providers.
- SQL fragment extractor.
- XML structure parser.
- Related-file resolver.
- Lookup resolver và workflow engine.

Technical debt:

- Semantic controller vẫn dùng `FboXmlParser` như adapter chuyển tiếp.
- ~~Chưa có ERP Language Service façade.~~ (Phase 1: adapter)
- ~~Chưa có lossless syntax tree.~~ (Phase 2)
- Chưa có semantic binder đầy đủ.

### Infrastructure

Đã có:

- SQL Server integration qua `Microsoft.Data.SqlClient`.
- `WcommandRepository`.
- `EntityRepository`.
- `SqlScriptRunner`.
- `WebConfigReader`.
- Program session, app connection resolver và user settings.

Chưa có:

- File watcher.
- Backup.
- Persistent workspace index/cache.
- Logging architecture thống nhất.

### UI

Đã có:

- WPF shell và MVVM.
- AvalonEdit.
- Material Design controls.
- Form/SQL documents, dock panes và navigation.
- **Insight Mode layout (mockup functional slice):**
  - Document center: tab **Source / Insight / Designer** + `InsightEditorSurface` 3 cột (Source | Semantic Kind | Resolved Value).
  - Left dock: **Explorer / Menu / Database** (chung `ExplorerTreePanel`) + Outline.
    Chi tiết: [`EXPLORER_TREE_PANEL.md`](EXPLORER_TREE_PANEL.md).
  - Right dock: **Insight** + **Symbol Info** (bind Language Service / diagnostics); Properties/Toolbox giữ tab phụ.
  - Bottom dock mặc định **Problems** (grid `ErpDiagnostic`), **Output**, **References**, **Log**; XML bottom ẩn khỏi default.
  - Status bar: Ln/Col, badge E/W/H, editor mode; title chip **INSIGHT MODE** khi active.
  - Ribbon: Find / Replace / Go To Def / Find Ref wired tối thiểu.
- Source/Insight editor modes với generic `InsightElementGenerator`.
- `FormBuilderDiagnosticsBridge` sync `ErpDocument.Diagnostics` → Problems grid.

Technical debt:

- `FormBuilderViewModel` còn là hub lớn.
- Một số ViewModel/View vẫn biết XML/source text.
- Designer/SQL/Structure chưa hoàn toàn dùng Insight/Semantic contracts.
- Scroll sync 3 cột Insight chưa pixel-perfect; F12 workspace-wide chưa hoàn chỉnh.

---

## 6. Mức độ phù hợp Semantic First

Trạng thái tổng thể: **Chưa đạt**.

Đã có nền tảng chuyển tiếp:

- Models FBO tách khỏi WPF.
- Application và Infrastructure projects đã được hình thành.
- Multi-document lifecycle đủ để gắn `ErpDocument` trong tương lai.
- Source, Entity preview và Design đã có các surface riêng.
- Insight Mode đọc collection từ Language Service; toggle chỉ redraw.

Các vi phạm cần migrate:

1. UI/ViewModel còn giữ `XmlSource` làm nguồn sự thật.
2. Search/F12/Structure còn scan source text.
3. Related files còn nhận diện pattern trên ClearText projection.
4. Writer controller còn cập nhật storage trực tiếp.
5. SQL extraction còn parse projection riêng.
6. Workspace index chưa persistent và F12 UI chưa dùng index đầy đủ.

Quy tắc kể từ thời điểm cập nhật status:

- Không thêm XML parser mới ngoài Language Service.
- Không mở rộng logic XML trong Editor hoặc ViewModel.
- Feature mới phải bắt đầu từ semantic contract.
- Parser hiện tại chỉ được xem là adapter trong lộ trình migration.

---

## 7. Quality status

### Đã xác nhận

- Solution build thành công.
- Runtime dependency path chính tách thành Domain/Application/Infrastructure/UI.
- Các vertical slice chính đã compile cùng nhau.

### Chưa có

- Performance regression tests.
- Architecture dependency tests.

### Rủi ro hiện tại

- Refactor serializer/designer có thể làm thay đổi source hoặc mất entity references.
- Các storage adapters còn lại có thể tạo semantic result không đồng nhất.
- Chưa có UI automation bảo vệ inline Insight interaction.
- Docs cũ và code đã lệch nhau đáng kể.
- Legacy projects gây nhầm dependency và ownership.

---

## 8. Tiến trình theo roadmap

### Phase 0 — Baseline và governance: Hoàn thành

- [x] Tạo `docs/ROADMAP.md`.
- [x] Cập nhật `docs/PROJECT_STATUS.md`.
- [x] Ghi nhận kiến trúc As-Is và technical debt.
- [x] Xác nhận solution build.
- [x] Tạo `docs/ARCHITECTURE.md`.
- [x] Tạo `docs/DECISIONS.md` (ADR-001..004).
- [x] Chính sách legacy: giữ disk, ngoài solution.
- [x] Test projects Domain/Application + golden SP226 in-place.
- [x] `global.json` + GitHub Actions Windows CI.
- [x] Xử lý CS8604 trong `FboXmlParser.ParseCategories`.

### Phase 1 — Language Service contracts: Hoàn thành

- [x] `IErpLanguageService`
- [x] `IErpWorkspace`
- [x] `IErpDocument`
- [x] `IErpSemanticModel`
- [x] Symbol/reference/location/diagnostic contracts (`DevWorkFlow.Domain/Language`)
- [x] Document lifecycle (open / reload / close / snapshot)
- [x] UI wire mỏng + contract tests + ADR-005

### Phase 2 — Lossless syntax layer: Hoàn thành

- [x] Lexer / lossless syntax tree (`FboLexer`, `FboSyntaxParser`)
- [x] Source span / LineMap / error recovery
- [x] DOCTYPE / ENTITY / ScriptIsland / SqlIsland nodes
- [x] Migrate `XmlStructureParser` thành projection
- [x] `IErpDocument.SyntaxTree` + round-trip golden tests (ADR-006)

### Phase 3 — ERP Semantic Model: Hoàn thành

- [x] Bind Controller/Field/View/Command/Query/Script/Response từ SyntaxTree + Fbo* adapter
- [x] Semantic tree Dir/Filter/Grid/Lookup/Report stub
- [x] `ErpMetadataProfile` + diagnostics duplicate (ERP2001)
- [x] FormBuilder/Outline dùng Semantic Model (ADR-007)

### Phase 4 — Entity Symbol System: Hoàn thành

- [x] EntitySymbol binder / definition-reference graph
- [x] Nested include + cycle/missing diagnostics
- [x] Source/ClearText/Semantic projections
- [x] Semantic inline edit giữ entity reference
- [x] Xóa scanner/expander/string entity map (ADR-008)

### Phase 5+ — Bắt đầu

- [x] Workspace symbol index in-memory + incremental open/reload/close
- [x] Search/definition/reference APIs
- [x] Insight Provider Pipeline foundation (Entity + Validation)
- [x] UI Source/Insight mode + generic rendering engine
- [x] Insight UI layout mockup (center editor, docks, status chrome)
- [~] F12/Find References UI xuyên workspace (ribbon + bottom References; chưa workspace-wide hoàn chỉnh)
- [ ] Related-file discovery hoàn toàn dựa trên references
- [ ] File watcher/persistent index

---

## 9. Ưu tiên tiếp theo

Thứ tự thực hiện:

1. ~~Hoàn tất Phase 0 documentation và test baseline.~~
2. ~~Tạo Language Service contracts mà chưa thay đổi hành vi UI.~~
3. ~~Thêm lossless syntax/golden tests.~~
4. ~~Xây dựng Semantic Model theo vertical slice nhỏ.~~
5. ~~Triển khai `EntitySymbol`.~~
6. Migrate navigation/F12 sang workspace symbol index (Phase 5).

Không ưu tiên trước Phase 1–5:

- Thêm XML editor feature.
- Deployment nâng cao.
- Plugin marketplace.
- AI tự sửa source.
- Rewrite UI hoặc thay WPF.

---

## 10. Tài liệu liên quan

- [`PRODUCT_VISION.md`](PRODUCT_VISION.md)
- [`ARCHITECTURE.md`](ARCHITECTURE.md)
- [`DECISIONS.md`](DECISIONS.md)
- [`ERP_LANGUAGE_SERVICE.md`](ERP_LANGUAGE_SERVICE.md)
- [`AI_RULES.md`](AI_RULES.md)
- [`ROADMAP.md`](ROADMAP.md)

`docs/PROJECT_STATUS.md` là nguồn trạng thái hiện hành. Khi hoàn thành một
vertical slice hoặc thay đổi kiến trúc, file này phải được cập nhật trong cùng
change set.
