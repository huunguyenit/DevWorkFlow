---
applyTo: "src/DevWorkFlow.Plugin/**"
---
# Plugin System — Copilot Instructions

Tham chiếu: `06-PLUGIN_SYSTEM.md`, `ADR-0008-PluginArchitecture.md`.

- Plugin không sửa Core, không Patch Core. Plugin chỉ đăng ký Capability qua Extension Point.
- Plugin không được: Parse XML trực tiếp, sửa Semantic Model trực tiếp, gọi Monaco API,
  gọi WPF Control trực tiếp, truy cập Database nội bộ trực tiếp.
- Plugin không biết nhau — giao tiếp chỉ qua Message Bus (Publish/Subscribe) hoặc qua Core.
- Mọi Plugin cần Manifest (id/name/version/dependencies/capabilities/permissions) và tuân theo
  Lifecycle: Discover → Validate → Load → Initialize → Register Providers → Running → Dispose.
- Dùng Dependency Injection để nhận Service (`ILogger`, `IWorkspace`, `IEditorPlatform`,
  `ILanguageService`...) — không Singleton toàn cục.
