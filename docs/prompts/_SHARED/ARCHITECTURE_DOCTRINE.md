# DevWorkFlow — Architecture Doctrine (Nguồn tham chiếu chung cho mọi AI)

> File này KHÔNG dành để đọc bởi con người mỗi ngày.
> File này dành để bất kỳ AI nào (Cursor, Claude Code, GitHub Copilot, hoặc AI khác)
> nạp vào context **trước khi** sinh code, review code, hoặc thiết kế tính năng cho DevWorkFlow.
>
> Mọi prompt trong `prompts/Cursor`, `prompts/Claude`, `prompts/Copilot` đều giả định
> AI đã đọc và tuân thủ tài liệu này. Nếu có mâu thuẫn giữa một prompt cụ thể và
> tài liệu này, **tài liệu này luôn thắng**.

---

## 1. DevWorkFlow là gì

DevWorkFlow là IDE chuyên biệt cho FBO ERP. Nó không cạnh tranh với VS Code / Visual Studio.
Mục tiêu: người dùng làm việc với **ERP Language** (khái niệm ngữ nghĩa: Entity, Command,
Workflow, SQL, JavaScript, Metadata...), không thao tác trực tiếp XML.

## 2. 10 nguyên tắc bất biến (Core Principles)

1. **XML is Storage** — XML chỉ là định dạng lưu trữ, không phải mô hình làm việc.
2. **Semantic Model is Single Source of Truth** — mọi tính năng đọc/ghi qua Semantic Model,
   không module nào tự tạo Semantic Model riêng.
3. **ERP Language Service là trái tim hệ thống** — chỉ nó được Parse XML, Resolve Entity/Symbol.
4. **Editor is a Rendering Platform** — Editor (Monaco) không chứa Business Logic.
5. **Tree is a Framework** — dùng lại cho Explorer/Outline/Workflow/Database/AI; Tree không biết ERP/XML/SQL.
6. **Navigation by Symbol** — không bao giờ theo số dòng (Line Number).
7. **Insight over Tooltip** — thông tin hiển thị inline trong Editor, không dùng Tooltip/Popup/MessageBox làm kênh chính.
8. **AI Works on Semantic Model** — AI không đọc/ghi XML trực tiếp.
9. **Everything is a Provider** — mở rộng qua Plugin/Provider, tuyệt đối không sửa Core.
10. **Clean Separation** — UI / Language / Workflow / Editor / Tree / Database / AI / Plugin: mỗi thành phần một trách nhiệm.

## 3. Sơ đồ tầng (không được vi phạm hướng phụ thuộc)

```
Workspace (UI)
   ↓
Application Layer (Commands, Navigation, Search, Document/Workspace Manager, Plugin Manager)
   ↓
Core Services: ERP Language Service | Editor Platform | Tree Framework | Workflow Engine | Plugin System | AI Platform
   ↓
Infrastructure: XML Storage | SQL Server | Git | FileSystem | Configuration | Logging
```
Không phụ thuộc ngược. Không Circular Dependency.

## 4. Architectural Rules (bắt buộc, trích từ 01-ARCHITECTURE.md)

- R1: UI không được Parse XML.
- R2: UI không được truy cập Database trực tiếp.
- R3: Editor không chứa Business Logic.
- R4: Tree Framework không biết ERP.
- R5: Workflow không sửa XML trực tiếp.
- R6: AI không đọc XML.
- R7: Navigation dựa trên Symbol, không dựa trên dòng.
- R8: Insight là lớp hiển thị, không sửa Source.
- R9: Plugin không sửa Core.
- R10: Không module nào phụ thuộc trực tiếp vào Monaco — chỉ Editor Platform được phép.

## 5. Module map (để AI biết nên đặt code ở đâu)

| Module | Trách nhiệm | Không được làm |
|---|---|---|
| `DevWorkFlow.Language` (ERP Language Service) | Parse, Semantic Model, Entity/Symbol Resolve, Diagnostics, Completion, Navigation, Refactoring, Formatting, Search | Render UI, biết Monaco/WPF |
| `DevWorkFlow.Editor` (Editor Platform) | Document/Caret/Selection/Decoration/Completion-render/Theme/Clipboard/Message Bridge, Monaco Adapter | Parse XML, Resolve Entity, Business Logic |
| `DevWorkFlow.Tree` (Tree Framework) | TreeNode, TreeDataSource, Virtualization, Lazy Loading, Cache, Selection/Expansion | Biết XML/SQL/ERP/Workflow |
| `DevWorkFlow.Workflow` (Workflow Engine) | Node/Connection/Runtime/Scheduler/Action Dispatcher/Transaction/Event Bus | Parse XML, gọi UI trực tiếp |
| `DevWorkFlow.Plugin` (Plugin System) | Manifest, Loader, Host, Provider Registry, Extension Point | Truy cập Internal API, Monaco, DB nội bộ |
| `DevWorkFlow.Application` | Command routing, Navigation, Search, Document/Workspace Manager | Thao tác XML |
| `DevWorkFlow.UI` (Workspace) | Hiển thị (WPF + AvalonDock), Ribbon/Toolbar/Command Palette | Business Logic |
| `DevWorkFlow.Infrastructure` | XML I/O, SQL, Git, File System, Config, Logging (Serilog) | — |

