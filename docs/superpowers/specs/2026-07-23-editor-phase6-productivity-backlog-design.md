# Phase 6 — Editor productivity backlog (P6-01 … P6-27)

Date: 2026-07-23  
Status: Ready for implementation (mega)  
Parent: [`2026-07-22-editor-ux-roadmap-design.md`](./2026-07-22-editor-ux-roadmap-design.md) (Phase 6)  
Depends on: Phase 0–5 editor/LS/SQL Studio; Monaco bridge; Outline; fbo-js catalog (P6-21); sql-snippets (P6-16)  
Related: ADR-0001/R1/R7, Left Panel UX freeze, roadmap §7 “không một PR”

---

## 1. Goal

Ship **toàn bộ** backlog productivity P6-01…P6-27 theo **một mega-spec + mega-plan**, triển khai **nhiều task/commit** (không bắt buộc một PR).

**Done when (phase):** mọi ID có hành vi đúng Done when riêng; Application/UI tests nơi có logic LS; build `DevWorkFlow.slnx` xanh; Left Panel không đổi layout.

---

## 2. Decision

| Chủ đề | Chốt |
|--------|------|
| Phạm vi | **Toàn bộ** P6-01…P6-27 |
| Hình thức | Mega-spec + mega-plan (cách 3) — không chia wave file riêng |
| PR | Nhiều commit/task; **không** yêu cầu một PR duy nhất (khớp roadmap §7) |
| Kiến trúc | Monaco-native khi đủ; LS/Command khi symbol; Shell cho tab/Zen/bookmark/compare |

---

## 3. Architecture

```text
Gesture / Command
  → Monaco bridge | Shell chrome
  → LS providers / Application commands (khi Symbol/NodeId)
  → Editor render only (R7: SymbolId/NodeId SoT cho nav)
```

| Layer | Được làm | Không |
|-------|----------|-------|
| Monaco / bridge | Multi-cursor, fold provider wire, minimap, sticky, peek widget host, inlay | Parse XML/SQL nghiệp vụ |
| Application / LS | Rename, Go to Symbol, diagnostics catalog, related files, fold ranges từ Syntax, inlay data | WPF layout |
| Shell / VM | Tab Close Others/Right, Zen, bookmarks store, Compare mode, breadcrumb VM | Hard-code API FBO |

---

## 4. Per-ID design

### 6.1 Navigation & orientation

| ID | Behavior | Notes |
|----|----------|-------|
| **P6-01** | Stack vị trí (documentUri + offset/line) sau mỗi GoTo/NavigateToOffset; Ctrl+- Back, Ctrl+Shift+- Forward | Max depth ~50; không ghi Insight-only ảo nếu cùng file+offset |
| **P6-02** | Peek Definition: inline peek (Monaco peek hoặc Content Widget) tại caret; Esc đóng; không bắt buộc mở tab | Reuse GoToDefinition / JsRuntime / Structural hits |
| **P6-03** | Go to Symbol in Form: palette/list symbol document (Field, Entity, ScriptFunction, …); filter fuzzy tên; Enter → Navigate | Ctrl+Shift+O; LS `SearchSymbols` scoped document |
| **P6-04** | Breadcrumb: `form > views > view[@name=…] > …` theo Syntax path tại caret | Click segment → NavigateTo NodeId/offset |
| **P6-05** | Outline ↔ caret: chọn outline khi caret đổi; caret/scroll khi chọn outline (hai chiều chắc) | Event, không DispatcherTimer poll |

### 6.2 Edit nhanh

| ID | Behavior | Notes |
|----|----------|-------|
| **P6-06** | Multi-cursor + select all occurrences (Monaco defaults / keybindings) | Form Source + SQL Monaco nếu có |
| **P6-07** | Rename Symbol qua LS Command — preview refs; apply edits; **không** search-replace mù | Phase 1 scope: Field + ScriptFunction trong document (+ entity value name cẩn thận) |
| **P6-08** | Surround selection: CDATA, XML comment, JS block comment | Command palette / context |
| **P6-09** | Duplicate line / Move line up-down | Monaco actions |
| **P6-10** | XML tag autoclose + rename cặp tag khi sửa start tag | Language config + linked editing; fail-safe khi XML lệch |

### 6.3 Fold / structure

