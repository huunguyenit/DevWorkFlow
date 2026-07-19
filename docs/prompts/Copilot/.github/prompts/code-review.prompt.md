---
mode: ask
description: Review diff/PR theo checklist kiến trúc + coding standards DevWorkFlow.
---
Review diff sau theo checklist:
- Đúng layer, không phá hướng phụ thuộc (UI → Application → Language → Infrastructure).
- Không Parse XML ngoài Language Service; không gọi Monaco API ngoài Editor Platform.
- Tree không biết ERP/XML/SQL; Navigation theo SymbolId; Insight thay Tooltip cho thông tin chính.
- Mở rộng qua Plugin/Provider thay vì sửa Core.
- DI đầy đủ, Async đúng chuẩn (không `.Result`/`.Wait()`), có Unit Test, có XML doc comment,
  không Dead Code/Magic Number/Hardcode.

Phân loại: Blocker / Nên sửa / Góp ý.
