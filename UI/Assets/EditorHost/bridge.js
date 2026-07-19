// DevWorkFlow Editor Host — Monaco boot + Message Bridge (ADR-0002 / ADR-0005).
// Không chứa business logic ERP: chỉ Render + relay Command/Event qua WebView2 postMessage.
(function () {
    'use strict';

    var params = new URLSearchParams(window.location.search);
    var language = params.get('lang') || 'xml';

    require.config({ paths: { vs: '../Monaco/vs' } });

    require(['vs/editor/editor.main'], function () {
        // XML dùng tokenizer FBO riêng (CDATA text thuần, entity token, nhúng SQL/JS)
        // — xem erp-xml-language.js. SQL dùng tokenizer built-in của Monaco.
        if (window.registerErpXmlLanguage)
            window.registerErpXmlLanguage(monaco);
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
                rule('entity.name', tokens.entityReference),
                rule('comment', tokens.comment),
                rule('string.cdata', tokens.cdata),
                rule('delimiter.cdata', tokens.delimiter),
                rule('delimiter', tokens.delimiter),
                rule('metatag', tokens.metatag),
                rule('metatag.content', tokens.metatag)
            ].filter(function (r) { return r !== null; });

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
        }

        var suppressChangeEvent = false;
        var lastInsights = [];
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

        // ── Insight Layer — Layer 3: semantic rendering bằng API native Monaco ──
        // (ADR-0004: Insight như syntax highlighting, KHÔNG phải widget/control.)
        //   1. inlineClassName 'dwf-entity-ref' làm mờ reference (italic ~45% opacity)
        //   2. injected text (decoration options.after) hiển thị giá trị resolve ngay
        //      sau reference — cùng font/baseline/line-height, do chính text renderer
        //      của Monaco vẽ; Monaco tự virtualize theo viewport và reuse decoration
        //      khi update qua createDecorationsCollection.
        //   3. Entity nhiều cấp: view zone text thuần (không control) hiển thị phân
        //      cấp con dưới dòng chứa reference — không flatten, không giấu cấp cha.
        // Text buffer (Layer 1) không bao giờ bị sửa bởi lớp này.
        var insightDecorations = editor.createDecorationsCollection([]);
        var insightZoneIds = [];

        // Giữ NGUYÊN định dạng nội dung entity (đa dòng, thụt lề) — không cắt, không
        // ép về 1 dòng. Giá trị 1 dòng render inline (injected text); giá trị nhiều
        // dòng render đầy đủ trong view zone, mỗi dòng đúng như file gốc.
        function valueLines(text) {
            return (text || '').split(/\r?\n/);
        }

        function isMultiline(text) {
            return /\r?\n/.test(text || '');
        }

        function makeZoneLine(padding_px, class_name, text) {
            var line = document.createElement('div');
            line.className = 'dwf-zone-line ' + class_name;
            line.style.paddingLeft = padding_px + 'px';
            line.textContent = text.length ? text : ' ';
            return line;
        }

        // Zone giá trị đa dòng của MỘT entity: toàn bộ nội dung, định dạng gốc.
        function buildValueZoneDom(item) {
            var container = document.createElement('div');
            container.className = 'dwf-entity-zone';
            valueLines(item.resolvedValue).forEach(function (line_text) {
                container.appendChild(makeZoneLine(0, 'dwf-entity-value', line_text));
            });
            return container;
        }

        function countValueZoneLines(item) {
            return valueLines(item.resolvedValue).length;
        }

        // Zone phân cấp entity nhiều cấp: mỗi con một dòng "&Ref;  giá_trị"; giá trị
        // đa dòng của con hiển thị đủ các dòng tiếp theo (thụt lề sâu hơn 1 cấp).
        function countZoneLines(item) {
            var n = 0;
            (item.children || []).forEach(function (child) {
                n += valueLines(child.resolvedValue).length;
                n += countZoneLines(child);
            });
            return n;
        }

        // DOM của view zone chỉ gồm text span thuần (như chính Monaco render dòng code),
        // không input/button/border — giữ cảm giác "vẫn là source code".
        function buildZoneDom(item) {
            var container = document.createElement('div');
            container.className = 'dwf-entity-zone';
            (function addLines(children, depth) {
                children.forEach(function (child) {
                    var lines = valueLines(child.resolvedValue);

                    var first = document.createElement('div');
                    first.className = 'dwf-zone-line';
                    first.style.paddingLeft = (depth * 24) + 'px';
                    var ref = document.createElement('span');
                    ref.className = 'dwf-entity-ref';
                    ref.textContent = child.referenceText || '';
                    var value = document.createElement('span');
                    value.className = 'dwf-entity-value';
                    value.textContent = '  ' + (lines[0] || '');
                    first.appendChild(ref);
                    first.appendChild(value);
                    container.appendChild(first);

                    for (var i = 1; i < lines.length; i++) {
                        container.appendChild(
                            makeZoneLine((depth + 1) * 24, 'dwf-entity-value', lines[i]));
                    }

                    addLines(child.children || [], depth + 1);
                });
            })(item.children || [], 1);
            return container;
        }

        // items[].range là DevWorkFlow.Domain.Language.SourceLocation serialize camelCase
        // trực tiếp (không có DTO trung gian): { path, span: { startOffset, length, endOffset,
        // isEmpty }, line, column }. Đổi shape ở đây thì phải đổi khớp bên MonacoEditorHost.cs.
        function renderInsights(items, show) {
            lastInsights = items || [];
            lastShowInsights = !!show;

            var model = editor.getModel();

            editor.changeViewZones(function (accessor) {
                insightZoneIds.forEach(function (id) { accessor.removeZone(id); });
                insightZoneIds = [];
            });

            if (!lastShowInsights || !model) {
                insightDecorations.set([]);
                return;
            }

            var decorations = [];
            var zone_items = [];

            lastInsights.forEach(function (item) {
                // InsightType.Entity == 0 (xem DevWorkFlow.Domain.Language.InsightType)
                var span = item.range && item.range.span;
                if (item.type !== 0 || !span || span.length <= 0) return;

                var start = model.getPositionAt(span.startOffset);
                var end = model.getPositionAt(span.startOffset + span.length);
                var range = new monaco.Range(
                    start.lineNumber, start.column, end.lineNumber, end.column);
                var hasChildren = (item.children || []).length > 0;

                var options = {
                    inlineClassName: 'dwf-entity-ref',
                    stickiness: monaco.editor.TrackedRangeStickiness.NeverGrowsWhenTypingAtEdges
                };
                if (!hasChildren && item.resolvedValue) {
                    if (isMultiline(item.resolvedValue)) {
                        // Nội dung đa dòng (file SYSTEM, script...) → zone đầy đủ,
                        // giữ nguyên định dạng gốc — không ép về 1 dòng.
                        zone_items.push({ kind: 'value', item: item, afterLine: end.lineNumber });
                    } else {
                        options.after = {
                            content: ' ' + item.resolvedValue,
                            inlineClassName: 'dwf-entity-value'
                        };
                    }
                }
                decorations.push({ range: range, options: options });

                if (hasChildren)
                    zone_items.push({ kind: 'tree', item: item, afterLine: end.lineNumber });
            });

            insightDecorations.set(decorations);

            editor.changeViewZones(function (accessor) {
                zone_items.forEach(function (zone) {
                    var lines = zone.kind === 'value'
                        ? countValueZoneLines(zone.item)
                        : countZoneLines(zone.item);
                    if (lines === 0) return;
                    insightZoneIds.push(accessor.addZone({
                        afterLineNumber: zone.afterLine,
                        heightInLines: lines,
                        domNode: zone.kind === 'value'
                            ? buildValueZoneDom(zone.item)
                            : buildZoneDom(zone.item)
                    }));
                });
            });
        }

        // Double-click vào reference → chọn đúng đoạn giá trị thật trong khai báo
        // <!ENTITY X "..."> (value_start/value_length do EntityInsightProvider cung cấp,
        // chỉ có với entity khai báo inline trong chính document). Người dùng sửa bằng
        // text editing thật: Undo/Redo/Selection nguyên bản Monaco, &X; trong body
        // không đổi, reparse cập nhật lại chú giải. Không có metadata (entity từ file
        // include/external) → double-click giữ hành vi chọn từ mặc định của Monaco.
        editor.onMouseDown(function (e) {
            if (!e.event || e.event.detail !== 2) return;
            if (!e.target || !e.target.position || !lastShowInsights) return;
            var model = editor.getModel();
            if (!model) return;

            var offset = model.getOffsetAt(e.target.position);
            for (var i = 0; i < lastInsights.length; i++) {
                var item = lastInsights[i];
                var span = item.range && item.range.span;
                if (item.type !== 0 || !span || span.length <= 0) continue;
                if (offset < span.startOffset || offset > span.startOffset + span.length) continue;

                var meta = item.metadata || {};
                var value_start = parseInt(meta.value_start, 10);
                var value_length = parseInt(meta.value_length, 10);
                if (!isNaN(value_start) && !isNaN(value_length) && value_length >= 0) {
                    var s = model.getPositionAt(value_start);
                    var en = model.getPositionAt(value_start + value_length);
                    var target = new monaco.Range(s.lineNumber, s.column, en.lineNumber, en.column);
                    editor.setSelection(target);
                    editor.revealRangeInCenterIfOutsideViewport(target);
                    e.event.preventDefault();
                    return;
                }

                // Entity SYSTEM: yêu cầu host mở file entity ra tab mới (editor không
                // tự mở file — chỉ báo qua Message Bridge).
                if (meta.open_path) {
                    post({ event: 'openFileRequested', payload: { path: meta.open_path } });
                    e.event.preventDefault();
                }
                return;
            }
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
                    case 'setInsights':
                        renderInsights(msg.payload && msg.payload.items, msg.payload && msg.payload.show);
                        respond(msg.id, true);
                        break;
                    case 'setShowInsights':
                        renderInsights(lastInsights, msg.payload && msg.payload.show);
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
                    case 'openFind':
                        editor.getAction('actions.find').run();
                        respond(msg.id, true);
                        break;
                    case 'openReplace':
                        editor.getAction('editor.action.startFindReplaceAction').run();
                        respond(msg.id, true);
                        break;
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
