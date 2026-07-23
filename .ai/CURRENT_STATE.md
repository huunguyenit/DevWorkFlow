# CURRENT_STATE

Where the project stands today. Entry point + rules: `CLAUDE.md`.
For long-form background, open the one `docs/` file the task needs — never the set. Update: 2026-07-22.

## Maturity

| Dim | Docs | Code |
|-----|------|------|
| Stage | 0.x | Pre-alpha |
| Level | L1 Foundation | Touches L2–L4 |
| Arch | Clean + Providers | Partial; dual models |
| Language | Design done | Partial; **no event bus** |
| Editor | Monaco via Platform | AvalonEdit interim + `IEditorPlatform` started |
| Tree | Full ADR | `DevWorkFlow.Tree` live; events/DnD thin |
| Workflow L5 / Plugin / AI L6 | Principle | **No code** |

## Modules

| Area | Status |
|------|--------|
| Solution (Domain/App/Infra/Tree/Editor/UI/tests) | Yes |
| IDE Shell WPF (dock L/C/R/B, ribbon, status) | Yes |
| **Left Panel UX** (Explorer/Menu/DB + Outline bottom) | Layout v1.1 approved 2026-07-20 — see `docs/specs/ui/shell-layout.md` |
| Program/Web.config, Menu←wcommand→controllers, FS/DB explorers | Yes |
| Form Builder / Insight surface / ERP LS (parse, semantic, entity, diag, limited nav) | Partial |
| Outline | Dual — prefer `OutlineViewModel` + LS |
| Editor Platform consumers | Migrating |

**Missing:** Plugin host; WF engine; AI; LS events; incremental parse; Rename/Format/SemanticSearch; Monaco+WebView2; workspace index/layout persistence; file watcher.

## Priorities (ordered)

