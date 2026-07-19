# ARCHITECTURE_SUMMARY

Canonical cross-cutting rules. Full: `docs/01-ARCHITECTURE.md`, `docs/00-VISION.md`. ADR index: `ADR_SUMMARY`.

## Philosophy

Clean Arch + SOLID + MVVM + DI + **Event-Driven** + Provider/Adapter.  
**XML = storage · Semantic Model = data SoT · LS = sole builder/authority.**  
ERP Language = XML+Entity+Command+Workflow+SQL+JS+Metadata.  
Insight First (inline) · Workspace First · AI Native (reads Semantic/Workspace, never raw XML) · Extensible via Provider.  
FBO ERP IDE only — not general IDE / not ERP runtime client.

## Layers

```text
Workspace UI (display, dock, commands)     — no biz/parse/DB
    ↓
Application (docs, nav, search, plugins) — no XML touch
    ↓
Core: Language | Editor Platform | Tree | Workflow | Plugin | AI
    ↓
Infrastructure (FS, SQL, XML I/O, config, log) — no UI policy
```

**Read:** XML → Parser → Semantic → LS → App → UI.  
**Edit:** User → Command/Txn → LS → Semantic → **Serializer only** → XML.

## Contracts

Modules talk via interfaces only. Consumers: LS APIs · `IEditorPlatform` · `ITreeDataSource`.  
Forbidden: reverse/circular deps; static Core service locators; UI parse/DB; Editor biz logic.

## Services

| Service | Role | Status |
|---------|------|--------|
| ERP Language | Parse, semantic, symbols, diag, nav, insight **data** | Partial |
| Editor Platform | Engine-agnostic editor API | Partial |
| Tree Framework | Virtualized hierarchy | In use |
| Document/Workspace Mgr | Lifecycle + **sole** IDE session persistence | Partial |
| Workflow / Plugin / AI | Automation / extensions / assist via LS | Unimplemented |

## Rules R1–R10 (enforce always)

| ID | Rule |
|----|------|
| R1 | UI must not parse XML |
| R2 | UI must not query DB directly |
| R3 | Editor holds no business logic |
| R4 | Tree framework knows no ERP |
| R5 | Workflow must not write XML |
| R6 | AI must not read XML raw |
| R7 | Navigation uses Symbol/NodeId (never design around line offset alone) |
| R8 | Insight must not mutate source |
| R9 | Plugin must not patch Core |
| R10 | Only Editor Platform/Monaco Adapter may depend on Monaco |

**Also binding (ADR):** only Serializer writes XML · no module edits XML bytes · SymbolId stable (name may change) · refs by SymbolId · Immutable Semantic — mutate via Command/Transaction · prefer events over `DispatcherTimer`/polling · Plugin biz state lives in Semantic, not private stores.

## Extension

Providers: Completion, Diagnostics, Insight, TreeDataSource, Action, AI, UI surfaces. Plugins register Providers only (host TBD — designs still Provider-shaped).

## Gaps (see CURRENT_STATE)

Events · Plugin host · WF engine · Monaco Adapter · Designer dual model vs ADR-0006 · Outline R1/R7.
