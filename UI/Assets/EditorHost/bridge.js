// DevWorkFlow Editor Host — Monaco boot + Message Bridge (ADR-0002 / ADR-0005).
// Không chứa business logic ERP: chỉ Render + relay Command/Event qua WebView2 postMessage.
(function () {
    'use strict';

    // Home/End tường minh bằng editor API (không phụ thuộc id lệnh nội bộ Monaco). Smart-home:
    // nhảy về ký tự không-trắng đầu tiên, nếu đã ở đó thì về cột 1. Trả true nếu đã xử lý,
    // false để caller fallback sang editor.trigger (dùng cho PageUp/PageDown…).
    function runCursorLineAction(editor, actionId) {
        var isHome = actionId === 'cursorHome' || actionId === 'cursorHomeSelect';
        var isEnd = actionId === 'cursorEnd' || actionId === 'cursorEndSelect';
        if (!isHome && !isEnd) return false;

        var model = editor.getModel();
        var pos = editor.getPosition();
        if (!model || !pos) return false;

        var line = pos.lineNumber;
        var targetCol;
        if (isEnd) {
            targetCol = model.getLineMaxColumn(line);
        } else {
            var fnw = model.getLineFirstNonWhitespaceColumn(line); // 1-based, 0 nếu dòng trống/toàn ws
            targetCol = (fnw !== 0 && pos.column !== fnw) ? fnw : 1;
        }

        if (/Select$/.test(actionId)) {
            var sel = editor.getSelection();
            editor.setSelection(new monaco.Selection(
                sel.selectionStartLineNumber, sel.selectionStartColumn, line, targetCol));
        } else {
            editor.setPosition({ lineNumber: line, column: targetCol });
        }
        editor.revealPosition({ lineNumber: line, column: targetCol });
        return true;
    }

    // Ctrl+Home/End (đầu/cuối FILE) — cũng làm tường minh vì WPF phải chặn phím trước khi
    // AvalonDock nuốt, rồi mới gọi xuống đây.
    function runCursorDocumentAction(editor, actionId) {
        var isTop = actionId === 'cursorTop' || actionId === 'cursorTopSelect';
        var isBottom = actionId === 'cursorBottom' || actionId === 'cursorBottomSelect';
        if (!isTop && !isBottom) return false;

        var model = editor.getModel();
        if (!model) return false;

        var target = isTop
            ? { lineNumber: 1, column: 1 }
            : { lineNumber: model.getLineCount(), column: model.getLineMaxColumn(model.getLineCount()) };

        if (/Select$/.test(actionId)) {
            var sel = editor.getSelection();
            editor.setSelection(new monaco.Selection(
                sel.selectionStartLineNumber, sel.selectionStartColumn,
                target.lineNumber, target.column));
        } else {
            editor.setPosition(target);
        }
        editor.revealPosition(target);
        return true;
    }

    var params = new URLSearchParams(window.location.search);
    var language = params.get('lang') || 'xml';

    require.config({ paths: { vs: '../Monaco/vs' } });

    require(['vs/editor/editor.main'], function () {
        // XML dùng tokenizer FBO riêng (CDATA text thuần, entity token, nhúng SQL/JS)
        // — xem erp-xml-language.js. SQL dùng tokenizer built-in của Monaco.
        if (window.registerErpXmlLanguage)
            window.registerErpXmlLanguage(monaco);

        // erp-xml nhúng SQL/JS qua nextEmbedded. Monaco chỉ tokenize vùng nhúng khi tokenizer
        // của ngôn ngữ đó ĐÃ nạp — với bản offline (lazy loader theo id) thì tạo tạm một model
        // theo ngôn ngữ sẽ kích hoạt nạp; không có bước này thì SQL/JS trong thẻ không được tô
        // (rơi về text thuần) cho tới khi tình cờ có model ngôn ngữ đó. Model tạm dispose ngay.
        ['sql', 'javascript'].forEach(function (id) {
            try { monaco.editor.createModel('', id).dispose(); } catch (e) { /* ngôn ngữ không có */ }
        });

        var monacoLanguage = language === 'xml' ? 'erp-xml' : language;

        var editor = monaco.editor.create(document.getElementById('container'), {
            value: '',
            language: monacoLanguage,
            automaticLayout: true,
            readOnly: false,
            minimap: { enabled: false },
            fontFamily: 'Cascadia Code, Consolas, Courier New',
            fontSize: 13,
            scrollBeyondLastLine: false,
            wordWrap: 'off',
            renderWhitespace: 'none',

            // P6-06 multi-cursor: Alt+Click thêm con trỏ, Ctrl+D chọn occurrence kế, Ctrl+Shift+L
            // chọn tất cả, Ctrl+Alt+↑/↓ thêm con trỏ trên/dưới (mặc định Monaco — khai báo tường
            // minh để không phụ thuộc default của bản nhúng).
            multiCursorModifier: 'alt',
            multiCursorMergeOverlapping: true,
            multiCursorPaste: 'spread',
            selectionHighlight: true,
            occurrencesHighlight: 'singleFile',
            // Ctrl+bánh xe phóng/thu font editor (WebView zoom đã tắt ở host).
            mouseWheelZoom: true
        });

        // Ctrl+D / Ctrl+Shift+L / Ctrl+Alt+↑↓ đăng ký lại tường minh: WebView2 nhận phím trước
        // WPF nên không bị AvalonDock cướp, nhưng bản Monaco nhúng có thể thiếu keybinding mặc
        // định nếu build rút gọn — đăng ký ở đây thì hành vi giống nhau ở mọi bản.
        (function registerMultiCursorKeys() {
            var K = monaco.KeyMod, C = monaco.KeyCode;
            if (!K || !C || C.KeyD === undefined) return;   // bản Monaco đặt tên KeyCode khác

            var bindings = [
                [K.CtrlCmd | C.KeyD, 'editor.action.addSelectionToNextFindMatch'],
                [K.CtrlCmd | K.Shift | C.KeyL, 'editor.action.selectHighlights'],
                [K.CtrlCmd | K.Alt | C.UpArrow, 'editor.action.insertCursorAbove'],
                [K.CtrlCmd | K.Alt | C.DownArrow, 'editor.action.insertCursorBelow'],
                // Font zoom — host cũng bắt Ctrl+=/−/0 vì WPF NavigateBack chiếm Ctrl+-.
                [K.CtrlCmd | C.Equal, 'editor.action.fontZoomIn'],
                [K.CtrlCmd | C.NumpadAdd, 'editor.action.fontZoomIn'],
                [K.CtrlCmd | C.Minus, 'editor.action.fontZoomOut'],
                [K.CtrlCmd | C.NumpadSubtract, 'editor.action.fontZoomOut'],
                [K.CtrlCmd | C.Digit0, 'editor.action.fontZoomReset'],
                [K.CtrlCmd | C.Numpad0, 'editor.action.fontZoomReset']
            ];
            bindings.forEach(function (pair) {
                try {
                    editor.addCommand(pair[0], function () {
                        editor.trigger('keyboard', pair[1], null);
                    });
                } catch (ignore) { /* thiếu action trong bản nhúng → bỏ qua, không chặn boot */ }
            });
        })();

        // Sau fontZoom* đồng bộ CSS var (view zone / hover) với fontSize mới.
        editor.onDidChangeConfiguration(function (e) {
            try {
                if (e && e.hasChanged && e.hasChanged(monaco.editor.EditorOption.fontSize)) {
                    var opts = editor.getOptions();
                    syncEditorFontVars(
                        opts.get(monaco.editor.EditorOption.fontFamily),
                        opts.get(monaco.editor.EditorOption.fontSize));
                }
            } catch (ignore) { /* EditorOption API khác bản */ }
        });

        // Đồng bộ font/line-height của editor vào CSS variables — view zone phân cấp
        // nested entity dùng chung để chữ trong zone khớp pixel với dòng code thật.
        function syncEditorFontVars(fontFamily, fontSize) {
            var root = document.documentElement;
            root.style.setProperty('--dwf-editor-font', fontFamily);
            root.style.setProperty('--dwf-editor-font-size', fontSize + 'px');
            root.style.setProperty(
                '--dwf-editor-line-height',
                editor.getOption(monaco.editor.EditorOption.lineHeight) + 'px');
        }
        syncEditorFontVars('Cascadia Code, Consolas, Courier New', 13);

        function hexNoHash(color) {
            return (color || '').replace('#', '');
        }

        // Số cấp lồng entity có màu riêng; cấp sâu hơn dùng chung màu của cấp cuối.
        // Phải khớp số class .dwf-ct-l1…l9 khai báo trong index.html.
        var MAX_ENTITY_LEVEL = 9;

        // theme = EditorThemeOptions (camelCase) từ C#. Map tokens.* → tên token Monarch
        // thật của erp-xml (phải khớp erp-xml-language.js).
        function applyTheme(theme) {
            if (!theme) return;

            var tokens = theme.tokens || {};
            function rule(tokenName, style) {
                if (!style) return null;
                var r = { token: tokenName };
                if (style.color) r.foreground = hexNoHash(style.color);
                if (style.fontStyle) r.fontStyle = style.fontStyle;
                return r;
            }

            var rules = [
                rule('tag', tokens.tag),
                rule('attribute.name', tokens.attributeName),
                rule('attribute.value', tokens.attributeValue),
                rule('entity.reference', tokens.entityReference),
                // Tên trong KHAI BÁO <!ENTITY X ...> — token riêng, không in nghiêng như
                // tham chiếu &X; (xem ghi chú nguyên tắc trong erp-xml-language.js).
                rule('entity.name', tokens.entityName),
                rule('keyword', tokens.keyword),
                rule('comment', tokens.comment),
                rule('string.cdata', tokens.cdata),
                rule('delimiter.cdata', tokens.delimiter),
                rule('delimiter', tokens.delimiter),
                rule('metatag', tokens.metatag),
                rule('metatag.content', tokens.metatag)
            ].filter(function (r) { return r !== null; });

            // SQL nhúng (<command>/<query>/<response> không event) do tokenizer SQL built-in
            // của Monaco tô — token có hậu tố ".sql" (keyword.sql, string.sql, ...). Rule dài
            // hơn thắng rule XML cùng gốc (keyword.sql > keyword), nên màu SQL độc lập với XML
            // thay vì kế thừa mặc định VS Light. Token không map (identifier.sql, predefined.sql,
            // delimiter.sql) rơi về foreground/delimiter — chấp nhận được.
            var sql = theme.sql || {};
            [
                rule('keyword.sql', sql.keyword),
                rule('string.sql', sql.string),
                rule('comment.sql', sql.comment),
                rule('number.sql', sql.number),
                rule('operator.sql', sql.operator)
            ].forEach(function (r) { if (r) rules.push(r); });

            // JS nhúng (<script>, <command event=...>) + file .js — tokenizer JS/TS built-in,
            // token có hậu tố ".js" (keyword.js, string.js, ...). Cùng cơ chế prefix như SQL:
            // rule .js thắng rule cùng gốc của XML. Biến thể phụ (string.escape.js, number.float.js,
            // comment.doc.js) không map → dùng mặc định base 'vs', chấp nhận được.
            var js = theme.js || {};
            [
                rule('keyword.js', js.keyword),
                rule('string.js', js.string),
                rule('comment.js', js.comment),
                rule('number.js', js.number),
                rule('regexp.js', js.regexp),
                rule('type.identifier.js', js.type)
            ].forEach(function (r) { if (r) rules.push(r); });

            monaco.editor.defineTheme('dwf-theme', {
                base: 'vs',
                inherit: true,
                rules: rules,
                colors: {
                    'editor.background': theme.background || '#FFFFFF',
                    'editor.foreground': theme.foreground || '#1E1E1E'
                }
            });
            monaco.editor.setTheme('dwf-theme');

            var fontFamily = theme.fontFamily || 'Cascadia Code, Consolas, Courier New';
            var fontSize = theme.baseFontSize || 13;
            editor.updateOptions({ fontFamily: fontFamily, fontSize: fontSize });
            syncEditorFontVars(fontFamily, fontSize);

            // Màu nền vùng entity trong Insight mode — đổ vào CSS variable, giữ selector
            // trong index.html làm nguồn duy nhất cho thứ tự ưu tiên (l1 < … < l9 < error).
            var ct = theme.clearTextEntity;
            if (ct) {
                var root = document.documentElement;
                var levels = ct.levels || [];
                // Thiếu màu ở cuối danh sách → các cấp còn lại kế thừa màu cuối cùng có thật,
                // không rơi về "không tô" (cấp sâu vẫn phải phân biệt được với cấp cha).
                var last = null;
                for (var lv = 1; lv <= MAX_ENTITY_LEVEL; lv++) {
                    var color = levels[lv - 1] || last;
                    if (!color) continue;
                    root.style.setProperty('--dwf-ct-l' + lv, color);
                    last = color;
                }

                var map = {
                    '--dwf-ct-error': ct.error,
                    '--dwf-ct-system-marker': ct.systemMarker,
                    '--dwf-ct-hover-border': ct.hoverBorder
                };
                Object.keys(map).forEach(function (name) {
                    if (map[name]) root.style.setProperty(name, map[name]);
                });
            }
        }

        var suppressChangeEvent = false;
        var lastShowInsights = false;

        function post(obj) {
            window.chrome.webview.postMessage(JSON.stringify(obj));
        }

        function respond(id, result, error) {
            if (!id) return;
            post({ id: id, result: result === undefined ? null : result, error: error || null });
        }

        // ── Document / Selection events (JS → C#) ──────────────────────────
        editor.onDidChangeModelContent(function () {
            if (suppressChangeEvent) return;
            post({ event: 'contentChanged', payload: { text: editor.getValue() } });
        });

        editor.onDidChangeCursorSelection(function () {
            var model = editor.getModel();
            var position = editor.getPosition();
            if (!model || !position) return;
            var selection = editor.getSelection();
            var selectedText = selection ? model.getValueInRange(selection) : '';
            post({
                event: 'selectionChanged',
                payload: {
                    offset: model.getOffsetAt(position),
                    line: position.lineNumber,
                    column: position.column,
                    selectedText: selectedText || null
                }
            });
        });

        // ── Insight Layer — Layer 3: ClearText + tô nguồn gốc entity ────────────
        // Triết lý (thay thế hoàn toàn cách hiển thị "chèn giá trị sau &X;" trước đây):
        // Insight mode hiển thị TOÀN BỘ document dưới dạng clear text — mọi tham chiếu
        // entity đã được Language Service expand thành nội dung thật. Lớp này chỉ tô nền
        // để cho biết đoạn text nào đến từ entity nào:
        //   - entity inline (<!ENTITY X "...">)  ≠ màu  entity SYSTEM (file ngoài)
        //   - entity chính (depth 0)             ≠ màu  entity lồng bên trong (depth > 0)
        //   - hover  → hiện tên entity (tooltip là phụ; nội dung chính đã nằm inline)
        //   - Ctrl+Click → báo host mở entity; editor KHÔNG tự mở file, không tự cuộn
        //
        // Span trong segments tính trên CLEAR TEXT đang hiển thị, không phải source XML.
        // Buffer ở Insight mode là read-only (host set), nên decoration không bị lệch do gõ.
        var segmentDecorations = editor.createDecorationsCollection([]);
        var lastSegments = [];

        // depth 0 = cấp 1. Từ cấp 10 trở đi dùng chung màu cấp 9 (xem index.html).
        function segmentLevel(segment) {
            return Math.min(segment.depth + 1, MAX_ENTITY_LEVEL);
        }

        // ClearTextSegmentKind: 0 = Inline, 1 = System (xem ErpDocumentProjection.cs).
        // Màu = cấp lồng; entity SYSTEM thêm class đánh dấu (gạch chân đứt), không đổi màu.
        function segmentClass(segment) {
            if (segment.isError) return 'dwf-ct-error';
            var css = 'dwf-ct-l' + segmentLevel(segment);
            if (segment.kind === 1) css += ' dwf-ct-system';
            return css;
        }

        function segmentHover(segment) {
            var kind_text = segment.kind === 1 ? 'entity SYSTEM' : 'entity inline';
            var level = segmentLevel(segment);
            var level_text = ' — cấp ' + (segment.depth + 1)
                + (level === MAX_ENTITY_LEVEL && segment.depth + 1 > MAX_ENTITY_LEVEL
                    ? ' (dùng màu cấp ' + MAX_ENTITY_LEVEL + ')'
                    : '');
            var lines = ['**&' + segment.entityName + ';** — ' + kind_text + level_text];
            if (segment.isError)
                lines.push('_Không resolve được (thiếu file hoặc chu kỳ entity)._');
            else
                lines.push('_Ctrl+Click để mở entity._');
            return { value: lines.join('\n\n') };
        }

        function renderClearTextSegments(segments, show) {
            lastSegments = segments || [];
            lastShowInsights = !!show;

            var model = editor.getModel();
            if (!lastShowInsights || !model) {
                segmentDecorations.set([]);
                return;
            }

            var length = model.getValueLength();
            var decorations = [];

            // Sắp xếp nông → sâu: decoration của entity lồng được thêm SAU entity cha nên
            // nằm trên trong thứ tự class; CSS khai báo nhóm "nested" sau nhóm "root" để
            // vùng chồng lấn lấy màu của cấp sâu nhất.
            lastSegments
                .slice()
                .sort(function (a, b) { return a.depth - b.depth; })
                .forEach(function (segment) {
                    var span = segment.span;
                    if (!span || span.length <= 0) return;
                    // Bỏ segment lệch khỏi text hiện tại (segments tới trước setValue mới).
                    if (span.startOffset + span.length > length) return;

                    var start = model.getPositionAt(span.startOffset);
                    var end = model.getPositionAt(span.startOffset + span.length);
                    decorations.push({
                        range: new monaco.Range(
                            start.lineNumber, start.column, end.lineNumber, end.column),
                        options: {
                            className: segmentClass(segment),
                            // Không set hoverMessage: hover value do Content Widget (entity hover)
                            // đảm nhiệm — tránh hai popup chồng nhau (spec Phase 1 §5.3).
                            stickiness: monaco.editor.TrackedRangeStickiness
                                .NeverGrowsWhenTypingAtEdges
                        }
                    });
                });

            segmentDecorations.set(decorations);
        }

        // Segment sâu nhất chứa offset — entity lồng thắng entity cha, đúng với cái mà
        // người dùng nhìn thấy màu của nó tại điểm click.
        function segmentAt(offset) {
            var found = null;
            for (var i = 0; i < lastSegments.length; i++) {
                var span = lastSegments[i].span;
                if (!span || span.length <= 0) continue;
                if (offset < span.startOffset) continue;
                if (offset >= span.startOffset + span.length) continue;
                if (found === null || lastSegments[i].depth > found.depth)
                    found = lastSegments[i];
            }
            return found;
        }

        // Ctrl+Click → chỉ POST yêu cầu; KHÔNG preventDefault để Monaco vẫn đặt caret tại
        // đúng chỗ vừa click, và tuyệt đối không cuộn/không đổi selection. Nhờ vậy khi host
        // mở entity ra tab mới, quay lại tab này vẫn thấy đúng vị trí đã click.
        editor.onMouseDown(function (e) {
            if (!e.event || !(e.event.ctrlKey || e.event.metaKey)) return;
            if (!e.target || !e.target.position) return;
            var model = editor.getModel();
            if (!model) return;
            var offset = model.getOffsetAt(e.target.position);

            if (lastShowInsights) {
                var segment = segmentAt(offset);
                // Trúng entity → mở entity (ưu tiên, giữ nguyên Phase 1).
                if (segment && !segment.isError) {
                    post({
                        event: 'openEntityRequested',
                        payload: {
                            entityName: segment.entityName,
                            symbolId: segment.symbolId,
                            definitionPath: segment.definitionPath,
                            definitionOffset: segment.definitionOffset,
                            openPath: segment.openPath
                        }
                    });
                    return;
                }
                // KHÔNG trúng entity: trước đây return luôn nên Ctrl+Click ở Insight mode chết
                // hoàn toàn (không gesture nào tới được Language Service). Gửi offset ClearText
                // kèm cờ insight để host chạy chuỗi nav như Source mode.
                post({ event: 'entityOffsetActivated', payload: { offset: offset, insight: true } });
                return;
            }

            // Source mode (XML thô): chỉ gửi offset nguồn; host tra LS ResolveEntityAtOffset.
            post({ event: 'entityOffsetActivated', payload: { offset: offset, insight: false } });
        });

        // ── Code hover Content Widget (Entity / g.$a / FBO JS / SQL) ─────────
        // Rộng cố định + wrap/scroll; body colorize bằng Monaco (sql / erp-xml / javascript).
        // Ghim anchor lúc hiện — không theo caret khi chuột đi tới widget (tránh nhảy).
        var HOVER_WIDGET_ID = 'dwf.entity.hover';
        var HOVER_FIXED_WIDTH = 420;
        var hoverDom = null, hoverNameEl = null, hoverKindEl = null, hoverBodyEl = null;
        var hoverVisible = false, hoverPosition = null, lastHoverOffset = -1;
        var hoverAnchorRange = null; // { start, end } token đang neo
        var hoverPointerInside = false;
        var hoverMoveTimer = null, hoverHideTimer = null;
        var hoverColorizeSeq = 0;

        function ensureHoverStyle() {
            var style = document.getElementById('dwf-entity-hover-style');
            if (!style) {
                style = document.createElement('style');
                style.id = 'dwf-entity-hover-style';
                document.head.appendChild(style);
            }
            // Dense IDE light — Primary #0b5cad; width cố định; cầu hit-area phía trên widget.
            style.textContent =
                '.dwf-entity-hover{position:relative;box-sizing:border-box;' +
                'width:' + HOVER_FIXED_WIDTH + 'px;max-width:' + HOVER_FIXED_WIDTH + 'px;' +
                'background:#ffffff;border:1px solid #c8d0d8;border-radius:6px;' +
                'box-shadow:0 4px 16px rgba(15,23,42,.14);' +
                'font-family:Segoe UI,system-ui,sans-serif;font-size:12px;color:#1e293b;overflow:hidden;}' +
                /* Cầu vô hình giữa token và card — chuột đi tới không “rơi” xuống editor. */
                '.dwf-entity-hover::before{content:"";position:absolute;left:0;right:0;top:-10px;' +
                'height:10px;}' +
                '.dwf-entity-hover .hdr{display:flex;align-items:center;gap:8px;' +
                'padding:6px 10px;background:#f1f5f9;border-bottom:1px solid #e2e8f0;}' +
                '.dwf-entity-hover .hdr-main{flex:1;min-width:0;display:flex;flex-direction:column;gap:2px;}' +
                '.dwf-entity-hover .name{font-weight:600;font-size:12px;color:#0b5cad;' +
                'white-space:nowrap;overflow:hidden;text-overflow:ellipsis;' +
                'font-family:Consolas,"Cascadia Code",monospace;}' +
                '.dwf-entity-hover.err .name{color:#c62828;}' +
                '.dwf-entity-hover .kind{align-self:flex-start;font-size:10px;font-weight:600;' +
                'letter-spacing:.02em;text-transform:uppercase;color:#475569;' +
                'background:#e2e8f0;border-radius:4px;padding:1px 6px;line-height:1.4;}' +
                '.dwf-entity-hover.err .kind{background:#ffcdd2;color:#b71c1c;}' +
                '.dwf-entity-hover.kind-entity .kind{background:#e3f2fd;color:#1565c0;}' +
                '.dwf-entity-hover.kind-ga .kind{background:#f3e5f5;color:#7b1fa2;}' +
                '.dwf-entity-hover.kind-fbo .kind{background:#e8f5e9;color:#2e7d32;}' +
                '.dwf-entity-hover.kind-sql .kind{background:#fff3e0;color:#e65100;}' +
                '.dwf-entity-hover .copy{flex-shrink:0;font:inherit;font-size:11px;font-weight:500;' +
                'border:1px solid #c8d0d8;background:#fff;border-radius:4px;padding:3px 10px;cursor:pointer;' +
                'color:#334155;transition:background .15s,border-color .15s;}' +
                '.dwf-entity-hover .copy:hover{background:#eaf2fb;border-color:#0b5cad;color:#0b5cad;}' +
                '.dwf-entity-hover .copy:focus-visible{outline:2px solid #0b5cad;outline-offset:1px;}' +
                '.dwf-entity-hover .body{margin:0;padding:8px 10px;max-height:260px;overflow:auto;' +
                'box-sizing:border-box;width:100%;' +
                'white-space:pre-wrap;overflow-wrap:anywhere;word-break:break-word;line-height:1.45;' +
                'font-family:Consolas,"Cascadia Code",monospace;font-size:11.5px;color:#1e293b;' +
                'background:#fafbfc;}' +
                /* colorize() trả span.mtk* — giữ wrap trong khung cố định. */
                '.dwf-entity-hover .body span{white-space:inherit;}' +
                '.dwf-entity-hover .body .view-line{display:inline;white-space:inherit;}' +
                '@media (prefers-reduced-motion:reduce){.dwf-entity-hover .copy{transition:none;}}';
        }

        function kindClass(kind) {
            var k = (kind || '').toLowerCase();
            if (k.indexOf('entity') >= 0) return 'kind-entity';
            if (k.indexOf('$a') >= 0 || k === 'g.$a') return 'kind-ga';
            if (k.indexOf('fbo') >= 0 || k.indexOf('js') >= 0) return 'kind-fbo';
            if (k.indexOf('sql') >= 0) return 'kind-sql';
            return '';
        }

        /** Chọn language id Monaco khớp theme dwf (sql / erp-xml / javascript). */
        function hoverLanguageId(kind, value) {
            var k = (kind || '').toLowerCase();
            if (k.indexOf('sql') >= 0) return 'sql';
            if (k.indexOf('fbo') >= 0 || k.indexOf('js') >= 0) return 'javascript';
            if (k.indexOf('$a') >= 0 || k === 'g.$a') {
                var ga = value || '';
                if (/^\s*(function|var |let |const |return |if\s*\()/m.test(ga)) return 'javascript';
                return null;
            }
            if (k.indexOf('entity') >= 0) {
                var t = (value || '').trim();
                if (/^(select|insert|update|delete|with|declare|exec|execute|create|alter|merge)\b/i.test(t))
                    return 'sql';
                return 'erp-xml';
            }
            return null;
        }

        function wordOffsetRange(model, position) {
            var word = model.getWordAtPosition(position);
            if (!word) {
                var o = model.getOffsetAt(position);
                return { start: o, end: o };
            }
            return {
                start: model.getOffsetAt({ lineNumber: position.lineNumber, column: word.startColumn }),
                end: model.getOffsetAt({ lineNumber: position.lineNumber, column: word.endColumn })
            };
        }

        function cancelHideHover() {
            if (hoverHideTimer) { clearTimeout(hoverHideTimer); hoverHideTimer = null; }
        }

        function ensureHoverWidget() {
            if (hoverDom) return;
            ensureHoverStyle();
            hoverDom = document.createElement('div');
            hoverDom.className = 'dwf-entity-hover';
            hoverDom.addEventListener('mouseenter', function () {
                hoverPointerInside = true;
                cancelHideHover();
            });
            hoverDom.addEventListener('mouseleave', function () {
                hoverPointerInside = false;
                scheduleHideHover();
            });

            var hdr = document.createElement('div');
            hdr.className = 'hdr';

            var hdrMain = document.createElement('div');
            hdrMain.className = 'hdr-main';
            hoverNameEl = document.createElement('div');
            hoverNameEl.className = 'name';
            hoverKindEl = document.createElement('span');
            hoverKindEl.className = 'kind';
            hdrMain.appendChild(hoverNameEl);
            hdrMain.appendChild(hoverKindEl);

            var copyBtn = document.createElement('button');
            copyBtn.type = 'button';
            copyBtn.className = 'copy';
            copyBtn.textContent = 'Copy';
            copyBtn.title = 'Copy body';
            copyBtn.addEventListener('click', function () {
                var text = hoverBodyEl ? (hoverBodyEl.textContent || '') : '';
                if (navigator.clipboard && navigator.clipboard.writeText)
                    navigator.clipboard.writeText(text);
            });

            hdr.appendChild(hdrMain);
            hdr.appendChild(copyBtn);

            hoverBodyEl = document.createElement('pre');
            hoverBodyEl.className = 'body';
            hoverBodyEl.addEventListener('wheel', function (ev) { ev.stopPropagation(); }, { passive: true });

            hoverDom.appendChild(hdr);
            hoverDom.appendChild(hoverBodyEl);
        }

        var hoverWidget = {
            getId: function () { return HOVER_WIDGET_ID; },
            getDomNode: function () { ensureHoverWidget(); return hoverDom; },
            getPosition: function () {
                return hoverPosition
                    ? {
                        // Vị trí đã ghim lúc request — không theo caret khi chuột đi tới card.
                        position: hoverPosition,
                        preference: [
                            monaco.editor.ContentWidgetPositionPreference.BELOW,
                            monaco.editor.ContentWidgetPositionPreference.ABOVE
                        ]
                    }
                    : null;
            }
        };

        function renderHoverBody(value, kind) {
            var text = value || '';
            var lang = hoverLanguageId(kind, text);
            hoverBodyEl.textContent = text;
            if (!lang || !text) return;
            var seq = ++hoverColorizeSeq;
            monaco.editor.colorize(text, lang, {}).then(function (html) {
                if (seq !== hoverColorizeSeq || !hoverVisible) return;
                hoverBodyEl.innerHTML = html;
                // Chỉ layout lại kích thước — vị trí vẫn ghim (EXACT + hoverPosition cũ).
                editor.layoutContentWidget(hoverWidget);
            });
        }

        function showEntityHover(name, value, isError, kind) {
            ensureHoverWidget();
            hoverNameEl.textContent = name || '';
            hoverKindEl.textContent = kind || 'Info';
            hoverKindEl.style.display = kind ? '' : 'none';
            hoverDom.classList.remove('err', 'kind-entity', 'kind-ga', 'kind-fbo', 'kind-sql');
            if (isError) hoverDom.classList.add('err');
            var kc = kindClass(kind);
            if (kc) hoverDom.classList.add(kc);
            renderHoverBody(value, kind);
            if (!hoverVisible) {
                editor.addContentWidget(hoverWidget);
                hoverVisible = true;
            } else {
                editor.layoutContentWidget(hoverWidget);
            }
        }

        function hideEntityHover() {
            if (hoverPointerInside) return;
            if (!hoverVisible) return;
            editor.removeContentWidget(hoverWidget);
            hoverVisible = false;
            hoverAnchorRange = null;
            hoverPointerInside = false;
            hoverColorizeSeq++;
        }

        function scheduleHideHover() {
            if (hoverPointerInside) return;
            if (hoverHideTimer) clearTimeout(hoverHideTimer);
            // Delay đủ để chuột đi từ token → cầu ::before → card mà không tắt sớm.
            hoverHideTimer = setTimeout(hideEntityHover, 220);
        }

        function isOnHoverWidget(target) {
            return target
                && target.type === monaco.editor.MouseTargetType.CONTENT_WIDGET
                && target.detail === HOVER_WIDGET_ID;
        }

        editor.onMouseMove(function (e) {
            // Trên widget (Monaco target hoặc DOM mouseenter) → giữ nguyên neo.
            if (hoverPointerInside || isOnHoverWidget(e.target)) {
                cancelHideHover();
                if (hoverMoveTimer) { clearTimeout(hoverMoveTimer); hoverMoveTimer = null; }
                return;
            }

            if (!e.target || !e.target.position) { scheduleHideHover(); return; }
            var model = editor.getModel();
            if (!model) return;
            var position = e.target.position;
            var offset = model.getOffsetAt(position);
            var range = wordOffsetRange(model, position);

            // Vẫn trên cùng token đang neo → không request lại, không đổi vị trí.
            if (hoverVisible && hoverAnchorRange
                && offset >= hoverAnchorRange.start && offset <= hoverAnchorRange.end) {
                cancelHideHover();
                if (hoverMoveTimer) { clearTimeout(hoverMoveTimer); hoverMoveTimer = null; }
                return;
            }

            // Đã hiện nhưng rời token (đường đi tới card / chỗ khác):
            // soft-hide + KHÔNG re-pin / request — tránh card nhảy theo caret.
            if (hoverVisible) {
                scheduleHideHover();
                if (hoverMoveTimer) { clearTimeout(hoverMoveTimer); hoverMoveTimer = null; }
                return;
            }

            if (hoverMoveTimer) clearTimeout(hoverMoveTimer);
            hoverMoveTimer = setTimeout(function () {
                if (hoverPointerInside || hoverVisible) return;
                hoverPosition = {
                    lineNumber: position.lineNumber,
                    column: position.column
                };
                hoverAnchorRange = range;
                lastHoverOffset = offset;
                var payload = { offset: offset, insight: !!lastShowInsights };
                if (lastShowInsights) {
                    var seg = segmentAt(offset);
                    if (seg && !seg.isError) payload.entityName = seg.entityName;
                }
                post({ event: 'entityHoverRequested', payload: payload });
            }, 120);
        });

        editor.onMouseLeave(function () {
            if (hoverPointerInside) return;
            if (hoverMoveTimer) { clearTimeout(hoverMoveTimer); hoverMoveTimer = null; }
            scheduleHideHover();
        });

        // ── FBO JS assist: Completion + Signature Help (Phase 4) ────────────
        // Nội dung do Language Service cấp từ fbo-js.catalog.xml — JS KHÔNG giữ danh sách API.
        // Mỗi request mang id; host trả về fboJsCompleteResult/fboJsSignatureResult để resolve
        // đúng Promise. Có timeout để Monaco không treo nếu host im lặng.
        var pendingAssist = {};
        var assistSeq = 0;

        function requestAssist(eventName, offset) {
            return new Promise(function (resolve) {
                var id = 'a' + (++assistSeq);
                var done = false;
                pendingAssist[id] = function (payload) {
                    if (done) return;
                    done = true;
                    delete pendingAssist[id];
                    resolve(payload);
                };
                setTimeout(function () {
                    if (done) return;
                    done = true;
                    delete pendingAssist[id];
                    resolve(null);
                }, 2000);
                post({
                    event: eventName,
                    payload: { id: id, offset: offset, insight: !!lastShowInsights }
                });
            });
        }

        function completionKind(kind) {
            var K = monaco.languages.CompletionItemKind;
            if (kind === 'property') return K.Property;
            if (kind === 'function') return K.Function;
            if (kind === 'variable') return K.Variable;
            if (kind === 'keyword') return K.Keyword;
            if (kind === 'procedure') return K.Function;
            return K.Method;
        }

        function toSuggestions(items, range) {
            if (!items || !items.length) return { suggestions: [] };
            return {
                suggestions: items.map(function (i) {
                    return {
                        label: i.label,
                        kind: completionKind(i.kind),
                        insertText: i.insertText,
                        detail: i.detail || undefined,
                        documentation: i.documentation || undefined,
                        range: range
                    };
                })
            };
        }

        function wordRange(position, word) {
            return {
                startLineNumber: position.lineNumber,
                endLineNumber: position.lineNumber,
                startColumn: word.startColumn,
                endColumn: word.endColumn
            };
        }

        // Model 'sql' = tab SQL Studio (buffer toàn SQL, không có island). Monaco chỉ có tokenizer
        // cho sql, KHÔNG có completion provider → Ctrl+Space trước đây luôn rỗng.
        monaco.languages.registerCompletionItemProvider('sql', {
            triggerCharacters: ['.'],
            provideCompletionItems: function (model, position) {
                var offset = model.getOffsetAt(position);
                var range = wordRange(position, model.getWordUntilPosition(position));
                return requestAssist('sqlCompleteRequested', offset).then(function (items) {
                    return toSuggestions(items, range);
                });
            }
        });

        // Model có thể là erp-xml (island JS bên trong XML) hoặc javascript khi đổi ở StatusBar.
        var assistLanguages = ['erp-xml', 'javascript'];

        assistLanguages.forEach(function (languageId) {
            monaco.languages.registerCompletionItemProvider(languageId, {
                triggerCharacters: ['.'],
                provideCompletionItems: function (model, position) {
                    // Insight = buffer read-only → không gợi ý (host cũng chặn, đây là chặn sớm).
                    if (lastShowInsights) return { suggestions: [] };

                    var offset = model.getOffsetAt(position);
                    var range = wordRange(position, model.getWordUntilPosition(position));

                    // Một request cho cả hai island: host trả item JS nếu caret trong <script>/
                    // Checking, trả item SQL nếu caret trong command/query/response action.
                    return requestAssist('fboJsCompleteRequested', offset).then(function (items) {
                        return toSuggestions(items, range);
                    });
                }
            });

            monaco.languages.registerSignatureHelpProvider(languageId, {
                signatureHelpTriggerCharacters: ['(', ','],
                provideSignatureHelp: function (model, position) {
                    if (lastShowInsights) return null;

                    var offset = model.getOffsetAt(position);
                    return requestAssist('fboJsSignatureRequested', offset).then(function (help) {
                        if (!help) return null;
                        return {
                            value: {
                                signatures: [{
                                    label: help.label,
                                    documentation: help.documentation || undefined,
                                    parameters: (help.parameters || []).map(function (p) {
                                        return {
                                            label: p.label,
                                            documentation: p.documentation || undefined
                                        };
                                    })
                                }],
                                activeSignature: 0,
                                activeParameter: help.activeParameter || 0
                            },
                            dispose: function () { }
                        };
                    });
                }
            });
        });

        // ── Options snippet: Tab trong vùng SQL (Phase 5 #17) ───────────────
        // JS chỉ gửi dòng hiện tại và áp kết quả; MẪU và câu SELECT do Application quyết định.
        editor.onKeyDown(function (e) {
            if (e.keyCode !== monaco.KeyCode.Tab) return;
            if (e.ctrlKey || e.shiftKey || e.altKey || e.metaKey) return;
            if (lastShowInsights) return;                 // Insight read-only

            var model = editor.getModel();
            var position = editor.getPosition();
            if (!model || !position) return;

            var lineText = model.getLineContent(position.lineNumber);
            var offset = model.getOffsetAt(position);

            var id = 'a' + (++assistSeq);
            var settled = false;
            pendingAssist[id] = function (expanded) {
                if (settled) return;
                settled = true;
                delete pendingAssist[id];
                if (!expanded) return;                    // không khớp → Tab đã chạy như thường

                var range = new monaco.Range(
                    position.lineNumber, 1,
                    position.lineNumber, model.getLineMaxColumn(position.lineNumber));
                editor.executeEdits('options-snippet', [{ range: range, text: expanded }]);
                editor.setPosition({
                    lineNumber: position.lineNumber,
                    column: expanded.length + 1
                });
            };
            setTimeout(function () {
                if (settled) return;
                settled = true;
                delete pendingAssist[id];
            }, 2000);

            post({
                event: 'optionsSnippetRequested',
                payload: { id: id, offset: offset, lineText: lineText }
            });
        });

        // ── Command handling (C# → JS) ──────────────────────────────────────
        window.chrome.webview.addEventListener('message', function (e) {
            var msg = e.data;
            if (typeof msg === 'string') {
                try { msg = JSON.parse(msg); } catch (parseErr) { return; }
            }
            if (!msg || !msg.command) return;

            try {
                switch (msg.command) {
                    case 'setValue': {
                        var newText = (msg.payload && msg.payload.text) || '';
                        if (editor.getValue() !== newText) {
                            suppressChangeEvent = true;
                            try {
                                // Giữ caret + scroll qua thay text toàn bộ (parity với
                                // AvalonEdit OnBoundTextChanged) — không có đoạn này thì
                                // mỗi lần commit Entity (VM ghi đè cả XmlSource) caret
                                // nhảy về (1,1) và màn hình cuộn lên đầu.
                                var prevPos = editor.getPosition();
                                var prevScroll = editor.getScrollTop();
                                editor.setValue(newText);
                                if (prevPos) {
                                    var m0 = editor.getModel();
                                    var ln = Math.min(prevPos.lineNumber, m0.getLineCount());
                                    var col = Math.min(prevPos.column, m0.getLineMaxColumn(ln));
                                    editor.setPosition({ lineNumber: ln, column: col });
                                    editor.setScrollTop(prevScroll);
                                }
                            }
                            finally { suppressChangeEvent = false; }
                            // Đổi buffer (kể cả chuyển Source ↔ Insight) làm mọi span cũ vô
                            // nghĩa — vẽ lại theo segments hiện có; segment lệch độ dài sẽ bị
                            // renderClearTextSegments bỏ qua cho tới khi host gửi bộ mới.
                            renderClearTextSegments(lastSegments, lastShowInsights);
                        }
                        respond(msg.id, true);
                        break;
                    }
                    case 'getValue':
                        respond(msg.id, editor.getValue());
                        break;
                    case 'setReadOnly':
                        editor.updateOptions({ readOnly: !!(msg.payload && msg.payload.value) });
                        respond(msg.id, true);
                        break;
                    case 'setClearTextSegments':
                        renderClearTextSegments(
                            msg.payload && msg.payload.segments,
                            msg.payload && msg.payload.show);
                        respond(msg.id, true);
                        break;
                    case 'setShowInsights':
                        renderClearTextSegments(lastSegments, msg.payload && msg.payload.show);
                        respond(msg.id, true);
                        break;
                    case 'revealLine': {
                        var line = msg.payload && msg.payload.line;
                        if (line && line >= 1) {
                            editor.revealLineInCenter(line);
                            editor.setPosition({ lineNumber: line, column: 1 });
                        }
                        respond(msg.id, true);
                        break;
                    }
                    case 'revealOffset': {
                        var model1 = editor.getModel();
                        var offset = msg.payload && msg.payload.offset;
                        if (model1 && typeof offset === 'number' && offset >= 0) {
                            var pos1 = model1.getPositionAt(offset);
                            editor.revealPositionInCenter(pos1);
                            editor.setPosition(pos1);
                        }
                        respond(msg.id, true);
                        break;
                    }
                    case 'selectRange': {
                        var model2 = editor.getModel();
                        var off = msg.payload && msg.payload.offset;
                        var len = (msg.payload && msg.payload.length) || 0;
                        if (model2 && typeof off === 'number') {
                            var start = model2.getPositionAt(off);
                            var end = model2.getPositionAt(off + len);
                            editor.setSelection(new monaco.Range(
                                start.lineNumber, start.column, end.lineNumber, end.column));
                            editor.revealPositionInCenter(start);
                        }
                        respond(msg.id, true);
                        break;
                    }
                    case 'applyTheme':
                        applyTheme(msg.payload);
                        respond(msg.id, true);
                        break;
                    case 'fboJsCompleteResult': {
                        var cr = msg.payload || {};
                        var completeWaiter = pendingAssist[cr.id];
                        if (completeWaiter) completeWaiter(cr.items || []);
                        respond(msg.id, true);
                        break;
                    }
                    case 'fboJsSignatureResult': {
                        var sr = msg.payload || {};
                        var signatureWaiter = pendingAssist[sr.id];
                        if (signatureWaiter) signatureWaiter(sr.help || null);
                        respond(msg.id, true);
                        break;
                    }
                    case 'optionsSnippetResult': {
                        var os = msg.payload || {};
                        var snippetWaiter = pendingAssist[os.id];
                        if (snippetWaiter) snippetWaiter(os.expanded || null);
                        respond(msg.id, true);
                        break;
                    }
                    case 'setMarkers': {
                        // Squiggle chẩn đoán (Source mode). Nhận offset trên buffer hiện tại →
                        // model.getPositionAt cho vị trí chính xác (không lệch do line/column).
                        var mm = editor.getModel();
                        var items = (msg.payload && msg.payload.markers) || [];
                        if (mm) {
                            var sevMap = { error: 8, warning: 4, info: 2, hint: 1 };
                            var markers = items.map(function (m) {
                                var len = m.length > 0 ? m.length : 1;
                                var s = mm.getPositionAt(m.startOffset);
                                var e = mm.getPositionAt(m.startOffset + len);
                                return {
                                    startLineNumber: s.lineNumber, startColumn: s.column,
                                    endLineNumber: e.lineNumber, endColumn: e.column,
                                    message: m.message || '',
                                    code: m.code || undefined,
                                    severity: sevMap[(m.severity || 'warning').toLowerCase()] || 4
                                };
                            });
                            monaco.editor.setModelMarkers(mm, 'erp', markers);
                        }
                        respond(msg.id, true);
                        break;
                    }
                    case 'setLanguage': {
                        // Đổi ngôn ngữ tô màu của model hiện tại (StatusBar: XML ↔ JavaScript ↔ SQL).
                        // "xml" ánh xạ về tokenizer FBO "erp-xml" (nhúng SQL/JS), còn lại dùng id
                        // Monaco built-in ('sql', 'javascript'). Model tồn tại nên đổi tại chỗ,
                        // giữ nguyên nội dung/caret/scroll.
                        var langId = (msg.payload && msg.payload.language) || 'xml';
                        var target = langId === 'xml' ? 'erp-xml' : langId;
                        var lm = editor.getModel();
                        if (lm) monaco.editor.setModelLanguage(lm, target);
                        respond(msg.id, true);
                        break;
                    }
                    case 'openFind':
                        editor.getAction('actions.find').run();
                        respond(msg.id, true);
                        break;
                    case 'openReplace':
                        editor.getAction('editor.action.startFindReplaceAction').run();
                        respond(msg.id, true);
                        break;
                    case 'showEntityHover': {
                        // Chỉ hiện nếu response khớp offset hover mới nhất (bỏ reply trễ của
                        // entity vừa rời → tránh hiện sai value).
                        var hp = msg.payload || {};
                        if (hp.offset === lastHoverOffset)
                            showEntityHover(hp.name, hp.value, hp.isError, hp.kind);
                        respond(msg.id, true);
                        break;
                    }
                    case 'hideEntityHover': {
                        var hh = msg.payload || {};
                        if (hh.offset === undefined || hh.offset === lastHoverOffset)
                            hideEntityHover();
                        respond(msg.id, true);
                        break;
                    }
                    case 'runAction': {
                        // Host chặn phím điều hướng ở WPF để AvalonDock không nuốt
                        // (Home/End/PageUp/PageDown ±Shift) rồi gọi lệnh tương ứng ở đây.
                        // Home/End làm tường minh bằng editor API (không phụ thuộc id lệnh nội
                        // bộ Monaco); PageUp/PageDown dùng editor.trigger (đã chạy đúng).
                        var actionId = msg.payload && msg.payload.actionId;
                        try { console.log('[host] runAction', actionId); } catch (ignore) {}
                        if (actionId) {
                            editor.focus();
                            if (!runCursorLineAction(editor, actionId)
                                && !runCursorDocumentAction(editor, actionId))
                                editor.trigger('host', actionId, null);
                        }
                        respond(msg.id, true);
                        break;
                    }
                    default:
                        respond(msg.id, null, 'unknown command: ' + msg.command);
                }
            } catch (err) {
                respond(msg.id, null, String(err));
            }
        });

        post({ event: 'ready', payload: { language: language } });
    });
})();
