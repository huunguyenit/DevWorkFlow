# Claude Prompts — DevWorkFlow

Bộ prompt này dành cho **Claude Code** (CLI/desktop) khi phát triển DevWorkFlow.

## Cách dùng

1. `CLAUDE.md` (đặt ở root repo) được Claude Code tự nạp mỗi phiên — chứa doctrine rút gọn.
2. `.claude/commands/*.md` là Slash Command — gõ `/new-feature`, `/fix-bug`... ngay trong Claude Code.
3. Các file `01-*.md` .. `20-*.md` là bản đầy đủ, dùng khi cần prompt chi tiết hơn (copy vào chat),
   hoặc dùng làm nội dung tham chiếu khi viết Slash Command mới.
4. Với task lớn, yêu cầu Claude dùng **Plan Mode** trước, liệt kê TODO qua TodoWrite, rồi mới code.

## Khác biệt so với bộ Cursor

Nội dung kiến trúc giống hệt (`prompts/_SHARED/ARCHITECTURE_DOCTRINE.md` là nguồn chung),
nhưng prompt Claude nhấn thêm:
- Dùng Plan Mode / TODO tracking cho task nhiều bước.
- Tự chạy `dotnet build` / `dotnet test` sau khi sửa code, không chỉ sinh code tĩnh.
- Có thể giao cho Subagent chuyên biệt (VD: một subagent review kiến trúc, một subagent viết test).

## Danh mục

Giống cấu trúc Cursor: 01-LOAD_PROJECT, 02-CREATE_FEATURE, 03-IMPLEMENT_TASK, 04-REFACTOR,
05-FIX_BUG, 06-CODE_REVIEW, 07-WRITE_TEST, 08-UPDATE_DOCS, 09-GENERATE_ADR, 10-GENERATE_SPECS,
11-GENERATE_PLUGIN, 12-GENERATE_LANGUAGE_FEATURE, 13-GENERATE_EDITOR_FEATURE,
14-GENERATE_TREE_PROVIDER, 15-GENERATE_WORKFLOW, 16-GENERATE_INSIGHT_PROVIDER, 17-GENERATE_UI,
18-PERFORMANCE, 19-ARCHITECTURE_REVIEW, 20-RELEASE.
