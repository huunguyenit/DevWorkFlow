# DevWorkFlow — Specs Index

Specs mô tả **hành vi** (behavior) của từng feature, không phải implementation.
Architecture (`/docs/0X-*.md`, `/docs/adr/ADR-000X-*.md`) luôn là nguồn sự thật cao hơn Spec.

Sinh spec mới bằng bộ prompt trong `prompts/`:
- Cursor: `prompts/Cursor/10-GENERATE_SPECS.md`
- Claude Code: `/generate-spec` (xem `prompts/Claude/.claude/commands/generate-spec.md`)
- Copilot: `prompts/Copilot/.github/prompts/generate-spec.prompt.md`

Cấu trúc bắt buộc của mỗi spec: [`prompts/_SHARED/SPEC_TEMPLATE.md`](../prompts/_SHARED/SPEC_TEMPLATE.md).

Danh sách tổng hợp gap + thứ tự ưu tiên xử lý: [`GAPS_AND_PRIORITIES.md`](GAPS_AND_PRIORITIES.md).

## Modules

| Folder | Kiến trúc liên quan |
|---|---|
| `explorer/` | 04-TREE_FRAMEWORK.md, ADR-0003 |
| `editor/` | 03-EDITOR_PLATFORM.md, ADR-0002, ADR-0004, ADR-0005 |
| `workflow/` | 05-WORKFLOW_ENGINE.md |
| `language/` | 02-ERP_LANGUAGE_SERVICE.md, ADR-0001, ADR-0006 |
| `designer/` | 09-ROADMAP.md (Level 4), 01-ARCHITECTURE.md |
| `plugin/` | 06-PLUGIN_SYSTEM.md, ADR-0008 |
| `ai/` | 09-ROADMAP.md (Level 6), 01-ARCHITECTURE.md |
| `database/` | 04-TREE_FRAMEWORK.md, 05-WORKFLOW_ENGINE.md |

## Đã có spec

Viết 2026-07-19, dựa trên rà soát trực tiếp mã nguồn (không chỉ đọc docs) — mỗi spec ghi
rõ `Status` (Implemented/Interim/Design-ahead) theo đúng định nghĩa trong
`SPEC_TEMPLATE.md`.

### language/ (ERP Language Service)
- [`parsing-and-semantic-model.md`](language/parsing-and-semantic-model.md) — Implemented. Parser (lossless) → Syntax Tree → Semantic Builder → Semantic Model, vòng đời Document. Gap: không Incremental/Cache/Cancellation/Event.
- [`entity-resolution.md`](language/entity-resolution.md) — Implemented. Resolve `&Entity;`, nested, cycle detection (file + value), missing/unreadable file.
- [`symbol-navigation.md`](language/symbol-navigation.md) — Implemented (Go To Definition đầy đủ; Find References đầy đủ chỉ cho Entity, các Symbol khác — "Phase 5" theo code).
- [`diagnostics-pipeline.md`](language/diagnostics-pipeline.md) — Implemented. Danh sách đầy đủ mã ERP0001-3010 hiện có.

### editor/
- [`entity-insight-rendering.md`](editor/entity-insight-rendering.md) — Spec mẫu (worked example) mô tả **hành vi mục tiêu** theo ADR-0002/0004/0005 (Monaco + Editor Platform). Status: Interim — đã bổ sung mục "Implementation Status" ghi rõ các điểm implementation thật (AvalonEdit) chưa đạt.
- [`insight-editor-surface.md`](editor/insight-editor-surface.md) — Interim. Mô tả CHÍNH XÁC implementation AvalonEdit hiện tại đang chạy (khác Monaco), kể cả các điểm lệch mục tiêu cụ thể (search không tìm theo Resolved Value, Validation không render inline, Undo/Redo cấp IDE là no-op stub).

### explorer/
- [`project-explorer.md`](explorer/project-explorer.md) — Implemented (phạm vi hẹp — không Context Menu, không session persistence).
- [`outline.md`](explorer/outline.md) — Implemented, **nhưng phát hiện 2 implementation song song không nhất quán** (`OutlineViewModel` đúng kiến trúc vs. `XmlStructureOutlineViewModel` vi phạm Rule R1 + R7) — cần dọn dẹp, xem mục "Known Issue" trong spec.

