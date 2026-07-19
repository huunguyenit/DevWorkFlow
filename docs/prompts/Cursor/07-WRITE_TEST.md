# 07 — Write Unit Test

---

**Prompt:**

Viết Unit Test cho: **<class/method/đường dẫn file>**

Yêu cầu:

1. Ưu tiên các phần theo `08-CODING_STANDARDS.md`: Parser, Semantic, Navigation, Serializer,
   Workflow, Tree — đây là các phần bắt buộc phải có test.
2. Test phải cách ly layer: Mock Interface (`I<Name>Service`) thay vì phụ thuộc implementation thật
   (đặc biệt Mock `IEditorPlatform` để test Navigation/Completion/Diagnostics mà không cần WebView2 thật).
3. Cover các trường hợp: happy path, edge case (Entity lồng nhau, Document rỗng, Cancellation giữa chừng),
   và trường hợp lỗi (Entity không resolve được, Circular Reference).
4. Không dùng `Thread.Sleep` để chờ async — dùng cách chờ đúng chuẩn (await/TestScheduler).
5. Đặt tên test theo dạng `MethodName_Scenario_ExpectedResult`.
6. Mục tiêu coverage ≥ 80% cho phần Core được yêu cầu.
