# 12 — ERP Language Service Feature

---

**Prompt:**

Tính năng cho ERP Language Service: **<mô tả>**. Tham chiếu `02-ERP_LANGUAGE_SERVICE.md`, `ADR-0001`, `ADR-0006`.

1. Xác định Service: Symbol/Entity/Navigation/Completion/Diagnostics/Formatting/Refactoring/Search/Insight/Serializer.
2. Semantic Model là read-only — thay đổi qua Command/Transaction.
3. Tích hợp vào đúng bước của Document Lifecycle (Parse → Syntax Tree → Semantic Builder →
   Semantic Model → Diagnostics → Insight → Ready), hỗ trợ Incremental.
4. Phát Event tương ứng, không polling.
5. Test cho Parser/Semantic/Navigation liên quan — bắt buộc theo Coding Standards.
