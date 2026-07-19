---
mode: agent
description: Sinh Insight Provider mới theo ADR-0004-InsightLayer.
---
Loại Insight cần thêm: hỏi người dùng nếu chưa rõ.

1. Một Provider = một loại Insight. Input là Semantic Model, không Parse/ghi XML.
2. Nối vào Insight Provider Pipeline → Insight Layer → Editor view, hiển thị inline
   (không Tooltip/Popup là kênh chính).
3. Chỉ Render Visible Range. Kèm test cho logic resolve.
