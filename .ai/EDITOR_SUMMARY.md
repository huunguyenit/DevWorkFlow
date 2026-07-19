# EDITOR_SUMMARY

Adapter LS ↔ engines. Docs: `docs/03-EDITOR_PLATFORM.md`. ADR 0002/0004/0005. Cross-rules: R3/R8/R10.

## Scope

**In:** Text display; caret/selection/scroll; folding/decorations; completion/diagnostics markers; theme/clipboard/commands; Message Bridge.  
**Out:** Parse; entity resolve; biz validation; Tree/WF; SQL direct; tooltip-as-primary UX.

## Stack

```text
LS → IEditorPlatform → MonacoAdapter → WebView2 → Monaco
                    ↘ AvalonEditAdapter (interim only)
Layers: Source · Insight · Diagnostics · Decorations · Widgets
```

Sole consumer API: `IEditorPlatform`. Bridge = JSON messages only (no raw JS). Stateless Adapter — no business state in engine.

## Insight render

Entity ref muted/italic/readonly · Resolved value editable → sync Entity via LS · nested hierarchy preserved · prefer inline Insight over Problems-only · decorations must not silently rewrite text · reveal by SymbolId from LS.

## Constraints

Never call Monaco/AvalonEdit APIs outside Adapter · incremental decorations (no full re-render every key) · async bridge (no sync `.Result`/`.Wait`) · thin VM · Undo ideally Command-level.

## Ext

DecorationProvider · CompletionUIProvider · ThemeProvider · CommandProvider · InlineWidgetProvider · AI ghost-text.

## Status / Gaps

Design: Monaco+Platform. Code: AvalonEdit primary; `DevWorkFlow.Editor` started; consumer migration incomplete; Insight partial.  
TODO: migrate VMs → Platform · Monaco Adapter+Bridge · search by resolved value · inline validation/missing-entity markers · IDE Undo Command path.