| ID | Behavior | Notes |
|----|----------|-------|
| **P6-11** | Fold theo thẻ XML (`script`, `views`, `fields`, `commands`, …) | `FoldingRangeProvider` từ SyntaxTree element spans |
| **P6-12** | Fold `function` trong script / Checking JS | Ranges từ ScriptIsland function nodes |
| **P6-13** | Fold region entity Insight theo cấp lồng | ClearTextSegments / entity nesting |

### 6.4 SQL & data

| ID | Behavior | Notes |
|----|----------|-------|
| **P6-14** | Format selection / document T-SQL | Library nhẹ hoặc rule nội bộ; không đổi semantics |
| **P6-15** | Estimated plan khi có connection | `SET SHOWPLAN_XML` / equivalent qua `ISqlScriptRunner`; hiện panel/message |
| **P6-16** | Mở rộng `sql-snippets.xml` ngoài options | Thêm entries; reuse Phase 5 catalog expander |
| **P6-17** | Execute result → “Send to editor” (chèn CSV/TSV hoặc INSERT tạm vào SQL tab) | Từ SqlResult panel |

### 6.5 FBO-specific

| ID | Behavior | Notes |
|----|----------|-------|
| **P6-18** | Inlay: `request('A','B')` → hints action/case | Data từ Phase 3 parsers; Monaco InlayHintsProvider |
| **P6-19** | Gutter/inlay: entity SYSTEM vs inline | ClearTextSegments source kind |
| **P6-20** | “Open related files” controller (Dir+Grid+Filter+Lookup+…) | Mở rộng showForm/related resolver; command palette |
| **P6-21** | Diagnostic Checking JS theo fbo-js catalog (sai tên member) | LS diagnostic; Problems panel |
| **P6-22** | Template: sinh `onChange$Voucher$…` + clientScript từ field | Command; Serializer/LS edit path — không UI tự viết XML sai cấu trúc |

### 6.6 Chrome / comfort

| ID | Behavior | Notes |
|----|----------|-------|
| **P6-23** | Tab: Close Others, Close to the Right, Copy relative path | Shell document menu |
| **P6-24** | Minimap + sticky scroll Monaco | Options từ theme/config |
| **P6-25** | Zen / Maximize editor (ẩn dock phụ) | Shell layout toggle; **không** đụng Left Panel freeze sai nghĩa — chỉ collapse bottom/right nếu đã có API; không đổi width Left mặc định |
| **P6-26** | Bookmark dòng (non-debug) | Per-document marks; gutter glyph; list navigate |
| **P6-27** | Compare Source ↔ Insight | Diff editor hai buffer cùng document; align theo OffsetMap khi có thể |

---

## 5. Out of scope

- Đổi layout Left Panel (freeze).
- Workflow L5 / AI L6 / Plugin host đầy đủ.
- ADR-0006 Designer dual-model rewrite.
- Workspace-wide Rename / FindRefs (trừ ID đã nêu scope document).
- Một PR chứa cả 27 ID.

---

## 6. Testing strategy

| Loại | Áp dụng |
|------|---------|
| Unit Application | Rename edits, fold ranges, diagnostics catalog, related paths, Go to Symbol filter, history stack |
| UI / manual | Keybindings, Peek, Zen, tab menu, Compare, multi-cursor, format SQL |
| Regression | Phase 1–5 nav/completion/SQL không gãy |

---

## 7. Risks

| Risk | Mitigation |
|------|------------|
| Mega-plan quá dài → agent bỏ sót | Checkbox từng ID; không đóng Phase 6 đến khi đủ |
| Rename phá XML | Chỉ Serializer/LS; test round-trip |
| Fold/Insight lệch offset | ClearText vs Source map rõ per mode |
| P6-25 vs Left freeze | Chỉ toggle vùng được phép; document trong spec |
| P6-15 plan SQL phụ thuộc DB | Skip/graceful Status nếu không CS |

---

## 8. Success criteria

- [ ] P6-01 … P6-27 đều có implementation + verify (test hoặc manual checklist trong plan).
- [ ] Không hard-code danh sách FBO/SQL snippet trong UI khi đã có Config.
- [ ] R1/R7 giữ; Left Panel layout không đổi.
- [ ] Build slnx xanh; Application tests không regress Phase 4–5.

---

## 9. Handoff

Plan: [`../plans/2026-07-23-editor-phase6-productivity-backlog.md`](../plans/2026-07-23-editor-phase6-productivity-backlog.md).
