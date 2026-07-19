# 10 — Generate Technical Specs

Dùng khi cần đặc tả kỹ thuật chi tiết cho một module/feature trước khi code.

---

**Prompt:**

Sinh tài liệu đặc tả kỹ thuật cho: **<module/feature>**

Cấu trúc đề xuất:

1. Purpose — 1 đoạn, tại sao cần.
2. Scope / Non-goals.
3. Vị trí trong kiến trúc (module nào theo `ARCHITECTURE_DOCTRINE.md` mục 5).
4. Data Model (nếu mở rộng Semantic Model, mô tả field mới, tương thích ngược).
5. Interface đề xuất (`I<Name>Service`, method signature ở mức khái niệm, không cần code đầy đủ).
6. Data Flow (sơ đồ text: Input → ... → Output).
7. Event phát ra (nếu có).
8. Extension Points cho Plugin (nếu áp dụng).
9. Performance targets (nếu liên quan Tree/Parser/Editor: tham chiếu targets đã có trong
   `ADR-0003-TreeDataSource.md`, ví dụ Expand Node < 50ms).
10. Test Plan tóm tắt.
11. Rủi ro & Alternatives đã cân nhắc.

Giữ văn phong ngắn gọn, dùng heading + gạch đầu dòng như các tài liệu `0X-*.md` hiện có,
không viết văn xuôi dài dòng.
