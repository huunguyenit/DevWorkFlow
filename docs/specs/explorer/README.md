# Specs — Explorer

Explorer là một consumer của **Tree Framework** (xem `04-TREE_FRAMEWORK.md`, `ADR-0003-TreeDataSource.md`),
dùng `FileSystemDataSource`/`XmlSemanticDataSource` làm nguồn dữ liệu.

Spec ở đây mô tả HÀNH VI của Explorer (lazy load, search, refresh, context menu...),
KHÔNG mô tả lại Tree Framework — tham chiếu thay vì lặp lại.

Chưa có spec nào. Dùng `prompts/*/10-GENERATE_SPECS.md` (hoặc `/generate-spec` trong Claude Code,
`generate-spec.prompt.md` trong Copilot) để sinh spec đầu tiên, ví dụ `project-explorer.md`.
