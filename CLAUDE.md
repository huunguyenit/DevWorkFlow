# DevWorkFlow

WPF IDE for FBO ERP (.NET 10, `DevWorkFlow.slnx`). Not a general IDE, not an ERP runtime client.

## Commands

```bash
dotnet build DevWorkFlow.slnx
dotnet test tests/DevWorkFlow.Tree.Tests    # per-project; run only what you touched
```

## Layers

```text
UI (WPF shell) → Application → Core (Language | Editor | Tree | Workflow | Plugin | AI) → Infrastructure
```

Read: XML → Parser → Semantic → LS → App → UI.
Edit: User → Command → LS → Semantic → **Serializer only** → XML.

## Hard rules (violating these breaks the architecture)

- UI never parses XML, never queries DB.
- Only the Language Service parses XML; only the Serializer writes it.
- Navigation by SymbolId/NodeId, never by line offset.
- Editor renders only — no business logic. Only Editor Platform may reference Monaco.
- Tree framework knows nothing about ERP.
- **Left Panel UX is frozen** — no visual or layout change without the user explicitly asking.

Full set is R1–R10 in `.ai/ARCHITECTURE_SUMMARY.md`.

## Context files — open ONLY what the task needs

| File | Open when |
|------|-----------|
| `.ai/CURRENT_STATE.md` | What's built, priorities, debt, open questions |
| `.ai/ARCHITECTURE_SUMMARY.md` | Layers, R1–R10, philosophy |
| `.ai/ADR_SUMMARY.md` | Why a decision was made (ADR 0001–0008) |
| `.ai/{ERP_LANGUAGE,EDITOR,TREE,UI}_SUMMARY.md` | Contracts for that domain |
| `.ai/{PLUGIN,WORKFLOW,ROADMAP}_SUMMARY.md` | Future levels — not current work |

`docs/*.md` are the long-form source of truth for humans. Open one only when a summary
is genuinely insufficient; never read the set to "get context".

Authority when sources disagree: Architecture/ADR > specs/GAPS > Roadmap wording.

## Conventions

Clean Architecture + MVVM + DI, immutable Semantic Model mutated via Command/Transaction,
events over polling (`DispatcherTimer` is a smell). Details: `docs/08-CODING_STANDARDS.md`.
