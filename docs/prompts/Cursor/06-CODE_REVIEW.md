# 06 — Code Review

---

**Prompt:**

Review đoạn diff/PR sau: **<dán diff hoặc mô tả PR>**

Dùng checklist từ `08-CODING_STANDARDS.md` (Code Review Checklist) + Architectural Rules:

- [ ] Đúng layer/module, không phá vỡ hướng phụ thuộc (Workspace → Application → Core → Infra).
- [ ] Không Parse XML ngoài ERP Language Service (R1, R6).
- [ ] Không gọi Monaco API ngoài Editor Platform/Monaco Adapter (R10).
- [ ] Tree Framework không chứa logic biết XML/SQL/ERP (R4).
- [ ] Navigation dùng SymbolId, không dùng Line Number (R7).
- [ ] Thông tin hiển thị dùng Insight thay vì Tooltip/Popup/MessageBox nếu là thông tin chính (R8).
- [ ] Không sửa Core để mở rộng — nên là Plugin/Provider nếu có thể (R9).
- [ ] Không Circular Dependency.
- [ ] Có Unit Test cho Core module, không giảm coverage.
- [ ] Có XML Doc Comment cho Public API mới.
- [ ] Không Dead Code, không Magic Number/Hardcode String/Path/Color.
- [ ] Async đúng chuẩn, có CancellationToken khi cần.
- [ ] Logging bằng Serilog, không debug bằng Console/MessageBox.
- [ ] Naming convention đúng (PascalCase, `I` prefix cho interface).

Kết quả: liệt kê vấn đề theo mức độ (Blocker / Nên sửa / Góp ý), không chỉ khen chê chung chung.
