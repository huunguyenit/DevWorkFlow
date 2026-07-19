# CLAUDE.md — DevWorkFlow Project Memory

> File này được Claude Code tự động nạp khi mở repo (đặt tại root project: `/CLAUDE.md`).
> Xem đầy đủ doctrine tại `prompts/_SHARED/ARCHITECTURE_DOCTRINE.md`.

## Dự án là gì

DevWorkFlow — IDE chuyên biệt cho FBO ERP, xây dựng bằng WPF (.NET 8/9) + Monaco Editor (WebView2).
Không phải IDE đa năng, không cạnh tranh với VS Code.

## Nguyên tắc bắt buộc (đọc kỹ trước khi sửa bất kỳ file nào)

- **XML is Storage** — chỉ dùng để lưu, không phải mô hình làm việc.
- **Semantic Model = Single Source of Truth**, do **ERP Language Service** DUY NHẤT tạo/quản lý.
- **Editor Platform** là API DUY NHẤT chạm tới Monaco. Editor không chứa Business Logic.
- **Tree Framework** không biết XML/SQL/ERP — chỉ biết `TreeNode`/`TreeDataSource`.
- **Navigation theo SymbolId**, không theo số dòng.
- **Insight over Tooltip** — thông tin ngữ nghĩa hiển thị inline, không MessageBox/Popup.
- **Plugin/Provider** cho mọi mở rộng — không sửa Core.
- DI bắt buộc, Async First (cấm `.Result`/`.Wait()`/`Thread.Sleep()`), SOLID, không God Class.

## Cấu trúc project

```
/src
  DevWorkFlow.Core
  DevWorkFlow.Application
  DevWorkFlow.Language       (ERP Language Service)
  DevWorkFlow.Editor         (Editor Platform + Monaco Adapter)
  DevWorkFlow.Tree           (Tree Framework)
  DevWorkFlow.Workflow       (Workflow Engine)
  DevWorkFlow.Plugin         (Plugin System)
  DevWorkFlow.Infrastructure
  DevWorkFlow.UI
/tests
/docs                        (00-VISION.md ... 10-DEVWORKFLOW_BOOK.md, ADR-0001..0008)
```

## Trước khi code, tự kiểm tra (đối chiếu `_SHARED/ARCHITECTURE_DOCTRINE.md` mục 8)

1. Task chạm layer nào? Đặt code đúng project tương ứng.
2. Có Parse XML ngoài `DevWorkFlow.Language` không → sai.
3. Có gọi Monaco API ngoài `DevWorkFlow.Editor` không → sai.
4. Navigation có dùng SymbolId không?
5. Hiển thị thông tin có nên là Insight thay vì Tooltip/Popup không?
6. Có thể làm dưới dạng Plugin thay vì sửa Core không?
7. Có Unit Test kèm theo không (đặc biệt Parser/Semantic/Navigation/Serializer/Workflow/Tree)?
8. Roadmap: task này thuộc Capability Level nào (`09-ROADMAP.md`)? Đừng vượt phạm vi Level hiện tại.

## Lệnh hữu ích (điều chỉnh theo project thật)

```bash
dotnet build
dotnet test
dotnet test --collect:"XPlat Code Coverage"
```

## Quy ước

- Class PascalCase, Interface bắt đầu bằng `I`, field private `_camelCase`.
- Conventional Commit: `feat(editor): ...`, `fix(tree): ...`, `docs(language): ...`.
- Không tạo `Utils/Helpers/Common/Misc` — tổ chức theo domain.
- Mọi Public API cần XML doc comment.

## Slash Commands có sẵn (`.claude/commands/`)

`/new-feature`, `/implement-task`, `/fix-bug`, `/refactor`, `/code-review`, `/write-test`,
`/generate-adr`, `/generate-plugin`, `/architecture-review`, `/release-check`
— nội dung tương ứng với bộ prompt đầy đủ trong `prompts/Claude/*.md`
(bản mở rộng của các lệnh trên, dùng khi cần prompt chi tiết hơn ngoài Claude Code CLI).

## Không được làm

- Không tự ý mở rộng phạm vi ngoài Roadmap Level hiện tại mà không hỏi lại.
- Không merge thẳng code do AI sinh ra mà chưa qua review/test theo `08-CODING_STANDARDS.md`.
- Không sửa ADR đã "Accepted" trừ khi rơi vào điều kiện "Future Review" ghi trong chính ADR đó.
