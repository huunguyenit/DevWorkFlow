# UI_SUMMARY

Shell/plugin UX rules. Docs: `docs/07-UI_GUIDELINES.md`. ADR 0004/0007/0002. Cross-rules: R8 Insight.

## Principles

Information First (inline) · Workspace First (coordinated panels) · Minimal Distraction · Progressive Disclosure · Consistency. Not ERP client UI · not generic XML editor look · not VS clone for its own sake.

## Shell

```text
Ribbon
L: Explorer/Menu/Database + Outline | C: Editor/Designer | R: Props/Insight/AI
B: Problems/Output/References/Log… | Status Bar
```

Dock: AvalonDock-style (resize, collapse, auto-hide, float).  
Nav priority: Ribbon → Toolbar(minimal) → Command Palette `Ctrl+Shift+P` → Context Menu.  
Search: `Ctrl+P` Quick Open · `Ctrl+Shift+F` Global.

## Tokens

Primary `#2D7FF9` · Accent `#00B86B` · Warn `#F39C12` · Error `#E74C3C` · BG `#FFFFFF` · SecBG `#F6F7F9` · Border `#D9DEE7` · Text `#1F2937` / muted `#6B7280` · Font Segoe UI/Inter 12/14/16 · Icons Material 20px mono.

## Rules

Inline Insight · Status/Toast/IdeMessage (not MessageBox for routine) · ≤7 cmds/Ribbon group · anim <150ms · Empty/Loading/Error states · maximize Editor space (no card-heavy chrome).

## Left Panel policy (product)

Explorer/Menu/Database/Outline visuals & layout **done/frozen**. Allowed w/o ask: logic/load bugs that don’t change layout/visual. Forbidden w/o ask: restyle, restructure docks, new chrome, icon pack swap.

## Status / Gaps

Guidelines live; Left polished+frozen; bottom height aligned with Outline; status maximize fix exists. TODO: persist dock sessions · Command Palette completeness · replace remaining MessageBox · empty-state secondary panes.
