Sinh khung Plugin: $ARGUMENTS

Theo ADR-0008-PluginArchitecture: Manifest (id/version/dependencies/capabilities/permissions),
đăng ký Capability (không đăng ký UI trực tiếp), không Parse XML, không giữ Semantic Model riêng,
không gọi Monaco/WPF trực tiếp, giao tiếp qua Message Bus.
