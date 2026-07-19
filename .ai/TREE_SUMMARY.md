# TREE_SUMMARY

Shared hierarchy UI (not only Project Explorer). Docs: `docs/04-TREE_FRAMEWORK.md`. ADR 0003/0007. Cross-rules: R1/R4. Left Panel UX freeze → `UI_SUMMARY`/`CURRENT_STATE`.

## Scope

**In:** Virtualization; lazy load/cache; expand/selection plumbing; search hooks; diff refresh.  
**Out:** XML/SQL/ERP knowledge; parse; biz DnD rules (DataSource owns); DB in renderer; biz data in TreeViewItem.

## Stack

```text
TreeControl → TreeRenderingEngine → VirtualTreeEngine → ITreeDataSource
TreeFrameworkHost = VM glue
```

`TreeNode`: Id, ParentId, DisplayName, Icon, Kind, HasChildren, Metadata.  
`ITreeDataSource`: roots/children, refresh, search, observe. TreeState: expanded/selected/scroll.

## DataSources

| DS | Consumer |
|----|----------|
| FileSystem | Project Explorer |
| Command/Menu | Menu Explorer |
| Database | DB Explorer |
| XmlSemantic | Outline (via LS) |
| WF/Entity/Plugin/Git/AI | Future |

**Menu shape:** Menu(wcommand) → Kind folder (Dir|Grid|Filter|…) → File. Load via AspxControllerParser + ControllerRelatedFileResolver (MenuService).

## Rules (Tree-local)

Readonly nodes in UI — mutate via DS/framework APIs · open symbol/file: Metadata → LS → Editor Reveal · biz DnD = DS handler · collapse cancels pending loads · refresh = diff/patch (not wipe) · persist state via TreeState/Workspace (not controls alone).

**Ban:** materialize entire ERP tree · full rebind on filter · Monaco/XML parse in Tree core.

## Ext

TreeDataSource · Icon · ContextMenu · Search · DragDrop · NodeRenderer · Filter/Grouping.

## Status / Gaps

`DevWorkFlow.Tree` + `TreeControl` used by Explorer/Menu/DB/Outline.  
Missing vs ADR: rich events (`NodeInserted/Removed/Updated/SearchCompleted`), real DnD, context menus, fuzzy search, expand persist across refresh/sessions.
