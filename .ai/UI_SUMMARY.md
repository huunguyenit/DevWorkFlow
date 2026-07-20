# UI_SUMMARY

Shell/plugin UX rules. Docs: `docs/07-UI_GUIDELINES.md`. ADR 0004/0007/0002. Cross-rules: R8 Insight.

## Principles

Information First (inline) · Workspace First (coordinated panels) · Minimal Distraction · Progressive Disclosure · Consistency. Not ERP client UI · not generic XML editor look · not VS clone for its own sake.

## Shell

```text
Ribbon
3 cols: Left | Center | Right — each Top|Bottom
L-top: Explorer/Menu/DB | C-top: Editor | R-top: Insight/Toolbox
L-bot: Outline | C-bot: Problems/Output/Log | R-bot: Properties  ← same band height
5× pin/unpin: L-top, L-bot, C-bot, R-top, R-bot
Status Bar
```

Spec v1.2: `docs/specs/ui/shell-layout.md` — `BottomBandHeight` shared; splitter any column syncs 3 bottoms.

Dock: **DockManager** + AvalonDock (VS-like pin/auto-hide). Spec: `docs/specs/ui/dock-manager.md`.  
Nav priority: Ribbon → Toolbar(minimal) → Command Palette `Ctrl+Shift+P` → Context Menu.  
Search: `Ctrl+P` Quick Open · `Ctrl+Shift+F` Global.

## Tokens

Primary `#2D7FF9` · Accent `#00B86B` · Warn `#F39C12` · Error `#E74C3C` · BG `#FFFFFF` · SecBG `#F6F7F9` · Border `#D9DEE7` · Text `#1F2937` / muted `#6B7280` · Font Segoe UI/Inter 12/14/16 · Icons Material 20px mono.

## Rules

Inline Insight · Status/Toast/IdeMessage (not MessageBox for routine) · ≤7 cmds/Ribbon group · anim <150ms · Empty/Loading/Error states · maximize Editor space (no card-heavy chrome).

## Left Panel policy (product)

Explorer/Menu/Database/Outline — layout **v1.2** (3 cols, 5 panel pin, shared bottom band). User-approved 2026-07-20. Allowed: logic/load bugs, pin/splitter/`BottomBandHeight`. Forbidden w/o ask: restyle ngoài spec, icon pack swap.

## Status / Gaps

Guidelines live; shell layout spec v1.2. TODO: implement 3 column hosts + `BottomBandHeight` + 5 pin commands · persist layout · Command Palette · replace MessageBox.
