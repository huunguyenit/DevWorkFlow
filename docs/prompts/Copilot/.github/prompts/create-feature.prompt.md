---
mode: agent
description: Tạo tính năng mới end-to-end cho DevWorkFlow, tuân thủ kiến trúc phân tầng.
---
Tính năng cần thêm: hỏi người dùng nếu chưa rõ.

1. Xác định module bị ảnh hưởng (ERP Language Service / Editor Platform / Tree Framework /
   Workflow Engine / Plugin System / UI) theo `prompts/_SHARED/ARCHITECTURE_DOCTRINE.md` mục 5.
2. Với mỗi module: Interface cần thêm, thay đổi Semantic Model (nếu có), Event mới.
3. Đề xuất vị trí file theo layer (`src/DevWorkFlow.<Layer>/...`).
4. Liệt kê rủi ro vi phạm Architectural Rule (R1–R10) và cách tránh.
5. Chỉ sinh code sau khi plan được xác nhận; kèm Unit Test cho phần Core Service.
