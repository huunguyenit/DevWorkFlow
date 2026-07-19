---
applyTo: "src/DevWorkFlow.Language/**"
---
# ERP Language Service — Copilot Instructions

Tham chiếu: `02-ERP_LANGUAGE_SERVICE.md`, `ADR-0001-LanguageService.md`, `ADR-0006-SemanticModel.md`.

- Đây là module DUY NHẤT được Parse XML, build Syntax Tree, build Semantic Model, Resolve Entity/Symbol.
- Semantic Model là read-only (immutable) — thay đổi chỉ qua Command/Transaction.
- Không gợi ý code biết Monaco/WPF/Tree UI/Workflow UI/Database UI trong module này.
- Ưu tiên Incremental Parsing/Incremental Semantic Update, tránh Parse lại toàn bộ Document.
- Mọi thay đổi Document phải phát Event (`DocumentChanged`, `SemanticChanged`, `DiagnosticsChanged`,
  `NavigationChanged`, `InsightChanged`) — không polling.
- Navigation dựa trên `SymbolId`/`NodeId`, không dựa trên số dòng.
- Gợi ý Unit Test cho mọi Service mới (Parser/Semantic Builder/Symbol/Entity/Navigation/Diagnostics/
  Completion/Formatting/Refactoring/Search).
