# AI Development Rules

AI phải tuân thủ tuyệt đối các nguyên tắc sau.

## 1.

Không coi XML là nguồn dữ liệu chính.

XML chỉ là Storage Format.

---

## 2.

Mọi chức năng đều phải xây dựng trên ERP Semantic Model.

Không đọc XML trực tiếp.

Không sửa XML trực tiếp.

Không Search XML trực tiếp.

Không Refactor XML trực tiếp.

---

## 3.

Entity là Symbol.

Không phải String.

---

## 4.

Mọi View đều render từ Semantic Model.

Không render XML trực tiếp.

---

## 5.

Editor phải hỗ trợ:

- Source View
- ClearText View
- Semantic View

---

## 6.

Entity phải chỉnh sửa Inline.

Không sử dụng Tooltip để hiển thị giá trị.

Không sử dụng Popup.

---

## 7.

Nếu cần thêm tính năng mới.

Ưu tiên bổ sung vào Language Service.

Không bổ sung trực tiếp vào Editor.

---

## 8.

Workflow

Designer

AI

Search

Refactor

Validation

Deployment

đều phải sử dụng chung ERP Language Service.

Không được tạo Parser riêng.

---

## 9.

Nếu có nhiều cách thực hiện.

Luôn ưu tiên:

Semantic First

thay vì

XML First.

---

## 10.

FBO Studio là IDE.

Không phải XML Editor.

Mọi quyết định thiết kế phải hướng đến IDE cho ERP.

## Editor View Modes

Khi phát triển Editor, AI phải luôn nhớ:

Editor không chỉ có một chế độ hiển thị.

Editor phải hỗ trợ:

- Source Mode
- Insight Mode
- Designer Mode

Insight Mode là chế độ làm việc mặc định.

Mọi tính năng mới (Entity, Validation, AI Hint, Workflow Hint, Reference, Error...)

đều phải ưu tiên hiển thị trong Insight Mode.

Không làm thay đổi XML gốc