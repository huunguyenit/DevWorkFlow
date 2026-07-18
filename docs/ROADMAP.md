# FBO Studio — Product Architecture Roadmap

> Cập nhật: 2026-07-17  
> Trạng thái: Working roadmap  
> Phạm vi: Kiến trúc sản phẩm hiện tại và lộ trình chuyển sang ERP Language Service

## 1. Mục tiêu sản phẩm

FBO Studio là IDE chuyên biệt cho phát triển và triển khai FBO ERP.

XML chỉ là định dạng lưu trữ. Form Designer, SQL Studio, Search, Navigation,
Refactor, Validation, Workflow và AI phải sử dụng chung ERP Language Service
và ERP Semantic Model.

Các nguyên tắc kiến trúc:

1. Semantic First, không XML First.
2. Entity là Symbol, không phải String.
3. UI không tự parse, search hoặc replace XML.
4. Chỉ Language Service được chuyển đổi giữa storage và semantic.
5. Mỗi bước triển khai phải build, test và commit độc lập.
6. Không hard-code metadata ERP; hỗ trợ nhiều phiên bản qua cấu hình.
7. Không over-engineering: ưu tiên vertical slice nhỏ nhưng dùng được.
8. Editor chỉ render `InsightItem`; business logic nằm trong Language Service/Provider.
9. Mode chuẩn: Source / Insight (mặc định) / Designer.

---

## 2. Kiến trúc hiện tại (As-Is)

### 2.1 Solution

Solution hiện gồm:

```text
DevWorkFlow.slnx
├── docs/
├── DevWorkFlow.Domain
├── DevWorkFlow.Application
├── DevWorkFlow.Infrastructure
├── UI
└── tests/ (Domain.Tests, Application.Tests)
```

Luồng dependency đang được sử dụng bởi ứng dụng:

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

Folder `Core/`, `Infrastructure/` (root), `ViewModels/` là legacy trên disk,
ngoài solution (ADR-001). Chi tiết: [`ARCHITECTURE.md`](ARCHITECTURE.md),
[`DECISIONS.md`](DECISIONS.md).

### 2.2 Runtime composition

Ứng dụng WPF khởi tạo dependency thủ công tại `UI/App.xaml.cs`.

```text
Program/Web.config
        │
        ▼
Infrastructure adapters
  SQL, file system, settings
        │
        ▼
Application services/engines
        │
        ▼
Domain models
        │
        ▼
WPF ViewModels / Views
```

Các thành phần shell hiện có:

- IDE shell, ribbon, menu, status bar.
- Document tabs và active document theo từng tab.
- Dock trái/phải/dưới, splitter resize.
- Explorer từ `wcommand` và Project Explorer.
- Outline, Properties, Toolbox, XML/Output/Error/Log panes.

### 2.3 Module hiện có

#### Program và Navigation

- Đọc Program và connection string từ `Web.config`.
- Đọc cây menu từ `sys.wcommand`.
- Resolve một sys với nhiều app database từ `sys.entity`.
- Resolve menu → ASPX → Controller → Dir/Filter/Grid/Lookup/Report/Template.
- Nhận diện file liên quan từ controller.

#### Form Builder

- Parse Dir, Filter, Grid, Lookup thành các model FBO.
- Render Design Surface, fields, views và layout.
- Property Grid, Toolbox, Outline và multi-document tabs.
- Code-only view cho Report, Include, Template và Main.

#### Entity

- Scan khai báo DTD và external entity.
- Resolve entity file và hiển thị Source/ClearText gần đúng.
- Document Transformer dùng inline visual.
- SQL extraction có expand entity.

#### SQL Studio

- Mở file SQL hoặc trích command/query từ controller.
- Chọn Sys hoặc đúng App database.
- Chạy toàn script hoặc vùng selection.
- Hiển thị messages và nhiều result sets.

#### XML/code tooling

- AvalonEdit, syntax highlighting và line navigation.
- Search/Replace.
- Structure tree theo tags và JavaScript functions.
- F12 tới function definition trong cùng document.

### 2.4 Điểm tốt hiện tại

- Đã tách được Domain/Application/Infrastructure/UI trên luồng chính.
- UI có shell IDE và document lifecycle đủ để phát triển tiếp.
- Các model FBO đã cung cấp nền ban đầu cho Semantic Model.
- Infrastructure adapters đã tách khỏi phần lớn WPF views.
- SQL Studio và menu navigation đã phục vụ tác vụ thực tế.

### 2.5 Technical debt kiến trúc

Hệ thống hiện vẫn là giai đoạn chuyển tiếp, chưa đạt Semantic First:

1. Có nhiều parser/scanner riêng cho cùng storage:
   - `FboXmlParser`
   - `XmlFormParser`
   - `XmlStructureParser`
   - `ControllerRelatedFileResolver`
   - `FboSqlFragmentExtractor`
