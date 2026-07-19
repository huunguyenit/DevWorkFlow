# 07 — Write Unit Test

---

**Prompt:**

Viết test cho: **<class/method>**

1. Mock Interface (`I<Name>Service`), không phụ thuộc implementation thật (đặc biệt Mock
   `IEditorPlatform` để test mà không cần WebView2).
2. Cover happy path + edge case (Entity lồng nhau, Document rỗng, Cancellation) + error case.
3. Chạy `dotnet test` ngay sau khi viết để xác nhận pass.
4. Naming: `MethodName_Scenario_ExpectedResult`.
