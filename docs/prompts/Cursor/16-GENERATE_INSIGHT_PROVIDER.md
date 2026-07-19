# 16 — Generate Insight Provider

Tham chiếu: `ADR-0004-InsightLayer.md`, `02-ERP_LANGUAGE_SERVICE.md` (Insight Service).

---

**Prompt:**

Thêm một Insight Provider mới cho: **<loại insight, ví dụ: "Reference Count Insight">**

Yêu cầu:

1. Provider chỉ tạo MỘT loại Insight (Single Responsibility) — ví dụ Entity Provider chỉ resolve
   Entity, không kiêm luôn Validation.
2. Input của Provider là Semantic Model — Provider KHÔNG được Parse XML, KHÔNG ghi xuống XML.
3. Output nối vào Insight Provider Pipeline (`Semantic Model → Pipeline → Insight Layer → Monaco View`).
4. Insight hiển thị inline trong Editor (theo Insight Layer), KHÔNG dùng Tooltip/Popup làm kênh chính.
5. Nếu Symbol có nhiều Insight cùng lúc (VD: Entity + Validation + AI Suggestion), đảm bảo
   Insight Layer có thể hợp nhất/sắp xếp mà không cần Provider biết về nhau.
6. Chỉ Render phần đang hiển thị (Visible Range) — không Render toàn bộ Document (Performance Rule).
7. Nếu Insight cần hỗ trợ Search (VD: tìm theo Entity gốc hoặc theo Resolved Value), khai báo rõ.
