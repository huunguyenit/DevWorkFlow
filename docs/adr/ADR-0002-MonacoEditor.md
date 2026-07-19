# ADR-0002: Adopt Monaco Editor through Editor Platform

Status: Accepted

Date: 2026-07-19

Decision Makers:
- DevWorkFlow Architecture Team

---

# Context

DevWorkFlow cần một Editor hiện đại để thay thế XML Editor truyền thống.

Editor phải đáp ứng các yêu cầu:

- Hiệu năng cao
- Hỗ trợ file lớn
- Semantic Highlight
- Inlay Hint
- Inline Decorations
- Multi Cursor
- Folding
- Minimap
- CodeLens
- Diff Editor
- AI Integration
- Khả năng mở rộng lâu dài

Ngoài ra Editor phải hỗ trợ Insight Layer, ERP Language và các khả năng mở rộng trong tương lai.

---

# Problem

Có hai hướng triển khai.

## Native WPF Editor

Ví dụ:

- AvalonEdit
- ICSharpCode
- Editor tự phát triển

Ưu điểm:

- Thuần WPF
- Không cần WebView

Nhược điểm:

- Thiếu nhiều tính năng IDE hiện đại
- Phải tự phát triển Completion
- Decoration hạn chế
- Khó hỗ trợ AI
- Khó duy trì lâu dài

---

## Web Editor

Ví dụ:

- Monaco Editor

Ưu điểm:

- Editor hiện đại
- Hệ sinh thái lớn
- Hiệu năng cao
- Hỗ trợ nhiều tính năng IDE

Nhược điểm:

- Phụ thuộc WebView2
- Cần Bridge giữa WPF và JavaScript

---

# Decision

DevWorkFlow lựa chọn:

Monaco Editor

được chạy bên trong

WebView2

thông qua

Editor Platform.

Editor Platform là API chính thức của IDE.

Monaco chỉ là Adapter.

Mọi module trong DevWorkFlow đều giao tiếp với Editor Platform.

Không giao tiếp trực tiếp với Monaco API.

---

# Architecture

```text
                  ERP Language Service

                            │

                            ▼

                  Editor Platform API

                            │

          ┌─────────────────┴─────────────────┐

          ▼                                   ▼

Document Service                     Decoration Service

Caret Service                        Completion Service

Selection Service                    Theme Service

Navigation Service                   Command Service

                            │

                            ▼

                     Monaco Adapter

                            │

                            ▼

                      WebView2 Host

                            │

                            ▼

                     Monaco Editor
```

---

# Rationale

## Industry Standard

Monaco là nền tảng của:

- VS Code
- Azure Data Studio
- GitHub Codespaces
- Eclipse Theia

Đã được chứng minh về:

- Hiệu năng
- Khả năng mở rộng
- Hệ sinh thái

---

## Modern IDE Features

Monaco hỗ trợ sẵn:

- Multi Cursor
- Minimap
- Folding
- Peek Definition
- Hover
- Inline Suggestion
- Ghost Text
- Semantic Highlight
- Diff Editor

Không cần tự phát triển.

---

## AI Ready

Monaco dễ tích hợp:

- Inline AI
- Ghost Text
- AI Review
- AI Completion

Đây là nền tảng phù hợp với định hướng AI Native IDE.

---

## Separation of Concerns

ERP Language Service

↓

Semantic

Editor Platform

↓

Rendering

Monaco

↓

UI

Mỗi thành phần có một trách nhiệm rõ ràng.

---

## Replaceable

Nếu trong tương lai thay Monaco bằng Editor khác.

Chỉ cần viết Adapter mới.

ERP Language Service.

Tree Framework.

Workflow Engine.

Plugin.

không thay đổi.

---

# Consequences

## Positive

- Editor hiện đại.
- Giảm thời gian phát triển.
- Dễ tích hợp AI.
- Hỗ trợ nhiều tính năng IDE.
- Có cộng đồng lớn.
- Có khả năng mở rộng.

---

## Negative

- Phụ thuộc WebView2.
- Cần JavaScript Bridge.
- Khó debug hơn WPF thuần.
- Cần quản lý giao tiếp hai chiều.

---

# Alternatives Considered

## Alternative 1

AvalonEdit

### Result

Rejected.

### Reasons

Không đáp ứng tầm nhìn dài hạn.

Thiếu:

- Semantic Decorations
- Inlay Hint
- AI Integration
- Modern Editor Features

---

## Alternative 2

Tự phát triển Editor

### Result

Rejected.

### Reasons

Chi phí phát triển quá lớn.

Khó duy trì.

Không phải lợi thế cạnh tranh của DevWorkFlow.

---

## Alternative 3

Editor Platform + Monaco

### Result

Accepted.

Lý do:

Đáp ứng đầy đủ yêu cầu hiện tại và mở rộng trong tương lai.

---

# Architectural Rules

Các quy tắc bắt buộc:

- Không module nào gọi Monaco API trực tiếp.
- Chỉ Monaco Adapter được phép sử dụng API của Monaco.
- WPF chỉ giao tiếp với Editor Platform.
- Editor Platform không chứa Business Logic.
- ERP Language Service không biết Monaco.
- Plugin không được tham chiếu Monaco API.

---

# Impact

Quyết định này ảnh hưởng đến:

- Editor Platform
- ERP Language Service
- Insight Layer
- AI Platform
- Workflow Engine
- Plugin System
- UI Guidelines

---

# Risks

Các rủi ro cần quản lý:

- Đồng bộ giữa WPF và WebView2.
- Hiệu năng khi truyền dữ liệu lớn.
- Quản lý vòng đời WebView2.
- Khởi tạo Monaco lần đầu.
- Tương thích phiên bản Monaco.

Các rủi ro này được giảm thiểu bằng:

- Message Bridge.
- Incremental Update.
- JSON-RPC Message.
- Lazy Initialization.
- Adapter Pattern.

---

# Future Review

ADR này sẽ được xem xét lại nếu:

- Monaco không còn được duy trì.
- Có Editor mới vượt trội và tương thích với Editor Platform.
- WebView2 không còn phù hợp với nền tảng Windows.

Nếu không có các điều kiện trên, Monaco tiếp tục là Editor Engine mặc định.

---

# Related Documents

- 00-VISION.md
- 01-ARCHITECTURE.md
- 02-ERP_LANGUAGE_SERVICE.md
- 03-EDITOR_PLATFORM.md
- ADR-0001-LanguageService.md
- ADR-0003-TreeDataSource.md
- ADR-0004-InsightLayer.md