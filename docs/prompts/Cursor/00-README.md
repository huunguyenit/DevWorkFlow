# Cursor Prompts — DevWorkFlow

Đây là "AI Development Kit" cho Cursor khi làm việc trên DevWorkFlow.
Mục tiêu: mọi prompt đều bắt Cursor hiểu **triết lý kiến trúc** trước khi sinh code,
thay vì chỉ sinh code theo yêu cầu bề mặt.

## Cách dùng

1. `.cursorrules` được Cursor tự nạp cho mọi request trong repo — không cần copy tay.
2. Với từng loại công việc, mở file tương ứng, copy nội dung vào Chat/Composer,
   điền phần `<...>` rồi gửi kèm yêu cầu cụ thể.
3. Luôn đính kèm (`@file`) tài liệu kiến trúc liên quan nếu Cursor hỗ trợ, ví dụ:
   `@01-ARCHITECTURE.md @02-ERP_LANGUAGE_SERVICE.md` khi làm việc trong Language module.

## Danh mục prompt

| File | Dùng khi |
|---|---|
| 01-LOAD_PROJECT.md | Bắt đầu phiên làm việc mới, cần Cursor nạp toàn bộ bối cảnh dự án |
| 02-CREATE_FEATURE.md | Tạo tính năng mới end-to-end |
| 03-IMPLEMENT_TASK.md | Triển khai 1 task cụ thể trong Sprint/Roadmap |
| 04-REFACTOR.md | Refactor code hiện có |
| 05-FIX_BUG.md | Sửa lỗi |
| 06-CODE_REVIEW.md | Review Pull Request / diff |
| 07-WRITE_TEST.md | Viết Unit Test |
| 08-UPDATE_DOCS.md | Cập nhật tài liệu .md khi kiến trúc/API thay đổi |
| 09-GENERATE_ADR.md | Sinh ADR mới khi có quyết định kiến trúc |
| 10-GENERATE_SPECS.md | Sinh tài liệu đặc tả kỹ thuật cho 1 module/feature |
| 11-GENERATE_PLUGIN.md | Sinh khung Plugin mới |
| 12-GENERATE_LANGUAGE_FEATURE.md | Thêm tính năng cho ERP Language Service |
| 13-GENERATE_EDITOR_FEATURE.md | Thêm tính năng cho Editor Platform |
| 14-GENERATE_TREE_PROVIDER.md | Thêm TreeDataSource/Provider mới |
| 15-GENERATE_WORKFLOW.md | Thêm Workflow Node/Action mới |
| 16-GENERATE_INSIGHT_PROVIDER.md | Thêm Insight Provider mới |
| 17-GENERATE_UI.md | Sinh màn hình/control tuân theo UI Guidelines |
| 18-PERFORMANCE.md | Rà soát hiệu năng (Parse/Render/Tree/Workflow) |
| 19-ARCHITECTURE_REVIEW.md | Kiểm tra compliance với ADR/Architectural Rules |
| 20-RELEASE.md | Checklist trước khi release 1 Capability |

Tài liệu nền tảng dùng chung: xem `../_SHARED/ARCHITECTURE_DOCTRINE.md`,
`../_SHARED/UI_GUIDELINES_SUMMARY.md`, `../_SHARED/GLOSSARY.md`.