2. Một số module search/regex trực tiếp trên chuỗi XML.
3. ~~Entity map/scanner riêng.~~ (Phase 4 đã thay bằng `EntitySymbolBinder`.)
4. Source View, ClearText View và Semantic View chưa dùng chung document model.
5. Navigation/F12 mới giới hạn trong document, chưa có symbol index toàn workspace.
6. Writer chưa phải lossless serializer dựa trên syntax/semantic changes.
7. Domain hiện chứa cả model FBO mới và model workflow/template cũ.
8. Có project/class trùng giữa nhánh legacy và nhánh `DevWorkFlow.*`.
9. ~~Chưa có test project chính thức trong solution.~~ (Phase 0 đã thêm)
10. Docs As-Is/To-Be đã có; vẫn cần cập nhật khi migrate Language Service.

Các phần XML-first hiện tại được xem là adapter tạm thời. Không mở rộng thêm
logic nghiệp vụ trong Editor hoặc View; tính năng mới phải đi qua Language
Service.

---

## 3. Kiến trúc đích (To-Be)

```text
Storage
  XML / .f / Include / SQL / wcommand / metadata
                    │
                    ▼
ERP Language Service
├── Workspace & Document Store
├── Lexer / Lossless Syntax Tree
├── Parser
├── Semantic Binder
├── ERP Semantic Model
├── Symbol Table & Reference Index
├── Diagnostics
├── Navigation
├── Search / Rename / Refactor
├── Code Actions
└── Serializer / Storage Adapters
                    │
                    ▼
Product Features
├── Form Designer
├── Source Mode
├── Insight Mode
├── Designer Mode
├── SQL Studio
├── Workflow Designer
├── Deployment
├── Plugins
└── AI Assistant
```

### 3.1 Layer trách nhiệm

#### DevWorkFlow.Domain

Chứa khái niệm ERP độc lập với WPF, SQL client và file system:

- `ErpWorkspace`
- `ErpDocument`
- `ErpSemanticModel`
- `ErpSymbol`
- `EntitySymbol`
- `ControllerSymbol`
- `FieldSymbol`
- `ViewSymbol`
- `CommandSymbol`
- `ScriptFunctionSymbol`
- `ResponseActionSymbol`
- `SourceLocation`
- `SymbolReference`
- diagnostics và metadata contracts

#### DevWorkFlow.Application

Chứa ERP Language Service và use cases:

- Load/close/reload document.
- Parse và bind semantic.
- Resolve entity và reference.
- Search symbol.
- Go to Definition / Find References.
- Validation và diagnostics.
- Rename/refactor.
- Semantic edit và serialize.
- Version/profile metadata ERP.

#### DevWorkFlow.Infrastructure

Chỉ chứa adapter:

- File system/document storage.
- SQL Server/wcommand/entity repository.
- Web.config và Program discovery.
- Settings/cache/logging.
- Serializer implementation và file watcher.

Infrastructure không chứa business rules của ERP language.

#### UI

WPF chỉ:

- Bind semantic view models.
- Gửi command tới Language Service.
- Render Source/ClearText/Semantic projections.
- Hiển thị diagnostics, symbols và navigation results.

UI không parse hoặc replace XML.

### 3.2 Document model thống nhất

Mỗi file mở trong IDE tương ứng một `ErpDocument`:

```text
ErpDocument
├── DocumentId
├── StorageSnapshot
├── SyntaxTree
├── SemanticModel
├── Diagnostics
├── Version
└── IsDirty
```

Ba chế độ hiển thị dùng cùng document:

- **Source Mode:** XML lossless, không resolve.
- **Insight Mode (mặc định):** Source + virtual `InsightItem` layers.
- **Designer Mode:** giao diện cuối, thao tác Semantic Model, không hiển thị XML.

Insight Provider chỉ đọc Semantic Model và sinh `InsightItem`; không render,
không sửa XML và không thao tác UI.

### 3.3 Entity model

`EntitySymbol` tối thiểu gồm:

```text
Name
DisplayText
RawValue
Type
DefinitionLocation
References
ResolvedDocument
Metadata
Diagnostics
```

Entity resolution phải hỗ trợ:

- Inline entity.
- External SYSTEM entity.
- Parameter entity và nested include.
- Cycle detection.
- Missing/invalid definition diagnostics.
- Find Definition/References.
- Inline edit qua semantic change.

---

## 4. Roadmap triển khai

## Phase 0 — Baseline và governance — Hoàn thành (2026-07-17)

**Mục tiêu:** tạo đường biên an toàn trước khi refactor.

Đã giao:

- Docs: Architecture, Decisions (ADR), Project Status, Roadmap.
- Legacy: giữ disk, ngoài solution.
- Test projects Domain/Application; golden đọc SP226 in-place.
- `global.json` + CI Windows; build/test command chuẩn.
- CS8604 trong `FboXmlParser` đã xử lý.

