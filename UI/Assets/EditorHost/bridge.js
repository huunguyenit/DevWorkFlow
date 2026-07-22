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
            renderWhitespace: 'none'
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
                if (!segment || segment.isError) return;
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

            // Source mode (XML thô): chỉ gửi offset nguồn; host tra LS ResolveEntityAtOffset.
            post({ event: 'entityOffsetActivated', payload: { offset: offset } });
        });

        // ── Entity hover virtual view (Content Widget) — CHỈ Source mode ────
        // Hiện GIÁ TRỊ entity khi hover &X;; scroll nếu dài; nút Copy. Nhận biết "đang trên
        // widget" bằng hit-test CONTENT_WIDGET của Monaco (không dùng mouseenter/leave DOM —
        // dễ kẹt pin khi widget bị gỡ lúc con trỏ còn trên nó → tính năng chết). Chống race:
        // mỗi response mang offset; JS bỏ qua response có offset khác offset hover mới nhất
        // (tránh hiện value của entity vừa rời khi reply về trễ).
        var HOVER_WIDGET_ID = 'dwf.entity.hover';
        var hoverDom = null, hoverNameEl = null, hoverBodyEl = null;
        var hoverVisible = false, hoverPosition = null, lastHoverOffset = -1;
        var hoverMoveTimer = null, hoverHideTimer = null;

        function ensureHoverStyle() {
            if (document.getElementById('dwf-entity-hover-style')) return;
            var style = document.createElement('style');
            style.id = 'dwf-entity-hover-style';
            style.textContent =
                '.dwf-entity-hover{min-width:220px;max-width:480px;background:#fff;border:1px solid #c8c8c8;' +
                'border-radius:4px;box-shadow:0 2px 10px rgba(0,0,0,.18);font-family:Consolas,"Courier New",monospace;' +
                'font-size:12px;color:#1e1e1e;overflow:hidden;}' +
                '.dwf-entity-hover .hdr{display:flex;align-items:center;justify-content:space-between;gap:8px;' +
                'padding:4px 8px;background:#f3f3f3;border-bottom:1px solid #e0e0e0;}' +
                '.dwf-entity-hover .name{font-weight:600;color:#0b5cad;white-space:nowrap;}' +
                '.dwf-entity-hover.err .name{color:#c62828;}' +
                '.dwf-entity-hover .copy{font:inherit;font-size:11px;border:1px solid #c8c8c8;background:#fff;' +
                'border-radius:3px;padding:1px 8px;cursor:pointer;}' +
                '.dwf-entity-hover .copy:hover{background:#eaf2fb;border-color:#0b5cad;}' +
                '.dwf-entity-hover .body{margin:0;padding:8px;max-height:280px;overflow:auto;white-space:pre-wrap;' +
                'word-break:break-word;}';
            document.head.appendChild(style);
        }

        function ensureHoverWidget() {
            if (hoverDom) return;
            ensureHoverStyle();
            hoverDom = document.createElement('div');
            hoverDom.className = 'dwf-entity-hover';
            var hdr = document.createElement('div');
            hdr.className = 'hdr';
            hoverNameEl = document.createElement('span');
            hoverNameEl.className = 'name';
            var copyBtn = document.createElement('button');
            copyBtn.type = 'button';
            copyBtn.className = 'copy';
            copyBtn.textContent = 'Copy';
            copyBtn.addEventListener('click', function () {
                var text = hoverBodyEl ? (hoverBodyEl.textContent || '') : '';
                if (navigator.clipboard && navigator.clipboard.writeText)
                    navigator.clipboard.writeText(text);
            });
            hdr.appendChild(hoverNameEl);
            hdr.appendChild(copyBtn);
            hoverBodyEl = document.createElement('pre');
            hoverBodyEl.className = 'body';
            // Cuộn nội bộ widget, không để editor cuộn theo.
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
                        position: hoverPosition,
                        preference: [
                            monaco.editor.ContentWidgetPositionPreference.BELOW,
                            monaco.editor.ContentWidgetPositionPreference.ABOVE
                        ]
                    }
                    : null;
            }
        };

        function showEntityHover(name, value, isError) {
            ensureHoverWidget();
            hoverNameEl.textContent = name || '';
            hoverBodyEl.textContent = value || '';
            hoverDom.classList.toggle('err', !!isError);
            if (!hoverVisible) { editor.addContentWidget(hoverWidget); hoverVisible = true; }
            else { editor.layoutContentWidget(hoverWidget); }
        }

        function hideEntityHover() {
            if (!hoverVisible) return;
            editor.removeContentWidget(hoverWidget);
            hoverVisible = false;
        }

        function scheduleHideHover() {
            if (hoverHideTimer) clearTimeout(hoverHideTimer);
            hoverHideTimer = setTimeout(hideEntityHover, 80);
        }

        function isOnHoverWidget(target) {
            return target
                && target.type === monaco.editor.MouseTargetType.CONTENT_WIDGET
                && target.detail === HOVER_WIDGET_ID;
        }

        editor.onMouseMove(function (e) {
            // Hover chỉ ở Source mode. Insight: không hover, ẩn nếu đang hiện.
            if (lastShowInsights) { hideEntityHover(); return; }

            // Con trỏ đang trên chính widget → GIỮ (rule dismiss: chỉ ẩn khi rời widget).
            if (isOnHoverWidget(e.target)) {
                if (hoverHideTimer) { clearTimeout(hoverHideTimer); hoverHideTimer = null; }
                return;
            }

            if (!e.target || !e.target.position) { scheduleHideHover(); return; }
            var model = editor.getModel();
            if (!model) return;
            var position = e.target.position;
            var offset = model.getOffsetAt(position);
            if (hoverMoveTimer) clearTimeout(hoverMoveTimer);
            hoverMoveTimer = setTimeout(function () {
                hoverPosition = position;
                lastHoverOffset = offset;
                post({ event: 'entityHoverRequested', payload: { offset: offset, insight: false } });
            }, 120);
        });

        editor.onMouseLeave(function () {
            if (hoverMoveTimer) { clearTimeout(hoverMoveTimer); hoverMoveTimer = null; }
            scheduleHideHover();
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
                            showEntityHover(hp.name, hp.value, hp.isError);
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
                            if (!runCursorLineAction(editor, actionId))
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
