# 16 — Insight Provider

---

**Prompt:**

Insight Provider mới: **<loại insight>**. Tham chiếu `ADR-0004-InsightLayer.md`.

1. Một Provider = một loại Insight (Single Responsibility).
2. Input: Semantic Model. Không Parse XML, không ghi XML.
3. Nối vào Insight Provider Pipeline → Insight Layer → Monaco View.
4. Hiển thị inline, không Tooltip/Popup là kênh chính.
5. Chỉ Render Visible Range (Performance Rule).
