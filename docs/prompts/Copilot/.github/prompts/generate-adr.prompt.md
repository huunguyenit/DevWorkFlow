---
mode: agent
description: Sinh ADR mới theo đúng format các ADR hiện có của DevWorkFlow.
---
Quyết định kiến trúc cần ghi ADR: hỏi người dùng nếu chưa rõ.

1. Tìm số ADR lớn nhất hiện có trong repo (`ADR-000X-*.md`) để đặt số tiếp theo.
2. Sinh theo cấu trúc: Context / Problem / Decision / Architecture (sơ đồ box-drawing) /
   Rationale / Consequences (Positive/Negative) / Alternatives Considered / Architectural Rules /
   Impact / Related Documents / Future Review.
3. Status: Proposed. Không mâu thuẫn 10 Core Principles trừ khi cảnh báo rõ đây là thay đổi nền tảng.
