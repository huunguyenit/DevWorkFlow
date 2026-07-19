# 11 — Generate Plugin Skeleton

Tham chiếu: `06-PLUGIN_SYSTEM.md`, `ADR-0008-PluginArchitecture.md`.

---

**Prompt:**

Sinh khung Plugin mới: **<tên plugin, ví dụ "Git Plugin">**

Yêu cầu:

1. Sinh Plugin Manifest (id, name, author, version, description, required API version,
   dependencies, capabilities, permissions) theo mẫu YAML trong ADR-0008.
2. Xác định Capability plugin sẽ đăng ký (Completion Provider / Insight Provider / Tree Provider /
   Action Provider / Theme Provider / ...) — KHÔNG đăng ký trực tiếp UI Control.
3. Sinh cấu trúc thư mục Plugin: `Manifest / Assembly / Resources / Icons / Localization /
   Configuration / Providers`.
4. Đảm bảo Plugin:
   - Không Parse XML trực tiếp.
   - Không giữ Semantic Model riêng.
   - Không gọi Monaco API / WPF Control trực tiếp.
   - Không truy cập Database nội bộ trực tiếp.
   - Giao tiếp với Plugin khác chỉ qua Message Bus (Publish/Subscribe), không gọi thẳng.
5. Khai báo rõ Lifecycle: Discover → Validate → Load → Initialize → Register Providers → Running → Dispose.
6. Nếu Plugin cần quyền đặc biệt (Filesystem/Database/Network/AI/Git...), liệt kê trong Permission
   và giải thích lý do.