### database/
- [`database-explorer-tree.md`](database/database-explorer-tree.md) — Implemented (browse + open script; không có run/export trực tiếp từ Tree). Xác nhận tuân thủ Rule R2 (UI không gọi SQL trực tiếp).

### designer/
- [`form-builder-canvas.md`](designer/form-builder-canvas.md) — Implemented cho phần "semantic layout inspector/editor" (zoom/pan/grid/snap/guideline, resize column-span qua SelectionChrome, Property Grid 2 chiều với XML thật); Design-ahead (Level 4 thật sự) cho Toolbox kéo-thả + free-form resize + Insert/Split/Merge/Delete Column (code cũ cho việc này đã bị xoá như dead code, xem mục Dead code đã xoá). **Sửa lại nhận định ban đầu rằng Designer "chưa triển khai"** — một phần đáng kể đã chạy thật, xem mục Verdict/Correction trong spec.

### workflow/
- [`template-manager.md`](workflow/template-manager.md) — Implemented. Không liên quan chức năng tới Automation Engine mô tả trong 05-WORKFLOW_ENGINE.md (vẫn hoàn toàn Design-ahead, Level 5) — đặt tạm ở `workflow/` vì chưa có thư mục phù hợp hơn (xem Known Doc Drift).
- **`approval-state-machine-prototype.md` đã bị xoá (2026-07-19)**: spec này từng mô tả `WorkflowEngine`/`WorkflowDefinition`/`WorkflowInstance`/`NodeDefinition`/`ConnectionDefinition` — một approval-flow state machine prototype có code hoạt động đúng thiết kế nhưng ZERO caller trong toàn bộ ứng dụng (không DI, không ViewModel/Page nào dùng) và không khớp với Automation Engine của 05-WORKFLOW_ENGINE.md. Sau khi xác nhận với chủ dự án, code cụm này đã bị xoá như dead code (xem Known Doc Drift mục 6) nên spec cũng bị xoá theo — không còn code để mô tả.

### ai/, plugin/
Chưa có spec — đúng thực tế: rà soát mã nguồn xác nhận **không có code nào** cho AI
Platform hay Plugin System (không tìm thấy Plugin Loader/Manifest/Provider Registry, không
tìm thấy AI Provider nào). README trong từng thư mục (`ai/README.md`, `plugin/README.md`)
giữ nguyên placeholder — đúng trạng thái Design-ahead.

## Known Doc Drift (phát hiện khi viết đợt spec 2026-07-19)

Ghi lại ở đây để người đọc sau không mất công phát hiện lại — đã báo cáo và xác nhận
hướng xử lý với chủ dự án trong phiên viết spec này:

1. **09-ROADMAP.md ghi "Current Capability: Level 1 — Workspace Foundation"**, nhưng mã
   nguồn thực tế đã có: ERP Language Service khá đầy đủ (Level 2), Go To Definition/Find
   References một phần (Level 3), và một Layout Designer bán-tương tác thật (một phần
   Level 4) — xem các spec `language/*`, `designer/form-builder-canvas.md`. Roadmap Level
   hiện tại KHÔNG phản ánh đúng trạng thái code; cần rà soát lại 09-ROADMAP.md riêng
   (ngoài phạm vi đợt viết spec này — spec chỉ mô tả hành vi, không sửa Roadmap).
2. **ADR-0002 (Accepted) chọn Monaco + WebView2 và explicitly reject AvalonEdit**, nhưng
   Editor thực tế đang chạy bằng AvalonEdit thuần. Đã xác nhận với chủ dự án: giữ
   AvalonEdit làm giải pháp **tạm thời** (Interim), KHÔNG sửa ADR-0002 (vẫn là đích chính
   thức). **Cập nhật 2026-07-19**: đã xây bước 1 của lộ trình — project mới
   `DevWorkFlow.Editor` chứa `IEditorPlatform`/`IEditorDocumentService`/
   `IEditorSelectionService`/`IEditorDecorationService` (đúng ADR-0005), implementation
   duy nhất là `FormBuilderEditorPlatform` (Adapter bọc `FormBuilderViewModel`, zero đổi
   hành vi, build+test xanh). **Chưa migrate consumer nào** sang dùng interface này (7
   ViewModel vẫn phụ thuộc thẳng `FormBuilderViewModel`), và **Monaco Adapter thật vẫn
   chưa có timeline** — xem `editor/insight-editor-surface.md` mục Future Extension.