Gate đạt khi: `dotnet build` / `dotnet test` trên `DevWorkFlow.slnx` thành công
(có SP226 hoặc skip rõ khi thiếu).

---

## Phase 1 — Language Service contracts — Hoàn thành (2026-07-17)

**Mục tiêu:** tạo API ổn định để UI không phụ thuộc parser XML.

Đã giao:

- Domain contracts trong `DevWorkFlow.Domain/Language` (cùng project Domain trong slnx).
- `IErpLanguageService` + `ErpLanguageService` adapter (Reader/Parser hiện tại).
- Lifecycle open / reload / close / snapshot; workspace in-memory.
- UI mở/đóng document qua Language Service; hành vi Form Designer không đổi.
- Contract tests (synthetic + SP226).

Gate đạt: build/test xanh; UI wire mỏng (ADR-005).

---

## Phase 2 — Lossless syntax layer — Hoàn thành (2026-07-17)

**Mục tiêu:** một parser duy nhất giữ được toàn bộ source trivia và location.

Đã giao:

- `FboLexer` / `FboSyntaxParser` / `ISyntaxTree` (Domain + Application).
- Source span + `LineMap`; DOCTYPE/ENTITY/ScriptIsland/SqlIsland nodes.
- Error recovery (BadToken, ERP1001).
- `XmlStructureParser` = projection từ syntax tree (ADR-006).
- `IErpDocument.SyntaxTree` khi open/reload.
- Golden round-trip SP226 (Customer, SODetail, Report) + synthetic.

Gate đạt: parse → serialize exact; invalid XML không throw; Structure vẫn hoạt động.

---

## Phase 3 — ERP Semantic Model — Hoàn thành (2026-07-17)

**Mục tiêu:** bind syntax thành khái niệm ERP.

Đã giao:

- `ErpSemanticBinder` + `ErpSemanticModel` (Controller/Field/View/Command/Query/Script/Response).
- Semantic tree Dir/Filter/Grid/Lookup + Report stub từ syntax.
- `ErpMetadataProfile` stub; diagnostics ERP2001 (duplicate field).
- `LegacyDocument` chuyển tiếp cho Design mapper (ADR-007).
- FormBuilder không gọi `FboXmlParser`; Outline từ FieldSymbol.

Gate đạt: Design từ semantic bind; Outline/Properties qua symbols/selection; VM không parse XML.

---

## Phase 4 — Entity Symbol System — Hoàn thành (2026-07-17)

**Mục tiêu:** thay map string entity bằng symbol graph.

Đã giao:

- `EntitySymbolBinder`: inline/SYSTEM/parameter entity, nested include graph.
- Definition/reference index; diagnostics ERP3001..ERP3004 (missing, cycle,
  unresolved reference, duplicate).
- Source/ClearText/Semantic projections từ cùng `IErpDocument`.
- `GetEntityDefinition` / `FindEntityReferences` qua Language Service.
- Semantic inline edit cho inline và external entity; source giữ `&Entity;`.
- FormBuilder/AvalonEdit dùng `EntitySymbol`, không dùng dictionary nội dung.
- Related-file discovery dùng ClearText projection.
- Đã xóa `FboEntityScanner`, `FboEntityExpander`, `FboControllerXmlReader` và
  `FboXmlEntityLoader` (ADR-008).

Gate đạt: ba projection cùng document; inline/external edit giữ entity reference;
definition/references có location xuyên nested include.

Migration sau Architecture Freeze 1.0:

- UI dùng Source/Insight/Designer; ClearText projection chỉ còn adapter nội bộ cho
  SQL/related trong giai đoạn chuyển tiếp.
- Entity Insight render reference read-only và resolved value editable.
- Nested entity render theo `InsightItem.Children`, không flatten.

---

## Phase 5 — Workspace Symbol Index và IDE navigation

**Mục tiêu:** navigation cấp Program/workspace giống IDE.

Deliverables:

- [x] Workspace index in-memory cho controller, field, script function, command,
  response và entity.
- [x] Incremental index khi open/reload/close document.
- [x] Public search/definition/reference APIs.
- [x] Insight Provider Pipeline foundation (`Entity`, `Validation`).
- Go to Definition.
- Find References.
- Semantic Search.
- Related files dựa trên references.
- File watcher/re-index khi file ngoài IDE thay đổi.

Migration:

- F12 không regex trong editor.
- Navigation menu không scan `items.controller` hoặc `showForm` trực tiếp.
- Structure/Outline lấy symbol hierarchy.

Gate:

- F12 xuyên file và entity include.
- Search theo tên hiển thị, tên symbol và metadata.
- Thời gian update index đáp ứng thao tác interactive.

---

## Phase 6 — Semantic editing và serializer

