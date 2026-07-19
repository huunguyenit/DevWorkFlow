# 11 — Generate Plugin Skeleton

---

**Prompt:**

Plugin mới: **<tên>**. Tham chiếu `06-PLUGIN_SYSTEM.md`, `ADR-0008-PluginArchitecture.md`.

1. Sinh Manifest (id/name/version/dependencies/capabilities/permissions).
2. Chọn Capability đăng ký (Completion/Insight/Tree/Action/Theme Provider...) — không đăng ký UI trực tiếp.
3. Đảm bảo: không Parse XML, không giữ Semantic Model riêng, không gọi Monaco/WPF trực tiếp,
   giao tiếp plugin khác qua Message Bus.
4. Scaffold thư mục: Manifest/Assembly/Resources/Icons/Localization/Configuration/Providers.
5. Viết test cho Provider chính của Plugin.
