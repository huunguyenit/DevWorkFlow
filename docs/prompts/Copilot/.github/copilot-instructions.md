# GitHub Copilot Instructions — DevWorkFlow

DevWorkFlow là IDE chuyên biệt cho FBO ERP (WPF .NET 8/9 + Monaco Editor qua WebView2).
Không phải IDE đa năng. Xem đầy đủ: `prompts/_SHARED/ARCHITECTURE_DOCTRINE.md`.

## Nguyên tắc bắt buộc khi gợi ý code

- **XML is Storage**: chỉ dùng để lưu, KHÔNG phải mô hình làm việc. Chỉ code trong
  `DevWorkFlow.Language` được phép Parse XML / Resolve Entity / Resolve Symbol.
- **Semantic Model = Single Source of Truth**, chỉ đọc (immutable); thay đổi qua Command/Transaction.
- **Editor Platform** là API DUY NHẤT chạm Monaco. Không gợi ý gọi Monaco API/WebView2 trực tiếp
  từ code ngoài `DevWorkFlow.Editor`.
- **Tree Framework** (`DevWorkFlow.Tree`) không được biết XML/SQL/ERP — chỉ `TreeNode`/`TreeDataSource`.
- **Navigation theo SymbolId**, không theo Line Number.
- **Insight over Tooltip**: hiển thị thông tin ngữ nghĩa inline qua Insight Layer, không MessageBox/Popup.
- Mở rộng qua **Plugin/Provider**, không sửa Core (`DevWorkFlow.Core`).
- Dependency Injection bắt buộc — không gợi ý `new SomeService()` trực tiếp trong constructor caller.
- Async First — không gợi ý `.Result`, `.Wait()`, `Thread.Sleep()`.
- Không gợi ý tạo folder `Utils/Helpers/Common/Misc` — tổ chức theo domain.
- Interface bắt đầu bằng `I`. Class PascalCase. Field private `_camelCase`.
- Logging bằng Serilog — không `Console.WriteLine`.

## Cấu trúc project

`DevWorkFlow.Core / Application / Language / Editor / Tree / Workflow / Plugin / Infrastructure / UI`.
Hướng phụ thuộc: `UI → Application → Language → Infrastructure`. Không phụ thuộc ngược.

## Khi gợi ý test

Ưu tiên test cho Parser, Semantic, Navigation, Serializer, Workflow, Tree (coverage mục tiêu ≥ 80%).
Mock các Interface `I<Name>Service`.

## Xem thêm

Xem các file `.github/instructions/*.instructions.md` cho quy tắc theo từng thư mục cụ thể,
và `.github/prompts/*.prompt.md` cho các tác vụ có sẵn (dùng qua `/` trong Copilot Chat).