**Mục tiêu:** mọi thay đổi source đi qua semantic change.

Deliverables:

- Change set/transaction model.
- Add/remove/update Field, View, Command và Response.
- Rename Symbol.
- Serializer lossless.
- Undo/redo theo semantic transaction.
- Conflict detection khi file ngoài IDE thay đổi.

Migration:

- `FboXmlWriter` trở thành serializer adapter hoặc được thay thế.
- Search/Replace text chỉ tồn tại trong Source View như thao tác source có kiểm
  soát; refactor dùng symbol APIs.

Gate:

- Designer không ghi XML trực tiếp.
- Rename cập nhật references đúng phạm vi.
- Round-trip và undo/redo tests pass.

---

## Phase 7 — SQL Language integration

**Mục tiêu:** SQL Studio hiểu ngữ cảnh ERP, không chỉ chạy text.

Deliverables:

- Command/query symbols liên kết với SQL documents.
- Parameter/context inference từ controller semantics.
- App/Sys target metadata.
- Diagnostics trước khi execute.
- Go to Definition giữa command, entity SQL và controller.
- Result schema inspection.

Gate:

- Mở SQL từ semantic command/query.
- Entity SQL resolve qua symbol system.
- Execute selection và batch runner không bị regression.

---

## Phase 8 — Product expansion

Thực hiện sau khi Language Service ổn định:

- Workflow Designer dùng Semantic Model.
- Deployment planner dựa trên symbol/reference graph.
- Plugin SDK trên Language Service contracts.
- AI Assistant chỉ gọi semantic commands.
- Multi ERP Version Support qua metadata/profile packages.
- Project-wide validation và impact analysis.

Mỗi module phải có vertical slice riêng, không mở rộng đồng thời.

---

## 5. Thứ tự ưu tiên gần nhất

```text
P0  Baseline tests + docs
P0  Language Service contracts
P0  Lossless syntax tree
P0  ERP Semantic Model cơ bản
P0  EntitySymbol
P1  Migrate Designer/Outline/Structure
P1  Workspace symbol index + F12
P1  Semantic serializer/editing
P2  SQL semantic integration
P2  Workflow/Deployment/Plugin/AI
```

Không thêm tính năng XML editor mới trước khi có contract tương ứng trong
Language Service.

---

## 6. Chiến lược migration

Áp dụng Strangler Pattern, không rewrite toàn bộ:

1. Đặt interface Language Service trước code hiện tại.
2. Bọc parser/model hiện tại bằng adapter.
3. Viết implementation mới theo từng semantic slice.
4. Chuyển từng consumer UI sang API mới.
5. Khi không còn consumer, xóa parser/scanner cũ.
6. Mỗi migration phải có regression test và build gate.

Một slice hợp lệ:

```text
Syntax → Semantic → Language API → ViewModel → View → Tests
```

Không tạo thêm parser tạm trong UI để “đi nhanh”.

---

## 7. Quality gates

Mọi phase phải đáp ứng:

- `dotnet build DevWorkFlow.slnx` thành công.
- Unit tests và golden tests thành công.
- Không thêm dependency ngược layer.
- Không thêm XML parsing vào UI/ViewModel.
- Không truyền entity dưới dạng string nếu API symbol đã tồn tại.
- Public API có XML documentation.
- Có migration note cho consumer cũ.
- Commit nhỏ, một mục đích, có thể revert độc lập.

Chỉ số cần theo dõi:

- Parse/bind latency.
- Incremental update latency.
- Peak memory theo số document.
- Search/F12 response time.
- Số parser/scanner XML còn tồn tại.
- Số UI consumer đã migrate sang Semantic Model.
- Round-trip fidelity.

---

## 8. Definition of Done cho nền tảng Language Service

Nền tảng được xem là đủ để phát triển sản phẩm khi:

1. Mỗi file trong Program có `ErpDocument`.
2. Dir/Filter/Grid/Lookup/Report có semantic model thống nhất.
3. Entity là `EntitySymbol` với definition và references.
4. Source/ClearText/Semantic View là projection cùng document.
5. Designer chỉ đọc/ghi semantic changes.
6. Search, F12, Find References và Rename dùng symbol index.
7. Serializer round-trip không làm mất source.
8. SQL command/query liên kết được với controller semantics.
9. UI không còn parser XML riêng.
10. AI/Workflow/Deployment dùng chung public Language Service API.

---

## 9. Ngoài phạm vi roadmap gần

Chưa ưu tiên trước khi hoàn thành Phase 1–5:

- Marketplace/plugin distribution.
- Cloud collaboration.
- AI tự động sửa source không qua semantic command.
- Rewrite toàn bộ UI.
- Thay công nghệ WPF.
- Tối ưu deployment nâng cao.

Các mục này không được làm chậm việc hình thành ERP Language Service.

