# PLUGIN_SUMMARY

Extend without modifying Core. Docs: `docs/06-PLUGIN_SYSTEM.md`. ADR 0008. Cross-rules: R9 + `ARCHITECTURE` Serializer/Monaco bans.

## Philosophy

Platform First · Extension Point First · Provider First · Manifest · Sandbox/permissions/versioning eventually. **Zero code today** — every live feature still edits Core/UI; new designs must stay Provider-shaped; MVP host before large expansion.

## Target stack

```text
Core Platforms → Extension Points → Provider Registry → Loader → Host → Assemblies
Lifecycle: Discover→Validate→Load→Init→Register→Run→Dispose
```

Manifest min: Id · Name · Author · Version · Description · RequiredApiVersion · Dependencies · Capabilities.

## Rules

Never patch Core · public APIs only · DI (no `new` Core services) · no circular plugin deps · isolation Plugin↔Core↔Plugin only · don’t block UI thread.

**Forbidden:** parse XML · private Semantic mutate · Monaco/AvalonEdit APIs · raw WPF into Core namespaces · internal DB helpers · non-public APIs · biz state outside Semantic (ADR-0006).

## Extension catalogue

| Domain | Examples |
|--------|----------|
| Language | Completion, Diagnostics, Insight, Refactor |
| Editor | Decorations, Commands, Widgets |
| Tree | DataSource, Icon, ContextMenu |
| Workflow | Action, Trigger |
| Designer | Toolbox, Property editors |
| AI | Assistants, Agents |
| App UI | Ribbon, Menu, Dock, Settings, Status, Dialog, Welcome |

Requires: 0001/0003/0005/0007 surfaces.

## MVP TODO

Min points for Insight + TreeDataSource + Action · Host + sample plugin · capability permissions · version matrix. Later: Marketplace, signing, remote/cloud, enterprise policy.
