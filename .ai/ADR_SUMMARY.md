# ADR_SUMMARY

Merged `docs/adr/ADR-0001`…`0008`. All **Accepted**, none superseded. Impl status → `CURRENT_STATE`. Open ADR bodies only when detailing.

## Graph

```text
0001 LS ──► 0006 Semantic
  │            │
  └► 0004 Insight
0002 Monaco ──► 0005 Editor Platform ──┐
0003 Tree ─────────────────────────────┴► 0007 Workspace ──► 0008 Plugin
```

## SoT naming (not conflicts)

| Phrase | Means |
|--------|-------|
| 0001 LS SoT | Only authority that **builds** semantic truth |
| 0006 Semantic SoT | **Data artifact** everyone consumes |
| TreeDataSource / Editor Platform / Workspace “single” | SoT **within layer** |

---

**0001 Language Service** — Only LS parses XML, builds syntax/semantic, resolves, validates, navigates, completes, refactors, formats. All modules consume LS; none own parsers. *Why:* one shared meaning. *Impact:* Editor/Tree/WF/AI/Designer/Plugin call LS only. Base for 0002–0004, 0006.

**0002 Monaco via Platform** — Monaco in WebView2 **through** Editor Platform; no direct Monaco from modules/plugins/LS. *Why:* rich IDE + swappable engine. *Risks:* WPF↔WebView sync, large payloads, WebView lifecycle, cold start, Monaco version — mitigate via Message Bridge (JSON), incremental updates, lazy init, Adapter. AvalonEdit may exist as **interim adapter under Platform** without amending ADR. Rejected: AvalonEdit-as-final, hand-rolled editor. Formalized by 0005.

**0003 Tree Framework** — Dedicated framework: DataSource / Node / Provider / Renderer; lazy + virtualize + async + cache; TreeView display-only. *Why:* ERP trees too large for naive WPF models. *Ban:* XML parse / DB in renderer; TreeViewItem-as-model; full materialize. Semantic trees get data from LS (0001); expand/selection session via Workspace (0007).

**0004 Insight Layer** — Overlay on Source (e.g. Entity→Value); does **not** rewrite XML. Provider pipeline + viewport virtualization. Nested entities keep hierarchy; edit resolved value → sync Entity via LS; search should include resolved values; prefer inline over tooltip-only UX. *Depends:* 0001 + 0002/0005. Rejected: tooltip-only; permanently replace source with resolved text.

**0005 Editor Platform** — `IEditorPlatform` sole editor API; Monaco implements; **Message Bridge only** (no raw JS from WPF). Platform: document/caret/selection/viewport, decorations, folding, completion/diagnostics chrome, theme/clipboard/commands — **no biz/parse**. Undo ideally Command-level (not buffer-only). Used by 0004/0007/0008.

**0006 Semantic Model** — Semantic Model = Program representation; edit Semantic → Serialize → XML. Shape: Workspace→Projects→Documents→Forms/Fields/Commands/Scripts/Views/Workflows/Entities/Metadata + Symbols (stable SymbolId, ParentId, Kind, Name, Location, Scope) + Refs by SymbolId. Incremental updates required long-term. *Ban:* parallel truth models; module XML writes; nav by line. *Plugin:* no private biz state outside Semantic. Designer `Fbo*` dual path = known violation to resolve.

**0007 Workspace Runtime** — Workspace ≠ folder/project; = IDE runtime (projects, documents, editor/tree/workflow/plugin/AI sessions, layout). Only Workspace persists IDE session state (caret/fold/scroll/decorations/insight; tree expand/select/filter/scroll; WF vars/breakpoints; AI context from open docs/selection/semantic — AI must not scrape folder alone). Multi-project allowed. Sync via events.

**0008 Plugin Architecture** — Core = Platform; extend via Capabilities + Extension Points; Manifest (Id, Name, Author, Version, Description, RequiredApiVersion, Dependencies, Capabilities); permissions, sandbox, hot reload, versioning. Lifecycle: Discover→Validate→Load→Init→Register→Run→Dispose. Isolation: Plugin↔Core↔Plugin only; DI for services; no Core patches; no Plugin↔Plugin secret APIs; no XML parse / private Semantic mutate / Monaco / internal DB. UI contributes descriptions (dock/menu/toolbar/…), not Core namespaces. **Unimplemented today** — principle still binds new designs. MVP before large surface growth.

## Rejected (remember)

Per-module XML parse · DOM-as-model · AvalonEdit final · direct Monaco · TreeViewItem model · full tree materialize · tooltip-only Insight · replace source permanently · Workspace=path only · patch Core · plugin secret APIs.

## Open tensions

1. AvalonEdit interim → migrate to Monaco Adapter; don’t quiet-fix 0002.  
2. Designer Fbo* ↔ Semantic 0006 — unification plan needed.  
3. 0008 principle w/o host — define MVP Extension Points before expansion.
