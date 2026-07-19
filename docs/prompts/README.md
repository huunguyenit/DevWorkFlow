# DevWorkFlow — AI Development Kit

Đây không phải một thư mục prompt rời rạc. Đây là **AI Development Kit** của dự án
DevWorkFlow: dù dùng Cursor, Claude Code hay GitHub Copilot, AI đọc cùng một "nguồn sự thật"
về kiến trúc trước khi sinh code — chứ không chỉ chạy theo yêu cầu bề mặt.

## Cấu trúc

```
prompts/
├── _SHARED/                         ← nguồn kiến trúc dùng chung cho MỌI công cụ AI
│   ├── ARCHITECTURE_DOCTRINE.md     ← 10 Core Principles, 10 Architectural Rules, module map, ADR tóm tắt
│   ├── UI_GUIDELINES_SUMMARY.md     ← design tokens, quy tắc UI rút gọn
│   └── GLOSSARY.md                  ← thuật ngữ (Entity, Symbol, Insight, Provider, Capability...)
│
├── Cursor/                          ← bộ prompt đầy đủ cho Cursor
│   ├── .cursorrules                 ← tự nạp mỗi request trong repo
│   ├── 00-README.md
│   └── 01..20-*.md                  ← 1 file / 1 loại công việc (feature, bugfix, ADR, plugin...)
│
├── Claude/                          ← bộ prompt đầy đủ cho Claude Code
│   ├── CLAUDE.md                   ← project memory, đặt ở root repo thật để tự nạp
│   ├── .claude/commands/*.md       ← Slash Commands (/new-feature, /fix-bug, /generate-adr...)
│   ├── 00-README.md
│   └── 01..20-*.md                  ← bản đầy đủ, tương ứng bộ Cursor nhưng theo phong cách Claude Code
│
└── Copilot/                         ← bộ prompt đầy đủ cho GitHub Copilot
    ├── README.md
    └── .github/
        ├── copilot-instructions.md         ← áp dụng toàn repo
        ├── instructions/*.instructions.md  ← áp dụng theo path (applyTo glob), 1 file / module
        └── prompts/*.prompt.md             ← custom prompt gọi qua "/" trong Copilot Chat
```

## Nguyên tắc thiết kế bộ kit này

1. **Một nguồn sự thật duy nhất** (`_SHARED/ARCHITECTURE_DOCTRINE.md`) — nếu kiến trúc dự án
   thay đổi (thêm ADR mới, đổi rule), chỉ cần sửa file này, không phải sửa lại 3 bộ prompt.
2. **Mỗi công cụ AI vẫn có bản native đúng convention của nó**:
   - Cursor: `.cursorrules` (auto-load) + file `.md` copy tay vào Chat/Composer.
   - Claude Code: `CLAUDE.md` (auto-load) + Slash Commands (`.claude/commands/`).
   - Copilot: `copilot-instructions.md` (toàn repo) + `*.instructions.md` (theo path, dùng
     `applyTo` glob để chỉ áp dụng đúng module) + `*.prompt.md` (custom prompt).
3. **Không chỉ sinh code — bắt AI tự kiểm tra kiến trúc** trước khi code (mục "Trước khi code,
   tự kiểm tra" trong doctrine) và sau khi code (`19-ARCHITECTURE_REVIEW.md` / `architecture-review.prompt.md`).
4. **Bám sát Roadmap theo Capability Level** (`09-ROADMAP.md`) — mọi prompt "implement task"
   đều nhắc AI xác nhận đúng phạm vi Level hiện tại trước khi mở rộng tính năng.

## Cách triển khai vào repo thật

```
<repo-root>/
├── CLAUDE.md                        ← copy từ prompts/Claude/CLAUDE.md
├── .cursorrules                     ← copy từ prompts/Cursor/.cursorrules
├── .claude/commands/                ← copy từ prompts/Claude/.claude/commands/
├── .github/                         ← copy từ prompts/Copilot/.github/
├── docs/                            ← 00-VISION.md .. 10-DEVWORKFLOW_BOOK.md, ADR-0001..0008
└── prompts/                         ← giữ nguyên cả 3 bộ + _SHARED để tra cứu prompt đầy đủ
```

Sau khi triển khai, thử nhanh: mở Cursor/Claude Code/Copilot Chat trong repo, hỏi
*"Tóm tắt kiến trúc DevWorkFlow"* — nếu AI trả lời đúng 10 Core Principles và module map
mà không cần bạn paste lại tài liệu, tức là kit đã hoạt động.