## 6. Coding Standards tóm tắt (chi tiết: 08-CODING_STANDARDS.md)

- SOLID, Composition over Inheritance, Interface First (`I` prefix), Dependency Injection (không `new Service()` trực tiếp).
- Async First: `await x.OpenAsync()`; cấm `Task.Result`, `Task.Wait()`, `Thread.Sleep()`.
- Không God Class, không Static Service / Service Locator, không Utility/Helpers/Common folder.
- Project chia theo Layer (`DevWorkFlow.Core/Application/Language/Editor/Tree/Workflow/Plugin/Infrastructure/UI`), không chia theo tính năng vụn.
- Class > 500 dòng / Method > 50 dòng → cân nhắc tách nhỏ.
- Logging bằng Serilog, không `Console.WriteLine`, không `MessageBox` để debug.
- Mọi Public API cần XML Doc comment. Coverage Unit Test mục tiêu ≥ 80% cho Core.
- Conventional Commit: `feat(editor): ...`, `fix(tree): ...`, `docs(language): ...`.
- Mọi thao tác đổi dữ liệu đi qua Command (Rename/Delete/Move/Format/Generate/Navigation/Undo/Redo) để hỗ trợ Undo/Redo thống nhất.

## 7. Các ADR nền tảng (không được đi ngược lại)

- **ADR-0001**: ERP Language Service là nơi DUY NHẤT được Parse XML / tạo Semantic Model.
- **ADR-0002**: Monaco Editor chạy qua WebView2, chỉ giao tiếp qua Editor Platform (Adapter Pattern) — Monaco có thể bị thay thế mà không ảnh hưởng Core.
- **ADR-0003**: Tree Framework dựa trên `TreeDataSource`/`TreeNode`/`TreeProvider`/`TreeRenderer`, virtualization + lazy loading bắt buộc cho dữ liệu lớn.
- **ADR-0004**: Insight Layer là lớp hiển thị độc lập trên Source (không sửa XML, không Tooltip/Popup), qua Insight Provider Pipeline.
- **ADR-0005**: Editor Platform là API duy nhất cho mọi thao tác Editor; không module nào gọi Monaco/WebView2 trực tiếp.
- **ADR-0006**: Semantic Model là Source of Truth của toàn bộ ERP Program; chỉ Serializer được ghi XML.
- **ADR-0007**: Workspace là Runtime Context (Projects/Documents/Editors/Sessions/AI Context/Plugin Context/Layout) — không module nào tự lưu Session riêng.
- **ADR-0008**: Plugin Architecture dựa trên Capability Model + Message Bus + Permission Model; Plugin không được biết nhau, không Patch Core.

## 8. Khi AI được yêu cầu sinh code / thiết kế, LUÔN tự hỏi

1. Tính năng này thuộc layer nào? (xem mục 5)
2. Có đang thao tác XML trực tiếp ở nơi không phải ERP Language Service không? → Sai.
3. Có đang gọi Monaco API ở ngoài Editor Platform / Monaco Adapter không? → Sai.
4. Navigation có dùng SymbolId thay vì Line Number không?
5. Thông tin hiển thị có nên là Insight (inline) thay vì Tooltip/Popup/MessageBox không?
6. Tính năng có thể triển khai dưới dạng Plugin/Provider thay vì sửa Core không?
7. Có Unit Test đi kèm không? Có Cancellation Token cho việc chạy nền không?
8. Đã dùng DI thay vì `new` trực tiếp chưa?

## 9. Roadmap Capability Level hiện tại

Xem `09-ROADMAP.md`. Roadmap theo **Capability Level**, không theo thời gian:
`L0 Foundation → L1 Workspace Foundation (hiện tại) → L2 ERP Language Service → L3 Intelligent Editor
→ L4 Visual Development → L5 Workflow & Automation → L6 AI Native IDE → L7 Platform Ecosystem`.
Khi được giao task, AI nên hỏi/nhắc: "Task này thuộc Capability Level nào?" nếu không rõ,
để tránh sinh code vượt quá phạm vi Level hiện tại (ví dụ: đừng sinh Plugin Marketplace khi dự án còn ở L1).

## 10. Tài liệu gốc (đường dẫn tương đối tới repo docs)

`00-VISION.md`, `01-ARCHITECTURE.md`, `02-ERP_LANGUAGE_SERVICE.md`, `03-EDITOR_PLATFORM.md`,
`04-TREE_FRAMEWORK.md`, `05-WORKFLOW_ENGINE.md`, `06-PLUGIN_SYSTEM.md`, `07-UI_GUIDELINES.md`,
`08-CODING_STANDARDS.md`, `09-ROADMAP.md`, `10-DEVWORKFLOW_BOOK.md`,
`ADR-0001..0008`.

AI nên đọc trực tiếp các file này nếu cần chi tiết sâu hơn mức tóm tắt ở trên.