3. **Hai implementation Outline song song, một vi phạm Rule R1 + R7** — xem
   `explorer/outline.md` mục Known Issue.
4. **Undo/Redo cấp IDE (Ctrl+Z/Ctrl+Y) hiện là no-op stub** (comment trong code xác nhận
   "Stubs an toàn — không crash") — ảnh hưởng mọi spec có Command đổi dữ liệu, xem
   `editor/insight-editor-surface.md` mục Commands.

## Dead code đã xoá (2026-07-19)

Audit toàn bộ solution: đối chiếu chéo mọi type declaration qua cả `.cs` và `.xaml`
(không chỉ `.cs` — bỏ sót XAML từng gây false positive), xác minh thủ công từng candidate
(constructor call site, XAML placement, event wiring) trước khi xoá — không dựa theo suy
đoán của agent nghiên cứu code. Đã xoá các cụm xác nhận zero caller trong toàn bộ ứng dụng:

- `XmlFormParser.cs`, `FormDefinition.cs`, `FieldDefinition.cs`, `IFormService`
  (interface + implementation `FormService` trong `InMemoryServices.cs`) — pipeline Form
  song song, không liên quan pipeline FBO thật (`FboXmlParser`/`FboFormModel`); chỉ được
  inject vào `FormBuilderViewModel`/`TemplateManagerViewModel`, không method nào từng
  được gọi.
- `InteractiveFormRuler.cs`, `FormRuler.cs`, và 6 method liên quan trên
  `FormBuilderViewModel` (`ApplyColumnWidth`, `ApplyCategoryColumnWidth`,
  `RulerInsertColumn`, `RulerDeleteColumn`, `RulerSplitColumn`, `RulerMergeColumns` + các
  private helper riêng của chúng). **Phát hiện quan trọng**: spec
  `designer/form-builder-canvas.md` bản đầu (dựa theo báo cáo của agent nghiên cứu code)
  từng khẳng định đây là "column ruler tương tác đầy đủ" — SAI, xác minh trực tiếp qua
  grep toàn bộ `.xaml` cho thấy control này chưa từng được đặt vào bất kỳ trang nào. Spec
  đã được sửa lại (xem mục Correction trong file đó) — bài học ghi lại ở đó để tránh lặp
  lại kiểu lỗi này (tin báo cáo của một agent đọc 1 file riêng lẻ mà không xác minh điểm
  gắn kết thật).
- `WorkflowEngine.cs`, `WorkflowDefinition.cs`, `NodeDefinition.cs`, và phần
  `WorkflowInstance`/`WorkflowStatus` trong file cũ (file còn lại đổi tên thành
  `TemplateItem.cs` vì chỉ còn giữ class `TemplateItem` thật đang dùng, từng nằm chung
  file với code chết). Approval-flow state machine hoạt động đúng thiết kế nhưng zero
  caller và không khớp Automation Engine của 05-WORKFLOW_ENGINE.md — đã xác nhận xoá với
  chủ dự án trước khi thực hiện; spec `workflow/approval-state-machine-prototype.md` xoá
  theo.
- `XmlSemanticNodeMeta` (trong `TreeNodeMeta.cs`) — đã bị thay thế bởi `OutlineNavTag`
  (định nghĩa trong `OutlineViewModel.cs`) làm metadata thật cho Outline node navigation.
- `FboAppType`, `FboDatabaseName`, `FboSchemaPaths` (trong `FboSchemaEnums.cs`) — zero
  usage ngoài file khai báo; `FboDataType`/`FboAggregateType` cùng file được GIỮ LẠI vì
  có usage thật (`FboXmlParser`, `FboField`, `FieldPropertySchema`).

`dotnet build` + `dotnet test` sau khi xoá: build sạch (chỉ còn cảnh báo NuGet advisory
có sẵn từ trước, không liên quan), toàn bộ 75 test hiện có (Application/Domain/Tree) pass.

**Không xoá** dù cũng zero caller hiện tại, vì `04-TREE_FRAMEWORK.md` mô tả tường minh đây
là DataSource dự kiến cho tương lai — thuộc phạm vi tài liệu, không phải mảnh vỡ mồ côi:
`StubDataSources.cs` (`WorkflowDataSource`, `EntityDataSource`, `AIResultDataSource`, base
`StubTreeDataSource`).
