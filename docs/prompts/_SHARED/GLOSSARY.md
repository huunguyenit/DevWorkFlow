# Glossary — Thuật ngữ dự án DevWorkFlow

| Thuật ngữ | Ý nghĩa |
|---|---|
| ERP Language | Ngôn ngữ lập trình trừu tượng của FBO ERP: XML, Entity, Command, Workflow, SQL, JavaScript, Metadata |
| Semantic Model | Mô hình dữ liệu trung tâm, Single Source of Truth, sinh ra từ Syntax Tree |
| Entity | Tham chiếu kiểu `&ClientDefault;`, được Entity Service resolve ra giá trị |
| Symbol | Đơn vị định danh (Field, View, Command, Table, Workflow...) dùng cho Navigation/Rename |
| Insight | Thông tin ngữ nghĩa hiển thị inline trong Editor (Entity Value, Validation, AI Suggestion...) |
| TreeDataSource | Nguồn dữ liệu trừu tượng cho Tree Framework, không phụ thuộc loại dữ liệu cụ thể |
| Provider | Đơn vị mở rộng (Completion/Insight/Tree/Action/Theme...) do Core hoặc Plugin đăng ký |
| Workflow Node | Đơn vị trong Workflow Engine, không chứa Logic, chỉ mô tả cấu hình |
| Action Provider | Cung cấp Implementation cho một loại Workflow Node/Action |
| Capability | Đơn vị mà Plugin đăng ký với Core (thay vì đăng ký trực tiếp Control/UI) |
| Message Bridge | Kênh giao tiếp JSON giữa WPF ↔ WebView2 ↔ Monaco |
