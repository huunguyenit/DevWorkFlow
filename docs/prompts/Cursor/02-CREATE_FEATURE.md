# 02 — Create Feature (End-to-End)

Dùng khi tạo một tính năng mới xuyên suốt nhiều layer.

---

**Prompt:**

Tôi muốn thêm tính năng: **<mô tả tính năng>**.

Yêu cầu:

1. Xác định tính năng này chạm tới những module nào trong số:
   ERP Language Service / Editor Platform / Tree Framework / Workflow Engine / Plugin System / AI Platform / UI.
2. Với mỗi module bị chạm, mô tả:
   - Interface/Service cần thêm hoặc mở rộng (theo naming convention `I<Name>Service`).
   - Semantic Model có cần mở rộng field/node mới không? Nếu có, mô tả cấu trúc.
   - Có Event mới cần phát ra không (theo Event Driven, không Polling)?
3. Vẽ Data Flow ngắn gọn theo dạng:
   `User Action → ... → Semantic Model → ... → UI`.
4. Đề xuất nơi đặt code theo đúng cấu trúc project (`/src/DevWorkFlow.<Layer>/...`).
5. Liệt kê Architectural Rule nào (R1–R10 trong ARCHITECTURE_DOCTRINE.md) có nguy cơ bị vi phạm
   và cách tránh.
6. Chỉ sau khi tôi duyệt thiết kế ở bước 1–5, mới sinh code thực tế, kèm Unit Test tối thiểu
   cho phần Core Service.

Không tạo tính năng bằng cách sửa trực tiếp XML hoặc gọi Monaco/DB ngoài layer tương ứng.
