# CURRENT_STATE

Where the project stands today. Entry point + rules: `CLAUDE.md`.
For long-form background, open the one `docs/` file the task needs — never the set. Update: 2026-07-19.

## Maturity

| Dim | Docs | Code |
|-----|------|------|
| Stage | 0.x | Pre-alpha |
| Level | L1 Foundation | Touches L2–L4 |
| Arch | Clean + Providers | Partial; dual models |
| Language | Design done | Partial; **no event bus** |
| Editor | Monaco via Platform | AvalonEdit interim + `IEditorPlatform` started |
| Tree | Full ADR | `DevWorkFlow.Tree` live; events/DnD thin |
| Workflow L5 / Plugin / AI L6 | Principle | **No code** |

## Modules

| Area | Status |
|------|--------|
| Solution (Domain/App/Infra/Tree/Editor/UI/tests) | Yes |
| IDE Shell WPF (dock L/C/R/B, ribbon, status) | Yes |
| **Left Panel UX** (Explorer/Menu/DB/Outline) | **Frozen** — no visual/layout change w/o explicit user ask |
| Program/Web.config, Menu←wcommand→controllers, FS/DB explorers | Yes |
| Form Builder / Insight surface / ERP LS (parse, semantic, entity, diag, limited nav) | Partial |
| Outline | Dual — prefer `OutlineViewModel` + LS |
| Editor Platform consumers | Migrating |

**Missing:** Plugin host; WF engine; AI; LS events; incremental parse; Rename/Format/SemanticSearch; Monaco+WebView2; workspace index/layout persistence; file watcher.

## Priorities (ordered)

**T0** Merge Outline: drop `XmlStructureOutlineViewModel` XML parse + offset nav → LS + NodeId.  
**T1 (owner decide):** Monaco migrate timeline · unify Designer `Fbo*`↔Semantic (ADR-0006) · rewrite Roadmap Level labels.  
**T2:** LS events → incremental+cancel → FindRefs beyond Entity / Format/Rename → finish `IEditorPlatform` consumers → Tree menus/DnD/events/persist → Designer toolbox/DnD.  
**T3 (don't start):** WF L5, AI L6, Marketplace/Cloud L7.

Living detail: `docs/specs/GAPS_AND_PRIORITIES.md`.

## Debt

Dual Form models (`FboXmlParser`/`FboFormModel` vs `ErpSemanticBinder`) · Dual Outline · AvalonEdit vs ADR-0002 · PropertyChanged vs LS events · Full reparse · Plugin principle w/o host · Manual DI in `UI/App.xaml.cs` · Fat `FormBuilderViewModel`.

## ADR impl status (all Accepted)

| ADR | Note |
|-----|------|
| 0001 LS SoT | Enforce: no XML parse outside LS |
| 0002 Monaco | Deferred; AvalonEdit interim under Platform |
| 0003 Tree | Core path; events incomplete |
| 0004 Insight | Partial UI |
| 0005 Editor Platform | Project started |
| 0006 Semantic | **Violated** by Designer dual path |
| 0007 Workspace | Partial |
| 0008 Plugin | Unimplemented — still binding for designs |

## Open Q

Monaco Adapter when? Designer migrate now vs dual-write? Roadmap relabel to which Level? Min Extension Points for L2–3? Events: Language-only vs Workspace-wide?

## Constraints (canonical → `ARCHITECTURE_SUMMARY` R1–R10)

XML=storage · Semantic First via LS/Commands · Nav Symbol/NodeId · Insight inline (not tooltip primary) · Plugin≠Core patch · Editor=render only · Tree=display only · **Left Panel UX freeze**.

**Insight mode (2026-07-20, đổi triết lý):** editor hiển thị **ClearText** (entity đã expand),
**read-only**; lớp Insight chỉ tô nền theo nguồn entity (inline≠SYSTEM, cấp 0≠lồng), hover =
tên entity, Ctrl+Click = mở entity (SYSTEM → tab mới, giữ nguyên caret tab cũ). Nguồn:
`GetProjection(ClearText).ClearTextSegments`. Sửa nội dung chỉ ở Source mode.
Spec: `docs/specs/editor/insight-editor-surface.md` §2026-07-20.

## Next milestone: Language Sync Foundation

1) T0 Outline · 2) LS events (`DocumentChanged`/`SemanticChanged`/`DiagnosticsChanged`) · 3) Shell on events · 4) Continue Platform migration · 5) Relabel Roadmap + keep GAPS current.  
**Exit:** no R1/R7 Outline violation; ≥1 real Editor←LS event path; build+tests green.
