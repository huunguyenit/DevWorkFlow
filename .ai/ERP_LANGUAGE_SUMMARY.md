# ERP_LANGUAGE_SUMMARY

Roslyn/LSP of FBO ERP. Docs: `docs/02-ERP_LANGUAGE_SERVICE.md`. ADR 0001/0006/0004(data). Cross-rules: `ARCHITECTURE` R1/R6/R7/R8.

## Scope

**In:** Parse→Syntax; Semantic build; Entity/Symbol; Diagnostics; Nav/Completion; Format/Refactor/Search; Insight **data**; doc lifecycle sync.  
**Out:** Pixels (Editor/Insight UI); Tree UI; WF/DB UI; Plugin host; Designer layout math.

## Pipeline

```text
DocumentManager → Parser → Syntax → SemanticBuilder → Semantic
  → Symbol/Entity/Nav/Completion/Diagnostics/Insight/Format/Refactor/Search
  → Serializer (save)
Consumers: Editor, Tree(semantic DS), Designer, WF, AI, Plugins
Lifecycle: Open→Parse→Syntax→Semantic→Diag→Insight ready
```

**Model shape:** Document → Forms/Categories/Fields · Commands/Scripts/Views · Workflows/Entities/Metadata. Symbols: stable SymbolId; Refs by SymbolId.

## Contracts

Public LS API only. Providers: Completion · Diagnostics · Insight · Nav · Format · Search · Refactor.  
No Monaco/WPF/Tree knowledge inside LS. InsightService does not paint. Immutable model — Command/Transaction. Emit events; UI must not poll. Incremental + CancellationToken required (full sync reparse = perf violation).

## Status / Gaps

Have: parse, binder, entity, diagnostics, limited nav.  
Missing: event surface (`DocumentChanged`, `SemanticChanged`, `DiagnosticsChanged`, `InsightChanged`, `NavigationChanged`); incremental pipeline; Format/Rename/Search services; FindRefs beyond Entity; kill UI/outline alternate parsers; align Designer to this Semantic.
