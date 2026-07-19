# ROADMAP_SUMMARY

Capability levels (not calendar). Docs: `docs/09-ROADMAP.md`. **Execution priority = GAPS tiers**, not stale Level label alone.

## Policy

Finish prior Level before starting next **as product gate** — but code already ahead of doc L1. Map every feature to a Level. DoD = Level exit + tests + docs. Do not start L5–L7 unless user requests Scope jump.

## Levels

| L | Name | Goal / Exit |
|---|------|-------------|
| 0 | Foundation | Solution, docs, DI, logging, theme |
| 1 | Workspace | Open Program/XML, save, basic nav *(doc “Current” — stale)* |
| 2 | ERP Language | Stable LS; UI never parses |
| 3 | Intelligent Editor | Workspace-grade GoTo/FindRef/Rename/fold/inlay… |
| 4 | Visual | Designers two-way with Semantic |
| 5 | Workflow | Designer + Runtime |
| 6 | AI Native | AI uses LS/Workspace only |
| 7 | Ecosystem | Marketplace, Cloud, Enterprise |

Milestones M1…M7 = L1…L7 outcomes. Deferred OK: Git · realtime collab · Cloud · Marketplace · advanced agents · Live Share.

## Reality check

Doc Level **1**; code ≈ L2–L4 pieces (LS, Insight, Designer). Prefer `docs/specs/GAPS_AND_PRIORITIES.md` for ordered work. Relabel Roadmap after event/platform/designer consolidation. Explicit milestones still owed: Monaco Adapter (under L1/L2), Plugin MVP before “everything is Provider” claims.

## ADR↔Level

0001–0007 underpin L1–L4 foundations; 0008 + WF + AI align L5–L7.
