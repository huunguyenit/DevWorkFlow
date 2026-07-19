---
applyTo: "src/DevWorkFlow.Workflow/**"
---
# Workflow Engine — Copilot Instructions

Tham chiếu: `05-WORKFLOW_ENGINE.md`.

- `WorkflowNode` chỉ mô tả cấu hình (Id/Type/Name/Inputs/Outputs/Parameters/Position/State/Metadata),
  KHÔNG chứa logic thực thi. Logic nằm trong Action Provider riêng, được Action Dispatcher gọi.
- Workflow chỉ thao tác Semantic Model / Service công khai — KHÔNG Parse XML, KHÔNG gọi UI trực tiếp.
- Action thay đổi dữ liệu phải hỗ trợ Transaction (Begin/Commit/Rollback); fail → Rollback + Event
  (`NodeFailed`/`WorkflowFailed`).
- Validate trước khi chạy: Cycle Detection, Missing Connection, Invalid Parameter, Unreachable Node,
  Infinite Loop.
- Sự kiện chuẩn: `WorkflowStarted/Completed/Failed/Cancelled`, `NodeStarted/Completed/Failed`.
- Async/Parallel Execution với CancellationToken; không block UI Thread.
