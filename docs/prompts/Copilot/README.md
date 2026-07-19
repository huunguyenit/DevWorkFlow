# Copilot Kit — DevWorkFlow

GitHub Copilot (VS Code / Visual Studio / Copilot Chat) đọc các file dưới `.github/` tự động
khi chúng nằm ở root repository. Copy toàn bộ thư mục `.github/` trong đây vào root repo thật.

- `.github/copilot-instructions.md` — áp dụng cho TOÀN repo, luôn được Copilot Chat nạp.
- `.github/instructions/*.instructions.md` — áp dụng theo path cụ thể (frontmatter `applyTo`),
  Copilot chỉ nạp khi bạn đang làm việc trong file thuộc glob tương ứng.
- `.github/prompts/*.prompt.md` — custom prompt, gọi bằng `/create-feature`, `/fix-bug`, ... 
  trong Copilot Chat (VS Code: cần bật `chat.promptFiles` trong settings).

Nội dung kiến trúc gốc: `prompts/_SHARED/ARCHITECTURE_DOCTRINE.md`.