**T0** Merge Outline: drop `XmlStructureOutlineViewModel` XML parse + offset nav → LS + NodeId.  
**T1 (owner decide):** Monaco migrate timeline · unify Designer `Fbo*`↔Semantic (ADR-0006) · rewrite Roadmap Level labels.  
**T2:** LS events → incremental+cancel → FindRefs beyond Entity / Format/Rename → finish `IEditorPlatform` consumers → Tree menus/DnD/events/persist → Designer toolbox/DnD.  
**T3 (don't start):** WF L5, AI L6, Marketplace/Cloud L7.

Living detail: `docs/specs/GAPS_AND_PRIORITIES.md`.

## Debt

Dual Form models (`FboXmlParser`/`FboFormModel` vs `ErpSemanticBinder`) · Dual Outline · AvalonEdit vs ADR-0002 · PropertyChanged vs LS events · Full reparse · Plugin principle w/o host · Manual DI in `UI/App.xaml.cs` · Fat `FormBuilderViewModel`.

## ADR impl status (all Accepted)

| ADR | Note |
|-----|------|
| 0001 LS SoT | Enforce: no XML parse outside LS |
| 0002 Monaco | Deferred; AvalonEdit interim under Platform |
| 0003 Tree | Core path; events incomplete |
| 0004 Insight | Partial UI |
| 0005 Editor Platform | Project started |
| 0006 Semantic | **Violated** by Designer dual path |
| 0007 Workspace | Partial |
| 0008 Plugin | Unimplemented — still binding for designs |

## Open Q

Monaco Adapter when? Designer migrate now vs dual-write? Roadmap relabel to which Level? Min Extension Points for L2–3? Events: Language-only vs Workspace-wide?

## Constraints (canonical → `ARCHITECTURE_SUMMARY` R1–R10)

XML=storage · Semantic First via LS/Commands · Nav Symbol/NodeId · Insight inline (not tooltip primary) · Plugin≠Core patch · Editor=render only · Tree=display only · **Left Panel UX freeze**.

**Insight mode (2026-07-20, đổi triết lý):** editor hiển thị **ClearText** (entity đã expand),
**read-only**; lớp Insight chỉ tô nền theo nguồn entity (inline≠SYSTEM, cấp 0≠lồng), hover =
tên entity, Ctrl+Click = mở entity (SYSTEM → tab mới, giữ nguyên caret tab cũ). Nguồn:
`GetProjection(ClearText).ClearTextSegments`. Sửa nội dung chỉ ở Source mode.
Spec: `docs/specs/editor/insight-editor-surface.md` §2026-07-20.

**Designer WPF cũ đã gỡ (2026-07-20):** tab "Designer" + `DesignViewport` (render form/grid/lookup bằng
WPF) + rulers/guides/viewport/span-column commands + controls cũ (`DotGridBackground`/`GuidelineLayer`/
`ColumnGuides`/`SelectionChrome`) + `DesignViewportVm`/`GuidelineVm` **removed**. **GIỮ** data model
`DesignSurfaceVm`/`DesignCellVm`/`DesignFieldPropertyVm` + `FboDesignMapper` vì **Property Grid +
navigation (chọn field theo symbol) + LoadedTitle + Save layout** vẫn dựa vào. Full removal khỏi data
model = ADR-0006, task riêng.

**Design tab = HTML Generator (2026-07-22, landed):** `ErpEditorMode.Designer` render HTML sinh từ
**XML→Semantic→Layout** (KHÔNG còn phụ thuộc skin capture). Module `Design`:
- **Application/Design**: `DesignHtmlGenerator` (shell UTF-8 + CSS IDE nhúng `fbo-design-minimal.css` +
  CSS controller + link asset tĩnh) · `DesignFormHtmlBuilder` (Dir: vùng main/tab category/footer, cell
  ủy quyền) · `DesignGridHtmlBuilder` (Grid list/Detail, 5 placeholder rows) · `DesignControlHtmlBuilder`
  (field→control: mask/numeric/dropdown/boolean/lookup…) · `DesignDocumentService` (orchestrate: resolve
  asset + Grid Detail qua Language Service). Mỗi element mang `data-symbol-id`/`data-node-id` cho overlay
  sau này. Chỉ nhúng 1 script chuyển tab (IDE-owned), **không** script controller, **không** `.axd`.
- **Infrastructure/Design**: `DesignAssetResolver` (menu→main.aspx→MasterPage→Css/ClientScript/Images,
  bỏ .axd/ngoại vi) · `AspxMasterPageParser` · `DesignRelatedDocumentLocator`.
- **UI**: `DesignWebViewHost` (thay `SkinDesignerView`, đã gỡ) `NavigateToString(GeneratedDesignDocument.Html)`
  + 2 `PixelRuler` (zoom/scroll như cũ); map virtual host `devworkflow.program`→Program root nạp asset tĩnh.
  `FormBuilderViewModel` giữ `GeneratedDesignDocument`/`IsDesignRendering`/`DesignRenderError`, refresh
  cancellation-safe khi parse/đổi ngôn ngữ/đổi Program/vào Designer.
- **Layout + thước (2026-07-22):** `FormTable` = `width:{tổng cột}px;table-layout:fixed;padding:8px`; `view@height`
  chuyển từ vùng main sang **tab category không chứa Grid** (`CategoryHasGrid`); tab có field Grid-style bọc
  detail trong `.DwfGridBody` cao theo `field@rows`. `DesignWebViewHost` tiêm script đo gốc bảng main → post
  `designViewport{scroll,origin}` → thước `Offset=(scroll−origin)×zoom` (tick 0 = mép FormTable); crosshair +
  nhãn px (toạ độ theo gốc bảng) vẽ trong document, ẩn khi rời trang.
- **Config/css packs (2026-07-22):** `UI/Config/css/manifest.json` + `fbo-form|grid|tabs|toolbar|lookup.css`
  (adapt từ `.temp` WebResource form/grid, map `.DwfTab*`/toolbar). Cascade: Program → IDE baseline →
  Config packs → controller `<css>`. `IDesignCssCatalog`/`DesignCssCatalog` load từ `ConfigRoot/css`;
  Application chỉ nhận `DesignCssBundle` (không đọc FS). Sửa CSS trong Config không cần rebuild Application
  (copy-to-output).
- `FboXmlParser` giờ chọn đúng view `id="Dir"`/`id="Grid"`, parse `css/text` + `grid/@type`;
  `ErpSemanticBinder.LegacyDocument` parse trên ClearText đã expand entity (thấy field/CSS từ Include).
- **Layout Blueprint P0 (2026-07-23, landed):** `Application/Design/Layout` — `LayoutRegionId`
  (`main`/`footer`/`cat:N`) + `LayoutSlotId` (region+row+col) · `ILayoutEngine`/`LayoutEngine`
  (`ResizeColumns` giữ tổng width Region, clamp `MinColumnWidthPx`; `MergeSlots` chỉ khi ≤1 bên có control;
  `SplitSlot` control giữ cột đầu; `SetAnchor`/`SetSplit` 1-based, main view) · `ViewRowPatternBuilder`
  (Cells → pattern `1/0/-`) · `IDesignLayoutCommands`/`DesignLayoutCommands` (surface ổn định) ·
  `IDesignLayoutWriterAdapter`/`FboDesignLayoutWriterAdapter` → `FboXmlWriter.ApplyLayout` (nay persist cả
  `view@anchor`/`@split`). **Chưa wire UI** — Overlay là P1+.
- **Layout Blueprint P1 — Blueprint read-only (2026-07-23, landed):** `DesignFormHtmlBuilder` emit
  `data-dwf-slot="{region}:{row}:{col}:{span}"` trên mọi `<td>` + `data-dwf-region-table`/`data-dwf-col-widths`
  trên `FormTable` (region = `main`/`cat:N`/`footer`, khớp `LayoutRegionId`). `DesignRenderRequest`/
  `DesignBuildRequest` có cờ `EnableBlueprint` (mặc định false) → `<body class="dwf-blueprint">` +
  `<style data-dwf-source="blueprint">` (`fbo-design-blueprint.css`, embedded, inert nếu thiếu class).
  `DesignWebViewHost` tiêm `DesignBlueprintScript` vẽ `#dwf-blueprint-layer`: đường cột nét đứt + nhãn
  **`Npx` only** (không hiện %), đo theo hàng `tr.DwfColRow` thật (fallback cộng dồn px), bỏ qua tab ẩn, repaint khi
  scroll/resize/đổi tab; post `blueprint{phase:'ready'}` (host bỏ qua). `FormBuilderViewModel` bật
  `EnableBlueprint: true` cho render tab Design.
- **Layout Blueprint P2 (2026-07-23, landed):** Splitter drag trên Blueprint → preview DOM → commit
  `resize{regionId,splitterIndex,deltaPx,commit}` → `FormBuilderViewModel.ApplyBlueprintColumnResize` →
  `IDesignLayoutCommands.ResizeColumns` + Writer Adapter → reparse/`RefreshGeneratedDesignAsync`.
  Multi-click (450ms): Control → Slot → Region (`select{level,symbolId,slotId,regionId}`) + chrome CSS
  `.dwf-blueprint-selected*`. `LayoutRegionId.TryParse` / `TryParseSlotAttr`.
- **Layout Blueprint P3 — Slot drag/drop (2026-07-24, landed):** Engine thêm `InsertFieldAtSlot`
  (`SlotInsertMode` Replace/Before/After — Before/After **mượn một ô trống span 1** trong hàng nên tổng số
  cột Region không đổi; Replace chỉ vào ô trống, replace-on-drop control khác vẫn là backlog), `MoveField`
  (Replace = hoán đổi nội dung; Before/After = dọn nguồn trước rồi chèn cạnh đích, rollback nếu hàng đích
  đầy), `ClearSlot`. Region đích phải khớp `field@categoryIndex` — đổi vùng của field là thao tác field,
  không phải layout. Blueprint: kéo ô có control → ghost 50% + drop chrome (ô trống = `drop-target` xanh lá;
  ô có control = vạch Insert Before/After theo nửa trái/phải) → `drop{fromSlot,toSlot,mode}` →
  `ApplyBlueprintSlotDrop`. Esc hủy kéo.
- **Layout Blueprint P4 — Merge/Split UI + Ensure region (2026-07-24, landed):** Chrome trên
  `#dwf-blueprint-layer`: chọn Slot (2 click) → nút `Merge ▸` (slot liền phải) / `◂ Split` (span > 1);
  chọn Region (3 click) → `+ Footer` (chỉ khi chưa có footer, host hỏi Yes/No) / `+ Tab`. Messages
  `merge`/`split`/`ensureFooter`/`addCategory` → `ApplyBlueprintMerge`/`Split`/`EnsureFooter`/`AddCategory`.
  Engine `EnsureFooter` (idempotent, category -1 + columns từ view) và `AddCategory` (index > 0, trùng →
  Fail); `FboXmlWriter` nay **tạo mới** `<categories>`/`<category>` + `<header v e>` khi model có mà XML chưa.
  Mọi mutation đi chung `CommitLayoutMutation`: Command → Adapter ghi XML → reparse ngay → Design refresh;
  thất bại chỉ báo StatusMessage, không đụng `XmlSource`.
- **Layout Blueprint — Toolbox → Slot (2026-07-24, landed):** `ToolboxViewModel.BindTo(form)` (nối trong
  `MainViewModel.BindToolsToActiveForm` như Outline/PropertyGrid) sinh **danh sách field của controller**
  kèm vùng hợp lệ (`main`/`footer`/`cat:N`) và cờ `IsPlaced`; mỗi field có 3 chip kéo **L / I / D**
  (`.Label` / input / `.Description`). Catalog control chung giữ nguyên, chỉ để tham khảo.
  Transport: **không dùng OLE `DragDrop.DoDragDrop`** (WebView2 là HWND riêng, WPF không nhận DragOver) —
  `ToolboxPanel` capture chuột và bơm toạ độ màn hình qua `DesignToolboxDragBroker` (static, `UI/Services`);
  `DesignWebViewHost.TryToPagePoint` đổi sang CSS px (`PointFromScreen / ZoomFactor`) rồi gọi
  `window.__dwfToolbox.over(x,y,label)` → ghost + drop chrome vẽ **trong trang**; khi thả gọi `drop()` trả
  `{slot,mode}` (ExecuteScriptAsync trả JSON, không cần message mới) → `ApplyBlueprintToolboxDrop` →
  `IDesignLayoutCommands.InsertFieldAtSlot`.
- **Layout Blueprint P5 — Fix Drop + Control Palette (2026-07-24, landed):** Drop không còn silent —
  `slotUnder` dùng `elementsFromPoint` (bỏ qua splitter/ghost/chrome), broker **re-subscribe trên Loaded**,
  miss/fail → `StatusMessage` `✘ …`. Palette MVP kéo được: TextBox / TextArea / CheckBox / DatePicker /
  ComboBox / Lookup / Label → `DesignToolboxDragPayload.IsNewControl` + `ToolboxControlKind` →
  `ApplyBlueprintNewControlDrop` → `CreateFieldAndInsert` (tên `text_N`/`memo_N`/… + `categoryIndex` theo
  region đích) → `FboXmlWriter.ApplyNewField` rồi `ApplyLayout` qua `WriteFieldAndLayout`. Layout/Advanced
  (GroupBox, Grid, Workflow…) vẫn stub. Field mới hiện lại trong FIELDS sau reparse.
- **Layout Blueprint P6 — Toolbox FBO + Layout UX (2026-07-24, landed):**
  - **Config palette:** `UI/Config/xml/toolbox-controls.xml` (7 basic: TextBox/DateTime/Numeric/CheckBox/
    ComboBox/AutoComplete/Lookup + 4 Tab: Normal/Grid/Post/List) + `UI/Config/json/blueprint-theme.json`
    (màu Blueprint). Parse fail-closed: `Domain/Design/ToolboxControlCatalogModels` +
    `Application/Design/Toolbox/{ToolboxControlCatalogParser,ToolboxControlCatalog,BlueprintTheme,BlueprintThemeCatalog}`.
    `ToolboxControlKind` = {TextBox,DateTime,Numeric,CheckBox,ComboBox,AutoComplete,Lookup,Tab*} (bỏ
    TextArea/DatePicker/Label). App: `new ToolboxViewModel(toolbox_catalog.GetData())`.
  - **Toolbox = chỉ palette config, bỏ FIELDS.** `ToolboxViewModel.BindTo` gỡ; kéo cả dòng control.
  - **Engine:** `PlaceFieldParts` (Input→Label→Description theo ô trống từ điểm thả, ≥1 ô cho Input);
    `CreateFieldAndInsert` viết lại (Replace→Place; Before/After→Input; AutoComplete tạo `ac_N`+`ten_ac_N`
    `readOnly`, `items@reference=ten_ac_N%l`); `DescribeControl` khớp FBO (CheckBox `items@style=Checkbox`,
    DateTime `dataFormatString=@dateTimeFormat`, Numeric `Decimal`+`dataFormatString=""`);
    `RemoveField(out removed)` xóa mọi ô + `<field>` (AutoComplete xóa cả cặp); `EnsureSpareTrailingRow`
    (**chỉ Main** — hàng trống không mang field nên category/footer sẽ trôi về main khi reparse);
    `AddTabCategory` (Normal = category rỗng; Grid/Post/List seed field `items@style` chiếm trọn hàng →
    reparse-ổn định); `ResizeFormWidth` (phân bổ lại widths theo tỉ lệ) + `SetRegionHeight` (Main→`view@height`).
    `ResolveOrCreateRow` tạo backing row khi thả vào category/footer chưa có hàng.
  - **Writer:** `ApplyNewField` thêm `dataFormatString`/`readOnly`/`items@reference`; `ApplyRemoveField`;
    `ApplyLayout` nay ghi cả `view@height`. Adapter: `WriteFieldsAndLayout` (nhiều field) +
    `WriteRemoveFieldsAndLayout`.
  - **Tab dialog:** `UI/Views/Design/AddTabCategoryDialog` (kind + Header V/E + Controller cho Grid/Post/List).
    Kéo Tab* từ Toolbox / nút `+` cuối tab bar / chrome `+ Tab` → dialog → `ApplyBlueprintAddTab`.
  - **Blueprint UX:** màu từ theme JSON (inject `window.__dwfTheme` mỗi `NavigationCompleted`); resize cột
    **chỉ dải mép trên** (Word-like); merge/split **kéo mép phải ô** (phải=merge, trái=split) thay nút chrome;
    kéo **mép phải form** → `formWidth`; kéo **mép dưới main** → `regionHeight`; **Ctrl+Click** control →
    `gotoField` → mở Source tại `<field>` (không thoát Designer — fix bug P5 click level-1 điều hướng);
    **Delete/Backspace** trên slot có control → `remove` (host hỏi Yes/No); `data-dwf-split`/`data-dwf-anchor`
    trên bảng main → vẽ **line chia** (theme `splitDivider`) + **icon ⚓** trên cột anchor. Selection click
    chỉ highlight + Property Grid (`SelectCellAny`), không điều hướng.
- **Chưa làm (P6+):** Undo/Redo Design Command (non-goal) · Replace-on-drop đè control · category/footer spare
  row reparse-stable (chỉ Main) · Normal tab rỗng chưa droppable đến khi có builder render spare row · rename
  field từ Property Grid (backlog) · DOM patch incremental (vẫn full refresh) · ADR-0006 Serializer.

`SkinUrlHelper` gợi ý base_url = `https://dev.fast.com.vn/<tên dự án>`; `SkinManifest`/`SkinCaptureRequest`
có `DocKind` (`ControllerDisplayKind`). Menu "Xem skin" đã gỡ.

**Project Web Skin (chỉ còn cho AI/tham khảo, 2026-07-22):** `IProjectSkinService` (Application/Skin) vẫn
capture shell ERP → `FboHostNormalizer` (ép `<meta charset=utf-8>`, host trống `#dwf-designer-host`, rewrite
asset → `devworkflow.program`) → lưu `shell.html` (UTF-8 **có BOM**) vào `%AppData%/DevWorkFlow/skins/`.
**KHÔNG còn tham gia runtime của tab Design** (Design đã chuyển sang HTML Generator). Giữ menu Design ▸ Web
Skin (Lấy skin / Refresh assets) + `ProjectSkinViewModel` cho tooling/AI. Infra: HtmlAgilityPack.

## Next milestone: Language Sync Foundation

1) T0 Outline · 2) LS events (`DocumentChanged`/`SemanticChanged`/`DiagnosticsChanged`) · 3) Shell on events · 4) Continue Platform migration · 5) Relabel Roadmap + keep GAPS current.  
**Exit:** no R1/R7 Outline violation; ≥1 real Editor←LS event path; build+tests green.
