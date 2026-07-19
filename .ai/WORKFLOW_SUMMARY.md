# WORKFLOW_SUMMARY

IDE automation (broader than ERP BPM). Docs: `docs/05-WORKFLOW_ENGINE.md`. Roadmap L5. Providers via ADR 0008; ops via LS 0001/0006; editor actions 0005.

## Scope

**In:** Run Action graphs; schedule/pause/cancel; context & transactions; dispatch; validate/debug.  
**Out:** WPF paint; XML parse; own Semantic; Monaco APIs; FS/DB except through Actions.

## Concepts

Node-based declarative graphs · Action Provider = behavior · transactional batches · async-first.  
Model: `{ Nodes, Connections, Vars, Params, Events, Meta, Version }` — nodes=metadata; behavior=Providers.

```text
Designer → Engine{Runtime, Scheduler, Context, ActionDispatcher, TxnMgr, EventBus, StateStore}
              ↓ Action/Trigger Providers
```

Runtime: Start/Pause/Resume/Stop/Cancel/Retry. Planned Action domains: ERP · Editor · Tree · DB · File · Git · AI · Notification.

## Rules

No UI from Engine · no XML parse · no biz outside Actions · orchestrate public services only · Actions use LS/Editor/Tree APIs (never private Core) · no inventing partial engines in UI.

## Status

Spec only — **not implemented** (old prototypes removed). Skip unless user explicitly jumps Scope to L5.

## MVP TODO

Runtime + ActionDispatcher + 2–3 Actions → Designer canvas → persist definitions via Semantic/storage pipeline. Later: scheduled/distributed runs; AI-generated flows; marketplace templates.
